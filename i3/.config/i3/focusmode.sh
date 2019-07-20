gaps=`i3-msg -t get_tree | jq 'recurse(.nodes[]) | select(.type=="workspace") | { ws: ., con: recurse(.nodes[]) | select(.focused) } | .ws.gaps.inner'`

if [ "$gaps" -le 0 ]; then
    i3-msg gaps inner current set 200
    i3-msg gaps left current set 200
    i3-msg gaps right current set 200
else
    i3-msg gaps inner current set 20
    i3-msg gaps left current set 0
    i3-msg gaps right current set 0
fi
