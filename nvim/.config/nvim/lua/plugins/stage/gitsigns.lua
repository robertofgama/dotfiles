-- # Gitsigns (@lewis6991)
-- https://github.com/lewis6991/gitsigns.nvim
-- ## Descrição:
return {
    'lewis6991/gitsigns.nvim',
    name = '.Gitsigns (@lewis6991)',
    enabled = true,
    opts = {
        signs = {
            add = {
                text = '+'
            },
            change = {
                text = '~'
            },
            delete = {
                text = '_'
            },
            topdelete = {
                text = '‾'
            },
            changedelete = {
                text = '~'
            }
        }
    }
    -- config = function() ... end
}
