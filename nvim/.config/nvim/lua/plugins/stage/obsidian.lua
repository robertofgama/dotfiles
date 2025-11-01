-- # Obsidian (@epwalsh)
-- https://github.com/epwalsh/obsidian.nvim
-- ## Descrição:
return {
	"epwalsh/obsidian.nvim",
	name = "Obsidian (@epwalsh)",
	enabled = true,
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "VAULT_75",
					path = vim.fn.expand("~/Notas/Obsidian/VAULT_75/"),
				},
			},
			-- Configurações adicionais recomendadas
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			templates = {
				subdir = "Notas/99. USR/Modelos/Notas/",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			},
			note_id_func = function(title)
				-- Gera IDs únicos para as notas
				local suffix = ""
				if title ~= nil then
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,
			note_frontmatter_func = function(note)
				-- Adiciona frontmatter personalizado às notas
				if note.title then
					note:add_alias(note.title)
				end
				if note.metadata.tags and #note.metadata.tags > 0 then
					note:add_tags(note.metadata.tags)
				end
			end,
			ui = {
				enable = true,
				update_debounce = 200,
				checkboxes = {
					[" "] = {
						char = "󰄱",
						hl_group = "ObsidianTodo",
					},
					["x"] = {
						char = "󰄲",
						hl_group = "ObsidianDone",
					},
					[">"] = {
						char = "󰐕",
						hl_group = "ObsidianRightArrow",
					},
					["~"] = {
						char = "󰘸",
						hl_group = "ObsidianTilde",
					},
				},
			},
			attachments = {
				img_folder = "assets/imgs",
				img_text_func = function(client, path)
					return string.format("![%s](%s)", path.name, client:vault_relative_path(path))
				end,
			},
		})
		--
		-- Configração de Conceal (ocultação de caracteres) para arquivos markdown
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.opt.conceallevel = 1
			end,
		})

		-- Configurar mapeamentos separadamente
		vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", {
			desc = "Obsidian: Backlinks (@Obsidian)",
		})

		-- :ObsidianTomorrow to open/create the daily note for the next working day.
		vim.keymap.set(
			"n",
			"<leader>oda",
			"<cmd>ObsidianTomorrow<CR>",
			{ desc = "Obsidian: Daily Note > Amanhã (Diárias/Diários) (@Obsidian)" }
		)

		-- :ObsidianToday [OFFSET] to open/create a new daily note. This command also takes an optional offset in days, e.g. use :ObsidianToday -1 to go to yesterday's note. Unlike :ObsidianYesterday and :ObsidianTomorrow this command does not differentiate between weekdays and weekends.
		vim.keymap.set(
			"n",
			"<leader>odh",
			"<cmd>ObsidianToday<CR>",
			{ desc = "Obsidian: Daily Note > Hoje (Diárias/Diários) (@Obsidian)" }
		)

		-- :ObsidianYesterday to open/create the daily note for the previous working day.
		vim.keymap.set(
			"n",
			"<leader>odo",
			"<cmd>ObsidianYesterday<CR>",
			{ desc = "Obsidian: Daily Note > Ontem (Diárias/Diários) (@Obsidian)" }
		)

		-- :ObsidianDailies [OFFSET ...] to open a picker list of daily notes. For example, :ObsidianDailies -2 1 to list daily notes from 2 days ago until tomorrow.
		vim.keymap.set(
			"n",
			"<leader>ods",
			"<cmd>ObsidianDailies<CR>",
			{ desc = "Obsidian: Daily Note > Buscar Dia (Diárias/Diários) (@Obsidian)" }
		)

		vim.keymap.set("n", "<leader>ol", function()
			return require("obsidian").util.gf_passthrough()
		end, {
			noremap = false,
			expr = true,
			buffer = true,
			desc = "Obsidian: Go/Ir Link (@Obsidian)",
		})

		vim.keymap.set("n", "<leader>olv", "<cmd>ObsidianFollowLink vsplit<CR>", {
			desc = "Obsidian: Go/Ir Link, Split Vertical (@Obsidian)",
		})

		vim.keymap.set("n", "<leader>olh", "<cmd>ObsidianFollowLink vsplit<CR>", {
			desc = "Obsidian: Go/Ir Link, Split Horizontal (@Obsidian)",
		})

		vim.keymap.set("n", "<leader>oi", "<cmd>ObsidianTOC<CR>", {
			desc = "Obsidian: Indice (Table of Contents) (@Obsidian)",
		})
		vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", {
			desc = "Obsidian: Nova nota (@Obsidian)",
		})

		vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", {
			desc = "Obsidian: Abrir no Obsidian (@Obsidian)",
		})

		vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", {
			desc = "Obsidian: Search/Buscar no vault (@Obsidian)",
		})

		-- :ObsidianTags [TAG ...] for getting a picker list of all occurrences of the given tags.
		vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<CR>", { desc = "Obsidian: Tags do Obsidian  (@Obsidian)" })

		-- :ObsidianQuickSwitch to quickly switch to (or open) another note in your vault, searching by its name using ripgrep with your preferred picker (see plugin dependencies below).
		vim.keymap.set(
			"n",
			"<leader>oxq",
			"<cmd>ObsidianQuickSwitch<CR>",
			{ desc = "Obsidian: Troca Rápida / Quick Switch  (@Obsidian)" }
		)

		-- :ObsidianTemplate [NAME] to insert a template from the templates folder, selecting from a list using your preferred picker. See "using templates" for more information.
		vim.keymap.set("n", "<leader>ox1", "<cmd>ObsidianTemplate<CR>", { desc = "Obsidian:  (@Obsidian)" })

		-- :ObsidianLink [QUERY] to link an inline visual selection of text to a note. This command has one optional argument: a query that will be used to resolve the note by ID, path, or alias. If not given, the selected text will be used as the query.
		vim.keymap.set("n", "<leader>ox2", "<cmd>ObsidianLink<CR>", { desc = "Obsidian:  (@Obsidian)" })

		-- :ObsidianLinkNew [TITLE] to create a new note and link it to an inline visual selection of text. This command has one optional argument: the title of the new note. If not given, the selected text will be used as the title.
		vim.keymap.set("n", "<leader>ox3", "<cmd>ObsidianLinkNew<CR>", { desc = "Obsidian:  (@Obsidian)" })

		-- :ObsidianLinks to collect all links within the current buffer into a picker window.
		vim.keymap.set("n", "<leader>ox4", "<cmd>ObsidianLinks<CR>", { desc = "Obsidian:  (@Obsidian)" })

		-- :ObsidianExtractNote [TITLE] to extract the visually selected text into a new note and link to it.
		vim.keymap.set("n", "<leader>ox5", "<cmd>ObsidianExtractNote<CR>", { desc = "Obsidian:  (@Obsidian)" })

		-- :ObsidianWorkspace [NAME] to switch to another workspace.
		vim.keymap.set("n", "<leader>ox6", "<cmd>ObsidianWorkspace<CR>", { desc = "Obsidian:  (@Obsidian)" })

		-- :ObsidianPasteImg [IMGNAME] to paste an image from the clipboard into the note at the cursor position by saving it to the vault and adding a markdown image link. You can configure the default folder to save images to with the attachments.img_folder option.
		vim.keymap.set("n", "<leader>ox7", "<cmd>ObsidianPasteImg<CR>", { desc = "Obsidian:  (@Obsidian)" })

		-- :ObsidianRename [NEWNAME] [--dry-run] to rename the note of the current buffer or reference under the cursor, updating all backlinks across the vault. Since this command is still relatively new and could potentially write a lot of changes to your vault, I highly recommend committing the current state of your vault (if you're using version control) before running it, or doing a dry-run first by appending "--dry-run" to the command, e.g. :ObsidianRename new-id --dry-run.
		vim.keymap.set("n", "<leader>ox8", "<cmd>ObsidianRename<CR>", { desc = "Obsidian:  (@Obsidian)" })

		-- :ObsidianToggleCheckbox to cycle through checkbox options.
		vim.keymap.set("n", "<leader>ox9", "<cmd>ObsidianToggleCheckbox<CR>", { desc = "Obsidian:  (@Obsidian)" })

		-- :ObsidianNewFromTemplate [TITLE] to create a new note from a template in the templates folder. Selecting from a list using your preferred picker. This command has one optional argument: the title of the new note.
		vim.keymap.set("n", "<leader>oxc", "<cmd>ObsidianNewFromTemplate<CR>", { desc = "Obsidian:  (@Obsidian)" })
	end,
}
