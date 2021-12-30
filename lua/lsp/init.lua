local api = vim.api
local lsp = vim.lsp

local M = {}

function M.show_line_diagnostics()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = "rounded",
		source = "always", -- show source in diagnostic popup window
		prefix = " ",
	}
	vim.diagnostic.open_float(nil, opts)
end

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

	buf_set_keymap("n", "<C-p>", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<C-n>", ":lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
	-- buf_set_keymap('n', 'K', [[:lua require('lsp').show_line_diagnostics()<CR>]], opts)

	buf_set_keymap("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	buf_set_keymap("n", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

	vim.cmd([[
    autocmd CursorHold <buffer> lua require('lsp').show_line_diagnostics()
    ]])

	-- Set some key bindings conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "F", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
	end
	if client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("x", "F", "<cmd>lua vim.lsp.buf.range_formatting()<CR><ESC>", opts)
	end

	-- The blow command will highlight the current variable and its usages in the buffer.
	if client.resolved_capabilities.document_highlight then
		vim.cmd([[
            hi link LspReferenceRead Visual
            hi link LspReferenceText Visual
            hi link LspReferenceWrite Visual
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
	end

	if vim.g.logging_level == "debug" then
		local msg = string.format("Language server %s started!", client.name)
		vim.notify(msg, "info", { title = "Nvim-config" })
	end
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	if vim.fn.isdirectory("lsp." .. server.name) ~= 0 then
		require("lsp." .. server.name).update_opts(on_attach, capabilities)
	end

	-- if enhance_server_opts[server.name] then
	--     -- Enhance the default opts with the server-specific ones
	--     enhance_server_opts[server.name](opts)
	--     require('lsp.' .. server.name).setup(on_attach, capabilities)
	-- end

	-- (optional) Customize the options passed to the server
	-- if server.name == "tsserver" then
	--     opts.root_dir = function() ... end
	-- end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

-- null-ls
for _, server in ipairs({
	"null-ls",
}) do
	require("lsp." .. server).setup(on_attach, capabilities)
end

-- Change diagnostic signs.
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- global config for diagnostic
vim.diagnostic.config({
	underline = false,
	-- virtual_text = {
	--     prefix = '■', -- Could be '●', '▎', 'x'
	-- },
	virtual_text = false,
	signs = true,
	severity_sort = true,
	float = {
		source = "always", -- Or "if_many"
	},
})

-- lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
--   underline = false,
--   virtual_text = false,
--   signs = true,
--   update_in_insert = false,
-- })

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

local function goto_definition(split_cmd)
	local util = vim.lsp.util
	local log = require("vim.lsp.log")
	local api = vim.api

	-- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
	local handler = function(_, result, ctx)
		if result == nil or vim.tbl_isempty(result) then
			local _ = log.info() and log.info(ctx.method, "No location found")
			return nil
		end

		if split_cmd then
			vim.cmd(split_cmd)
		end

		if vim.tbl_islist(result) then
			util.jump_to_location(result[1])

			if #result > 1 then
				util.set_qflist(util.locations_to_items(result))
				api.nvim_command("copen")
				api.nvim_command("wincmd p")
			end
		else
			util.jump_to_location(result)
		end
	end

	return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

M.icons = {
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Enum = "了 ",
	EnumMember = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = " ",
	Interface = "ﰮ ",
	Keyword = " ",
	Method = "ƒ ",
	Module = " ",
	Property = " ",
	Snippet = "﬌ ",
	Struct = " ",
	Text = " ",
	Unit = " ",
	Value = " ",
	Variable = " ",
}

function M.setup()
	local kinds = vim.lsp.protocol.CompletionItemKind
	for i, kind in ipairs(kinds) do
		kinds[i] = M.icons[kind] or kind
	end
end

return M
