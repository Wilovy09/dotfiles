echo "    Se mostraran las redes disponibles"
nmcli dev wifi

echo "INGRESA SSID: "
read ssid

echo "    Ahora ingresa la contraseña de la red $ssid"
echo "Contraseña: "
read pass

echo "    Conectando a la red $ssid con la contraseña $pass"
nmcli dev wifi connect "$ssid" password $pass