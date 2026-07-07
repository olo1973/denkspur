---
typ: referenz
status: entwurf
datum: 2026-07-06
---

# Kapitel 2 — Struktur: der Raum

> Wo Dinge liegen, wie sie heißen und wie eine einzelne Datei von innen
> aussieht — damit Pfade vorhersehbar sind, für Mensch, Agent und
> Versionsverwaltung gleichermaßen.

## 2.1 Das Projekt-Skelett

Konvention: Ordner mit führendem `_` sind **System-/Hilfsordner** (sortieren
sich nach oben, kein inhaltlicher Arbeitsbereich). Inhaltliche Arbeitsbereiche
tragen ein **Zahlenpräfix** für eine feste Reihenfolge. Die drei
Lebenslauf-Ordner (`ideen/`, `entscheidungen/`, `plaene/`, Kapitel 3) stehen
ohne Präfix — sie sind weder System noch Inhalt, sondern die Spur.

```
projektname/
├── README.md                 ← Eingangsseite: Zweck, Aufbau, Einstieg (Zusage 3)
├── AGENTS.md                 ← Instruktionen für den KI-Agenten (2.4)
├── CLAUDE.md                 ← nur ein Zeiger: @AGENTS.md (2.4)
├── uebersicht.md             ← generierter Statusindex über die Spur (Kapitel 3)
├── logbuch.md                ← formloses Arbeitstagebuch, optional (Kapitel 3)
├── ideen/                    ← Lebenslauf: festgehaltene Ideen
├── entscheidungen/           ← Lebenslauf: Vorschläge und Entscheidungen (ADRs)
├── plaene/                   ← Lebenslauf: Pläne und Umsetzung
├── _meta/                    ← Steuerung: Kontext, Glossar
│   ├── kontext.md            ← Hintergrund, Ziel, Rahmenbedingungen
│   └── glossar.md            ← gemeinsame Begriffe (v. a. im Team)
├── _quellen/                 ← Rohmaterial, UNVERÄNDERT (Zusage 5: Eingang)
├── _eingang/                 ← Posteingang für noch Unsortiertes
├── 01-<bereich>/             ← erster inhaltlicher Arbeitsbereich (Zusage 5: Wissen)
│   ├── README.md             ← was dieser Bereich enthält
│   └── 01-<thema>.md
├── 02-<bereich>/             ← weiterer Arbeitsbereich
├── ergebnisse/               ← erzeugte Artefakte (Zusage 5: Ergebnis)
│   └── abnahmen/             ← versionierte Abnahme-Belege, z. B. Design-Entwürfe (4.2)
├── skripte/                  ← Hilfsskripte, z. B. Übersicht generieren (3.4)
├── _templates/               ← Vorlagen für Idee, Entscheidung, Plan, Notiz
└── _archiv/                  ← stillgelegt, aber aufbewahrt (nichts wird gelöscht)
```

Nicht jedes Projekt braucht alle Ordner. Ein kleines Solo-Projekt kommt mit
`README.md`, `AGENTS.md`, den drei Lebenslauf-Ordnern und ein, zwei
nummerierten Bereichen aus. Die Struktur ist ein Baukasten, kein
Pflichtprogramm; die **Bedeutung** der Ordner bleibt überall gleich.

Bei Code-Projekten gibt das jeweilige Framework das Innenleben vor (`src/`,
`public/`, …) und wird hier bewusst **nicht** geregelt: Das Framework
bestimmt das Innenleben, die Methode die Ränder. Verbindliche
Andockung: Alle denkspur-Ordner und -Dateien liegen gebündelt unter
`docs/` (`docs/ideen/`, `docs/entscheidungen/`, `docs/plaene/`,
`docs/uebersicht.md`, …); im Repo-Root bleiben nur `README.md`, `AGENTS.md`
und die Werkzeug-Zeiger. Die Übersicht-Skripte nehmen dafür den Pfad als
Parameter (`./skripte/uebersicht-generieren.ps1 -Pfad docs`).

## 2.2 Namens- und Ablagekonventionen

Diese Regeln sind langweilig und genau deshalb wertvoll:

- **Keine Leerzeichen, keine Umlaute, kein ß** in Datei- und Ordnernamen
  (`uebersicht`, nicht `Übersicht`). Schützt vor Problemen mit Git, Skripten
  und werkzeugübergreifenden Links. Im Datei-*Inhalt* gilt normales Deutsch.
- **Kleinschreibung, Bindestrich-getrennt** (`markt-analyse.md`) — der
  Unterstrich bleibt den System-Ordnern vorbehalten.
- **Reihenfolge per Zahlenpräfix**: `00-`, `01-`, `02-` … erzwingt sinnvolle
  Sortierung statt Alphabet. Lebenslauf-Artefakte nummerieren vierstellig
  (`0001-`, Kapitel 3).
- **Datierte Dokumente**: `JJJJ-MM-TT_beschreibung.ext`. Datum = Dokumentdatum,
  nicht Speicherdatum; sortiert chronologisch von selbst.
- **Ein Thema, eine Datei.** Lieber mehrere kleine, klar benannte Dateien als
  ein Sammeldokument.

## 2.3 Das Innenleben einer Datei

Drei Dinge machen eine Datei für Mensch und Agent gut nutzbar:

**1. Frontmatter (YAML-Kopf)** — Metadaten für die Maschine. Es gilt **ein
Feldsatz für alle Dokumente** (entschieden in
[0005](../entscheidungen/0005-einheitliches-frontmatter.md)):

```yaml
---
typ: analyse            # idee | entscheidung | plan | notiz | analyse | uebersicht | …
status: entwurf         # Spur: Lebenslauf-Status; Inhalte: entwurf | in-pruefung | final
owner: <kuerzel>        # wer pflegt das (im Team Pflicht, solo optional)
datum: 2026-07-06       # maßgebliches Datum: Entstehung (Spur) bzw. letzter Stand
tags: [analyse]         # optional
---
```

Der Titel steht **nicht** im Frontmatter — er wohnt allein in der
H1-Überschrift (eine Wahrheit, ein Ort; dort lesen ihn Mensch, GitHub und
die Übersicht-Skripte).

**2. Verlinkung** — Querverweise als **echte Links**, nicht als toter
Dateiname-Text: relative Markdown-Links (`[Text](../pfad/datei.md)`) in
Git-Kontexten, `[[wikilinks]]` in Obsidian-Vaults. Eine Sektion
„Verknüpfungen" am Dateiende hält die wichtigsten Nachbarn beieinander.
Beziehungs-Links der Lebenslauf-Artefakte folgen dem festen Vokabular aus
Kapitel 3.

**3. Eine Eingangs-Zusammenfassung** — die ersten Zeilen sagen in Klartext,
wozu die Datei dient. Das ist der Kontext, den ein Agent zuerst liest,
ebenso der Mensch, der in sechs Monaten zurückkommt.

## 2.4 Agenten-Instruktionen: eine Wahrheit, viele Andockpunkte

Jedes Agenten-Werkzeug liest eine Steuerdatei. Der **Inhalt** ist überall
derselbe Gedanke; nur der Andockpunkt unterscheidet sich:

| Werkzeug | Andockpunkt |
|---|---|
| werkzeugneutral | `AGENTS.md` (etablierter Standard — Zusage 9) |
| Claude Code | `CLAUDE.md` |
| GitHub Copilot | `.github/copilot-instructions.md` |
| Cursor | `.cursor/rules/…` |

**Regel:** Die eigentlichen Instruktionen stehen in **`AGENTS.md`**; die
werkzeugspezifischen Dateien enthalten nur einen Zeiger. So gibt es eine
Wahrheit (Zusage 2), egal welches Werkzeug morgen im Einsatz ist. Dabei ist
`@AGENTS.md` **Claude-Code-Import-Syntax**; Copilot und Cursor können nicht
importieren — dort ist der Zeiger ein Prosa-Verweis („Lies und befolge
`AGENTS.md` im Projekt-Root"). Der Starter liefert alle drei Zeiger-Dateien
mit; nicht benötigte werden gelöscht.

Bewährter Inhalt, in dieser Reihenfolge:

1. **Harte Regeln zuerst** — die nicht verhandelbaren Grenzen des Projekts.
2. **Zweck** in einem Satz, plus Verweis auf das Grundlagendokument.
3. **Struktur-Soll** — die projekteigene Abbildung des Skeletts.
4. **Befehle** — was der Agent sonst raten müsste (Build, Test, Run).
5. **Verweistabelle auf externe Quellen** (2.5).
6. Verweis auf die Methoden-Kurzreferenz (denkspur-`AGENTS.md`).

Die Datei bleibt kurz und konkret: Sie ist Arbeitsanweisung, kein
Prosa-Dokument. Erkenntnisse und verworfene Wege gehören nicht hierher, sondern in die Spur
(Kapitel 3): eine abgelehnte Entscheidung ist ein ADR mit Status `abgelehnt`,
kein Prosa-Absatz.

## 2.5 Datenklassen: was nie ins Repo darf

Vor dem ersten Commit wird die **Datenklasse** geklärt — und bei jedem
`git add` erneut gefragt: *Ist das eine Ableitung (optimiert, synthetisch,
generiert) oder ein Original bzw. ein echter Datensatz?*

- **Sensible Inhalte (Gesundheit, Familie, Finanzen, echte Personendaten)
  gehören nicht in ein Git-Repo — auch nicht in ein privates.** Die
  Git-Historie vergisst nichts: Was einmal committet wurde, ist auch nach dem
  Löschen rekonstruierbar, und die Sichtbarkeitseinstellung „privat" schützt
  davor nicht. Bei Gesundheitsdaten kommt DSGVO Art. 9 hinzu.
- **Ins Repo kommt nur das Abgeleitete, das Original bleibt draußen:**
  web-optimierte Kopien statt Asset-Originalen, synthetische Demo-Daten statt
  Echtdaten. Das Original bleibt außerhalb; im Repo liegt nur die
  Auslieferungsform.
- **Secrets nur in `.env` / `.env.local`** (gitignored), nie committen — auch
  nicht „kurz zum Testen". Eine committete **`.env.example`** dokumentiert,
  welche Variablen gebraucht werden, ohne Werte zu verraten.
- **Erzeugbares und Reproduzierbares ist gitignored**: lokale Daten, Caches,
  Build-Artefakte, Reports.

Hängt das Projekt von Ordnern **außerhalb des Repos** ab (Asset-Verzeichnis,
Quell-Wissensbasis), dokumentiert eine Tabelle in `AGENTS.md` jede
Abhängigkeit — die dritte Spalte ist der Kern:

```markdown
| Pfad | Inhalt | Repo-relevant? |
|---|---|---|
| <extern>/brandbook.md | Markenquelle | Lesen für Marken-Entscheidungen |
| <extern>/logo/ | Logo-Originale (SVG/PNG) | Quelle für abgeleitete Web-Kopien |
| <extern>/vertraege/ | Originaldokumente | Nicht ins Repo, niemals |
```

## 2.6 Werkzeuge auf diese Struktur abgebildet

Die Struktur ist der Kern; Werkzeuge docken daran an:

- **Git**: versioniert dieselben Markdown-Dateien; die Namensdisziplin aus 2.2
  zahlt sich doppelt aus (saubere Diffs, keine Pfad-Probleme).
- **Obsidian** (Lesesaal für den Menschen): Projektordner als Vault öffnen;
  der Wert liegt in Backlinks und Local Graph, gespeist aus Frontmatter und
  echten Links.
- **KI-Agenten** (Claude Code, Copilot, Cursor, …): konsumieren Frontmatter,
  README und `AGENTS.md`. Je vorhersehbarer die Ablage, desto weniger muss
  man prompten.

## Verknüpfungen

- [Kapitel 1 — Vertrag](01-vertrag.md)
- [Kapitel 3 — Lebenslauf (die Zeit)](03-lebenslauf.md)
- [Starter-Skelett zum Kopieren](../starter/)
