-- # Commentary
-- https://github.com/tpope/vim-commentary

-- ## Descrição:
-- Auxiliar na criação de comentários.

-- # Keymaps
-- `gcc`: Comenta uma linha inteira
-- `gc`: Comenta o alvo do Vim Motion (ex.: gcap comentará todo o paragrafo)
--
-- Ainda pode ser usado como um comando onde `:7,17Commentary` comentará o range de 7 à 17.


return {
  'tpope/vim-commentary',
  name = '.Commentary (@tpope)',
  enabled = true,
  ----priority = 50
}
