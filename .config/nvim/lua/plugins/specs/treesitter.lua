return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'bash', 'c', 'cpp', 'javascript', 'lua', 'python', 'rust',
                'html', 'css', 'markdown', 'json', 'yaml', 'toml'
            },
            highlight = { enable = true },
            indent = { enable = true }
        }
    end,
    run = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' }
}
