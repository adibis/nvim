local M = {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  cmd = { "Telescope" },
}

function M.config()
  local telescope = require("telescope")
  telescope.setup({
    extensions = {
      undo = {},
    },
  })
  telescope.load_extension("undo")
end

M.keys = {
  { "<leader>o", "<cmd>Telescope git_files<CR>",   { "n" }, desc = "Telescope git_files"   },
  { "<leader>8", "<cmd>Telescope grep_string<CR>", { "n" }, desc = "Telescope grep_string"  },
  { "<leader>f", "<cmd>Telescope oldfiles<CR>",    { "n" }, desc = "Telescope oldfiles"     },
  { "<leader>b", "<cmd>Telescope buffers<CR>",     { "n" }, desc = "Telescope buffers"      },
  { "<leader>u", "<cmd>Telescope undo<CR>",        { "n" }, desc = "Telescope undo"         },
}

return M
