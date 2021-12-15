local nvim_lsp = require('lspconfig')

local eslint_d = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    -- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local prettier  = {
  -- formatCommand = "node_modules/.bin/prettier --stdin --stdin-filepath ${INPUT}",
  formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
  formatStdin = true
}

local languages = {
  lua = {luafmt},
  typescript = {prettier, eslint_d},
  javascript = {prettier, eslint_d},
  typescriptreact = {prettier, eslint_d},
  ['typescript.tsx'] = {prettier, eslint_d},
  javascriptreact = {prettier, eslint_d},
  ['javascript.jsx'] = {prettier, eslint_d},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
}

return function(on_attach)

    local config = {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        init_options = { documentFormatting = true },
        filetypes = { "python", "javascriptreact", "javascript", "javascript.jsx", "typescriptreact", "typescript", "typescript.tsx", "json" },
        root_dir = function()
            return vim.fn.getcwd()
        end,
        settings = {
            rootMarkers = { "package.json", ".git" },
            lintDebounce = 500,
            languages = languages
        },
    }

    nvim_lsp.efm.setup(config)
end
