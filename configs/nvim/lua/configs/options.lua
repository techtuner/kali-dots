local set = vim.opt

-- Setting File encoding
set.fileencoding = "utf-8"

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Numbering
set.number = true
set.relativenumber = true

-- Searching
set.incsearch = true
set.hlsearch = true
set.ignorecase = true
set.smartcase = true

-- Dsiable backup
set.backup = false
set.writebackup = false
set.swapfile = false
set.undofile = true

-- Allow Mouse
set.mouse = "a"

-- System clipbaord
set.clipboard = "unnamedplus"

-- Splitting
set.splitbelow = true
set.splitright = true

-- Timing
set.updatetime = 100
set.timeoutlen = 1000

-- Tab/Spaces
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2

-- Wrap/Indent
set.smartindent = true
set.breakindent = true
set.wrap = true

-- UI changes
set.cmdheight = 1
set.pumheight = 10
set.scrolloff = 10
set.sidescrolloff = 10
set.numberwidth = 4
-- set.laststatus = 0
set.conceallevel = 1
set.showtabline = 0
set.showmode = false
set.termguicolors = true
set.background = "dark"
set.showcmd = false
set.ruler = false
set.cursorline = false
set.title = true
set.signcolumn = "yes"


set.completeopt = { "menu", "menuone", "noselect" }

set.fillchars = { eob = " " }
