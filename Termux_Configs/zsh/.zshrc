HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

eval "$(zoxide init zsh)"

autoload -Uz compinit

compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

zstyle ':completion:*' menu select

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source <(fzf --zsh)

source "$ZDOTDIR/fzf.zsh"

source "$ZDOTDIR/aliases.zsh"

source "$ZDOTDIR/plugins.zsh"

source "$ZDOTDIR/prompt.zsh"

source "$ZDOTDIR/cd_on_quit.zsh"

clear
toilet -f future -F metal -F border "Albert is Here!"

# opencode
export PATH=/home/the_pyro_warrior/.opencode/bin:$PATH
