# Changelog

Jede Version nennt in der Zeile **Adopter-Migration**, was ein bestehendes
denkspur-Projekt beim Update übernehmen muss (siehe `methode/04`, 4.4).

## v1.2.1 — 2026-07-07

Stil-Lektorat der Methodentexte
([Entscheidung 0008](entscheidungen/0008-stil-lektorat.md)): KI-typische
Rhetorik-Dichte in README, Leitfaden und `methode/01`–`04` reduziert; alle
Aussagen, Regeln und Links unverändert. Entscheidungen 0001–0007
unangetastet.

**Adopter-Migration:** keine (nur Textoberfläche dieses Repos).

## v1.2 — 2026-07-06

Restliche Review-Befunde umgesetzt (Entscheidungen
[0005](entscheidungen/0005-einheitliches-frontmatter.md),
[0006](entscheidungen/0006-freigabe-modi.md),
[0007](entscheidungen/0007-praezisierungen-aus-dem-review.md)):

- **Einheitliches Frontmatter** für alle Dokumente: ein Feldsatz
  (`typ`, `status`, `datum`, `owner`, `tags`); `titel` und `stand`
  entfallen, der Titel wohnt allein in der H1 (0005).
- **Zwei Freigabe-Modi** für das Bestätigungs-Gate: `gespraech` (Default)
  und `pr-gate` (Freigabe = PR-Merge); jedes Projekt deklariert seinen
  Modus in `AGENTS.md` (0006).
- **Nummern-Merge-Regel** für Teams, **verbindliche `docs/`-Andockung** für
  Code-Projekte, **Werkzeug-Zeiger** für Copilot und Cursor im Starter,
  **Grenzen-Sektion** („Wann denkspur nicht lohnt") im Leitfaden (0007).
- Mermaid-Diagramm in `methode/03` repariert (Zeilenumbrüche in Labels).

**Adopter-Migration:** `_templates/` und die neuen Zeiger-Dateien
(`.github/copilot-instructions.md`, `.cursor/rules/agents-verweis.mdc`, nach
Bedarf) übernehmen; in der eigenen `AGENTS.md` den Freigabe-Modus
deklarieren und den Versionsmarker auf v1.2 setzen; in Bestandsdateien
`stand:` → `datum:` umbenennen und `titel:` streichen (bei Gelegenheit, kein
Pflicht-Massenedit); Code-Projekte, die die Spur bisher im Root führen,
verschieben sie nach `docs/`.

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
