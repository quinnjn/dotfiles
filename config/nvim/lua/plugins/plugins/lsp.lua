return {
  {
    "neovim/nvim-lspconfig",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    dependencies = {
    },
    config = function ()
      local lspconfig = require('lspconfig')
      lspconfig.graphql.setup({})
      lspconfig.tsserver.setup({
        single_file_support = false,
        importModuleSpecifierPreference = 'relative'
      })

      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {
        desc = 'Open diagnostics in a floating window',
      })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
        desc = 'Go to previous diagnostic',
      })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
        desc = 'Go to next diagnostic',
      })
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, {
        desc = 'Set diagnostics in location list',
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

          vim.keymap.set('n', '<Leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)

          vim.keymap.set('n', '<Leader>ft', function()
            vim.lsp.buf.format()
          end, opts)
        end,
      })
    end,
  },
};
