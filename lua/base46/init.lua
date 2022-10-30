local M = {}
local g = vim.g

M.get_theme_tb = function(type)
  local theme = g.skcode_theme
  -- 默认主题: onedark
  if theme == nil then
    theme = "onedark"
  end

  local default_path = "base46.themes." .. theme

  local present1, default_theme = pcall(require, default_path)

  if present1 then
    return default_theme[type]
  else
    error("No such theme bruh >_< ")
  end
end

M.merge_tb = function(table1, table2)
  return vim.tbl_deep_extend("force", table1, table2)
end

M.load_all_highlights = function()
  vim.opt.bg = require("base46").get_theme_tb("type") -- dark/light

  -- reload highlights for theme switcher
  local reload = require("plenary.reload").reload_module

  reload("base46.integrations")
  reload("base46.chadlights")

  local hl_groups = require("base46.chadlights")

  for hl, col in pairs(hl_groups) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.turn_str_to_color = function(tb_in)
  local tb = vim.deepcopy(tb_in)
  local colors = M.get_theme_tb("base_30")

  for _, groups in pairs(tb) do
    for k, v in pairs(groups) do
      if k == "fg" or k == "bg" then
        if v:sub(1, 1) == "#" or v == "none" or v == "NONE" then
        else
          groups[k] = colors[v]
        end
      end
    end
  end

  return tb
end

M.extend_default_hl = function(highlights)
  local glassy = require("base46.glassy")
  local polish_hl = M.get_theme_tb("polish_hl")

  -- polish themes
  if polish_hl then
    for key, value in pairs(polish_hl) do
      if highlights[key] then
        highlights[key] = M.merge_tb(highlights[key], value)
      end
    end
  end

  -- transparency
  if vim.g.transparency then
    for key, value in pairs(glassy) do
      if highlights[key] then
        highlights[key] = M.merge_tb(highlights[key], value)
      end
    end
  end
end

M.load_highlight = function(group)
  if type(group) == "string" then
    group = require("base46.integrations." .. group)
    M.extend_default_hl(group)
  end

  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.load_theme = function()
  M.load_highlight("defaults")
  M.load_highlight("statusline")
  M.load_highlight("syntax")
  -- M.load_highlight(M.turn_str_to_color(config.ui.hl_add))
end

M.override_theme = function(default_theme)
  return default_theme
end

M.toggle_theme = function() end

M.toggle_transparency = function() end

return M
