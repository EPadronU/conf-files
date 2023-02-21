return {
  -- (Outdated but better than nothing) Support for editing fish scripts
  "inkch/vim-fish",

  ft = "fish",

  config = function()
    vim.cmd [[ compiler! fish ]]
  end
}
