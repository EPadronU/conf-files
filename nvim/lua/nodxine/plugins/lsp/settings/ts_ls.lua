local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

lspconfig.ts_ls.setup {
  filetypes = {
    "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx"
  },

  settings = {
    javascript = {
      format = {
        semicolons = "insert"
      },
      inlayHints = {
        parameterNames = {
          enabled = "literals"
        }
      },
      preferences = {
        quoteStyle = "single"
      },
      updateImportsOnFileMove = {
        enabled = "always"
      },
    },

    typescript = {
      format = {
        semicolons = "insert"
      },
      inlayHints = {
        parameterNames = {
          enabled = "literals"
        }
      },
      preferences = {
        quoteStyle = "single"
      },
      updateImportsOnFileMove = {
        enabled = "always"
      },
    },
  },

  on_attach = require("nodxine.plugins.lsp.handlers").on_attach,

  capabilities = require("nodxine.plugins.lsp.handlers").capabilities,
}
