----------------------------------------------[[  Example Spec  ]]
-- This file shows how to organize a more involved plugin
-- Plugins requiring fewer options can be put into lua/plugins/init.lua

local M = {
	-- See https://github.com/folke/lazy.nvim#-plugin-spec
	"nvim-telescope/telescope.nvim", branch = "0.1.x", -- optional branch lock
	dependencies = {
		"nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
	},
	cmd = { "Telescope" }, -- lazy loads on these commands
}

function M.config()
  local telescope = require("telescope")
  telescope.setup({
    extensions = {
      undo = {
        -- telescope-undo.nvim config, see below
      },
    },
  })
  require("telescope").load_extension("undo")
end

-- Lazy loads on these mappings
M.keys = {
	---MAPPING------COMMAND---------------------------MODE-----DESCRIPTION-----------------
	{ "<leader>o", "<cmd>:Telescope git_files<CR>", { "n" }, desc = "Telescope git_files"   },
	{ "<leader>8", "<cmd>:Telescope grep_string<CR>" , { "n" }, desc = "Telescope grep_string"    },
	{ "<leader>f", "<cmd>:Telescope oldfiles<CR>"   , { "n" }, desc = "Telescope oldfiles" },
	{ "<leader>b", "<cmd>:Telescope buffers<CR>" , { "n" }, desc = "Telescope buffers"    },
	{ "<leader>u", "<cmd>:Telescope undo<CR>" , { "n" }, desc = "Telescope undo"    },
}

return M
