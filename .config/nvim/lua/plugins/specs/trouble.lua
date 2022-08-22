return {
	'folke/trouble.nvim',
	requires = 'kyazdani42/nvim-web-devicons',
	config = function()
		require('trouble').setup {}
		map('n', '<Leader>t', ':Trouble<CR>')
	end,
	keys = '<Leader>t'
}
