return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"folke/todo-comments.nvim",
		"folke/trouble.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local open_with_trouble = require("trouble.sources.telescope").open

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					n = { ["<c-t>"] = open_with_trouble },
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		-- set keymaps
		local keymap = vim.keymap

		-- fuzzy
		keymap.set("n", "<leader>fc", function()
			require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find Config File" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent Files" })
		keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })

		-- search
		keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
		keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "Grep" })
		keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "Help Pages" })
		keymap.set("n", "<leader>s/", "<cmd>Telescope search_history<CR>", { desc = "Search History" })
		keymap.set("n", "<leader>s:", "<cmd>Telescope command_history<CR>", { desc = "Command History" }) -- command history

		-- git
		keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Find Git Files" })
		keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git Branches" })
		keymap.set("n", "<leader>gL", "<cmd>Telescope git_bcommits<CR>", { desc = "Git Log Line" })
		keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git Status" })
		keymap.set("n", "<leader>gS", "<cmd>Telescope git_stash<CR>", { desc = "Git Stash" })

		-- todos
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
