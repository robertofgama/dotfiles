-- # Close Buffers (@kazhala)
-- https://github.com/kazhala/close-buffers.nvim

-- ## Descrição:
-- Utilitário para fechar buffers abertos.

return {
	"kazhala/close-buffers.nvim",
	name = "Close Buffers (@kazhala)",
	enabled = true,
	-- opts = {},
	config = function()
		require("close_buffers").setup({
			filetype_ignore = {}, -- Filetype to ignore when running deletions
			file_glob_ignore = {}, -- File name glob pattern to ignore when running deletions (e.g. '*.md')
			file_regex_ignore = {}, -- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
			preserve_window_layout = { "this", "nameless" }, -- Types of deletion that should preserve the window layout
			next_buffer_cmd = nil, -- Custom function to retrieve the next buffer when preserving window layout
		})

		vim.api.nvim_set_keymap("n", "<c-w>bca", [[<CMD>lua require('close_buffers').delete({type = 'all'})<CR>]], {
			noremap = true,
			silent = true,
			desc = "Buffers: Fechar All/Todos Buffer  (@CloseBuffers)",
		})

		vim.api.nvim_set_keymap("n", "<c-w>bcc", [[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]], {
			noremap = true,
			silent = true,
			desc = "Buffers: Fechar Buffer Current/Atual (@CloseBuffers)",
		})

		vim.api.nvim_set_keymap("n", "<c-w>bco", [[<CMD>lua require('close_buffers').delete({type = 'other'})<CR>]], {
			noremap = true,
			silent = true,
			desc = "Buffers: Fechar Buffer Outros (@CloseBuffers)",
		})
	end,
}
