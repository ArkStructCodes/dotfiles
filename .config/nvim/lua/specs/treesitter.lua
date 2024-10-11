languages = {
    "astro",
    "bash",
    "c",
    "cpp",
    "css",
    "go",
    "html",
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

filetypes = deepcopy(languages)
table.insert(filetypes, "sh")
table.insert(filetypes, "typescriptreact")
table.insert(filetypes, "zsh")

return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = languages,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
    ft = filetypes,
}
