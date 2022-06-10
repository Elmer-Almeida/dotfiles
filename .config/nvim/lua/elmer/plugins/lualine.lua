-- Display an indicator of tag generation progress
local function gutenTagsProgress()
  return vim.fn["gutentags#statusline"]("[", "]")
end

-- For mode, only show the first char (or first two chars to distinguish
-- different VISUALs) plus a fancy icon
local function simplifiedMode(str)
  return "  " .. (str == "V-LINE" and "VL" or (str == "V-BLOCK" and "VB" or str:sub(1, 1)))
end

-- For location, show total lines
local function customLocation(str)
  return string.gsub(str, "%w+", "%1" .. "/%%L", 1)
end

-- For progress, add a fancy icon
local function customProgress(str)
  return " " .. str
end

-- For filename, show the filename and the filesize
local function fileNameAndSize(str)
  -- For doc, only show filename
  if string.find(str, ".*/doc/.*%.txt") then
    str = vim.fn.expand("%:t")
  end
  local size = require("lualine.components.filesize")()
  return size == "" and str or str .. " [" .. size .. "]"
end

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "onedark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    -- Left
    lualine_a = {
      {
        "mode",
      },
    },
    lualine_b = {
      { "branch", icon = "", },
      { "diff", symbols = { added = " ", modified = " ", removed = " " }, },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
    },
    lualine_c = {
      {
        "filename",
        path = 3,
        symbols = {
          modified = "[+]",
          readonly = "[]",
          unnamed = "[No Name]",
        },
        fmt = fileNameAndSize,
      },
    },

    -- Right
    lualine_x = {
      "windows",
      gutenTagsProgress,
      {
        function()
          local msg = "No Active LSP"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = " LSP:",
        color = { fg = "#97cc7f", gui = "bold" },
      },
      { "filetype", color = { fg = "#51afef", gui = "bold" } },
      { "encoding", color = { fg = "#ec5f67" } },
      { "fileformat", color = { fg = "#c678dd" } }
    },
    lualine_y = {
      { "location", fmt = customLocation, },
    },
    lualine_z = {
      { "progress", fmt = customProgress, },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {
      {
        "location",
        fmt = customLocation,
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {
    "aerial",
    "fugitive",
    "nvim-tree",
    "neo-tree",
    "quickfix",
    "toggleterm",
  },
})
