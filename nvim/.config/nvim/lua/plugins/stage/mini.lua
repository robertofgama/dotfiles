-- # Mini Nvim (@echasnovski)
-- https://github.com/echasnovski/mini.nvim

-- ## Descrição:
-- Coleção de vários plugins.

return {
  'echasnovski/mini.map',
  version = '*',
  keys = function (_, keys)
    local minimap = require('mini.map');
    return {
      {
        "<leader>Mm",
        minimap.toggle,
        desc = "Toggle Mini Map (@Mini.Map)"
      },
    }
  end,
}
