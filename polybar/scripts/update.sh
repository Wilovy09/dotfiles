pendiente=$(checkupdates | wc -l)

if [[ $pendiente -eq 0 ]]; then
    echo "%{F#9E9E9E}OK %{F#FFFFFF}"
else
    echo "%{F#9E9E9E}ACT %{F#FFFFFF}$pendiente"
fi