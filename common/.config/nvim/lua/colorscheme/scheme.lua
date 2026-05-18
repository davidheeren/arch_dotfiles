local M = {}

local function set_highlights()
    local config = require("colorscheme.config")
    local utilities = require("colorscheme.utilities")
    -- local palette = require("colorscheme.palette_local")
    local palette = require("colorscheme.colors")
    local styles = config.styles

    local groups = {}
    for group, color in pairs(config.groups) do
        groups[group] = utilities.parse_color(color)
    end

    local function make_border(fg)
        fg = fg or groups.border
        return {
            fg = fg,
            bg = (config.extend_background_behind_borders and not styles.transparency) and palette.surface or "NONE",
        }
    end

    local highlights = {
        -- Treesitter based on legacy for simplicity
        ["@attribute.diff"] = { fg = palette.yellow },
        ["@boolean"] = { link = "Boolean" },
        ["@class"] = { fg = palette.blue },
        ["@conditional"] = { link = "Conditional" },
        ["@field"] = { fg = palette.blue },
        ["@include"] = { link = "Include" },
        ["@interface"] = { fg = palette.blue },
        ["@macro"] = { link = "Macro" },
        ["@method"] = { fg = palette.magenta },
        ["@namespace"] = { link = "Include" },
        ["@number"] = { link = "Number" },
        ["@parameter"] = { fg = palette.purple, italic = styles.italic },
        ["@preproc"] = { link = "PreProc" },
        ["@punctuation"] = { fg = palette.subtle },
        ["@punctuation.bracket"] = { link = "@punctuation" },
        ["@punctuation.delimiter"] = { link = "@punctuation" },
        ["@punctuation.special"] = { link = "@punctuation" },
        ["@regexp"] = { link = "String" },
        ["@repeat"] = { link = "Repeat" },
        ["@storageclass"] = { link = "StorageClass" },
        ["@symbol"] = { link = "Identifier" },
        ["@text"] = { fg = palette.text },
        ["@text.danger"] = { fg = groups.error },
        ["@text.diff.add"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
        ["@text.diff.delete"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
        ["@text.emphasis"] = { italic = styles.italic },
        ["@text.environment"] = { link = "Macro" },
        ["@text.environment.name"] = { link = "Type" },
        ["@text.math"] = { link = "Special" },
        ["@text.note"] = { link = "SpecialComment" },
        ["@text.strike"] = { strikethrough = true },
        ["@text.strong"] = { bold = styles.bold },
        ["@text.title"] = { link = "Title" },
        ["@text.underline"] = { underline = true },
        ["@text.uri"] = { fg = groups.link },
        ["@text.warning"] = { fg = groups.warn },
        ["@todo"] = { link = "Todo" },

        -- Core Highlights
        ColorColumn = { bg = palette.surface },
        Conceal = { bg = "NONE" },
        CurSearch = { fg = palette.base, bg = palette.yellow },
        Cursor = { fg = palette.text, bg = palette.highlight_high },
        CursorColumn = { bg = palette.overlay },
        CursorLine = { bg = palette.overlay },
        CursorLineNr = { fg = palette.text, bold = styles.bold },
        DiffAdd = { bg = groups.git_add, blend = 20 },
        DiffChange = { bg = groups.git_change, blend = 20 },
        DiffDelete = { bg = groups.git_delete, blend = 20 },
        DiffText = { bg = groups.git_text, blend = 40 },
        diffAdded = { link = "DiffAdd" },
        diffChanged = { link = "DiffChange" },
        diffRemoved = { link = "DiffDelete" },
        Directory = { fg = palette.blue, bold = styles.bold },
        ErrorMsg = { fg = groups.error, bold = styles.bold },
        FloatBorder = make_border(),
        FloatTitle = { fg = palette.blue, bg = groups.panel, bold = styles.bold },
        FoldColumn = { fg = palette.muted },
        Folded = { fg = palette.text, bg = groups.panel },
        IncSearch = { link = "CurSearch" },
        LineNr = { fg = palette.muted },
        MatchParen = { fg = palette.cyan, bg = palette.cyan, blend = 25 },
        ModeMsg = { fg = palette.subtle },
        MoreMsg = { fg = palette.purple },
        NonText = { fg = palette.muted },
        Normal = { fg = palette.text, bg = palette.base },
        NormalFloat = { bg = groups.panel },
        NormalNC = { fg = palette.text, bg = config.dim_inactive_windows and palette._nc or palette.base },
        Pmenu = { fg = palette.subtle, bg = groups.panel },
        PmenuSel = { fg = palette.text, bg = palette.overlay },
        PmenuSbar = { bg = groups.panel },
        PmenuThumb = { bg = palette.muted },
        Question = { fg = palette.yellow },
        QuickFixLine = { fg = palette.blue },
        Search = { fg = palette.text, bg = palette.yellow, blend = 20 },
        SignColumn = { fg = palette.text, bg = "NONE" },
        SpecialKey = { fg = palette.blue },
        SpellBad = { sp = palette.subtle, undercurl = true },
        SpellCap = { sp = palette.subtle, undercurl = true },
        SpellLocal = { sp = palette.subtle, undercurl = true },
        SpellRare = { sp = palette.subtle, undercurl = true },
        StatusLine = { fg = palette.subtle, bg = groups.panel },
        StatusLineNC = { fg = palette.muted, bg = groups.panel, blend = 60 },
        StatusLineTerm = { fg = palette.base, bg = palette.cyan },
        StatusLineTermNC = { fg = palette.base, bg = palette.cyan, blend = 60 },
        Substitute = { link = "IncSearch" },
        TabLine = { fg = palette.subtle, bg = groups.panel },
        TabLineFill = { bg = groups.panel },
        TabLineSel = { fg = palette.text, bg = palette.overlay, bold = styles.bold },
        Title = { fg = palette.blue, bold = styles.bold },
        VertSplit = { fg = groups.border },
        Visual = { bg = palette.purple, blend = 15 },
        WarningMsg = { fg = groups.warn, bold = styles.bold },
        WildMenu = { link = "IncSearch" },
        WinSeparator = { fg = groups.border },

        -- Diagnostics
        DiagnosticError = { fg = groups.error },
        DiagnosticHint = { fg = groups.hint },
        DiagnosticInfo = { fg = groups.info },
        DiagnosticOk = { fg = groups.ok },
        DiagnosticWarn = { fg = groups.warn },
        DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
        DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
        DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
        DiagnosticUnderlineOk = { sp = groups.ok, undercurl = true },
        DiagnosticUnderlineWarn = { sp = groups.warn, undercurl = true },
        DiagnosticVirtualTextError = { fg = groups.error, bg = groups.error, blend = 10 },
        DiagnosticVirtualTextHint = { fg = groups.hint, bg = groups.hint, blend = 10 },
        DiagnosticVirtualTextInfo = { fg = groups.info, bg = groups.info, blend = 10 },
        DiagnosticVirtualTextOk = { fg = groups.ok, bg = groups.ok, blend = 10 },
        DiagnosticVirtualTextWarn = { fg = groups.warn, bg = groups.warn, blend = 10 },

        -- Syntax Groups
        Boolean = { fg = palette.magenta },
        Character = { fg = palette.yellow },
        Comment = { fg = palette.subtle, italic = styles.italic },
        Conditional = { fg = palette.cyan },
        Constant = { fg = palette.yellow },
        Debug = { fg = palette.magenta },
        Define = { fg = palette.purple },
        Delimiter = { fg = palette.subtle },
        Error = { fg = palette.red },
        Exception = { fg = palette.cyan },
        Float = { fg = palette.yellow },
        Function = { fg = palette.magenta },
        Identifier = { fg = palette.text },
        Include = { fg = palette.cyan },
        Keyword = { fg = palette.cyan },
        Label = { fg = palette.blue },
        Number = { fg = palette.yellow },
        Operator = { fg = palette.subtle },
        PreProc = { link = "PreCondit" },
        Repeat = { fg = palette.cyan },
        Special = { fg = palette.blue },
        Statement = { fg = palette.cyan, bold = styles.bold },
        StorageClass = { fg = palette.blue },
        String = { fg = palette.yellow },
        Structure = { fg = palette.blue },
        Tag = { fg = palette.blue },
        Todo = { fg = palette.magenta, bg = palette.magenta, blend = 20 },
        Type = { fg = palette.blue },
        Underlined = { fg = palette.purple, underline = true },

        -- Markdown
        markdownH1 = { fg = groups.h1, bold = styles.bold },
        markdownH2 = { fg = groups.h2, bold = styles.bold },
        markdownH3 = { fg = groups.h3, bold = styles.bold },
        markdownH4 = { fg = groups.h4, bold = styles.bold },
        markdownH5 = { fg = groups.h5, bold = styles.bold },
        markdownH6 = { fg = groups.h6, bold = styles.bold },
        markdownUrl = { fg = groups.link, sp = groups.link, underline = true },

        -- Git
        GitSignsAdd = { fg = groups.git_add, bg = "NONE" },
        GitSignsChange = { fg = groups.git_change, bg = "NONE" },
        GitSignsDelete = { fg = groups.git_delete, bg = "NONE" },

        -- Telescope
        TelescopeBorder = make_border(),
        TelescopeMatching = { fg = palette.magenta },
        TelescopeNormal = { link = "NormalFloat" },
        TelescopePromptNormal = { link = "TelescopeNormal" },
        TelescopePromptPrefix = { fg = palette.subtle },
        TelescopeSelection = { fg = palette.text, bg = palette.overlay },
        TelescopeSelectionCaret = { fg = palette.magenta, bg = palette.overlay },
        TelescopeTitle = { fg = palette.blue, bold = styles.bold },
    }

    if styles.transparency then
        local transparency_highlights = {
            DiagnosticVirtualTextError = { fg = groups.error },
            DiagnosticVirtualTextHint = { fg = groups.hint },
            DiagnosticVirtualTextInfo = { fg = groups.info },
            DiagnosticVirtualTextOk = { fg = groups.ok },
            DiagnosticVirtualTextWarn = { fg = groups.warn },
            FloatBorder = { fg = palette.muted, bg = "NONE" },
            FloatTitle = { fg = palette.blue, bg = "NONE", bold = styles.bold },
            Folded = { fg = palette.text, bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            Normal = { fg = palette.text, bg = "NONE" },
            NormalNC = { fg = palette.text, bg = config.dim_inactive_windows and palette._nc or "NONE" },
            Pmenu = { fg = palette.subtle, bg = "NONE" },
            SignColumn = { fg = palette.text, bg = "NONE" },
            StatusLine = { fg = palette.subtle, bg = "NONE" },
            StatusLineNC = { fg = palette.muted, bg = "NONE" },
            TabLine = { bg = "NONE", fg = palette.subtle },
            TabLineFill = { bg = "NONE" },
            TabLineSel = { fg = palette.text, bg = "NONE", bold = styles.bold },
            TelescopeNormal = { fg = palette.subtle, bg = "NONE" },
            TelescopePromptNormal = { fg = palette.text, bg = "NONE" },
            TelescopeSelection = { fg = palette.text, bg = "NONE", bold = styles.bold },
        }
        for group, highlight in pairs(transparency_highlights) do
            highlights[group] = highlight
        end
    end

    for group, highlight in pairs(highlights) do
        if highlight.blend and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg then
            highlight.bg = utilities.blend(highlight.bg, highlight.blend_on or palette.base, highlight.blend / 100)
        end
        highlight.blend = nil
        highlight.blend_on = nil
        vim.api.nvim_set_hl(0, group, highlight)
    end

    if config.enable_terminal then
        vim.g.terminal_color_0 = palette.overlay
        vim.g.terminal_color_8 = palette.subtle
        vim.g.terminal_color_1 = palette.red
        vim.g.terminal_color_9 = palette.red
        vim.g.terminal_color_2 = palette.cyan
        vim.g.terminal_color_10 = palette.cyan
        vim.g.terminal_color_3 = palette.yellow
        vim.g.terminal_color_11 = palette.yellow
        vim.g.terminal_color_4 = palette.blue
        vim.g.terminal_color_12 = palette.blue
        vim.g.terminal_color_5 = palette.purple
        vim.g.terminal_color_13 = palette.purple
        vim.g.terminal_color_6 = palette.magenta
        vim.g.terminal_color_14 = palette.magenta
        vim.g.terminal_color_7 = palette.text
        vim.g.terminal_color_15 = palette.text

        vim.cmd([[
			augroup colorscheme
				autocmd!
				autocmd TermOpen * if &buftype=='terminal'
					\|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
					\|else|setlocal winhighlight=|endif
				autocmd ColorSchemePre * autocmd! colorscheme
			augroup END
		]])
    end
end

function M.load()
    vim.opt.termguicolors = true
    vim.o.background = "dark"

    if vim.g.colors_name then
        vim.cmd("hi clear")
        vim.cmd("syntax reset")
    end
    vim.g.colors_name = "colorscheme"

    set_highlights()
end

-- The setup function is kept for compatibility with plugin managers
-- but it simply calls the colorscheme function directly.
function M.setup(options)
    -- For simplicity, user options are now edited directly in config.lua
    -- This setup function will just load the theme.
    M.load()
end

return M
