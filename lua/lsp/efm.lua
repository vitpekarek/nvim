local eslint_d = {
--   lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
--   lintIgnoreExitCode = true,
--   lintStdin = true,
--   lintFormats = {"%f:%l:%c: %m"},
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local prettier  = {
  -- formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath ${INPUT}",
  formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
  formatStdin = true
}

local languages = {
  --lua = {luafmt},
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

-- local eslint = {
--   lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
--   lintStdin = true,
--   lintFormats = {"%f:%l:%c: %m"},
--   lintIgnoreExitCode = true,
--   formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--   formatStdin = true
-- }

require "lspconfig".efm.setup {
    -- on_attach = function(client)
    --     client.resolved_capabilities.document_formatting = true
    --     client.resolved_capabilities.goto_definition = false
    --     set_lsp_config(client)
    -- end,
    init_options = {documentFormatting = true},
    filetypes = { "python", "javascriptreact", "javascript", "javascript.jsx", "typescriptreact", "typescript", "typescript.tsx", "json" },
    --root_dir = root_pattern(".git"),
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        rootMarkers = { "package.json", ".git" },
        lintDebounce = 500,
        languages = languages
    },
}
