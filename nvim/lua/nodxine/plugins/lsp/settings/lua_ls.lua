local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        library = {
          -- Make the server aware of Neovim runtime files
          unpack(vim.api.nvim_get_runtime_file("", true)),

          -- Make the server aware of lazy.nvim-manage plugins
          unpack(vim.split(vim.fn.glob(vim.fn.stdpath("data") .. "/lazy/*"), "\n"))
        },
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    }
  },

  on_attach = require("nodxine.plugins.lsp.handlers").on_attach,

  capabilities = require("nodxine.plugins.lsp.handlers").capabilities,
}
