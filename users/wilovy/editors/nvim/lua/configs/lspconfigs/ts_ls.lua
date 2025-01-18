local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.ts_ls.setup({
  init_options = {
    plugins = {
      { name = '@vue/typescript-plugin', location = '/etc/profiles/per-user/wilovy/bin/vue-language-server', languages = { 'vue' }, }
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'angular' },
  capabilities = capabilities
})
