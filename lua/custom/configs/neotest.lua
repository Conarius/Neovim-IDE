local opts = {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
      runner = "unittest",
    },
    require "neotest-plenary",
    require "neotest-vim-test" {
      ignore_file_types = { "python", "vim", "lua", "rust", "cpp", "php", "ruby" },
    },
    require "neotest-rust",
    require "neotest-gtest",
    require "neotest-phpunit",
    require "neotest-rspec" {
      rspec_cmd = function()
        return vim.tbl_flatten {
          "bundle",
          "exec",
          "rspec",
        }
      end,
      root_files = { "README.md" },
    },
    require "neotest-minitest",
  },
  consumers = {
    overseer = require "neotest.consumers.overseer",
  },
  overseer = {
    enabled = true,
    force_default = true,
  },
}

return opts
