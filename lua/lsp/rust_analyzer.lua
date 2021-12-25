local nvim_lsp = require('lspconfig')

local M = {}

M.setup = function(on_attach, capabilities)
    nvim_lsp['rust_analyzer'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
