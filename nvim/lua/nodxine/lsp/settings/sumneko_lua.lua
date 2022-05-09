local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        library = {
          -- Make the server aware of Neovim runtime files
          vim.api.nvim_get_runtime_file("", true),
        }
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    }
  },

  on_attach = require("nodxine.lsp.handlers").on_attach,

  capabilities = require("nodxine.lsp.handlers").capabilities,
}
