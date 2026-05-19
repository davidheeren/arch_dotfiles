return {
    -- background ramp
    base00 = "{{colors.surface.hex}}",                         -- main bg
    base01 = "{{colors.surface_variant.hex}}",                 -- secondary bg
    base02 = "{{colors.terminal.normal.black.hex}}",           -- selections
    base03 = "{{colors.terminal.bright.black.hex}}",           -- comments/invisibles

    -- foreground ramp
    base04 = "{{colors.outline.hex}}",                         -- subtle fg
    base05 = "{{colors.on_surface.hex}}",                      -- main fg
    base06 = "{{colors.on_surface.hex}}",                      -- brighter fg
    base07 = "#ffffff",                                  -- optional max fg

    -- syntax accents
    base08 = "{{colors.terminal.normal.red.hex}}",                           -- red
    base09 = "{{colors.terminal.normal.magenta.hex}}",                       -- orange/peach
    base0A = "{{colors.terminal.normal.yellow.hex}}",          -- yellow
    base0B = "{{colors.terminal.normal.green.hex}}",           -- green
    base0C = "{{colors.terminal.normal.cyan.hex}}",            -- cyan
    base0D = "{{colors.terminal.normal.blue.hex}}",            -- blue
    base0E = "{{colors.primary.hex}}",                         -- purple
    base0F = "{{colors.tertiary.hex}}",                        -- extra accent
}
