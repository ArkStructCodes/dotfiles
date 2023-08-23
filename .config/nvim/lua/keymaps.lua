-- Map the <Leader> key to space.
vim.g.mapleader = " "

-- Map space to do nothing.
map("n", "<Space>", "<Nop>")

-- Keep cursor in the center of the screen.
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Disable all highlights.
map("n", "<CR>", ":noh<CR>")

-- Manage moving around splits.
map("n", "<Leader>h", "<C-w>h")
map("n", "<Leader>j", "<C-w>j")
map("n", "<Leader>k", "<C-w>k")
map("n", "<Leader>l", "<C-w>l")

-- Keep text selected while indenting.
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Don't yank while pasting.
map("v", "p", "_dP")
