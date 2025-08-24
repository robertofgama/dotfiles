-- Baseado no EP4 da playlist do Typecraft

return {
  'nvimtools/none-ls.nvim',
  name = '.None LS (@nvimtools)',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.erb_lint,			
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
				null_ls.builtins.code_actions.eslint,
      },
    }

    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {
      desc = 'LSP: Formatar Código (@noneLS)',
    })
  end,
}
