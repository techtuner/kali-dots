local notify_status, notify = pcall(require,"notify")

if not notify_status then
  print(notify_status)
end

notify.setup {
  stages = 'fade_in_slide_out',
  timeout = 1000,
  background_color = 'FloatShadow',
  render = 'compact'

}

vim.notify = require("notify")

