-- # Nvim Treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
-- ## Descrição:
-- Language Highliting e indentação
return {
	"nvim-treesitter/nvim-treesitter",
	name = "Tree Sitter (@nvim-treesitter)",
	enabled = true,
	--  --priority = 50
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Lista de todos os parsers para sempre estarem instalados
			ensure_installed = {
				"astro",
				"bash",
				"css",
				"csv",
				"desktop",
				"diff",
				"dockerfile",
				"editorconfig",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"html",
				"http",
				"jsdoc",
				"json",
				"json5",
				"lua",
				"luadoc",
				"luap",
				"javascript",
				"markdown",
				"markdown_inline",
				"mermaid",
				"nginx",
				"passwd",
				"pem",
				"prisma",
				"python",
				"regex",
				"scss",
				"sql",
				"ssh_config",
				"styled",
				"superhtml",
				"tmux",
				"tsx",
				"tsv",
				"typescript",
				"udev",
				"xcompose",
				"xml",
				"yaml",
				"query",
				"vim",
				"vimdoc",
			},

			sync_install = false,

			auto_install = true,
			-- ignore_install = { "javascript" },

			highlight = {
				enable = true,
				-- disable = { "c", "rust" },
				-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
				-- disable = function(lang, buf)
				--     local max_filesize = 100 * 1024 -- 100 KB
				--     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				--     if ok and stats and stats.size > max_filesize then
				--         return true
				--     end
				-- end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			-- indent = {
			-- 	enable = true,
			-- },
		})
	end,
}
