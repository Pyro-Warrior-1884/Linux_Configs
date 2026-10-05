alias lss='eza -la'
alias ll='eza -lh --icons --git'
alias la='eza -lah --icons --git'
alias tree='eza --tree --icons'

compdef eza=ls

alias bat='bat --paging=never'

mkcd() {
    mkdir -p "$1" && cd "$1"
}

alias zterm='zellij'

alias opencode='env -u LD_PRELOAD LD_LIBRARY_PATH="$HOME/.opencode" "$HOME/.opencode/ld-musl-aarch64.so.1" "$HOME/.opencode/opencode"'

if command -v fdfind >/dev/null 2>&1; then
    alias fd='fdfind'
fi

alias diff='diff --color=auto'
alias df='df -h'
