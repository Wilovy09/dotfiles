local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config('nixd', {
    cmd = { 'nixd' },
    filetypes = { 'nix' },
    root_markers = { 'flake.nix', 'default.nix', 'shell.nix', '.git' },
    capabilities = capabilities,
})

vim.lsp.enable('nixd')
