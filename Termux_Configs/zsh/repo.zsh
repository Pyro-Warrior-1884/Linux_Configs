Repo() {
    
    if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
        cat <<'EOF'
Repo - Interactive GitHub Repository Manager

USAGE
    Repo
    Add this to your respective .zshrc to use this function

DESCRIPTION
    Browse your GitHub repositories using fzf.

    • If the selected repository is already cloned:
        - Open the local repository
        - Change into it

    • If the selected repository is not cloned:
        - Clone it into $GITHUB_PATH
        - Change into it

REQUIREMENTS
    git
    curl
    jq
    fzf
    zsh

ENVIRONMENT VARIABLES
    GITHUB_PATH
        Directory where repositories are stored.

    GITHUB_TOKEN
        GitHub Personal Access Token (PAT).

EXAMPLES
    Repo
    Repo --help
    Repo --version
EOF
        return
    fi

    if [[ "${1:-}" == "-v" || "${1:-}" == "--version" ]]; then
        echo "Repo v1.0.0"
        return
    fi

    : "${GITHUB_PATH:?Environment variable GITHUB_PATH is not set}"
    : "${GITHUB_TOKEN:?Environment variable GITHUB_TOKEN is not set}"

    mkdir -p "$GITHUB_PATH"

    local repos selected repo

    repos=$(
        curl -fsSL \
            -H "Authorization: Bearer $GITHUB_TOKEN" \
            -H "Accept: application/vnd.github+json" \
            "https://api.github.com/user/repos?per_page=100&sort=updated" |
        jq -r '.[].full_name'
    )

    if [[ -z "$repos" ]]; then
        echo "No repositories found."
        return 1
    fi

    selected=$(
        echo "$repos" | fzf \
            --prompt="Repository > " \
            --height=40% \
            --reverse \
            --border
    )

    [[ -z "$selected" ]] && return 0

    repo=$(basename "$selected")

    if [[ -d "$GITHUB_PATH/$repo" ]]; then
        echo
        echo "Repository already exists."
        echo "Opening..."
        cd "$GITHUB_PATH/$repo"
        return
    fi

    echo
    echo "Cloning..."

    if git -C "$GITHUB_PATH" clone "git@github.com:$selected.git"; then
        echo
        echo "Done."
        cd "$GITHUB_PATH/$repo"
    else
        echo "Clone failed."
        return 1
    fi
}
