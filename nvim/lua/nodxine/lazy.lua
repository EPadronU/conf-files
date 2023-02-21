-- lazy.nvim is a modern plugin manager for Neovim
require("lazy").setup {
  -- Directory where plugins will be installed at
  root = vim.fn.stdpath("data") .. "/lazy",

  defaults = {
    -- Should plugins be lazy-loaded?
    lazy = false,

    -- Installing the latest development version of plugins
    version = nil,
  },

  -- Leave nil when passing the spec as the first argument to setup()
  spec = "nodxine.plugins", ---@type LazySpec

  -- Lockfile generated after running update
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",

  -- Limit the maximum amount of concurrent tasks
  concurrency = 8, ---@type number

  git = {
    -- Defaults for the `Lazy log` command
    log = { "-10" }, -- show the last 10 commits

    -- Kill processes that take more than 2 minutes
    timeout = 120,

    url_format = "https://github.com/%s.git",

    -- lazy.nvim requires git >=2.19.0
    -- To use lazy with an older version, then set the below to false
    filter = true,
  },

  dev = {
    -- Directory where local plugin projects are located at
    path = "~/InProgress/FOSS/nvim-plugins",

    -- Plugins that match these patterns will use the local versions instead of being fetched from GitHub
    patterns = {}, ---@type string[]

    -- Fallback to git when local plugin doesn't exist
    fallback = false,
  },

  install = {
    -- Install missing plugins on startup (this doesn't increase startup time)
    missing = true,

    -- Try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "dawnfox" },
  },

  ui = {
    -- A number < 1 is a percentage, > 1 is a fixed size
    size = { width = 0.8, height = 0.8 },

    -- Wrap the lines in the ui
    wrap = false,

    -- The border to use for the UI window
    -- Accepts same border values as |nvim_open_win()|
    border = "rounded",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "😪 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },

    -- Leave nil, to automatically select a browser depending on the OS
    -- To use a specific browser, it can be defined here
    browser = nil, ---@type string?

    -- How frequently should the ui process render events
    throttle = 20,

    -- Custom key maps here can be defined here
    -- To disable one of the defaults, set it to false
    custom_keys = {
      -- Open lazygit log
      ["<localleader>l"] = function(plugin)
        require("lazy.util").float_term({ "lazygit", "log" }, {
          cwd = plugin.dir,
        })
      end,

      -- Open a terminal for the plugin dir
      ["<localleader>t"] = function(plugin)
        require("lazy.util").float_term(nil, {
          cwd = plugin.dir,
        })
      end,
    },
  },

  diff = {
    -- diff command <d> can be one of:
    -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
    --   so you can have a different command for diff <d>
    -- * git: will run git diff and open a buffer with filetype git
    -- * terminal_git: will open a pseudo terminal with git diff
    -- * diffview.nvim: will open Diffview to show the diff
    cmd = "git",
  },

  checker = {
    -- Automatically check for plugin updates
    enabled = true,

    -- Set to 1 to check for updates very slowly
    concurrency = 4, ---@type number?

    -- Get a notification when new updates are found
    notify = true,

    -- Check for updates every day
    frequency = 86400,
  },

  change_detection = {
    -- Automatically check for config file changes and reload the ui
    enabled = true,

    -- Get a notification when changes are found
    notify = true,
  },

  performance = {
    cache = {
      enabled = true,
    },

    -- Reset the package path to improve startup time
    reset_packpath = true,

    rtp = {
      -- Reset the runtime path to $VIMRUNTIME and your config directory
      reset = true,

      -- Add any custom paths here that you want to includes in the rtp
      paths = {}, ---@type string[]

      -- List any plugins you want to disable here
      ---@type string[]
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        -- "tarPlugin",
        "tohtml",
        "tutor",
        -- "zipPlugin",
      },
    },
  },

  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    root = vim.fn.stdpath("state") .. "/lazy/readme",

    files = { "README.md", "lua/**/README.md" },

    -- Only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },

  -- State info for checker and other things
  state = vim.fn.stdpath("state") .. "/lazy/state.json",
}
