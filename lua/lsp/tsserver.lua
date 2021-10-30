local on_attach = require('lsp.on_attach')

-- npm install -g typescript typescript-language-server
return {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    }
}
