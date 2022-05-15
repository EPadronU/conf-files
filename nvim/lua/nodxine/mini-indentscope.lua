local status_ok, indentscope = pcall(require, "mini.indentscope")

if not status_ok then
  return
end

indentscope.setup {
  draw = {
    -- Delay (in ms) between event and start of drawing scope indicator
    delay = 200,

    -- Animation rule for scope's first drawing. A function which, given next
    -- and total step numbers, returns wait time (in ms). See
    -- |MiniIndentscope.gen_animation()| for builtin options. To not use
    -- animation, supply `require('mini.indentscope').gen_animation('none')`.
    animation = indentscope.gen_animation("none"),
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
vim.cmd[[
  " autocmd group for the following ':autocmd' commands
  augroup mini-indentscope.lua

  " Clear this group to prevent accidental double-loading
  autocmd!

  autocmd FileType help,lsp-installer,NvimTree,packer,starter,TelescopePrompt let b:miniindentscope_disable=v:true
]]
