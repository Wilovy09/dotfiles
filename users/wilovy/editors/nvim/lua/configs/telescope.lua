local builtin = require("telescope.builtin")

require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = {
        promt_position = "top"
      },
      vertical = {
        mirror = false
      },
    },
  },
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
