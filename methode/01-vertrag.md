---
titel: Der Vertrag - neun Zusagen
typ: referenz
status: entwurf
stand: 2026-07-06
---

# Kapitel 1 — Der Vertrag: neun Zusagen

> Was ein Projekt, das denkspur anwendet, seinen Bearbeitern verspricht — dem
> Menschen von heute, dem Menschen in sechs Monaten und jedem KI-Agenten
> dazwischen. Alles Weitere in dieser Methode folgt aus diesen neun Zusagen;
> wenn eine Regel im Einzelfall unklar ist, entscheidet der Rückgriff auf den
> Vertrag.

Die Zusagen vereinen zwei Quellen: die acht Promises von
[decision-trail](https://github.com/ckluth/decision-trail) (Zeitachse) und die
fünf Grundprinzipien eines Struktur-Standards für KI-konsumierbare Ablagen
(Raumachse). Herkunft und Zuordnung dokumentiert
[Entscheidung 0001](../entscheidungen/0001-synthese-zweier-quellen.md).

## Die neun Zusagen

1. **Ein Zweck je Ort.**
   Jeder Ordner und jede Datei beantwortet in einem Satz „was liegt hier und
   warum". Wenn sich das nicht sagen lässt, ist der Ort falsch geschnitten.

2. **Eine Wahrheit, ein Ort — der Rest verlinkt.**
   Jeder Fakt und jede Entscheidung steht an genau einer Stelle. Wird sie
   anderswo gebraucht, wird verlinkt, nicht kopiert. Duplikate driften
   auseinander; im Team ist das fatal, solo lästig.

3. **Eine Tür je Projekt.**
   Jedes Projekt hat eine Eingangsseite (`README.md`), die in unter fünf
   Minuten orientiert — den Menschen wie den Agenten. Wer die Tür gelesen hat,
   weiß, wo alles Weitere wohnt.

4. **Klartext für Mensch und Maschine.**
   Markdown als Standardformat, Metadaten im Frontmatter, sprechende Namen,
   Diagramme als Text (Mermaid). Nichts versteckt sich in einem Werkzeug,
   einem Binärformat oder einer Folie. Was die Maschine parsen kann, kann der
   Mensch lesen — und umgekehrt.

5. **Getrennte Lebensbereiche: Eingang → Wissen → Ergebnis.**
   Rohmaterial (unverändert), aufbereitetes Wissen (strukturiert) und erzeugte
   Artefakte (Output) liegen in verschiedenen Bereichen. Sie zu mischen ist
   die häufigste Quelle von Unordnung.

6. **Ein Lebenslauf für Gedanken.**
   Jeder tragende Gedanke durchläuft nachvollziehbare Stationen:
   Idee → Vorschlag → Entscheidung → Plan → Umsetzung. Ideen dürfen Kinder
   bekommen (die Verwandtschaft bleibt verlinkt), und nichts Wertvolles stirbt
   im Chat-Verlauf.

7. **Abnahme am günstigsten Medium.**
   Jede Station erzeugt das billigste Artefakt, das eine Entscheidung erlaubt:
   eine Idee als Dreizeiler, eine Architekturfrage als Text (ADR), eine
   Benutzeroberfläche als Bild (Design-Entwurf), erst zuletzt Code. Was am
   günstigen Medium verworfen wird, hat am teuren nie Kosten verursacht.
   Siehe [Entscheidung 0003](../entscheidungen/0003-design-gate-abnahme-am-guenstigsten-medium.md).

8. **Beweglich bleiben — aber nie die Spur verwischen.**
   Jeder Faden kann jederzeit verfeinert, pausiert oder verworfen werden;
   nichts rastet dauerhaft ein. Aber eine getroffene Entscheidung wird nie
   wegeditiert: Neue Entscheidungen ergänzen oder ersetzen alte per Verweis,
   die Begründungsspur bleibt lesbar.

9. **Leihen statt erfinden.**
   Wo ein etablierter Standard existiert, wird er übernommen statt neu
   erfunden: ADR-Format für Entscheidungen, Markdown für Inhalte, Mermaid für
   Diagramme, `AGENTS.md` für Agenten-Instruktionen. Eigenbau nur dort, wo
   nichts Passendes existiert.

## Geltung

Die Methode ist bewusst **produkt- und domänenagnostisch**: Sie funktioniert
für eine Web-App wie für eine reine Markdown-Wissensbasis, mit Claude Code wie
mit GitHub Copilot oder ganz ohne Agent. Werkzeuge docken an die Struktur an
(Kapitel 2, Teil „Werkzeuge"); wechselt das Werkzeug, bleibt das Projekt.

## Verknüpfungen

- [Kapitel 2 — Struktur (der Raum)](02-struktur.md)
- [Kapitel 3 — Lebenslauf (die Zeit)](03-lebenslauf.md)
- [Kapitel 4 — Zusammenarbeit](04-zusammenarbeit.md)
