-- # LLM (@huggingface)
-- https://github.com/huggingface/llm.nvim

-- ## Descrição:

return {
  'huggingface/llm.nvim',
  name = 'LLM (@huggingface)',
  enabled = false,
  event = { 'BufReadPre *.js,*.jsx,*.ts,*.tsx,*.kt,*.lua' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    backend = 'ollama',
    model = 'codellama:7b',
    url = 'http://127.0.0.1:11434',
    enable_suggestions_on_startup = true,
    suggestion = { enabled = true },
    request_body = { options = { temperature = 0.2, top_p = 0.95 } },
    accept_keymap = '<Tab>',
    dismiss_keymap = '<S-Tab>',
    capabilities = capabilities,
  },
}
