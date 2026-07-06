---
titel: denkspur
typ: uebersicht
status: entwurf
stand: 2026-07-06
---

# denkspur

> Eine Methode, Projekte so zu führen, dass Mensch und KI-Agent sie jederzeit
> **finden, verstehen und fortschreiben** können. Struktur für den Raum
> (wo liegt was), Spur für die Zeit (warum ist es so).

Projekte scheitern selten an fehlender Arbeit, sondern an verlorenem Kontext:
Entscheidungen sterben im Chat-Verlauf, Ablagen wachsen wild, und jede neue
Session — ob mit einem Kollegen oder einem KI-Agenten — beginnt mit demselben
teuren Wieder-Erklären. denkspur hält dagegen: **Kontext gehört in die Ablage,
nicht in den Chat.** Jeder Gedanke bekommt einen vorhersehbaren Ort und einen
nachvollziehbaren Lebenslauf.

## Aufbau dieses Repos

| Pfad | Inhalt |
|---|---|
| [`leitfaden.md`](leitfaden.md) | Der didaktische Einstieg — **hier anfangen** |
| [`methode/`](methode/) | Die Referenz in vier Kapiteln: Vertrag, Struktur, Lebenslauf, Zusammenarbeit |
| [`ideen/`](ideen/), [`entscheidungen/`](entscheidungen/), [`plaene/`](plaene/) | denkspur wendet die Methode auf sich selbst an — hier liegen die eigenen Gründungsentscheidungen |
| [`uebersicht.md`](uebersicht.md) | Generierter Statusindex über alle Artefakte |
| [`logbuch.md`](logbuch.md) | Formloses Arbeitstagebuch, neueste Einträge zuerst |
| [`starter/`](starter/) | Kopierbares Skelett für den eigenen Projektstart (inkl. Vorlagen und Skripten) |
| [`AGENTS.md`](AGENTS.md) | Kurzreferenz für KI-Agenten, die in einem denkspur-Projekt arbeiten |
| [`CHANGELOG.md`](CHANGELOG.md) | Versionen mit „Adopter-Migration"-Hinweisen |

## Schnellstart

1. [`leitfaden.md`](leitfaden.md) lesen — motiviert das Problem, baut die Methode
   Schritt für Schritt auf und führt ein Beispiel von der ersten Idee bis zur
   fertigen Umsetzung durch.
2. Den Inhalt von [`starter/`](starter/) in das eigene Projekt kopieren.
3. Platzhalter in `README.md` und `AGENTS.md` füllen, erste Idee unter `ideen/`
   festhalten — der Rest ergibt sich aus der Arbeit.

## Herkunft

denkspur ist eine Synthese aus zwei Quellen:

- **[decision-trail](https://github.com/ckluth/decision-trail)** (ckluth,
  MIT-Lizenz) — der Lebenslauf für Gedanken: Idee → Vorschlag → Entscheidung →
  Plan → Umsetzung, das Querverweis-Vokabular und die generierte Übersicht.
- **Private Struktur-Standards des Autors** für KI-konsumierbare Ablagen —
  das Projekt-Skelett, die Namenskonventionen, das Frontmatter-Modell, die
  Datenklassen-Regeln und die Solo/Team-Skalierung.

Warum und wie beides zusammengeführt wurde, dokumentiert — methodengerecht —
[Entscheidung 0001](entscheidungen/0001-synthese-zweier-quellen.md); die
formale Attribution steht in [`NOTICE`](NOTICE).

**Ehrlichkeitshinweis zur eigenen Spur:** Die Entscheidungen 0001–0003
entstanden gebündelt in der Gründungssitzung am 2026-07-06 — sie
dokumentieren echte Abwägungen, aber keine über Zeit gereiften Fäden. Die
Spur unter Realbedingungen beginnt mit
[Entscheidung 0004](entscheidungen/0004-konsequenzen-erstes-review.md), den
Konsequenzen aus dem ersten kritischen Review. Zustände wie `verworfen` und
`abgelehnt` werden hier erst vorkommen, wenn sie wirklich eintreten — eine
inszenierte Historie wäre das Gegenteil dessen, was die Methode verspricht.

## Lizenz

MIT — siehe [`LICENSE`](LICENSE).
