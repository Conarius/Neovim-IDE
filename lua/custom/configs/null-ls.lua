local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    --python stuff
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.black,
    --cpp stuff
    null_ls.builtins.formatting.clang_format,
    --lua stuff
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.selene,
    --go stuff
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    --js/ts stuff
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettierd,
    --yaml stuff
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.yamlfmt,
    --latex stuff
    null_ls.builtins.diagnostics.chktex,
    --markdown stuff
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.mdformat,
    null_ls.builtins.formatting.cbfmt,
    --toml stuff
    null_ls.builtins.formatting.taplo,
    --jspn stuff
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.formatting.fixjson,
    --git/github stuff
    null_ls.builtins.diagnostics.commitlint,
    null_ls.builtins.diagnostics.actionlint,
    --xml stuff
    null_ls.builtins.formatting.xmlformat,
    --php stuff
    null_ls.builtins.diagnostics.phpstan,
    null_ls.builtins.formatting.pint,
    null_ls.builtins.formatting.blade_formatter,
    --tailwindcss stuff
    null_ls.builtins.formatting.rustywind,
    --editorconfig checker
    null_ls.builtins.diagnostics.editorconfig_checker,
    --cmake
    null_ls.builtins.diagnostics.cmake_lint,
    null_ls.builtins.formatting.gersemi,
    --make stuff
    null_ls.builtins.diagnostics.checkmake,
    --ruby stuff
    null_ls.builtins.diagnostics.standardrb,
    null_ls.builtins.formatting.standardrb,
    --hover stuff
    null_ls.builtins.hover.dictionary,
    null_ls.builtins.hover.printenv,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
return opts
