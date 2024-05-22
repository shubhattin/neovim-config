if vim.g.vscode then return end

vim.keymap.set('n', '<leader>cpe', function()
  vim.cmd [[Copilot enable]]
  print("Enabled Copilot")
end, {}) -- enable copilot

vim.keymap.set('n', '<leader>cpd', function()
  vim.cmd [[Copilot disable]]
  print("Disabled Copilot")
end, {}) -- disable copilot
