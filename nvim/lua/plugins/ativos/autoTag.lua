-- # Auto Tag (@windwp)
-- https://github.com/windwp/nvim-ts-autotag
-- ## Descrição: Plugin para fechar tags automaticamente.
return {
    'windwp/nvim-ts-autotag',
    name = 'Auto Tag (@windwp)',
    enabled = true,
    opts = {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
    }
}
