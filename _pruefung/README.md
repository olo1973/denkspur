# Prüfmaterial für den Konformitäts-Check

Dieser Ordner enthält **absichtlich kaputte Artefakte**. Er ist kein Teil der
Spur dieses Repos: `uebersicht-generieren` mit `-Pfad .` sieht ihn nie (das
Skript liest nur `ideen/`, `entscheidungen/` und `plaene/` direkt unter dem
angegebenen Pfad).

`fixture/` ist die geteilte Testsammlung aus
[Entscheidung 0012](../entscheidungen/0012-konformitaets-check-pruefmodus.md):
Jede der fünf Prüfungen wird mindestens einmal ausgelöst, dazu einige
Kontrollfälle, die **nicht** anschlagen dürfen (externer Link, reiner Anker,
`abgelehnt` bei Prüfung 5).

Parität nachweisen — beide Prüfer müssen dieselben Befunde melden:

```powershell
./starter/skripte/uebersicht-generieren.ps1 -Pfad _pruefung/fixture -Pruefen
```

```bash
./starter/skripte/uebersicht-generieren.sh _pruefung/fixture -Pruefen
```

Beide enden mit Exit-Code 1 und melden dieselben sechs Befunde. Zur Kontrolle
liegt die erwartete Ausgabe in [`erwartete-befunde.txt`](erwartete-befunde.txt);
verifiziert unter Windows PowerShell 5.1, pwsh 7 und Bash (Stand 2026-07-18).

Die Fixture bleibt bewusst in diesem Repo und wandert **nicht** in `starter/` —
Adopter erben den Prüfmodus, nicht das Testmaterial.
