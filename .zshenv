# set XDG user directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# relocate program data to XDG user directories
export ANDROID_HOME="$XDG_DATA_HOME/Android"
if [[ -d $ANDROID_HOME ]]; then
    export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"
fi
export ANDROID_AVD_HOME="$XDG_CONFIG_HOME/.android/avd"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# add user-installed executables and flatpak applications to PATH
path+=(
    "$CARGO_HOME/bin"
    "$GOPATH/bin"
    "$XDG_DATA_HOME/npm/bin"
    "$XDG_DATA_HOME/flatpak/exports/bin"
    "/var/lib/flatpak/exports/bin"
    "$HOME/.local/bin"
)
export PATH

# show applications installed through flatpak without restarting
xdg_data_dirs+=(
    "$XDG_DATA_HOME/flatpak/exports/share"
    "/var/lib/flatpak/exports/share"
)
export XDG_DATA_DIRS

# configure applications
export QT_QPA_PLATFORMTHEME=qt6ct
