ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"

_zplugin_load() {
    local repo="${1}/${2}"
    local plugin_path="${ZPLUGINDIR}/${2}"

    # Clone if the plugin isn't actually installed
    if [[ ! -d "$plugin_path/.git" ]]; then
        echo "Installing ${2}..."

        rm -rf "$plugin_path"
        mkdir -p "$ZPLUGINDIR"

        git clone --depth=1 "https://github.com/${repo}" "$plugin_path" ||
            {
                echo "ERROR: failed to install ${repo}" >&2
                return 1
            }
    fi

    # Load the correct plugin entry point
    case "$2" in
        fast-syntax-highlighting)
            source "$plugin_path/fast-syntax-highlighting.plugin.zsh"
            ;;
        zsh-autosuggestions)
            source "$plugin_path/zsh-autosuggestions.zsh"
            ;;
        zsh-history-substring-search)
            source "$plugin_path/zsh-history-substring-search.zsh"
            ;;
        zsh-vi-mode)
            source "$plugin_path/zsh-vi-mode.plugin.zsh"
            ;;
        *)
            echo "Unknown plugin: $2" >&2
            return 1
            ;;
    esac
}

zplugin-update() {
    local dir

    for dir in "${ZPLUGINDIR}"/*/; do
        [[ -d "$dir/.git" ]] || continue

        echo "Updating ${dir:t}..."
        git -C "$dir" pull --ff-only
    done
}

_zplugin_load zdharma-continuum fast-syntax-highlighting
_zplugin_load zsh-users zsh-autosuggestions
_zplugin_load zsh-users zsh-history-substring-search
_zplugin_load jeffreytse zsh-vi-mode

zvm_after_init() {
    bindkey '^R' fzf-history-widget

    bindkey '^[^[[C' forward-word
    bindkey '^[^[[D' backward-word

    bindkey '^F' _fzf_file_no_hidden

    bindkey '^A' autosuggest-toggle

    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
}
