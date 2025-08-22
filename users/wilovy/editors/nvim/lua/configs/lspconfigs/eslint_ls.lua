local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.eslint.setup({
  capabilities = capabilities,
  root_dir = function(fname)
    local util = require("lspconfig.util")
    -- 🚫 Evita activar eslint en proyectos con deno.json/deno.jsonc
    if util.root_pattern("deno.json", "deno.jsonc")(fname) then
      return nil
    end
    -- ✅ Activa eslint solo en proyectos Node/TS
    return util.root_pattern(
      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.json",
      "package.json"
    )(fname)
  end,
})

