# apt
# alias ac="apt autoclean"
# alias aun="apt autoremove"

# grep
alias grep="grep --color"
alias egrep="grep -E --color"
alias fgrep="grep -F --color"

# git
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gs="git status"
alias gch="git checkout"
alias gcl="git clone"
alias gpu="git pull"

# lsd
alias l="lsd -l"

# pkg
# alias i="pkg i"
# alias u="pkg up"
# alias un="pkg un"

# python
alias py="python"

activate() {
    local script="$(pwd)/.venv/bin/activate"
    if [ -f "$script" ]; then
        source "$script"
        echo "Venv loaded"
    else
        echo "No venv found in current directory"
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
