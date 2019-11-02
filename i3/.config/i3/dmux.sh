#!/usr/bin/env sh

# a dmenu prompt to start tmux sessions
# it lists existing sessions, you can attach to
# or start a new one (which is default, if none existing)

sessions=$(tmux ls)

chosen="$(printf "[start new session]\n%s$sessions" | rofi -dmenu -p "tmux")"

if [ "$chosen" = "" ]; then

    exit

elif [ "$chosen" = "[start new session]" ]; then

    st tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf

else

    name=$(echo $chosen | cut -d":" -f1)
    echo $name
    st tmux attach -t $name

fi
