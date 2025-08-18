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
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			local function map(desc, keys, func)
				vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true, desc = desc })
			end

			map("Restart LSP", "<leader>rs", ":LspRestart<CR>")
			map("Hover Docs", "K", vim.lsp.buf.hover)
			map("Signature Help", "<C-k>", vim.lsp.buf.signature_help)
			map("Rename Symbol", "<leader>rn", vim.lsp.buf.rename)
			map("Code Actions", "<leader>ca", vim.lsp.buf.code_action)
			map("Line Diagnostics", "<leader>de", vim.diagnostic.open_float)
			map("Diagnostic List", "<leader>dq", vim.diagnostic.setloclist)
			map("Next Diagnostic", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end)
			map("Previous Diagnostic", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end)
			map("Goto Definition", "gd", "<cmd>Telescope lsp_definitions<CR>")
			map("Goto Declaration", "gD", vim.lsp.buf.declaration)
			map("References", "gR", "<cmd>Telescope lsp_references<CR>")
			map("Goto Implementation", "gi", "<cmd>Telescope lsp_implementations<CR>")
			map("Goto Type Definition", "gt", "<cmd>Telescope lsp_type_definitions<CR>")
			map("Document Symbols", "gs", "<cmd>Telescope lsp_document_symbols<CR>")
			map("Workspace Symbols", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>")
		end

		-- lsp
		local servers = {
			"tailwindcss",
			"html",
			"bashls",
			"cssls",
			"pylsp",
			"ts_ls",
			"clangd",
			"gopls",
		}

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		}

		vim.diagnostic.config({
			signs = {
				text = signs, -- Enable signs in the gutter
			},
			virtual_text = true,
			underline = false,
		})
	end,
}
