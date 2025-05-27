return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  Toggle file explorer", "<CMD>:lua Snacks.explorer()<CR>"),
			dashboard.button("SPC ff", "  Find File", ":lua Snacks.dashboard.pick('files')<CR>"),
			dashboard.button("SPC sg", "  Find Word", ":lua Snacks.dashboard.pick('live_grep')<CR>"),
			dashboard.button("m", "  Mappings", ":e ~/.config/nvim/lua/alice/core/keymaps.lua<CR>"),
			dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
			dashboard.button("l", "󰒲  Lazy", ":Lazy <CR>"),
			dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- local function plugins_count()
		-- 	local lazy_stats = require("lazy").stats()
		-- 	local total = lazy_stats.count -- Total installed plugins
		-- 	local loaded = lazy_stats.loaded -- Plugins currently loaded
		-- 	return string.format(" %d/%d plugins loaded", loaded, total)
		-- end

		-- Set footer with plugin count
		-- dashboard.section.footer.val = plugins_count()

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
