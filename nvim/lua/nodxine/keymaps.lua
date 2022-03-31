-- Setup ------------------------------------------------------------------------------------------
-- Aliases
local eval = vim.api.nvim_eval
local keymap = vim.api.nvim_set_keymap

-- Options to be reused in the keymaps
local opts = { noremap = true, silent = true }
local term_opts = { noremap = true }

-- Remap <Space> as the `leader` key
keymap("", "<Space>", "<Nop>", opts) -- Disable space for everything but for the <Leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = vim.g.mapleader

-- Normal mode ------------------------------------------------------------------------------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window resize
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)

-- Buffer navigation
keymap("n", "<M-Left>", ":bp<CR>", opts)
keymap("n", "<M-Right>", ":bn<CR>", opts)

-- Turn off search pattern highlight temporally
keymap("n", "<Leader><Space>", ":nohlsearch<CR>", opts)

-- Enable/disable spell checking
keymap("n", "<Leader>s", ":set spell!<CR>", opts)

-- Open Mundo
keymap("n", "<Leader>u", ":MundoToggle<CR>", opts)

-- Start Markdown Composer
keymap("n", "<Leader>c", ":ComposerStart<CR>", opts)

-- Move vertically by visual line
keymap("n", "j", eval("v:count ? 'j' : 'gj'"), opts)
keymap("n", "k", eval("v:count ? 'k' : 'gk'"), opts)

-- [NvimTree] --
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- [Telescope] --
keymap("n", "<C-p>", ":Telescope find_files theme=dropdown previewer=false<CR>", opts)

keymap("n", "<Leader>lg", ":Telescope live_grep theme=ivy<CR>", opts)

-- Visual mode ------------------------------------------------------------------------------------
-- Do not loose the current selection when shift indentation
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Move text up and down
keymap("v", "<A-S-j>", ":move '>+1<CR>gv", opts)
keymap("v", "<A-S-k>", ":move '<-2<CR>gv", opts)

-- Don't replace what was yanked after a paste
keymap("v", "p", '"_dP', opts)

-- Term mode --------------------------------------------------------------------------------------
-- Return to normal mode inside :term
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", term_opts)
