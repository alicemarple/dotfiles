return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#000000",
			stages = "fade_in_slide_out",
			render = "compact",
			timeout = 1000,
		})

		vim.notify = require("notify")
		vim.keymap.set("n", "<leader>nd", function()
			require("notify").dismiss({ silent = true, pending = true })
		end, { desc = "Dismiss Notifications" })
	end,
}
