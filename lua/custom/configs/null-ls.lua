local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.cbfmt,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.diagnostics.chktex,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.mdformat,
    null_ls.builtins.formatting.taplo,
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.diagnostics.commitlint,
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.formatting.xmlformat,
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
