local setup_session = function()
  require("mini.sessions").setup {
    -- Whether to read latest session if Neovim opened without file arguments
    autoread = false,

    -- Whether to write current session before quitting Neovim
    autowrite = true,

    -- Directory where global sessions are stored (use `''` to disable)
    directory = vim.fn.stdpath("data") .. "/session",

    -- File for local session (use `''` to disable)
    file = "", -- I rather use vim-obsession

    -- Whether to force possibly harmful actions (meaning depends on function)
    force = { read = false, write = true, delete = false },

    -- Hook functions for actions. Default `nil` means 'do nothing'.
    hooks = {
      -- Before successful action
      pre = { read = nil, write = nil, delete = nil },

      -- After successful action
      post = { read = nil, write = nil, delete = nil },
    },

    -- Whether to print session path after action
    verbose = { read = false, write = true, delete = true },
  }
end

local setup_starter = function()
  -- https://github.com/goolord/alpha-nvim/blob/main/doc/alpha.txt
  local header_art = [[
                                 __
    ___     ___    ___   __  __ /\_\    ___ ___
   / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\
  /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \
  \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
  ]]

  -- https://onlineasciitools.com/convert-text-to-ascii-art | Ogre
  local footer_art = [[
                     _                      __             _        _
                    | |__   _   _        /\ \ \  ___    __| |__  __(_) _ __    ___
                    | '_ \ | | | |      /  \/ / / _ \  / _` |\ \/ /| || '_ \  / _ \
                    | |_) || |_| |     / /\  / | (_) || (_| | >  < | || | | ||  __/
                    |_.__/  \__, |     \_\ \/   \___/  \__,_|/_/\_\|_||_| |_| \___|
                            |___/
  ]]

  local starter = require("mini.starter")

  starter.setup {
    -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
    -- started with intent to show something else
    autoopen = true,

    -- Whether to evaluate action of single active item
    evaluate_single = true,

    -- Items to be displayed. Should be an array with the following elements:
    -- - Item: table with <action>, <name>, and <section> keys.
    -- - Function: should return one of these three categories.
    -- - Array: elements of these three types (i.e. item, array, function).
    -- If `nil` (default), default items will be used (see |mini.starter|).
    items = {
      starter.sections.builtin_actions(),
      function() -- My own custom `Telescope` section
        return {
          { action = "Telescope find_files",  name = "Files",     section = "Telescope" },
          { action = "Telescope live_grep",   name = "Live grep", section = "Telescope" },
          { action = "Telescope git_commits", name = "Commits",   section = "Telescope" },
          { action = "Telescope git_status",  name = "Status",    section = "Telescope" },
        }
      end,
      starter.sections.recent_files(3, true, false),
      starter.sections.recent_files(6, false, true),
      starter.sections.sessions(10, true),
      function() -- My own custom `Lazy` section
        return {
          { action = "Lazy sync", name = "Sync", section = "Lazy" },
        }
      end,
    },

    -- Header to be displayed before items. Converted to single string via
    -- `tostring` (use `\n` to display several lines). If function, it is
    -- evaluated first. If `nil` (default), polite greeting will be used.
    header = header_art,

    -- Footer to be displayed after items. Converted to single string via
    -- `tostring` (use `\n` to display several lines). If function, it is
    -- evaluated first. If `nil` (default), default usage help will be shown.
    footer = footer_art,

    -- Array  of functions to be applied consecutively to initial content.
    -- Each function should take and return content for 'Starter' buffer (see
    -- |mini.starter| and |MiniStarter.content| for more details).
    content_hooks = {
      starter.gen_hook.adding_bullet("❯ "),
      starter.gen_hook.indexing("all", { "Builtin actions", "Sessions", "Telescope", "Lazy" }),
      starter.gen_hook.aligning("center", "center"),
    },

    -- Characters to update query. Each character will have special buffer
    -- mapping overriding your global ones. Be careful to not add `:` as it
    -- allows you to go into command mode.
    query_updaters = [[abcdefghijklmnopqrstuvwxyz0123456789_-.]],
  }
end

local setup_indentscope = function()
  local indentscope = require("mini.indentscope")

  indentscope.setup {
    draw = {
      -- Delay (in ms) between event and start of drawing scope indicator
      delay = 200,

      -- Animation rule for scope's first drawing. A function which, given next
      -- and total step numbers, returns wait time (in ms). See
      -- |MiniIndentscope.gen_animation()| for builtin options. To not use
      -- animation, supply `require('mini.indentscope').gen_animation('none')`.
      animation = indentscope.gen_animation.none(),
    },

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Textobjects
      object_scope = "ii",
      object_scope_with_border = "ai",

      -- Motions (jump to respective border line; if not present - body line)
      goto_top = "[i",
      goto_bottom = "]i",
    },

    -- Options which control computation of scope. Buffer local values can be
    -- supplied in buffer variable `vim.b.miniindentscope_options`.
    options = {
      -- Type of scope's border: which line(s) with smaller indent to
      -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
      border = "both",

      -- Whether to use cursor column when computing reference indent. Useful to
      -- see incremental scopes with horizontal cursor movements.
      indent_at_cursor = true,

      -- Whether to first check input line to be a border of adjacent scope.
      -- Use it if you want to place cursor on function header to get scope of
      -- its body.
      try_as_border = true,
    },

    -- Which character to use for drawing scope indicator
    symbol = "┃", -- "╎",
  }

  -- Disable for certain file types
  vim.cmd [[
    " autocmd group for the following ':autocmd' commands
    augroup mini-indentscope.lua

    " Clear this group to prevent accidental double-loading
    autocmd!

    autocmd FileType help,lsp-installer,NvimTree,packer,starter,TelescopePrompt let b:miniindentscope_disable=v:true
  ]]
end

return {
  "echasnovski/mini.nvim",

  config = function()
    setup_session()
    setup_starter()
    setup_indentscope()
  end,
}
