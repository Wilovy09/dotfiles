return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#F74C00" })

    dashboard.section.header.type = "group"
    -- stylua: ignore
    dashboard.section.header.val = {
      { type = "text", val = "                  █ ██ ██                ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "               █ ████████ █          █   ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "  █ ██       █ █████████████ █      ██   ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = " ▇█ ███    █ █████████████████ █   ███ █ ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = " ███ ██   ███████████████████████  █████ ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "  █████  ████████████████████████  ████  ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "   ███ ████████████████████████████ ██   ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "     █  ███████████  ██ █ ███████████    ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "      █████████████  ██ █ ██████████     ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "       ███████████   ██   ██████████     ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "      ██░░██████████████████████░░░██    ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "      ██ ░  ░░███████  ██████░░  ░ ██    ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "       ██ ░     ░░░░░░░░░░░     ░ ██     ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "        ██                        █      ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "         █                       █       ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
    }

    -- stylua: ignore
    dashboard.config.layout = {
      { type = "padding", val = 0 }, dashboard.section.header,
      { type = "padding", val = 1 }, dashboard.section.buttons,
      { type = "padding", val = 1 }, dashboard.section.footer,
    }
    dashboard.section.buttons.opts.spacing = 0

    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("e", "📝 New File", ":ene <BAR> startinsert<CR>"),
      dashboard.button("SPC f f", "🔍 Find File", ":Telescope find_files<CR>"),
      dashboard.button("SPC f g", "🇼 Find Word", ":Telescope live_grep<CR>"),
      dashboard.button(" CTRL h", "🌳 Yazi", ":Yazi<CR>"),
    }

    local function footer()
      local total_plugins = require("lazy").stats().count
      local datetime = os.date(" %d-%m-%Y   %H:%M")
      local version = vim.version()
      local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

      return datetime .. "    " .. total_plugins .. " plugins" .. nvim_version_info
    end
    dashboard.section.footer.val = footer()

    alpha.setup(dashboard.opts)
  end,
}
