local fn = require("alice.core.fn")

-- Keymaps

-- Leader Key
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "clear search highlight", silent = true })
vim.keymap.set("i", "jk", "<ESC>", { desc = "exit the insert mode with jk" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted line down" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over without lose" })

-- Movement in page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move page in downward" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move page in upward" })

-- Select Whole file
vim.keymap.set("n", "<leader>as", "gg<S-v>G", { desc = "Select whole file" })

-- terminal
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Escape terminal insert mode" })

-- Notifications
vim.keymap.set("n", "<leader>sn", fn.show_messages_split, { desc = "Notifications" })
