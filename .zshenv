# Set XDG base eirectories.
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Change the user config location.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Relocate data for other applications.
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"

# Extend PATH to include user-installed binaries.
path+=(
    "$HOME/.local/bin"
    "$CARGO_HOME/bin"
    "$XDG_DATA_HOME/npm/bin"
)
export PATH
