-- # Theme Omni (@yonlu)
-- https://github.com/yonlu/omni.vim

-- ## Descrição:

return {
  'yonlu/omni.vim',
  name = 'Theme Omni (@yonlu)',
  enabled = false,
  -- opts = {},
  config = function()
		vim.cmd 'colorscheme omni'
  end
}
