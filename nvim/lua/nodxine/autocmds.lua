-- File-type-specific configuration ---------------------------------------------------------------
vim.cmd[[
" autocmd group for the following ':autocmd' commands
augroup autocmds.lua

" Clear this group to prevent accidental double-loading
autocmd!

" Fish ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType fish setlocal foldenable softtabstop=4 shiftwidth=4 textwidth=99

" Java ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType java setlocal foldenable textwidth=99
autocmd BufRead,BufNewFile *.aj setfiletype java

" Javascript ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType javascript setlocal foldenable textwidth=99

" Javascript.jsx ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType javascript.jsx setlocal foldenable textwidth=99

" Kotlin ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType kotlin setlocal foldenable textwidth=99

" Lua +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType lua setlocal foldenable textwidth=99

" Python ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType python setlocal foldenable textwidth=99

" Delete spaces at the end of each line
autocmd FileType python normal m`:%s/\s\+$//e ``

" Go back to the default autocmd group
augroup end
]]
