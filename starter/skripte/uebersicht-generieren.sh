#!/usr/bin/env bash
# Generiert uebersicht.md deterministisch aus den Artefakt-Koepfen
# (siehe methode/03-lebenslauf.md, Abschnitt 3.4). Aufruf:
#   ./skripte/uebersicht-generieren.sh          # im Projekt-Root
#   ./skripte/uebersicht-generieren.sh <dir>
set -euo pipefail
PFAD="${1:-.}"

tabelle() {
    local ordner="$1" zeilen=""
    local f nr status datum tags titel
    for f in "$PFAD/$ordner"/[0-9][0-9][0-9][0-9]-*.md; do
        [ -e "$f" ] || continue
        nr="$(basename "$f" | cut -c1-4)"
        status="$(sed -n 's/^status:[[:space:]]*//p' "$f" | head -1)"
        datum="$(sed -n 's/^datum:[[:space:]]*//p' "$f" | head -1)"
        tags="$(sed -n 's/^tags:[[:space:]]*\[\(.*\)\]/\1/p' "$f" | head -1)"
        titel="$(sed -n 's/^# \(\(Idee\|Plan\) \)\{0,1\}[0-9]\{4\}: //p' "$f" | head -1)"
        [ -n "$titel" ] || titel="$(sed -n 's/^# //p' "$f" | head -1)"
        zeilen+="| [$nr]($ordner/$(basename "$f")) | $titel | $status | $datum | $tags |"$'\n'
    done
    [ -n "$zeilen" ] || zeilen="| - | (noch keine) | | | |"$'\n'
    printf '%s' "$zeilen"
}

STAND="$(date +%F)"
KOPF="| Nr. | Titel | Status | Datum | Tags |
|---|---|---|---|---|"

cat > "$PFAD/uebersicht.md" <<EOF
# Übersicht

> Generierter Statusindex — wird komplett aus den Artefakt-Köpfen neu
> erzeugt, nie von Hand gepflegt. **Stand: $STAND**

## Ideen

$KOPF
$(tabelle ideen)

## Entscheidungen

$KOPF
$(tabelle entscheidungen)

## Pläne

$KOPF
$(tabelle plaene)
EOF

echo "uebersicht.md regeneriert (Stand: $STAND)"
