return {
  {"itchyny/vim-gitbranch"},
  {"gruvbox-community/gruvbox", lazy = true},
  {"Shatur/neovim-ayu", lazy = false, priority = 1000,
    config = function()
      require('ayu').colorscheme()
    end
  },
  {"marko-cerovac/material.nvim", lazy = true},
  {"catppuccin/nvim", lazy = true},
  {"voldikss/vim-floaterm"},
  {"nvim-lua/plenary.nvim"},
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
      "itchyny/vim-gitbranch",
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = true
  },
  { 'neovim/nvim-lspconfig' },
  {
    'hrsh7th/nvim-cmp',
    -- load cmp on InsertEnter
    event = 'InsertEnter',
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
  },
}
