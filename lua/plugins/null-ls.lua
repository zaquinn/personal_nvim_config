return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua formatter
        null_ls.builtins.formatting.stylua,
        -- Python formatter and linter
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.flake8,
        -- JavaScript/TypeScript formatter
        null_ls.builtins.formatting.prettier,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.cmd([[
            augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })
            augroup END
          ]])
        end
      end,
    })
  end,
}
