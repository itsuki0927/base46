local colors = require("base46").get_theme_tb("base_30")

return {
  IndentBlanklineChar = { fg = colors.line },
  IndentBlanklineSpaceChar = { fg = colors.line },
  IndentBlanklineContextChar = { fg = colors.grey_fg },
  IndentBlanklineContextIndent1 = { fg = colors.grey_fg2 },
  IndentBlanklineContextIndent2 = { fg = colors.red },
  IndentBlanklineContextIndent3 = { fg = colors.yellow },
  IndentBlanklineContextIndent4 = { fg = colors.green },
  IndentBlanklineContextIndent5 = { fg = colors.teal },
  IndentBlanklineContextIndent6 = { fg = colors.blue },
}
