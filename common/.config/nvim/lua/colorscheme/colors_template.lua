return {
    -- (ai) Main editor background (`Normal` guibg).
    -- Current line highlight
    base00 = "{{colors.surface.hex}}",

    -- (ai) Background for current line (`CursorLine` guibg), pop-up menus (`PMenu` guibg), and inactive status bar (`StatusLineNC` guibg).
    -- Bottom status bar
    base01 = "{{colors.surface_variant.hex}}",

    -- (ai) Background for active status bar (`StatusLine` guibg) and visual selection (`Visual` guibg).
    -- Current line
    -- Current completion option
    base02 = "{{colors.outline.hex}}",

    -- (ai) Foreground for comments (`Comment` guifg) and other deemphasized text. This was the color you originally found too dark.
    -- Line numbers
    -- Box outlines
    base03 = "{{colors.terminal.bright.black.hex}}",

    -- (ai) Dim foreground for line numbers (`LineNr` guifg), inactive status text (`StatusLineNC` guifg), and secondary completion text (`CmpItemMenu` guifg).
    -- Exceptions, [] () {} : etc
    -- Non matching characters in completion
    -- Comments
    base04 = "{{colors.on_surface_variant.hex}}",

    -- (ai) Main foreground color for text (`Normal` guifg).
    -- Variables
    -- Text on status bar
    base05 = "{{colors.secondary.hex}}",

    -- ??
    -- (ai) A secondary, bright foreground color. Used in ts-rainbow and some plugins like Diffview.
    base06 = "#FF0000",

    -- ??
    -- (ai) The brightest foreground color. Used in ts-rainbow and as the bright white in the terminal.
    base07 = "#FF0000",

    -- Red
    -- (ai) Used for errors, deleted lines, and some variables/identifiers.
    base08 = "{{colors.error.hex}}",

    -- Orange
    -- (ai) Used for constants, numbers, and booleans. Mapped to yellow as it's often the closest color.
    base09 = "{{colors.terminal.normal.yellow.hex}}",

    -- Yellow
    -- (ai) Used for types, classes, and search result backgrounds. Your mapping to `secondary` is kept, but note it can be inconsistent across themes.
    base0A = "{{colors.secondary.hex}}",

    -- Green
    -- (ai) Used for strings and added lines.
    base0B = "{{colors.terminal.normal.green.hex}}",

    -- Cyan
    -- (ai) Used for special characters, regex, and support functions.
    base0C = "{{colors.terminal.normal.cyan.hex}}",

    -- Blue
    -- (ai) Used for functions, methods, and headings.
    base0D = "{{colors.terminal.normal.blue.hex}}",

    -- Magenta
    -- (ai) Used for keywords, conditionals, and operators.
    base0E = "{{colors.terminal.normal.magenta.hex}}",

    -- ?? Brown
    -- (ai) Used for delimiters and special punctuation. Mapped to `tertiary` as a suitable accent.
    base0F = "#FF0000",
}
