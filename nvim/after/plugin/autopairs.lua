local status, npairs = pcall(require, "nvim-autopairs")
if not status then
    print("Autopairs Error:")
    return
end


npairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string" },
        javascript = { "template_string" }

    },
    disable_filetype = { "TelescopePrompt" }
})


local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
