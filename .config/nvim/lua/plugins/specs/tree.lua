return {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('nvim-tree').setup {
            renderer = { indent_markers = { enable = true }},
            git = { enable = false }
        }

        map('n', '<Leader>m', ':NvimTreeFocus<CR>')
    end
}
