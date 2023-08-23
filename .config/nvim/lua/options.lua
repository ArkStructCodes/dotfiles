local o = vim.opt

o.completeopt = { "menu", "menuone", "noselect" }

-- Highlight the line that the cursor is in.
o.cursorline = true
o.cursorlineopt = { "number", "screenline" }

-- Use 4 spaces instead of tabs for each indent step.
o.expandtab = true
o.shiftwidth = 0
o.tabstop = 4

-- Show relative line numbers.
o.number = true
o.relativenumber = true

-- Only save the commands and search history in ShaDa.
o.shada = { "'0", "<0", "h", "/100", ":1000" }

-- Don"t show the current editor mode in the status line.
o.showmode = false

-- Display signs in the number column.
o.signcolumn = "number"

-- Don't use a swapfile buffers.
o.swapfile = false

-- Enable 24 bit color support in the TUI.
o.termguicolors = true
