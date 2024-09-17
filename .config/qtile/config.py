from subprocess import Popen
import os.path as path

from libqtile import bar, layout, widget, hook
from libqtile.config import Match, Screen

from binds import keys, mouse


COLORS = ("0c0c0c", "262626", "484848", "d12570")
WIDGET_PADDING = 20

@hook.subscribe.startup_once
def autostart():
    Popen(["dex", "--autostart", "--environment", "qtile"])
    Popen(["/usr/lib/mate-polkit/polkit-mate-authentication-agent-1"])
    Popen(["volumeicon"])

layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4), # type: ignore
    layout.Stack(num_stacks=2), # type: ignore
    # Try more layouts by unleashing below layouts.
    # layout.Max(),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = {
    "font": "Hasklug Nerd Font Black",
    "fontsize": 15,
    "padding": WIDGET_PADDING,
}
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="block",
                    background=COLORS[1],
                    inactive=COLORS[2],
                    this_current_screen_border=COLORS[3],
                    padding=5
                ),
                widget.Prompt(),
                widget.WindowName(max_chars=60, foreground=COLORS[2]),
                widget.Clock(format="%b %d %a %H:%M", update_interval=10),
                widget.Spacer(),
                widget.Memory(
                    format="{MemUsed:.1f}{mm}",
                    fmt=f"<span color='#{COLORS[3]}'>󰘚</span>  {{}}",
                    measure_mem="G",
                    update_interval=5,
                    background=COLORS[1]
                ), # psutil
                widget.Spacer(length=int(WIDGET_PADDING/2)),
                widget.ThermalSensor(
                    tag_sensor="Tctl",
                    fmt=f"<span color='#{COLORS[3]}'>󰔏</span>  {{}}",
                    update_interval=5,
                    background=COLORS[1]
                ), # psutil
                widget.Spacer(length=WIDGET_PADDING),
                widget.Systray(icon_size=18, padding=int(WIDGET_PADDING/2)),
                widget.Spacer(length=WIDGET_PADDING),
            ],
            28,
            background=COLORS[0],
            border_color=COLORS[0],
            border_width=8,
        ),
        # x11_drag_polling_rate = 60,
        wallpaper=path.join(path.dirname(__file__), "wallpaper.jpg"),
        wallpaper_mode="fill"
    ),
]

# Drag floating layouts.
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating( # type: ignore
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules, # type: ignore
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
