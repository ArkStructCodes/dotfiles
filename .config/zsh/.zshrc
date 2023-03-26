# Load plugins using the 'sheldon' plugin manager.
eval "$(sheldon source)"

# CONFIG
# ======

# History is saved here when an interactive session ends.
HISTFILE="$XDG_STATE_HOME/zsh/history"

# Increase the maximum number of events stored in history.
HISTSIZE=10000
SAVEHIST=10000

source "$ZDOTDIR/core/aliases.zsh"
source "$ZDOTDIR/core/options.zsh"
source "$ZDOTDIR/prompt.zsh"

ensure_file "$HISTFILE"
ensure_dir  "$XDG_CACHE_HOME/zsh"

# Enable the completion cache.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/compcache"

# Highlight the completion items.
zstyle ':completion:*' menu select

# Load completions.
autoload -Uz compinit
zsh-defer compinit -d "$XDG_CACHE_HOME/zsh/compdump-$ZSH_VERSION" 
