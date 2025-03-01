vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set guicursor=n-v-c-i:block")
vim.g.mapleader = " "

vim.opt.swapfile = false
vim.opt.clipboard:append("unnamedplus")
vim.wo.number = true

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "clear search highlight" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "exit the insert mode with jk" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- Movement in splits
vim.keymap.set("n", "mh", "<C-w>h", { desc = "Move to right split" })
vim.keymap.set("n", "ml", "<C-w>l", { desc = "Move to left split" })
vim.keymap.set("n", "mj", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "mk", "<C-w>k", { desc = "Move to top split" })

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

-- Exiting and Saving files
vim.keymap.set("n", "<Leader>se", ":wqa<CR>", { desc = "Save and exit" })
vim.keymap.set("n", "<Leader>sb", ":wa<CR>", { desc = "Save bufers" })
vim.keymap.set("n", "<Leader>ef", ":q!<CR>", { desc = "Exit without save" })

-- Select Whole file
vim.keymap.set("n", "<leader>sa", "gg<S-v>G", { desc = "Select whole file" })
