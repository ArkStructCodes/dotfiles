# Apply the XDG Base Directory specification.
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Change the user config location.
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

# Extend PATH to include user-installed binaries.
path+=("${HOME}/.local/bin")
export PATH
