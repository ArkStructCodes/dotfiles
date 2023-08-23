return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.load_extension("file_browser")
        telescope.load_extension("fzf")

        map("n", "<Leader>fg", builtin.live_grep)
        map("n", "<Leader>fb", builtin.buffers)
        map("n", "<Leader>fh", builtin.help_tags)
        map("n", "<Leader>ff", telescope.extensions.file_browser.file_browser)
    end,
    keys =  {
        { "<Leader>fg", mode = "n" },
        { "<Leader>fb", mode = "n" },
        { "<Leader>fh", mode = "n" },
        { "<Leader>ff", mode = "n" },
    },
}
