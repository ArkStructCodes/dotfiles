# load and configure plugins using sheldon
# documentation: https://sheldon.cli.rs
eval "$(sheldon source)"

local config=(
    "options"
    "aliases"
    "prompt"
)

for module in $config; do
    source "$ZDOTDIR/$module.zsh"
done

ensure_dir() [[ -d $1 ]] || mkdir -p $1

ensure_file() {
    ensure_dir "$(dirname $1)"
    [[ -f $1 ]] || touch $1
}

# enable storing command history
HISTFILE="$XDG_STATE_HOME/zsh/history"
ensure_file $HISTFILE
HISTSIZE=10000
SAVEHIST=10000

local CACHE_DIR="$XDG_CACHE_HOME/zsh"
ensure_dir $CACHE_DIR

# enable completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$CACHE_DIR/compcache"

# highlight completion items
zstyle ':completion:*' menu select

local COMPDUMP="$CACHE_DIR/compdump-$ZSH_VERSION"
autoload -U compinit

# ensure completions are loaded when sheldon is missing
if [[ -z "$(command -v zsh-defer)" ]]; then
    compinit -d $COMPDUMP
else
    zsh-defer compinit -d $COMPDUMP
fi
