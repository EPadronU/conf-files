-- Set the theme
vim.g.airline_theme = "solarized"
vim.g.airline_solarized_bg = "light"

-- Integrate with powerline fonts
vim.g.airline_powerline_fonts = 1

-- Filetypes which are excluded from having its window statusline modified
vim.g.airline_exclude_filetypes = { }

-- Caches the changes to the highlighting groups, should therefore be faster
vim.g.airline_highlighting_cache = 1

-- Customize some symbols
vim.g.airline_symbols = {
  colnr = " ℅:",
  maxlinenr = ""
}

-- Extensions to be (lazy-)loaded
vim.g.airline_extensions = {
  "branch",
  "fugitiveline",
  "fzf",
  "keymap",
  "nvimlsp",
  "obsession",
  "po",
  "quickfix",
  "searchcount",
  "term",
  --"undotree",
  "whitespace",
  "wordcount",
}

-- Extensions' configuration
vim.cmd[[
  " Truncate long branch names to a fixed length
  let g:airline#extensions#branch#displayed_head_limit = 20

  " 0 leaves the name unmodifed (default)
  " 1 to only show the branch's tail (e.g. 'feature/foo' becomes 'foo')
  " 2 to truncate all path sections but the last one (e.g. 'foo/bar/baz' becomes 'f/b/baz')
  let g:airline#extensions#branch#format = 0

  " Truncate sha1 commits at this number of characters
  let g:airline#extensions#branch#sha1_len = 8

  " nvimlsp error symbol
  let airline#extensions#nvimlsp#error_symbol = ' '

  " nvimlsp warning symbol
  let airline#extensions#nvimlsp#warning_symbol = ' '

  " Customize the whitespace symbol
  let g:airline#extensions#whitespace#symbol = ''
]]

