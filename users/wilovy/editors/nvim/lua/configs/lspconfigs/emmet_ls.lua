local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.emmet_language_server.setup({ capabilities = capabilities })
