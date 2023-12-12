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
  bundle_path = "%USERPROFILE\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services\\PowerShellEditorServices",
  filetypes = { "ps1" },
  shell = "pwsh",
}

lspconfig.asm_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "asm-lsp" },
  filetypes = { "asm", "vmasm" },
}
