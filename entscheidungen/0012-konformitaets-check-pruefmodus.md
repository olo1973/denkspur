---
typ: entscheidung
status: vorgeschlagen
datum: 2026-07-18
tags: [werkzeug, uebersicht]
---

# 0012: Konformitäts-Check als Prüfmodus des Übersichts-Skripts

Hervorgegangen aus: [Idee 0002](../ideen/0002-konformitaets-check-fuer-die-uebersicht.md)

## Kontext

Das Übersichts-Skript macht die **Erzeugung** der Übersicht deterministisch
(Entscheidung [0004](0004-konsequenzen-erstes-review.md)). Es kopiert aber treu,
was in den Artefakt-Köpfen steht — es sieht nicht, wenn zwei Artefakte dieselbe
Nummer tragen, ein Querverweis ins Leere zeigt, die Überschrift nicht zum
Dateinamen passt oder ein Statuswert nicht aus der eigenen Familie stammt.
decision-trail trennt (in ihrer Idee 0033) zwei Hebel, die wir bisher als einen
gedacht haben: Erzeugung deterministisch machen und **Erkennung** von Fehlern,
die das Skript gar nicht sehen kann. Prüfen ist deutlich billiger als Erzeugen.

Der Bedarf ist seit der Idee gewachsen: Die Entscheidungen
[0010](0010-zeilenenden-und-portabilitaet-der-skripte.md) (zwei Generatoren)
und [0011](0011-vorschlags-ueberschrift-wandert-mit-dem-status.md) (Status ↔
Abschnitts-Überschrift) haben jeweils ein Drift-Risiko nur *benannt* und die
Absicherung ausdrücklich diesem Check zugeschoben. Er löst also eine bereits
zweifach gemachte Zusage ein.

## Erwogene Optionen

1. **Prüfmodus als Flag am bestehenden Skript** (`-Pruefen`) — teilt den Parser,
   den Erzeugen und Prüfen beide brauchen (Frontmatter, Titel, Links). Ein
   Skript, ein Verständnis des Artefakt-Formats, zwei Modi.
2. **Eigenes Prüf-Skript** (`spur-pruefen.ps1`/`.sh`) — klare Einzelverantwortung,
   Generator bleibt schlank. Kosten: der Parser wird ein zweites Mal gepflegt und
   ist damit selbst genau die Drift-Quelle, die hier bekämpft wird.
3. **Gemeinsame Parser-Datei**, von Generator und Prüfer dot-gesourct — löst die
   Doppelung sauber, kostet aber eine dritte Datei je Sprache; für den jetzigen
   Umfang überbaut.

## Vorgeschlagene Entscheidung

**Option 1 — Prüfmodus als `-Pruefen`-Flag am bestehenden Skript.** Ohne Flag
erzeugt es wie bisher `uebersicht.md`; mit Flag schreibt es nichts, sondern
meldet Befunde. Der geteilte Parser ist das Hauptargument: ein zweites Parsing
wäre selbst driftanfällig.

Zwei Festlegungen dazu:

- **Verhalten bei Befund: melden und Exit-Code.** Befunde lesbar ausgeben und
  bei mindestens einem Befund mit Exit ≠ 0 enden (sauber = 0). Das dient dem
  Arbeiten von Hand wie auch einem pre-commit-Hook oder CI, ohne späteren Umbau.
- **Beide Sprachen, wie beim Generator.** Der Check ist deterministische
  Fleißarbeit (Zusage 7) und Zusage 7s Werkzeugneutralität verlangt PS *und*
  Bash. Die Doppelung wird abgesichert wie in
  [0010](0010-zeilenenden-und-portabilitaet-der-skripte.md): eine geteilte
  Sammlung absichtlich kaputter Artefakte (Fixture), auf der beide Prüfer
  identisch anschlagen müssen.

**Anfänglicher Prüfumfang** (fünf Prüfungen):

1. Nummern-Dubletten innerhalb einer Familie.
2. Tote relative Markdown-Links (Querverweise, die ins Leere zeigen).
3. Überschrift/Nummer stimmt zum Dateinamen.
4. Statuswert stammt aus der eigenen Familie (kein `entwurf` bei einer Idee usw.).
5. Bei Entscheidungen: Status ↔ Abschnitts-Überschrift — `vorgeschlagen` verlangt
   `## Vorgeschlagene Entscheidung`, `angenommen` verlangt `## Entscheidung`.
   Der Fall `abgelehnt` bleibt **ausgespart**, bis
   [Idee 0006](../ideen/0006-ueberschrift-bei-ablehnung.md) ihn entschieden hat —
   sonst faltete der Plan eine offene Frage ein.

## Konsequenzen

- Der umsetzende Plan trägt: das `-Pruefen`-Flag in beiden Skripten, die fünf
  Prüfungen, die Fixture kaputter Artefakte und die Parität-Verifikation (beide
  Prüfer melden auf der Fixture dasselbe), sowie Versionsmarker und
  CHANGELOG-Eintrag. Mechanisch; keine Oberfläche, kein Design-Gate.
- **Der Check erkennt, er heilt nicht.** Er ersetzt keine Regel der Methode,
  sondern meldet, wo Artefakte von ihr abweichen; das Beheben bleibt Handarbeit.
- **Naheliegende, hier bewusst nicht beschlossene Erweiterung:** eine
  Veraltungs-Prüfung (würde ein Neugenerieren der Übersicht ein Diff erzeugen?).
  Sie prüft Übersicht gegen Artefakte statt Artefakte untereinander und kann
  später als eigene Prüfung nachwachsen.
- Ein Adopter erbt den Prüfmodus über die normale Starter-Aktualisierung; der
  CHANGELOG-Eintrag weist die Migration aus.
- Auf Annahme werden der Rück-Link `Befördert zu:` in Idee 0002 gesetzt und ein
  Plan angelegt, der diese Entscheidung `Setzt um:`.
