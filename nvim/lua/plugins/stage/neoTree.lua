-- # Neo Tree
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- ## Descrição:
-- Gerenciador de arquivos
return {
	"nvim-neo-tree/neo-tree.nvim",
	name = ".Neo Tree (@nvim-neo-tree)",
	branch = "v3.x",
	enabled = true,
	----priority = 50,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim", -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		-- vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal left<CR>')
		vim.keymap.set("n", "<C-b>", ":Neotree toggle show<CR>", {
			desc = "Toogle explorador de arquivos (@Neotree)",
		})
		vim.keymap.set("n", "<C-e>", ":Neotree reveal<CR>", {
			desc = "Revelar arquivo atual no explorador de arquivos (@Neotree)",
		})

		-- vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toogle  Nvim Tree' }) -- Map. C-b para a janela da abrir e fechar o NvimTree
	end,
}
