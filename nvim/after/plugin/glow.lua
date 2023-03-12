-- This is a markdown preview using glow
local status,glow = pcall(require,"glow")

if not status then
  print("Glow Error")
  return
end

glow.setup {
  glow_path = "", -- will be filled automatically with your glow bin in $PATH, if any
  install_path = "~\\scoop\\apps\\glow\\current\\glow", -- default path for installing glow binary
  border = "shadow", -- floating window border config
  style = "dark",  
  pager = false,
  width = 80,
  height = 100,
  width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
  height_ratio = 0.7,
}
