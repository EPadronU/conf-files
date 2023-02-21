--[[ lazy.nvim is a modern plugin manager for Neovim ]]
-- Where the lazy.nvim files are (or will be) located at
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap lazy.nvim
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Load lazy.nvim
vim.opt.rtp:prepend(lazypath)

-- Load my custom setup
require("nodxine")
