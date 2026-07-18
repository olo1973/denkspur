# Generiert uebersicht.md deterministisch aus den Artefakt-Koepfen
# (siehe methode/03-lebenslauf.md, Abschnitt 3.4) oder prueft die Spur auf
# Konformitaet (Entscheidung 0012). Aufruf:
#   ./skripte/uebersicht-generieren.ps1            # im Projekt-Root
#   ./skripte/uebersicht-generieren.ps1 -Pfad <dir>
#   ./skripte/uebersicht-generieren.ps1 -Pruefen   # schreibt nichts, meldet Befunde
param([string]$Pfad = ".", [switch]$Pruefen)

# Familien-Definition: Ordner, Ueberschrift der Uebersicht, erlaubte Statuswerte.
$Familien = @(
    @{ Ordner = "ideen";          Ueberschrift = "Ideen";         Status = @("keim", "befördert", "verworfen") },
    @{ Ordner = "entscheidungen"; Ueberschrift = "Entscheidungen"; Status = @("vorgeschlagen", "angenommen", "abgelehnt") },
    @{ Ordner = "plaene";         Ueberschrift = "Pläne";          Status = @("entwurf", "aktiv", "fertig", "abgebrochen") }
)

# Einziger Parser fuer beide Modi (Entscheidung 0012): liest Frontmatter,
# Titel, Abschnitts-Ueberschriften und relative Links eines Artefakts.
function Get-Artefakte([string]$Ordner) {
    $artefakte = @()
    $dateien = Get-ChildItem -Path (Join-Path $Pfad $Ordner) -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match '^\d{4}-.*\.md$' } | Sort-Object Name
    foreach ($d in $dateien) {
        $a = [ordered]@{
            Name = $d.Name; Datei = $d.FullName; Ordner = $Ordner
            Nr = $d.Name.Substring(0, 4)
            Status = ""; Datum = ""; Tags = ""; Titel = ""; TitelNr = ""
            Abschnitte = @(); Links = @()
        }
        foreach ($z in (Get-Content $d.FullName -Encoding UTF8)) {
            if ($z -match '^status:\s*(.+)$' -and -not $a.Status) { $a.Status = $Matches[1].Trim() }
            elseif ($z -match '^datum:\s*(.+)$' -and -not $a.Datum) { $a.Datum = $Matches[1].Trim() }
            elseif ($z -match '^tags:\s*\[(.*)\]' -and -not $a.Tags) { $a.Tags = $Matches[1].Trim() }
            elseif ($z -match '^#\s+(.+)$' -and -not $a.Titel) {
                $kopf = $Matches[1]
                if ($kopf -match '^(?:(?:Idee|Plan)\s+)?(\d{4}):\s*') { $a.TitelNr = $Matches[1] }
                $a.Titel = $kopf -replace '^(?:(?:Idee|Plan)\s+)?\d{4}:\s*', ''
            }
            elseif ($z -match '^##\s+(.+)$') { $a.Abschnitte += $Matches[1].Trim() }
            foreach ($m in [regex]::Matches($z, '\]\(([^)]+)\)')) { $a.Links += $m.Groups[1].Value }
        }
        $artefakte += [pscustomobject]$a
    }
    , $artefakte
}

function Get-Tabelle($Artefakte, [string]$Ordner) {
    $zeilen = @()
    foreach ($a in $Artefakte) {
        $zeilen += "| [$($a.Nr)]($Ordner/$($a.Name)) | $($a.Titel) | $($a.Status) | $($a.Datum) | $($a.Tags) |"
    }
    if ($zeilen.Count -eq 0) { $zeilen = @("| - | (noch keine) | | | |") }
    $zeilen -join "`n"
}

# --- Pruefmodus: schreibt nichts, sammelt Befunde -------------------------

function Get-Befunde {
    $befunde = @()
    $script:Geprueft = 0
    foreach ($fam in $Familien) {
        $laufNr = ""; $laufErste = ""
        foreach ($a in (Get-Artefakte $fam.Ordner)) {
            $script:Geprueft++
            $rel = "$($fam.Ordner)/$($a.Name)"

            # (1) Nummern-Dubletten innerhalb der Familie
            if ($a.Nr -eq $laufNr) {
                $befunde += "${rel}: doppelte Nummer $($a.Nr) (auch: $laufErste)"
            } else {
                $laufNr = $a.Nr; $laufErste = $rel
            }

            # (2) Tote relative Markdown-Links
            foreach ($l in $a.Links) {
                $ziel = ($l -split '#')[0]
                if (-not $ziel) { continue }
                if ($ziel -match '^[a-zA-Z][a-zA-Z0-9+.\-]*:') { continue }
                $abs = Join-Path (Split-Path $a.Datei -Parent) $ziel
                if (-not (Test-Path -LiteralPath $abs)) { $befunde += "${rel}: toter Link -> $l" }
            }

            # (3) Ueberschrift/Nummer stimmt zum Dateinamen
            if (-not $a.Titel) { $befunde += "${rel}: keine Ueberschrift (H1)" }
            elseif (-not $a.TitelNr) { $befunde += "${rel}: Ueberschrift ohne Nummer" }
            elseif ($a.TitelNr -ne $a.Nr) {
                $befunde += "${rel}: Ueberschrift-Nummer $($a.TitelNr) passt nicht zum Dateinamen $($a.Nr)"
            }

            # (4) Statuswert stammt aus der eigenen Familie
            if (-not $a.Status) {
                $befunde += "${rel}: Status fehlt"
            } elseif ($fam.Status -notcontains $a.Status) {
                $befunde += "${rel}: Status '$($a.Status)' gehoert nicht zur Familie $($fam.Ordner)"
            } elseif ($fam.Ordner -eq "entscheidungen") {
                # (5) Status <-> Abschnitts-Ueberschrift (abgelehnt bleibt ausgespart)
                $soll = ""
                if ($a.Status -eq "vorgeschlagen") { $soll = "Vorgeschlagene Entscheidung" }
                elseif ($a.Status -eq "angenommen") { $soll = "Entscheidung" }
                if ($soll -and ($a.Abschnitte -notcontains $soll)) {
                    $befunde += "${rel}: Status '$($a.Status)' verlangt Abschnitt '## $soll'"
                }
            }
        }
    }

    , $befunde
}

if ($Pruefen) {
    $befunde = Get-Befunde
    foreach ($b in $befunde) { Write-Output $b }
    if ($befunde.Count -eq 0) {
        Write-Output "Konformitaets-Check: keine Befunde ($script:Geprueft Artefakte geprueft)."
        exit 0
    }
    Write-Output "Konformitaets-Check: $($befunde.Count) Befund(e) in $script:Geprueft Artefakten."
    exit 1
}

# --- Erzeugungsmodus -----------------------------------------------------

$stand = Get-Date -Format "yyyy-MM-dd"
$kopf = "| Nr. | Titel | Status | Datum | Tags |`n|---|---|---|---|---|"
$abschnitte = @()
foreach ($fam in $Familien) {
    $abschnitte += "## $($fam.Ueberschrift)`n`n$kopf`n$(Get-Tabelle (Get-Artefakte $fam.Ordner) $fam.Ordner)"
}

$inhalt = @"
# Übersicht

> Generierter Statusindex — wird komplett aus den Artefakt-Köpfen neu
> erzeugt, nie von Hand gepflegt. **Stand: $stand**

$($abschnitte -join "`n`n")
"@

# LF-Schluss und UTF-8 ohne BOM erzwingen, damit 5.1, pwsh 7 und bash
# byte-gleiche Ausgabe erzeugen (Entscheidung 0010).
$inhalt = ($inhalt -replace "`r`n", "`n") + "`n"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText((Join-Path $Pfad "uebersicht.md"), $inhalt, $utf8NoBom)
Write-Host "uebersicht.md regeneriert (Stand: $stand)"
