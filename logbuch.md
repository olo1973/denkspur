# Logbuch

> Formloses Arbeitstagebuch, neueste Einträge zuerst. Kein Ersatz für die
> Spur — nur der billigste Wiedereinstieg nach einer Pause.

## 2026-07-15 — Attribution korrigiert

Nachlese von decision-trail (v2.9–v2.16) förderte einen Fehler in unserer
eigenen Attribution zutage: Wir nannten „ckluth" als Rechteinhaber, deren
`LICENCE` weist aber seit dem 05.07. — also einen Tag **vor** unserem Fork —
die Hausärztliche Vertragsgemeinschaft AG (HÄVG) aus. Der Vermerk war damit
von Anfang an falsch, nicht durch Drift veraltet. Zudem ist das Repo nach
`haevg-rz/decision-trail` umgezogen (der alte Pfad leitet weiter, deshalb fiel
es nicht auf), und der Urheber schreibt sich Christofer, nicht Christopher.

Korrigiert in `NOTICE`, `README`, `methode/01`, `methode/03`, `CHANGELOG` und
— rein tatsächlich, ohne Begründung oder Entscheidung anzutasten —
[Entscheidung 0001](entscheidungen/0001-synthese-zweier-quellen.md). Der
Eintrag vom 2026-07-06 unten bleibt bewusst stehen, wie er war: Ein Tagebuch
hält fest, was wir damals taten und wussten; korrigiert wird die Zusage, nicht
die Erinnerung.

Offen: die inhaltliche Nachlese selbst (fünf Kandidaten aus v2.9–v2.16, allen
voran ADR-0037 „Pläne sind mechanische Ausführung") — noch nicht als Spur
angelegt.

## 2026-07-07 — Stil-Lektorat

Die Methodentexte (README, Leitfaden, `methode/01`–`04`) trugen erkennbar
KI-typische Rhetorik in hoher Dichte. Nach
[Entscheidung 0008](entscheidungen/0008-stil-lektorat.md) ein rein
stilistischer Lektor-Durchgang mit fester Rubrik: Aussagen, Links und
Terminologie unverändert, Pointen-Dichte, Gedankenstriche und Dreierreihen
reduziert. Entscheidungen 0001–0007 blieben unangetastet. Abnahme per
PR-Merge.

## 2026-07-07 — Veröffentlicht

Nach Abnahme durch den Autor als öffentliches Repo auf GitHub gestellt
(https://github.com/olo1973/denkspur). Die privaten Struktur-Standards des
Autors wurden im Gegenzug auf ihr persönliches Delta eingedampft und
verweisen jetzt hierher — die Konsequenz aus
[Entscheidung 0001](entscheidungen/0001-synthese-zweier-quellen.md) ist
damit umgesetzt: eine Wahrheit, ein Ort.

## 2026-07-06 — Review abgeschlossen (v1.2)

Die restlichen Review-Befunde 7–13 umgesetzt: einheitliches Frontmatter
([0005](entscheidungen/0005-einheitliches-frontmatter.md)), zwei
Freigabe-Modi Gespräch/PR-Gate
([0006](entscheidungen/0006-freigabe-modi.md)), Präzisierungen
(Nummern-Merge-Regel, `docs/`-Andockung, Copilot-/Cursor-Zeiger,
Grenzen-Sektion; [0007](entscheidungen/0007-praezisierungen-aus-dem-review.md))
sowie der Mermaid-Bugfix. Damit sind alle 13 Befunde des ersten Reviews
abgearbeitet. Nächster Schritt: Veröffentlichung auf GitHub nach Abnahme.

## 2026-07-06 — nach dem ersten Review

Externes kritisches Review mit 13 Befunden. Befunde 1–6 umgesetzt
([Entscheidung 0004](entscheidungen/0004-konsequenzen-erstes-review.md)):
Ehrlichkeitshinweis zur Gründungs-Spur, Abnahme-Belege versioniert unter
`ergebnisse/abnahmen/`, LICENSE wieder wortgetreu MIT plus NOTICE, Übersicht
per Skript, Kanon-Regel (`methode/` maßgeblich), CHANGELOG mit
Adopter-Migration. Befunde 7–13 offen — werden als eigene Ideen bzw.
Entscheidungen weiterbehandelt.

## 2026-07-06

Repo gegründet. Analyse von decision-trail (ckluth) und den privaten
Struktur-Standards abgeschlossen; Synthese-Entscheidung (0001), Sprachfrage
(0002) und Design-Gate (0003) als erste Spur angelegt. Leitfaden, vier
Methoden-Kapitel und Starter-Skelett geschrieben. Offen: Durchsicht durch den
Autor vor der Veröffentlichung; danach ggf. erste Ideen für v1.1 (englische
Fassung? Skript-Variante des Starters?).
