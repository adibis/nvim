----------------------------------------------[[  Example Spec  ]]
-- This file shows how to organize a more involved plugin
-- Plugins requiring fewer options can be put into lua/plugins/init.lua

local M = {
	-- See https://github.com/folke/lazy.nvim#-plugin-spec
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" } -- these can also have their own plugin file
	},
}

function M.config()
	local null_ls = require("null-ls")
	null_ls.setup({
    sources = {
      null_ls.builtins.formatting.verible_verilog_format,
    },
  })
end
return M
