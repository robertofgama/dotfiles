-- # Theme Synthweave (@samharju)
-- https://github.com/samharju/synthweave.nvim

-- ## Descrição:

return {
  'samharju/synthweave.nvim',
  name = 'Theme Synthweave (@samharju)',
  enabled = true,
  lazy = false,
  priority = 1000,
  -- opts = {},
  config = function()
    vim.cmd.colorscheme 'synthweave'
    local synthweave = require 'synthweave'
    synthweave.setup {
      palette = {
        -- bg0 = '#4B1035',
        -- bg0 = '#FF0000',
      },
    }
    synthweave.load()
  end,
}
