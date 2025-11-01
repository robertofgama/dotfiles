-- # Todo Comments (@folke)
-- https://github.com/folke/todo-comments.nvim

-- ## Descrição:
-- Comentários aprimorados (To-Dos)
-- TODO: todo
-- TAREFA:
-- HACK: hack
-- WARN: warn
-- PERF: perf
-- NOTE: note
-- TEST: test
-- FIX: fix
-- MOCK: mockado
-- FEAT: feat

return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	opts = {
		keywords = {
			TODO = { icon = " ", color = "info", alt = { "TAREFA" } },
			MOCK = { icon = " ", color = "green" },
			FEAT = { icon = "", color = "warning" },
		},
		colors = {
			green = { "#26A269" },
		},
	},

	vim.keymap.set("n", "<leader>bt", ":TodoTelescope<CR>", {
		desc = "[B]uscar [T]odos/Tarefas (@Telescope)",
	}),
}

-- return {
-- 	"folke/todo-comments.nvim",
-- 	name = "Todo Comments (@folke)",
-- 	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
-- 	enable = true,
-- 	-- opts = {
-- 	-- 	keywords = {
-- 	-- 		FIX = {
-- 	-- 			icon = " ", -- icon used for the sign, and in search results
-- 	-- 			color = "error", -- can be a hex color, or a named color (see below)
-- 	-- 			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
-- 	-- 			-- signs = false, -- configure signs for some keywords individually
-- 	-- 		},
-- 	-- 		TODO = { icon = " ", color = "info", alt = { "TAREFA" } },
-- 	-- 		HACK = { icon = " ", color = "warning" },
-- 	-- 		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "AVISO", "PERIGO" } },
-- 	-- 		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
-- 	-- 		NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
-- 	-- 		TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
-- 	-- 	},
-- 	-- },

-- 	-- config = function()
-- 	-- 	vim.keymap.set(
-- 	-- 		"n",
-- 	-- 		"<leader>bi",
-- 	-- 		"TodoTelescope<CR>",
-- 	-- 		{ desc = "[B]uscar [I]nformações (@TodoComments @Telescope)" }
-- 	-- 	)
-- 	-- 	-- vim.keymap.set('n', '<leader>bn', ':TodoTelescope<CR>', { desc = 'Abrir TodoTelescope' })
-- 	-- end,
-- 	--
-- 	config = function() end,
-- }
