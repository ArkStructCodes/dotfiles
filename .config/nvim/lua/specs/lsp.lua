-- Set custom diagnostic signs for the sign column.
for sign, icon in pairs({
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
}) do
    local hl = "DiagnosticSign" .. sign
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Change diagnostic text prefix.
vim.diagnostic.config { virtual_text = { prefix = "▮ " }}

-- Global mappings.
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

-- Use autocommand to only map the following keys after the language server
-- attaches to the current buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings. 
        local opts = { buffer = ev.buf }

        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        map("n", "<Leader>r", vim.lsp.buf.rename, opts)
        map({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "<Leader>cf", function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

return {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local servers = { "pyright", "rust_analyzer", "svelte", "tsserver" }
        for i = 1, #servers do
            lspconfig[servers[i]].setup { capabilities = capabilities }
        end
    end,
    ft = { "javascript", "jsx", "svelte", "typescript", "tsx", "python", "rust" },
}
