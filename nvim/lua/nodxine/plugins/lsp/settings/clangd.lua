local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

-- https://manpages.ubuntu.com/manpages/jammy/en/man1/clangd.1.html
local clangd_flags = {
  "--fallback-style=google", -- clang-format style to apply by default when no .clang-format file is found
  "--background-index", -- Index project code in the background and persist index on disk
  "-j=12", -- Number of async workers used by clangd. Background index also uses this many workers
  "--all-scopes-completion", -- Code completion will include index symbols that are not defined in the scopes
  "--pch-storage=disk", -- Storing PCHs in memory increases memory usages, but may improve performance
  "--clang-tidy", -- Enable clang-tidy diagnostics
  "--log=error", -- Verbosity of log messages written to stderr
  "--completion-style=detailed", -- Granularity of code completion suggestions
  "--header-insertion=iwyu", -- Add #include directives when accepting code completions
  "--header-insertion-decorators", -- Prepend a circular dot or space before the completion label, depending on whether an include line will be inserted or not
  "--enable-config", -- Read user and project configuration from YAML files.
  "--offset-encoding=utf-16", -- Play along with null-ls
  "--ranking-model=heuristics",
  "--folding-ranges",
}

lspconfig.clangd.setup {
  cmd = { "clangd", unpack(clangd_flags) },

  on_attach = require("nodxine.plugins.lsp.handlers").on_attach,

  capabilities = require("nodxine.plugins.lsp.handlers").capabilities,
}
