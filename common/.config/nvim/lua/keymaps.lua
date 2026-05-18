vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>e", vim.diagnostic.setqflist)

vim.keymap.set("n", "<leader>i", ":CccPick<CR>")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y')
-- vim.keymap.set({ "n", "v", "x" }, "<leader>Y", '"+Y')
vim.keymap.set({ "n", "v", "x" }, "<leader>Y", '"+Y', { remap = true })
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d')
vim.keymap.set({ "n", "v", "x" }, "<leader>D", '"+D')
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v", "x" }, "<leader>P", '"+P')

vim.keymap.set("n", "<leader>o", "o<esc>")
vim.keymap.set("n", "<leader>O", "O<esc>")

-- vim.keymap.set("n", "<M-j>", "<C-w>j")
-- vim.keymap.set("n", "<M-k>", "<C-w>k")
-- vim.keymap.set("n", "<M-h>", "<C-w>h")
-- vim.keymap.set("n", "<M-l>", "<C-w>l")

-- vim.keymap.set("n", "<C-b>", "<cmd>b#<cr>")
vim.keymap.set("n", "grd", vim.lsp.buf.definition)

-- Select last pasted text
vim.keymap.set("n", "gp", "`[v`]")

vim.keymap.set("n", "<leader>te", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

-- Define the function to toggle the quickfix window
local function toggle_quickfix()
    -- Check if there is an active quickfix window
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid

    -- If a quickfix window exists, close it; otherwise, open it
    if qf_winid > 0 then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end

-- Map <Leader>c to the toggle_quickfix function
vim.keymap.set("n", "<Leader>c", toggle_quickfix, { desc = "Toggle Quickfix List" })

-- WRITING
-- linebreak
-- navigation?
-- spell
