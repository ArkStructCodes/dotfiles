return {
    'folke/tokyonight.nvim',
    config = function()
        require('tokyonight').setup {
            style = 'night',
            styles = {
                comments = { italic = false },
                keywords = { italic = false }
            }
        }
        vim.cmd('colorscheme tokyonight-night')
    end
}
