local nvim_lsp = require('lspconfig')

-- npm install -g typescript typescript-language-server
return function(on_attach)
    local config = {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            on_attach(client, bufnr)
        end,
        flags = {
            debounce_text_changes = 150,
        }
    }

    nvim_lsp.tsserver.setup(config)

end
