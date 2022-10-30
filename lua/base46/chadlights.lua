local merge_tb = require("base46").merge_tb

local highlights = {}

-- push hl_dir file names to table
local hl_files = vim.fn.stdpath "data" .. "/site/pack/packer/start/base46/lua/base46/integrations"

for _, file in ipairs(vim.fn.readdir(hl_files)) do
  local integration = require("base46.integrations." .. vim.fn.fnamemodify(file, ":r"))
  highlights = merge_tb(highlights, integration)
end

-- polish theme specific highlights
local polish_hl = require("base46").get_theme_tb "polish_hl"

if polish_hl then
  highlights = merge_tb(highlights, polish_hl)
end

if vim.g.transparency then
  highlights = merge_tb(highlights, require "base46.glassy")
end

return highlights
