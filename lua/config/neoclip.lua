local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<Leader>Y', ':Telescope neoclip<CR>', opts)

require('neoclip').setup({
      history = 1000,
      filter = nil,
      preview = true,
      default_register = '"',
      content_spec_column = false,
      on_paste = {
        set_reg = false,
      },
      keys = {
        i = {
          select = '<cr>',
          paste = '<c-p>',
          paste_behind = '<c-k>',
        },
        n = {
          select = '<cr>',
          paste = 'p',
          paste_behind = 'P',
        },
      },
    })

-- require('telescope').extensions.neoclip.default()
vim.cmd(":lua require('telescope').load_extension('neoclip')")
