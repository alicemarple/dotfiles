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
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
		vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format document" })
		-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
		-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
		vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
		vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })

		vim.keymap.set("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, { desc = "Goto Definition" })
		vim.keymap.set("n", "gD", function()
			Snacks.picker.lsp_declarations()
		end, { desc = "Goto Declaration" })
		vim.keymap.set("n", "gr", function()
			Snacks.picker.lsp_references()
		end, { nowait = true, desc = "References" })
		vim.keymap.set("n", "gI", function()
			Snacks.picker.lsp_implementations()
		end, { desc = "Goto Implementation" })
		vim.keymap.set("n", "gy", function()
			Snacks.picker.lsp_type_definitions()
		end, { desc = "Goto T[y]pe Definition" })
		vim.keymap.set("n", "<leader>ss", function()
			Snacks.picker.lsp_symbols()
		end, { desc = "LSP Symbols" })
		vim.keymap.set("n", "<leader>sS", function()
			Snacks.picker.lsp_workspace_symbols()
		end, { desc = "LSP Workspace Symbols" })
	end,
}
