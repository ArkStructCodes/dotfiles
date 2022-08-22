return {
    'projekt0n/github-nvim-theme',
    config = function()
        require('github-theme').setup {
            comment_style = 'NONE',
            sidebars = { 'qf', 'vista_kind', 'packer' },
            theme_style = 'dark_default'
        }
    end
}
