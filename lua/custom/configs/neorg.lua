local opts = {
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
    ["core.integrations.telescope"] = {},
  },
}

return opts
