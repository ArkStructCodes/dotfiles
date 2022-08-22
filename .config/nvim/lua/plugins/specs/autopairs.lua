return {
    'windwp/nvim-autopairs',
    config = function()
        local cmp_src = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        -- Automatically insert pairs after accepting completion.
        cmp.event:on('confirm_done', cmp_src.on_confirm_done())

        -- Rely on treesitter for pair detection.
        require('nvim-autopairs').setup { check_ts = true }
    end
}
