-- # Undo Tree
-- https://github.com/mbbill/undotree

-- ## Descrição:
-- Gerenciamento do buffer do desfazer (undo).

return {
  'mbbill/undotree',
  name = '.Undo Tree (@mbbill)',
  enabled = true,
  config = function()
    -- ## Instruções Rápidas:
    -- Comando :UndotreeToggle revela a arvore de desfazimentos.
    vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle, { desc = 'Undo: Abrir Arvore de Desfazimentos (@UndoTree)' })
  end,
}
