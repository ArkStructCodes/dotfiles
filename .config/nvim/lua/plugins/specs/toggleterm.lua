return {
    'akinsho/toggleterm.nvim',
    config = function()
        require('toggleterm').setup {
            open_mapping = '<A-t>',
            autochdir = true,
            direction = 'float'
        }

        local Terminal = require('toggleterm.terminal').Terminal

        local python = Terminal:new { cmd = 'python', hidden = true }
        map('n', '<Leader>p', function() python:toggle() end)
    end
}
