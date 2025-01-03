local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

-- Opciones de ventana
vim.wo.relativenumber = true
vim.wo.number = true

-- Opciones generales
vim.opt.tabstop = 2        -- Número de espacios que representa una tabulación
vim.opt.shiftwidth = 2     -- Número de espacios utilizados para la indentación
vim.opt.expandtab = true   -- Convierte tabs a espacios
vim.opt.swapfile = false
vim.opt.colorcolumn = "80" -- Línea de color en la columna 80

map("n", "<C-s>", ":w!<CR>", { noremap = true, silent = true })
map("n", "<C-Esc>", ":q!<CR>", { noremap = true, silent = true })
map("n", "<C-h>", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
map("n", "<S-f>", "zfa}", { noremap = true, silent = true })
map("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

map("n", "yy", '"+yy', { noremap = true, silent = true }) -- Modo normal
map("v", "y", '"+y', { noremap = true, silent = true })   -- Modo visual
map("x", "y", '"+y', { noremap = true, silent = true })   -- Modo visual-line

require("base.plugins.lazy")
