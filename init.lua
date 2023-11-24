--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- A split up user configuration example can be found at: https://github.com/AstroNvim/split_user_example

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },
  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = false, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
      tabstop = 4, -- Number of space in a tab
      showtabline = 4, -- always display tabline
      swapfile = false,
      colorcolumn = "80",
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = false, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          "c",
          "cpp",
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr) end,
    -- override the LSP setup handler function based on server name
    -- setup_handlers = {
    --   -- first function changes the default setup handler
    --   function(server, opts) require("lspconfig")[server].setup(opts) end,
    --   -- keys for a specific server name will be used for that LSP
    --   lua_ls = function(server, opts)
    --     -- custom lua_ls setup handler
    --     require("lspconfig")["lua_ls"].setup(opts)
    --   end,
    -- },

    -- Add overrides for LSP server settings, the keys are the name of the server
    config = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>lg"] = { "<cmd>:lua require('neogen').generate()<CR>", desc = "generate comment" },
      ["<leader><space>w"] = { "<cmd>:HopWord<cr>", desc = "Hop any word" },
      ["<leader><space>b"] = { "<cmd>:HopWord<cr>", desc = "Hop any word" },
      ["<leader><space>c"] = { "<cmd>:HopChar1<cr>", desc = "Hop any char" },
      [";"] = { ":" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin", "matchparen" },
      },
    },
  },
  -- Configure plugins
  plugins = {
    -- Plugin entries can also be used to override the default options for plugins as well
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        -- customize the dashboard header
        opts.section.header.val = {
          " █████  ███████ ████████ ██████   ██████",
          "██   ██ ██         ██    ██   ██ ██    ██",
          "███████ ███████    ██    ██████  ██    ██",
          "██   ██      ██    ██    ██   ██ ██    ██",
          "██   ██ ███████    ██    ██   ██  ██████",
          " ",
          "    ███    ██ ██    ██ ██ ███    ███",
          "    ████   ██ ██    ██ ██ ████  ████",
          "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
          "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
          "    ██   ████   ████   ██ ██      ██",
        }
        return opts
      end,
    },
    {
      "AstroNvim/astrocommunity",
      { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
      {
        import = "astrocommunity.motion.flash-nvim",
        keys = {
          { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
      },
      { import = "astrocommunity.editing-support.neogen" },
      { import = "astrocommunity.git.octo-nvim" },
      { import = "astrocommunity.git.blame-nvim" },
      { import = "astrocommunity.utility.telescope-fzy-native-nvim" },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
        -- config variable is the default configuration table for the setup function call
        local null_ls = require "null-ls"

        -- Check supported formatters and linters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        config.sources = {
          -- Set a formatter
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.clang_format,
        }
        return config -- return final config table
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "lua", "python", "c", "cpp", "rust", "go", "svelte", "typescript", "javascript", "cmake" },
      },
    },
    -- use mason-lspconfig to configure LSP installations
    {
      "williamboman/mason-lspconfig.nvim",
      -- overrides `require("mason-lspconfig").setup(...)`
      opts = {
        ensure_installed = {
          "bashls",
          "clangd",
          "cmake",
          "dockerls",
          "golangci_lint_ls",
          "gopls",
          "jsonls",
          "lua_ls",
          "pylsp",
          "rust_analyzer",
          "svelte",
          "tssserver",
          "yamlls",
          "cssls",
        },
      },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    {
      "jay-babu/mason-null-ls.nvim",
      -- overrides `require("mason-null-ls").setup(...)`
      opts = {
        ensure_installed = {
          "prettier",
          "stylua",
          "clang_format",
          "cmakelang",
          "hadolint",
          "golangci_lint",
          "golines",
          "goimports",
          "jq",
          "shfmt",
        },
      },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      -- overrides `require("mason-nvim-dap").setup(...)`
      opts = {
        -- ensure_installed = { "python" },
      },
    },
    {
      "rcarriga/nvim-notify",
      enabled = false,
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = false,
    },
    {
      "phaazon/hop.nvim",
      branch = "v2",
      config = function() require("hop").setup {} end,
      lazy = false,
      opts = {},
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function() end,
}

return config
