local colors = require("base46").get_colors "base_30"

local M = {
   NormalFloat = {
      bg = colors.darker_black,
   },
   FloatBorder = {
      fg = colors.white,
      bg = colors.darker_black,
   },

   RenamerNormal = {
      bg = colors.darker_black,
   },
   RenamerTitle = {
      fg = colors.black,
      bg = colors.blue,
   },

   NvimTreeWinSeparator = {
      fg = colors.one_bg2,
      bg = "NONE",
   },

   TelescopePromptNormal = {
      fg = colors.white,
      bg = colors.darker_black,
   },
   TelescopePromptPrefix = {
      fg = colors.red,
      bg = colors.darker_black,
   },
   TelescopeSelection = {
      bg = colors.black2,
   },
}

-- for hl groups which need bg = "NONE" only!
local hl_groups = {
   "TelescopeBorder",
   "TelescopePromptBorder",
   "RenamerBorder",
}

for _, groups in ipairs(hl_groups) do
   M[groups] = {
      fg = "NONE",
      bg = "NONE",
   }
end

return M
