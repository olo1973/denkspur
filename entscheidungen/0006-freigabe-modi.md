---
typ: entscheidung
status: angenommen
datum: 2026-07-06
tags: [zusammenarbeit, autonomie, review]
---

# 0006: Zwei Freigabe-Modi — Gespräch und PR-Gate

## Kontext

Review-Befund 9: Kapitel 4.1 verlangte vor jedem Artefakt-Anlegen eine
explizite Freigabe im Gespräch. Das ist im Dialog richtig, macht aber
autonome Agenten-Workflows — Feature-Branches, CI-getriebene Läufe,
PR-basierte Arbeit — gesprächig bis handlungsunfähig. Solche Workflows sind
der Normalfall geworden, nicht die Ausnahme. Eine Regel, die die häufigste
Arbeitsform nicht abbildet, wird gebrochen; und jede gebrochene Regel
beschädigt die Autorität der übrigen.

## Erwogene Optionen

1. **Zwei benannte Modi: `gespraech` und `pr-gate` (gewählt).**
2. Status quo (nur Gespräch); autonome Adopter weichen ab und dokumentieren
   das als eigenes ADR. Verworfen: normiert die häufigste Abweichung nicht
   und erzeugt in jedem autonomen Projekt denselben Boilerplate-Entscheid.
3. Dritter, vollautonomer Modus ohne jedes Gate (nur Logbuch-Pflicht).
   Verworfen: Ohne einen Punkt, an dem ein Mensch den Batch sieht und
   bestätigt, verliert das Gate seinen Charakter als Zusage — es bliebe
   nur eine Bitte.

## Entscheidung

Das Bestätigungs-Gate (4.1) kennt zwei Modi; **jedes Projekt deklariert
seinen Modus in `AGENTS.md`** (Default ohne Deklaration: `gespraech`).

- **`gespraech`** (Default): wie bisher — der Agent schlägt frei vor,
  handelt erst auf ausdrückliche Freigabe und benennt vorher deren
  Reichweite.
- **`pr-gate`**: Der Agent arbeitet frei auf einem Feature-Branch — legt
  Artefakte an, kippt Status, setzt um. **Die Freigabe ist der PR-Merge
  durch den Menschen**; die Reichweite des „Ja" ist der sichtbare Diff des
  Pull Requests, womit die Mehrdeutigkeits-Frage aus 4.1 präziser gelöst
  ist als im Gespräch. Direkt auf dem Hauptzweig handelt der Agent auch in
  diesem Modus nicht.

In beiden Modi freigabefrei bleiben Logbuch, `_zwischenstand/` und die
Übersicht-Regeneration. Die eiserne Regel aus 3.3 (nie wegeditieren) gilt
modusunabhängig — auch auf einem Branch werden gemergte Entscheidungen nur
per `Ergänzt:`/`Ersetzt:` fortgeschrieben.

## Konsequenzen

- Autonome Projekte arbeiten regelkonform statt regelbrechend; die
  Schutzfunktion wandert vom Zuruf zur Review-Disziplin (Branch + PR).
- `pr-gate` setzt Git mit PR-Fähigkeit voraus; reine Datei-Sync-Projekte
  (Solo-Wissensbasen ohne Git) bleiben faktisch im Gespräch-Modus.
- Kapitel 4.1, beide `AGENTS.md` und die Starter-Vorlage werden angepasst;
  der Starter deklariert den Default sichtbar.
