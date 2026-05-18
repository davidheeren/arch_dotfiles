return {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
        enable = true,
        max_lines = 3,
        mode = "cursor",
    },
    config = function(_, opts)
        require("treesitter-context").setup(opts)
    end,
}
