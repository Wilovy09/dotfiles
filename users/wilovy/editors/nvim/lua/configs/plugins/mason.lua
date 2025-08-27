return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
        opts = function()
            -- https://mason-registry.dev/registry/list
            return {
                ensure_installed = {
                    -- Install from pkgs of nix (check the default.nix file)
                },
                max_concurrent_installers = 10,
            }
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
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            require("configs.plugins.lsp.mod")
        end,
    },
}
