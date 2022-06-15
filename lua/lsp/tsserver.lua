local nvim_lsp = require('lspconfig')

-- npm install -g typescript typescript-language-server
local M = {}

-- M.setup = function(opts)
--     -- nvim_lsp['tsserver'].setup({
--     --     on_attach = function(client, bufnr)
--     --         client.server_capabilities.document_formatting = false
--     --         on_attach(client, bufnr)
--     --     end,
--     --     flags = {
--     --         debounce_text_changes = 150,
--     --     },
--     --     capabilities = capabilities,
--     -- })
--     opts.on_attach = function (client, bufnr)
--         client.resolved_capabilities.document_formatting = false
--         opts.on_attach(client, bufnr)
--     end
-- end

M.update_opts = function(opts)
    opts.flags = {
        debounce_text_changes = 150,
    }
end

return M
