return {
  -- Colorschemes (lazy = true; switch with :colorscheme <name>)
  {"gruvbox-community/gruvbox",  lazy = true},
  {"marko-cerovac/material.nvim", lazy = true},
  {"catppuccin/nvim",            lazy = true},
  {"Shatur/neovim-ayu", lazy = false, priority = 1000,
    config = function()
      require('ayu').colorscheme()
    end
  },

  {"voldikss/vim-floaterm"},
  {"sindrets/diffview.nvim"},
  {"azabiong/vim-highlighter"},
  {"nvim-tree/nvim-web-devicons", lazy = true},

  {"folke/which-key.nvim",
    config = function()
      require('which-key').setup()
    end
  },

  {"nvim-lualine/lualine.nvim", lazy = false, priority = 999,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true
  },
  {"neovim/nvim-lspconfig"},
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
}
