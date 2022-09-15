--- Collection of small utility functions.
-- @module _G

local fn = vim.fn
local uv = vim.loop

--- Find all the lua scripts in the given path.
-- @param path Path to scan for lua scripts.
-- @param callback Synchronous callback.
function _G.find_scripts(path, callback)
    local fs = uv.fs_scandir(path)
    if fs then
        repeat
            local name, typ = uv.fs_scandir_next(fs)
            if typ == 'file' then
                local module = name:match('(.+).lua$')
                if module then callback(module) end
            end
        until not typ
    end
end

--- Shorthand interface for setting keymaps.
-- @param mode Mode where the map is recognized.
-- @param lhs Key combination to map.
-- @param rhs Action for the map.
-- @param opts Additional options for `vim.keymap.set`.
function _G.map(mode, lhs, rhs, opts)
    if not opts then
        opts = { noremap = true, silent = true }
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

--- Suppress errors while loading a module.
-- @param module Lua module present in runtime path.
-- @return Module table on success, nil on fail.
function _G.prequire(module)
    local ok, result = pcall(require, module)
    if ok then return result end
end
