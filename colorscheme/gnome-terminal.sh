#!/usr/bin/env bash

# Overwrites current Gnome-Terminal Colorscheme
# It toggles between light and dark scheme

[[ -z "$DCONF" ]] && DCONF=dconf

dset() {
    local key="$1"; shift
    local val="$1"; shift

    if [[ "$type" == "string" ]]; then
        val="'$val'"
    fi

    "$DCONF" write "$PROFILE_KEY/$key" "$val"
}

# because dconf still doesn't have "append"
dlist_append() {
    local key="$1"; shift
    local val="$1"; shift

    local entries="$(
        {
            "$DCONF" read "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
            echo "'$val'"
        } | head -c-1 | tr "\n" ,
    )"

    "$DCONF" write "$key" "[$entries]"
}

LIGHT_PALETTE="['#eeeeee', '#af0000', '#008700', '#5f8700', '#0087af', '#878787', '#005f87', '#444444', '#bcbcbc', '#d70000', '#d70087', '#8700af', '#d75f00', '#d75f00', '#005faf', '#005f87']"
LIGHT_FG="#005f87"
LIGHT_BG="#eeeeee"

DARK_PALETTE="['#1c1c1c', '#af005f', '#5faf00', '#d7af5f', '#5fafd7', '#808080', '#d7875f', '#d0d0d0', '#585858', '#5faf5f', '#afd700', '#af87d7', '#ffaf00', '#ff5faf', '#00afaf', '#5f8787']"
DARK_FG="#c6c6c6"
DARK_BG="#1c1c1c"

# Newest versions of gnome-terminal use dconf
if which "$DCONF" > /dev/null 2>&1; then
    
    PROFILE_SLUG=`$DCONF read /org/gnome/terminal/legacy/profiles:/default | tr -d \'`
    PROFILE_KEY="/org/gnome/terminal/legacy/profiles:/:$PROFILE_SLUG"

    CURRENT_FG=`$DCONF read $PROFILE_KEY/foreground-color`

    if [[ "$CURRENT_FG" == "'$LIGHT_FG'" ]]; then

        $DCONF write $PROFILE_KEY/palette "$DARK_PALETTE"
        $DCONF write $PROFILE_KEY/foreground-color "'$DARK_FG'"
        $DCONF write $PROFILE_KEY/background-color "'$DARK_BG'"

    else

        $DCONF write $PROFILE_KEY/palette "$LIGHT_PALETTE"
        $DCONF write $PROFILE_KEY/foreground-color "'$LIGHT_FG'"
        $DCONF write $PROFILE_KEY/background-color "'$LIGHT_BG'"

    fi

fi
