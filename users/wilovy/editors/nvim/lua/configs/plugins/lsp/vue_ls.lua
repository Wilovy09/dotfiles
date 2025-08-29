-- Configuración de Vue + TypeScript en Neovim (Nix, rutas hardcodeadas)

-- 🔒 Ruta fija al plugin de Vue dentro del store de Nix
local vue_plugin_path =
"/nix/store/3ha6w4sbv7fqpr7j1xhb15x11gfmvg23-vue-language-server-3.0.4/lib/node_modules/@vue/language-server"

-- Definición del plugin Vue para vtsls
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_plugin_path,
  languages = { "vue" },
  configNamespace = "typescript",
  enable = true,
}

-- Configuración de vtsls (solo JS/TS)
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = { vue_plugin },
      },
    },
  },
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
  },
}

-- Configuración de vue-language-server (solo .vue)
local vue_ls_config = {
  filetypes = { "vue" },
  on_init = function(client)
    client.handlers["tsserver/request"] = function(_, result, context)
      local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
      if #clients == 0 then
        vim.notify("No se encontró cliente vtsls, Vue no funcionará.", vim.log.levels.ERROR)
        return
      end
      local ts_client = clients[1]

      local param = unpack(result)
      local id, command, payload = unpack(param)

      ts_client:exec_cmd({
        title = "vue_request_forward",
        command = "typescript.tsserverRequest",
        arguments = { command, payload },
      }, { bufnr = context.bufnr }, function(_, r)
        local response_data = { { id, r.body } }
        client:notify("tsserver/response", response_data)
      end)
    end
  end,
}

-- Registrar servidores en Neovim
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config) -- 👈 reemplazamos volar → vue_ls
vim.lsp.enable({ "vtsls", "vue_ls" })
