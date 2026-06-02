local function create_layout_file()
    local filepath = os.getenv("HOME") .. "/.config/hypr/hyprland/layout_local.lua"
    local file = io.open(filepath, "r")
    if file then
        file:close()
        return
    end

    local new_file, err = io.open(filepath, "w")
    if not new_file then
        return false, "Failed to create file: " .. tostring(err)
    end
    new_file:write('return "dwindle"')
    new_file:write('\n-- return "scrolling"')
    new_file:write('\n-- return "master"')
    new_file:close()
end

create_layout_file()
local layout_type = require("hyprland.layout_local")
require("hyprland.monitors")

-- Startup
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("waybar")
end)

-- Environment vars
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
-- for dolphin but kinda broken
-- hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

hl.config({
    cursor = {
        inactive_timeout = 3
    }
})

local colors = require("hyprland.colors")
require("hyprland.style")(layout_type, colors)

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
        force_split = 2        -- Always split right/down
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        column_width = 0.5,
        fullscreen_on_one_column = true,
        follow_focus = true,
        follow_min_visible = 1,
        explicit_column_widths = ".333, 0.5, 0.667, 1.0"
        -- explicit_column_widths = ".333, 0.5, 0.667, 0.995"
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

hl.config({
    input = {
        kb_layout          = "us",
        kb_variant         = "",
        kb_model           = "",
        kb_options         = "",
        kb_rules           = "",

        follow_mouse       = 1,

        repeat_rate        = 35,
        repeat_delay       = 200,

        numlock_by_default = true,

        sensitivity        = 0, -- -1.0 - 1.0, 0 means no modification.
        accel_profile      = "flat",

        touchpad           = {
            natural_scroll = true,
            scroll_factor = 0.2

        },
    },
})

-- laptop specific
hl.device({
    name = "dell0ad9:00-04f3:3147-touchpad",
    accel_profile = "adaptive"
})

local main_mod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd("kitty"), { description = "Open terminal" })
hl.bind(main_mod .. " + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen(), { description = "Toggle fullscreeen window" })
-- hl.bind(main_mod .. " + ESCAPE", hl.dsp.exec_cmd("hyprlock"))
hl.bind(main_mod .. " + BACKSPACE", hl.dsp.exec_cmd("~/bin/quick-menu"), { description = "Open quick menu" })
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd("zen-browser"), { description = "Open browser" })
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("thunderbird"), { description = "Open email" })
hl.bind(main_mod .. " + S", hl.dsp.exec_cmd("spotify-launcher"), { description = "Open spotify" })
hl.bind(main_mod .. " + O", hl.dsp.exec_cmd("onlyoffice-desktopeditors"), { description = "Open onlyoffice" })
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd("thunar"), { description = "Open file manager" })
hl.bind(main_mod .. " + G", hl.dsp.exec_cmd("gtk-launch chatgpt"), { description = "Open chatgpt" })
hl.bind(main_mod .. " + A", hl.dsp.exec_cmd("gtk-launch amplenote"), { description = "Open amplenote" })
hl.bind(main_mod .. " + T", hl.dsp.exec_cmd("~/bin/bookmark-open"), { description = "Open bookmark url" })
hl.bind(main_mod .. " + W", hl.dsp.exec_cmd("~/bin/process-toggle waybar"), { description = "Toggle waybar" })
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd("~/bin/clip-menu"), { description = "Open clipboard history" })
-- hl.bind(main_mod .. " + SHIFT + T", hl.dsp.exec_cmd("~/bin/theme-choose"), { description = "Choose theme"})
hl.bind(main_mod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating window" })
hl.bind(main_mod .. " + SPACE", hl.dsp.exec_cmd("~/bin/process-toggle wofi -S drun -p app"), { description = "Open app" })
hl.bind(main_mod .. " + SHIFT + P", hl.dsp.window.pin(), { description = "Toggle pin window across workspaces" })
hl.bind(main_mod .. " + SHIFT + K", hl.dsp.exec_cmd("hyprbind -d | wofi -S dmenu"), { description = "Show hyprland keybinds" })

-- fun
hl.bind(main_mod .. " + SHIFT + L", hl.dsp.exec_cmd("[fullscreen] kitty -o background_opacity=0.0 pipes.sh -p 2"), { description = "Fullscreen pipes animation" })

-- Screeenshot
hl.bind("PRINT", hl.dsp.exec_cmd("~/bin/screenshot"), { description = "Take screenshot" })
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("~/bin/screenshot selection"), { description = "Take selection screenshot" })
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | tesseract stdin stdout | wl-copy"), { description = "Screen selection to copy text" })

if layout_type == "scrolling" then
    -- Scrolling binds
    hl.bind(main_mod .. " + K", hl.dsp.layout("colresize +conf"), { description = "Resize window up" })
    hl.bind(main_mod .. " + J", hl.dsp.layout("colresize -conf"), { description = "Resize window down" })
    hl.bind(main_mod .. " + H", hl.dsp.layout("focus l"), { description = "Focus window left" })
    hl.bind(main_mod .. " + L", hl.dsp.layout("focus r"), { description = "Focus window right" })
    hl.bind(main_mod .. " + mouse_down", hl.dsp.layout("move +col"), { description = "Focus window left" })
    hl.bind(main_mod .. " + mouse_up", hl.dsp.layout("move -col"), { description = "Focus window right" })
    -- hl.bind(main_mod .. " + mouse_down", hl.dsp.layout("move +200"))
    -- hl.bind(main_mod .. " + mouse_up", hl.dsp.layout("move -200"))
    hl.bind(main_mod .. " + LEFT", hl.dsp.layout("swapcol l"), { description = "Swap window left" })
    hl.bind(main_mod .. " + RIGHT", hl.dsp.layout("swapcol r"), { description = "Swap window right" })
    -- hl.bind(main_mod .. " + C", hl.dsp.layout("fit visible")) -- testing
    -- hl.bind(main_mod .. " + P", hl.dsp.layout("promote")) -- testing
else -- Dwindle or Master
    -- Move focus
    hl.bind(main_mod .. " + H", hl.dsp.focus({ direction = "left" }), { description = "Focus window left" })
    hl.bind(main_mod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Focus window right" })
    hl.bind(main_mod .. " + K", hl.dsp.focus({ direction = "up" }), { description = "Focus window up" })
    hl.bind(main_mod .. " + J", hl.dsp.focus({ direction = "down" }), { description = "Focus window down" })
    -- Move windows
    hl.bind(main_mod .. " + LEFT", hl.dsp.window.move({ direction = "left" }), { description = "Move window left" })
    hl.bind(main_mod .. " + RIGHT", hl.dsp.window.move({ direction = "right" }), { description = "Move window right" })
    hl.bind(main_mod .. " + UP", hl.dsp.window.move({ direction = "up" }), { description = "Move window up" })
    hl.bind(main_mod .. " + DOWN", hl.dsp.window.move({ direction = "down" }), { description = "Move window down" })
    -- Layout
    hl.bind(main_mod .. " + SHIFT + S", hl.dsp.layout("togglesplit"), { description = "Toggle window split direction (horizontal or vertical)" })
end

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Move to workspace " .. i })
    hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move window to workspace " .. i })
end

-- Special workspaces
hl.bind(main_mod .. " + DELETE", hl.dsp.workspace.toggle_special("magic"), { description = "Toggle magic workspace"} )
hl.bind(main_mod .. " + SHIFT + DELETE", hl.dsp.window.move({ workspace = "special:magic" }), { description = "Move window to magic workspace"} )

-- Resize
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window position with mouse"})
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window with mouse" })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true, description = "Raise volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true, description = "Lower volume" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true, description = "Toggle mute audio output" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true, description = "Toggle audio source" })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true, description = "Raise screen brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true, description = "Lower screen brightness" })
hl.bind(main_mod .. " + XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset temperature -500"), { locked = true, repeating = true, description = "Raise screen temperature" })
hl.bind(main_mod .. " + XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset temperature +500"), { locked = true, repeating = true, description = "Lower screen temperature" })

-- Media controls
local playerctl_cmd = "playerctl -p spotify,%any"
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(playerctl_cmd .. " next"), { locked = true, description = "Play media next" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(playerctl_cmd .. " previous"), { locked = true, description = "Play media previous" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(playerctl_cmd .. " play-pause"), { locked = true, description = "Play/Pause media" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(playerctl_cmd .. " play-pause"), { locked = true, description = "Play/Pause media" })

require("hyprland.keybinds")(main_mod, playerctl_cmd)

-- Window rules
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
-- Uneeded for now bc this is the defualt. It just shows how to enable/disable
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
