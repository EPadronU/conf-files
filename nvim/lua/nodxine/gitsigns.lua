local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
  return
end

gitsigns.setup {
  -- Configure the text and highlight groups to use
  signs = {
    add          = {hl = "GitSignsAdd"   , text = "┃", numhl="GitSignsAddNr"   , linehl="GitSignsAddLn"},
    change       = {hl = "GitSignsChange", text = "┃", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"},
    delete       = {hl = "GitSignsDelete", text = "▶", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"},
    topdelete    = {hl = "GitSignsDelete", text = "‾", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"},
    changedelete = {hl = "GitSignsChange", text = "~", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"},
  },

  -- Toggle with `:Gitsigns toggle_signs`
  signcolumn = true,

  -- Toggle with `:Gitsigns toggle_numhl`
  numhl = false,

  -- Toggle with `:Gitsigns toggle_linehl`
  linehl = false,

  -- Show the old version of hunks inline in the buffer (via virtual lines)
  -- Toggle with `:Gitsigns toggle_deleted`
  show_deleted = false,

  -- Toggle with `:Gitsigns toggle_word_diff`
  word_diff = false,

  -- Diff options
  diff_opts = {
    -- One of `myers` (default), `minimal`, `patience`, `histogram`
    algorithm = "histogram",

    -- Use Neovim's built in xdiff library for running diffs
    internal = true,

    -- Use the indent heuristic for the internal diff library
    indent_heuristic = true,

    -- Start diff mode with vertical splits
    vertical = true,
  },

  -- When opening a file, a libuv watcher is placed on the respective `.git` directory to detect
  -- when changes happen, and to use as a trigger to update signs
  watch_gitdir = {
    -- Interval the watcher waits between polls of the gitdir in milliseconds
    interval = 1500,

    -- If a file is moved with `git mv`, switch the buffer to the new location
    follow_files = true
  },

  -- Attach to untracked files
  attach_to_untracked = true,

  -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame = false,

  -- Show a blame line as virtual text at the end of the current line
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
    delay = 1000,
    ignore_whitespace = false,
  },

  -- String or function used to format the virtual text of the blame line
  current_line_blame_formatter = "【<abbrev_sha>】〔<author>, <author_time:%R>〕「<summary>」",

  -- Priority to use for signs
  sign_priority = 6,

  -- Debounce time for updates (in milliseconds)
  update_debounce = 100,

  -- Function used to format `b:gitsigns_status`
  status_formatter = function(status)
    local added, changed, removed = status.added, status.changed, status.removed

    local status_txt = {}

    if added and added > 0 then table.insert(status_txt, "+" .. added) end

    if changed and changed > 0 then table.insert(status_txt, "~" .. changed) end

    if removed and removed > 0 then table.insert(status_txt, "-" .. removed) end

    return table.concat(status_txt, " ")
  end,

  -- Max file length (in lines) to attach to
  max_file_length = 5000,

  -- Option overrides for the Gitsigns preview window
  -- :help nvim_open_win()
  preview_config = {
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1
  },

  -- When using `setqflist` or `setloclist`, open Trouble instead of the quickfix/location list
  trouble = false,

  -- yadm configuration
  yadm = {
    enable = false
  },

  -- Keymaps
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})

        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr=true })
    map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr=true })

    -- Actions
    map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
    map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
    map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
    map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
    map("n", "<leader>hb", "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>")
    map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
    map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
    map("n", "<leader>hD", "<cmd>lua require'gitsigns'.diffthis('~')<CR>")
    map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")
    map("n", "<leader>tw", "<cmd>Gitsigns toggle_word_diff<CR>")
    map("n", "<leader>hq", "<cmd>Gitsigns setqflist<CR>")
    map("n", "<leader>hl", "<cmd>Gitsigns setloclist<CR>")

    -- Text object
    map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
}
