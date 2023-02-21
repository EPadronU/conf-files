return {
  -- Preview in a browser a HTML generated version of a markdown file
  "euclio/vim-markdown-composer",

  ft = "markdown",

  cmd = "ComposerStart",

  build = "cargo build --release --locked",

  config = function()
    -- Don't start the server when a markdown file is opened
    vim.g.markdown_composer_autostart = 0

    -- Syntax highlight theme (https://github.com/highlightjs/highlight.js/tree/main/src/styles)
    -- (Workaround for base16-themes: set this to `disabled` (or any other string that doesn't result
    -- on a valid theme name) and append the css in `markdown_composer_custom_css` )
    vim.g.markdown_composer_syntax_theme = "disabled"

    -- Use MultiMarkdown v6
    if vim.fn["executable"]("multimarkdown") then
      vim.g.markdown_composer_external_renderer = "multimarkdown -t html"
    end

    -- Additional stylesheets to be included
    vim.g.markdown_composer_custom_css = {
      vim.fn.expand("file://$HOME/.local/share/air.css"),
      vim.fn.expand("file://$HOME/.local/share/syntax-highlight-theme.css"),
    }

    -- Refresh every 5 seconds
    vim.g.markdown_composer_refresh_rate = 5000

    -- The port number which the server will listen on
    vim.g.markdown_composer_port = 8081
  end,
}
