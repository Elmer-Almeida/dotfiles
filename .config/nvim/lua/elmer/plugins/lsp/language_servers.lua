local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = { capabilities = capabilities }
  if server.name == "sumneko_lua" then
    opts = vim.tbl_deep_extend("force", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }, opts)
  end
  server:setup(opts)
end)

-- local lspconfig = require("lspconfig")
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- local util = require("lspconfig.util")
-- local configs = require("lspconfig.configs")
-- local nvim_command = vim.api.nvim_command

-- local language_servers = {
--   "tailwindcss",
--   "html",
--   "cssls",
--   "tsserver",
--   "pyright",
--   "yamlls",
--   "terraformls",
--   "cssmodules_ls",
--   "clangd",
--   "sumneko_lua",
--   "rust_analyzer",
-- }

-- for _, server in ipairs(language_servers) do
--   lspconfig[server].setup({
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--       -- if client.resolved_capabilities.document_formatting then
--       if client.server_capabilities.documentFormattingProvider then
--         nvim_command [[augroup Format]]
--         nvim_command [[autocmd! * <buffer>]]
--         nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
--         nvim_command [[augroup END]]
--       end
--       require("aerial").on_attach(client, bufnr)
--     end,
--   })
-- end

-- -- setup ls_emmet LSP
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- if not configs.ls_emmet then
--   configs.ls_emmet = {
--     default_config = {
--       cmd = { "ls_emmet", "--stdio" },
--       filetypes = {
--         "html",
--         "css",
--         "scss",
--         "javascript",
--         "javascriptreact",
--         "typescript",
--         "typescriptreact",
--         "haml",
--         "xml",
--         "xsl",
--         "pug",
--         "slim",
--         "sass",
--         "stylus",
--         "less",
--         "sss",
--         "hbs",
--         "handlebars",
--       },
--       root_dir = function(fname)
--         return vim.loop.cwd()
--       end,
--       settings = {},
--     },
--   }
-- end

-- -- initialize and configure (maybe) rust_tools
-- require("rust-tools").setup({})
