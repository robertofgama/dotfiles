-- # Obsidian (@epwalsh)
-- https://github.com/epwalsh/obsidian.nvim

-- ## Descrição:

return {
	'epwalsh/obsidian.nvim',
	name = 'Obsidian (@epwalsh)',
	enabled = true,
	version = '*', -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = 'markdown',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		workspaces = {
			{
				name = 'VAULT_75',
				path = '~/Notas/Obsidian/VAULT_75/',
			},
		},
	}
}
