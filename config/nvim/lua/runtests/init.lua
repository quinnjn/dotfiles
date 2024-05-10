vim.cmd([[ command! Jest :lua require("runtests/runtests").test_project() ]])
vim.cmd([[ command! JestFile :lua require("runtests/runtests").test_file() ]])
vim.cmd([[ command! JestSingle :lua require("runtests/runtests").test_single() ]])
vim.cmd([[ command! JestCoverage :lua require("runtests/runtests").test_coverage() ]])
