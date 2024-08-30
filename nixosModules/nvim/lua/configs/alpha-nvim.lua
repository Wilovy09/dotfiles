return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    -- local dashboard = require("alpha.themes.startify")
    local dashboard = require("alpha.themes.dashboard")
    --   █  
    -- dashboard.section.header.val = {
    --   [[                                                                     ]],
    --   [[       ████ ██████           █████      ██                     ]],
    --   [[      ███████████             █████                             ]],
    --   [[      █████████ ███████████████████ ███   ███████████   ]],
    --   [[     █████████  ███    █████████████ █████ ██████████████   ]],
    --   [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    --   [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    --   [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    -- }

    -- dashboard.section.header.val = {
    -- 	[[ ┌─────────────────────────────────────┐ ]],
    -- 	[[ │                                     │ ]],
    -- 	[[ │ ██╗  ██╗███████╗██╗     ██╗██╗  ██╗ │ ]],
    -- 	[[ │ ██║  ██║██╔════╝██║     ██║╚██╗██╔╝ │ ]],
    -- 	[[ │ ███████║█████╗  ██║     ██║ ╚███╔╝  │ ]],
    -- 	[[ │ ██╔══██║██╔══╝  ██║     ██║ ██╔██╗  │ ]],
    -- 	[[ │ ██║  ██║███████╗███████╗██║██╔╝ ██╗ │ ]],
    -- 	[[ │ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═╝ │ ]],
    -- 	[[ │               EDITOR                │ ]],
    -- 	[[ └─────────────────────────────────────┘ ]],
    -- }

    dashboard.section.header.val = {
      [[                                   ]],
      [[                                   ]],
      [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
      [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
      [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
      [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
      [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
      [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
      [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
      [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
      [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
      [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
      [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
      [[                                   ]],
    }
    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", ":ene <BAR> startinsert<CR>"),
      dashboard.button("SPC f f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("SPC f g", "  Find Word", ":Telescope live_grep<CR>"),
      dashboard.button(" CTRL h", "  NERDTree", ":NvimTreeFindFileToggle<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = {
      "Wilovy",
    }

    alpha.setup(dashboard.opts)
  end,
}
