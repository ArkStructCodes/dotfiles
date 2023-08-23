# DEPENDENCY: https://github.com/FernOfSigma/spat
# ===============================================

# %b         => The current VCS branch.
# %F{x}...%f => Change the foreground color of the text to x.
# %xv        => Access the x-th item of the 'psvar' array.


# Enable parameter expansion, command substitution, and arithmetic
# expansion in prompts.
setopt PROMPT_SUBST

# Load necessary built-in functions.
autoload -Uz add-zsh-hook vcs_info

zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" formats " ⇒ %b"

_prompt_shorten_cwd() {
    local cwd="$(print -P '%~')"
    psvar[10]="$(spat ${cwd})"
}

_prompt_vcs_branch() {
    vcs_info
    psvar[11]="$vcs_info_msg_0_"
}

# Execute these functions before reading every command.
add-zsh-hook precmd _prompt_shorten_cwd
add-zsh-hook precmd _prompt_vcs_branch

# Apply the new prompts.
PROMPT="%(?.%F{10}〉%f.%F{9}%? 〉%f)"
RPROMPT="%F{13}%10v%f%F{12}%11v%f"
