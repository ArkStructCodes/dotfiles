# apt
alias i="apt install"
alias ac="apt autoclean"
alias un="apt remove"
alias aun="apt autoremove"

# grep
alias grep="grep --color"
alias egrep="grep -E --color"
alias fgrep="grep -F --color"

# lsd
alias l="lsd -l"

# python
alias py="python"

activate() {
    local script="${1:-$(pwd)}/.venv/bin/activate"
    if [[ -f $script ]]; then
        echo "Loading venv..."
        source $script
    else
        echo "No venv found in the given directory"
    fi
}

ensure_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
		echo "Created directory: ${1}"
    fi
}

ensure_file() {
    if [ ! -f "$1" ]; then
        ensure_dir "$(dirname ${1})"
        touch "$1"
		echo "Created file: ${1}"
    fi
}
