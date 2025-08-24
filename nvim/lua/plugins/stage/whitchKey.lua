-- # Which Key (@folke)
-- https://github.com/folke/which-key.nvim
-- ## Descrição:
-- Mostra graficamente na parte inferior as teclas.
-- return {
--	'folke/which-key.nvim',
--	name = '.Which Key (@folke)',
--	enabled = true,
--	----priority = 50
--	event = 'VeryLazy',
--	opts = {},
--	keys = {
--		{
--			'<leader>?',
--			function()
--				require('which-key').show { global = false }
--			end,
--			desc = 'Informações sobre Keymaps (@Which-Key)',
--		},
--	},
-- }
return {
    'folke/which-key.nvim',
    name = '.Which Key (@folke)',
    enabled = true,
    event = 'VeryLazy',
    opts = {
        spec = {
            mode = {"n", "v"},
            {
                "<leader>a",
                group = "AI"
            },
            {
                "<leader>b",
                group = "Buscar",
                icon = {
                    icon = "󰍉 ",
                    color = "green"
                }
            },
            {
                "<leader>c",
                group = "Buffers"
            },
            {
                "<leader>g",
                group = "LSP / Code Actions (@None)"
            },
            {
                "<leader>M",
                group = "Minimap"
            }
        },
        plugins = {
            registers = true
        }
    },
    keys = {{
        '<leader>?',
        function()
            require('which-key').show {
                global = false
            }
        end,
        desc = 'Informações sobre Keymaps (@Which-Key)'
    }}
}
