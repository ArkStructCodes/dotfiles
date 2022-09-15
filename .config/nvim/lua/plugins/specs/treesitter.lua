return {
    'nvim-treesitter/nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'bash', 'c', 'javascript', 'lua', 'python', 'rust',
                'html', 'css', 'markdown', 'json', 'yaml', 'toml'
            },
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner'
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    }
                },
                move = {
                    enable = true,
                    set_jumps = true, -- Set jumps in the jumplist
                    goto_next_start = {
                        [']m'] = '@function.outer',
                        [']]'] = '@class.outer',
                    },
                    goto_next_end = {
                        [']M'] = '@function.outer',
                        [']['] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[['] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[]'] = '@class.outer',
                    }
                }
            }
        }
    end,
    run = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' }
}
