languages = {
    "bash",
    "c",
    "cpp",
    "css",
    "go",
    "html",
    "ini",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "sql",
    "svelte",
    "typescript",
    "tsx",
    "toml",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- silently ignore errors on unsupported buffers
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
    config = function()
        require("nvim-treesitter").install(languages)
    end,
}
