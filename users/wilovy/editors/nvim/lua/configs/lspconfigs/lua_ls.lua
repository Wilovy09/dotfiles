local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
