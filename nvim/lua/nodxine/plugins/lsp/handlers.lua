local M = {}

M.setup = function()
  -- help vim.diagnostic.config()
  vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    signs = {
      -- Text-based icons for the following diagnostic signs
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.INFO] = "",
      }
    },
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
    update_in_insert = true,
    severity_sort = true,
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

-- Highlight all appearances of the current keyword under the cursor
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        " https://github.com/neovim/nvim-lspconfig/issues/379#issuecomment-707803645
        highlight LspReferenceText cterm=standout gui=standout
        highlight LspReferenceRead cterm=standout gui=standout
        highlight LspReferenceWrite cterm=standout gui=standout

        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false)
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>sd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>sD", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-q>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>tD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ff", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ff", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rm", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_highlight_document(client)
  lsp_keymaps(bufnr)
end

-- cmp integration --------------------------------------------------------------------------------
local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if cmp_nvim_lsp_status_ok then
  -- Neovim's default omnifunc has basic support for serving completion candidates. nvim-cmp
  -- supports more types of completion candidates, so users must override the capabilities sent to
  -- the server such that it can provide these candidates during a completion request.
  M.capabilities = cmp_nvim_lsp.default_capabilities()
else
  M.capabilities = vim.lsp.protocol.make_client_capabilities()
end

local ufo_status_ok, _ = pcall(require, "ufo")

if ufo_status_ok then
  M.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
end

return M
