vim.cmd('nnoremap <space>S :lua require(\'spectre\').open()<CR>')
-- search current word
vim.cmd('nnoremap <space>sw viw:lua require(\'spectre\').open_visual()<CR>')
vim.cmd('vnoremap <space>s :lua require(\'spectre\').open_visual()<CR>')
-- search in current file
vim.cmd('nnoremap <space>sp viw:lua require(\'spectre\').open_file_search()<cr>')


require('spectre').setup()
