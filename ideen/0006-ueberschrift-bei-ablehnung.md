---
typ: idee
status: keim
datum: 2026-07-18
tags: [format, lebenslauf]
---

# Idee 0006: Was die Überschrift bei einer Ablehnung tut

Bei der Umsetzung von
[Entscheidung 0011](../entscheidungen/0011-vorschlags-ueberschrift-wandert-mit-dem-status.md)
aufgefallen: 0011 regelt nur den Übergang bei `angenommen` — die Überschrift
`## Vorgeschlagene Entscheidung` wird dann zu `## Entscheidung`. Was mit ihr
beim Kippen auf `abgelehnt` geschieht, sagt das ADR nicht. `methode/03`
behauptet deshalb bewusst nur den Annahme-Fall.

Naheliegende Richtung: Bei Ablehnung bleibt die Überschrift
`## Vorgeschlagene Entscheidung` — die Empfehlung wurde vorgeschlagen und
verworfen, sie ist nie „die Entscheidung" geworden. Das hält auch die
Selbstbeschreibung des Schnipsels aufrecht (Status `abgelehnt` + Überschrift
`Vorgeschlagene Entscheidung` lesen sich stimmig zusammen).

Offen: Reicht das als stillschweigende Konvention, oder verdient es eine Zeile
im ADR/`methode/03`? Und falls ein Konformitäts-Check kommt
([Idee 0002](0002-konformitaets-check-fuer-die-uebersicht.md)): Dessen Regel
„Status und Überschrift dürfen nie divergieren" müsste den Ablehnungs-Fall als
gültige Kombination kennen, sonst schlägt sie fälschlich an.
