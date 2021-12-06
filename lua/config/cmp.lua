local utils = require('utils')

 -- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
}
require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}


-- old compe

-- vim.o.completeopt = "menuone,noselect"

-- require'compe'.setup {
--     enabled = true;
--     autocomplete = true;
--     debug = false;
--     min_length = 1;
--     preselect = 'always';
--     throttle_time = 80;
--     source_timeout = 200;
--     resolve_timeout = 800;
--     incomplete_delay = 400;
--     max_abbr_width = 100;
--     max_kind_width = 100;
--     max_menu_width = 100;
--     documentation = {
--         border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
--         winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
--         max_width = 120,
--         min_width = 60,
--         max_height = math.floor(vim.o.lines * 0.3),
--         min_height = 1,
--     };


--     source = {
--         path = true;
--         buffer = true;
--         calc = true;
--         vsnip = true;
--         nvim_lsp = true;
--         nvim_lua = true;
--         spell = true;
--         tags = true;
--         snippets_nvim = true;
--         treesitter = true;
--   };
-- }

-- vim.cmd([[inoremap <silent><expr> <C-Space> compe#complete()]])
-- vim.cmd([[inoremap <silent><expr> <Tab>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]])
-- vim.cmd([[inoremap <silent><expr> <C-e>     compe#close('<C-e>')]])
-- vim.cmd([[inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })]])
-- vim.cmd([[inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })]])

