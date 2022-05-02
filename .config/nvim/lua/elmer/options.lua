local global = vim.g
local buffer = vim.bo
local window = vim.wo
local option = vim.o

vim.cmd [[ filetype plugin indent on ]]

-- prevent comments on next line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- transparent background
vim.cmd("autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE")



---------------------------------------------------
-- Global options --
---------------------------------------------------
global.mapleader = " "


---------------------------------------------------
-- Window options --
---------------------------------------------------
window.number = true
window.relativenumber = true
window.signcolumn = 'yes'
window.wrap = false
window.linebreak = true
window.cursorline = true
window.foldenable = true
window.foldmethod = 'manual'


---------------------------------------------------
-- Buffer options --
---------------------------------------------------
buffer.swapfile = false


---------------------------------------------------
-- Options --
---------------------------------------------------
option.encoding = 'UTF-8'
option.clipboard = 'unnamedplus'
option.mouse = 'a'
option.hidden = true
option.showmode = false
option.cmdheight = 1
option.showcmd = true
option.autochdir = true
option.wildmenu = true
option.showtabline = 4
option.scrolloff = 999
option.sidescrolloff = 3
option.guicursor = 'i:block'
option.updatetime = 300

-- search
option.hlsearch = false
option.incsearch = true

-- splits
option.splitright = true
option.splitbelow = true

-- case sensitivity
option.smartcase = true
option.ignorecase = true


-- theme
option.background = 'dark'
vim.opt.termguicolors = true

-- error bells
option.errorbells = false
option.visualbell = false

-- undo files
option.undodir = '/Users/elmer/.config/nvim/undodir'
option.undofile = true


---------------------------------------------------
-- Indentation --
---------------------------------------------------
-- indentation
local indent = 2

option.autoindent = true
option.smartindent = true
option.expandtab = true
option.tabstop = indent
option.shiftwidth = indent
option.softtabstop = indent

buffer.expandtab = true
buffer.autoindent = true
buffer.tabstop = indent
buffer.shiftwidth = indent
buffer.softtabstop = indent

