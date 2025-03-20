return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				view = "cmdline_popup",
				format = {
					cmdline = { icon = "", conceal = false },
					search_down = { icon = " ↓" },
					search_up = { icon = " ↑" },
				},
			},
			popupmenu = {
				enabled = true,
				backend = "nui",
			},
			messages = {
				view_search = false, -- disable default search messages
			},
			notify = {
				enabled = true,
			},
			lsp = {
				progress = {
					enabled = true,
				},
				signature = {
					enabled = true,
				},
				hover = {
					enabled = true,
				},
			},
			presets = {
				bottom_search = true, -- Use classic bottom cmdline for `/` and `?`
				command_palette = true, -- Position command-line and popupmenu together
				long_message_to_split = true, -- Large messages go to a split
				inc_rename = false, -- Only enable if using `inc-rename.nvim`
				lsp_doc_border = true, -- Add border to LSP hover and signature help
			},
			views = {
				cmdline_popup = {
					position = {
						row = "40%",
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
					border = {
						style = "rounded",
					},
					win_options = {
						winblend = 10,
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = "45%",
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
					},
					win_options = {
						winblend = 10,
					},
				},
			},
		})

		-- Setup notify with minimal style
		require("notify").setup({
			stages = "fade_in_slide_out",
			render = "minimal",
			timeout = 2000,
			background_colour = "#000000",
		})
		vim.notify = require("notify")
	end,
}
