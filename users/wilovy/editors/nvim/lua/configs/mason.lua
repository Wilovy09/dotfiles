-- https://mason-registry.dev/registry/list
return {
	ensure_installed = {
    -- Install from pkgs of nix
    -- lua-language-server
		-- "rust-analyzer",
		-- "rustfmt",
    -- "csharpier",
		"stylua",
		"prettier",
		"typescript-language-server",
		"vue-language-server",
		"astro-language-server",
		"eslint_d",
    "tailwindcss-language-server",
    "nil",
    "omnisharp",
    "emmet-language-server",
	},

	max_concurrent_installers = 10,
}
