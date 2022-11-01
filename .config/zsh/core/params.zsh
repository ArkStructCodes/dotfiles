# SYSTEM
# ======

# An array of of directories specifying the search path for function definitions.
# This path is searched when a function with the -u attribute is referenced.
fpath+=("${XDG_DATA_HOME}/zsh/functions")

# The file to save history in when an interactive shell exits. If unset, the
# history is not saved.
HISTFILE="${XDG_STATE_HOME}/zsh/zhistory"

# The maximum number of events stored in the internal history list.
HISTSIZE=10000

# The maximum number of history events to save in the history file.
SAVEHIST=10000


# USER
# ====

# Change the storage location of cargo.
export CARGO_HOME="${XDG_DATA_HOME}/cargo"

# Add the new cargo location to PATH.
path+=("${CARGO_HOME}/bin")
export PATH

# Change the location of npm user config.
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
