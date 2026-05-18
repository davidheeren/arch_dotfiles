return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        local conf = require("telescope.config").values
        harpoon:setup()

        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "Add Window to Harpoon" })

        vim.keymap.set("n", "<leader>hc", function()
            harpoon:list():clear()
        end, { desc = "Clear all Harpoons" })

        vim.keymap.set("n", "<leader>hl", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Show Harpoon List" })

        vim.keymap.set("n", "<leader>hn", function()
            harpoon:list():next({ ui_nav_wrap = true })
        end, { desc = "Go to Next Harpoon" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hp", function()
            harpoon:list():prev({ ui_nav_wrap = true })
        end, { desc = "Go to Previous Harpoon" })

        -- Numbers
        for i = 0, 9 do
            local idx = (i == 0 and 10) or i
            vim.keymap.set("n", "<leader>h" .. i, function()
                harpoon:list():select(idx)
            end, { desc = "Harpoon go to file " .. idx })
        end

        -- basic telescope configuration
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                })
                :find()
        end

        vim.keymap.set("n", "<leader>hs", function()
            toggle_telescope(harpoon:list())
        end, { desc = "Open Harpoon Search" })
    end,
}
