-- https://github.com/USR/PLUGIN
-- ## Descrição:
-- Baseado no EP5 da playlist do Typecraft
return {
	{
		"hrsh7th/cmp-nvim-lsp",
		name = "CMP Nvim LSP (@hrsh7th)",
		enabled = true,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		-- name = "LuaSnip by @L3MON4D3",
		enabled = true,
		dependencies = {
			"saadparwaiz1/cmp_luasnip", -- 'rafamadriz/friendly-snippets',
		},
	},
	{
		"hrsh7th/nvim-cmp",
		name = "Nvim CMP (@hrsh7th)",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { "~/.config/snippets/pessoais/" },
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-i>"] = cmp.mapping.complete(),
					["<leader>ai"] = cmp.mapping.open_docs,
					["<C-e>"] = cmp.mapping.abort(),
					-- ['<CR>'] = cmp.mapping.confirm { select = true },
					---------------------------------------------------
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{
						name = "nvim_lsp",
					},
					{
						name = "luasnip",
					}, -- For luasnip users.
				}, {
					{
						name = "buffer",
					},
					{
						name = "emoji",
					},
					{
						name = "path",
					},
				}),
			})
			-- CMD Line Configurações
			-- Configurações do :
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources(
					{ {
						name = "path",
					} },
					{ {
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					} }
				),
			})
			-- Configurações do /
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { {
					name = "buffer",
				} },
			})
			-- Estava no arquivo principal
			vim.keymap.set("i", "<C-j>", function()
				require("cmp").complete()
			end, {
				desc = "LSP-CA: Disparar sugestões de completação (@LspConfig)",
			})
		end,
	},
	{
		"hrsh7th/cmp-path",
		name = ".CMP Path (@hrsh7th)",
		enabled = true,
	},
	{
		"hrsh7th/cmp-cmdline",
		name = ".CMP CmdLine (@hrsh7th)",
		enabled = true,
	},
	{
		"hrsh7th/cmp-buffer",
		name = ".CMP Buffer (@hrsh7th)",
		enabled = true,
	},
	{
		"hrsh7th/cmp-emoji",
		name = ".CMP Emoji (@hrsh7th)",
		enabled = true,
		-- config = function()
		-- 	require('cmp').setup {
		-- 		sources = {
		-- 			{ name = 'emoji' },
		-- 		},
		-- 	}
		-- end,
	},
}
