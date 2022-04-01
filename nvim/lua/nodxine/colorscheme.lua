local status_ok, solarized = pcall(require, "solarized")

if not status_ok then
  return
end

-- Make comments italic
vim.g.solarized_italic_comments = true

-- Make keywords italic
vim.g.solarized_italic_keywords = true

-- Make functions italic
vim.g.solarized_italic_functions = false

-- Make variables and identifiers italic
vim.g.solarized_italic_variables = false

-- Make sidebars and popup menus like nvim-tree and telescope have a different background
vim.g.solarized_contrast = false

-- Enable the border between verticaly split windows visable
vim.g.solarized_borders = true

-- Disable the setting of background color so that NeoVim can use your terminal background
vim.g.solarized_disable_background = false

-- Enable the colorscheme
solarized.set()

-- Fix https://github.com/shaunsingh/solarized.nvim/issues/3
vim.cmd("highlight Identifier ctermfg=13 guifg=" .. require("solarized.colors").purple)
