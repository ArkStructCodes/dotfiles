# Load plugins using 'sheldon' plugin manager.
eval "$(sheldon source)"

# CONFIG
# ======

source "${ZDOTDIR}/core/aliases.zsh"
source "${ZDOTDIR}/core/options.zsh"
source "${ZDOTDIR}/core/params.zsh"
source "${ZDOTDIR}/prompt.zsh"

ensure_file "${HISTFILE}"
ensure_dir  "${XDG_CACHE_HOME}/zsh"

# Enable the completion cache.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${COMPCACHE}"

# Highlight completion menu items.
zstyle ':completion:*' menu select

# Load completions.
autoload -Uz compinit; zsh-defer compinit -d "${COMPFILE}"
