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
  }
}, opts)
