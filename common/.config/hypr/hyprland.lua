-- TODO: move per device sections to own files
-- require("myColors")

-- local layout_type = "dwindle" -- default
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
hl.env("XDG_MENU_PREFIX", "arch-")

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

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,

        border_size = 2,

        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = layout_type,
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 0.9,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Animations

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })


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

-- hl.device({
--     name = "dell0ad9:00-04f3:3147-touchpad",
--     accel_profile = "adaptive"
-- })

local main_mod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen())
-- hl.bind(main_mod .. " + ESCAPE", hl.dsp.exec_cmd("hyprlock"))
hl.bind(main_mod .. " + BACKSPACE", hl.dsp.exec_cmd("~/bin/quick-menu"))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("thunderbird"))
hl.bind(main_mod .. " + S", hl.dsp.exec_cmd("spotify-launcher"))
hl.bind(main_mod .. " + O", hl.dsp.exec_cmd("onlyoffice-desktopeditors"))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(main_mod .. " + G", hl.dsp.exec_cmd("gtk-launch chatgpt"))
hl.bind(main_mod .. " + A", hl.dsp.exec_cmd("gtk-launch amplenote"))
hl.bind(main_mod .. " + T", hl.dsp.exec_cmd("~/bin/bookmark-open"))
hl.bind(main_mod .. " + W", hl.dsp.exec_cmd("~/bin/process-toggle waybar"))
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd("~/bin/clip-menu"))
hl.bind(main_mod .. " + SHIFT + T", hl.dsp.exec_cmd("~/bin/theme-choose"))
hl.bind(main_mod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + SPACE", hl.dsp.exec_cmd("~/bin/process-toggle wofi -S drun -p app"))
hl.bind(main_mod .. " + SHIFT + S", hl.dsp.layout("togglesplit"))
hl.bind(main_mod .. " + SHIFT + P", hl.dsp.window.pin())

-- Screeenshot
hl.bind("PRINT", hl.dsp.exec_cmd("~/bin/screenshot"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("~/bin/screenshot selection"))
-- hl.bind("ALT + PRINT", hl.dsp.exec_cmd("grim -g "$(slurp)" - | tesseract stdin stdout | wl-copy")

if layout_type == "scrolling" then
    -- Scrolling binds
    -- hl.bind(main_mod .. " + TAB", hl.dsp.layout("colresize +conf"))
    -- hl.bind(main_mod .. " + SHIFT + TAB", hl.dsp.layout("colresize -conf"))
    hl.bind(main_mod .. " + K", hl.dsp.layout("colresize +conf"))
    hl.bind(main_mod .. " + J", hl.dsp.layout("colresize -conf"))
    hl.bind(main_mod .. " + L", hl.dsp.layout("move +col"))
    hl.bind(main_mod .. " + H", hl.dsp.layout("move -col"))
    hl.bind(main_mod .. " + LEFT", hl.dsp.layout("swapcol l"))
    hl.bind(main_mod .. " + RIGHT", hl.dsp.layout("swapcol r"))
    -- hl.bind(main_mod .. " + T", hl.dsp.layout("fit visible")) -- testing
else -- Dwindle or Master
    -- Move focus
    hl.bind(main_mod .. " + H", hl.dsp.focus({ direction = "left" }))
    hl.bind(main_mod .. " + L", hl.dsp.focus({ direction = "right" }))
    hl.bind(main_mod .. " + K", hl.dsp.focus({ direction = "up" }))
    hl.bind(main_mod .. " + J", hl.dsp.focus({ direction = "down" }))
    -- Move windows
    hl.bind(main_mod .. " + LEFT", hl.dsp.window.move({ direction = "left" }))
    hl.bind(main_mod .. " + RIGHT", hl.dsp.window.move({ direction = "right" }))
    hl.bind(main_mod .. " + UP", hl.dsp.window.move({ direction = "up" }))
    hl.bind(main_mod .. " + DOWN", hl.dsp.window.move({ direction = "down" }))
end

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspaces
hl.bind(main_mod .. " + DELETE", hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod .. " + SHIFT + DELETE", hl.dsp.window.move({ workspace = "special:magic" }))

-- Resize
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media controls
local playerctl_cmd = "playerctl -p spotify,%any"
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(playerctl_cmd .. " next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(playerctl_cmd .. " play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(playerctl_cmd .. " play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(playerctl_cmd .. " previous"), { locked = true })

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
