local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd 'colorscheme tokyonight'
    end
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  { 
    "wincent/command-t",
    build = 'cd lua/wincent/commandt/lib && make',
    init = function ()
      vim.g.CommandTPreferredImplementation = 'lua'
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function ()
      vim.cmd 'TSUpdate'
    end,
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "typescript",
          "graphql",
        },
        sync_install = true,
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  },
  {
    'tomtom/tcomment_vim',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'github/copilot.vim',
    build = function ()
      vim.cmd ':Copilot setup'
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },
    config = function ()
      adapters = {
        require('neotest-jest')({
          jestCommand = "yarn server:test",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      }
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "onsails/lspkind-nvim",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function ()
      require('cmp').setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },

        mapping = {
          ['<C-n>'] = require('cmp').mapping.select_next_item(),
          ['<C-p>'] = require('cmp').mapping.select_prev_item(),
          ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
          ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
          ['<C-Space>'] = require('cmp').mapping.complete(),
          ['<C-e>'] = require('cmp').mapping.close(),
          ['<CR>'] = require('cmp').mapping.confirm({
            behavior = require('cmp').ConfirmBehavior.Insert,
            select = true,
          }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        },
      }
    end
  },
  {
    "terrortylor/nvim-comment",
    config = function ()
      require('nvim_comment').setup()
    end
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
    -- import mason
    local mason = require("mason")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "graphql",
      },

      automatic_install = true
    })

    local mason_tool_installer = require("mason-tool-installer")
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "eslint_d", -- eslint language server
      },

      automatic_install = true
    })
  end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function ()
      require("typescript-tools").setup {
        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,
        -- "change"|"insert_leave" determine when the client asks the server about diagnostic
        publish_diagnostic_on = "insert_leave",
        -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
        -- "remove_unused_imports"|"organize_imports") -- or string "all"
        -- to include all supported code actions
        -- specify commands exposed as code_actions
        expose_as_code_action = {},
        -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
        -- not exists then standard path resolution strategy is applied
        tsserver_path = nil,
        -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
        -- (see 💅 `styled-components` support section)
        tsserver_plugins = {},
        -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
        -- memory limit in megabytes or "auto"(basically no limit)
        tsserver_max_memory = "auto",
        -- described below
        tsserver_format_options = {},
        tsserver_file_preferences = {},
        -- locale of all tsserver messages, supported locales you can find here:
        -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
        tsserver_locale = "en",
        -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
        complete_function_calls = false,
        include_completions_with_insert_text = true,
        -- CodeLens
        -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
        -- possible values: ("off"|"all"|"implementations_only"|"references_only")
        code_lens = "off",
        -- by default code lenses are displayed on all referencable values and for some of you it can
        -- be too much this option reduce count of them by removing member references from lenses
        disable_member_code_lens = true,
        -- JSXCloseTag
        -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
        -- that maybe have a conflict if enable this feature. )
        jsx_close_tag = {
          enable = false,
          filetypes = { "javascriptreact", "typescriptreact" },
        }

      }
    end
  }
}, opts)
