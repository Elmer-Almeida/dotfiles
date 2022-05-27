local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("i", "jj", "<esc>", {})
keymap("n", "<leader>w", "<cmd>w<CR>", {})
keymap("n", "<leader>q", "<cmd>q<CR>", {})
keymap("n", "<leader>s", "<cmd>source %<CR>", {})

-- move around windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- split windows
keymap("n", "<C-w>l", "<cmd>vsplit<CR>", opts)
keymap("n", "<C-w>j", "<cmd>split<CR>", opts)

-- resize windwos
keymap("n", "<C-Up>", "<cmd>resize +5<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize -5<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +5<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -5<CR>", opts)

-- switch between tabs
keymap("n", "<leader>bn", "<cmd>bnext<CR>", opts)
keymap("n", "<leader>bp", "<cmd>bprev<CR>", opts)
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", opts)

-- switch between tabs
keymap("n", "<leader>tc", "<cmd>tabnew<CR>", opts)
keymap("n", "<leader>tn", "<cmd>tabnext<CR>", opts)
keymap("n", "<leader>tp", "<cmd>tabprevious<CR>", opts)
keymap("n", "<leader>td", "<cmd>tabclose<CR>", opts)

-- undotree
keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", opts)

-- copy from cursor to the of the line
keymap("n", "Y", "yg$", opts)

-- keep cursor in same position after combining lines
keymap("n", "J", "mzJ`z", opts)

-- keep cursor middle of screen while searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
