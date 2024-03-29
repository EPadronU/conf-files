-- Neovim -----------------------------------------------------------------------------------------
-- Make a backup before overwriting a file...
vim.opt.writebackup = true

-- ... and remove it after the file was successfully written
vim.opt.backup = false

-- Connect the system's clipboard with the unnamed, `*`, and `+` registers
-- vim.opt.clipboard = "unnamedplus"

-- Show more space in the command line for displaying messages
vim.opt.cmdheight = 2

-- Indicate the limit of the recommended text width
vim.opt.colorcolumn = "+1"

-- Configure the completion pop-up behavior and appearance
vim.opt.completeopt = { "menuone", "noselect" }

-- Make visible text constructs like `` in markdown files
vim.opt.conceallevel = 0

-- Prompt to save unsaved changes when exiting
vim.opt.confirm = true

-- Highlight the screen line where the cursor is at
vim.opt.cursorline = true

-- Use the appropriate number of spaces to insert a <Tab>
vim.opt.expandtab = true

-- Set the file-content encoding
vim.opt.fileencoding = "UTF-8"

-- Edit multiple unsaved files at the same time
vim.opt.hidden = true

-- Highlight all matches when there is a previous search pattern
vim.opt.hlsearch = true

-- Ignore case in search patterns...
vim.opt.ignorecase = true

-- ... unless they contain upper case characters
vim.opt.smartcase = true

-- Show where the pattern matches, while it is being typed
vim.opt.incsearch = true

-- Make `-` part of a word (e.g.: pop-up)
vim.opt.iskeyword:append("-")

-- Always show a status line
vim.opt.laststatus = 3

-- Redraw only when we need to (can speed-up macro execution)
vim.opt.lazyredraw = true

-- Disable the use of the mouse
vim.opt.mouse = ""

-- Display line numbers at the left of the screen
vim.opt.number = true

-- Set the minimal number of columns to use for line numbers
vim.opt.numberwidth = 2

-- Set the maximum number of items to show in the pop-up menu
vim.opt.pumheight = 10

-- Show relative line numbers
vim.opt.relativenumber = true

-- Display at least 8 lines above and below the cursor
vim.opt.scrolloff = 8

-- Display at least 8 columns to the left and to the right of the cursor
vim.opt.sidescrolloff = 8

-- Define the information to be stored in the shada file
vim.opt.shada = "'25,f1,<300,:100,/100,h"

-- Avoid using any other shell, like fish-shell for example
vim.opt.shell = "/bin/bash"

-- Set the number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- Disable the message showing in what mode we currently are
vim.opt.showmode = false

-- Show the line with tab page labels at all times
vim.opt.showtabline = 2

-- Set the minimal number of columns to scroll horizontally
vim.opt.sidescroll = 1

-- Display the sign-column all the time
vim.opt.signcolumn = "yes"

-- Enable better auto-indentation
vim.opt.smartindent = true

-- Set the number of spaces that a <Tab> counts for while performing editing operations
vim.opt.softtabstop = 2

-- Set the languages to take in account for spell checking
vim.opt.spelllang = { "en", "es" }

-- When splitting a window horizontally, put the new one below the current window
vim.opt.splitbelow = true

-- When splitting a window vertically, put the new one to the right of the current window
vim.opt.splitright = true

-- Create swapfiles and write them to disk after...
vim.opt.swapfile = true

-- ... this many milliseconds has passed with nothing being typed
vim.opt.updatetime = 1500

-- Set the time in milliseconds to wait for a mapped sequence to complete
vim.opt.timeoutlen = 1000

-- Enables 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Maximum width of text per line
vim.opt.textwidth = 99

-- Preserve undo history to an undo file
vim.opt.undofile = true

-- Preserve cursor position and folds state
vim.opt.viewoptions = { "cursor", "folds" }

-- Move to the previous/next line when press at the beginning/end of one
vim.opt.whichwrap:append("<,>,[,],h,l")

-- Expand match on first Tab complete
vim.opt.wildmode = { "longest:full", "full" }

-- Don't wrap long lines so that one has to scroll horizontally to see the rest of them
vim.opt.wrap = false

-- Folding options for the UFO plugin
-- When and how to draw the foldcolumn
vim.opt.foldcolumn = '0'

-- Folds with a higher level will be closed
vim.opt.foldlevel = 99 -- Using ufo provider need a large value

-- Sets 'foldlevel' when starting to edit another buffer in a window
vim.opt.foldlevelstart = 99

-- When off, all folds are open
vim.opt.foldenable = true
