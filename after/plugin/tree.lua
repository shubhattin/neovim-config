if vim.g.vscode then
	return
end
local builtin = require("nvim-tree")
builtin.setup()
vim.keymap.set("n", "<leader>tv", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)

vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeToggle)
