-- local utils = require('utils')

-- general
vim.keymap.set('n', '<C-s>', ':w<CR>', {noremap = true, silent = true})

-- no hl
vim.keymap.set('n', '<space>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
vim.keymap.set('n', '<space>e', ':Neotree reveal<CR>', {noremap = true, silent = true})

-- better window movement
vim.keymap.set('n', '<C-h>', '<C-w>h', {silent = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {silent = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {silent = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {silent = true})

-- better indenting
vim.keymap.set('v', '<', '<gv', {noremap = true, silent = true})
vim.keymap.set('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
vim.keymap.set('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.keymap.set('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.keymap.set('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
vim.keymap.set('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
