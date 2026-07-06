---
typ: entscheidung
status: angenommen
datum: 2026-07-06
tags: [sprache]
---

# 0002: Deutsch als Methodensprache

## Kontext

decision-trail ist englischsprachig; eine geplante deutsche Übersetzung wurde
dort ausdrücklich fallen gelassen (deren ADR-0023: maschinell übersetzt
„clumsy and uninspiring"). Die Struktur-Standards des Autors sind deutsch.
Für denkspur als öffentliches Repo stellt sich die Sprachfrage neu.

## Erwogene Optionen

1. **Deutsch (gewählt):** besetzt eine offene Nische (die deutschsprachige
   Fassung, die decision-trail bewusst nicht liefert), passt zur primären
   Zielgruppe (deutschsprachige Teams, die agentengestützt arbeiten) und
   erlaubt originär geschriebene statt übersetzter Texte.
2. **Englisch:** maximale Reichweite, anschlussfähig an decision-trail.
   Verworfen: dupliziert dessen Sprachraum, statt ihn zu ergänzen; die
   Zielgruppe des Autors arbeitet deutsch.
3. **Englisch mit deutscher Kurzfassung:** Verworfen für v1 — doppelter
   Pflegeaufwand; kann später als eigene Idee zurückkehren.

## Entscheidung

denkspur ist **durchgängig deutsch** — Texte, Statuswerte und
Querverweis-Vokabular werden originär deutsch formuliert, nicht übersetzt:

- Status: `keim`/`befördert`/`verworfen`, `vorgeschlagen`/`angenommen`/
  `abgelehnt`, `entwurf`/`aktiv`/`fertig`/`abgebrochen`.
- Vokabular: `Eltern-Idee:`, `Befördert zu:`/`Hervorgegangen aus:`,
  `Ergänzt:`/`Ergänzt durch:`, `Ersetzt:`/`Ersetzt durch:`, `Setzt um:`.
- Datei- und Ordnernamen bleiben umlautfrei (`plaene/`, `uebersicht.md`) —
  die Namenskonvention aus `methode/02-struktur.md` gilt auch für die
  Methode selbst. Im Datei-Inhalt gilt normales Deutsch.

## Konsequenzen

- Deutschsprachige Teams bekommen eine Methode ohne Sprachbruch zwischen
  Regelwerk und Arbeitsalltag.
- Interoperabilität mit decision-trail-Repos erfordert eine bewusste
  Zuordnung der Vokabeln (die Tabellen in `methode/03-lebenslauf.md` und
  dessen AGENTS.md machen das trivial).
- Eine englische Fassung ist nicht ausgeschlossen — sie wäre eine neue Idee
  mit eigenem Lebenslauf.
