---
typ: entscheidung
status: angenommen
datum: 2026-07-07
tags: [sprache, stil]
---

# 0008: Stil-Lektorat — KI-Klang aus den Methodentexten nehmen

## Kontext

Die Texte des Repos (README, Leitfaden, Methoden-Kapitel) entstanden
agentengestützt in der Gründungssitzung. Beim Lesen mit Abstand fiel dem
Autor auf: Sie tragen eine hohe Dichte KI-typischer Rhetorik — Pointen am
Ende fast jedes Absatzes, Antithesen und Parallelismen als Dauerfigur,
Gedankenstrich-Einschübe in fast jedem Satz, Dreierreihen als Rhythmusfigur.
Einzeln sind diese Figuren legitim; in dieser Dichte wirken die Texte wie
Werbetexte über sich selbst und sind als KI-Ausgabe erkennbar. Für ein
öffentliches Methoden-Repo ist das ein Glaubwürdigkeitsproblem.

## Erwogene Optionen

1. **Lektor-Durchgang nach expliziter Rubrik (gewählt):** Ein rein
   stilistischer Redaktionsdurchgang mit fester Negativliste (Pointen-Dichte,
   Antithesen-Taktung, Gedankenstriche, Dreierreihen, Merksatz-Fettungen)
   und harten Sinn-Schutz-Regeln: Aussagen, Argumente, Links, Struktur und
   Terminologie bleiben unverändert. Die Rubrik liegt in der privaten
   Werkzeug-Konfiguration des Autors (Lektor-Agent) und ist damit für
   künftige Texte wiederverwendbar.
2. **Belassen:** Verworfen. Der Befund verschwindet nicht von selbst, und
   jeder neue Leser stolpert erneut darüber.
3. **Komplette Neuformulierung von Hand:** Verworfen. Unverhältnismäßiger
   Aufwand, und die inhaltliche Substanz der Texte ist gut; das Problem ist
   die Oberfläche.

## Entscheidung

Ein Lektor-Durchgang nach Option 1 über `README.md`, `leitfaden.md` und
`methode/01`–`04`, auf einem Branch mit PR-Abnahme durch den Autor.

Abgrenzungen:

- **Die Entscheidungen 0001–0007 bleiben unangetastet.** Sie sind
  committete historische Dokumente; die eiserne Regel (nichts Entschiedenes
  wird umgeschrieben) gilt dem Geist nach auch für ihre Formulierung.
- **Das Methodenvokabular bleibt.** Begriffe wie Tür, Spur, Lebenslauf oder
  die eiserne Regel sind Terminologie, kein Zierrat.
- Einzelne Pointen bleiben erlaubt (Maß: höchstens eine je Abschnitt) — Ziel
  ist ein nüchterner, menschlicher Ton, keine sterile Sprache.

## Konsequenzen

- Die Methodentexte lesen sich wie von einem Menschen redigiert; die
  Aussagen sind unverändert.
- Künftige Texte dieses Repos laufen vor der Veröffentlichung durch
  dieselbe Rubrik, damit der Befund nicht zurückkehrt.
- Die Starter-Vorlagen waren nicht betroffen (Platzhalter-Texte ohne
  Fließtext-Rhetorik); Adopter müssen nichts migrieren.
