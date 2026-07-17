---
typ: idee
status: keim
datum: 2026-07-15
tags: [werkzeug, uebersicht, fehler]
---

# Idee 0003: Die beiden Übersichts-Skripte erzeugen byte-verschiedene Dateien

Am 2026-07-15 beim Gegenprüfen eines Merges aufgefallen: `uebersicht.md` galt
als geändert, obwohl der sichtbare Inhalt gleich war.

**Diagnose am 2026-07-17 korrigiert.** Die erste Fassung dieser Idee behauptete
„`ps1` schreibt CRLF, `sh` schreibt LF". Das stimmt so nicht — eine Prüfung
gegen den echten Code (beide Skripte gelesen, EOL-Zustand mit
`git ls-files --eol` geprüft) zeigt ein anderes Bild:

- Es gibt **keine `.gitattributes`**. Beide Skripte liegen als LF im Repo, die
  Quell-`.md` sind LF im Index, werden auf dieser Windows-Maschine per
  `autocrlf` aber als **CRLF** ausgecheckt.
- Die beiden Skripte gehen mit diesem `\r` **unterschiedlich** um: Die `.sh`
  zieht die Feldwerte per `sed` aus den CRLF-Quellen und lässt das anhängende
  `\r` **stehen** — es landet mitten in den Tabellenzeilen. Die `.ps1` streift
  es ab (`Get-Content` trennt die Zeilenenden, `.Trim()` entfernt den Rest).
  Aus denselben Quellen entstehen so **verschiedene** Dateien — nicht wegen der
  Zeilenenden der Generatoren, sondern wegen ungleicher `\r`-Behandlung auf
  CRLF-Quellen ohne angepinnte Normalisierung.
- **Zweiter, in der ersten Fassung übersehener Befund:** Zeile 24 der `.ps1`
  enthält einen UTF-8-Gedankenstrich (`| — | (noch keine) …`) in einer
  BOM-losen Datei. Unter Windows PowerShell 5.1, das eine Datei ohne BOM in der
  ANSI-Codepage liest, ist ein Nicht-ASCII-Zeichen dort mindestens ein
  Verfälschungs-Risiko, womöglich ein Ausführungs-Stopper. (Aus einem
  Sub-Agenten-Lauf berichtet, von mir noch nicht selbst nachgestellt.)

Das ist mehr als Kosmetik: Wer im Team zwischen PowerShell und Shell wechselt,
produziert bei jedem Lauf einen Diff über die ganze Datei — Rauschen in genau
dem Artefakt, das laut Zusage 2 die verlässliche Ableitung sein soll. Und es
ist dieselbe Fehlerklasse, die decision-trails ADR-0026 beschreibt: zwei
Renderings derselben Wahrheit laufen auseinander, weil niemand die Form
angepinnt hat. Dass ausgerechnet unser Gegenmittel gegen Handarbeit den Fehler
trägt, ist die eigentliche Pointe.

Mögliche Richtung: `.gitattributes` mit einer expliziten Zeilenenden-Politik
(die Wurzel des Diff-Rauschens), das `\r` in der `.sh`-Extraktion strippen,
damit beide Skripte gleich behandeln, und die `.ps1` 5.1-fest machen
(ASCII-Ersatz für den Gedankenstrich oder BOM, Ausgabe-Encoding festlegen).

**Kein reiner Bugfix ohne ADR** (anders als in der ersten Fassung vermutet):
Die Zeilenenden-Politik in `.gitattributes` setzt eine repo-weite Konvention,
die jeder Adopter über den Starter erbt — diese Wahl gehört protokolliert. Die
reine `\r`-Bereinigung darf als mechanischer Teil mitlaufen; der Rahmen ist ein
schlanker ADR.

Offen: Die allgemeinere Frage, wie zwei Skript-Varianten überhaupt verlässlich
identisch bleiben und wer das prüft, gehört in die Diskussion um den
Konformitäts-Check (siehe
[Idee 0002](0002-konformitaets-check-fuer-die-uebersicht.md)).
