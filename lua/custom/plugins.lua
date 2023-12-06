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
      },
    },
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
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
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
      dap.listeners.after.event_initialized["dapui_confug"] = function()
        dapui.open()
      end
      dap.listeners.before.event_initialized["dapui_confug"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_confug"] = function()
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
        "prettier",
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
        "markdown-toc",
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
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
              name = "[Neorg]",
            },
          },
          ["core.summary"] = {
            config = {
              strategy = "default",
            },
          },
        },
      }
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
      "nvim-neotest/neotest-plenary",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-python",
      "vim-test/vim-test",
      "nvim-neotest/neotest-vim-test",
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
}

return plugins
