-- load standard vis module, providing parts of the Lua API
require('vis')

-- plugins
require('plugins/vis-go/vis-go')
require('plugins/vis-filetype-settings/vis-filetype-settings')

-- per file settings
settings = {
	markdown = {"set expandtab on", "set tabwidth 4"}
}

vis.events.subscribe(vis.events.INIT, function()
        -- Your global configuration options
end)
vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options
	vis:command('set theme mine')
end)
