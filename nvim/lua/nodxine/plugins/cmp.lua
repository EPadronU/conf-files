return {
  -- Completion engine
  "hrsh7th/nvim-cmp",

  -- Completion plugins
  dependencies = {
    { "f3fora/cmp-spell" }, -- Based on vim's spellsuggest
    { "hrsh7th/cmp-buffer" }, -- Source for buffer words
    { "hrsh7th/cmp-emoji" }, -- :smilie: ~> 😄
    { "hrsh7th/cmp-nvim-lsp", dependencies = "nvim-lspconfig" }, -- For neovim's built-in language server client
    { "hrsh7th/cmp-nvim-lua", ft = "lua" }, -- For Neovim Lua API
    { "hrsh7th/cmp-path" }, -- For filesystem paths
    { "mtoohey31/cmp-fish", ft = "fish" }, -- For Fish shell
    { "saadparwaiz1/cmp_luasnip", dependencies = "LuaSnip" }, -- For LuaSnip
  },

  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    -- To use existing vs-code style snippets from a plugin (eg. rafamadriz/friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Help 'supper <Tab>' to work better
    local check_backspace = function()
      local col = vim.fn.col(".") - 1

      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    -- Find more here: https://www.nerdfonts.com/cheat-sheet
    local kind_icons = {
      Text = "󰙩",
      Method = "󱎥",
      Function = "󰊕",
      Constructor = "󰈏",
      Field = "󰠴",
      Variable = "󰆧",
      Class = "󰌗",
      Interface = "",
      Module = "󱒌",
      Property = "",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "󰋘",
      Struct = "󰆩",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰊄",
    }

    -- Check https://github.com/hrsh7th/nvim-cmp/issues/231 for breaking changes
    cmp.setup {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs( -1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
        ["<C-y>"] = cmp.config.disable, -- Remove the default `<C-y>` mapping.
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },

        -- Enable the <Tab> key for completion
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s", }),

        -- Enable Super <Tab> key for completion
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable( -1) then
            luasnip.jump( -1)
          else
            fallback()
          end
        end, { "i", "s", }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "fish" },
        { name = "luasnip" },
        {
          name = "buffer",
          option = {
            -- A function that specifies the buffer numbers to complete
            get_bufnrs = function()
              return vim.api.nvim_list_bufs() -- All buffers
            end,
          },
        },
        { name = "path" },
        { name = "emoji" },
        { name = "spell" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

          vim_item.menu = ({
                nvim_lsp = "[LSP]",
                path = "[Path]",
                buffer = "[Buffer]",
                fish = "[󰈺]",
                nvim_lua = "[Lua]",
                luasnip = "[Snippet]",
                emoji = "[Emoji]",
                spell = "[Spell]",
              })[entry.source.name]

          return vim_item
        end,
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        ghost_text = false,
      },
    }
  end,
}
