return {
    "akinsho/bufferline.nvim",
    version = "*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("bufferline").setup {}

        -- Set keybinds for navigation.
        noremap("n", "<Leader>n", ":BufferLineCycleNext<CR>")
        noremap("n", "<Leader>b", ":BufferLineCyclePrev<CR>")
        noremap("n", "<Leader>c", ":BufferLinePickClose<CR>")
    end
}
