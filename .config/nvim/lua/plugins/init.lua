local packer = prequire('packer')

local cmd = vim.cmd
local fn = vim.fn

-- Disable built-in plugins that I almost never use.
disable_plugins {
    '2html_plugin',
    'did_load_filetypes',
    'gzip',
    'netrw',
    'netrwPlugin',
    'man',
    'matchit',
    'matchparen',
    'remote_plugins',
    'tarPlugin',
    'tar',
    'zipPlugin',
    'zip'
}

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
