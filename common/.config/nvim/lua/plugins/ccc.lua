return {
    "uga-rosa/ccc.nvim",
    -- cmd = "CccPick",
    config = function()
        local ccc = require("ccc")
        -- local mapping = ccc.mapping

        ccc.setup({
            -- Your preferred settings
            -- Example: enable highlighter
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
            --
            -- inputs = {
            --     ccc.input.hsl,
            --     ccc.input.rgb,
            --     ccc.input.cmyk,
            -- },
        })
    end,
}
