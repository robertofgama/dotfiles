-- # Telescope
-- https://github.com/nvim-telescope/telescope.nvim
-- ## Descrição: Fuzzy Finder de arquivos e muito mais.
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- name = '.Telescope (@nvim-telescope)',
  enabled = true,
  -- priority = 50
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    {
      'nvim-tree/nvim-web-devicons',
      enabled = vim.g.have_nerd_font,
    },
  },

  config = function()
    local builtin = require 'telescope.builtin'

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-h>'] = 'which_key',
          },
        },
      },

      pickers = {},

      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    }

    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'fzf')

    -- ###############      KEYMAPS      ############### --

    vim.keymap.set('n', '<leader><leader>', builtin.buffers, {
      desc = '[ ] Buscar nos buffers existentes abertos (@Telescope)',
    })
    vim.keymap.set('n', '<leader>bf', builtin.find_files, {
      desc = '[B]uscar [F]iles (@Telescope)',
    })
    vim.keymap.set('n', '<leader>ba', builtin.help_tags, {
      desc = '[B]uscar [A]juda (@Telescope)',
    })
    vim.keymap.set('n', '<leader>bk', builtin.keymaps, {
      desc = '[B]uscar [K]eymaps (@Telescope)',
    })
    vim.keymap.set('n', '<leader>bt', builtin.builtin, {
      desc = '[B]uscar funções do [T]elescope (@Telescope)',
    })
    vim.keymap.set('n', '<leader>bp', builtin.grep_string, {
      desc = '[B]uscar [P]alavra selecionada (@Telescope)',
    })
    vim.keymap.set('n', '<leader>bg', builtin.live_grep, {
      desc = '[B]uscar arquivos com [G]rep (@Telescope)',
    })
    vim.keymap.set('n', '<leader>bd', builtin.diagnostics, {
      desc = '[B]uscar [D] agnostics (@Telescope)',
    })
    vim.keymap.set('n', '<leader>bu', builtin.resume, {
      desc = '[B]uscar [U]ltima Busca (@Telescope)',
    })
    vim.keymap.set('n', '<leader>b.', builtin.oldfiles, {
      desc = '[B]uscar [.] Arquivos Recentes (@Telescope)',
    })
    vim.keymap.set({ 'n', 'v' }, '<Leader>bm', function()
      require('telescope').extensions.macroni.saved_macros()
    end)

    -- Buscar no buffer atual, com remapeamento da janela para um popup diferente
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 20,
        previewer = false,
      })
    end, {
      desc = '[/] Buscar no buffer atual (@Telescope)',
    })
  end,
}
