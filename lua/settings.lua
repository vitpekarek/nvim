vim.opt.cmdheight = 0

vim.opt.exrc = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.linebreak = true
vim.opt.sidescrolloff = 5
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.title = true
vim.opt.joinspaces = false
vim.opt.mouse = 'a'
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.conceallevel = 2
vim.opt.list = true
vim.opt.listchars = {
    tab = '→ ',
    nbsp = '␣',
    trail = '•',
    extends = '▶',
    precedes = '◀',
}
vim.opt.clipboard = vim.opt.clipboard + {'unnamed','unnamedplus'}

vim.opt.undofile = true
-- vim.opt.undodir=os.getenv( "HOME" ) ..'/.config/nvim/undodir'
vim.opt.scrolloff = 3
vim.opt.autoread = true
vim.opt.autowriteall = true

--vim.opt.foldmethod = 'syntax'
-- Update gutters 200 ms
vim.opt.updatetime = 200

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cindent = true
vim.opt.cinoptions = {'N-s', 'g0', 'j1', '(s', 'm1'}

-- Searching options
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.guicursor=[[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175]]
vim.opt.termguicolors = true

