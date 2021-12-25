local nvim_lsp = require('lspconfig')

-- npm install -g typescript typescript-language-server
local M = {}

M.setup = function(on_attach, capabilities)
    nvim_lsp['tsserver'].setup({
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            on_attach(client, bufnr)
        end,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
end

return M
