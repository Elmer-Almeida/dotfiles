vim.opt.list = true
vim.opt.listchars:append("nbsp:⋅")
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	show_current_context_start = true,
	buftype_exclude = { "terminal" },
	filetype_exclude = { "NvimTree", "packer" },
	show_current_context = false,
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
    "switch"
	},
})
