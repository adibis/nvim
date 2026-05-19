local M = {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = { "Gitsigns" },
}

function M.config()
  require("gitsigns").setup({})
end

M.keys = {
  { "<leader>h", "<cmd>Gitsigns preview_hunk<CR>", { "n" }, desc = "Gitsigns preview_hunk" },
  { "<leader>l", "<cmd>Gitsigns blame_line<CR>",   { "n" }, desc = "Gitsigns blame_line"   },
}

return M
