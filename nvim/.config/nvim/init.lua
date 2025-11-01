-- ###     Configurações Pessoais do NeoVim     ### --
-- ###                                          ### --
require("config.configs") -- Configurações
require("config.keymaps") -- Keymaps
require("config.macros") -- Macros

vim.o.termguicolors = true

-- ###                 Plugins                  ### --
require("config.lazyVim") -- Lazy.Nvim: Plugin Manager
