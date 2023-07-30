-- Map the <Leader> key to space.
vim.g.mapleader = ' '

-- Map space to do nothing.
noremap('n', '<Space>', '<Nop>')

-- Keep cursor in the center of the screen.
noremap('n', 'n', 'nzz')
noremap('n', 'N', 'Nzz')

-- Disable all highlights.
noremap('n', '<CR>', ':noh<CR>')

-- Manage moving around splits.
noremap('n', '<Leader>h', '<C-w>h')
noremap('n', '<Leader>j', '<C-w>j')
noremap('n', '<Leader>k', '<C-w>k')
noremap('n', '<Leader>l', '<C-w>l')

-- Keep text selected while indenting.
noremap('v', '<', '<gv')
noremap('v', '>', '>gv')

-- Don't yank while pasting.
noremap('v', 'p', '"_dP')
