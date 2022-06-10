local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
  sources = {
    formatting.prettier.with({ extra_args = { "--semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    formatting.rustfmt,
    formatting.terrafmt,
    formatting.terraform_fmt,
    formatting.stylelint,
    formatting.rustywind,
  },
})

local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
