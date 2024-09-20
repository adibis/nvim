
-- .
-- ├── init.lua
-- ├── ...
-- └── lua
--     ├── plugins
--     │   ├── init.lua             -- Loads simple plugins
--     │   ├── telescope.lua        -- Complicated configurations in their own files
--     │   └── ...lua		            -- One file per plugin here
--     └── user
--         ├── lazy.lua
--         ├── maps.lua
--         └── options.lua

-- NOTE: ensure that you map <leader> before loading Lazy

require("user/lazy")             -- bootstraps folke/lazy
require("user/maps")             -- loads non-plugin maps.
require("lazy").setup("plugins") -- loads each lua/plugin/*
require("user/options")          -- loads options, colors, etc.
require("user/lualine")          -- Load lualine setup after plugin is loaded.
require("lsp/lspconfig")          -- Load lualine setup after plugin is loaded.
require("user/nvim-cmp")          -- Load lualine setup after plugin is loaded.
