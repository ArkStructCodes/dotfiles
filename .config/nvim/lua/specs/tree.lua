return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup {
            renderer = { indent_markers = { enable = true }},
            git = { enable = false }
        }

        noremap("n", "<Leader>m", ":NvimTreeFocus<CR>")
    end
}
