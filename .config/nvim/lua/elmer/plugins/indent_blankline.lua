vim.opt.list = true
vim.opt.listchars:append("nbsp:☠")
vim.opt.listchars:append("space: ")
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("tab:»⋅")
vim.opt.listchars:append("extends:…")
vim.opt.listchars:append("precedes:…")
vim.opt.listchars:append("conceal:┊")

require("indent_blankline").setup({
	buftype_exclude = { "terminal" },
	filetype_exclude = { "NvimTree", "packer" },
	show_current_context = false,
	show_current_context_start = true,
})
