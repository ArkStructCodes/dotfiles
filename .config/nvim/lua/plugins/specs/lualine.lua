return {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'github-nvim-theme',
    config = function()
        require('lualine').setup {
            options = {
                theme = 'github_dark_default',
                component_separators = '',
                section_separators = { left = '', right = '' },
                globalstatus = true
            },
            sections = {
                lualine_b = { 'filename', 'branch' },
                lualine_c = { 'diagnostics' },
                lualine_x = { 'filesize' },
                lualine_y = { 'filetype' },
                lualine_z = { 'progress' }
            }
        }
    end
}
