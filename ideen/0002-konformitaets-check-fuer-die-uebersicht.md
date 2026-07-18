---
typ: idee
status: befördert
datum: 2026-07-15
tags: [werkzeug, uebersicht]
---

# Idee 0002: Konformitäts-Check als Prüfmodus des Übersichts-Skripts

Befördert zu: [Entscheidung 0012](../entscheidungen/0012-konformitaets-check-pruefmodus.md)

Aus der Nachlese von decision-trail
([Entscheidung 0009](../entscheidungen/0009-nachlese-decision-trail-v2-9-bis-v2-16.md),
Gruppe B). decision-trail regeneriert seine Übersicht von Hand durch einen
Agenten und hat sich dabei dreimal Drift eingefangen; ihre Idee 0033 wägt
deshalb, ob ein Skript die Tool-Agnostik wert ist. Wir haben diese Frage mit
[Entscheidung 0004](../entscheidungen/0004-konsequenzen-erstes-review.md)
längst zugunsten des Skripts entschieden — die **Erzeugung** ist bei uns
deterministisch.

Ihre Analyse trennt aber zwei Hebel, die wir bisher als einen gedacht haben:
Erzeugung deterministisch machen (unser Skript) und **Erkennung** von Fehlern,
die das Skript gar nicht sehen kann. Denn das Skript kopiert treu, was in den
Köpfen steht — es merkt nicht, wenn zwei Artefakte dieselbe Nummer tragen, ein
Querverweis ins Leere zeigt oder die Überschrift nicht zum Dateinamen passt.
Prüfen ist deutlich billiger als Erzeugen, und ihre Rechnung legt nahe, dass
ein Prüfmodus den Großteil des Nutzens zu einem Bruchteil des Preises bringt.

Mögliche Richtung: `-Pruefen`-Schalter am bestehenden Skript, der nichts
schreibt, sondern Befunde meldet — Nummern-Dubletten, tote relative Links,
Titel-zu-Dateiname-Abgleich, unbekannte Statuswerte je Familie.

Offen: Gehört das ans Übersichts-Skript oder in ein eigenes? Was tut der Check
bei einem Befund — nur melden, oder Exit-Code für eine CI? Und wie hält man
ihn tool-agnostisch, wenn er in zwei Sprachen doppelt gepflegt werden muss
(siehe [Idee 0003](0003-zeilenenden-der-uebersichts-skripte.md))?
