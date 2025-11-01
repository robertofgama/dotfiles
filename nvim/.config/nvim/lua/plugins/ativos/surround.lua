-- # [Surround (@tpope)](https://github.com/tpope/vim-surround)
--
-- ## Descrição:
-- Edicã́o de cercamentos.

-- return {
-- 	"tpope/vim-surround",
-- 	name = "Surround (@tpope)",
-- 	enabled = true,
-- 	-- opts = {}
-- 	-- config = function()
-- 	-- end
-- }

-- # Nvim Surround (@kylechui)
-- https://github.com/kylechui/nvim-surround

-- ## Descrição:
-- Nvim Surround é um plugin semelhante ao vim-surround entretanto reescrito com uma sintaxe em lua para o neovim.

return {
	"kylechui/nvim-surround",
	name = "Nvim Surround (@kylechui)",
	enabled = true,
	version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}
