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
-- Duplicate the current line below it
keymap("n", "<Leader>dd", "yyp", opts)

-- Duplicate the current line above it
keymap("n", "<Leader>dD", "yyP", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window resize
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)

-- Buffer navigation
keymap("n", "<M-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<M-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<M-Left>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<M-Right>", ":BufferLineMoveNext<CR>", opts)

-- Tab navigation
keymap("n", "<M-j>", ":tabprevious<CR>", opts)
keymap("n", "<M-k>", ":tabnext<CR>", opts)
keymap("n", "<Leader>tn", ":tabnew %<CR>", opts)
keymap("n", "<Leader>tc", ":tabnew<CR>", opts)

-- Turn off search pattern highlight temporally
keymap("n", "<Leader><Space>", ":nohlsearch<CR>", opts)

-- Enable/disable spell checking
keymap("n", "<Leader>s", ":set spell!<CR>", opts)

-- Open Mundo
keymap("n", "<Leader>u", ":MundoToggle<CR>", opts)

-- Start Markdown Composer
keymap("n", "<Leader>cs", ":ComposerStart<CR>", opts)

-- Move vertically by visual line
keymap("n", "j", eval("v:count ? 'j' : 'gj'"), opts)
keymap("n", "k", eval("v:count ? 'k' : 'gk'"), opts)

-- [NvimTree] --
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- [Telescope] --
keymap("n", "<C-p>", ":Telescope find_files theme=dropdown previewer=false<CR>", opts)

keymap("n", "<Leader>tg", ":Telescope live_grep theme=ivy<CR>", opts)

-- [bbye] --
keymap("n", "<Leader>bd", ":Bdelete<CR>", opts)
keymap("n", "<Leader>bD", ":bufdo :Bdelete<CR>", opts)
keymap("n", "<Leader>bw", ":Bwipeout<CR>", opts)

-- [MiniSessions] --
vim.keymap.set("n", "<Leader>mks", function()
  local is_a_session_active = vim.v.this_session ~= ""

  local session_name = vim.fn.input {
    prompt = "Session name: ",
    default = (is_a_session_active                -- If there is an active session
        and vim.v.this_session:match("^.+/(.+)$") -- then get the session filename only
        or vim.fn.expand("%:t:r")),               -- or else, get the buffer name
    cancelreturn = "",
  }

  if session_name == "" and is_a_session_active then
    _G.MiniSessions.write(nil) -- Write to the current session
  elseif session_name ~= "" then
    _G.MiniSessions.write(session_name)
  end
end)

-- Visual mode ------------------------------------------------------------------------------------
-- Do not loose the current selection when shift indentation
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Move text up and down
keymap("v", "<A-S-j>", ":move '>+1<CR>gv", opts)
keymap("v", "<A-S-k>", ":move '<-2<CR>gv", opts)

-- Duplicate the selection below it
keymap("v", "<Leader>dd", "ygv<Esc>p", opts)

-- Duplicate the selection above it
keymap("v", "<Leader>dD", "yP", opts)

-- Term mode --------------------------------------------------------------------------------------
-- Return to normal mode inside :term
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", term_opts)
