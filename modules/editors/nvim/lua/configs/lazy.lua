return {
	-- Theme
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	-- Alpha-nvim
	require("configs.alpha-nvim"),
	-- Telescopee
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("configs.telescope")
		end,
	},
	-- LuaLine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("configs.lualine")
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
	-- NVimTree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			return require("configs.nvimtree")
		end,
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},
	-- TreeSitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"lua",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"rust",
					"python",
					"yaml",
					"vue",
					"go",
					"gomod",
					"gosum",
					"astro",
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	-- EdgeJS Template
	{ "watzon/vim-edge-template" },
	-- AutoPairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- Mason
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
		opts = function()
			return require("configs.mason")
		end,
		config = function(_, opts)
			require("mason").setup(opts)
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})
			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("configs.lspconfig")
		end,
	},
	-- WichKey
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- BarBar
	{
		"romgrk/barbar.nvim",
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
	},
	-- Formatter
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	-- NoneLS
	require("configs.none-ls"),
	-- CMP && LuaSnip
	require("configs.completions"),
	-- ToogleTerm
	require("configs.nvterm"),
	-- Colorizer
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
	-- Noice
	--[[
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        -- hide written messages
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        -- hide reemove messages
        {
          filter = {
            event = "notify",
            kind = "",
            find = "was properly removed",
          },
          opts = { skip = true },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  ]]--
	-- Cord
	require("configs.cord"),
	--Rustnvim
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	-- C#
	{
		"GustavEikaas/easy-dotnet.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			require("easy-dotnet").setup()
		end,
	},
	-- CodeActions
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			vim.keymap.set({ "v", "n" }, "<leader>ga", require("actions-preview").code_actions)
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
