local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Space as leader (must be set before loading plugins)
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<tab>", "<C-w>w", opts)

-- Command mode shortcut
keymap("n", ";", ":", opts)

-- File-level jumps
keymap("n", "<cr>", "G", opts)
keymap("n", "<bs>", "gg", opts)

-- Move by visual line (handles wrapped lines)
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Line start/end
keymap("n", "<C-e>", "<end>", opts)
keymap("n", "<C-s>", "<home>", opts)

-- Split management
keymap("n", "<leader>ww", "<C-w>_", opts)
keymap("n", "<leader>w\\", "<C-w>|", opts)
keymap("n", "<leader>we", "<C-w>=", opts)
keymap("n", "<leader>w-", "<C-w>-", opts)
keymap("n", "<leader>w=", "<C-w>+", opts)

-- Explicit clipboard access — unnamedplus is unreliable on some Linux/terminal setups
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>d", '"+d', opts)
keymap("n", "<leader>p", '"+p', opts)
keymap("n", "<leader>P", '"+P', opts)
keymap("v", "<leader>p", '"+p', opts)
keymap("v", "<leader>P", '"+P', opts)

-- Search
keymap("n", "<leader>s", ":nohlsearch<cr>", { desc = "Clear search highlight", noremap = true, silent = true })

-- External tools
keymap("n", "<leader>g", ":FloatermNew lazygit<cr>", { desc = "Open Lazygit", noremap = true, silent = true })
