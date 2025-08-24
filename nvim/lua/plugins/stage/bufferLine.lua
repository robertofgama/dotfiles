-- # Bufferline (@akinsho)
-- https://github.com/akinsho/bufferline.nvim

-- ## Descrição
-- Plugin para exibir os buffers abertos no Neovim.

return {
	'akinsho/bufferline.nvim',
	name = '.Bufferline (@akinsho)',
	enabled = true,
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {},
	config = function()
		require('bufferline').setup {
			options = {
				-- mode = {'buffers', 'buffers'},
				offsets = {
					{
						filetype = 'neo-tree',
						text = 'File Explorer',
						highlight = 'Directory',
						separator = true,
					},
				},
			},
		}
		vim.opt.termguicolors = true
	end,
}
