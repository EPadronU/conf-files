return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false,   -- This plugin is already lazy

  config = function()
    local status_ok, lspconfig = pcall(require, "lspconfig")

    if not status_ok then
      return
    end

    vim.g.rustaceanvim = {
      -- LSP configuration
      server = {
        on_attach = require("nodxine.plugins.lsp.handlers").on_attach,
      },
    }
  end
}
