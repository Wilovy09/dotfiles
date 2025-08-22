local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "angular" },
  root_dir = function(fname)
    local util = require("lspconfig.util")
    if util.root_pattern("deno.json", "deno.jsonc")(fname) then
      return nil
    end
    return util.root_pattern("package.json", "tsconfig.json", ".git")(fname)
  end,
})

