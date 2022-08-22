return {
    {
        'neovim/nvim-lspconfig',
        setup = function()
            -- Change diagnostic text prefix.
            vim.diagnostic.config { virtual_text = { prefix = '▮ ' }}

            local signs = {
                Error = ' ',
                Warn = ' ',
                Hint = ' ',
                Info = ' '
            }

            -- Set custom diagnostic signs for the sign column.
            for sign, icon in pairs(signs) do
                local hl = 'DiagnosticSign' .. sign
                vim.fn.sign_define(hl, {
                    text = icon,
                    texthl = hl,
                    numhl = hl
                })
            end
        end,
        ft = { 'python', 'rust', 'javascript', 'typescript' }
    },
	{
		'hrsh7th/cmp-nvim-lsp',
		after = 'nvim-lspconfig',
		config = function()
			local cmp_src = require('cmp_nvim_lsp')

			local servers = {
				-- pyright, typescript, typescript-language-server (npm)
                'pyright', 'tsserver',
                -- clang, rust-analyzer (native)
				'clangd', 'rust_analyzer' 
			}

			local capabilities = cmp_src.update_capabilities(
				vim.lsp.protocol.make_client_capabilities()
			)

			for i = 1, #servers do
				require('lspconfig')[servers[i]].setup {
					capabilities = capabilities
				}
			end
		end
	}
}
