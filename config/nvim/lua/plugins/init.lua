local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- lspconfig
  use 'neovim/nvim-lspconfig'

  -- Nerdtree
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }

  -- CommandT
  use {
    'wincent/command-t',
    run = 'cd lua/wincent/commandt/lib && make',
    setup = function ()
      vim.g.CommandTPreferredImplementation = 'lua'
    end,
    config = function()
      require('wincent.commandt').setup({
        -- Customizations go here.
      })
    end,
  }


  -- color schemes
  -- tokyonight
  use {
    'folke/tokyonight.nvim',
  }

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
