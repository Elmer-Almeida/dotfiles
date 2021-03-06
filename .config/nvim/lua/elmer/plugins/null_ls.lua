local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.rustfmt,
		formatting.terrafmt,
		formatting.terraform_fmt,
		formatting.stylelint,
		formatting.rustywind,
		diagnostics.flake8,
		--diagnostics.cppcheck,
		diagnostics.codespell,
		completion.luasnip,
		-- null_ls.builtins.code_actions.gitsigns  -- using gitsigns.lua for this functionality
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.api.nvim_command([[augroup Format]])
			vim.api.nvim_command([[autocmd! * <buffer>]])
			vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
			vim.api.nvim_command([[augroup END]])
		end
	end,
})

local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
