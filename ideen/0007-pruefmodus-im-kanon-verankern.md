---
typ: idee
status: keim
datum: 2026-07-18
tags: [werkzeug, methode, uebersicht]
---

# Idee 0007: Den Prüfmodus im Kanon verankern

Seit [Plan 0004](../plaene/0004-konformitaets-check-umsetzen.md) (v1.6) haben
die Übersichts-Skripte einen zweiten Modus: `-Pruefen` meldet Befunde, statt
`uebersicht.md` zu erzeugen. In `methode/` steht davon nichts —
`03-lebenslauf.md`, 3.4 beschreibt weiterhin nur die Erzeugung. Wer nur den
Kanon liest, erfährt vom Check nicht.

Nachziehen lässt sich das nicht nebenbei: `AGENTS.md`, `starter/AGENTS.md` und
`leitfaden.md` sind abgeleitete Renderings, maßgeblich ist `methode/`. Eine
Zeile dort ist eine Methoden-Änderung und gehört durch die Entscheidungsstufe.

Offene Fragen für einen späteren Vorschlag:

- **Nur beschreiben oder auch verlangen?** Ein Satz in 3.4 („der Modus
  existiert") ist billig. Eine Zusage, die Spur konform zu *halten* — Check vor
  dem Commit, oder wenigstens vor einer Freigabe — ist eine echte
  Verhaltensregel und trifft jedes Adopter-Projekt.
- **Wo wohnt sie?** 3.4 (Werkzeug) oder `04-zusammenarbeit.md` (Arbeitsweise) —
  je nachdem, ob es Beschreibung oder Pflicht wird.
- **Was ist mit dem Automatisieren?** Entscheidung 0012 hat den Exit-Code
  ausdrücklich für pre-commit-Hook und CI gebaut, aber nichts davon
  vorgeschrieben. Ob denkspur einen Hook mitliefert, ist eine eigene Frage.
