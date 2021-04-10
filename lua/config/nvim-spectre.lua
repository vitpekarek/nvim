vim.cmd('nnoremap <leader>S :lua require(\'spectre\').open()<CR>')
-- search current word
vim.cmd('nnoremap <leader>sw viw:lua require(\'spectre\').open_visual()<CR>')
vim.cmd('vnoremap <leader>s :lua require(\'spectre\').open_visual()<CR>')
-- search in current file
vim.cmd('nnoremap <leader>sp viw:lua require(\'spectre\').open_file_search()<cr>')


require('spectre').setup()
