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

        -- Apply the 'night' variant of the colorscheme.
        vim.cmd('colorscheme tokyonight-night')

        -- Override group settings and link to comment.
        -- This is a temporary solution.
        vim.cmd('highlight! link @string.documentation @comment')
    end
}
