function _G.noremap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

function _G.prequire(module)
    local ok, result = pcall(require, module)
    if ok then
        return result
    else
        vim.api.nvim_echo({{ result, "WarningMsg" }}, false, {})
    end
end

-- Enable the experimental module loader (0.9.0+).
-- This eliminates the need for the impatient.nvim plugin.
vim.loader.enable()

-- Load the configuration.
prequire("options")
prequire("keymaps")
prequire("plugins")
