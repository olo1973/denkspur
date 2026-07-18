#!/usr/bin/env bash
# Generiert uebersicht.md deterministisch aus den Artefakt-Koepfen
# (siehe methode/03-lebenslauf.md, Abschnitt 3.4) oder prueft die Spur auf
# Konformitaet (Entscheidung 0012). Aufruf:
#   ./skripte/uebersicht-generieren.sh          # im Projekt-Root
#   ./skripte/uebersicht-generieren.sh <dir>
#   ./skripte/uebersicht-generieren.sh -Pruefen # schreibt nichts, meldet Befunde
set -euo pipefail

PFAD="."
PRUEFEN=0
for arg in "$@"; do
    case "$arg" in
        -Pruefen|--pruefen) PRUEFEN=1 ;;
        *) PFAD="$arg" ;;
    esac
done

# Erlaubte Statuswerte je Familie (Pruefung 4).
familien_status() {
    case "$1" in
        ideen)          printf 'keim|befördert|verworfen' ;;
        entscheidungen) printf 'vorgeschlagen|angenommen|abgelehnt' ;;
        plaene)         printf 'entwurf|aktiv|fertig|abgebrochen' ;;
    esac
}

# Einziger Parser fuer beide Modi (Entscheidung 0012): setzt A_* aus einer Datei.
parse_datei() {
    local f="$1"
    A_NR="$(basename "$f" | cut -c1-4)"
    A_STATUS="$(sed -n 's/^status:[[:space:]]*//p' "$f" | head -1)"
    A_DATUM="$(sed -n 's/^datum:[[:space:]]*//p' "$f" | head -1)"
    A_TAGS="$(sed -n 's/^tags:[[:space:]]*\[\(.*\)\]/\1/p' "$f" | head -1)"
    A_KOPF="$(sed -n 's/^# //p' "$f" | head -1)"
    A_TITEL="$(printf '%s' "$A_KOPF" | sed 's/^\(\(Idee\|Plan\) \)\{0,1\}[0-9]\{4\}: //')"
    A_TITELNR="$(printf '%s' "$A_KOPF" | sed -n 's/^\(\(Idee\|Plan\) \)\{0,1\}\([0-9]\{4\}\): .*/\3/p')"
    A_ABSCHNITTE="$(sed -n 's/^## //p' "$f" || true)"
    A_LINKS="$(grep -oE '\]\([^)]+\)' "$f" | sed 's/^](//; s/)$//' || true)"
}

tabelle() {
    local ordner="$1" zeilen="" f
    for f in "$PFAD/$ordner"/[0-9][0-9][0-9][0-9]-*.md; do
        [ -e "$f" ] || continue
        parse_datei "$f"
        zeilen+="| [$A_NR]($ordner/$(basename "$f")) | $A_TITEL | $A_STATUS | $A_DATUM | $A_TAGS |"$'\n'
    done
    [ -n "$zeilen" ] || zeilen="| - | (noch keine) | | | |"$'\n'
    printf '%s' "$zeilen"
}

# --- Pruefmodus: schreibt nichts, sammelt Befunde -------------------------

status_erlaubt() { # $1 = Statuswert, $2 = erlaubte Werte, pipe-getrennt
    case "|$2|" in *"|$1|"*) return 0 ;; esac
    return 1
}

pruefen() {
    local befunde="" n_befunde=0 anzahl=0
    local familie f rel lauf_nr lauf_erste erlaubt l ziel soll dir
    for familie in ideen entscheidungen plaene; do
        lauf_nr=""; lauf_erste=""
        erlaubt="$(familien_status "$familie")"
        for f in "$PFAD/$familie"/[0-9][0-9][0-9][0-9]-*.md; do
            [ -e "$f" ] || continue
            parse_datei "$f"
            anzahl=$((anzahl + 1))
            rel="$familie/$(basename "$f")"
            dir="$(dirname "$f")"

            # (1) Nummern-Dubletten innerhalb der Familie
            if [ "$A_NR" = "$lauf_nr" ]; then
                befunde+="$rel: doppelte Nummer $A_NR (auch: $lauf_erste)"$'\n'
                n_befunde=$((n_befunde + 1))
            else
                lauf_nr="$A_NR"; lauf_erste="$rel"
            fi

            # (2) Tote relative Markdown-Links
            while IFS= read -r l; do
                [ -n "$l" ] || continue
                ziel="${l%%#*}"
                [ -n "$ziel" ] || continue
                case "$ziel" in
                    [a-zA-Z]*:*) continue ;;
                esac
                if [ ! -e "$dir/$ziel" ]; then
                    befunde+="$rel: toter Link -> $l"$'\n'
                    n_befunde=$((n_befunde + 1))
                fi
            done <<< "$A_LINKS"

            # (3) Ueberschrift/Nummer stimmt zum Dateinamen
            if [ -z "$A_KOPF" ]; then
                befunde+="$rel: keine Ueberschrift (H1)"$'\n'
                n_befunde=$((n_befunde + 1))
            elif [ -z "$A_TITELNR" ]; then
                befunde+="$rel: Ueberschrift ohne Nummer"$'\n'
                n_befunde=$((n_befunde + 1))
            elif [ "$A_TITELNR" != "$A_NR" ]; then
                befunde+="$rel: Ueberschrift-Nummer $A_TITELNR passt nicht zum Dateinamen $A_NR"$'\n'
                n_befunde=$((n_befunde + 1))
            fi

            # (4) Statuswert stammt aus der eigenen Familie
            if [ -z "$A_STATUS" ]; then
                befunde+="$rel: Status fehlt"$'\n'
                n_befunde=$((n_befunde + 1))
            elif ! status_erlaubt "$A_STATUS" "$erlaubt"; then
                befunde+="$rel: Status '$A_STATUS' gehoert nicht zur Familie $familie"$'\n'
                n_befunde=$((n_befunde + 1))
            elif [ "$familie" = "entscheidungen" ]; then
                # (5) Status <-> Abschnitts-Ueberschrift (abgelehnt bleibt ausgespart)
                soll=""
                [ "$A_STATUS" != "vorgeschlagen" ] || soll="Vorgeschlagene Entscheidung"
                [ "$A_STATUS" != "angenommen" ] || soll="Entscheidung"
                if [ -n "$soll" ] && ! printf '%s\n' "$A_ABSCHNITTE" | grep -qxF "$soll"; then
                    befunde+="$rel: Status '$A_STATUS' verlangt Abschnitt '## $soll'"$'\n'
                    n_befunde=$((n_befunde + 1))
                fi
            fi
        done
    done

    if [ "$n_befunde" -eq 0 ]; then
        echo "Konformitaets-Check: keine Befunde ($anzahl Artefakte geprueft)."
        return 0
    fi
    printf '%s' "$befunde"
    echo "Konformitaets-Check: $n_befunde Befund(e) in $anzahl Artefakten."
    return 1
}

if [ "$PRUEFEN" -eq 1 ]; then
    set +e
    pruefen
    exit $?
fi

# --- Erzeugungsmodus -----------------------------------------------------

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
