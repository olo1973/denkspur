---
typ: entscheidung
status: vorgeschlagen
datum: 2026-07-15
tags: [methode, herkunft, review]
---

# 0009: Nachlese decision-trail v2.9–v2.16

Ergänzt: [Entscheidung 0001](0001-synthese-zweier-quellen.md)
Ergänzt: [Entscheidung 0007](0007-praezisierungen-aus-dem-review.md)

## Kontext

denkspur entstand am 2026-07-06 als Synthese aus decision-trail und den
privaten Struktur-Standards ([Entscheidung 0001](0001-synthese-zweier-quellen.md)).
Der Fork-Stand entspricht decision-trail v2.8. Seither hat die Quelle acht
Releases veröffentlicht (v2.9 bis v2.16, ADR-0024 bis ADR-0038). Da wir die
Zeitachse konzeptionell von dort übernommen haben, ist die Frage nicht, ob wir
im Gleichschritt bleiben, sondern welche der fünfzehn Entscheidungen ein
Problem lösen, das **wir auch haben**.

Die Durchsicht am 2026-07-15 ergibt eine deutliche Asymmetrie: Der Großteil
der neuen Entscheidungen repariert Folgen von Struktur-Entscheidungen, die wir
anders getroffen haben. Drei Gruppen.

### Gruppe A — trifft uns ebenfalls (Kandidaten)

- **ADR-0037 (Pläne sind mechanische Ausführung).** In einem Consumer-Repo
  schrieb ein Agent einen Plan, dessen Aufgaben „entscheide X" und „kläre
  offene Frage Y" lauteten — er traf also Entscheidungen unter dem Deckmantel
  bloßer Ausführung, ohne ADR und ohne menschliche Prüfung. Die weiche
  Formulierung ihres ADR-0004 („das ADR ist die Spec, der Plan ist das Wie")
  hat das nicht verhindert. Unser Kapitel 3.1 formuliert fast wortgleich weich
  („übersetzt eine angenommene Entscheidung in konkrete Aufgaben"). Bei uns
  wiegt der Fehler schwerer, weil er den Freigabe-Modus `gespraech`
  ([Entscheidung 0006](0006-freigabe-modi.md)) umgeht — also die Zusage, auf
  der die ganze Zusammenarbeit ruht.
- **ADR-0025 (Nummernvergabe per `max+1` und Existenzprüfung).** Ein Agent
  fand „die nächste Nummer" per nachlässigem Glob und vergab eine bereits
  belegte; derselbe Fehler trat unabhängig in zwei Repos auf. Wir haben mit
  [Entscheidung 0007](0007-praezisierungen-aus-dem-review.md) nur die
  **Heilung** (Kollision beim Merge auflösen), nicht die **Vermeidung**.
- **ADR-0024 (Einstiegs-Status ausformulieren, Status nie aus fremder Familie
  borgen).** Bei uns milder als dort, weil unsere Statuswörter je Familie
  disjunkt sind (`keim` / `vorgeschlagen` / `entwurf`) — die Verwechslung
  `proposed` auf einer Idee ist im Deutschen kaum möglich. Der zweite Teil des
  Befunds trifft uns aber: Welcher Status der **erste** ist, steht auch bei uns
  nur als Pfeil in einer Tabelle, nirgends in Worten.
- **ADR-0033 (Artefakte aus der Spec schreiben, nie ein Geschwister-Artefakt
  als Vorlage kopieren).** Wer ein Nachbar-Artefakt als Gerüst kopiert,
  importiert dessen Zufälligkeiten — einen falschen Status, fremde
  Querverweise. Unsere `_templates/` entschärfen das, die Regel fehlt aber.
- **ADR-0030 (Wiedereinstieg billig halten).** Fünf Hebel, die allein der
  Mensch bedient: wie man die Sitzung eröffnet, das Artefakt statt des Themas
  benennen, eng fragen, zur Pause investieren statt beim Wiedereinstieg,
  Knappheit als Schreib-Disziplin. Rein beratend, ohne Mechanik; gehört in
  `leitfaden.md`, nicht in die Methode.

### Gruppe B — bei uns bereits gelöst

- **ADR-0026 (Header-Format anpinnen).** Ihre Kopfzeilen zerfielen in zwei
  Renderings, und ihr Grep übersprang die abweichende Form **still** — mit
  falschen Zeilen in der Übersicht als Folge. Bei uns durch das
  YAML-Frontmatter ([Entscheidung 0005](0005-einheitliches-frontmatter.md))
  gegenstandslos.
- **ADR-0029 (Instruktions-Gewicht schrumpfen).** Verkleinert ihre `AGENTS.md`
  von 21 KB auf 18 KB. Unsere ist 3 KB groß.
- **ADR-0028 (Ordinal im Titel).** Haben wir überwiegend. Offen bleibt eine
  Kleinigkeit, siehe „Nicht Teil dieser Entscheidung".
- **Ihre Idee 0033 (Übersicht per Skript?).** Sie ringen seit dem 2026-07-15
  damit, ob ein Skript für die Regeneration die Tool-Agnostik wert ist,
  nachdem ein Agent dreimal Drift eingebaut hat. Wir haben das am 2026-07-06
  mit [Entscheidung 0004](0004-konsequenzen-erstes-review.md) entschieden und
  gebaut. Ihre Analyse trennt sauber zwei Hebel — **Erzeugung**
  deterministisch machen (unser Skript) oder **Erkennung** (ein
  Konformitäts-Check) — und kommt zum Schluss, dass Prüfen den Großteil des
  Nutzens zu einem Bruchteil des Preises bringt. Das ist die eine Ergänzung,
  die unserem Skript fehlt; sie gehört als eigene Idee erfasst, nicht hierher.

### Gruppe C — nicht übertragbar

- **ADR-0032, ADR-0035** regeln die Synchronisation ihrer zwei Renderings
  (`AGENTS.md` und `working-method.md`). Wir haben mit „`methode/` ist Kanon"
  ([Entscheidung 0004](0004-konsequenzen-erstes-review.md)) ein anderes Modell.
- **ADR-0034, ADR-0038** ergänzen die Übersicht um abgeleitete Sichten
  (Entscheidung→Pläne-Index; eine Liste angenommener Entscheidungen ohne Plan).
  Gut gedacht und bei uns sogar billiger, weil unser Skript sie rechnen würde
  statt eines Agenten. Aber wir haben **null Pläne** — der Nutzen wäre heute
  theoretisch, die Skript-Arbeit (PowerShell und Shell) real. Als Idee
  vormerken, entscheiden, sobald Pläne existieren.
- **ADR-0027** (`zerlegt` als Status einer in Kinder zerfallenen Eltern-Idee)
  ist sauber begründet, trifft aber ein Problem, das wir bei einer einzigen
  Idee nicht haben.
- **ADR-0036** lehnt ab, feste Prozeduren als Skills zu rendern. Für uns kein
  Handlungsbedarf; die Kostenrechnung darin ist als Präzedenzfall lesenswert.
- **ADR-0031/ADR-0022** (Update-Pfad für Adopter, `updating.agent.md`) lösen
  eine Lücke, die wir ebenfalls haben — wir liefern einen CHANGELOG mit
  Adopter-Migration, aber keinen Weg, wie ein bestehendes denkspur-Projekt auf
  eine neue Fassung kommt. Das ist ein eigenes Vorhaben, kein Nachlese-Punkt,
  und wird erst dringlich, wenn ein zweites Projekt denkspur adoptiert.

## Erwogene Optionen

1. **Im Gleichschritt bleiben und alle fünfzehn übernehmen.** Verworfen:
   Zwei Drittel reparieren Folgen von Entscheidungen, die wir anders getroffen
   haben; wir würden fremde Probleme importieren und die eigene Methode
   aufblähen. Zusage 3 (Ökonomie) spricht dagegen.
2. **Nichts übernehmen, den Fork für abgeschlossen erklären.** Verworfen:
   ADR-0037 beschreibt einen real beobachteten Vorfall, gegen den unser Text
   genauso wenig schützt wie ihrer. Eine Quelle zu leihen (Zusage 9) und dann
   ihre Fehlerfunde zu ignorieren, wäre die teuerste Variante — wir würden
   denselben Schaden selbst noch einmal erleben.
3. **Selektive Nachlese, gebündelt entschieden (empfohlen).** Die fünf
   Kandidaten aus Gruppe A übernehmen, eingedeutscht und an unsere Struktur
   angepasst; Gruppe B und C mit Begründung ablehnen, damit die Analyse nicht
   in drei Monaten erneut anfällt. Präzedenz: die Sammel-Entscheidungen
   [0004](0004-konsequenzen-erstes-review.md) und
   [0007](0007-praezisierungen-aus-dem-review.md).

## Entscheidung

(offen)

## Konsequenzen

- Bei Annahme berührt ein Plan `methode/03` (Plan-Definition, Einstiegs-Status,
  Nummern-Prozedur), `methode/04` oder `AGENTS.md` (Artefakte aus der Spec),
  `leitfaden.md` (Wiedereinstieg) und den `starter/` — dessen `AGENTS.md`
  trägt einen Versionsmarker, der mitwandert. Der CHANGELOG braucht einen
  Eintrag mit Adopter-Migration.
- Die wechselseitigen Rück-Links (`Ergänzt durch:` in
  [0001](0001-synthese-zweier-quellen.md) und
  [0007](0007-praezisierungen-aus-dem-review.md)) werden **bei Annahme**
  gesetzt, nicht schon beim Vorschlag — ein abgelehnter Vorschlag soll keine
  Spuren in fremden Artefakten hinterlassen.
- Die Ablehnungen aus Gruppe B und C sind der eigentliche Wert dieser Datei:
  Sie halten fest, **warum** wir etwas nicht übernehmen, damit eine spätere
  Nachlese bei v2.20 nicht dieselben fünfzehn ADRs erneut wägt. Zwei Punkte
  sind ausdrücklich nur vertagt, nicht verworfen: die abgeleiteten Sichten
  (ADR-0034/0038), sobald Pläne existieren, und der Adopter-Update-Pfad,
  sobald ein zweites Projekt denkspur nutzt.
- Der Abgleich hat einen Fehler in unserer eigenen Attribution aufgedeckt
  (falscher Rechteinhaber, veraltete URL); er ist separat korrigiert und im
  Logbuch vermerkt. Er gehört nicht in diese Entscheidung, weil er keine
  Methodenfrage ist, sondern eine Tatsachenkorrektur.

## Nicht Teil dieser Entscheidung

- **Konformitäts-Check fürs Übersichts-Skript** (aus ihrer Idee 0033
  abgeleitet: Nummern-Dubletten, Titel-zu-Dateiname-Abgleich, tote
  Querverweise). Eigene Idee, eigener ADR.
- **Abgeleitete Sichten in der Übersicht** (ADR-0034/0038). Vertagt, bis Pläne
  existieren.
- **Adopter-Update-Pfad** (ADR-0031). Eigenes Vorhaben.
- **Familien-Präfix in der Entscheidungs-Überschrift.** Unsere H1 lautet
  `# 0001: Titel`, während Ideen und Pläne ein Präfix tragen (`# Idee 0001:`,
  `# Plan 0001:`). Ihr ADR-0028 argumentiert, ein aus dem Kontext gerissener
  Titel solle sich selbst beschreiben. Der Befund stimmt, die Änderung ist
  aber ein mechanischer Sweep über alle Entscheidungen plus eine Anpassung des
  Übersichts-Skripts — sauberer als eigener Punkt.
