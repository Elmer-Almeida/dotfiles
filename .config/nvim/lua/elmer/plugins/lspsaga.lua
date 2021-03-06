local lspsaga = require("lspsaga")

lspsaga.setup({
  debug = false,
  use_saga_diagnostic_sign = true,
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  border_style = "round",
  diagnostic_header_icon = "   ",
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  --border_style = "single",
  rename_prompt_prefix = "➤",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
})

--- In lsp attach function
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--map(0, "n", "<leader>r", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })
keymap("n", "ca", "<cmd>Lspsaga code_action<cr>", opts)
keymap("x", "ca", ":<c-u>Lspsaga range_code_action<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
keymap("n", "gS", "<cmd>Lspsaga signature_help<cr>", opts)
keymap("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
keymap("n", "gJ", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", "gK", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", opts)
keymap("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", opts)
