local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		diagnostics.flake8,
		-- null_ls.builtins.code_actions.gitsigns  -- using gitsigns.lua for this functionality
	},
})

local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
