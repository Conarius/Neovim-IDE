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
    "folke/neoconf.nvim",
    lazy = false,
    config = function()
      require("neoconf").setup {}
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
      local opts = require "plugins.configs.treesitter"
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
        "ruby",
        "regex",
        "vim",
        "dockerfile",
        "java",
      }
      return opts
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
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
        --docker stuff
        "hadolint",
        "dockerfile-language-server",
        --java stuff
        "jdtls",
        "java-test",
        "java-debug-adapter",
        "checkstyle",
        "google-java-format",
        --typst stuff
        "typst-lsp",
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
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
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
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    opts = function()
      return {
        -- How to find the root dir for a given filename. The default comes from
        -- lspconfig which provides a function specifically for java projects.
        root_dir = require("lspconfig.server_configurations.jdtls").default_config.root_dir,

        -- How to find the project name for a given root dir.
        project_name = function(root_dir)
          return root_dir and vim.fs.basename(root_dir)
        end,

        -- Where are the config and workspace dirs for a project?
        jdtls_config_dir = function(project_name)
          return vim.fn.stdpath "cache" .. "/jdtls/" .. project_name .. "/config"
        end,
        jdtls_workspace_dir = function(project_name)
          return vim.fn.stdpath "cache" .. "/jdtls/" .. project_name .. "/workspace"
        end,

        -- How to run jdtls. This can be overridden to a full java command-line
        -- if the Python wrapper script doesn't suffice.
        cmd = { vim.fn.exepath "jdtls" },
        full_cmd = function(opts)
          local fname = vim.api.nvim_buf_get_name(0)
          local root_dir = opts.root_dir(fname)
          local project_name = opts.project_name(root_dir)
          local cmd = vim.deepcopy(opts.cmd)
          if project_name then
            vim.list_extend(cmd, {
              "-configuration",
              opts.jdtls_config_dir(project_name),
              "-data",
              opts.jdtls_workspace_dir(project_name),
            })
          end
          return cmd
        end,

        -- These depend on nvim-dap, but can additionally be disabled by setting false here.
        dap = { hotcodereplace = "auto", config_overrides = {} },
        test = true,
      }
    end,
    config = function()
      local util = require "core.util"
      local opts = util.opts "nvim-jdtls" or {}

      -- Find the extra bundles that should be passed on the jdtls command-line
      -- if nvim-dap is enabled with java debug/test.
      local mason_registry = require "mason-registry"
      local bundles = {} ---@type string[]
      local java_dbg_pkg = mason_registry.get_package "java-debug-adapter"
      local java_dbg_path = java_dbg_pkg:get_install_path()
      local jar_patterns = {
        java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
      }
      -- java-test also depends on java-debug-adapter.
      if opts.test and mason_registry.is_installed "java-test" then
        local java_test_pkg = mason_registry.get_package "java-test"
        local java_test_path = java_test_pkg:get_install_path()
        vim.list_extend(jar_patterns, {
          java_test_path .. "/extension/server/*.jar",
        })
      end
      for _, jar_pattern in ipairs(jar_patterns) do
        for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
          table.insert(bundles, bundle)
        end
      end

      local function attach_jdtls()
        local fname = vim.api.nvim_buf_get_name(0)

        -- Configuration can be augmented and overridden by opts.jdtls
        local config = {
          cmd = opts.full_cmd(opts),
          root_dir = opts.root_dir(fname),
          init_options = {
            bundles = bundles,
          },
          -- enable CMP capabilities
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }

        -- Existing server will be reused if the root_dir matches.
        require("jdtls").start_or_attach(config)
        -- not need to require("jdtls.setup").add_commands(), start automatically adds commands
      end

      -- Attach the jdtls for each java buffer. HOWEVER, this plugin loads
      -- depending on filetype, so this autocmd doesn't run for the first file.
      -- For that, we call directly below.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java" },
        callback = attach_jdtls,
      })

      -- Setup keymap and dap after the lsp is fully attached.
      -- https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration
      -- https://neovim.io/doc/user/lsp.html#LspAttach

      -- custom init for Java debugger
      require("jdtls").setup_dap(opts.dap)
      require("jdtls.dap").setup_dap_main_class_configs()

      -- Java Test require Java debugger to work

      -- User can set additional keymaps in opts.on_attach

      -- Avoid race condition by calling attach the first time, since the autocmd won't fire.
      attach_jdtls()
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
    lazy = false,
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
      "rcasia/neotest-java",
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
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPre",
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
  {
    "Civitasv/cmake-tools.nvim",
    opts = {},
    ft = { "cmake" },
    event = "BufReadPost",
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "mrded/nvim-lsp-notify",
    dependencies = { "rcarriga/nvim-notify" },
    config = function()
      require("lsp-notify").setup {
        notify = require "notify",
      }
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      require("drop").setup {
        theme = "snow",
        filetypes = { "alpha" },
      }
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
  },
}

return plugins
