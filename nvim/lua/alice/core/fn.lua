local M = {}

M.show_messages_split = function()
	vim.cmd("botright new")
	vim.cmd("setlocal buftype=nofile bufhidden=wipe nobuflisted")
	vim.cmd("put =execute('messages')")
	vim.cmd("setlocal nomodifiable readonly")
	vim.cmd("nnoremap <buffer> q :bd!<CR>")
	vim.cmd("normal! gg")
end

return M
