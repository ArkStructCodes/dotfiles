from libqtile.config import Click, Drag, Group, Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


MOD = "mod4"
TERMINAL = guess_terminal()

keys = [
    # moving between different windows
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),
    Key([MOD], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # moving windows in a layout
    Key([MOD, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([MOD, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([MOD, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # grow window sizes
    Key([MOD, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([MOD, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([MOD, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([MOD, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([MOD], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    
    # window management

    # toggle between split and unsplit sides of stack
    # split:   all windows displayed
    # unsplit: 1 window displayed, like Max layout, but still with multiple stack panes
    Key(
        [MOD, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # toggle between different layouts as defined below
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [MOD],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([MOD], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

    # session management
    Key([MOD, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, "control", "shift"], "e", lazy.shutdown(), desc="Shutdown Qtile"),

    # launching applications
    Key([MOD], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([MOD], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),
    Key([MOD], "d", lazy.spawn("rofi -show drun"), desc="Show an application launcher"),
    Key([], "Print", lazy.spawn("flameshot gui"), desc="Show a screenshot overlay"),
]

# setup traditional workspaces
for name in "123456789":
    group = Group(name)
    group_keys = [
        Key(
            [MOD],
            group.name,
            lazy.group[group.name].toscreen(),
            desc="Switch to group {}".format(group.name),
        ),
        Key(
            [MOD, "shift"],
            group.name,
            # passing `switch_group=True` will also switch to the group
            lazy.window.togroup(group.name),
            desc="move focused window to group {}".format(group.name),
        ),
    ]
    keys.extend(group_keys)

mouse = [
    Drag([MOD], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

