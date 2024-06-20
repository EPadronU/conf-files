local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

lspconfig.tailwindcss.setup {
  filetypes = {
    "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx"
  },

  on_attach = require("nodxine.plugins.lsp.handlers").on_attach,

  capabilities = require("nodxine.plugins.lsp.handlers").capabilities,
}
