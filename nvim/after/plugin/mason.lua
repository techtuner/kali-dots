local mason_status, mason = pcall(require, "mason")

if not mason_status then
    print(mason_status)
    return
end


local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lspconfig_status then
    print(mason_lspconfig_status)
    return
end



mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
      "bashls",
      "golangci_lint_ls",
      "gopls",
      "marksman",
      "jedi_language_server",
      "rust_analyzer",
      "tailwindcss",
      "volar",
      "lua_ls"
   },
})
