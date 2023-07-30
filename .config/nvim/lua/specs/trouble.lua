return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup {}
        noremap("n", "<Leader>t", ":Trouble<CR>")
    end,
    keys = "<Leader>t",
}
