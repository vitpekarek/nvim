vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_filetype_exclude = {'help', 'dashboard'}


require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- TODO seems to be broken
    ignore_install = {"haskell"},
    highlight = {
        enable = true -- false will disable the whole extension
    },
    indent = {enable = true},
    playground = {
        enable = false,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    refactor = {
        -- highlight_definitions = { enable = true },
        -- highlight_current_scope = { enable = false }
    },
    autotag = {enable = true},
    -- rainbow = {enable = true, extended_mode = false},
    context_commentstring = {
        enable = true,
        -- config = {
        --     javascript = {
        --         __default = '// %s',
        --         jsx_element = '{/* %s */}',
        --         jsx_fragment = '{/* %s */}',
        --         jsx_attribute = '// %s',
        --         comment = '// %s'
        --     }
        -- }
        -- config = {
        --     javascriptreact = {style_element = '{/*%s*/}'},
        --     typescriptreact = {style_element = '{/*%s*/}'}
        -- }
    }
    -- refactor = {highlight_definitions = {enable = true}}
}
