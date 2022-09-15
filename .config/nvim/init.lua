require('util')

-- Core configuration.
require('core.options')
require('core.keymaps')

-- This module needs to be loaded before plugins.
prequire('impatient')

-- Loads external plugins.
require('plugins')
