return {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'tokyonight.nvim',
    config = function()
        require('lualine').setup {
            options = {
                theme = 'tokyonight',
                component_separators = '',
                section_separators = { left = '', right = '' },
                globalstatus = true
            },
            sections = {
                lualine_b = { 'branch' },
                lualine_c = { 'diagnostics' },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            }
        }
    end
}
