
vim.cmd('nnoremap <leader>ff <cmd>lua require(\'telescope.builtin\').find_files()<cr>')
vim.cmd('nnoremap <leader>fg <cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
vim.cmd('nnoremap <leader>fb <cmd>lua require(\'telescope.builtin\').buffers()<cr>')
vim.cmd('nnoremap <leader>fh <cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
vim.cmd('nnoremap <leader>ws <cmd>lua require(\'telescope.builtin\').lsp_workspace_symbols()<cr>')
vim.cmd('nnoremap <leader>ds <cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<cr>')

require'telescope'.setup {
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    winblend = 0,
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
        -- mirror = false,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
        -- mirror = true,
      }
    },
    file_ignore_patterns = { 'tags' },
  }
}
