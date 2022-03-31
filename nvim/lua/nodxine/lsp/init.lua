local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
  vim.notify("`lspconfig` plugin not found!")
  return
end

require("nodxine.lsp.lsp-installer")
require("nodxine.lsp.handlers").setup()
