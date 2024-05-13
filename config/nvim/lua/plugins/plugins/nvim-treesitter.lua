return {
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
};
