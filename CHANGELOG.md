# Changelog

Jede Version nennt in der Zeile **Adopter-Migration**, was ein bestehendes
denkspur-Projekt beim Update übernehmen muss (siehe `methode/04`, 4.4).

## v1.4 — 2026-07-17

Zeilenenden-Politik und Portabilität der Übersichts-Skripte
([Entscheidung 0010](entscheidungen/0010-zeilenenden-und-portabilitaet-der-skripte.md),
[Plan 0002](plaene/0002-zeilenenden-und-5-1-fix-umsetzen.md)):

- **`.gitattributes`** (`* text=auto eol=lf`) im Repo-Wurzelverzeichnis und im
  Starter: normalisiert alle Textdateien auf LF, auf allen Plattformen. Das
  Diff-Rauschen in der generierten `uebersicht.md` verschwindet an der Wurzel.
- **`uebersicht-generieren.ps1` läuft jetzt unter Windows PowerShell 5.1.** Der
  UTF-8-Gedankenstrich in der „noch keine"-Zeile ist durch ASCII ersetzt, das
  Skript trägt einen UTF-8-BOM (damit 5.1 seine Nicht-ASCII-Texte korrekt
  liest) und liest die Artefakte mit `-Encoding UTF8`. Verifiziert: 5.1,
  pwsh 7 und Bash erzeugen jetzt byte-identische Ausgabe.
- Der Schluss-Umbruch beider Generatoren ist auf LF ohne BOM angeglichen; nach
  einem Lauf bleibt `git status` sauber.

**Adopter-Migration:** Die neue `.gitattributes` aus dem Starter übernehmen
(oder eine eigene mit `* text=auto eol=lf` anlegen) und den reparierten
`uebersicht-generieren.ps1` kopieren. Danach einmal `git add --renormalize .`
ausführen; wo `core.autocrlf` schon aktiv war, bleibt die Welle klein.

## v1.3 — 2026-07-17

Nachlese aus decision-trail v2.9–v2.16
([Entscheidung 0009](entscheidungen/0009-nachlese-decision-trail-v2-9-bis-v2-16.md)),
fünf übernommene Regeln in die Methodentexte getragen
([Plan 0001](plaene/0001-nachlese-in-die-methodentexte-tragen.md)):

- **Pläne sind mechanische Ausführung** (`methode/03`, 3.1): Ein Plan enthält
  nie eine entscheidende Aufgabe; eine bei der Umsetzung auftauchende Frage
  geht zurück in die Entscheidungsstufe.
- **Nummernvergabe per `max+1`** mit Existenzprüfung (`methode/03`, 3.2), vor
  die bestehende Merge-Kollisionsregel gesetzt — erst vermeiden, dann heilen.
- **Einstiegs-Status ausgeschrieben** und Familien-Exklusivität (`methode/03`,
  3.1): neue Idee `keim`, neuer Vorschlag `vorgeschlagen`, neuer Plan
  `entwurf`; kein Status aus einer fremden Familie.
- **Artefakte aus der Vorlage**, nie aus einem Geschwister (`methode/04`, 4.1).
- **Wiedereinstiegs-Hebel** als neuer Leitfaden-Abschnitt 7 (rein beratend,
  nur im Lehrtext).

**Adopter-Migration:** Die Regeln 1–4 sind Verhaltensregeln zum Verinnerlichen
— keine Artefakt-Rückmigration nötig, kein bestehendes Artefakt wird
umgeschrieben. Wer den Starter kopiert hat, gleicht den Methoden-Block seiner
`AGENTS.md` an (neue Zeilen zu Plänen, Nummernvergabe und Vorlagen) und
übernimmt den Versionsmarker **v1.3**.

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

Gründung: Synthese aus decision-trail (Christofer Kluth, HÄVG AG, MIT) und privaten
Struktur-Standards ([Entscheidung 0001](entscheidungen/0001-synthese-zweier-quellen.md)) —
Vertrag, Struktur, Lebenslauf, Zusammenarbeit inkl. Design-Gate, Leitfaden,
Starter-Skelett.

**Adopter-Migration:** keine (Erstveröffentlichung).
