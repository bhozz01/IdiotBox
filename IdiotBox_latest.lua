  //-----IdiotBox v6.7.2----//
 //---------By Phizz-------//
//------------------------//



--NOTE-- I do not take credit for all of the features in this cheat. Some codes have been taken from other cheats. In fact, most of this cheat is pasted. Credits to the respective cheats are listed in the 'readme.txt' file;

--NOTE-- You can report any bugs or post any suggestions in our Discord server (link is on the website - if the server gets disabled, DM me at https://steamcommunity.com/id/phizzofficial/ or visit the website, we always refresh invite links) or through our website, at https://phizzofficial.wixsite.com/idiotbox4gmod/;

--NOTE-- This script is nowhere near perfect - there's a lot of room for improvement. It started off as a very broken, random paste that I made for fun, then it somehow turned into one of the most popular cheats in Garry's Mod. We try to make IdiotBox a better cheat with each update that gets released, and so far, it seems to go pretty well - but we're nowhere near the end.



local Detours = {}

local ProtectedFiles = {
    "IdiotBox_latest.lua", 
    "IdiotBox_backup.lua", 
	"IdiotBox_dev.lua", 
}

local function DetourFunction(originalFunction, newFunction)
    Detours[newFunction] = originalFunction
    return newFunction
end
 
file.Read = DetourFunction(file.Read, function(fileName, path)
	for k, v in next, ProtectedFiles do
		if string.find("IdiotBox*", v) then
			return "3D_TrollFace_Troll_Model_200"
		end
	end 
    return Detours[file.Read](fileName, path)
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

surface.CreateFont("IdiotFont", {
	font = "Tahoma", 
	size = 16, 
	weight = 1300, 
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
        ["Aimbot"] = {
                {
					{"Ragebot", 16, 20, 347, 220, 160}, 
					{"Enabled", "Checkbox", false, 0}, 
					{"Aim-Key:", "Selection", "None", {"None", "Mouse 3", "Mouse 4", "Mouse 5", "Mouse 6", "Left 'ALT' Key", "The 'E' Key", "The 'F' Key", "The 'G' Key", "The 'B' Key"}, 135}, 
					{"Silent", "Checkbox", false, 0}, 
					{"Auto Fire", "Checkbox", false, 0}, 
					{"Alt Fire", "Checkbox", false, 0}, 
					{"Auto Stop", "Checkbox", false, 0}, 
					{"Auto Crouch", "Checkbox", false, 0}, 
					{"Target Lock", "Checkbox", false, 0}, 
                }, 
				{
					{"Legitbot", 16, 254, 347, 273, 160}, 
					{"Enabled", "Checkbox", false, 0}, 
					{"Aim-Key:", "Selection", "None", {"None", "Mouse 3", "Mouse 4", "Mouse 5", "Mouse 6", "Left 'ALT' Key", "The 'E' Key", "The 'F' Key", "The 'G' Key", "The 'B' Key"}, 135}, 
					{"Aim FoV Value:", "Slider", 25, 500, 135}, 
					{"Aim Smoothness:", "Slider", 5, 50, 135}, 
					{"Silent (For Anti-Aim)", "Checkbox", false, 0}, 
					{"Auto Fire", "Checkbox", false, 0}, 
					{"Alt Fire", "Checkbox", false, 0}, 
					{"Auto Stop", "Checkbox", false, 0}, 
					{"Auto Crouch", "Checkbox", false, 0}, 
					{"Target Lock", "Checkbox", false, 0}, 
                }, 
				{
					{"Aim Options (Ragebot & Legitbot)", 376, 20, 347, 435, 160}, 
					{"Priority:", "Selection", "Crosshair", {"Crosshair", "Distance", "Health", "Random"}, 135}, 
					{"Priority List", "Checkbox", true, 0}, -- Enabled by default
					{"List Spacing:", "Slider", 0, 10, 135}, 
					{"Body Aim", "Checkbox", false, 0}, 
					{"Ignore Team", "Checkbox", false, 0}, 
					{"Ignore Friends", "Checkbox", false, 0}, 
					{"Ignore Players", "Checkbox", false, 0}, 
					{"Ignore Bots", "Checkbox", false, 0}, 
					{"Ignore NPCs", "Checkbox", false, 0}, 
					{"Ignore Admins", "Checkbox", false, 0}, 
					{"Ignore Noclip", "Checkbox", false, 0}, 
					{"Disable in Noclip", "Checkbox", false, 0}, 
					{"Ignore Driving Players", "Checkbox", false, 0}, 
					{"Ignore Transparent Players", "Checkbox", false, 0}, 
					{"Ignore Overhealed Players", "Checkbox", false, 0}, 
					{"Max Health:", "Slider", 500, 5000, 135}, 
                }, 
				{
					{"More (Ragebot & Legitbot)", 736, 20, 347, 310, 153}, 
					{"No Recoil", "Checkbox", false, 0}, 
					{"No Spread", "Checkbox", false, 0}, 
					{"Rapid Fire", "Checkbox", false, 0}, 
					{"Rapid Alt Fire", "Checkbox", false, 0}, 
					{"Snap Lines", "Checkbox", false, 0}, 
					{"Bullet Time", "Checkbox", false, 0}, 
					{"Auto Wall", "Checkbox", false, 0}, 
					{"Panic Mode", "Checkbox", false, 0}, 
					{"Mode:", "Selection", "Disable All", {"Disable Ragebot", "Disable Legitbot", "Disable Anti-Aim", "Disable All", "Load Legithack"}, 135}, 
					{"No Lerp", "Checkbox", false, 0}, 
					{"Fire Delay:", "Slider", 0, 100, 135}, 
                }, 
        }, 
		["Triggerbot"] = {
				{
					{"Triggerbot", 16, 20, 347, 211, 218}, 
					{"Enabled", "Checkbox", false, 74}, 
					{"Trigger-Key:", "Selection", "None", {"None", "Mouse 3", "Mouse 4", "Mouse 5", "Mouse 6", "Left 'ALT' Key", "The 'E' Key", "The 'F' Key", "The 'G' Key", "The 'B' Key"}, 88}, 
					{"Smooth Aim", "Checkbox", false, 74}, 
					{"Alt Fire", "Checkbox", false, 74}, 
					{"Auto Stop", "Checkbox", false, 74}, 
					{"Auto Crouch", "Checkbox", false, 74}, 
					{"Fire Delay:", "Slider", 0, 100, 88}, 
                }, 
				{
					{"Aim Options", 736, 20, 347, 361, 218}, 
					{"Priority:", "Selection", "Body", {"Head", "Body"}, 88}, 
					{"Ignore Team", "Checkbox", false, 74}, 
					{"Ignore Friends", "Checkbox", false, 74}, 
					{"Ignore Players", "Checkbox", false, 74}, 
					{"Ignore Bots", "Checkbox", false, 74}, 
					{"Ignore NPCs", "Checkbox", false, 74}, 
					{"Ignore Admins", "Checkbox", false, 74}, 
					{"Ignore Noclip", "Checkbox", false, 74}, 
					{"Disable in Noclip", "Checkbox", false, 74}, 
					{"Ignore Driving Players", "Checkbox", false, 74}, 
					{"Ignore Transparent Players", "Checkbox", false, 74}, 
					{"Ignore Overhealed Players", "Checkbox", false, 74}, 
					{"Max Health:", "Slider", 500, 5000, 88}, 
                }, 
		}, 
		["Hack vs. Hack"] = {
				{
					{"Anti-Aim (Ragebot only)", 16, 20, 347, 450, 170}, 
					{"Enabled", "Checkbox", false, 122}, 
					{"Disable in Noclip", "Checkbox", true, 122}, -- Enabled by default
					{"Disable with 'E' Key", "Checkbox", true, 122}, -- Enabled by default
					{"Wall Detect", "Checkbox", false, 122}, 
					{"View Lock", "Checkbox", false, 122}, 
					{"Static", "Checkbox", false, 122}, 
					{"Adaptive", "Checkbox", false, 122}, 
					{"X-Axis:", "Selection", "Off", {"Off", "Emotion", "Down", "Up", "Center", "Jitter", "Fake-Down", "Fake-Up", "Semi-Jitter Down", "Semi-Jitter Up", "Spinbot"}, 136}, 
					{"Y-Axis:", "Selection", "Off", {"Off", "Forwards", "Backwards", "Sideways", "Fake-Forwards", "Fake-Backwards", "Fake-Sideways", "Emotion", "Jitter", "Backwards Jitter", "Sideways Jitter", "Semi-Jitter", "Backwards Semi-Jitter", "Sideways Semi-Jitter", "Side Switch", "Spinbot"}, 136}, 
					{"Switch-Key:", "Selection", "The 'B' Key", {"Mouse 3", "Mouse 4", "Mouse 5", "Mouse 6", "Left 'ALT' Key", "The 'E' Key", "The 'F' Key", "The 'G' Key", "The 'B' Key"}, 136}, 
					{"Anti-Aim Direction:", "Selection", "Left", {"Left", "Right", "Manual Switching"}, 136}, 
					{"Spinbot Speed:", "Slider", 0, 180, 136}, 
					{"Emotion X-Axis:", "Slider", 0, 100, 136}, 
					{"Emotion Y-Axis:", "Slider", 0, 100, 136}, 
					{"", "Checkbox", false, 9999}, 
					{"-------------------WHEN USING 'FREE CAMERA'---------------------", "Checkbox", false, 9999},
					{"--------'ANTI-AIM' WILL AUTOMATICALLY TURN OFF---------", "Checkbox", false, 9999},
                }, 
				{
					{"Resolver", 736, 20, 347, 150, 218}, 
					{"Enabled", "Checkbox", false, 74}, 
					{"X-Axis:", "Selection", "Off", {"Off", "Down", "Up", "Center", "Invert", "Random", "Auto"}, 88}, 
					{"Y-Axis:", "Selection", "Off", {"Off", "Left", "Right", "Invert", "Random", "Auto"}, 88}, 
					{"Priority Targets Only", "Checkbox", false, 74}, 
					{"Emote Resolver", "Checkbox", false, 74}, 
                }, 
				{
					{"Fake Lag", 736, 184, 347, 109, 218}, 
					{"Enabled", "Checkbox", false, 74}, 
					{"Disable on Attack", "Checkbox", false, 74}, 
					{"Lag Factor:", "Slider", 0, 14, 88}, 
                }, 
		}, 
        ["Visuals"] = {
                {
					{"Wallhack", 16, 20, 347, 598, 218}, 
					{"Enabled", "Checkbox", false, 74}, 
					{"Box", "Checkbox", false, 74}, 
					{"Box Type:", "Selection", "2D Box", {"2D Box", "3D Box", "Edged Box"}, 88}, 
					{"Chams", "Checkbox", false, 74}, 
					{"Playermodel Chams", "Checkbox", false, 74}, 
					{"Skeleton", "Checkbox", false, 74}, 
					{"Glow", "Checkbox", false, 74}, 
					{"Hitbox", "Checkbox", false, 74}, 
					{"Vision Line", "Checkbox", false, 74}, 
					{"Name", "Checkbox", false, 74}, 
					{"Bystander Name", "Checkbox", false, 74}, 
					{"Health Bar", "Checkbox", false, 74}, 
					{"Health Value", "Checkbox", false, 74}, 
					{"Armor Bar", "Checkbox", false, 74}, 
					{"Armor Value", "Checkbox", false, 74}, 
					{"Weapon", "Checkbox", false, 74}, 
					{"Rank", "Checkbox", false, 74}, 
					{"Distance", "Checkbox", false, 74}, 
					{"Velocity", "Checkbox", false, 74}, 
					{"Conditions", "Checkbox", false, 74}, 
					{"Steam ID", "Checkbox", false, 74}, 
					{"Ping", "Checkbox", false, 74}, 
					{"DarkRP Money", "Checkbox", false, 74}, 
                }, 
                {
					{"More", 736, 20, 347, 460, 218}, 
					{"Show Enemies Only", "Checkbox", false, 74}, 
					{"Mirror", "Checkbox", false, 74}, 
					{"Team Colors", "Checkbox", false, 74}, 
					{"Free Camera", "Checkbox", false, 74}, 
					{"Free Camera-Key:", "Selection", "The 'E' Key", {"Mouse 3", "Mouse 4", "Mouse 5", "Mouse 6", "Left 'ALT' Key", "The 'E' Key", "The 'F' Key", "The 'G' Key", "The 'B' Key"}, 88}, 
					{"Spectators", "Checkbox", true, 74}, -- Enabled by default
					{"Radar", "Checkbox", true, 74}, -- Enabled by default
					{"Radar Distance:", "Slider", 50, 100, 88}, 
					{"Custom Status", "Checkbox", true, 74}, -- Enabled by default
					{"Players List", "Checkbox", true, 74}, -- Enabled by default
					{"Show NPCs", "Checkbox", false, 74}, 
					{"Show Entities", "Checkbox", false, 74}, 
					{"Witness Finder", "Checkbox", false, 74}, 
					{"Traitor Finder", "Checkbox", false, 74}, 
					{"Murderer Finder", "Checkbox", false, 74}, 
					{"Distance Limit", "Checkbox", false, 74}, 
					{"Distance:", "Slider", 0, 5000, 88}, 
                }, 
        }, 
		["Utilities"] = {
				{
					{"Utilities", 16, 20, 347, 386, 218}, 
					{"Optimize Game", "Checkbox", true, 74}, -- Enabled by default
					{"Anti-AFK", "Checkbox", false, 74}, 
					{"Anti-Ads", "Checkbox", true, 74}, -- Enabled by default
					{"Anti-Blind", "Checkbox", true, 74}, -- Enabled by default
					{"TTT: Hide Round Report", "Checkbox", true, 74}, -- Enabled by default
					{"TTT: Panel Remover", "Checkbox", true, 74}, -- Enabled by default
					{"TTT: Prop Kill", "Checkbox", false, 74}, 
					{"TTT: Prop Kill-Key:", "Selection", "The 'E' Key", {"Mouse 3", "Mouse 4", "Mouse 5", "Mouse 6", "Left 'ALT' Key", "The 'E' Key", "The 'F' Key", "The 'G' Key", "The 'B' Key"}, 88}, 
					{"Murder: Hide End Round Board", "Checkbox", true, 74}, -- Enabled by default
					{"Murder: Hide Footprints", "Checkbox", true, 74}, -- Enabled by default
					{"Murder: No Black Screens", "Checkbox", true, 74}, -- Enabled by default
					{"DarkRP: Suicide Near Arrest Batons", "Checkbox", true, 74}, -- Enabled by default
					{"DarkRP: Transparent Props", "Checkbox", false, 74}, 
					{"DarkRP: Transparency:", "Slider", 157, 255, 88}, 
                }, 
				{
          			{"IdiotBox Console Commands", 736, 20, 347, 121, 108}, 
					{"Apply custom name", "Checkbox", false, 0}, 
					{"Run the 'ib_openmenu' command to open the menu;", "Checkbox", false, 9999}, 
          			{"Run the 'ib_changename' command to set a custom name;", "Checkbox", false, 9999}, 
					{"Run the 'ib_changelog' command to view the bugfix list.", "Checkbox", false, 9999}, 
          		}, 
                
        }, 
		["More"] = {
                {
					{"More", 50, 20, 250, 510, 130}, 
					{"Name Stealer", "Checkbox", false, 74}, 
					{"Steal Type:", "Selection", "Normal", {"Normal", "DarkRP Name"}, 88}, 
					{"Emotes", "Checkbox", false, 74}, 
					{"Emote Type:", "Selection", "Random", {"Dance", "Sexy", "Wave", "Robot", "Bow", "Cheer", "Laugh", "Zombie", "Agree", "Disagree", "Forward", "Back", "Salute", "Pose", "Halt", "Group", "Random"}, 88}, 
					{"Murder Taunts", "Checkbox", false, 74}, 
					{"Taunt Type:", "Selection", "Random", {"Funny", "Help", "Scream", "Morose", "Random"}, 88}, 
					{"Crosshair", "Checkbox", false, 74}, 
					{"Crosshair Type:", "Selection", "Cross", {"Square", "Cross", "Swastika", "Aimware", "Box", "Circle", "Dot", "GTA IV"}, 88}, 
					{"Show FoV Circle", "Checkbox", false, 74}, 
					{"Screen Grab Notifications", "Checkbox", false, 74}, 
					{"Turn on Music", "Checkbox", false, 74}, 
					{"Reset Sounds", "Checkbox", false, 74}, 
					{"Hitsounds", "Checkbox", false, 74}, 
					{"Hide HUD", "Checkbox", false, 74}, 
					{"Flashlight Spam", "Checkbox", false, 74}, 
					{"Auto Reload", "Checkbox", false, 74}, 
                	{"Auto Reload at:", "Slider", 0, 99, 88}, 
					{"Thirdperson", "Checkbox", false, 74}, 
					{"Thirdperson Distance:", "Slider", 15, 100, 88}, 
                }, 
				{
                	{"Custom FoV", 312, 20, 217, 152, 25}, 
					{"Enabled", "Checkbox", false, 54}, 
					{"FoV:", "Slider", 111, 360, 67}, 
					{"", "Checkbox", false, 9999}, 
					{"------IF THIS IS NOT ENABLED-------", "Checkbox", false, 9999},
					{"--'FREE CAMERA' WILL NOT WORK--", "Checkbox", false, 9999},
                }, 
				{
                	{"Chat", 538, 20, 240, 152, 100}, 
					{"Log Kills in Chat", "Checkbox", false, 92}, 
					{"Enable Spams", "Checkbox", false, 92}, 
					{"Chat Spam:", "Selection", "Off", {"Off", "Advertising 1", "Advertising 2", "Advertising 3", "Nazi 1", "Nazi 2", "Nazi 3", "Arabic Spam", "Hebrew Spam", "Offensive Spam", "Insult Spam", "ULX Message Spam", "N-Word Spam", "N-WORD SPAM", "'H' Spam", "Clear Chat", "OOC Clear Chat", "Drop Money"}, 108}, 
					{"Kill Spam:", "Selection", "Off", {"Off", "Normal", "Insult", "Salty", "HvH", "IdiotBox HvH", "Votekick", "Voteban", "Killstreak", }, 108}, 
					{"Reply Spam:", "Selection", "Off", {"Off", "shut up", "ok", "who", "nobody cares", "where", "lol stop spamming", "what", "yea", "lol", "lmao", "shit", "fuck", "Random", "Disconnect Spam", "Cheater Callout", "Copy Messages"}, 108}, 
                }, 
				{
					{"Movement", 790, 20, 240, 182, 105}, 
					{"Bunny Hop", "Checkbox", false, 54}, 
					{"Auto Strafe", "Checkbox", false, 54}, 
					{"Air Crouch", "Checkbox", false, 54}, 
					{"Fake Crouch", "Checkbox", false, 54}, 
					{"Circle Strafe", "Checkbox", false, 54}, 
					{"Strafe Speed:", "Slider", 0, 6, 67}, 
                }, 
				{
					{"Viewmodel", 790, 216, 240, 125, 105}, 
					{"Viewmodel Chams", "Checkbox", false, 54}, 
					{"Viewmodel Wireframe", "Checkbox", false, 54}, 
					{"No Viewmodel", "Checkbox", false, 54}, 
					{"No Hands", "Checkbox", false, 54}, 
                }, 
				{
					{"Textures", 790, 356, 240, 125, 105}, 
					{"Transparent Walls", "Checkbox", false, 54}, 
					{"No Sky", "Checkbox", false, 54}, 
					{"Light Mode", "Checkbox", false, 54}, 
					{"Dark Mode", "Checkbox", false, 54}, 
                }, 
				{
					{"Change Log - Patch v6.7.2 - April 4th 2020", 312, 187, 466, 294, 130}, 
					{"- ADDED: 'Priority List' to Aimbot;", "Checkbox", false, 9999}, 
					{"- ADDED: 'Emote Resolver' to Resolver;", "Checkbox", false, 9999}, 
					{"- ADDED: 'Panic Mode' & NPC targeting to Aimbot/ Triggerbot;", "Checkbox", false, 9999}, 
					{"- ADDED: 'Cheater Callout' & 'Copy Messages' to Reply Spam;", "Checkbox", false, 9999}, 
					{"- ADDED: 'Border Color', 'Misc Visuals Color' & 'B Opacity' to Settings;", "Checkbox", false, 9999}, 
					{"- ADDED: 'Fake-Forwards/ Backwards/ Sideways', 'Static' & 'Adaptive' to Anti-Aim;", "Checkbox", false, 9999}, 
					{"- ADDED: 'Players List', 'Show Entities' & 'Conditions' to Visuals;", "Checkbox", false, 9999}, 
					{"- ADDED: 'Optimize Game' & TTT/ Murder/ DarkRP specific features to Utilities;", "Checkbox", false, 9999}, 
					{"- CHANGED: You can now change the max health on 'Ignore Overhealed Players';", "Checkbox", false, 9999}, 
					{"- CHANGED: IdiotBox developers will stand out more than regular players on Visuals;", "Checkbox", false, 9999}, 
					{"- NOTE: View the list of all important changes by running the 'ib_changelog' command.", "Checkbox", false, 9999}, 
				}, 
				{
					{"Small Tutorial for 'Circle Strafe', 'Free Camera' & 'Fire Delay'", 312, 496, 466, 120, 100}, 
					{"To use 'Circle Strafe' you have to hold down:", "Checkbox", false, 9999}, 
					{"'SPACE', 'MOUSE 3' and a movement key. The smaller the radius, the bigger the speed;", "Checkbox", false, 9999}, 
					{"To use 'Free Camera', you have to hold down the 'Free Camera-Key' and move;", "Checkbox", false, 9999}, 
					{"To use 'Fire Delay', you have to enable 'Bullet Time' and 'Auto Fire'.", "Checkbox", false, 9999}, 
                }, 
        }, 
		["Settings"] = {
				{
          			{"Main Text Color", 50, 20, 250, 105, 100}, 
          			{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 255, 255, 88}, 
					{"Blue:", "Slider", 217, 255, 88}, 
          		}, 
				{
					{"Menu Text Color", 311, 20, 205, 105, 70}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 235, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
				}, 
				{
          			{"Background Menu Color", 525, 20, 245, 105, 100}, 
          			{"Red:", "Slider", 27, 255, 88}, 
					{"Green:", "Slider", 27, 255, 88}, 
					{"Blue:", "Slider", 27, 255, 88}, 
          		}, 
				{
					{"Border Color", 780, 20, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 131, 255, 88}, 
					{"Blue:", "Slider", 175, 255, 88}, 
                }, 
				{
					{"Team Visuals Color", 50, 145, 250, 105, 100}, 
					{"Red:", "Slider", 255, 255, 88}, 
					{"Green:", "Slider", 255, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Enemy Visuals Color", 311, 145, 205, 105, 70}, 
					{"Red:", "Slider", 255, 255, 75}, 
					{"Green:", "Slider", 255, 255, 75}, 
					{"Blue:", "Slider", 255, 255, 75}, 
                }, 
				{
					{"Friend Visuals Color", 525, 145, 245, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 255, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Entities Visuals Color", 780, 145, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 255, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Misc Visuals Color", 50, 270, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 75}, 
					{"Green:", "Slider", 255, 255, 75}, 
					{"Blue:", "Slider", 255, 255, 75}, 
                }, 
				{
					{"Team Chams Color", 311, 270, 205, 105, 70}, 
					{"Red:", "Slider", 0, 255, 75}, 
					{"Green:", "Slider", 255, 255, 75}, 
					{"Blue:", "Slider", 255, 255, 75}, 
                }, 
				{
					{"Enemy Chams Color", 525, 270, 245, 105, 100}, 
					{"Red:", "Slider", 0, 255, 75}, 
					{"Green:", "Slider", 255, 255, 75}, 
					{"Blue:", "Slider", 255, 255, 75}, 
                }, 
				{
					{"Crosshair Color", 780, 270, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 235, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Viewmodel Color", 50, 390, 250, 105, 100}, 
					{"Red:", "Slider", 0, 255, 88}, 
					{"Green:", "Slider", 235, 255, 88}, 
					{"Blue:", "Slider", 255, 255, 88}, 
                }, 
				{
					{"Others", 311, 390, 205, 157, 70}, 
					{"T Opacity:", "Slider", 255, 255, 88}, 
					{"B Opacity:", "Slider", 110, 255, 88}, 
					{"BG Opacity:", "Slider", 255, 255, 88}, 
					{"BG Darkness:", "Slider", 18, 25, 88}, 
					{"Roundness:", "Slider", 47, 67, 88}, 
                }, 
				{
					{"Window Positions", 525, 390, 245, 157, 88}, 
					{"Spectators X:", "Slider", 12, 2000, 121}, 
					{"Spectators Y:", "Slider", 12, 2000, 121}, 
					{"Radar X:", "Slider", 220, 2000, 121}, 
					{"Radar Y:", "Slider", 12, 2000, 121}, 
					{"Roundness:", "Slider", 15, 42, 121}, 
                }, 
				{
					{"List Positions", 780, 390, 250, 157, 88}, 
					{"Custom Status X:", "Slider", 17, 2000, 121}, 
					{"Custom Status Y:", "Slider", 240, 2000, 121}, 
					{"Players List X:", "Slider", 17, 2000, 121}, 
					{"Players List Y:", "Slider", 415, 2000, 121}, 
					{"Roundness:", "Slider", 7, 10, 121}, 
                }, 
        }, 
}

local order = {
	"Aimbot", 
	"Triggerbot", 
	"Hack vs. Hack", 
	"Visuals", 
	"Utilities", 
	"More", 
	"Settings", 
}

local function gBool(men, sub, lookup)
	if(not options[men]) then return end
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] ~= sub) then continue end
			if(val[1] == lookup) then
				return val[3]
			end
		end
	end
end

local function gOption(men, sub, lookup)
	if(not options[men]) then return "" end
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] ~= sub) then continue end
			if(val[1] == lookup) then
				return val[3]
			end
		end
	end
	return ""
end

local function gInt(men, sub, lookup)
	if(not options[men]) then return 0 end
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] ~= sub) then continue end
			if(val[1] == lookup) then
				return val[3]
			end
		end
	end
	return 0
end

local windowopen = false

local function MsgG(time, text)
	if not windowopen then
		windowopen = true
		local window = vgui.Create("DFrame")
		window:SetPos(ScrW()/2.7, 0)
		window:SetSize(500, 25)
		window:SlideDown(0.3)
		window:SetTitle("")
		window:ShowCloseButton(false)
		window:SetDraggable(false)
		window.Paint = function(s, w, h)
			surface.SetDrawColor(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), 240)
			surface.DrawRect(0, 0, w, h)
			draw.DrawText(text, "MenuFont", w/2, 6, Color(0, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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
		window:SetPos(ScrW()/2.7, 0)
		window:SetSize(500, 25)
		window:SlideDown(0.3)
		window:SetTitle("")
		window:ShowCloseButton(false)
		window:SetDraggable(false)
		window.Paint = function(s, w, h)
			surface.SetDrawColor(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), 240)
			surface.DrawRect(0, 0, w, h)
			draw.DrawText(text, "MenuFont", w/2, 6, Color(255, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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
		window:SetPos(ScrW()/2.7, 0)
		window:SetSize(500, 25)
		window:SlideDown(0.3)
		window:SetTitle("")
		window:ShowCloseButton(false)
		window:SetDraggable(false)
		window.Paint = function(s, w, h)
			surface.SetDrawColor(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), 240)
			surface.DrawRect(0, 0, w, h)
			draw.DrawText(text, "MenuFont", w/2, 6, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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

local function MsgRGB(time, text)
	if not windowopen then
		windowopen = true
		local window = vgui.Create("DFrame")
		window:SetPos(ScrW()/2.7, 0)
		window:SetSize(500, 25)
		window:SlideDown(0.3)
		window:SetTitle("")
		window:ShowCloseButton(false)
		window:SetDraggable(false)
		window.Paint = function(s, w, h)
			surface.SetDrawColor(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), 240)
			surface.DrawRect(0, 0, w, h)
			draw.DrawText(text, "MenuFont", w/2, 6, HSVToColor(RealTime()*69%360, 1, 1) || Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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

local function MsgAntiScreengrab(time, text)
	if gBool("More", "More", "Screen Grab Notifications") then
	if not windowopen then
		windowopen = true
		local window = vgui.Create("DFrame")
		window:SetPos(ScrW()/2.7, 0)
		window:SetSize(500, 25)
		window:SlideDown(0.3)
		window:SetTitle("")
		window:ShowCloseButton(false)
		window:SetDraggable(false)
		window.Paint = function(s, w, h)
			surface.SetDrawColor(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), 240)
			surface.DrawRect(0, 0, w, h)
			draw.DrawText(text, "MenuFont", w/2, 6, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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
	surface.PlaySound("buttons/lightswitch2.wav")
	end
end

if gui.IsGameUIVisible() then
	gui.HideGameUI()
end

MsgY(1.4, "Initializing script...")
surface.PlaySound("buttons/bell1.wav")

timer.Simple(2, function()

local idiot	= (_G)

local ply = LocalPlayer()

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
	if (_G.Loaded) then
		MsgR(4.3, "Already initialized the cheat. Reloading it will cause major module bugs!")
		surface.PlaySound("buttons/lightswitch2.wav")
		return
	end
	if unloaded == true then
		MsgR(4.3, "You unloaded the cheat. Reloading it will cause major module bugs!")
		surface.PlaySound("buttons/lightswitch2.wav")
		return
	end
	_G.Loaded = true
end

local missingpng = file.Read("materials/missing256.png", "GAME")

local idiot_antiscreengrab = "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"

local idiot_antiscreengrab2 = "iVBORw0KGgoAAAANSUhEUgAAAAcAAAAECAIAAADNpLIqAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYSURBVBhXY2BgYmBmYGFgZEAFlIkyMAAACDAAKdIBq3cAAAAASUVORK5CYII="

render.Capture = function() return idiot_antiscreengrab end
render.Capture = function() return idiot_antiscreengrab2 end
render.Capture = function() return MsgAntiScreengrab(4.3, "IdiotBox successfully blocked a screen grabbing attempt.") end
render.CapturePixels = function() return idiot_antiscreengrab end
render.CapturePixels = function() return idiot_antiscreengrab2 end
render.CapturePixels = function() return MsgAntiScreengrab(4.3, "IdiotBox successfully blocked a screen grabbing attempt.") end

local function Copy(tt, lt)
	local copy = {}
	if lt then
		if type(tt) == "table" then
			for k, v in next, tt do
				copy[k] = Copy(k, v)
			end
		else
			copy = lt
		end
		return copy
	end
	if type(tt) ~= "table" then
		copy = tt
	else
		for k, v in next, tt do
			copy[k] = Copy(k, v)
		end
	end
	return copy
end

local IdiotBox = {}

local render = Copy(render)

local cam = Copy(cam)

local surface = Copy(surface)

local vgui = Copy(vgui)

local input = Copy(input)

local player = Copy(player)

local gui = Copy(gui)

local game = Copy(game)

local file = Copy(file)

local util = Copy(util)

local table = Copy(table)

local math = Copy(math)

local me = LocalPlayer()

local optimized = false

local applied = false

local grabbed = false

local em = FindMetaTable("Entity")

local pm = FindMetaTable("Player")

local cm = FindMetaTable("CUserCmd")

local wm = FindMetaTable("Weapon")

local am = FindMetaTable("Angle")

local vm = FindMetaTable("Vector")

local im =  FindMetaTable("IMaterial")

require("bsendpacket")
require("fhook")
require("ChatClear")
require("dickwrap")

gameevent.Listen("entity_killed")
gameevent.Listen("player_disconnect")
gameevent.Listen("player_hurt")

bSendPacket = true
unloaded = false

IdiotBox.ChangeName = _fhook_changename
IdiotBox.Predict = dickwrap.Predict

_G._fhook_changename = nil
_G.dickwrap.Predict = nil

idiot.TickCount = 0

idiot.IsMe 			= function(ply) return ply:SteamID64() == "76561198087554278" end -- Well, me;
idiot.IsMyAlt 		= function(ply) return ply:SteamID64() == "76561198285601724" end -- Again, me but on my alt account;
idiot.IsUucka 		= function(ply) return ply:SteamID64() == "76561198337685853" end -- The first ever real - life friend of mine to get IdiotBox;
idiot.IsCal1n 		= function(ply) return ply:SteamID64() == "76561198342806825" end -- Created #TEAMNIGGER with me and the dude above, also second real - life friend of mine to get IdiotBox;
idiot.IsRussian 	= function(ply) return ply:SteamID64() == "76561198867917491" end -- He suggested many of the IdiotBox v6.7 features and helped me make and test them;
idiot.IsNigga		= function(ply) return ply:SteamID64() == "76561198163891865" end -- Helped me with a few smaller features;
idiot.IsDrygo 		= function(ply) return ply:SteamID64() == "76561198171361607" end -- IdiotBox veteran, though I lost contact with him, unfortunately;
idiot.IsPerSix		= function(ply) return ply:SteamID64() == "76561198198405171" end -- IdiotBox veteran, but I am still in contact with him, fortunately;
idiot.IsOhhStyle	= function(ply) return ply:SteamID64() == "76561197969016117" end -- IdiotBox veteran, the first ever person to make a video on IdiotBox but I lost contact with him as well;
idiot.IsTryHard		= function(ply) return ply:SteamID64() == "76561198099338999" end -- IdiotBox veteran, very chill dude that I forgot to credit;
idiot.IsDerpos		= function(ply) return ply:SteamID64() == "76561198260469514" end -- IdiotBox veteran, had lots of fun back in the day;
idiot.IsSDunken		= function(ply) return ply:SteamID64() == "76561198385396760" end -- IdiotBox veteran, the first ever actual IdiotBox user and tester he is the real OG;
idiot.IsZergo		= function(ply) return ply:SteamID64() == "76561198111148439" end -- IdiotBox veteran, and weirdly enough, I am not sure if I lost contact with him or not;
idiot.IsMrSquid		= function(ply) return ply:SteamID64() == "76561198079861949" end -- IdiotBox veteran, without him and his videos, IdiotBox would have never been this popular;
idiot.IsJohnRG		= function(ply) return ply:SteamID64() == "76561198212367369" end -- IdiotBox veteran, great homie that helped me through my journey of pasting.
idiot.IsDev 		= function(ply) return ply:SteamID64() == "76561198087554278" or ply:SteamID64() == "76561198285601724" or ply:SteamID64() == "76561198212367369" or ply:SteamID64() == "76561198079861949" or ply:SteamID64() == "76561198111148439" or ply:SteamID64() == "76561198385396760" or ply:SteamID64() == "76561198260469514" or ply:SteamID64() == "76561197969016117" or ply:SteamID64() == "76561198198405171" or ply:SteamID64() == "76561198171361607" or ply:SteamID64() == "76561198337685853" or ply:SteamID64() == "76561198342806825" or ply:SteamID64() == "76561198867917491" or ply:SteamID64() == "76561198163891865" or ply:SteamID64() == "76561198099338999" end

--NOTE-- I want to mention that these are not the only people that helped me with the development of IdiotBox, but they are the ones who helped me the most and that is why they are developers.

function idiot.PlayerCheck()
	for k, v in pairs(player.GetAll()) do
	if (idiot.IsMe(v) and not v.Confirmed) then
	if idiot.IsMe(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "The creator of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsMyAlt(v) and not v.Confirmed) then
	if idiot.IsMyAlt(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "The creator of IdiotBox, "..v:Nick()..", is on the server, using his ALT!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsUucka(v) and not v.Confirmed) then
	if idiot.IsUucka(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsCal1n(v) and not v.Confirmed) then
	if idiot.IsCal1n(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsRussian(v) and not v.Confirmed) then
	if idiot.IsRussian(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsTryHard(v) and not v.Confirmed) then
	if idiot.IsTryHard(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsDrygo(v) and not v.Confirmed) then
	if idiot.IsDrygo(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsPerSix(v) and not v.Confirmed) then
	if idiot.IsPerSix(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsOhhStyle(v) and not v.Confirmed) then
	if idiot.IsOhhStyle(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsDerpos(v) and not v.Confirmed) then
	if idiot.IsDerpos(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsSDunken(v) and not v.Confirmed) then
	if idiot.IsSDunken(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsZergo(v) and not v.Confirmed) then
	if idiot.IsZergo(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsMrSquid(v) and not v.Confirmed) then
	if idiot.IsMrSquid(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsJohnRG(v) and not v.Confirmed) then
	if idiot.IsJohnRG(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	if (idiot.IsNigga(v) and not v.Confirmed) then
	if idiot.IsNigga(me) then continue end
		timer.Create("ChatPrint", 11.3, 1, function() MsgRGB(6.9, "A developer of IdiotBox, "..v:Nick()..", is on the server!") end)
		timer.Create("PlaySound", 11.3, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		RunConsoleCommand("say", "I'm here to chew ass and kick bubblegum, and I'm all out of ass!")
		v.Confirmed = true
		end
	end
end

local function UpdateVar(men, sub, lookup, new)
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] ~= sub) then continue end
				if(val[1] == lookup) then
					val[3] = new
			end
		end
	end
end

local folder = "IdiotBox"

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

local function SaveConfig()
	file.Write(folder.."/legithack.txt", util.TableToJSON(options))
end

local function SaveConfig2()
	file.Write(folder.."/ragehack.txt", util.TableToJSON(options))
end

local function LoadConfig()
	if file.Exists(folder.."/legithack.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/legithack.txt", "DATA"))
	local cursub
		for k, v in next, tab do
			if(not options[k]) then continue end
			for men, subtab in next, v do
				for key, val in next, subtab do
					if(key == 1) then cursub = val[1] continue end
					UpdateVar(k, cursub, val[1], val[3])
				end
			end
		end
	end
end

local function LoadConfig2()
	if file.Exists(folder.."/ragehack.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/ragehack.txt", "DATA"))
	local cursub
		for k, v in next, tab do
			if(not options[k]) then continue end
			for men, subtab in next, v do
				for key, val in next, subtab do
					if(key == 1) then cursub = val[1] continue end
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
	surface.SetTextPos(512, 15 - th / 2)
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	surface.SetFont("IdiotFont")
	surface.DrawText("IdiotBox v6.7.2")
	surface.SetFont("MenuFont")
	surface.DrawRect(0, 31, 0, h - 31)
	surface.DrawRect(0, h - 0, w, h)
	surface.DrawRect(w - 0, 31, 0, h)
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	surface.SetTextPos(40, 15 - th / 2)
	surface.DrawText("Created by Phizz & more")
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	surface.SetTextPos(810, 15 - th / 2)
	surface.DrawText("Custom Name: ")
	surface.SetTextColor(HSVToColor(RealTime()*45%360, 1, 1))
	surface.DrawText(" "..GetConVarString("ib_changename"))
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
		if(visible[v]) then
			local curcol = Color(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
			for i = 0, 0 do
					surface.SetDrawColor(curcol)
					curcol.r, curcol.g, curcol.b = curcol.r + 3, curcol.g + 3, curcol.b + 3
					surface.DrawLine(0.9 + maxx, 60 + i, 0.9 + maxx + sizeper, 60 + i)
			end
			elseif(bMouse) then
			local curcol = Color(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 100)
			for i = 0, 0 do
					surface.SetDrawColor(curcol)
					curcol.r, curcol.g, curcol.b = curcol.r + 3, curcol.g + 3, curcol.b + 3
					surface.DrawLine(0.9 + maxx, 60 + i, 0.9 + maxx + sizeper, 60 + i)
			end
		end
		if(bMouse and input.IsMouseDown(MOUSE_LEFT) and not mousedown and not visible[v]) then
				local nb = visible[v]
				for key, val in next, visible do
						visible[key] = false
				end
				visible[v] = not nb
		end
		surface.SetFont("MenuFont")
		surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
		local tw, th = surface.GetTextSize(v)
		surface.SetTextPos(5 + maxx + sizeper / 2 - tw / 2, 31 + 15 - th / 2)
		surface.DrawText(v)
		maxx = maxx + sizeper
	end
end

local function DrawCheckbox(self, w, h, var, maxy, posx, posy, dist)
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
	surface.SetTextPos(5 + posx + 15 + 5, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(var[1])
	surface.DrawText(var[1])
	surface.SetDrawColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
	surface.DrawOutlinedRect(5 + posx + 15 + 5 + dist + var[4], 61 + posy + maxy + 2, 14, 14)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 5 + posx + 15 + 5, my + 61 + posy + maxy, mx + 5 + posx + 15 + 5 + dist + 14 + var[4], my + 61 + posy + maxy + 16)
	if(bMouse) then
		surface.DrawRect(5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10)
	end
	if(var[3]) then
		local curcol = Color(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
		surface.SetDrawColor(curcol)
		surface.DrawRect(5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10)
		surface.SetDrawColor(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:"))
		surface.DrawOutlinedRect(5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10)
	end
	if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !mousedown && !drawlast) then
		var[3] = !var[3]
	end
end

local function DrawSlider(self, w, h, var, maxy, posx, posy, dist)
	local curnum = var[3]
	local max = var[4]
	local size = var[5]
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
	surface.SetTextPos(5 + posx + 15 + 5, 61 + posy + maxy)
	surface.DrawText(var[1])
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
	surface.DrawRect(5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 2)
	local ww = math.ceil(curnum * size / max)
	surface.SetDrawColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
	surface.DrawRect(3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 9 - 5, 4, 12)
	surface.SetDrawColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
	local tw, th = surface.GetTextSize(curnum..".00")
	surface.DrawOutlinedRect(3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 4, 4, 12)
	surface.SetTextPos(5 + posx + 15 + 5 + dist + (size / 2) - tw / 2, 61 + posy + maxy + 16)
	surface.DrawText(curnum..".00")
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(5 + posx + 15 + 5 + dist + mx, 61 + posy + maxy + 9 - 5 + my, 5 + posx + 15 + 5 + dist + mx + size, 61 + posy + maxy + 9 - 5 + my + 12)
	if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !candoslider) then
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
	surface.SetTextColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
	surface.SetTextPos(5 + posx + 15 + 5, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(var[1])
	surface.DrawText(var[1])
	surface.SetDrawColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), 150)
	surface.DrawOutlinedRect(25 + posx + dist, 61 + posy + maxy, size, 16)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy
	if(bMouse || notyetselected == check) then
		surface.DrawRect(25 + posx + dist + 2, 61 + posy + maxy + 2, size - 4, 12)
	end
	local tw, th = surface.GetTextSize(curopt)
	surface.SetTextPos(25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2)
	surface.DrawText(curopt)
	if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !mousedown || notyetselected == check) then
		notyetselected = check
		drawlast = function()
			local maxy2 = 16
			for k, v in next, var[4] do
				surface.SetDrawColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), 50)
				surface.DrawRect(25 + posx + dist, 61 + posy + maxy + maxy2, size, 16)
				local bMouse2 = MouseInArea(mx + 25 + posx + dist, my + 61 + posy + maxy + maxy2, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16 + maxy2)
				if(bMouse2) then
					surface.SetDrawColor(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), 100)
					surface.DrawRect(25 + posx + dist, 61 + posy + maxy + maxy2, size, 16)
				end
				local tw, th = surface.GetTextSize(v)
				surface.SetTextPos(25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2 + maxy2)
				surface.DrawText(v)
				maxy2 = maxy2 + 16
				if(bMouse2 && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
					var[3] = v
					notyetselected = nil
					drawlast = nil
					return
				end
			end
			local bbMouse = MouseInArea(mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + maxy2)
			if(!bbMouse && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
				 notyetselected = nil
				 drawlast = nil
				 return
			end
		end
	end
end

local function DrawUnloadButton(self, w, h)
	local curcol = Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:"))
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 910, my + h - 50, mx + 965, my + h - 50 + 30)
	if(bMouse) then
			curcol = Color(gInt("Settings", "Main Text Color", "Red:") + 60, gInt("Settings", "Main Text Color", "Green:") + 60, gInt("Settings", "Main Text Color", "Blue:") + 60, gInt("Settings", "Others", "T Opacity:"))
	end
	for i = 0, 0 do
			surface.SetDrawColor(curcol)
			surface.DrawLine(910, h - 50 + i, 1020, h - 50 + i)
			for k, v in next, curcol do
					curcol[k] = curcol[k] - 2
			end
	end
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	local tw, th = surface.GetTextSize("Unload")
	surface.SetTextPos(847 + 100 - tw / 2, h - 50 + 15 - th / 2)
	surface.DrawText("Unload")
	if bMouse and input.IsMouseDown(MOUSE_LEFT) then
		unloaded = true
		hook.Remove("RenderScene", "Hook1")
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
		hook.Remove("CreateMove", "Hook17")
		hook.Remove("AdjustMouseSensitivity", "Hook18")
		hook.Remove("ShouldDrawLocalPlayer", "Hook19")
		hook.Remove("CalcView", "Hook20")
		hook.Remove("player_disconnect", "Hook21")
		hook.Remove("HUDPaint", "Hook22")
		hook.Remove("PreDrawOpaqueRenderables", "Hook23")
		hook.Remove("OnPlayerChat", "Hook24")
		me:ConCommand("M9KGasEffect 1 cl_interp 0 cl_interp_ratio 2 cl_updaterate 30")
		bSendPacket = true
		_G.Loaded = false
		timer.Create("ChatPrint", 0.1, 1, function() MsgG(2.5, "Successfully unloaded the cheat.") end)
		timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
	end
end

local function DrawSaveButton(self, w, h)
	local curcol = Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:"))
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 30, my + h - 50, mx + 30 + 115, my + h - 50 + 30)
	if(bMouse) then
		curcol = Color(gInt("Settings", "Main Text Color", "Red:") + 60, gInt("Settings", "Main Text Color", "Green:") + 60, gInt("Settings", "Main Text Color", "Blue:") + 60, gInt("Settings", "Others", "T Opacity:"))
	end
	for i = 0, 0 do
		surface.SetDrawColor(curcol)
		surface.DrawLine(30, h - 50 + i, 30 + 115, h - 50 + i)
		for k, v in next, curcol do
			curcol[k] = curcol[k] - 2
		end
	end
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	local tw, th = surface.GetTextSize("Save Legithack")
	surface.SetTextPos(30 + 60 - tw / 2, h - 50 + 15 - th / 2)
	surface.DrawText("Save Legithack")
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
		SaveConfig()
		timer.Create("ChatPrint", 0.1, 1, function() MsgG(2.5, "Legitbot Saved!") end)
		timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
	end
end

local function DrawLoadButton(self, w, h)
	for k, v in pairs(player.GetAll()) do
	if(gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Load Legithack" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me) then LoadConfig() end
	end
	local curcol = Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:"))
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 160, my + h - 50, mx + 270, my + h - 50 + 30)
	if(bMouse) then
		curcol = Color(gInt("Settings", "Main Text Color", "Red:") + 60, gInt("Settings", "Main Text Color", "Green:") + 60, gInt("Settings", "Main Text Color", "Blue:") + 60, gInt("Settings", "Others", "T Opacity:"))
	end
	for i = 0, 0 do
		surface.SetDrawColor(curcol)
		surface.DrawLine(160, h - 50 + i, 270, h - 50 + i)
		for k, v in next, curcol do
			curcol[k] = curcol[k] - 2
		end
	end
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	local tw, th = surface.GetTextSize("Load Legithack")
	surface.SetTextPos(117 + 100 - tw / 2, h - 50 + 15 - th / 2)
	surface.DrawText("Load Legithack")
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
		LoadConfig()
		timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Legitbot Loaded!") end)
		timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
	end
end

local function DrawSaveButton2(self, w, h)
	local curcol = Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:"))
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 300, my + h - 50, mx + 402, my + h - 50 + 30)
	if(bMouse) then
		curcol = Color(gInt("Settings", "Main Text Color", "Red:") + 60, gInt("Settings", "Main Text Color", "Green:") + 60, gInt("Settings", "Main Text Color", "Blue:") + 60, gInt("Settings", "Others", "T Opacity:"))
	end
	for i = 0, 0 do
		surface.SetDrawColor(curcol)
		surface.DrawLine(300, h - 50 + i, 402, h - 50 + i)
		for k, v in next, curcol do
			curcol[k] = curcol[k] - 2
		end
	end
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	local tw, th = surface.GetTextSize("Save Ragehack")
	surface.SetTextPos(300 + 50 - tw / 2, h - 50 + 15 - th / 2)
	surface.DrawText("Save Ragehack")
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
		SaveConfig2()
		timer.Create("ChatPrint", 0.1, 1, function() MsgG(2.5, "Ragebot Saved!") end)
		timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
	end
end

local function DrawLoadButton2(self, w, h)
	local curcol = Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:"))
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 418, my + h - 50, mx + 520, my + h - 50 + 30)
	if(bMouse) then
		curcol = Color(gInt("Settings", "Main Text Color", "Red:") + 60, gInt("Settings", "Main Text Color", "Green:") + 60, gInt("Settings", "Main Text Color", "Blue:") + 60, gInt("Settings", "Others", "T Opacity:"))
	end
	for i = 0, 0 do
		surface.SetDrawColor(curcol)
		surface.DrawLine(418, h - 50 + i, 520, h - 50 + i)
		for k, v in next, curcol do
			curcol[k] = curcol[k] - 2
		end
	end
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	local tw, th = surface.GetTextSize("Load Ragehack")
	surface.SetTextPos(418 + 50 - tw / 2, h - 50 + 15 - th / 2)
	surface.DrawText("Load Ragehack")
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
		LoadConfig2()
		timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Ragebot Loaded!") end)
		timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
	end
end

LoadConfig()

local function DrawCloseButton(self, w, h)
	local curcol = Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:"))
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 980, my + h - 50, mx + 1075, my + h - 50 + 30)
	if(bMouse) then
		curcol = Color(gInt("Settings", "Main Text Color", "Red:") + 60, gInt("Settings", "Main Text Color", "Green:") + 60, gInt("Settings", "Main Text Color", "Blue:") + 60, gInt("Settings", "Others", "T Opacity:"))
	end
	for i = 0, 0 do
		surface.SetDrawColor(curcol)
		surface.DrawLine(980, h - 50 + i, 1075, h - 50 + i)
		for k, v in next, curcol do
			curcol[k] = curcol[k] - 2
		end
	end
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	local tw, th = surface.GetTextSize("Close Menu")
	surface.SetTextPos(930 + 100 - tw / 2, h - 50 + 15 - th / 2)
	surface.DrawText("Close Menu")
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
		CloseMenu()
		surface.PlaySound("buttons/lightswitch2.wav")
	end
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
		draw.RoundedBox(gInt("Settings", "Others", "Roundness:"), 0, 0, w, h, Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:")))
		DrawUpperText(w, h)
		DrawUnloadButton(self, w, h)
		DrawSaveButton(self, w, h)
		DrawSaveButton2(self, w, h)
		DrawLoadButton(self, w, h)
		DrawLoadButton2(self, w, h)
		DrawCloseButton(self, w, h)
		draw.SimpleText("Search Entity:", "MenuFont", 192, 610, Color(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText("Add Entity:", "MenuFont", 642, 610, Color(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	ent_list.Paint = function(self, w, h)
		draw.RoundedBox(15, 0, 0, w, h, Color(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")))
	end
	draw_list.Paint = function(self, w, h)
		draw.RoundedBox(15, 0, 0, w, h, Color(gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")))
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
	function CloseMenu()
		finder:Remove()
		menuopen = false
		candoslider = false
		drawlast = nil
	end
	finder.Think = function()
		if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menukeydown2 or unloaded == true) then
			finder:Remove()
			file.Write(folder.."/entities.txt", util.TableToJSON(drawn_ents))
			menuopen = false
			candoslider = false
			drawlast = nil
		end
	end
end

local function DrawEntitiesButton(self, w, h)
	local curcol = Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:"))
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 683, my + h - 50, mx + 785, my + h - 50 + 30)
	if(bMouse) then
		curcol = Color(gInt("Settings", "Main Text Color", "Red:") + 60, gInt("Settings", "Main Text Color", "Green:") + 60, gInt("Settings", "Main Text Color", "Blue:") + 60, gInt("Settings", "Others", "T Opacity:"))
	end
	for i = 0, 0 do
		surface.SetDrawColor(curcol)
		surface.DrawLine(683, h - 50 + i, 785, h - 50 + i)
		for k, v in next, curcol do
			curcol[k] = curcol[k] - 2
		end
	end
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 255)
	local tw, th = surface.GetTextSize("Entities Menu")
	surface.SetTextPos(683 + 50 - tw / 2, h - 50 + 15 - th / 2)
	surface.DrawText("Entities Menu")
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
		self:Remove()
		EntityFinder()
		timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
	end
end

local function DrawSubSub(self, w, h, k, var)
	local opt, posx, posy, sizex, sizey, dist = var[1][1], var[1][2], var[1][3], var[1][4], var[1][5], var[1][6]
	surface.SetDrawColor(gInt("Settings", "Border Color", "Red:"), gInt("Settings", "Border Color", "Green:"), gInt("Settings", "Border Color", "Blue:"), gInt("Settings", "Others", "B Opacity:"))
	local startpos = 61 + posy
	surface.SetTextColor(gInt("Settings", "Border Color", "Red:"), gInt("Settings", "Border Color", "Green:"), gInt("Settings", "Border Color", "Blue:"), gInt("Settings", "Others", "B Opacity:"))
	surface.SetFont("MenuFont")
	local tw, th = surface.GetTextSize(opt)
	surface.DrawLine(5 + posx, startpos, 5 + posx + 15, startpos)
	surface.SetTextPos(5 + posx + 15 + 5, startpos - th / 2)
	surface.DrawLine(5 + posx + 15 + 5 + tw + 5, startpos, 5 + posx + sizex, startpos)
	surface.DrawLine(5 + posx, startpos, 5 + posx, startpos + sizey)
	surface.DrawLine(5 + posx, startpos + sizey, 5 + posx + sizex, startpos + sizey)
	surface.DrawLine(5 + posx + sizex, startpos, 5 + posx + sizex, startpos + sizey)
	surface.DrawText(opt)
	local maxy = 15
	for k, v in next, var do
		if(k == 1) then continue end
			if(v[2] == "Checkbox") then
					DrawCheckbox(self, w, h, v, maxy, posx, posy, dist)
			elseif(v[2] == "Slider") then
					DrawSlider(self, w, h, v, maxy, posx, posy, dist)
			elseif(v[2] == "Selection") then
					DrawSelect(self, w, h, v, maxy, posx, posy, dist)
				end
		maxy = maxy + 25
	end
end

local function DrawSub(self, w, h)
	for k, v in next, visible do
		if(!v) then continue end
		for _, var in next, options[k] do
			DrawSubSub(self, w, h, k, var)
		end
	end
end

local menusongs = {
	"https://dl.dropbox.com/s/wl4b4xf35uq58m4/El%20Huervo%20 - %20Rust.mp3?dl=1", 
	"https://dl.dropbox.com/s/0m22ytfia8qoy4m/Daisuke%20 - %20El%20Huervo.mp3?dl=1", 
	"https://dl.dropbox.com/s/vsz77wdjqy1xf83/HOME%20 - %20Resonance.mp3?dl=1", 
	"https://dl.dropbox.com/s/c0aiwmxit91a4ry/Nazi%20German%20Anthem?dl=1", 
	"https://dl.dropbox.com/s/n3423roa8cgp4bx/Schutzstaffel%20%CF%9F%CF%9F%20 - %20_SS%20marschiert%20in%20Feindesland_?dl=1", 
	"https://dl.dropbox.com/s/98e24cjsek6h6jf/XS%20Project%20 - %20Bochka_%20Bass_%20Kolbaser%20%5BBass%20Boosted%5D?dl=1", 
	"https://dl.dropbox.com/s/73dymioyv34scd8/%D0%A2%D0%A0%D0%98%20%D0%9F%D0%9E%D0%9B%D0%9E%D0%A1%D0%9A%D0%98%20_%20KOLM%20TRIIPU%20_%20THREE%20STRIPES?dl=1", 
	"https://dl.dropbox.com/s/1etyg4m6xcbiqaq/Cheeki%20Breeki%20Hardbass%20Anthem?dl=1", 
	"https://dl.dropbox.com/s/n6owjtloioxi0bd/German%20Schutzstaffel%20SS%20Song%20%20 - %20_Sieg%20Heil%20Viktori?dl=1", 
	"https://dl.dropbox.com/s/jipllw5eygkc91h/Russia%20Hardbass%20Crazy%20Dance%202?dl=1", 
	"https://dl.dropbox.com/s/rikth7z0v0flfr4/Soviet%20Army%20dancing%20to%20Hard%20Bass?dl=1", 
	"https://dl.dropbox.com/s/ubhbhsjos6fj3bk/Dj%20DaRoO%20HARD%20BASS?dl=1", 
}

local function Menu()
	local frame = vgui.Create("DFrame")
	frame:SetSize(1110, 742)
	frame:Center()
	frame:SetTitle("")
	frame:MakePopup()
	frame:ShowCloseButton(false)
	if(gBool("More", "More", "Turn on Music")) then
		RunConsoleCommand("stopsound")
	idiot.sound.PlayURL(menusongs[math.random(#menusongs)], "mono", function(station)
		if (idiot.IsValid(station)) then
			station:Play()
			end
		end)
	end
	if(gBool("More", "More", "Reset Sounds")) then
		RunConsoleCommand("stopsound")
	end
	frame.Paint = function(self, w, h)
			if(candoslider and not mousedown and not drawlast and not input.IsMouseDown(MOUSE_LEFT)) then
				candoslider = false
			end
			draw.RoundedBox(gInt("Settings", "Others", "Roundness:"), 0, 0, w, h, Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:")))
			DrawUpperText(w, h)
			DrawOptions(self, w, h)
			DrawSub(self, w, h)
			DrawUnloadButton(self, w, h)
			DrawSaveButton(self, w, h)
			DrawSaveButton2(self, w, h)
			DrawLoadButton(self, w, h)
			DrawLoadButton2(self, w, h)
			DrawCloseButton(self, w, h)
			DrawEntitiesButton(self, w, h)
			if(drawlast) then
					drawlast()
					candoslider = true
			end
			mousedown = input.IsMouseDown(MOUSE_LEFT)
	end
	function CloseMenu()
		frame:Remove()
		menuopen = false
		candoslider = false
		drawlast = nil
	end
	frame.Think = function()
		if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menukeydown2 or unloaded == true) then
			frame:Remove()
			menuopen = false
			candoslider = false
			drawlast = nil
		end
	end
end

local function NoCam()
	if gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Enabled") or gBool("More", "More", "Thirdperson") or not me:Alive() or me:Health() < 1 then
		return false
	end
	if me:GetActiveWeapon():IsValid() and me:GetActiveWeapon():GetClass() == "gmod_camera" then
		return true
	else
		return false
	end
end

local function NoPhys()
	if gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Enabled") or gBool("More", "More", "Thirdperson") or not me:Alive() or me:Health() < 1 then
		return false
	end
	if me:GetActiveWeapon():IsValid() and me:GetActiveWeapon():GetClass() == "weapon_physgun" then
		return true
	else
		return false
	end
end

local toggler = 0

local function RapidFire(pCmd)
	if(gBool("Aimbot", "More (Ragebot & Legitbot)", "Rapid Fire")) then
	local wep = pm.GetActiveWeapon(me)
		if pm.KeyDown(me, IN_ATTACK) then
			if (em.Health(me) > 0) then
				if not NoPhys() and not NoCam() then
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
	if(gBool("Aimbot", "More (Ragebot & Legitbot)", "Rapid Alt Fire")) then
	local wep = pm.GetActiveWeapon(me)
		if pm.KeyDown(me, IN_ATTACK) then
			if (em.Health(me) > 0) then
				if not NoPhys() and not NoCam() then
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
	
	if table.HasValue(ignore_list, killed:UniqueID()) then
		return false
	end
	
	if table.HasValue(ignore_list, killer:UniqueID()) then
		return false
	end

local playerphrases = {
	"Owned", 
	"Bodied", 
	"Smashed", 
	"Fucked", 
	"Destroyed", 
	"Annihilated", 
	"Decimated", 
	"Wrecked", 
	"Demolished", 
	"Trashed", 
	"Ruined", 
	"Murdered", 
	"Exterminated", 
	"Slaughtered", 
	"Butchered", 
	"Genocided", 
	"Executed", 
	"Bamboozled", 
	"IdiotBox'd", 
}

local excuses = {
	"i lagged out wtf", 
	"bad ping wtf", 
	"lol wasnt looking at you", 
	"was alt tabbed", 
	"luck", 
	"wow", 
	"nice one", 
	"i think ur hacking m8", 
	"my cat was on the keyboard", 
	"my dog was on the keyboard", 
	"my fps is trash", 
	"my ping is trash", 
	"ouch", 
	"wtf", 
	"ok", 
}

local hvhexcuses = {
	"forgot to press aimkey lol", 
	"give me a minute to configurate", 
	"wtf it didnt save my settings wait", 
	"lol my hvh settings are gone, wait", 
	"luck lol", 
	"my fps is trash", 
	"my ping is trash", 
	"what are you using?", 
}

local hvhexcuses2 = {
	"Ok", 
	"Nice", 
	"Lucky", 
	"Sorry, bad aa", 
	"My configs suck", 
	"I suck at HvH", 
	"What are you using?", 
	"I'm using a shit cheat", 
}

local reason = {
	"bad at game", 
	"spawnkilling", 
	"hacker", 
	"hacking", 
	"hack", 
	"bad", 
	"eats penis", 
}

local reason2 = {
	"hacker", 
	"spawnkiller", 
	"propkiller", 
	"rdm", 
	"being annoying", 
	"bad at the game", 
	"acts like a retard", 
	"is stupid", 
}

local bantime = {
	"1", 
	"2", 
	"3", 
	"4", 
	"5", 
	"6", 
	"7", 
	"8", 
	"9", 
	"10", 
	"20", 
	"30", 
	"40", 
	"50", 
	"60", 
	"70", 
	"80", 
	"90", 
	"100", 
	"200", 
	"300", 
	"400", 
	"500", 
	"600", 
	"700", 
	"800", 
	"900", 
	"1000", 
	"2000", 
	"3000", 
	"4000", 
	"5000", 
	"6000", 
	"7000", 
	"8000", 
	"9000", 
	"10000", 
	"20000", 
	"30000", 
	"40000", 
	"50000", 
	"60000", 
	"70000", 
	"80000", 
	"90000", 
	"100000", 
	"200000", 
	"300000", 
	"400000", 
	"500000", 
	"600000", 
	"700000", 
	"800000", 
	"900000", 
	"1000000", 
	"999999999", 
}

local randomoption = { 
	"likes_penis", 
	"eats_penis", 
	"is_gay", 
	"is_a_faggot", 
	"should_get_kicked", 
	"hates_vagina", 
	"doesnt_eat_pussy", 
	"doesnt_get_pussy", 
	"thinks_about_penis_all_day", 
	"has_a_fake_penis", 
	"is_a_dirty_jew", 
}

local owned = {
	killed:Nick().." is so shit", 
	"can you stop dying, "..killed:Nick().."?", 
	"hey, "..killed:Nick().."? it's okay, try again next time!", 
	"what the fuck was that "..killed:Nick().."?", 
	"plan your next try in the respawn room!", 
	"rekt", 
	"owned", 
	"lol", 
	"you're a retard, "..killed:Nick(), 
	"there you go, back to the respawn", 
	"you're bad, " ..killed:Nick(), 
	"noob down", 
	"lmao", 
	killed:Nick().." has died more times than native americans did back in the 1800's", 
	"i bet you're insecure about your aim", 
	"ahahah", 
	"excuse me "..killed:Nick()..", you have won the world record of the worst KD in history!", 
	"there he goes back to the respawn room", 
	"don't let the door hit you on the way out, "..killed:Nick().."!", 
	"noob", 
	killed:Nick().." is a noob", 
	"nerd", 
	"pff", 
	"ha", 
	"ez", 
	killed:Nick().." is a nerd", 
	"good job!", 
	"try not to die next time, "..killed:Nick().."!", 
	"!votekick "..killed:Nick().." "..reason[math.random(#reason)], 
	"!voteban "..killed:Nick().." 9999 "..reason[math.random(#reason)], 
	"!vote "..killed:Nick().."... "..randomoption[math.random(#randomoption)].." "..randomoption[math.random(#randomoption)].." "..randomoption[math.random(#randomoption)], 
}

local votekick = {
	"!votekick "..killed:Nick().." "..reason2[math.random(#reason2)], 
}

local voteban = {
	"!voteban "..killed:Nick().." "..bantime[math.random(#bantime)].." "..reason2[math.random(#reason2)], 
}

local hvhowned = {
	"sick cheat, "..killed:Nick().."!", 
	"get fucked", 
	"rekt", 
	"owned", 
	"did you get that garbage from the steam workshop?", 
	"ha", 
	"ez", 
	"loser", 
	"take this L", 
	"\"my cheat is good it owns everyone!!\" - "..killed:Nick(), 
	killed:Nick()..": LOL WHAT ARE YOU USING??? I WANT THAT", 
	"noob", 
	"nerd", 
	"pff", 
	"gj", 
	"how can a cheat suck this hard?", 
	"nice strategy", 
	"nice move", 
	"lmfao, "..killed:Nick(), 
	"what the fuck are you using "..killed:Nick().."?", 
}

local hvhowned2 = {
	"Hey, "..killed:Nick()..", stop using that shit and get IdiotBox", 
	""..killed:Nick().." just got owned by IdiotBox", 
	"Get IdiotBox'd you nerd", 
	"Get fucked by IdiotBox", 
	"Don't stay too much inside the respawn room, "..killed:Nick().."!", 
	"You have been tapped by IdiotBox", 
	"Get IdiotBox before trying to HvH, "..killed:Nick(), 
	"IdiotBox owns your garbage cheat", 
}

local comebackexcuses = {
	"what the fuck", 
	"excuse me??", 
	"man tf??", 
	"fucking nigger", 
	"fuck you", 
	"fuck off smelly jew", 
	"smelly nigger", 
	"bad ping", 
	"you're next", 
	"eat shit", 
	"eat a fat steaming cock you unpriviledged homosexual", 
	"suck my universe sized dick", 
	"drink my piss fucking faggot", 
	"hop off my dick fucking nigger", 
}

local comebackowned = {
	"you got fucked in the ass", 
	"get fucking raped", 
	""..killed:Nick().." can drink my fucking piss", 
	"you suck shit gay nigger", 
	"you should eat my shit", 
	"you got shafted by my large penis, "..killed:Nick(), 
	""..killed:Nick().." is getting fucked by an aimbot", 
	""..killed:Nick().." is getting fucking murdered", 
	"you're so shit at this game, quit already", 
	"drink my dog's piss faggot", 
	"hey don't cry bro, you need a tissue?", 
	"you're so fucking gay", 
	"you're the reason why equal rights don't exist, "..killed:Nick(), 
	""..killed:Nick().." is radiating big faggot energy", 
	"hurr durr stop cheating in an ancient video game!!!", 
	"stop being such a spastical retard already", 
	"you're more braindead than kim jong un after his surgery", 
	"you're a furfag and should not be proud, "..killed:Nick(), 
	""..killed:Nick().." is getting dominated by me, aka god", 
	"you live in a fucking dirty hut, retarded african boy", 
	"i bet you're literally fucking black", 
	""..killed:Nick().." is a gay autistic nigger with no privileges", 
	""..killed:Nick().." is being searched for by the fbi", 
	""..killed:Nick().." literally fucking died in gmod", 
	"you're ultra retarded, kid", 
	"you need a tissue, little faggot?", 
	""..killed:Nick().." should get killed by me once again", 
	"please die more, you're feeding my addiction", 
	""..killed:Nick().." is a retard bot", 
	"you're so much of a loser, get a fucking life and stop playing this shit game kid", 
	"virgin lol get good", 
	"fucking coomer, go wash your crusty underwear you filth", 
	""..killed:Nick().." got cucked", 
	""..killed:Nick().." is dominated by pure fucking skill", 
	"you are a big noob", 
	"i can't wait to headshot you irl, "..killed:Nick(), 
	"you smelly homeless nigger", 
	""..killed:Nick().." still believes that god and santa exist lol", 
	"bruh you really do be crying at a game", 
	"please stop doing what you're doing and kill yourself", 
	""..killed:Nick().." lives in america", 
	"you are a deformed fetus", 
	""..killed:Nick().." is ugly as shit fr tho", 
	"you're cringe, stop doing this shit", 
	""..killed:Nick()..", you look like you died", 
	"fucking putrid fuck, kill yourself", 
	""..killed:Nick().." is a trash cheater", 
	""..killed:Nick().." is a normie", 
	"smelly fucker", 
	""..killed:Nick().." is a dickless prick", 
	""..killed:Nick().." is gay", 
	""..killed:Nick().." does not get any pussy", 
	"you're too stupid to be considered human", 
	"i bet this faggot, "..killed:Nick().." kisses girls!!", 
	""..killed:Nick().." is a furry", 
	""..killed:Nick().." is a waste of human flesh", 
	"i bet you won't be able to kill me even with hacks", 
	""..killed:Nick()..", men are the fuck. you are not the fuck. you are not men", 
	""..killed:Nick().." is a failed abortion", 
	""..killed:Nick().." fucking died", 
	""..killed:Nick().." plays with his dick for fun", 
	"play with my stinky fat throbbing cock you gay faggot", 
	"stop using hacks you cringe skid!!!", 
	""..killed:Nick().." uses cancer shit cheats!!", 
	"you show all of the signs of mental retardation", 
	"please just quit the game already", 
	""..killed:Nick().." is a "..killed:Nick().."", 
	"shut the fuck up and die", 
	"nigger lol", 
}

if(gOption("More", "Chat", "Kill Spam:") == "Normal") then
	if(killed == me and killer ~= me) then
		if not me:Alive() or me:Health() < 1 then return end
			RunConsoleCommand("say", string.format(excuses[math.random(#excuses)], killed:Nick()))
		end
		if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", owned[math.random(#owned)])
	end
	if(gOption("More", "Chat", "Kill Spam:") == "Insult") then
		if(killed == me and killer ~= me) then
			RunConsoleCommand("say", comebackexcuses[math.random(#comebackexcuses)])
		end
		if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", comebackowned[math.random(#comebackowned)])
	end
	if(gOption("More", "Chat", "Kill Spam:") == "HvH") then
		if(killed == me and killer ~= me) then
			RunConsoleCommand("say", hvhexcuses[math.random(#hvhexcuses)])
		end
		if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", hvhowned[math.random(#hvhowned)])
	end
	if(gOption("More", "Chat", "Kill Spam:") == "IdiotBox HvH") then
		if(killed == me and killer ~= me) then
			RunConsoleCommand("say", hvhexcuses2[math.random(#hvhexcuses2)])
		end
		if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", hvhowned2[math.random(#hvhowned2)])
	end
	if(gOption("More", "Chat", "Kill Spam:") == "Votekick") then
		if(killed == me and killer ~= me) then
			RunConsoleCommand("say", votekick[math.random(#votekick)])
		end
		if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", votekick[math.random(#votekick)])
	end
	if(gOption("More", "Chat", "Kill Spam:") == "Voteban") then
		if(killed == me and killer ~= me) then
			RunConsoleCommand("say", voteban[math.random(#voteban)])
		end
		if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", voteban[math.random(#voteban)])
	end
	if(gOption("More", "Chat", "Kill Spam:") == "Salty") then
		if(killed == me and killer ~= me) then
			RunConsoleCommand("say", "kys")
		end
		if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
			return
		end
		RunConsoleCommand("say", "ez")
	end
	if(gOption("More", "Chat", "Kill Spam:") == "Killstreak") then
		if(killed == me && playerkills > 0 && killer ~= me) then
		RunConsoleCommand("say", ""..killed:Nick().."'s ".."killstreak of "..playerkills.." has been ended by "..killer:Nick()..".")
		playerkills = 0
		end
		if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
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
	local vel = math.sqrt(vec.x*vec.x + vec.y*vec.y)
	local mang = vm.Angle(vec)
	local yaw = cm.GetViewAngles(pCmd).y - fa.y + mang.y
	if (((cm.GetViewAngles(pCmd).p + 90)%360) > 180) then
	yaw = 180 - yaw
	end
	yaw = ((yaw + 180)%360) - 180
	pCmd:SetForwardMove(math.cos(math.rad(yaw)) * vel)
	pCmd:SetSideMove(math.sin(math.rad(yaw)) * vel)
end

local function Clamp(val, min, max)
    if(val < min) then
        return min
    elseif(val > max) then
            return max
        end
    return val
end

local function NormalizeAngle(ang)
	if not NoPhys() and not NoCam() then
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
	draw.RoundedBox(gInt("Settings", "List Positions", "Roundness:"), gInt("Settings", "List Positions", "Custom Status X:") + 1, gInt("Settings", "List Positions", "Custom Status Y:") - 23, 88, 20, Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:")))
	draw.DrawText("Status", "MiscFont2", gInt("Settings", "List Positions", "Custom Status X:") + 45, gInt("Settings", "List Positions", "Custom Status Y:") - 22, Color(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")), TEXT_ALIGN_CENTER)
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
	if(em.IsValid(wep)) then
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
	surface.DrawText("Entities: "..math.Round(ents.GetCount() - player.GetCount()*12))
	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "List Positions", "Custom Status X:") + 3, hh + gInt("Settings", "List Positions", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Settings", "Others", "T Opacity:"))
	surface.DrawText("Frames: "..math.Round(1/FrameTime()))
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
	local color3 = (Color(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")))
	local color4 = (Color(0, 131, 125, gInt("Settings", "Others", "T Opacity:")))
	local hudspecslength = 150
	specscount = 0
	draw.RoundedBox(gInt("Settings", "Window Positions", "Roundness:"), gInt("Settings", "Window Positions", "Spectators X:") + 2, gInt("Settings", "Window Positions", "Spectators Y:"), radarWidth, radarHeight, Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:")))
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
	local col = Color(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
	local everything = ents.GetAll()
	draw.RoundedBox(gInt("Settings", "Window Positions", "Roundness:"), gInt("Settings", "Window Positions", "Radar X:") + 2, gInt("Settings", "Window Positions", "Radar Y:"), radarWidth, radarHeight, Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:")))
	draw.SimpleText("Radar", "MiscFont2", gInt("Settings", "Window Positions", "Radar X:") + 102, gInt("Settings", "Window Positions", "Radar Y:") + 11, col, 1, 1)
	draw.NoTexture()
	surface.SetDrawColor(team.GetColor(me:Team()))
	for k = 1, #everything do
		local v = everything[k]
		if (v:IsPlayer() and v:Health() > 0 and v:Team() ~= TEAM_SPECTATOR or (v:IsNPC() and v:Health() > 0)) then
			color = v:IsPlayer() and team.GetColor(v:Team()) or Color(255, 255, 255)
			surface.SetDrawColor(color)
			local myPos = me:GetPos()
			local theirPos = v:GetPos()
			local theirX = (radarX + (radarWidth / 2)) + ((theirPos.x - myPos.x) / gInt("Visuals", "More", "Radar Distance:"))
			local theirY = (radarY + (radarHeight / 2)) + ((myPos.y - theirPos.y) / gInt("Visuals", "More", "Radar Distance:"))
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
end

local function Logo2()
	draw.RoundedBox(gInt("Settings", "List Positions", "Roundness:"), gInt("Settings", "List Positions", "Players List X:") + 1, gInt("Settings", "List Positions", "Players List Y:") - 23, 88, 20, Color(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), gInt("Settings", "Others", "BG Opacity:")))
	draw.DrawText("Players", "MiscFont2", gInt("Settings", "List Positions", "Players List X:") + 47, gInt("Settings", "List Positions", "Players List Y:") - 22, Color(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")), TEXT_ALIGN_CENTER)
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
		surface.DrawText("" .. em.GetNWString(v, "usergroup").."")
		surface.SetTextColor(255, 255, 255, gInt("Settings", "Others", "T Opacity:"))
		surface.DrawText(" " .. v:GetName())
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
	local pos_x, pos_y = ScrW()/1.26, ScrH()/5.5
	local number = 1
	local offset = 14 + gInt("Aimbot", "Aim Options (Ragebot & Legitbot)", "List Spacing:")
	surface.SetDrawColor(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:"), 100)
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
					surface.SetDrawColor(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"))
				end
			else
				if table.HasValue(ignore_list, v:UniqueID()) then
					surface.SetDrawColor(175, 175, 175)
				elseif table.HasValue(priority_list, v:UniqueID()) then
					surface.SetDrawColor(255, 0, 100)
				else
					surface.SetDrawColor(gInt("Settings", "Background Menu Color", "Red:"), gInt("Settings", "Background Menu Color", "Green:"), gInt("Settings", "Background Menu Color", "Blue:"), 235)
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
		offset = offset + 14 + gInt("Aimbot", "Aim Options (Ragebot & Legitbot)", "List Spacing:")
		number = number + 1
	end
end

local function Crosshair()
	if menuopen then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if(gInt("More", "More", "Crosshair Type:") == "Square") then
	local x1, y1 = ScrW() * 0.5, ScrH() * 0.5
		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(x1 - 3, y1 - 2, 6, 6)
		surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
		surface.DrawRect(x1 - 2, y1 - 1, 4, 4)
	end
		if(gInt("More", "More", "Crosshair Type:") == "Cross") then
		surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
		surface.DrawLine(ScrW() / 2 - 11, ScrH() / 2, ScrW() / 2 + 11 , ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 11, ScrW() / 2 - 0 , ScrH() / 2 + 11)
	end
		if(gInt("More", "More", "Crosshair Type:") == "Aimware") then
		surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
		surface.DrawLine(ScrW() / 2 - 14.5, ScrH() / 2, ScrW() / 2 + 14.5 , ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 14.5, ScrW() / 2 - 0 , ScrH() / 2 + 14.5)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawLine(ScrW() / 2 - 9, ScrH() / 2, ScrW() / 2 + 9 , ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 9, ScrW() / 2 - 0 , ScrH() / 2 + 9)
	end
		if (gInt("More", "More", "Crosshair Type:") == "Swastika") then
		surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
		surface.DrawLine(ScrW()/2, ScrH()/2, ScrW()/2 + 20, ScrH()/2)
		surface.DrawLine(ScrW()/2 + 20, ScrH()/2, ScrW()/2 + 20, ScrH()/2 + 20)
		surface.DrawLine(ScrW()/2 , ScrH()/2, ScrW()/2 - 20, ScrH()/2)
		surface.DrawLine(ScrW()/2 - 20 , ScrH()/2, ScrW()/2 - 20, ScrH()/2 - 20)
		surface.DrawLine(ScrW()/2, ScrH()/2, ScrW()/2, ScrH()/2 - 20)
		surface.DrawLine(ScrW()/2, ScrH()/2 - 20, ScrW()/2 + 20, ScrH()/2 - 20)
		surface.DrawLine(ScrW()/2, ScrH()/2, ScrW()/2, ScrH()/2 + 20)
		surface.DrawLine(ScrW()/2, ScrH()/2 + 20, ScrW()/2 - 20, ScrH()/2 + 20)
	end
		if(gInt("More", "More", "Crosshair Type:") == "Box") then
		local x1, y1 = ScrW() * 0.5, ScrH() * 0.5
		surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
		surface.DrawOutlinedRect(x1 - 3, y1 - 2, 6, 6)
	end
		if(gInt("More", "More", "Crosshair Type:") == "Circle") then
		surface.DrawCircle(ScrW()/2, ScrH()/2, 4, Color(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")))
	end
		if(gInt("More", "More", "Crosshair Type:") == "Dot") then
		surface.DrawCircle(ScrW()/2, ScrH()/2, 1.4, Color(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")))
	end
		if(gInt("More", "More", "Crosshair Type:") == "GTA IV") then
		surface.DrawCircle(ScrW()/2, ScrH()/2, 11, Color(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW()/2, ScrH()/2, 1.4, Color(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")))
	end
end

hook.Add("RenderScene", "Hook1", function()
	if gBool("More", "Textures", "Dark Mode") then
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
	render.SetLightingMode(gBool("More", "Textures", "Light Mode") and 1 or 0)
end)

hook.Add("PostDrawViewModel", "Hook2", function(vm)
	if(!vm) then return end
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

hook.Add("HUDShouldDraw", "Hook4", function(name)
	if (gBool("More", "More", "Hide HUD")) and (hide[name]) then
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
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Murderer Knife", "MiscFont", pos.x + w/50, pos.y + h /11, Color(100, 0, 255), 1)
	end
	for k, v in pairs(ents.FindByClass("weapon_mu_magnum")) do
	local pos = em.GetPos(v) + Vector(1, 0, - 6)
	local pos2 = pos + Vector(0, 0, 70)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 1.3
	local h = h/ 1.8
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText("Magnum Pistol", "MiscFont", pos.x + w/50, pos.y + h /11, Color(100, 0, 255), 1)
	end
end

local randomname = {
	"Mike Hawk", 
	"Moe Lester", 
	"Mike Hunt", 
	"Ben Dover", 
	"Harold Kundt", 
	"Peter Pain", 
	"Dusan Mandic", 
	"Harry Gooch", 
	"Mike Oxlong", 
	"Mohammad Abdul", 
	"Ivana Dooyu", 
	"Slim Shader", 
	"Dead Walker", 
	"Mike Oxbig", 
	"Mike Rotch", 
	"Hugh Jass", 
	"Robin Banks", 
	"Mike Litt", 
	"Harry Wang", 
	"Harry Cox", 
	"Moss Cular", 
	"Amanda Reen", 
	"Major Kumm", 
	"Willie Wang", 
	"Hugh Blackstuff", 
	"Mike Rap", 
	"Al Coholic", 
	"Cole Kutz", 
	"Mike Litoris", 
	"Dixie Normous", 
	"Dick Pound", 
	"Mike Ock", 
	"Sum Ting Wong", 
	"Ho Lee Fuk", 
	"Harry Azcrac", 
	"Jay L. Bate", 
	"Hugh G. Rection", 
	"Long Wang", 
	"Wayne King", 
}

local function ChatSpam()

local ArabFunni = { -- I love my Discord server for making this thing
	"يمارس الجنس مع السلطة العربية سنة عظيمة",
	"رائحة مثل البظر دون السن القانونية هنا اسمحوا لي أن اللعنة",
	"ازدهار مسحوق الطاقة العربية سنة جيدة",
	"نحن نكره اليهو",
	"يمارس الجنس مع الأطفال الماعز نعم الجنس",
	"الله أكبر نعم رجل تفجير طفل",
	"هذه لحظة بره لحظة ارهابية سنة",
	"في تلك اللحظة التي يبدأ فيها أخاك في المغازلة مع والدتك",
	"الحصول على صندوق احمق نعم العربية غش كازاخستان",
	"يمارس الجنس مع نيغا الكلبة دا قرن الطفل",
	"ترك العرب باكستاني لحظة برمة تجميع كرمة",
	"حرق اليهود ، يمارس الجنس مع المسيح ، قتل الأطفال ، أصبح الله",
}

local HebrewFunni = { -- I love my Discord server for making this thing x2
	"לזיין את הכלב שלך אמא לעזאזל חרא סקס בכוס",
	"לעזאזל כוס כלבה בזין אני אוהבת עורלה הדוקה חתכה לי שלום כומר",
	"זו לא בדיחה מזוינת אני רוצה לתלות את עצמי השנה",
	"תזדיין שאתה יהודי הוא הגדול ביותר שכולכם כושים",
	"אני אהיה בן שש בשנה מכושן",
	"יש למול את הפין",
	"ישראל היא פלסטין המזוין הגדול ביותר במדינה",
	"זקן ישבן גדול על סנטרי, זהב בביתי, פוליטיקה במכנסיים שלי",
	"מזדיין לצאת מכושים ישראלים",
	"כוס חתולה אני מזיין את הזין ואז אני מוצץ כן",
	"חרא של אלוהים זה חרא של רחוב כן",
	"אני הולך לזיין ילד בן שתים עשרה בתחת, כן חתוך עורלה לעזאזל חרא כלבה",
}

local messagespam = {
	"GET FUCKED BY IDIOTBOX KIDDIE",
	"YOU SUCK SHIT LMAO",
	"STOP BEING SUCH A WORTHLESS CUMSTAIN AND GET IDIOTBOX NOW",
	"MONEY WASTER LOL",
	"YOU FUCKING FATASS, GET IDIOTBOX AND LOSE ALL THAT WEIGHT YOU INCEL",
	"ARE ALL THE GIRLS IGNORING YOU? GET IDIOTBOX AND YOU'LL BE FLOODED WITH PUSSY",
	"DO YOU FEEL WORTHLESS? WELL, YOU ARE LOL",
	"GET IDIOTBOX IF YOU WANT SOME OF THAT CLOUT",
	"STOP WASTING YOUR TIME ON SOUNDCLOUD BECAUSE YOU AIN'T GONNA GET NOWHERE WITH IT",
	"GET IDIOTBOX AND YOUR DICK WILL GROW 4 TIMES ITS SIZE",
	"LITTLE KID LMAO",
}

local offensivespam = {
	"fuck niggers like fr",
	"who else here hates black people lmao",
	"all niggers should be locked in cages and fed bananas",
	"black people are some sub-human slaves imo",
	"i've never met an intelligent black person",
	"why tf are all niggers so ugly lol",
	"all the black dudes i've seen look like monkeys",
	"ooga booga black rights",
	"my grandpa died in ww2, he was the best german pilot",
	"white people are genetically superior to every othe race",
	"all jews can do is hide the truth, steal money and start wars",
}

local insultspam = {
	" is shit at building",
	" is no older than 13",
	" looks like a 2 month old corpse",
	" really thinks gmod is a good game",
	" can't afford a better pc lmao",
	", so how do you like your 40 fps?",
	" will definitely kill himself before his 30's ",
	" is a fucking virgin lmao",
	" is a script kiddie",
	" thinks his 12cm penis is big lmfao",
	", how does it feel when you've never seen a naked woman in person?",
	", what do you like not being able to do a single push-up?",
	", tell me how it feels to be shorter than every girl you've met",
	" is a fatass who only spends his time in front of a monitor like an incel",
	"'s parents have a lower than average income",
	" lives under a bridge lmao",
	" vapes because is too afraid to smoke an actual ciggarette",
	", your low self esteem really pays off you loser",
	", make sure you tell me what unemployment feels like",
	" lives off of his parents' money",
	", you're a dissapointment to your entire family, fatass",
	" has probably fried all of his dopamine receptors by masturbating this much",
}

local advertise = {
	"IdiotBox - https://phizzofficial.wixsite.com/idiotbox4gmod/",
	"IdiotBox - Destroying everyone since '16.",
	"IdiotBox - Easy to use, free Garry's Mod cheat.",
	"IdiotBox - Now you can forget that negative KD's can be possible.",
	"IdiotBox - Beats all of your other cheats.",
	"IdiotBox - IdiotBox came back, and it came back with a vengeance.",
	"IdiotBox - Join the Discord server if you have high IQ.",
	"IdiotBox - The only high-quality free cheat, out for Garry's Mod.",
	"IdiotBox - Best cheat, created by Phizz & more.",
	"IdiotBox - Always updated, never dead.",
	"IdiotBox - A highly reliable and optimised cheating software.",
	"IdiotBox - Top class, free cheat for Garry's Mod.",
	"IdiotBox - Makes noobs cry waves of tears since forever!",
	"IdiotBox - Say goodbye to the respawn room!",
	"IdiotBox - Download the highest quality Garry's Mod cheat for free now!",
	"IdiotBox - A reliable way to go!",
	"IdiotBox - Visit our website for fresh Discord invite links!",
	"IdiotBox - Monthly bugfixes & updates. It never gets outdated!",
	"IdiotBox - Download IdiotBox v6.7.2 right now!",
	"IdiotBox - Bug-free and fully customizable!",
	"IdiotBox - Our Steam group is down, so join our Discord server to stay up-to-date!",
	"IdiotBox - Refund all your cheats, use this better and free alternative!",
	"IdiotBox - Now with more features than ever!",
	"IdiotBox - The best Garry's Mod cheat, with 24/7 support, for free!",
	"IdiotBox - Bypasses most anti-cheats and screen grabbers!",
}

local toxicadvertise = {
	"Get IdiotBox you fucking smelly niggers",
	"IdiotBox is the best fucking cheat and that is a fact",
	"All of you are fucking autistic for not having IdiotBox",
	"Why the fuck don't you get IdiotBox lol",
	"Stay being gay or get IdiotBox",
	"Your moms should know that you play grown-up games, join our Discord to prove you are not under-aged",
	"I have your IPs you dumb niggers, I will delete the IPs if you get IdiotBox",
	"You all fucking smell like shit for not using IdiotBox",
	"IdiotBox makes kiddos cry and piss their pants maybe and maybe shit and cum",
	"IdiotBox is the best free cheat in the history of the entire world so get it faggots",
	"Download IdiotBox at https://phizzofficial.wixsite.com/idiotbox4gmod/ or you're retarded",
	"Join our fucking Discord or else you are literally an unpriviledged niggers",
	"IdiotBox is a cheat for people with high IQ only, use IdiotBox to prove you're smart",
	"Don't wanna get fucking raped? Get IdiotBox and shit on them skids",
	"This is the best free paste around, no other paste is better than IdiotBox",
	"How the fuck are you not using IdiotBox in a shitty dying game lmfao",
	"IdiotBox is the best and most popular Garry's Mod cheat ever, why are you not using it lol",
	"May cause a bit of lag but it's worth it for the fuckton of features that it has",
	"You're all faggots if you don't cheat with IdiotBox",
	"You literally go to pride month parades if you don't use IdiotBox",
	"Idiotbox is the highest quality, most popular free cheat, just get it already",
	"Shit on all of the virgins that unironically play this game with this high-quality cheat",
	"Get good, get IdiotBox you fucking retards",
	"You're mad retarded if you are not using IdiotBox, no cap",
	"Own every single retard in HvH with this superior cheat now",
	"All of you are dumb niggers for not downloading IdiotBox and that is a fact",
	"You suck fat cocks in public bathrooms if you're not using IdiotBox",
	"Just get this god-like cheat already and rape all existing servers",
	"No you idiots, you can't get VAC banned for using lua scripts you absolute cretins",
	"IdiotBox bypasses even the most complex anti-cheats and screen grabbers, you're not getting banned anytime soon",
	"Just use IdiotBox to revert your sad lives and feel better about yourselves",
	"Phizz is a god because he made this god-like cheat called IdiotBox",
	"I am forced to put IdiotBox in almost every sentence and advertise in a toxic way because I'm a text in a lua script",
	"Why are you fucking gay? Get IdiotBox today",
	"The sentence above is a rhyme but the script says to put random sentences so I don't think you can see it, get IdiotBox btw",
	"Purchase IdiotBox now! Only for OH wait it's free",
	"It is highly recommended that you get IdiotBox in case of getting pwned",
	"You are swag and good looking, but only if you get IdiotBox",
	"Phizz spent so many fucking nights creating this masterpiece of a cheat so get it now or he will legit kill you",
	"Fuck you and get IdiotBox now lol",
	"IdiotBox is constantly getting updated with dope-ass features, it never gets outdated so just get it",
	"Have IdiotBox installed if you're mega straight and zero gay",
	"Whoever the fuck said lua cheats are bad deserves to die in a house fire",
	"You get IdiotBox, everyone else on the server gets pwned, ez as that",
	"Many cheats copied IdiotBox, but this is the original one, fucking copycats",
	"Join the fucking Discord, promise it won't hurt you faggots",
	"Download IdiotBox at https://phizzofficial.wixsite.com/idiotbox4gmod/ right this moment or I will hire a hitman to kill you",
	"Join the IdiotBox group at OH wait niggers got mad and mass-reported it, kys shitkids",
	"IdiotBox killed all of the paid cheats because it's too good",
	"Get IdiotBox, it's free and very good, you sacks of crying shit",
	"What the fuck are you doing not using this god-like cheat lol",
	"This is an epic fucking cheat called IdiotBox that was created by Phizz and others, worship your new gods kiddos",
	"You were fed cock milk as a baby if you're not using IdiotBox and you can not prove me wrong",
	"IdiotBox has the dopest anti-aims and resolvers you'll ever use, you will be a HvH god",
	"Just please get IdiotBox already you retards, I am tired of typing these lines for fuck's sake",
	"Phizz will give everyone IdiotBox v6.9 soon so quit your shit",
	"IdiotBox needs no Steam group, we're too chad for one",
	"Our Discord was tapped at some point but IdiotBox is back and stronger than ever",
	"IdiotBox came back to kill silly niggers, and it came back with a vengeance",
	"Download Idiotbox v6.7.2 now, you dont even know what you're missing you mongoloids",
	"Have I told you about IdiotBox, the best Garry's Mod cheat ever made??",
	"Holy shit, IdiotBox for Garry's Mod is the best cheat that I have ever used!!",
}

local lmaoboxadvertise = {
	"www.IDIOTBOX.net - https://phizzofficial.wixsite.com/idiotbox4gmod/",
	"www.IDIOTBOX.net - WHAT ARE YOU WAITING FOR?",
	"www.IDIOTBOX.net - BEST GARRY'S MOD CHEAT OUT RIGHT NOW!",
	"www.IDIOTBOX.net - SAY GOODBYE TO THE RESPAWN ROOM!",
	"www.IDIOTBOX.net - NO SKILL REQUIRED!",
	"www.IDIOTBOX.net - NEVER DIE AGAIN WITH THIS!",
	"www.IDIOTBOX.net - ONLY HIGH IQ NIGGAS' USE IDIOTBOX!",
	"www.IDIOTBOX.net - THE GAME IS NOT ACTUALLY DYING, I JUST LIKE TO ANNOY KIDS LOL!",
	"www.IDIOTBOX.net - DOWNLOAD THE CHEAT FOR FREE!",
	"www.IDIOTBOX.net - NOW WITH AUTOMATIC UPDATES!",
	"www.IDIOTBOX.net - GUARANTEED SWAG AND RESPECT ON EVERY SERVER!",
	"www.IDIOTBOX.net - IDIOTBOX COMING SOON TO TETIRS!",
	"www.IDIOTBOX.net - VISIT OUR WEBSITE FOR A FRESH INVITE LINK TO OUR DISCORD!",
	"www.IDIOTBOX.net - PHIZZ IS A GOD FOR MAKING THIS!",
	"www.IDIOTBOX.net - BECOME THE SERVER MVP IN NO TIME!",
	"www.IDIOTBOX.net - 100% NO SKILL REQUIRED!",
	"www.IDIOTBOX.net - WHY ARE YOU NOT CHEATING IN A DYING GAME?",
	"www.IDIOTBOX.net - RUINING EVERYONES' FUN SINCE 2016!",
	"www.IDIOTBOX.net - IT'S PASTED, BUT IT'S THE BEST PASTE YOU WILL EVER USE!",
	"www.IDIOTBOX.net - A VERY CLEAN, HIGH-QUALITY AND BUG-FREE PASTE!",
	"www.IDIOTBOX.net - ALWAYS UPDATED! NEVER GETS OUTDATED!",
	"www.IDIOTBOX.net - WITH A FUCK TON OF NEW FEATURES!",
	"www.IDIOTBOX.net - STEAM GROUP WAS TAKEN DOWN, BUT WHO THE FUCK CARES?",
	"www.IDIOTBOX.net - BEST GARRY'S MOD CHEAT, NO CAP!",
	"www.IDIOTBOX.net - WITH IDIOTBOX, YOU'LL NEVER GET BANNED FOR CHEATING AGAIN!",
}

local horstwessellied = {
	"Die Fahne hoch! Die Reihen fest geschlossen",
	"SA marschiert mit ruhig festem Schritt",
	"Kam'raden, die Rotfront und Reaktion erschossen",
	"Marschier'n im Geist in unser'n Reihen mit",
	"Die Straße frei den braunen Bataillonen",
	"Die Straße frei dem Sturmabteilungsmann",
	"Es schau'n aufs Hakenkreuz voll Hoffnung schon Millionen",
	"Der Tag für Freiheit und für Brot bricht an",
	"Zum letzten Mal wird Sturmalarm geblasen",
	"Zum Kampfe steh'n wir alle schon bereit",
	"Schon flattern Hitlerfahnen über allen Straßen",
	"Die Knechtschaft dauert nur noch kurze Zeit",
	"Die Fahne hoch! Die Reihen fest geschlossen",
	"SA marschiert mit ruhig festem Schritt",
	"Kam'raden, die Rotfront und Reaktion erschossen",
	"Marschier'n im Geist in unser'n Reihen mit",
}

local ssmarschiertinfeindesland = {
	"SS marschiert in Feindesland",
	"Und singt ein Teufelslied",
	"Ein Schütze steht am Wolgastrand",
	"Und leise summt er mit",
	"Wir pfeifen auf Unten und Oben",
	"Und uns kann die ganze Welt",
	"Verfluchen oder auch loben",
	"Grad wie es jedem gefällt",
	"Wo wir sind da geht's immer vorwärts",
	"Und der Teufel, der lacht nur dazu",
	"Ha, ha, ha, ha, ha, ha",
	"Wir kämpfen für Deutschland",
	"Wir kämpfen für Hitler",
	"Der Rote kommt niemehr zur Ruh'",
	"Wir kämpften schon in mancher Schlacht",
	"In Nord, Süd, Ost und West",
	"Und stehen nun zum Kampf bereit",
	"Gegen die rote Pest",
	"SS wird nicht ruh'n, wir vernichten",
	"Bis niemand mehr stört Deutschlands Glück",
	"Und wenn sich die Reihen auch lichten",
	"Für uns gibt es nie ein Zurück",
	"Wo wir sind da geht's immer vorwärts",
	"Und der Teufel, der lacht nur dazu",
	"Ha, ha, ha, ha, ha, ha",
	"Wir kämpfen für Deutschland",
	"Wir kämpfen für Hitler",
	"Der Rote kommt niemehr zur Ruh'",
}

local siegheilviktoria = {
	"Ade, mein liebes Schätzelein",
	"Ade, ade, ade",
	"Es muß, es muß geschieden sein",
	"Ade, ade, ade",
	"Es geht um Deutschlands Gloria",
	"Gloria, Gloria",
	"Sieg Heil! Sieg Heil Viktoria!",
	"Sieg Heil, Viktoria!",
	"Visier und Ziel sind eingestellt",
	"Ade, ade, ade",
	"Auf Stalin, Churchill, Roosevelt",
	"Ade, ade, ade",
	"Es geht um Deutschlands Gloria",
	"Gloria, Gloria",
	"Sieg Heil! Sieg Heil Viktoria!",
	"Sieg Heil, Viktoria!",
	"Wir ruhen und wir rasten nicht",
	"Ade, ade, ade",
	"Bis daß die Satansbrut zerbricht",
	"Ade, ade, ade",
	"Es geht um Deutschlands Gloria",
	"Gloria, Gloria",
	"Sieg Heil! Sieg Heil Viktoria!",
	"Sieg Heil, Viktoria!",
	"Reich mir die Hand zum Scheidegruß",
	"Ade, ade, ade",
	"Und deinen Mund zum Abschiedskuß",
	"Ade, ade, ade",
	"Es geht um Deutschlands Gloria",
	"Gloria, Gloria",
	"Sieg Heil! Sieg Heil Viktoria!",
	"Sieg Heil, Viktoria!",
}

	if(gOption("More", "Chat", "Chat Spam:") == "Nazi 1") then
		RunConsoleCommand("say", horstwessellied[math.random(#horstwessellied)])
	end
	if(gOption("More", "Chat", "Chat Spam:") == "Nazi 2") then
		RunConsoleCommand("say", ssmarschiertinfeindesland[math.random(#ssmarschiertinfeindesland)])
	end
	if(gOption("More", "Chat", "Chat Spam:") == "Nazi 3") then
		RunConsoleCommand("say", siegheilviktoria[math.random(#siegheilviktoria)])
	end
	if(gOption("More", "Chat", "Chat Spam:") == "Advertising 1") then
		RunConsoleCommand("say", advertise[math.random(#advertise)])
	end
	if(gOption("More", "Chat", "Chat Spam:") == "Advertising 2") then
		RunConsoleCommand("say", lmaoboxadvertise[math.random(#lmaoboxadvertise)])
	end
	if(gOption("More", "Chat", "Chat Spam:") == "Advertising 3") then
        RunConsoleCommand("say", toxicadvertise[math.random(#toxicadvertise)])
    end
	if(gOption("More", "Chat", "Chat Spam:") == "Hebrew Spam") then
        RunConsoleCommand("say", HebrewFunni[math.random(#HebrewFunni)])
    end 
	if(gOption("More", "Chat", "Chat Spam:") == "Arabic Spam") then
        RunConsoleCommand("say", ArabFunni[math.random(#ArabFunni)])
    end 
	if(gOption("More", "Chat", "Chat Spam:") == "'H' Spam") then
		RunConsoleCommand("say", "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH")
	end
	if(gOption("More", "Chat", "Chat Spam:") == "N-Word Spam") then
		RunConsoleCommand("say", "nigger")
	end
	if(gOption("More", "Chat", "Chat Spam:") == "N-WORD SPAM") then
		RunConsoleCommand("say", "NIGGER")
	end
	if(gOption("More", "Chat", "Chat Spam:") == "Clear Chat") then
		ChatClear.Run()
	end
	if(gOption("More", "Chat", "Chat Spam:") == "OOC Clear Chat") then
		ChatClear.OOC()
	end
	if(gOption("More", "Chat", "Chat Spam:") == "Offensive Spam") then
		RunConsoleCommand("say", offensivespam[math.random(#offensivespam)])
	end
	if(gOption("More", "Chat", "Chat Spam:") == "Insult Spam") then
	local randply = player.GetAll()[math.random(#player.GetAll())]
	local friendstatus = pm.GetFriendStatus(randply)
	if (!randply:IsValid() || randply == me || (friendstatus == "friend") || table.HasValue(ignore_list, randply:UniqueID())) then return end
		RunConsoleCommand("say", randply:Name()..insultspam[math.random(#insultspam)])
	end
	if(gOption("More", "Chat", "Chat Spam:") == "Drop Money") then
		RunConsoleCommand("say", "/dropmoney "..math.random(2, 10))
	end
	if(gOption("More", "Chat", "Chat Spam:") == "ULX Message Spam") then
		local v = player.GetAll()[math.random(#player.GetAll())]
		if (v != me && v:GetFriendStatus() != "friend" && !pm.IsAdmin(v) && !table.HasValue(ignore_list, v:UniqueID())) then
			LocalPlayer():ConCommand("ulx psay \"".. v:Nick() .."\" "..messagespam[math.random(#messagespam)])
		end
	end
end

local function ChangeLog()
	print("===========================================================\n\n")
	print("IdiotBox v6.7/ v6.7.1/ v6.7.2 bugfixes (in no particular order)")
	print("")
	print("Total bugfix count: ~50 bugs have been found and fixed in the v6.7/ v6.7.1/ v6.7.2 updates;")
	print("\n")
	print("- The 'readme.txt' file is finally up-to-date and only contains the important information;")
	print("- Aim Smoothness will automatically disable itself if the Legitbot Silent aim is turned on;")
	print("- Anti-Aim cannot be used with the Legitbot if Silent is turned on to prevent bad angle calculations;")
	print("- Cheat menu/ game menus will no longer be covered by Visuals/ windows/ lists and others;")
	print("- Chams and Playermodel Chams cannot be used at the same time anymore;")
	print("- Reply Spam and Copy Messages cannot be used at the same time anymore to prevent weird function collisions;")
	print("- Show Entities, Traitor Finder and Murderer Finder can only be used if Visuals is turned on;")
	print("- Circle Strafe and Auto-Strafe cannot be used at the same time anymore to prevent weird function collisions;")
	print("- Mirror cannot be used with Visuals to prevent weird rendering;")
	print("- Added missing space between the Custom Status rank and username;")
	print("- Fixed developers getting the notification that a developer is on the server;")
	print("- Fixed dimension of the Armor Bar not matching the dimension of the Health Bar;")
	print("- Fixed menu loading twice when opened with the 'ib_openmenu' command and closed by pressing 'Insert', 'Home' or 'F11';")
	print("- Fixed Bunny Hop and Circle Strafe breaking the movement when in water;")
	print("- Fixed Entities not using the correct Visuals color;")
	print("- Fixed Save/ Load/ Unload/ Close Menu buttons spamming the 'click' sound when holding them down;")
	print("- Fixed Reply Spam and Copy Messages not ignoring friends;")
	print("- Fixed being unable to rotate props or fly planes;")
	print("- Fixed Kill Spam giving script errors when an NPC was killed;")
	print("- Fixed Chat Spam and Kill Spam still using the old IdiotBox Alpha variables;")
	print("- Fixed 3D Box and Hitbox still showing spectators or dead people or still showing people with Distance Limit or Show Enemies Only enabled;")
	print("- Fixed Bunny Hop and Circle Strafe breaking Free Camera;")
	print("- Fixed Hitbox spamming the console with error messages;")
	print("- Fixed Snap Lines still showing when Aimbot is not enabled;")
	print("- Fixed toggle keys activating when browsing game menus/ browsing cheat menu/ typing;")
	print("- Fixed menu Darkness not working when opening the menu with the console command;")
	print("- Fixed Hide Round Report and Panel Remover not working correctly;")
	print("- Fixed poorly placed checkboxes/ sliders/ selections;")
	print("- Fixed Anti-Ads not working correctly;")
	print("- Fixed Thirdperson showing in spectator mode;")
	print("- Fixed skybox changing upon loading;")
	print("- Fixed Anti-Aim breaking the Radar view angles;")
	print("- Fixed Free Camera not working with Anti-Aim;")
	print("- Fixed Fire Delay not working correctly;")
	print("- Fixed TTT: Prop Kill giving script errors when toggled;")
	print("- Fixed Anti-Aim X-Axis Jitter, Semi-Jitter Down and Semi-Jitter Up breaking the Anti-Aim Y-Axis;")
	print("- Fixed Triggerbot Smooth Aim slowing your mouse speed;")
	print("- Fixed the anti-screen grab function not working correctly;")
	print("- Fixed certain outlines and fonts not having their proper dimensions;")
	print("- Fixed the Save/ Load/ Unload/ Close Menu buttons not having the correct color when hovering your mouse over them;")
	print("- Fixed the menu not being large enough for certain outlines;")
	print("- Fixed various Free Camera bugs that allowed it to move when certain features were enabled;")
	print("- Fixed No Lerp and Dark Mode not resetting when disabled;")
	print("- Fixed a few minor Aim Options bugs from both Aimbot and Triggerbot;")
	print("- Reorganized certain out-of-place functions and menu options;")
	print("- Rearranged menu options so that they no longer look messy;")
	print("- Renamed certain misspelled or broken functions and menu options;")
	print("- Removed local variables that had no use;")
	print("- Removed unusable DarkRP names from the Name Changer;")
	print("- Removed cloned hooks and combined them all into one for better performance;")
	print("- Removed old broken 'file.Read' blocker that had no use;")
	print("- Removed old and unused Fake Lag functions;")
	print("- Removed 'aaa' module as 'IdiotBox_alpha1.lua' was replaced by 'IdiotBox_dev.lua' and had no use.")
	print("\n")
	print("IdiotBox v6.7/ v6.7.1/ v6.7.2 mini-features (in no particular order)")
	print("")
	print("Total mini-features count: ~20 mini-features have been added in the v6.7/ v6.7.1/ v6.7.2 updates;")
	print("\n")
	print("- Added 'Free Camera-Key' to Free Camera;")
	print("- Added 'Screen Grab Notifications' to More;")
	print("- Added 'G' and 'B' key to Aim-Key, Trigger-Key and Switch-Key;")
	print("- Added 'Disconnect Spam', 'lol', 'lmao', 'shit' and 'fuck' to Reply Spam;")
	print("- Added 'Arabic Spam' and 'Hebrew Spam' to Chat Spam;")
	print("- Added 'Fake Crouch' to Movement;")
	print("- Added 'Enable Spams' to Chat;")
	print("- Added 'Random' to Emotes;")
	print("- Added 'Murder Taunts' to More;")
	print("- Added 'Velocity' to Visuals;")
	print("- Added 'Bystander Name' to Visuals;")
	print("- Added 'NPCs' to Visuals;")
	print("- Added 'Show FoV Circle' to More;")
	print("- Added 'Hack vs. Hack' tab;")
	print("- Reworked 'Resolver' from Hack vs. Hack;")
	print("- Reworked 'Radar', 'Spectators' and 'Status' from Visuals;")
	print("- Removed 'Shoutout' from Chat Spam;")
	print("- Changed the default menu colors, menu size and others.")
	print("\n\n===========================================================")
end

concommand.Add("ib_changelog", ChangeLog)

concommand.Add("ib_openmenu", function()
	menuopen = true
	menukeydown = true
	Menu()
end)

CreateClientConVar("ib_changename", "www.IDIOTBOX.net | Get tapped!", true, false)

local namechangeTime = 0

local randomemote = {
	"dance", 
	"muscle", 
	"wave", 
	"robot", 
	"bow", 
	"cheer", 
	"laugh", 
	"zombie", 
	"agree", 
	"disagree", 
	"forward", 
	"becon", 
	"salute", 
	"pose", 
	"halt", 
	"group", 
}

local function Filter(v)
	if(gBool("Visuals", "More", "Distance Limit")) then
		local dist = gBool("Visuals", "More", "Distance:")
			if(vm.Distance(em.GetPos(v), em.GetPos(me)) > (dist * 5)) then return false end
		end
	return true
end

local function EnemyFilter(v)
	local friendstatus = pm.GetFriendStatus(v)
	if friendstatus == "friend" then return true end
	local enemy = gBool("Visuals", "More", "Show Enemies Only")
	if(enemy) then
		if(pm.Team(v) == pm.Team(me)) then return false end
	end
	return true
end

local function GetChamsColor(v)
    if(pm.Team(v) == pm.Team(me)) then
		local r = gInt("Settings", "Team Chams Color", "Red:")
		local g = gInt("Settings", "Team Chams Color", "Green:")
		local b = gInt("Settings", "Team Chams Color", "Blue:")
		return(Color(r, g, b, 220))
    end
		local r = gInt("Settings", "Enemy Chams Color", "Red:")
		local g = gInt("Settings", "Enemy Chams Color", "Green:")
		local b = gInt("Settings", "Enemy Chams Color", "Blue:")
    return(Color(r, g, b, 220))
end

local chamsmat = CreateMaterial("a", "VertexLitGeneric", {
	["$ignorez"] = 1, 
	["$model"] = 1, 
	["$basetexture"] = "models/debug/debugwhite", 
})

local chamsmat2 = CreateMaterial("@", "VertexLitGeneric", {
	["$ignorez"] = 0, 
	["$model"] = 1, 
	["$basetexture"] = "models/debug/debugwhite", 
})

local function Chams(v)
	if(gBool("Visuals", "Wallhack", "Playermodel Chams") && !gBool("Visuals", "Wallhack", "Chams")) then
	cam.Start3D()
		cam.IgnoreZ(true)
		em.DrawModel(v)
		cam.IgnoreZ(false)
	cam.End3D()
end
	
if(gBool("Visuals", "Wallhack", "Chams")) then
local col = gBool("Visuals", "More", "Team Colors") && team.GetColor(pm.Team(v)) || GetChamsColor(v)
	local wep = v:GetActiveWeapon()
	if wep:IsValid() then
	cam.Start3D()
	render.MaterialOverride(chamsmat)
	render.SetColorModulation(col.r/255, col.g/255, col.b/255, 255)
	em.DrawModel(wep)
	render.SetColorModulation(col.r/170, col.g/170, col.b/170, 255)
	render.MaterialOverride(chamsmat2)
	em.DrawModel(wep)
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
            if(!gBool("More", "Textures", "Transparent Walls")) then
                im.SetFloat(material, "$alpha", 1)
			continue
        end
        im.SetFloat(material, "$alpha", 0.75)
    end
end

local function AimKeyCheck()
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "None") then
		return true
	end
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "Mouse 3") then
		if input.IsMouseDown(109) then return true end
	end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "Mouse 4") then
		if input.IsMouseDown(110) then return true end
	end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "Mouse 5") then
		if input.IsMouseDown(111) then return true end
	end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "Mouse 6") then
		if input.IsMouseDown(112) then return true end
	end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "Left 'ALT' Key") then
		if input.IsKeyDown(KEY_LALT) then return true end
	end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "The 'E' Key") then
		if input.IsKeyDown(15) then return true end
	end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "The 'F' Key") then
		if input.IsKeyDown(KEY_F) then return true end
	end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "The 'G' Key") then
		if input.IsKeyDown(KEY_G) then return true end
	end
	if(gBool("Aimbot", "Ragebot", "Aim-Key:") == "The 'B' Key") then
		if input.IsKeyDown(KEY_B) then return true end
	end
end

local function AimKeyCheck2()
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "None") then
		return true
	end
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "Mouse 3") then
		if input.IsMouseDown(109) then return true end
	end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "Mouse 4") then
		if input.IsMouseDown(110) then return true end
	end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "Mouse 5") then
		if input.IsMouseDown(111) then return true end
	end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "Mouse 6") then
		if input.IsMouseDown(112) then return true end
	end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "Left 'ALT' Key") then
		if input.IsKeyDown(KEY_LALT) then return true end
	end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "The 'E' Key") then
		if input.IsKeyDown(15) then return true end
	end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "The 'F' Key") then
		if input.IsKeyDown(KEY_F) then return true end
	end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "The 'G' Key") then
		if input.IsKeyDown(KEY_G) then return true end
	end
	if(gBool("Aimbot", "Legitbot", "Aim-Key:") == "The 'B' Key") then
		if input.IsKeyDown(KEY_B) then return true end
	end
end

local function TriggerKeyCheck()
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "None") then
		return true
	end
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "Mouse 3") then
		if input.IsMouseDown(109) then return true end
	end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "Mouse 4") then
		if input.IsMouseDown(110) then return true end
	end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "Mouse 5") then
		if input.IsMouseDown(111) then return true end
	end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "Mouse 6") then
		if input.IsMouseDown(112) then return true end
	end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "Left 'ALT' Key") then
		if input.IsKeyDown(KEY_LALT) then return true end
	end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "The 'E' Key") then
		if input.IsKeyDown(15) then return true end
	end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "The 'F' Key") then
		if input.IsKeyDown(KEY_F) then return true end
	end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "The 'G' Key") then
		if input.IsKeyDown(KEY_G) then return true end
	end
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "The 'B' Key") then
		if input.IsKeyDown(KEY_B) then return true end
	end
end

local function PropKeyCheck()
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if not me:GetActiveWeapon():IsValid() or me:GetActiveWeapon():GetClass() ~= "weapon_zm_carry" then return false end
	if(gBool("Utilities", "Utilities", "TTT: Prop Kill-Key:") == "Mouse 3") then
		if input.IsMouseDown(109) then return true end
	end
	if(gBool("Utilities", "Utilities", "TTT: Prop Kill-Key:") == "Mouse 4") then
		if input.IsMouseDown(110) then return true end
	end
	if(gBool("Utilities", "Utilities", "TTT: Prop Kill-Key:") == "Mouse 5") then
		if input.IsMouseDown(111) then return true end
	end
	if(gBool("Utilities", "Utilities", "TTT: Prop Kill-Key:") == "Mouse 6") then
		if input.IsMouseDown(112) then return true end
	end
	if(gBool("Utilities", "Utilities", "TTT: Prop Kill-Key:") == "Left 'ALT' Key") then
		if input.IsKeyDown(KEY_LALT) then return true end
	end
	if(gBool("Utilities", "Utilities", "TTT: Prop Kill-Key:") == "The 'E' Key") then
		if input.IsKeyDown(15) then return true end
	end
	if(gBool("Utilities", "Utilities", "TTT: Prop Kill-Key:") == "The 'F' Key") then
		if input.IsKeyDown(KEY_F) then return true end
	end
	if(gBool("Utilities", "Utilities", "TTT: Prop Kill-Key:") == "The 'G' Key") then
		if input.IsKeyDown(KEY_G) then return true end
	end
	if(gBool("Utilities", "Utilities", "TTT: Prop Kill-Key:") == "The 'B' Key") then
		if input.IsKeyDown(KEY_B) then return true end
	end
end

local function CamKeyCheck()
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if(gBool("Visuals", "More", "Free Camera-Key:") == "Mouse 3") then
		if input.IsMouseDown(109) then return true end
	end
	if(gBool("Visuals", "More", "Free Camera-Key:") == "Mouse 4") then
		if input.IsMouseDown(110) then return true end
	end
	if(gBool("Visuals", "More", "Free Camera-Key:") == "Mouse 5") then
		if input.IsMouseDown(111) then return true end
	end
	if(gBool("Visuals", "More", "Free Camera-Key:") == "Mouse 6") then
		if input.IsMouseDown(112) then return true end
	end
	if(gBool("Visuals", "More", "Free Camera-Key:") == "Left 'ALT' Key") then
		if input.IsKeyDown(KEY_LALT) then return true end
	end
	if(gBool("Visuals", "More", "Free Camera-Key:") == "The 'E' Key") then
		if input.IsKeyDown(15) then return true end
	end
	if(gBool("Visuals", "More", "Free Camera-Key:") == "The 'F' Key") then
		if input.IsKeyDown(KEY_F) then return true end
	end
	if(gBool("Visuals", "More", "Free Camera-Key:") == "The 'G' Key") then
		if input.IsKeyDown(KEY_G) then return true end
	end
	if(gBool("Visuals", "More", "Free Camera-Key:") == "The 'B' Key") then
		if input.IsKeyDown(KEY_B) then return true end
	end
end

local function SwitchKeyCheck()
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Switch-Key:") == "Mouse 3") then
		if input.IsMouseDown(109) then return true end
	end
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Switch-Key:") == "Mouse 4") then
		if input.IsMouseDown(110) then return true end
	end
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Switch-Key:") == "Mouse 5") then
		if input.IsMouseDown(111) then return true end
	end
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Switch-Key:") == "Mouse 6") then
		if input.IsMouseDown(112) then return true end
	end
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Switch-Key:") == "Left 'ALT' Key") then
		if input.IsKeyDown(KEY_LALT) then return true end
	end
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Switch-Key:") == "The 'E' Key") then
		if input.IsKeyDown(15) then return true end
	end
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Switch-Key:") == "The 'F' Key") then
		if input.IsKeyDown(KEY_F) then return true end
	end
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Switch-Key:") == "The 'G' Key") then
		if input.IsKeyDown(KEY_G) then return true end
	end
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Switch-Key:") == "The 'B' Key") then
		if input.IsKeyDown(KEY_B) then return true end
	end
end

local FreeCam, FreeCam2
	
function idiot.FreeCamSetup()
	if not (gBool("Visuals", "More", "Free Camera")) then return end
	if not (gBool("More", "Custom FoV", "Enabled")) then return end
	if gBool("More", "More", "Thirdperson") then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if (CamKeyCheck()) then
		if not FreeCam then
			FreeCam = true
			FreeCam2 = not FreeCam2
			if FreeCam2 and not CamPos then
				CamPos = ply:GetShootPos()
			end
			if FreeCam2 then
				CamAng = ply:EyeAngles()
			end
		end
	else
		FreeCam = false
	end
end

function idiot.FreeCamMove(pCmd)
	if not (gBool("Visuals", "More", "Free Camera")) then return end
	if not (gBool("More", "Custom FoV", "Enabled")) then return end
	if gBool("More", "More", "Thirdperson") then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if FreeCam then
		local ang = ply:EyeAngles()
		CamPos = CamPos + (ang:Forward() * pCmd:GetForwardMove() / 10000 + ang:Right() * pCmd:GetSideMove() / 10000 + ang:Up() * pCmd:GetUpMove() / 10000) * (pCmd:KeyDown(IN_SPEED) and 10 or 3)
		if (pCmd:KeyDown(IN_RELOAD)) then
			CamPos = ply:GetShootPos()
			CamAng = ply:EyeAngles()
		end
		pCmd:SetButtons(0)
		pCmd:SetForwardMove(0)
		pCmd:SetSideMove(0)
		pCmd:SetUpMove(0)
	end
end

local function BunnyHop(pCmd)
	if(not gBool("More", "Movement", "Bunny Hop") or em.GetMoveType(me) == MOVETYPE_NOCLIP or LocalPlayer():IsFlagSet(1024) or me:Team() == TEAM_SPECTATOR or me:Health() < 1 or not me:Alive() or gBool("More", "Custom FoV", "Enabled") && gBool("Visuals", "More", "Free Camera") && CamKeyCheck() && !gBool("More", "More", "Thirdperson")) then return end
	if(!me:IsOnGround() && pCmd:KeyDown(IN_JUMP)) then
		pCmd:RemoveKey(IN_JUMP)
		if(gBool("More", "Movement", "Auto Strafe")) then
			if(pCmd:GetMouseX() > 1 || pCmd:GetMouseX() < - 1) then
				pCmd:SetSideMove(pCmd:GetMouseX() > 1 && 10000 || - 10000)
			else
				pCmd:SetForwardMove(10000 / me:GetVelocity():Length2D())
				pCmd:SetSideMove((pCmd:CommandNumber() % 2 == 0) && - 10000 || 10000)
			end
		end
	elseif(pCmd:KeyDown(IN_JUMP) && gBool("More", "Movement", "Auto Strafe")) then
		pCmd:SetForwardMove(10000)
	end
end

function idiot.AirCrouch(pCmd)
	if em.GetMoveType(me) == MOVETYPE_NOCLIP then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if LocalPlayer():IsFlagSet(1024) then return end
	if gBool("More", "Custom FoV", "Enabled") && gBool("Visuals", "More", "Free Camera") && CamKeyCheck() && !gBool("More", "More", "Thirdperson") then return end
	if(gBool("More", "Movement", "Air Crouch")) then
	local pos = ply:GetPos()
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

function idiot.TraitorDetector()
	if (idiot.engine.ActiveGamemode() ~= "terrortown") then return end
	if(gBool("Visuals", "More", "Traitor Finder")) then
	for k, v in idiot.ipairs(idiot.ents.GetAll()) do
		local _v = v:GetOwner()
		if (_v == ply) then continue end
		if (idiot.GetRoundState() == 3 and v:IsWeapon() and _v:IsPlayer() and not _v.Detected and idiot.table.HasValue(v.CanBuy, 1)) then
			if (_v:GetRole() ~= 2) then
				_v.Detected = true
				MsgY(4.3, _v:Nick().. " is a Traitor. He just bought: " ..v:GetPrintName())
				surface.PlaySound("npc/scanner/combat_scan1.wav")
			end
		elseif (idiot.GetRoundState() ~= 3) then
				v.Detected = false
			end
		end
	end
end

function idiot.MurdererDetector()
	if not (gBool("Visuals", "More", "Murderer Finder")) then return end
	if (idiot.engine.ActiveGamemode() ~= "murder") then return end
	for k, v in idiot.ipairs(idiot.player.GetAll()) do
		if (v == ply) then continue end
		if (GAMEMODE.RoundStage == 1 and not v.Detected and not v.Magnum) then
			if (v:HasWeapon("weapon_mu_knife")) then
				v.Detected = true
				MsgY(4.3, (v:Nick() .. " (" .. v:GetNWString("bystanderName") .. ") is the murderer."))
				surface.PlaySound("buttons/lightswitch2.wav")
			end
			if (v:HasWeapon("weapon_mu_magnum")) then
				v.Magnum = true
				timer.Create("ChatPrint", 4.8, 1, function() MsgY (4.3, (v:Nick() .. " (" .. v:GetNWString("bystanderName") .. ") has a magnum.")) end)
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

local function Think()
	if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menuopen and not menukeydown) then
		menuopen = true
		menukeydown = true
		Menu()
	elseif (not (input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menuopen) then
		menukeydown = false
	end
	if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and menukeydown and menuopen) then
		menukeydown2 = true
	else
		menukeydown2 = false
	end
	if (gBool("More", "Chat", "Enable Spams") && gOption("More", "Chat", "Chat Spam:") ~= "Off") then
		ChatSpam()
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Dance") then
		RunConsoleCommand("act", "dance")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Sexy") then
		RunConsoleCommand("act", "muscle")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Wave") then
		RunConsoleCommand("act", "wave")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Robot") then
		RunConsoleCommand("act", "robot")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Bow") then
		RunConsoleCommand("act", "bow")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Cheer") then
		RunConsoleCommand("act", "cheer")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Laugh") then
		RunConsoleCommand("act", "laugh")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Zombie") then
		RunConsoleCommand("act", "zombie")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Agree") then
		RunConsoleCommand("act", "agree")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Disagree") then
		RunConsoleCommand("act", "disagree")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Forward") then
		RunConsoleCommand("act", "forward")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Back") then
		RunConsoleCommand("act", "becon")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Salute") then
		RunConsoleCommand("act", "salute")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Pose") then
		RunConsoleCommand("act", "pers")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Halt") then
		RunConsoleCommand("act", "halt")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Group") then
		RunConsoleCommand("act", "group")
	end
	if(gBool("More", "More", "Emotes") && gOption("More", "More", "Emote Type:") == "Random") then
		RunConsoleCommand("act", randomemote[math.random(#randomemote)])
	end
	if(gBool("More", "More", "Flashlight Spam")) then
		RunConsoleCommand("impulse", "100")
	end
	if(gBool("More", "More", "Name Stealer") && gOption("More", "More", "Steal Type:") == "Normal") then
	local randply = player.GetAll()[math.random(#player.GetAll())]
	local friendstatus = pm.GetFriendStatus(randply)
	hook.Remove("Think", "Hook6")
	hook.Add("Think", "Hook5", function()
		if (!randply:IsValid() || randply == me || friendstatus == "friend" || table.HasValue(ignore_list, randply:UniqueID())) then return end
		IdiotBox.ChangeName(randply:Name().." ")
	end)
	elseif(!gBool("More", "More", "Name Stealer") && gOption("More", "More", "Steal Type:") == "DarkRP Name") then
	hook.Remove("Think", "Hook5")
	hook.Add("Think", "Hook6", function()
		IdiotBox.ChangeName(myName)
		end)
	end
	if(gBool("More", "More", "Name Stealer") && gOption("More", "More", "Steal Type:") == "DarkRP Name") then
		namechangeTime = namechangeTime + 1
		if namechangeTime > 500 then
		RunConsoleCommand("say", "/name "..randomname[math.random(#randomname)])
		namechangeTime = 0
		end
	end
	if(gBool("Utilities", "IdiotBox Console Commands", "Apply custom name")) then
		hook.Add("Think", "Hook7", function()
		IdiotBox.ChangeName(GetConVarString("ib_changename"))
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

local tauntspam = {
	"funny", 
	"help", 
	"scream", 
	"morose", 
}

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
	idiot.PlayerCheck()
	idiot.TraitorDetector()
	idiot.MurdererDetector()
	idiot.FreeCamSetup()
	TransparentWalls()
	Think()
	if gBool("Utilities", "Utilities", "Optimize Game") then
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
	if gBool("Aimbot", "More (Ragebot & Legitbot)", "No Lerp") then
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
	if gBool("Utilities", "Utilities", "TTT: Hide Round Report") and idiot.engine.ActiveGamemode() == "terrortown" then
			if not displayed then
				function CLSCORE:ShowPanel() return end
			displayed = true
		end
	end
	if gBool("Utilities", "Utilities", "TTT: Panel Remover") and idiot.engine.ActiveGamemode() == "terrortown" then
		local pan = vgui.GetHoveredPanel()
		CheckChild(pan)
	end
	if gBool("Utilities", "Utilities", "Murder: Hide End Round Board") and idiot.engine.ActiveGamemode() == "murder" then
		if not displayed then
			function GAMEMODE:DisplayEndRoundBoard(data) return end
			displayed = true
		end
	end
	if gBool("Utilities", "Utilities", "Murder: Hide Footprints") and idiot.engine.ActiveGamemode() == "murder" then
		if not footprints then
			function GAMEMODE:DrawFootprints() return end
			footprints = true
		end
	end
	if gBool("Utilities", "Utilities", "Murder: No Black Screens") and idiot.engine.ActiveGamemode() == "murder" then
		if not blackscreen then
			function GAMEMODE:RenderScreenspaceEffects() return end
			function GAMEMODE:PostDrawHUD() return end
			blackscreen = true
		end
	end
	if gBool("More", "More", "Murder Taunts") and idiot.engine.ActiveGamemode() == "murder" and me:Alive() and me:Health() > 0 then
		if gOption("More", "More", "Taunt Type:") == "Funny" then
			RunConsoleCommand("mu_taunt", "funny")
		end
		if gOption("More", "More", "Taunt Type:") == "Help" then
			RunConsoleCommand("mu_taunt", "help")
		end
		if gOption("More", "More", "Taunt Type:") == "Scream" then
			RunConsoleCommand("mu_taunt", "scream")
		end
		if gOption("More", "More", "Taunt Type:") == "Morose" then
			RunConsoleCommand("mu_taunt", "morose")
		end
		if gOption("More", "More", "Taunt Type:") == "Random" then
			RunConsoleCommand("mu_taunt", tauntspam[math.random(#tauntspam)])
		end
	end
	if gBool("Utilities", "Utilities", "DarkRP: Suicide Near Arrest Batons") and idiot.engine.ActiveGamemode() == "darkrp" and me:Alive() and me:Health() > 0 then
		for k, v in next, player.GetAll() do
			if not v:IsValid() or v:Health() < 1 or v:IsDormant() or v == me then continue end
			if gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Friends") and v:GetFriendStatus() == "friend" then continue end
			if v:GetPos():Distance(me:GetPos()) < 95 and v:GetActiveWeapon():GetClass() == "arrest_stick" and me:GetPos():Distance(v:GetEyeTrace().HitPos) < 105 then
				me:ConCommand("kill")
			end
		end
	end
	if gBool("Utilities", "Utilities", "DarkRP: Transparent Props") and idiot.engine.ActiveGamemode() == "darkrp" then
		for k, v in next, ents.FindByClass("prop_physics") do
			v:SetRenderMode(RENDERMODE_TRANSCOLOR)
			v:SetKeyValue("renderfx", 0)
			v:SetColor(Color(255, 255, 255, gInt("Utilities", "Utilities", "DarkRP: Transparency:")))
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
	if(gBool("Utilities", "Utilities", "Anti-Blind")) then
		if (HookExist("HUDPaint", "ulx_blind")) then
			MsgR(4.3, "IdiotBox successfully blocked a blindnig attempt.")
			surface.PlaySound("buttons/lightswitch2.wav")
        hook.Remove("HUDPaint", "ulx_blind")
        end
    end
	if MOTDgd or MOTDGD then
		function MOTDgd.GetIfSkip()
		if(gBool("Utilities", "Utilities", "Anti-Ads")) then
			MsgR(4.3, "IdiotBox successfully blocked an advertisement.")
			surface.PlaySound("buttons/lightswitch2.wav")
			return true
			end
		end
	end
end)

hook.Add("PreDrawSkyBox", "Hook9", function()
	if (!gBool("More", "Textures", "No Sky")) then return end
		render.Clear(0, 0, 0, 255)
	return true
end)

hook.Add("PreDrawViewModel", "Hook10", function()
	if(gBool("More", "More", "Thirdperson")) then return end
	local WepMat1 = Material("models/wireframe")
	if (gBool("More", "Viewmodel", "Viewmodel Wireframe")) then
	render.MaterialOverride(WepMat1)
	render.SetColorModulation(gInt("Settings", "Viewmodel Color", "Red:") /255, gInt("Settings", "Viewmodel Color", "Green:") /255, gInt("Settings", "Viewmodel Color", "Blue:") / 255)
	end
	local WepMat2 = Material("models/debug/debugwhite")
	if (gBool("More", "Viewmodel", "Viewmodel Chams")) then
	render.MaterialOverride(WepMat2)
	render.SetColorModulation(gInt("Settings", "Viewmodel Color", "Red:") /255, gInt("Settings", "Viewmodel Color", "Green:") /255, gInt("Settings", "Viewmodel Color", "Blue:") / 255)
	end
	if(gBool("More", "Viewmodel", "No Viewmodel") or gBool("More", "More", "Thirdperson")) then
	return true
	else
	return false
	end
end)

hook.Add("PreDrawPlayerHands", "Hook11", function()
	if(gBool("More", "Viewmodel", "No Hands") or gBool("More", "More", "Thirdperson")) then
		return true
	else
		return false
	end
end)

local function AutoReload(pCmd)
	local wep = ply:GetActiveWeapon()
	if(not gBool("More", "More", "Auto Reload")) then return end
	if (ply:Alive() and ply:Health() > 0 and idiot.IsValid(wep)) then
		if (wep:Clip1() <= (gInt("More", "More", "Auto Reload at:")) and wep:GetMaxClip1() > 0 and idiot.CurTime() > wep:GetNextPrimaryFire()) then
			pCmd:SetButtons(pCmd:GetButtons() + IN_RELOAD)
		end
	end
end

local function GetColor(v)
    if(pm.Team(v) == pm.Team(me)) then
		local r = gInt("Settings", "Team Visuals Color", "Red:")
		local g = gInt("Settings", "Team Visuals Color", "Green:")
		local b = gInt("Settings", "Team Visuals Color", "Blue:")
		return(Color(r, g, b, 220))
    end
		local r = gInt("Settings", "Enemy Visuals Color", "Red:")
		local g = gInt("Settings", "Enemy Visuals Color", "Green:")
		local b = gInt("Settings", "Enemy Visuals Color", "Blue:")
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
	local col = idiot.IsDev(v) && Color(0, 0, 0) || gBool("Visuals", "More", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local ocol = idiot.IsDev(v) && HSVToColor(RealTime()*45%360, 1, 1) || Color(0, 0, 0)
	local colololol = gBool("Visuals", "More", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local ocolololol = idiot.IsDev(v) && HSVToColor(RealTime()*45%360, 1, 1) || gBool("Visuals", "More", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local teamcol = idiot.IsDev(v) && HSVToColor(RealTime()*45%360, 1, 1) || gBool("Visuals", "More", "Team Colors") && team.GetColor(pm.Team(v)) || Color(gInt("Settings", "Misc Visuals Color", "Red:"), gInt("Settings", "Misc Visuals Color", "Green:"), gInt("Settings", "Misc Visuals Color", "Blue:"))
	local teamocol = gBool("Visuals", "More", "Team Colors") && team.GetColor(pm.Team(v)) || Color(gInt("Settings", "Misc Visuals Color", "Red:"), gInt("Settings", "Misc Visuals Color", "Green:"), gInt("Settings", "Misc Visuals Color", "Blue:"))
	local hh = 0
	if(gBool("Visuals", "Wallhack", "Box") && gOption("Visuals", "Wallhack", "Box Type:") == "2D Box") then
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") && !idiot.IsDev(v) then
			surface.SetDrawColor(gInt("Settings", "Friend Visuals Color", "Red:"), gInt("Settings", "Friend Visuals Color", "Green:"), gInt("Settings", "Friend Visuals Color", "Blue:"))
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
	if(gBool("Visuals", "Wallhack", "Box") && gOption("Visuals", "Wallhack", "Box Type:") == "3D Box") then
	for k, v in pairs(player.GetAll()) do
		if(not em.IsValid(v) or em.Health(v) < 1 or em.IsDormant(v) or v == me or pm.Team(v) == TEAM_SPECTATOR) then continue end
		if(not Filter(v)) then continue end
		if(not EnemyFilter(v)) then continue end
	if v != LocalPlayer() and v:IsValid() and v:Alive() and v:Health() > 0 then
		local eye = v:EyeAngles()
		local min, max = v:WorldSpaceAABB()
		local origin = v:GetPos()
		if !idiot.IsDev(v) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, colololol)
			cam.End3D()
				end
			end
		end
	end
	if(gBool("Visuals", "Wallhack", "Box") && gOption("Visuals", "Wallhack", "Box Type:") == "3D Box") then
	for k, v in pairs(player.GetAll()) do
		if(not em.IsValid(v) or em.Health(v) < 1 or em.IsDormant(v) or v == me or pm.Team(v) == TEAM_SPECTATOR) then continue end
		if(not Filter(v)) then continue end
		if(not EnemyFilter(v)) then continue end
	if v != LocalPlayer() and v:IsValid() and v:Alive() and v:Health() > 0 then
		local eye = v:EyeAngles()
		local min, max = v:WorldSpaceAABB()
		local origin = v:GetPos()
		if idiot.IsDev(v) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, HSVToColor(RealTime()*45%360, 1, 1))
			cam.End3D()
				end
			end
		end
	end
	if(gBool("Visuals", "Wallhack", "Box") && gOption("Visuals", "Wallhack", "Box Type:") == "3D Box") then
	for k, v in pairs(player.GetAll()) do
		if(not em.IsValid(v) or em.Health(v) < 1 or em.IsDormant(v) or v == me or pm.Team(v) == TEAM_SPECTATOR) then continue end
		if(not Filter(v)) then continue end
		if(not EnemyFilter(v)) then continue end
	if v != LocalPlayer() and v:IsValid() and v:Alive() and v:Health() > 0 then
		local eye = v:EyeAngles()
		local min, max = v:WorldSpaceAABB()
		local origin = v:GetPos()
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") && !idiot.IsDev(v) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, Color(gInt("Settings", "Friend Visuals Color", "Red:"), gInt("Settings", "Friend Visuals Color", "Green:"), gInt("Settings", "Friend Visuals Color", "Blue:")))
			cam.End3D()
				end
			end
		end
	end
	if(gBool("Visuals", "Wallhack", "Box") && gOption("Visuals", "Wallhack", "Box Type:") == "Edged Box") then   
    surface.SetDrawColor(ocolololol)
	x1, y1, x2, y2 = ScrW() * 2, ScrH() * 2, - ScrW(), - ScrH()
		min, max = v:GetCollisionBounds()
		corners = {v:LocalToWorld(Vector(min.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, min.y, max.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, max.z)):ToScreen()}
		for _k, _v in next, corners do
			x1, y1 = math.min(x1, _v.x), math.min(y1, _v.y)
			x2, y2 = math.max(x2, _v.x), math.max(y2, _v.y)
		end
		diff, diff2 = math.abs(x2 - x1), math.abs(y2 - y1)
				surface.DrawLine(x1 + 1, y1 + 1, x1 + (diff*0.225), y1 + 1)
				surface.DrawLine(x1 + 1, y1 + 1, x1 + 1, y1 + (diff2*0.225))
				surface.DrawLine(x1 + 1, y2 - 1, x1 + (diff*0.225), y2 - 1)
				surface.DrawLine(x1 + 1, y2 - 1, x1 + 1, y2 - (diff2*0.225))
				surface.DrawLine(x2 - 1, y1 + 1, x2 - (diff*0.225), y1 + 1)
				surface.DrawLine(x2 - 1, y1 + 1, x2 - 1, y1 + (diff2*0.225))
				surface.DrawLine(x2 - 1, y2 - 1, x2 - (diff*0.225), y2 - 1)
				surface.DrawLine(x2 - 1, y2 - 1, x2 - 1, y2 - (diff2*0.225))
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") && !idiot.IsDev(v) then
		surface.SetDrawColor(gInt("Settings", "Friend Visuals Color", "Red:"), gInt("Settings", "Friend Visuals Color", "Green:"), gInt("Settings", "Friend Visuals Color", "Blue:"))
		x1, y1, x2, y2 = ScrW() * 2, ScrH() * 2, - ScrW(), - ScrH()
		min, max = v:GetCollisionBounds()
		corners = {v:LocalToWorld(Vector(min.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, min.y, max.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, max.z)):ToScreen()}
		for _k, _v in next, corners do
			x1, y1 = math.min(x1, _v.x), math.min(y1, _v.y)
			x2, y2 = math.max(x2, _v.x), math.max(y2, _v.y)
		end
		diff, diff2 = math.abs(x2 - x1), math.abs(y2 - y1)
				surface.DrawLine(x1 + 1, y1 + 1, x1 + (diff*0.225), y1 + 1)
				surface.DrawLine(x1 + 1, y1 + 1, x1 + 1, y1 + (diff2*0.225))
				surface.DrawLine(x1 + 1, y2 - 1, x1 + (diff*0.225), y2 - 1)
				surface.DrawLine(x1 + 1, y2 - 1, x1 + 1, y2 - (diff2*0.225))
				surface.DrawLine(x2 - 1, y1 + 1, x2 - (diff*0.225), y1 + 1)
				surface.DrawLine(x2 - 1, y1 + 1, x2 - 1, y1 + (diff2*0.225))
				surface.DrawLine(x2 - 1, y2 - 1, x2 - (diff*0.225), y2 - 1)
				surface.DrawLine(x2 - 1, y2 - 1, x2 - 1, y2 - (diff2*0.225))
		end
     end
	surface.SetFont("VisualsFont")
	surface.SetTextColor(255, 255, 255)
	if(gBool("Visuals", "Wallhack", "Health Bar")) then
		local hp = h * em.Health(v) / 100
		if(hp > h) then hp = h end
		local diff = h - hp
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(pos.x - w / 2 - 8, pos.y - h - 1, 5, h + 2)
		surface.SetDrawColor((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0, 255)
		surface.DrawRect(pos.x - w / 2 - 7, pos.y - h + diff, 3, hp)
	end
	if(gBool("Visuals", "Wallhack", "Armor Bar")) then
		local armor = v:Armor() * h / 100
		if(armor > h) then armor = h end
		local diff = h - armor
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(pos.x + ww + 3, pos.y - h - 1, 5, h + 2)
		surface.SetDrawColor((100 - v:Armor()) * 2.55, v:Armor() * 2.55, 0, 255)
		surface.DrawRect(pos.x + ww + 4, pos.y - h + diff, 3, armor)
	end
	if(gBool("Visuals", "Wallhack", "Name")) then
        local col = Color(255, 255, 255)
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") then
		draw.SimpleText("Friend", "VisualsFont", pos.x, pos.y - h - 13 - 13, Color(gInt("Settings", "Friend Visuals Color", "Red:"), gInt("Settings", "Friend Visuals Color", "Green:"), gInt("Settings", "Friend Visuals Color", "Blue:")), 1, 1)
		end
		if(gBool("Visuals", "Wallhack", "Bystander Name") && idiot.engine.ActiveGamemode() == "murder") then
		draw.SimpleText(v:GetNWString("bystanderName"), "VisualsFont", pos.x, pos.y - h - 1 - (friendstatus == "friend" && 12 || 12), col, 1, 1)
		else
		draw.SimpleText(pm.Name(v), "VisualsFont", pos.x, pos.y - h - 1 - (friendstatus == "friend" && 12 || 12), col, 1, 1)
	end
	end
	if(gBool("Visuals", "Wallhack", "Enabled") and gBool("Visuals", "Wallhack", "Name")) then
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") then
		if idiot.IsMe(v) then
		draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsMyAlt(v) then
		draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsUucka(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsCal1n(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsRussian(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsTryHard(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsMrSquid(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsZergo(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsPerSix(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsOhhStyle(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsDerpos(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsJohnRG(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsSDunken(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsDrygo(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsNigga(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 26 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		end
		if (friendstatus ~= "friend") then
		if idiot.IsMe(v) then
		draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsMyAlt(v) then
		draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsUucka(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsCal1n(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsRussian(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsTryHard(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsMrSquid(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsZergo(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsPerSix(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsOhhStyle(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsDerpos(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsJohnRG(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsSDunken(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsDrygo(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		if idiot.IsNigga(v) then
		draw.SimpleText("IdiotBox Developer", "VisualsFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*45%360, 1, 1), 1, 1)
		end
		end
	end
	if(gBool("Visuals", "Wallhack", "Health Value")) then
	hh = hh + 1
	local col = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2, 0)
	draw.SimpleText(em.Health(v).." Health", "VisualsFont", pos.x, pos.y - 1 + hh, col, 1, 0)
	hh = hh + 9
	end
	if(gBool("Visuals", "Wallhack", "Armor Value")) then
	hh = hh + 1
	local col = Color((100 - v:Armor()) * 2.55, v:Armor() * 2, 0)
	draw.SimpleText(v:Armor().." Armor", "VisualsFont", pos.x, pos.y - 1 + hh, col, 1, 0)
	hh = hh + 9
	end
	if(gBool("Visuals", "Wallhack", "Weapon")) then
	hh = hh + 1
	local w = pm.GetActiveWeapon(v)
	if(w && em.IsValid(w)) then
	local col = Color(200, 150, 150)
	draw.SimpleText(w:GetPrintName(), "VisualsFont", pos.x, pos.y - 0 + hh, col, 1, 0)
	hh = hh + 9
	end
	end
	if(gBool("Visuals", "Wallhack", "Rank")) then
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
	if(gBool("Visuals", "Wallhack", "Ping")) then
	hh = hh + 1
	local col = Color(v:Ping() * 2.55, 255 - v:Ping() - 5 * 2, 0)
	draw.SimpleText(v:Ping().."ms", "VisualsFont", pos.x, pos.y - 0 + hh, col, 1, 0)
	hh = hh + 9
	end
	if(gBool("Visuals", "Wallhack", "DarkRP Money")) then
	hh = hh + 1
	if (gmod.GetGamemode().Name == "DarkRP") then
	local col = Color(0, 255, 0)
	if (v:getDarkRPVar("money") == nil) then return end
	draw.SimpleText("$"..v:getDarkRPVar("money"), "VisualsFont", pos.x, pos.y - 0 + hh, col, 1, 0)
	hh = hh + 9
	end
	end
	if(gBool("Visuals", "Wallhack", "Skeleton")) then
		local col = gBool("Visuals", "More", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
		local pos = em.GetPos(v)
		for i = 0, em.GetBoneCount(v) do
		local parent = em.GetBoneParent(v, i)
		if(!parent) then continue end
		local bonepos = em.GetBonePosition(v, i)
		if(bonepos == pos) then continue end
		local parentpos = em.GetBonePosition(v, parent)
		if(!bonepos || !parentpos) then continue end
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
	if(gBool("Visuals", "Wallhack", "Hitbox")) then
		for k, v in next, player.GetAll() do
			if(not em.IsValid(v) or em.Health(v) < 1 or em.IsDormant(v) or v == me or pm.Team(v) == TEAM_SPECTATOR) then continue end
			if(not Filter(v)) then continue end
			if(not EnemyFilter(v)) then continue end
			for i = 0, v:GetHitBoxGroupCount() - 1 do
			for _i = 0, v:GetHitBoxCount(i) - 1 do
			local bone = v:GetHitBoxBone(_i, i)
			if not (bone) then continue end			
			local min, max = v:GetHitBoxBounds(_i, i)			
			if (v:GetBonePosition(bone)) then
			local pos, ang = v:GetBonePosition(bone)
			if !idiot.IsDev(v) then
			cam.Start3D()
			render.DrawWireframeBox(pos, ang, min, max, teamocol)
			cam.End3D()
		end
			end
		end
			end
		end
	end
	if(gBool("Visuals", "Wallhack", "Hitbox")) then
		for k, v in next, player.GetAll() do
			if(not em.IsValid(v) or em.Health(v) < 1 or em.IsDormant(v) or v == me or pm.Team(v) == TEAM_SPECTATOR) then continue end
			if(not Filter(v)) then continue end
			if(not EnemyFilter(v)) then continue end
			for i = 0, v:GetHitBoxGroupCount() - 1 do
			for _i = 0, v:GetHitBoxCount(i) - 1 do
			local bone = v:GetHitBoxBone(_i, i)
			if not (bone) then continue end			
			local min, max = v:GetHitBoxBounds(_i, i)
			if (v:GetBonePosition(bone)) then
			local pos, ang = v:GetBonePosition(bone)
			if idiot.IsDev(v) then
			cam.Start3D()
			render.DrawWireframeBox(pos, ang, min, max, HSVToColor(RealTime()*45%360, 1, 1))
			cam.End3D()
				end
			end
				end
			end
		end
	end
end

hook.Add("RenderScreenspaceEffects", "Hook12", function()
	if(not gBool("Visuals", "Wallhack", "Enabled")) then return end
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if menuopen then return end
		for k, v in next, player.GetAll() do
		if(not em.IsValid(v) or em.Health(v) < 1 or em.IsDormant(v) or v == me or pm.Team(v) == TEAM_SPECTATOR) then continue end
		if(not Filter(v)) then continue end
		if(not EnemyFilter(v)) then continue end
		Chams(v)
	end
end)

local function ShowNPCs()
	for k, v in pairs(ents.FindByClass("npc_*")) do
	if not Filter(v) then continue end
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
	local col = (Color(gInt("Settings", "Entities Visuals Color", "Red:"), gInt("Settings", "Entities Visuals Color", "Green:"), gInt("Settings", "Entities Visuals Color", "Blue:")))
	local Ent = v
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
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
	if(hp > h) then hp = h end
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
	if math.abs(v:LocalToWorld(v:OBBCenter()):ToScreen().x) < ScrW()*5 and math.abs(v:LocalToWorld(v:OBBCenter()):ToScreen().y) < ScrH()*5 then
		return true
	else
		return false
	end
end

hook.Add("DrawOverlay", "Hook13", function()
	if(gBool("Visuals", "Wallhack", "Enabled") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
		for k, v in next, player.GetAll() do
		if(v == me or not em.IsValid(v) or em.Health(v) < 0.1 or em.IsDormant(v) or pm.Team(v) == TEAM_SPECTATOR) then continue end
		if(not Filter(v)) then continue end
		if(not EnemyFilter(v)) then continue end
			Visuals(v)
		end
	end
	if(gBool("Visuals", "Wallhack", "Enabled") && gBool("Visuals", "More", "Traitor Finder") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
		TraitorFinder()
	end
	if(gBool("Visuals", "Wallhack", "Enabled") && gBool("Visuals", "More", "Murderer Finder") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
		MurdererFinder()
	end
	if(gBool("Visuals", "More", "Show NPCs") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
		ShowNPCs()
	end
	for k, v in next, ents.GetAll() do
	if v:IsDormant() or not v:IsValid() then continue end
	if not Filter(v) or not OnScreen(v) or v == me then continue end
	if(gBool("Visuals", "More", "Show Entities") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible())) && !menuopen) then
	if table.HasValue(drawn_ents, v:GetClass()) and v:IsValid() and v:GetPos():Distance(me:GetPos()) > 40 then
				local pos = em.GetPos(v) + Vector(0, 0, 0)
				local pos2 = pos + Vector(0, 0, 0)
				local pos = vm.ToScreen(pos)
				local pos2 = vm.ToScreen(pos2)
				local min, max = v:WorldSpaceAABB()
				local origin = v:GetPos()
				draw.SimpleText(v:GetClass(), "MiscFont", pos.x, pos.y, Color(255, 255, 255), 1)
				cam.Start3D()
					render.DrawWireframeBox(origin, Angle(0, 0, 0), min - origin, max - origin, Color(gInt("Settings", "Entities Visuals Color", "Red:"), gInt("Settings", "Entities Visuals Color", "Green:"), gInt("Settings", "Entities Visuals Color", "Blue:")), true) 
				cam.End3D()
			end
		end
	end
	if gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Priority List") and menuopen and ScrW() >= 1600 or ScrH() >= 1400 then
		PlayerList()
	end
	if v == me and not em.IsValid(v) then return end
	if(gBool("Visuals", "More", "Spectators") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		Spectator()
	end
	if(gBool("Visuals", "More", "Radar") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		RadarDraw()
	end
	if(gBool("Visuals", "More", "Custom Status") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		Logo()
		Status()
	end
	if(gBool("Visuals", "More", "Players List") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		Logo2()
		Players()
	end
	if(gBool("More", "More", "Crosshair") && (!gui.IsGameUIVisible()) && (!gui.IsConsoleVisible()) && (!(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()))) then
		Crosshair()
	end
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if (gBool("Triggerbot", "Triggerbot", "Enabled")) then return end
	if (gBool("Aimbot", "Ragebot", "Enabled") && gBool("Aimbot", "Legitbot", "Enabled")) then return end
	for k, v in pairs(player.GetAll()) do
	if(gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Disable All" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Disable Ragebot" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Disable Legitbot" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me) then return end
	end
	if(aimtarget and em.IsValid(aimtarget) and not NoPhys() and not NoCam() and gBool("Aimbot", "More (Ragebot & Legitbot)", "Snap Lines") and (gBool("Aimbot", "Ragebot", "Enabled") or gBool("Aimbot", "Legitbot", "Enabled"))) then
		if em.Health(me) > 0 then
			local col = Color(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
			local pos = vm.ToScreen(em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)))
			surface.SetDrawColor(col)
			surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y)
			surface.SetDrawColor(0, 0, 0)
			surface.DrawOutlinedRect(pos.x - 2, pos.y - 2, 5, 5)
			surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))
			surface.DrawRect(pos.x - 1, pos.y - 1, 3, 3)
		end
	end
end)

local trace_walls = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)

local NoPenetration = {[MAT_SLOSH] = true}

local PenMod = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}

local trace_normal = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)

local function FASAutowall(wep, startPos, aimPos, ply)
	if not gBool("Aimbot", "More (Ragebot & Legitbot)", "Auto Wall") then return end
    local traces = {}
    local traceResults = {}
    local dir = (aimPos - startPos):GetNormalized()
    traces[1] = {start = startPos, filter = me, mask = trace_normal, endpos = aimPos,}
    traceResults[1] = util.TraceLine(traces[1])
    if(NoPenetration[traceResults[1].MatType]) then return false end
    if( - dir:DotProduct(traceResults[1].HitNormal) <= .26) then return false end
    traces[2] = {start = traceResults[1].HitPos, endpos = traceResults[1].HitPos + dir * wep.PenStr * (PenMod[traceResults[1].MatType] or 1) * wep.PenMod, filter = me, mask = trace_walls,}
    traceResults[2] = util.TraceLine(traces[2])
    traces[3] = {start = traceResults[2].HitPos, endpos = traceResults[2].HitPos + dir * .1, filter = me, mask = trace_normal,}
    traceResults [3] = util.TraceLine(traces[3])
    traces[4] = {start = traceResults[2].HitPos, endpos = aimPos, filter = me, mask = MASK_SHOT,}
    traceResults[4] = util.TraceLine(traces[4])
    if(traceResults[4].Entity ~= ply) then return false end
    return(not traceResults[3].Hit)
end

local function M9KAutowall(wep)
	if not gBool("Aimbot", "More (Ragebot & Legitbot)", "Auto Wall") then return end
	local wep = me:GetActiveWeapon()
    local trace = {
        endpos = aimPos, 
        start = me:EyePos(), 
        mask = MASK_SHOT, 
        filter = me, 
    }
    return wep:BulletPenetrate(10, nil, util.TraceLine(trace), DamageInfo())
end

local function AntiAFK(pCmd)
	if(!gBool("Utilities", "Utilities", "Anti-AFK")) then
		timer.Create("afk1", 6, 0, function()
		local commands = {"moveleft", "moveright", "moveup", "movedown"}
		local command1 = table.Random(commands)
		local command2 = table.Random(commands)
		if unloaded == true then return end
		if(!gBool("Utilities", "Utilities", "Anti-AFK")) then return end
		timer.Create("afk2", 1, 1, function()
		RunConsoleCommand(" + "..command1) RunConsoleCommand(" + "..command2)
			end)
		timer.Create("afk3", 4, 1, function()
		RunConsoleCommand(" - "..command1) RunConsoleCommand(" - "..command2)
			end)
		end)
	end
end

local dists = {}

local function GetPos(v)
	if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Body Aim")) or (v:IsPlayer() and v:IsPlayingTaunt() and gBool("Hack vs. Hack", "Resolver", "Emote Resolver")) then return(em.LocalToWorld(v, em.OBBCenter(v))) end
	local eyes = em.LookupAttachment(v, "eyes")
	if(!eyes) then return(em.LocalToWorld(v, em.OBBCenter(v))) end
	local pos = em.GetAttachment(v, eyes)
	if(!pos) then return(em.LocalToWorld(v, em.OBBCenter(v))) end
	return(pos.Pos)
end

hook.Add("player_hurt", "Hook14", function(data)
	if (gBool("More", "More", "Hitsounds")) then
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
		if (killer == victim and victim ~= ply) then
			chat.AddText(Color(255, 255, 0), victim:Nick() .. " killed themself.")
		elseif (killer == victim and victim == ply) then
			chat.AddText(Color(255, 255, 0), "You killed yourself.")
		elseif (killer == ply and victim ~= ply) then
			chat.AddText(Color(255, 255, 0), "You killed " .. victim:Nick() .. ".")
		elseif (killer ~= ply and victim == ply) then
			chat.AddText(Color(255, 255, 0), killer:Nick() .. " killed you.")
		elseif (killer ~= ply and victim ~= ply) then
			chat.AddText(Color(255, 255, 0), killer:Nick() .. " killed " .. victim:Nick() .. ".")
		end
	end
end

hook.Add("entity_killed", "Hook15", function(data)
	if (gBool("More", "Chat", "Enable Spams") && gOption("More", "Chat", "Kill Spam:") ~= "Off") then
		KillSpam(data)
	end
	if gBool("More", "Chat", "Log Kills in Chat") then
		LogKills(data)
	end
end)

local function AimbotPriorities(v)
	if not gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Players") and gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore NPCs") then
		return v:IsPlayer()
	elseif not gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore NPCs") and gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Players") then
		return v:IsNPC()
	elseif not gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Players") and not gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore NPCs") then
		return v:IsPlayer() or v:IsNPC()
	else
		return nil
	end
end

local function TriggerbotPriorities(v)
	if not gBool("Triggerbot", "Aim Options", "Ignore Players") and gBool("Triggerbot", "Aim Options", "Ignore NPCs") then
		return v:IsPlayer()
	elseif not gBool("Triggerbot", "Aim Options", "Ignore NPCs") and gBool("Triggerbot", "Aim Options", "Ignore Players") then
		return v:IsNPC()
	elseif not gBool("Triggerbot", "Aim Options", "Ignore Players") and not gBool("Triggerbot", "Aim Options", "Ignore NPCs") then
		return v:IsPlayer() or v:IsNPC()
	else
		return nil
	end
end

local aimignore

local function Valid(v)
    local wep = me:GetActiveWeapon()
	local maxhealth = gInt("Aimbot", "Aim Options (Ragebot & Legitbot)", "Max Health:") 
	if(!v || !em.IsValid(v) || v == me || em.Health(v) < 1 || em.IsDormant(v) || !AimbotPriorities(v) || (v == aimignore && gOption("Aimbot", "Aim Options (Ragebot & Legitbot)", "Priority:") == "Random")) then return false end
	if v:IsPlayer() then
	if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Team")) then
        if(pm.Team(v) == pm.Team(me)) then return false end
    end
	if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Transparent Players")) then
        if em.GetColor(v).a < 255 then return false end
    end
    if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Friends")) then
        if(pm.GetFriendStatus(v) == "friend") then return false end
    end
	if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Bots")) then
		if(pm.IsBot(v)) then return false end
	end
    if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Admins")) then
        if pm.IsAdmin(v) then return false end
    end
    if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Driving Players")) then
		if pm.InVehicle(v) then return false end
	end
	if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Noclip")) then
		if (em.GetMoveType(v) == MOVETYPE_NOCLIP) then return false end
	end
	if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Disable in Noclip")) then
		if (em.GetMoveType(me) == MOVETYPE_NOCLIP) then return false end
	end
	if(gBool("Aimbot", "Aim Options (Ragebot & Legitbot)", "Ignore Overhealed Players")) then
		if (v:Health() > maxhealth) then return false end
	end
	if v:Team() == TEAM_SPECTATOR then
		return false
	end
	if table.HasValue(ignore_list, v:UniqueID()) then
		return false
	end
	end
    local tr = {
        start = em.EyePos(me), 
        endpos = GetPos(v), 
        mask = MASK_SHOT, 
        filter = {me, v}, 
    }
    if(util.TraceLine(tr).Fraction == 1) then
        return true
    elseif(wep and wep:IsValid() and wep.PenStr) then
        return FASAutowall(wep, tr.start, tr.endpos, v)
	elseif (wep and wep:IsValid() and wep.BulletPenetrate) then
		return M9KAutowall(wep, tr.start, tr.endpos, v)
    end
    return false
end

function idiot.Valid2(v)
	return (v and idiot.IsValid(v) and v:Health() > 0 and not v:IsDormant() and ply:GetObserverTarget() ~= v and v:GetMoveType() ~= 10 and TriggerbotPriorities(v))
end

function CrosshairAim()
	dists = {}
		local x, y = ScrW(), ScrH()
		local AngA, AngB = 0
		for k, v in next, ents.GetAll() do
			if(!Valid(v)) then continue end
			
			local EyePos = v:EyePos():ToScreen()
			dists[#dists + 1] = {math.Dist(x / 2, y / 2, EyePos.x, EyePos.y), v}
		end
		table.sort(dists, function(a, b)
			return(a[1] < b[1])
		end)
	aimtarget = dists[1] && dists[1][2] || nil
end

local function GetTarget()
	local opt = gOption("Aimbot", "Aim Options (Ragebot & Legitbot)", "Priority:")
	local sticky = gOption("Aimbot", "Ragebot", "Target Lock") or gOption("Aimbot", "Legitbot", "Target Lock")
	if(opt == "Distance") then
		if(sticky && Valid(aimtarget)) then return end
		dists = {}
		for k, v in next, ents.GetAll() do
				if(!Valid(v)) then continue end
				dists[#dists + 1] = {vm.Distance(em.GetPos(v), em.GetPos(me)), v}
		end
		table.sort(dists, function(a, b)
				return(a[1] < b[1])
		end)
		aimtarget = dists[1] && dists[1][2] || nil
	elseif(opt == "Health") then
		if(!sticky && Valid(aimtarget)) then return end
		dists = {}
		for k, v in next, ents.GetAll() do
				if(!Valid(v)) then continue end
				dists[#dists + 1] = {em.Health(v), v}
		end
		table.sort(dists, function(a, b)
				return(a[1] < b[1])
		end)
		aimtarget = dists[1] && dists[1][2] || nil
	elseif(opt == "Random") then
	if(!sticky && Valid(aimtarget)) then return end
		aimtarget = nil
		local allplys = ents.GetAll()
		local avaib = {}
		for k, v in next, allplys do
				avaib[math.random(100)] = v
		end
		for k, v in next, avaib do
				if(Valid(v)) then
						aimtarget = v
				end
		end
	elseif(opt == "Crosshair") then
		CrosshairAim()
	end
end

local cones = {}

local nullvec = Vector() * - 1

local servertime = 0

local sequences = {
    [ACT_VM_DEPLOY] = true, 
    [ACT_VM_DEPLOY_1] = true, 
    [ACT_VM_DEPLOY_2] = true, 
    [ACT_VM_DEPLOY_3] = true, 
    [ACT_VM_DEPLOY_4] = true, 
    [ACT_VM_DEPLOY_5] = true, 
    [ACT_VM_DEPLOY_6] = true, 
    [ACT_VM_DEPLOY_7] = true, 
    [ACT_VM_DEPLOY_8] = true, 
    [ACT_VM_DEPLOY_EMPTY] = true, 
    [ACT_VM_ATTACH_SILENCER] = true, 
    [ACT_VM_DETACH_SILENCER] = true, 
    [ACT_VM_DRAW] = true, 
    [ACT_VM_DRAW_DEPLOYED] = true, 
    [ACT_VM_DRAW_EMPTY] = true, 
    [ACT_VM_DRAW_SILENCED] = true, 
    [ACT_VM_RELOAD] = true, 
    [ACT_VM_RELOAD_DEPLOYED] = true, 
    [ACT_VM_RELOAD_EMPTY] = true, 
}

hook.Add("Move", "Hook16", function()
    if(IsFirstTimePredicted()) then
        servertime = CurTime() + engine.TickInterval()
    end
	if gBool("Aimbot", "More (Ragebot & Legitbot)", "Bullet Time") then
		if gBool("Aimbot", "Ragebot", "Auto Fire") or gBool("Aimbot", "Legitbot", "Auto Fire") and gInt("Aimbot", "More (Ragebot & Legitbot)", "Fire Delay:") ~= 1 then
			servertime = CurTime() - gInt("Aimbot", "More (Ragebot & Legitbot)", "Fire Delay:")/100
		elseif gBool("Triggerbot", "Triggerbot", "Enabled") and gInt("Triggerbot", "Triggerbot", "Fire Delay:") ~= 1 then
			servertime = CurTime() - gInt("Triggerbot", "Triggerbot", "Fire Delay:")/100
		else
			servertime = CurTime()
		end
	end
end)

local function WeaponCanFire()
	local w = pm.GetActiveWeapon(me)
		if(!w || !em.IsValid(w) || !gBool("Aimbot", "More (Ragebot & Legitbot)", "Bullet Time")) then return true end
	return(servertime >= wm.GetNextPrimaryFire(w))
end

GAMEMODE["EntityFireBullets"] = function(self, p, data)
	aimignore = aimtarget
	local w = pm.GetActiveWeapon(me)
	local Spread = data.Spread * - 1
	if(not w or not em.IsValid(w) or cones[em.GetClass(w)] == Spread or Spread == nullvec) then return end
	cones[em.GetClass(w)] = Spread
end

local function PredictSpread(pCmd, ang)
	local w = pm.GetActiveWeapon(me)
	if(not w or not em.IsValid(w) or not cones[em.GetClass(w)] or not gBool("Aimbot", "More (Ragebot & Legitbot)", "No Spread")) then return am.Forward(ang) end
	return (IdiotBox.Predict(pCmd, am.Forward(ang), cones[em.GetClass(w)]))
end

local function AutoFire(pCmd)
	if(pm.KeyDown(me, 1)) then
		cm.SetButtons(pCmd, bit.band(cm.GetButtons(pCmd), bit.bnot(1)))
	else
		cm.SetButtons(pCmd, bit.bor(cm.GetButtons(pCmd), 1))
	end
end

local function AltFire(pCmd)
	if(pm.KeyDown(me, 1)) then
		cm.SetButtons(pCmd, bit.band(cm.GetButtons(pCmd), bit.bnot(IN_ATTACK2)))
	else
		cm.SetButtons(pCmd, bit.bor(cm.GetButtons(pCmd), IN_ATTACK2))
	end
end

local function PredictPos(pos)
	local myvel = LocalPlayer():GetVelocity()
		local pos = pos - (myvel * engine.TickInterval())
	return pos
end

local function SmoothAim(ang) 
	if(gInt("Aimbot", "Legitbot", "Aim Smoothness:") > 0 && !gBool("Aimbot", "Legitbot", "Silent (For Anti-Aim)")) then
		ang.y = math.NormalizeAngle(ang.y) 	
		ang.p = math.NormalizeAngle(ang.p) 	
		eyeang = LocalPlayer():EyeAngles() 	
		local smooth = gInt("Aimbot", "Legitbot", "Aim Smoothness:") 	
		if((eyeang.y - ang.y) * - 1 > 180 && eyeang.y < 0) 
		then eyeang.y = eyeang.y + 360 end 	if((ang.y - eyeang.y) * - 1 > 180 && ang.y < 0) then ang.y = ang.y + 360 end 	
		eyeang.y = eyeang.y + (ang.y - eyeang.y) / smooth 	eyeang.x = eyeang.x + (ang.x - eyeang.x) / smooth 	eyeang.r = 0 	
		return eyeang else return ang
	end 
end

local function Ragebot(pCmd)
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	for k, v in pairs(player.GetAll()) do
	if(gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Disable All" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Disable Ragebot" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || NoPhys() || NoCam()) then return end
	end
	if(cm.CommandNumber(pCmd) == 0 || !gBool("Aimbot", "Ragebot", "Enabled") || gBool("Aimbot", "Legitbot", "Enabled")) then return end
	GetTarget()
	aa = false
	if(aimtarget && aimtarget:IsValid() && AimKeyCheck() && WeaponCanFire()) then
		aa = true
		local pos = GetPos(aimtarget) - em.EyePos(me)
		PredictPos(pos)
		local ang = vm.Angle(PredictSpread(pCmd, vm.Angle(pos)))
		NormalizeAngle(ang)
		cm.SetViewAngles(pCmd, ang)
		if(gBool("Aimbot", "Ragebot", "Auto Fire")) then
			AutoFire(pCmd)
		end
		if(gBool("Aimbot", "Ragebot", "Alt Fire")) then
			AltFire(pCmd)
		end
		if(gBool("Aimbot", "Ragebot", "Silent")) then
			FixMovement(pCmd)
		else
			fa = ang
		end
	end
end

local function Legitbot(pCmd)
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	for k, v in pairs(player.GetAll()) do
	if(gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Disable All" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Disable Legitbot" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || NoPhys() || NoCam()) then return end
	end
	if(cm.CommandNumber(pCmd) == 0 || !gBool("Aimbot", "Legitbot", "Enabled") || gBool("Aimbot", "Ragebot", "Enabled")) then return end
	GetTarget()
    aa = false
    if(aimtarget && aimtarget:IsValid() && AimKeyCheck2() && WeaponCanFire()) then
	local FovValue = gInt("Aimbot", "Legitbot", "Aim FoV Value:")
	if(FovValue < 0) then
	return end
	if(FovValue > 0) then
	CrosshairAim()
	local pos = GetPos(aimtarget) - em.EyePos(me)
		PredictPos(pos, aimtarget:GetVelocity())
		local ang = vm.Angle(PredictSpread(pCmd, vm.Angle(pos)))
		NormalizeAngle(ang)
		local CalcX = ang.x - fa.x
	    local CalcY = ang.y - fa.y
		if CalcY < 0 then CalcY = CalcY * - 1 end	
		if CalcX < 0 then CalcX = CalcX * - 1 end
		if CalcY > 360 then CalcY = CalcY - 360 end
		if CalcX > 360 then CalcX = CalcX - 360 end
		if CalcY > 180 then CalcY = 360 - CalcY end
		if CalcX > 180 then CalcX = 360 - CalcX end
		if (CalcX <= FovValue/2 && CalcY <= FovValue *0.4) then
		local ang = SmoothAim(ang)
		cm.SetViewAngles(pCmd, ang)
        if(gBool("Aimbot", "Legitbot", "Auto Fire")) then
            AutoFire(pCmd)
        end
		if(gBool("Aimbot", "Legitbot", "Alt Fire")) then
			AltFire(pCmd)
		end
        if(gBool("Aimbot", "Legitbot", "Silent (For Anti-Aim)")) then
            FixMovement(pCmd)
        else
            fa = ang
        end
			end
		end
	end
end

function idiot.TriggerFilter(hitbox)
	if (gBool("Triggerbot", "Aim Options", "Priority:") == "Head") then
		return hitbox == 0
	end
	return hitbox ~= nil
end

function idiot.Triggerbot(pCmd)
	local maxhealth2 = gInt("Triggerbot", "Triggerbot", "Max Health:")
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if not TriggerKeyCheck() then return end
	if pCmd:KeyDown(IN_ATTACK) then return end
	if not (gBool("Triggerbot", "Triggerbot", "Enabled")) then return end
	if (NoPhys()) then return end
	if (NoCam()) then return end
	local trace = ply:GetEyeTraceNoCursor()
	local v = trace.Entity
	local hitbox = trace.HitBox
	if (idiot.Valid2(v) and idiot.TriggerFilter(hitbox)) then
	if v:IsPlayer() then
	if(gBool("Triggerbot", "Aim Options", "Ignore Team")) then
    if(pm.Team(v) == pm.Team(me)) then return false end
    end
	if(gBool("Triggerbot", "Aim Options", "Ignore Transparent Players")) then
    if em.GetColor(v).a < 255 then return false end
    end
    if(gBool("Triggerbot", "Aim Options", "Ignore Friends")) then
    if(pm.GetFriendStatus(v) == "friend") then return false end
    end
	if(gBool("Triggerbot", "Aim Options", "Ignore Bots")) then
	if(pm.IsBot(v)) then return false end
	end
    if(gBool("Triggerbot", "Aim Options", "Ignore Admins")) then
    if pm.IsAdmin(v) then return false end
    end
    if(gBool("Triggerbot", "Aim Options", "Ignore Driving Players")) then
	if pm.InVehicle(v) then return false end
	end
	if(gBool("Triggerbot", "Aim Options", "Ignore Noclip")) then
	if (em.GetMoveType(v) == MOVETYPE_NOCLIP) then return false end
	end
	if(gBool("Triggerbot", "Aim Options", "Disable in Noclip")) then
	if (em.GetMoveType(me) == MOVETYPE_NOCLIP) then return false end
	end
	if(gBool("Triggerbot", "Aim Options", "Ignore Overhealed Players")) then
	if (v:Health() > maxhealth2) then return false end
	end
	if table.HasValue(ignore_list, v:UniqueID()) then
	return false
	end
	end
	if(gBool("Triggerbot", "Triggerbot", "Alt Fire")) then
	pCmd:SetButtons(pCmd:GetButtons() + IN_ATTACK2)
	end
	if not idiot.Valid2(v) then return end
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
	if(randcoin == 1) then return 1 else return - 1 end
end

local function GetClosest()
	local ddists = {}
	local closest
	for k, v in next, player.GetAll() do
	if(!Valid(v)) then continue end
	ddists[#ddists + 1] = {vm.Distance(em.GetPos(v), em.GetPos(me)), v}
	end
	table.sort(ddists, function(a, b)
	return(a[1] < b[1])
	end)
	closest = ddists[1] && ddists[1][2] || nil
	if(!closest) then return fa.y end
	local pos = em.GetPos(closest)
	local pos = vm.Angle(pos - em.EyePos(me))
	return(pos.y)
end

local function ViewLock()
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "View Lock")) then
		local wep = pm.GetActiveWeapon(me)
				if !IsValid(wep) then return end
		local n = string.lower(wep:GetPrintName())
		ox = 181
		if(string.find(n, "pistol") or string.find(n, "beretta") or string.find(n, "deagle") or string.find(n, "eagle") or string.find(n, "9mm") or string.find(n, "9 mm") or string.find(n, "1911") or string.find(n, "tool") or string.find(n, "glock") or string.find(n, "luger") or string.find(n, "M92") or string.find(n, "M29") or string.find(n, "MR69") or string.find(n, "usp") or string.find(n, "p229r") or string.find(n, "45c")) then
		oy = fa.y + 32
		elseif(string.find(n, "shotgun") or string.find(n, "minigun") or string.find(n, "winchester 1897") or string.find(n, "winchester 87") or string.find(n, "crossbow") or string.find(n, "ithaca") or string.find(n, "mossberg") or string.find(n, "remington 870") or string.find(n, "spas") or string.find(n, "benelli") or string.find(n, "browning")) then
		oy = fa.y + 13.5
		elseif(string.find(n, ".357") or string.find(n, "python") or string.find(n, "satan") or string.find(n, "remington 1858") or string.find(n, "bull") or string.find(n, "model")) then
		oy = fa.y + 35.5
		else
		oy = fa.y - 8
		end
	end
end

local manual = false

local manualpressed = false

local function GetX()
	local opt = gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "X-Axis:")
	local randcoin = gInt("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Emotion X-Axis:")
	if(opt == "Emotion") then
	if(math.random(100) < randcoin) then
		ox = RandCoin() * 181
	end
	elseif(opt == "Off") then
        ox = fa.x
	elseif(opt == "Down") then
		if gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Fake-Forwards" or gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Fake-Backwards" or gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Fake-Sideways" or gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Spinbot" then
			ox = 120 + math.sin(CurTime()*10)*5
		else
			ox = 89
		end
	elseif (opt == "Up") then
		if gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Fake-Forwards" or gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Fake-Backwards" or gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Fake-Sideways" or gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Spinbot" then
			ox = - 120 - math.sin(CurTime()*10)*5
		else
			ox = - 89
		end
	elseif(opt == "Center") then
		if gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Fake-Forwards" or gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Fake-Backwards" or gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Fake-Sideways" or gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:") == "Spinbot" then
			ox = 169 + math.sin(CurTime()*3)*5
		else
			ox = 0
		end
	elseif(opt == "Jitter") then
		ox = math.random( - 89, 89)
	elseif(opt == "Fake-Down") then
		ox = 540.000005
	elseif(opt == "Fake-Up") then
		ox = - 540.000005
	elseif(opt == "Semi-Jitter Down") then
		ox = math.random(0, 89)
	elseif(opt == "Semi-Jitter Up") then
		ox = math.random(0, - 89)
	elseif opt == "Spinbot" then
		ox = math.sin(CurTime()*gInt("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Spinbot Speed:")/8)*60
	end
end

local function GetY()
    local left = gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Anti-Aim Direction:") == "Left"
    local right = gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Anti-Aim Direction:") == "Right"
	local randcoin = gInt("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Emotion Y-Axis:")
	local opt = gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Y-Axis:")
	local adapt = gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Adaptive")
	local static = gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Static")
	if(opt == "Off") then
        oy = fa.y
	elseif(opt == "Emotion") then
	if(math.random(100) < randcoin) then
		oy = fa.y + math.random( - 180, 180)
	end
	elseif(opt == "Forwards" && !adapt && !static) then
		oy = fa.y
	elseif(opt == "Forwards" && adapt && !static) then
		oy = GetClosest()
	elseif(opt == "Forwards" && static) then
		oy = 180
	elseif(opt == "Backwards" && !adapt && !static) then
		oy = fa.y - 180
	elseif(opt == "Backwards" && adapt && !static) then
		oy = GetClosest() - 180
	elseif(opt == "Backwards" && static) then
		oy = 0
	elseif(opt == "Jitter" && !adapt && !static) then
		oy = fa.y + math.random( - 90, 90)
	elseif(opt == "Jitter" && adapt && !static) then
		oy = GetClosest() + math.random( - 90, 90)
	elseif(opt == "Jitter" && static) then
		oy = 180 + math.random( - 90, 90)
	elseif(opt == "Backwards Jitter" && !adapt && !static) then
		oy = fa.y - 180 + math.random( - 90, 90)
	elseif(opt == "Backwards Jitter" && adapt && !static) then
		oy = GetClosest() - 180 + math.random( - 90, 90)
	elseif(opt == "Backwards Jitter" && static) then
		oy = 0 + math.random( - 90, 90)
	elseif(opt == "Side Switch") then
		oy = math.random( - 631, 631)
	elseif(opt == "Semi-Jitter" && !adapt && !static) then
		oy = fa.y + math.random (25, - 25)
	elseif(opt == "Semi-Jitter" && adapt && !static) then
		oy = GetClosest() + math.random (25, - 25)
	elseif(opt == "Semi-Jitter" && static) then
		oy = 180 + math.random (25, - 25)
	elseif(opt == "Backwards Semi-Jitter" && !adapt && !static) then
		oy = fa.y - 180 + math.random (25, - 25)
	elseif(opt == "Backwards Semi-Jitter" && adapt && !static) then
		oy = GetClosest() - 180 + math.random (25, - 25)
	elseif(opt == "Backwards Semi-Jitter" && static) then
		oy = 0 + math.random (25, - 25)
	elseif(opt == "Spinbot") then
		if left then
        oy = (idiot.CurTime() * gInt("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Spinbot Speed:")*23) % 350, 1
   		elseif right then
        oy = (idiot.CurTime() * - gInt("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Spinbot Speed:")*23) % 350, 1
		elseif manual then
		oy = (idiot.CurTime() * - gInt("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Spinbot Speed:")*23) % 350, 1
		else
		oy = (idiot.CurTime() * gInt("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Spinbot Speed:")*23) % 350, 1
	    end
	elseif(opt == "Sideways" && !adapt && !static) then
		if right then
		oy = fa.y - 90
		elseif left then
		oy = fa.y + 90
		elseif manual then
		oy = fa.y - 90
		else
		oy = fa.y + 90
	end
	elseif(opt == "Sideways" && adapt && !static) then
		if right then
		oy = GetClosest() - 90
		elseif left then
		oy = GetClosest() + 90
		elseif manual then
		oy = GetClosest() - 90
		else
		oy = GetClosest() + 90
	end
	elseif(opt == "Sideways" && static) then
		if right then
		oy = 90
		elseif left then
		oy = 270
		elseif manual then
		oy = 90
		else
		oy = 270
	end
	elseif(opt == "Sideways Semi-Jitter" && !adapt && !static) then
        if left then
        oy = fa.y + 90 + math.random(0, 40)
        elseif right then
        oy = fa.y + 270 + math.random(0, - 40)
		elseif manual then
		oy = fa.y + 270 + math.random(0, - 40)
		else
		oy = fa.y + 90 + math.random(0, 40) 
        end
	elseif(opt == "Sideways Semi-Jitter" && adapt && !static) then
        if left then
        oy = GetClosest() + 90 + math.random(0, 40)
        elseif right then
        oy = GetClosest() + 270 + math.random(0, - 40)
		elseif manual then
		oy = GetClosest() + 270 + math.random(0, - 40)
		else
		oy = GetClosest() + 90 + math.random(0, 40) 
        end
	elseif(opt == "Sideways Semi-Jitter" && static) then
        if left then
        oy = 270 + math.random(0, 40)
        elseif right then
        oy = 90 + math.random(0, - 40)
		elseif manual then
		oy = 90 + math.random(0, - 40)
		else
		oy = 270 + math.random(0, 40)
        end
	elseif(opt == "Sideways Jitter" && !adapt && !static) then
		if left then
        oy = fa.y + math.random(1, 180, 1, 80, 1)
   		elseif right then
        oy = fa.y + math.random(181, 361) 
		elseif manual then
		oy = fa.y + math.random(181, 361)
		else
		oy = fa.y + math.random(1, 180, 1, 80, 1)
	    end
	elseif(opt == "Sideways Jitter" && adapt && !static) then
		if left then
        oy = GetClosest() + math.random(1, 180, 1, 80, 1)
   		elseif right then
        oy = GetClosest() + math.random(181, 361) 
		elseif manual then
		oy = GetClosest() + math.random(181, 361)
		else
		oy = GetClosest() + math.random(1, 180, 1, 80, 1)
	    end
	elseif(opt == "Sideways Jitter" && static) then
		if left then
        oy = 270 + math.random( - 90, 90)
   		elseif right then
        oy = 90 + math.random( - 90, 90) 
		elseif manual then
		oy = 90 + math.random( - 90, 90)
		else
		oy = 270 + math.random( - 90, 90)
	    end
	elseif(opt == "Fake-Forwards" && !adapt && !static) then
		if left then
        oy = fa.y - math.sin(CurTime()*10)*5
        elseif right then
        oy = fa.y + math.sin(CurTime()*10)*5
		elseif manual then
		oy = fa.y + math.sin(CurTime()*10)*5
		else
		oy = fa.y - math.sin(CurTime()*10)*5
        end
	elseif(opt == "Fake-Forwards" && adapt && !static) then
        if left then
        oy = GetClosest() - math.sin(CurTime()*10)*5
        elseif right then
        oy = GetClosest() + math.sin(CurTime()*10)*5
		elseif manual then
		oy = GetClosest() + math.sin(CurTime()*10)*5
		else
		oy = GetClosest() - math.sin(CurTime()*10)*5
        end
	elseif(opt == "Fake-Forwards" && static) then
        if left then
        oy = 180 - math.sin(CurTime()*10)*5
        elseif right then
        oy = 180 + math.sin(CurTime()*10)*5
		elseif manual then
		oy = 180 + math.sin(CurTime()*10)*5
		else
		oy = 180 - math.sin(CurTime()*10)*5
        end
	elseif(opt == "Fake-Backwards" && !adapt && !static) then
		if right then
		oy = fa.y + 180 + math.sin(CurTime()*10)*5
		elseif left then
		oy = fa.y + 180 - math.sin(CurTime()*10)*5
		elseif manual then
		oy = fa.y + 180 + math.sin(CurTime()*10)*5
		else
		oy = fa.y + 180 - math.sin(CurTime()*10)*5
		end
	elseif(opt == "Fake-Backwards" && adapt && !static) then
		if right then
		oy = GetClosest() + 180 + math.sin(CurTime()*10)*5
		elseif left then
		oy = GetClosest() + 180 - math.sin(CurTime()*10)*5
		elseif manual then
		oy = GetClosest() + 180 + math.sin(CurTime()*10)*5
		else
		oy = GetClosest() + 180 - math.sin(CurTime()*10)*5
		end
	elseif(opt == "Fake-Backwards" && static) then
		if right then
		oy = 0 + math.sin(CurTime()*10)*5
		elseif left then
		oy = 0 - math.sin(CurTime()*10)*5
		elseif manual then
		oy = 0 + math.sin(CurTime()*10)*5
		else
		oy = 0 - math.sin(CurTime()*10)*5
		end
	elseif(opt == "Fake-Sideways" && !adapt && !static) then
		if left then
        oy = fa.y + 90 + math.sin(CurTime()*10)*5
   		elseif right then
        oy = fa.y - 90 - math.sin(CurTime()*10)*5
		elseif manual then
		oy = fa.y - 90 - math.sin(CurTime()*10)*5
		else
		oy = fa.y + 90 + math.sin(CurTime()*10)*5
	    end
	elseif(opt == "Fake-Sideways" && adapt && !static) then
		if left then
        oy = GetClosest() + 90 + math.sin(CurTime()*10)*5
   		elseif right then
        oy = GetClosest() - 90 - math.sin(CurTime()*10)*5
		elseif manual then
		oy = GetClosest() - 90 - math.sin(CurTime()*10)*5
		else
		oy = GetClosest() + 90 + math.sin(CurTime()*10)*5
	    end
	elseif(opt == "Fake-Sideways" && static) then
		if left then
        oy = 270 + math.sin(CurTime()*10)*5
   		elseif right then
        oy = - 270 - math.sin(CurTime()*10)*5
		elseif manual then
		oy = - 270 - math.sin(CurTime()*10)*5
		else
		oy = 270 + math.sin(CurTime()*10)*5
	    end
	end
end

local function WallDetect()
	if (gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Wall Detect")) then
		local eye = em.EyePos(me)
		local tr = util.TraceLine({
		start = eye, 
		endpos = (eye + (am.Forward(fa) * 10)), 
		mask = MASK_ALL, 
	})
	if(tr.Hit) then
		ox = - 181
		oy = - 90
		end
	end
end

local function AntiAim(pCmd)
	for k, v in pairs(player.GetAll()) do
	if(gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Disable All" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me || gBool("Aimbot", "More (Ragebot & Legitbot)", "Panic Mode") && gOption("Aimbot", "More (Ragebot & Legitbot)", "Mode:") == "Disable Anti-Aim" && IsValid(v:GetObserverTarget()) and v:GetObserverTarget() == me) then return end
	end
	local wep = pm.GetActiveWeapon(me)
	if(gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Disable in Noclip") && em.GetMoveType(me) == MOVETYPE_NOCLIP || me:Team() == TEAM_SPECTATOR || (cm.CommandNumber(pCmd) == 0 && !gBool("More", "More", "Thirdperson")) || cm.KeyDown(pCmd, 1) || gBool("More", "Custom FoV", "Enabled") && gBool("Visuals", "More", "Free Camera") && CamKeyCheck() && !gBool("More", "More", "Thirdperson") || me:WaterLevel() > 1 || cm.KeyDown(pCmd, 32) && gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Disable with 'E' Key") || em.GetMoveType(me) == MOVETYPE_LADDER || aa || me:Health() < 1 || !me:Alive() || !gBool("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Enabled") || gBool("Aimbot", "Legitbot", "Enabled") && !gBool("Aimbot", "Legitbot", "Silent (For Anti-Aim)") || gBool("Utilities", "Utilities", "TTT: Prop Kill") && wep:IsValid() && wep:GetClass() == "weapon_zm_carry" && idiot.engine.ActiveGamemode() == "terrortown") then return end
	if gOption("Hack vs. Hack", "Anti-Aim (Ragebot only)", "Anti-Aim Direction:") == "Manual Switching" then
	if SwitchKeyCheck() and not manualpressed then
	manualpressed = true
	manual = not manual
	elseif not SwitchKeyCheck() and manualpressed then
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
	if not NoPhys() and not NoCam() then
		if(not gBool("Aimbot", "More (Ragebot & Legitbot)", "No Recoil")) then 
			return ang + pm.GetPunchAngle(me)
		else
			return ang
		end
	end
end

local prop_val = 0

local prop_delay = 0

local function PropKill(pCmd)
	if (cm.CommandNumber(pCmd) == 0 && !gBool("More", "More", "Thirdperson")) then
		return
	elseif (cm.CommandNumber(pCmd) == 0 && gBool("More", "More", "Thirdperson")) then
		return
	end
	if PropKeyCheck() then
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
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "None") then return end
		if(gBool("Aimbot", "Ragebot", "Enabled") && gBool("Aimbot", "Ragebot", "Auto Stop") && aimtarget && AimKeyCheck() && WeaponCanFire() or gBool("Aimbot", "Legitbot", "Enabled") && gBool("Aimbot", "Legitbot", "Auto Stop") && aimtarget && AimKeyCheck() && WeaponCanFire() or gBool("Triggerbot", "Triggerbot", "Enabled") && gBool("Triggerbot", "Triggerbot", "Auto Stop") && TriggerKeyCheck() && idiot.Triggering && WeaponCanFire()) then
			pCmd:SetForwardMove(0)
			pCmd:SetSideMove(0)
			pCmd:SetUpMove(0)
		return
	end
end

local function AutoCrouch(pCmd)
	if(gBool("Triggerbot", "Triggerbot", "Trigger-Key:") == "None") then return end		
		if(gBool("Aimbot", "Ragebot", "Enabled") && gBool("Aimbot", "Ragebot", "Auto Crouch") && aimtarget && AimKeyCheck() && WeaponCanFire() or gBool("Aimbot", "Legitbot", "Enabled") && gBool("Aimbot", "Legitbot", "Auto Crouch") && aimtarget && AimKeyCheck() && WeaponCanFire() or gBool("Triggerbot", "Triggerbot", "Enabled") && gBool("Triggerbot", "Triggerbot", "Auto Crouch") && TriggerKeyCheck() && idiot.Triggering && WeaponCanFire()) then
			pCmd:SetButtons(pCmd:GetButtons() + IN_DUCK)
		return
	end
end

local function FakeAngs(pCmd)
	if(!fa) then 
		fa = cm.GetViewAngles(pCmd)
	end
    fa = fa + Angle(cm.GetMouseY(pCmd) * .023, cm.GetMouseX(pCmd) * - .023, 0)
    NormalizeAngle(fa)
    if(cm.CommandNumber(pCmd) == 0) then
		if not NoPhys() and not NoCam() then
			cm.SetViewAngles(pCmd, GetAngle(fa))
			return
		end
	end
	if(cm.KeyDown(pCmd, 1)) then
		if not NoPhys() and not NoCam() then
			local ang = GetAngle(vm.Angle(PredictSpread(pCmd, fa)))
			NormalizeAngle(ang)
			cm.SetViewAngles(pCmd, ang)
		end
    end
end

local CS = {}

CS.CircleStrafeVal = 0

CS._G = (_G)

CS.localply = CS._G.LocalPlayer()

CS.cl_forwardspeed_cvar = CS._G.GetConVar("cl_forwardspeed")

CS.cl_forwardspeed_value = 10000

if (CS.cl_forwardspeed_cvar) then
	CS.cl_forwardspeed_value = CS.cl_forwardspeed_cvar:GetFloat()
end

CS.cl_sidespeed_cvar = CS._G.GetConVar("cl_sidespeed")

CS.cl_sidespeed_value = 10000

if (CS.cl_sidespeed_cvar) then
	CS.cl_sidespeed_value = CS.cl_sidespeed_cvar:GetFloat()
end

function CS.ClampMove(pCmd)
	if (pCmd:GetForwardMove() > CS.cl_forwardspeed_value) then
		pCmd:SetForwardMove(CS.cl_forwardspeed_value)
	end
	if (pCmd:GetSideMove() > CS.cl_sidespeed_value) then
		pCmd:SetSideMove(CS.cl_sidespeed_value)
	end
end

function CS.FixMove(pCmd, rotation)
	local rot_cos = CS._G.math.cos(rotation)
	local rot_sin = CS._G.math.sin(rotation)
	local cur_forwardmove = pCmd:GetForwardMove()
	local cur_sidemove = pCmd:GetSideMove()
	pCmd:SetForwardMove(((rot_cos * cur_forwardmove) - (rot_sin * cur_sidemove)))
	pCmd:SetSideMove(((rot_sin * cur_forwardmove) + (rot_cos * cur_sidemove)))
end

function CS.CircleStrafe(pCmd)
	CS.CircleStrafeSpeed = gInt("More", "Movement", "Strafe Speed:")
		if (CS._G.input.IsMouseDown(109)) then
			CS.CircleStrafeVal = CS.CircleStrafeVal + CS.CircleStrafeSpeed
		if ((CS.CircleStrafeVal > 10000000) and ((CS.CircleStrafeVal / CS.CircleStrafeSpeed) > 100000)) then
			CS.CircleStrafeVal = 100000000
		end
		CS.FixMove(pCmd, CS._G.math.rad((CS.CircleStrafeVal - CS._G.engine.TickInterval())))
		return false
	else
		CS.CircleStrafeVal = 0
	end
	return true
end

local crouched = 0

local function FakeCrouch(pCmd)
	if gBool("More", "Movement", "Fake Crouch") then
	if em.GetMoveType(me) == MOVETYPE_NOCLIP then return end
	if me:Team() == TEAM_SPECTATOR then return end
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

local function CircleStrafe(pCmd)
	if(gBool("More", "Movement", "Circle Strafe")) then
	if(gBool("More", "Movement", "Auto Strafe")) then return end
	if(gBool("More", "Custom FoV", "Enabled") && gBool("Visuals", "More", "Free Camera") && CamKeyCheck() && !gBool("More", "More", "Thirdperson")) then return end
	if em.GetMoveType(me) == MOVETYPE_NOCLIP then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if LocalPlayer():IsFlagSet(1024) then return end
		if (CS.localply) then
			if (pCmd:KeyDown(IN_JUMP)) then
				local local_velocity = CS.localply:GetVelocity()
				if (local_velocity:Length2D() < 50) then
					pCmd:SetForwardMove(CS.cl_forwardspeed_value)
				end
				local shouldautostrafe = CS.CircleStrafe(pCmd)		
				if (!CS.localply:OnGround()) then
					if (shouldautostrafe) then
					end
					pCmd:SetButtons(pCmd:GetButtons() - IN_JUMP)
				end
			else
				CS.CircleStrafeVal = 1
			end
		end
		CS.ClampMove(pCmd)
	end
end

hook.Add("CreateMove", "Hook17", function(pCmd)
	bSendPacket = true
	if gInt("Hack vs. Hack", "Fake Lag", "Lag Factor:") ~= 0 then
	FakeLag(pCmd)
	end
	AntiAFK(pCmd)
	BunnyHop(pCmd)
	FakeAngs(pCmd)
	AutoReload(pCmd)
	Ragebot(pCmd)
	Legitbot(pCmd)
	AntiAim(pCmd)
	RapidFire(pCmd)
	RapidAltFire(pCmd)
	CircleStrafe(pCmd)
	AutoStop(pCmd)
	AutoCrouch(pCmd)
	FakeCrouch(pCmd)
	idiot.AirCrouch(pCmd)
	idiot.Triggerbot(pCmd)
	idiot.FreeCamMove(pCmd)
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if me:IsTyping() then return end
	if menuopen then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	local wep = pm.GetActiveWeapon(me)
	if idiot.engine.ActiveGamemode() == "terrortown" and gBool("Utilities", "Utilities", "TTT: Prop Kill") and wep:IsValid() and wep:GetClass() == "weapon_zm_carry" then
		PropKill(pCmd)
	end
end)

hook.Add("AdjustMouseSensitivity", "Hook18", function()
	if not gBool("Triggerbot", "Triggerbot", "Smooth Aim") then return end
	if not TriggerKeyCheck() then return end
	if not idiot.Triggering then return end
	if NoPhys() then return end
	if NoCam() then return end
	return .10
end)

hook.Add("ShouldDrawLocalPlayer", "Hook19", function()
	return(gBool("More", "More", "Thirdperson"))
end)

hook.Add("CalcView", "Hook20", function(me, pos, ang, fov)
	if me:Alive() and me:Health() > 0 and me:Team() ~= TEAM_SPECTATOR then
		if gBool("More", "Custom FoV", "Enabled") and not gBool("More", "More", "Thirdperson") then
			local view = {}
			view.origin = pos
			view.angles = angles
			view.fov = gInt("More", "Custom FoV", "FoV:")
		if (ply:Health() > 0 and ply:GetMoveType() ~= 10 and ply:GetObserverTarget() == nil) then
			if (gBool("Aimbot", "More (Ragebot & Legitbot)", "No Recoil")) then
				view.origin = ply:EyePos()
				view.angles = ply:EyeAngles()
			end
		end
		if (FreeCam and gBool("More", "Custom FoV", "Enabled") and gBool("Visuals", "More", "Free Camera") and CamKeyCheck() and not gBool("More", "More", "Thirdperson") and not menuopen and not me:IsTyping() and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() and not (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) and not (me:Team() == TEAM_SPECTATOR) and not (me:Health() < 1) and not (me:Alive())) then
			view.origin = CamPos
			view.angles = ply:EyeAngles()
			view.fov = gInt("More", "Custom FoV", "FoV:")
		end
			return view
		else
			local view = {
			angles = GetAngle(fa), 
			origin = (gBool("More", "More", "Thirdperson") and pos + am.Forward(fa) * (gInt("More", "More", "Thirdperson Distance:") * - 10) or pos), 
			}
		return view
		end
	end
end)

hook.Add("player_disconnect", "Hook21", function()
	if(gBool("More", "Chat", "Enable Spams") && gOption("More", "Chat", "Reply Spam:") == "Disconnect Spam") then
		local quit = {"rage quit", "rage quit lol", "he raged", "he raged lmao", "he left", "he left lmfao"}
		if (engine.ActiveGamemode() == "darkrp") then
			me:ConCommand("say /ooc "..quit[math.random(#quit)])
		else
			me:ConCommand("say "..quit[math.random(#quit)])
		end
	end
end)

hook.Add("HUDPaint", "Hook22", function()
	if gInt("Settings", "Others", "BG Darkness:") > 0 and menuopen then
		surface.SetDrawColor(0, 0, 0, gInt("Settings", "Others", "BG Darkness:")*10)
		surface.DrawRect(0, 0, ScrW(), ScrH())
	end
	if gui.IsGameUIVisible() then return end
	if gui.IsConsoleVisible() then return end
	if (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if (v == me and not em.IsValid(v)) then return end
	local Cap = math.cos(math.rad(45))
	local Offset = Vector(0, 0, 32)
	local Trace = {}
	local WitnessColor = Color (0, 0, 0)
	if (gBool("Visuals", "More", "Witness Finder")) then
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
				WitnessColor = Color (gInt("Settings", "Menu Text Color", "Red:"), gInt("Settings", "Menu Text Color", "Green:"), gInt("Settings", "Menu Text Color", "Blue:"))
			else
				WitnessColor = Color (255, 0, 0)
			end
    	draw.SimpleText(Witnesses.." Player(s) can see you.", "MiscFont3", (ScrW() / 2) - 65, 42, Color(gInt("Settings", "Main Text Color", "Red:"), gInt("Settings", "Main Text Color", "Green:"), gInt("Settings", "Main Text Color", "Blue:")), 4, 1, 1, Color(0, 0, 0))
    	surface.SetDrawColor(WitnessColor)
    	surface.DrawRect((ScrW() / 2) - 73, 55, 152, 5)
    end
	if menuopen then return end
	if gBool("Visuals", "More", "Mirror") then
		local CamData = {}
			CamData.angles = Angle(fa.p - fa.p - fa.p, fa.y - 180, fa.r)
			CamData.origin = ply:GetShootPos()
			CamData.x = 650
			CamData.y = 0
			CamData.w = ScrW() / 3
			CamData.h = ScrH() / 5
		render.RenderView(CamData)
	end
	if gBool("Utilities", "Utilities", "TTT: Prop Kill") && PropKeyCheck() then
		if prop_val >= 180 then
			surface.DrawCircle(ScrW()/2, ScrH()/1.8, 80 + me:GetVelocity():Length()/4, Color(255, 0, 0))
		else
			surface.DrawCircle(ScrW()/2, ScrH()/1.8, 80 + me:GetVelocity():Length()/4, Color(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:")))
		end
	end
	if gBool("Aimbot", "Legitbot", "Enabled") and gBool("More", "More", "Show FoV Circle") and not gBool("Aimbot", "Ragebot", "Enabled") then
		local center = Vector(ScrW() / 2, ScrH() / 2, 0)
		local scale = Vector(((gInt("Aimbot", "Legitbot", "Aim FoV Value:"))*6.1), ((gInt("Aimbot", "Legitbot", "Aim FoV Value:"))*6.1), 0)
		local segmentdist = 360 / (2 * math.pi * math.max(scale.x, scale.y) / 2)
			surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red:"), gInt("Settings", "Crosshair Color", "Green:"), gInt("Settings", "Crosshair Color", "Blue:"), gInt("Settings", "Others", "T Opacity:"))	
		for a = 0, 360 - segmentdist, segmentdist do
			surface.DrawLine(center.x + math.cos(math.rad(a)) * scale.x, center.y - math.sin(math.rad(a)) * scale.y, center.x + math.cos(math.rad(a + segmentdist)) * scale.x, center.y - math.sin(math.rad(a + segmentdist)) * scale.y)
		end
	end
end)

hook.Add("PreDrawOpaqueRenderables", "Hook23", function()
	if gBool("Hack vs. Hack", "Resolver", "Enabled") then
		for k, v in next, player.GetAll() do
			if v == me or not v:IsValid() or table.HasValue(ignore_list, v:UniqueID()) then continue end
			if gBool("Hack vs. Hack", "Resolver", "Priority Targets Only") then
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

local randomresponse = {
	"shut up", 
	"ok", 
	"who", 
	"nobody cares", 
	"where", 
	"lol stop spamming", 
	"what", 
	"yea", 
	"lol", 
	"lmao", 
	"shit", 
	"fuck", 
}

hook.Add("OnPlayerChat", "Hook24", function(v, text, team)
	if v == me or not v:IsValid() or table.HasValue(ignore_list, v:UniqueID()) then
		return false
	end
	if gBool("More", "Chat", "Enable Spams") and gOption("More", "Chat", "Reply Spam:") == "Cheater Callout" and player ~= me and pm.GetFriendStatus(v) ~= "friend" then
		if string.find(string.lower(text), "hac") or string.find(string.lower(text), "h4c") or string.find(string.lower(text), "h@c") or string.find(string.lower(text), "hak") or string.find(string.lower(text), "h4k") or string.find(string.lower(text), "h@k") or string.find(string.lower(text), "hec") or string.find(string.lower(text), "h3c") or string.find(string.lower(text), "hek") or string.find(string.lower(text), "h3k") or string.find(string.lower(text), "hax") or string.find(string.lower(text), "h4x") or string.find(string.lower(text), "h@x") or string.find(string.lower(text), "hex") or string.find(string.lower(text), "h3x") or string.find(string.lower(text), "hask") or string.find(string.lower(text), "h4sk") or string.find(string.lower(text), "h@sk") or string.find(string.lower(text), "ha$k") or string.find(string.lower(text), "h4$k") or string.find(string.lower(text), "h@$k") or string.find(string.lower(text), "hasc") or string.find(string.lower(text), "h4sc") or string.find(string.lower(text), "h@sc") or string.find(string.lower(text), "ha$c") or string.find(string.lower(text), "h4$c") or string.find(string.lower(text), "h@$c") or string.find(string.lower(text), "cheat") or string.find(string.lower(text), "ch3at") or string.find(string.lower(text), "che4t") or string.find(string.lower(text), "che@t") or string.find(string.lower(text), "ch34t") or string.find(string.lower(text), "ch3@t") or string.find(string.lower(text), "chet") or string.find(string.lower(text), "ch3t") or string.find(string.lower(text), "chit") or string.find(string.lower(text), "ch1t") or string.find(string.lower(text), "wal") or string.find(string.lower(text), "w4l") or string.find(string.lower(text), "w@l") or string.find(string.lower(text), "wa1") or string.find(string.lower(text), "w@1") or string.find(string.lower(text), "w41") or string.find(string.lower(text), "aim") or string.find(string.lower(text), "a1m") or string.find(string.lower(text), "4im") or string.find(string.lower(text), "@im") or string.find(string.lower(text), "@1m") or string.find(string.lower(text), "41m") or string.find(string.lower(text), "trig") or string.find(string.lower(text), "tr1g") or string.find(string.lower(text), "spin") or string.find(string.lower(text), "sp1n") or string.find(string.lower(text), "legit") or string.find(string.lower(text), "leg1t") or string.find(string.lower(text), "rage") or string.find(string.lower(text), "r4ge") or string.find(string.lower(text), "r@ge") or string.find(string.lower(text), "rag3") or string.find(string.lower(text), "r@g3") or string.find(string.lower(text), "r4g3") or string.find(string.lower(text), "bot") or string.find(string.lower(text), "b0t") or string.find(string.lower(text), "esp") or string.find(string.lower(text), "3sp") or string.find(string.lower(text), "e$p") or string.find(string.lower(text), "3$p") or string.find(string.lower(text), "lua") or string.find(string.lower(text), "1ua") or string.find(string.lower(text), "lu4") or string.find(string.lower(text), "lu@") or string.find(string.lower(text), "1u4") or string.find(string.lower(text), "1u@") or string.find(string.lower(text), "scr") or string.find(string.lower(text), "skr") or string.find(string.lower(text), "$cr") or string.find(string.lower(text), "$kr") or string.find(string.lower(text), "skid") or string.find(string.lower(text), "sk1d") or string.find(string.lower(text), "$kid") or string.find(string.lower(text), "$k1d") or string.find(string.lower(text), "bunny") or string.find(string.lower(text), "buny") or string.find(string.lower(text), "h0p") or string.find(string.lower(text), "hop") or string.find(string.lower(text), "aa") or string.find(string.lower(text), "anti") or string.find(string.lower(text), "4nti") or string.find(string.lower(text), "@nti") or string.find(string.lower(text), "ant1") or string.find(string.lower(text), "@nt1") or string.find(string.lower(text), "4nt1") or string.find(string.lower(text), "idiot") or string.find(string.lower(text), "idi0t") or string.find(string.lower(text), "1diot") or string.find(string.lower(text), "id1ot") or string.find(string.lower(text), "1di0t") or string.find(string.lower(text), "id10t") or string.find(string.lower(text), "1d10t") or string.find(string.lower(text), "paste") or string.find(string.lower(text), "p4ste") or string.find(string.lower(text), "p@ste") or string.find(string.lower(text), "past3") or string.find(string.lower(text), "p@st3") or string.find(string.lower(text), "p4st3") or string.find(string.lower(text), "box") or string.find(string.lower(text), "b0x") or string.find(string.lower(text), "blo") or string.find(string.lower(text), "bl0") or string.find(string.lower(text), "b1o") or string.find(string.lower(text), "b10") or string.find(string.lower(text), "ware") or string.find(string.lower(text), "w4re") or string.find(string.lower(text), "w@re") or string.find(string.lower(text), "war3") or string.find(string.lower(text), "w@r3") or string.find(string.lower(text), "w4r3") or string.find(string.lower(text), "meth") or string.find(string.lower(text), "m3th") or string.find(string.lower(text), "kick") or string.find(string.lower(text), "k1ck") or string.find(string.lower(text), "kik") or string.find(string.lower(text), "k1k") or string.find(string.lower(text), "ban") or string.find(string.lower(text), "b4n") or string.find(string.lower(text), "b@n") or string.find(string.lower(text), "fake") or string.find(string.lower(text), "f4ke") or string.find(string.lower(text), "f@ke") or string.find(string.lower(text), "fak3") or string.find(string.lower(text), "f4k3") or string.find(string.lower(text), "f@k3") then
			if engine.ActiveGamemode() == "darkrp" then
				ChatClear.OOC()
			else
				ChatClear.Run()
			end
		end
	end
	if gBool("More", "Chat", "Enable Spams") and gOption("More", "Chat", "Reply Spam:") == "Copy Messages" and pm.GetFriendStatus(v) ~= "friend" then
	if (v ~= ply) then
		if (team) then
			ply:ConCommand("say_team '" .. text .. "' - " .. v:Nick())
		else
			ply:ConCommand("say '" .. text .. "' - " .. v:Nick())
			end
		end
	end
	if gBool("More", "Chat", "Enable Spams") and gOption("More", "Chat", "Reply Spam:") ~= "Off" and pm.GetFriendStatus(v) ~= "friend" then
	if (v ~= ply) then
		if (team && gOption("More", "Chat", "Reply Spam:") == "Random") then
			RunConsoleCommand("say_team", randomresponse[math.random(#randomresponse)])
		elseif (gOption("More", "Chat", "Reply Spam:") == "Random") then
			RunConsoleCommand("say", randomresponse[math.random(#randomresponse)])
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "shut up") then
			RunConsoleCommand("say_team", "shut up")
		elseif (gOption("More", "Chat", "Reply Spam:") == "shut up") then
			RunConsoleCommand("say", "shut up")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "ok") then
			RunConsoleCommand("say_team", "ok")
		elseif (gOption("More", "Chat", "Reply Spam:") == "ok") then
			RunConsoleCommand("say", "ok")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "who") then
			RunConsoleCommand("say_team", "who")
		elseif (gOption("More", "Chat", "Reply Spam:") == "who") then
			RunConsoleCommand("say", "who")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "nobody cares") then
			RunConsoleCommand("say_team", "nobody cares")
		elseif (gOption("More", "Chat", "Reply Spam:") == "nobody cares") then
			RunConsoleCommand("say", "nobody cares")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "where") then
			RunConsoleCommand("say_team", "where")
		elseif (gOption("More", "Chat", "Reply Spam:") == "where") then
			RunConsoleCommand("say", "where")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "lol stop spamming") then
			RunConsoleCommand("say_team", "lol stop spamming")
		elseif (gOption("More", "Chat", "Reply Spam:") == "lol stop spamming") then
			RunConsoleCommand("say", "lol stop spamming")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "what") then
			RunConsoleCommand("say_team", "what")
		elseif (gOption("More", "Chat", "Reply Spam:") == "what") then
			RunConsoleCommand("say", "what")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "yea") then
			RunConsoleCommand("say_team", "yea")
		elseif (gOption("More", "Chat", "Reply Spam:") == "yea") then
			RunConsoleCommand("say", "yea")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "lol") then
			RunConsoleCommand("say_team", "lol")
		elseif (gOption("More", "Chat", "Reply Spam:") == "lol") then
			RunConsoleCommand("say", "lol")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "lmao") then
			RunConsoleCommand("say_team", "lmao")
		elseif (gOption("More", "Chat", "Reply Spam:") == "lmao") then
			RunConsoleCommand("say", "lmao")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "shit") then
			RunConsoleCommand("say_team", "shit")
		elseif (gOption("More", "Chat", "Reply Spam:") == "shit") then
			RunConsoleCommand("say", "shit")
		elseif (team && gOption("More", "Chat", "Reply Spam:") == "fuck") then
			RunConsoleCommand("say_team", "fuck")
		elseif (gOption("More", "Chat", "Reply Spam:") == "fuck") then
			RunConsoleCommand("say", "fuck")
			end
		end
	end
end)

MsgG(5.3, "Welcome, "..me:Nick()..". Press 'INSERT' or run the 'ib_openmenu' command to toggle.")
surface.PlaySound("buttons/lightswitch2.wav")

if ac != true then 
	timer.Create("ChatPrint", 5.7, 1, function() MsgG(5.2, "No anti-cheats have been detected.") end)
	timer.Create("PlaySound", 5.7, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
end

if (_G.QAC or _G.qac or _G.CAC or _G.cac or _G.SAC or _G.sac or _G.DAC or _G.dac or _G.TAC or _G.tac or _G.simplicity or _G.SMAC or _G.smac or _G.MAC or _G.mac or _G.GAC or _G.gac or _G.GS or _G.gs or _G.AE or _G.ae or _G.CardinalLib) then
	timer.Create("ChatPrint", 5.7, 1, function() MsgR(5.2, "An anti-cheat has been detected. Cheat carefully to not get banned!") end)
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
