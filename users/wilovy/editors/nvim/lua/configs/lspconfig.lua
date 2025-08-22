require('configs.lspconfigs.lua_ls')
require('configs.lspconfigs.ts_ls')
require('configs.lspconfigs.volar_ls')
require('configs.lspconfigs.astro_ls')
require('configs.lspconfigs.eslint_ls')
require('configs.lspconfigs.tailwindcss_ls')
require('configs.lspconfigs.pyright_ls')
require('configs.lspconfigs.nixd_ls')
require('configs.lspconfigs.omnisharp_ls')
require('configs.lspconfigs.emmet_ls')
require('configs.lspconfigs.deno_ls')

-- Configuración global y común
require('base.utils').set_highlights{
  NormalFloat = { bg = "NONE" },
  FloatBorder = { fg = "white", bg = "NONE" },
}

local hl_name = "FloatBorder"
local border = {
  { "╭", hl_name },
  { "─", hl_name },
  { "╮", hl_name },
  { "│", hl_name },
  { "╯", hl_name },
  { "─", hl_name },
  { "╰", hl_name },
  { "│", hl_name },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = border,
  focusable = false,
  relative = "cursor",
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 5,
    min = { severity = "Warning" },
  },
  update_in_insert = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
