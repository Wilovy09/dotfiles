return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_env_variable_url = 'DATABASE_URL'
    vim.g.db_ui_env_variable_name = 'DATABASE_NAME'
    vim.api.nvim_set_keymap("n", "<leader>db", ":DBUIToggle <CR>", { noremap = true, silent = true, desc = "Open DadBodUI" })
  end,
}
