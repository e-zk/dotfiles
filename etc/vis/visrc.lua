-- load standard vis module, providing parts of the Lua API
require('vis')

-- plugins
require('plugins/vis-go/vis-go')
require('plugins/vis-filetype-settings/vis-filetype-settings')
require('plugins/vis-shebang/vis-shebang')

-- per file settings
settings = {
       markdown = {"set expandtab on", "set tabwidth 4"}
}

-- shebang syntaxes
shebangs = {
	["#!/bin/sh"] = "bash"
}

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	--vis:command('set number')
	vis:command('set theme default-16')
	--vis:command('set theme base16-monokai')
	vis:command('set theme mineold')
end)
