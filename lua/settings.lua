local utils = require('utils')

local cmd = vim.cmd
local indent = 4

-- Map leader to space
-- vim.g.mapleader = ' '

cmd 'syntax enable'
cmd 'filetype plugin indent on'
-- cmd 'set guicursor=""' -- To use windows terminal's cursor
-- TODO: rework
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4)
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'fileignorecase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', false)
-- utils.opt('b', 'noshowmode', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')
-- vim.o.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"
-- utils.opt('o', 'guifont', 'FiraCode Nerd Font')

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
cmd 'set noshowmode'

-- Terminal title
-- cmd 'set title'
-- cmd [[set titlestring=%{hostname()}\ \ %F\ \ %{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}]]

