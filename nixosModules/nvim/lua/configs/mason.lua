-- https://mason-registry.dev/registry/list
return {
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"rust-analyzer",
		"rustfmt",
		"prettier",
		"typescript-language-server",
		"vetur-vls",
		"astro-language-server",
		"eslint_d",
    "tailwindcss-language-server"
	},

	max_concurrent_installers = 10,
}
