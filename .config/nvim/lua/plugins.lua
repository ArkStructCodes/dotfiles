-- Bootstrap lazy.nvim, our plugin manager.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Installing plugins, restart neovim afterward")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load our plugin specs from lua files.
local specpath = vim.fn.stdpath("config") .. "/lua/specs"
local specs = {}
for name, typ in vim.fs.dir(specpath) do
    if typ == "file" then
        local module = name:match("(.+).lua$")
        if module then
            local spec = prequire("specs." .. module)
            if spec then table.insert(specs, spec) end
        end
    end
end


require("lazy").setup(specs, {
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
                "matchit",
                "matchparen",
                "logiPat",
                "rrhelper",
                "man",
                "tutor_mode_plugin",
            },
        },
    },
})
