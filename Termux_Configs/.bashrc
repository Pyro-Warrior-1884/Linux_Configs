eval "$(zoxide init bash)"
eval "$(starship init bash)"

alias cls='clear'
alias lss='eza -lah'
alias lg='lazygit'
alias mail='neomutt'
alias genp='openssl rand -base64 24'

source ~/.secrets

clear
toilet -f future -F metal -F border "Albert is Here!"
