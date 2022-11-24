return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        local extensions = { 'fzf', 'file_browser' }
        for i = 1, #extensions do
            telescope.load_extension(extensions[i])
        end

        -- Set basic keymaps.
        map('n', '<Leader>ff', builtin.find_files)
        map('n', '<Leader>fg', builtin.live_grep)
        map('n', '<Leader>fb', telescope.extensions.file_browser.file_browser)
    end
}
