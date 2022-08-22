--- Collection of global utility functions.
-- @module _G

local fn = vim.fn
local g = vim.g
local uv = vim.loop

--- Disable the specified neovim plugins.
-- @param plugins Array of plugin names.
function _G.disable_plugins(plugins)
    for i = 1, #plugins do
        g['loaded_'..plugins[i]] = 1
    end
end

--- Find all the lua scripts in the given path.
-- @param path Path to scan for lua scripts.
-- @param callback Function receiving the script name.
function _G.find_scripts(path, callback)
    -- Returns a handle to use with `fs_scandir_next`.
    local fd = uv.fs_scandir(path)
    if fd then
        while true do
            -- Returns `nil` when there are no more entries.
            local s, t = uv.fs_scandir_next(fd)
            if t == nil then
                break
            elseif t == 'file' then
                -- Removes the extension if its a lua file.
                local name = s:match('(%a+).lua$')
                if name ~= nil then
                    callback(name)
                end
            end
        end
    end
end

--- Shorthand interface for setting keybinds.
-- @param mode Mode where the bind is recognized.
-- @param lhs Key combination to bind.
-- @param rhs Action for the bind. Could be a lua closure.
function _G.map(mode, lhs, rhs)
    local opts = { noremap = true, silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

--- Suppress errors while loading a module.
-- @param module Lua module present in 'runtimepath'.
-- @return Module table on success, nil on failure.
function _G.prequire(module)
    local ok, result = pcall(require, module)
    if ok then
        return result
    else
        print('Error: cannot load '..module)
    end
end
