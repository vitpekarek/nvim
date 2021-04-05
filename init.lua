--In order for neovim to launch certain executables on Windows, it must append .cmd to the command name. A fix is in the works upstream, but until this is mainlined please the following somewhere in your init.vim (lua heredoc) or init.lua:
-- vim.loop.spawn = (function ()
--   local spawn = vim.loop.spawn
--   return function(path, options, on_exit)
--     local full_path = vim.fn.exepath(path)
--     return spawn(full_path, options, on_exit)
--   end
-- end)()

-- Sensible defaults
require('settings')

-- Key mappings
require('keymappings')

-- Plugins
require('plugins')

-- Another option is to groups configuration in one folder
require('config')

-- LSP
require('lsp')
