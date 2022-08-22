# Plugins
# =======

# Load plugins using 'sheldon' plugin manager.
eval "$(sheldon source)"

# Configure plugins.
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#686868"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# Config
# ======

source "${ZDOTDIR}/core/aliases.zsh"
source "${ZDOTDIR}/core/options.zsh"
source "${ZDOTDIR}/core/params.zsh"
source "${ZDOTDIR}/prompt.zsh"

ensure_file "$HISTFILE"
ensure_dir  "${XDG_CACHE_HOME}/zsh"

# Relocate the .zcompdump file from its default location.
local COMPFILE="${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}"
autoload -Uz compinit; compinit -d "$COMPFILE"

# Enable the completion cache.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"

# Highlight completion menu items.
zstyle ':completion:*' menu select

