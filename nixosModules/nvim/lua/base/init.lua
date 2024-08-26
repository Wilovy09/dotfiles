vim.g.mapleader = " "

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.tabstop = 2        -- Número de espacios que representa una tabulación
vim.opt.shiftwidth = 2     -- Número de espacios utilizados para la indentación
vim.opt.expandtab = true   -- Convierte tabs a espacios

require("base.plugins.lazy")
