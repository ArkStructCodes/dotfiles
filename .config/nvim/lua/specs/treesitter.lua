filetypes = {
    "astro",
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
    "svelte",
    "typescript",
    "toml",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = filetypes,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
    ft = filetypes,
}
