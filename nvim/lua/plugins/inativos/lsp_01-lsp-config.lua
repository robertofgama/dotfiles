-- # Mason
-- https://github.com/williamboman/mason.nvim
-- ## Descrição:
-- Gerenciador de LSPs
-- Baseado no EP3 da playlist do Typecraft
return {{
    'williamboman/mason.nvim',
    name = '.Mason (@williamboman)',
    enabled = true,
    ----priority = 50,
    config = function()
        require('mason').setup()
    end
}, {
    'williamboman/mason-lspconfig.nvim',
    name = '.Mason LSP Config(@williamboman)',
    enabled = true,
    config = function()
        require('mason-lspconfig').setup {
            ensure_installed = {'lua_ls', 'ts_ls', 'typescript'}
        }
    end
}, {
    'neovim/nvim-lspconfig',
    name = '.Nvim LSP Config (@neovim)',
    enabled = true,
    ----priority = 50,
    config = function()
        local lspconfig = require 'lspconfig'

        -- Nova lógica para obter o tsdk_path
        local tsdk_path = '' -- Default to empty string
        local mason_registry_ok, mason_registry = pcall(require, 'mason-registry')

        if mason_registry_ok then
            local pkg = mason_registry.get_package('typescript')
            if pkg and pkg:is_installed() then
                tsdk_path = pkg:get_install_path() .. '/lib/'
            else
                vim.notify(
                    "Pacote 'typescript' não está instalado pelo Mason ou não foi encontrado. O tsserver pode não funcionar corretamente. Verifique a instalação com :Mason ou tente :MasonInstall typescript.",
                    vim.log.levels.WARN, {
                        title = 'Configuração LSP TypeScript'
                    })
            end
        else
            vim.notify(
                "Não foi possível carregar 'mason-registry'. O caminho para TSDK do TypeScript não pôde ser determinado automaticamente.",
                vim.log.levels.WARN, {
                    title = 'Configuração LSP TypeScript'
                })
        end

        lspconfig.astro.setup {}
        lspconfig.bashls.setup {}
        lspconfig.emmet_ls.setup {}
        lspconfig.eslint.setup {}
        lspconfig.lua_ls.setup {}
        lspconfig.pylsp.setup {}
        lspconfig.tailwindcss.setup {}
        lspconfig.ts_ls.setup {
            init_options = {
                typescript = {
                    tsdk = tsdk_path
                }
            }
        }
        lspconfig.systemd_ls.setup {}
        -- ###############      KEYMAPS      ############### --

        vim.keymap.set('n', '<leader>gk', vim.lsp.buf.hover, {
            desc = 'LSP: Informações/Definições do Termo (@LspConfig)'
        })
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {
            desc = 'LSP: Ir para Definição (@LspConfig)'
        })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {
            desc = 'LSP: Code Actions (@LspConfig)'
        })

        local opts = {
            desc = 'LSP: Novo (@LspConfig)'
        }

        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<leader><F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<leader><F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        ---
        -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        --
        -- PRIMAGEN SHORTCUTS
        -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        -- vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        -- vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        -- vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        -- vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
        -- vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
        -- vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        -- vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
        -- vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
        -- vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end
}}
