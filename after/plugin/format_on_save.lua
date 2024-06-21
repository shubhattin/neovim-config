if vim.g.vscode then
	return
end
local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")
format_on_save.setup({
	experiments = {
		partial_update = "diff", -- or 'line-by-line'
	},
	exclude_path_patterns = {
		"/node_modules/",
		--".local/share/nvim/lazy",
	},
	formatter_by_ft = {
		css = formatters.lsp,
		c = formatters.lsp,
		cpp = formatters.lsp,
		java = formatters.lsp,
		html = formatters.lsp,
		javascript = formatters.lsp,
		json = formatters.lsp,
		lua = formatters.lsp,
		markdown = formatters.prettier,
		openscad = formatters.lsp,
		python = formatters.black,
		rust = formatters.lsp,
		scad = formatters.lsp,
		scss = formatters.lsp,
		sh = formatters.shfmt,
		terraform = formatters.lsp,
		typescript = formatters.prettierd,
		typescriptreact = formatters.prettierd,
		yaml = formatters.lsp,
	},
})
