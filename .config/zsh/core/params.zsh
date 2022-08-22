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
