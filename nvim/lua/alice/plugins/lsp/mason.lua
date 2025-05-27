return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	lazy = false,
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"ruff", -- python all in one
				"eslint_d", -- JS, TS and more
				"clang-format",
				"cpplint",
				"shfmt", -- bash
				"beautysh",
				"gofumpt", -- go
				"goimports",
				"revive",
			},
		})
		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pylsp",
				"ts_ls",
				"bashls",
				"grammarly",
				"gopls",
			},
		})
	end,
}
