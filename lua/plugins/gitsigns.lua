----------------------------------------------[[  Example Spec  ]]
-- This file shows how to organize a more involved plugin
-- Plugins requiring fewer options can be put into lua/plugins/init.lua

local M = {
  -- See https://github.com/folke/lazy.nvim#-plugin-spec
  "lewis6991/gitsigns.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    }, -- these can also have their own plugin file
  },
  cmd = { "Gitsigns" }, -- lazy loads on these commands
}

function M.config()
  local gitsigns = require("gitsigns")
  gitsigns.setup({})
end

-- Lazy loads on these mappings
M.keys = {
  ---MAPPING------COMMAND---------------------------MODE-----DESCRIPTION-----------------
  { "<leader>h", "<cmd>:Gitsigns preview_hunk<CR>", { "n" }, desc = "Gitsigns preview_hunk"   },
  { "<leader>l", "<cmd>:Gitsigns blame_line<CR>" , { "n" }, desc = "Gitsigns blame_line"    },
}

return M
