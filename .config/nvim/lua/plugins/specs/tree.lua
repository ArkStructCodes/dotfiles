return {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
	config = function()
		require('nvim-tree').setup {
            view = { adaptive_size = true },
            renderer = { indent_markers = { enable = true }}
        }
        map('n', '<Leader>n', ':NvimTreeOpen<CR>')
	end
}
