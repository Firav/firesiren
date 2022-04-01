--[[
    Sonoran Plugins

    Plugin Configuration

    Put all needed configuration in this file.
]]
local config = {
    enabled = true,   
    pluginName = "firesiren", -- name your plugin here
    pluginAuthor = "Brentopc", -- author
	configVersion = "1.2-SNAPSHOT",
    
	firesirenResourceName = "inferno-fire-ems-pager", -- resource name of the Inferno Collection: Fire/EMS Pager + Fire Siren script and the nearest-postal script
	nearestPostalResourceName = "nearest-postal", -- resource name of the nearest-postal script
	postalsType = "new-postals", -- postals type to use, ["new-postals", "ocrp-postals", "old-postals"]	
	
	-- if you make any changes in the Inferno Collection: Fire/EMS Pager + Fire Siren config, be sure to make those same changes here otherwise you won't notice your changes when a fire call is made
    fireSirens = {
		{Label = 'Paleto Bay', Name = 'pb', Loc = vector3(-379.53, 6118.32, 31.85), Radius = 800, Siren = 'siren1'},
		{Label = 'Sandy Shores', Name = 'ss', Loc = vector3(1691.24, 3585.83, 35.62), Radius = 500, Siren = 'siren1'},		
		
		{Label = 'Davis', Name = 'sls', Loc = vector3(199.83, -1643.38, 29.8), Radius = 400, Siren = 'siren1'},
		{Label = 'Rockford Hills', Name = 'rh', Loc = vector3(-635.09, -124.29, 39.01), Radius = 400, Siren = 'siren1'},
		{Label = 'El Burro Heights', Name = 'els', Loc = vector3(1193.42, -1473.72, 34.86), Radius = 400, Siren = 'siren1'},
		{Label = 'Del Perro Beach', Name = 'dpb', Loc = vector3(-1183.13, -1773.91, 4.05), Radius = 400, Siren = 'siren1'},
		
		{Label = 'Fort Zancudo', Name = 'fz', Loc = vector3(-2095.92, 2830.22, 32.96), Radius = 1000, Siren = 'siren2'},
		{Label = 'LSIA', Name = 'lsia', Loc = vector3(-1068.74, -2379.96, 14.05), Radius = 500, Siren = 'siren2'},
	},
	-- this section links your stations with tones. you can outline multiple tones for the same station. such as 'fire' and 'medical' for davis(sls).
	fireTones = {
		{tone = 'fire', station = 'pb'},
		{tone = 'fire', station = 'ss'},

		{tone = 'fire', station = 'sls'},
		{tone = 'medical', station = 'sls'},
		{tone = 'fire', station = 'rh'},
		{tone = 'rescue', station = 'rh'},
		{tone = 'fire', station = 'els'},
		{tone = 'fire', station = 'dpb'},

		{tone = 'other', station = 'fz'},
		{tone = 'other', station = 'lsia'},
	},
	
	-- values in the calls "CODE" that trigger the fire siren 
    fireCalls = {
		{code = '10-52: Ambulance Needed'},
		{code = '10-70: Fire Alarm'},
		{code = '10-73: Smoke Report'},
		{code = '10-89: Bomb Threat'},
	},	
	
	addCallNote = true, -- whether or not to add a note to the call
	callNoteMessage = "Station Fire Siren Triggered", -- the note that is added to the call	
	callNoteStation = true, -- add the fire siren name to the front of the note, example: "Sandy Shores Station Fire Siren Triggered"
	pagerTones = false, -- whether or not linked pagers/tones are tripped with the fireSirens
}



if config.enabled then
    Config.RegisterPluginConfig(config.pluginName, config)
end
