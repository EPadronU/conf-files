local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

nvim_tree.setup {
  -- Reloads the explorer every time a buffer is written to
  auto_reload_on_write = true,

  -- Completely disable netrw
  disable_netrw = true,

  -- Keeps the cursor on the first letter of the filename when moving in the tree
  hijack_cursor = true,

  -- Hijack netrw windows
  hijack_netrw = true,

  -- Opens in place of the unnamed
  hijack_unnamed_buffer_when_opening = false,

  -- Will ignore the buffer, when deciding to open the tree on setup
  ignore_buffer_on_setup = false,

  -- Will automatically open the tree when running setup if startup buffer is a directory, is empty
  -- or is unnamed
  open_on_setup = false,

  -- Opens the tree automatically when switching tabpage or opening a new tabpage if the tree was
  -- previously open
  open_on_tab = false,

  -- Changes how files within the same directory are sorted
  -- One of 'name' or 'modification_time'
  sort_by = "name",

  -- Changes the tree root directory on `DirChanged` and refreshes the tree.
  update_cwd = false,

  -- Window / buffer setup
  view = {
    -- Width of the window, can be either a `%` string or a number representing columns.
    width = 30,

    -- Height of the window, can be either a `%` string or a number representing rows
    height = 30,

    -- Side of the tree.
    -- One of 'left', 'right', 'bottom' or 'top'
    side = "right",

    -- Preserve window proportions when opening a file
    preserve_window_proportions = true,

    -- Print the line number in front of each line
    number = false,

    -- Show the line number relative to the line with the cursor in front of each line
    relativenumber = false,

    -- Show diagnostic sign column
    -- One of "yes" or "no"
    signcolumn = "yes",

    -- Configuration options for keymaps
    mappings = {
      -- Will use only the provided user mappings and not the default otherwise, extends the
      -- default mappings with the provided user mappings
      custom_only = false,

      -- A list of keymaps that will extend or override the default keymaps
      list = {
        { key = { "l", "o", "<CR>" }, action = "edit" },
        { key = "h", action = "close_node" },
      },
    },
  },
  -- UI rendering setup
  renderer = {
    -- Configuration options for tree indent markers
    indent_markers = {
      -- Display indent markers when folders are open
      enable = true,

      -- Icons shown before the file/directory
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  -- Hijacks new directory buffers when they are opened
  hijack_directories = {
    -- Enable the feature
    enable = true,

    -- Opens the tree if the tree was previously closed
    auto_open = true,
  },

  -- Update the focused file on `BufEnter`.
  -- Un-collapses the folders recursively until it finds the file
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },

  -- List of filetypes that will make |open_on_setup| not open
  ignore_ft_on_setup = {},

  -- Configuration options for the system open command
  system_open = {
    -- The command to run, leaving nil should work but useful if you want to override the default
    -- command with another one
    cmd = nil,

    -- The command arguments as a list
    args = {},
  },

  -- Show lsp diagnostics in the signcolumn
  diagnostics = {
    -- Enable the feature
    enable = true,

    -- If the node with diagnostic is not visible, then show diagnostic in the parent directory
    show_on_dirs = true,

    -- Icons for diagnostic severity
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },

  -- Filtering options
  filters = {
    -- Show `dotfiles`
    dotfiles = false,

    -- Custom list of vim regex for file/directory names that will not be shown
    custom = { "^.git$" },

    -- List of directories or files to exclude from filtering
    exclude = {},
  },


  -- Git integration with icons and colors
  git = {
    -- Enable the feature
    enable = true,

    -- Ignore files based on `.gitignore`
    ignore = false,

    -- Kills the git process after some time if it takes too long
    timeout = 600, -- ms
  },

  -- Configuration for various actions
  actions = {
    -- Toggle the use of system clipboard when copy/paste function are invoked
    use_system_clipboard = true,

    -- Change the working directory when changing directories in the tree
    change_dir = {
      enable = true,
      global = false,
    },

    open_file = {
      -- Closes the explorer when opening a file
      quit_on_open = false,

      -- Resizes the tree when opening a file
      resize_window = false,

      -- Window picker configuration
      window_picker = {
        -- Enable the feature
        enable = true,

        -- A string of chars used as identifiers by the window picker
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",

        -- Windows that should not be selectable
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },

  -- Configuration options for trashing
  trash = {
    -- The command used to trash items (must be installed on your system)
    cmd = "true", -- Handle via the event handler

    -- Show a prompt before trashing takes place
    require_confirm = true,
  },

  -- Configuration for diagnostic logging
  log = {
    -- Enable the feature
    enable = false,

    -- Remove existing log file at startup
    truncate = false,

    -- Specify which information to log
    types = {
      all = false,
      config = false,
      copy_paste = false,
      git = false,
      profile = false,
    },
  },
}

-- Workaround for trashing files/folders with `kioclient` -----------------------------------------
if vim.fn["executable"]("kioclient") then
  local events = require("nvim-tree.events")

  local function send_to_trash_with_kioclient(uri)
    vim.fn.jobstart(string.format("kioclient move '%s' trash:/", uri), {
      detach = true, on_exit = require("nvim-tree.actions.reloaders").reload_explorer
    })
  end

  events.on_file_removed(function(payload)
    send_to_trash_with_kioclient(payload.fname)
  end)

  events.on_folder_removed(function(payload)
    send_to_trash_with_kioclient(payload.folder_name)
  end)
end
