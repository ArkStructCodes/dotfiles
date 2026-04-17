-- Bootstrap our plugin manager.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local loop = vim.uv or vim.loop

if not loop.fs_stat(lazypath) then
    print("Trying to install lazy.nvim (requires git)")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("specs", {
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "zip",
                "zipPlugin",
                "tar",
                "tarPlugin",
                "getscript",
                "getscriptPlugin",
                "vimball",
                "vimballPlugin",
                "2html_plugin",
                "man",
                "matchit",
                "matchparen",
                "logiPat",
                "rrhelper",
                "tutor_mode_plugin",
            },
        },
    },
})
