
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)


vim.fn.setreg("l", "yooconsole.log(\'" ..esc.. "pa: \', "..esc.."pa)"..esc.."^")


-- <BS>: Backspace


-- Mapeamnetos para macros
-- vim.keymap.set('n', 'Q', '@qj')
-- vim.keymap.set('x', 'Q', ':norm @q<CR>')
