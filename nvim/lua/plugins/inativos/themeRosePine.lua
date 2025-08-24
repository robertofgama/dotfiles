-- # Tema: Rosé Pine
-- https://github.com/rose-pine/neovim

-- ## Descrição:
-- Tema para o neovim "Todo em pinho natural, pele sintética e um pouco de vibe soho para o minimalista elegante".

return {
  'rose-pine/neovim',
  name = 'Theme RosePine (@rose-pine)',
  enabled = false,
  -- priority = 50
  config = function()
    vim.cmd 'colorscheme rose-pine'
  end,
}
