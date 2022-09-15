return {
    'windwp/nvim-autopairs',
    config = function()
        -- Automatically insert pairs after accepting completion.
        require('cmp').event:on(
            'confirm_done',
            require('nvim-autopairs.completion.cmp').on_confirm_done()
        )

        -- Rely on treesitter for pair detection.
        require('nvim-autopairs').setup { check_ts = true }
    end
}
