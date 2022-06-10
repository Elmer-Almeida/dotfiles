local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")

require("telescope").setup({
  defaults = {
    shorten_path = true,
    layout_config = {
      width = 0.75,
      prompt_position = "bottom",
      preview_cutoff = 0,
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    find_command = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { 'node_modules', 'vendor', "undodir", "lua-language-server", ".DS_Store" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center,
        ["<C-\\>"] = layout.toggle_preview,
      },
      n = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      prompt_title = 'All Files',
      find_command = { 'rg', '--files', '--no-ignore', '--hidden' },
    },
    git_files = {
      prompt_title = 'Git Files',
    },
    current_buffer_fuzzy_find = {
      prompt_title = 'Current Buffer',
      sorting_strategy = 'descending'
    },
    oldfiles = {
      sort_lastused = true,
      prompt_title = "Recently Opened",
    },
    buffers = {
      sort_lastused = true,
      prompt_title = "Buffers Open",
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  }
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>ff", '<cmd>lua require "elmer.plugins.telescope-config".project_files()<CR>', opts)
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
