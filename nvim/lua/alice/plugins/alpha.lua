return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {

			[[                                                     ]],
			[[  ^  ^  ^   ^☆ ★ ☆ ___I_☆ ★ ☆ ^  ^   ^  ^  ^   ^  ^  ]],
			[[ /|\/|\/|\ /|\ ★☆ /\-_--\ ☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
			[[ /|\/|\/|\ /|\ ★ /  \_-__\☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
			[[ /|\/|\/|\ /|\ 󰻀 |[]| [] | 󰻀 /|\/|\ /|\/|\/|\ /|\/|\ ]],
			[[                                                     ]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", "<cmd>ene<CR>"),
			dashboard.button("e", "  Toggle file explorer", "<CMD>:lua Snacks.explorer()<CR>"),
			dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
			dashboard.button("g", "  Find Word", ":Telescope live_grep<CR>"),
			dashboard.button("m", "  Keymaps", ":e ~/.config/nvim/lua/alice/core/keymaps.lua<CR>"),
			dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
			dashboard.button("l", "󰒲  Lazy", ":Lazy <CR>"),
			dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
		}
		-- Send config to alpha
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
