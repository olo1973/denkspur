---
typ: entscheidung
status: angenommen
datum: 2026-07-18
tags: [format, lebenslauf]
---

# 0011: Die Überschrift des Entscheidungs-Abschnitts wandert mit dem Status

Hervorgegangen aus: [Idee 0005](../ideen/0005-vorschlags-ueberschrift-wandert-mit-dem-status.md)

## Kontext

Die Vorlage `entscheidung-vorlage.md` lässt bei Status `vorgeschlagen` den
Abschnitt „## Entscheidung" mit dem Platzhalter „(offen)" stehen. Das Ergebnis
ist ein Dokument, dessen wichtigster Abschnitt leer ist, während die
eigentliche Empfehlung weiter oben unter „Erwogene Optionen" steckt. Wer den
Vorschlag liest, sucht die Empfehlung dort, wo sie nicht steht.

decision-trail (ADR-0033) löst dasselbe eleganter: Ein Vorschlag trägt die
Überschrift `## Proposed decision`, die bei Annahme zu `## Decision` wird —
Status und Überschrift wandern zusammen, und der Vorschlag darf schon sagen,
was er vorschlägt. Ein leerer Abschnitt kann gar nicht mehr entstehen, weil es
den leeren Abschnitt nicht mehr gibt.

## Erwogene Optionen

1. **Wandernde Überschrift** — der Vorschlag trägt `## Vorgeschlagene
   Entscheidung`, die beim Kippen auf `angenommen` zu `## Entscheidung` wird.
   Der Abschnitt ist nie leer; ein aus dem Kontext gerissener Schnipsel
   beschreibt sich selbst (die Überschrift sagt „vorgeschlagen"). Treu zu
   Zusage 9 (leihen statt erfinden). Kosten: ein Umbenenn-Handgriff pro
   Annahme, den man vergessen kann — die Art stiller Drift, vor der
   [Entscheidung 0007](0007-praezisierungen-aus-dem-review.md) und der
   Konformitäts-Gedanke aus [Idee 0002](../ideen/0002-konformitaets-check-fuer-die-uebersicht.md)
   warnen.
2. **Eine feste Überschrift, kein Platzhalter** — `## Entscheidung` bleibt
   immer stehen, „(offen)" entfällt, der Vorschlag füllt den Abschnitt direkt
   mit seiner Empfehlung. Dass es noch nicht bindend ist, sagt der Status im
   Frontmatter. Keine Drift, eine Quelle der Wahrheit — aber der herausgelöste
   Schnipsel braucht sein Frontmatter, um sich zu erklären.
3. **Status quo** — „(offen)" beibehalten. Verworfen: das ist genau das
   Problem, das hier gelöst wird.

## Entscheidung

**Option 1 — wandernde Überschrift.** Ein Vorschlag trägt
`## Vorgeschlagene Entscheidung` und formuliert dort seine Empfehlung; beim
Kippen auf `angenommen` wird die Überschrift zu `## Entscheidung`. Dieses ADR
hat die Form auf sich selbst angewandt: Der Abschnitt hieß im Vorschlag
`## Vorgeschlagene Entscheidung` und ist mit der Annahme zu `## Entscheidung`
gewandert.

Der Eingriff berührt die eiserne Regel nicht: Bereits angenommene
Entscheidungen tragen schon `## Entscheidung` — den korrekten Endzustand —,
werden also nicht angefasst. Umbenannt wird nur beim Statuswechsel eines
noch nicht angenommenen Vorschlags; ein Rückwirken auf bestehende
Entscheidungen entfällt.

## Konsequenzen

- Der umsetzende Plan trägt zwei mechanische Teile: die Vorlage
  `entscheidung-vorlage.md` (Abschnitt in „## Vorgeschlagene Entscheidung"
  umbenennen, „(offen)"-Hinweis entfernen, den Umbenenn-Schritt beim
  Statuswechsel als Kommentar vermerken) und `methode/03-lebenslauf.md` (die
  Beschreibung der Stationen „Vorschlag" und „Entscheidung" um die wandernde
  Überschrift ergänzen).
- **Drift-Risiko benannt, nicht hier gelöst:** Der Umbenenn-Handgriff kann
  vergessen werden — Status und Abschnitts-Überschrift könnten auseinander-
  fallen. Die passende Absicherung ist der Konformitäts-Check aus
  [Idee 0002](../ideen/0002-konformitaets-check-fuer-die-uebersicht.md)
  (Regel: Status und Überschrift dürfen nie divergieren). Das ist kein Teil
  dieser Entscheidung, gehört aber in deren Blickfeld.
- Ein Adopter erbt die geänderte Vorlage über die normale Starter-
  Aktualisierung; der CHANGELOG-Eintrag weist die Migration aus.
- Auf Annahme werden der wechselseitige Rück-Link `Befördert zu:` in Idee 0005
  gesetzt (bereits mit der Beförderung geschehen) und ein Plan angelegt, der
  diese Entscheidung `Setzt um:`.
