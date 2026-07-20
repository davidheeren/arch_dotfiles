return function(layout_type, colors)
    hl.config({
        general = {
            gaps_in = 4,
            gaps_out = 8,

            border_size = 2,

            col = {
                -- active_border = { colors = { "rgba(7aa2f7cc)", "rgba(9ece6acc)" }, angle = 45 },
                active_border = { colors = { "rgb(" .. colors.top_border .. ")", "rgb(" .. colors.bottom_border .. ")" }, angle = 45 },
                -- inactive_border = "rgba(595959aa)",
                inactive_border = "rgba(595959aa)",
            },

            -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
            resize_on_border = false,

            -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
            allow_tearing = false,

            layout = layout_type,
        },

        decoration = {
            rounding = 8,
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
    -- source: https://www.reddit.com/r/hyprland/comments/1ubj7wg/share_your_animation_configs

    hl.curve("default", { type = "bezier", points = { { 0.12, 0.92 }, { 0.08, 1.0 } } })
    hl.curve("wind", { type = "bezier", points = { { 0.12, 0.92 }, { 0.08, 1.0 } } })
    hl.curve("overshot", { type = "bezier", points = { { 0.18, 0.95 }, { 0.22, 1.03 } } })
    hl.curve("linear", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })
    
    --checkpoint

    hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "wind", style = "popin 60%" })
    hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "overshot", style = "popin 60%" })
    hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "overshot", style = "popin 60%" })
    hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "overshot", style = "slide" })
    hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "default", style = "popin" })
    hl.animation({ leaf = "fadeIn", enabled = true, speed = 6, bezier = "default" })
    hl.animation({ leaf = "fadeOut", enabled = true, speed = 6, bezier = "default" })
    hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 6, bezier = "default" })
    hl.animation({ leaf = "fadeShadow", enabled = true, speed = 6, bezier = "default" })
    hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "default" })
    hl.animation({ leaf = "fadeLayers", enabled = true, speed = 6, bezier = "default" })
    hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "wind", style = "slide" })
    hl.animation({
        leaf = "specialWorkspace",
        enabled = true,
        speed = 3,
        bezier = "overshot",
        style = "slidefadevert 100%",
    })
    hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "linear" })
    hl.animation({ leaf = "borderangle", enabled = true, speed = 24, bezier = "linear", style = "loop" })
end
