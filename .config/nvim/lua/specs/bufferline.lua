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
            },
        })

        -- Set keybinds for navigation.
        map("n", "<Leader>n", ":BufferLineCycleNext<CR>")
        map("n", "<Leader>b", ":BufferLineCyclePrev<CR>")
        map("n", "<Leader>c", ":BufferLinePickClose<CR>")
    end,
}
