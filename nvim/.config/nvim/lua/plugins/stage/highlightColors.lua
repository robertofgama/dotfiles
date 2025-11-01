-- # Highlight Colors
-- https://github.com/brenoprata10/nvim-highlight-colors
-- ## Descrição:
-- Realça cores hex/rgb/hsl/named diretamente nos buffers do NeoVim.
return {
    "brenoprata10/nvim-highlight-colors",
    name = "Highlight Colors (@brenoprata10)",
    enabled = true,
    event = {"BufReadPost", "BufNewFile"},
    cmd = "HighlightColors",
    keys = {{
        "<leader>uc",
        function()
            require("nvim-highlight-colors").toggle()
        end,
        mode = {"n", "v"},
        desc = "Alterna Highlight Colors"
    }},
    opts = {
        render = "background",
        virtual_symbol = "■",
        virtual_symbol_prefix = "",
        virtual_symbol_suffix = " ",
        virtual_symbol_position = "inline",
        enable_hex = true,
        enable_short_hex = true,
        enable_rgb = true,
        enable_hsl = true,
        enable_ansi = true,
        enable_hsl_without_function = true,
        enable_var_usage = true,
        enable_named_colors = true,
        enable_tailwind = true,
        custom_colors = {},
        exclude_filetypes = {},
        exclude_buftypes = {},
        exclude_buffer = function()
            return false
        end
    },
    config = function(_, opts)
        if not vim.opt.termguicolors:get() then
            vim.opt.termguicolors = true
        end

        local ok, highlight_colors = pcall(require, "nvim-highlight-colors")
        if not ok then
            vim.notify("nvim-highlight-colors: não foi possível carregar o plugin", vim.log.levels.ERROR)
            return
        end

        highlight_colors.setup(opts)
    end
}

