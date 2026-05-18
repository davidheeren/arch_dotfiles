vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
    group = vim.api.nvim_create_augroup("PlaceCursor", { clear = true }),
    pattern = '*',
    command = 'silent! normal! g`"zv',
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--     callback = function(args)
--         vim.treesitter.start(args.buf)
--     end,
-- })
