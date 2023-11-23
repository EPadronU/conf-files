return {
  -- Provide a simple and easy way to use the interface for tree-sitter in Neovim
  "nvim-treesitter/nvim-treesitter",

  dependencies = { "nvim-autopairs", "JoosepAlviste/nvim-ts-context-commentstring" },

  build = ":TSUpdate",

  init = function ()
    -- [Module] Integrate `nvim-ts-context-commentstring`
    -- Skip backwards compatibility routines and speed up loading
    vim.g.skip_ts_context_commentstring_module = true
  end,

  config = function()
    require("nvim-treesitter.configs").setup {
      -- A list of parser names, or `all`
      ensure_installed = {
        "bash",
        "c",
        "css",
        "dockerfile",
        "fish",
        "html",
        "java",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "kotlin",
        "lua",
        "make",
        "php",
        "python",
        "regex",
        "ruby",
        "scheme",
        "vim",
      },

      -- Install languages synchronously
      sync_install = false,

      -- [Module] Indentation based on treesitter for the `=` operator
      -- NOTE: This is an experimental feature.
      indent = {
        enable = true
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
