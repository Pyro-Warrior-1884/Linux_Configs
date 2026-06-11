set -e

echo "=== Updating packages ==="
pkg update -y
pkg upgrade -y

echo "=== Installing required packages ==="
pkg install -y fzf zoxide bat eza toilet curl ripgrep git msmtp fastfetch lazygit mandoc mutt

echo "=== Installing Starship ==="
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "=== Backing up .bashrc ==="
cp ~/.bashrc ~/.bashrc.backup_$(date +%F_%H%M%S)

echo "=== Configuring shell ==="

grep -qxF 'eval "$(zoxide init bash)"' ~/.bashrc || \
    echo 'eval "$(zoxide init bash)"' >> ~/.bashrc

grep -qxF 'eval "$(starship init bash)"' ~/.bashrc || \
    echo 'eval "$(starship init bash)"' >> ~/.bashrc

cat <<'EOF' >> ~/.bashrc

alias cls='clear'
alias lss='eza -lah'

EOF

echo 'clear' >> ~/.bashrc
echo 'toilet -f future -F metal -F border "Albert is Here!"' >> ~/.bashrc

echo "=== Done! Reloading shell ==="
source ~/.bashrc

echo "Setup complete."
echo "Restart the terminal if needed."
