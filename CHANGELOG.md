# Changelog

Jede Version nennt in der Zeile **Adopter-Migration**, was ein bestehendes
denkspur-Projekt beim Update übernehmen muss (siehe `methode/04`, 4.4).

## v1.1 — 2026-07-06

Konsequenzen aus dem ersten kritischen Review
([Entscheidung 0004](entscheidungen/0004-konsequenzen-erstes-review.md)):

- Abnahme-Belege (Design-Gate) sind versionierte Ergebnisse unter
  `ergebnisse/abnahmen/`; `_zwischenstand/` ist dafür tabu.
- `LICENSE` wieder wortgetreu MIT; Attribution in neuer `NOTICE`-Datei.
- `uebersicht.md` wird per Skript generiert (`starter/skripte/`), nicht mehr
  vom Agenten geschrieben.
- Kanon-Regel: `methode/` ist maßgeblich, Leitfaden und AGENTS-Dateien sind
  abgeleitete Renderings.
- CHANGELOG eingeführt, Update-Regeln in `methode/04`, 4.4 präzisiert,
  Versionsmarker in der Starter-`AGENTS.md`.

**Adopter-Migration:** `skripte/` neu ins Projekt kopieren;
`_templates/plan-vorlage.md` übernehmen; in der eigenen `AGENTS.md` nur den
Methoden-Block angleichen (Regeln 5/6 und Versionsmarker), harte
Projektregeln unangetastet lassen; Ordner `ergebnisse/abnahmen/` anlegen,
falls Design-Gates genutzt werden.

## v1.0 — 2026-07-06

Gründung: Synthese aus decision-trail (ckluth, MIT) und privaten
Struktur-Standards ([Entscheidung 0001](entscheidungen/0001-synthese-zweier-quellen.md)) —
Vertrag, Struktur, Lebenslauf, Zusammenarbeit inkl. Design-Gate, Leitfaden,
Starter-Skelett.

**Adopter-Migration:** keine (Erstveröffentlichung).
