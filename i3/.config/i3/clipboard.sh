#!/bin/bash

PRI=`xclip -o -selection p`
if [ `echo $PRI | wc -c` -gt 1 ]; then
    if [ `echo $PRI | wc -c` -gt 43 ]; then
        notify-send "Primary" "${PRI:0:40}..."
    else 
        notify-send "Primary" "$PRI"
    fi
fi

SEC=`xclip -o -selection s`
if [ `echo $SEC | wc -c` -gt 1 ]; then
    if [ `echo $SEC | wc -c` -gt 43 ]; then
        notify-send "Secondary" "${SEC:0:40}..."
    else
        notify-send "Secondary" "$SEC"
    fi
fi

CLI=`xclip -o -selection c`
if [ `echo $CLI | wc -c` -gt 1 ]; then
    if [ `echo $CLI | wc -c` -gt 43 ]; then
        notify-send "Clipboard" "${CLI:0:40}..."
    else
        notify-send "Clipboard" "$CLI"
    fi
fi
