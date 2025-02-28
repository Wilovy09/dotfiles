--- @diagnostic disable: redefined-local
--- @diagnostic disable: lowercase-global

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

--- @diagnostic disable-next-line
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
plugins = require("configs.lazy")

require("lazy").setup(plugins)
require("gruvbox").load()
