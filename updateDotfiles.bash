#!/bin/bash

destino="/home/wilovy/dotfiles/"

helix="/home/wilovy/.config/helix"
if [ -d "$helix" ]; then
  cp -r "$helix" "$destino"
  echo "Helix copiado"
else
  echo "Helix no se pudo copiar"
fi

HyprV="/home/wilovy/.config/HyprV"
if [ -d "$HyprV" ]; then
  cp -r "$HyprV" "$destino"
  echo "HyprV copiado"
else
  echo "No se pudo copiar HyprV"
fi

hypr="/home/wilovy/.config/hypr"
if [ -d "$hypr" ]; then
  cp -r "$hypr" "$destino"
  echo "HyprV copiado"
else
  echo "No se pudo copiar hypr"
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

