local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

local capabilities = require("nodxine.plugins.lsp.handlers").capabilities

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup {
  on_attach = require("nodxine.plugins.lsp.handlers").on_attach,

  capabilities = capabilities,
}
