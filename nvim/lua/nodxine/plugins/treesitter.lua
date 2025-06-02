return {
  -- Provide a simple and easy way to use the interface for tree-sitter in Neovim
  "nvim-treesitter/nvim-treesitter",

  dependencies = { "nvim-autopairs", "JoosepAlviste/nvim-ts-context-commentstring" },

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup {
      -- A list of parser names, or `all`
      ensure_installed = {
        "bash",
        "c",
        "css",
        "csv",
        "dockerfile",
        "doxygen",
        "fish",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "java",
        "javascript",
        "json",
        "kconfig",
        "kotlin",
        "lua",
        "make",
        "markdown",
        "prisma",     -- TS ORM
        "properties", -- Java properties file
        "python",
        "regex",
        "ruby",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },

      -- Install languages synchronously
      sync_install = false,

      -- [Module] Indentation based on treesitter for the `=` operator
      -- NOTE: This is an experimental feature.
      indent = {
        enable = true,

        disable = { "markdown" }
      },

      -- [Module] Consistent syntax highlighting
      highlight = {
        enable = true,

        custom_captures = {
          -- Highlight the @foo.bar capture group with the "Identifier" highlight group
          -- ["foo.bar"] = "Identifier",
        },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      -- [Module] Incremental selection based on the named nodes from the grammar
      incremental_selection = {
        enable = true,

        keymaps = {
          -- In normal mode, start incremental selection
          init_selection = "gnn",

          -- In visual mode, increment to the upper named parent.
          scope_incremental = "gnm",

          -- In visual mode, increment to the upper scope
          node_incremental = "gnk",

          -- In visual mode, decrement to the previous named node
          node_decremental = "gnj",
        },
      },

      -- [Module] Integrete `nvim-autopairs`
      autopairs = {
        enable = true,
      }
    }
  end,
}
