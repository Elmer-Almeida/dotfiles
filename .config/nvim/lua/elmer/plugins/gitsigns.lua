require'gitsigns'.setup {
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> : <summary>',
}

local opts = { noremap = false, silent = true }

vim.api.nvim_set_keymap('n', '<leader>lb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
