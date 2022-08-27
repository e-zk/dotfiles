-- load standard vis module, providing parts of the Lua API
require('vis')

-- plugins
require('plugins/vis-shebang')
require('plugins/vis-go')

-- spellcheck config
spell = require('plugins/vis-spellcheck')
spell.cmd = "aspell -l %s -a"
spell.list_cmd = "aspell list -l %s -a"
spell.default_lang = "en_AU"

-- global config
vis.events.subscribe(vis.events.INIT, function()
	-- shebang syntax
        shebangs = {
                ["#!/bin/sh"] = "bash",
                ["#!/bin/ksh"] = "bash"
        }
end)

-- per-window config
vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
end)
