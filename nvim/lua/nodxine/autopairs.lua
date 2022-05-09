local status_ok, autopairs = pcall(require, "nvim-autopairs")

if not status_ok then
  return
end

autopairs.setup {
  -- Disable for these file types
  disable_filetype = { "TelescopePrompt" },

  -- Disable when recording or executing a macro
  disable_in_macro = true,

  -- Disable when insert after visual block mode
  disable_in_visualblock = true,

  -- Don't add a pair if the next character is alphanumeric, `%`, `'`, `]`, `"`, or `.`
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),

  -- Before        Input         After
  -- ------------------------------------
  -- (|)            )            ()|
  enable_moveright = true,

  -- Before        Input         After
  -- ------------------------------------
  -- |"a"           (            (|"a")
  enable_afterquote = true,

  -- Before        Input         After
  -- ------------------------------------
  -- (  |))         (            (  (|))
  enable_check_bracket_line = true,

  -- Before        Input         After
  -- ------------------------------------
  -- "|"            (            "(|)"
  enable_bracket_in_quote = false,

  -- Check treesitter for a pair
  check_ts = true,

  ts_config = {
    -- lua = { "string" },-- it will not add a pair on that treesitter node
    -- javascript = { "template_string" },
    -- java = false, -- don't check treesitter on java
  },

  -- Before        Input         After
  -- ------------------------------------
  -- {|}           <CR>          {
  --                                |
  --                             }
  -- ------------------------------------
  map_cr = true,

  -- Before        Input         After
  -- ------------------------------------
  -- (|)            <BS>         |
  map_bs = true,

  -- Map the <C-h> key to delete a pair
  map_c_h = false,

  -- Map <c-w> to delete a pair if possible
  map_c_w = true,

  -- Before        Input                    After
  -- --------------------------------------------------
  -- (|foobar      <M-e> then press $        (|foobar)
  -- (|)(foobar)   <M-e> then press q       (|(foobar))
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = -1, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey="Comment"
  },
}

-- cmp integration --------------------------------------------------------------------------------
local cmp_status_ok, cmp = pcall(require, "cmp")

if cmp_status_ok then
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  -- Enable inserting `(` after select function or method item
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end
