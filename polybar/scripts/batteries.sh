#!/bin/bash

if [ -e "/sys/class/power_supply/BAT1/capacity" ]; then
    battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
else
    echo "NO BATERIA"
fi

is_plugged=$(cat /sys/class/power_supply/AC/online)

if [ "$is_plugged" == "0" ]; then

    if [ "$battery_level" -le 15 ]; then
        icon="%{F#9E9E9E}bateria %{F#FFFFFF}"
    elif [ "$battery_level" -le 25 ]; then
        icon="%{F#9E9E9E}bateria %{F#FFFFFF}"
    elif [ "$battery_level" -le 60 ]; then
        icon="%{F#9E9E9E}bateria %{F#FFFFFF}"
    elif [ "$battery_level" -le 90 ]; then
        icon="%{F#9E9E9E}bateria %{F#FFFFFF}"
    else
        icon="%{F#9E9E9E}bateria %{F#FFFFFF}"
    fi
elif [ "$is_plugged" == "1" ]; then
    if [ "$battery_level" -le 15 ]; then
        icon="%{F#9E9E9E}CARGANDO %{F#FFFFFF}"
    elif [ "$battery_level" -le 25 ]; then
        icon="%{F#9E9E9E}CARGANDO %{F#FFFFFF}"
    elif [ "$battery_level" -le 60 ]; then
        icon="%{F#9E9E9E}CARGANDO %{F#FFFFFF}"
    elif [ "$battery_level" -le 90 ]; then
        icon="%{F#9E9E9E}CARGANDO %{F#FFFFFF}"
    else
        icon="%{F#9E9E9E}CARGADA %{F#FFFFFF}"
    fi
else
    icon="%{F#9E9E9E}BATERIA %{F#FFFFFF}"

fi

echo "$icon $battery_level%"
