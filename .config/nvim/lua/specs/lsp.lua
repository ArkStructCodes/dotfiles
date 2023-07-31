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
