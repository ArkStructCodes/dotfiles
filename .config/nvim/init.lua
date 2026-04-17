-- Enable the experimental module loader (0.9.0+).
-- This eliminates the need for the impatient.nvim plugin.
vim.loader.enable()

function _G.map(mode, lhs, rhs, opts)
    if not opts then
        opts = { noremap = true, silent = true }
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

function _G.prequire(module)
    local ok, result = pcall(require, module)
    if ok then
        return result
    else
        vim.api.nvim_echo({{ result, "WarningMsg" }}, false, {})
    end
end

-- Load configuration modules.
prequire("options")
prequire("keymaps")
prequire("plugins")
