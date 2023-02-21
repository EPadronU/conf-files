return {
  "EdenEast/nightfox.nvim",

  priority = 1000,

  config = function()
    require("nightfox").setup {
      options = {
        -- Disable setting background
        transparent = false,

        -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        terminal_colors = true,

        -- Non focused panes set to alternative background
        dim_inactive = true,

        -- Default enable value for modules
        module_default = true,

        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value `:help attr-list`
        styles = {
          comments = "NONE",
          conditionals = "NONE",
          constants = "NONE",
          functions = "NONE",
          keywords = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "NONE",
        },

        -- Inverse highlight for different types
        inverse = {
          match_paren = false,
          visual = false,
          search = false,
        },

        -- List of various plugins and additional options
        modules = {
          cmp = true,
          --gitsign = true,
          mini = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
        },
      },

      palettes = {},

      specs = {},

      groups = {},
    }

    vim.cmd("colorscheme dawnfox")
  end
}
