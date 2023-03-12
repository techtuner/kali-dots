local keymap = vim.keymap.set
local opts = { silent = true }
local builtin = require('telescope.builtin')

vim.g.mapleader = " "

-- Open Explorer
keymap("n","<leader>pv",":NvimTreeToggle<CR>",opts)

-- Split Windows
keymap("n", "<leader>sv", "<C-w>v", opts) -- Split vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- Split horizontally
keymap("n", "<ledaer>se", "<C-w>=", opts) -- Split equally
keymap("n", "<leader>sx", ":close<CR>", opts)

-- Quit Vim
keymap("n", "<leader>q", ":q!<CR>", opts) -- Force Quit
keymap("n", "<leader>w", ":wq<CR>", opts) -- Save and Quit

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Ctrl+S to Save
keymap("n", "<C-S>", ":update<CR>", opts)
keymap("v", "<C-S>", "<C-C>:update<CR>", opts)
keymap("i", "<C-S>", "<C-O>:update<CR>", opts)

--Telescope
keymap("n","<leader>ff",builtin.find_files, {})
keymap("n","<C-p>",builtin.git_files, {})
keymap("n","<C-n>","<CMD>:Telescope notify<CR>", {})
keymap("n","<leader>fg",function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Glow : Markdown Preview
keymap("n","<C-a>","<CMD>:Glow<CR>",opts)
keymap("i","<C-a>","<CMD>:Glow<CR>",opts)
