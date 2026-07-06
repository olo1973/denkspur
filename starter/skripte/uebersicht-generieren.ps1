# Generiert uebersicht.md deterministisch aus den Artefakt-Koepfen
# (siehe methode/03-lebenslauf.md, Abschnitt 3.4). Aufruf:
#   ./skripte/uebersicht-generieren.ps1            # im Projekt-Root
#   ./skripte/uebersicht-generieren.ps1 -Pfad <dir>
param([string]$Pfad = ".")

function Get-Tabelle([string]$Ordner) {
    $zeilen = @()
    $dateien = Get-ChildItem -Path (Join-Path $Pfad $Ordner) -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match '^\d{4}-.*\.md$' } | Sort-Object Name
    foreach ($d in $dateien) {
        $status = ""; $datum = ""; $tags = ""; $titel = ""
        foreach ($z in (Get-Content $d.FullName)) {
            if ($z -match '^status:\s*(.+)$' -and -not $status) { $status = $Matches[1].Trim() }
            elseif ($z -match '^datum:\s*(.+)$' -and -not $datum) { $datum = $Matches[1].Trim() }
            elseif ($z -match '^tags:\s*\[(.*)\]' -and -not $tags) { $tags = $Matches[1].Trim() }
            elseif ($z -match '^#\s+(.+)$' -and -not $titel) {
                $titel = $Matches[1] -replace '^(?:(?:Idee|Plan)\s+)?\d{4}:\s*', ''
            }
        }
        $nr = $d.Name.Substring(0, 4)
        $zeilen += "| [$nr]($Ordner/$($d.Name)) | $titel | $status | $datum | $tags |"
    }
    if ($zeilen.Count -eq 0) { $zeilen = @("| — | (noch keine) | | | |") }
    $zeilen -join "`n"
}

$stand = Get-Date -Format "yyyy-MM-dd"
$kopf = "| Nr. | Titel | Status | Datum | Tags |`n|---|---|---|---|---|"

$inhalt = @"
# Übersicht

> Generierter Statusindex — wird komplett aus den Artefakt-Köpfen neu
> erzeugt, nie von Hand gepflegt. **Stand: $stand**

## Ideen

$kopf
$(Get-Tabelle "ideen")

## Entscheidungen

$kopf
$(Get-Tabelle "entscheidungen")

## Pläne

$kopf
$(Get-Tabelle "plaene")
"@

Set-Content -Encoding utf8 -Path (Join-Path $Pfad "uebersicht.md") -Value $inhalt
Write-Host "uebersicht.md regeneriert (Stand: $stand)"
