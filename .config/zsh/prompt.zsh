# requires https://crates.io/crates/spat to print directory names

# enable substitution in the prompts
setopt PROMPT_SUBST
# load neccessary built-in functions
autoload -Uz colors vcs_info

shorten_cwd() {
    local cwd="$(print -P '%~')"
    echo "$(spat ${cwd})"
}

arrow="${PROMPT_ARROW:-❱ }"

export PROMPT='%(?.%F{green}$arrow%f.%F{red}%? $arrow%f)'

# update version control information before prompt is rendered
precmd_functions+=( vcs_info )

# display current git branch and staging status
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" check-for-changes true
zstyle ":vcs_info:*" unstagedstr " *"
zstyle ":vcs_info:*" stagedstr " +"
zstyle ":vcs_info:git:*" formats " ⇒ %b%F{yellow}%u%c%f"

export RPROMPT='%F{magenta}$(shorten_cwd)%f%F{cyan}${vcs_info_msg_0_}%f'
