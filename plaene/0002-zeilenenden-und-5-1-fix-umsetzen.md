---
typ: plan
status: entwurf
datum: 2026-07-17
tags: [werkzeug, format]
---

# Plan 0002: Zeilenenden-Politik und 5.1-Fix umsetzen

Setzt um: [Entscheidung 0010](../entscheidungen/0010-zeilenenden-und-portabilitaet-der-skripte.md)

Trägt die drei in 0010 bestätigten Teile aus. Kein Design-Gate (keine
Oberfläche). Reine mechanische Ausführung; taucht eine offene Frage auf, geht
sie zurück in die Entscheidungsstufe, nicht in diesen Plan.

## Aufgaben

**Teil 1 — Zeilenenden-Politik**

- [ ] `.gitattributes` im Repo-Wurzelverzeichnis anlegen: `* text=auto eol=lf`.
- [ ] Dieselbe `.gitattributes` in den `starter/` legen, damit Adopter die
      Regel über das Skelett erben.
- [ ] `git add --renormalize .` ausführen und das Ergebnis prüfen (erwartet:
      keine oder minimale Index-Änderung, da `autocrlf` den Index schon auf LF
      hält).

**Teil 2 — Generatoren auf LF-Schluss angleichen**

- [ ] `uebersicht-generieren.ps1`: den Schluss-Umbruch auf LF bringen, damit
      die Ausgabe nach einem `pwsh`-Lauf nicht mehr transient als `M`
      erscheint (z. B. via `[IO.File]::WriteAllText` mit dem bereits
      LF-getrennten `$inhalt`, ohne BOM). Die `.sh` schreibt bereits LF.

**Teil 3 — 5.1-Fix (Portabilität)**

- [ ] `uebersicht-generieren.ps1`, Zeile 24: den UTF-8-Gedankenstrich in
      `| — | (noch keine) …` durch ASCII ersetzen (`-`), damit die BOM-lose
      Datei unter Windows PowerShell 5.1 parst und läuft.
- [ ] Ausgabe-Encoding der `.ps1` explizit auf UTF-8 ohne BOM festlegen, damit
      5.1 und 7 dieselbe Datei erzeugen.

**Abnahme (Verifikation, nicht Entscheidung)**

- [ ] Beide Generatoren unter Windows PowerShell 5.1, pwsh 7 und Bash laufen
      lassen; bestätigen: `.ps1` läuft unter 5.1, alle Läufe erzeugen
      byte-gleiche LF-Ausgabe, `git status` bleibt nach jedem Lauf sauber.

**Abschluss**

- [ ] `starter/AGENTS.md`: Versionsmarker auf die nächste Fassung heben.
- [ ] `CHANGELOG.md`: Eintrag mit Adopter-Migration (neue `.gitattributes` aus
      dem Starter übernehmen; reparierten Generator kopieren).
- [ ] Übersicht per Skript regenerieren.
- [ ] Status dieses Plans auf `fertig`.

## Zwischenstände

Die Verifikation aus [Entscheidung 0010](../entscheidungen/0010-zeilenenden-und-portabilitaet-der-skripte.md)
lief in einem Wegwerf-Klon unter dem Scratchpad; die drei Fix-Teile sind dort
als nötig und zusammen ausreichend bestätigt.
