return {
  -- A File Explorer For Neovim Written In Lua
  "kyazdani42/nvim-tree.lua",

  dependencies = { "kyazdani42/nvim-web-devicons" },

  keys = {
    { "<Leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },

  config = function()
    require("nvim-tree").setup {
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

      on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- BEGIN_DEFAULT_ON_ATTACH
        vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
        vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
        vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
        vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
        vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
        vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
        vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
        vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
        vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
        vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
        vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
        vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
        vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
        vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
        vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
        vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
        vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
        vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
        vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
        vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
        vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
        vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
        vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
        vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
        vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
        vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
        vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
        vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
        vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
        vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
        vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
        vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
        vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
        vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
        vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
        vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
        vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
        vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
        vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
        vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
        vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
        vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
        vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
        vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
        vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
        vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
        vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
        vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
        vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
        vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
        vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
        vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
        -- END_DEFAULT_ON_ATTACH

        -- Custom keymaps
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
      end
    }

    -- Workaround for trashing files/folders with `kioclient` -----------------------------------------
    if vim.fn["executable"]("kioclient") then
      local api = require("nvim-tree.api")

      local function send_to_trash_with_kioclient(uri)
        vim.fn.jobstart(string.format("kioclient move '%s' trash:/", uri), {
          detach = true, on_exit = require("nvim-tree.actions.reloaders.reloaders").reload_explorer
        })
      end

      api.events.subscribe(api.events.Event.FileRemoved, function(payload)
        send_to_trash_with_kioclient(payload.fname)
      end)

      api.events.subscribe(api.events.Event.FileRemoved, function(payload)
        send_to_trash_with_kioclient(payload.folder_name)
      end)
    end
  end,

  init = function()
    local open_nvim_tree = function(data)
      -- Buffer is a directory
      if vim.fn.isdirectory(data.file) == 1 then
        -- Change to the directory
        vim.cmd.cd(data.file)

        -- Open the tree
        require("nvim-tree.api").tree.open()
      end
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end
}
