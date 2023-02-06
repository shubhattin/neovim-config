vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever, x is visual mode
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copying to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["*y]])
vim.keymap.set("n", "<leader>Y", [["*Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

if not vim.g.vscode then -- not in vscode
  vim.keymap.set("i", "<C-c>", "<Esc>") -- we can use this to escape from visual block mode after typing
end

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Use this command to replace the word under the cursor with the word in the register

-- vim.keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<CR>", {silent = true})
-- use this to make the current file executable

-- vim.keymap.set("n", "Q", "<nop>") -- removing the Q command

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- This is for wsl only
if os.getenv("WSL_DISTRO_NAME") == "Ubuntu" then
  vim.cmd [[
        let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
    ]]
end
