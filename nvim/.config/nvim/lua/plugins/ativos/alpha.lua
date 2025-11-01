-- # Alpha (@goolord)
-- https://github.com/goolord/alpha-nvim
--
-- ## Descrição:
-- Tela de boas vindas do NeoVim.

return {
	"goolord/alpha-nvim",
	name = ".Alpha (@goolord)",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	----priority = 50,

	config = function()
		local startify = require("alpha.themes.startify")
		-- available: devicons, mini, default is mini
		-- if provider not loaded and enabled is true, it will try to use another provider
		startify.file_icons.provider = "devicons"
		require("alpha").setup(startify.config)
	end,
}
