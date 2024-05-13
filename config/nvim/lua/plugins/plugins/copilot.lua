return {
  {
    'github/copilot.vim',
    build = function ()
      vim.cmd ':Copilot setup'
    end,
  },
}
