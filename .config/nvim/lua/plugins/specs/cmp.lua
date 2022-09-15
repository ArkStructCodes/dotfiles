KIND_ICONS = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

return {
    'hrsh7th/nvim-cmp',
    requires = {
        'L3MON4D3/LuaSnip',
        --  Completion sources.
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline'
    },
    config = function()
        local cmp = require('cmp')
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
                { name = 'buffer', keyword_length = 3 }
            },
            formatting = {
                fields = { 'kind', 'abbr' },
                format = function(_, vim_item)
                    vim_item.kind = KIND_ICONS[vim_item.kind] or ""
                    return vim_item
                end
            }
        }
        
        cmp.setup.cmdline(':', {
            sources = cmp.config.sources {{ name = 'cmdline' }},
            mapping = cmp.mapping.preset.cmdline()
        })
    end
}
