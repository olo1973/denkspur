---
typ: idee
status: befördert
datum: 2026-07-15
tags: [werkzeug, uebersicht, fehler]
---

# Idee 0003: Die beiden Übersichts-Skripte weichen in Zeilenenden und Portabilität ab

Befördert zu: [Entscheidung 0010](../entscheidungen/0010-zeilenenden-und-portabilitaet-der-skripte.md)

Am 2026-07-15 beim Gegenprüfen eines Merges aufgefallen: `uebersicht.md` galt
als geändert, obwohl der sichtbare Inhalt gleich war.

**Diagnose am 2026-07-17 praktisch verifiziert** — beide Skripte unter
Windows PowerShell 5.1, pwsh 7.6.3 und Bash real ausgeführt, Ausgaben Byte für
Byte verglichen. Das Ergebnis hat zwei frühere Vermutungen widerlegt:

- Meine erste Fassung („`ps1` schreibt CRLF, `sh` schreibt LF") stimmt nicht.
- Eine zweite Vermutung, die `.sh` lasse per `sed` ein `\r` aus CRLF-Quellen in
  den Feldern stehen, stimmt ebenfalls nicht.

Verifizierter Befund:

- **Beide Generatoren erzeugen aus denselben Quellen byte-identischen Inhalt —
  bis auf genau ein Byte:** den abschließenden Zeilenumbruch. `pwsh` schreibt
  ihn über `Set-Content` als CRLF, `bash` als LF. Kein `\r` in den Feldern
  (auch nicht auf echten CRLF-Quellen), kein BOM, keine inneren CRLF.
- Es gibt **keine `.gitattributes`**. Beide Skripte liegen als LF im Repo, die
  Quell-`.md` werden per `autocrlf` als CRLF ausgecheckt. Das Diff-Rauschen,
  das den Verdacht auslöste, entsteht aus dem Zusammenspiel von diesem
  Trailing-Terminator-Unterschied und der fehlenden angepinnten Normalisierung
  — nicht aus einem Feld-`\r`.
- **Schwerer wiegt ein separater Befund: `uebersicht-generieren.ps1` läuft
  unter Windows PowerShell 5.1 gar nicht.** Zeile 24 (`| — | (noch keine) …`)
  enthält einen UTF-8-Gedankenstrich in einer BOM-losen Datei. 5.1 liest die
  Datei in der ANSI-Codepage, ein fehldekodiertes Byte bricht das
  String-Literal vorzeitig ab, die folgenden `|` werden als Pipe-Operatoren
  gelesen — harter Parser-Fehler, kein Zeichen wird geschrieben. Reproduziert
  mit echter Fehlermeldung. 5.1 ist die Default-PowerShell auf jedem Windows;
  der Starter verspricht Werkzeugneutralität, hält sie hier also nicht.

Das Diff-Rauschen ist mehr als Kosmetik: Es trifft genau das Artefakt, das
laut Zusage 2 die verlässliche Ableitung sein soll. Und der 5.1-Stopp macht
das Skript für einen Teil der Adopter schlicht unbrauchbar.

Mögliche Richtung: `.gitattributes` mit expliziter Zeilenenden-Politik (die
Wurzel des Rauschens), die beiden Generatoren auf denselben Schluss-Umbruch
bringen, und die `.ps1` 5.1-fest machen (ASCII-Ersatz für den Gedankenstrich
oder BOM plus festgelegtes Ausgabe-Encoding).

**Kein reiner Bugfix ohne ADR:** Die Zeilenenden-Politik in `.gitattributes`
setzt eine repo-weite Konvention, die jeder Adopter über den Starter erbt —
diese Wahl gehört protokolliert. Der 5.1-Fix und die Terminator-Angleichung
dürfen als mechanischer Teil mitlaufen; der Rahmen ist ein schlanker ADR.

Offen: Die allgemeinere Frage, wie zwei Skript-Varianten überhaupt verlässlich
gleich bleiben und wer das prüft, gehört in die Diskussion um den
Konformitäts-Check (siehe
[Idee 0002](0002-konformitaets-check-fuer-die-uebersicht.md)).
