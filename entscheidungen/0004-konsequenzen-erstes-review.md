---
typ: entscheidung
status: angenommen
datum: 2026-07-06
tags: [methode, review]
---

# 0004: Konsequenzen aus dem ersten kritischen Review

Ergänzt: [Entscheidung 0001](0001-synthese-zweier-quellen.md)

## Kontext

Am Gründungstag wurde das Repo einem kritischen Review unterzogen
(13 Befunde). Sechs davon wurden zur sofortigen Umsetzung angenommen; die
übrigen sieben (u. a. Frontmatter-Dialekte, Nummern-Kollision im Team,
Autonomie-Modus für das Bestätigungs-Gate) bleiben offen und werden als
eigene Ideen bzw. Entscheidungen weiterbehandelt — die Methode auf sich
selbst angewandt.

Die sechs angenommenen Befunde:

1. Die Gründungs-Spur (0001–0003) entstand gebündelt an einem Tag und
   demonstriert nicht, was sie verspricht (kein `keim`, kein `abgelehnt`).
2. Kapitel 4.2 verlangte, Design-Abnahmen unter `_zwischenstand/` zu
   verlinken — einem Ordner, den beide `.gitignore` ausschließen und den 3.5
   für wegwerfbar erklärt: Der Abnahme-Beleg wäre ein toter Link.
3. Der Attributions-Absatz stand **im** MIT-Lizenztext; damit erkennen
   GitHub und Compliance-Tooling die Lizenz nicht mehr als MIT.
4. Die Regeneration der Übersicht war einem Sprachmodell zugewiesen —
   teuer, fehleranfällig und deterministisch automatisierbar; das Repo
   lieferte kein einziges Skript.
5. Der Lebenslauf steht in vier Renderings (Leitfaden, `methode/03`,
   `AGENTS.md`, `starter/AGENTS.md`), ohne dass geregelt wäre, welche
   Fassung bei Widerspruch gilt.
6. Die Update-Zusage aus 4.4 („Starter erneut kopieren") hatte weder
   CHANGELOG noch Versionsmarker; blindes Kopieren würde zudem die
   projektspezifisch angepasste `AGENTS.md` des Adopters zerstören.

## Erwogene Optionen

- Zu 1: Historie nachträglich inszenieren (Daten spreizen, künstliche
  Ablehnungen erfinden). **Verworfen** — eine gefälschte Spur widerspricht
  dem einzigen Zweck einer Spur. Gewählt: Ehrlichkeit — der Gründungsmodus
  wird in README und Logbuch benannt; echte `abgelehnt`/`verworfen`-Beispiele
  entstehen ab jetzt unter Realbedingungen.
- Zu 2: `_zwischenstand/` versionieren. **Verworfen** — der Ordner ist
  bewusst wegwerfbar (3.5), das soll er bleiben. Gewählt: Abnahme-Belege
  sind Ergebnisse und wandern versioniert nach `ergebnisse/abnahmen/`.
- Zu 4: Skript in jedem Werkzeug (Python, Node, …). **Verworfen** — der
  Starter soll ohne Laufzeitumgebung funktionieren. Gewählt: PowerShell und
  Bash, die beiden Shells, die auf den Zielplattformen ohnehin vorhanden sind.
- Zu 5: Alle Renderings auf eine Datei eindampfen. **Verworfen** — Leitfaden
  (lehren), Referenz (nachschlagen) und Agenten-Kurzfassung (laden) haben
  verschiedene Leser; die Redundanz ist gewollt. Gewählt: eine Kanon-Regel.

## Entscheidung

1. **Ehrlichkeit statt Kulisse:** README und Logbuch benennen, dass die
   Entscheidungen 0001–0003 gebündelt in der Gründungssitzung entstanden.
   Die Spur unter Realbedingungen beginnt mit dieser Datei.
2. **Abnahme-Belege sind versionierte Ergebnisse:** Der abgenommene
   Design-Stand wird als Bild unter `ergebnisse/abnahmen/` committet und im
   Plan verlinkt; ein Figma-Link darf zusätzlich stehen, ersetzt den Beleg
   aber nicht (externe Links altern). `_zwischenstand/` bleibt wegwerfbar
   und ist für Abnahme-Belege ausdrücklich tabu (Kapitel 3.5 und 4.2,
   Plan-Vorlage).
3. **LICENSE wortgetreu MIT:** Die Attribution zieht in die neue
   `NOTICE`-Datei und bleibt in README und ADR 0001.
4. **Übersicht per Skript:** `starter/skripte/uebersicht-generieren.ps1`
   und `.sh` erzeugen `uebersicht.md` deterministisch aus den
   Artefakt-Köpfen. Der Agent führt das Skript aus, statt Tabellen selbst zu
   schreiben (Kapitel 3.4, beide `AGENTS.md`). Dieses Repo nutzt dieselben
   Skripte (`starter/skripte/… -Pfad .`) — eine Wahrheit, ein Ort.
5. **Kanon-Regel:** `methode/` ist die maßgebliche Fassung.
   `leitfaden.md`, `AGENTS.md` und `starter/AGENTS.md` sind abgeleitete
   Renderings; bei Widerspruch gilt `methode/`, und der Fehler wird im
   Rendering behoben.
6. **CHANGELOG und Update-Regel:** `CHANGELOG.md` führt je Version eine
   „Adopter-Migration"-Zeile. Kapitel 4.4 regelt das Update präziser:
   CHANGELOG lesen, nur die genannten Starter-Dateien übernehmen,
   projektspezifisch angepasste Dateien (insbesondere `AGENTS.md`,
   `README.md`) nie blind überschreiben. Der Starter trägt einen
   Versionsmarker.

## Konsequenzen

- Das Repo verletzt seine eigenen Zusagen nicht mehr an den vom Review
  benannten Stellen; die verbleibenden Befunde 7–13 sind als offene Fäden
  bekannt und werden sichtbar weiterbehandelt.
- Der Starter wächst um `skripte/` — die in ADR 0001 beschlossene
  Schlankheit wird dafür bewusst aufgegeben (daher `Ergänzt:`).
- Die Übersicht-Pflege kostet ab sofort keine Modell-Tokens mehr und kann
  nicht mehr stillschweigend Zeilen verlieren.
- Die erste Entscheidung mit real erwogenen und verworfenen Optionen
  existiert nun — die Spur beginnt, ihr eigenes Versprechen einzulösen.
