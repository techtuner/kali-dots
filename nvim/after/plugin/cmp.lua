local cmp_status, cmp = pcall(require, "cmp")

if not cmp_status then
    print("Neovim Completion not installed!!!")
    return
end

local snip_status, luasnip = pcall(require, "luasnip")
if not snip_status then
  print("Luasnip is not installed")
  return

end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  print("LspKind is not installed")
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-Up>"] = cmp.mapping.select_prev_item(),
        ["<C-Down>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({
            select = true
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" })
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "..."
        })
    },
    sources = { {
        name = "nvim_lsp"
    }, {
        name = "luasnip"
    }, {
        name = "buffer"
    }, {
        name = "path"
    } },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    experimental = {
        ghost_text = true
    }
})
