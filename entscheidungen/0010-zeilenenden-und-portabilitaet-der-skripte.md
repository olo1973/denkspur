---
typ: entscheidung
status: vorgeschlagen
datum: 2026-07-17
tags: [werkzeug, format]
---

# 0010: Zeilenenden- und Portabilitäts-Politik für die generierten Artefakte

Hervorgegangen aus: [Idee 0003](../ideen/0003-zeilenenden-der-uebersichts-skripte.md)

## Kontext

Zwei Befunde an den Übersichts-Skripten, beide am 2026-07-17 praktisch
verifiziert (beide Skripte unter Windows PowerShell 5.1, pwsh 7.6.3 und Bash
real ausgeführt, Ausgaben mit `xxd`/`cmp` byte-genau verglichen):

1. **Diff-Rauschen durch Zeilenenden.** `uebersicht-generieren.ps1` und
   `.sh` erzeugen aus denselben Quellen **byte-identischen Inhalt bis auf ein
   Byte**: den abschließenden Zeilenumbruch (`Set-Content` schreibt CRLF,
   `bash` LF). Kein `\r` in den Feldern, kein BOM. Weil das Repo **keine
   `.gitattributes`** hat und die Quell-`.md` per `autocrlf` als CRLF
   ausgecheckt werden, meldet Git schon bei diesem einen Byte die ganze Datei
   als geändert — Rauschen in genau dem Artefakt, das laut Zusage 2 die
   verlässliche Ableitung sein soll.
2. **`uebersicht-generieren.ps1` läuft unter Windows PowerShell 5.1 nicht.**
   Zeile 24 (`| — | (noch keine) …`) enthält einen UTF-8-Gedankenstrich in
   einer BOM-losen Datei. 5.1 liest sie in der ANSI-Codepage, ein
   fehldekodiertes Byte bricht das String-Literal auf, die folgenden `|`
   werden als Pipe-Operatoren gelesen — harter Parser-Fehler, kein Zeichen
   wird geschrieben. 5.1 ist die Default-PowerShell auf jedem Windows; der
   Starter verspricht Werkzeugneutralität (Zusage 7), hält sie hier also nicht.

Befund 2 ist ein Bug ohne Entscheidungsgehalt — niemand will das Skript kaputt
lassen; sein Fix ist mechanisch (ASCII-Ersatz für den Gedankenstrich oder BOM
plus festgelegtes Ausgabe-Encoding) und gehört in den Plan. Die eigentliche
**Entscheidung** ist Befund 1: welche Zeilenenden-Politik das Repo setzt. Sie
wirkt repo-weit und wird von jedem Adopter über den Starter geerbt, deshalb ein
ADR und kein stiller Bugfix.

## Erwogene Optionen

1. **`.gitattributes` mit `* text=auto eol=lf`** — Git normalisiert alle
   Textdateien im Index auf LF und checkt sie auf **allen** Plattformen als LF
   aus, unabhängig von `autocrlf`. Das Diff-Rauschen verschwindet an der
   Wurzel; die Generatoren müssen sich nur noch auf denselben Schluss-Umbruch
   einigen. LF ist der plattformübliche Repo-Standard. Kosten: bestehende
   CRLF-Arbeitskopien erzeugen beim ersten `add` eine einmalige
   Normalisierungs-Welle.
2. **`.gitattributes` nur für die generierten/gepflegten `.md`**
   (`*.md text eol=lf`) — engster Eingriff, betrifft nur Markdown. Lässt die
   Skripte und andere Dateien, wie `autocrlf` sie behandelt; eine schmalere,
   aber auch weniger vollständige Regel.
3. **Keine `.gitattributes`, stattdessen beide Generatoren im Code auf einen
   festen Terminator zwingen.** Vermeidet eine repo-weite Konvention, verlagert
   die Verantwortung aber in zwei getrennt gepflegte Skripte — genau die
   Zwei-Rendering-Fehlerklasse, die [Idee 0002](../ideen/0002-konformitaets-check-fuer-die-uebersicht.md)
   adressiert. Fragiler als eine deklarative Git-Regel.

## Entscheidung

(offen)

## Konsequenzen

- Der umsetzende Plan trägt drei Teile: die gewählte `.gitattributes`-Politik,
  die Angleichung des Schluss-Umbruchs beider Generatoren und den 5.1-Fix des
  Gedankenstrichs (mechanisch, kein Entscheidungsgehalt).
- **Vor dem `angenommen` prüfen:** Die gewählte Option praktisch durchspielen —
  greift die Normalisierung sauber, ohne eine unerwartete Welle über den
  Bestand zu ziehen? Das ist Arbeit im Vorschlags-/Planstadium, nicht in dieser
  Anlage.
- Auf Annahme werden der wechselseitige Rück-Link `Befördert zu:` in Idee 0003
  gesetzt (bereits mit der Beförderung geschehen) und ein Plan angelegt, der
  diese Entscheidung `Setzt um:`.
- Ein Adopter, der den Starter kopiert hat, erbt die `.gitattributes`-Regel und
  den reparierten Generator über die normale Aktualisierung; der
  CHANGELOG-Eintrag weist die Migration aus.
