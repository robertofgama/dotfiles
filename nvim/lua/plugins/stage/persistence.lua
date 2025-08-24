return {
    -- Plugin de gerenciamento de sessões para Neovim
    "folke/persistence.nvim",
    -- O evento "BufReadPre" garante que o plugin só será carregado quando um arquivo real for aberto
    event = "BufReadPre",
    opts = {
        -- Diretório onde os arquivos de sessão serão salvos
        -- Usa o diretório padrão de estado do Neovim + /sessions/
        dir = vim.fn.stdpath("state") .. "/sessions/",

        -- Número mínimo de buffers que precisam estar abertos para salvar a sessão
        -- Se definido como 0, sempre salvará a sessão
        -- Se definido como 1 ou mais, só salvará se houver pelo menos esse número de buffers
        options = {"buffers", "curdir", "tabpages", "winsize"},

        -- Se deve usar o branch do git para salvar a sessão
        -- Isso é útil quando você trabalha em diferentes branches do mesmo projeto
        -- e quer manter sessões separadas para cada branch
        branch = true,

        -- Se deve salvar a sessão automaticamente quando o Neovim for fechado
        -- Se definido como false, você precisará salvar manualmente
        autosave = true,

        -- Se deve restaurar a última sessão automaticamente ao iniciar o Neovim
        -- Se definido como false, você precisará restaurar manualmente
        autoload = true,

        -- Se deve ignorar arquivos específicos ao salvar a sessão
        -- Útil para ignorar arquivos temporários ou de cache
        ignore = {"gitcommit", "gitrebase", "svn", "hgcommit"}
    },
    -- Configuração de atalhos de teclado para gerenciar sessões
    keys = { -- Carrega a sessão do diretório atual
    {
        "<leader>qs",
        function()
            require("persistence").load()
        end,
        desc = "Restaurar sessão atual"
    }, -- Abre um seletor para escolher qual sessão carregar
    {
        "<leader>ql",
        function()
            require("persistence").load({
                last = true
            })
        end,
        desc = "Restaurar última sessão"
    }, -- Para o persistence (não salvará mais sessões)
    {
        "<leader>qd",
        function()
            require("persistence").stop()
        end,
        desc = "Parar persistence"
    }}
}
