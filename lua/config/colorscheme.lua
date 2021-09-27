local utils = require('utils')
local cmd = vim.cmd
utils.opt('o', 'termguicolors', true)

-- cmd 'colorscheme gruvbox-material'
-- cmd 'highlight IndentBlanklineContextChar guifg=#888888 gui=nocombine'

-- vim.g.tokyodark_transparent_background = true 
-- vim.g.tokyodark_enable_italic_comment = true
-- vim.g.tokyodark_enable_italic = true
-- vim.g.tokyodark_color_gamma = "1.0"

-- vim.g.tokyonight_transparent = true 
cmd 'colorscheme tokyonight'
