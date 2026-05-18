return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.surround").setup({
                mappings = {
                    add = '<leader>ma',            -- Add surrounding in Normal and Visual modes
                    delete = '<leader>md',         -- Delete surrounding
                    find = '<leader>mf',           -- Find surrounding (to the right)
                    find_left = '<leader>mF',      -- Find surrounding (to the left)
                    highlight = '<leader>mh',      -- Highlight surrounding
                    replace = '<leader>mr',        -- Replace surrounding
                    update_n_lines = '<leader>mn', -- Update `n_lines`
                    suffix_last = 'l',             -- Suffix to search with "prev" method
                    suffix_next = 'n',             -- Suffix to search with "next" method
                },

                -- https://www.reddit.com/r/neovim/comments/1jetfeg/help_with_minisurround/
                custom_surroundings = {
                    T = {
                        input = { '<(%w+)[^<>]->.-</%1>', '^<()%w+().*</()%w+()>$' },
                        output = function()
                            local tag_name = MiniSurround.user_input('Tag name')
                            if tag_name == nil then return nil end
                            return { left = tag_name, right = tag_name }
                        end,
                    },
                },

                n_lines = 9999,
            })
        end,
    },
}
