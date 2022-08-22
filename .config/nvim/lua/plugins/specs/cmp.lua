return {
    'hrsh7th/nvim-cmp',
    requires = {
        'onsails/lspkind-nvim',
        'L3MON4D3/LuaSnip',
        --  Completion sources.
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline'
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        local luasnip = require('luasnip')

        cmp.setup {
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert {
                ['<A-Right>'] = cmp.mapping.scroll_docs(4),
                ['<A-Left>'] = cmp.mapping.scroll_docs(-4),
                ['<A-e>'] = cmp.mapping.abort(),
                ['<Right>'] = cmp.mapping.confirm { select = true }
            },
            sources = cmp.config.sources {
                { name = 'nvim_lua' },
                { name = 'nvim_lsp' },
                { name = 'buffer', keyword_length = 4 }
            },
            formatting = { format = lspkind.cmp_format() },
        }
        
        cmp.setup.cmdline(':', {
            sources = cmp.config.sources {
                { name = 'cmdline', keyword_length = 2 }
            },
            mapping = cmp.mapping.preset.cmdline()
        })
    end
}
