set -e

echo "=== Updating packages ==="
pkg update -y
pkg upgrade -y

echo "=== Installing required packages ==="

while IFS= read -r package; do
    [[ -z "$package" || "$package" == \#* ]] && continue

    echo "Installing: $package"
    pkg install -y "$package"
done < "$HOME/packages"

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
