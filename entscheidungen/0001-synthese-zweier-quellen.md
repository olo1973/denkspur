---
typ: entscheidung
status: angenommen
datum: 2026-07-06
tags: [methode, herkunft]
---

# 0001: Synthese zweier Quellen zu einer Methode

## Kontext

Es existieren zwei unabhängig entstandene, jeweils bewährte Ansätze:

1. **[decision-trail](https://github.com/ckluth/decision-trail)** (ckluth,
   MIT): ein Lebenslauf für Gedanken — Idee → Vorschlag → Entscheidung (ADR)
   → Plan → Umsetzung — mit festem Querverweis-Vokabular, generierter
   Übersicht, Arbeitstagebuch und acht expliziten Promises. Stark auf der
   **Zeitachse** (warum ist etwas so, was wurde verworfen), aber ohne
   Aussagen zu Ablagestruktur, Namenskonventionen, Metadaten, Datenklassen
   oder Team-Skalierung.
2. **Private Struktur-Standards des Autors** für KI-konsumierbare Ablagen:
   Projekt-Skelett mit Systemordner-Konvention, Namensregeln,
   YAML-Frontmatter, Eingangsseiten-Prinzip, `AGENTS.md`-als-Wahrheit-Muster,
   Datenklassen-Regeln (sensible Originale bleiben außerhalb des Repos),
   Solo/Team-Skalierung. Stark auf der **Raumachse** (wo liegt was, wie
   bleibt es konsistent), aber mit nur einem dünnen einzeiligen
   Entscheidungs-Log statt eines echten Entscheidungs-Lebenslaufs.

Die Achsen überlappen kaum — jede Quelle ist genau dort stark, wo die andere
schweigt.

## Erwogene Optionen

1. **decision-trail unverändert adoptieren** und die Struktur-Standards
   daneben stellen. Verworfen: zwei getrennte Dokumente mit verwandten, aber
   unabgestimmten Prinzipien laden zum Drift ein; die Lücken (Struktur ohne
   Lebenslauf, Lebenslauf ohne Struktur) blieben offen.
2. **Nur die Struktur-Standards veröffentlichen.** Verworfen: der größte
   Schmerz — verlorene Entscheidungsbegründungen — bliebe ungelöst; das
   dünne Einzeiler-Log trägt keinen echten Entscheidungsprozess.
3. **Synthese zu einer integrierten Methode (gewählt):** ein Vertrag
   (vereinte Prinzipien), die Raumachse aus den Struktur-Standards, die
   Zeitachse aus decision-trail, dazu eine Zusammenarbeits-Schicht.

## Entscheidung

denkspur entsteht als **eine integrierte Methode** mit vier Schichten:

- **Vertrag** (`methode/01`): die fünf Struktur-Grundprinzipien und die acht
  decision-trail-Promises, dedupliziert zu neun Zusagen. Deckungsgleiches
  (Transparenz ≈ maschinen-/menschenlesbar) wird verschmolzen; „Leihen statt
  erfinden" und „Eine Wahrheit, ein Ort" bleiben sinngemäß wörtlich erhalten.
- **Raum** (`methode/02`): Skelett, Namens- und Frontmatter-Konventionen,
  Datenklassen — erweitert um die drei Lebenslauf-Ordner als festen
  Bestandteil des Skeletts; sie ersetzen das bisherige einzeilige
  Entscheidungs-Log (`_meta/entscheidungen.md`).
- **Zeit** (`methode/03`): der decision-trail-Lebenslauf samt Vokabular,
  generierter Übersicht und Logbuch — konzeptionell übernommen mit
  Attribution (MIT), siehe `LICENSE` und README.
- **Zusammenarbeit** (`methode/04`): Bestätigungs-Gate und
  Reichweiten-Klärung (aus decision-trail), Solo/Team-Skalierung und
  Agenten-Instruktions-Muster (aus den Struktur-Standards), Design-Gate
  (neu, [Entscheidung 0003](0003-design-gate-abnahme-am-guenstigsten-medium.md)).

**Format-Entscheid im Detail:** Artefakt-Metadaten wandern ins
YAML-Frontmatter (`typ`, `status`, `datum`, `tags`) — maschinenfreundlicher
als die Klartext-Kopfzeilen von decision-trail. Die **Beziehungs-Links**
(`Hervorgegangen aus:` usw.) bleiben dagegen klickbare Markdown-Zeilen unter
der Überschrift, weil Links im Frontmatter auf GitHub und in Obsidian nicht
rendern. Jede Quelle gewinnt dort, wo sie stärker ist.

Das Repo wendet die Methode auf sich selbst an: Diese Datei ist ihr erstes
Artefakt.

## Konsequenzen

- Adopter bekommen beide Achsen aus einem Guss: ein Skelett, das den
  Lebenslauf enthält, und einen Lebenslauf, der weiß, wo er wohnt.
- Die Attribution an decision-trail ist dauerhaft in `LICENSE`, README und
  den Methoden-Kapiteln verankert.
- Der `starter/` bleibt bewusst schlank (Skelett + Vorlagen + Kurzreferenz);
  der Leitfaden wird nicht dupliziert, sondern verlinkt — ein Drift-Risiko
  weniger, um den Preis, dass Adopter für den Lehrtext online nachschlagen.
- Die privaten Struktur-Standards des Autors verlieren ihren generischen
  Teil an dieses Repo und behalten nur das persönliche Delta — sonst
  entstünden zwei driftende Wahrheiten.
