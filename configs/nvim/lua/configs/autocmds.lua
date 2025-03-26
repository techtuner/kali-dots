local api = vim.api

-- Disable auto commenting after the comment
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on Yank
-- api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     vim.api.highlight.on_yank()
--   end
-- })

-- Resize split windows on resizing terminals
api.nvim_command("autocmd VimResized * wincmd=")
