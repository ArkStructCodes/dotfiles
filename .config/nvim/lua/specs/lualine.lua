return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            component_separators = "",
            section_separators = { left = "", right = "" },
            globalstatus = true,
        },
        sections = {
            lualine_b = { "branch" },
            lualine_c = { "diagnostics" },
            lualine_x = { "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
}
