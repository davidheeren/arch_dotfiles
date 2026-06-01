return {
    base00 = "{{colors.surface.hex}}",                 -- Default background
    base01 = "{{colors.surface_variant.hex}}",         -- Lighter background (status bars)
    -- base02 = "{{colors.terminal.selection_bg.hex}}",   -- Selection background
    base02 = "{{colors.outline.hex}}",   -- Selection background
    base03 = "{{colors.terminal.bright.black.hex}}",   -- Comments, line highlighting
    -- base04 = "{{colors.outline.hex}}",                 -- Dark foreground (status bars)
    base04 = "{{colors.terminal.bright.black.hex}}",   -- Dark foreground (status bars)
    base05 = "{{colors.on_surface.hex}}",              -- Default foreground
    base06 = "{{colors.on_surface.hex}}",              -- Light foreground
    base07 = "#ffffff",                                -- Lightest foreground
    base08 = "{{colors.terminal.normal.red.hex}}",     -- Red (variables, errors)
    base09 = "{{colors.terminal.normal.magenta.hex}}", -- Orange (integers, constants)
    base0A = "{{colors.terminal.normal.yellow.hex}}",  -- Yellow (classes, search)
    base0B = "{{colors.terminal.normal.green.hex}}",   -- Green (strings, success)
    base0C = "{{colors.terminal.normal.cyan.hex}}",    -- Cyan (support, regex)
    base0D = "{{colors.terminal.normal.blue.hex}}",    -- Blue (functions, info)
    base0E = "{{colors.primary.hex}}",                 -- Purple (keywords, changes)
    base0F = "{{colors.tertiary.hex}}",                -- Brown (deprecated)
}
