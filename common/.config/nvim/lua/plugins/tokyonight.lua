return {
  {
    'folke/tokyonight.nvim',
    config = function()
      -- require('tokyonight').setup {
      --   styles = {
      --     comments = { italic = false },   -- Disable italics in comments
      --   },
      -- }
      --
      vim.cmd.colorscheme 'tokyonight-night'
      -- vim.cmd.colorscheme 'tokyonight-storm'
      -- vim.cmd.colorscheme 'tokyonight-moon'
      -- vim.cmd.colorscheme 'tokyonight-day'
    end,
  },
}
