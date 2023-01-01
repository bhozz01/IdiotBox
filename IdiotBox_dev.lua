  //----IdiotBox v6.8.b2----//
 //--------By Phizz--------//
//------------------------//



--NOTE-- I do not take credit for all of the features in this cheat. Some codes have been taken from other scripts. In fact, most of this thing is pasted. The contributors are listed in the 'readme.txt' file;

--NOTE-- You can report any bugs or post any suggestions in our Discord server (link is on the website - if the server gets disabled, DM me at https://steamcommunity.com/id/phizzofficial/ or visit the website, we always refresh invite links) or through our website, at https://phizzofficial.wixsite.com/idiotbox4gmod/;

--NOTE-- This script is nowhere near perfect - there's a lot of room for improvement. It started off as a very broken, random paste that I made for fun, then it somehow turned into one of the most popular cheats in Garry's Mod. We try to make IdiotBox a better cheat with each update that gets released, and so far, it seems to go pretty well - but we're nowhere near the end.



local detours = {}

local protectedfiles = {
    "IdiotBox_latest.lua", 
    "IdiotBox_backup.lua", 
	"IdiotBox_dev.lua", 
}

local function DetourFunction(originalFunction, newFunction)
    detours[newFunction] = originalFunction
    return newFunction
end
 
file.Read = DetourFunction(file.Read, function(fileName, path)
	for k, v in next, protectedfiles do
		if string.find("IdiotBox*", v) then
			return "3D_TrollFace_Troll_Model_200"
		end
	end 
    return detours[file.Read](fileName, path)
end)

surface.CreateFont("VisualsFont", {
	font = "Tahoma", 
	size = 12, 
	antialias = false, 
	outline = true, 
})

surface.CreateFont("MenuFont", {
	font = "Tahoma", 
	size = 12, 
	weight = 674, 
	antialias = false, 
	outline  = true, 
})

surface.CreateFont("MainFont", {
	font = "Tahoma", 
	size = 16, 
	weight = 1300, 
	antialias = false, 
	outline  = true, 
})

surface.CreateFont("MainFont2", {
	font = "Tahoma", 
	size = 11, 
	weight = 640, 
	antialias = false, 
	outline  = true, 
})

surface.CreateFont("MiscFont", {
	font = "Tahoma", 
	size = 12, 
	weight = 900, 
	antialias = false, 
	outline  = true, 
})

surface.CreateFont("MiscFont2", {
	font = "Tahoma", 
	size = 12, 
	weight = 900, 
	antialias = false, 
	outline  = false, 
})

surface.CreateFont("MiscFont3", {
	font = "Tahoma", 
	size = 13, 
	weight = 674, 
	antialias = false, 
	outline  = true, 
})

local options = {
		["Main Menu"] = {
				{
					{"General Utilities", 16, 20, 347, 124, 218}, 
					{"Optimize Game", "Checkbox", false, 78}, 
					{"Anti-AFK", "Checkbox", false, 78}, 
					{"Anti-Ads", "Checkbox", false, 78}, 
					{"Anti-Blind", "Checkbox", false, 78}, 
                }, 
				{
					{"Trouble in Terrorist Town Utilities", 16, 157, 347, 125, 218}, 
					{"Hide Round Report", "Checkbox", false, 78}, 
					{"Panel Remover", "Checkbox", false, 78}, 
					{"Prop Kill", "Checkbox", false, 78}, 
					{"Prop Kill Key:", "Toggle", 0, 92, 0}, 
				}, 
				{
					{"DarkRP Utilities", 16, 296, 347, 103, 218}, 
					{"Suicide Near Arrest Batons", "Checkbox", false, 78}, 
					{"Transparent Props", "Checkbox", false, 78}, 
					{"Transparency:", "Slider", 157, 255, 92}, 
				}, 
				{
					{"Murder Utilities", 16, 413, 347, 100, 218}, 
					{"Hide End Round Board", "Checkbox", false, 78}, 
					{"Hide Footprints", "Checkbox", false, 78}, 
					{"No Black Screens", "Checkbox", false, 78}, 
				}, 
				{
					{"Panic Mode", 736, 20, 347, 75, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Mode:", "Selection", "Disable All", {"Disable Ragebot", "Disable Legitbot", "Disable Anti-Aim", "Disable All"}, 92}, 
                }, 
				{
          			{"Menus", 736, 108, 347, 125, 218}, 
					{"Entity Menu", "Button", "", 92}, 
					{"Plugin Loader", "Button", "", 92}, 
					{"Menu Style:", "Selection", "Borders", {"Borders", "Borderless"}, 92}, 
					{"Options Style:", "Selection", "Borderless", {"Borders", "Borderless"}, 92}, 
          		}, 
				{
          			{"Configurations", 736, 246, 347, 150, 218}, 
					{"Automatically Save", "Checkbox", false, 78}, 
					{"Save Configuration", "Button", "", 92}, 
					{"Load Configuration", "Button", "", 92}, 
					{"Delete Configuration", "Button", "", 92}, 
					{"Configuration:", "Selection", "Config #1", {"Config #1", "Config #2", "Config #3", "Config #4", "Config #5"}, 92}, 
          		}, 
				{
          			{"Others", 736, 409, 347, 125, 218}, 
					{"Run the 'idiot_changename' command to set a custom name.", "Checkbox", false, 9999}, 
					{"Apply custom name", "Checkbox", false, 78}, 
					{"Print Changelog", "Button", "", 92}, 
					{"Unload Cheat", "Button", "", 92}, 
          		}, 
        }, 
        ["Aimbot"] = {
                {
					{"Ragebot", 16, 20, 347, 226, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Aim Key:", "Toggle", 0, 92, 0}, 
					{"Silent", "Checkbox", false, 78}, 
					{"Auto Fire", "Checkbox", false, 78}, 
					{"Alt Fire", "Checkbox", false, 78}, 
					{"Auto Stop", "Checkbox", false, 78}, 
					{"Auto Crouch", "Checkbox", false, 78}, 
					{"Target Lock", "Checkbox", false, 78}, 
                }, 
				{
					{"Legitbot", 16, 260, 347, 275, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Aim Key:", "Toggle", 0, 92, 0}, 
					{"Aim FoV Value:", "Slider", 25, 500, 92}, 
					{"Aim Smoothness:", "Slider", 5, 50, 92}, 
					{"Silent (For Anti-Aim)", "Checkbox", false, 78}, 
					{"Auto Fire", "Checkbox", false, 78}, 
					{"Alt Fire", "Checkbox", false, 78}, 
					{"Auto Stop", "Checkbox", false, 78}, 
					{"Auto Crouch", "Checkbox", false, 78}, 
					{"Target Lock", "Checkbox", false, 78}, 
                }, 
				{
					{"Aim Priorities", 376, 20, 347, 610, 218}, 
					{"Priority Targets Only", "Checkbox", false, 78}, 
					{"Projectile Prediction", "Checkbox", false, 78}, 
					{"Disable in Noclip", "Checkbox", false, 78}, 
					{"Hitbox:", "Selection", "Head", {"Head", "Body"}, 92}, 
					{"Aim Priority:", "Selection", "Crosshair", {"Crosshair", "Distance", "Health", "Random"}, 92}, 
					{"Players:", "Checkbox", true, 78}, -- Enabled by default
					{"Bots:", "Checkbox", false, 78}, 
					{"NPCs:", "Checkbox", false, 78}, 
					{"Team:", "Checkbox", true, 78}, -- Enabled by default
					{"Enemies:", "Checkbox", true, 78}, -- Enabled by default
					{"Friends:", "Checkbox", false, 78}, 
					{"Admins:", "Checkbox", false, 78}, 
					{"Spectators:", "Checkbox", false, 78}, 
					{"Frozen Players:", "Checkbox", false, 78}, 
					{"Noclipping Players:", "Checkbox", false, 78}, 
					{"Driving Players:", "Checkbox", false, 78}, 
					{"Transparent Players:", "Checkbox", false, 78}, 
					{"Overhealed Players:", "Checkbox", false, 78}, 
					{"Max Player Health:", "Slider", 500, 5000, 92}, 
					{"Distance Limit", "Checkbox", false, 78}, 
					{"Distance:", "Slider", 200, 5000, 92}, 
					{"Velocity Limit", "Checkbox", false, 78}, 
					{"Velocity:", "Slider", 1000, 5000, 92}, 
                }, 
				{
					{"Miscellaneous", 736, 20, 347, 309, 218}, 
					{"No Recoil", "Checkbox", false, 78}, 
					{"No Spread", "Checkbox", false, 78}, 
					{"Rapid Fire", "Checkbox", false, 78}, 
					{"Rapid Alt Fire", "Checkbox", false, 78}, 
					{"Line of Sight Check", "Checkbox", true, 78}, -- Enabled by default
					{"Auto Wallbang", "Checkbox", false, 78}, 
					{"No Lerp", "Checkbox", false, 78}, 
					{"Bullet Time", "Checkbox", false, 78}, 
					{"Fire Delay:", "Slider", 0, 100, 92}, 
					{"Auto Reload", "Checkbox", false, 78}, 
                	{"Auto Reload at:", "Slider", 0, 99, 92}, 
                }, 
        }, 
		["Triggerbot"] = {
				{
					{"Triggerbot", 16, 20, 347, 210, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Trigger Key:", "Toggle", 0, 92, 0}, 
					{"Smooth Aim", "Checkbox", false, 78}, 
					{"Alt Fire", "Checkbox", false, 78}, 
					{"Auto Stop", "Checkbox", false, 78}, 
					{"Auto Crouch", "Checkbox", false, 78}, 
					{"Fire Delay:", "Slider", 0, 100, 92}, 
                }, 
				{
					{"Aim Priorities", 736, 20, 347, 560, 218}, 
					{"Priority Targets Only", "Checkbox", false, 78}, 
					{"Disable in Noclip", "Checkbox", false, 78}, 
					{"Hitbox:", "Selection", "Body", {"Head", "Body"}, 92}, 
					{"Players:", "Checkbox", true, 78}, -- Enabled by default
					{"Bots:", "Checkbox", false, 78}, 
					{"NPCs:", "Checkbox", false, 78}, 
					{"Team:", "Checkbox", true, 78}, -- Enabled by default
					{"Enemies:", "Checkbox", true, 78}, -- Enabled by default
					{"Friends:", "Checkbox", false, 78}, 
					{"Admins:", "Checkbox", false, 78}, 
					{"Spectators:", "Checkbox", false, 78}, 
					{"Frozen Players:", "Checkbox", false, 78}, 
					{"Noclipping Players:", "Checkbox", false, 78}, 
					{"Driving Players:", "Checkbox", false, 78}, 
					{"Transparent Players:", "Checkbox", false, 78}, 
					{"Overhealed Players:", "Checkbox", false, 78}, 
					{"Max Player Health:", "Slider", 500, 5000, 92}, 
					{"Distance Limit", "Checkbox", false, 78}, 
					{"Distance:", "Slider", 200, 5000, 92}, 
					{"Velocity Limit", "Checkbox", false, 78}, 
					{"Velocity:", "Slider", 1000, 5000, 92}, 
                }, 
		}, 
		["Hack vs. Hack"] = {
				{
					{"Anti-Aim", 16, 20, 347, 385, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Disable in Noclip", "Checkbox", true, 78}, -- Enabled by default
					{"Disable in 'Use' Toggle", "Checkbox", true, 78}, -- Enabled by default
					{"Wall Detect", "Checkbox", false, 78}, 
					{"View Lock", "Checkbox", false, 78}, 
					{"Static", "Checkbox", false, 78}, 
					{"Adaptive", "Checkbox", false, 78}, 
					{"X-Axis:", "Selection", "Off", {"Off", "Down", "Up", "Center", "Fake-Down", "Fake-Up", "Jitter", "Semi-Jitter Down", "Semi-Jitter Up", "Emotion", "Spinbot"}, 92}, 
					{"Y-Axis:", "Selection", "Off", {"Off", "Forwards", "Backwards", "Sideways", "Fake-Forwards", "Fake-Backwards", "Fake-Sideways", "Jitter", "Backwards Jitter", "Sideways Jitter", "Semi-Jitter", "Back Semi-Jitter", "Side Semi-Jitter", "Side Switch", "Emotion", "Spinbot"}, 92}, 
					{"Anti-Aim Direction:", "Selection", "Left", {"Left", "Right", "Manual Switch"}, 92}, 
					{"Switch Key:", "Toggle", 0, 92, 0}, 
					{"Spinbot Speed:", "Slider", 0, 180, 92}, 
					{"Emotion X-Axis:", "Slider", 0, 100, 92}, 
					{"Emotion Y-Axis:", "Slider", 0, 100, 92}, 
                }, 
				{
					{"Resolver", 736, 20, 347, 150, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Priority Targets Only", "Checkbox", false, 78}, 
					{"X-Axis:", "Selection", "Off", {"Off", "Down", "Up", "Center", "Invert", "Random", "Auto"}, 92}, 
					{"Y-Axis:", "Selection", "Off", {"Off", "Left", "Right", "Invert", "Random", "Auto"}, 92}, 
					{"Emote Resolver", "Checkbox", false, 78}, 
                }, 
				{
					{"Fake Lag", 736, 184, 347, 109, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Disable on Attack", "Checkbox", false, 78}, 
					{"Lag Factor:", "Slider", 0, 14, 92}, 
                }, 
		}, 
        ["Visuals"] = {
                {
					{"Wallhack", 16, 20, 347, 570, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Visibility:", "Selection", "Global", {"Global", "Clientside"}, 92}, 
					{"Box:", "Selection", "Off", {"Off", "2D Box", "3D Box", "Edged Box"}, 92}, 
					{"Chams:", "Selection", "Off", {"Off", "Normal", "Playermodel"}, 92}, 
					{"Skeleton", "Checkbox", false, 78}, 
					{"Glow", "Checkbox", false, 78}, 
					{"Hitbox", "Checkbox", false, 78}, 
					{"Vision Line", "Checkbox", false, 78}, 
					{"Name", "Checkbox", false, 78}, 
					{"Bystander Name", "Checkbox", false, 78}, 
					{"Health Bar", "Checkbox", false, 78}, 
					{"Health Value", "Checkbox", false, 78}, 
					{"Armor Bar", "Checkbox", false, 78}, 
					{"Armor Value", "Checkbox", false, 78}, 
					{"Weapon", "Checkbox", false, 78}, 
					{"Rank", "Checkbox", false, 78}, 
					{"Distance", "Checkbox", false, 78}, 
					{"Velocity", "Checkbox", false, 78}, 
					{"Conditions", "Checkbox", false, 78}, 
					{"Steam ID", "Checkbox", false, 78}, 
					{"Ping", "Checkbox", false, 78}, 
					{"DarkRP Money", "Checkbox", false, 78}, 
                }, 
                {
					{"Miscellaneous", 736, 20, 347, 585, 218}, 
					{"Priority Targets Only", "Checkbox", false, 78}, 
					{"Hide Ignored Targets", "Checkbox", false, 78}, 
					{"Show Enemies Only", "Checkbox", false, 78}, 
					{"Show Spectators", "Checkbox", false, 78}, 
					{"Team Colors", "Checkbox", false, 78}, 
					{"Spectators Box", "Checkbox", true, 78}, -- Enabled by default
					{"Radar Box", "Checkbox", true, 78}, -- Enabled by default
					{"Radar Distance:", "Slider", 25, 100, 92}, 
					{"Custom Status", "Checkbox", true, 78}, -- Enabled by default
					{"Players List", "Checkbox", true, 78}, -- Enabled by default
					{"Show NPCs", "Checkbox", false, 78}, 
					{"Show Entities", "Checkbox", false, 78}, 
					{"Hide HUD", "Checkbox", false, 78}, 
					{"Witness Finder", "Checkbox", false, 78}, 
					{"Traitor Finder", "Checkbox", false, 78}, 
					{"Murderer Finder", "Checkbox", false, 78}, 
					{"Dormant Check:", "Selection", "All", {"None", "Players", "Entities", "All"}, 92}, 
					{"Show FoV Circle", "Checkbox", false, 78}, 
					{"Snap Lines", "Checkbox", false, 78}, 
					{"Crosshair:", "Selection", "Off", {"Off", "Box", "Dot", "Square", "Circle", "Cross", "Edged Cross", "Swastika", "GTA IV"}, 92}, 
					{"Distance Limit", "Checkbox", false, 78}, 
					{"Distance:", "Slider", 0, 5000, 92}, 
                }, 
        }, 
		["Miscellaneous"] = {
				{
					{"Miscellaneous", 16, 20, 347, 150, 218}, 
					{"Flash Spam", "Checkbox", false, 78}, 
					{"Use Spam", "Checkbox", false, 78}, 
					{"Name Stealer:", "Selection", "Off", {"Off", "Normal", "Priority Targets", "DarkRP Name"}, 92}, 
					{"Emotes:", "Selection", "Off", {"Off", "Dance", "Sexy", "Wave", "Robot", "Bow", "Cheer", "Laugh", "Zombie", "Agree", "Disagree", "Forward", "Back", "Salute", "Pose", "Halt", "Group", "Random"}, 92}, 
					{"Murder Taunts:", "Selection", "Off", {"Off", "Funny", "Help", "Scream", "Morose", "Random"}, 92}, 
                }, 
				{
					{"Priority List", 16, 183, 347, 83, 218}, 
					{"Enabled", "Checkbox", true, 78}, -- Enabled by default
					{"List Spacing:", "Slider", 0, 10, 92}, 
                }, 
				{
					{"Sounds", 16, 280, 347, 95, 218}, 
					{"Music Player:", "Selection", "Off", {"Off", "Rust", "Resonance", "Daisuke", "A Burning M...", "Libet's Delay", "Lullaby Of T...", "Erectin' a River", "Fleeting Love", "Malo Tebya", "Vermilion", "Gravity", "Remorse", "Hold", "Green Valleys", "FP3", "Random"}, 92}, 
					{"Reset Sounds", "Checkbox", false, 78}, 
					{"Hitsounds", "Checkbox", false, 78}, 
                }, 
				{
					{"Textures", 16, 390, 347, 120, 218}, 
					{"Transparent Walls", "Checkbox", false, 78}, 
					{"No Sky", "Checkbox", false, 78}, 
					{"Bright Mode", "Checkbox", false, 78}, 
					{"Dark Mode", "Checkbox", false, 78}, 
                }, 
				{
                	{"Point of View", 376, 20, 347, 150, 218}, 
					{"Custom FoV", "Checkbox", false, 78}, 
					{"FoV Range:", "Slider", 110, 360, 92}, 
					{"Thirdperson", "Checkbox", false, 78}, 
					{"Thirdperson Range:", "Slider", 15, 100, 92}, 
					{"Mirror", "Checkbox", false, 78}, 			
                }, 
				{
					{"Viewmodel", 376, 183, 347, 120, 218}, 
					{"Viewmodel Chams:", "Selection", "Off", {"Off", "Normal", "Rainbow"}, 92}, 
					{"Viewmodel Wireframe:", "Selection", "Off", {"Off", "Normal", "Rainbow"}, 92}, 
					{"No Viewmodel", "Checkbox", false, 78}, 
					{"No Hands", "Checkbox", false, 78}, 
                }, 
				{
					{"Free Roaming", 376, 317, 347, 105, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Free Roaming Key:", "Toggle", 0, 92, 0}, 
					{"Free Roaming Speed:", "Slider", 30, 100, 92}, 
                }, 
				{
					{"Movement", 736, 20, 347, 172, 218}, 
					{"Bunny Hop", "Checkbox", false, 78}, 
					{"Auto Strafe:", "Selection", "Off", {"Off", "Legit", "Rage", "Circle", "Directional"}, 92}, -- Directional strafing is a 'work-in-progress'
					{"Strafe Key:", "Toggle", 0, 92, 0}, 
					{"Strafe Speed:", "Slider", 2, 6, 92}, 
					{"Air Crouch", "Checkbox", false, 78}, 
					{"Fake Crouch", "Checkbox", false, 78}, 
                }, 
				{
                	{"Chat", 736, 205, 347, 150, 218}, 
					{"Log Kills in Chat", "Checkbox", false, 78}, 
					{"Priority Targets Only", "Checkbox", false, 78}, 
					{"Chat Spam:", "Selection", "Off", {"Off", "Advertising 1", "Advertising 2", "Advertising 3", "Nazi 1", "Nazi 2", "Nazi 3", "Arabic Spam", "Hebrew Spam", "Offensive Spam", "Insult Spam", "Message Spam", "N-Word Spam", "N-WORD SPAM", "'H' Spam", "Clear Chat", "OOC Clear Chat"}, 92}, 
					{"Kill Spam:", "Selection", "Off", {"Off", "Normal", "Insult", "Salty", "HvH", "IdiotBox HvH", "Votekick", "Voteban", "Killstreak", }, 92}, 
					{"Reply Spam:", "Selection", "Off", {"Off", "shut up", "ok", "who", "nobody cares", "where", "stop spamming", "what", "yea", "lol", "english please", "lmao", "shit", "fuck", "Random", "Disconnect Spam", "Cheater Callout", "Copy Messages"}, 92}, 
                }, 
        }, 
		["Settings"] = {
				{
          			{"Main Text Color", 60, 20, 250, 105, 100}, 
          			{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 205, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
          		}, 
				{
					{"Menu Text Color", 321, 20, 205, 105, 70}, 
					{"Red:", "Slider", 255, 255, 88}, 
					{"Green:", "Slider", 255, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
				}, 
				{
          			{"Background Menu Color", 535, 20, 245, 105, 100}, 
          			{"Red:", "Slider", 30, 255, 88}, 
					{"Green:", "Slider", 30, 255, 88}, 
					{"Blue:", "Slider", 45, 255, 88}, 
          		}, 
				{
					{"Border Color", 790, 20, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 155, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Team Visuals Color", 60, 140, 250, 105, 100}, 
					{"Red:", "Slider", 255, 255, 88}, 
					{"Green:", "Slider", 255, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Enemy Visuals Color", 321, 140, 205, 105, 70}, 
					{"Red:", "Slider", 255, 255, 75}, 
					{"Green:", "Slider", 255, 255, 75}, 
					{"Blue:", "Slider", 255, 255, 75}, 
                }, 
				{
					{"Friend Visuals Color", 535, 140, 245, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 255, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Entities Visuals Color", 790, 140, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 255, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Misc Visuals Color", 60, 260, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 75}, 
					{"Green:", "Slider", 255, 255, 75}, 
					{"Blue:", "Slider", 255, 255, 75}, 
                }, 
				{
					{"Team Chams Color", 321, 260, 205, 105, 70}, 
					{"Red:", "Slider", 0, 255, 75}, 
					{"Green:", "Slider", 255, 255, 75}, 
					{"Blue:", "Slider", 255, 255, 75}, 
                }, 
				{
					{"Enemy Chams Color", 535, 260, 245, 105, 100}, 
					{"Red:", "Slider", 0, 255, 75}, 
					{"Green:", "Slider", 255, 255, 75}, 
					{"Blue:", "Slider", 255, 255, 75}, 
                }, 
				{
					{"Crosshair Color", 790, 260, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 235, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Viewmodel Color", 60, 380, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 235, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Others", 321, 380, 205, 157, 70}, 
					{"T Opacity:", "Slider", 255, 255, 88}, 
					{"B Opacity:", "Slider", 255, 255, 88}, 
					{"BG Opacity:", "Slider", 255, 255, 88}, 
					{"BG Darkness:", "Slider", 22, 25, 88}, 
					{"Roundness:", "Slider", 57, 67, 88}, 
                }, 
				{
					{"Window Positions", 535, 380, 245, 157, 88}, 
					{"Spectators X:", "Slider", 12, 2000, 121}, 
					{"Spectators Y:", "Slider", 12, 2000, 121}, 
					{"Radar X:", "Slider", 225, 2000, 121}, 
					{"Radar Y:", "Slider", 12, 2000, 121}, 
					{"Roundness:", "Slider", 16, 42, 121}, 
                }, 
				{
					{"List Positions", 790, 380, 250, 157, 88}, 
					{"Custom Status X:", "Slider", 17, 2000, 121}, 
					{"Custom Status Y:", "Slider", 250, 2000, 121}, 
					{"Players List X:", "Slider", 17, 2000, 121}, 
					{"Players List Y:", "Slider", 430, 2000, 121}, 
					{"Roundness:", "Slider", 8, 10, 121}, 
                }, 
        }, 
}

local order = {
	"Main Menu", 
	"Aimbot", 
	"Triggerbot", 
	"Hack vs. Hack", 
	"Visuals", 
	"Miscellaneous", 
	"Settings", 
}

local function gBool(men, sub, lookup)
	if (not options[men]) then return end
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if (aaa[1][1] ~= sub) then continue end
			if (val[1] == lookup) then
				return val[3]
			end
		end
	end
end

local function gOption(men, sub, lookup)
	if (not options[men]) then return "" end
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if (aaa[1][1] ~= sub) then continue end
			if (val[1] == lookup) then
				return val[3]
			end
		end
	end
	return ""
end

local function gInt(men, sub, lookup)
	if (not options[men]) then return 0 end
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if (aaa[1][1] ~= sub) then continue end
			if (val[1] == lookup) then
				return val[3]
			end
		end
	end
	return 0
end

local function gKey(men, sub, lookup)
    if (not options[men]) then return end
	if LocalPlayer():IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible() or (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
    for aa, aaa in next, options[men] do
        for key, val in next, aaa do
            if(aaa[1][1] ~= sub) then continue end
             if(val[1] == lookup) then
				if input.IsKeyDown(val[3]) || input.IsMouseDown(val[3]) || val[3] == 0 then
					return true
				else
					return false
				end
			end
		end
	end
end

local maintextcol, menutextcol, bgmenucol, bordercol, teamvisualscol, enemyvisualscol, friendvisualscol, entitiesvisualscol, miscvisualscol, teamchamscol, enemychamscol, crosshaircol, viewmodelcol = Color(0, 205, 255), Color(255, 255, 255), Color(30, 30, 45), Color(0, 155, 255), Color(255, 255, 255), Color(255, 255, 255), Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255), Color(0, 235, 255), Color(0, 235, 255)

local windowopen = false

local function MsgG(time, text)
	if not windowopen then
		windowopen = true
		local window = vgui.Create("DFrame")
		window:SetPos(ScrW() / 2.7, 0)
		window:SetSize(500, 25)
		window:SlideDown(0.3)
		window:SetTitle("")
		window:ShowCloseButton(false)
		window:SetDraggable(false)
		window.Paint = function(s, w, h)
			surface.SetDrawColor(bgmenucol.r, bgmenucol.g, bgmenucol.b, 240)
			surface.DrawRect(0, 0, w, h)
			draw.DrawText(text, "MenuFont", w / 2, 6, Color(0, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		timer.Simple(time, function()
			if windowopen then
				window:SlideUp(0.3)
				timer.Simple(0.3, function()
					windowopen = false
					window:Remove()
				end)
			end
		end)
	end
	print("\n"..text.."\n")
end

local function MsgY(time, text)
	if not windowopen then
		windowopen = true
		local window = vgui.Create("DFrame")
		window:SetPos(ScrW() / 2.7, 0)
		window:SetSize(500, 25)
		window:SlideDown(0.3)
		window:SetTitle("")
		window:ShowCloseButton(false)
		window:SetDraggable(false)
		window.Paint = function(s, w, h)
			surface.SetDrawColor(bgmenucol.r, bgmenucol.g, bgmenucol.b, 240)
			surface.DrawRect(0, 0, w, h)
			draw.DrawText(text, "MenuFont", w / 2, 6, Color(255, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		timer.Simple(time, function()
			if windowopen then
				window:SlideUp(0.3)
				timer.Simple(0.3, function()
					windowopen = false
					window:Remove()
				end)
			end
		end)
	end
	print("\n"..text.."\n")
end

local function MsgR(time, text)
	if not windowopen then
		windowopen = true
		local window = vgui.Create("DFrame")
		window:SetPos(ScrW() / 2.7, 0)
		window:SetSize(500, 25)
		window:SlideDown(0.3)
		window:SetTitle("")
		window:ShowCloseButton(false)
		window:SetDraggable(false)
		window.Paint = function(s, w, h)
			surface.SetDrawColor(bgmenucol.r, bgmenucol.g, bgmenucol.b, 240)
			surface.DrawRect(0, 0, w, h)
			draw.DrawText(text, "MenuFont", w / 2, 6, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		timer.Simple(time, function()
			if windowopen then
				window:SlideUp(0.3)
				timer.Simple(0.3, function()
					windowopen = false
					window:Remove()
				end)
			end
		end)
	end
	print("\n"..text.."\n")
end

if gui.IsGameUIVisible() then
	gui.HideGameUI()
end

MsgY(1.4, "Initializing script...")
surface.PlaySound("buttons/bell1.wav")

timer.Simple(2, function()

local idiot	= (_G)

local IdiotBox = {}

local me = LocalPlayer()

local optimized = false

local applied = false

local em = FindMetaTable("Entity")

local pm = FindMetaTable("Player")

local cm = FindMetaTable("CUserCmd")

local wm = FindMetaTable("Weapon")

local am = FindMetaTable("Angle")

local vm = FindMetaTable("Vector")

local im =  FindMetaTable("IMaterial")

do
	if (idiot.game.SinglePlayer()) then
		MsgR(4.3, "Attention! Not going to load in Singleplayer Mode!") 
		surface.PlaySound("buttons/lightswitch2.wav")
		return
	end
	if not file.Exists("lua/bin/gmcl_bsendpacket_win32.dll", "MOD") or not file.Exists("lua/bin/gmcl_fhook_win32.dll", "MOD") or not file.Exists("lua/bin/gmcl_ChatClear_win32.dll", "MOD") or not file.Exists("lua/bin/gmcl_dickwrap_win32.dll", "MOD") then
			MsgR(4.3, "Please download the modules before using IdiotBox.")
			surface.PlaySound("buttons/lightswitch2.wav")
			return
		end
	if (idiot.Loaded) then
		MsgR(4.3, "Already initialized the cheat. Reloading it will cause major module bugs!")
		surface.PlaySound("buttons/lightswitch2.wav")
		return
	end
	if unloaded == true then
		MsgR(4.3, "You unloaded the cheat. Reloading it will cause major module bugs!")
		surface.PlaySound("buttons/lightswitch2.wav")
		return
	end
	idiot.Loaded = true
end

require("bsendpacket")
require("fhook")
require("ChatClear")
require("dickwrap")
require("big")

gameevent.Listen("entity_killed")
gameevent.Listen("player_disconnect")
gameevent.Listen("player_hurt")

bSendPacket = true
unloaded = false

IdiotBox.ChangeName = _fhook_changename
IdiotBox.Predict = dickwrap.Predict

idiot._fhook_changename = nil
idiot.dickwrap.Predict = nil

idiot.TickCount = 0

local creator = creator or {}

local devs = devs or {}

creator["STEAM_0:0:63644275"] = {}
creator["STEAM_0:0:162667998"] = {}
devs["STEAM_0:1:188710062"] = {}
devs["STEAM_0:1:191270548"] = {}
devs["STEAM_0:1:453825881"] = {}
devs["STEAM_0:1:101813068"] = {}
devs["STEAM_0:1:193781969"] = {}
devs["STEAM_0:0:109145007"] = {}
devs["STEAM_0:1:105547939"] = {}
devs["STEAM_0:1:404757"] = {}
devs["STEAM_0:1:4375194"] = {}
devs["STEAM_0:1:69536635"] = {}
devs["STEAM_0:0:205376238"] = {}
devs["STEAM_0:0:150101893"] = {}
devs["STEAM_0:0:212565516"] = {}
devs["STEAM_0:1:75441355"] = {}
devs["STEAM_0:1:59798110"] = {}
devs["STEAM_0:1:126050820"] = {}

--NOTE-- I want to mention that these are not the only people that helped me with the development of IdiotBox, but they are the ones who helped me the most and that is why they are credited here.

local function UpdateVar(men, sub, lookup, new)
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if (aaa[1][1] ~= sub) then continue end
				if (val[1] == lookup) then
				val[3] = new
			end
		end
	end
end

local folder = "IdiotBox"
local version = "6.8.b2"

if not file.IsDir(folder, "DATA") then
	file.CreateDir(folder)
end

local drawn_ents = {}

local priority_list = {}

local ignore_list = {}

if file.Exists(folder.."/entities.txt", "DATA") then
	drawn_ents = util.JSONToTable(file.Read(folder.."/entities.txt", "DATA"))
		else
	drawn_ents = {"spawned_money", "spawned_shipment", "spawned_weapon", "money_printer", "weapon_ttt_knife", "weapon_ttt_c4", "npc_tripmine"}
end

if file.Exists(folder.."/priority.txt", "DATA") then
	priority_list = util.JSONToTable(file.Read(folder.."/priority.txt", "DATA"))
else
	file.Write(folder.."/priority.txt", "[]")
end
	
if file.Exists(folder.."/ignored.txt", "DATA") then
	ignore_list = util.JSONToTable(file.Read(folder.."/ignored.txt", "DATA"))
else
	file.Write(folder.."/ignored.txt", "[]")
end

local function SaveConfig1()
	file.Write(folder.."/config1.txt", util.TableToJSON(options))
end

local function SaveConfig2()
	file.Write(folder.."/config2.txt", util.TableToJSON(options))
end

local function SaveConfig3()
	file.Write(folder.."/config3.txt", util.TableToJSON(options))
end

local function SaveConfig4()
	file.Write(folder.."/config4.txt", util.TableToJSON(options))
end

local function SaveConfig5()
	file.Write(folder.."/config5.txt", util.TableToJSON(options))
end

local function LoadConfig1()
	if file.Exists(folder.."/config1.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config1.txt", "DATA"))
	local cursub
		for k, v in next, tab do
			if (not options[k]) then continue end
			for men, subtab in next, v do
				for key, val in next, subtab do
					if (key == 1) then cursub = val[1] continue end
					UpdateVar(k, cursub, val[1], val[3])
				end
			end
		end
	end
end

local function LoadConfig2()
	if file.Exists(folder.."/config2.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config2.txt", "DATA"))
	local cursub
		for k, v in next, tab do
			if (not options[k]) then continue end
			for men, subtab in next, v do
				for key, val in next, subtab do
					if (key == 1) then cursub = val[1] continue end
					UpdateVar(k, cursub, val[1], val[3])
				end
			end
		end
	end
end

local function LoadConfig3()
	if file.Exists(folder.."/config3.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config3.txt", "DATA"))
	local cursub
		for k, v in next, tab do
			if (not options[k]) then continue end
			for men, subtab in next, v do
				for key, val in next, subtab do
					if (key == 1) then cursub = val[1] continue end
					UpdateVar(k, cursub, val[1], val[3])
				end
			end
		end
	end
end

local function LoadConfig4()
	if file.Exists(folder.."/config4.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config4.txt", "DATA"))
	local cursub
		for k, v in next, tab do
			if (not options[k]) then continue end
			for men, subtab in next, v do
				for key, val in next, subtab do
					if (key == 1) then cursub = val[1] continue end
					UpdateVar(k, cursub, val[1], val[3])
				end
			end
		end
	end
end

local function LoadConfig5()
	if file.Exists(folder.."/config5.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config5.txt", "DATA"))
	local cursub
		for k, v in next, tab do
			if (not options[k]) then continue end
			for men, subtab in next, v do
				for key, val in next, subtab do
					if (key == 1) then cursub = val[1] continue end
					UpdateVar(k, cursub, val[1], val[3])
				end
			end
		end
	end
end

local menukeydown, menukeydown2, menuopen

local mousedown

local candoslider

local drawlast

local visible = {}

for k, v in next, order do
	visible[v] = false
end

local function DrawUpperText(w, h)
	surface.SetFont("MenuFont")
	local tw, th = surface.GetTextSize("")
	surface.SetTextPos(503, 15 - th / 2)
	surface.SetTextColor(maintextcol.r, maintextcol.g, maintextcol.b, 255)
	surface.SetFont("MainFont")
	surface.DrawText("IdiotBox v6.8.b2")
	surface.SetTextPos(613, 18 - th / 2)
	surface.SetTextColor(maintextcol.r, maintextcol.g - 50, maintextcol.b - 25, 175)
	surface.SetFont("MainFont2")
	surface.DrawText("Latest build: August 26th 2022")
	surface.SetFont("MenuFont")
	surface.DrawRect(0, 31, 0, h - 31)
	surface.DrawRect(0, h - 0, w, h)
	surface.DrawRect(w - 0, 31, 0, h)
	surface.SetTextColor(maintextcol.r, maintextcol.g, maintextcol.b, 255)
	surface.SetTextPos(950, 15 - th / 2)
	surface.DrawText("Created by Phizz & more")
	surface.SetTextColor(maintextcol.r, maintextcol.g, maintextcol.b, 255)
	surface.SetTextPos(40, 15 - th / 2)
	surface.DrawText("Custom Name: ")
	surface.SetTextColor(HSVToColor(RealTime() * 45 % 360, 1, 1))
	surface.DrawText(" "..GetConVarString("idiot_changename"))
end

local function MouseInArea(minx, miny, maxx, maxy)
	local mousex, mousey = gui.MousePos()
	return(mousex < maxx and mousex > minx and mousey < maxy and mousey > miny)
end

local function DrawOptions(self, w, h)
	local mx, my = self:GetPos()
	local sizeper = (w - 10) / #order
	local maxx = 0
	for k, v in next, order do
		local bMouse = MouseInArea(mx + 5 + maxx, my + 31, mx + 5 + maxx + sizeper, my + 31 + 30)
		if (visible[v]) then
			local curcol = Color(bordercol.r, bordercol.g, bordercol.b, 255)
			for i = 0, 0 do
				surface.SetDrawColor(curcol)
				curcol.r, curcol.g, curcol.b = curcol.r + 3, curcol.g + 3, curcol.b + 3
				surface.DrawLine(0.9 + maxx, 60 + i, 0.9 + maxx + sizeper, 60 + i)
			end
			elseif (bMouse) then
			local curcol = Color(bordercol.r, bordercol.g, bordercol.b, 155)
			for i = 0, 0 do
				surface.SetDrawColor(curcol)
				curcol.r, curcol.g, curcol.b = curcol.r + 3, curcol.g + 3, curcol.b + 3
				surface.DrawLine(0.9 + maxx, 60 + i, 0.9 + maxx + sizeper, 60 + i)
			end
		end
		if (bMouse and input.IsMouseDown(MOUSE_LEFT) and not mousedown and not visible[v]) then
			local nb = visible[v]
			for key, val in next, visible do
				visible[key] = false
			end
			visible[v] = not nb
		end
		surface.SetFont("MenuFont")
		surface.SetTextColor(maintextcol.r, maintextcol.g, maintextcol.b, 255)
		local tw, th = surface.GetTextSize(v)
		surface.SetTextPos(5 + maxx + sizeper / 2 - tw / 2, 31 + 15 - th / 2)
		surface.DrawText(v)
		maxx = maxx + sizeper
	end
end

local function DrawCheckbox(self, w, h, var, maxy, posx, posy, dist)
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.SetTextPos(5 + posx + 15 + 5, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 5 + posx + 15 + 5, my + 61 + posy + maxy, mx + 5 + posx + 15 + 5 + dist + 14 + var[4], my + 61 + posy + maxy + 16)
	if bMouse then
		surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:") - 155)
		surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:") - 155)
		if not input.IsMouseDown(MOUSE_LEFT) then
			surface.DrawRect(5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 2, 10, 10)
		end
	end
	surface.DrawText(var[1])
	surface.DrawOutlinedRect(posx + 25 + dist + var[4], 61 + posy + maxy , 13, 13)
	if var[3] then
		surface.SetDrawColor(menutextcol.r - 30, menutextcol.g - 30, menutextcol.b - 30, 100)
		surface.DrawRect(5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 2, 10, 10)
		surface.SetDrawColor(menutextcol.r - 10, menutextcol.g - 10, menutextcol.b - 10, 100)
		surface.DrawOutlinedRect(5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 2, 10, 10)
	end
	if bMouse and input.IsMouseDown(MOUSE_LEFT) and not mousedown and not drawlast then
		var[3] = not var[3]
	end
end

local function DrawSlider(self, w, h, var, maxy, posx, posy, dist)
	local curnum = var[3]
	local max = var[4]
	local size = var[5]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.SetTextPos(5 + posx + 15 + 5, 61 + posy + maxy)
	surface.DrawText(var[1])
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawRect(5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 2)
	local ww = math.ceil(curnum * size / max)
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawRect(3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 9 - 5, 4, 12)
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	local tw, th = surface.GetTextSize(curnum)
	surface.DrawOutlinedRect(3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 4, 4, 12)
	surface.SetTextPos(5 + posx + 15 + 5 + dist + (size / 2) - tw / 2, 61 + posy + maxy + 16)
	surface.DrawText(curnum)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(5 + posx + 15 + 5 + dist + mx, 61 + posy + maxy + 9 - 5 + my, 5 + posx + 15 + 5 + dist + mx + size, 61 + posy + maxy + 9 - 5 + my + 12)
	if (bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !candoslider) then
		local mw, mh = gui.MousePos()
		local new = math.ceil(((mw - (mx + posx + 25 + dist - size)) - (size + 1)) / (size - 2) * max)
		var[3] = new
	end
end

local notyetselected

local function DrawSelect(self, w, h, var, maxy, posx, posy, dist)
	local size = var[5]
	local curopt = var[3]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.SetTextPos(5 + posx + 15 + 5, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(var[1])
	surface.DrawText(var[1])
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawOutlinedRect(25 + posx + dist, 61 + posy + maxy, size, 16)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy
	if (bMouse || notyetselected == check) then
		surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, 150)
		surface.DrawRect(25 + posx + dist + 2, 61 + posy + maxy + 2, size - 4, 12)
	end
	local tw, th = surface.GetTextSize(curopt)
	surface.SetTextPos(25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2)
	surface.DrawText(curopt)
	if (bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !mousedown || notyetselected == check) then
		notyetselected = check
		drawlast = function()
			local maxy2 = 16
			for k, v in next, var[4] do
				surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, 50)
				surface.DrawRect(25 + posx + dist, 61 + posy + maxy + maxy2, size, 16)
				local bMouse2 = MouseInArea(mx + 25 + posx + dist, my + 61 + posy + maxy + maxy2, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16 + maxy2)
				if (bMouse2) then
					surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, 100)
					surface.DrawRect(25 + posx + dist, 61 + posy + maxy + maxy2, size, 16)
				end
				if (bMouse2 && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
					var[3] = v
					notyetselected = nil
					drawlast = nil
					return
				end
				local tw, th = surface.GetTextSize(v)
				surface.SetTextPos(25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2 + maxy2)
				surface.DrawText(v)
				maxy2 = maxy2 + 16
			end
			local bbMouse = MouseInArea(mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + maxy2)
			if (!bbMouse && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
				 notyetselected = nil
				 drawlast = nil
				 return
			end
		end
	end
end

local function DrawToggle(self, w, h, var, maxy, posx, posy, dist)
	local text = var[1]
	local size = var[4]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.SetTextPos(5 + posx + 15 + 5, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(text)
	surface.DrawText(var[1])
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawOutlinedRect(25 + posx + dist, 61 + posy + maxy, size, 16)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + 14 + var[4], my + 61 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy
	if bMouse or notyetselected == check then
		surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, 150)
		surface.DrawRect(25 + posx + dist + 2, 61 + posy + maxy + 2, size - 4, 12)
	end
      	if bMouse then
        	if input.IsMouseDown(MOUSE_LEFT) && !drawlast && !mousedown && var[5] ~= 2 || notyetselected == check then
               surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, 150)
               surface.DrawRect(25 + posx + dist + 2, 61 + posy + maxy + 2, var[4] - 4, 12)
               var[5] = 1
            end
            if !input.IsMouseDown(MOUSE_LEFT) then
            	if var[5] == 1 then
					var[5] = 2
            	end
            end
        end
        if var[5] == 2 then
        	if !input.IsKeyDown(KEY_BACKSPACE) && !input.IsKeyDown(KEY_ESCAPE) && !input.IsKeyDown(KEY_CAPSLOCK) && !input.IsKeyDown(KEY_CAPSLOCKTOGGLE) && !input.IsKeyDown(KEY_SCROLLLOCK) && !input.IsKeyDown(KEY_SCROLLLOCKTOGGLE) && !input.IsKeyDown(KEY_NUMLOCK) && !input.IsKeyDown(KEY_NUMLOCKTOGGLE) then
        	for i = 1, 159 do
        		if !input.IsKeyDown(KEY_BACKSPACE) && !input.IsKeyDown(KEY_ESCAPE) && !input.IsKeyDown(KEY_CAPSLOCK) && !input.IsKeyDown(KEY_CAPSLOCKTOGGLE) && !input.IsKeyDown(KEY_SCROLLLOCK) && !input.IsKeyDown(KEY_SCROLLLOCKTOGGLE) && !input.IsKeyDown(KEY_NUMLOCK) && !input.IsKeyDown(KEY_NUMLOCKTOGGLE) then
        			if (input.IsKeyDown(i) || input.IsMouseDown(i)) then
        				var[3] = i
        				var[5] = 0
        			end
        		else
        			var[3] = 0
        			var[5] = 0
        		end
        	end
        	else
        		var[3] = 0
        		var[5] = 0
        	end
        end 
	if var[3] then
		surface.SetTextPos(25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2)
		if var[5] == 0 && input.GetKeyName(var[3]) then
		surface.DrawText(input.GetKeyName(var[3]))
		elseif var[5] == 0 && !input.GetKeyName(var[3]) then
			surface.DrawText("None")
		elseif var[5] ~= 0 then
			surface.DrawText("Press Any Key...")
		end
	end
end

local function Unload()
	RunConsoleCommand("stopsound")
	unloaded = true
	hook.Remove("RenderScene", "Hook0")
	hook.Remove("ShutDown", "Hook1")
	hook.Remove("PostDrawViewModel", "Hook2")
	hook.Remove("PreDrawEffects", "Hook3")
	hook.Remove("HUDShouldDraw", "Hook4")
	hook.Remove("Think", "Hook5")
	hook.Remove("Think", "Hook6")
	hook.Remove("Think", "Hook7")
	hook.Remove("Think", "Hook8")
	hook.Remove("PreDrawSkyBox", "Hook9")
	hook.Remove("PreDrawViewModel", "Hook10")
	hook.Remove("PreDrawPlayerHands", "Hook11")
	hook.Remove("RenderScreenspaceEffects", "Hook12")
	hook.Remove("DrawOverlay", "Hook13")
	hook.Remove("player_hurt", "Hook14")
	hook.Remove("entity_killed", "Hook15")
	hook.Remove("Move", "Hook16")
	hook.Remove("CalcView", "Hook17")
	hook.Remove("AdjustMouseSensitivity", "Hook18")
	hook.Remove("ShouldDrawLocalPlayer", "Hook19")
	hook.Remove("CreateMove", "Hook20")
	hook.Remove("player_disconnect", "Hook21")
	hook.Remove("HUDPaint2", "Hook22")
	hook.Remove("PreDrawOpaqueRenderables", "Hook23")
	hook.Remove("OnPlayerChat", "Hook24")
		if gBool("Main Menu", "Configurations", "Automatically Save") then
			if gOption("Main Menu", "Configurations", "Configuration:") == "Config #1" then
				SaveConfig1()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #2" then
				SaveConfig2()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #3" then
				SaveConfig3()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #4" then
				SaveConfig4()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #5" then
				SaveConfig5()
			end
		end
	me:ConCommand("M9KGasEffect 1 cl_interp 0 cl_interp_ratio 2 cl_updaterate 30")
	bSendPacket = true
	idiot.Loaded = false
	timer.Create("ChatPrint", 0.1, 1, function() MsgG(2.5, "Successfully unloaded the cheat.") end)
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
end

local function Changelog()
	print("===========================================================\n\n")
	print("IdiotBox v6.8.b2 bugfixes (in no particular order)")
	print("")
	print("Total bugfix count: ~50 bugs have been found and fixed in the v6.8.b2 update;")
	print("\n")
	print("- The 'readme.txt' file is finally up-to-date and only contains the important information;")
	print("- Aim Smoothness will automatically disable itself if the Legitbot Silent aim is turned on;")
	print("- Anti-Aim cannot be used with the Legitbot if Silent is turned on to prevent bad angle calculations;")
	print("- Cheat menu/ game menus will no longer be covered by Visuals/ windows/ lists and others;")
	print("- Chams and Playermodel Chams cannot be used at the same time anymore;")
	print("- Reply Spam and Copy Messages cannot be used at the same time anymore to prevent weird function collisions;")
	print("- Show Entities, Traitor Finder and Murderer Finder can only be used if Visuals is turned on;")
	print("- Mirror cannot be used with Visuals to prevent weird rendering;")
	print("- Added missing space between the Custom Status rank and username;")
	print("- Fixed dimension of the Armor Bar not matching the dimension of the Health Bar;")
	print("- Fixed Bunny Hop and Circle strafing breaking the movement when in water;")
	print("- Fixed Entities not using the correct Visuals color;")
	print("- Fixed buttons spamming the 'click' sound when holding them down;")
	print("- Fixed Reply Spam and Copy Messages not ignoring friends;")
	print("- Fixed being unable to fly WAC planes and rotate props or camera angles;")
	print("- Fixed Kill Spam giving script errors when an NPC was killed;")
	print("- Fixed Chat Spam and Kill Spam still using the old IdiotBox Alpha variables;")
	print("- Fixed 3D Box and Hitbox still showing spectators or dead people or breaking certain limitations;")
	print("- Fixed Bunny Hop and Circle strafing breaking Free Roaming;")
	print("- Fixed Hitbox spamming the console with error messages;")
	print("- Fixed Snap Lines still showing when Aimbot is not enabled;")
	print("- Fixed toggle keys activating when browsing game menus/ typing;")
	print("- Fixed Hide Round Report and Panel Remover not working correctly;")
	print("- Fixed poorly placed checkboxes/ sliders/ selections;")
	print("- Fixed Anti-Ads not working correctly;")
	print("- Fixed Anti-Aim Resolver continuing to resolve angles when set to 'Off';")
	print("- Fixed Thirdperson showing in spectator mode;")
	print("- Fixed FoV Circle not showing upon enabling;")
	print("- Fixed skybox changing upon loading;")
	print("- Fixed Anti-Aim breaking the Radar view angles;")
	print("- Fixed Free Roaming not working with Anti-Aim;")
	print("- Fixed Thirdperson, Custom FoV and Free Roaming working when the user is dead;")
	print("- Fixed Fire Delay not working correctly;")
	print("- Fixed Prop Kill giving script errors when toggled;")
	print("- Fixed Anti-Aim X-Axis Jitter, Semi-Jitter Down and Semi-Jitter Up breaking the Anti-Aim Y-Axis;")
	print("- Fixed Triggerbot Smooth Aim slowing your mouse speed;")
	print("- Fixed certain outlines and fonts not having the proper dimensions;")
	print("- Fixed the menu not being large enough for certain outlines;")
	print("- Fixed a Projectile Prediction bug where dying would cause script errors;")
	print("- Fixed No Lerp and Dark Mode not resetting when disabled;")
	print("- Fixed a few minor Aim Priorities bugs from both Aimbot and Triggerbot;")
	print("- Reworked script for slightly better performance;")
	print("- Reworked Anti-Screengrabber from scratch;")
	print("- Reworked old 'file.Read' blocker from scratch;")
	print("- Reworked user visibility of IdiotBox developers on servers;")
	print("- Reorganized certain out-of-place functions and menu options;")
	print("- Renamed certain misspelled or broken functions and menu options;")
	print("- Removed calls and variables that had no use;")
	print("- Removed unusable DarkRP names from the Name Changer;")
	print("- Removed cloned hooks and combined them all into one for better performance;")
	print("- Removed old and unused Fake Lag functions;")
	print("- Removed old and unused message pop-up function;")
	print("- Removed 'aaa' module as 'IdiotBox_alpha1.lua' was replaced by 'IdiotBox_dev.lua' and had no use.")
	print("\n")
	print("IdiotBox v6.8.b2 new features (in no particular order)")
	print("")
	print("Total feature count: ~50 features have been added in the v6.8.b2 update;")
	print("\n")
	print("- Added 'Plugin Loader' to Utilities;")
	print("- Added 'Projectile Prediction' to Aimbot;")
	print("- Added 'Line of Sight Check' to Aimbot;")
	print("- Added 'Emote Resolver' to Resolver;")
	print("- Added 'Panic Mode', 'Distance Limit', 'Velocity Limit' and NPC targeting to Aimbot and Triggerbot;")
	print("- Added 'Priority List' to Miscellaneous;")
	print("- Added 'Cheater Callout' and 'Copy Messages' to Reply Spam;")
	print("- Added 'Border Color', 'Misc Visuals Color' and 'B Opacity' to Settings;")
	print("- Added 'Fake-Forwards/ Backwards/ Sideways', 'Static' and 'Adaptive' to Anti-Aim;")
	print("- Added 'Players List', 'Show Entities' and 'Conditions' to Visuals;")
	print("- Added 'Optimize Game' and TTT/ Murder/ DarkRP specific features to Utilities;")
	print("- Added 'Spectators' to Aim Priorities;")
	print("- Added 'Players' to Aim Priorities;")
	print("- Added 'Free Roaming Key' to Free Roaming;")
	print("- Added 'Free Roaming Speed' to Free Roaming;")
	print("- Added 'Strafe Key' to Movement;")
	print("- Added 'Disconnect Spam', 'lol', 'english please', 'lmao', 'shit' and 'fuck' to Reply Spam;")
	print("- Added 'Arabic Spam' and 'Hebrew Spam' to Chat Spam;")
	print("- Added 'Priority Targets Only' to Priority List;")
	print("- Added 'Use Spam' to Miscellaneous;")
	print("- Added 'Fake Crouch' to Movement;")
	print("- Added 'Enable Spams' to Chat;")
	print("- Added 'Rainbow' viewmodels to Viewmodel;")
	print("- Added 'Random' to Emotes;")
	print("- Added 'Murder Taunts' to Taunting;")
	print("- Added 'Velocity' to Visuals;")
	print("- Added 'Dormant Check' to Visuals;")
	print("- Added 'Legit', 'Rage', 'Circle' and 'Directional' to Auto Strafe;")
	print("- Added 'Show Spectators' to Visuals;")
	print("- Added 'Hide Ignored Targets' to Visuals;")
	print("- Added 'Bystander Name' to Visuals;")
	print("- Added 'NPCs' to Visuals;")
	print("- Added 'Frozen Players' to Aim Priorities;")
	print("- Added 'Enemies' to Aim Priorities;")
	print("- Added 'Clientside' to Visuals;")
	print("- Added custom key binds;")
	print("- Added bordered menu styles;")
	print("- Added sliding menu;")
	print("- Added more music to Sounds;")
	print("- Added custom music player to Sounds;")
	print("- Added solid color to buttons;")
	print("- Added a custom configurations menu;")
	print("- Reworked 'Bunny Hop' from scratch;")
	print("- Reworked 'Auto Strafe' from scratch;")
	print("- Reworked 'Circle' from Auto Strafe;")
	print("- Reworked 'Auto Wallbang' from Aimbot;")
	print("- Reworked 'Ignores' from Aim Priorities;")
	print("- Reworked 'Max Player Health' from Aim Priorities;")
	print("- Reworked 'Resolver' from Hack vs. Hack;")
	print("- Reworked 'Radar', 'Spectators' and 'Status' from Visuals;")
	print("- Reworked 'Free Roaming' from Miscellaneous;")
	print("- Renamed 'Hack vs. Hack' tab;")
	print("- Removed 'Shoutout' from Chat Spam;")
	print("- Removed 'Drop Money' from Chat Spam;")
	print("- Removed 'Screengrab Notifications' from Miscellaneous;")
	print("- Removed useless information from Anti-Aim;")
	print("- Changed the default menu colors, menu size and others;")
	print("- Changed the entity menu;")
	print("- Changed the changelog.")
	print("\n\n===========================================================")
	timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Printed changelog to console!") end)
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
end

local added = {}

local function BadEntities(v)
	if string.find(v:GetClass(), "grav") or string.find(v:GetClass(), "phys") or string.find(v:GetClass(), "class") or string.find(v:GetClass(), "viewmodel") or string.find(v:GetClass(), "worldspawn") or string.find(v:GetClass(), "dynamic") or string.find(v:GetClass(), "beam") or string.find(v:GetClass(), "keys") or string.find(v:GetClass(), "pocket") or string.find(v:GetClass(), "prop_") or string.find(v:GetClass(), "gmod_") or string.find(v:GetClass(), "env_") or string.find(v:GetClass(), "func_") or string.find(v:GetClass(), "manipulate_") then
		return false
	else
		return true
	end
end

local function EntityFinder()
	local finder = vgui.Create("DFrame")
	finder:SetSize(1110, 742)
	finder:Center()
	finder:SetTitle("")
	finder:MakePopup()
	finder:ShowCloseButton(false)
	local ent_list = vgui.Create("DListView", finder)
	ent_list:SetPos(192, 75)
	ent_list:SetSize(300, 500)
	ent_list:SetMultiSelect(false)
	ent_list:AddColumn("Existing entities"):SetFixedWidth(300)
	local draw_list = vgui.Create("DListView", finder)
	draw_list:SetPos(632, 75)
	draw_list:SetSize(300, 500)
	draw_list:SetMultiSelect(false)
	draw_list:AddColumn("Drawn entities"):SetFixedWidth(300)
	local add = vgui.Create("DButton", finder)
	add:SetText(">>")
	add:SetPos(512, 250)
	add:SetSize(100, 30)
	add.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		if ent_list:GetSelectedLine() ~= nil then 
			local ent = ent_list:GetLine(ent_list:GetSelectedLine()):GetValue(1)
			if not table.HasValue(drawn_ents, ent) then 
				table.insert(drawn_ents, ent)
				ent_list:RemoveLine(ent_list:GetSelectedLine())
				draw_list:AddLine(ent)
			end
		end
	end
	local remove = vgui.Create("DButton", finder)
	remove:SetText("<<")
	remove:SetPos(512, 300)
	remove:SetSize(100, 30)
	remove.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		if draw_list:GetSelectedLine() ~= nil then
			local ent = draw_list:GetLine(draw_list:GetSelectedLine()):GetValue(1)
			if table.HasValue(drawn_ents, ent) then 
				for k, v in next, drawn_ents do 
					if v == ent then 
						table.remove(drawn_ents, k) 
					end 
				end
				draw_list:RemoveLine(draw_list:GetSelectedLine())
				ent_list:AddLine(ent)
			end
		end
	end
	local refresh = vgui.Create("DButton", finder)
	refresh:SetText("Refresh")
	refresh:SetPos(512, 350)
	refresh:SetSize(100, 30)
	refresh.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		ent_list:Clear()
		draw_list:Clear()
		for k, v in next, ents.GetAll() do
			if not table.HasValue(added, v:GetClass()) and not table.HasValue(drawn_ents, v:GetClass()) and BadEntities(v) and v:GetClass() ~= "player" then
				ent_list:AddLine(v:GetClass())
			end
		end
		table.sort(added)
		for k, v in next, added do
			ent_list:AddLine(v)
		end
		table.sort(drawn_ents)
		for k, v in next, drawn_ents do
			draw_list:AddLine(v)
		end
	end
	local add_custom = vgui.Create("DTextEntry", finder)
	add_custom:SetPos(712, 600)
	add_custom:SetSize(140, 20)
	add_custom:SetText("")
	local add_custom_button = vgui.Create("DButton", finder)
	add_custom_button:SetText("Add")
	add_custom_button:SetPos(857, 600)
	add_custom_button:SetSize(60, 20)
	add_custom_button.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		local ent = add_custom:GetValue()
		if not table.HasValue(drawn_ents, ent) then 
			table.insert(drawn_ents, ent)
			draw_list:AddLine(ent)
		end
	end
	local find = vgui.Create("DTextEntry", finder)
	find:SetPos(272, 600)
	find:SetSize(140, 20)
	find:SetText("")
	find.OnChange = function()
		if find:GetValue() ~= "" then
			ent_list:Clear()
			for k, v in next, ents.GetAll() do
				if string.find(v:GetClass(), find:GetValue()) and not table.HasValue(added, v:GetClass()) and not table.HasValue(drawn_ents, v:GetClass()) and BadEntities(v) and v:GetClass() ~= "player" then
					ent_list:AddLine(v:GetClass())
				end
			end
		else
			ent_list:Clear()
			for k, v in next, ents.GetAll() do
				if not table.HasValue(added, v:GetClass()) and not table.HasValue(drawn_ents, v:GetClass()) and BadEntities(v) and v:GetClass() ~= "player" then
					ent_list:AddLine(v:GetClass())
				end
			end
			table.sort(added)
			for k, v in next, added do
				ent_list:AddLine(v)
			end
		end
	end
	local find_button = vgui.Create("DButton", finder)
	find_button:SetText("Search")
	find_button:SetPos(417, 600)
	find_button:SetSize(60, 20)
	find_button.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		if find:GetValue() ~= "" then
			ent_list:Clear()
			for k, v in next, ents.GetAll() do
				if not table.HasValue(added, v:GetClass()) and not table.HasValue(drawn_ents, v:GetClass()) and BadEntities(v) and v:GetClass() ~= "player" then
					ent_list:AddLine(v:GetClass())
				end
			end
		end
	end
	finder.Paint = function(self, w, h)
		draw.RoundedBox(gInt("Settings", "Others", "Roundness:"), 0, 0, w, h, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Settings", "Others", "BG Opacity:")))
		DrawUpperText(w, h)
		draw.SimpleText("Search Entity:", "MenuFont", 192, 610, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:")), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText("Add Entity:", "MenuFont", 642, 610, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:")), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	ent_list.Paint = function(self, w, h)
		draw.RoundedBox(15, 0, 0, w, h, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:")))
	end
	draw_list.Paint = function(self, w, h)
		draw.RoundedBox(15, 0, 0, w, h, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:")))
	end
	for k, v in next, ents.GetAll() do
		if not table.HasValue(added, v:GetClass()) and not table.HasValue(drawn_ents, v:GetClass()) and BadEntities(v) and v:GetClass() ~= "player" then
			ent_list:AddLine(v:GetClass())
		end
	end
	table.sort(added)
	for k, v in next, added do
		ent_list:AddLine(v)
	end
	table.sort(drawn_ents)
	for k, v in next, drawn_ents do
		draw_list:AddLine(v)
	end
	finder.Think = function()
		if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menukeydown2 or unloaded == true) then
			finder:SlideUp(0.5)
			timer.Simple(0.5, function()
			finder:Remove()
			file.Write(folder.."/entities.txt", util.TableToJSON(drawn_ents))
			menuopen = false
			candoslider = false
			drawlast = nil
			end)
		end
	end
end

local function PluginLoader()
	local plugin = vgui.Create("DFrame")
	plugin:SetSize(1110, 742)
	plugin:Center()
	plugin:SetTitle("")
	plugin:MakePopup()
	plugin:ShowCloseButton(false)
	local plugin_list = vgui.Create("DListView", plugin)
	plugin_list:SetPos(150, 75)
	plugin_list:SetSize(320, 500)
	plugin_list:SetMultiSelect(false)
	plugin_list:AddColumn("Available files ("..#file.Find("lua/*.lua","GAME", "nameasc")-1 ..")"):SetFixedWidth(320)
	local plugin_load = vgui.Create("DButton", plugin)
	plugin_load:SetText("Load")
	plugin_load:SetPos(500, 75)
	plugin_load:SetSize(100, 30)
	plugin_load.DoClick = function()
		chat.PlaySound()
		if plugin_list:GetSelectedLine() ~= nil then
			surface.PlaySound("buttons/button14.wav")
			MsgY(3, "Loaded "..plugin_list:GetLine(plugin_list:GetSelectedLine()):GetValue(1).." successfully.")
			local d = vgui.Create('DHTML')
			d:SetAllowLua(true)
			return d:ConsoleMessage([[RUNLUA: ]]..file.Read("lua/"..plugin_list:GetLine(plugin_list:GetSelectedLine()):GetValue(1), "GAME"))
		end 
	end
	local plugin_refresh = vgui.Create("DButton", plugin )
	plugin_refresh:SetText("Refresh")
	plugin_refresh:SetPos(500, 115)
	plugin_refresh:SetSize(100, 30)
	plugin_refresh.DoClick = function()
	chat.PlaySound()
	plugin_list:Clear()
		for k, v in pairs(file.Find("lua/*.lua", "GAME", "nameasc")) do 
			plugin_list:AddLine(v)
		end
	end
		for k, v in pairs(file.Find("lua/*.lua", "GAME", "nameasc")) do
			plugin_list:AddLine(v)
		end
	plugin_list.Paint = function(self, w, h)
		draw.RoundedBox(16, 0, 0, w, h, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:")))
	end
	plugin.Paint = function(self, w, h)
		draw.RoundedBox(gInt("Settings", "Others", "Roundness:"), 0, 0, w, h, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Settings", "Others", "BG Opacity:")))
		DrawUpperText(w, h)
	end
	plugin.Think = function()
		if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menukeydown2 or unloaded == true) then
			plugin:SlideUp(0.5)
			timer.Simple(0.5, function()
			plugin:Remove()
			menuopen = false
			candoslider = false
			drawlast = nil
			end)
		end
	end
end

local function DrawButton(self, w, h, var, maxy, posx, posy, dist)
	local text = var[1]
	local size = var[4]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawOutlinedRect(posx - 193 + dist, 61 + posy + maxy, size + 219, 16)
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 75)
	surface.DrawRect(posx - 193 + dist + 2, 61 + posy + maxy + 2, size + 215, 12)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx - 193 + posx + dist, my + 61 + posy + maxy, mx - 193 + posx + dist + size + 219, my + 61 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy
	if bMouse or notyetselected == check then
		surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 180)
		surface.DrawRect(posx - 193 + dist + 2, 61 + posy + maxy + 2, size + 215, 12)
	end
	local tw, th = surface.GetTextSize(text)
	surface.SetTextPos(posx - 193 + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2)
	surface.DrawText(text)
	if bMouse and input.IsMouseDown(MOUSE_LEFT) and not drawlast and not mousedown or notyetselected == check then
		if text == "Unload Cheat" then
			self:Remove()
			Unload()
		elseif text == "Print Changelog" then
			Changelog()
		elseif text == "Save Configuration" then
			if gOption("Main Menu", "Configurations", "Configuration:") == "Config #1" then
				SaveConfig1()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #2" then
				SaveConfig2()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #3" then
				SaveConfig3()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #4" then
				SaveConfig4()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #5" then
				SaveConfig5()
			end
			timer.Create("ChatPrint", 0.1, 1, function() MsgG(2.5, "Configuration Saved!") end)
			timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		elseif text == "Load Configuration" then
			if gOption("Main Menu", "Configurations", "Configuration:") == "Config #1" then
				LoadConfig1()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #2" then
				LoadConfig2()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #3" then
				LoadConfig3()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #4" then
				LoadConfig4()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #5" then
				LoadConfig5()
			end
			timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Configuration Loaded!") end)
			timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		elseif text == "Delete Configuration" then
			if gOption("Main Menu", "Configurations", "Configuration:") == "Config #1" then
				file.Delete(folder.."/config1.txt")
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #2" then
				file.Delete(folder.."/config2.txt")
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #3" then
				file.Delete(folder.."/config3.txt")
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #4" then
				file.Delete(folder.."/config4.txt")
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #5" then
				file.Delete(folder.."/config5.txt")
			end
			timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Configuration Deleted!") end)
			timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		elseif text == "Plugin Loader" then
			self:Remove()
			if gBool("Main Menu", "Configurations", "Automatically Save") then
				if gOption("Main Menu", "Configurations", "Configuration:") == "Config #1" then
					SaveConfig1()
				elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #2" then
					SaveConfig2()
				elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #3" then
					SaveConfig3()
				elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #4" then
					SaveConfig4()
				elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #5" then
					SaveConfig5()
				end
			end
			PluginLoader()
			timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Plugin Menu Loaded!") end)
			timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		elseif text == "Entity Menu" then
				self:Remove()
				if gBool("Main Menu", "Configurations", "Automatically Save") then
					if gOption("Main Menu", "Configurations", "Configuration:") == "Config #1" then
						SaveConfig1()
					elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #2" then
						SaveConfig2()
					elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #3" then
						SaveConfig3()
					elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #4" then
						SaveConfig4()
					elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #5" then
						SaveConfig5()
					end
				end
			EntityFinder()
			timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Entities Menu Loaded!") end)
			timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		end
	end
end

local function DrawSubSub(self, w, h, k, var)
	if gOption("Main Menu", "Menus", "Options Style:") == "Borders" then
	local opt, posx, posy, sizex, sizey, dist = var[1][1], var[1][2], var[1][3], var[1][4], var[1][5], var[1][6]
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "B Opacity:"))
	local startpos = 61 + posy
	surface.SetTextColor(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.SetFont("MenuFont")
	local tw, th = surface.GetTextSize(opt)
	surface.SetDrawColor(bgmenucol.r + 13, bgmenucol.g + 13, bgmenucol.b + 13, gInt("Settings", "Others", "BG Opacity:"));
	surface.DrawRect(5 + posx, startpos, sizex, sizey);
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "B Opacity:"))
	surface.DrawLine(5 + posx, startpos, 5 + posx + 15, startpos)
	surface.SetTextPos(5 + posx + 15 + 5, startpos - th / 2)
	surface.DrawLine(5 + posx + 15 + 5 + tw + 5, startpos, 5 + posx + sizex, startpos)
	surface.DrawLine(5 + posx, startpos, 5 + posx, startpos + sizey)
	surface.DrawLine(5 + posx, startpos + sizey, 5 + posx + sizex, startpos + sizey)
	surface.DrawLine(5 + posx + sizex, startpos, 5 + posx + sizex, startpos + sizey)
	surface.DrawText(opt)
	local maxy = 15
	for k, v in next, var do
		if (k == 1) then continue end
			if (v[2] == "Checkbox") then
				DrawCheckbox(self, w, h, v, maxy, posx, posy, dist)
			elseif (v[2] == "Slider") then
				DrawSlider(self, w, h, v, maxy, posx, posy, dist)
			elseif (v[2] == "Selection") then
				DrawSelect(self, w, h, v, maxy, posx, posy, dist)
			elseif(v[2] == "Toggle") then
				DrawToggle(self, w, h, v, maxy, posx, posy, dist)
			elseif v[2] == "Button" then
				DrawButton(self, w, h, v, maxy, posx, posy, dist)
			end
		maxy = maxy + 25
		end
	elseif gOption("Main Menu", "Menus", "Options Style:") == "Borderless" then
	local opt, posx, posy, sizex, sizey, dist = var[1][1], var[1][2], var[1][3], var[1][4], var[1][5], var[1][6]
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 0)
	local startpos = 61 + posy
	surface.SetTextColor(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "T Opacity:"))
	surface.SetFont("MenuFont")
	local tw, th = surface.GetTextSize(opt)
	surface.SetDrawColor(bgmenucol.r + 13, bgmenucol.g + 13, bgmenucol.b + 13, gInt("Settings", "Others", "BG Opacity:"));
	surface.DrawRect(5 + posx, startpos, sizex, sizey);
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 0)
	surface.DrawLine(5 + posx, startpos, 5 + posx + 15, startpos)
	surface.SetTextPos(5 + posx + 15 + 5, startpos - th / 2)
	surface.DrawLine(5 + posx + 15 + 5 + tw + 5, startpos, 5 + posx + sizex, startpos)
	surface.DrawLine(5 + posx, startpos, 5 + posx, startpos + sizey)
	surface.DrawLine(5 + posx, startpos + sizey, 5 + posx + sizex, startpos + sizey)
	surface.DrawLine(5 + posx + sizex, startpos, 5 + posx + sizex, startpos + sizey)
	surface.DrawText(opt)
	local maxy = 15
	for k, v in next, var do
		if (k == 1) then continue end
			if (v[2] == "Checkbox") then
				DrawCheckbox(self, w, h, v, maxy, posx, posy, dist)
			elseif (v[2] == "Slider") then
				DrawSlider(self, w, h, v, maxy, posx, posy, dist)
			elseif (v[2] == "Selection") then
				DrawSelect(self, w, h, v, maxy, posx, posy, dist)
			elseif(v[2] == "Toggle") then
				DrawToggle(self, w, h, v, maxy, posx, posy, dist)
			elseif v[2] == "Button" then
				DrawButton(self, w, h, v, maxy, posx, posy, dist)
			end
		maxy = maxy + 25
		end
	end
end

local function DrawSub(self, w, h)
	for k, v in next, visible do
		if (!v) then continue end
		for _, var in next, options[k] do
			DrawSubSub(self, w, h, k, var)
		end
	end
end

local function MenuBorder() -- Probably a dumb way of doing this but still
	local frame = vgui.Create("DFrame")
	frame:SetSize(1116, 748)
	frame:Center()
	frame:SlideDown(0.5)
	frame:SetTitle("")
	frame:MakePopup()
	frame:ShowCloseButton(false)
		frame.Paint = function(self, w, h)
			if gOption("Main Menu", "Menus", "Menu Style:") == "Borders" then
				draw.RoundedBox(gInt("Settings", "Others", "Roundness:"), 0, 0, w, h, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "B Opacity:")))
			elseif gOption("Main Menu", "Menus", "Menu Style:") == "Borderless" then
				draw.RoundedBox(gInt("Settings", "Others", "Roundness:"), 0, 0, w, h, Color(bordercol.r, bordercol.g, bordercol.b, 0))
			end
		end
	frame.Think = function()
		if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menukeydown2 or unloaded == true) then
			frame:SlideUp(0.5)
			timer.Simple(0.5, function()
			frame:Remove()
			menuopen = false
			end)
		end
		if unloaded == true then
			frame:Remove()
		end
	end
end

local function CacheColors()
	maintextcol = Color(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"))
	menutextcol = Color(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"))
	bgmenucol = Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"))
	bordercol = Color(gInt("Settings", "Border Color", "Red:"), gInt("Settings", "Border Color", "Green:"), gInt("Settings", "Border Color", "Blue:"))
	teamvisualscol = Color(gInt("Settings", "Team Visuals Color", "Red:"), gInt("Settings", "Team Visuals Color", "Green:"), gInt("Settings", "Team Visuals Color", "Blue:"))
	enemyvisualscol = Color(gInt("Settings", "Enemy Visuals Color", "Red:"), gInt("Settings", "Enemy Visuals Color", "Green:"), gInt("Settings", "Enemy Visuals Color", "Blue:"))
	friendvisualscol = Color(gInt("Settings", "Friend Visuals Color", "Red:"), gInt("Settings", "Friend Visuals Color", "Green:"), gInt("Settings", "Friend Visuals Color", "Blue:"))
	entitiesvisualscol = Color(gInt("Settings", "Entities Visuals Color", "Red:"), gInt("Settings", "Entities Visuals Color", "Green:"), gInt("Settings", "Entities Visuals Color", "Blue:"))
	miscvisualscol = Color(gInt("Settings", "Misc Visuals Color", "Red:"), gInt("Settings", "Misc Visuals Color", "Green:"), gInt("Settings", "Misc Visuals Color", "Blue:"))
	teamchamscol = Color(gInt("Settings", "Team Chams Color", "Red:"), gInt("Settings", "Team Chams Color", "Green:"), gInt("Settings", "Team Chams Color", "Blue:"))
	enemychamscol = Color(gInt("Settings", "Enemy Chams Color", "Red:"), gInt("Settings", "Enemy Chams Color", "Green:"), gInt("Settings", "Enemy Chams Color", "Blue:"))
	crosshaircol = Color(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"))
	viewmodelcol = Color(gInt("Settings", "Viewmodel Color", "Red:"), gInt("Settings", "Viewmodel Color", "Green:"), gInt("Settings", "Viewmodel Color", "Blue:"))
end

local menusongs = {"https://dl.dropbox.com/s/0m22ytfia8qoy4m/Daisuke%20-%20El%20Huervo.mp3?dl=1", "https://dl.dropbox.com/s/0fdgaj0ry8uummf/Rust_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/vsz77wdjqy1xf83/HOME%20-%20Resonance.mp3?dl=1", "https://dl.dropbox.com/s/ovh8xt0nn6wjgjj/The%20Caretaker%20-%20It%27s%20just%20a%20burning%20memory%20%282016%29.mp3?dl=1", "https://dl.dropbox.com/s/8bg55iwowf2jtv8/cuckoid%20-%20ponyinajar.mp3?dl=1", "https://dl.dropbox.com/s/0uly6phlgpoj4ss/1932_George_Olsen_-_Lullaby_Of_The_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/qfl7mu39us5hzn4/Erectin_a_River_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/stkat6jlp4jhpxo/Monrroe_-_Fleeting_Love_%28getmp3.pro%29.mp3?dl=1","https://dl.dropbox.com/s/vhd3il20d8ephb4/DJ_Spizdil_-_malo_tebyaHardstyle_m_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/2vf1lx9cnd5g9pq/Maduk_-_Vermilion_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/wcoo6cov1iatcao/Metrik_-_Gravity_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/8a91zs6woqz9bb4/Scattle_Remorse_REUPLOAD_CHECK_DE_%28getmp3.pro%29.mp3?dl=1","https://dl.dropbox.com/s/bqt4dcjoziezdjk/The_Caretaker_-_Libets_Delay_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/12ztoyw2rc2q0z0/HOME_-_Hold_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/xlk7wuel56bwrr3/T_Sugah_-_Green_Valleys_LAOS_%28getmp3.pro%29.mp3?dl=1",}

local function Menu()
	local frame = vgui.Create("DFrame")
	frame:SetSize(1110, 742)
	frame:Center()
	frame:SlideDown(0.5)
	frame:SetTitle("")
	frame:MakePopup()
	frame:ShowCloseButton(false)
	frame.Paint = function(self, w, h)
		if (candoslider and not mousedown and not drawlast and not input.IsMouseDown(MOUSE_LEFT)) then
			candoslider = false
		end
		draw.RoundedBox(gInt("Settings", "Others", "Roundness:"), 0, 0, w, h, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Settings", "Others", "BG Opacity:")))
		DrawUpperText(w, h)
		DrawOptions(self, w, h)
		DrawSub(self, w, h)
		if (drawlast) then
			drawlast()
			candoslider = true
		end
		mousedown = input.IsMouseDown(MOUSE_LEFT)
	end
	frame.Think = function()
		if (gBool("Miscellaneous", "Sounds", "Reset Sounds")) then
			RunConsoleCommand("stopsound")
		end
		if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menukeydown2 or unloaded == true) then
		if gOption("Miscellaneous", "Sounds", "Music Player:") ~= "Off" then
			if gOption("Miscellaneous", "Sounds", "Music Player:") == "Random" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL(menusongs[math.random(#menusongs)], "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Rust" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/0fdgaj0ry8uummf/Rust_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Resonance" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/vsz77wdjqy1xf83/HOME%20-%20Resonance.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Daisuke" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/0m22ytfia8qoy4m/Daisuke%20-%20El%20Huervo.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "A Burning M..." then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/ovh8xt0nn6wjgjj/The%20Caretaker%20-%20It%27s%20just%20a%20burning%20memory%20%282016%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Libet's Delay" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/bqt4dcjoziezdjk/The_Caretaker_-_Libets_Delay_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Lullaby Of T..." then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/0uly6phlgpoj4ss/1932_George_Olsen_-_Lullaby_Of_The_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Erectin' a River" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/qfl7mu39us5hzn4/Erectin_a_River_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Fleeting Love" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/stkat6jlp4jhpxo/Monrroe_-_Fleeting_Love_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Malo Tebya" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/vhd3il20d8ephb4/DJ_Spizdil_-_malo_tebyaHardstyle_m_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Vermilion" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/2vf1lx9cnd5g9pq/Maduk_-_Vermilion_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Gravity" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/wcoo6cov1iatcao/Metrik_-_Gravity_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Remorse" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/8a91zs6woqz9bb4/Scattle_Remorse_REUPLOAD_CHECK_DE_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Hold" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/12ztoyw2rc2q0z0/HOME_-_Hold_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "Green Valleys" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/xlk7wuel56bwrr3/T_Sugah_-_Green_Valleys_LAOS_%28getmp3.pro%29.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			elseif gOption("Miscellaneous", "Sounds", "Music Player:") == "FP3" then
				RunConsoleCommand("stopsound")
				idiot.sound.PlayURL("https://dl.dropbox.com/s/8bg55iwowf2jtv8/cuckoid%20-%20ponyinajar.mp3?dl=1", "mono", function(station)
				if (idiot.IsValid(station)) then
					station:Play()
					end
				end)
			end
		end
		frame:SlideUp(0.5)
		timer.Simple(0.5, function()
		frame:Remove()
		menuopen = false
		candoslider = false
		drawlast = nil
		end)
		if gBool("Main Menu", "Configurations", "Automatically Save") then
			if gOption("Main Menu", "Configurations", "Configuration:") == "Config #1" then
				SaveConfig1()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #2" then
				SaveConfig2()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #3" then
				SaveConfig3()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #4" then
				SaveConfig4()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #5" then
				SaveConfig5()
				end
			end
		end
		CacheColors()
	end
end

local function FixTools()
	if gBool("Hack vs. Hack", "Anti-Aim", "Enabled") or gBool("Miscellaneous", "Point of View", "Thirdperson") or not me:Alive() or me:Health() < 1 then
		return false
	end
	if me:GetActiveWeapon():IsValid() and (me:GetActiveWeapon():GetClass() == "weapon_physgun" or me:GetActiveWeapon():GetClass() == "gmod_camera") then
		return true
	else
		return false
	end
end

local toggler = 0

local function RapidFire(pCmd)
	if (gBool("Aimbot", "Miscellaneous", "Rapid Fire")) then
	local wep = pm.GetActiveWeapon(me)
		if pm.KeyDown(me, IN_ATTACK) then
			if (me:Alive() or em.Health(me) > 0) then
				if not FixTools() then
					if toggler == 0 then
						cm.SetButtons(pCmd, bit.bor(cm.GetButtons(pCmd), IN_ATTACK))
						toggler = 1
					else
						cm.SetButtons(pCmd, bit.band(cm.GetButtons(pCmd), bit.bnot(IN_ATTACK)))
						toggler = 0
					end
				end
			end
		end
	end
end

toggler = 0

local function RapidAltFire(pCmd)
	if (gBool("Aimbot", "Miscellaneous", "Rapid Alt Fire")) then
	local wep = pm.GetActiveWeapon(me)
		if pm.KeyDown(me, IN_ATTACK) then
			if (me:Alive() or em.Health(me) > 0) then
				if not FixTools() then
					if toggler == 0 then
						cm.SetButtons(pCmd, bit.bor(cm.GetButtons(pCmd), IN_ATTACK2))
						toggler = 1
					else
						cm.SetButtons(pCmd, bit.band(cm.GetButtons(pCmd), bit.bnot(IN_ATTACK2)))
						toggler = 0
					end
				end
			end
		end
	end
end

local playerkills = 0

local function KillSpam(data)
	local killer = Entity(data.entindex_attacker)
	local killed = Entity(data.entindex_killed)
	if not killer:IsValid() or not killed:IsValid() or not killer:IsPlayer() or not killed:IsPlayer() then return end
	if gBool("Miscellaneous", "Priority List", "Enabled") and table.HasValue(ignore_list, killed:UniqueID()) then return end
	if gBool("Miscellaneous", "Priority List", "Enabled") and table.HasValue(ignore_list, killer:UniqueID()) then return end
	if gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Miscellaneous", "Chat", "Priority Targets Only") and (killed ~= me and killer == me and not table.HasValue(priority_list, killed:UniqueID())) then return end
	if gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Miscellaneous", "Chat", "Priority Targets Only") and (killed == me and killer ~= me and not table.HasValue(priority_list, killer:UniqueID())) then return end
	local playerphrases = {"Owned", "Bodied", "Smashed", "Fucked", "Destroyed", "Annihilated", "Decimated", "Wrecked", "Demolished", "Trashed", "Ruined", "Murdered", "Exterminated", "Slaughtered", "Butchered", "Genocided", "Executed", "Bamboozled", "IdiotBox'd",}
	local excuses = {"i lagged out wtf", "bad ping wtf", "lol wasnt looking at you", "was alt tabbed", "luck", "wow", "nice one", "i think ur hacking m8", "my cat was on the keyboard", "my dog was on the keyboard", "my fps is trash", "my ping is trash", "ouch", "wtf", "ok",}
	local hvhexcuses = {"forgot to press aimkey lol", "give me a minute to configurate", "wtf it didnt save my settings wait", "lol my hvh settings are gone, wait", "luck lol", "my fps is trash", "my ping is trash", "what are you using?",}
	local hvhexcuses2 = {"Ok", "Nice", "Lucky", "Sorry, bad aa", "My configs suck", "I suck at HvH", "What are you using?", "I'm using a shit cheat",}
	local reason = {"bad at game", "spawnkilling", "hacker", "hacking", "hack", "bad", "eats penis",}
	local reason2 = {"hacker", "spawnkiller", "propkiller", "rdm", "being annoying", "bad at the game", "acts like a retard", "is stupid",}
	local bantime = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100", "200", "300", "400", "500", "600", "700", "800", "900", "1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000", "9000", "10000", "20000", "30000", "40000", "50000", "60000", "70000", "80000", "90000", "100000", "200000", "300000", "400000", "500000", "600000", "700000", "800000", "900000", "1000000", "999999999",}
	local randomoption = {"likes_penis", "eats_penis", "is_gay", "is_a_faggot", "should_get_kicked", "hates_vagina", "doesnt_eat_pussy", "doesnt_get_pussy", "thinks_about_penis_all_day", "has_a_fake_penis", "is_a_dirty_jew",}
	local owned = {killed:Nick().." is so shit", "can you stop dying, "..killed:Nick().."?", "hey, "..killed:Nick().."? it's okay, try again next time!", "what the fuck was that "..killed:Nick().."?", "plan your next try in the respawn room!", "rekt", "owned", "lol", "you're a retard, "..killed:Nick(), "there you go, back to the respawn", "you're bad, "..killed:Nick(), "noob down", "lmao", killed:Nick().." has died more times than native americans did back in the 1800's", "i bet you're insecure about your aim", "ahahah", "excuse me "..killed:Nick()..", you have won the world record of the worst KD in history!", "there he goes back to the respawn room", "don't let the door hit you on the way out, "..killed:Nick().."!", "noob", killed:Nick().." is a noob", "nerd", "pff", "ha", "ez", killed:Nick().." is a nerd", "good job!", "try not to die next time, "..killed:Nick().."!", "!votekick "..killed:Nick().." "..reason[math.random(#reason)], "!voteban "..killed:Nick().." 9999 "..reason[math.random(#reason)], "!vote "..killed:Nick().." "..randomoption[math.random(#randomoption)].." "..randomoption[math.random(#randomoption)].." "..randomoption[math.random(#randomoption)],}
	local votekick = {"!votekick "..killed:Nick().." "..reason2[math.random(#reason2)],}
	local voteban = {"!voteban "..killed:Nick().." "..bantime[math.random(#bantime)].." "..reason2[math.random(#reason2)],}
	local hvhowned = {"sick cheat, "..killed:Nick().."!", "get fucked", "rekt", "owned", "did you get that garbage from the steam workshop?", "ha", "ez", "loser", "take this L", "\"my cheat is good it owns everyone!!\" - "..killed:Nick(), killed:Nick()..": LOL WHAT ARE YOU USING??? I WANT THAT", "noob", "nerd", "pff", "gj", "how can a cheat suck this hard?", "nice strategy", "nice move", "lmfao, "..killed:Nick(), "what the fuck are you using "..killed:Nick().."?",}
	local hvhowned2 = {"Hey, "..killed:Nick()..", stop using that shit and get IdiotBox", ""..killed:Nick().." just got owned by IdiotBox", "Get IdiotBox'd you nerd", "Get fucked by IdiotBox", "Don't stay too much inside the respawn room, "..killed:Nick().."!", "You have been tapped by IdiotBox", "Get IdiotBox before trying to HvH, "..killed:Nick(), "IdiotBox owns your garbage cheat",}
	local comebackexcuses = {"what the fuck", "ok?????", "fucking nigger", "fuck you", "fuck off smelly jew", "smelly nigger", "bad ping", "you're next", "eat shit", "eat a fat steaming cock you unpriviledged homosexual", "suck my universe sized dick", "drink my piss fucking faggot", "hop off my dick fucking nigger",}
	local comebackowned = {"you got fucked in the ass", "get fucking raped", ""..killed:Nick().." can drink my fucking piss", "you suck shit gay nigger", "you should eat my shit", "you got shafted by my large penis, "..killed:Nick(), ""..killed:Nick().." is getting fucked by an aimbot", ""..killed:Nick().." is getting fucking murdered", "you're so shit at this game, quit already", "drink my dog's piss faggot", "hey don't cry bro, you need a tissue?", "you're so fucking gay", "you're the reason why equal rights don't exist, "..killed:Nick(), ""..killed:Nick().." is radiating big faggot energy", "hurr durr stop cheating in an ancient video game!!!", "stop being such a spastical retard already", "you're more braindead than kim jong un after his surgery", "you're a furfag and should not be proud, "..killed:Nick(), ""..killed:Nick().." is getting dominated by me, aka god", "you live in a fucking dirty hut, retarded african boy", "i bet you're literally fucking black", ""..killed:Nick().." is a gay autistic nigger with no privileges", ""..killed:Nick().." is being searched for by the fbi", ""..killed:Nick().." literally fucking died in gmod", "you're ultra retarded, kid", "you need a tissue, little faggot?", ""..killed:Nick().." should get killed by me once again", "please die more, you're feeding my addiction", ""..killed:Nick().." is a retard bot", "you're so much of a loser, get a fucking life and stop playing this shit game kid", "virgin lol get good", "fucking coomer, go wash your crusty underwear you filth", ""..killed:Nick().." got cucked", ""..killed:Nick().." is dominated by pure fucking skill", "you are a big noob", "i can't wait to headshot you irl, "..killed:Nick(), "you smelly homeless nigger", ""..killed:Nick().." still believes that god and santa exist lol", "bruh you really do be crying at a game", "please stop doing what you're doing and kill yourself", ""..killed:Nick().." lives in america", "you are a deformed fetus", ""..killed:Nick().." is ugly as shit fr tho", "you're cringe, stop doing this shit", ""..killed:Nick()..", you look like you died", "fucking putrid fuck, kill yourself", ""..killed:Nick().." is a trash cheater", ""..killed:Nick().." is a normie", "smelly fucker", ""..killed:Nick().." is a dickless prick", ""..killed:Nick().." is gay", ""..killed:Nick().." does not get any pussy", "you're too stupid to be considered human", "i bet this faggot, "..killed:Nick().." kisses girls!!", ""..killed:Nick().." is a furry", ""..killed:Nick().." is a waste of human flesh", "i bet you won't be able to kill me even with hacks", ""..killed:Nick()..", men are the fuck. you are not the fuck. you are not men", ""..killed:Nick().." is a failed abortion", ""..killed:Nick().." fucking died", ""..killed:Nick().." plays with his dick for fun", "play with my stinky fat throbbing cock you gay faggot", "stop using hacks you cringe skid!!!", ""..killed:Nick().." uses cancer shit cheats!!", "you show all of the signs of mental retardation", "please just quit the game already", ""..killed:Nick().." is a "..killed:Nick().."", "shut the fuck up and die", "nigger lol",}
	if (gOption("Miscellaneous", "Chat", "Kill Spam:") == "Normal") then
	if (killed == me and killer ~= me) then
		if not me:Alive() or me:Health() < 1 then return end
			RunConsoleCommand("say", string.format(excuses[math.random(#excuses)], killed:Nick()))
		end
		if (!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", owned[math.random(#owned)])
	elseif (gOption("Miscellaneous", "Chat", "Kill Spam:") == "Insult") then
		if (killed == me and killer ~= me) then
			RunConsoleCommand("say", comebackexcuses[math.random(#comebackexcuses)])
		end
		if (!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", comebackowned[math.random(#comebackowned)])
	elseif (gOption("Miscellaneous", "Chat", "Kill Spam:") == "HvH") then
		if (killed == me and killer ~= me) then
			RunConsoleCommand("say", hvhexcuses[math.random(#hvhexcuses)])
		end
		if (!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", hvhowned[math.random(#hvhowned)])
	elseif (gOption("Miscellaneous", "Chat", "Kill Spam:") == "IdiotBox HvH") then
		if (killed == me and killer ~= me) then
			RunConsoleCommand("say", hvhexcuses2[math.random(#hvhexcuses2)])
		end
		if (!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", hvhowned2[math.random(#hvhowned2)])
	elseif (gOption("Miscellaneous", "Chat", "Kill Spam:") == "Votekick") then
		if (killed == me and killer ~= me) then
			RunConsoleCommand("say", votekick[math.random(#votekick)])
		end
		if (!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", votekick[math.random(#votekick)])
	elseif (gOption("Miscellaneous", "Chat", "Kill Spam:") == "Voteban") then
		if (killed == me and killer ~= me) then
			RunConsoleCommand("say", voteban[math.random(#voteban)])
		end
		if (!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", voteban[math.random(#voteban)])
	elseif (gOption("Miscellaneous", "Chat", "Kill Spam:") == "Salty") then
		if (killed == me and killer ~= me) then
			RunConsoleCommand("say", "kys")
		end
		if (!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", "ez")
	elseif (gOption("Miscellaneous", "Chat", "Kill Spam:") == "Killstreak") then
		if (killed == me && playerkills > 0 && killer ~= me) then
		RunConsoleCommand("say", ""..killed:Nick().."'s ".."killstreak of "..playerkills.." has been ended by "..killer:Nick()..".")
		playerkills = 0
		end
		if (!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		playerkills = playerkills + 1
		RunConsoleCommand("say", ""..playerphrases[math.random(#playerphrases)].." "..killed:Nick().." (".."Killstreak: "..playerkills..")")
	end
end

local fa

local aa

local function FixMovement(pCmd)
	local vec = Vector(cm.GetForwardMove(pCmd), cm.GetSideMove(pCmd), 0)
	local vel = math.sqrt(vec.x * vec.x + vec.y * vec.y)
	local mang = vm.Angle(vec)
	local yaw = cm.GetViewAngles(pCmd).y - fa.y + mang.y
	if (((cm.GetViewAngles(pCmd).p + 90) % 360) > 180) then
	yaw = 180 - yaw
	end
	yaw = ((yaw + 180) % 360) - 180
	pCmd:SetForwardMove(math.cos(math.rad(yaw)) * vel)
	pCmd:SetSideMove(math.sin(math.rad(yaw)) * vel)
end

local function FixAngle(ang)
	if not FixTools() then
		ang.x = math.NormalizeAngle(ang.x)
		ang.p = math.Clamp(ang.p, - 89, 89)
	end
end

local function DrawOutlinedText (title, font, x, y, color, OUTsize, OUTcolor)
	draw.SimpleTextOutlined (title, font, x, y, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, OUTsize, OUTcolor)
end

local function EntityName()
	if util.TraceLine(util.GetPlayerTrace(me)).Entity:IsValid() then
		return util.TraceLine(util.GetPlayerTrace(me)).Entity:GetClass()
	else
		return "None"
	end
end

local function Logo()
	if gOption("Main Menu", "Menus", "Menu Style:") == "Borders" then
		draw.RoundedBox(gInt("Settings", "List Positions", "Roundness:"), gInt("Settings", "List Positions", "Custom Status X:") - 1, gInt("Settings", "List Positions", "Custom Status Y:") - 25, 92, 24, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "B Opacity:")))
	elseif gOption("Main Menu", "Menus", "Menu Style:") == "Borderless" then
		draw.RoundedBox(gInt("Settings", "List Positions", "Roundness:"), gInt("Settings", "List Positions", "Custom Status X:") - 1, gInt("Settings", "List Positions", "Custom Status Y:") - 25, 92, 24, Color(bordercol.r, bordercol.g, bordercol.b, 0))
	end
	draw.RoundedBox(gInt("Settings", "List Positions", "Roundness:"), gInt("Settings", "List Positions", "Custom Status X:") + 1, gInt("Settings", "List Positions", "Custom Status Y:") - 23, 88, 20, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Settings", "Others", "BG Opacity:")))
	draw.DrawText("Status", "MiscFont2", gInt("Settings", "List Positions", "Custom Status X:") + 45, gInt("Settings", "List Positions", "Custom Status Y:") - 22, Color(maintextcol.r, maintextcol.g, maintextcol.b, gInt("Settings", "Others", "T Opacity:")), TEXT_ALIGN_CENTER)
end

local function Status()
	local hh = - 10
	local wep = pm.GetActiveWeapon(me)
	local hp = em.Health(me)
	local velocity = me:GetVelocity():Length()
	if hp < 0 then
		hp = 0
	end
	surface.SetFont("MiscFont")
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Health: "..hp)
	if (em.IsValid(wep)) then
	local daclip = wep:Clip1()
		if daclip < 0 then
			daclip = 0
		end
		surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
		hh = hh + 12
		surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
		surface.DrawText("Ammo: "..daclip.."/"..me:GetAmmoCount(wep:GetPrimaryAmmoType()))
	else
		surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
		hh = hh + 12
		surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
		surface.DrawText("Ammo: ".."0".."/".."0")
	end
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Velocity: "..math.Round(velocity))
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Server: "..GetHostName())
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Gamemode: "..engine.ActiveGamemode())
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Map: "..game.GetMap())
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Looking at: "..EntityName())
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Entities: "..math.Round(ents.GetCount() - player.GetCount() * 12))
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Frames: "..math.Round(1 / FrameTime()))
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Ping: "..me:Ping())
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Date: "..os.date("%d %b %Y"))
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Time: "..os.date("%H:%M:%S"))
end

local function Spectator()
	local radarX, radarY, radarWidth, radarHeight = 50, ScrH() / 3, 200, 200
	local color1 = (Color(0, 0, 0, gInt("Settings", "Others", "BG Opacity:")))
	local color2 = (Color(255, 0, 0, gInt("Settings", "Others", "T Opacity:")))
	local color3 = (Color(maintextcol.r, maintextcol.g, maintextcol.b, gInt("Settings", "Others", "T Opacity:")))
	local color4 = (Color(0, 131, 125, gInt("Settings", "Others", "T Opacity:")))
	local hudspecslength = 150
	specscount = 0
	if gOption("Main Menu", "Menus", "Menu Style:") == "Borders" then
		draw.RoundedBox(gInt("Settings", "Window Positions", "Roundness:"), gInt("Settings", "Window Positions", "Spectators X:") - 1, gInt("Settings", "Window Positions", "Spectators Y:") - 3, radarWidth + 6, radarHeight + 6, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "B Opacity:")))
	elseif gOption("Main Menu", "Menus", "Menu Style:") == "Borderless" then
		draw.RoundedBox(gInt("Settings", "Window Positions", "Roundness:"), gInt("Settings", "Window Positions", "Spectators X:") - 1, gInt("Settings", "Window Positions", "Spectators Y:") - 3, radarWidth + 6, radarHeight + 6, Color(bordercol.r, bordercol.g, bordercol.b, 0))
	end
	draw.RoundedBox(gInt("Settings", "Window Positions", "Roundness:"), gInt("Settings", "Window Positions", "Spectators X:") + 2, gInt("Settings", "Window Positions", "Spectators Y:"), radarWidth, radarHeight, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Settings", "Others", "BG Opacity:")))
	draw.SimpleText("Spectators", "MiscFont2", gInt("Settings", "Window Positions", "Spectators X:") + 102, gInt("Settings", "Window Positions", "Spectators Y:") + 11, color3, 1, 1)
	for k, v in pairs(player.GetAll()) do
		if (IsValid(v:GetObserverTarget())) and v:GetObserverTarget() == me then
			DrawOutlinedText (v:GetName(), "MiscFont2", gInt("Settings", "Window Positions", "Spectators X:") + 102, gInt("Settings", "Window Positions", "Spectators Y:") + 32 + specscount, color2, 0.1, color1)
			specscount = specscount + 12
		end
	end
	if specscount == 0 then
		DrawOutlinedText ("none", "MiscFont2", gInt("Settings", "Window Positions", "Spectators X:") + 102, gInt("Settings", "Window Positions", "Spectators Y:") + 32, color4, 0.1, color1)
	end
	hudspecslength = specscount + 19
end

local function DrawArrow(x, y, myRotation)
	local arrow = {}
	arrow[1] = {x = x, y = y}
	arrow[2] = {x = x + 4, y = y + 7.5}
	arrow[3] = {x = x, y = y + 5}
	arrow[4] = {x = x - 4, y = y + 7.5}
	myRotation = myRotation * - 1
	myRotation = math.rad(myRotation)
	for i = 1, 4 do
		local theirX = arrow[i].x
		local theirY = arrow[i].y
		theirX = theirX - x
		theirY = theirY - y
		arrow[i].x = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
		arrow[i].y = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
		arrow[i].x = arrow[i].x + x
		arrow[i].y = arrow[i].y + y
	end
	surface.DrawPoly(arrow)
end

local radarX, radarY, radarWidth, radarHeight = 50, ScrH() / 3, 200, 200

local function RadarDraw()
	local col = Color(maintextcol.r, maintextcol.g, maintextcol.b, gInt("Settings", "Others", "T Opacity:"))
	local everything = ents.GetAll()
	if gOption("Main Menu", "Menus", "Menu Style:") == "Borders" then
		draw.RoundedBox(gInt("Settings", "Window Positions", "Roundness:"), gInt("Settings", "Window Positions", "Radar X:") - 1, gInt("Settings", "Window Positions", "Radar Y:") - 3, radarWidth + 6, radarHeight + 6, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "B Opacity:")))
	elseif gOption("Main Menu", "Menus", "Menu Style:") == "Borderless" then
		draw.RoundedBox(gInt("Settings", "Window Positions", "Roundness:"), gInt("Settings", "Window Positions", "Radar X:") - 1, gInt("Settings", "Window Positions", "Radar Y:") - 3, radarWidth + 6, radarHeight + 6, Color(bordercol.r, bordercol.g, bordercol.b, 0))
	end
	draw.RoundedBox(gInt("Settings", "Window Positions", "Roundness:"), gInt("Settings", "Window Positions", "Radar X:") + 2, gInt("Settings", "Window Positions", "Radar Y:"), radarWidth, radarHeight, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Settings", "Others", "BG Opacity:")))
	draw.SimpleText("Radar", "MiscFont2", gInt("Settings", "Window Positions", "Radar X:") + 102, gInt("Settings", "Window Positions", "Radar Y:") + 11, col, 1, 1)
	draw.NoTexture()
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "B Opacity:") - 75)
	surface.DrawLine(gInt("Settings", "Window Positions", "Radar X:") + 209 * 0.5, gInt("Settings", "Window Positions", "Radar Y:") + 24, gInt("Settings", "Window Positions", "Radar X:") + 209 * 0.5, gInt("Settings", "Window Positions", "Radar Y:") + 190)
	surface.DrawLine(gInt("Settings", "Window Positions", "Radar X:") + 12, gInt("Settings", "Window Positions", "Radar Y:") + 209 * 0.5, gInt("Settings", "Window Positions", "Radar X:") + 191, gInt("Settings", "Window Positions", "Radar Y:") + 209 * 0.5)
	surface.SetDrawColor(team.GetColor(me:Team()))
	for k = 1, #everything do
		local v = everything[k]
		if (v != LocalPlayer() and v:IsPlayer() and v:Health() > 0 and not (em.IsDormant(v) and gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All") and not (v:Team() == TEAM_SPECTATOR and gBool("Visuals", "Miscellaneous", "Show Spectators")) and not ((gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignore_list, v:UniqueID())) or (gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(priority_list, v:UniqueID()))) or (v:IsNPC() and v:Health() > 0)) then
			color = v:IsPlayer() and team.GetColor(v:Team()) or Color(255, 255, 255)
			surface.SetDrawColor(color)
			local myPos = me:GetPos()
			local theirPos = v:GetPos()
			local theirX = (radarX + (radarWidth / 2)) + ((theirPos.x - myPos.x) / gInt("Visuals", "Miscellaneous", "Radar Distance:"))
			local theirY = (radarY + (radarHeight / 2)) + ((myPos.y - theirPos.y) / gInt("Visuals", "Miscellaneous", "Radar Distance:"))
			local myRotation = math.rad(fa.y - 90)
			theirX = theirX - (radarX + (radarWidth / 2))
			theirY = theirY - (radarY + (radarHeight / 2))
			local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
			local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
			newX = newX + (gInt("Settings", "Window Positions", "Radar X:") + 2 + (radarWidth / 2))
			newY = newY + (gInt("Settings", "Window Positions", "Radar Y:") + 2 + (radarHeight / 2))
			if newX < (gInt("Settings", "Window Positions", "Radar X:") + 2 + radarWidth) and newX > gInt("Settings", "Window Positions", "Radar X:") + 2 and newY < (gInt("Settings", "Window Positions", "Radar Y:") + radarHeight) and newY > gInt("Settings", "Window Positions", "Radar Y:") then
				DrawArrow(newX + 4, newY, v:EyeAngles().y - fa.y)
			end
		end
	end
	render.SetScissorRect(0, 0, 0, 0, false)
end

local function Logo2()
	if gOption("Main Menu", "Menus", "Menu Style:") == "Borders" then
		draw.RoundedBox(gInt("Settings", "List Positions", "Roundness:"), gInt("Settings", "List Positions", "Players List X:") - 1, gInt("Settings", "List Positions", "Players List Y:") - 25, 92, 24, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Settings", "Others", "B Opacity:")))
	elseif gOption("Main Menu", "Menus", "Menu Style:") == "Borderless" then
		draw.RoundedBox(gInt("Settings", "List Positions", "Roundness:"), gInt("Settings", "List Positions", "Players List X:") - 1, gInt("Settings", "List Positions", "Players List Y:") - 25, 92, 24, Color(bordercol.r, bordercol.g, bordercol.b, 0))
	end
	draw.RoundedBox(gInt("Settings", "List Positions", "Roundness:"), gInt("Settings", "List Positions", "Players List X:") + 1, gInt("Settings", "List Positions", "Players List Y:") - 23, 88, 20, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Settings", "Others", "BG Opacity:")))
	draw.DrawText("Players", "MiscFont2", gInt("Settings", "List Positions", "Players List X:") + 47, gInt("Settings", "List Positions", "Players List Y:") - 22, Color(maintextcol.r, maintextcol.g, maintextcol.b, gInt("Settings", "Others", "T Opacity:")), TEXT_ALIGN_CENTER)
end

local function Players()
	local hh = - 10
	surface.SetFont("MiscFont")
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Players List X:") + 3, hh + gInt("Settings", "List Positions", "Players List Y:"))
	surface.SetTextColor(0, 131, 175, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Players: "..player.GetCount().."/"..game.MaxPlayers())
	local NWString = em.GetNWString(v)
	for k, v in next, player.GetAll() do
		surface.SetTextColor(0, 131, 175, gInt("Settings", "Others", "T Opacity:"))
		hh = hh + 12
		surface.SetTextPos(gInt("Settings", "List Positions", "Players List X:") + 3, hh + gInt("Settings", "List Positions", "Players List Y:"))
		surface.DrawText(""..em.GetNWString(v, "usergroup").."")
		surface.SetTextColor(255, 255, 255, gInt("Settings", "Others", "T Opacity:"))
		surface.DrawText(" "..v:GetName())
	end
end

local pressed = false

local function Prioritize(v)
	if table.HasValue(ignore_list, v:UniqueID()) then
		table.RemoveByValue(ignore_list, v:UniqueID())
	elseif table.HasValue(priority_list, v:UniqueID()) then
		table.RemoveByValue(priority_list, v:UniqueID())
	else
		table.insert(priority_list, v:UniqueID())
	end
	file.Write(folder.."/priority.txt", util.TableToJSON(priority_list))
	file.Write(folder.."/ignored.txt", util.TableToJSON(ignore_list))
end

local function Ignore(v)
	if table.HasValue(priority_list, v:UniqueID()) then
		table.RemoveByValue(priority_list, v:UniqueID())
	elseif table.HasValue(ignore_list, v:UniqueID()) then
		table.RemoveByValue(ignore_list, v:UniqueID())
	else
		table.insert(ignore_list, v:UniqueID())
	end
	file.Write(folder.."/priority.txt", util.TableToJSON(priority_list))
	file.Write(folder.."/ignored.txt", util.TableToJSON(ignore_list))
end

local function Priority(v)
	if table.HasValue(priority_list, v:UniqueID()) then
		return "Priority Target"
	elseif table.HasValue(ignore_list, v:UniqueID()) then
		return "Ignored Target"
	else
		return "Normal"
	end
end

local function PlayerList()
	local pos_x, pos_y = ScrW() / 1.26, ScrH() / 5.5
	local number = 1
	local offset = 14 + gInt("Miscellaneous", "Priority List", "List Spacing:")
	surface.SetDrawColor(maintextcol.r, maintextcol.g, maintextcol.b, 100)
	surface.DrawRect(pos_x, pos_y, 350, 15)
	surface.SetDrawColor(0, 0, 0)
	surface.DrawOutlinedRect(pos_x, pos_y, 350, 15)
	surface.DrawOutlinedRect(pos_x, pos_y, 30, 15)
	surface.DrawOutlinedRect(pos_x + 29, pos_y, 180, 15)
	draw.SimpleText("#", "MiscFont", pos_x + 5, pos_y, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	draw.SimpleText("Username", "MiscFont", pos_x + 35, pos_y, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	draw.SimpleText("Priority", "MiscFont", pos_x + 214, pos_y, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	for k, v in next, player.GetAll() do
		if v == me or not v:IsValid() then continue end
		if MouseInArea(pos_x, pos_y + offset, pos_x + 350, pos_y + offset + 14) then
			if input.IsMouseDown(107) then
				if MouseInArea(pos_x + 30, pos_y + offset, pos_x + 209, pos_y + offset + 14) and not v:IsBot() then
					gui.OpenURL("http://steamcommunity.com/profiles/"..v:SteamID64().."/")
				elseif MouseInArea(pos_x + 209, pos_y + offset, pos_x + 350, pos_y + offset + 14) and not pressed then
					Prioritize(v)
					pressed = true
				end
			elseif input.IsMouseDown(108) then
				if MouseInArea(pos_x + 30, pos_y + offset, pos_x + 209, pos_y + offset + 14) and not v:IsBot() then
					SetClipboardText("http://steamcommunity.com/profiles/"..v:SteamID64().."/")
				elseif MouseInArea(pos_x + 209, pos_y + offset, pos_x + 350, pos_y + offset + 14) and not pressed then
					Ignore(v)
					pressed = true
				end
			else
				pressed = false
			end
				if table.HasValue(ignore_list, v:UniqueID()) then
					surface.SetDrawColor(175, 175, 175)
				elseif table.HasValue(priority_list, v:UniqueID()) then
					surface.SetDrawColor(255, 0, 100)
				else
					surface.SetDrawColor(bgmenucol.r, bgmenucol.g, bgmenucol.b)
				end
			else
				if table.HasValue(ignore_list, v:UniqueID()) then
					surface.SetDrawColor(175, 175, 175)
				elseif table.HasValue(priority_list, v:UniqueID()) then
					surface.SetDrawColor(255, 0, 100)
				else
					surface.SetDrawColor(bgmenucol.r, bgmenucol.g, bgmenucol.b, 235)
				end
			end
		surface.DrawRect(pos_x, pos_y + offset, 350, 15)
		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(pos_x, pos_y + offset, 350, 15)
		surface.DrawOutlinedRect(pos_x, pos_y + offset, 30, 15)
		surface.DrawOutlinedRect(pos_x + 29, pos_y + offset, 180, 15)
		draw.SimpleText(number, "MiscFont", pos_x + 5, pos_y + offset, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
		draw.SimpleText(v:Nick(), "MiscFont", pos_x + 35, pos_y + offset, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
		draw.SimpleText(Priority(v), "MiscFont", pos_x + 214, pos_y + offset, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
		offset = offset + 14 + gInt("Miscellaneous", "Priority List", "List Spacing:")
		number = number + 1
	end
end

local function Crosshair()
	if menuopen then return end
	if me:Team() == TEAM_SPECTATOR and not ((gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:")) and gBool("Visuals", "Miscellaneous", "Show Spectators")) then return end
	if not me:Alive() or me:Health() < 1 then return end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Box") then
	local x1, y1 = ScrW() * 0.5, ScrH() * 0.5
		surface.SetDrawColor(0, 0, 0, gInt("Settings", "Others", "T Opacity:"))
		surface.DrawOutlinedRect(x1 - 3, y1 - 2, 6, 6)
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:"))
		surface.DrawRect(x1 - 2, y1 - 1, 4, 4)
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Dot") then -- I want to avoid using surface.DrawPoly as much as possible
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 0.2, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 0.4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 0.6, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 0.8, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.2, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.6, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.8, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2.2, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2.4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2.6, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2.8, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 3, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4, Color(0, 0, 0, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4.2, Color(0, 0, 0, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4.4, Color(0, 0, 0, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4.6, Color(0, 0, 0, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4.8, Color(0, 0, 0, gInt("Settings", "Others", "T Opacity:")))
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Square") then
	local x1, y1 = ScrW() * 0.5, ScrH() * 0.5
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:"))
		surface.DrawOutlinedRect(x1 - 3, y1 - 2, 6, 6)
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Circle") then
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Cross") then
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:"))
		surface.DrawLine(ScrW() / 2 - 11, ScrH() / 2, ScrW() / 2 + 11, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 11, ScrW() / 2 - 0, ScrH() / 2 + 11)
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Edged Cross") then
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:"))
		surface.DrawLine(ScrW() / 2 - 14.5, ScrH() / 2, ScrW() / 2 + 14.5, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 14.5, ScrW() / 2 - 0, ScrH() / 2 + 14.5)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawLine(ScrW() / 2 - 9, ScrH() / 2, ScrW() / 2 + 9, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 9, ScrW() / 2 - 0, ScrH() / 2 + 9)
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Swastika") then
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:"))
		surface.DrawLine(ScrW() / 2, ScrH() / 2, ScrW() / 2 + 20, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 + 20, ScrH() / 2, ScrW() / 2 + 20, ScrH() / 2 + 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2, ScrW() / 2 - 20, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 20, ScrH() / 2, ScrW() / 2 - 20, ScrH() / 2 - 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2, ScrW() / 2, ScrH() / 2 - 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2 - 20, ScrW() / 2 + 20, ScrH() / 2 - 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2, ScrW() / 2, ScrH() / 2 + 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2 + 20, ScrW() / 2 - 20, ScrH() / 2 + 20)
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "GTA IV") then
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 11, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
	end
end

local fake = GetRenderTarget("fake"..os.time(), ScrW(), ScrH())

hook.Add("RenderScene", "Hook0", function(origin, angle, fov)
	if gBool("Miscellaneous", "Textures", "Dark Mode") then
		for k, v in pairs(game.GetWorld():GetMaterials()) do
		Material(v):SetVector("$color", Vector(0.05, 0.05, 0.05))
		end
		render.SuppressEngineLighting(true)
		render.ResetModelLighting(0.2, 0.2, 0.2)
		else
		for k, v in pairs(game.GetWorld():GetMaterials()) do
		Material(v):SetVector("$color", Vector(1, 1, 1))
		end
		render.SuppressEngineLighting(false)
		render.ResetModelLighting(1, 1, 1)
	end
	render.SetLightingMode(gBool("Miscellaneous", "Textures", "Bright Mode") and 1 or 0)
	local view = {
		x = 0,
		y = 0,
		w = ScrW(),
		h = ScrH(),
		dopostprocess = true,
		origin = origin,
		angles = angle,
		fov = fov,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	}
	render.RenderView(view)
	render.CopyTexture(nil, fake)
	cam.Start2D()
    hook.Run("HUDPaint2")
    cam.End2D()
	render.SetRenderTarget(fake)
	return true
end)

hook.Add("ShutDown", "Hook1", function()
	render.SetRenderTarget()
end)

hook.Add("PostDrawViewModel", "Hook2", function(vm)
	if (!vm) then return end
	render.SetLightingMode(0)
	for k, v in next, vm:GetMaterials() do
		render.MaterialOverrideByIndex(k - 1, nil)
	end
end)

hook.Add("PreDrawEffects", "Hook3", function()
	render.SetLightingMode(0)
end)

local hide = {
	CHudHealth = true, 
	CHudAmmo = true, 
	CHudBattery = true, 
	CHudSecondaryAmmo = true, 
	CHudDamageIndicator = true, 
	CHudCrosshair = true, 
}

local crosshairhide = {
	CHudCrosshair = true, 
}

hook.Add("HUDShouldDraw", "Hook4", function(name)
	if gBool("Visuals", "Miscellaneous", "Hide HUD") and hide[name] then
		return false
	end
	if gOption("Visuals", "Miscellaneous", "Crosshair:") ~= "Off" and crosshairhide[name] then
		return false
	end
end)
	
local function TraitorFinder()
	for k, v in pairs(ents.FindByClass("weapon_ttt_c4")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor C4", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_ttt_knife")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor Knife", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_ttt_phammer")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor Poltergeist", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_ttt_sipistol")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor Silenced Pistol", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_ttt_pain_station")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor Pain Station", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_ttt_flaregun")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor Flaregun", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_ttt_push")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor Newton Launcher", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_ttt_radio")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor Radio", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_ttt_teleport")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor Teleport", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
	for k, v in pairs(ents.FindByClass("(Disguise)")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Traitor", "MiscFont", pos.x + w/50, pos.y + h /11, Color(255, 0, 100), 1)
	end
end

local function MurdererFinder()
	for k, v in pairs(ents.FindByClass("weapon_mu_knife")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h /  1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos()) / 40)
	draw.DrawText("Murderer Knife", "MiscFont", pos.x + w / 50, pos.y + h  / 11, Color(100, 0, 255), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_mu_magnum")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h /  1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos()) / 40)
	draw.DrawText("Magnum Pistol", "MiscFont", pos.x + w / 50, pos.y + h  / 11, Color(100, 0, 255), 1)
	end
end

local function ChatSpam()
	local ArabFunni = {"يمارس الجنس مع السلطة العربية سنة عظيمة", "رائحة مثل البظر دون السن القانونية هنا اسمحوا لي أن اللعنة", "ازدهار مسحوق الطاقة العربية سنة جيدة", "نحن نكره اليهو", "يمارس الجنس مع الأطفال الماعز نعم الجنس", "الله أكبر نعم رجل تفجير طفل", "هذه لحظة بره لحظة ارهابية سنة", "في تلك اللحظة التي يبدأ فيها أخاك في المغازلة مع والدتك", "الحصول على صندوق احمق نعم العربية غش كازاخستان", "يمارس الجنس مع نيغا الكلبة دا قرن الطفل", "ترك العرب باكستاني لحظة برمة تجميع كرمة", "حرق اليهود ، يمارس الجنس مع المسيح ، قتل الأطفال ، أصبح الله",}
	local HebrewFunni = {"לזיין את הכלב שלך אמא לעזאזל חרא סקס בכוס", "לעזאזל כוס כלבה בזין אני אוהבת עורלה הדוקה חתכה לי שלום כומר", "זו לא בדיחה מזוינת אני רוצה לתלות את עצמי השנה", "תזדיין שאתה יהודי הוא הגדול ביותר שכולכם כושים", "אני אהיה בן שש בשנה מכושן", "יש למול את הפין", "ישראל היא פלסטין המזוין הגדול ביותר במדינה", "זקן ישבן גדול על סנטרי, זהב בביתי, פוליטיקה במכנסיים שלי", "מזדיין לצאת מכושים ישראלים", "כוס חתולה אני מזיין את הזין ואז אני מוצץ כן", "חרא של אלוהים זה חרא של רחוב כן", "אני הולך לזיין ילד בן שתים עשרה בתחת, כן חתוך עורלה לעזאזל חרא כלבה",}
	local messagespam = {"GET FUCKED BY IDIOTBOX KIDDIE", "YOU SUCK SHIT LMAO", "STOP BEING SUCH A WORTHLESS CUMSTAIN AND GET IDIOTBOX NOW", "MONEY WASTER LOL", "YOU FUCKING FATASS, GET IDIOTBOX AND LOSE ALL THAT WEIGHT YOU INCEL", "ARE ALL THE GIRLS IGNORING YOU? GET IDIOTBOX AND YOU'LL BE FLOODED WITH PUSSY", "DO YOU FEEL WORTHLESS? WELL, YOU ARE LOL", "GET IDIOTBOX IF YOU WANT SOME OF THAT CLOUT", "STOP WASTING YOUR TIME ON SOUNDCLOUD BECAUSE YOU AIN'T GONNA GET NOWHERE WITH IT", "GET IDIOTBOX AND YOUR DICK WILL GROW 4 TIMES ITS SIZE", "LITTLE KID LMAO",}
	local offensivespam = { "fuck niggers like fr", "who else here hates black people lmao", "all niggers should be locked in cages and fed bananas", "black people are some sub-human slaves imo", "i've never met an intelligent black person", "why tf are all niggers so ugly lol", "all the black dudes i've seen look like monkeys", "ooga booga black rights", "my grandpa died in ww2, he was the best german pilot", "white people are genetically superior to every othe race", "all jews can do is hide the truth, steal money and start wars",}
	local insultspam = {" is shit at building", " is no older than 13", " looks like a 2 month old corpse", " really thinks gmod is a good game", " can't afford a better pc lmao", ", so how do you like your 40 fps?", " will definitely kill himself before his 30's ", " is a fucking virgin lmao", " is a script kiddie", " thinks his 12cm penis is big lmfao", ", how does it feel when you've never seen a naked woman in person?", ", what do you like not being able to do a single push-up?", ", tell me how it feels to be shorter than every girl you've met", " is a fatass who only spends his time in front of a monitor like an incel", "'s parents have a lower than average income", " lives under a bridge lmao", " vapes because is too afraid to smoke an actual ciggarette", ", your low self esteem really pays off you loser", ", make sure you tell me what unemployment feels like", " lives off of his parents' money", ", you're a dissapointment to your entire family, fatass", " has probably fried all of his dopamine receptors by masturbating this much",}
	local advertise = {"IdiotBox - https://phizzofficial.wixsite.com/idiotbox4gmod/", "IdiotBox - Destroying everyone since '16.", "IdiotBox - Easy to use, free Garry's Mod cheat.", "IdiotBox - Now you can forget that negative KD's can be possible.", "IdiotBox - Beats all of your other cheats.", "IdiotBox - IdiotBox came back, and it came back with a vengeance.", "IdiotBox - Join the Discord server if you have a high IQ.", "IdiotBox - The only high-quality free cheat, out for Garry's Mod.", "IdiotBox - Best cheat, created by Phizz & more.", "IdiotBox - Always updated, never dead.", "IdiotBox - A highly reliable and optimised cheating software.", "IdiotBox - Top class, free cheat for Garry's Mod.", "IdiotBox - Makes noobs cry waves of tears since forever!", "IdiotBox - Say goodbye to the respawn room!", "IdiotBox - Download the highest quality Garry's Mod cheat for free now!", "IdiotBox - A reliable way to go!", "IdiotBox - Make Garry's Mod great again!", "IdiotBox - Visit our website for fresh Discord invite links!", "IdiotBox - Monthly bugfixes & updates. It never gets outdated!", "IdiotBox - Download IdiotBox v6.8.b2 right now!", "IdiotBox - Bug-free and fully customizable!", "IdiotBox - Join our Steam group and Discord server to stay up-to-date!", "IdiotBox - Refund all your cheats, use this better and free alternative!", "IdiotBox - Now with more features than ever!", "IdiotBox - The best Garry's Mod cheat, with 24/7 support, for free!", "IdiotBox - Bypasses most anti-cheats and screengrabbers!",}
	local toxicadvertise = {"Get IdiotBox you fucking smelly niggers", "IdiotBox is the best fucking cheat and that is a fact", "All of you are fucking autistic for not having IdiotBox", "Why the fuck don't you get IdiotBox lol", "Stay being gay or get IdiotBox", "Your moms should know that you play grown-up games, join our Discord to prove you are not under-aged", "I have your IPs you dumb niggers, I will delete the IPs if you get IdiotBox", "You all fucking smell like shit for not using IdiotBox", "IdiotBox makes kiddos cry and piss their pants maybe and maybe shit and cum", "IdiotBox is the best free cheat in the history of the entire world so get it faggots", "Download IdiotBox at https://phizzofficial.wixsite.com/idiotbox4gmod/ or you're retarded", "Join our fucking Discord or else you are literally an unpriviledged niggers", "IdiotBox is a cheat for people with high IQ only, use IdiotBox to prove you're smart", "Don't wanna get fucking raped? Get IdiotBox and shit on them skids", "This is the best free paste around, no other paste is better than IdiotBox", "How the fuck are you not using IdiotBox in a shitty dying game lmfao", "IdiotBox is the best and most popular Garry's Mod cheat ever, why are you not using it lol", "May cause a bit of lag but it's worth it for the fuckton of features that it has", "You're all faggots if you don't cheat with IdiotBox", "You literally go to pride month parades if you don't use IdiotBox", "Idiotbox is the highest quality, most popular free cheat, just get it already", "Shit on all of the virgins that unironically play this game with this high-quality cheat", "Get good, get IdiotBox you fucking retards", "You're mad retarded if you are not using IdiotBox, no cap", "Own every single retard in HvH with this superior cheat now", "All of you are dumb niggers for not downloading IdiotBox and that is a fact", "You suck fat cocks in public bathrooms if you're not using IdiotBox", "Just get this god-like cheat already and rape all existing servers", "No you idiots, you can't get VAC banned for using lua scripts you absolute cretins", "IdiotBox bypasses even the most complex anti-cheats and screengrabbers, you're not getting banned anytime soon", "Just use IdiotBox to revert your sad lives and feel better about yourselves", "Phizz is a god because he made this god-like cheat called IdiotBox", "I am forced to put IdiotBox in almost every sentence and advertise in a toxic way because I'm a text in a lua script", "Why are you fucking gay? Get IdiotBox today", "The sentence above is a rhyme but the script says to put random sentences so I don't think you can see it, get IdiotBox btw", "Purchase IdiotBox now! Only for OH wait it's free", "It is highly recommended that you get IdiotBox in case of getting pwned", "You are swag and good looking, but only if you get IdiotBox", "Phizz spent so many fucking nights creating this masterpiece of a cheat so get it now or he will legit kill you", "Fuck you and get IdiotBox now lol", "IdiotBox is constantly getting updated with dope-ass features, it never gets outdated so just get it", "Have IdiotBox installed if you're mega straight and zero gay", "Whoever the fuck said lua cheats are bad deserves to die in a house fire", "You get IdiotBox, everyone else on the server gets pwned, ez as that", "Many cheats copied IdiotBox, but this is the original one, fucking copycats", "Join the fucking Discord, promise it won't hurt you faggots", "Download IdiotBox at https://phizzofficial.wixsite.com/idiotbox4gmod/ right this moment or I will hire a hitman to kill you", "Join the IdiotBox group at OH wait niggers got mad and mass-reported it, kys shitkids", "Nvm, Steam group is back lol get fucked you mad skid shitkids", "IdiotBox killed all of the paid cheats because it's too good", "Get IdiotBox, it's free and very good, you sacks of crying shit", "IdiotBox is the fucking G.O.A.T.", "What the fuck are you doing not using this god-like cheat lol", "This is an epic fucking cheat called IdiotBox that was created by Phizz and others, worship your new gods kiddos", "You were fed cock milk as a baby if you're not using IdiotBox and you can not prove me wrong", "IdiotBox has the dopest anti-aims and resolvers you'll ever use, you will be a HvH god", "Just please get IdiotBox already you retards, I am tired of typing these lines for fuck's sake", "Phizz will give everyone IdiotBox v6.9 soon so quit your shit", "IdiotBox needs no Steam group, we're too chad for one", "Our Discord was tapped at some point but IdiotBox is back and stronger than ever", "IdiotBox came back to kill silly niggers, and it came back with a vengeance", "Download Idiotbox v6.8.b2 now, you dont even know what you're missing you mongoloids", "Have I told you about IdiotBox, the best Garry's Mod cheat ever made??", "Holy shit, IdiotBox for Garry's Mod is the best cheat that I have ever used!!",}
	local lmaoboxadvertise = {"www.IB4G.net - https://phizzofficial.wixsite.com/idiotbox4gmod/", "www.IB4G.net - WHAT ARE YOU WAITING FOR?", "www.IB4G.net - BEST GARRY'S MOD CHEAT OUT RIGHT NOW!", "www.IB4G.net - SAY GOODBYE TO THE RESPAWN ROOM!", "www.IB4G.net - NO SKILL REQUIRED!", "www.IB4G.net - NEVER DIE AGAIN WITH THIS!", "www.IB4G.net - ONLY HIGH IQ NIGGAS' USE IDIOTBOX!", "www.IB4G.net - THE GAME IS NOT ACTUALLY DYING, I JUST LIKE TO ANNOY KIDS LOL!", "www.IB4G.net - DOWNLOAD THE CHEAT FOR FREE!", "www.IB4G.net - NOW WITH AUTOMATIC UPDATES!", "www.IB4G.net - GUARANTEED SWAG AND RESPECT ON EVERY SERVER!", "www.IB4G.net - IDIOTBOX COMING SOON TO TETIRS!", "www.IB4G.net - VISIT OUR WEBSITE FOR A FRESH INVITE LINK TO OUR DISCORD!", "www.IB4G.net - PHIZZ IS A GOD FOR MAKING THIS!", "www.IB4G.net - BECOME THE SERVER MVP IN NO TIME!", "www.IB4G.net - 100% NO SKILL REQUIRED!", "www.IB4G.net - BEST CHEAT, MADE BY THE CHINESE COMMUNIST PARTY!", "www.IB4G.net - MAKE IDIOTBOX GREAT AGAIN!", "www.IB4G.net - WHY ARE YOU NOT CHEATING IN A DYING GAME?", "www.IB4G.net - RUINING EVERYONE'S FUN SINCE 2016!", "www.IB4G.net - IT'S PASTED, BUT IT'S THE BEST PASTE YOU WILL EVER USE!", "www.IB4G.net - A VERY CLEAN, HIGH-QUALITY AND BUG-FREE PASTE!", "www.IB4G.net - ALWAYS UPDATED! NEVER GETS OUTDATED!", "www.IB4G.net - WITH A FUCK TON OF NEW FEATURES!", "www.IB4G.net - ONCE YOU GO BLACK, YOU NEVER GO BACK. GET IDIOTBOX NOW!", "www.IB4G.net - SACRIFICE A FEW FRAMES FOR THE BEST EXPERIENCE OF YOUR LIFE!", "www.IB4G.net - STEAM GROUP WAS TAKEN DOWN, BUT IT'S BACK BABY!", "www.IB4G.net - BEST GARRY'S MOD CHEAT, NO CAP!", "www.IB4G.net - WITH IDIOTBOX, YOU'LL NEVER GET BANNED FOR CHEATING AGAIN!", "www.IB4G.net - DISCORD SERVER WAS TAKEN DOWN MANY TIMES, BUT WE ALWAYS COME BACK!",}
	local horstwessellied = {"Die Fahne hoch! Die Reihen fest geschlossen", "SA marschiert mit ruhig festem Schritt", "Kam'raden, die Rotfront und Reaktion erschossen", "Marschier'n im Geist in unser'n Reihen mit", "Die Straße frei den braunen Bataillonen", "Die Straße frei dem Sturmabteilungsmann", "Es schau'n aufs Hakenkreuz voll Hoffnung schon Millionen", "Der Tag für Freiheit und für Brot bricht an", "Zum letzten Mal wird Sturmalarm geblasen", "Zum Kampfe steh'n wir alle schon bereit", "Schon flattern Hitlerfahnen über allen Straßen", "Die Knechtschaft dauert nur noch kurze Zeit", "Die Fahne hoch! Die Reihen fest geschlossen", "SA marschiert mit ruhig festem Schritt", "Kam'raden, die Rotfront und Reaktion erschossen", "Marschier'n im Geist in unser'n Reihen mit",}
	local ssmarschiertinfeindesland = {"SS marschiert in Feindesland", "Und singt ein Teufelslied", "Ein Schütze steht am Wolgastrand", "Und leise summt er mit", "Wir pfeifen auf Unten und Oben", "Und uns kann die ganze Welt", "Verfluchen oder auch loben", "Grad wie es jedem gefällt", "Wo wir sind da geht's immer vorwärts", "Und der Teufel, der lacht nur dazu", "Ha, ha, ha, ha, ha, ha", "Wir kämpfen für Deutschland", "Wir kämpfen für Hitler", "Der Rote kommt niemehr zur Ruh'", "Wir kämpften schon in mancher Schlacht", "In Nord, Süd, Ost und West", "Und stehen nun zum Kampf bereit", "Gegen die rote Pest", "SS wird nicht ruh'n, wir vernichten", "Bis niemand mehr stört Deutschlands Glück", "Und wenn sich die Reihen auch lichten", "Für uns gibt es nie ein Zurück", "Wo wir sind da geht's immer vorwärts", "Und der Teufel, der lacht nur dazu", "Ha, ha, ha, ha, ha, ha", "Wir kämpfen für Deutschland", "Wir kämpfen für Hitler", "Der Rote kommt niemehr zur Ruh'",}
	local siegheilviktoria = {"Ade, mein liebes Schätzelein", "Ade, ade, ade", "Es muß, es muß geschieden sein", "Ade, ade, ade", "Es geht um Deutschlands Gloria", "Gloria, Gloria", "Sieg Heil! Sieg Heil Viktoria!", "Sieg Heil, Viktoria!", "Visier und Ziel sind eingestellt", "Ade, ade, ade", "Auf Stalin, Churchill, Roosevelt", "Ade, ade, ade", "Es geht um Deutschlands Gloria", "Gloria, Gloria", "Sieg Heil! Sieg Heil Viktoria!", "Sieg Heil, Viktoria!", "Wir ruhen und wir rasten nicht", "Ade, ade, ade", "Bis daß die Satansbrut zerbricht", "Ade, ade, ade", "Es geht um Deutschlands Gloria", "Gloria, Gloria", "Sieg Heil! Sieg Heil Viktoria!", "Sieg Heil, Viktoria!", "Reich mir die Hand zum Scheidegruß", "Ade, ade, ade", "Und deinen Mund zum Abschiedskuß", "Ade, ade, ade", "Es geht um Deutschlands Gloria", "Gloria, Gloria", "Sieg Heil! Sieg Heil Viktoria!", "Sieg Heil, Viktoria!",}
	if (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Nazi 1") then
		RunConsoleCommand("say", horstwessellied[math.random(#horstwessellied)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Nazi 2") then
		RunConsoleCommand("say", ssmarschiertinfeindesland[math.random(#ssmarschiertinfeindesland)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Nazi 3") then
		RunConsoleCommand("say", siegheilviktoria[math.random(#siegheilviktoria)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Advertising 1") then
		RunConsoleCommand("say", advertise[math.random(#advertise)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Advertising 2") then
		RunConsoleCommand("say", lmaoboxadvertise[math.random(#lmaoboxadvertise)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Advertising 3") then
        RunConsoleCommand("say", toxicadvertise[math.random(#toxicadvertise)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Hebrew Spam") then
        RunConsoleCommand("say", HebrewFunni[math.random(#HebrewFunni)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Arabic Spam") then
        RunConsoleCommand("say", ArabFunni[math.random(#ArabFunni)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "'H' Spam") then
		RunConsoleCommand("say", "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH")
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "N-Word Spam") then
		RunConsoleCommand("say", "nigger")
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "N-WORD SPAM") then
		RunConsoleCommand("say", "NIGGER")
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Clear Chat") then
		ChatClear.Run()
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "OOC Clear Chat") then
		ChatClear.OOC()
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Offensive Spam") then
		RunConsoleCommand("say", offensivespam[math.random(#offensivespam)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Insult Spam") then
	local randply = player.GetAll()[math.random(#player.GetAll())]
	local friendstatus = pm.GetFriendStatus(randply)
	if (!randply:IsValid() || randply == me || (friendstatus == "friend") || (gBool("Miscellaneous", "Priority List", "Enabled") && table.HasValue(ignore_list, randply:UniqueID())) || (gBool("Miscellaneous", "Priority List", "Enabled") && gBool("Miscellaneous", "Chat", "Priority Targets Only") && !table.HasValue(priority_list, randply:UniqueID()))) then return end
		RunConsoleCommand("say", randply:Name()..insultspam[math.random(#insultspam)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Message Spam") then
		local v = player.GetAll()[math.random(#player.GetAll())]
		if (gBool("Miscellaneous", "Priority List", "Enabled") && table.HasValue(ignore_list, v:UniqueID())) || (gBool("Miscellaneous", "Priority List", "Enabled") && gBool("Miscellaneous", "Chat", "Priority Targets Only") && !table.HasValue(priority_list, v:UniqueID())) then return end
		if (v != me && v:GetFriendStatus() != "friend" && !pm.IsAdmin(v)) then
			LocalPlayer():ConCommand("ulx psay \""..v:Nick().."\" "..messagespam[math.random(#messagespam)])
		end
	end
end

CreateClientConVar("idiot_changename", "www.IB4G.net | Cry, dog!", true, false)

local namechangeTime = 0

local function EmoteSpam()
	local randomemote = {"dance", "muscle", "wave", "robot", "bow", "cheer", "laugh", "zombie", "agree", "disagree", "forward", "becon", "salute", "pose", "halt", "group",}
	if gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Dance" then
		RunConsoleCommand("act", "dance")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Sexy" then
		RunConsoleCommand("act", "muscle")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Wave" then
		RunConsoleCommand("act", "wave")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Robot" then
		RunConsoleCommand("act", "robot")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Bow" then
		RunConsoleCommand("act", "bow")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Cheer" then
		RunConsoleCommand("act", "cheer")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Laugh" then
		RunConsoleCommand("act", "laugh")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Zombie" then
		RunConsoleCommand("act", "zombie")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Agree" then
		RunConsoleCommand("act", "agree")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Disagree" then
		RunConsoleCommand("act", "disagree")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Forward" then
		RunConsoleCommand("act", "forward")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Back" then
		RunConsoleCommand("act", "becon")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Salute" then
		RunConsoleCommand("act", "salute")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Pose" then
		RunConsoleCommand("act", "pers")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Halt" then
		RunConsoleCommand("act", "halt")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Group" then
		RunConsoleCommand("act", "group")
	elseif gOption("Miscellaneous", "Miscellaneous", "Emotes:") == "Random" then
		RunConsoleCommand("act", randomemote[math.random(#randomemote)])
	end
end

local function WallhackFilter(v)
	if (gBool("Visuals", "Miscellaneous", "Distance Limit")) then
		local dist = gBool("Visuals", "Miscellaneous", "Distance:")
			if (vm.Distance(em.GetPos(v), em.GetPos(me)) > (dist * 5)) then return false end
		end
	return true
end

local function EnemyWallhackFilter(v)
	if gBool("Visuals", "Miscellaneous", "Show Enemies Only") then
		if (pm.Team(v) == pm.Team(me)) then return false end
	end
	return true
end

local function GetChamsColor(v)
    if (pm.Team(v) == pm.Team(me)) then
		local r = teamchamscol.r
		local g = teamchamscol.g
		local b = teamchamscol.b
		return(Color(r, g, b, 220))
    end
		local r = enemychamscol.r
		local g = enemychamscol.g
		local b = enemychamscol.b
    return(Color(r, g, b, 220))
end

local function Chams(v)
	local chamsmat = CreateMaterial("a", "VertexLitGeneric", {
		["$ignorez"] = 1, 
		["$basetexture"] = "models/debug/debugwhite", 
	})
	local chamsmat2 = CreateMaterial("aa", "VertexLitGeneric", {
		["$ignorez"] = 0, 
		["$basetexture"] = "models/debug/debugwhite", 
	})
	local col = (devs[v:SteamID()] || creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetChamsColor(v)
	local wep = v:GetActiveWeapon()
	if (gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignore_list, v:UniqueID())) or (gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(priority_list, v:UniqueID())) then
		return false
	end
	if gOption("Visuals", "Wallhack", "Chams:") == "Playermodel" then
	if wep:IsValid() then
	cam.Start3D()
	cam.IgnoreZ(true)
	em.DrawModel(wep)
	cam.IgnoreZ(false)
	cam.End3D()
	end
	cam.Start3D()
	cam.IgnoreZ(true)
	em.DrawModel(v)
	cam.IgnoreZ(false)
	cam.End3D()
	end
	if gOption("Visuals", "Wallhack", "Chams:") == "Normal" then
	if wep:IsValid() then
	cam.Start3D()
	render.MaterialOverride(chamsmat)
	render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
	em.DrawModel(wep)
	render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
	render.MaterialOverride(chamsmat2)
	em.DrawModel(wep)
	render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	cam.Start3D()
	render.MaterialOverride(chamsmat)
	render.SetColorModulation(col.b / 255, col.r / 255, col.g / 255)
	em.DrawModel(v)
	render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
	render.MaterialOverride(chamsmat2)
	em.DrawModel(v)
	render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
end
	
local function TransparentWalls()
    local mats = em.GetMaterials(game.GetWorld())
        for k, v in next, mats do
            local material = Material(v)
            if (!gBool("Miscellaneous", "Textures", "Transparent Walls")) then
                im.SetFloat(material, "$alpha", 1)
			continue
        end
        im.SetFloat(material, "$alpha", 0.75)
    end
end

local circlestrafeval = 0

local forwardspeedvar = GetConVar("cl_forwardspeed")

local forwardspeedval = 10000

if forwardspeedvar then
	forwardspeedval = forwardspeedvar:GetFloat()
end

local sidespeedvar = GetConVar("cl_sidespeed")

local sidespeedval = 10000

if sidespeedvar then
	sidespeedval = sidespeedvar:GetFloat()
end

local function ClampMove(pCmd)
	if (pCmd:GetForwardMove() > forwardspeedval) then
		pCmd:SetForwardMove(forwardspeedval)
	end
	if (pCmd:GetSideMove() > sidespeedval) then
		pCmd:SetSideMove(sidespeedval)
	end
end

local function FixMove(pCmd, rotation)
	local rotcos = math.cos(rotation)
	local rotsin = math.sin(rotation)
	local curforwardmove = pCmd:GetForwardMove()
	local cursidemove = pCmd:GetSideMove()
	pCmd:SetForwardMove(((rotcos * curforwardmove) - (rotsin * cursidemove)))
	pCmd:SetSideMove(((rotsin * curforwardmove) + (rotcos * cursidemove)))
end

local function Circle(pCmd)
	local circlestrafespeed = gInt("Miscellaneous", "Movement", "Strafe Speed:")
		if gKey("Miscellaneous", "Movement", "Strafe Key:") then
			circlestrafeval = circlestrafeval + circlestrafespeed
		if ((circlestrafeval > 10000000) and ((circlestrafeval / circlestrafespeed) > 100000)) then
			circlestrafeval = 100000000
		end
		FixMove(pCmd, math.rad((circlestrafeval - engine.TickInterval())))
		return false
	else
		circlestrafeval = 0
	end
	return true
end

local timeHoldingSpaceOnGround = 0

local function BunnyHop(pCmd)
	if me:Team() == TEAM_SPECTATOR and not (gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:")) then return end
	if not me:Alive() or me:Health() < 1 then return end
	if gBool("Miscellaneous", "Movement", "Bunny Hop") and gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Off" then
    local badmovetypes = {
        [MOVETYPE_NOCLIP] = true,
        [MOVETYPE_LADDER] = true,
    }
    if(badmovetypes[LocalPlayer():GetMoveType()]) then return end
    if(LocalPlayer():IsOnGround()) then
        if(timeHoldingSpaceOnGround > 1) then
            timeHoldingSpaceOnGround = 0
            pCmd:RemoveKey(IN_JUMP)
        end
        if(pCmd:KeyDown(IN_JUMP)) then
            timeHoldingSpaceOnGround = timeHoldingSpaceOnGround + 1
        end
        return
    end
    local in_water = LocalPlayer():WaterLevel() >= 2
    if(in_water) then return end
    pCmd:RemoveKey(IN_JUMP)
	end
end

local function LegitStrafe(pCmd)
	if !me:IsOnGround() && pCmd:KeyDown(IN_JUMP) then
		pCmd:RemoveKey(IN_JUMP)
		if (pCmd:GetMouseX() > 1 || pCmd:GetMouseX() < - 1) then
			pCmd:SetSideMove(pCmd:GetMouseX() > 1 && 10000 || - 10000)
		else
			pCmd:SetSideMove(0)
		end
	elseif pCmd:KeyDown(IN_JUMP) then
		pCmd:SetForwardMove(10000)
	end
end

local function RageStrafe(pCmd)
	if !me:IsOnGround() && pCmd:KeyDown(IN_JUMP) then
		pCmd:RemoveKey(IN_JUMP)
		if (pCmd:GetMouseX() > 1 || pCmd:GetMouseX() < - 1) then
			pCmd:SetSideMove(pCmd:GetMouseX() > 1 && 10000 || - 10000)
		else
			pCmd:SetForwardMove(10000 / me:GetVelocity():Length2D())
			pCmd:SetSideMove((pCmd:CommandNumber() % 2 == 0) && - 10000 || 10000)
		end
	elseif pCmd:KeyDown(IN_JUMP) then
		pCmd:SetForwardMove(10000)
	end
end

local function CircleStrafe(pCmd)
	if me:Team() == TEAM_SPECTATOR and not (gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:")) then return end
	if not me:Alive() or me:Health() < 1 then return end
    local badmovetypes = {
        [MOVETYPE_NOCLIP] = true,
        [MOVETYPE_LADDER] = true,
    }
    if(badmovetypes[LocalPlayer():GetMoveType()]) then return end
		if !me:IsOnGround() && pCmd:KeyDown(IN_JUMP) then
			pCmd:RemoveKey(IN_JUMP)
		if (pCmd:GetMouseX() > 1 || pCmd:GetMouseX() < - 1) then
			pCmd:SetSideMove(pCmd:GetMouseX() > 1 && 10000 || - 10000)
		else
			pCmd:SetSideMove(0)
		end
		local localvelocity = me:GetVelocity()
		if (localvelocity:Length2D() < 50) then
			pCmd:SetForwardMove(forwardspeedval)
		end
		local shouldautostrafe = Circle(pCmd)
		if (!me:OnGround()) then
			if (shouldautostrafe) then
			end
		end
		elseif pCmd:KeyDown(IN_JUMP) then
			pCmd:SetForwardMove(10000)
		else
			circlestrafeval = 1
		end
	ClampMove(pCmd)
end

local old_yaw = 0.0

local fixmovement = fixmovement || nil

local function DirectionalStrafe(pCmd)
	if !fixmovement then fixmovement = cm.GetViewAngles(pCmd) end
	fixmovement = fixmovement + Angle(cm.GetMouseY(pCmd) * GetConVarNumber("m_pitch"), cm.GetMouseX(pCmd) * - GetConVarNumber("m_yaw"))
	fixmovement.x = math.Clamp(fixmovement.x, - 89, 89)
    fixmovement.y = math.NormalizeAngle(fixmovement.y)
    fixmovement.z = 0
	if !me:IsOnGround() && pCmd:KeyDown(IN_JUMP) then
		pCmd:RemoveKey(IN_JUMP)
			local get_velocity_degree = function(velocity)
            local tmp = math.deg(math.atan(30.0 / velocity))
            if (tmp > 90.0) then
                return 90.0
            elseif (tmp < 0.0) then
                return 0.0
            else
                return tmp
            end
        end
        local M_RADPI = 57.295779513082
        local side_speed = 10000
        local velocity = LocalPlayer():GetVelocity()
        velocity.z = 0.0
        local forwardmove = pCmd:GetForwardMove()
        local sidemove = pCmd:GetSideMove()
        if (!forwardmove || !sidemove) then
            return
        end
        local flip = pCmd:TickCount() % 2 == 0
        local turn_direction_modifier = flip && 1.0 || - 1.0
        local viewangles = Angle(fixmovement.x, fixmovement.y, fixmovement.z)
        if (forwardmove || sidemove) then
            pCmd:SetForwardMove(0)
            pCmd:SetSideMove(0)
            local turn_angle = math.atan2( - sidemove, forwardmove)
            viewangles.y = viewangles.y + (turn_angle * M_RADPI)
        elseif (forwardmove) then
            pCmd:SetForwardMove(0)
        end
        local strafe_angle = math.deg(math.atan(15 / velocity:Length2D()))
        if (strafe_angle > 90) then
            strafe_angle = 90
        elseif (strafe_angle < 0) then
            strafe_angle = 0
        end
        local temp = Vector(0, viewangles.y - old_yaw, 0)
        temp.y = math.NormalizeAngle(temp.y)
        local yaw_delta = temp.y
        old_yaw = viewangles.y
        local abs_yaw_delta = math.abs(yaw_delta)
        if (abs_yaw_delta <= strafe_angle || abs_yaw_delta >= 30) then
            local velocity_angles = velocity:Angle()
            temp = Vector(0, viewangles.y - velocity_angles.y, 0)
            temp.y = math.NormalizeAngle(temp.y)
            local velocityangle_yawdelta = temp.y
            local velocity_degree = get_velocity_degree(velocity:Length2D() * 128)
            if (velocityangle_yawdelta <= velocity_degree || velocity:Length2D() <= 15) then
                if ( - velocity_degree <= velocityangle_yawdelta || velocity:Length2D() <= 15) then
                    viewangles.y = viewangles.y + (strafe_angle * turn_direction_modifier)
                    pCmd:SetSideMove(side_speed * turn_direction_modifier)
                else
                    viewangles.y = velocity_angles.y - velocity_degree
                    pCmd:SetSideMove(side_speed)
                end
            else
                viewangles.y = velocity_angles.y + velocity_degree
                pCmd:SetSideMove( - side_speed)
            end
        elseif (yaw_delta > 0) then
            pCmd:SetSideMove( - side_speed)
        elseif (yaw_delta < 0) then
            pCmd:SetSideMove(side_speed)
        end
        local move = Vector(pCmd:GetForwardMove(), pCmd:GetSideMove(), 0)
        local speed = move:Length()
        local angles_move = move:Angle()
		local normalized_x = math.modf(fixmovement.x + 180, 360) - 180
        local normalized_y = math.modf(fixmovement.y + 180, 360) - 180
        local yaw = math.rad(normalized_y - viewangles.y + angles_move.y)
        if (normalized_x >= 90 || normalized_x <= - 90 || fixmovement.x >= 90 && fixmovement.x <= 200 || fixmovement.x <= - 90 && fixmovement.x <= 200) then
            pCmd:SetForwardMove( - math.cos(yaw) * speed)
        else
            pCmd:SetForwardMove(math.cos(yaw) * speed)
        end
		pCmd:SetSideMove(math.sin(yaw) * speed)
	elseif pCmd:KeyDown(IN_JUMP) then
		pCmd:SetForwardMove(10000)
	end
end

local function AutoStrafe(pCmd)
    if me:Team() == TEAM_SPECTATOR and not (gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:")) then return end
	if not me:Alive() or me:Health() < 1 then return end
	if gBool("Miscellaneous", "Movement", "Bunny Hop") and gOption("Miscellaneous", "Movement", "Auto Strafe:") ~= "Off" then
    local badmovetypes = {
        [MOVETYPE_NOCLIP] = true,
        [MOVETYPE_LADDER] = true,
    }
    if(badmovetypes[LocalPlayer():GetMoveType()]) then return end
		if (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Legit") then
			LegitStrafe(pCmd)
		elseif (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Rage") then
			RageStrafe(pCmd)
		elseif (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Circle") then
			CircleStrafe(pCmd)
		elseif (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Directional") then
			DirectionalStrafe(pCmd)
		end
	end
end

local function AirCrouch(pCmd)
	if em.GetMoveType(me) == MOVETYPE_NOCLIP then return end
	if me:Team() == TEAM_SPECTATOR and not (gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:")) then return end
	if not me:Alive() or me:Health() < 1 then return end
	if LocalPlayer():IsFlagSet(1024) then return end
	if gBool("Miscellaneous", "Movement", "Air Crouch") then
	local pos = me:GetPos()
	local trace = {
		start = pos, 
		endpos = pos - idiot.Vector(0, 0, 50), 
		mask = MASK_PLAYERSOLID, 
	}
	local trace = util.TraceLine(trace)
	local height = (pos - trace.HitPos).z
	if (height > 25 and 50 > height) then
		pCmd:SetButtons(pCmd:GetButtons() + IN_DUCK)
		end
	end
end

local function TraitorDetector()
	if idiot.engine.ActiveGamemode() ~= "terrortown" then return end
	if gBool("Visuals", "Miscellaneous", "Traitor Finder") then
	for k, v in idiot.ipairs(idiot.ents.GetAll()) do
		local _v = v:GetOwner()
		if (_v == me) then continue end
		if (idiot.GetRoundState() == 3 and v:IsWeapon() and _v:IsPlayer() and not _v.Detected and idiot.table.HasValue(v.CanBuy, 1)) then
			if (_v:GetRole() ~= 2) then
				_v.Detected = true
				MsgY(4.3, _v:Nick().." is a Traitor. He just bought: "..v:GetPrintName())
				surface.PlaySound("npc/scanner/combat_scan1.wav")
			end
		elseif (idiot.GetRoundState() ~= 3) then
				v.Detected = false
			end
		end
	end
end

local function MurdererDetector()
	if not (gBool("Visuals", "Miscellaneous", "Murderer Finder")) then return end
	if (idiot.engine.ActiveGamemode() ~= "murder") then return end
	for k, v in idiot.ipairs(idiot.player.GetAll()) do
		if (v == me) then continue end
		if (GAMEMODE.RoundStage == 1 and not v.Detected and not v.Magnum) then
			if (v:HasWeapon("weapon_mu_knife")) then
				v.Detected = true
				MsgY(4.3, (v:Nick().." ("..v:GetNWString("bystanderName")..") is the murderer."))
				surface.PlaySound("buttons/lightswitch2.wav")
			end
			if (v:HasWeapon("weapon_mu_magnum")) then
				v.Magnum = true
				timer.Create("ChatPrint", 4.8, 1, function() MsgY (4.3, (v:Nick().." ("..v:GetNWString("bystanderName")..") has a magnum.")) end)
				timer.Create("PlaySound", 4.8, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
			else
				v.Magnum = false
			end
		elseif (GAMEMODE.RoundStage ~= 1) then
			v.Detected = false
			v.Magnum = false
		end
	end
end

local usespam = false

concommand.Add("idiot_usespam", function()
    usespam = !usespam
end)

timer.Create("usespam", 0, 0, function()
	if not usespam then return end
		RunConsoleCommand("+use")
		timer.Simple(0, function()
		RunConsoleCommand("-use")
	end)
end)

local function Think()
	local randomname = {"Mike Hawk", "Moe Lester", "Mike Hunt", "Ben Dover", "Harold Kundt", "Peter Pain", "Dusan Mandic", "Harry Gooch", "Mike Oxlong", "Ivana Dooyu", "Slim Shader", "Dead Walker", "Mike Oxbig", "Mike Rotch", "Hugh Jass", "Robin Banks", "Mike Litt", "Harry Wang", "Harry Cox", "Moss Cular", "Amanda Reen", "Major Kumm", "Willie Wang", "Hugh Blackstuff", "Mike Rap", "Al Coholic", "Cole Kutz", "Mike Litoris", "Dixie Normous", "Dick Pound", "Mike Ock", "Sum Ting Wong", "Ho Lee Fuk", "Harry Azcrac", "Jay L. Bate", "Hugh G. Rection", "Long Wang", "Wayne King",}
	if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menuopen and not menukeydown) then
		menuopen = true
		menukeydown = true
		MenuBorder()
		Menu()
	elseif (not (input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menuopen) then
		menukeydown = false
	end
	if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and menukeydown and menuopen) then
		menukeydown2 = true
	else
		menukeydown2 = false
	end
	if gOption("Miscellaneous", "Chat", "Chat Spam:") ~= "Off" then
		ChatSpam()
	end
	if gOption("Miscellaneous", "Miscellaneous", "Emotes:") ~= "Off" then
		EmoteSpam()
	end
	if gBool("Miscellaneous", "Miscellaneous", "Flash Spam") and input.IsKeyDown(KEY_F) and not (LocalPlayer():IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible() or menuopen) then
		RunConsoleCommand("impulse", "100")
	end
	if gBool("Miscellaneous", "Miscellaneous", "Use Spam") and input.IsKeyDown(KEY_E) and not (LocalPlayer():IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible() or menuopen) then
		RunConsoleCommand("idiot_usespam")
	end
	if gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "Normal" or gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "Priority Targets" then
	local randply = player.GetAll()[math.random(#player.GetAll())]
	local friendstatus = pm.GetFriendStatus(randply)
	hook.Remove("Think", "Hook6")
	hook.Add("Think", "Hook5", function()
	if (!randply:IsValid() || randply == me || friendstatus == "friend" || (gBool("Miscellaneous", "Priority List", "Enabled") && table.HasValue(ignore_list, randply:UniqueID())) || (gBool("Miscellaneous", "Priority List", "Enabled") && gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "Priority Targets" && !table.HasValue(priority_list, randply:UniqueID()))) then return end
		IdiotBox.ChangeName(randply:Name().." ")
	end)
	elseif !gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "DarkRP Name" then
	hook.Remove("Think", "Hook5")
	hook.Add("Think", "Hook6", function()
		IdiotBox.ChangeName(myName)
		end)
	end
	if gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "DarkRP Name" then
		namechangeTime = namechangeTime + 1
		if namechangeTime > 500 then
		RunConsoleCommand("say", "/name "..randomname[math.random(#randomname)])
		namechangeTime = 0
		end
	end
	if (gBool("Main Menu", "Others", "Apply custom name")) then
		hook.Add("Think", "Hook7", function()
		IdiotBox.ChangeName(GetConVarString("idiot_changename"))
		if not Confirmed1 then
		MsgG(3.2, "Successfully applied custom name.")
		surface.PlaySound("buttons/lightswitch2.wav")
		Confirmed1 = true
		end
		end)
	end
end

local function HookExist(name, identifier)
    for k, v in pairs(hook.GetTable()) do
        if k == name then
            for a, b in pairs(v) do
                if a == identifier then
                    return true
                end
            end
            return false
        end
    end
end

local displayed = false

local blackscreen = false

local footprints = false

local looped_props = false

local tauntspam = {"funny", "help", "scream", "morose",}

local function CheckChild(pan)
	if (pan and pan:IsValid() and not menuopen and not me:IsTyping() and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() and not (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) then
		removewindow = true
		if input.IsKeyDown(17) then
			if pan.GetTitle then
				MsgR(4.3, "IdiotBox successfully removed \""..pan:GetTitle().."\".")
				surface.PlaySound("buttons/lightswitch2.wav")
			end
			pan:Remove()
			return
		end
		for k, v in pairs(pan:GetChildren()) do
			if input.IsKeyDown(17) then
				if v.GetTitle then
					MsgR(4.3, "IdiotBox successfully removed \""..v:GetTitle().."\".")
					surface.PlaySound("buttons/lightswitch2.wav")
				end
				v:Remove()
				return
			end
			if #v:GetChildren() > 0 then
				CheckChild(v)
			end
		end
	else
		if removewindow then
			removewindow = false
		end
	end
end

hook.Add("Think", "Hook8", function()
	TraitorDetector()
	MurdererDetector()
	TransparentWalls()
	Think()
	if gBool("Main Menu", "General Utilities", "Optimize Game") then
		if not optimized then
			me:ConCommand("r_cleardecals; M9KGasEffect 0")
		optimized = true
		end
	else
		if optimized then
			me:ConCommand("M9KGasEffect 1")
		optimized = false
		end
	end
	if gBool("Aimbot", "Miscellaneous", "No Lerp") then
		if not applied then
			me:ConCommand("cl_interp 0; cl_interp_ratio 0; cl_updaterate 99999")
		applied = true
		end
	else
		if applied then
			me:ConCommand("cl_interp 0; cl_interp_ratio 2; cl_updaterate 30")
		applied = false
		end
	end
	if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Hide Round Report") and idiot.engine.ActiveGamemode() == "terrortown" then
		if not displayed then
			function CLSCORE:ShowPanel() return end
		displayed = true
		end
	end
	if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Panel Remover") and idiot.engine.ActiveGamemode() == "terrortown" then
		local pan = vgui.GetHoveredPanel()
		CheckChild(pan)
	end
	if gBool("Main Menu", "Murder Utilities", "Hide End Round Board") and idiot.engine.ActiveGamemode() == "murder" then
		if not displayed then
			function GAMEMODE:DisplayEndRoundBoard(data) return end
			displayed = true
		end
	end
	if gBool("Main Menu", "Murder Utilities", "Hide Footprints") and idiot.engine.ActiveGamemode() == "murder" then
		if not footprints then
			function GAMEMODE:DrawFootprints() return end
			footprints = true
		end
	end
	if gBool("Main Menu", "Murder Utilities", "No Black Screens") and idiot.engine.ActiveGamemode() == "murder" then
		if not blackscreen then
			function GAMEMODE:RenderScreenspaceEffects() return end
			function GAMEMODE:PostDrawHUD() return end
			blackscreen = true
		end
	end
	if idiot.engine.ActiveGamemode() == "murder" and (me:Alive() or me:Health() > 0) then
		if gOption("Miscellaneous", "Miscellaneous", "Murder Taunts:") == "Funny" then
			RunConsoleCommand("mu_taunt", "funny")
		elseif gOption("Miscellaneous", "Miscellaneous", "Murder Taunts:") == "Funny" == "Help" then
			RunConsoleCommand("mu_taunt", "help")
		elseif gOption("Miscellaneous", "Miscellaneous", "Murder Taunts:") == "Funny" == "Scream" then
			RunConsoleCommand("mu_taunt", "scream")
		elseif gOption("Miscellaneous", "Miscellaneous", "Murder Taunts:") == "Funny" == "Morose" then
			RunConsoleCommand("mu_taunt", "morose")
		elseif gOption("Miscellaneous", "Miscellaneous", "Murder Taunts:") == "Funny" == "Random" then
			RunConsoleCommand("mu_taunt", tauntspam[math.random(#tauntspam)])
		end
	end
	if gBool("Main Menu", "DarkRP Utilities", "Suicide Near Arrest Batons") and idiot.engine.ActiveGamemode() == "darkrp" and (me:Alive() or me:Health() > 0) then
		for k, v in next, player.GetAll() do
			if not v:IsValid() or v:Health() < 1 or v:IsDormant() or v == me then continue end
			if gBool("Aimbot", "Aim Priorities", "Ignore Friends") and v:GetFriendStatus() == "friend" then continue end
			if v:GetPos():Distance(me:GetPos()) < 95 and v:GetActiveWeapon():GetClass() == "arrest_stick" and me:GetPos():Distance(v:GetEyeTrace().HitPos) < 105 then
				me:ConCommand("kill")
			end
		end
	end
	if gBool("Main Menu", "DarkRP Utilities", "Transparent Props") and idiot.engine.ActiveGamemode() == "darkrp" then
		for k, v in next, ents.FindByClass("prop_physics") do
			v:SetRenderMode(RENDERMODE_TRANSCOLOR)
			v:SetKeyValue("renderfx", 0)
			v:SetColor(Color(255, 255, 255, gInt("Main Menu", "DarkRP Utilities", "Transparency:")))
		end
		if looped_props then
			looped_props = false
		end
	else
		if not looped_props then
			for k, v in next, ents.FindByClass("prop_physics") do
				v:SetColor(Color(255, 255, 255, 255))
			end
			looped_props = true
		end
	end
	if (gBool("Main Menu", "General Utilities", "Anti-Blind")) then
		if (HookExist("HUDPaint", "ulx_blind")) then
			MsgR(4.3, "IdiotBox successfully blocked a blinding attempt.")
			surface.PlaySound("buttons/lightswitch2.wav")
			hook.Remove("HUDPaint", "ulx_blind")
        end
    end
	if MOTDgd or MOTDGD then
		function MOTDgd.GetIfSkip()
		if (gBool("Main Menu", "General Utilities", "Anti-Ads")) then
			MsgR(4.3, "IdiotBox successfully blocked an advertisement.")
			surface.PlaySound("buttons/lightswitch2.wav")
			return true
			end
		end
	end
end)

hook.Add("PreDrawSkyBox", "Hook9", function()
	if (!gBool("Miscellaneous", "Textures", "No Sky")) then return end
		render.Clear(0, 0, 0, 255)
	return true
end)

hook.Add("PreDrawViewModel", "Hook10", function()
	if (gBool("Miscellaneous", "Point of View", "Thirdperson")) then return end
	local rainbow = HSVToColor(RealTime() * 45 % 360, 1, 1)
	local WepMat1 = Material("models/wireframe")
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Wireframe:") == "Normal") then
	render.MaterialOverride(WepMat1)
	render.SetColorModulation(viewmodelcol.r / 255, viewmodelcol.g / 255, viewmodelcol.b / 255)
	end
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Wireframe:") == "Rainbow") then
	render.MaterialOverride(WepMat1)
	render.SetColorModulation(rainbow.r / 255, rainbow.g / 255, rainbow.b / 255)
	end
	local WepMat2 = Material("models/debug/debugwhite")
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Chams:") == "Normal") then
	render.MaterialOverride(WepMat2)
	render.SetColorModulation(viewmodelcol.r / 255, viewmodelcol.g / 255, viewmodelcol.b / 255)
	end
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Chams:") == "Rainbow") then
	render.MaterialOverride(WepMat2)
	render.SetColorModulation(rainbow.r / 255, rainbow.g / 255, rainbow.b / 255)
	end
	if (gBool("Miscellaneous", "Viewmodel", "No Viewmodel") or gBool("Miscellaneous", "Point of View", "Thirdperson")) then
	return true
	else
	return false
	end
end)

hook.Add("PreDrawPlayerHands", "Hook11", function()
	if (gBool("Miscellaneous", "Viewmodel", "No Hands") or gBool("Miscellaneous", "Point of View", "Thirdperson")) then
		return true
	else
		return false
	end
end)

local function AutoReload(pCmd)
	local wep = me:GetActiveWeapon()
	if (not gBool("Aimbot", "Miscellaneous", "Auto Reload")) then return end
	if (me:Alive() or me:Health() > 0) and idiot.IsValid(wep) then
		if (wep:Clip1() <= (gInt("Aimbot", "Miscellaneous", "Auto Reload at:")) and wep:GetMaxClip1() > 0 and idiot.CurTime() > wep:GetNextPrimaryFire()) then
			pCmd:SetButtons(pCmd:GetButtons() + IN_RELOAD)
		end
	end
end

local function GetColor(v)
    if (pm.Team(v) == pm.Team(me)) then
		local r = teamvisualscol.r
		local g = teamvisualscol.g
		local b = teamvisualscol.b
		return(Color(r, g, b, 220))
    end
		local r = enemyvisualscol.r
		local g = enemyvisualscol.g
		local b = enemyvisualscol.b
	return(Color(r, g, b, 220))
end

local function Visuals(v)
	local pos = em.GetPos(v)
	local min, max = em.GetCollisionBounds(v)
	local pos2 = pos + Vector(0, 0, max.z)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local hh = 0
	local h = pos.y - pos2.y
	local w = h / 2
	local ww = h / 4
	local col = (devs[v:SteamID()] || creator[v:SteamID()]) && Color(0, 0, 0) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local ocol = (devs[v:SteamID()] || creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || Color(0, 0, 0)
	local colololol = gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local ocolololol = (devs[v:SteamID()] || creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local teamcol = (devs[v:SteamID()] || creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b)
	local teamocol = gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b)
	local hh = 0
	if (gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignore_list, v:UniqueID())) or (gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(priority_list, v:UniqueID())) then
		return false
	end
	if gOption("Visuals", "Wallhack", "Box:") == "2D Box" then
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") && !(devs[v:SteamID()] || creator[v:SteamID()]) then
			surface.SetDrawColor(friendvisualscol.r, friendvisualscol.g, friendvisualscol.b)
			surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h)
			surface.SetDrawColor(ocol)
			surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2)
			surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2)
		else
			surface.SetDrawColor(col)
			surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h)
			surface.SetDrawColor(ocol)
			surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2)
			surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2)
		end
	end
	if gOption("Visuals", "Wallhack", "Box:") == "3D Box" then
	for k, v in pairs(player.GetAll()) do
	if v != LocalPlayer() and v:IsValid() and v:Alive() and v:Health() > 0 then
		local eye = v:EyeAngles()
		local min, max = v:WorldSpaceAABB()
		local origin = v:GetPos()
		if !(devs[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, colololol)
			cam.End3D()
		elseif (devs[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, HSVToColor(RealTime() * 45 % 360, 1, 1))
			cam.End3D()
		elseif friendstatus == "friend" && !(devs[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, Color(friendvisualscol.r, friendvisualscol.g, friendvisualscol.b))
			cam.End3D()
				end
			end
		end
	end
	if (gBool("Visuals", "Wallhack", "Enabled") && gOption("Visuals", "Wallhack", "Box:") == "Edged Box") then   
    surface.SetDrawColor(ocolololol)
	x1, y1, x2, y2 = ScrW() * 2, ScrH() * 2, - ScrW(), - ScrH()
		min, max = v:GetCollisionBounds()
		corners = {v:LocalToWorld(Vector(min.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, min.y, max.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, max.z)):ToScreen()}
		for _k, _v in next, corners do
			x1, y1 = math.min(x1, _v.x), math.min(y1, _v.y)
			x2, y2 = math.max(x2, _v.x), math.max(y2, _v.y)
		end
		diff, diff2 = math.abs(x2 - x1), math.abs(y2 - y1)
				surface.DrawLine(x1 + 1, y1 + 1, x1 + (diff * 0.225), y1 + 1)
				surface.DrawLine(x1 + 1, y1 + 1, x1 + 1, y1 + (diff2 * 0.225))
				surface.DrawLine(x1 + 1, y2 - 1, x1 + (diff * 0.225), y2 - 1)
				surface.DrawLine(x1 + 1, y2 - 1, x1 + 1, y2 - (diff2 * 0.225))
				surface.DrawLine(x2 - 1, y1 + 1, x2 - (diff * 0.225), y1 + 1)
				surface.DrawLine(x2 - 1, y1 + 1, x2 - 1, y1 + (diff2 * 0.225))
				surface.DrawLine(x2 - 1, y2 - 1, x2 - (diff * 0.225), y2 - 1)
				surface.DrawLine(x2 - 1, y2 - 1, x2 - 1, y2 - (diff2 * 0.225))
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") && !(devs[v:SteamID()] || creator[v:SteamID()]) then
		surface.SetDrawColor(friendvisualscol.r, friendvisualscol.g, friendvisualscol.b)
		x1, y1, x2, y2 = ScrW() * 2, ScrH() * 2, - ScrW(), - ScrH()
		min, max = v:GetCollisionBounds()
		corners = {v:LocalToWorld(Vector(min.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, min.y, max.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, max.z)):ToScreen()}
		for _k, _v in next, corners do
			x1, y1 = math.min(x1, _v.x), math.min(y1, _v.y)
			x2, y2 = math.max(x2, _v.x), math.max(y2, _v.y)
		end
		diff, diff2 = math.abs(x2 - x1), math.abs(y2 - y1)
				surface.DrawLine(x1 + 1, y1 + 1, x1 + (diff * 0.225), y1 + 1)
				surface.DrawLine(x1 + 1, y1 + 1, x1 + 1, y1 + (diff2 * 0.225))
				surface.DrawLine(x1 + 1, y2 - 1, x1 + (diff * 0.225), y2 - 1)
				surface.DrawLine(x1 + 1, y2 - 1, x1 + 1, y2 - (diff2 * 0.225))
				surface.DrawLine(x2 - 1, y1 + 1, x2 - (diff * 0.225), y1 + 1)
				surface.DrawLine(x2 - 1, y1 + 1, x2 - 1, y1 + (diff2 * 0.225))
				surface.DrawLine(x2 - 1, y2 - 1, x2 - (diff * 0.225), y2 - 1)
				surface.DrawLine(x2 - 1, y2 - 1, x2 - 1, y2 - (diff2 * 0.225))
		end
     end
	surface.SetFont("VisualsFont")
	surface.SetTextColor(255, 255, 255)
	if (gBool("Visuals", "Wallhack", "Health Bar")) then
		local hp = h * em.Health(v) / 100
		if (hp > h) then hp = h end
		local diff = h - hp
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(pos.x - w / 2 - 8, pos.y - h - 1, 5, h + 2)
		surface.SetDrawColor((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0, 255)
		surface.DrawRect(pos.x - w / 2 - 7, pos.y - h + diff, 3, hp)
	end
	if (gBool("Visuals", "Wallhack", "Armor Bar")) then
		local armor = v:Armor() * h / 100
		if (armor > h) then armor = h end
		local diff = h - armor
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(pos.x + ww + 3, pos.y - h - 1, 5, h + 2)
		surface.SetDrawColor((100 - v:Armor()) * 2.55, v:Armor() * 2.55, 0, 255)
		surface.DrawRect(pos.x + ww + 4, pos.y - h + diff, 3, armor)
	end
	if (gBool("Visuals", "Wallhack", "Name")) then
        local col = Color(255, 255, 255)
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") then
		draw.SimpleText("Friend", "VisualsFont", pos.x, pos.y - h - 13 - 13, Color(friendvisualscol.r, friendvisualscol.g, friendvisualscol.b), 1, 1)
		end
		if (gBool("Visuals", "Wallhack", "Bystander Name") && idiot.engine.ActiveGamemode() == "murder") then
		draw.SimpleText(v:GetNWString("bystanderName"), "VisualsFont", pos.x, pos.y - h - 1 - (friendstatus == "friend" && 12 || 12), col, 1, 1)
		else
		draw.SimpleText(pm.Name(v), "VisualsFont", pos.x, pos.y - h - 1 - (friendstatus == "friend" && 12 || 12), col, 1, 1)
	end
	end
	if (gBool("Visuals", "Wallhack", "Enabled") and gBool("Visuals", "Wallhack", "Name")) then
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") then
			if creator[v:SteamID()] then
				draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime() * 45 % 360, 1, 1), 1, 1)
			end
			if devs[v:SteamID()] then
				draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime() * 45 % 360, 1, 1), 1, 1)
			end
		end
		if (friendstatus ~= "friend") then
			if creator[v:SteamID()] then
				draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime() * 45 % 360, 1, 1), 1, 1)
			end
			if devs[v:SteamID()] then
				draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime() * 45 % 360, 1, 1), 1, 1)
			end
		end
	end
	if (gBool("Visuals", "Wallhack", "Health Value")) then
	hh = hh + 1
	local col = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2, 0)
	draw.SimpleText(em.Health(v).." Health", "VisualsFont", pos.x, pos.y - 1 + hh, col, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Armor Value")) then
	hh = hh + 1
	local col = Color((100 - v:Armor()) * 2.55, v:Armor() * 2, 0)
	draw.SimpleText(v:Armor().." Armor", "VisualsFont", pos.x, pos.y - 1 + hh, col, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Weapon")) then
	hh = hh + 1
	local w = pm.GetActiveWeapon(v)
	if (w && em.IsValid(w)) then
	local col = Color(200, 150, 150)
	draw.SimpleText(w:GetPrintName(), "VisualsFont", pos.x, pos.y - 0 + hh, col, 1, 0)
	hh = hh + 9
	end
	end
	if (gBool("Visuals", "Wallhack", "Rank")) then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText(pm.GetUserGroup(v), "VisualsFont", pos.x, pos.y - 0 + hh, col, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Distance")) then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText(math.Round(v:GetPos():Distance(LocalPlayer():GetPos()) / 40).." Meters", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Velocity")) then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText(math.Round(v:GetVelocity():Length()).." Speed", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	end
	if gBool("Visuals", "Wallhack", "Conditions") and v:IsPlayer() then
	if v:InVehicle() then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*driving*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:GetMoveType() == MOVETYPE_NOCLIP then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*noclipping*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:IsDormant() then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*dormant*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:IsFlagSet(2) then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*crouching*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:GetMoveType() == MOVETYPE_LADDER then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*climbing*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:GetColor(v).a < 255 then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*spawning*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:IsFlagSet(64) then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*frozen*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:IsPlayingTaunt() then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*emoting*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:IsFlagSet(1024) then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*swimming*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:IsSprinting() then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*sprinting*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:IsTyping() then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*typing*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	elseif v:GetMoveType() == MOVETYPE_WALK or v:GetMoveType() == MOVETYPE_NONE then
	hh = hh + 1
	local col = Color(255, 255, 255)
	draw.SimpleText("*none*", "VisualsFont", pos.x, pos.y - 0 + hh, col1, 1, 0)
	hh = hh + 9
	end
	end
	if (gBool("Visuals", "Wallhack", "Steam ID")) then
	hh = hh + 1
	local col = Color(255, 255, 255)
	if (v:SteamID() ~= "NULL") then
	draw.SimpleText(v:SteamID(v), "VisualsFont", pos.x, pos.y - 0 + hh, col, 1, 0)
	else
	draw.SimpleText("BOT", "VisualsFont", pos.x, pos.y - 0 + hh, col, 1, 0)
	end
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Ping")) then
	hh = hh + 1
	local col = Color(v:Ping() * 2.55, 255 - v:Ping() - 5 * 2, 0)
	draw.SimpleText(v:Ping().."ms", "VisualsFont", pos.x, pos.y - 0 + hh, col, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "DarkRP Money")) then
	hh = hh + 1
	if (gmod.GetGamemode().Name == "DarkRP") then
	local col = Color(0, 255, 0)
	if (v:getDarkRPVar("money") == nil) then return end
	draw.SimpleText("$"..v:getDarkRPVar("money"), "VisualsFont", pos.x, pos.y - 0 + hh, col, 1, 0)
	hh = hh + 9
	end
	end
	if (gBool("Visuals", "Wallhack", "Skeleton")) then
		local col = gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
		local pos = em.GetPos(v)
		for i = 0, em.GetBoneCount(v) do
		local parent = em.GetBoneParent(v, i)
		if (!parent) then continue end
		local bonepos = em.GetBonePosition(v, i)
		if (bonepos == pos) then continue end
		local parentpos = em.GetBonePosition(v, parent)
		if (!bonepos || !parentpos) then continue end
		local screen1, screen2 = vm.ToScreen(bonepos), vm.ToScreen(parentpos)
		surface.SetDrawColor(teamcol)
		surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
		end
	end
	if (gBool("Visuals", "Wallhack", "Glow")) then
		local wep = v:GetActiveWeapon()
		halo.Add({v, wep}, teamcol, .55, .55, 5, true, true)
	end
	idiot.cam.Start3D()
		if (gBool("Visuals", "Wallhack", "Vision Line")) then
			local b1, b2 = v:EyePos(), v:GetEyeTrace().HitPos
			idiot.render.DrawLine(b1, b2, teamcol)
			idiot.render.DrawWireframeSphere(b2, 2, 10, 10, teamcol, b2)
		end
	idiot.cam.End3D()
	if (gBool("Visuals", "Wallhack", "Hitbox")) then
		for k, v in next, player.GetAll() do
			for i = 0, v:GetHitBoxGroupCount() - 1 do
			for _i = 0, v:GetHitBoxCount(i) - 1 do
			local bone = v:GetHitBoxBone(_i, i)
			if not (bone) then continue end			
			local min, max = v:GetHitBoxBounds(_i, i)			
			if (v:GetBonePosition(bone)) then
			local pos, ang = v:GetBonePosition(bone)
			if !(devs[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
			render.DrawWireframeBox(pos, ang, min, max, teamocol)
			cam.End3D()
		end
			end
		end
			end
		end
	end
	if (gBool("Visuals", "Wallhack", "Hitbox")) then
		for k, v in next, player.GetAll() do
			for i = 0, v:GetHitBoxGroupCount() - 1 do
			for _i = 0, v:GetHitBoxCount(i) - 1 do
			local bone = v:GetHitBoxBone(_i, i)
			if not (bone) then continue end			
			local min, max = v:GetHitBoxBounds(_i, i)
			if (v:GetBonePosition(bone)) then
			local pos, ang = v:GetBonePosition(bone)
			if (devs[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
			render.DrawWireframeBox(pos, ang, min, max, HSVToColor(RealTime() * 45 % 360, 1, 1))
			cam.End3D()
				end
			end
				end
			end
		end
	end
end

hook.Add("RenderScreenspaceEffects", "Hook12", function()
	if (not gBool("Visuals", "Wallhack", "Enabled")) then return end
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if menuopen then return end
		for k, v in next, player.GetAll() do
		if (not em.IsValid(v) or em.Health(v) < 1 or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (!(gBool("Miscellaneous", "Point of View", "Thirdperson") and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or (pm.Team(v) == TEAM_SPECTATOR and not gBool("Visuals", "Miscellaneous", "Show Spectators"))) then continue end
		if (not WallhackFilter(v)) then continue end
		if (not EnemyWallhackFilter(v)) then continue end
		Chams(v)
	end
end)

local function ShowNPCs()
	for k, v in pairs(ents.FindByClass("npc_*")) do
	if not WallhackFilter(v) then continue end
	local col = Color(0, 255, 0)
	local col2 = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0, 255)
	local pos = em.GetPos(v)
	local min, max = em.GetCollisionBounds(v)
	local pos2 = pos + Vector(0, 0, max.z)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local hh = 0
	local h = pos.y - pos2.y
	local w = h / 1.7
	local hp = em.Health(v) * h / 100
	local health = em.Health(v)
	local col = (Color(entitiesvisualscol.r, entitiesvisualscol.g, entitiesvisualscol.b))
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos()) / 40)
	if health < 0 then
	health = 0
	end
	if v:Health() > 0 then
	surface.SetDrawColor(col)
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h)
	local ocol = (Color(0, 0, 0))
	surface.SetDrawColor(ocol)
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2)
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2)
	draw.SimpleText(v:GetClass(), "VisualsFont", pos.x, pos.y - h - 2 - 7, Color(255, 255, 255), 1, 1)
	surface.SetDrawColor(Color(0, 0, 0))
	local col1 = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0)
	draw.SimpleText(health.." HP", "VisualsFont", pos.x, pos.y - 2, col1, 1, 0)
	if (hp > h) then hp = h end
	local diff = h - hp
	surface.SetDrawColor(0, 0, 0, 255)
	surface.DrawRect(pos.x - w / 2 - 7, pos.y - h - 1, 5, h + 2)
	surface.SetDrawColor(col2)
	surface.DrawRect(pos.x - w / 2 - 6, pos.y - h + diff, 3, hp)
		end
	end
end

local aimtarget

local function OnScreen(v)
	if math.abs(v:LocalToWorld(v:OBBCenter()):ToScreen().x) < ScrW() * 5 and math.abs(v:LocalToWorld(v:OBBCenter()):ToScreen().y) < ScrH() * 5 then
		return true
	else
		return false
	end
end

hook.Add("DrawOverlay", "Hook13", function()
	if (gBool("Visuals", "Wallhack", "Enabled") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
		for k, v in next, player.GetAll() do
		if ((!(gBool("Miscellaneous", "Point of View", "Thirdperson") and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or not em.IsValid(v) or em.Health(v) < 0.1 or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (pm.Team(v) == TEAM_SPECTATOR and not gBool("Visuals", "Miscellaneous", "Show Spectators"))) then continue end
		if not WallhackFilter(v) then continue end
		if not EnemyWallhackFilter(v) then continue end
			Visuals(v)
		end
	end
	if (gBool("Visuals", "Wallhack", "Enabled") && gBool("Visuals", "Miscellaneous", "Traitor Finder") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
		TraitorFinder()
	end
	if (gBool("Visuals", "Wallhack", "Enabled") && gBool("Visuals", "Miscellaneous", "Murderer Finder") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
		MurdererFinder()
	end
	if (gBool("Visuals", "Miscellaneous", "Show NPCs") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
		ShowNPCs()
	end
	for k, v in next, ents.GetAll() do
	if (v:IsDormant() and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or not v:IsValid() then continue end
	if not WallhackFilter(v) or not OnScreen(v) or (!(gBool("Miscellaneous", "Point of View", "Thirdperson") and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) then continue end
	if (gBool("Visuals", "Miscellaneous", "Show Entities") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
	if table.HasValue(drawn_ents, v:GetClass()) and v:IsValid() and v:GetPos():Distance(me:GetPos()) > 40 then
				local pos = em.GetPos(v) + Vector(0, 0, 0)
				local pos2 = pos + Vector(0, 0, 0)
				local pos = vm.ToScreen(pos)
				local pos2 = vm.ToScreen(pos2)
				local min, max = v:WorldSpaceAABB()
				local origin = v:GetPos()
				draw.SimpleText(v:GetClass(), "MiscFont", pos.x, pos.y, Color(255, 255, 255), 1)
				cam.Start3D()
					render.DrawWireframeBox(origin, Angle(0, 0, 0), min - origin, max - origin, Color(entitiesvisualscol.r, entitiesvisualscol.g, entitiesvisualscol.b), true) 
				cam.End3D()
			end
		end
	end
	if gBool("Miscellaneous", "Priority List", "Enabled") and menuopen and ScrW() >= 1600 or ScrH() >= 1400 then
		PlayerList()
	end
	if v == me and not em.IsValid(v) then return end
	if (gBool("Visuals", "Miscellaneous", "Spectators Box") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		Spectator()
	end
	if (gBool("Visuals", "Miscellaneous", "Radar Box") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		RadarDraw()
	end
	if (gBool("Visuals", "Miscellaneous", "Custom Status") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		Logo()
		Status()
	end
	if (gBool("Visuals", "Miscellaneous", "Players List") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		Logo2()
		Players()
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") ~= "Off" && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		Crosshair()
	end
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if me:Team() == TEAM_SPECTATOR and not ((gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:")) and gBool("Visuals", "Miscellaneous", "Show Spectators")) then return end
	if not me:Alive() or me:Health() < 1 then return end
	if (gBool("Triggerbot", "Triggerbot", "Enabled")) then return end
	if (gBool("Aimbot", "Ragebot", "Enabled") && gBool("Aimbot", "Legitbot", "Enabled")) then return end
	for k, v in pairs(player.GetAll()) do
	if (gBool("Main Menu", "Panic Mode", "Enabled") && gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Main Menu", "Panic Mode", "Enabled") && gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Ragebot" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Main Menu", "Panic Mode", "Enabled") && gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Legitbot" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me) then return end
	end
	if (aimtarget and em.IsValid(aimtarget) and not FixTools() and gBool("Visuals", "Miscellaneous", "Snap Lines") and (gBool("Aimbot", "Ragebot", "Enabled") or gBool("Aimbot", "Legitbot", "Enabled"))) then
		if me:Alive() or em.Health(me) > 0 then
			local col = Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:"))
			local pos = vm.ToScreen(em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)))
			surface.SetDrawColor(col)
			surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y)
			surface.SetDrawColor(0, 0, 0)
			surface.DrawOutlinedRect(pos.x - 2, pos.y - 2, 5, 5)
			surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:"))
			surface.DrawRect(pos.x - 1, pos.y - 1, 3, 3)
		end
	end
end)

local function AntiAFK(pCmd)
	if (!gBool("Main Menu", "General Utilities", "Anti-AFK")) then
		timer.Create("afk1", 6, 0, function()
		local commands = {"moveleft", "moveright", "moveup", "movedown"}
		local command1 = table.Random(commands)
		local command2 = table.Random(commands)
		if unloaded == true then return end
		if (!gBool("Main Menu", "General Utilities", "Anti-AFK")) then return end
		timer.Create("afk2", 1, 1, function()
		RunConsoleCommand("+"..command1)
		RunConsoleCommand("+"..command2)
			end)
		timer.Create("afk3", 4, 1, function()
		RunConsoleCommand("-"..command1)
		RunConsoleCommand("-"..command2)
			end)
		end)
	end
end

local dists = {}

local function AimPos(v)
	if (gOption("Aimbot", "Aim Priorities", "Hitbox:") ~= "Head") or (v:IsPlayer() and v:IsPlayingTaunt() and gBool("Hack vs. Hack", "Resolver", "Enabled") and gBool("Hack vs. Hack", "Resolver", "Emote Resolver")) then return (em.LocalToWorld(v, em.OBBCenter(v))) end
	local eyes = em.LookupAttachment(v, "eyes")
	if (!eyes) then return(em.LocalToWorld(v, em.OBBCenter(v))) end
	local pos = em.GetAttachment(v, eyes)
	if (!pos) then return(em.LocalToWorld(v, em.OBBCenter(v))) end
	return(pos.Pos)
end

hook.Add("player_hurt", "Hook14", function(data)
	if (gBool("Miscellaneous", "Sounds", "Hitsounds")) then
		local attacker = data.attacker
		if attacker == me:UserID() then
			surface.PlaySound("buttons/bell1.wav")
		end
	end
end)

local function LogKills(data)
	local killer = idiot.Entity(data.entindex_attacker)
	local victim = idiot.Entity(data.entindex_killed)
	if (idiot.IsValid(killer) and idiot.IsValid(victim) and killer:IsPlayer() and victim:IsPlayer()) then
	idiot.surface.PlaySound("buttons/lightswitch2.wav")
		if (killer == victim and victim ~= me) then
			chat.AddText(Color(255, 255, 0), victim:Nick().." killed themself.")
		elseif (killer == victim and victim == me) then
			chat.AddText(Color(255, 255, 0), "You killed yourself.")
		elseif (killer == me and victim ~= me) then
			chat.AddText(Color(255, 255, 0), "You killed "..victim:Nick()..".")
		elseif (killer ~= me and victim == me) then
			chat.AddText(Color(255, 255, 0), killer:Nick().." killed you.")
		elseif (killer ~= me and victim ~= me) then
			chat.AddText(Color(255, 255, 0), killer:Nick().." killed "..victim:Nick()..".")
		end
	end
end

hook.Add("entity_killed", "Hook15", function(data)
	if gOption("Miscellaneous", "Chat", "Kill Spam:") ~= "Off" then
		KillSpam(data)
	end
	if gBool("Miscellaneous", "Chat", "Log Kills in Chat") then
		LogKills(data)
	end
end)

local function AimbotPriorities(v)
	if gBool("Aimbot", "Aim Priorities", "Players:") and not gBool("Aimbot", "Aim Priorities", "NPCs:") then
		return v:IsPlayer()
	elseif gBool("Aimbot", "Aim Priorities", "NPCs:") and not gBool("Aimbot", "Aim Priorities", "Players:") then
		return v:IsNPC()
	elseif gBool("Aimbot", "Aim Priorities", "Players:") and gBool("Aimbot", "Aim Priorities", "NPCs:") then
		return v:IsPlayer() or v:IsNPC()
	else
		return nil
	end
end

local function TriggerbotPriorities(v)
	if gBool("Triggerbot", "Aim Priorities", "Players:") and not gBool("Triggerbot", "Aim Priorities", "NPCs:") then
		return v:IsPlayer()
	elseif gBool("Triggerbot", "Aim Priorities", "NPCs:") and not gBool("Triggerbot", "Aim Priorities", "Players:") then
		return v:IsNPC()
	elseif gBool("Triggerbot", "Aim Priorities", "Players:") and gBool("Triggerbot", "Aim Priorities", "NPCs:") then
		return v:IsPlayer() or v:IsNPC()
	else
		return nil
	end
end

local aimignore

local function Valid(v)
	local dist = gBool("Aimbot", "Aim Priorities", "Distance:")
	local vel = gBool("Aimbot", "Aim Priorities", "Velocity:")
    local wep = me:GetActiveWeapon()
	local maxhealth = gInt("Aimbot", "Aim Priorities", "Max Player Health:") 
	if (!v || !em.IsValid(v) || v == me || em.Health(v) < 1 || em.IsDormant(v) || !AimbotPriorities(v) || (v == aimignore && gOption("Aimbot", "Aim Priorities", "Aim Priority:") == "Random")) then return false end
	if v:IsPlayer() then
	if gBool("Aimbot", "Aim Priorities", "Distance Limit") then
		if (vm.Distance(em.GetPos(v), em.GetPos(me)) > (dist * 5)) then return false end
	end
	if gBool("Aimbot", "Aim Priorities", "Velocity Limit") then
		if (v:GetVelocity():Length() > vel) then return false end
	end
	if gBool("Aimbot", "Aim Priorities", "Disable in Noclip") then
		if em.GetMoveType(me) == MOVETYPE_NOCLIP then return false end
	end
	if !gBool("Aimbot", "Aim Priorities", "Team:") then
        if pm.Team(v) == pm.Team(me) then return false end
    end
	if !gBool("Aimbot", "Aim Priorities", "Enemies:") then
        if pm.Team(v) != pm.Team(me) then return false end
    end
	if !gBool("Aimbot", "Aim Priorities", "Transparent Players:") then
        if em.GetColor(v).a < 255 then return false end
    end
    if !gBool("Aimbot", "Aim Priorities", "Friends:") then
        if pm.GetFriendStatus(v) == "friend" then return false end
    end
	if !gBool("Aimbot", "Aim Priorities", "Bots:") then
		if pm.IsBot(v) then return false end
	end
    if !gBool("Aimbot", "Aim Priorities", "Admins:") then
        if pm.IsAdmin(v) then return false end
    end
    if !gBool("Aimbot", "Aim Priorities", "Driving Players:") then
		if pm.InVehicle(v) then return false end
	end
	if !gBool("Aimbot", "Aim Priorities", "Noclipping Players:") then
		if em.GetMoveType(v) == MOVETYPE_NOCLIP then return false end
	end
	if !gBool("Aimbot", "Aim Priorities", "Frozen Players:") then
		if pm.IsFrozen(v) then return false end
	end
	if !gBool("Aimbot", "Aim Priorities", "Overhealed Players:") then
		if v:Health() > maxhealth then return false end
	end
	if !gBool("Aimbot", "Aim Priorities", "Spectators:") then
		if v:Team() == TEAM_SPECTATOR then return false end
	end
	if (gBool("Miscellaneous", "Priority List", "Enabled") and table.HasValue(ignore_list, v:UniqueID())) or (gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Aimbot", "Aim Priorities", "Priority Targets Only") && !table.HasValue(priority_list, v:UniqueID())) then
		return false
	end
	end
	local tr = {}
        tr.start = me
        tr.endpos = v
        tr.filter = {me, v}
	if gBool("Aimbot", "Miscellaneous", "Auto Wallbang") then
		tr.start = em.EyePos(me)
        tr.endpos = AimPos(v)
		tr.mask = MASK_SHOT
		tr.filter = {me, v}
	elseif gBool("Aimbot", "Miscellaneous", "Line of Sight Check") then
		tr.start = em.EyePos(me)
        tr.endpos = AimPos(v)
		tr.mask = MASK_VISIBLE_AND_NPCS
		tr.filter = {me, v}
	end
	if util.TraceLine(tr).Fraction == 1 then
        return true
    end
	return false
end

local function GetTarget()
	local opt = gOption("Aimbot", "Aim Priorities", "Aim Priority:")
	local sticky = gOption("Aimbot", "Ragebot", "Target Lock") or gOption("Aimbot", "Legitbot", "Target Lock")
	if (opt == "Distance") then
		if (sticky && Valid(aimtarget)) then return end
		dists = {}
		for k, v in next, ents.GetAll() do
			if (!Valid(v)) then continue end
			dists[#dists + 1] = {vm.Distance(em.GetPos(v), em.GetPos(me)), v}
		end
		table.sort(dists, function(a, b)
			return(a[1] < b[1])
		end)
		aimtarget = dists[1] && dists[1][2] || nil
	elseif (opt == "Health") then
		if (sticky && Valid(aimtarget)) then return end
		dists = {}
		for k, v in next, ents.GetAll() do
			if (!Valid(v)) then continue end
			dists[#dists + 1] = {em.Health(v), v}
		end
		table.sort(dists, function(a, b)
			return(a[1] < b[1])
		end)
		aimtarget = dists[1] && dists[1][2] || nil
	elseif (opt == "Random") then
		if (!sticky && Valid(aimtarget)) then return end
		aimtarget = nil
		local avaib = {}
		for k, v in next, ents.GetAll() do
			avaib[math.random(100)] = v
		end
		for k, v in next, avaib do
			if (Valid(v)) then
				aimtarget = v
			end
		end
	elseif (opt == "Crosshair") then
		if (sticky && Valid(aimtarget)) then return end
		dists = {}
		local x, y = ScrW(), ScrH()
		local AngA, AngB = 0
		for k, v in next, ents.GetAll() do
			if (!Valid(v)) then continue end
			local EyePos = v:EyePos():ToScreen()
			dists[#dists + 1] = {math.Dist(x / 2, y / 2, EyePos.x, EyePos.y), v}
		end
		table.sort(dists, function(a, b)
			return(a[1] < b[1])
		end)
		aimtarget = dists[1] && dists[1][2] || nil
	end
end

local cones = {}

local nullvec = Vector() * - 1

local servertime = 0

hook.Add("Move", "Hook16", function()
    if (IsFirstTimePredicted()) then
        servertime = CurTime() + engine.TickInterval()
    end
	if gBool("Aimbot", "Miscellaneous", "Bullet Time") then
		if gBool("Aimbot", "Ragebot", "Auto Fire") or gBool("Aimbot", "Legitbot", "Auto Fire") and gInt("Aimbot", "Miscellaneous", "Fire Delay:") ~= 1 then
			servertime = CurTime() - gInt("Aimbot", "Miscellaneous", "Fire Delay:") / 100
		elseif gBool("Triggerbot", "Triggerbot", "Enabled") and gInt("Triggerbot", "Triggerbot", "Fire Delay:") ~= 1 then
			servertime = CurTime() - gInt("Triggerbot", "Triggerbot", "Fire Delay:") / 100
		else
			servertime = CurTime()
		end
	end
end)

local function WeaponCanFire()
	local w = pm.GetActiveWeapon(me)
		if (!w || !em.IsValid(w) || !gBool("Aimbot", "Miscellaneous", "Bullet Time")) then return true end
	return(servertime >= wm.GetNextPrimaryFire(w))
end

GAMEMODE["EntityFireBullets"] = function(self, p, data)
	aimignore = aimtarget
	local w = pm.GetActiveWeapon(me)
	local Spread = data.Spread * - 1
	if (not w or not em.IsValid(w) or cones[em.GetClass(w)] == Spread or Spread == nullvec) then return end
	cones[em.GetClass(w)] = Spread
end

local function PredictSpread(pCmd, ang)
	local w = pm.GetActiveWeapon(me)
	if (not w or not em.IsValid(w) or not cones[em.GetClass(w)] or not gBool("Aimbot", "Miscellaneous", "No Spread")) then return am.Forward(ang) end
	return (IdiotBox.Predict(pCmd, am.Forward(ang), cones[em.GetClass(w)]))
end

local function AutoFire(pCmd)
	if (pm.KeyDown(me, 1)) then
		cm.SetButtons(pCmd, bit.band(cm.GetButtons(pCmd), bit.bnot(1)))
	else
		cm.SetButtons(pCmd, bit.bor(cm.GetButtons(pCmd), 1))
	end
end

local function AltFire(pCmd)
	if (pm.KeyDown(me, 1)) then
		cm.SetButtons(pCmd, bit.band(cm.GetButtons(pCmd), bit.bnot(IN_ATTACK2)))
	else
		cm.SetButtons(pCmd, bit.bor(cm.GetButtons(pCmd), IN_ATTACK2))
	end
end

local function SmoothAim(ang) 
	if (gInt("Aimbot", "Legitbot", "Aim Smoothness:") > 0 && !gBool("Aimbot", "Legitbot", "Silent (For Anti-Aim)")) then
		ang.y = math.NormalizeAngle(ang.y) 	
		ang.p = math.NormalizeAngle(ang.p) 	
		eyeang = LocalPlayer():EyeAngles() 	
		local smooth = gInt("Aimbot", "Legitbot", "Aim Smoothness:") 	
		if ((eyeang.y - ang.y) * - 1 > 180 && eyeang.y < 0) 
		then eyeang.y = eyeang.y + 360 end 	if ((ang.y - eyeang.y) * - 1 > 180 && ang.y < 0) then ang.y = ang.y + 360 end 	
		eyeang.y = eyeang.y + (ang.y - eyeang.y) / smooth eyeang.x = eyeang.x + (ang.x - eyeang.x) / smooth eyeang.r = 0 	
		return eyeang else return ang
	end 
end

local function PredictPos(aimtarget)
	local wep = me:GetActiveWeapon()
	if gBool("Aimbot", "Aim Priorities", "Projectile Prediction") and me:Alive() and me:Health() > 0 then
		if string.find(string.lower(wep:GetClass()), "crossbow") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 1100 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 1600) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 110) - em.GetVelocity(me) / 50) - em.EyePos(me)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 3215) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 110) - em.GetVelocity(me) / 50) - em.EyePos(me)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_rpg7") or string.find(string.lower(wep:GetClass()), "m9k_m202") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 2600 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 4500) + me:Ping() / 950) - Vector(0, 0, 25) - em.GetVelocity(me) / 50) - em.EyePos(me)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 4000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 4500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 110) - em.GetVelocity(me) / 50) - em.EyePos(me)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 4500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 90) - em.GetVelocity(me) / 50) - em.EyePos(me)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_ex41") or string.find(string.lower(wep:GetClass()), "m9k_m79gl") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 1100 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2550) + me:Ping() / 950) - Vector(0, 0, 25) - em.GetVelocity(me) / 50) - em.EyePos(me)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 4000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2130) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 35) - em.GetVelocity(me) / 50) - em.EyePos(me)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 7000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2130) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 13) - em.GetVelocity(me) / 50) - em.EyePos(me)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2670) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 6) - em.GetVelocity(me) / 50) - em.EyePos(me)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_matador") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 2600 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 6500) + me:Ping() / 950) - Vector(0, 0, 25) - em.GetVelocity(me) / 50) - em.EyePos(me)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 4000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 6500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 110) - em.GetVelocity(me) / 50) - em.EyePos(me)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 6500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 90) - em.GetVelocity(me) / 50) - em.EyePos(me)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_milkormgl") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 1100 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2500) + me:Ping() / 950) - Vector(0, 0, 25) - em.GetVelocity(me) / 50) - em.EyePos(me)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 4000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2000) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 43) - em.GetVelocity(me) / 50) - em.EyePos(me)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 7000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2460) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 38) - em.GetVelocity(me) / 50) - em.EyePos(me)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2580) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 17.5) - em.GetVelocity(me) / 50) - em.EyePos(me)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_m61_frag") then
			return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 650) + me:Ping() / 950) - Vector(0, 0, 225) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 4) - em.GetVelocity(me) / 50) - em.EyePos(me)
		elseif string.find(string.lower(wep:GetClass()), "m9k_harpoon") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 1200 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2300) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 20) - em.GetVelocity(me) / 50) - em.EyePos(me)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 1750 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2000) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 8) - em.GetVelocity(me) / 50) - em.EyePos(me)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 2000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 1500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 5) - em.GetVelocity(me) / 50) - em.EyePos(me)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 900) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 3) - em.GetVelocity(me) / 50) - em.EyePos(me)
			end
		else
			return AimPos(aimtarget) - em.EyePos(me)
		end
	end
	if not gBool("Aimbot", "Aim Priorities", "Projectile Prediction") then
		return AimPos(aimtarget) - em.EyePos(me)
	end
end

local function Ragebot(pCmd)
	if me:Team() == TEAM_SPECTATOR and not gBool("Aimbot", "Aim Priorities", "Spectators:") then return end
	if not me:Alive() or me:Health() < 1 then return end
	for k, v in pairs(player.GetAll()) do
	if (gBool("Main Menu", "Panic Mode", "Enabled") && gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Main Menu", "Panic Mode", "Enabled") && gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Ragebot" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || FixTools()) then return end
	end
	if (cm.CommandNumber(pCmd) == 0 || !gBool("Aimbot", "Ragebot", "Enabled") || gBool("Aimbot", "Legitbot", "Enabled")) then return end
	GetTarget()
	aa = false
	if (aimtarget && aimtarget:IsValid() && gKey("Aimbot", "Ragebot", "Aim Key:") && WeaponCanFire()) then
		aa = true
		local pos = PredictPos(aimtarget)
		local ang = vm.Angle(PredictSpread(pCmd, vm.Angle(pos)))
		FixAngle(ang)
		cm.SetViewAngles(pCmd, ang)
		if (gBool("Aimbot", "Ragebot", "Auto Fire")) then
			AutoFire(pCmd)
		end
		if (gBool("Aimbot", "Ragebot", "Alt Fire")) then
			AltFire(pCmd)
		end
		if (gBool("Aimbot", "Ragebot", "Silent")) then
			FixMovement(pCmd)
		else
			fa = ang
		end
	end
end

local function Legitbot(pCmd)
	if me:Team() == TEAM_SPECTATOR and not gBool("Aimbot", "Aim Priorities", "Spectators:") then return end
	if not me:Alive() or me:Health() < 1 then return end
	for k, v in pairs(player.GetAll()) do
	if (gBool("Main Menu", "Panic Mode", "Enabled") && gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Main Menu", "Panic Mode", "Enabled") && gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Legitbot" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || FixTools()) then return end
	end
	if (cm.CommandNumber(pCmd) == 0 || !gBool("Aimbot", "Legitbot", "Enabled") || gBool("Aimbot", "Ragebot", "Enabled")) then return end
	GetTarget()
    aa = false
    if (aimtarget && aimtarget:IsValid() && gKey("Aimbot", "Legitbot", "Aim Key:") && WeaponCanFire()) then
	local FovValue = gInt("Aimbot", "Legitbot", "Aim FoV Value:")
	if (FovValue < 0) then
	return end
	if (FovValue > 0) then
		local pos = PredictPos(aimtarget)
		local ang = vm.Angle(PredictSpread(pCmd, vm.Angle(pos)))
		FixAngle(ang)
		local CalcX = ang.x - fa.x
	    local CalcY = ang.y - fa.y
		if CalcY < 0 then CalcY = CalcY * - 1 end	
		if CalcX < 0 then CalcX = CalcX * - 1 end
		if CalcY > 360 then CalcY = CalcY - 360 end
		if CalcX > 360 then CalcX = CalcX - 360 end
		if CalcY > 180 then CalcY = 360 - CalcY end
		if CalcX > 180 then CalcX = 360 - CalcX end
		if (CalcX <= FovValue / 2 && CalcY <= FovValue  * 0.4) then
		local ang = SmoothAim(ang)
		cm.SetViewAngles(pCmd, ang)
        if (gBool("Aimbot", "Legitbot", "Auto Fire")) then
            AutoFire(pCmd)
        end
		if (gBool("Aimbot", "Legitbot", "Alt Fire")) then
			AltFire(pCmd)
		end
        if (gBool("Aimbot", "Legitbot", "Silent (For Anti-Aim)")) then
            FixMovement(pCmd)
        else
            fa = ang
        end
			end
		end
	end
end

local function TriggerValid(v)
	return (v and idiot.IsValid(v) and v:Health() > 0 and not v:IsDormant() and me:GetObserverTarget() ~= v and TriggerbotPriorities(v))
end

local function TriggerFilter(hitbox)
	if (gBool("Triggerbot", "Aim Priorities", "Hitbox:") == "Head") then
		return hitbox == 0
	end
	return hitbox ~= nil
end

local function Triggerbot(pCmd)
	if not me:Alive() or me:Health() < 1 or (me:Team() == TEAM_SPECTATOR and not gBool("Triggerbot", "Triggerbot", "Spectators:")) or not gKey("Triggerbot", "Triggerbot", "Trigger Key:") or pCmd:KeyDown(IN_ATTACK) or not gBool("Triggerbot", "Triggerbot", "Enabled") or FixTools() then return end
	local dist = gBool("Triggerbot", "Aim Priorities", "Distance:")
	local vel = gBool("Triggerbot", "Aim Priorities", "Velocity:")
	local maxhealth = gInt("Triggerbot", "Aim Priorities", "Max Player Health:") 
	local trace = me:GetEyeTraceNoCursor()
	local v = trace.Entity
	local hitbox = trace.HitBox
	if TriggerValid(v) and TriggerFilter(hitbox) then
	if v:IsPlayer() then
	if gBool("Triggerbot", "Aim Priorities", "Distance Limit") then
	if (vm.Distance(em.GetPos(v), em.GetPos(me)) > (dist * 5)) then return false end
	end
	if gBool("Triggerbot", "Aim Priorities", "Velocity Limit") then
	if (v:GetVelocity():Length() > vel) then return false end
	end
	if !gBool("Triggerbot", "Aim Priorities", "Team:") then
    if pm.Team(v) == pm.Team(me) then return false end
    end
	if !gBool("Triggerbot", "Aim Priorities", "Enemies:") then
    if pm.Team(v) != pm.Team(me) then return false end
    end
	if !gBool("Triggerbot", "Aim Priorities", "Transparent Players:") then
    if em.GetColor(v).a < 255 then return false end
    end
    if !gBool("Triggerbot", "Aim Priorities", "Friends:") then
    if pm.GetFriendStatus(v) == "friend" then return false end
    end
	if !gBool("Triggerbot", "Aim Priorities", "Bots:") then
	if pm.IsBot(v) then return false end
	end
    if !gBool("Triggerbot", "Aim Priorities", "Admins:") then
    if pm.IsAdmin(v) then return false end
    end
	if !gBool("Triggerbot", "Aim Priorities", "Frozen Players:") then
	if pm.IsFrozen(v) then return false end
	end
    if !gBool("Triggerbot", "Aim Priorities", "Driving Players:") then
	if pm.InVehicle(v) then return false end
	end
	if !gBool("Triggerbot", "Aim Priorities", "Noclipping Players:") then
	if em.GetMoveType(v) == MOVETYPE_NOCLIP then return false end
	end
	if gBool("Triggerbot", "Aim Priorities", "Disable in Noclip") then
	if em.GetMoveType(me) == MOVETYPE_NOCLIP then return false end
	end
	if !gBool("Triggerbot", "Aim Priorities", "Spectators:") then
	if pm.Team(v) == TEAM_SPECTATOR then return false end
	end
	if !gBool("Triggerbot", "Aim Priorities", "Overhealed Players:") then
	if v:Health() > maxhealth then return false end
	end
	if (gBool("Miscellaneous", "Priority List", "Enabled") and table.HasValue(ignore_list, v:UniqueID())) or (gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Triggerbot", "Aim Priorities", "Priority Targets Only") && !table.HasValue(priority_list, v:UniqueID())) then
	return false
	end
	end
	if (gBool("Triggerbot", "Triggerbot", "Alt Fire")) then
	pCmd:SetButtons(pCmd:GetButtons() + IN_ATTACK2)
	end
	if not TriggerValid(v) then return end
	idiot.Triggering = true
	if WeaponCanFire() then
	pCmd:SetButtons(pCmd:GetButtons() + IN_ATTACK)
	end
	else
	idiot.Triggering = false
	end
end

local ox = - 181

local oy = 0

local function RandCoin()
	local randcoin = math.random(0, 1)
	if (randcoin == 1) then return 1 else return - 1 end
end

local function GetClosest()
	local ddists = {}
	local closest
	for k, v in next, player.GetAll() do
	if (!Valid(v)) then continue end
	ddists[#ddists + 1] = {vm.Distance(em.GetPos(v), em.GetPos(me)), v}
	end
	table.sort(ddists, function(a, b)
	return(a[1] < b[1])
	end)
	closest = ddists[1] && ddists[1][2] || nil
	if (!closest) then return fa.y end
	local pos = em.GetPos(closest)
	local pos = vm.Angle(pos - em.EyePos(me))
	return(pos.y)
end

local function ViewLock()
	if (gBool("Hack vs. Hack", "Anti-Aim", "View Lock") and me:Alive() and me:Health() > 0) then
		local wep = pm.GetActiveWeapon(me)
				if !IsValid(wep) then return end
		local n = string.lower(wep:GetPrintName())
		ox = 181
		if (string.find(n, "pistol") or string.find(n, "beretta") or string.find(n, "deagle") or string.find(n, "eagle") or string.find(n, "9mm") or string.find(n, "9 mm") or string.find(n, "1911") or string.find(n, "tool") or string.find(n, "glock") or string.find(n, "luger") or string.find(n, "M92") or string.find(n, "M29") or string.find(n, "MR69") or string.find(n, "usp") or string.find(n, "p229r") or string.find(n, "45c")) then
		oy = fa.y + 32
		elseif (string.find(n, "shotgun") or string.find(n, "minigun") or string.find(n, "winchester 1897") or string.find(n, "winchester 87") or string.find(n, "crossbow") or string.find(n, "ithaca") or string.find(n, "mossberg") or string.find(n, "remington 870") or string.find(n, "spas") or string.find(n, "benelli") or string.find(n, "browning")) then
		oy = fa.y + 13.5
		elseif (string.find(n, ".357") or string.find(n, "python") or string.find(n, "satan") or string.find(n, "remington 1858") or string.find(n, "bull") or string.find(n, "model")) then
		oy = fa.y + 35.5
		else
		oy = fa.y - 8
		end
	end
end

local manual = false

local manualpressed = false

local function GetX()
	local opt = gOption("Hack vs. Hack", "Anti-Aim", "X-Axis:")
	local randcoin = gInt("Hack vs. Hack", "Anti-Aim", "Emotion X-Axis:")
	if (opt == "Emotion") then
	if (math.random(100) < randcoin) then
		ox = RandCoin() * 181
	end
	elseif (opt == "Off") then
        ox = fa.x
	elseif (opt == "Down") then
		if gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Fake-Forwards" or gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Fake-Backwards" or gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Fake-Sideways" or gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Spinbot" then
			ox = 120 + math.sin(CurTime() * 10) * 5
		else
			ox = 89
		end
	elseif (opt == "Up") then
		if gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Fake-Forwards" or gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Fake-Backwards" or gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Fake-Sideways" or gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Spinbot" then
			ox = - 120 - math.sin(CurTime() * 10) * 5
		else
			ox = - 89
		end
	elseif (opt == "Center") then
		if gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Fake-Forwards" or gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Fake-Backwards" or gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Fake-Sideways" or gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:") == "Spinbot" then
			ox = 169 + math.sin(CurTime() * 3) * 5
		else
			ox = 0
		end
	elseif (opt == "Jitter") then
		ox = math.random( - 89, 89)
	elseif (opt == "Fake-Down") then
		ox = 540.000005
	elseif (opt == "Fake-Up") then
		ox = - 540.000005
	elseif (opt == "Semi-Jitter Down") then
		ox = math.random(0, 89)
	elseif (opt == "Semi-Jitter Up") then
		ox = math.random(0, - 89)
	elseif opt == "Spinbot" then
		ox = math.sin(CurTime() * gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Speed:") / 8) * 60
	end
end

local function GetY()
    local left = gOption("Hack vs. Hack", "Anti-Aim", "Anti-Aim Direction:") == "Left"
    local right = gOption("Hack vs. Hack", "Anti-Aim", "Anti-Aim Direction:") == "Right"
	local randcoin = gInt("Hack vs. Hack", "Anti-Aim", "Emotion Y-Axis:")
	local opt = gOption("Hack vs. Hack", "Anti-Aim", "Y-Axis:")
	local adapt = gBool("Hack vs. Hack", "Anti-Aim", "Adaptive")
	local static = gBool("Hack vs. Hack", "Anti-Aim", "Static")
	if (opt == "Off") then
        oy = fa.y
	elseif (opt == "Emotion") then
	if (math.random(100) < randcoin) then
		oy = fa.y + math.random( - 180, 180)
	end
	elseif (opt == "Forwards" && !adapt && !static) then
		oy = fa.y
	elseif (opt == "Forwards" && adapt && !static) then
		oy = GetClosest()
	elseif (opt == "Forwards" && static) then
		oy = 180
	elseif (opt == "Backwards" && !adapt && !static) then
		oy = fa.y - 180
	elseif (opt == "Backwards" && adapt && !static) then
		oy = GetClosest() - 180
	elseif (opt == "Backwards" && static) then
		oy = 0
	elseif (opt == "Jitter" && !adapt && !static) then
		oy = fa.y + math.random( - 90, 90)
	elseif (opt == "Jitter" && adapt && !static) then
		oy = GetClosest() + math.random( - 90, 90)
	elseif (opt == "Jitter" && static) then
		oy = 180 + math.random( - 90, 90)
	elseif (opt == "Backwards Jitter" && !adapt && !static) then
		oy = fa.y - 180 + math.random( - 90, 90)
	elseif (opt == "Backwards Jitter" && adapt && !static) then
		oy = GetClosest() - 180 + math.random( - 90, 90)
	elseif (opt == "Backwards Jitter" && static) then
		oy = 0 + math.random( - 90, 90)
	elseif (opt == "Side Switch") then
		oy = math.random( - 631, 631)
	elseif (opt == "Semi-Jitter" && !adapt && !static) then
		oy = fa.y + math.random (25, - 25)
	elseif (opt == "Semi-Jitter" && adapt && !static) then
		oy = GetClosest() + math.random (25, - 25)
	elseif (opt == "Semi-Jitter" && static) then
		oy = 180 + math.random (25, - 25)
	elseif (opt == "Back Semi-Jitter" && !adapt && !static) then
		oy = fa.y - 180 + math.random (25, - 25)
	elseif (opt == "Back Semi-Jitter" && adapt && !static) then
		oy = GetClosest() - 180 + math.random (25, - 25)
	elseif (opt == "Back Semi-Jitter" && static) then
		oy = 0 + math.random (25, - 25)
	elseif (opt == "Spinbot") then
		if left then
        oy = (idiot.CurTime() * gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Speed:") * 23) % 350, 1
   		elseif right then
        oy = (idiot.CurTime() * - gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Speed:") * 23) % 350, 1
		elseif manual then
		oy = (idiot.CurTime() * - gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Speed:") * 23) % 350, 1
		else
		oy = (idiot.CurTime() * gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Speed:") * 23) % 350, 1
	    end
	elseif (opt == "Sideways" && !adapt && !static) then
		if right then
		oy = fa.y - 90
		elseif left then
		oy = fa.y + 90
		elseif manual then
		oy = fa.y - 90
		else
		oy = fa.y + 90
	end
	elseif (opt == "Sideways" && adapt && !static) then
		if right then
		oy = GetClosest() - 90
		elseif left then
		oy = GetClosest() + 90
		elseif manual then
		oy = GetClosest() - 90
		else
		oy = GetClosest() + 90
	end
	elseif (opt == "Sideways" && static) then
		if right then
		oy = 90
		elseif left then
		oy = 270
		elseif manual then
		oy = 90
		else
		oy = 270
	end
	elseif (opt == "Side Semi-Jitter" && !adapt && !static) then
        if left then
        oy = fa.y + 90 + math.random(0, 40)
        elseif right then
        oy = fa.y + 270 + math.random(0, - 40)
		elseif manual then
		oy = fa.y + 270 + math.random(0, - 40)
		else
		oy = fa.y + 90 + math.random(0, 40) 
        end
	elseif (opt == "Side Semi-Jitter" && adapt && !static) then
        if left then
        oy = GetClosest() + 90 + math.random(0, 40)
        elseif right then
        oy = GetClosest() + 270 + math.random(0, - 40)
		elseif manual then
		oy = GetClosest() + 270 + math.random(0, - 40)
		else
		oy = GetClosest() + 90 + math.random(0, 40) 
        end
	elseif (opt == "Side Semi-Jitter" && static) then
        if left then
        oy = 270 + math.random(0, 40)
        elseif right then
        oy = 90 + math.random(0, - 40)
		elseif manual then
		oy = 90 + math.random(0, - 40)
		else
		oy = 270 + math.random(0, 40)
        end
	elseif (opt == "Sideways Jitter" && !adapt && !static) then
		if left then
        oy = fa.y + math.random(1, 180, 1, 80, 1)
   		elseif right then
        oy = fa.y + math.random(181, 361) 
		elseif manual then
		oy = fa.y + math.random(181, 361)
		else
		oy = fa.y + math.random(1, 180, 1, 80, 1)
	    end
	elseif (opt == "Sideways Jitter" && adapt && !static) then
		if left then
        oy = GetClosest() + math.random(1, 180, 1, 80, 1)
   		elseif right then
        oy = GetClosest() + math.random(181, 361) 
		elseif manual then
		oy = GetClosest() + math.random(181, 361)
		else
		oy = GetClosest() + math.random(1, 180, 1, 80, 1)
	    end
	elseif (opt == "Sideways Jitter" && static) then
		if left then
        oy = 270 + math.random( - 90, 90)
   		elseif right then
        oy = 90 + math.random( - 90, 90) 
		elseif manual then
		oy = 90 + math.random( - 90, 90)
		else
		oy = 270 + math.random( - 90, 90)
	    end
	elseif (opt == "Fake-Forwards" && !adapt && !static) then
		if left then
        oy = fa.y - math.sin(CurTime() * 10) * 5
        elseif right then
        oy = fa.y + math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = fa.y + math.sin(CurTime() * 10) * 5
		else
		oy = fa.y - math.sin(CurTime() * 10) * 5
        end
	elseif (opt == "Fake-Forwards" && adapt && !static) then
        if left then
        oy = GetClosest() - math.sin(CurTime() * 10) * 5
        elseif right then
        oy = GetClosest() + math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = GetClosest() + math.sin(CurTime() * 10) * 5
		else
		oy = GetClosest() - math.sin(CurTime() * 10) * 5
        end
	elseif (opt == "Fake-Forwards" && static) then
        if left then
        oy = 180 - math.sin(CurTime() * 10) * 5
        elseif right then
        oy = 180 + math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = 180 + math.sin(CurTime() * 10) * 5
		else
		oy = 180 - math.sin(CurTime() * 10) * 5
        end
	elseif (opt == "Fake-Backwards" && !adapt && !static) then
		if right then
		oy = fa.y + 180 + math.sin(CurTime() * 10) * 5
		elseif left then
		oy = fa.y + 180 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = fa.y + 180 + math.sin(CurTime() * 10) * 5
		else
		oy = fa.y + 180 - math.sin(CurTime() * 10) * 5
		end
	elseif (opt == "Fake-Backwards" && adapt && !static) then
		if right then
		oy = GetClosest() + 180 + math.sin(CurTime() * 10) * 5
		elseif left then
		oy = GetClosest() + 180 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = GetClosest() + 180 + math.sin(CurTime() * 10) * 5
		else
		oy = GetClosest() + 180 - math.sin(CurTime() * 10) * 5
		end
	elseif (opt == "Fake-Backwards" && static) then
		if right then
		oy = 0 + math.sin(CurTime() * 10) * 5
		elseif left then
		oy = 0 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = 0 + math.sin(CurTime() * 10) * 5
		else
		oy = 0 - math.sin(CurTime() * 10) * 5
		end
	elseif (opt == "Fake-Sideways" && !adapt && !static) then
		if left then
        oy = fa.y + 90 + math.sin(CurTime() * 10) * 5
   		elseif right then
        oy = fa.y - 90 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = fa.y - 90 - math.sin(CurTime() * 10) * 5
		else
		oy = fa.y + 90 + math.sin(CurTime() * 10) * 5
	    end
	elseif (opt == "Fake-Sideways" && adapt && !static) then
		if left then
        oy = GetClosest() + 90 + math.sin(CurTime() * 10) * 5
   		elseif right then
        oy = GetClosest() - 90 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = GetClosest() - 90 - math.sin(CurTime() * 10) * 5
		else
		oy = GetClosest() + 90 + math.sin(CurTime() * 10) * 5
	    end
	elseif (opt == "Fake-Sideways" && static) then
		if left then
        oy = 270 + math.sin(CurTime() * 10) * 5
   		elseif right then
        oy = - 270 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = - 270 - math.sin(CurTime() * 10) * 5
		else
		oy = 270 + math.sin(CurTime() * 10) * 5
	    end
	end
end

local function WallDetect()
	if (gBool("Hack vs. Hack", "Anti-Aim", "Wall Detect")) then
		local eye = em.EyePos(me)
		local tr = util.TraceLine({
		start = eye, 
		endpos = (eye + (am.Forward(fa) * 10)), 
		mask = MASK_ALL, 
	})
	if (tr.Hit) then
		ox = - 181
		oy = - 90
		end
	end
end

local function AntiAim(pCmd)
	for k, v in pairs(player.GetAll()) do
	if (gBool("Main Menu", "Panic Mode", "Enabled") && gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Main Menu", "Panic Mode", "Enabled") && gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Anti-Aim" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me) then return end
	end
	local wep = pm.GetActiveWeapon(me)
	if (gBool("Hack vs. Hack", "Anti-Aim", "Disable in Noclip") && em.GetMoveType(me) == MOVETYPE_NOCLIP || me:Team() == TEAM_SPECTATOR || idiot.Triggering == true || (cm.CommandNumber(pCmd) == 0 && !gBool("Miscellaneous", "Point of View", "Thirdperson")) || cm.KeyDown(pCmd, 1) || gBool("Miscellaneous", "Point of View", "Custom FoV") && gBool("Miscellaneous", "Free Roaming", "Enabled") && gKey("Miscellaneous", "Free Roaming", "Free Roaming Key:") && !gBool("Miscellaneous", "Point of View", "Thirdperson") || me:WaterLevel() > 1 || input.IsKeyDown(15) && gBool("Hack vs. Hack", "Anti-Aim", "Disable in 'Use' Toggle") && !me:IsTyping() || em.GetMoveType(me) == MOVETYPE_LADDER || aa || !me:Alive() || me:Health() < 1 || !gBool("Hack vs. Hack", "Anti-Aim", "Enabled") || gBool("Aimbot", "Legitbot", "Enabled") && !gBool("Aimbot", "Legitbot", "Silent (For Anti-Aim)") || gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill") && wep:IsValid() && wep:GetClass() == "weapon_zm_carry" && idiot.engine.ActiveGamemode() == "terrortown") then return end
	if gOption("Hack vs. Hack", "Anti-Aim", "Anti-Aim Direction:") == "Manual Switch" then
	if gKey("Hack vs. Hack", "Anti-Aim", "Switch Key:") and not manualpressed then
	manualpressed = true
	manual = not manual
	elseif not gKey("Hack vs. Hack", "Anti-Aim", "Switch Key:") and manualpressed then
	manualpressed = false
	end	
	end
	GetX()
	GetY()
	ViewLock()
	WallDetect()
	local aaang = Angle(ox, oy, 0)
	cm.SetViewAngles(pCmd, aaang)
	FixMovement(pCmd, true)
end

local faketick = 0

local function FakeLag(pCmd, Choke, Send)
	if not gBool("Hack vs. Hack", "Fake Lag", "Enabled") then return end
	if gBool("Hack vs. Hack", "Fake Lag", "Disable on Attack") and me:KeyDown(IN_ATTACK) then
		return
	end
	if pCmd:CommandNumber() == 0 then
		return true
	end
	if not Choke then
		choke = gInt("Hack vs. Hack", "Fake Lag", "Lag Factor:") + 0.7
	end
	if not Send then
		send = 0
	end
	faketick = faketick + 1
	if faketick > (choke + send) then
		faketick = 0
	end
	if not (send >= faketick) then
		bSendPacket = false
	end
		flsend = send
	return true
end

local function GetAngle(ang)
	if not FixTools() then
		if (not gBool("Aimbot", "Miscellaneous", "No Recoil")) then 
			return ang + pm.GetPunchAngle(me)
		else
			return ang
		end
	end
end

local prop_val = 0

local prop_delay = 0

local function PropKill(pCmd)
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if (cm.CommandNumber(pCmd) == 0 && !gBool("Miscellaneous", "Point of View", "Thirdperson")) then
		return
	elseif (cm.CommandNumber(pCmd) == 0 && gBool("Miscellaneous", "Point of View", "Thirdperson")) then
		return
	end
	if gKey("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill Key:") then
		ox = fa.x - 27
		if prop_val < 180 then
			oy = fa.y + prop_val
			prop_val = prop_val + 3
		else
			oy = fa.y + 180
		end
		local aaang = Angle(ox, oy, 0)
		cm.SetViewAngles(pCmd, aaang)
		FixMovement(pCmd, true)
	else
		if prop_val > 0 then
			prop_val = 0
			prop_delay = CurTime() + 0.5
		end
		if prop_delay >= CurTime() then
			ox = - 17
			oy = fa.y
			local aaang = Angle(ox, oy, 0)
			cm.SetViewAngles(pCmd, aaang)
			FixMovement(pCmd, true)
		else
			prop_delay = 0
		end
	end
end

local function AutoStop(pCmd)
		if (gBool("Aimbot", "Ragebot", "Enabled") && gBool("Aimbot", "Ragebot", "Auto Stop") && aimtarget && gKey("Aimbot", "Ragebot", "Aim Key:") && WeaponCanFire() or gBool("Aimbot", "Legitbot", "Enabled") && gBool("Aimbot", "Legitbot", "Auto Stop") && aimtarget && gKey("Aimbot", "Ragebot", "Aim Key:") && WeaponCanFire() or gBool("Triggerbot", "Triggerbot", "Enabled") && gBool("Triggerbot", "Triggerbot", "Auto Stop") && gKey("Triggerbot", "Triggerbot", "Trigger Key:") && idiot.Triggering && WeaponCanFire()) then
			pCmd:SetForwardMove(0)
			pCmd:SetSideMove(0)
			pCmd:SetUpMove(0)
		return
	end
end

local function AutoCrouch(pCmd)	
		if (gBool("Aimbot", "Ragebot", "Enabled") && gBool("Aimbot", "Ragebot", "Auto Crouch") && aimtarget && gKey("Aimbot", "Ragebot", "Aim Key:") && WeaponCanFire() or gBool("Aimbot", "Legitbot", "Enabled") && gBool("Aimbot", "Legitbot", "Auto Crouch") && aimtarget && gKey("Aimbot", "Ragebot", "Aim Key:") && WeaponCanFire() or gBool("Triggerbot", "Triggerbot", "Enabled") && gBool("Triggerbot", "Triggerbot", "Auto Crouch") && gKey("Triggerbot", "Triggerbot", "Trigger Key:") && idiot.Triggering && WeaponCanFire()) then
			pCmd:SetButtons(pCmd:GetButtons() + IN_DUCK)
		return
	end
end

local function FakeAngles(pCmd)
	if (!fa) then 
		fa = cm.GetViewAngles(pCmd)
	end
    fa = fa + Angle(cm.GetMouseY(pCmd) * .023, cm.GetMouseX(pCmd) * - .023, 0)
    FixAngle(fa)
    if (cm.CommandNumber(pCmd) == 0) then
		if not FixTools() then
			cm.SetViewAngles(pCmd, GetAngle(fa))
			return
		end
	end
	if (cm.KeyDown(pCmd, 1)) then
		if not FixTools() then
			local ang = GetAngle(vm.Angle(PredictSpread(pCmd, fa)))
			FixAngle(ang)
			cm.SetViewAngles(pCmd, ang)
		end
    end
end

local crouched = 0

local function FakeCrouch(pCmd)
	if gBool("Miscellaneous", "Movement", "Fake Crouch") then
	if em.GetMoveType(me) == MOVETYPE_NOCLIP then return end
	if me:Team() == TEAM_SPECTATOR and not (gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:")) then return end
	if not me:Alive() or me:Health() < 1 then return end
	if LocalPlayer():IsFlagSet(1024) then return end
		if me:KeyDown(IN_DUCK) then
			if crouched <= 5 then
				pCmd:SetButtons(pCmd:GetButtons() + IN_DUCK)
			elseif crouched >= 25 then
				crouched = 0
			end
			crouched = crouched + 1
		else
			if crouched <= 5 then
				pCmd:SetButtons(pCmd:GetButtons() + IN_DUCK)
			elseif crouched >= 12.5 then
				crouched = 0
			end
			crouched = crouched + 1
		end
	end
end

local roampos, roamang, roamon, roamx, roamy, roamduck, roamjump = LocalPlayer():EyePos(), LocalPlayer():GetAngles(), false, 0, 0, false, false

hook.Add("CalcView", "Hook17", function(me, pos, ang, fov)
	local view = {}
		if gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Free Roaming Key:") and not menuopen and not me:IsTyping() and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() and not (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) and not (me:Team() == TEAM_SPECTATOR and (gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:"))) and (me:Alive() or me:Health() > 0) then
			local speed = gInt("Miscellaneous", "Free Roaming", "Free Roaming Speed:") / 5
			local mouseang = Angle(roamy, roamx, 0)
			if LocalPlayer():KeyDown(IN_SPEED) then
				speed = speed * 3
			end
			if LocalPlayer():KeyDown(IN_FORWARD) then
				roampos = roampos + (mouseang:Forward() * speed)
			end
			if LocalPlayer():KeyDown(IN_BACK) then
				roampos = roampos - (mouseang:Forward() * speed)
			end
			if LocalPlayer():KeyDown(IN_MOVELEFT) then
				roampos = roampos - (mouseang:Right() * speed)
			end
			if LocalPlayer():KeyDown(IN_MOVERIGHT) then
				roampos = roampos + (mouseang:Right() * speed)
			end
			if roamjump then
				roampos = roampos + Vector(0, 0, speed)
			end
			if roamduck then
				roampos = roampos - Vector(0, 0, speed)
			end
			view.origin = roampos
			view.angles = mouseang
			view.fov = fov
			view.drawviewer = true
		end
		if gBool("Miscellaneous", "Point of View", "Custom FoV") and not gBool("Miscellaneous", "Point of View", "Thirdperson") and not (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Free Roaming Key:")) and (me:Alive() or me:Health() > 0) then
			view.origin = pos
			view.angles = angles
			view.fov = gInt("Miscellaneous", "Point of View", "FoV Range:")
		end
		if gBool("Aimbot", "Miscellaneous", "No Recoil") and (me:Alive() or me:Health() > 0) and me:GetMoveType() ~= 10 and me:GetObserverTarget() == nil then
			view.origin = me:EyePos()
			view.angles = me:EyeAngles()
		end
		if gBool("Miscellaneous", "Point of View", "Thirdperson") and not (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Free Roaming Key:")) and (me:Alive() or me:Health() > 0) then
			view.angles = GetAngle(fa)
			view.origin = gBool("Miscellaneous", "Point of View", "Thirdperson") and pos + am.Forward(fa) * (gInt("Miscellaneous", "Point of View", "Thirdperson Range:") * - 10)
			return view
		end
		if not (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Free Roaming Key:")) and (me:Alive() or me:Health() > 0) then
			view.angles = GetAngle(fa)
			view.origin = pos
		end
	return view
end)

local function FreeRoam(pCmd)
	if (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Free Roaming Key:") and not menuopen and not me:IsTyping() and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() and not (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) and not (me:Team() == TEAM_SPECTATOR and (gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:"))) and (me:Alive() or me:Health() > 0)) then
		if roamon == false then
			roampos, roamang = LocalPlayer():EyePos(), pCmd:GetViewAngles()
			roamy, roamx = pCmd:GetViewAngles().x, pCmd:GetViewAngles().y
			roamon = true
		end
		pCmd:ClearMovement()
		if pCmd:KeyDown(IN_JUMP) then
			pCmd:RemoveKey(IN_JUMP)
			roamjump = true
		elseif roamjump then
			roamjump = false
		end
		if pCmd:KeyDown(IN_DUCK) then
			pCmd:RemoveKey(IN_DUCK)
			roamduck = true
		elseif roamduck then
			roamduck = false
		end
		roamx = roamx - (pCmd:GetMouseX() / 50)
		if roamy + (pCmd:GetMouseY() / 50) > 89 then roamy = 89 elseif roamy + (pCmd:GetMouseY() / 50) < - 89 then roamy = - 89 else roamy = roamy + (pCmd:GetMouseY() / 50) end
			pCmd:SetViewAngles(roamang)
		elseif roamon == true then
		roamon = false
	end
end

hook.Add("AdjustMouseSensitivity", "Hook18", function()
	if not gBool("Triggerbot", "Triggerbot", "Smooth Aim") then return end
	if not gKey("Triggerbot", "Triggerbot", "Trigger Key:") then return end
	if not idiot.Triggering then return end
	if FixTools() then return end
	return .10
end)

hook.Add("ShouldDrawLocalPlayer", "Hook19", function()
	if not (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Free Roaming Key:")) then return(gBool("Miscellaneous", "Point of View", "Thirdperson")) end
end)

hook.Add("CreateMove", "Hook20", function(pCmd)
	bSendPacket = true
	if gInt("Hack vs. Hack", "Fake Lag", "Lag Factor:") ~= 0 then
	FakeLag(pCmd)
	end
	AntiAFK(pCmd)
	BunnyHop(pCmd)
	AutoStrafe(pCmd)
	FakeAngles(pCmd)
	FreeRoam(pCmd)
	AutoReload(pCmd)
	RapidFire(pCmd)
	RapidAltFire(pCmd)
	AutoStop(pCmd)
	AutoCrouch(pCmd)
	FakeCrouch(pCmd)
	AirCrouch(pCmd)
	Triggerbot(pCmd)
	local wep = pm.GetActiveWeapon(me)
	if idiot.engine.ActiveGamemode() == "terrortown" and gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill") and wep:IsValid() and wep:GetClass() == "weapon_zm_carry" then
		PropKill(pCmd)
	end
	if(cm.CommandNumber(pCmd) == 0) then
	return
	end
	big.StartPrediction(pCmd, cm.CommandNumber(pCmd))
	Ragebot(pCmd)
	Legitbot(pCmd)
	AntiAim(pCmd)
	big.FinishPrediction()
end)

hook.Add("player_disconnect", "Hook21", function(v, data)
	local quit = {"rage quit", "rage quit lol", "he raged", "he raged lmao", "he left", "he left lmfao"}
	if gOption("Miscellaneous", "Chat", "Reply Spam:") == "Disconnect Spam" then
		if (engine.ActiveGamemode() == "darkrp") then
			me:ConCommand("say /ooc "..quit[math.random(#quit)])
		else
			me:ConCommand("say "..quit[math.random(#quit)])
		end
	end
end)

hook.Add("HUDPaint2", "Hook22", function()
	if gInt("Settings", "Others", "BG Darkness:") > 0 and menuopen then
		surface.SetDrawColor(0, 0, 0, gInt("Settings", "Others", "BG Darkness:") * 10)
		surface.DrawRect(0, 0, ScrW(), ScrH())
	end
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:Team() == TEAM_SPECTATOR and not ((gBool("Aimbot", "Aim Priorities", "Spectators:") or gBool("Triggerbot", "Aim Priorities", "Spectators:")) and gBool("Visuals", "Miscellaneous", "Show Spectators")) then return end
	if not me:Alive() or me:Health() < 1 then return end
	if (v == me and not em.IsValid(v)) then return end
	local Cap = math.cos(math.rad(45))
	local Offset = Vector(0, 0, 32)
	local Trace = {}
	local WitnessColor = Color (0, 0, 0)
	if (gBool("Visuals", "Miscellaneous", "Witness Finder")) then
		local Time = os.time() - 1
		local Witnesses = 0
		local BeingWitnessed = true
		if Time < os.time() then
			Time = os.time() + .5
			Witnesses = 0
			BeingWitnessed = false
				for k, pla in pairs(player.GetAll()) do
					if pla:IsValid() and pla != LocalPlayer() then
						Trace.start  = LocalPlayer():EyePos() + Offset
						Trace.endpos = pla:EyePos() + Offset
						Trace.filter = {pla, LocalPlayer()}
						TraceRes = util.TraceLine(Trace)
						if !TraceRes.Hit then
							if (pla:EyeAngles():Forward():Dot((LocalPlayer():EyePos() - pla:EyePos())) > Cap) then
								Witnesses = Witnesses + 1
								BeingWitnessed = true
							end
						end
					end
				end
			end
			if BeingWitnessed == false then
				WitnessColor = Color (0, 255, 0)
			else
				WitnessColor = Color (255, 0, 0)
			end
    	draw.SimpleText(Witnesses.." Player(s) can see you.", "MiscFont3", (ScrW() / 2) - 65, 42, Color(maintextcol.r, maintextcol.g, maintextcol.b), 4, 1, 1, Color(0, 0, 0))
    	surface.SetDrawColor(WitnessColor)
    	surface.DrawRect((ScrW() / 2) - 73, 55, 152, 5)
    end
	if menuopen then return end
	if gBool("Miscellaneous", "Point of View", "Mirror") then
		local view = {}
			view.angles = Angle(fa.p - fa.p - fa.p, fa.y - 180, fa.r)
			view.origin = me:GetShootPos()
			view.x = 650
			view.y = 0
			view.w = ScrW() / 3
			view.h = ScrH() / 5
		render.RenderView(view)
	end
	if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill") && gKey("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill Key:") then
		if prop_val >= 180 then
			surface.DrawCircle(ScrW() / 2, ScrH() / 1.8, 80 + me:GetVelocity():Length() / 4, Color(255, 0, 0))
		else
			surface.DrawCircle(ScrW() / 2, ScrH() / 1.8, 80 + me:GetVelocity():Length() / 4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:")))
		end
	end
	if gBool("Aimbot", "Legitbot", "Enabled") and gBool("Visuals", "Miscellaneous", "Show FoV Circle") and not gBool("Aimbot", "Ragebot", "Enabled") then
		local center = Vector(ScrW() / 2, ScrH() / 2, 0)
		local scale = Vector(((gInt("Aimbot", "Legitbot", "Aim FoV Value:")) * 6.1), ((gInt("Aimbot", "Legitbot", "Aim FoV Value:")) * 6.1), 0)
		local segmentdist = 360 / (2 * math.pi * math.max(scale.x, scale.y) / 2)
			surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Settings", "Others", "T Opacity:"))	
		for a = 0, 360 - segmentdist, segmentdist do
			surface.DrawLine(center.x + math.cos(math.rad(a)) * scale.x, center.y - math.sin(math.rad(a)) * scale.y, center.x + math.cos(math.rad(a + segmentdist)) * scale.x, center.y - math.sin(math.rad(a + segmentdist)) * scale.y)
		end
	end
end)

hook.Add("PreDrawOpaqueRenderables", "Hook23", function()
	if gBool("Hack vs. Hack", "Resolver", "Enabled") then
		for k, v in next, player.GetAll() do
			if v == me or not v:IsValid() or (gBool("Miscellaneous", "Priority List", "Enabled") and table.HasValue(ignore_list, v:UniqueID())) then continue end
			if gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Hack vs. Hack", "Resolver", "Priority Targets Only") then
				if not table.HasValue(priority_list, v:UniqueID()) then continue end
			end
			local pitch = v:EyeAngles().x
			local yaw = v:EyeAngles().y
			local roll = 0
			if gOption("Hack vs. Hack", "Resolver", "X-Axis:") ~= "Off" then
				if gOption("Hack vs. Hack", "Resolver", "X-Axis:") == "Down" then
					pitch = 90
				elseif gOption("Hack vs. Hack", "Resolver", "X-Axis:") == "Up" then
					pitch = - 90
				elseif gOption("Hack vs. Hack", "Resolver", "X-Axis:") == "Center" then
					pitch = 0
				elseif gOption("Hack vs. Hack", "Resolver", "X-Axis:") == "Invert" then
					pitch = - pitch
				elseif gOption("Hack vs. Hack", "Resolver", "X-Axis:") == "Random" then
					pitch = math.random( - 90, 90)
				else
					if pitch <= 20 and pitch >= - 10 then
						pitch = 90
					end
				end
			end
			if gOption("Hack vs. Hack", "Resolver", "Y-Axis:") ~= "Off" then
				if gOption("Hack vs. Hack", "Resolver", "Y-Axis:") == "Left" then
					yaw = yaw + 90
				elseif gOption("Hack vs. Hack", "Resolver", "Y-Axis:") == "Right" then
					yaw = yaw - 90
				elseif gOption("Hack vs. Hack", "Resolver", "Y-Axis:") == "Invert" then
					yaw = yaw + 180
				elseif gOption("Hack vs. Hack", "Resolver", "Y-Axis:") == "Random" then
					yaw = math.random( - 180, 180)
				else
					roll = v:EyeAngles().z
				end
			end
			v:SetPoseParameter("aim_pitch", math.NormalizeAngle(pitch))
			v:SetPoseParameter("head_pitch", math.NormalizeAngle(pitch))
			v:SetPoseParameter("body_yaw", 0)
			v:SetPoseParameter("aim_yaw", 0)
			v:SetRenderAngles(Angle(0, math.NormalizeAngle(yaw) + math.NormalizeAngle(roll), 0))
			v:InvalidateBoneCache()
		end
	end
end)

hook.Add("OnPlayerChat", "Hook24", function(chatPlayer, text, teamChat)
	local randomresponse = {"shut up", "ok", "who", "nobody cares", "where", "stop spamming", "what", "yea", "lol", "english please", "lmao", "shit", "fuck",}
	local cheatcallouts = {"hac", "h4c", "h@c", "hak", "h4k", "h@k", "hck", "hax", "h4x", "h@x", "hask", "h4sk", "h@sk", "ha$k", "h4$k", "h@$k", "cheat", "ch3at", "che4t", "che@t", "ch34t", "ch3@t", "chet", "ch3t", "wall", "w4ll", "w@ll", "wa11", "w@11", "w411", "aim", "a1m", "4im", "@im", "@1m", "41m", "trigg", "tr1gg", "spin", "sp1n", "bot", "b0t", "esp", "3sp", "e$p", "3$p", "lua", "1ua", "lu4", "lu@", "1u4", "1u@", "scr", "skr", "$cr", "$kr", "skid", "sk1d", "$kid", "$k1d", "bunny", "buny", "h0p", "hop", "kick", "k1ck", "kik", "k1k", "ban", "b4n", "b@n", "fake", "f4ke", "f@ke", "fak3", "f4k3", "f@k3",}
	local replyspam = gOption("Miscellaneous", "Chat", "Reply Spam:")
    if replyspam ~= "Off" then
        if chatPlayer == me or not chatPlayer:IsValid() or (gBool("Miscellaneous", "Priority List", "Enabled") and table.HasValue(ignore_list, chatPlayer:UniqueID())) or (gBool("Miscellaneous", "Priority List", "Enabled") and gBool("Miscellaneous", "Chat", "Priority Targets Only") and not table.HasValue(priority_list, chatPlayer:UniqueID())) then return false end
        if pm.GetFriendStatus(chatPlayer) ~= "friend" then
            if teamChat and replyspam == "Random" then
                RunConsoleCommand("say_team", randomresponse[math.random(#randomresponse)])
            elseif replyspam == "Random" then
                RunConsoleCommand("say", randomresponse[math.random(#randomresponse)])
            elseif replyspam == "Cheater Callout" then
                local lowertext = string.lower(text)
                for _, callout in next, cheatcallouts do
                    if string.find(lowertext, callout) then
                        if engine.ActiveGamemode() == "darkrp" then
                            ChatClear.OOC()
                        else
                            ChatClear.Run()
                        end
                    end
                end
            elseif replyspam == "Copy Messages" then
                me:ConCommand("say"..(teamChat and "_team '" or " '")..text.."' - "..chatPlayer:Nick())
            elseif replyspam ~= "Disconnect Spam" then
                RunConsoleCommand("say"..(teamChat and "_team" or ""), replyspam)
            end
        end
    end
end)

if not file.Exists(folder.."/version.txt", "DATA") then
	file.Write(folder.."/version.txt", version)
else
	if file.Read(folder.."/version.txt", "DATA") ~= version then
		Changelog()
		chat.AddText(Color(0, 255, 0), "IdiotBox has been updated from v"..file.Read(folder.."/version.txt", "DATA").." to v"..version.."! Changelog is printed in the console.")
		surface.PlaySound("buttons/lightswitch2.wav")
		file.Write(folder.."/version.txt", version)
	end
end

MsgG(5.3, "Welcome, "..me:Nick()..". Press 'Insert', 'F11' or 'Home' to toggle.")
surface.PlaySound("buttons/lightswitch2.wav")

if ac != true then 
	timer.Create("ChatPrint", 5.7, 1, function() MsgG(5.3, "No anti-cheats have been detected.") end)
	timer.Create("PlaySound", 5.7, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
end

if (idiot.QAC or idiot.qac or idiot.CAC or idiot.cac or idiot.SAC or idiot.sac or idiot.DAC or idiot.dac or idiot.TAC or idiot.tac or idiot.LSAC or idiot.lsac or idiot.simplicity or idiot.Simplicity or idiot.swiftAC or idiot.swiftac or idiot.SwiftAC or idiot.Swiftac or idiot.SMAC or idiot.smac or idiot.MAC or idiot.mac or idiot.GAC or idiot.gac or idiot.GS or idiot.gs or idiot.GTS or idiot.gts or idiot.AE or idiot.ae or idiot.CardinalLib or idiot.cardinallib or idiot.cardinalLib or idiot.Cardinallib) then
	timer.Create("ChatPrint", 5.7, 1, function() MsgR(5.3, "An anti-cheat has been detected. Use with caution to avoid getting banned!") end)
	timer.Create("PlaySound", 5.7, 1, function() surface.PlaySound("npc/scanner/combat_scan1.wav") end)
		ac = true
		return
	end
end)



--NOTE-- This is the end of the very messy script that is IdiotBox;

--NOTE-- Thank you to everyone who still supports me to this day. Without you, this cheat wouldn't be a thing;

--NOTE-- All of my credits go out to you and the ones who helped me with the development of this cheat. <3



  //-----Script Ends Here----//
 //-------------------------//
//-------------------------//
