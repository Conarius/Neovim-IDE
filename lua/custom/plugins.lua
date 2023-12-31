local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings "dap"
      require "custom.configs.dap"
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
        "delve",
        "debugpy",
        "js-debug-adapter",
        "php-debug-adapter",
      },
    },
    config = function(_, opts)
      require("mason-nvim-dap").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },
  {
    "suketa/nvim-dap-ruby",
    ft = "ruby",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      require("dap-ruby").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "rust",
        "python",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "c",
        "cpp",
        "typescript",
        "javascript",
        "tsx",
        "css",
        "yaml",
        "json",
        "json5",
        "jsonc",
        "toml",
        "xml",
        "markdown",
        "markdown_inline",
        "latex",
        "bibtex",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "php",
        "phpdoc",
        "svelte",
        "make",
        "meson",
        "cmake",
        "ruby",
        "regex",
        "vim",
      }
      return opts
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_initialized["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "ThePrimeagen/vim-be-good",
    event = "VeryLazy",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        --rust stuff
        "rust-analyzer",
        --python stuff
        "pyright",
        "mypy",
        "ruff",
        "black",
        "debugpy",
        --c/cpp stuff
        "clangd",
        "clang-format",
        "codelldb",
        --lua stuff
        "lua-language-server",
        "stylua",
        "selene",
        --go stuff
        "gopls",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "delve",
        --js/ts stuff
        "typescript-language-server",
        "prettierd",
        "js-debug-adapter",
        "eslint-lsp",
        --yaml stuff
        "yaml-language-server",
        "yamllint",
        "yamlfmt",
        --json stuff
        "json-lsp",
        "jsonlint",
        "fixjson",
        --toml stuff
        "taplo",
        --markdown stuff
        "marksman",
        "markdownlint",
        "mdformat",
        "cbfmt",
        --latex stuff
        "texlab",
        "latexindent",
        --git/github stuff
        "commitlint",
        "actionlint",
        "gh",
        "gitleaks",
        --xml stuff
        "lemminx",
        "xmlformatter",
        --powershell
        "powershell-editor-services",
        --asm stuff
        "asm-lsp",
        --php stuff
        "intelephense",
        "php-debug-adapter",
        "phpstan",
        "pint",
        "blade-formatter",
        --tailwind stuff
        "tailwindcss-language-server",
        "rustywind",
        --editorconfig stuff
        "editorconfig-checker",
        --svelte
        "svelte-language-server",
        --autotools/make
        "autotools-language-server",
        --cmake
        "neocmakelsp",
        "gersemi",
        "cmakelint",
        --meson
        "swift-mesonlsp",
        --ruby stuff
        "ruby-lsp",
        "standardrb",
        "erb-lint",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custim.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-notify",
      "MunifTanjim/nui.nvim",
    },
    opts = function()
      return require "custom.configs.noice"
    end,
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    opts = function()
      return require "custom.configs.neorg"
    end,
    config = function(_, opts)
      require("neorg").setup(opts)
    end,
  },
  {
    "brneor/gitui.nvim",
    event = "VeryLazy",
  },
  {
    "pwntester/octo.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-plenary",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-python",
      "vim-test/vim-test",
      "nvim-neotest/neotest-vim-test",
      "alfaix/neotest-gtest",
      "olimorris/neotest-phpunit",
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
    },
    opts = function()
      return require "custom.configs.neotest"
    end,

    config = function(_, opts)
      require("neotest").setup(opts)
    end,
  },
  {
    "b0o/schemastore.nvim",
    event = "VeryLazy",
  },
  {
    "ellisonleao/glow.nvim",
    event = "VeryLazy",
    config = true,
    cmd = "Glow",
  },
  {
    "frabjous/knap",
    ft = { "latex", "tex" },
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = function()
      require("core.utils").load_mappings "trouble"
    end,
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
  },
  {
    "chrisgrieser/nvim-origami",
    event = "BufReadPost",
    opts = true,
  },
  {
    "stevearc/overseer.nvim",
    lazy = "false",
    opts = {},
    config = function()
      require("overseer").setup {
        dap = true,
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {}
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    event = "VeryLazy",
    config = function()
      require("codewindow").setup()
      require("codewindow").apply_default_keybinds()
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {},
  },
  {
    "antonk52/bad-practices.nvim",
    lazy = false,
  },
  {
    "richardbizik/nvim-toc",
    event = "VeryLazy",
    config = function()
      require("nvim-toc").setup {}
    end,
  },
  {
    "jbyuki/instant.nvim",
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    dependencies = { "nvim-cmp" },
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
}

return plugins
