require("toggleterm").setup({
  size = 20,
  open_mapping = [[<C-t>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = "1",
  start_in_insert = true,
  persist_size = true,
  direction = "float",
  float_opts = {
    border = 'curved',
    winblend = 0,
  }
})
