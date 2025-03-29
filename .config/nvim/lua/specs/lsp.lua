function init()
    -- Prepare custom diagnostic styles for the sign column.
    local icons = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.HINT] = " ",
        [vim.diagnostic.severity.INFO] = " ",
    }

    local highlights = {
        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    }

    -- Change diagnostic text prefix.
    vim.diagnostic.config({
        virtual_lines = { prefix = "▮ " },
        signs = {
            text = icons,
            numhl = highlights,
            texthl = highlights,
        }
    })

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
end

return {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = { "neovim/nvim-lspconfig" },
    init = init,
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local servers = {
            "gopls",
            "pyright",
            "svelte",
            "ts_ls",
            "rust_analyzer",
        }
        for i = 1, #servers do
            lspconfig[servers[i]].setup({
                capabilities = capabilities,
                -- uncomment the following to enable inlay hints when supported
                -- on_attach = function(client, bufnr)
                --     if client.server_capabilities.inlayHintProvider then
                --         vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                --     end
                -- end
            })
        end
    end,
    ft = {
        "go",
        "javascript",
        "javascriptreact",
        "svelte",
        "typescript",
        "typescriptreact",
        "python",
        "rust",
    }
}
