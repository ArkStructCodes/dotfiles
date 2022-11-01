return {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('bufferline').setup {}

        -- Set keybinds for navigation.
        map('n', '<Leader>n', ':BufferLineCycleNext<CR>')
        map('n', '<Leader>b', ':BufferLineCyclePrev<CR>')
        map('n', '<Leader>c', ':BufferLinePickClose<CR>')
    end
}
