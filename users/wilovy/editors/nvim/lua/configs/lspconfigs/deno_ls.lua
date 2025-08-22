local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.denols.setup({
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  init_options = {
    lint = true,
    unstable = true,
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
          ["https://cdn.nest.land"] = true,
          ["https://crux.land"] = true,
        },
      },
    },
  },
})

