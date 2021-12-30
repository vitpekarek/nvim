require("luasnip").filetype_extend("ruby", { "rails" })

require("luasnip/loaders/from_vscode").lazy_load()

local cmp = require("cmp")
local compare = require("cmp.config.compare")
local mapping = require("cmp.config.mapping")
local types = require("cmp.types")
local luasnip = require("luasnip")

local WIDE_HEIGHT = 40

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	-- enabled = function()
	--   return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
	-- end,
	-- completion = {
	--   autocomplete = {
	--     types.cmp.TriggerEvent.TextChanged,
	--   },
	--   completeopt = 'menu,menuone,noselect',
	--   keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
	--   keyword_length = 2,
	--   get_trigger_characters = function(trigger_characters)
	--     return trigger_characters
	--   end,
	-- },

	snippet = {
		expand = function()
			luasnip.lsp_expand(args.body)
		end,
	},

	-- preselect = types.cmp.PreselectMode.Item,

	documentation = {
		border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
		winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
		maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
		maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
	},

	-- confirmation = {
	--   default_behavior = types.cmp.ConfirmBehavior.Insert,
	--   get_commit_characters = function(commit_characters)
	--     return commit_characters
	--   end,
	-- },

	-- sorting = {
	--   priority_weight = 2,
	--   comparators = {
	--     compare.offset,
	--     compare.exact,
	--     compare.score,
	--     compare.recently_used,
	--     compare.kind,
	--     compare.sort_text,
	--     compare.length,
	--     compare.order,
	--   },
	-- },

	-- event = {},

	mapping = {

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-n>"] = mapping(mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }), { "i", "c" }),
		["<C-p>"] = mapping(mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }), { "i", "c" }),
		["<C-y>"] = mapping.confirm({ select = false }),
		["<C-e>"] = mapping.abort(),
	},

	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(_, vim_item)
            vim_item.kind = require('lsp').icons[vim_item.kind]
			return vim_item
		end,
	},

	experimental = {
		native_menu = false,
		ghost_text = true,
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "emoji" },
		{ name = "buffer", keyword_length = 5, max_item_count = 10 },
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
