local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

lspconfig.emmet_ls.setup {
  filetypes = { "html", "css" },

  on_attach = require("nodxine.lsp.handlers").on_attach,

  capabilities = require("nodxine.lsp.handlers").capabilities,
}
