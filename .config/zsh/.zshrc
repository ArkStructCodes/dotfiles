# load and configure plugins using sheldon
# documentation: https://sheldon.cli.rs
eval "$(sheldon source)"

# set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

config=(
    "aliases"
    "options"
    "prompt"
)

for module in $config; do
    source "$ZDOTDIR/$module.zsh"
done

ensure_file() {
    mkdir -p "$(dirname $1)"
    [ -f "$1" ] && touch "$1"
}

# enable storing command history
HISTFILE="$XDG_STATE_HOME/zsh/history"
ensure_file $HISTFILE
HISTSIZE=10000
SAVEHIST=10000

local CACHE_DIR="$XDG_CACHE_HOME/zsh"
mkdir -p $CACHE_DIR

# enable completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$CACHE_DIR/compcache"

# highlight completion items
zstyle ':completion:*' menu select

autoload -Uz compinit
local COMPDUMP="$CACHE_DIR/compdump-$ZSH_VERSION"

# ensure completions are loaded when sheldon is missing
[ -z "$(command -v zsh-defer)" ] &&
    compinit -d $COMPDUMP ||
    zsh-defer compinit -d $COMPDUMP
