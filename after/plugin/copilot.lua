if vim.g.vscode then return end

vim.keymap.set('n', '<leader>ge', function()
  vim.cmd [[Copilot enable]]
  print("Enabled Copilot")
end, {}) -- enable copilot

vim.keymap.set('n', '<leader>gd', function()
  vim.cmd [[Copilot disable]]
  print("Disabled Copilot")
end, {}) -- disable copilot
