<!-- Vorlage: Projektspezifisches ergänzen, Platzhalter ersetzen. -->

# AGENTS.md — Instruktionen für den KI-Agenten

## Harte Regeln

- <nicht verhandelbare Grenzen dieses Projekts, z. B. „keine echten
  Personendaten in dieses Repo">
- Quellen in `_quellen/` nur lesen, nie verändern.
- Was unklar ist: nachfragen, nicht raten.

## Zweck

<Zweck des Projekts in einem Satz, Verweis auf das Grundlagendokument.>

## Methode: denkspur (Kurzreferenz)

Dieses Projekt folgt [denkspur](https://github.com/olo1973/denkspur).

1. **Freigabe-Modus dieses Projekts: `gespraech`.**
   <!-- Alternativ: `pr-gate` — Agent arbeitet frei auf Feature-Branches,
        die Freigabe ist der PR-Merge. Nie direkt auf dem Hauptzweig. -->
   Im Modus `gespraech`: Vorschlagen jederzeit; Artefakte anlegen, Status
   kippen oder umsetzen nur nach ausdrücklicher Freigabe — vorher die
   Reichweite der Freigabe benennen. Freigabefrei in beiden Modi: Logbuch,
   `_zwischenstand/`, Übersicht regenerieren.
2. **Lebenslauf:** Idee (`ideen/NNNN-*.md`: keim → befördert/verworfen) →
   Entscheidung als ADR (`entscheidungen/NNNN-*.md`: vorgeschlagen →
   angenommen/abgelehnt) → Plan (`plaene/NNNN-*.md`: entwurf → aktiv →
   fertig/abgebrochen). Vorlagen in `_templates/`.
3. **Nie wegeditieren:** Entschiedenes wird per `Ergänzt:`/`Ersetzt:` durch
   neue ADRs fortgeschrieben, nie umgeschrieben.
4. **Vokabular:** `Eltern-Idee:` · `Befördert zu:`/`Hervorgegangen aus:` ·
   `Ergänzt:`/`Ergänzt durch:` · `Ersetzt:`/`Ersetzt durch:` · `Setzt um:`.
5. **Übersicht per Skript:** `uebersicht.md` nach jeder Spur-Änderung mit
   `skripte/uebersicht-generieren.ps1` (bzw. `.sh`) regenerieren — nie von
   Hand schreiben.
6. **Design-Gate:** Pläne für Vorhaben mit neuer Oberfläche enthalten das
   Gate „Design-Entwurf visuell abgenommen" vor den Umsetzungs-Aufgaben;
   der abgenommene Stand wird als Bild unter `ergebnisse/abnahmen/`
   versioniert und im Plan verlinkt.
7. **Namensregeln:** kleingeschrieben, bindestrich-getrennt, keine
   Umlaute/ß/Leerzeichen in Dateinamen; Querverweise als echte Links.

## Externe Quellen

<!-- Nur ausfüllen, wenn das Projekt von Ordnern außerhalb des Repos abhängt. -->

| Pfad | Inhalt | Repo-relevant? |
|---|---|---|
| <pfad> | <inhalt> | <lesen / Quelle für Ableitung / nicht ins Repo> |

## Befehle

<!-- Bei Code-Projekten: Build, Test, Run — was der Agent sonst raten müsste. -->

---

Methoden-Block oben: abgeleitete Kurzfassung; maßgeblich ist `methode/` im
denkspur-Repo. Vor einem Update dessen CHANGELOG lesen („Adopter-Migration").
denkspur-Stand: **v1.2**
