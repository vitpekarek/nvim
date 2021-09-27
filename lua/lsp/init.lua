local on_attach = require('lsp.on_attach')
local efm_config = require('lsp.efm')
local lua_config = require('lsp.lua');
local tsserver_config = require('lsp.tsserver');

vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })


local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = (function()
                local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                table.sort(res)
                return res
            end)()
        }
    }
}

capabilities.textDocument.completion.completionItem.snippetSupport = true;

local servers = { "rust_analyzer" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

nvim_lsp.efm.setup(efm_config)
nvim_lsp.sumneko_lua.setup(lua_config)
nvim_lsp.tsserver.setup(tsserver_config)

-- LSP Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = false
    })

-- Send diagnostics to quickfix list
-- do
--     local method = "textDocument/publishDiagnostics"
--     local default_handler = vim.lsp.handlers[method]
--     vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr,
--                                         config)
--         default_handler(err, method, result, client_id, bufnr, config)
--         local diagnostics = vim.lsp.diagnostic.get_all()
--         local qflist = {}
--         for bufnr, diagnostic in pairs(diagnostics) do
--             for _, d in ipairs(diagnostic) do
--                 d.bufnr = bufnr
--                 d.lnum = d.range.start.line + 1
--                 d.col = d.range.start.character + 1
--                 d.text = d.message
--                 table.insert(qflist, d)
--             end
--         end
--         vim.lsp.util.set_qflist(qflist)
--     end
-- end
