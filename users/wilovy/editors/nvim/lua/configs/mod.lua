return {
    -- Theme
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    -- Telescope
    require("configs.plugins.telescope"),
    -- Discord/Coord
    require("configs.plugins.coord"),
    -- Alpha nvim
    require("configs.plugins.alpha"),
    -- Yazi
    require("configs.plugins.yazi"),
    -- Lualine
    require("configs.plugins.lualine"),
    -- TreeSitter
    require("configs.plugins.tree_sitter"),
    -- StatusCol
    require("configs.plugins.status_col"),
    -- Ufo (Folds)
    require("configs.plugins.ufo"),
    -- NVTerm
    require("configs.plugins.nv_term"),
    -- CodeActions
    require("configs.plugins.code_actions"),
    -- Colorized
    require("configs.plugins.colorized"),
    -- RustNvim
    require("configs.plugins.rust_nvim"),
    -- Null LS
    require("configs.plugins.null_ls"),
    -- Conform
    require("configs.plugins.conform"),
    -- BarBar
    require("configs.plugins.barbar"),
    -- WhichKey
    require("configs.plugins.which_key"),
    -- AutoPairs
    require("configs.plugins.autopairs"),
    -- Smear
    require("configs.plugins.smear"),
    -- Mason || LSPs
    require("configs.plugins.lsp_config"),
    -- CMP
    require("configs.plugins.cmp")
}
