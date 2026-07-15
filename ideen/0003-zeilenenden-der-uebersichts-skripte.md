---
typ: idee
status: keim
datum: 2026-07-15
tags: [werkzeug, uebersicht, fehler]
---

# Idee 0003: Die beiden Übersichts-Skripte erzeugen byte-verschiedene Dateien

Am 2026-07-15 beim Gegenprüfen eines Merges aufgefallen: `uebersicht.md` galt
als geändert, obwohl der Inhalt identisch war.
`uebersicht-generieren.ps1` schreibt CRLF, `uebersicht-generieren.sh` schreibt
LF. Aus denselben Artefakt-Köpfen entstehen also byte-verschiedene Dateien, je
nachdem, wer das Skript startet.

Das ist mehr als Kosmetik: Wer im Team zwischen PowerShell und Shell wechselt,
produziert bei jedem Lauf einen Diff über die ganze Datei — Rauschen in genau
dem Artefakt, das laut Zusage 2 die verlässliche Ableitung sein soll. Und es
ist dieselbe Fehlerklasse, die decision-trails ADR-0026 beschreibt: zwei
Renderings derselben Wahrheit laufen auseinander, weil niemand die Form
angepinnt hat. Dass ausgerechnet unser Gegenmittel gegen Handarbeit den Fehler
trägt, ist die eigentliche Pointe.

Mögliche Richtung: eine der beiden Varianten als maßgeblich erklären und die
andere angleichen, oder `.gitattributes` die Normalisierung übernehmen lassen.
Kandidat für einen reinen Bugfix ohne ADR — Präzedenz ist Befund 12 (defekte
Mermaid-Labels), der nach
[Entscheidung 0007](../entscheidungen/0007-praezisierungen-aus-dem-review.md)
ohne eigenes ADR lief.

Offen: Ist es wirklich nur ein Bugfix, oder steckt die allgemeinere Frage
dahinter, wie zwei Skript-Varianten überhaupt verlässlich identisch bleiben —
und wer das prüft (siehe
[Idee 0002](0002-konformitaets-check-fuer-die-uebersicht.md))?
