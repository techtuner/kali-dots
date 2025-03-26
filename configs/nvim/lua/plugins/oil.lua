return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	lazy = false,
	config = function()
		local keymap = vim.keymap.set
		require("oil").setup({

			default_file_explorer = true,
			columns = {
				"icon",
				"size",
			},
			delete_to_trash = false,
			view_options = {
				show_hideen = true,
			},
			keymaps = {
				["<C-h>"] = false,
				["<M-h>"] = "actions.select_split",
			},
		})
		keymap("n", "-", "<cmd>Oil<Cr>", { desc = "Open Parent Directory" })
		keymap("n", "<space>-", require("oil").toggle_float)
	end,
}
