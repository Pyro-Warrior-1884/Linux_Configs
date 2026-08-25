export ZDOTDIR="$HOME/.config/zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR="vim"
export VISUAL="vim"

# ---------- Pager ----------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
export PATH="$HOME/.local/bin:$PATH"

export PACKAGE="$HOME/HQ/Codes/Linux_Configs/Termux_Configs/packages"
export PHONE="$HOME/storage/shared/Notes"
