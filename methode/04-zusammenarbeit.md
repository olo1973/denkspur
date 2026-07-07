---
typ: referenz
status: entwurf
datum: 2026-07-06
---

# Kapitel 4 — Zusammenarbeit: Mensch und Agent

> Die Spielregeln zwischen Mensch und KI-Agent — und zwischen Menschen, wenn
> aus dem Solo-Projekt ein Team-Projekt wird. Die Schnittstelle ist das
> Gespräch: Der Mensch beschreibt, der Agent strukturiert und schreibt die
> Artefakte.

## 4.1 Das Bestätigungs-Gate: zwei Freigabe-Modi

Der Agent darf jederzeit **vorschlagen** — Ideen formulieren, Vorschläge
ausarbeiten, Konsequenzen durchdenken. Wann er **handeln** darf (Artefakte
anlegen, Status kippen, umsetzen), bestimmt der Freigabe-Modus, den jedes
Projekt in seiner `AGENTS.md` deklariert (entschieden in
[0006](../entscheidungen/0006-freigabe-modi.md)):

- **`gespraech`** (Default, gilt ohne Deklaration): Gehandelt wird erst auf
  ausdrückliche Freigabe im Dialog. Dabei gilt: Ein bloßes „ja", „ok" oder
  „mach weiter" trägt eine unvermeidbare Mehrdeutigkeit der Reichweite —
  bezieht sich das Ja auf den einen Vorschlag oder das ganze Paket? Der
  Agent benennt vor dem Handeln explizit, was er unter der Freigabe versteht
  („Ich lege dann Idee X an und befördere Y — beides?").
- **`pr-gate`** (für autonome, Git-basierte Workflows): Der Agent arbeitet
  frei auf einem Feature-Branch — legt Artefakte an, kippt Status, setzt
  um. **Die Freigabe ist der Merge des Pull Requests durch den Menschen**;
  die Reichweite des „Ja" ist der sichtbare Diff. Direkt auf dem Hauptzweig
  handelt der Agent auch in diesem Modus nicht.

In beiden Modi freigabefrei bleiben die billigen Kontinuitäts-Handgriffe:
Logbuch-Einträge, Zwischenstände, das Regenerieren der Übersicht. Und die
eiserne Regel aus 3.3 gilt modusunabhängig: Auch auf einem Branch werden
gemergte Entscheidungen nur per `Ergänzt:`/`Ersetzt:` fortgeschrieben, nie
umgeschrieben.

## 4.2 Das Design-Gate: Oberflächen als Bild abnehmen

Anwendung von Zusage 7 (Abnahme am günstigsten Medium) auf Vorhaben mit
Benutzeroberfläche, beschlossen in
[Entscheidung 0003](../entscheidungen/0003-design-gate-abnahme-am-guenstigsten-medium.md):

- Der Plan eines UI-Vorhabens enthält vor den Umsetzungs-Aufgaben ein
  explizites Gate: **„Design-Entwurf visuell abgenommen"**.
- Der Entwurf entsteht im günstigsten tauglichen Medium — Figma, ein
  Bild-Mockup, notfalls eine ASCII-Skizze.
- **Der abgenommene Stand wird als Bild exportiert und versioniert**, unter
  `ergebnisse/abnahmen/`, und im Plan verlinkt wie jedes andere Artefakt.
  Ein Figma-Link darf zusätzlich stehen, ersetzt den versionierten Beleg
  aber nicht: Externe Links altern und sind für Dritte oft unzugänglich.
  `_zwischenstand/` ist dafür tabu — der Ordner ist wegwerfbar und
  typischerweise gitignored (Kapitel 3.5).
- Erst nach der visuellen Abnahme beginnt die Code-Umsetzung. Iteration am
  Bild kostet Minuten; Iteration am Code kostet Stunden und hinterlässt
  Altlasten.

Das Gate ist kein Wasserfall: Kleine, risikolose UI-Änderungen (ein Button,
ein Text) brauchen kein Figma. Das Gate greift, wo Layout, Fluss oder
Erscheinungsbild neu entstehen, also überall dort, wo ein „gefällt mir
nicht" nach der Umsetzung teuer wäre.

## 4.3 Solo vs. Team: gleiche Struktur, mehr Explizitheit

Die Struktur bleibt identisch; was sich ändert, ist der Grad an
Explizitheit, Eigentümerschaft und Formalisierung. Solo darf vieles im Kopf
des einen Autors liegen; im Team muss es geschrieben stehen.

| Aspekt | Solo | Team |
|---|---|---|
| Versionierung | Datei-Sync oder Git, direkte Commits | **Git** mit Branches + Pull-Request-Review |
| Frontmatter `status` / `owner` | optional | **Pflicht** — sonst weiß niemand, worauf Verlass ist |
| Entscheidungen | ADRs kurz und formlos | ADRs verbindlich, Änderung per Review |
| Glossar `_meta/glossar.md` | selten nötig | gemeinsames Vokabular pflegen |
| Agenten-Instruktionen | formlos gepflegt | versioniert, für alle gleich, Änderung per Review |
| Posteingang `_eingang/` | locker | klare Regel: zeitnah leeren |
| Datenklassen-Regel (2.5) | Selbstdisziplin | technisch absichern (Pre-Commit-Hook, Secret-Scanning) |
| Onboarding | unnötig | Eingangsseite orientiert Neue in unter 5 Minuten |

Faustregel: Im Team ist alles eine Spur formaler. Genau die Felder, die
solo Overhead wären, tragen dort die Zusammenarbeit.

## 4.4 Adoption und Aktualisierung

- **Einstieg:** den Inhalt von [`starter/`](../starter/) ins eigene Projekt
  kopieren, Platzhalter füllen, erste Idee anlegen. Der Leitfaden führt durch
  den ersten kompletten Durchlauf.
- **Aktualisierung:** Vor einem Update das
  [`CHANGELOG.md`](../CHANGELOG.md) lesen — jede Version nennt in der Zeile
  „Adopter-Migration" die betroffenen Starter-Dateien. Nur diese werden
  übernommen (typisch: `_templates/`, `skripte/`). **Projektspezifisch
  angepasste Dateien (insbesondere `AGENTS.md` und `README.md`) nie blind
  überschreiben**; dort wird nur der Methoden-Block angeglichen, die harten
  Projektregeln bleiben unangetastet. Der Versionsmarker am Ende der
  Starter-`AGENTS.md` zeigt, auf welchem Stand ein Projekt ist. Eigene
  Abweichungen von der Methode sind erlaubt und werden, der Methode gemäß,
  als eigenes ADR festgehalten.

## Verknüpfungen

- [Kapitel 1 — Vertrag](01-vertrag.md)
- [Kapitel 3 — Lebenslauf (die Zeit)](03-lebenslauf.md)
- [Leitfaden (didaktischer Einstieg)](../leitfaden.md)
