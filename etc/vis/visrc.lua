-- load standard vis module, providing parts of the Lua API
require('vis')

-- plugins
require('plugins/vis-go')
--require('plugins/vis-filetype-settings/vis-filetype-settings')
require('plugins/vis-shebang')


vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	-- per file settings
	settings = {
		markdown = {"set expandtab on", "set tabwidth 4"}
	}
	
	-- shebang syntax
	shebangs = {
		["#!/bin/sh"] = "bash",
		["#!/bin/ksh"] = "bash"
	}
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command('set theme rein')
end)
