local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
  vim.notify("`nvim-lsp-installer` plugin not found!")
  return
end

lsp_installer.settings {
  ui = {
    icons = {
      -- The list icon to use for installed servers.
      server_installed = "✓",

      -- The list icon to use for servers that are pending installation.
      server_pending = "➜",

      -- The list icon to use for servers that are not installed.
      server_uninstalled = "✗",
    },
    keymaps = {
      -- Keymap to expand a server in the UI
      toggle_server_expand = "<CR>",

      -- Keymap to install a server
      install_server = "i",

      -- Keymap to reinstall/update a server
      update_server = "u",

      -- Keymap to update all installed servers
      update_all_servers = "U",

      -- Keymap to uninstall a server
      uninstall_server = "X",
    },
  },

  -- The directory in which to install all servers.
  install_root_dir = require("nvim-lsp-installer.path").concat {
    vim.fn.stdpath "data", "lsp_servers"
  },

  pip = {
    -- These args will be added to `pip install` calls. Note that setting extra args might impact
    -- intended behavior and is not recommended.
    --
    -- Example: { "--proxy", "https://proxyserver" }
    install_args = {},
  },

  -- Controls to which degree logs are written to the log file. It's useful to set this to
  -- vim.log.levels.DEBUG when debugging issues with server installations.
  log_level = vim.log.levels.INFO,

  -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is
  -- reached, any further servers that are requested to be installed will be put in a queue.
  max_concurrent_installers = 4,
}

-- Register a handler that will be called for each installed server when it's ready
-- (i.e. when installation is finished or if the server is already installed).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("nodxine.lsp.handlers").on_attach,
    capabilities = require("nodxine.lsp.handlers").capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("nodxine.lsp.settings.sumneko_lua")

    opts = vim.tbl_deep_extend("force", opts, sumneko_opts)

  elseif server.name == "jdtls" then
    local jdtls_opts = require("nodxine.lsp.settings.jdtls")

    opts = vim.tbl_deep_extend("force", opts, jdtls_opts)

  elseif server.name == "emmet" then
    opts = vim.tbl_deep_extend("force", opts, { filetypes = { "xml", "html", "css" } })
  end

  -- This setup() function will take the provided server configuration and decorate it with the
  -- necessary properties before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
