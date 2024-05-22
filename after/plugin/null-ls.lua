if vim.g.vscode then
	return
end
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.black,
		formatting.shfmt,
		formatting.clang_format,
		formatting.cmake_format,
		formatting.isort,
		formatting.gofumpt,
		formatting.goimports,
		formatting.golines,
		formatting.rustfmt,
		formatting.stylua,
	},
})
-- Tools can be installed from `Mason` otherwise `apt`
-- sudo apt install cmake_format shfmt cmake

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

--[[
Currently using via Mason

◍ ast-grep ast_grep, ast_grep
◍ astro-language-server astro, astro
◍ bash-language-server bashls, bashls
◍ black
◍ clang-format
◍ clangd
◍ css-lsp cssls, cssls
◍ docker-compose-language-service docker_compose_language_service, docker_compose_language_service
◍ dockerfile-language-server dockerls, dockerls
◍ eslint-lsp eslint, eslint
◍ html-lsp html, html
◍ isort
◍ json-lsp jsonls, jsonls
◍ lua-language-server lua_ls, lua_ls
◍ markdown-oxide markdown_oxide, markdown_oxide
◍ prettier
◍ python-lsp-server pylsp, pylsp
◍ stylua
◍ svelte-language-server svelte, svelte
◍ tailwindcss-language-server tailwindcss, tailwindcss
◍ typescript-language-server tsserver, tsserver
◍ yaml-language-server yamlls, yamlls
--]]
