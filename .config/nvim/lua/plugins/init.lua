local packer = prequire('packer')
local fn = vim.fn
local g = vim.g

-- Disable built-in plugins that I almost never use.
local disabled_builtins = {
    'gzip',
    'zip',
    'zipPlugin',
    'tar',
    'tarPlugin',
    'getscript',
    'getscriptPlugin',
    'vimball',
    'vimballPlugin',
    '2html_plugin',
    'did_load_filetypes',
    'matchit',
    'matchparen',
    'logiPat',
    'rrhelper',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'remote_plugins',
    'man',
    'tutor_mode_plugin'
}

-- Setting loaded_foo to 1 disbles loading plugin foo.
for i = 1, #disabled_builtins do
    g['loaded_'..disabled_builtins[i]] = 1
end

-- If packer is not installed, automatically clone it.
if packer == nil then
    print('Installing packer...')
    fn.system {
        'git',
        'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    }
end

return packer.startup(function()
    -- Packer manages itself.
    use 'wbthomason/packer.nvim'

    -- Faster loading.
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'

    -- Load plugins with customized configuration.
    local specs_path = fn.stdpath('config')..'/lua/plugins/specs'
    find_scripts(specs_path, function(name)
        use(prequire('plugins.specs.'..name))
    end)
end)
