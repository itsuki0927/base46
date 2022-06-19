local colors = require("base46").get_theme_tb "base_30"

local M = {
   FloatBorder = {
      fg = colors.one_bg,
      bg = "NONE",
   },

   RenamerBorder = {
      fg = colors.one_bg,
      bg = "NONE",
   },

   FloatermBorder = {
      fg = colors.one_bg,
      bg = "NONE",
   },

   NvimTreeVertSplit = {
      fg = colors.grey,
      bg = "NONE",
   },
   NvimTreeWinSeparator = {
      fg = colors.one_bg2,
      bg = "NONE",
   },

   Comment = {
      fg = colors.grey,
   },

   TelescopeBorder = {
      fg = colors.grey,
      bg = "NONE",
   },
   TelescopePromptBorder = {
      fg = colors.grey,
      bg = "NONE",
   },
   TelescopeResultsTitle = {
      fg = colors.black,
      bg = colors.blue,
   },
}

-- for hl groups which need bg = "NONE" only!
local hl_groups = {
   "NormalFloat",
   "Normal",
   "Folded",
   "NvimTreeNormal",
   "NvimTreeNormalNC",
   "NvimTreeCursorLine",
   "NvimTreeStatusLineNC",
   "TelescopeNormal",
   "TelescopePrompt",
   "TelescopeResults",
   "TelescopePromptNormal",
   "TelescopePromptPrefix",
   "CursorLine",
   "Pmenu",
   "RenamerNormal",
   "Floaterm",
}

for _, groups in ipairs(hl_groups) do
   M[groups] = {
      bg = "NONE",
   }
end

return M
