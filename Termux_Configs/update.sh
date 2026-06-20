#!/data/data/com.termux/files/usr/bin/bash

DEST="$HOME/storage/downloads/termux-backup"
REPO_DEST="$HOME/HQ/Codes/Linux_Configs/Termux_Configs"
REPO="$HOME/HQ/Codes/Linux_Configs"

mkdir -p "$DEST"
mkdir -p "$REPO_DEST"

problem_occurred=0

FILEZ="$HOME/filez"

mapfile -t ITEMS < "$FILEZ"

for item in "${ITEMS[@]}"; do
    eval "item=\"$item\""

    if [ -e "$item" ]; then
        rsync -a --update "$item" "$DEST/" || problem_occurred=1
        rsync -a --update "$item" "$REPO_DEST/" || problem_occurred=1
    else
        problem_occurred=1
    fi
done

if [ -e "$HOME/.ssh" ]; then
    cp -rf "$HOME/.ssh" "$DEST/" || problem_occurred=1
else
    problem_occurred=1
fi

cd "$REPO" || {
    echo "Successfully pushed with complications."
    exit 1
}

git add -A || problem_occurred=1

if ! git diff --cached --quiet; then
    git commit -m "feat: updated termux config files" || problem_occurred=1
    git push || problem_occurred=1
fi

if [ "$problem_occurred" -eq 0 ]; then
    echo "Successfully pushed."
else
   echo "Successfully pushed with complications."
fi
