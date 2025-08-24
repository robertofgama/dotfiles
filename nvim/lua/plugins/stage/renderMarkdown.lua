-- # Render Markdown (@MeanderingProgrammer)
-- https://github.com/MeanderingProgrammer/render-markdown.nvim

-- ## Descrição:

return {
  'MeanderingProgrammer/render-markdown.nvim',
  name = '.Render Markdown (@MeanderingProgrammer)',
  enabled = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  -- config = function()
  --   require('obsidian').setup {
  --     ui = { enable = false },
  --   }
  -- end,
}
