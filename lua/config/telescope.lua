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
