return {
  -- Make Neovim's fold look modern and keep high performance
  "kevinhwang91/nvim-ufo",

  event = { "BufReadPre" },

  -- Port Promise & Async from JavaScript to Lua
  dependencies = { "kevinhwang91/promise-async" },

  config = function()
    require('ufo').setup()

    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  end,
}
