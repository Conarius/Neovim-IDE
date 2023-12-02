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
  },
}

return opts
