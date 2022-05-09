local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  return
end

configs.setup {
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
  },

  -- [Module] Integrate `nvim-ts-context-commentstring`
  context_commentstring = {
    enable = true,

    -- `commentstring` calculation only when it is actually needed
    -- Require for Comment.nvim integration
    enable_autocmd = false,

    -- Support for more languages
    -- config = {
      -- Simplest configuration
      -- css = '// %s',

      -- For commenting plugins
      -- typescript = { __default = '// %s', __multiline = '/* %s */' },

      -- Making use of treesitter nodes
      -- javascript = {
        -- __default = '// %s',
        -- jsx_element = '{/* %s */}',
        -- jsx_fragment = '{/* %s */}',
        -- jsx_attribute = '// %s',
        -- comment = '// %s'
      -- },
    -- },
  },
}

-- Enable Treesitter-based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Show all folds opened by default
vim.opt.foldenable = false
