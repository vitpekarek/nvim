local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd,
}

local M = {
    setup = function(on_attach, capabilities)
        require('null-ls').setup({
            sources = sources,
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
}

return M
