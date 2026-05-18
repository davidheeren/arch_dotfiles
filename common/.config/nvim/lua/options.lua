vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Global indent settings
vim.opt.tabstop = 4      -- How many spaces a <Tab> counts for
vim.opt.shiftwidth = 4   -- How many spaces for >> and <<
vim.opt.softtabstop = 4  -- How many spaces when pressing <Tab>
vim.opt.expandtab = true -- Use spaces instead of tabs

-- vim.o.termguicolors = false

vim.g.have_nerd_font = true

-- Boarder radius for all windows
vim.opt.winborder = 'rounded'

vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- vim.opt.timeoutlen = 200

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
vim.opt.confirm = true
