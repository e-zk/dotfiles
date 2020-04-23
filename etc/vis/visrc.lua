-- load standard vis module, providing parts of the Lua API
require('vis')

-- plugins
--require('plugins/vis-go/vis-go')
--require('plugins/vis-filetype-settings/vis-filetype-settings')
--require('plugins/vis-shebang/vis-shebang')

-- per file settings
settings = {
	--markdown = {"set expandtab on", "set tabwidth 4"}
	bash = {"set syntax bash"}
--	latex = function(win)
--		local this_file = vis.win.file
--		if this_file.size == 0 then
--		end
--	end

}

-- shebang syntaxes
shebangs = {
	["#!/bin/sh"] = "bash",
	["#!/bin/ksh"] = "bash"
}

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command('set theme mine')
end)
