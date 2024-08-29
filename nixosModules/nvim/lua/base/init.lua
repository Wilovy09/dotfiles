vim.g.mapleader = " "

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.tabstop = 2      -- Número de espacios que representa una tabulación
vim.opt.shiftwidth = 2   -- Número de espacios utilizados para la indentación
vim.opt.expandtab = true -- Convierte tabs a espacios

vim.api.nvim_set_keymap("n", "<C-s>", ":w!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Esc>", ":q!<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })

require("base.plugins.lazy")
