#!/bin/sh


case "$1" in
    lock)
        #slimlock
        /home/dlag/apksManual/i3lock-multimonitor/lock -i /home/dlag/pics/redhatWallpaper.png
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
