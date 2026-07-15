---
typ: plan
status: entwurf
datum: 2026-07-15
tags: [methode, review]
---

# Plan 0001: Die Nachlese in die Methodentexte tragen

Setzt um: [Entscheidung 0009](../entscheidungen/0009-nachlese-decision-trail-v2-9-bis-v2-16.md)

Trägt die fünf übernommenen Regeln aus 0009 in die Texte. Kein Design-Gate:
Das Vorhaben hat keine Benutzeroberfläche.

Der Wortlaut jeder Regel ist in 0009 entschieden; hier steht nur, wo er
hingehört. Taucht beim Schreiben eine Frage auf, die 0009 nicht beantwortet,
gehört sie nach der eben angenommenen Regel 1 **nicht in diesen Plan**,
sondern zurück in die Entscheidungsstufe.

## Aufgaben

**Regel 1 — Ein Plan ist mechanische Ausführung**

- [ ] `methode/03`, 3.1: Plan-Punkt umschreiben. Die weiche Fassung
      („übersetzt eine angenommene Entscheidung in konkrete Aufgaben") wird zur
      klaren: nie eine entscheidende Aufgabe, eine auftauchende Frage geht
      zurück in die Entscheidungsstufe, Rückweg-Form nach Ermessen.
- [ ] `AGENTS.md`: eine Zeile in die harten Regeln.
- [ ] `starter/AGENTS.md`: dieselbe Zeile in den Methoden-Block.

**Regel 2 — Nummernvergabe per `max+1`**

- [ ] `methode/03`, 3.2: die Prozedur vor die bestehende Merge-Kollisionsregel
      setzen (erst vermeiden, dann heilen). Der Absatz zur Merge-Regel aus
      [0007](../entscheidungen/0007-praezisierungen-aus-dem-review.md) bleibt
      wörtlich stehen.
- [ ] `AGENTS.md` und `starter/AGENTS.md`: Nummern-Regel um `max+1` ergänzen.

**Regel 3 — Einstiegs-Status und Familien-Exklusivität**

- [ ] `methode/03`, 3.1: Prosa **unter** der Stationen-Tabelle. Die Tabelle
      bleibt unangetastet — sie zeigt Übergänge, nicht den Einstieg.

**Regel 4 — Artefakte aus der Vorlage, nie aus einem Geschwister**

- [ ] `methode/04`, 4.1: an das Bestätigungs-Gate anschließen — dort steht,
      wann der Agent handeln darf, hier kommt hinzu, woraus er schöpft.
- [ ] `AGENTS.md` und `starter/AGENTS.md`: je eine Zeile.

**Regel 5 — Wiedereinstieg (nur Lehrtext)**

- [ ] `leitfaden.md`: neuer Abschnitt nach „6. Der Agent als Schreibkraft mit
      Freigabe-Regel", mit den fünf in 0009 benannten Hebeln. Die Folge-
      abschnitte 7 und 8 werden umnummeriert.
- [ ] Gegenprüfen, dass nichts davon in `methode/` oder eine `AGENTS.md`
      gewandert ist — 0009 verlangt den Abschnitt ausschließlich im Leitfaden.

**Abschluss**

- [ ] `starter/AGENTS.md`: Versionsmarker `v1.2` → `v1.3`.
- [ ] `CHANGELOG.md`: Eintrag `v1.3` mit Adopter-Migration. Nach der
      Konvention des Repos ein Minor-Schritt, weil Regeln hinzukommen
      (v1.2.1 war reine Textoberfläche). Die Migration ist ausformuliert
      auszuweisen: Regeln 1–4 sind Verhaltensregeln zum Verinnerlichen, keine
      Artefakt-Rückmigration; wer den Starter kopiert hat, gleicht den
      Methoden-Block seiner `AGENTS.md` an.
- [ ] Übersicht per Skript regenerieren.
- [ ] Stil-Durchgang über die geänderten Absätze nach
      [0008](../entscheidungen/0008-stil-lektorat.md).
- [ ] Status dieses Plans auf `fertig`.

## Zwischenstände

Der Abgleich, aus dem 0009 hervorging, stützt sich auf einen Klon von
decision-trail zum Stand `c988d21` (v2.16.0, 2026-07-15). Er liegt bewusst
nicht im Repo: fremder Code, per URL jederzeit wiederbeschaffbar.
