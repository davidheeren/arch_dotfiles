-- Minimal setup with Kanagawa-inspired colors
return {
    "y3owk1n/base16-pro-max.nvim",
    priority = 1000,
    config = function()
        require("base16-pro-max").setup {
            colors = require("colorscheme.colors"),
            -- colors = {
            --   base00 = "#1f1f28", base01 = "#2a2a37", base02 = "#3a3a4e",
            --   base03 = "#4e4e5e", base04 = "#9e9eaf", base05 = "#c5c5da",
            --   base06 = "#dfdfef", base07 = "#e6e6f0", base08 = "#ff5f87",
            --   base09 = "#ff8700", base0A = "#ffaf00", base0B = "#5fff87",
            --   base0C = "#5fd7ff", base0D = "#5fafff", base0E = "#af87ff",
            --   base0F = "#d7875f",
            -- },
            styles = { italic = true, transparency = true },
            plugins = { enable_all = true },
        }
        vim.cmd.colorscheme "base16-pro-max"
    end,
}
