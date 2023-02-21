local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      -- Set default YAML spec version (1.2 or 1.1)
      yamlVersion = "1.2",

      format = {
        --  Enable/disable default YAML formatter
        enable = true,
      },

      -- Enable/disable validation feature
      validate = true,

      -- Enable/disable hover
      hover = true,

      -- Enable/disable autocompletion
      completion = true,

      editor = {
        -- Enable/disable on type indent and auto formatting array
        formatOnType = true,
      },

      -- Helps you associate schemas with files in a glob pattern
      schemas = {
        ["https://raw.githubusercontent.com/returntocorp/semgrep/develop/semgrep/semgrep/rule_schema.yaml"] = "*.semgrep.yaml",
      },
    }
  },

  on_attach = require("nodxine.plugins.lsp.handlers").on_attach,

  capabilities = require("nodxine.plugins.lsp.handlers").capabilities,
}
