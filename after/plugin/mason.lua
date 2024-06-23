if vim.g.vscode then
  return
end
require("mason").setup()

local lsp_zero = require("lsp-zero")

require("mason-lspconfig").setup({
  ensure_installed = {
    "tsserver",
    "eslint",
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,

    -- this is the "custom handler" for `lua_ls`
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  },
})
