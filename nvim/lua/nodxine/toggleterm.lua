local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
  return
end

toggleterm.setup {
  -- Can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 20

    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,

  -- Which key-combination to use for opening the terminal
  open_mapping = [[<c-\>]],

  -- Function to run when the terminal opens
  -- on_open = function (t: Terminal) end,

  -- Function to run when the terminal closes
  -- on_close = function(t: Terminal) end,

  -- Callback for processing output on stdout
  -- on_stdout = function(t: Terminal, job: number, data: string[], name: string) end,

  -- Callback for processing output on stderr
  -- on_stderr = function(t: Terminal, job: number, data: string[], name: string) end,

  -- Function to run when terminal process exits
  -- on_exit = function(t: Terminal, job: number, exit_code: number, name: string) end,

  -- Hide the number column in toggleterm buffers
  hide_numbers = true,

  -- This plugin automatically shades terminal filetypes...
  shade_terminals = true,

  -- ... alternatively, you can set which filetypes should be shaded
  -- shade_filetypes = {},

  -- Highlights which map to a highlight group name and a table of it's values
  -- highlights = {
  --   Normal = {
  --     guibg = <VALUE-HERE>,
  --   },
  --   NormalFloat = {
  --     link = "Normal"
  --   },
  --   FloatBorder = {
  --     guifg = <VALUE-HERE>,
  --     guibg = <VALUE-HERE>,
  --   },
  -- },

  -- The degree by which to darken the terminal's color
  -- default: 1 for dark backgrounds, 3 for light
  shading_factor = "3",

  -- Enter the terminal in insert mode
  start_in_insert = true,

  -- Whether or not the open mapping applies in insert mode
  insert_mappings = true,

  -- Whether or not the open mapping applies in the opened terminals
  terminal_mappings = true,

  -- Persist the size of horizontal and vertical terminals
  persist_size = true,

  -- One of `vertical`, `horizontal`, `tab` or `float`
  direction = "float",

  -- Close the terminal window when the process exits
  close_on_exit = true,

  -- Change the default shell
  shell = "fish",

  -- This field is only relevant if direction is set to `float`
  float_opts = {
    -- The border key is *almost* the same as `:nvim_open_win` see `:h nvim_open_win` for details
    -- on borders however the `curved` border is a custom border type not natively supported but
    -- implemented in this plugin.
    border = "curved",
    width = 90,
    height = 42,
    winblend = 10,
  }
}

-- Custom terminals -------------------------------------------------------------------------------
local Terminal = require("toggleterm.terminal").Terminal

local jshell = Terminal:new({ cmd = "jshell", hidden = true })

function _G.jshell_toggle()
  jshell:toggle()
end

vim.cmd [[ command! JShellToggle execute "lua jshell_toggle()" ]]

local btop = Terminal:new({ cmd = "btop", hidden = true })

function _G.btop_toggle()
  btop:toggle()
end

vim.cmd [[ command! BtopToggle execute "lua btop_toggle()" ]]
