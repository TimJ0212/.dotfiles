{ config, pkgs, ... }:

{

  home.packages = [
    pkgs.ripgrep
    pkgs.gopls
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-go
      nvim-lspconfig
      nvim-treesitter
      telescope-nvim
      gruvbox
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip
      nvim-tree-lua
      nvim-web-devicons
    ];
  };

  programs.neovim.extraConfig = ''
    lua << EOF
    local lspconfig = require('lspconfig')
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    -- LSP-Konfiguration
    lspconfig.gopls.setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }

    -- Autocompletion-Konfiguration
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      })
    })

    -- LSP-Keybindings
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      end,
    })
    vim.cmd [[colorscheme gruvbox]]
    vim.cmd [[set number]]
    vim.cmd [[set relativenumber]]

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    -- empty setup using defaults
    require("nvim-tree").setup()
    vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

    -- Switch focus to the left window (editor)
    vim.api.nvim_set_keymap('n', '<C-Left>', ':wincmd h<CR>', { noremap = true, silent = true })

    -- Switch focus to the right window (Nvim-Tree)
    vim.api.nvim_set_keymap('n', '<C-Right>', ':wincmd l<CR>', { noremap = true, silent = true })

  '';
}
