# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess

import libqtile.resources
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.config import EzKey as EKey
from libqtile.lazy import lazy

mod = "mod4"
browser = "brave"
terminal = "alacritty"
editor = "emacsclient -c -a emacs"
runner = "rofi -show drun"
viewer = "zathura"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    KeyChord([mod], "r", [
        EKey("e", lazy.spawn(editor)),
        EKey("b", lazy.spawn(browser)),
        EKey("r", lazy.spawn(runner)),
        EKey("t", lazy.spawn(terminal)),
        EKey("z", lazy.spawn(viewer)),
    ], name="Spawn..."),

    EKey("M-h", lazy.layout.left(), desc="Move focus to left"),
    EKey("M-l", lazy.layout.right(), desc="Move focus to right"),
    EKey("M-j", lazy.layout.down(), desc="Move focus down"),
    EKey("M-k", lazy.layout.up(), desc="Move focus up"),

    EKey("M-S-h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    EKey("M-S-l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    EKey("M-S-j", lazy.layout.shuffle_down(), desc="Move window down"),
    EKey("M-S-k", lazy.layout.shuffle_up(), desc="Move window up"),

    EKey("M-<space>", lazy.next_layout()),
    EKey("M-q", lazy.window.kill()),
    EKey("M-<tab>", lazy.window.toggle_fullscreen(),),
    EKey("M-b", lazy.hide_show_bar("top")),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 10%+"), desc="Brightness Up"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-"), desc="Brightness Down"),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "asdfuiop"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.MonadTall(border_width=3, border_normal="#@lightbg@", border_focus="#@yellow@", margin=5),
    layout.MonadWide(border_width=3, border_normal="#@lightbg@", border_focus="#@yellow@", margin=5),
    layout.RatioTile(border_width=3, border_normal="#@lightbg@", border_focus="#@yellow@", margin=5),
    # layout.Zoomy(margin=5),
    layout.Max(),

    # layout.TreeTab(),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
]

widget_defaults = dict(
    font="monospace",
    fontsize=14,
    padding=8,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    font="monospace",
                    highlight_method='block',
                    active='#@yellow@',
                    inactive='#@darkfg@',
                    this_current_screen_border='#@lightbg@',
                ),
                widget.WindowName(foreground="#@foreground@"),
                widget.Chord(
                    name_transform=lambda name: name.upper(),
                    fmt="<b><i>{}</i></b>",
                    foreground="#@foreground@"
                ),
                widget.Systray(foreground="#@foreground@"),
                widget.CurrentLayout(foreground="#@foreground@"),
                widget.Volume(fmt="SND {}", foreground="#@foreground@"),
                widget.Battery(
                    fmt="INBAT {}",
                    battery="BAT0", # Internal
                    foreground="#@foreground@"
                ),
                widget.Battery(
                    fmt="EXBAT {}",
                    battery="BAT1", # External
                    foreground="#@foreground@"
                ),
                widget.Clock(format="%a %m/%d @ %H:%M", foreground="#@foreground@"),
            ],
            24,
            background="#@darkbg@",
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        background="#666666",
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    font="monospace",
                    highlight_method='block',
                    active='#@yellow@',
                    inactive='#@darkfg@',
                    this_current_screen_border='#@lightbg@',
                ),
                widget.WindowName(foreground="#@foreground@"),
                widget.Chord(
                    name_transform=lambda name: name.upper(),
                    fmt="<b><i>{}</i></b>",
                    foreground="#@foreground@"
                ),
                widget.Systray(foreground="#@foreground@"),
                widget.CurrentLayout(foreground="#@foreground@"),
                widget.Volume(fmt="SND {}", foreground="#@foreground@"),
                widget.Battery(
                    fmt="INBAT {}",
                    battery="BAT0", # Internal
                    foreground="#@foreground@"
                ),
                widget.Battery(
                    fmt="EXBAT {}",
                    battery="BAT1", # External
                    foreground="#@foreground@"
                ),
                widget.Clock(format="%a %m/%d @ %H:%M", foreground="#@foreground@"),
            ],
            24,
            background="#@darkbg@",
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        background="#666666",
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = True
floating_layout = layout.Floating(

border_width=3,
border_normal="#@lightbg@",
border_focus="#@yellow@",
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
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
focus_previous_on_window_remove = False
reconfigure_screens = True

@hook.subscribe.startup
def autostart():
    auto = os.path.expanduser('~/.config/qtile/autostart')
    subprocess.call(auto)

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
wmname = "Qtile"
