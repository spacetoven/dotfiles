#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/colorblocks"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
#polybar -q main -c "$DIR"/config.ini &
#polybar -q secondary -c $"DIR"/config.ini &


#launch_bar() {
#	killall -q polybar
#	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#
#	if [[ "$style" == "hack" || "$style" == "cuts" ]]; then
#		polybar -q top -c "$dir/$style/config.ini" &
#	elif [[ "$style" == "pwidgets" ]]; then
#		bash "$dir"/pwidgets/launch.sh --main
#
#	else
		#👇 👉 launching multiple monitors --> make sure to add monitor = ${env:MONITOR:} in the config
if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  		    MONITOR=$m polybar --reload -q main -c "$DIR/config.ini" &
		    MONITOR=$m polybar --reload -q secondary -c "$DIR/config.ini" &
		    MONITOR=$m polybar --reload -q third -c "$DIR/config.ini" &
		
#MONITOR=$m polybar --reload main -c "$DIR"/config.ini & 
		   	 done
  		else
			 polybar --reload -q main -c "$DIR/config.ini" &
			 polybar --reload -q secondary -c "$DIR/config.ini" & 
			 polybar --reload -q third -c "$DIR/config.ini" &
fi


