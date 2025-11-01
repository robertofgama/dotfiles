-- Baseado no EP4 da playlist do Typecraft

return {
	"nvimtools/none-ls.nvim",
	name = ".None LS (@nvimtools)",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.code_actions.eslint,
			},
		})

		vim.keymap.set("n", "gf", vim.lsp.buf.format, {
			desc = "LSP-CA: Formatar Código (@noneLS)",
		})
	end,
}
