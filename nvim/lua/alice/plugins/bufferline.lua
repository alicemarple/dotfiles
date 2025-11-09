return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- vim.opt.linespace = 8

		require("bufferline").setup({
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
				numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
				close_command = function(n)
					vim.cmd("bdelete! " .. n) -- or `bdelete` if you don’t want the `!`
				end,
				buffer_close_icon = "✗",
				close_icon = "",
				path_components = 1, -- Show only the file name without the directory
				modified_icon = "●",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
				tab_size = 21,
				diagnostics = false,
				diagnostics_update_in_insert = false,
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = false,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				separator_style = { "│", "│" }, -- | "thick" | "thin" | { 'any', 'any' },
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				show_tab_indicators = false,
				indicator = {
					-- icon = '▎', -- this should be omitted if indicator style is not 'icon'
					style = "none", -- Options: 'icon', 'underline', 'none'
				},
				groups = {
					items = {
						require("bufferline.groups").builtin.pinned:with({ icon = " 󰐃 " }),
						-- other items
					},
				},
				icon_pinned = "󰐃",
				minimum_padding = 1,
				maximum_padding = 5,
				maximum_length = 15,
				sort_by = "insert_at_end",
				offsets = {
					{
						filetype = "neo-tree",
						text = "neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
			highlights = {
				separator = {
					fg = "#bac2de",
				},
				buffer_selected = {
					bold = true,
					italic = false,
				},
				-- separator_selected = {},
				-- tab_selected = {},
				-- background = {},
				-- indicator_selected = {},
				-- fill = {},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
		vim.keymap.set(
			"n",
			"<leader>bP",
			"<Cmd>BufferLineGroupClose ungrouped<CR>",
			{ desc = "Delete Non-Pinned Buffers" }
		)
		vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
		vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
		vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Buffer delete" })
		vim.keymap.set("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the Right" })
		vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete Buffers to the Left" })
	end,
}
