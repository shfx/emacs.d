#!/bin/zsh

export EMACS_SOCKET_NAME="$HOME/.emacs.d/sockets/server"

function _emacsfun {
    local cmd frames

    # Check if there are any active frames
    case "$*" in
        *-t*|*-nw*) cmd="(memq 't (mapcar 'framep (frame-list)))" ;;
        *) cmd="(delete 't (mapcar 'framep (frame-list)))" ;;
    esac

    # Check if there are suitable frames
    frames="$(emacsclient -n -e "$cmd" 2>/dev/null |sed 's/.*\x07//g')"

    # Only create another X frame if there isn't one present
    if [ -z "$frames" ] || [ "$frames" = nil ]; then
        emacsclient -a "" -c "$@"
        return $?
    fi

    emacsclient -a "" "$@"
}

function emacs {
    if [ $# -ge 1 ] && [ "$1" = "-" ]; then
        shift
        tempfile="$(mktemp --tmpdir "emacs-stdin-$USERNAME.XXXXXXX" 2>/dev/null)"
        cat - > "$tempfile"
        _emacsfun  --eval "(find-file \"$tempfile\")" \
            --eval '(set-visited-file-name nil)' \
            --eval '(rename-buffer "*stdin*" t))' \
            "$@" > /dev/null
    else
        _emacsfun "$@"
    fi
}
