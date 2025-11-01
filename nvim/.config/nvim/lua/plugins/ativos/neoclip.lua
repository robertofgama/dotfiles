-- # NeoClip (@AckslD)
-- https://github.com/AckslD/nvim-neoclip.lua

-- ## Descrição:
-- Gerenciador de área de transferência, com integração ao Telescope e persisência de dados.

return {
	"AckslD/nvim-neoclip.lua",
	name = "NeoClip (@AckslD)",
	enabled = true,
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "kkharji/sqlite.lua", module = "sqlite" },
	},
	-- opts = {},
	config = function()
		require("neoclip").setup({
			enable_persistent_history = true,
			db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
		})

		vim.keymap.set("n", "<leader>bc", ":Telescope neoclip<CR>", {
			desc = "NeoClip: Abrir NeoClip Gerenciador de Clipboard/Area de Transferencia (@Neoclip)",
		})
	end,
}
