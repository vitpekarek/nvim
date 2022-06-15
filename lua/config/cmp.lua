require("luasnip").filetype_extend("ruby", { "rails" })

require("luasnip/loaders/from_vscode").lazy_load()

local cmp = require("cmp")
-- local compare = require("cmp.config.compare")
local mapping = require("cmp.config.mapping")
local types = require("cmp.types")
local luasnip = require("luasnip")

local WIDE_HEIGHT = 40

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    -- mapping = {

    -- 	["<Tab>"] = cmp.mapping(function(fallback)
    -- 		if cmp.visible() then
    -- 			cmp.select_next_item()
    -- 		elseif luasnip.expand_or_jumpable() then
    -- 			luasnip.expand_or_jump()
    -- 		elseif has_words_before() then
    -- 			cmp.complete()
    -- 		else
    -- 			fallback()
    -- 		end
    -- 	end, { "i", "s" }),

    -- 	["<S-Tab>"] = cmp.mapping(function(fallback)
    -- 		if cmp.visible() then
    -- 			cmp.select_prev_item()
    -- 		elseif luasnip.jumpable(-1) then
    -- 			luasnip.jump(-1)
    -- 		else
    -- 			fallback()
    -- 		end
    -- 	end, { "i", "s" }),

    -- 	["<C-n>"] = mapping(mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }), { "i", "c" }),
    -- 	["<C-p>"] = mapping(mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }), { "i", "c" }),
    -- 	["<C-y>"] = mapping.confirm({ select = false }),
    -- 	["<C-e>"] = mapping.abort(),
    -- },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(_, vim_item)
            vim_item.kind = require('lsp').icons[vim_item.kind]
            return vim_item
        end,
    },

    -- experimental = {
    -- 	native_menu = false,
    -- 	ghost_text = true,
    -- },

    -- sources = {
    -- 	{ name = "nvim_lsp" },
    -- 	{ name = "path" },
    -- 	{ name = "luasnip" },
    -- 	{ name = "emoji" },
    -- 	{ name = "buffer", keyword_length = 5, max_item_count = 10 },
    -- },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline("/", {
--     sources = {
--         { name = "buffer" },
--     },
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
--     sources = cmp.config.sources({
--         { name = "path" },
--     }, {
--         { name = "cmdline" },
--     }),
-- }) -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
