local termstate = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.85)
	local height = opts.height or math.floor(vim.o.lines * 0.85)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_option(buf, "filetype", "terminal")
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

local toggle_term = function()
	if not vim.api.nvim_win_is_valid(termstate.floating.win) then
		termstate.floating = create_floating_window({ buf = termstate.floating.buf })
		if vim.bo[termstate.floating.buf].buftype ~= "terminal" then
			vim.fn.termopen(vim.o.shell, {
				on_exit = function()
					if vim.api.nvim_buf_is_valid(termstate.floating.buf) then
						vim.api.nvim_buf_delete(termstate.floating.buf, { force = true })
					end
				end,
			})
			vim.cmd("startinsert")
		end
	else
		vim.api.nvim_win_hide(termstate.floating.win)
	end
end

vim.api.nvim_create_user_command("TermToggle", toggle_term, {})

-- for floating terminal
vim.keymap.set("n", "<a-t>", "<cmd>TermToggle<CR>", { desc = "floating terminal" })

return {}
