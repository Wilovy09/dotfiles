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

-- Configuración global y común
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#373432]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#373432]]

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

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
