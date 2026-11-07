local function is_plugin_loaded(name)
    for _, v in pairs(hl.get_loaded_plugins()) do
        if v.name == name then return true end
    end
    return false
end

return function(layout_type, colors)
    -- hyprselect plugin
    -- https://github.com/jmanc3/hyprselect
    if is_plugin_loaded("hyprselect") then
        hl.config({
            plugin = {
                hyprselect = {
                    should_round = true,

                    col = {
                        main   = "rgba(" .. colors.top_border .. "33)",
                        border = "rgb(" .. colors.top_border .. ")",
                    },

                    fade_time_ms = 65.0,

                    should_blur = true,
                    blur_power = 0.5,   -- range: 0.0 -> 1.0

                    border_size = -1.0, -- negative number means automatic
                    rounding = 6,
                    rounding_power = 2.0,

                    shadow = {
                        enabled = true,
                        sharp = false,
                        range = 4,
                        color = "rgba(00000008)",
                    }
                }
            }
        })
    end
end
