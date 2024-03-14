# this script requires spat
# documentation: https://docs.rs/crate/spat/latest

autoload -U add-zsh-hook colors vcs_info

# set the current git branch as the VCS message
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" formats " ⇒ %b"

_prompt_shorten_cwd() {
    local cwd="$(print -P '%~')"
    psvar[1]="$(spat ${cwd})"
}

_prompt_vcs_branch() {
    vcs_info
    psvar[2]="$vcs_info_msg_0_"
}

add-zsh-hook precmd _prompt_shorten_cwd
add-zsh-hook precmd _prompt_vcs_branch

# ternary    => %(condition.if.else)
# last error => %?
# text color => %F{color}...%f
# psvar item => %nv
PROMPT="%(?.%F{green}〉 %f.%F{red}%? 〉 %f)"
RPROMPT="%F{magenta}%1v%f%F{cyan}%2v%f"
