local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require("lspconfig.util")
local configs = require("lspconfig.configs")

local language_servers = {
	"tailwindcss",
	"html",
	"cssls",
	"tsserver",
	"pyright",
	"yamlls",
	"terraformls",
	"ccls",
}

for _, server in ipairs(language_servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
		end,
	})
end

-- setup lua LSP
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
	end,
	settings = {
		Lsasdfasdfasdfqqqqqud = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- setup ls_emmet LSP
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
	configs.ls_emmet = {
		default_config = {
			cmd = { "ls_emmet", "--stdio" },
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"haml",
				"xml",
				"xsl",
				"pug",
				"slim",
				"sass",
				"stylus",
				"less",
				"sss",
				"hbs",
				"handlebars",
			},
			root_dir = function(fname)
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end

lspconfig.ls_emmet.setup({ capabilities = capabilities })

-- setup clang LSP
lspconfig.ccls.setup({
	init_options = {
		compilationDatabaseDirectory = "build",
		index = {
			threads = 0,
		},
		clang = {
			excludeArgs = { "-frounding-math" },
		},
	},
	cmd = {
		"ccls",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	offset_encoding = "utf-32",
	single_file_support = false,
})

-- setup rust LSP
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
	end,
	cmd = {
		"rust-analyzer",
	},
	filetypes = {
		"rust",
	},
	root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "self",
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

require("rust-tools").setup({})
