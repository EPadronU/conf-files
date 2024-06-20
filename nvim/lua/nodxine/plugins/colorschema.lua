local sentinel_polling_rate = 60000 -- one minute in millis

local set_colorschema = function()
  local hour = os.date("*t").hour

  local colorscheme = "dawnfox"

  if hour < 6 or hour >= 18 then
    colorscheme = "nordfox"
  end

  vim.cmd("colorscheme " .. colorscheme)
end

local start_colorschema_sentinel = function()
  set_colorschema()

  local timer = vim.loop.new_timer()

  timer:start(sentinel_polling_rate, sentinel_polling_rate, vim.schedule_wrap(set_colorschema))
end

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
          gitsign = true,
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

    start_colorschema_sentinel()
  end
}
