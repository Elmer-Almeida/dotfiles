require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"cmake",
		"css",
		"comment",
		"go",
		"html",
		"java",
		"javascript",
		"json",
		"jsonc",
		"lua",
		"markdown",
		"make",
		"python",
		"query",
		"rust",
		"regex",
		"tsx",
		"typescript",
		"vim",
		"dockerfile",
		"kotlin",
		"graphql",
		"fish",
		"scss",
	},

	ignore_install = {},

	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},

	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]a"] = "@parameter.inner",
				["]c"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[a"] = "@parameter.inner",
				["[c"] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},
	},
	context_commentstring = {
		enable = true,
	},
	playground = {
		enable = true,
	},
})
