local status_ok, jdtls = pcall(require, "jdtls")

if not status_ok then
  return
end

local path = require("jdtls.path")

local ms_plugins_path = path.join {
  "~",
  ".m2",
  "repository",
  "com",
  "microsoft",
  "java",
  "**",
  "*plug*.jar" }

jdtls.start_or_attach {
  cmd = { path.join { vim.fn.stdpath("data"), "mason", "bin", "jdtls" } },

  root_dir = require('jdtls.setup').find_root({ ".git", "pom.xml", "mvnw", "gradlew" }),

  settings = {
    java = {
      -- Enable/disable the 'auto build'
      autobuild = { enabled = true },

      codeGeneration = {
        -- Generate method comments when generating the methods
        generateComments = false,

        hashCodeEquals = {
          -- Use `instanceof` to compare types when generating the `hashCode` and `equals` methods
          useInstanceof = true,

          -- Use `Objects.hash` and `Objects.equals` when generating the `hashCode` and `equals`
          -- methods. This setting only applies to Java 7 and higher
          useJava7Objects = true,
        },
        toString = {
          -- The code style for generating the `toString` method
          -- Possible vaues: STRING_CONCATENATION, STRING_BUILDER, STRING_BUILDER_CHAINED,
          -- STRING_FORMAT
          codeStyle = "STRING_CONCATENATION",

          -- Limit the number of items in arrays/collections/maps to list. If 0 then list all
          limitElements = 0,

          -- List contents of arrays instead of using native `toString()`
          listArrayContents = true,

          -- Skip null values when generating the `toString` method
          skipNullValues = false,

          -- The template for generating the `toString` method.
          template = "[${object.className}]={${member.name()}=${member.value}, ${otherMembers}}",
        },
        -- Use blocks in `if` statements when generating the methods
        useBlocks = false,
      },
      completion = {
        -- Enable completion
        enabled = true,

        -- Limit the number of completion results. Set to 0 to show all results (?)
        maxResults = 0,

        -- When set to true, code completion overwrites the current text
        -- When set to false, code completion is simply added instead
        overwrite = true,
      },
      -- Enable/disable smart folding range support. If disabled, it will use the
      -- default indentation-based folding range provided by neovim/treesitter
      foldingRange = { enabled = false },

      format = {
        -- Enable/disable default Java formatter
        enabled = true,

        -- Includes the comments during code formatting
        comments = { enabled = true },

        -- Enable/disable automatic block formatting when typing `;`, `<enter>` or `}`
        onType = { enabled = true },
      },
      -- Enable/disable the implementations code lens
      implementationsCodeLens = { enabled = true },

      import = {
        -- Enable/disable the Maven importer
        maven = { enabled = true },
      },
      -- Max simultaneous project builds
      maxConcurrentBuilds = 4,

      -- Enable/disable the references code lens
      referencesCodeLens = { enabled = true },

      references = {
        -- Include getter, setter and builder/constructor when finding references
        includeAccessors = true,
      },
      -- Enable/disable rename function
      rename = { enabled = true },

      saveActions = {
        -- Enable/disable auto organize imports on save action
        organizeImports = true,
      },

      -- Enable/disable signature help
      signatureHelp = { enabled = true },

      -- Enable/disable the semantic highlighting
      semanticHighlighting = { enabled = true },
    },
  },

  -- Language server `initializationOptions`
  init_options = {
    -- Enable nvim-jdtls extra features
    extendedClientCapabilities = jdtls.extendedClientCapabilities,

    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    bundles = {
      table.unpack(vim.split(vim.fn.glob(ms_plugins_path), "\n")),
    },
  },

  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }

    require("nodxine.plugins.lsp.handlers").on_attach(client, bufnr)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>oi", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>xv", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>xc", "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>xm", "<Cmd>lua require('jdtls').extract_method()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>oi", "<Esc><Cmd>lua require'jdtls'.organize_imports(true)<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>xv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>xc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>xm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

    require("jdtls.setup").add_commands()
  end,

  capabilities = require("nodxine.plugins.lsp.handlers").capabilities,
}
