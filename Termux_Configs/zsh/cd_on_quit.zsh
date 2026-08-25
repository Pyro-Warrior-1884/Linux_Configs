spf() {
    local last_dir="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"

    export SPF_LAST_DIR="$last_dir"

    mkdir -p "$(dirname "$SPF_LAST_DIR")"

    command spf "$@"

    if [ -f "$SPF_LAST_DIR" ]; then
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" >/dev/null 2>&1
    fi
}
