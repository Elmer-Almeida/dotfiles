require("nvim-treesitter.configs").setup({
	ensure_installed = { "html", "javascript", "typescript", "tsx", "lua", "yaml", "c", "cpp", "css", "json", "hcl", "rust" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			-- Set to false if you have an `updatetime` of ~100.
			clear_on_cursor_move = true,
			highlight_current_scope = {
				enable = true,
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_next_usage = "<C-n>",
				goto_previous_usage = "<C-p>",
			},
		},
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gr"
      }
    }
	},
})
