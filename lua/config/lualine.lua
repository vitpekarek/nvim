require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = {' ', ' '},
    section_separators = {'', ''},
    disabled_filetypes = {'neo-tree', 'dashboard', 'packer'}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  -- {'diagnostics', sources={'nvim_lsp'}}},
                    {'diagnostics', sources = {'nvim_diagnostic'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
