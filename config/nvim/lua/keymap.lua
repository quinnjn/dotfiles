-- Neotree
vim.keymap.set('n', '<Leader>nt', function () 
  vim.cmd.Neotree { 'toggle' }
end)

vim.keymap.set('n', '<Leader>nf', function () 
  vim.cmd.Neotree { 'reveal' }
end)

-- CommandT
vim.keymap.set('n', '<Leader>ff', vim.cmd.CommandT)
vim.keymap.set('n', '<Leader>be', vim.cmd.CommandTBuffer)

-- runtests
vim.keymap.set('n', '<Leader>rt', vim.cmd.JestSingle)
vim.keymap.set('n', '<Leader>rb', vim.cmd.JestFile)

-- terrortylor/nvim-comment
vim.keymap.set('n', '<Leader>cc', vim.cmd.CommentToggle, {
  desc = 'Comment toggle current line',
  silent = true,
})

vim.keymap.set('v', '<leader>cc', ":'<,'>CommentToggle<cr>", { 
  desc = 'Comment current visual selected',
  silent = true, 
})
