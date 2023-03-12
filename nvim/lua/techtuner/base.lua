local set= vim.opt

set.relativenumber = true
set.number = true
set.wrap = true
set.ignorecase = true
set.smartcase = true
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.numberwidth = 4
set.cursorline= false
set.mouse = 'a'
set.backspace = "indent,eol,start"
set.fileencoding = "utf-8"
set.clipboard:append("unnamedplus")
set.updatetime=500
set.termguicolors = true
set.linebreak = true
set.hlsearch = true
set.incsearch = true
set.background = "dark"
set.showmode = false
set.signcolumn = "no"
set.laststatus = 0
set.splitright = true
set.splitbelow = true

set.pumheight = 10
set.scrolloff = 10
set.sidescrolloff = 10
set.cmdheight = 2

set.iskeyword:append("-")
set.completeopt ="menu,menuone,noselect"
set.writebackup = false


-- Adding 'q' as keybinding to close some of the plugins
vim.api.nvim_create_autocmd({ "FileType" },{
  pattern = { "qf","mason","telescope","help","man","lspinfo","spectre_panel"  },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

-- Highlight Yanked (Copied) Text
vim.api.nvim_create_autocmd({ "TextYankPost" },{
  callback = function()
    vim.highlight.on_yank({ higroup = "visual",timeout = 200 })
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" },{
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
