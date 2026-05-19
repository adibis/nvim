
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
require("user/maps")             -- loads non-plugin maps
require("lazy").setup("plugins") -- loads each lua/plugins/*
require("user/options")          -- options, colors, etc.
require("user/lualine")          -- lualine (after plugin load)
require("lsp/lspconfig")         -- LSP server configs
require("user/nvim-cmp")         -- completion config
