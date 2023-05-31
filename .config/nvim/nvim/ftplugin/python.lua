local vim = vim

-- Text formatting

-- Using 100 due to Python-black using --line-length 100
vim.api.nvim_command("set textwidth=100")
vim.api.nvim_command("set colorcolumn=100")
