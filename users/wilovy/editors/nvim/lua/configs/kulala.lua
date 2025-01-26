return {
	"mistweaverco/kulala.nvim",
	keys = {
		{ "<leader>oh", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "HTTP scratchpad" },

		{ "<leader>h", "", desc = "+Rest", ft = "http" },
		{ "<leader>hc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL", ft = "http" },
		{ "<leader>hC", "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste from curl", ft = "http" },
		{
			"<leader>hg",
			"<cmd>lua require('kulala').download_graphql_schema()<cr>",
			desc = "Download GraphQL schema",
			ft = "http",
		},
		{
			"<leader>hi",
			"<cmd>lua require('kulala').inspect()<cr>",
			desc = "Inspect current request",
			ft = "http",
		},
		{
			"<leader>hn",
			"<cmd>lua require('kulala').jump_next()<cr>",
			desc = "Jump to next request",
			ft = "http",
		},
		{
			"<leader>hp",
			"<cmd>lua require('kulala').jump_prev()<cr>",
			desc = "Jump to previous request",
			ft = "http",
		},
		{
			"<leader>hq",
			"<cmd>lua require('kulala').close()<cr>",
			desc = "Close window",
			ft = "http",
		},
		{
			"<leader>hr",
			"<cmd>lua require('kulala').replay()<cr>",
			desc = "Replay the last request",
			ft = "http",
		},
		{
			"<leader>hs",
			"<cmd>lua require('kulala').run()<cr>",
			desc = "Send the request",
			ft = "http",
		},
		{
			"<leader>hS",
			"<cmd>lua require('kulala').show_stats()<cr>",
			desc = "Show stats",
			ft = "http",
		},
		{
			"<leader>ht",
			"<cmd>lua require('kulala').toggle_view()<cr>",
			desc = "Toggle headers/body",
			ft = "http",
		},
	},
	opts = {},
}
