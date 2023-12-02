require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

local kmap = vim.keymap.set

kmap({ "n", "v", "i" }, "<F5>", function()
  require("knap").process_once()
end)
kmap({ "n", "v", "i" }, "<F6>", function()
  require("knap").close_viewer()
end)
kmap({ "n", "v", "i" }, "<F7>", function()
  require("knap").toggle_autoprieviewing()
end)
kmap({ "n", "v", "i" }, "<F8>", function()
  require("knap").forward_jump()
end)
