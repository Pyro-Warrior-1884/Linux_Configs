eval "$(starship init zsh)"
termux-api-start

pgrep -x mpd >/dev/null || mpd
mpc update >/dev/null 2>&1
