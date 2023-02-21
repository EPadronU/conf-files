return {
  -- A Vim plugin to visualizes the Vim undo tree (pure vim alternative: mbbill/undotree)
  "simnalamburt/vim-mundo",

  cmd = "MundoToggle",

  config = function()
    -- Open to the right of the screen
    vim.g.mundo_right = 1

    -- Extend for 30 columns
    vim.g.mundo_width = 30

    -- Set the vertical height of the Mundo preview
    vim.g.mundo_preview_height = 15

    -- Force the preview window below current windows instead of below the graph
    vim.g.mundo_preview_bottom = 1

    -- Show a compact graph when possible
    vim.g.mundo_verbose_graph = 0
  end,
}
