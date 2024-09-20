local fn = vim.fn
local opt = vim.opt

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.gdefault = true         -- Use 'g' by default when searching
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus= 2           -- Set local statusline
opt.signcolumn = 'yes'      -- Set signcolumn on by default
opt.scrolloff = 3           -- Show next 3 lines when scrolling
opt.sidescrolloff = 5       -- Show 5 columns when scrolling horizontally
opt.startofline = false     -- Don't jump to start of line when scrolling
opt.wildmode = "list:longest"
opt.diffopt:append('iwhite')-- Ignore whitespace in diff

-----------------------------------------------------------
-- Formatting
-----------------------------------------------------------
opt.formatoptions:append('o') -- Continue comment marker on next line
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 2 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.smartindent = true      -- Autoindent new lines
opt.colorcolumn = '100'     -- 100 characters max per line so mark it
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = "#623456" })
opt.joinspaces = false      -- Prevents two spaces on 'J'oin after punctuation

-----------------------------------------------------------
-- Navigation
-----------------------------------------------------------
opt.autochdir = true         -- Switch to current buffer parent directory
opt.isfname:remove(':')      -- Break path at this character
opt.isfname:remove('=')      -- Break path at this character
opt.isfname:remove('+')      -- Break path at this character

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event
