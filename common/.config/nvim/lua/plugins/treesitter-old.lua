return {
    {
        'nvim-treesitter/nvim-treesitter',
        -- update parsers
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
}
