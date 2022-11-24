return {
    'folke/tokyonight.nvim',
    config = function()
        require('tokyonight').setup {
            style = 'night',
            styles = {
                comments = { italic = false },
                keywords = { italic = false }
            },
            on_highlights = function(hl, c)
                hl.CursorLineNr = { fg = c.orange }
            end
        }
        vim.cmd('colorscheme tokyonight-night')
    end
}
