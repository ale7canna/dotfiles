STEP=$(xbacklight | awk '{print int(($1+0.5+3)/3)}')

if [ $1 = "inc" ]; then
    xbacklight -inc $STEP
else
    xbacklight -dec $STEP
fi

xbacklight | cut -d'.' -f 1 > /home/ale7canna/.config/brightness
killall -USR1 i3status
