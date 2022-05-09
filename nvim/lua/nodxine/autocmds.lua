-- File-type-specific configuration ---------------------------------------------------------------
vim.cmd[[
  " autocmd group for the following ':autocmd' commands
  augroup autocmds.lua

  " Clear this group to prevent accidental double-loading
  autocmd!

  " Fish ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  autocmd FileType fish setlocal softtabstop=4 shiftwidth=4

  " Java ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  autocmd BufRead,BufNewFile *.aj setfiletype java

  " Go back to the default autocmd group
  augroup end
]]
