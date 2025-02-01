local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Pane and Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Nagivate Left
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Nagivate Right
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Nagivate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Nagivate Up

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally
