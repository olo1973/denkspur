---
typ: idee
status: keim
datum: 2026-07-15
tags: [format, lebenslauf]
---

# Idee 0005: Die Überschrift eines Vorschlags soll mit dem Status wandern

Beim Schreiben von
[Entscheidung 0009](../entscheidungen/0009-nachlese-decision-trail-v2-9-bis-v2-16.md)
aufgefallen. Unsere Vorlage sagt: bei Status `vorgeschlagen` trägt der
Abschnitt „Entscheidung" den Text „(offen)". Das Ergebnis ist ein Dokument,
dessen wichtigster Abschnitt leer ist, während die eigentliche Empfehlung
weiter oben in den Optionen steckt. Wer den Vorschlag liest, sucht sie dort,
wo sie nicht steht.

decision-trails ADR-0033 löst dasselbe eleganter: Ein Vorschlag trägt die
Überschrift `## Proposed decision`, die bei Annahme zu `## Decision` wird —
Status und Überschrift wandern zusammen, und der Vorschlag darf schon sagen,
was er vorschlägt. Ein leerer Abschnitt kann dann nicht mehr entstehen, weil
es keinen gibt.

Mögliche Richtung: `## Vorgeschlagene Entscheidung` → `## Entscheidung` beim
Kippen des Status, in Vorlage und `methode/03`.

Offen: Ist die Umbenennung einer Überschrift beim Statuswechsel eine
zusätzliche Handgriff-Regel, die man vergessen kann — und damit genau die Art
stiller Drift, die ADR-0026 beschreibt? Ein Konformitäts-Check könnte das
prüfen (siehe [Idee 0002](0002-konformitaets-check-fuer-die-uebersicht.md)):
Status und Überschrift dürfen nie auseinanderfallen.
