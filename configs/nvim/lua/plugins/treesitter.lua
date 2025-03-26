return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufEnter" },
	config = function()
		---@diagnostic disable: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"bash",
				"cpp",
				"css",
				"dockerfile",
				"fish",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"make",
				"ocaml",
				"powershell",
				"python",
				"regex",
				"rust",
				"sql",
				"tmux",
				"vimdoc",
				"vim",
				"yaml",
			},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
		})
	end,
}

