local M = {}

function M.set_highlights(highlights)
  for k, v in pairs(highlights) do
    vim.api.nvim_set_hl(0, k, v)
  end
end

return M
