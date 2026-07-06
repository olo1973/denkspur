# AGENTS.md — Kurzreferenz für KI-Agenten

Dieses Repo enthält die Methode **denkspur** und wendet sie auf sich selbst
an. Für Agenten, die hier (oder in einem denkspur-Projekt) arbeiten, gilt:

## Harte Regeln

1. **Freigabe-Modus dieses Repos: `gespraech`.** Vorschlagen jederzeit;
   Artefakte anlegen, Status kippen oder umsetzen nur nach ausdrücklicher
   Freigabe — vor dem Handeln die Reichweite benennen (ein bloßes „ja" ist
   mehrdeutig). Alternativer Modus `pr-gate` (Freigabe = PR-Merge): siehe
   `methode/04`, 4.1. Freigabefrei in beiden Modi: Logbuch-Einträge,
   `_zwischenstand/`, Übersicht regenerieren.
2. **Nie wegeditieren:** Committete Entscheidungen werden nicht verändert —
   neue ADRs mit `Ergänzt:` / `Ersetzt:` einhängen. Nur unveröffentlichte
   Vorschläge dürfen in place reifen.
3. **Änderungen an der Methode selbst** laufen durch den eigenen Lebenslauf:
   Idee → ADR unter `entscheidungen/` → Plan. Keine stillen Methoden-Edits.
4. **Übersicht per Skript:** `uebersicht.md` nach jeder Spur-Änderung mit
   `starter/skripte/uebersicht-generieren.ps1 -Pfad .` (bzw. `.sh .`)
   regenerieren — nie von Hand schreiben oder flicken.
5. **Datenklassen:** Keine sensiblen oder persönlichen Daten in dieses Repo —
   es ist öffentlich. Vor jedem Commit prüfen: Ableitung ja, Original nein.
6. **Kanon:** `methode/` ist die maßgebliche Fassung. `leitfaden.md`, diese
   Datei und `starter/AGENTS.md` sind abgeleitete Renderings — bei
   Widerspruch gilt `methode/`, behoben wird im Rendering.

## Der Lebenslauf (Kurzform)

| Station | Ort | Status |
|---|---|---|
| Idee | `ideen/NNNN-*.md` | `keim` → `befördert` / `verworfen` |
| Vorschlag → Entscheidung | `entscheidungen/NNNN-*.md` | `vorgeschlagen` → `angenommen` / `abgelehnt` |
| Plan → Umsetzung | `plaene/NNNN-*.md` | `entwurf` → `aktiv` → `fertig` / `abgebrochen` |

Nummern: vierstellig, je Familie unabhängig, drücken nur Reihenfolge aus.
Metadaten im YAML-Frontmatter (`typ`, `status`, `datum`, optional `tags`);
Beziehungs-Links als klickbare Zeilen unter der H1.

## Querverweis-Vokabular (exakte Feldnamen)

`Eltern-Idee:` (Idee→Idee, vorwärts) · `Befördert zu:` / `Hervorgegangen aus:`
(Idee↔ADR, wechselseitig) · `Ergänzt:` / `Ergänzt durch:` (ADR↔ADR,
wechselseitig) · `Ersetzt:` / `Ersetzt durch:` (ADR↔ADR, wechselseitig) ·
`Setzt um:` (Plan→ADR, vorwärts).

## Konventionen

- Dateinamen: kleingeschrieben, bindestrich-getrennt, keine Umlaute/ß/Leerzeichen.
- Querverweise als echte relative Markdown-Links, nie als toter Text.
- Sprache: Deutsch, sachlich-direkt, keine Emojis.
- UI-Vorhaben: Plan enthält ein Design-Gate (visuelle Abnahme vor Code) —
  siehe `methode/04-zusammenarbeit.md`, Abschnitt 4.2.

## Volle Referenz

`methode/01-vertrag.md` (Zusagen) · `methode/02-struktur.md` (Raum) ·
`methode/03-lebenslauf.md` (Zeit) · `methode/04-zusammenarbeit.md`
(Mensch+Agent). Didaktischer Einstieg: `leitfaden.md`.
