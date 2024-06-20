return {
  -- A buffer line (with tabpage integration) for Neovim built using lua
  "akinsho/bufferline.nvim",

  dependencies = { "kyazdani42/nvim-web-devicons" },

  opts = {
    options = {
      -- This will change the bufferline (`buffers`) to a tabline (`tabs`)
      -- It has a lot of the same features/styling but not all
      mode = "buffers",

      -- Prefix buffer names with either the `ordinal` or `buffer id`
      -- One of `none`, `ordinal`, `buffer_id` or `both`
      -- A function can also be passed (see `:help bufferline-numbers`)
      numbers = "none",

      -- Can be a string or a function (see `:help bufferline-mouse-action`)
      close_command = "Bdelete! %d",

      -- Can be a string or a function (see `:help bufferline-mouse-action`)
      right_mouse_command = "Bdelete! %d",

      -- Can be a string or a function (see `:help bufferline-mouse-action`)
      left_mouse_command = "buffer %d",

      -- Can be a string or a function (see `:help bufferline-mouse-action`)
      middle_mouse_command = nil,

      -- The 'current buffer' indicator icon
      -- NOTE: This plugin is designed with this icon in mind, and so changing this is NOT
      -- recommended, this is intended as an escape hatch for people who cannot bear it for whatever
      -- reason
      indicator = {
        icon = "▎",
        style = "icon"
      },

      -- The close buffer button icon
      buffer_close_icon = "󰅖",

      -- The buffer modified indicator icon
      modified_icon = "●",

      -- The close tab button icon
      close_icon = "",

      -- The 'more buffers' at the left indicator icon
      left_trunc_marker = "",

      -- The 'more buffers' at the right indicator icon
      right_trunc_marker = "",

      -- Change the buffer's label in the bufferline
      -- Note: please note some names can/will break the - bufferline so use this at your discretion
      -- knowing that it has - some limitations that will *NOT* be fixed
      -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      --   -- remove extension from markdown files for example
      --   if buf.name:match("%.md") then
      --     return vim.fn.fnamemodify(buf.name, ":t:r")
      --   end
      -- end,

      -- When to start truncating the buffer's name
      max_name_length = 24,

      -- Prefix used when a buffer is de-duplicated
      max_prefix_length = 8,

      -- Tabs' visual size
      tab_size = 24,

      -- Show an indicator with diagnostics
      -- Any of `false`, `"nvim_lsp"` or `"coc"`
      diagnostics = "nvim_lsp",

      -- Update the diagnostics information when in insert or replace modes
      diagnostics_update_in_insert = true,

      -- Customise the appearance of the diagnostic count
      -- count is an integer representing total count of errors
      -- level is a string "error" | "warning"
      -- this should return a string
      -- NOTE: this will be called a lot so don't do any heavy processing here
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local diagnostic_line = ""

        for e, n in pairs(diagnostics_dict) do
          local sym = (e == "error" and "") or (e == "warning" and "" or "")

          diagnostic_line = diagnostic_line .. " " .. sym .. n
        end

        return diagnostic_line
      end,

      -- To avoid showing some buffers in the bufferline/tabline (see `:help bufferline-filtering`)
      -- NOTE: this will be called a lot so don't do any heavy processing here
      -- custom_filter = function(buf_number, buf_numbers)
      --   -- Filter out filetypes you don't want to see
      --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
      --     return true
      --   end

      --   -- Filter out by buffer name
      --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
      --     return true
      --   end

      --   -- Filter out based on arbitrary rules
      --   -- e.g. filter out vim wiki buffer from tabline in your work repo
      --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
      --     return true
      --   end

      --   -- Filter out by it's index number in list (don't show first buffer)
      --   if buf_numbers[1] ~= buf_number then
      --     return true
      --   end
      -- end,

      -- Prevent the bufferline drawing above a vertical sidebar split such as a file explorer
      -- List of tables containing the details of the window to avoid
      offsets = {
        {
          -- The window/sidebar to avoid
          filetype = "NvimTree",

          -- Optional text shown in the offset section
          text = "【Explorer】",

          -- Controls what highlight is shown above the window if it is too long it will be truncated
          highlight = "CursorLine",

          -- Change the alignment of the offset section text
          -- One of `left`, `center` or `right`
          text_align = "center"
        },
      },

      -- Whether or not to add the filetype icon highlights
      color_icons = true,

      -- Show filetype icons for buffers
      show_buffer_icons = true,

      -- Show the buffer close icon
      show_buffer_close_icons = false,

      -- Show the tab close icon
      show_close_icon = false,

      -- Show number indicator for the opened tabs
      show_tab_indicators = true,

      -- Whether or not custom sorted buffers should persist
      persist_buffer_sort = true,

      -- Change the appearance of the bufferline separators (see `:help bufferline-styling`)
      -- Any of `slant`, `padded_slant`, `thick`or `thin`
      separator_style = "thin",

      -- Make all tabs to be the same length
      enforce_regular_tabs = false,

      -- Show the bufferline at all times
      always_show_bufferline = true,

      -- Order in which the buffer are shown (see `:help bufferline-sorting`)
      -- One of `insert_after_current`, `insert_at_end`, `id`, `extension`, `relative_directory`,
      -- `directory`, `tabs` or a function
      sort_by = "insert_after_current",
    },
  },
}
