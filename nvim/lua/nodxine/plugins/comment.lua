return {
  -- "Smart and Powerful commenting plugin for neovim"
  "numToStr/Comment.nvim",

  dependencies = {
    -- For setting the `commentstring` option based on the cursor location in the file
    "JoosepAlviste/nvim-ts-context-commentstring"
  },

  config = function()
    require("Comment").setup {
      -- Add a space b/w comment and the line
      -- @type boolean|fun():boolean
      padding = true,

      -- Whether the cursor should stay at its position
      -- NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
      -- @type boolean
      sticky = true,

      -- Lines to be ignored while comment/uncomment.
      -- Could be a regex string or a function that returns a regex string.
      -- Example: Use '^$' to ignore empty lines
      -- @type string|fun():string
      ignore = "^$",

      -- LHS of toggle mappings in NORMAL + VISUAL mode
      -- @type table
      toggler = {
        ---Line-comment toggle keymap
        line = "gcc",

        ---Block-comment toggle keymap
        block = "gbc",
      },

      -- LHS of operator-pending mappings in NORMAL + VISUAL mode
      -- @type table
      opleader = {
        ---Line-comment keymap
        line = "gc",

        ---Block-comment keymap
        block = "gb",
      },

      -- LHS of extra mappings
      -- @type table
      extra = {
        ---Add comment on the line above
        above = "gcO",

        ---Add comment on the line below
        below = "gco",

        ---Add comment at the end of line
        eol = "gcA",
      },

      -- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
      -- @type table
      mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = true,

        ---Extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,

        ---Extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false,
      },

      -- Pre-hook, called before commenting the line
      -- @type fun(ctx: Ctx):string
      -- `nvim-ts-context-commentstring` integration
      pre_hook = function(ctx)
        local U = require("Comment.utils")

        -- Determine the location where to calculate commentstring from
        local location = nil

        if ctx.ctype == U.ctype.blockwise then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
          -- Detemine whether to use linewise or blockwise commentstring
          key = ctx.ctype == U.ctype.linewise and "__default" or "__multiline",
          location = location,
        }
      end,

      -- Post-hook, called after commenting is done
      -- @type fun(ctx: Ctx)
      post_hook = nil,
    }

    -- Comment and duplicate ----------------------------------------------------------------------
    -- (src: https://github.com/numToStr/Comment.nvim/issues/70#issuecomment-998494798)
    local U = require("Comment.utils")
    local A = require("Comment.api")

    local map = vim.api.nvim_set_keymap

    local map_opt = { noremap = true, silent = true }

    function _G.__gdc(vmode)
      local range = U.get_region(vmode)
      local lines = U.get_lines(range)

      -- Copying the block
      local srow = range.erow

      vim.api.nvim_buf_set_lines(0, srow, srow, false, lines)

      -- Doing the comment
      A.comment.linewise(vmode)

      -- Move the cursor
      local erow = srow + 1
      local line = U.get_lines({ srow = srow, erow = erow })
      local _, col, _ = line[1]:find('^(%s*)')

      vim.api.nvim_win_set_cursor(0, { erow, col })
    end

    -- Mappings
    map("n", "gdc", "<CMD>lua __gdc()<CR>", map_opt)
    map("x", "gdc", "<ESC><CMD>lua __gdc(vim.fn.visualmode())<CR>", map_opt)
  end,
}
