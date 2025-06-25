local notifystate = {
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
		vim.api.nvim_buf_set_option(buf, "filetype", "notify")
	end

	local messages = vim.fn.execute("messages")
	local lines = vim.split(messages, "\n")

	vim.api.nvim_buf_set_option(buf, "modifiable", true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_option(buf, "readonly", true)

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

local msg_toggle = function()
	if not vim.api.nvim_win_is_valid(notifystate.floating.win) then
		notifystate.floating = create_floating_window({ buf = notifystate.floating.buf })
	else
		vim.api.nvim_win_hide(notifystate.floating.win)
	end
end
vim.api.nvim_create_user_command("MsgToggle", msg_toggle, {})

-- for notification history
vim.keymap.set("n", "<leader>sn", "<cmd>MsgToggle<CR>", { desc = "search notifications" })

return {}
