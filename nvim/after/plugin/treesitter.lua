local status,treesitter = pcall(require,'nvim-treesitter.configs')

if not status then
  print('Treesitter Error')
  return
end

treesitter.setup {
  ensure_installed = { "javascript","typescript","python","go","rust","lua", "vim", "help"},

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
