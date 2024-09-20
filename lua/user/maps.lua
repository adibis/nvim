local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<tab>", "<C-w>w", opts)
keymap("n", ";", ":", opts)
keymap("n", "<cr>", "G", opts)
keymap("n", "<bs>", "gg", opts)
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "<C-e>", "<end>", opts)
keymap("n", "<C-s>", "<home>", opts)

-- Manage splits better --
keymap("n", "<leader>ww", "<C-w>_", opts)
keymap("n", "<leader>w\\", "<C-w>|", opts)
keymap("n", "<leader>we", "<C-w>=", opts)
keymap("n", "<leader>w-", "<C-w>-", opts)
keymap("n", "<leader>w=", "<C-w>+", opts)

-- Easier paste / copy --
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "<leader>d", "\"+d", opts)
keymap("n", "<leader>p", "\"+p", opts)
keymap("n", "<leader>P", "\"+P", opts)
keymap("v", "<leader>p", "\"+p", opts)
keymap("v", "<leader>P", "\"+P", opts)

-- Clear search --
keymap("n", "<leader>s", ":nohlsearch<cr>", { desc = "Clear search highlight",  noremap = true, silent = true})

-- External tools --
keymap("n", "<leader>g", ":FloatermNew lazygit<cr>", { desc = "Open Lazygit",  noremap = true, silent = true})
