-- #
-- https://github.com/

-- ## Descrição:

return {
	"barrett-ruth/live-server.nvim",
	name = "Live Server (@barrett-ruth)",
	enabled = true,
	build = "pnpm add -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	-- opts = {},
	-- config = function()
	-- end
	config = true,
}
