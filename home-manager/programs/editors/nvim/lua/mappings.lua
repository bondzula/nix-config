local opts = { noremap = true, silent = true }

--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   Group multiple modes = {"n", "v"}

-- Shorten function name
local map = vim.keymap.set

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Reload the global module
map("n", "<leader>r", function() require("plenary.reload").reload_module("user", true) end)

-- Normal --

-- Disable highlights
map("n", "<ESC>", "<cmd>noh<cr>", opts)

-- Buffer navigation
vim.keymap.set('n', ']b', "<cmd>bnext<cr>")
vim.keymap.set('n', '[b', "<cmd>bprevious<cr>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Save buffer (:up only saves the buffer if there are changes)
map("n", "<C-s>", "<cmd>up<cr>", opts)

-- Toggle quick-fix list
map("n", "<A-q>", "<cmd>copen<cr>", opts)
map("n", "<A-l>", "<cmd>lopen<cr>", opts)

-- Navigate quick-fix list
map("n", "]q", "<cmd>cnext<cr>", opts)
map("n", "[q", "<cmd>cprev<cr>", opts)

-- Keep cursor in place while joining lines
map("n", "J", "mzJ`z", opts)

-- Keep current search result centered
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- TODO: Remove from here
map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>bd", "<cmd>Bdelete<cr>")
map("n", "<leader>bl", "<cmd>Telescope buffers<cr>")
