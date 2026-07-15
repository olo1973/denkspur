---
typ: idee
status: keim
datum: 2026-07-15
tags: [format]
---

# Idee 0004: Familien-Präfix in der Entscheidungs-Überschrift

Aus der Nachlese von decision-trail
([Entscheidung 0009](../entscheidungen/0009-nachlese-decision-trail-v2-9-bis-v2-16.md),
„Nicht Teil dieser Entscheidung"). Unsere Überschriften sind uneinheitlich:
Ideen und Pläne tragen ein Familien-Präfix (`# Idee 0001:`, `# Plan 0001:`),
Entscheidungen nur die nackte Nummer (`# 0001:`). Aufgefallen ist es erst
beim Lesen des Übersichts-Skripts, das den Präfix wieder abschneiden muss.

Ihr ADR-0028 pinnt dafür eine Form an (`# ADR-0017:`) mit dem Argument, ein
aus dem Kontext gerissener Titel — in einen Chat kopiert, in einer Suche
angezeigt — solle sich selbst beschreiben. Die Nummer ist der gesprochene
Griff („schau in 0009"), und sie steht dort, wo der Leser gerade hinsieht,
statt im Dateinamen-Tab.

Der Befund stimmt für uns. Die Änderung ist ein mechanischer Sweep über alle
Entscheidungen plus eine Anpassung des Übersichts-Skripts (dessen Regex den
neuen Präfix kennen muss).

Offen: Welche Form — `# Entscheidung 0009:` (konsequent deutsch, aber lang)
oder `# ADR-0009:` (kurz, international eingeführt, passt aber schlecht zu
[Entscheidung 0002](../entscheidungen/0002-deutsch-als-methodensprache.md))?
Und rechtfertigt der Nutzen, acht committete Entscheidungen anzufassen — oder
gilt das als Formsache, die die eiserne Regel gar nicht berührt?
