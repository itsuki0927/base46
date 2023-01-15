local colors = require("base46").get_theme_tb("base_30")

local green = colors.green
local darker_black = colors.darker_black

return {
  HarpoonWindow = {
    bg = darker_black,
  },
  HarpoonBorder = { fg = green, bg = darker_black },
}
