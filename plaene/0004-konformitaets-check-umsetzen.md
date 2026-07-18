---
typ: plan
status: fertig
datum: 2026-07-18
tags: [werkzeug, uebersicht]
---

# Plan 0004: Konformitäts-Check als Prüfmodus umsetzen

Setzt um: [Entscheidung 0012](../entscheidungen/0012-konformitaets-check-pruefmodus.md)

Trägt den in 0012 beschlossenen Prüfmodus aus: ein `-Pruefen`-Flag am
bestehenden Übersichts-Skript, in beiden Sprachen, mit fünf Prüfungen und
einer Fixture-Absicherung wie in
[Entscheidung 0010](../entscheidungen/0010-zeilenenden-und-portabilitaet-der-skripte.md).
Kein Design-Gate (keine Oberfläche). Reine Ausführung; taucht eine offene Frage
auf, geht sie zurück in die Entscheidungsstufe, nicht in diesen Plan.

## Aufgaben

**Teil 1 — Prüfmodus-Gerüst**

- [x] `-Pruefen`-Schalter an `uebersicht-generieren.ps1` und `.sh`: ohne Flag
      erzeugt das Skript wie bisher `uebersicht.md`, mit Flag schreibt es nichts
      und sammelt stattdessen Befunde.
- [x] Exit-Code-Vertrag: sauberer Lauf endet mit 0, mindestens ein Befund mit
      Exit ≠ 0. Befunde lesbar ausgeben (Familie/Nummer/Art des Befunds).
- [x] Den vorhandenen Parser (Frontmatter, Titel, Links) für beide Modi teilen —
      kein zweites, getrenntes Parsing.

**Teil 2 — Die fünf Prüfungen**

- [x] (1) Nummern-Dubletten innerhalb einer Familie.
- [x] (2) Tote relative Markdown-Links (Querverweise, die auf eine nicht
      existierende Datei zeigen).
- [x] (3) Überschrift/Nummer stimmt zum Dateinamen.
- [x] (4) Statuswert stammt aus der eigenen Familie (kein familienfremder oder
      unbekannter Wert).
- [x] (5) Bei Entscheidungen: Status ↔ Abschnitts-Überschrift — `vorgeschlagen`
      verlangt `## Vorgeschlagene Entscheidung`, `angenommen` verlangt
      `## Entscheidung`. `abgelehnt` bleibt ausgespart (Entscheidung 0012,
      Verweis auf [Idee 0006](../ideen/0006-ueberschrift-bei-ablehnung.md)).

**Teil 3 — Fixture und Parität**

- [x] Eine isolierte Sammlung absichtlich kaputter Artefakte anlegen (eigener
      Test-Pfad mit `ideen/`/`entscheidungen/`/`plaene/`, den ein normaler
      `-Pfad .`-Lauf nicht berührt), die jede der fünf Prüfungen mindestens
      einmal auslöst.
- [x] Parität verifizieren: `.ps1` und `.sh` gegen die Fixture laufen lassen und
      bestätigen, dass beide dieselben Befunde melden (unter Windows
      PowerShell 5.1, pwsh 7 und Bash).
- [x] Den Prüfmodus gegen das reale Repo (`-Pfad .`) laufen lassen und
      bestätigen: keine Befunde (der Bestand ist konform).

**Abschluss**

- [x] `starter/AGENTS.md`: Versionsmarker von `v1.5` auf `v1.6` heben.
- [x] `CHANGELOG.md`: Eintrag `v1.6` mit Adopter-Migration (neuen `-Pruefen`-Modus
      aus dem Starter übernehmen; er meldet nur, verändert nichts).
- [x] Übersicht per Skript regenerieren.
- [x] Status dieses Plans auf `fertig`.

## Zwischenstände

Die Fixture liegt unter [`_pruefung/`](../_pruefung/README.md) — sechs
erwartete Befunde, festgehalten in
[`erwartete-befunde.txt`](../_pruefung/erwartete-befunde.txt). Bash, pwsh 7 und
Windows PowerShell 5.1 melden darauf zeichengleich dasselbe und enden mit
Exit 1; gegen das reale Repo (`-Pfad .`) melden beide „keine Befunde" und
enden mit 0. Die Erzeugung von `uebersicht.md` ist trotz des geteilten Parsers
byte-identisch zu v1.5 geblieben (in allen drei Laufzeiten geprüft).

Offener Rand, bewusst nicht in diesem Plan erledigt: In `methode/` steht der
Prüfmodus noch nirgends — 3.4 beschreibt nur die Erzeugung. Da `AGENTS.md` und
`leitfaden.md` abgeleitete Renderings des Kanons sind, wäre eine Ergänzung dort
eine Methoden-Änderung und gehört durch die Entscheidungsstufe, nicht in diesen
Plan. Festgehalten als
[Idee 0007](../ideen/0007-pruefmodus-im-kanon-verankern.md).
