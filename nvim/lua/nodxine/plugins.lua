-- Automatically run `:PackerSync` whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Plugins --------------------------------------------------------------------------------------
    -- General --
    -- "Smart and Powerful commenting plugin for neovim"
    use "numToStr/Comment.nvim"

    -- Automatically restore file's cursor position and folding information after restarting (n)vim
    use "vim-scripts/restore_view.vim"

    -- An autopair plugin that supports multiple characters
    use "windwp/nvim-autopairs"

    -- A Vim plugin to visualizes the Vim undo tree
    use { "simnalamburt/vim-mundo", cmd = "MundoToggle" }

    -- Delete, change and add 'surroundings' (eg: (, [, {, ', ", <tag>, and more)
    use { "tpope/vim-surround", requires = "tpope/vim-repeat" }

    -- Colorscheme --
    use { "shaunsingh/solarized.nvim" }

    -- Language support --
    -- (Outdated but better than nothing) Support for editing fish scripts
    use { "inkch/vim-fish", ft = "fish", config = function() vim.cmd[[compiler! fish]] end }

    -- Status-line --
    use "vim-airline/vim-airline"
    use { "vim-airline/vim-airline-themes", requires = "vim-airline/vim-airline" }

    -- Markdown --
    -- Preview in a browser a HTML generated version of a markdown file
    use { "euclio/vim-markdown-composer",
      ft = "markdown",
      run = "cargo build --release --locked",
      cmd = "ComposerStart" }

    -- Git --
    -- Integration with Git providing signs in the signcolumn and mappings to operate on hunks
    use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim", "tpope/vim-repeat" } }

    -- LSP --
    -- A collection of common configurations for Neovim's built-in language server client
    use "neovim/nvim-lspconfig"

    -- Allows to seamlessly install LSP servers locally
    use { "williamboman/nvim-lsp-installer", requires = "neovim/nvim-lspconfig" }

    -- Extensions for the built-in LSP support for eclipse.jdt.ls
    use { "mfussenegger/nvim-jdtls", ft = "java",
      requires = "neovim/nvim-lspconfig" }

    -- Snippets --
    -- Snippets engine
    use { "L3MON4D3/LuaSnip" }

    -- Snippets collection
    use { "rafamadriz/friendly-snippets", requires = "L3MON4D3/LuaSnip" }

    -- cmp --
    -- Completion engine
    use { "hrsh7th/nvim-cmp" }

    -- Completion plugins
    use { "f3fora/cmp-spell", requires = "hrsh7th/nvim-cmp" } -- based on vim's spellsuggest
    use { "hrsh7th/cmp-buffer", requires = "hrsh7th/nvim-cmp" } -- source for buffer words
    use { "hrsh7th/cmp-emoji", requires = "hrsh7th/nvim-cmp" } -- :smilie: ~> 😄
    use { "hrsh7th/cmp-nvim-lsp", requires = { "hrsh7th/nvim-cmp", "neovim/nvim-lspconfig" } }
    use { "hrsh7th/cmp-nvim-lua", requires = "hrsh7th/nvim-cmp", ft = "lua"} -- For Neovim Lua API
    use { "hrsh7th/cmp-path", requires = "hrsh7th/nvim-cmp" } -- For filesystem paths
    use { "mtoohey31/cmp-fish", requires = "hrsh7th/nvim-cmp", ft = "fish" } -- For Fish shell
    use { "saadparwaiz1/cmp_luasnip", requires = { "hrsh7th/nvim-cmp",  "L3MON4D3/LuaSnip" } }

    -- Telescope --
    -- Native telescope sorter to significantly improve sorting performance
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- A telescope extension to search dependencies in MavenCentral
    use "aloussase/telescope-maven-search"

    -- A LuaSnip snippet picker for telescope
    use "benfowler/telescope-luasnip.nvim"

    -- A highly extendable fuzzy finder over lists
    use { "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" } }

    -- Treesitter --
    -- Provide a simple and easy way to use the interface for tree-sitter in Neovim
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- For setting the `commentstring` option based on the cursor location in the file
    use { "JoosepAlviste/nvim-ts-context-commentstring",
      requires = "nvim-treesitter/nvim-treesitter" }

    -- NvimTree --
    -- A File Explorer For Neovim Written In Lua
    use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }
  end,
  config = {
    display = {
      open_fn = function()
        -- :help nvim_open_win()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
    profile = {
      enable = false,
      -- The amount in ms that a plugins load time must be over for it to be included in the profile
      threshold = 1,
    },
  },
})
