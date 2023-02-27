if vim.g.vscode then return end
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettier, formatting.black, formatting.shfmt, formatting.clang_format,
    formatting.cmake_format, formatting.isort, formatting.gofumpt, formatting.goimports,
    formatting.golines, formatting.rustfmt, formatting.lua_format.with({
      extra_args = {
        "--no-keep-simple-function-one-line", "--no-break-after-operator", "--column-limit=100",
        "--break-after-table-lb", "--indent-width=2"
      }
    })
  }
})
-- Tools can be installed from `Mason` otherwise `apt`
-- sudo apt install cmake_format

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)
