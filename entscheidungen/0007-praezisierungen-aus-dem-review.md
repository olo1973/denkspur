---
typ: entscheidung
status: angenommen
datum: 2026-07-06
tags: [methode, review]
---

# 0007: Präzisierungen aus dem Review (Befunde 8, 10, 11, 13)

Ergänzt durch: [Entscheidung 0009](0009-nachlese-decision-trail-v2-9-bis-v2-16.md)

## Kontext

Vier verbliebene Review-Befunde verlangen keine Richtungsentscheidung,
sondern Präzisierung — sie werden gebündelt entschieden, damit die Spur
lesbar bleibt. (Befund 12, defekte Mermaid-Labels, ist ein reiner
Darstellungs-Bugfix ohne Methodenänderung und läuft ohne ADR.)

- **Befund 8:** Fortlaufende Artefakt-Nummern kollidieren im Team, wenn
  zwei Branches parallel dieselbe nächste Nummer vergeben. Die Methode
  erwähnte das Problem nicht.
- **Befund 10:** Kapitel 2.4 behauptet Werkzeugneutralität, der Starter
  lieferte aber nur den Claude-Code-Zeiger; zudem ist `@AGENTS.md`
  Claude-spezifische Import-Syntax, was nirgends stand.
- **Befund 11:** „Üblich: unter `docs/` oder im Repo-Root" ist keine
  Konvention, sondern ein Achselzucken — genau die Unschärfe, die die
  Methode bekämpfen will.
- **Befund 13:** Die Methode benannte ihre Grenzen nicht; Methoden ohne
  benannte Grenzen wirken wie Verkaufsprospekte.

## Entscheidung

1. **Nummern-Merge-Regel (3.2):** Nummern werden beim Zusammenführen
   aufgelöst — wer beim Merge eine Kollision vorfindet, vergibt für das
   eigene Artefakt die nächste freie Nummer und passt dessen Links an. Da
   Nummern nur Reihenfolge ausdrücken, ist das verlustfrei.
2. **Werkzeug-Zeiger vollständig (2.4, Starter):** Der Starter liefert
   neben `CLAUDE.md` auch `.github/copilot-instructions.md` und
   `.cursor/rules/agents-verweis.mdc`. Kapitel 2.4 stellt klar:
   `@AGENTS.md` ist Claude-Code-Import-Syntax; die übrigen Zeiger sind
   Prosa-Verweise.
3. **Andockung an Code-Projekte (2.1):** Verbindlich statt „üblich": Bei
   Code-Projekten liegen alle denkspur-Ordner und -Dateien gebündelt unter
   `docs/`; im Repo-Root bleiben nur `README.md`, `AGENTS.md` und die
   Werkzeug-Zeiger. Die Übersicht-Skripte nehmen dafür den Pfad als
   Parameter (`… docs`).
4. **Grenzen-Sektion (Leitfaden):** Ein eigener Abschnitt benennt, wann
   denkspur nicht lohnt (Wegwerf-Arbeit, Ein-Tages-Aufgaben, reine
   Konsum-Ablagen) und dass die Methode nach unten skaliert.

## Konsequenzen

- Die Team-Zusage aus 4.3 hat keine bekannte Lücke mehr bei der
  Nummernvergabe.
- Werkzeugneutralität ist geliefert statt behauptet; Adopter kopieren die
  Zeiger, die sie brauchen, und löschen den Rest.
- Code-Projekte haben einen eindeutigen Ort für die Methode — keine zwei
  Projekte, die es unterschiedlich halten.
- Die benannten Grenzen machen die Nutzenbehauptung glaubwürdiger, nicht
  schwächer.
