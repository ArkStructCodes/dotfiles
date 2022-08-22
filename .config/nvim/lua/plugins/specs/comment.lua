return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup()
	end,
	event = { 'BufRead', 'BufNewFile' }
}
