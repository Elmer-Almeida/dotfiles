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
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',
    winblend = 3,
  }
})
