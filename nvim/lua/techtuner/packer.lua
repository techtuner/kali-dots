-- [Packer](https://github.com/wbthomason/packer.nvim) : Plugin Manager


local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed install from https://github.com/wbthomason/packer.nvim'")
    return
end

packer.init({
  
  display = {
    open_fn = function()
      return require("packer.util").float({
        border = 'rounded'
      })
    end
  }
})

return require('packer').startup(function(use)
  -- Packer installs itself
  use('wbthomason/packer.nvim')
  
  -- Required Plugins
  use("nvim-lua/plenary.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lua/popup.nvim")
  
  -- Nvim-Tree : File Explorer
  use("nvim-tree/nvim-tree.lua")

  -- Treesitter : Highlighting
  use('nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" })
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  -- Rosepine : Color Theme
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  
  -- Telescope : Fuzzy Finder
  use({'nvim-telescope/telescope.nvim', tag = '0.1.1'}) 
  use("nvim-telescope/telescope-media-files.nvim") 

  -- Cmp : Auto Completion
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp")
  
  -- Comment : Comment Lines of Code
  use("numToStr/Comment.nvim")

  -- Snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets")
  use("saadparwaiz1/cmp_luasnip")

  -- GitSigns
  use("lewis6991/gitsigns.nvim")

  -- Which key
  use("folke/which-key.nvim")

  -- LSP(language Server Protocol)
  use("williamboman/mason.nvim") -- Manage and Install LSP server
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig") -- Configure LSP Server
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use("onsails/lspkind.nvim")
  use('jose-elias-alvarez/null-ls.nvim')

  -- Notification
  use('rcarriga/nvim-notify')

  -- Markdown Preview
  use('ellisonleao/glow.nvim')

  if packer_bootstrap then
    require('packer').sync()
  end
end)
