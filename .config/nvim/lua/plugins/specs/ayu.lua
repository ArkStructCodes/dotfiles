return {
    'Shatur/neovim-ayu',
    config = function()
        local ayu = require('ayu')

        ayu.setup { overrides = { NvimTreeNormal = { bg = '#000000' }}}
        ayu.colorscheme()
    end
}
