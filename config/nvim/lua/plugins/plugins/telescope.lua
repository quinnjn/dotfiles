return {
  'nvim-telescope/telescope.nvim', 
  dependencies = { 
    'nvim-lua/plenary.nvim' 
  },
  config = function ()
    local telescope = require('telescope')
    local actions = require("telescope.actions")
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    telescope.setup({
      defaults = themes.get_ivy({
        layout_config = { 
          height = 0.30 
        },
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["<C-d>"] = actions.delete_buffer,
          },
        },
      }),
    })

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>gf', builtin.live_grep, { desc = 'Telescope find git' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>be', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>df', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
