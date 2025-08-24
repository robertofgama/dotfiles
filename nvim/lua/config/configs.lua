-- ###               Configurações              ### --
-- ###    Configurações Principais do NeoVim    ### --

vim.opt.number = true -- Line Numbers: Habilita Line Numbers (numeros nas linhas)
vim.opt.relativenumber = true -- Line Numbers: Numeros relativos
vim.opt.signcolumn = 'yes' -- Line Numbers: Define configs. para a coluna de sinais, 'yes' sempre visivel,  'number' irá para coluna dos numeros

vim.g.have_nerd_font = true -- Fontes: Nerd Fonts

vim.opt.mouse = 'a' -- Mouse: Habilita Mouse

vim.opt.tabstop = 2 -- Indentação: Define o valor do caractere tab (\t)
vim.opt.softtabstop = 2 -- Indentação: Define o valor de espaços que o VIM insere na tecla TAB
vim.opt.shiftwidth = 2 -- Indentação: Define a quantidade de colunas usadas na indentação automática

vim.opt.ignorecase = true -- Ignora o case na busca
vim.opt.smartcase = true -- Usa case inteligente, havendo uma alteração de case ele não ignorará o case

vim.opt.scrolloff = 10 -- Define o numero mínimo de linhas que serão mostradas abaixo do cursor

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- ### OLD CONFIGs ##################################################################
-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false

-- Sync cliboard with OS clipboard
-- vim.schedule(function()
--     vim.opt.clipboard = 'unnamedplus'
-- end)

-- Enable break indent
-- vim.opt.breakindent = true

-- Save undo history
-- vim.opt.undofile = true

-- Decrease update time
-- vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = {
--     tab = '» ',
--     trail = '·',
--     nbsp = '␣'
-- }

-- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'

-- Show which line your cursor is on
-- vim.opt.cursorline = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd('TextYankPost', {
--     desc = 'Highlight when yanking (copying) text',
--     group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {
--         clear = true
--     }),
--     callback = function()
--         vim.highlight.on_yank()
--     end
-- })
