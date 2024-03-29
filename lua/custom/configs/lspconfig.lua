local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local json_capabilities = vim.lsp.protocol.make_client_capabilities()
json_capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  filetypes = { "cpp", "c" },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml" },
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}

lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "syntex=1", "%f" },
        executable = "latexmk",
        forwardSearchAfter = false,
        onSave = false,
      },
      chktex = {
        onEdit = false,
        onOpenandSave = false,
      },
      diagnosticDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {},
      },
      latexformatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false,
      },
    },
  },
}

lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "marksman", "server" },
  filetypes = { "markdown", "markdown.mdx" },
  root_dir = util.root_pattern(".git", ".marksman.toml"),
}

lspconfig.taplo.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "taplo", "lsp", "stdio" },
  filetypes = { "toml" },
  root_dir = util.root_pattern("*.toml", ".git"),
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = json_capabilities,
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = false,
  },
  root_dir = util.find_git_ancestor(),
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

lspconfig.lemminx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "lemminx" },
  filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
  root_dir = util.find_git_ancestor(),
}

lspconfig.powershell_es.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  bundle_path = "%USERPROFILE%\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services\\PowerShellEditorServices",
  filetypes = { "ps1" },
  shell = "pwsh",
}

lspconfig.asm_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "asm-lsp" },
  filetypes = { "asm", "vmasm" },
}

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_dir = util.root_pattern("composer.json", ".git"),
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "aspnetcorerazor",
    "astro",
    "astro-markdown",
    "blade",
    "clojure",
    "django-html",
    "htmldjango",
    "edge",
    "eelixir",
    "elixir",
    "ejs",
    "erb",
    "eruby",
    "gohtml",
    "gohtmltmpl",
    "haml",
    "handlebars",
    "hbs",
    "html",
    "html-eex",
    "heex",
    "jade",
    "leaf",
    "liquid",
    "markdown",
    "mdx",
    "mustache",
    "njk",
    "nunjucks",
    "php",
    "razor",
    "slim",
    "twig",
    "css",
    "less",
    "postcss",
    "sass",
    "scss",
    "stylus",
    "sugarss",
    "javascript",
    "javascriptreact",
    "reason",
    "rescript",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
  },
  init_options = {
    userLanguages = {
      eelixir = "html-eex",
      eruby = "erb",
    },
  },
  root_dir = util.root_pattern(
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.cjs",
    "postcss.config.mjs",
    "postcss.config.ts",
    "package.json",
    "node_modules",
    ".git"
  ),
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      validate = true,
    },
  },
}

lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "svelteserver",
    "--stdio",
  },
  filetypes = { "svelte" },
  root_dir = util.root_pattern("package.json", ".git"),
}

lspconfig.autotools_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "autotools-language-server" },
  filetypes = { "config", "automake", "make" },
  root_dir = util.root_pattern("configure.ac", "Makefile", "Makefile.am", "*.mk"),
}

lspconfig.neocmake.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "neocmakelsp", "--stdio" },
  filetypes = { "cmake" },
  root_dir = util.root_pattern(".git", "cmake"),
}

lspconfig.ruby_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ruby-lsp" },
  filetypes = "ruby",
  init_options = {
    formatter = false,
  },
  root_dir = util.root_pattern("Gemfile", ".git"),
}

lspconfig.swift_mesonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "Swift-MesonLSP", "--lsp" },
  filetypes = { "meson" },
  root_dir = util.root_pattern("meson_options.txt", ".git"),
}

lspconfig.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" },
  root_dir = util.root_pattern "Dockerfile",
}

lspconfig.typst_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "typst-lsp" },
  filetypes = { "typst" },
}
