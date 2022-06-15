local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<space>of', '<cmd>lua require(\'telescope.builtin\').oldfiles()<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>ws', '<cmd>lua require(\'telescope.builtin\').lsp_workspace_symbols()<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>ds', '<cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>tq', '<cmd>Telescope quickfix<cr>', opts)
vim.api.nvim_set_keymap('n', '<space>tt', '<cmd>lua require(\'telescope.builtin\').treesitter()<cr>', opts)

require'telescope'.setup {
  defaults = {
    layout_strategy = 'vertical',
    scroll_strategy = 'cycle',
    winblend = 0,
    layout_config = {
      horizontal = {
        -- width_padding = 0.1,
        -- height_padding = 0.1,
        preview_width = 0.3,
        -- mirror = false,
      },
      vertical = {
        -- width_padding = 0.05,
        -- height_padding = 1,
        preview_height = 0.7,
        -- mirror = true,
      }
    },
    file_ignore_patterns = { 'tags', 'node_modules', 'dist', 'build' },
  }
}
