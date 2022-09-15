return {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'neovim-ayu',
    config = function()
        require('lualine').setup {
            options = {
                theme = 'ayu',
                component_separators = '',
                section_separators = { left = '', right = '' },
                globalstatus = true
            },
            sections = {
                lualine_b = { 'filename', 'branch' },
                lualine_c = { 'diagnostics' },
                lualine_x = {},
                lualine_y = { 'filetype' },
                lualine_z = { 'progress' }
            }
        }
    end
}
