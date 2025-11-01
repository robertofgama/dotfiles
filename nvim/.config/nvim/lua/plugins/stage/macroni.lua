-- # Macroni (@jesseleite)
-- https://github.com/jesseleite/nvim-macroni

-- ## Descrição: Gestor de Macros

return {
  'jesseleite/nvim-macroni',
  name = 'Macroni (@jesseleite)',
  enabled = true,
  lazy = false,
  config = function()
    require('macroni').setup {
      macros = {
        Markdown_Tarefa = {
          macro = '^i-<Space>[<Space>]<Space><Esc>',
          desc = 'Cria uma tarefa em Markdown',
        },
        JS_ConsoleLog = {
          macro = "yi<End><CR>console.log(<Esc>i<Right>'<Esc>pi<Right><End>:<Space>',<Space><Esc>pa)<Esc>",
          keymap = '<Leader>t',
          desc = 'Console log do conteúdo selecionado.',
        },
        Geral_Teste = {
          macro = 'y<Space>aa<Esc><Esc>p',
          desc = 'Console log do conteúdo selecionado.',
        },
      },
    }
  end,
}
