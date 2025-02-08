return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",             -- JavaScript, TypeScript, JSX/TSX
        "zls",               -- Zig
        "gopls",             -- Go
        "pyright",           -- Python
        "lua_ls",            -- Lua
        "emmet_language_server", -- emmet for html, css
        "black",             -- python formatter
      },
    })
  end,
}
