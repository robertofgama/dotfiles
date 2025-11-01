-- # Telescope
-- https://github.com/nvim-telescope/telescope.nvim
-- ## Descrição: Fuzzy Finder de arquivos e muito mais.
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	name = "Telescope (@nvim-telescope)",
	enabled = true,
	-- priority = 50
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
		{ "jvgrootveld/telescope-zoxide", name = "Telescope Zoxide (@jvgrootveld)" },

		{ "nvim-lua/popup.nvim" },
	},

	config = function()
		local builtin = require("telescope.builtin")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
					},
				},
			},

			pickers = {},

			extensions = {
				["ui-select"] = { require("telescope.themes").get_dropdown() },
			},
		})

		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "fzf")

		-- ###############      KEYMAPS      ############### --

		vim.keymap.set("n", "<leader><leader>", builtin.buffers, {
			desc = "[ ] Buscar nos buffers existentes abertos (@Telescope)",
		})

		vim.keymap.set("n", "<leader>b.", builtin.oldfiles, {
			desc = "[B]uscar [.] Arquivos Recentes (@Telescope)",
		})

		vim.keymap.set("n", "<leader>bp", builtin.grep_string, {
			desc = "[B]uscar [P]alavra selecionada (@Telescope)",
		})

		vim.keymap.set("n", "<leader>bf", builtin.find_files, {
			desc = "[B]uscar [F]iles (@Telescope)",
		})

		vim.keymap.set("n", "<leader>bg", builtin.live_grep, {
			desc = "[B]uscar arquivos com [G]rep (@Telescope)",
		})

		vim.keymap.set({ "n", "v" }, "<Leader>bm", function()
			require("telescope").extensions.macroni.saved_macros()
		end, { desc = "[B]uscar [M]acros (@Telescope)" })

		vim.keymap.set("n", "<leader>bd", builtin.diagnostics, {
			desc = "[B]uscar [D] agnostics (@Telescope)",
		})

		vim.keymap.set("n", "<leader>bu", builtin.resume, {
			desc = "[B]uscar [U]ltima Busca (@Telescope)",
		})

		-- vim.keymap.set("n", "<leader>bt", ":TodoTelescope<CR>", {
		-- 	desc = "[B]uscar [T]odos/Tarefas (@Telescope)",
		-- })
		-- BUSCAR VIM
		vim.keymap.set("n", "<leader>bva", builtin.help_tags, {
			desc = "[B]uscar [V]im: [A]juda (@Telescope)",
		})

		vim.keymap.set("n", "<leader>bvk", builtin.keymaps, {
			desc = "[B]uscar [V]im: [K]eymaps (@Telescope)",
		})

		vim.keymap.set("n", "<leader>bvt", builtin.builtin, {
			desc = "[B]uscar [V]im: Funções do [T]elescope (@Telescope)",
		})
		-- Buscar no buffer atual, com remapeamento da janela para um popup diferente
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 20,
				previewer = false,
			}))
		end, {
			desc = "[/] Buscar no buffer atual (@Telescope)",
		})

		-- Configuration for Telescope Zoxide
		local t = require("telescope")
		local z_utils = require("telescope._extensions.zoxide.utils")

		-- Configure the extension
		t.setup({
			extensions = {
				zoxide = {
					prompt_title = "[ Walking on the shoulders of TJ ]",
					mappings = {
						default = {
							after_action = function(selection)
								print("Update to (" .. selection.z_score .. ") " .. selection.path)
							end,
						},
						["<C-s>"] = {
							before_action = function(selection)
								print("before C-s")
							end,
							action = function(selection)
								vim.cmd.edit(selection.path)
							end,
						},
						["<C-q>"] = { action = z_utils.create_basic_command("split") },
					},
				},
			},
		})

		-- Load the extension
		t.load_extension("zoxide")

		-- Add a mapping
		vim.keymap.set("n", "<leader>bz", t.extensions.zoxide.list)
	end,
}
