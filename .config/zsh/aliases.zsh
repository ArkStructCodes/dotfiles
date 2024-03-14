# grep
alias grep="grep --color"
alias egrep="grep -E --color"
alias fgrep="grep -F --color"

# lsd
alias l="lsd -l"

# python
alias py="python"

d() {
    local dst="$(fd . --absolute-path --type directory | fzf)"
    [[ -z $dst ]] || cd $dst
}

activate() {
    local script="${1:-$(pwd)}/.venv/bin/activate"
    if [[ -f $script ]]; then
        echo "loading virtual enviroment..."
        source $script
    else
        echo "no .venv directory found"
    fi
}
