local opts = {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
      runner = "unittest",
    },
    require "neotest-plenary",
    require "neotest-vim-test" {
      ignore_file_types = { "python", "vim", "lua", "rust" },
    },
    require "neotest-rust",
    require("neotest-gtest").setup(),
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
