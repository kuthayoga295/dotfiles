#!/bin/bash
BRIGHTNESS_VALUE=`brightnessctl | grep -o "(.*" | tr -d "()"`
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%}

if [ $BRIGHTNESS_NR -lt 26 ]; then
	BRIGHTNESS_ICON='%{F#20639B}󰃞%{F-}'
elif [ $BRIGHTNESS_NR -lt 51 ]; then
	BRIGHTNESS_ICON='%{F#3CAEA3}󰃟%{F-}'
elif [ $BRIGHTNESS_NR -lt 76 ]; then
	BRIGHTNESS_ICON='%{F#F6D55C}󰃠%{F-}'
else
	BRIGHTNESS_ICON='%{F#ED553B}󰃠%{F-}'
fi

echo "$BRIGHTNESS_ICON $BRIGHTNESS_VALUE"

