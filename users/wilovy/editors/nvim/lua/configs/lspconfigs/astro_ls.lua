local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.enable("astro", { capabilities = capabilities })
