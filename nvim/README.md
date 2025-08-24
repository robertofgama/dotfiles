# Configuração Pessoal do Neovim

Esta é minha configuração personalizada do Neovim, organizada de forma modular e utilizando Lua.

## 📁 Estrutura do Projeto

```

~/.config/nvim/
├── init.lua              # Arquivo principal de inicialização
├── lua/
│   └── config/          # Configurações principais
│       ├── configs.lua   # Configurações gerais
│       ├── keymaps.lua  # Atalhos de teclado
│       ├── macros.lua   # Macros personalizadas
│       └── lazyVim.lua  # Configuração do gerenciador de plugins
└── lazy-lock.json       # Lock file dos plugins
```

## ⚙️ Configurações Principais

### Configurações Gerais

- Numeração de linhas habilitada (relativa)
- Suporte a Nerd Fonts
- Suporte completo ao mouse
- Indentação configurada para 2 espaços
- Busca case-insensitive inteligente
- Scroll offset de 10 linhas
- Barra de status global

### Indentação

- `tabstop = 2`: Define o tamanho do caractere tab
- `softtabstop = 2`: Número de espaços inseridos ao pressionar TAB
- `shiftwidth = 2`: Tamanho da indentação automática

## 🔌 Plugins Instalados

### Interface e Aparência

- **Alpha**: Dashboard inicial personalizado
- **Bufferline**: Gerenciamento visual de buffers
- **Lualine**: Barra de status moderna
- **Neo Tree**: Explorador de arquivos
- **Theme Synthweave**: Tema visual
- **Which Key**: Exibe atalhos de teclado disponíveis

### Completação e LSP

- **Nvim CMP**: Sistema de autocompletação
- **Mason**: Gerenciador de LSP, linters e formatadores
- **LuaSnip**: Engine de snippets
- **Copilot.lua**: Integração com GitHub Copilot
- **None LS**: Suporte a linting e formatação

### Git

- **Fugitive**: Interface Git avançada
- **Gitsigns**: Indicadores de mudanças Git
- **Diff View**: Visualização de diferenças

### Produtividade

- **Harpoon**: Navegação rápida entre arquivos
- **Telescope**: Busca fuzzy e navegação
- **Commentary**: Comentários de código
- **Surround**: Manipulação de delimitadores
- **Visual Multi**: Múltiplos cursores
- **Code Runner**: Execução rápida de código

### Linguagens e Sintaxe

- **Tree Sitter**: Highlighting sintático avançado
- **Vim Astro**: Suporte para Astro
- **Friendly Snippets**: Coleção de snippets

## TO-DOs

- Keymaps
  - Add keymap para salvar, possível CTRL + F#
  - Add keymap para fechar buffers
  - mudar keymap das teclas de movimentação entre janelas para combinar com o TMUX/zellij
- configurar para manter a area de transferência ao Colar
- plugin para mostrar/gerenciar marcações
- melhore configurações dos code actions

## ⌨️ Atalhos de Teclado

### Atalhos <leader>

- `a`: Avante, Cursor do Paraguai
- `b`: Buscar (Telescope)
- `c`: Buffers: Close/Fechar
- `d`:
- `e`:
- `f`:
- `g`: LSP / Code Actions (@None)
- `h`: Navegar Esquerda
- `i`:
- `j`: Navegar Baixo
- `k`: Navegar Cima
- `l`: Navegar Direita
- `m`:
- `M`: Minimap
- `n`:
- `o`:
- `p`:
- `q`:
- `r`:
- `s`: Session/Sessão (pl. persistense)
- `t`:
- `u`:
- `v`:
- `x`:
- `y`:
- `z`:

### Navegação

- `<Space>`: Tecla líder
- `<leader>h/j/k/l`: Navegar entre janelas
- `<C-j/k>`: Navegar entre buffers
- `<C-h/l>`: Navegar entre abas
- `<C-b>`: Toggle explorador de arquivos (Neo Tree)

### Edição

- `op`: Nova linha abaixo (modo normal)
- `oi`: Nova linha acima (modo normal)
- `oo`: Nova linha no final
- `J/K` (visual): Mover linhas selecionadas para cima/baixo
- `<leader>y`: Copiar para clipboard do sistema
- `<leader>p`: Colar preservando registro

### Busca e Substituição

- `<Esc>`: Limpar highlights de busca
- `<leader>s`: Substituir palavra sob o cursor
- `n/N`: Próxima/anterior ocorrência (centralizado)

### Terminal

- `<Esc><Esc>`: Sair do modo terminal

### Git e LSP

- Diversos atalhos através do Fugitive e LSP
- Use `<leader>` para ver todos os atalhos disponíveis via Which Key

## 🚀 Começando

1. Certifique-se de ter o Neovim instalado (versão 0.9.0 ou superior recomendada)
2. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/dotfiles.git
   ```

3. Inicie o Neovim e aguarde a instalação automática dos plugins

## 📝 Notas

- Esta configuração utiliza Lua como linguagem principal
- Suporte completo a LSP e autocompletion (através dos plugins configurados)
- Interface moderna e minimalista
- Otimizado para desenvolvimento
