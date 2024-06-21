#!/bin/bash

destino="/home/wilovy/dotfiles/"

helix="/home/wilovy/.config/helix"
if [ -d "$helix" ]; then
  cp -r "$helix" "$destino"
  echo "Helix copiado"
else
  echo "Helix no se pudo copiar"
fi

kitty="/home/wilovy/.config/HyprV/kitty"
if [ -d "$kitty" ]; then
  cp -r "$kitty" "$destino"
  echo "Kitty copiado"
else
  echo "No se pudo copiar Kitty"
fi

waybar="/home/wilovy/.config/HyprV/waybar"
if [ -d "$waybar" ]; then
  cp -r "$waybar" "$destino"
  echo "waypbar copiado"
else
  echo "No se pudo copiar waybar"
fi

superfile="/home/wilovy/.config/superfile"
if [ -d "$superfile" ]; then
  cp -r "$superfile" "$destino"
  echo "Superfile copiado"
else
  echo "No se pudo copiar Superfile"
fi

zshconf="/home/wilovy/.zshrc"
cp -r "$zshconf" "$destino"
echo "ZSHrc copiado"

