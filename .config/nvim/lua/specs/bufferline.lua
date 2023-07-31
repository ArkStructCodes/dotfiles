return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                show_close_icon = false,
                show_buffer_close_icons = false,
                hover = { enabled = false },
            }
        })

        -- Set keybinds for navigation.
        noremap("n", "<Leader>n", ":BufferLineCycleNext<CR>")
        noremap("n", "<Leader>b", ":BufferLineCyclePrev<CR>")
        noremap("n", "<Leader>c", ":BufferLinePickClose<CR>")
    end,
}
