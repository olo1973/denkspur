---
typ: plan
status: fertig
datum: 2026-07-18
tags: [format, lebenslauf]
---

# Plan 0003: Wandernde Entscheidungs-Überschrift umsetzen

Setzt um: [Entscheidung 0011](../entscheidungen/0011-vorschlags-ueberschrift-wandert-mit-dem-status.md)

Trägt die zwei in 0011 benannten mechanischen Teile aus: die Vorlage und die
Stationsbeschreibung in `methode/03`. Kein Design-Gate (keine Oberfläche).
Reine Ausführung; taucht eine offene Frage auf, geht sie zurück in die
Entscheidungsstufe, nicht in diesen Plan.

## Aufgaben

**Teil 1 — Vorlage `entscheidung-vorlage.md`**

- [x] Die Abschnitts-Überschrift `## Entscheidung` in
      `## Vorgeschlagene Entscheidung` umbenennen (die Vorlage beginnt bei
      Status `vorgeschlagen`, trägt also die Vorschlags-Form).
- [x] Den Platzhaltertext des Abschnitts ändern: den Hinweis „Bei Status
      `vorgeschlagen`: „(offen)"" entfernen und durch eine Anweisung ersetzen,
      die den Vorschlag auffordert, hier seine Empfehlung zu formulieren.
- [x] Einen Kommentar ergänzen, der den Umbenenn-Schritt festhält: beim Kippen
      auf `angenommen` wird die Überschrift zu `## Entscheidung`.

**Teil 2 — `methode/03-lebenslauf.md`**

- [x] Die Stationsbeschreibungen „Vorschlag" und „Entscheidung" (Abschnitt 3.1)
      um die wandernde Überschrift ergänzen: Ein Vorschlag trägt
      `## Vorgeschlagene Entscheidung`, die beim Kippen auf `angenommen` zu
      `## Entscheidung` wird — kein leerer Abschnitt mehr, die Empfehlung steht
      schon im Vorschlag.

**Abschluss**

- [x] `starter/AGENTS.md`: Versionsmarker von `v1.4` auf `v1.5` heben.
- [x] `CHANGELOG.md`: Eintrag `v1.5` mit Adopter-Migration (geänderte
      `entscheidung-vorlage.md` aus dem Starter übernehmen; die eigene Vorlage
      auf die wandernde Überschrift angleichen).
- [x] Übersicht per Skript regenerieren.
- [x] Status dieses Plans auf `fertig`.

## Zwischenstände

<!-- Optional: Verweise auf Arbeitsmaterial unter _zwischenstand/. -->
