LSP_FILETYPES = { "c", "python", "rust", "javascript", "typescript" }

SIGN_ICONS = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

-- Set custom diagnostic signs for the sign column.
for sign, icon in pairs(SIGN_ICONS) do
    local hl = "DiagnosticSign" .. sign
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl
    })
end

-- Change diagnostic text prefix.
vim.diagnostic.config { virtual_text = { prefix = "▮ " }}

-- Global mappings.
noremap('n', '[d', vim.diagnostic.goto_prev)
noremap('n', ']d', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings.
        local opts = { buffer = ev.buf }
        noremap('n', 'gD', vim.lsp.buf.declaration, opts)
        noremap('n', 'gd', vim.lsp.buf.definition, opts)
        noremap('n', 'K', vim.lsp.buf.hover, opts)
        noremap('n', 'gi', vim.lsp.buf.implementation, opts)
        noremap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        noremap('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
        noremap('n', '<Leader>r', vim.lsp.buf.rename, opts)
        noremap({ 'n', 'v' }, '<Leader>a', vim.lsp.buf.code_action, opts)
        noremap('n', 'gr', vim.lsp.buf.references, opts)
        noremap('n', '<Leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

return {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        local servers = {
            -- pyright, typescript, typescript-language-server (npm)
            "pyright", "tsserver",
            -- clang, rust-analyzer (native package)
            "clangd", "rust_analyzer" 
        }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        for i = 1, #servers do
            require("lspconfig")[servers[i]].setup {
                capabilities = capabilities
            }
        end
    end,
    ft = LSP_FILETYPES,
}
