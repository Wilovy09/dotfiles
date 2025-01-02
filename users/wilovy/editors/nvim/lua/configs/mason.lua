-- https://mason-registry.dev/registry/list
return {
	ensure_installed = {
    -- Install lua-language-server from pkgs of nix
		-- "rust-analyzer",
		-- "rustfmt",
		"stylua",
		"prettier",
		"typescript-language-server",
		"vue-language-server",
		"astro-language-server",
		"eslint_d",
    "tailwindcss-language-server",
    "nil",
    "omnisharp",
    "chsarpier",
    "emmet-language-server",
	},

	max_concurrent_installers = 10,
}
