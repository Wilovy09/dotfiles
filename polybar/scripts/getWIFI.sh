ssid=$(iw dev | grep -o 'ssid .*' | awk '{print $2}')
echo "$ssid"
