filetypes = {
    "bash",
    "c",
    "cpp",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "toml",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-context" },
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = filetypes,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
    ft = filetypes,
}
