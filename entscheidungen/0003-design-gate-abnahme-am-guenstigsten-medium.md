---
typ: entscheidung
status: angenommen
datum: 2026-07-06
tags: [oberflaeche, abnahme]
---

# 0003: Design-Gate — Abnahme am günstigsten Medium

Hervorgegangen aus: [Idee 0001](../ideen/0001-design-gate.md)

## Kontext

Idee 0001 hält eine Praxisbeobachtung fest: GUIs zuerst in Figma entwerfen
und visuell abnehmen, bevor Code entsteht. Die offene Frage der Idee: Ist das
ein Figma-Spezialfall oder ein allgemeines Prinzip?

Der Blick auf den Lebenslauf zeigt: Die Methode tut das an anderer Stelle
längst. Eine Idee wird als Dreizeiler abgenommen (nicht als ausgearbeitetes
Konzept), eine Architekturfrage als ADR-Text (nicht als Implementierung).
Jede Station lässt am **billigsten tauglichen Medium** entscheiden. Für
Benutzeroberflächen fehlte nur die konsequente Fortsetzung: Das billigste
Medium für ein Layout ist ein Bild, nicht Code.

## Erwogene Optionen

1. **Allgemeines Prinzip plus konkrete UI-Praxis (gewählt):** „Abnahme am
   günstigsten Medium" wird Zusage 7 im Vertrag; das Design-Gate ist seine
   Anwendung auf UI-Vorhaben.
2. **Nur eine Figma-Praxisregel** in Kapitel 4. Verworfen: verschenkt die
   Verallgemeinerung — dasselbe Prinzip trägt auch Text-vor-Prototyp und
   Skizze-vor-Datenmodell.
3. **Verbindliches Design-Werkzeug vorschreiben (Figma).** Verworfen:
   verletzt Werkzeug-Agnostik und „Leihen statt erfinden" gilt auch hier —
   das Gate verlangt ein abnehmbares Bild, nicht ein bestimmtes Produkt.

## Entscheidung

1. **Zusage 7 im Vertrag** (`methode/01-vertrag.md`): Jede Station erzeugt
   das billigste Artefakt, das eine Entscheidung erlaubt — Text vor Bild vor
   Code.
2. **Design-Gate als Praxis** (`methode/04-zusammenarbeit.md`, 4.2): Pläne
   für Vorhaben mit neuer Oberfläche enthalten vor den Umsetzungs-Aufgaben
   das Gate „Design-Entwurf visuell abgenommen"; der Entwurf (Figma-Link,
   Bild-Mockup, notfalls ASCII-Skizze) wird im Plan verlinkt. Kleine,
   risikolose UI-Änderungen sind ausgenommen.
3. Die Plan-Vorlage (`starter/_templates/plan-vorlage.md`) enthält den
   Gate-Abschnitt als optionalen Block.

## Konsequenzen

- Teure Ablehnungen nach der Umsetzung („sieht ganz anders aus, als ich
  dachte") werden an das billige Medium vorverlagert.
- Pläne für UI-Vorhaben werden einen Schritt länger; das ist gewollt — das
  Gate ist genau dort Pflicht, wo sein Fehlen teuer wäre.
- Das Prinzip ist werkzeugoffen: Figma ist die naheliegende, aber keine
  vorgeschriebene Wahl.
