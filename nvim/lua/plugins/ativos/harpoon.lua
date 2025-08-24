-- # Harpoon (@ThePrimeagen)
-- https://github.com/ThePrimeagen/harpoon
-- ## Descrição:
return {
	"ThePrimeagen/harpoon",
	name = ".Harpoon (@ThePrimeagen)",
	enabled = true,
	-- opts = {}
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		-- #### KEYMAPS #### ---
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, {
			desc = "Harpoon: Adicionar à lista (@Harpoon)",
		})

		-- vim.keymap.set("n", "<C-e>", function()
		-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end, {
		-- 	desc = "Harpoon: Abrir Lista (@Harpoon)",
		-- })
		vim.keymap.set("n", "<F2>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, {
			desc = "Harpoon: Abrir Lista (@Harpoon)",
		})

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end, {
			desc = "Harpoon: Selecionar o arquivo 1 (@Harpoon)",
		})
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end, {
			desc = "Harpoon: Selecionar o arquivo 2 (@Harpoon)",
		})
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end, {
			desc = "Harpoon: Selecionar o arquivo 3 (@Harpoon)",
		})
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end, {
			desc = "Harpoon: Selecionar o arquivo 4 (@Harpoon)",
		})

		-- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set('n', '<C-S-P>', function()
		-- 	harpoon:list():prev()
		-- end, {
		-- 	desc = 'Harpoon: (@Harpoon)'
		-- })

		-- vim.keymap.set('n', '<C-S-N>', function()
		-- 	harpoon:list():next()
		-- end, {
		-- 	desc = 'Harpoon: (@Harpoon)'
		-- })

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			local make_finder = function()
				local paths = {}

				for _, item in ipairs(harpoon_files.items) do
					table.insert(paths, item.value)
				end

				return require("telescope.finders").new_table({
					results = paths,
				})
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = false,
					sorter = conf.generic_sorter({}),
					layout_strategy = "center",
					layout_config = {
						preview_cutoff = 1,
						width = function(_, max_columns, _)
							return math.min(max_columns, 80)
						end,
						height = function(_, _, max_lines)
							return math.min(max_lines, 15)
						end,
					},
					borderchars = {
						prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
						results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
						preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					},
					attach_mappings = function(prompt_buffer_number, map)
						-- The keymap you need
						map("i", "<c-d>", function()
							local state = require("telescope.actions.state")
							local selected_entry = state.get_selected_entry()
							local current_picker = state.get_current_picker(prompt_buffer_number)

							-- This is the line you need to remove the entry
							harpoon:list():remove(selected_entry)
							current_picker:refresh(make_finder())
						end)

						return true
					end,
				})
				:find()
		end

		---- ##################################################
		harpoon:extend({
			UI_CREATE = function(cx)
				-- vim.keymap.set("n", "<C-r>", function()
				--     harpoon:list():remove()
				--     -- harpoon.ui:remove_item(harpoon:list())
				-- end, {
				--     buffer = cx.bufnr
				-- })

				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({
						vsplit = true,
					})
				end, {
					buffer = cx.bufnr,
				})

				vim.keymap.set("n", "<C-x>", function()
					harpoon.ui:select_menu_item({
						split = true,
					})
				end, {
					buffer = cx.bufnr,
				})

				vim.keymap.set("n", "<C-t>", function()
					harpoon.ui:select_menu_item({
						tabedit = true,
					})
				end, {
					buffer = cx.bufnr,
				})
			end,
		})

		-- 	vim.keymap.set('n', '<C-e>', function()
		-- 		toggle_telescope(harpoon:list())
		-- 	end, { desc = 'Harpoon: Abrir Lista (@Harpoon)' })
	end,
}
