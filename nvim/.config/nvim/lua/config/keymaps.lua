-- Definição da Leader Key como Espaço
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ## Abas/TABs
vim.keymap.set("n", "<C-w>tn", ":tabnew<CR>", {
	noremap = true,
	silent = true,
	desc = "Abas/TABs: Criar Nova Aba",
})

-- ## Buffers
vim.keymap.set("n", "<C-w>bmt", "<C-w>T", {
	noremap = true,
	silent = true,
	desc = "Buffers: Mover Buffer Current/Atual para Nova Aba/TABs",
})

-- Navegação entre os buffers
vim.keymap.set("n", "<C-j>", ":bprev<CR>", { desc = "Próximo Buffer" })
vim.keymap.set("n", "<C-k>", ":bnext<CR>", { desc = "Buffer Anterior" })

-- Navegação entre as abas
vim.keymap.set("n", "<C-h>", "<C-w><C-k>", { desc = "Move o foco para a janela de cima" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move o foco para a janela da direita" })

-- # Nvim Tree
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toogle  Nvim Tree" }) -- Map. C-b para a janela da abrir e fechar o NvimTree

-- Adicionar nova linha sem ficar no modo edição
vim.keymap.set("n", "op", "o<Esc>k", { desc = "Adicionar nova linha abaixo no Modo Normal" })
vim.keymap.set("n", "oi", "O<Esc>j", { desc = "Adicionar nova linha acima no Modo Normal" })
vim.keymap.set("n", "oo", "A<CR>", { desc = "Adicionar nova linha no Modo Normal" })

vim.keymap.set(
	"n",
	"<Esc>",
	"<cmd>nohlsearch<CR>",
	{ desc = "Limpar os destaques da busca ao pressionar <Esc> no modo normal" }
)

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnóstico para Keymaps ([Q]uickfix)" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move as linhas selecinadas para cima" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move as linhas selecinadas para baixo" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Mantém o cursor parado ao colar" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Centraliza o cursor no meio da tela ao pular uma página para cima" })
vim.keymap.set(
	"n",
	"<C-u>",
	"<C-u>zz",
	{ desc = "Centraliza o cursor no meio da tela ao pular uma página para baixo" }
)

vim.keymap.set(
	"n",
	"n",
	"nzzzv",
	{ desc = "Centraliza o cursor no meio da tela ao pular para a próxima ocorrência da busca" }
)
vim.keymap.set(
	"n",
	"N",
	"Nzzzv",
	{ desc = "Centraliza o cursor no meio da tela ao pular para a ocorrência da busca anterior " }
)

vim.keymap.set(
	"x",
	"<leader>p",
	[["_dP]],
	{ desc = "Permite manter o conteúdo do buffer do clipboard ao colar em cima algo" }
)

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copia algo para o Clipboard do sistema" })
-- vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Copia algo para o Clipboard do sistema' })

vim.keymap.set(
	"n",
	"<C-f>",
	"<cmd>silent !tmux neww tmux-sessionizer<CR>",
	{ desc = "Abrir uma nova sessão do tmux (eu acho)" }
)

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Abre um menu para substituir com regex a palavra que o cursor está em cima" }
)

--  Sair do modo terminal interno do nvim, pode não funcionar em todos os terminais
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--- TESTES DE KEYMAPS
vim.keymap.set("i", "<A-j>", ":bprev<CR>", { desc = "TESTE DE KEYBIND" })
vim.keymap.set({ "n", "v", "i" }, "<F1>", ":w<CR>", { noremap = true, desc = "Salvar Arquivo (@PessoalMap)" })
vim.keymap.set({ "i" }, "<F1>", "<ESC>:w<CR>", { noremap = true, desc = "Salvar Arquivo (@PessoalMap)" })
-- vim.keymap.set({ "n" }, "<C-F1>", ":bprev<CR>", { noremap = true, desc = "Salvar Arquivo (@PessoalMap)" })
