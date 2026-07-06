---
typ: entscheidung
status: angenommen
datum: 2026-07-06
tags: [format, review]
---

# 0005: Einheitliches Frontmatter für alle Dokumente

## Kontext

Review-Befund 7: Das Repo führte zwei Metadaten-Dialekte nebeneinander —
Spur-Artefakte mit `typ`/`status`/`datum`, Inhaltsnotizen mit
`titel`/`typ`/`status`/`owner`/`stand`. Dasselbe Konzept hieß einmal `datum`
und einmal `stand`; der Titel stand mal im Frontmatter, mal nur in der
Überschrift. Die Synthese hatte die Konventionen ihrer beiden Quellen
nebeneinandergelegt statt vereinheitlicht — ein Agent, der beide parsen
soll, braucht zwei Codepfade, und nichts erklärte den Unterschied.

## Erwogene Optionen

1. **Ein Feldsatz für alle Dokumente, `titel` entfällt (gewählt).**
2. Zwei dokumentierte Dialekte (Spur vs. Inhalt) beibehalten und begründen.
   Verworfen: Die Begründung wäre ehrlich, aber die zwei Codepfade blieben —
   der eigentliche Schaden.
3. Alles ins Frontmatter, inklusive `titel` überall. Verworfen: Der Titel
   stünde doppelt (Frontmatter und H1) und driftete — Verstoß gegen
   Zusage 2 (eine Wahrheit, ein Ort).

## Entscheidung

Für **jedes** Markdown-Dokument mit Frontmatter gilt derselbe Feldsatz:

| Feld | Pflicht | Bedeutung |
|---|---|---|
| `typ` | ja | Dokumentart (`idee`, `entscheidung`, `plan`, `notiz`, `analyse`, `uebersicht`, …) |
| `status` | ja | Reifegrad (Spur: Lebenslauf-Status; Inhalte: `entwurf`/`in-pruefung`/`final`) |
| `datum` | ja | das maßgebliche Datum: bei Spur-Artefakten die Entstehung, bei lebenden Dokumenten der letzte Stand |
| `owner` | Team ja, solo optional | wer pflegt das |
| `tags` | optional | Themenwörter |

`titel` und `stand` entfallen: Der Titel wohnt allein in der H1-Überschrift
(dort lesen ihn Mensch, GitHub und die Übersicht-Skripte ohnehin), `stand`
geht in `datum` auf.

## Konsequenzen

- Ein Parser-Codepfad für alle Dokumente; die Übersicht-Skripte bleiben
  unverändert (sie lasen bereits H1 und `datum`).
- Alle Dateien und Vorlagen dieses Repos werden angepasst.
- Adopter-Migration: Vorlagen übernehmen; in Bestandsdateien `stand:` →
  `datum:` umbenennen und `titel:` streichen — bei Gelegenheit, nicht als
  Pflicht-Massenedit (siehe CHANGELOG v1.2).
