return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
		lspconfig.bashls.setup({
			capabilities = capabilities,
		})
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})
		lspconfig.pylsp.setup({
			capabilities = capabilities,
		})
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.clangd.setup({
			capabilities = capabilities,
		})
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})
		vim.diagnostic.config({
			-- virtual_text = true, --show diagnostics
			underline = false, --no underline for diagnostics
		})

		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart lsp" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
		vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
		vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { desc = "Next diagnostic" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { desc = "Previous diagnostic" })

		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Goto Definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "References", nowait = true })
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Goto Implementation" })
		vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Goto Type Definition" })
		vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP Symbols" })
		vim.keymap.set("n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "LSP Workspace Symbols" })
	end,
}
