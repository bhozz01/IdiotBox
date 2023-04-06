  //----IdiotBox v6.9.b4----//
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
		if string.find("IdiotBox", v) then
			return "3D_TrollFace_Troll_Model_200"
		end
	end 
    return detours[file.Read](fileName, path)
end)

local idiot	= (_G)
local folder = "IdiotBox"
local version = "6.9.b4"

local me = LocalPlayer()
--[[ local wep = me:GetActiveWeapon() ]]-- Trying to localize this causes many issues for whatever reason, but I'll figure it out at one point

local menukeydown, menukeydown2, menuopen, mousedown, candoslider, drawlast, notyetselected, fa, aa, aimtarget, aimignore
local optimized, manual, manualpressed, tppressed, tptoggle, applied, windowopen, pressed, usespam, displayed, blackscreen, footprints, loopedprops = false
local box, drawnents, prioritylist, ignorelist, visible, dists, cones, traitors, tweps = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}

local toggler, playerkills, namechangeTime, circlestrafeval, timeHoldingSpaceOnGround, servertime, faketick, propval, propdelay, crouched = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
local maintextcol, menutextcol, bgmenucol, bordercol, teamvisualscol, enemyvisualscol, prioritytargetscol, ignoredtargetscol, miscvisualscol, teamchamscol, enemychamscol, crosshaircol, viewmodelcol = Color(0, 205, 255), Color(255, 255, 255), Color(30, 30, 45), Color(0, 155, 255), Color(255, 255, 255), Color(255, 255, 255), Color(255, 0, 100), Color(175, 175, 175), Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255), Color(0, 235, 255), Color(0, 235, 255)

local radarX, radarY, radarW, radarH = 50, ScrH() / 3, 200, 200
local roampos, roamang, roamon, roamx, roamy, roamduck, roamjump = me:EyePos(), me:GetAngles(), false, 0, 0, false, false

local clForwardSpeedCvar = GetConVar("cl_forwardspeed")
local clSideSpeedCvar = GetConVar("cl_sidespeed")
local forwardspeedval, sidespeedval = 10000, 10000

local old_yaw = 0.0
local ox, oy = - 181, 0

local fixmovement = fixmovement or nil
local nullvec = Vector() * - 1

local fake = GetRenderTarget("fake"..os.time(), ScrW(), ScrH())

local hide = {CHudHealth = true, CHudAmmo = true, CHudBattery = true, CHudSecondaryAmmo = true, CHudDamageIndicator = true, CHudCrosshair = true, }
local crosshairhide = {CHudCrosshair = true, }

local em = FindMetaTable("Entity")
local pm = FindMetaTable("Player")
local cm = FindMetaTable("CUserCmd")
local wm = FindMetaTable("Weapon")
local am = FindMetaTable("Angle")
local vm = FindMetaTable("Vector")
local im = FindMetaTable("IMaterial")

gameevent.Listen("entity_killed")
gameevent.Listen("player_disconnect")
gameevent.Listen("player_hurt")

CreateClientConVar("idiot_changename", "www.IB4G.net | Cry, dog!", true, false)

concommand.Add("idiot_usespam", function()
    usespam = !usespam
end)

surface.CreateFont("VisualsFont", {font = "Tahoma", size = 12, antialias = false, outline = true})
surface.CreateFont("MenuFont", {font = "Tahoma", size = 12, weight = 674, antialias = false, outline = true})
surface.CreateFont("MenuFont2", {font = "Tahoma", size = 12, antialias = true, outline = true})
surface.CreateFont("MainFont", {font = "Tahoma", size = 16, weight = 1300, antialias = false, outline = false})
surface.CreateFont("MainFont2", {font = "Tahoma", size = 11, weight = 640, antialias = false, outline = true})
surface.CreateFont("MainFont3", {font = "Tahoma", size = 13, weight = 800, antialias = false, outline = true})
surface.CreateFont("MiscFont", {font = "Tahoma", size = 12, weight = 900, antialias = false, outline = true})
surface.CreateFont("MiscFont2", {font = "Tahoma", size = 12, weight = 900, antialias = false, outline = false})
surface.CreateFont("MiscFont3", {font = "Tahoma", size = 13, weight = 674, antialias = false, outline = true})

chamsmat1 = CreateMaterial("normalmat1", "VertexLitGeneric", {["$ignorez"] = 1, ["$basetexture"] = "models/debug/debugwhite", })
chamsmat2 = CreateMaterial("normalmat2", "VertexLitGeneric", {["$ignorez"] = 0, ["$basetexture"] = "models/debug/debugwhite", })
chamsmat3 = CreateMaterial("flatmat1", "UnLitGeneric", {["$ignorez"] = 1, ["$basetexture"] = "models/debug/debugwhite", })
chamsmat4 = CreateMaterial("flatmat2", "UnLitGeneric", {["$ignorez"] = 0, ["$basetexture"] = "models/debug/debugwhite", })
chamsmat5 = CreateMaterial("wiremat1", "UnLitGeneric", {["$ignorez"] = 1, ["$wireframe"] = 1, })
chamsmat6 = CreateMaterial("wiremat2", "UnLitGeneric", {["$ignorez"] = 0, ["$wireframe"] = 1, })

creator = creator or {}
contributors = contributors or {}

creator["STEAM_0:0:63644275"] = {} -- me
creator["STEAM_0:0:162667998"] = {} -- my alt
contributors["STEAM_0:0:196578290"] = {} -- pinged (code dev, likely the most important one, helped me out with optimization and many others)
contributors["STEAM_0:1:126050820"] = {} -- papertek (dev & discord manager)
contributors["STEAM_0:1:193781969"] = {} -- paradox (code dev)
contributors["STEAM_0:0:109145007"] = {} -- scottpott (code dev)
contributors["STEAM_0:0:205376238"] = {} -- vectivus (code dev)
contributors["STEAM_0:1:188710062"] = {} -- uucka (code tester)
contributors["STEAM_0:1:191270548"] = {} -- cal1nxd (code tester)
contributors["STEAM_0:1:404757"] = {} -- xvcaligo (code tester)
contributors["STEAM_0:1:69536635"] = {} -- tryhard (code tester)
contributors["STEAM_0:0:150101893"] = {} -- derpos (code tester)
contributors["STEAM_0:1:75441355"] = {} -- zergo (code tester)
contributors["STEAM_0:0:453611223"] = {} -- naxut (code tester & advertiser and really good friend)
contributors["STEAM_0:1:4375194"] = {} -- ohhstyle (advertiser)
contributors["STEAM_0:1:59798110"] = {} -- mrsquid (advertiser)
contributors["STEAM_0:1:101813068"] = {} -- sdunken (first user)

--NOTE-- I want to mention that these are not the only people that helped me with the development of IdiotBox, but they are the ones who helped me the most and that is why they are credited here.

local options = {
		["Main Menu"] = {
				{
					{"General Utilities", 16, 20, 232, 144, 218}, 
					{"Optimize Game", "Checkbox", false, 78}, 
					{"Spectator Mode", "Checkbox", false, 78}, 
					{"Anti-AFK", "Checkbox", false, 78}, 
					{"Anti-Ads", "Checkbox", false, 78}, 
					{"Anti-Blind", "Checkbox", false, 78}, 
                }, 
				{
					{"Trouble in Terrorist Town Utilities", 16, 178, 232, 222, 218}, 
					{"Hide Round Report", "Checkbox", false, 78}, 
					{"Panel Remover", "Checkbox", false, 78}, 
					{"Traitor Finder", "Checkbox", false, 78}, 
					{"Ignore Detectives as Innocent", "Checkbox", false, 78}, 
					{"Ignore Fellow Traitors", "Checkbox", false, 78}, 
					{"Prop Kill", "Checkbox", false, 78}, 
					{"Prop Kill Key:", "Toggle", 0, 92, 0}, 
				}, 
				{
					{"DarkRP Utilities", 16, 415, 232, 128, 218}, 
					{"Suicide Near Arrest Batons", "Checkbox", false, 78}, 
					{"Transparent Props", "Checkbox", false, 78}, 
					{"Transparency:", "Slider", 175, 255, 92}, 
					{""}, 
				}, 
				{
					{"Murder Utilities", 16, 557, 232, 123, 218}, 
					{"Murderer Finder", "Checkbox", false, 78}, 
					{"Hide End Round Board", "Checkbox", false, 78}, 
					{"Hide Footprints", "Checkbox", false, 78}, 
					{"No Black Screens", "Checkbox", false, 78}, 
				}, 
				{
          			{"Menus", 261, 20, 232, 175, 218}, 
					{"Entity Finder Menu", "Button", "", 92}, 
					{"Plugin Loader Menu", "Button", "", 92}, 
					{"Menu Style:", "Selection", "Borders", {"Borders", "Borderless"}, 92}, 
					{""}, 
					{"Options Style:", "Selection", "Borderless", {"Borders", "Borderless"}, 92}, 
					{""}, 
          		}, 
				{
          			{"Configurations", 261, 209, 232, 175, 218}, 
					{"Automatically Save", "Checkbox", false, 78}, 
					{"Save Configuration", "Button", "", 92}, 
					{"Load Configuration", "Button", "", 92}, 
					{"Delete Configuration", "Button", "", 92}, 
					{"Configuration:", "Selection", "Config #1", {"Config #1", "Config #2", "Config #3", "Config #4", "Config #5", "Config #6", "Config #7", "Config #8", "Config #9", "Config #10"}, 92}, 
					{""}, 
          		}, 
				{
          			{"Others", 261, 399, 232, 130, 218}, 
					{"Apply custom name", "Checkbox", false, 78}, 
					{"Feature Tooltips", "Checkbox", true, 78}, -- Enabled by default
					{"Print Changelog", "Button", "", 92}, 
					{"Unload Cheat", "Button", "", 92}, 
          		}, 
				{
					{"Priority List", 506, 20, 232, 205, 218}, 
					{"Enabled", "Checkbox", true, 78}, -- Enabled by default
					{"List Position X:", "Slider", 1356, 2000, 92}, 
					{""}, 
					{"List Position Y:", "Slider", 134, 2000, 92}, 
					{""}, 
					{"List Spacing:", "Slider", 0, 10, 92}, 
					{""}, 
                }, 
				{
					{"Panic Mode", 506, 240, 232, 100, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Mode:", "Selection", "Disable All", {"Disable Aimbot", "Disable Anti-Aim", "Disable All"}, 92}, 
					{""}, 
                }, 
        }, 
        ["Aim Assist"] = {
				{
					{"Aimbot", 16, 20, 232, 345, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Toggle Key:", "Toggle", 0, 92, 0}, 
					{""}, 
					{"Aim FoV Value:", "Slider", 0, 180, 92}, 
					{""}, 
					{"Aim Smoothness:", "Slider", 0, 50, 92}, 
					{""}, 
					{"Silent Aim", "Checkbox", false, 78}, 
					{"Auto Fire", "Checkbox", false, 78}, 
					{"Auto Zoom", "Checkbox", false, 78}, 
					{"Auto Stop", "Checkbox", false, 78}, 
					{"Auto Crouch", "Checkbox", false, 78}, 
					{"Target Lock", "Checkbox", false, 78}, 
                }, 
				{
					{"Triggerbot", 16, 380, 232, 200, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Toggle Key:", "Toggle", 0, 92, 0}, 
					{""}, 
					{"Smooth Aim", "Checkbox", false, 78}, 
					{"Auto Zoom", "Checkbox", false, 78}, 
					{"Auto Stop", "Checkbox", false, 78}, 
					{"Auto Crouch", "Checkbox", false, 78}, 
                }, 
				{
					{"Aim Priorities", 261, 20, 232, 708, 218}, 
					{"Priority Targets Only", "Checkbox", false, 78}, 
					{"Disable in Noclip", "Checkbox", false, 78}, 
					{"Hitbox:", "Selection", "Head", {"Head", "Body"}, 92}, 
					{""}, 
					{"Aim Priority:", "Selection", "Crosshair", {"Crosshair", "Distance", "Health", "Random"}, 92}, 
					{""}, 
					{"Target Players", "Checkbox", true, 78}, -- Enabled by default
					{"Target Bots", "Checkbox", true, 78}, -- Enabled by default
					{"Target NPCs", "Checkbox", true, 78}, -- Enabled by default
					{"Target Team", "Checkbox", true, 78}, -- Enabled by default
					{"Target Enemies", "Checkbox", true, 78}, -- Enabled by default
					{"Target Steam Friends", "Checkbox", false, 78}, 
					{"Target Admins", "Checkbox", false, 78}, 
					{"Target Spectators", "Checkbox", false, 78}, 
					{"Target Frozen Players", "Checkbox", false, 78}, 
					{"Target Noclipping Players", "Checkbox", false, 78}, 
					{"Target Driving Players", "Checkbox", false, 78}, 
					{"Target Transparent Players", "Checkbox", false, 78}, 
					{"Target Overhealed Players", "Checkbox", false, 78}, 
					{"Max Player Health:", "Slider", 500, 5000, 92}, 
					{""}, 
					{"Distance Limit", "Checkbox", false, 78}, 
					{"Distance:", "Slider", 1500, 5000, 92}, 
					{""}, 
					{"Velocity Limit", "Checkbox", false, 78}, 
					{"Velocity:", "Slider", 1000, 5000, 92}, 
					{""}, 
                }, 
				{
					{"Miscellaneous", 506, 20, 232, 330, 218}, 
					{"Remove Weapon Recoil", "Checkbox", false, 78}, 
					{"Remove Bullet Spread", "Checkbox", false, 78}, 
					{"Projectile Prediction", "Checkbox", false, 78}, 
					{"Auto Reload", "Checkbox", false, 78}, 
					{"Rapid Fire:", "Selection", "Off", {"Off", "Primary Fire", "Alt Fire"}, 92}, 
					{""}, 
					{"Line-of-Sight Check:", "Selection", "Default", {"Off", "Default", "Auto Wallbang"}, 92}, -- Enabled by default
					{""}, 
					{"Manipulate Interpolation", "Checkbox", false, 78}, 
					{"Manipulate Bullet Time", "Checkbox", false, 78}, 
					{"Bullet Fire Delay:", "Slider", 0, 100, 92}, 
					{""}, 
                }, 
        }, 
		["Hack vs. Hack"] = {
				{
					{"Anti-Aim", 16, 20, 232, 605, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Disable in Noclip", "Checkbox", true, 78}, -- Enabled by default
					{"Disable in 'Use' Toggle", "Checkbox", true, 78}, -- Enabled by default
					{"Detect Walls", "Checkbox", false, 78}, 
					{"Lock View", "Checkbox", false, 78}, 
					{"Mode:", "Selection", "Default", {"Default", "Static", "Distance Adapt", "Crosshair Adapt"}, 92}, 
					{""}, 
					{"Pitch:", "Selection", "Off", {"Off", "Down", "Up", "Center", "Fake-Down", "Fake-Up", "Jitter", "Semi-Jitter Down", "Semi-Jitter Up", "Emotion", "Spinbot"}, 92}, 
					{""}, 
					{"Yaw:", "Selection", "Off", {"Off", "Forwards", "Backwards", "Sideways", "Fake-Forwards", "Fake-Backwards", "Fake-Sideways", "Jitter", "Backwards Jitter", "Sideways Jitter", "Semi-Jitter", "Back Semi-Jitter", "Side Semi-Jitter", "Side Switch", "Emotion", "Spinbot"}, 92}, 
					{""}, 
					{"Anti-Aim Direction:", "Selection", "Left", {"Left", "Right", "Manual Switch"}, 92}, 
					{""}, 
					{"Switch Key:", "Toggle", 0, 92, 0}, 
					{""}, 
					{"Spinbot Pitch Speed:", "Slider", 30, 180, 92}, 
					{""}, 
					{"Spinbot Yaw Speed:", "Slider", 30, 180, 92}, 
					{""}, 
					{"Emotion Pitch Speed:", "Slider", 18, 100, 92}, 
					{""}, 
					{"Emotion Yaw Speed:", "Slider", 18, 100, 92}, 
					{""}, 
                }, 
				{
					{"Resolver", 261, 20, 232, 200, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Priority Targets Only", "Checkbox", false, 78}, 
					{"Pitch:", "Selection", "Off", {"Off", "Down", "Up", "Center", "Invert", "Random", "Auto"}, 92}, 
					{""}, 
					{"Yaw:", "Selection", "Off", {"Off", "Left", "Right", "Invert", "Random", "Auto"}, 92}, 
					{""}, 
					{"Emote Resolver", "Checkbox", false, 78}, 
                }, 
				{
					{"Fake Lag", 506, 20, 232, 180, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Disable on Attack", "Checkbox", false, 78}, 
					{"Lag Choke:", "Slider", 14, 14, 92}, 
					{""}, 
					{"Lag Send:", "Slider", 0, 14, 92}, 
					{""}, 
                }, 
		}, 
        ["Visuals"] = {
                {
					{"Wallhack", 16, 20, 232, 650, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Visibility:", "Selection", "Global", {"Global", "Clientside"}, 92}, 
					{""}, 
					{"Box:", "Selection", "Off", {"Off", "2D Box", "3D Box", "Edged Box"}, 92}, 
					{""}, 
					{"Chams:", "Selection", "Off", {"Off", "Normal", "Flat", "Wireframe", "Playermodel"}, 92}, 
					{""}, 
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
                	{"Point of View", 261, 20, 232, 275, 218}, 
					{"Custom FoV", "Checkbox", false, 78}, 
					{"FoV Value:", "Slider", 110, 360, 92}, 
					{""}, 
					{"Thirdperson", "Checkbox", false, 78}, 
					{"Thirdperson Key:", "Toggle", 0, 92, 0}, 
					{""}, 
					{"Thirdperson Range:", "Slider", 15, 100, 92}, 
					{""}, 
					{"Thirdperson FoV Value:", "Slider", 110, 360, 92}, 
					{""}, 
                }, 
				{
					{"Textures", 261, 308, 232, 145, 218}, 
					{"Transparent Walls", "Checkbox", false, 78}, 
					{"Remove Sky", "Checkbox", false, 78}, 
					{"Remove 3D Skybox", "Checkbox", false, 78}, 
					{"Bright Mode", "Checkbox", false, 78}, 
					{"Dark Mode", "Checkbox", false, 78}, 
                }, 
				{
					{"Panels", 261, 467, 232, 250, 218}, 
					{"Spectators Box", "Checkbox", false, 78}, 
					{"Radar Box", "Checkbox", false, 78}, 
					{"Radar Distance:", "Slider", 50, 100, 92}, 
					{""}, 
					{"Custom Status", "Checkbox", false, 78}, 
					{"Players List", "Checkbox", false, 78}, 
					{"Show List Titles", "Checkbox", true, 78}, -- Enabled by default
					{"Panels Style:", "Selection", "Borders", {"Borders", "Borderless"}, 92}, 
					{""}, 
                }, 
                {
					{"Miscellaneous", 506, 20, 232, 730, 218}, 
					{"Priority Targets Only", "Checkbox", false, 78}, 
					{"Hide Ignored Targets", "Checkbox", false, 78}, 
					{"Target Priority Colors", "Checkbox", true, 78}, -- Enabled by default
					{"Show Enemies Only", "Checkbox", false, 78}, 
					{"Show Spectators", "Checkbox", false, 78}, 
					{"Team Colors", "Checkbox", false, 78}, 
					{"Show NPCs", "Checkbox", false, 78}, 
					{"NPC Name", "Checkbox", false, 78}, 
					{"NPC Box", "Checkbox", false, 78}, 
					{"NPC Health", "Checkbox", false, 78}, 
					{"NPC Chams:", "Selection", "Off", {"Off", "Normal", "Flat", "Wireframe", "Model"}, 92}, 
					{""}, 
					{"Show Entities", "Checkbox", false, 78}, 
					{"Entity Name", "Checkbox", false, 78}, 
					{"Entity Box", "Checkbox", false, 78}, 
					{"Entity Chams:", "Selection", "Off", {"Off", "Normal", "Flat", "Wireframe", "Model"}, 92}, 
					{""}, 
					{"Hide HUD", "Checkbox", false, 78}, 
					{"Witness Finder", "Checkbox", false, 78}, 
					{"Dormant Check:", "Selection", "All", {"None", "Players", "Entities", "All"}, 92}, 
					{""}, 
					{"Show FoV Circle", "Checkbox", false, 78}, 
					{"Snap Lines", "Checkbox", false, 78}, 
					{"Crosshair:", "Selection", "Off", {"Off", "Box", "Dot", "Square", "Circle", "Cross", "Edged Cross", "Swastika", "GTA IV"}, 92}, 
					{""}, 
					{"Distance Limit", "Checkbox", false, 78}, 
					{"Distance:", "Slider", 1500, 5000, 92}, 
					{""}, 
                }, 
        }, 
		["Miscellaneous"] = {
				{
					{"Miscellaneous", 16, 20, 232, 220, 218}, 
					{"Flash Spam", "Checkbox", false, 78}, 
					{"Use Spam", "Checkbox", false, 78}, 
					{"Name Stealer:", "Selection", "Off", {"Off", "Normal", "Priority Targets", "DarkRP Name"}, 92}, 
					{""}, 
					{"Emotes:", "Selection", "Off", {"Off", "Dance", "Sexy", "Wave", "Robot", "Bow", "Cheer", "Laugh", "Zombie", "Agree", "Disagree", "Forward", "Back", "Salute", "Pose", "Halt", "Group", "Random"}, 92}, 
					{""}, 
					{"Murder Taunts:", "Selection", "Off", {"Off", "Funny", "Help", "Scream", "Morose", "Random"}, 92}, 
					{""}, 
                }, 
				{
					{"Viewmodel", 16, 253, 232, 476, 218}, 
					{"Viewmodel Chams:", "Selection", "Off", {"Off", "Normal", "Flat", "Wireframe"}, 92}, 
					{""}, 
					{"Rainbow Mode", "Checkbox", false, 78}, 
					{"No Viewmodel", "Checkbox", false, 78}, 
					{"No Hands", "Checkbox", false, 78}, 
					{"Custom Positions", "Checkbox", false, 78}, 
					{"Viewmodel X:", "Slider", 50, 100, 92}, 
					{""}, 
					{"Viewmodel Y:", "Slider", 30, 60, 92}, 
					{""}, 
					{"Viewmodel Z:", "Slider", 20, 40, 92}, 
					{""}, 
					{"Viewmodel Pitch:", "Slider", 90, 180, 92}, 
					{""}, 
					{"Viewmodel Yaw:", "Slider", 90, 180, 92}, 
					{""}, 
					{"Viewmodel Roll:", "Slider", 90, 180, 92}, 
					{""}, 
                }, 
				{
					{"Movement", 261, 20, 232, 270, 218}, 
					{"Bunny Hop", "Checkbox", false, 78}, 
					{"Auto Strafe:", "Selection", "Off", {"Off", "Legit", "Rage", "Directional"}, 92}, -- Directional strafing is a 'work-in-progress' feature
					{""}, 
					{"Circle Strafe", "Checkbox", false, 78}, 
					{"Circle Strafe Key:", "Toggle", 0, 92, 0}, 
					{""}, 
					{"Circle Strafe Speed:", "Slider", 2, 6, 92}, 
					{""}, 
					{"Air Crouch", "Checkbox", false, 78}, 
					{"Fake Crouch", "Checkbox", false, 78}, 
                }, 
				{
					{"Free Roaming", 261, 304, 232, 205, 218}, 
					{"Enabled", "Checkbox", false, 78}, 
					{"Toggle Key:", "Toggle", 0, 92, 0}, 
					{""}, 
					{"Speed:", "Slider", 30, 100, 92}, 
					{""}, 
					{"FoV Value:", "Slider", 110, 360, 92}, 
					{""}, 
                }, 
				{
                	{"Chat", 506, 20, 232, 220, 218}, 
					{"Log Kills in Chat", "Checkbox", false, 78}, 
					{"Priority Targets Only", "Checkbox", false, 78}, 
					{"Chat Spam:", "Selection", "Off", {"Off", "Advertising 1", "Advertising 2", "Advertising 3", "Nazi 1", "Nazi 2", "Nazi 3", "Arabic Spam", "Hebrew Spam", "Offensive Spam", "Insult Spam", "Message Spam", "N-Word Spam", "N-WORD SPAM", "'H' Spam", "Clear Chat", "OOC Clear Chat"}, 92}, 
					{""}, 
					{"Kill Spam:", "Selection", "Off", {"Off", "Normal", "Insult", "Salty", "HvH", "IdiotBox HvH", "Votekick", "Voteban", "Killstreak", }, 92}, 
					{""}, 
					{"Reply Spam:", "Selection", "Off", {"Off", "shut up", "ok", "who", "nobody cares", "where", "stop spamming", "what", "yea", "lol", "english please", "lmao", "shit", "fuck", "Random", "Disconnect Spam", "Cheater Callout", "Copy Messages"}, 92}, 
					{""}, 
                }, 
				{
					{"Sounds", 506, 254, 232, 195, 218}, 
					{"Hitsounds:", "Selection", "Off", {"Off", "Default", "Headshot 1", "Headshot 2", "Metal", "Blip", "Eggcrack", "Balloon Pop"}, 92}, 
					{""}, 
					{"Killsounds:", "Selection", "Off", {"Off", "Default", "Headshot 1", "Headshot 2", "Metal", "Blip", "Eggcrack", "Balloon Pop"}, 92}, 
					{""}, 
					{"Music Player:", "Selection", "Off", {"Off", "Rust", "Resonance", "Daisuke", "A Burning M...", "Libet's Delay", "Lullaby Of T...", "Erectin' a River", "Fleeting Love", "Malo Tebya", "Vermilion", "Gravity", "Remorse", "Hold", "Green Valleys", "FP3", "Random"}, 92}, 
					{""}, 
					{"Reset Sounds", "Checkbox", false, 78}, 
                }, 
        }, 
		["Adjustments"] = {
				{
          			{"Main Text Color", 16, 20, 232, 105, 88}, 
          			{"Red:", "SliderOld", 0, 255, 92}, 
					{"Green:", "SliderOld", 205, 255, 92}, 
					{"Blue:", "SliderOld", 255, 255, 92}, 
          		}, 
				{
					{"Menu Text Color", 16, 140, 232, 105, 88}, 
					{"Red:", "SliderOld", 255, 255, 92}, 
					{"Green:", "SliderOld", 255, 255, 92}, 
					{"Blue:", "SliderOld", 255, 255, 92}, 
				}, 
				{
          			{"Background Menu Color", 16, 260, 232, 105, 88}, 
          			{"Red:", "SliderOld", 30, 255, 92}, 
					{"Green:", "SliderOld", 30, 255, 92}, 
					{"Blue:", "SliderOld", 45, 255, 92}, 
          		}, 
				{
					{"Border Color", 16, 380, 232, 105, 88}, 
					{"Red:", "SliderOld", 0, 255, 92}, 
					{"Green:", "SliderOld", 155, 255, 92}, 
					{"Blue:", "SliderOld", 255, 255, 92}, 
                }, 
				{
					{"Viewmodel Color", 16, 500, 232, 105, 88}, 
					{"Red:", "SliderOld", 0, 255, 92}, 
					{"Green:", "SliderOld", 235, 255, 92}, 
					{"Blue:", "SliderOld", 255, 255, 92}, 
                }, 
				{
					{"Crosshair Color", 16, 620, 232, 105, 88}, 
					{"Red:", "SliderOld", 0, 255, 92}, 
					{"Green:", "SliderOld", 235, 255, 92}, 
					{"Blue:", "SliderOld", 255, 255, 92}, 
                }, 
				{
					{"Team Visuals Color", 261, 20, 232, 105, 88}, 
					{"Red:", "SliderOld", 255, 255, 92}, 
					{"Green:", "SliderOld", 255, 255, 92}, 
					{"Blue:", "SliderOld", 0, 255, 92}, 
                }, 
				{
					{"Enemy Visuals Color", 261, 140, 232, 105, 88}, 
					{"Red:", "SliderOld", 255, 255, 92}, 
					{"Green:", "SliderOld", 125, 255, 92}, 
					{"Blue:", "SliderOld", 255, 255, 92}, 
                }, 
				{
					{"Priority Targets Color", 261, 260, 232, 105, 88}, 
					{"Red:", "SliderOld", 255, 255, 92}, 
					{"Green:", "SliderOld", 0, 255, 92}, 
					{"Blue:", "SliderOld", 100, 255, 92}, 
                }, 
				{
					{"Ignored Targets Color", 261, 380, 232, 105, 88}, 
					{"Red:", "SliderOld", 175, 255, 92}, 
					{"Green:", "SliderOld", 175, 255, 92}, 
					{"Blue:", "SliderOld", 175, 255, 92}, 
                }, 
				{
					{"Others", 261, 500, 232, 157, 88}, 
					{"T Opacity:", "SliderOld", 255, 255, 92}, 
					{"B Opacity:", "SliderOld", 255, 255, 92}, 
					{"BG Opacity:", "SliderOld", 255, 255, 92}, 
					{"BG Darkness:", "SliderOld", 22, 25, 92}, 
					{"Roundness:", "SliderOld", 50, 67, 92}, 
                }, 
				{
					{"Misc Visuals Color", 506, 20, 232, 105, 88}, 
					{"Red:", "SliderOld", 0, 255, 92}, 
					{"Green:", "SliderOld", 255, 255, 92}, 
					{"Blue:", "SliderOld", 255, 255, 92}, 
                }, 
				{
					{"Team Chams Color", 506, 140, 232, 105, 88}, 
					{"Red:", "SliderOld", 255, 255, 92}, 
					{"Green:", "SliderOld", 215, 255, 92}, 
					{"Blue:", "SliderOld", 0, 255, 92}, 
                }, 
				{
					{"Enemy Chams Color", 506, 260, 232, 105, 88}, 
					{"Red:", "SliderOld", 255, 255, 92}, 
					{"Green:", "SliderOld", 70, 255, 92}, 
					{"Blue:", "SliderOld", 255, 255, 92}, 
                }, 
				{
					{"Window Adjustments", 506, 380, 232, 180, 88}, 
					{"Spectators X:", "SliderOld", 12, 2000, 92}, 
					{"Spectators Y:", "SliderOld", 12, 2000, 92}, 
					{"Radar X:", "SliderOld", 225, 2000, 92}, 
					{"Radar Y:", "SliderOld", 12, 2000, 92}, 
					{"Window Opacity:", "SliderOld", 255, 255, 92}, 
					{"Roundness:", "SliderOld", 16, 42, 92}, 
                }, 
				{
					{"List Adjustments", 506, 576, 232, 180, 88}, 
					{"Custom Status X:", "SliderOld", 17, 2000, 92}, 
					{"Custom Status Y:", "SliderOld", 250, 2000, 92}, 
					{"Players List X:", "SliderOld", 17, 2000, 92}, 
					{"Players List Y:", "SliderOld", 430, 2000, 92}, 
					{"List Opacity:", "SliderOld", 255, 255, 92}, 
					{"Roundness:", "SliderOld", 8, 10, 92}, 
                }, 
        }, 
}

local order = {
	"Main Menu", 
	"Aim Assist", 
	"Hack vs. Hack", 
	"Visuals", 
	"Miscellaneous", 
	"Adjustments", 
}

local function gBool(men, sub, lookup)
	if not options[men] then return end
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
	if not options[men] then return "" end
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
	if not options[men] then return 0 end
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
    if not options[men] or me:IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible() or (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then return end
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

do
	if (idiot.game.SinglePlayer()) then
		MsgR(4.3, "Attention! Not going to load in Singleplayer Mode!") 
		surface.PlaySound("buttons/lightswitch2.wav")
		return
	end
	if not file.Exists("lua/bin/gmcl_bsendpacket_win32.dll", "MOD") or not file.Exists("lua/bin/gmcl_fhook_win32.dll", "MOD") or not file.Exists("lua/bin/gmcl_ChatClear_win32.dll", "MOD") or not file.Exists("lua/bin/gmcl_dickwrap_win32.dll", "MOD") or not file.Exists("lua/bin/gmcl_big_win32.dll", "MOD") then
			MsgR(4.3, "Please download the modules before using IdiotBox.")
			surface.PlaySound("buttons/lightswitch2.wav")
			return
		end
	if ScrW() <= 769 or ScrH() <= 859 then
		MsgR(4.3, "The cheat menu has a resolution of 769x859. Please use a resolution larger than that!")
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

bSendPacket = true
unloaded = false

box.ChangeName = _fhook_changename
box.Predict = dickwrap.Predict

idiot.TickCount = 0

if not file.IsDir(folder, "DATA") then
	file.CreateDir(folder)
end

if file.Exists(folder.."/entities.txt", "DATA") then
	drawnents = util.JSONToTable(file.Read(folder.."/entities.txt", "DATA"))
		else
	drawnents = {"spawned_money", "spawned_shipment", "spawned_weapon", "money_printer", "weapon_ttt_knife", "weapon_ttt_c4", "npc_tripmine"}
end

if file.Exists(folder.."/priority.txt", "DATA") then
	prioritylist = util.JSONToTable(file.Read(folder.."/priority.txt", "DATA"))
		else
	file.Write(folder.."/priority.txt", "[]")
end
	
if file.Exists(folder.."/ignored.txt", "DATA") then
	ignorelist = util.JSONToTable(file.Read(folder.."/ignored.txt", "DATA"))
else
	file.Write(folder.."/ignored.txt", "[]")
end

function SaveConfig1()
	file.Write(folder.."/config1.txt", util.TableToJSON(options))
end

function SaveConfig2()
	file.Write(folder.."/config2.txt", util.TableToJSON(options))
end

function SaveConfig3()
	file.Write(folder.."/config3.txt", util.TableToJSON(options))
end

function SaveConfig4()
	file.Write(folder.."/config4.txt", util.TableToJSON(options))
end

function SaveConfig5()
	file.Write(folder.."/config5.txt", util.TableToJSON(options))
end

function SaveConfig6()
	file.Write(folder.."/config6.txt", util.TableToJSON(options))
end

function SaveConfig7()
	file.Write(folder.."/config7.txt", util.TableToJSON(options))
end

function SaveConfig8()
	file.Write(folder.."/config8.txt", util.TableToJSON(options))
end

function SaveConfig9()
	file.Write(folder.."/config9.txt", util.TableToJSON(options))
end

function SaveConfig10()
	file.Write(folder.."/config10.txt", util.TableToJSON(options))
end

function UpdateVar(men, sub, lookup, new)
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if (aaa[1][1] ~= sub) then continue end
				if (val[1] == lookup) then
				val[3] = new
			end
		end
	end
end

function LoadConfig1()
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

function LoadConfig2()
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

function LoadConfig3()
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

function LoadConfig4()
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

function LoadConfig5()
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

function LoadConfig6()
	if file.Exists(folder.."/config6.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config6.txt", "DATA"))
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

function LoadConfig7()
	if file.Exists(folder.."/config7.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config7.txt", "DATA"))
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

function LoadConfig8()
	if file.Exists(folder.."/config8.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config8.txt", "DATA"))
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

function LoadConfig9()
	if file.Exists(folder.."/config9.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config9.txt", "DATA"))
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

function LoadConfig10()
	if file.Exists(folder.."/config10.txt", "DATA") then
	local tab = util.JSONToTable(file.Read(folder.."/config10.txt", "DATA"))
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

for k, v in next, order do
	visible[v] = false
end

local function DrawUpperText(w, h)
	surface.SetFont("MenuFont")
	local tw, th = surface.GetTextSize("")
	surface.SetTextPos(37, 15 - th / 2)
	surface.SetTextColor(HSVToColor(RealTime() * 45 % 360, 1, 1))
	surface.SetFont("MainFont")
	surface.DrawText("IdiotBox v6.9.b4")
	surface.SetTextPos(147, 18 - th / 2)
	surface.SetTextColor(maintextcol.r, maintextcol.g - 50, maintextcol.b - 25, 175)
	surface.SetFont("MainFont2")
	surface.DrawText("Latest build: April 1st 2023")
	surface.SetFont("MenuFont")
	surface.DrawRect(0, 31, 0, h - 31)
	surface.DrawRect(0, h - 0, w, h)
	surface.DrawRect(w - 0, 31, 0, h)
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
			for i = 0, 1 do
				surface.SetDrawColor(curcol)
				surface.DrawLine(5 + maxx, 60 + i, 5 + maxx + sizeper, 60 + i)
			end
		elseif (bMouse) then
			local curcol = Color(bordercol.r, bordercol.g, bordercol.b, 100)
			for i = 0, 1 do
				surface.SetDrawColor(curcol)
				surface.DrawLine(5 + maxx, 60 + i, 5 + maxx + sizeper, 60 + i)
			end
		end
		if (bMouse and input.IsMouseDown(MOUSE_LEFT) and not mousedown and not visible[v]) then
			local nb = visible[v]
			for key, val in next, visible do
				visible[key] = false
			end
			visible[v] = not nb
		end
		surface.SetFont("MainFont3")
		surface.SetTextColor(maintextcol.r, maintextcol.g, maintextcol.b, 255)
		local tw, th = surface.GetTextSize(v)
		surface.SetTextPos(5 + maxx + sizeper / 2 - tw / 2, 31 + 15 - th / 2)
		surface.DrawText(v)
		maxx = maxx + sizeper
	end
end

local function DrawCheckbox(self, w, h, var, maxy, posx, posy, dist)
	local size = var[4]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetTextPos(25 + posx + 15 + 5, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(bgmenucol.r + 175, bgmenucol.g + 175, bgmenucol.b + 175, 55)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx - 193 + posx + dist, my + 61 + posy + maxy, mx - 193 + posx + dist + size - 65, my + 61 + posy + maxy + 16)
	if bMouse then
		surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:") - 155)
		surface.SetDrawColor(bgmenucol.r + 175, bgmenucol.g + 175, bgmenucol.b + 175, 180)
		if not input.IsMouseDown(MOUSE_LEFT) then
			surface.DrawRect(posx - 193 + dist + 2, 61 + posy + maxy + 2, 9, 9)
		end
		local feat = var[1]
		if feat == "Enabled" then -- The tooltips listed below may not be correctly ordered because of feature placement changes I'm constantly making - basically fucking up your configs B))))
			info = "Toggles this feature."
		elseif feat == "Optimize Game" then
			info = "Clears decals and other effects to improve framerate."
		elseif feat == "Spectator Mode" then
			info = "Enables all IdiotBox features while in spectator mode too. Useful only for Spectator Deathmatch."
		elseif feat == "Anti-AFK" then
			info = "Makes you move from left to right in order to avoid getting kicked for being inactive on certain servers."
		elseif feat == "Anti-Ads" then
			info = "Blocks ads from showing up."
		elseif feat == "Anti-Blind" then
			info = "Blocks ULX blinding."
		elseif feat == "Hide Round Report" then
			info = "Hides the report at the end of a round."
		elseif feat == "Panel Remover" then
			info = "Removes panels, such as RDM reports, by pressing the 'G' key."
		elseif feat == "Traitor Finder" then
			info = "Draws TTT traitor-specific weapons, and sends alerts whenever a player buys one."
		elseif feat == "Ignore Detectives as Innocent" then
			info = "Ignores detectives if you're innocent."
		elseif feat == "Ignore Fellow Traitors" then
			info = "Ignores your traitor teammates if you're a traitor."
		elseif feat == "Prop Kill" then
			info = "Allows you to prop kill with the Magneto-stick upon toggling the prop kill key."
		elseif feat == "Suicide Near Arrest Batons" then
			info = "Automatically die when nearing an arrest baton to avoid being jailed."
		elseif feat == "Transparent Props" then
			info = "Changes prop opacity in DarkRP."
		elseif feat == "Murderer Finder" then
			info = "Draws Murder weapons, and sends alerts about who the murderer is."
		elseif feat == "Hide End Round Board" then
			info = "Hides the board at the end of a round."
		elseif feat == "Hide Footprints" then
			info = "Makes the footprints invisible for you."
		elseif feat == "No Black Screens" then
			info = "Makes the screen not turn black at any given moment during a round."
		elseif feat == "Automatically Save" then
			info = "Saves your current configuration automatically."
		elseif feat == "Apply custom name" then
			info = "Changes your in-game name to a custom name of your choice. Use the 'idiot_changename' command, followed by your desired name."
		elseif feat == "Feature Tooltips" then
			info = "Detailed information about features will appear here, at the bottom of the menu."
		elseif feat == "Silent Aim" then
			info = "Makes the Aimbot invisible for you."
		elseif feat == "Auto Fire" then
			info = "Makes the Aimbot automatically shoot at your target for you."
		elseif feat == "Auto Zoom" then
			info = "Automatically scope/ zoom in with your weapon while targeting."
		elseif feat == "Auto Stop" then
			info = "Force-stops you from moving while targeting."
		elseif feat == "Auto Crouch" then
			info = "Force-crouches you while targeting."
		elseif feat == "Target Lock" then
			info = "Locks onto a specific target, until the target is no longer in your line of sight, or until it's eliminated."
		elseif feat == "Smooth Aim" then
			info = "Slows your mouse speed when triggering to improve accuracy."
		elseif feat == "Priority Targets Only" then
			info = "Players selected as priority targets will be the only ones targeted by this feature."
		elseif feat == "Disable in Noclip" then
			info = "Disables this feature when noclipping."
		elseif feat == "Target Players" then
			info = "Makes the Aim Assist target players."
		elseif feat == "Target Bots" then
			info = "Makes the Aim Assist target bots."
		elseif feat == "Target NPCs" then
			info = "Makes the Aim Assist target NPCs."
		elseif feat == "Target Team" then
			info = "Makes the Aim Assist target teammates."
		elseif feat == "Target Enemies" then
			info = "Makes the Aim Assist target enemies."
		elseif feat == "Target Steam Friends" then
			info = "Makes the Aim Assist target Steam friends."
		elseif feat == "Target Admins" then
			info = "Makes the Aim Assist target server admins."
		elseif feat == "Target Spectators" then
			info = "Makes the Aim Assist target spectators."
		elseif feat == "Target Frozen Players" then
			info = "Makes the Aim Assist target frozen players."
		elseif feat == "Target Noclipping Players" then
			info = "Makes the Aim Assist target noclipping players."
		elseif feat == "Target Driving Players" then
			info = "Makes the Aim Assist target driving players."
		elseif feat == "Target Transparent Players" then
			info = "Makes the Aim Assist target transparent or invisible players."
		elseif feat == "Target Overhealed Players" then
			info = "Makes the Aim Assist target overhealed players."
		elseif feat == "Distance Limit" then
			info = "Sets a specific rendering limit for this feature."
		elseif feat == "Velocity Limit" then
			info = "Sets a specific velocity limit to avoid lightning-fast players from being targeted."
		elseif feat == "Remove Weapon Recoil" then
			info = "Removes weapon recoil."
		elseif feat == "Remove Bullet Spread" then
			info = "Creates a laser-accurate bullet spread. Not compatible with all weapon bases yet."
		elseif feat == "Projectile Prediction" then
			info = "Aimbot calculates your and your target's speed and compensates for non-hitscan weapons."
		elseif feat == "Auto Reload" then
			info = "Automatically reloads your weapon after firing it."
		elseif feat == "Manipulate Interpolation" then
			info = "Lag exploit, could be used to your advantage. Do not use if unfamiliar."
		elseif feat == "Manipulate Bullet Time" then
			info = "Creates a tiny delay between each gunshot for better efficiency."
		elseif feat == "Disable in 'Use' Toggle" then
			info = "Disables your Anti-Aim when pressing the 'E' key."
		elseif feat == "Detect Walls" then
			info = "Changes your angles based on your position relative to the world."
		elseif feat == "Lock View" then
			info = "Finds optimal angle to cover your head with a different part of the body."
		elseif feat == "Emote Resolver" then
			info = "Instead of resolving another player's angles, it will make the Aimbot automatically shoot emoters in their torso."
		elseif feat == "Disable on Attack" then
			info = "Disables fake lagging when shooting to improve accuracy when using this feature."
		elseif feat == "Skeleton" then
			info = "Draws the player's bones."
		elseif feat == "Glow" then
			info = "Draws a glowing outline of the player."
		elseif feat == "Hitbox" then
			info = "Draws the player's hitbox."
		elseif feat == "Vision Line" then
			info = "Draws a line, indicating where the player is looking."
		elseif feat == "Name" then
			info = "Draws the player's name, along with the priority status."
		elseif feat == "Bystander Name" then
			info = "Draws the player's bystander name in Murder."
		elseif feat == "Health Bar" then
			info = "Draws a health bar to the left side of the player."
		elseif feat == "Health Value" then
			info = "Draws the player's health value in numbers."
		elseif feat == "Armor Bar" then
			info = "Draws an armor bar to the right side of the player."
		elseif feat == "Armor Value" then
			info = "Draws the player's armor value in numbers."
		elseif feat == "Weapon" then
			info = "Draws the weapon currently held by the player."
		elseif feat == "Rank" then
			info = "Draws the player's rank on the server."
		elseif feat == "Distance" then
			info = "Draws the player's distance value, relative to you."
		elseif feat == "Velocity" then
			info = "Draws the player's speed."
		elseif feat == "Conditions" then
			info = "Draws the player's current conditions, for example: sprinting, swimming, driving etc."
		elseif feat == "Steam ID" then
			info = "Draws the player's Steam ID. Bots will appear as 'BOT'."
		elseif feat == "Ping" then
			info = "Draws the player's ping."
		elseif feat == "DarkRP Money" then
			info = "Draws the player's money value in DarkRP."
		elseif feat == "Hide Ignored Targets" then
			info = "Makes ignored targets not show up on your Visuals."
		elseif feat == "Target Priority Colors" then
			info = "Changes the player's Wallhack color, based on their target priority."
		elseif feat == "Show Enemies Only" then
			info = "Only shows players that are not on your team."
		elseif feat == "Show Spectators" then
			info = "Shows players that are in spectator mode on your Visuals."
		elseif feat == "Team Colors" then
			info = "Visuals will draw with each player's assigned team color."
		elseif feat == "Spectators Box" then
			info = "Draws a spectator box, where you will be alerted if anyone is currently spectating you."
		elseif feat == "Radar Box" then
			info = "Draws a radar box."
		elseif feat == "Custom Status" then
			info = "Draws your ping, framerate, current date and time etc."
		elseif feat == "Players List" then
			info = "Draws a list of the players present on a server, along with their ranks."
		elseif feat == "Show List Titles" then
			info = "Shows the titles for both Custom Status and Players List."
		elseif feat == "Show NPCs" then
			info = "Shows NPCs on Visuals."
		elseif feat == "NPC Name" then
			info = "Draws the NPC's name."
		elseif feat == "NPC Box" then
			info = "Draws a 2D box around the NPC."
		elseif feat == "NPC Health" then
			info = "Draws a health bar to the left side of the NPC alongside their health value."
		elseif feat == "Show Entities" then
			info = "Draws the selected entities from the Entity Finder Menu."
		elseif feat == "Entity Name" then
			info = "Draws the names of the selected entities from the Entity Finder Menu."
		elseif feat == "Entity Box" then
			info = "Draws a 3D box around the selected entities from the Entity Finder Menu."
		elseif feat == "Hide HUD" then
			info = "Hides the original HUD, for example: health value, ammo value, crosshair etc."
		elseif feat == "Witness Finder" then
			info = "Shows how many people can currently see you."
		elseif feat == "Show FoV Circle" then
			info = "Draws an FoV circle for your Aimbot's FoV value."
		elseif feat == "Snap Lines" then
			info = "Draws a line towards the player currently being targeted by your Aimbot."
		elseif feat == "Flash Spam" then
			info = "Spams your flashlight, for fun."
		elseif feat == "Use Spam" then
			info = "Spams the 'use' command on interactive entities."
		elseif feat == "Reset Sounds" then
			info = "Clears all sounds that are currently playing on your server."
		elseif feat == "Transparent Walls" then
			info = "Makes the walls see-through."
		elseif feat == "Remove Sky" then
			info = "Makes the sky completely black."
		elseif feat == "Remove 3D Skybox" then
			info = "Removes the 3D skybox. May improve framerate."
		elseif feat == "Bright Mode" then
			info = "Creates uniform lighting throughout the whole map. Useful for dark maps."
		elseif feat == "Dark Mode" then
			info = "Gives the map a night-like aspect."
		elseif feat == "Custom FoV" then
			info = "Allows you to set a custom FoV, outside of the default boundaries."
		elseif feat == "Thirdperson" then
			info = "Allows you to toggle thirdperson."
		elseif feat == "Rainbow Mode" then
			info = "Makes your viewmodel's texture RGB."
		elseif feat == "No Viewmodel" then
			info = "Removes your entire viewmodel."
		elseif feat == "No Hands" then
			info = "Removes your viewmodel hands."
		elseif feat == "Custom Positions" then
			info = "Allows you to completely customize your viewmodel positions and angles."
		elseif feat == "Bunny Hop" then
			info = "Jump continuously when holding your jump key."
		elseif feat == "Circle Strafe" then
			info = "Strafe in circles to gain maximum velocity. Must be paired with Auto Strafe in order for it to work."
		elseif feat == "Air Crouch" then
			info = "Spam-crouches you when jumping."
		elseif feat == "Fake Crouch" then
			info = "Combines walking and spam-crouching."
		elseif feat == "Log Kills in Chat" then
			info = "Logs every kill in chat."
		end
	end
	surface.DrawText(var[1])
	surface.SetDrawColor(bgmenucol.r + 175, bgmenucol.g + 175, bgmenucol.b + 175, 55)
	surface.DrawRect(posx - 193 + dist + 2, 61 + posy + maxy + 2, 9, 9)
	if var[3] then
		surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 180)
		surface.DrawRect(posx - 193 + dist + 2, 61 + posy + maxy + 2, 9, 9)
		surface.SetDrawColor(bordercol.r + 20, bordercol.g + 20, bordercol.b + 20, 180)
		surface.DrawOutlinedRect(posx - 193 + dist + 2, 61 + posy + maxy + 2, 9, 9)
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
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetTextPos(posx - 193 + dist + 2, 61 + posy + maxy)
	surface.DrawText(var[1])
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawRect(posx - 193 + dist + 2, 81 + posy + maxy + 9, size, 2)
	local ww = math.ceil(curnum * size / max)
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawRect(posx - 195 + dist + 2 + ww, 81 + posy + maxy + 9 - 5, 4, 12)
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	local tw, th = surface.GetTextSize(curnum)
	surface.DrawOutlinedRect(posx - 195 + dist + 2 + ww, 81 + posy + maxy + 4, 4, 12)
	surface.SetFont("MenuFont2")
	surface.SetTextPos(posx - 193 + dist + 2 + (size / 2) - tw / 2, 81 + posy + maxy + 16)
	surface.DrawText(curnum)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(posx - 193 + dist + 2 + mx, 81 + posy + maxy + 9 - 5 + my, posx - 193 + dist + 2 + mx + size, 81 + posy + maxy + 9 - 5 + my + 12)
	if (bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !candoslider) then
		local mw, mh = gui.MousePos()
		local new = math.ceil(((mw - (mx + posx - 191 + dist - size)) - (size + 1)) / (size - 2) * max)
		var[3] = new
	end
end

function DrawOldSlider(self, w, h, var, maxy, posx, posy, dist) -- I fucking ran out of local variables (you have never seen such good optimization)
	local curnum = var[3]
	local max = var[4]
	local size = var[5]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetTextPos(5 + posx + 15 + 5, 61 + posy + maxy)
	surface.DrawText(var[1])
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawRect(5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 2)
	local ww = math.ceil(curnum * size / max)
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawRect(3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 9 - 5, 4, 12)
	surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	local tw, th = surface.GetTextSize(curnum)
	surface.DrawOutlinedRect(3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 4, 4, 12)
	surface.SetFont("MenuFont2")
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

local function DrawSelect(self, w, h, var, maxy, posx, posy, dist)
	local size = var[5]
	local curopt = var[3]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetTextPos(posx - 193 + dist + 2, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(var[1])
	surface.DrawText(var[1])
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + posx - 193 + dist + 2, my + 81 + posy + maxy, mx + posx - 193 + dist + 2 + size, my + 81 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy
	surface.SetFont("MenuFont2")
	surface.SetTextColor(menutextcol.r - 65, menutextcol.g - 65, menutextcol.b - 50, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 55)
	surface.DrawRect(posx - 193 + dist + 2, 81 + posy + maxy + 2, size - 3, 14)
	if (bMouse || notyetselected == check) then
		surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 180)
		surface.DrawRect(posx - 193 + dist + 2, 81 + posy + maxy + 2, size - 3, 14)
		local feat = var[1]
		if feat == "Menu Style:" then
			info = "Choose between having a plain or a bordered menu frame."
		elseif feat == "Options Style:" then
			info = "Choose between having a plain or a bordered options list."
		elseif feat == "Panels Style:" then
			info = "Choose between having plain or bordered panel frames."
		elseif feat == "Configuration:" then
			info = "Choose your desired configuration file, located in the game's data folder."
		elseif feat == "Mode:" then
			info = "Choose this feature's mode of functioning."
		elseif feat == "Hitbox:" then
			info = "Choose the desired body area your Aim Assist should be targeting."
		elseif feat == "Aim Priority:" then
			info = "Choose the desired target-scanning method."
		elseif feat == "Rapid Fire:" then
			info = "Maximizes semi-automatic weapon fire rates. Can be used with secondary ammunition."
		elseif feat == "Line-of-Sight Check:" then
			info = "Choose whether or not to target players that are behind solid objects, such as walls or props."
		elseif feat == "Pitch:" then
			info = "Modifies the player pitch (up/ down)."
		elseif feat == "Yaw:" then
			info = "Modifies the player yaw (left/ right)."
		elseif feat == "Anti-Aim Direction:" then
			info = "Choose the Anti-Aim yaw direction."
		elseif feat == "Visibility:" then
			info = "Choose whether or not to show yourself as well on Wallhack."
		elseif feat == "Box:" then
			info = "Draws different types of boxes around the player."
		elseif feat == "Chams:" then
			info = "Draws playermodels through walls, either as custom models or regular playermodels."
		elseif feat == "NPC Chams:" then
			info = "Draws the models of NPCs through walls, either as custom or regular models."
		elseif feat == "Entity Chams:" then
			info = "Draws the models of selected entities from the Entity Finder Menu through walls, either as custom or regular models."
		elseif feat == "Viewmodel Chams:" then
			info = "Replaces your viewmodel's default textures with a colored texture of your choice."
		elseif feat == "Dormant Check:" then
			info = "Choose whether or not to draw dormant entities."
		elseif feat == "Crosshair:" then
			info = "Replaces your default crosshair with a custom one."
		elseif feat == "Name Stealer:" then
			info = "Changes your in-game name to randomly selected names of players currently active on your server."
		elseif feat == "Emotes:" then
			info = "Makes your playermodel do a certain animation. You will not be able to move while doing this."
		elseif feat == "Murder Taunts:" then
			info = "Makes you 'scream' certain phrases in Murder."
		elseif feat == "Auto Strafe:" then
			info = "Allows you to gain speed and full directional control while bunny hopping."
		elseif feat == "Chat Spam:" then
			info = "Randomly spams certain phrases in chat. Select your desired spamming method."
		elseif feat == "Kill Spam:" then
			info = "Randomly spams certain phrases in chat, after killing a player. Select your desired spamming method."
		elseif feat == "Reply Spam:" then
			info = "Randomly spams certain phrases in chat, after a player sends a message. Select your desired spamming method."
		elseif feat == "Hitsounds:" then
			info = "Makes a certain noise after hitting a player."
		elseif feat == "Killsounds:" then
			info = "Makes a certain noise after killing a player."
		elseif feat == "Music Player:" then
			info = "Plays certain songs upon closing the menu frame."
		end
	end
	local tw, th = surface.GetTextSize(curopt)
	surface.SetTextPos(posx - 183 + dist + 2, 81 + posy + maxy + 6 - th / 2 + 2)
	surface.DrawText(curopt)
	if (bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !mousedown || notyetselected == check) then
		notyetselected = check
		drawlast = function()
			local maxy2 = 14
			for k, v in next, var[4] do
				surface.SetFont("MenuFont2")
				surface.SetTextColor(menutextcol.r - 65, menutextcol.g - 65, menutextcol.b - 50, gInt("Adjustments", "Others", "T Opacity:"))
				surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 222)
				surface.DrawRect(posx - 191 + dist, 81 + posy + maxy + maxy2, size - 3, 14)
				local bMouse2 = MouseInArea(mx + posx - 193 + dist + 2, my + 81 + posy + maxy + maxy2, mx + posx - 193 + dist + 2 + size, my + 81 + posy + maxy + 16 + maxy2)
				if (bMouse2) then
					surface.SetDrawColor(bgmenucol.r + 175, bgmenucol.g + 175, bgmenucol.b + 175, 244)
					surface.DrawRect(posx - 191 + dist, 81 + posy + maxy + maxy2, size - 3, 14)
				end
				if (bMouse2 && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
					var[3] = v
					notyetselected = nil
					drawlast = nil
					return
				end
				local tw, th = surface.GetTextSize(v)
				surface.SetTextPos(posx - 183 + dist + 2, 81 + posy + maxy + 6 - th / 2 + 2 + maxy2)
				surface.DrawText(v)
				maxy2 = maxy2 + 14
			end
			local bbMouse = MouseInArea(mx + posx - 193 + dist + 2, my + 81 + posy + maxy, mx + posx - 193 + dist + 2 + size, my + 81 + posy + maxy + maxy2)
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
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetTextPos(posx - 193 + dist + 2, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(text)
	surface.DrawText(var[1])
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + posx - 193 + dist + 2, my + 81 + posy + maxy, mx + posx - 193 + dist + 2 + size, my + 81 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy
	surface.SetFont("MenuFont2")
	surface.SetTextColor(menutextcol.r - 65, menutextcol.g - 65, menutextcol.b - 50, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 55)
	surface.DrawRect(posx - 193 + dist + 2, 81 + posy + maxy + 2, size - 3, 14)
	if bMouse or notyetselected == check then
		surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 180)
		surface.DrawRect(posx - 193 + dist + 2, 81 + posy + maxy + 2, size - 3, 14)
		local feat = var[1]
		if feat == "Prop Kill Key:" then
			info = "Toggle Prop Kill by holding down your desired key."
		elseif feat == "Toggle Key:" then
			info = "Toggle this feature by holding down your desired key."
		elseif feat == "Switch Key:" then
			info = "Switch between Anti-Aim yaw directions by pressing your desired key."
		elseif feat == "Thirdperson Key:" then
			info = "Switch between firstperson and thirdperson by pressing your desired key."
		elseif feat == "Circle Strafe Key:" then
			info = "Toggle Circle Strafe by holding down your desired key."
		end
	end
      	if bMouse then
        	if input.IsMouseDown(MOUSE_LEFT) && !drawlast && !mousedown && var[5] ~= 2 || notyetselected == check then
               surface.SetDrawColor(menutextcol.r, menutextcol.g, menutextcol.b, 150)
               surface.DrawRect(posx - 193 + dist + 2, 81 + posy + maxy + 2, var[4] - 3, 14)
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
		surface.SetTextPos(posx - 183 + dist + 2, 81 + posy + maxy + 6 - th / 2 + 2)
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
	hook.Remove("RenderScene", "RenderScene")
	hook.Remove("ShutDown", "ShutDown")
	hook.Remove("PostDrawViewModel", "PostDrawViewModel")
	hook.Remove("PreDrawEffects", "PreDrawEffects")
	hook.Remove("HUDShouldDraw", "HUDShouldDraw")
	hook.Remove("Think", "Think")
	hook.Remove("CalcViewModelView", "CalcViewModelView")
	hook.Remove("PreDrawSkyBox", "PreDrawSkyBox")
	hook.Remove("PreDrawViewModel", "PreDrawViewModel")
	hook.Remove("PreDrawPlayerHands", "PreDrawPlayerHands")
	hook.Remove("RenderScreenspaceEffects", "RenderScreenspaceEffects")
	hook.Remove("DrawOverlay", "DrawOverlay")
	hook.Remove("player_hurt", "player_hurt")
	hook.Remove("entity_killed", "entity_killed")
	hook.Remove("Move", "Move")
	hook.Remove("CalcView", "CalcView")
	hook.Remove("AdjustMouseSensitivity", "AdjustMouseSensitivity")
	hook.Remove("ShouldDrawLocalPlayer", "ShouldDrawLocalPlayer")
	hook.Remove("CreateMove", "CreateMove")
	hook.Remove("player_disconnect", "player_disconnect")
	hook.Remove("HUDPaint2", "HUDPaint2")
	hook.Remove("PreDrawOpaqueRenderables", "PreDrawOpaqueRenderables")
	hook.Remove("OnPlayerChat", "OnPlayerChat")
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
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #6" then
				SaveConfig6()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #7" then
				SaveConfig7()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #8" then
				SaveConfig8()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #9" then
				SaveConfig9()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #10" then
				SaveConfig10()
			end
		end
	me:ConCommand("M9KGasEffect 1 cl_interp 0 cl_interp_ratio 2 cl_updaterate 30")
	bSendPacket = true
	idiot.Loaded = false
	timer.Create("ChatPrint", 0.1, 1, function() MsgG(2.5, "Successfully unloaded the cheat.") end)
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
end

function Changelog() -- Ran out of local variables, again
	print("===========================================================\n\n")
	print("IdiotBox v6.9.b4 bugfixes (in no particular order)")
	print("")
	print("Total bugfix count: ~50 bugs have been found and fixed in the v6.9.b4 update;")
	print("\n")
	print("- The 'readme.txt' file is finally up-to-date and only contains the important information;")
	print("- Aim Smoothness will automatically disable itself if Silent aim is turned on;")
	print("- Merged Ragebot and Legitbot into a single function;")
	print("- Cheat menu/ game menus will no longer be covered by Visuals/ windows/ lists and others;")
	print("- Show Entities and Show NPCs can only be used if Visuals is turned on;")
	print("- Added missing space between the Custom Status rank and username;")
	print("- Fixed dimensions of the Armor Bar not matching the dimensions of the Health Bar;")
	print("- Fixed Bunny Hop breaking the movement when in water;")
	print("- Fixed Entities not using the correct Visuals color;")
	print("- Fixed entity list not showing props and being too cluttered;")
	print("- Fixed Fake Lag Send not showing up;")
	print("- Fixed menu border bug, where if you clicked the border, the entire menu would turn blue;")
	print("- Fixed buttons spamming the 'click' sound when holding them down;")
	print("- Fixed Reply Spam and Copy Messages not ignoring friends;")
	print("- Fixed being unable to fly WAC planes and rotate props or camera angles;")
	print("- Fixed Kill Spam giving script errors when an NPC was killed;")
	print("- Fixed Feature Tooltips not working with every feature;")
	print("- Fixed Entities Menu bug breaking the menu after closing it;")
	print("- Fixed Chat Spam and Kill Spam still using IdiotBox Alpha variables;")
	print("- Fixed 3D Box and Hitbox rendering issues;")
	print("- Fixed extreme bug where the anti-screengrabber would make you run out of VRAM and crash your system;")
	print("- Fixed Bunny Hop and Auto Strafe breaking Free Roaming and breaking player movement when in water;")
	print("- Fixed Hitbox spamming the console with error messages;")
	print("- Fixed Snap Lines still showing when Aimbot is not enabled;")
	print("- Fixed toggle keys activating when browsing game menus/ typing;")
	print("- Fixed Bullet Fire Delay, Anti-Ads, Hide Round Report and Panel Remover not working correctly;")
	print("- Fixed Aimbot and Triggerbot targeting spawning players;")
	print("- Fixed misplaced tab selection lines;")
	print("- Fixed poorly placed checkboxes/ sliders/ selections;")
	print("- Fixed Anti-Aim Resolver continuing to resolve angles when set to 'Off';")
	print("- Fixed Thirdperson showing in spectator mode;")
	print("- Fixed FoV Circle not showing upon enabling;")
	print("- Fixed skybox changing upon initializing the script;")
	print("- Fixed Anti-Aim breaking the Radar view angles;")
	print("- Fixed Circle Strafe spaghetti code not functioning the way it should;")
	print("- Fixed Free Roaming not working with Anti-Aim;")
	print("- Fixed Visuals causing severe lag;")
	print("- Fixed Cheater Callout clearing chat when it should not;")
	print("- Fixed Thirdperson, Custom FoV and Free Roaming functioning improperly when the user is dead;")
	print("- Fixed Prop Kill giving script errors when toggled;")
	print("- Fixed Anti-Aim Yaw Jitter, Semi-Jitter Down and Semi-Jitter Up breaking the Anti-Aim Pitch;")
	print("- Fixed Triggerbot Smooth Aim slowing down your overall mouse speed;")
	print("- Fixed certain outlines and fonts not having the proper dimensions;")
	print("- Fixed the menu not being large enough for certain outlines;")
	print("- Fixed a Projectile Prediction bug where dying would cause script errors;")
	print("- Fixed Manipulate Interpolation, Optimize Game and Dark Mode not resetting when disabled;")
	print("- Fixed local variable limit and timer issues;")
	print("- Reworked localizations and overall script for better performance;")
	print("- Reworked user visibility of IdiotBox developers on servers;")
	print("- Reorganized certain out-of-place functions and menu options;")
	print("- Reorganized the developer list;")
	print("- Renamed certain misspelled or broken functions and menu options;")
	print("- Renamed hooks for better anticheat protection;")
	print("- Removed calls and variables that had no use;")
	print("- Removed unusable DarkRP names from the Name Changer;")
	print("- Removed cloned hooks and combined them all into one for better performance;")
	print("- Removed old and unused Fake Lag functions;")
	print("- Removed old and unused message pop-up function;")
	print("- Removed 'aaa' module as 'IdiotBox_alpha1.lua' was replaced by 'IdiotBox_dev.lua' and had no use.")
	print("\n")
	print("IdiotBox v6.9.b4 new features (in no particular order)")
	print("")
	print("Total feature count: ~50 features have been added in the v6.9.b4 update;")
	print("\n")
	print("- Added 'Projectile Prediction' and 'Line-of-Sight Check' to Aimbot;")
	print("- Added 'Emote Resolver' to Resolver;")
	print("- Added 'Distance Limit', 'Velocity Limit' and NPC targeting to Aim Assist;")
	print("- Added 'Priority List' and 'Use Spam' to Miscellaneous;")
	print("- Added 'Cheater Callout', 'Copy Messages', 'Disconnect Spam', 'lol', 'english please', 'lmao', 'shit' and 'fuck' to Reply Spam;")
	print("- Added 'Border Color', 'Misc Visuals Color' and 'B Opacity' to Adjustments;")
	print("- Added 'Fake-Forwards/ Backwards/ Sideways', Yaw Spinbot, 'Static', 'Adapt' and 'Disable in Use Toggle' to Anti-Aim;")
	print("- Added 'Players List', 'Show Entities', 'Conditions', 'Velocity', 'Dormant Check', 'Show Spectators', 'Hide Ignored Targets', 'Bystander Name', 'Show NPCs', 'Entity' & 'NPC' Chams, 'Flat' & 'Wireframe' chams materials, clientside visibility and 'Target Priority Colors' & priority statuses to Visuals;")
	print("- Added 'Remove 3D Skybox' to Textures;")
	print("- Added 'Panic Mode', 'Entity Finder Menu', 'Plugin Loader Menu', 'Optimize Game', 'Feature Tooltips', 'Spectator Mode' and more TTT/ Murder/ DarkRP specific features to Main Menu;")
	print("- Added 'Spectators', 'Players', 'Frozen Players' and 'Enemies' to Aim Priorities;")
	print("- Added 'Toggle Key' and 'Speed' to Free Roaming;")
	print("- Added 'Circle Strafe Key' and 'Fake Crouch' to Movement;")
	print("- Added 'Arabic Spam' and 'Hebrew Spam' to Chat Spam;")
	print("- Added 'Priority Targets Only' to Priority List;")
	print("- Added 'Custom Positions', 'Rainbow Mode' and 'Flat' & 'Wireframe' chams to Viewmodel;")
	print("- Added 'Thirdperson Key' to Point of View;")
	print("- Added 'Random' to Emotes;")
	print("- Added 'Murder Taunts' to Taunting;")
	print("- Added 'Legit', 'Rage', 'Circle' and 'Directional' to Auto Strafe;")
	print("- Added customizable List Adjustments to Priority List;")
	print("- Added engine prediction module (big.dll);")
	print("- Added custom key binds;")
	print("- Added bordered menu styles;")
	print("- Added sliding menu;")
	print("- Added more hitsounds, killsounds, more music and a custom music player to Sounds;")
	print("- Added more customization options to Panels;")
	print("- Added a custom configurations menu;")
	print("- Reworked 'Bunny Hop' and 'Auto Strafe' from scratch;")
	print("- Reworked 'Auto Wallbang' from Aimbot;")
	print("- Reworked 'Resolver' from Hack vs. Hack;")
	print("- Reworked 'Radar', 'Spectators', 'Custom Status' and 'Players List' from Panels;")
	print("- Reworked 'Free Roaming' from Miscellaneous;")
	print("- Reworked 'Traitor Finder' and 'Murderer Finder' from Main Menu;")
	print("- Reworked 'Show NPCs' and 'Show Entities' from Visuals;")
	print("- Reworked priorities from Aim Priorities;")
	print("- Reworked anti-screengrabber from scratch;")
	print("- Reworked the menu's design from scratch;")
	print("- Reworked old 'file.Read' blocker from scratch;")
	print("- Renamed 'Aim Assist', 'Hack vs. Hack' and 'Main Menu' tabs;")
	print("- Removed 'Triggerbot' tab and merged it with the 'Aim Assist' tab;")
	print("- Removed 'Shoutout' and 'Drop Money' from Chat Spam;")
	print("- Removed 'Screengrab Notifications' from Miscellaneous;")
	print("- Removed 'Mirror' from Point of View;")
	print("- Removed useless information from Anti-Aim and Miscellaneous;")
	print("- Changed the Armor Bar and Armor Value colors from bright green to bright blue.")
	print("- Changed the default colors, menu size and others;")
	print("- Changed the entity finder menu;")
	print("\n\n===========================================================")
	timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Printed changelog to console!") end)
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
end

local function BadEntities(v)
	if string.find(v:GetClass(), "class") or string.find(v:GetClass(), "viewmodel") or string.find(v:GetClass(), "worldspawn") or string.find(v:GetClass(), "beam") or string.find(v:GetClass(), "env_") or string.find(v:GetClass(), "func_") or string.find(v:GetClass(), "manipulate_") then
		return false
	else
		return true
	end
end

local function EntityFinder()
	local added = {}
	local finder = vgui.Create("DFrame")
	finder:SetSize(769, 859)
	finder:Center()
	finder:SetTitle("")
	finder:MakePopup()
	finder:ShowCloseButton(false)
	local entlist = vgui.Create("DListView", finder)
	entlist:SetPos(17, 75)
	entlist:SetSize(300, 500)
	entlist:SetMultiSelect(false)
	entlist:AddColumn("Existing entities"):SetFixedWidth(300)
	local drawlist = vgui.Create("DListView", finder)
	drawlist:SetPos(451, 75)
	drawlist:SetSize(300, 500)
	drawlist:SetMultiSelect(false)
	drawlist:AddColumn("Drawn entities"):SetFixedWidth(300)
	function RefreshEntities()
		entlist:Clear()
		drawlist:Clear()
			for k, v in next, ents.GetAll() do
			local name = v:GetClass()
			local copy = false
			if not table.HasValue(added, v:GetClass()) and not table.HasValue(drawnents, v:GetClass()) and BadEntities(v) and v:GetClass() ~= "player" then
				for k, v in pairs (entlist:GetLines()) do
					if v:GetValue(1) == name then copy = true end
				end
					if copy == false then entlist:AddLine(v:GetClass()) end
				end
			end
			table.sort(added)
			for k, v in next, added do
				entlist:AddLine(v)
			end
			table.sort(drawnents)
			for k, v in next, drawnents do
				drawlist:AddLine(v)
			end
		end
	local refresh = vgui.Create("DButton", finder)
	refresh:SetText("Refresh")
	refresh:SetPos(331, 350)
	refresh:SetSize(100, 30)
	refresh.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
	RefreshEntities()
	end
	local add = vgui.Create("DButton", finder)
	add:SetText(">>")
	add:SetPos(331, 250)
	add:SetSize(100, 30)
	add.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		if entlist:GetSelectedLine() ~= nil then 
			local ent = entlist:GetLine(entlist:GetSelectedLine()):GetValue(1)
			if not table.HasValue(drawnents, ent) then 
				table.insert(drawnents, ent)
				entlist:RemoveLine(entlist:GetSelectedLine())
				drawlist:AddLine(ent)
			end
		end
		RefreshEntities()
	end
	local remove = vgui.Create("DButton", finder)
	remove:SetText("<<")
	remove:SetPos(331, 300)
	remove:SetSize(100, 30)
	remove.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		if drawlist:GetSelectedLine() ~= nil then
			local ent = drawlist:GetLine(drawlist:GetSelectedLine()):GetValue(1)
			if table.HasValue(drawnents, ent) then 
				for k, v in next, drawnents do 
					if v == ent then 
						table.remove(drawnents, k) 
					end 
				end
				drawlist:RemoveLine(drawlist:GetSelectedLine())
				entlist:AddLine(ent)
			end
		end
		RefreshEntities()
	end
	local addcustom = vgui.Create("DTextEntry", finder)
	addcustom:SetPos(531, 600)
	addcustom:SetSize(140, 20)
	addcustom:SetText("")
	local addcustombutton = vgui.Create("DButton", finder)
	addcustombutton:SetText("Add")
	addcustombutton:SetPos(676, 600)
	addcustombutton:SetSize(60, 20)
	addcustombutton.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		local ent = addcustom:GetValue()
		if not table.HasValue(drawnents, ent) then 
			table.insert(drawnents, ent)
			drawlist:AddLine(ent)
		end
		RefreshEntities()
	end
	local find = vgui.Create("DTextEntry", finder)
	find:SetPos(91, 600)
	find:SetSize(205, 20)
	find:SetText("")
	find.OnChange = function()
		if find:GetValue() ~= "" then
			entlist:Clear()
			for k, v in next, ents.GetAll() do
			local name = v:GetClass()
			local copy = false
			if string.find(v:GetClass(), find:GetValue()) and not table.HasValue(added, v:GetClass()) and not table.HasValue(drawnents, v:GetClass()) and BadEntities(v) and v:GetClass() ~= "player" then
				for k, v in pairs (entlist:GetLines()) do
					if v:GetValue(1) == name then copy = true end
				end
					if copy == false then entlist:AddLine(v:GetClass()) end
				end
			end
		else
			entlist:Clear()
			for k, v in next, ents.GetAll() do
			local name = v:GetClass()
			local copy = false
			if not table.HasValue(added, v:GetClass()) and not table.HasValue(drawnents, v:GetClass()) and BadEntities(v) and v:GetClass() ~= "player" then
				for k, v in pairs (entlist:GetLines()) do
					if v:GetValue(1) == name then copy = true end
				end
					if copy == false then entlist:AddLine(v:GetClass()) end
				end
			end
			table.sort(added)
			for k, v in next, added do
				entlist:AddLine(v)
			end
		end
	end
	for k, v in next, ents.GetAll() do
		if not table.HasValue(added, v:GetClass()) and not table.HasValue(drawnents, v:GetClass()) and BadEntities(v) and v:GetClass() ~= "player" then
			entlist:AddLine(v:GetClass())
		end
	end
	table.sort(added)
	for k, v in next, added do
		entlist:AddLine(v)
	end
	table.sort(drawnents)
	for k, v in next, drawnents do
		drawlist:AddLine(v)
	end
	entlist.Paint = function(self, w, h)
		draw.RoundedBox(15, 0, 0, w, h, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:")))
	end
	drawlist.Paint = function(self, w, h)
		draw.RoundedBox(15, 0, 0, w, h, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:")))
	end
	finder.Paint = function(self, w, h)
		if gOption("Main Menu", "Menus", "Menu Style:") == "Borders" then -- Thank you for fixing my mess, Pinged
            draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 0, 0, w, h, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:")))
		end
		draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 2, 2, w - 4, h - 4, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Adjustments", "Others", "BG Opacity:")))
		DrawUpperText(w, h)
		draw.SimpleText("Search Entity:", "MenuFont", 17, 610, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:")), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText("Add Entity:", "MenuFont", 461, 610, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:")), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	finder.Think = function()
		if ((input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menukeydown2 or unloaded == true) then
			finder:SlideUp(0.5)
			timer.Simple(0.5, function()
			finder:Remove()
			menuopen = false
			candoslider = false
			drawlast = nil
			file.Write(folder.."/entities.txt", util.TableToJSON(drawnents))
			end)
		end
	end
	RefreshEntities()
end

local function PluginLoader()
	local plugin = vgui.Create("DFrame")
	plugin:SetSize(769, 859)
	plugin:Center()
	plugin:SetTitle("")
	plugin:MakePopup()
	plugin:ShowCloseButton(false)
	local pluginlist = vgui.Create("DListView", plugin)
	pluginlist:SetPos(150, 75)
	pluginlist:SetSize(320, 500)
	pluginlist:SetMultiSelect(false)
	pluginlist:AddColumn("Available files ("..#file.Find("lua/*.lua","GAME", "nameasc")-1 ..")"):SetFixedWidth(320)
	local pluginload = vgui.Create("DButton", plugin)
	pluginload:SetText("Load")
	pluginload:SetPos(500, 75)
	pluginload:SetSize(100, 30)
	pluginload.DoClick = function()
		chat.PlaySound()
		if pluginlist:GetSelectedLine() ~= nil then
			surface.PlaySound("buttons/button14.wav")
			MsgY(3, "Loaded "..pluginlist:GetLine(pluginlist:GetSelectedLine()):GetValue(1).." successfully.")
			local d = vgui.Create('DHTML')
			d:SetAllowLua(true)
			return d:ConsoleMessage([[RUNLUA: ]]..file.Read("lua/"..pluginlist:GetLine(pluginlist:GetSelectedLine()):GetValue(1), "GAME"))
		end 
	end
	local pluginrefresh = vgui.Create("DButton", plugin )
	pluginrefresh:SetText("Refresh")
	pluginrefresh:SetPos(500, 115)
	pluginrefresh:SetSize(100, 30)
	pluginrefresh.DoClick = function()
	chat.PlaySound()
	pluginlist:Clear()
		for k, v in pairs(file.Find("lua/*.lua", "GAME", "nameasc")) do 
			pluginlist:AddLine(v)
		end
	end
		for k, v in pairs(file.Find("lua/*.lua", "GAME", "nameasc")) do
			pluginlist:AddLine(v)
		end
	pluginlist.Paint = function(self, w, h)
		draw.RoundedBox(15, 0, 0, w, h, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:")))
	end
	plugin.Paint = function(self, w, h)
		if gOption("Main Menu", "Menus", "Menu Style:") == "Borders" then -- Thank you for fixing my mess, Pinged
            draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 0, 0, w, h, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:")))
		end
		draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 2, 2, w - 4, h - 4, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Adjustments", "Others", "BG Opacity:")))
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
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 55)
	surface.DrawRect(posx - 193 + dist + 2, 61 + posy + maxy + 2, size + 66, 14)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx - 193 + posx + dist, my + 61 + posy + maxy, mx - 193 + posx + dist + size + 69, my + 61 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy
	surface.SetFont("MenuFont2")
	surface.SetTextColor(menutextcol.r - 65, menutextcol.g - 65, menutextcol.b - 50, gInt("Adjustments", "Others", "T Opacity:"))
	if bMouse or notyetselected == check then
		surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 180)
		surface.DrawRect(posx - 193 + dist + 2, 61 + posy + maxy + 2, size + 66, 14)
		local feat = var[1]
		if feat == "Entity Finder Menu" then
			info = "Opens the Entity Finder menu."
		elseif feat == "Plugin Loader Menu" then
			info = "Opens the Plugin Loader menu."
		elseif feat == "Save Configuration" then
			info = "Saves your desired configuration file."
		elseif feat == "Load Configuration" then
			info = "Loads your desired configuration file."
		elseif feat == "Delete Configuration" then
			info = "Deletes your desired configuration file."
		elseif feat == "Print Changelog" then
			info = "Prints the IdiotBox changelog in the console."
		elseif feat == "Unload Cheat" then
			info = "Unloads IdiotBox. If you desire to reload it, you will have to rejoin the server you're currently on."
		end
	end
	local tw, th = surface.GetTextSize(text)
	surface.SetTextPos(posx - 173 + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2)
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
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #6" then
				SaveConfig6()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #7" then
				SaveConfig7()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #8" then
				SaveConfig8()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #9" then
				SaveConfig9()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #10" then
				SaveConfig10()
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
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #6" then
				LoadConfig6()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #7" then
				LoadConfig7()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #8" then
				LoadConfig8()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #9" then
				LoadConfig9()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #10" then
				LoadConfig10()
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
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #6" then
				file.Delete(folder.."/config6.txt")
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #7" then
				file.Delete(folder.."/config7.txt")
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #8" then
				file.Delete(folder.."/config8.txt")
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #9" then
				file.Delete(folder.."/config9.txt")
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #10" then
				file.Delete(folder.."/config10.txt")
			end
			timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Configuration Deleted!") end)
			timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		elseif text == "Plugin Loader Menu" then
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
				elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #6" then
					SaveConfig6()
				elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #7" then
					SaveConfig7()
				elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #8" then
					SaveConfig8()
				elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #9" then
					SaveConfig9()
				elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #10" then
					SaveConfig10()
				end
			end
			PluginLoader()
			timer.Create("ChatPrint", 0.1, 1, function() MsgY(2.5, "Plugin Menu Loaded!") end)
			timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		elseif text == "Entity Finder Menu" then
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
					elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #6" then
						SaveConfig6()
					elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #7" then
						SaveConfig7()
					elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #8" then
						SaveConfig8()
					elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #9" then
						SaveConfig9()
					elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #10" then
						SaveConfig10()
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
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:"))
	local startpos = 61 + posy
	surface.SetTextColor(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetFont("MenuFont")
	local tw, th = surface.GetTextSize(opt)
	surface.SetDrawColor(bgmenucol.r + 13, bgmenucol.g + 13, bgmenucol.b + 13, gInt("Adjustments", "Others", "BG Opacity:"));
	surface.DrawRect(5 + posx, startpos, sizex, sizey);
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:"))
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
			elseif (v[2] == "SliderOld") then
				DrawOldSlider(self, w, h, v, maxy, posx, posy, dist)
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
	surface.SetTextColor(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "T Opacity:"))
	surface.SetFont("MenuFont")
	local tw, th = surface.GetTextSize(opt)
	surface.SetDrawColor(bgmenucol.r + 13, bgmenucol.g + 13, bgmenucol.b + 13, gInt("Adjustments", "Others", "BG Opacity:"));
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
			elseif (v[2] == "SliderOld") then
				DrawOldSlider(self, w, h, v, maxy, posx, posy, dist)
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

local function CacheColors()
	maintextcol = Color(gInt("Adjustments", "Main Text Color", "Red:"), gInt("Adjustments", "Main Text Color", "Green:"), gInt("Adjustments", "Main Text Color", "Blue:"))
	menutextcol = Color(gInt("Adjustments", "Menu Text Color", "Red:"), gInt("Adjustments", "Menu Text Color", "Green:"), gInt("Adjustments", "Menu Text Color", "Blue:"))
	bgmenucol = Color(gInt("Adjustments", "Background Menu Color", "Red:"), gInt("Adjustments", "Background Menu Color", "Green:"), gInt("Adjustments", "Background Menu Color", "Blue:"))
	bordercol = Color(gInt("Adjustments", "Border Color", "Red:"), gInt("Adjustments", "Border Color", "Green:"), gInt("Adjustments", "Border Color", "Blue:"))
	teamvisualscol = Color(gInt("Adjustments", "Team Visuals Color", "Red:"), gInt("Adjustments", "Team Visuals Color", "Green:"), gInt("Adjustments", "Team Visuals Color", "Blue:"))
	enemyvisualscol = Color(gInt("Adjustments", "Enemy Visuals Color", "Red:"), gInt("Adjustments", "Enemy Visuals Color", "Green:"), gInt("Adjustments", "Enemy Visuals Color", "Blue:"))
	prioritytargetscol = Color(gInt("Adjustments", "Priority Targets Color", "Red:"), gInt("Adjustments", "Priority Targets Color", "Green:"), gInt("Adjustments", "Priority Targets Color", "Blue:"))
	ignoredtargetscol = Color(gInt("Adjustments", "Ignored Targets Color", "Red:"), gInt("Adjustments", "Ignored Targets Color", "Green:"), gInt("Adjustments", "Ignored Targets Color", "Blue:"))
	miscvisualscol = Color(gInt("Adjustments", "Misc Visuals Color", "Red:"), gInt("Adjustments", "Misc Visuals Color", "Green:"), gInt("Adjustments", "Misc Visuals Color", "Blue:"))
	teamchamscol = Color(gInt("Adjustments", "Team Chams Color", "Red:"), gInt("Adjustments", "Team Chams Color", "Green:"), gInt("Adjustments", "Team Chams Color", "Blue:"))
	enemychamscol = Color(gInt("Adjustments", "Enemy Chams Color", "Red:"), gInt("Adjustments", "Enemy Chams Color", "Green:"), gInt("Adjustments", "Enemy Chams Color", "Blue:"))
	crosshaircol = Color(gInt("Adjustments", "Crosshair Color", "Red:"), gInt("Adjustments", "Crosshair Color", "Green:"), gInt("Adjustments", "Crosshair Color", "Blue:"))
	viewmodelcol = Color(gInt("Adjustments", "Viewmodel Color", "Red:"), gInt("Adjustments", "Viewmodel Color", "Green:"), gInt("Adjustments", "Viewmodel Color", "Blue:"))
end

local function Menu()
	local menusongs = {"https://dl.dropbox.com/s/0m22ytfia8qoy4m/Daisuke%20-%20El%20Huervo.mp3?dl=1", "https://dl.dropbox.com/s/0fdgaj0ry8uummf/Rust_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/vsz77wdjqy1xf83/HOME%20-%20Resonance.mp3?dl=1", "https://dl.dropbox.com/s/ovh8xt0nn6wjgjj/The%20Caretaker%20-%20It%27s%20just%20a%20burning%20memory%20%282016%29.mp3?dl=1", "https://dl.dropbox.com/s/8bg55iwowf2jtv8/cuckoid%20-%20ponyinajar.mp3?dl=1", "https://dl.dropbox.com/s/0uly6phlgpoj4ss/1932_George_Olsen_-_Lullaby_Of_The_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/qfl7mu39us5hzn4/Erectin_a_River_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/stkat6jlp4jhpxo/Monrroe_-_Fleeting_Love_%28getmp3.pro%29.mp3?dl=1","https://dl.dropbox.com/s/vhd3il20d8ephb4/DJ_Spizdil_-_malo_tebyaHardstyle_m_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/2vf1lx9cnd5g9pq/Maduk_-_Vermilion_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/wcoo6cov1iatcao/Metrik_-_Gravity_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/8a91zs6woqz9bb4/Scattle_Remorse_REUPLOAD_CHECK_DE_%28getmp3.pro%29.mp3?dl=1","https://dl.dropbox.com/s/bqt4dcjoziezdjk/The_Caretaker_-_Libets_Delay_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/12ztoyw2rc2q0z0/HOME_-_Hold_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/xlk7wuel56bwrr3/T_Sugah_-_Green_Valleys_LAOS_%28getmp3.pro%29.mp3?dl=1",}
	local frame = vgui.Create("DFrame")
	frame:SetSize(769, 859)
	frame:Center()
	frame:SlideDown(0.5)
	frame:SetTitle("")
	frame:MakePopup()
	frame:ShowCloseButton(false)
	frame.Paint = function(self, w, h)
		if (candoslider and not mousedown and not drawlast and not input.IsMouseDown(MOUSE_LEFT)) then
			candoslider = false
		end
		info = ""
		if gOption("Main Menu", "Menus", "Menu Style:") == "Borders" then -- Thank you for fixing my mess, Pinged
            draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 0, 0, w, h, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:")))
		end
		draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 2, 2, w - 4, h - 4, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Adjustments", "Others", "BG Opacity:")))
		DrawUpperText(w, h)
		DrawOptions(self, w, h)
		DrawSub(self, w, h)
		if (drawlast) then
			drawlast()
			candoslider = true
		end
		mousedown = input.IsMouseDown(MOUSE_LEFT)
		if gBool("Main Menu", "Others", "Feature Tooltips") and info ~= "" then
			draw.SimpleText(info, "MenuFont", w / 2, h / 1.03, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "T Opacity:")), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
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
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #6" then
				SaveConfig6()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #7" then
				SaveConfig7()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #8" then
				SaveConfig8()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #9" then
				SaveConfig9()
			elseif gOption("Main Menu", "Configurations", "Configuration:") == "Config #10" then
				SaveConfig10()
				end
			end
		end
		CacheColors()
	end
end

local function ThirdpersonCheck()
	if gBool("Visuals", "Point of View", "Thirdperson") then
		if gKey("Visuals", "Point of View", "Thirdperson Key:") and not tppressed then
			tppressed = true
			tptoggle = not tptoggle
		elseif not gKey("Visuals", "Point of View", "Thirdperson Key:") and tppressed then
			tppressed = false
		end
		if tptoggle then
			return true
		else
			return false
		end
	end
end

local function FixTools()
	if gBool("Hack vs. Hack", "Anti-Aim", "Enabled") or ThirdpersonCheck() or not me:Alive() or me:Health() < 1 then
		return false
	end
	if me:GetActiveWeapon():IsValid() and (me:GetActiveWeapon():GetClass() == "weapon_physgun" or me:GetActiveWeapon():GetClass() == "gmod_camera") then
		return true
	else
		return false
	end
end

local function RapidPrimaryFire(cmd)
	if gOption("Aim Assist", "Miscellaneous", "Rapid Fire:") ~= "Off" and gOption("Aim Assist", "Miscellaneous", "Rapid Fire:") == "Primary Fire" then
		if pm.KeyDown(me, IN_ATTACK) then
			if (me:Alive() or em.Health(me) > 0) then
				if not FixTools() then
					if toggler == 0 then
						cm.SetButtons(cmd, bit.bor(cm.GetButtons(cmd), IN_ATTACK))
						toggler = 1
					else
						cm.SetButtons(cmd, bit.band(cm.GetButtons(cmd), bit.bnot(IN_ATTACK)))
						toggler = 0
					end
				end
			end
		end
	end
end

local function RapidAltFire(cmd)
	if gOption("Aim Assist", "Miscellaneous", "Rapid Fire:") ~= "Off" and gOption("Aim Assist", "Miscellaneous", "Rapid Fire:") == "Alt Fire" then
		if pm.KeyDown(me, IN_ATTACK) then
			if (me:Alive() or em.Health(me) > 0) then
				if not FixTools() then
					if toggler == 0 then
						cm.SetButtons(cmd, bit.bor(cm.GetButtons(cmd), IN_ATTACK2))
						toggler = 1
					else
						cm.SetButtons(cmd, bit.band(cm.GetButtons(cmd), bit.bnot(IN_ATTACK2)))
						toggler = 0
					end
				end
			end
		end
	end
end

local function KillSpam(data)
	local killer = Entity(data.entindex_attacker)
	local killed = Entity(data.entindex_killed)
	if (not killer:IsValid() or not killed:IsValid() or not killer:IsPlayer() or not killed:IsPlayer()) or (gBool("Main Menu", "Priority List", "Enabled") and table.HasValue(ignorelist, killed:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and table.HasValue(ignorelist, killer:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Miscellaneous", "Chat", "Priority Targets Only") and (killed ~= me and killer == me and not table.HasValue(prioritylist, killed:UniqueID()))) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Miscellaneous", "Chat", "Priority Targets Only") and (killed == me and killer ~= me and not table.HasValue(prioritylist, killer:UniqueID()))) then return end
	local playerphrases = {"Owned", "Bodied", "Smashed", "Fucked", "Destroyed", "Annihilated", "Decimated", "Wrecked", "Demolished", "Trashed", "Ruined", "Murdered", "Exterminated", "Slaughtered", "Butchered", "Genocided", "Executed", "Bamboozled", "IdiotBox'd",}
	local excuses = {"i lagged out wtf", "bad ping wtf", "lol wasnt looking at you", "was alt tabbed", "luck", "wow", "nice one", "i think ur hacking m8", "my cat was on the keyboard", "my dog was on the keyboard", "my fps is trash", "my ping is trash", "ouch", "wtf", "ok",}
	local hvhexcuses = {"forgot to press aimkey lol", "give me a minute to configurate", "wtf it didnt save my Adjustments wait", "lol my hvh Adjustments are gone, wait", "luck lol", "my fps is trash", "my ping is trash", "what are you using?",}
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

local function FixMovement(cmd)
	local vec = Vector(cm.GetForwardMove(cmd), cm.GetSideMove(cmd), 0)
	local vel = math.sqrt(vec.x * vec.x + vec.y * vec.y)
	local mang = vm.Angle(vec)
	local yaw = cm.GetViewAngles(cmd).y - fa.y + mang.y
	if (((cm.GetViewAngles(cmd).p + 90) % 360) > 180) then
	yaw = 180 - yaw
	end
	yaw = ((yaw + 180) % 360) - 180
	cmd:SetForwardMove(math.cos(math.rad(yaw)) * vel)
	cmd:SetSideMove(math.sin(math.rad(yaw)) * vel)
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

local function StausTitle()
	if !gBool("Visuals", "Panels", "Show List Titles") then return end
	if gOption("Visuals", "Panels", "Panels Style:") == "Borders" then
		draw.RoundedBox(gInt("Adjustments", "List Adjustments", "Roundness:"), gInt("Adjustments", "List Adjustments", "Custom Status X:") - 1, gInt("Adjustments", "List Adjustments", "Custom Status Y:") - 25, 92, 24, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:")))
	elseif gOption("Visuals", "Panels", "Panels Style:") == "Borderless" then
		draw.RoundedBox(gInt("Adjustments", "List Adjustments", "Roundness:"), gInt("Adjustments", "List Adjustments", "Custom Status X:") - 1, gInt("Adjustments", "List Adjustments", "Custom Status Y:") - 25, 92, 24, Color(bordercol.r, bordercol.g, bordercol.b, 0))
	end
	draw.RoundedBox(gInt("Adjustments", "List Adjustments", "Roundness:"), gInt("Adjustments", "List Adjustments", "Custom Status X:") + 1, gInt("Adjustments", "List Adjustments", "Custom Status Y:") - 23, 88, 20, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Adjustments", "List Adjustments", "List Opacity:")))
	draw.DrawText("Status", "MiscFont2", gInt("Adjustments", "List Adjustments", "Custom Status X:") + 45, gInt("Adjustments", "List Adjustments", "Custom Status Y:") - 22, Color(maintextcol.r, maintextcol.g, maintextcol.b, gInt("Adjustments", "Others", "T Opacity:")), TEXT_ALIGN_CENTER)
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
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Health: "..hp)
	if (em.IsValid(wep)) then
	local daclip = wep:Clip1()
	if daclip < 0 then
	daclip = 0
	end
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.DrawText("Ammo: "..daclip.."/"..me:GetAmmoCount(wep:GetPrimaryAmmoType()))
	else
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.DrawText("Ammo: ".."0".."/".."0")
	end
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Velocity: "..math.Round(velocity))
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Server: "..GetHostName())
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Gamemode: "..engine.ActiveGamemode())
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Map: "..game.GetMap())
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Looking at: "..EntityName())
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Entities: "..math.Round(ents.GetCount()))
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Frames: "..math.Round(1 / FrameTime()))
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Ping: "..me:Ping())
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Date: "..os.date("%d %b %Y"))
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Custom Status X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Custom Status Y:"))
	surface.SetTextColor(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Time: "..os.date("%H:%M:%S"))
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

local function Spectator()
	local radarX, radarY, radarW, radarH = 50, ScrH() / 3, 200, 200
	local color1 = (Color(0, 0, 0, gInt("Adjustments", "Others", "T Opacity:")))
	local color2 = (Color(255, 0, 0, gInt("Adjustments", "Others", "T Opacity:")))
	local color3 = (Color(maintextcol.r, maintextcol.g, maintextcol.b, gInt("Adjustments", "Others", "T Opacity:")))
	local color4 = (Color(0, 131, 125, gInt("Adjustments", "Others", "T Opacity:")))
	local hudspecslength = 150
	specscount = 0
	if gOption("Visuals", "Panels", "Panels Style:") == "Borders" then
		draw.RoundedBox(gInt("Adjustments", "Window Adjustments", "Roundness:"), gInt("Adjustments", "Window Adjustments", "Spectators X:") - 0.25, gInt("Adjustments", "Window Adjustments", "Spectators Y:") - 1.75, radarW + 4, radarH + 4, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:")))
	elseif gOption("Visuals", "Panels", "Panels Style:") == "Borderless" then
		draw.RoundedBox(gInt("Adjustments", "Window Adjustments", "Roundness:"), gInt("Adjustments", "Window Adjustments", "Spectators X:") - 0.25, gInt("Adjustments", "Window Adjustments", "Spectators Y:") - 1.75, radarW + 4, radarH + 4, Color(bordercol.r, bordercol.g, bordercol.b, 0))
	end
	draw.RoundedBox(gInt("Adjustments", "Window Adjustments", "Roundness:"), gInt("Adjustments", "Window Adjustments", "Spectators X:") + 2, gInt("Adjustments", "Window Adjustments", "Spectators Y:"), radarW, radarH, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Adjustments", "Window Adjustments", "Window Opacity:")))
	draw.SimpleText("Spectators", "MiscFont2", gInt("Adjustments", "Window Adjustments", "Spectators X:") + 102, gInt("Adjustments", "Window Adjustments", "Spectators Y:") + 11, color3, 1, 1)
	for k, v in pairs(player.GetAll()) do
		if (IsValid(v:GetObserverTarget())) and v:GetObserverTarget() == me then
			DrawOutlinedText(v:GetName(), "MiscFont2", gInt("Adjustments", "Window Adjustments", "Spectators X:") + 102, gInt("Adjustments", "Window Adjustments", "Spectators Y:") + 32 + specscount, color2, 0.1, color1)
			specscount = specscount + 12
		end
	end
	if specscount == 0 then
		DrawOutlinedText("none", "MiscFont2", gInt("Adjustments", "Window Adjustments", "Spectators X:") + 102, gInt("Adjustments", "Window Adjustments", "Spectators Y:") + 32, color4, 0.1, color1)
	end
	hudspecslength = specscount + 19
end

local function Arrow(x, y, myRotation)
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

local function Radar()
	local col = Color(maintextcol.r, maintextcol.g, maintextcol.b, gInt("Adjustments", "Others", "T Opacity:"))
	local everything = ents.GetAll()
	if gOption("Visuals", "Panels", "Panels Style:") == "Borders" then
		draw.RoundedBox(gInt("Adjustments", "Window Adjustments", "Roundness:"), gInt("Adjustments", "Window Adjustments", "Radar X:") - 0.25, gInt("Adjustments", "Window Adjustments", "Radar Y:") - 1.75, radarW + 4, radarH + 4, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:")))
	elseif gOption("Visuals", "Panels", "Panels Style:") == "Borderless" then
		draw.RoundedBox(gInt("Adjustments", "Window Adjustments", "Roundness:"), gInt("Adjustments", "Window Adjustments", "Radar X:") - 0.25, gInt("Adjustments", "Window Adjustments", "Radar Y:") - 1.75, radarW + 4, radarH + 4, Color(bordercol.r, bordercol.g, bordercol.b, 0))
	end
	draw.RoundedBox(gInt("Adjustments", "Window Adjustments", "Roundness:"), gInt("Adjustments", "Window Adjustments", "Radar X:") + 2, gInt("Adjustments", "Window Adjustments", "Radar Y:"), radarW, radarH, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Adjustments", "Window Adjustments", "Window Opacity:")))
	draw.SimpleText("Radar", "MiscFont2", gInt("Adjustments", "Window Adjustments", "Radar X:") + 102, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 11, col, 1, 1)
	draw.NoTexture()
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:") - 75)
	surface.DrawLine(gInt("Adjustments", "Window Adjustments", "Radar X:") + 209 * 0.5, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 24, gInt("Adjustments", "Window Adjustments", "Radar X:") + 209 * 0.5, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 190)
	surface.DrawLine(gInt("Adjustments", "Window Adjustments", "Radar X:") + 12, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 209 * 0.5, gInt("Adjustments", "Window Adjustments", "Radar X:") + 191, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 209 * 0.5)
	surface.SetDrawColor(team.GetColor(me:Team()))
	for k = 1, #everything do
		local v = everything[k]
		if (v != me and v:IsPlayer() and v:Health() > 0 and not (em.IsDormant(v) and gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All") and not (v:Team() == TEAM_SPECTATOR and gBool("Visuals", "Miscellaneous", "Show Spectators")) and not ((gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID()))) or (v:IsNPC() and v:Health() > 0)) then
			color = (v:IsPlayer() and ((contributors[v:SteamID()] || creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || pm.GetFriendStatus(v) == "friend" && Color(0, 255, 255) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v))) or Color(255, 255, 255)
			surface.SetDrawColor(color)
			local myPos = me:GetPos()
			local theirPos = v:GetPos()
			local theirX = (radarX + (radarW / 2)) + ((theirPos.x - myPos.x) / gInt("Visuals", "Panels", "Radar Distance:"))
			local theirY = (radarY + (radarH / 2)) + ((myPos.y - theirPos.y) / gInt("Visuals", "Panels", "Radar Distance:"))
			local myRotation = math.rad(fa.y - 90)
			theirX = theirX - (radarX + (radarW / 2))
			theirY = theirY - (radarY + (radarH / 2))
			local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
			local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
			newX = newX + (gInt("Adjustments", "Window Adjustments", "Radar X:") + 2 + (radarW / 2))
			newY = newY + (gInt("Adjustments", "Window Adjustments", "Radar Y:") + 2 + (radarH / 2))
			if newX < (gInt("Adjustments", "Window Adjustments", "Radar X:") + 2 + radarW) and newX > gInt("Adjustments", "Window Adjustments", "Radar X:") + 2 and newY < (gInt("Adjustments", "Window Adjustments", "Radar Y:") + radarH) and newY > gInt("Adjustments", "Window Adjustments", "Radar Y:") then
				Arrow(newX + 4, newY, v:EyeAngles().y - fa.y)
			end
		end
	end
	render.SetScissorRect(0, 0, 0, 0, false)
end

local function PlayersTitle()
	if !gBool("Visuals", "Panels", "Show List Titles") then return end
	if gOption("Visuals", "Panels", "Panels Style:") == "Borders" then
		draw.RoundedBox(gInt("Adjustments", "List Adjustments", "Roundness:"), gInt("Adjustments", "List Adjustments", "Players List X:") - 1, gInt("Adjustments", "List Adjustments", "Players List Y:") - 25, 92, 24, Color(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "B Opacity:")))
	elseif gOption("Visuals", "Panels", "Panels Style:") == "Borderless" then
		draw.RoundedBox(gInt("Adjustments", "List Adjustments", "Roundness:"), gInt("Adjustments", "List Adjustments", "Players List X:") - 1, gInt("Adjustments", "List Adjustments", "Players List Y:") - 25, 92, 24, Color(bordercol.r, bordercol.g, bordercol.b, 0))
	end
	draw.RoundedBox(gInt("Adjustments", "List Adjustments", "Roundness:"), gInt("Adjustments", "List Adjustments", "Players List X:") + 1, gInt("Adjustments", "List Adjustments", "Players List Y:") - 23, 88, 20, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, gInt("Adjustments", "List Adjustments", "List Opacity:")))
	draw.DrawText("Players", "MiscFont2", gInt("Adjustments", "List Adjustments", "Players List X:") + 47, gInt("Adjustments", "List Adjustments", "Players List Y:") - 22, Color(maintextcol.r, maintextcol.g, maintextcol.b, gInt("Adjustments", "Others", "T Opacity:")), TEXT_ALIGN_CENTER)
end

local function Players()
	local hh = - 10
	surface.SetFont("MiscFont")
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Players List X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Players List Y:"))
	surface.SetTextColor(0, 131, 175, gInt("Adjustments", "Others", "T Opacity:"))
	surface.DrawText("Players: "..player.GetCount().."/"..game.MaxPlayers())
	local NWString = em.GetNWString(v)
	for k, v in next, player.GetAll() do
		surface.SetTextColor(0, 131, 175, gInt("Adjustments", "Others", "T Opacity:"))
		hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Players List X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Players List Y:"))
		surface.DrawText(""..em.GetNWString(v, "usergroup").."")
		surface.SetTextColor(255, 255, 255, gInt("Adjustments", "Others", "T Opacity:"))
		surface.DrawText(" "..v:GetName())
	end
end

local function Prioritize(v)
	if table.HasValue(ignorelist, v:UniqueID()) then
		table.RemoveByValue(ignorelist, v:UniqueID())
	elseif table.HasValue(prioritylist, v:UniqueID()) then
		table.RemoveByValue(prioritylist, v:UniqueID())
	else
		table.insert(prioritylist, v:UniqueID())
	end
	file.Write(folder.."/priority.txt", util.TableToJSON(prioritylist))
	file.Write(folder.."/ignored.txt", util.TableToJSON(ignorelist))
end

local function Ignore(v)
	if table.HasValue(prioritylist, v:UniqueID()) then
		table.RemoveByValue(prioritylist, v:UniqueID())
	elseif table.HasValue(ignorelist, v:UniqueID()) then
		table.RemoveByValue(ignorelist, v:UniqueID())
	else
		table.insert(ignorelist, v:UniqueID())
	end
	file.Write(folder.."/priority.txt", util.TableToJSON(prioritylist))
	file.Write(folder.."/ignored.txt", util.TableToJSON(ignorelist))
end

local function Priority(v)
	if table.HasValue(prioritylist, v:UniqueID()) then
		return "Priority Target"
	elseif table.HasValue(ignorelist, v:UniqueID()) then
		return "Ignored Target"
	else
		return "Normal"
	end
end

local function PlayerList()
	local pos_x, pos_y = gInt("Main Menu", "Priority List", "List Position X:") - 0.25, gInt("Main Menu", "Priority List", "List Position Y:") - 1.75
	local number = 1
	local offset = 14 + gInt("Main Menu", "Priority List", "List Spacing:")
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
				if table.HasValue(ignorelist, v:UniqueID()) then
					surface.SetDrawColor(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)
				elseif table.HasValue(prioritylist, v:UniqueID()) then
					surface.SetDrawColor(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)
				else
					surface.SetDrawColor(bgmenucol.r, bgmenucol.g, bgmenucol.b)
				end
			else
				if table.HasValue(ignorelist, v:UniqueID()) then
					surface.SetDrawColor(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)
				elseif table.HasValue(prioritylist, v:UniqueID()) then
					surface.SetDrawColor(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)
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
		offset = offset + 14 + gInt("Main Menu", "Priority List", "List Spacing:")
		number = number + 1
	end
end

local function Crosshair()
	if menuopen or (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 then return end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Box") then
	local x1, y1 = ScrW() * 0.5, ScrH() * 0.5
		surface.SetDrawColor(0, 0, 0, gInt("Adjustments", "Others", "T Opacity:"))
		surface.DrawOutlinedRect(x1 - 3, y1 - 2, 6, 6)
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:"))
		surface.DrawRect(x1 - 2, y1 - 1, 4, 4)
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Dot") then -- Cancer, I know, but I want to avoid using surface.DrawPoly as much as possible
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 0.2, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 0.4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 0.6, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 0.8, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.2, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.6, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.8, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2.2, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2.4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2.6, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 2.8, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 3, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4, Color(0, 0, 0, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4.2, Color(0, 0, 0, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4.4, Color(0, 0, 0, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4.6, Color(0, 0, 0, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4.8, Color(0, 0, 0, gInt("Adjustments", "Others", "T Opacity:")))
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Square") then
	local x1, y1 = ScrW() * 0.5, ScrH() * 0.5
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:"))
		surface.DrawOutlinedRect(x1 - 3, y1 - 2, 6, 6)
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Circle") then
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Cross") then
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:"))
		surface.DrawLine(ScrW() / 2 - 11, ScrH() / 2, ScrW() / 2 + 11, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 11, ScrW() / 2 - 0, ScrH() / 2 + 11)
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Edged Cross") then
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:"))
		surface.DrawLine(ScrW() / 2 - 14.5, ScrH() / 2, ScrW() / 2 + 14.5, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 14.5, ScrW() / 2 - 0, ScrH() / 2 + 14.5)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawLine(ScrW() / 2 - 9, ScrH() / 2, ScrW() / 2 + 9, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 9, ScrW() / 2 - 0, ScrH() / 2 + 9)
	end
	if (gOption("Visuals", "Miscellaneous", "Crosshair:") == "Swastika") then
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:"))
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
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 11, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
	end
end

hook.Add("RenderScene", "RenderScene", function(origin, angle, fov)
	if gBool("Visuals", "Textures", "Dark Mode") then
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
	render.SetLightingMode(gBool("Visuals", "Textures", "Bright Mode") and 1 or 0)
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

hook.Add("ShutDown", "ShutDown", function()
	render.SetRenderTarget()
end)

hook.Add("PostDrawViewModel", "PostDrawViewModel", function(vm)
	if (!vm) then return end
	render.SetLightingMode(0)
	for k, v in next, vm:GetMaterials() do
		render.MaterialOverrideByIndex(k - 1, nil)
	end
end)

hook.Add("PreDrawEffects", "PreDrawEffects", function()
	render.SetLightingMode(0)
end)

hook.Add("HUDShouldDraw", "HUDShouldDraw", function(name)
	if gBool("Visuals", "Miscellaneous", "Hide HUD") and hide[name] then
		return false
	end
	if gOption("Visuals", "Miscellaneous", "Crosshair:") ~= "Off" and crosshairhide[name] then
		return false
	end
end)

local function ChatSpam()
	local ArabFunni = {"يمارس الجنس مع السلطة العربية سنة عظيمة", "رائحة مثل البظر دون السن القانونية هنا اسمحوا لي أن اللعنة", "ازدهار مسحوق الطاقة العربية سنة جيدة", "نحن نكره اليهو", "يمارس الجنس مع الأطفال الماعز نعم الجنس", "الله أكبر نعم رجل تفجير طفل", "هذه لحظة بره لحظة ارهابية سنة", "في تلك اللحظة التي يبدأ فيها أخاك في المغازلة مع والدتك", "الحصول على صندوق احمق نعم العربية غش كازاخستان", "يمارس الجنس مع نيغا الكلبة دا قرن الطفل", "ترك العرب باكستاني لحظة برمة تجميع كرمة", "حرق اليهود ، يمارس الجنس مع المسيح ، قتل الأطفال ، أصبح الله",}
	local HebrewFunni = {"לזיין את הכלב שלך אמא לעזאזל חרא סקס בכוס", "לעזאזל כוס כלבה בזין אני אוהבת עורלה הדוקה חתכה לי שלום כומר", "זו לא בדיחה מזוינת אני רוצה לתלות את עצמי השנה", "תזדיין שאתה יהודי הוא הגדול ביותר שכולכם כושים", "אני אהיה בן שש בשנה מכושן", "יש למול את הפין", "ישראל היא פלסטין המזוין הגדול ביותר במדינה", "זקן ישבן גדול על סנטרי, זהב בביתי, פוליטיקה במכנסיים שלי", "מזדיין לצאת מכושים ישראלים", "כוס חתולה אני מזיין את הזין ואז אני מוצץ כן", "חרא של אלוהים זה חרא של רחוב כן", "אני הולך לזיין ילד בן שתים עשרה בתחת, כן חתוך עורלה לעזאזל חרא כלבה",}
	local messagespam = {"GET FUCKED BY IDIOTBOX KIDDIE", "YOU SUCK SHIT LMAO", "STOP BEING SUCH A WORTHLESS CUMSTAIN AND GET IDIOTBOX NOW", "MONEY WASTER LOL", "YOU FUCKING FATASS, GET IDIOTBOX AND LOSE ALL THAT WEIGHT YOU INCEL", "ARE ALL THE GIRLS IGNORING YOU? GET IDIOTBOX AND YOU'LL BE FLOODED WITH PUSSY", "DO YOU FEEL WORTHLESS? WELL, YOU ARE LOL", "GET IDIOTBOX IF YOU WANT SOME OF THAT CLOUT", "STOP WASTING YOUR TIME ON SOUNDCLOUD BECAUSE YOU AIN'T GONNA GET NOWHERE WITH IT", "GET IDIOTBOX AND YOUR DICK WILL GROW 4 TIMES ITS SIZE", "LITTLE KID LMAO",}
	local offensivespam = {"fuck niggers like fr", "who else here hates black people lmao", "all niggers should be locked in cages and fed bananas", "black people are some sub-human slaves imo", "i've never met an intelligent black person", "why tf are all niggers so ugly lol", "all the black dudes i've seen look like monkeys", "ooga booga black rights", "my grandpa died in ww2, he was the best german pilot", "white people are genetically superior to every othe race", "all jews can do is hide the truth, steal money and start wars",}
	local insultspam = {" is shit at building", " is no older than 13", " looks like a 2 month old corpse", " really thinks gmod is a good game", " can't afford a better pc lmao", ", so how do you like your 40 fps?", " will definitely kill himself before his 30's ", " is a fucking virgin lmao", " is a script kiddie", " thinks his 12cm penis is big lmfao", ", how does it feel when you've never seen a naked woman in person?", ", what do you like not being able to do a single push-up?", ", tell me how it feels to be shorter than every girl you've met", " is a fatass who only spends his time in front of a monitor like an incel", "'s parents have a lower than average income", " lives under a bridge lmao", " vapes because is too afraid to smoke an actual ciggarette", ", your low self esteem really pays off you loser", ", make sure you tell me what unemployment feels like", " lives off of his parents' money", ", you're a dissapointment to your entire family, fatass", " has probably fried all of his dopamine receptors by masturbating this much",}
	local advertise = {"IdiotBox - https://phizzofficial.wixsite.com/idiotbox4gmod/", "IdiotBox - Destroying everyone since '16.", "IdiotBox - Easy to use, free Garry's Mod cheat.", "IdiotBox - Now you can forget that negative KD's can be possible.", "IdiotBox - Beats all of your other cheats.", "IdiotBox - IdiotBox came back, and it came back with a vengeance.", "IdiotBox - Join the Discord server if you have a high IQ.", "IdiotBox - The only high-quality free cheat, out for Garry's Mod.", "IdiotBox - Best cheat, created by Phizz & more.", "IdiotBox - Always updated, never dead.", "IdiotBox - A highly reliable and optimised cheating software.", "IdiotBox - Top class, free cheat for Garry's Mod.", "IdiotBox - Makes noobs cry waves of tears since forever!", "IdiotBox - Say goodbye to the respawn room!", "IdiotBox - Download the highest quality Garry's Mod cheat for free now!", "IdiotBox - A reliable way to go!", "IdiotBox - Make Garry's Mod great again!", "IdiotBox - Visit our website for fresh Discord invite links!", "IdiotBox - Monthly bugfixes & updates. It never gets outdated!", "IdiotBox - Download IdiotBox v6.9.b4 right now!", "IdiotBox - Bug-free and fully customizable!", "IdiotBox - Join our Steam group and Discord server to stay up-to-date!", "IdiotBox - Refund all your cheats, use this better and free alternative!", "IdiotBox - Now with more features than ever!", "IdiotBox - The best Garry's Mod cheat, with 24/7 support, for free!", "IdiotBox - Bypasses most anti-cheats and screengrabbers!",}
	local toxicadvertise = {"Get IdiotBox you fucking smelly niggers", "IdiotBox is the best fucking cheat and that is a fact", "All of you are fucking autistic for not having IdiotBox", "Why the fuck don't you get IdiotBox lol", "Stay being gay or get IdiotBox", "Your moms should know that you play grown-up games, join our Discord to prove you are not under-aged", "I have your IPs you dumb niggers, I will delete the IPs if you get IdiotBox", "You all fucking smell like shit for not using IdiotBox", "IdiotBox makes kiddos cry and piss their pants maybe and maybe shit and cum", "IdiotBox is the best free cheat in the history of the entire world so get it faggots", "Download IdiotBox at https://phizzofficial.wixsite.com/idiotbox4gmod/ or you're retarded", "Join our fucking Discord or else you are literally an unpriviledged niggers", "IdiotBox is a cheat for people with high IQ only, use IdiotBox to prove you're smart", "Don't wanna get fucking raped? Get IdiotBox and shit on them skids", "This is the best free paste around, no other paste is better than IdiotBox", "How the fuck are you not using IdiotBox in a shitty dying game lmfao", "IdiotBox is the best and most popular Garry's Mod cheat ever, why are you not using it lol", "May cause a bit of lag but it's worth it for the fuckton of features that it has", "You're all faggots if you don't cheat with IdiotBox", "You literally go to pride month parades if you don't use IdiotBox", "Idiotbox is the highest quality, most popular free cheat, just get it already", "Shit on all of the virgins that unironically play this game with this high-quality cheat", "Get good, get IdiotBox you fucking retards", "You're mad retarded if you are not using IdiotBox, no cap", "Own every single retard in HvH with this superior cheat now", "All of you are dumb niggers for not downloading IdiotBox and that is a fact", "You suck fat cocks in public bathrooms if you're not using IdiotBox", "Just get this god-like cheat already and rape all existing servers", "No you idiots, you can't get VAC banned for using lua scripts you absolute cretins", "IdiotBox bypasses even the most complex anti-cheats and screengrabbers, you're not getting banned anytime soon", "Just use IdiotBox to revert your sad lives and feel better about yourselves", "Phizz is a god because he made this god-like cheat called IdiotBox", "I am forced to put IdiotBox in almost every sentence and advertise in a toxic way because I'm a text in a lua script", "Why are you fucking gay? Get IdiotBox today", "The sentence above is a rhyme but the script says to put random sentences so I don't think you can see it, get IdiotBox btw", "Purchase IdiotBox now! Only for OH wait it's free", "It is highly recommended that you get IdiotBox in case of getting pwned", "You are swag and good looking, but only if you get IdiotBox", "Phizz spent so many fucking nights creating this masterpiece of a cheat so get it now or he will legit kill you", "Fuck you and get IdiotBox now lol", "IdiotBox is constantly getting updated with dope-ass features, it never gets outdated so just get it", "Have IdiotBox installed if you're mega straight and zero gay", "Whoever the fuck said lua cheats are bad deserves to die in a house fire", "You get IdiotBox, everyone else on the server gets pwned, ez as that", "Many cheats copied IdiotBox, but this is the original one, fucking copycats", "Join the fucking Discord, promise it won't hurt you faggots", "Download IdiotBox at https://phizzofficial.wixsite.com/idiotbox4gmod/ right this moment or I will hire a hitman to kill you", "Join the IdiotBox group at OH wait niggers got mad and mass-reported it, kys shitkids", "Nvm, Steam group is back lol get fucked you mad skid shitkids", "IdiotBox killed all of the paid cheats because it's too good", "Get IdiotBox, it's free and very good, you sacks of crying shit", "IdiotBox is the fucking G.O.A.T.", "What the fuck are you doing not using this god-like cheat lol", "This is an epic fucking cheat called IdiotBox that was created by Phizz and others, worship your new gods kiddos", "You were fed cock milk as a baby if you're not using IdiotBox and you can not prove me wrong", "IdiotBox has the dopest anti-aims and resolvers you'll ever use, you will be a HvH god", "Just please get IdiotBox already you retards, I am tired of typing these lines for fuck's sake", "Phizz will give everyone optimized IdiotBox soon so quit your shit", "IdiotBox needs no Steam group, we're too chad for one", "Our Discord was tapped at some point but IdiotBox is back and stronger than ever", "IdiotBox came back to kill silly niggers, and it came back with a vengeance", "Download Idiotbox v6.9.b4 now, you dont even know what you're missing you mongoloids", "Have I told you about IdiotBox, the best Garry's Mod cheat ever made??", "Holy shit, IdiotBox for Garry's Mod is the best cheat that I have ever used!!",}
	local lmaoboxadvertise = {"www.IB4G.net - https://phizzofficial.wixsite.com/idiotbox4gmod/", "www.IB4G.net - WORST FRAMERATE, BEST FEATURES!", "www.IB4G.net - WHAT ARE YOU WAITING FOR?", "www.IB4G.net - BEST GARRY'S MOD CHEAT OUT RIGHT NOW!", "www.IB4G.net - SAY GOODBYE TO THE RESPAWN ROOM!", "www.IB4G.net - NO SKILL REQUIRED!", "www.IB4G.net - NEVER DIE AGAIN WITH THIS!", "www.IB4G.net - ONLY HIGH IQ NIGGAS' USE IDIOTBOX!", "www.IB4G.net - THE GAME IS NOT ACTUALLY DYING, I JUST LIKE TO ANNOY KIDS LOL!", "www.IB4G.net - DOWNLOAD THE CHEAT FOR FREE!", "www.IB4G.net - NOW WITH AUTOMATIC UPDATES!", "www.IB4G.net - GUARANTEED SWAG AND RESPECT ON EVERY SERVER!", "www.IB4G.net - IDIOTBOX COMING SOON TO TETIRS!", "www.IB4G.net - VISIT OUR WEBSITE FOR A FRESH INVITE LINK TO OUR DISCORD!", "www.IB4G.net - PHIZZ IS A GOD FOR MAKING THIS!", "www.IB4G.net - BECOME THE SERVER MVP IN NO TIME!", "www.IB4G.net - 100% NO SKILL REQUIRED!", "www.IB4G.net - BEST CHEAT, MADE BY THE CHINESE COMMUNIST PARTY!", "www.IB4G.net - MAKE IDIOTBOX GREAT AGAIN!", "www.IB4G.net - WHY ARE YOU NOT CHEATING IN A DYING GAME?", "www.IB4G.net - RUINING EVERYONE'S FUN SINCE 2016!", "www.IB4G.net - IT'S PASTED, BUT IT'S THE BEST PASTE YOU WILL EVER USE!", "www.IB4G.net - A VERY CLEAN, HIGH-QUALITY AND BUG-FREE PASTE!", "www.IB4G.net - ALWAYS UPDATED! NEVER GETS OUTDATED!", "www.IB4G.net - WITH A FUCK TON OF NEW FEATURES!", "www.IB4G.net - ONCE YOU GO BLACK, YOU NEVER GO BACK. GET IDIOTBOX NOW!", "www.IB4G.net - SACRIFICE A FEW FRAMES FOR THE BEST EXPERIENCE OF YOUR LIFE!", "www.IB4G.net - STEAM GROUP WAS TAKEN DOWN, BUT IT'S BACK BABY!", "www.IB4G.net - BEST GARRY'S MOD CHEAT, NO CAP!", "www.IB4G.net - WITH IDIOTBOX, YOU'LL NEVER GET BANNED FOR CHEATING AGAIN!", "www.IB4G.net - DISCORD SERVER WAS TAKEN DOWN MANY TIMES, BUT WE ALWAYS COME BACK!",}
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
	if (!randply:IsValid() || randply == me || (friendstatus == "friend") || (gBool("Main Menu", "Priority List", "Enabled") && table.HasValue(ignorelist, randply:UniqueID())) || (gBool("Main Menu", "Priority List", "Enabled") && gBool("Miscellaneous", "Chat", "Priority Targets Only") && !table.HasValue(prioritylist, randply:UniqueID()))) then return end
		RunConsoleCommand("say", randply:Name()..insultspam[math.random(#insultspam)])
	elseif (gOption("Miscellaneous", "Chat", "Chat Spam:") == "Message Spam") then
		local v = player.GetAll()[math.random(#player.GetAll())]
		if (gBool("Main Menu", "Priority List", "Enabled") && table.HasValue(ignorelist, v:UniqueID())) || (gBool("Main Menu", "Priority List", "Enabled") && gBool("Miscellaneous", "Chat", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID())) then return end
		if (v != me && v:GetFriendStatus() != "friend" && !pm.IsAdmin(v)) then
			me:ConCommand("ulx psay \""..v:Nick().."\" "..messagespam[math.random(#messagespam)])
		end
	end
end

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

local function PlayerChams(v)
	local col = (contributors[v:SteamID()] || creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetChamsColor(v)
	local wep = v:GetActiveWeapon()
	if (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID())) then
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
		render.MaterialOverride(chamsmat1)
		render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
	em.DrawModel(wep)
		render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
		render.MaterialOverride(chamsmat2)
	em.DrawModel(wep)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	cam.Start3D()
		render.MaterialOverride(chamsmat1)
		render.SetColorModulation(col.b / 255, col.r / 255, col.g / 255)
	em.DrawModel(v)
		render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
		render.MaterialOverride(chamsmat2)
	em.DrawModel(v)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	if gOption("Visuals", "Wallhack", "Chams:") == "Flat" then
	if wep:IsValid() then
	cam.Start3D()
		render.MaterialOverride(chamsmat3)
		render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
	em.DrawModel(wep)
		render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
		render.MaterialOverride(chamsmat4)
	em.DrawModel(wep)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	cam.Start3D()
		render.MaterialOverride(chamsmat3)
		render.SetColorModulation(col.b / 255, col.r / 255, col.g / 255)
	em.DrawModel(v)
		render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
		render.MaterialOverride(chamsmat4)
	em.DrawModel(v)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	if gOption("Visuals", "Wallhack", "Chams:") == "Wireframe" then
	if wep:IsValid() then
	cam.Start3D()
		render.MaterialOverride(chamsmat5)
		render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
	em.DrawModel(wep)
		render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
		render.MaterialOverride(chamsmat6)
	em.DrawModel(wep)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	cam.Start3D()
		render.MaterialOverride(chamsmat5)
		render.SetColorModulation(col.b / 255, col.r / 255, col.g / 255)
	em.DrawModel(v)
		render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
		render.MaterialOverride(chamsmat6)
	em.DrawModel(v)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
end

local function EntityChams(v)
	if gOption("Visuals", "Miscellaneous", "Entity Chams:") == "Model" then
	cam.Start3D()
		cam.IgnoreZ(true)
	em.DrawModel(v)
		cam.IgnoreZ(false)
	cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "Entity Chams:") == "Normal" then
	cam.Start3D()
		render.MaterialOverride(chamsmat1)
		render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
	em.DrawModel(v)
		render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
		render.MaterialOverride(chamsmat2)
	em.DrawModel(v)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "Entity Chams:") == "Flat" then
	cam.Start3D()
		render.MaterialOverride(chamsmat3)
		render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
	em.DrawModel(v)
		render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
		render.MaterialOverride(chamsmat4)
	em.DrawModel(v)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "Entity Chams:") == "Wireframe" then
	cam.Start3D()
		render.MaterialOverride(chamsmat5)
		render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
	em.DrawModel(v)
		render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
		render.MaterialOverride(chamsmat6)
	em.DrawModel(v)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
end

local function NPCChams(v)
	if gOption("Visuals", "Miscellaneous", "NPC Chams:") == "Model" then
	cam.Start3D()
		cam.IgnoreZ(true)
	em.DrawModel(v)
		cam.IgnoreZ(false)
	cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "NPC Chams:") == "Normal" then
	cam.Start3D()
		render.MaterialOverride(chamsmat1)
		render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
	em.DrawModel(v)
		render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
		render.MaterialOverride(chamsmat2)
	em.DrawModel(v)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "NPC Chams:") == "Flat" then
	cam.Start3D()
		render.MaterialOverride(chamsmat3)
		render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
	em.DrawModel(v)
		render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
		render.MaterialOverride(chamsmat4)
	em.DrawModel(v)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "NPC Chams:") == "Wireframe" then
	cam.Start3D()
		render.MaterialOverride(chamsmat5)
		render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
	em.DrawModel(v)
		render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
		render.MaterialOverride(chamsmat6)
	em.DrawModel(v)
		render.SetColorModulation(1, 1, 1)
	cam.End3D()
	end
end

local function TransparentWalls()
    local mats = em.GetMaterials(game.GetWorld())
        for k, v in next, mats do
            local material = Material(v)
            if (!gBool("Visuals", "Textures", "Transparent Walls")) then
                im.SetFloat(material, "$alpha", 1)
			continue
        end
        im.SetFloat(material, "$alpha", 0.83)
    end
end

if (clForwardSpeedCvar) then
	forwardspeedval = clForwardSpeedCvar:GetFloat()
end

if (clSideSpeedCvar) then
	sidespeedval = clSideSpeedCvar:GetFloat()
end

local function ClampMove(cmd)
	if (cmd:GetForwardMove() > forwardspeedval) then
		cmd:SetForwardMove(forwardspeedval)
	end
	if (cmd:GetSideMove() > sidespeedval) then
		cmd:SetSideMove(sidespeedval)
	end
end

local function FixMove(cmd, rotation)
	local rot_cos = math.cos(rotation)
	local rot_sin = math.sin(rotation)
	local cur_forwardmove = cmd:GetForwardMove()
	local cur_sidemove = cmd:GetSideMove()
	cmd:SetForwardMove(((rot_cos * cur_forwardmove) - (rot_sin * cur_sidemove)))
	cmd:SetSideMove(((rot_sin * cur_forwardmove) + (rot_cos * cur_sidemove)))
end

local function Circle(cmd)
	local CircleStrafeSpeed = gInt("Miscellaneous", "Movement", "Circle Strafe Speed:")
	if gKey("Miscellaneous", "Movement", "Circle Strafe Key:") then
		circlestrafeval = circlestrafeval + CircleStrafeSpeed
		if ((circlestrafeval > 0) and ((circlestrafeval / CircleStrafeSpeed) > 361)) then
			circlestrafeval = 0
		end
		FixMove(cmd, math.rad((circlestrafeval - engine.TickInterval())))
		return false
	else
		circlestrafeval = 0
	end
	return true
end

local function BunnyHop(cmd)
	if (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 then return end
	if gBool("Miscellaneous", "Movement", "Bunny Hop") and gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Off" then
    local badmovetypes = {
        [MOVETYPE_NOCLIP] = true,
        [MOVETYPE_LADDER] = true,
    }
    if (badmovetypes[me:GetMoveType()] or me:IsFlagSet(1024)) then return end
    if (me:IsOnGround()) then
        if(timeHoldingSpaceOnGround > 1) then
            timeHoldingSpaceOnGround = 0
            cmd:RemoveKey(IN_JUMP)
        end
        if (cmd:KeyDown(IN_JUMP)) then
            timeHoldingSpaceOnGround = timeHoldingSpaceOnGround + 1
        end
        return
    end
    local water = me:WaterLevel() >= 2
    if water then return end
    cmd:RemoveKey(IN_JUMP)
	end
end

local function LegitStrafe(cmd)
	if !me:IsOnGround() && cmd:KeyDown(IN_JUMP) then
		cmd:RemoveKey(IN_JUMP)
		if (cmd:GetMouseX() > 1 || cmd:GetMouseX() < - 1) then
			cmd:SetSideMove(cmd:GetMouseX() > 1 && 10000 || - 10000)
		else
			cmd:SetSideMove(0)
		end
	elseif cmd:KeyDown(IN_JUMP) then
		cmd:SetForwardMove(10000)
	end
end

local function RageStrafe(cmd)
	if !me:IsOnGround() && cmd:KeyDown(IN_JUMP) then
		cmd:RemoveKey(IN_JUMP)
		if (cmd:GetMouseX() > 1 || cmd:GetMouseX() < - 1) then
			cmd:SetSideMove(cmd:GetMouseX() > 1 && 10000 || - 10000)
		else
			cmd:SetForwardMove(10000 / me:GetVelocity():Length2D())
			cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) && - 10000 || 10000)
		end
	elseif cmd:KeyDown(IN_JUMP) then
		cmd:SetForwardMove(10000)
	end
end

local function DirectionalStrafe(cmd)
	if !fixmovement then fixmovement = cm.GetViewAngles(cmd) end
	fixmovement = fixmovement + Angle(cm.GetMouseY(cmd) * GetConVarNumber("m_pitch"), cm.GetMouseX(cmd) * - GetConVarNumber("m_yaw"))
	fixmovement.x = math.Clamp(fixmovement.x, - 89, 89)
    fixmovement.y = math.NormalizeAngle(fixmovement.y)
    fixmovement.z = 0
	if !me:IsOnGround() && cmd:KeyDown(IN_JUMP) then
		cmd:RemoveKey(IN_JUMP)
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
        local velocity = me:GetVelocity()
        velocity.z = 0.0
        local forwardmove = cmd:GetForwardMove()
        local sidemove = cmd:GetSideMove()
        if (!forwardmove || !sidemove) then
            return
        end
        local flip = cmd:TickCount() % 2 == 0
        local turn_direction_modifier = flip && 1.0 || - 1.0
        local viewangles = Angle(fixmovement.x, fixmovement.y, fixmovement.z)
        if (forwardmove || sidemove) then
            cmd:SetForwardMove(0)
            cmd:SetSideMove(0)
            local turn_angle = math.atan2( - sidemove, forwardmove)
            viewangles.y = viewangles.y + (turn_angle * M_RADPI)
        elseif (forwardmove) then
            cmd:SetForwardMove(0)
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
                    cmd:SetSideMove(side_speed * turn_direction_modifier)
                else
                    viewangles.y = velocity_angles.y - velocity_degree
                    cmd:SetSideMove(side_speed)
                end
            else
                viewangles.y = velocity_angles.y + velocity_degree
                cmd:SetSideMove( - side_speed)
            end
        elseif (yaw_delta > 0) then
            cmd:SetSideMove( - side_speed)
        elseif (yaw_delta < 0) then
            cmd:SetSideMove(side_speed)
        end
        local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
        local speed = move:Length()
        local angles_move = move:Angle()
		local normalized_x = math.modf(fixmovement.x + 180, 360) - 180
        local normalized_y = math.modf(fixmovement.y + 180, 360) - 180
        local yaw = math.rad(normalized_y - viewangles.y + angles_move.y)
        if (normalized_x >= 90 || normalized_x <= - 90 || fixmovement.x >= 90 && fixmovement.x <= 200 || fixmovement.x <= - 90 && fixmovement.x <= 200) then
            cmd:SetForwardMove( - math.cos(yaw) * speed)
        else
            cmd:SetForwardMove(math.cos(yaw) * speed)
        end
		cmd:SetSideMove(math.sin(yaw) * speed)
	elseif cmd:KeyDown(IN_JUMP) then
		cmd:SetForwardMove(10000)
	end
end

local function CircleStrafe(cmd)
	local badmovetypes = {
        [MOVETYPE_NOCLIP] = true,
        [MOVETYPE_LADDER] = true,
    }
	if (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 or badmovetypes[me:GetMoveType()] or me:IsFlagSet(1024) then return end
		if !gKey("Miscellaneous", "Movement", "Circle Strafe Key:") and gOption("Miscellaneous", "Movement", "Auto Strafe:") ~= "Off" then
			if (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Legit") then
				LegitStrafe(cmd)
			elseif (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Rage") then
				RageStrafe(cmd)
			elseif (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Directional") then
				DirectionalStrafe(cmd)
			end
		elseif gKey("Miscellaneous", "Movement", "Circle Strafe Key:") and gOption("Miscellaneous", "Movement", "Auto Strafe:") ~= "Off" then
		if (cmd:KeyDown(IN_JUMP)) then
			local shouldautostrafe = Circle(cmd)
			if (!me:OnGround()) then
				if (shouldautostrafe) then
					if (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Legit") then
						LegitStrafe(cmd)
					elseif (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Rage") then
						RageStrafe(cmd)
					elseif (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Directional") then
						DirectionalStrafe(cmd)
					end
				end
				cmd:SetButtons(cmd:GetButtons() - IN_JUMP)
			end
		else
			circlestrafeval = 0
		end
	end
	ClampMove(cmd)
end

local function AutoStrafe(cmd)
    if (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 then return end
	if gBool("Miscellaneous", "Movement", "Bunny Hop") and gOption("Miscellaneous", "Movement", "Auto Strafe:") ~= "Off" then
    local badmovetypes = {
        [MOVETYPE_NOCLIP] = true,
        [MOVETYPE_LADDER] = true,
    }
    if (badmovetypes[me:GetMoveType()] or me:IsFlagSet(1024)) then return end
		if gBool("Miscellaneous", "Movement", "Circle Strafe") then
			CircleStrafe(cmd)
		elseif !gBool("Miscellaneous", "Movement", "Circle Strafe") then
			if (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Legit") then
				LegitStrafe(cmd)
			elseif (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Rage") then
				RageStrafe(cmd)
			elseif (gOption("Miscellaneous", "Movement", "Auto Strafe:") == "Directional") then
				DirectionalStrafe(cmd)
			end
		end
	end
end

local function AirCrouch(cmd)
	if em.GetMoveType(me) == MOVETYPE_NOCLIP or (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 or me:IsFlagSet(1024) then return end
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
		cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
		end
	end
end

local function TraitorDetector()
	if engine.ActiveGamemode() ~= "terrortown" then return end
	if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Traitor Finder") then
	for k, v in idiot.ipairs(idiot.ents.GetAll()) do
		local _v = v:GetOwner()
		if (_v == me) then continue end
		if (idiot.GetRoundState() == 3 and v:IsWeapon() and _v:IsPlayer() and not _v.Detected and idiot.table.HasValue(v.CanBuy, 1)) then
			if (_v:GetRole() ~= 2) then
				_v.Detected = true
				MsgY(4.3, _v:Nick().." is a Traitor. They just bought: "..v:GetPrintName())
				surface.PlaySound("npc/scanner/combat_scan1.wav")
			end
		elseif (idiot.GetRoundState() ~= 3) then
				v.Detected = false
			end
		end
	end
end

local function MurdererDetector()
	if not gBool("Main Menu", "Murder Utilities", "Murderer Finder") or engine.ActiveGamemode() ~= "murder" then return end
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
				timer.Create("ChatPrint", 4.8, 1, function() MsgY (4.3, (v:Nick().." ("..v:GetNWString("bystanderName")..") has a Magnum.")) end)
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
	if gBool("Miscellaneous", "Miscellaneous", "Flash Spam") and input.IsKeyDown(KEY_F) and not (me:IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible() or menuopen) then
		RunConsoleCommand("impulse", "100")
	end
	if gBool("Miscellaneous", "Miscellaneous", "Use Spam") and input.IsKeyDown(KEY_E) and not (me:IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible() or menuopen) then
		RunConsoleCommand("idiot_usespam")
	end
	if gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "Normal" or gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "Priority Targets" then
	local randply = player.GetAll()[math.random(#player.GetAll())]
	local friendstatus = pm.GetFriendStatus(randply)
	if (!randply:IsValid() || randply == me || friendstatus == "friend" || (gBool("Main Menu", "Priority List", "Enabled") && table.HasValue(ignorelist, randply:UniqueID())) || (gBool("Main Menu", "Priority List", "Enabled") && gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "Priority Targets" && !table.HasValue(prioritylist, randply:UniqueID()))) then return end
		box.ChangeName(randply:Name().." ")
	elseif gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "DarkRP Name" then
		namechangeTime = namechangeTime + 1
		if namechangeTime > 500 then
			RunConsoleCommand("say", "/name "..randomname[math.random(#randomname)])
			namechangeTime = 0
		end
	end
	if (gBool("Main Menu", "Others", "Apply custom name")) then
		box.ChangeName(GetConVarString("idiot_changename"))
		if not Confirmed1 then
			MsgG(3.2, "Successfully applied custom name.")
			surface.PlaySound("buttons/lightswitch2.wav")
		Confirmed1 = true
		end
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

hook.Add("Think", "Think", function()
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
	if gBool("Aim Assist", "Miscellaneous", "Manipulate Interpolation") then
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
	if engine.ActiveGamemode() == "terrortown" then
		if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Hide Round Report") then
			if not displayed then
				function CLSCORE:ShowPanel() return end
			displayed = true
			end
		end
		if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Panel Remover") then
			local pan = vgui.GetHoveredPanel()
			CheckChild(pan)
		end
		if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Traitor Finder") then
			if GetRoundState() == ROUND_ACTIVE then
				for k, v in next, ents.GetAll() do
					if not v:IsWeapon() or not v:IsValid() then continue end
					if (v:GetOwner():IsPlayer() and v:GetOwner():IsDetective()) or v:GetOwner() == me then continue end
					if not me:IsTraitor() and v:GetOwner():IsPlayer() and table.HasValue(v.CanBuy, 1) and not table.HasValue(tweps, v:GetClass()) and not table.HasValue(traitors, v:GetOwner():UniqueID()) then
						table.insert(traitors, v:GetOwner():UniqueID())
						table.insert(tweps, v:GetClass())
							chat.AddText(Color(255, 255, 255), "\n[TRAITOR FINDER LOGS]")
							chat.AddText(Color(255, 255, 255), "Detected traitor: ", Color(255, 0, 0), v:GetOwner():Nick())
							chat.AddText(Color(255, 255, 255), "Item purchased: ", Color(255, 0, 0), v:GetPrintName().."\n")
							surface.PlaySound("buttons/lightswitch2.wav")
					elseif gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Traitor Finder") and me:IsTraitor() and v:GetOwner():IsPlayer() and v:GetOwner():IsTraitor() then
						table.insert(traitors, v:GetOwner():UniqueID())
						table.insert(tweps, v:GetClass())
					end
				end
			elseif GetRoundState() == ROUND_POST and #traitors > 0 then
				table.Empty(traitors)
				table.Empty(tweps)
			end
		end
	elseif engine.ActiveGamemode() == "murder" then
		if gBool("Main Menu", "Murder Utilities", "Hide End Round Board") then
			if not displayed then
				function GAMEMODE:DisplayEndRoundBoard(data) return end
				displayed = true
			end
		end
		if gBool("Main Menu", "Murder Utilities", "Hide Footprints") then
			if not footprints then
				function GAMEMODE:DrawFootprints() return end
				footprints = true
			end
		end
		if gBool("Main Menu", "Murder Utilities", "No Black Screens") then
			if not blackscreen then
				function GAMEMODE:RenderScreenspaceEffects() return end
				function GAMEMODE:PostDrawHUD() return end
				blackscreen = true
			end
		end
		if me:Alive() or me:Health() > 0 then
		local tauntspam = {"funny", "help", "scream", "morose",}
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
	elseif engine.ActiveGamemode() == "darkrp" then
		if gBool("Main Menu", "DarkRP Utilities", "Suicide Near Arrest Batons") and (me:Alive() or me:Health() > 0) then
			for k, v in next, player.GetAll() do
				if not v:IsValid() or v:Health() < 1 or v:IsDormant() or v == me or (gBool("Aim Assist", "Aim Priorities", "Ignore Friends") and v:GetFriendStatus() == "friend") then continue end
				if v:GetPos():Distance(me:GetPos()) < 95 and v:GetActiveWeapon():GetClass() == "arrest_stick" and me:GetPos():Distance(v:GetEyeTrace().HitPos) < 105 then
					me:ConCommand("kill")
				end
			end
		end
		if gBool("Main Menu", "DarkRP Utilities", "Transparent Props") then
			for k, v in next, ents.FindByClass("prop_physics") do
				v:SetRenderMode(RENDERMODE_TRANSCOLOR)
				v:SetKeyValue("renderfx", 0)
				v:SetColor(Color(255, 255, 255, gInt("Main Menu", "DarkRP Utilities", "Transparency:")))
			end
			if loopedprops then
				loopedprops = false
			end
		else
			if not loopedprops then
				for k, v in next, ents.FindByClass("prop_physics") do
					v:SetColor(Color(255, 255, 255, 255))
				end
					loopedprops = true
				end
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
	local skycvar = GetConVar("r_3dsky")
	if (gBool("Visuals", "Textures", "Remove 3D Skybox") and skycvar:GetBool() == true) then
        RunConsoleCommand("r_3dsky", "0")
    elseif (!gBool("Visuals", "Textures", "Remove 3D Skybox") and skycvar:GetBool() == false) then
        RunConsoleCommand("r_3dsky", "1")
    end
end)

hook.Add("CalcViewModelView", "CalcViewModelView", function(wep, vm, oldPos, oldAng, pos, ang)
	if gBool("Miscellaneous", "Viewmodel", "Custom Positions") then
		local overridepos = Vector(gInt("Miscellaneous", "Viewmodel", "Viewmodel X:") - 50, gInt("Miscellaneous", "Viewmodel", "Viewmodel Y:") - 30, gInt("Miscellaneous", "Viewmodel", "Viewmodel Z:") - 20)
		local overrideang = Angle(gInt("Miscellaneous", "Viewmodel", "Viewmodel Pitch:") - 90, gInt("Miscellaneous", "Viewmodel", "Viewmodel Yaw:") - 90, gInt("Miscellaneous", "Viewmodel", "Viewmodel Roll:") - 90)
		ang = ang * 1
		ang:RotateAroundAxis(ang:Right(), overrideang.x * 1.0)
		ang:RotateAroundAxis(ang:Up(), overrideang.y * 1.0)
		ang:RotateAroundAxis(ang:Forward(), overrideang.z * 1.0)
		pos = pos + overridepos.x * ang:Right() * 1.0
		pos = pos + overridepos.y * ang:Forward() * 1.0
		pos = pos + overridepos.z * ang:Up() * 1.0 
    end
	return pos, ang
end)

hook.Add("PreDrawSkyBox", "PreDrawSkyBox", function()
	if (!gBool("Visuals", "Textures", "Remove Sky")) then return end
		render.Clear(0, 0, 0, 255)
	return true
end)

hook.Add("PreDrawViewModel", "PreDrawViewModel", function()
	if ThirdpersonCheck() then return end
	local rainbow = HSVToColor(RealTime() * 45 % 360, 1, 1)
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Chams:") == "Normal") then
		render.MaterialOverride(chamsmat2)
		render.SetColorModulation(viewmodelcol.r / 255, viewmodelcol.g / 255, viewmodelcol.b / 255)
	end
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Chams:") == "Normal") and gBool("Miscellaneous", "Viewmodel", "Rainbow Mode") then
		render.MaterialOverride(chamsmat2)
		render.SetColorModulation(rainbow.r / 255, rainbow.g / 255, rainbow.b / 255)
	end
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Chams:") == "Flat") then
		render.MaterialOverride(chamsmat4)
		render.SetColorModulation(viewmodelcol.r / 255, viewmodelcol.g / 255, viewmodelcol.b / 255)
	end
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Chams:") == "Flat") and gBool("Miscellaneous", "Viewmodel", "Rainbow Mode") then
		render.MaterialOverride(chamsmat4)
		render.SetColorModulation(rainbow.r / 255, rainbow.g / 255, rainbow.b / 255)
	end
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Chams:") == "Wireframe") then
		render.MaterialOverride(chamsmat6)
		render.SetColorModulation(viewmodelcol.r / 255, viewmodelcol.g / 255, viewmodelcol.b / 255)
	end
	if (gOption("Miscellaneous", "Viewmodel", "Viewmodel Chams:") == "Wireframe") and gBool("Miscellaneous", "Viewmodel", "Rainbow Mode") then
		render.MaterialOverride(chamsmat6)
		render.SetColorModulation(rainbow.r / 255, rainbow.g / 255, rainbow.b / 255)
	end
	if (gBool("Miscellaneous", "Viewmodel", "No Viewmodel") or ThirdpersonCheck()) then
		return true
	else
		return false
	end
end)

hook.Add("PreDrawPlayerHands", "PreDrawPlayerHands", function()
	if (gBool("Miscellaneous", "Viewmodel", "No Hands") or ThirdpersonCheck()) then
		return true
	else
		return false
	end
end)

local function AutoReload(cmd)
	local wep = me:GetActiveWeapon()
	if not gBool("Aim Assist", "Miscellaneous", "Auto Reload") then return end
	if (me:Alive() or me:Health() > 0) and idiot.IsValid(wep) then
		if (wep:Clip1() <= (wep:GetMaxClip1() - 1) and wep:GetMaxClip1() > 0 and idiot.CurTime() > wep:GetNextPrimaryFire()) then
			cmd:SetButtons(cmd:GetButtons() + IN_RELOAD)
		end
	end
end

local function Visuals(v)
	local pos = em.GetPos(v)
	local min, max = em.GetCollisionBounds(v)
	local pos2 = pos + Vector(0, 0, max.z)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local h = pos.y - pos2.y
	local w = h / 2
	local ww = h / 4
	local colOne = (contributors[v:SteamID()] || creator[v:SteamID()]) && Color(0, 0, 0) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local colTwo = (contributors[v:SteamID()] || creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || Color(0, 0, 0)
	local colThree = (contributors[v:SteamID()] || creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local colFour = (contributors[v:SteamID()] || creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b)
	local colFive = gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b)
	local healthcol = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0)
	local armorcol = Color((100 - v:Armor()) * 2.55, v:Armor() * 2.55, v:Armor() * 2.55)
	local pingcol = Color(v:Ping() * 2.55, 255 - v:Ping() - 5 * 2, 0)
	local moneycol = Color(0, 255, 0)
	local textcol = Color(255, 255, 255)
	local friendcol = Color(0, 255, 255)
	local devcol = HSVToColor(RealTime() * 45 % 360, 1, 1)
	local ignoredcol = Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)
	local prioritycol = Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)
	local misccol = Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b)
	local hh = 0
	if (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID())) then
		return false
	end
	if gOption("Visuals", "Wallhack", "Box:") == "2D Box" then
		surface.SetDrawColor(colOne)
		surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h)
		surface.SetDrawColor(colTwo)
		surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2)
		surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2)
	elseif gOption("Visuals", "Wallhack", "Box:") == "3D Box" then
	for k, v in pairs(player.GetAll()) do
	if (!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (v:Team() == TEAM_SPECTATOR and gBool("Visuals", "Miscellaneous", "Show Spectators")) or ((gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID()))) then continue end
	if v:IsValid() and v:Alive() and v:Health() > 0 then
		local eye = v:EyeAngles()
		local min, max = v:WorldSpaceAABB()
		local origin = v:GetPos()
		if gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(ignorelist, v:UniqueID()) and !(contributors[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, ignoredcol)
			cam.End3D()
		elseif gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(prioritylist, v:UniqueID()) and !(contributors[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, prioritycol)
			cam.End3D()
		elseif gBool("Visuals", "Miscellaneous", "Team Colors") and !(contributors[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, team.GetColor(pm.Team(v)))
			cam.End3D()
		elseif (contributors[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, devcol)
			cam.End3D()
		elseif !(contributors[v:SteamID()] || creator[v:SteamID()]) then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, GetColor(v))
			cam.End3D()
				end
			end
		end
	elseif (gBool("Visuals", "Wallhack", "Enabled") && gOption("Visuals", "Wallhack", "Box:") == "Edged Box") then   
	x1, y1, x2, y2 = ScrW() * 2, ScrH() * 2, - ScrW(), - ScrH()
		corners = {v:LocalToWorld(Vector(min.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, min.y, max.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, max.z)):ToScreen()}
		for _k, _v in next, corners do
			x1, y1 = math.min(x1, _v.x), math.min(y1, _v.y)
			x2, y2 = math.max(x2, _v.x), math.max(y2, _v.y)
		end
		diff, diff2 = math.abs(x2 - x1), math.abs(y2 - y1)
		surface.SetDrawColor(colThree)
		surface.DrawLine(x1, y1, x1 + (diff * 0.225), y1)
		surface.DrawLine(x1, y1, x1, y1 + (diff2 * 0.225))
		surface.DrawLine(x1, y2, x1 + (diff * 0.225), y2)
		surface.DrawLine(x1, y2, x1, y2 - (diff2 * 0.225))
		surface.DrawLine(x2, y1, x2 - (diff * 0.225), y1)
		surface.DrawLine(x2, y1, x2, y1 + (diff2 * 0.225))
		surface.DrawLine(x2, y2, x2 - (diff * 0.225), y2)
		surface.DrawLine(x2, y2, x2, y2 - (diff2 * 0.225))
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
		surface.SetDrawColor((100 - v:Armor()) * 2.55, v:Armor() * 2.55, v:Armor() * 2.55, 255)
		surface.DrawRect(pos.x + ww + 4, pos.y - h + diff, 3, armor)
	end
	if (gBool("Visuals", "Wallhack", "Name")) then
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") then
		draw.SimpleText("Friend", "VisualsFont", pos.x, pos.y - h - 13 - 13, friendcol, 1, 1)
		end
		if (gBool("Visuals", "Wallhack", "Bystander Name") && engine.ActiveGamemode() == "murder") then
		draw.SimpleText(v:GetNWString("bystanderName"), "VisualsFont", pos.x, pos.y - h - 1 - (friendstatus == "friend" && 12 || 12), textcol, 1, 1)
		else
		draw.SimpleText(pm.Name(v), "VisualsFont", pos.x, pos.y - h - 1 - (friendstatus == "friend" && 12 || 12), textcol, 1, 1)
	end
	end
	if (gBool("Visuals", "Wallhack", "Enabled") and gBool("Visuals", "Wallhack", "Name")) then
		local friendstatus = pm.GetFriendStatus(v)
		if (friendstatus == "friend") then
			if creator[v:SteamID()] then
				draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 26 - 13, devcol, 1, 1)
			end
			if contributors[v:SteamID()] then
				draw.SimpleText("IdiotBox Contributor", "VisualsFont", pos.x, pos.y - h - 26 - 13, devcol, 1, 1)
			end
		end
		if (friendstatus ~= "friend") then
			if creator[v:SteamID()] then
				draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 13 - 13, devcol, 1, 1)
			end
			if contributors[v:SteamID()] then
				draw.SimpleText("IdiotBox Contributor", "VisualsFont", pos.x, pos.y - h - 13 - 13, devcol, 1, 1)
			end
		end
		if (friendstatus == "friend") and (creator[v:SteamID()] or contributors[v:SteamID()]) then
			if table.HasValue(ignorelist, v:UniqueID()) then
				draw.SimpleText("Ignored Target", "VisualsFont", pos.x, pos.y - h - 39 - 13, ignoredcol, 1, 1)
			end
			if table.HasValue(prioritylist, v:UniqueID()) then
				draw.SimpleText("Priority Target", "VisualsFont", pos.x, pos.y - h - 39 - 13, prioritycol, 1, 1)
			end
		end
		if (friendstatus == "friend") and not (creator[v:SteamID()] or contributors[v:SteamID()]) then
			if table.HasValue(ignorelist, v:UniqueID()) then
				draw.SimpleText("Ignored Target", "VisualsFont", pos.x, pos.y - h - 26 - 13, ignoredcol, 1, 1)
			end
			if table.HasValue(prioritylist, v:UniqueID()) then
				draw.SimpleText("Priority Target", "VisualsFont", pos.x, pos.y - h - 26 - 13, prioritycol, 1, 1)
			end
		end
		if (friendstatus ~= "friend") and (creator[v:SteamID()] or contributors[v:SteamID()]) then
			if table.HasValue(ignorelist, v:UniqueID()) then
				draw.SimpleText("Ignored Target", "VisualsFont", pos.x, pos.y - h - 26 - 13, ignoredcol, 1, 1)
			end
			if table.HasValue(prioritylist, v:UniqueID()) then
				draw.SimpleText("Priority Target", "VisualsFont", pos.x, pos.y - h - 26 - 13, prioritycol, 1, 1)
			end
		end
		if (friendstatus ~= "friend") and not (creator[v:SteamID()] or contributors[v:SteamID()]) then
			if table.HasValue(ignorelist, v:UniqueID()) then
				draw.SimpleText("Ignored Target", "VisualsFont", pos.x, pos.y - h - 13 - 13, ignoredcol, 1, 1)
			end
			if table.HasValue(prioritylist, v:UniqueID()) then
				draw.SimpleText("Priority Target", "VisualsFont", pos.x, pos.y - h - 13 - 13, prioritycol, 1, 1)
			end
		end
	end
	if (gBool("Visuals", "Wallhack", "Health Value")) then
	hh = hh + 1
	draw.SimpleText("Health: "..em.Health(v), "VisualsFont", pos.x, pos.y - 1 + hh, healthcol, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Armor Value")) then
	hh = hh + 1
	draw.SimpleText("Armor: "..v:Armor(), "VisualsFont", pos.x, pos.y - 1 + hh, armorcol, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Weapon")) then
	hh = hh + 1
	local w = pm.GetActiveWeapon(v)
	if (w && em.IsValid(w)) then
	draw.SimpleText("Weapon: "..language.GetPhrase(w:GetPrintName()), "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	end
	end
	if (gBool("Visuals", "Wallhack", "Rank")) then
	hh = hh + 1
	draw.SimpleText("Rank: "..pm.GetUserGroup(v), "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Distance")) then
	hh = hh + 1
	draw.SimpleText("Distance: "..math.Round(v:GetPos():Distance(me:GetPos()) / 40), "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Velocity")) then
	hh = hh + 1
	draw.SimpleText("Velocity: "..math.Round(v:GetVelocity():Length()), "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	end
	if gBool("Visuals", "Wallhack", "Conditions") and v:IsPlayer() then
	if v:InVehicle() then
	hh = hh + 1
	draw.SimpleText("Condition: *driving*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:GetMoveType() == MOVETYPE_NOCLIP then
	hh = hh + 1
	draw.SimpleText("Condition: *noclipping*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:IsDormant() then
	hh = hh + 1
	draw.SimpleText("Condition: *dormant*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:IsFlagSet(2) then
	hh = hh + 1
	draw.SimpleText("Condition: *crouching*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:GetMoveType() == MOVETYPE_LADDER then
	hh = hh + 1
	draw.SimpleText("Condition: *climbing*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:GetColor(v).a < 255 then
	hh = hh + 1
	draw.SimpleText("Condition: *spawning*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:IsFlagSet(64) then
	hh = hh + 1
	draw.SimpleText("Condition: *frozen*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:IsPlayingTaunt() then
	hh = hh + 1
	draw.SimpleText("Condition: *emoting*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:IsFlagSet(1024) then
	hh = hh + 1
	draw.SimpleText("Condition: *swimming*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:IsSprinting() then
	hh = hh + 1
	draw.SimpleText("Condition: *sprinting*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:IsTyping() then
	hh = hh + 1
	draw.SimpleText("Condition: *typing*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	elseif v:GetMoveType() == MOVETYPE_WALK or v:GetMoveType() == MOVETYPE_NONE then
	hh = hh + 1
	draw.SimpleText("Condition: *none*", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	hh = hh + 9
	end
	end
	if (gBool("Visuals", "Wallhack", "Steam ID")) then
	hh = hh + 1
	if (v:SteamID() ~= "NULL") then
	draw.SimpleText("SteamID: "..v:SteamID(v), "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	else
	draw.SimpleText("SteamID: BOT", "VisualsFont", pos.x, pos.y - 0 + hh, textcol, 1, 0)
	end
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "Ping")) then
	hh = hh + 1
	draw.SimpleText("Ping: "..v:Ping().."ms", "VisualsFont", pos.x, pos.y - 0 + hh, pingcol, 1, 0)
	hh = hh + 9
	end
	if (gBool("Visuals", "Wallhack", "DarkRP Money")) then
	hh = hh + 1
	if (gmod.GetGamemode().Name == "DarkRP") then
	if (v:getDarkRPVar("money") == nil) then return end
	draw.SimpleText("Money: $"..v:getDarkRPVar("money"), "VisualsFont", pos.x, pos.y - 0 + hh, moneycol, 1, 0)
	hh = hh + 9
	end
	end
	if (gBool("Visuals", "Wallhack", "Skeleton")) then
		local pos = em.GetPos(v)
		for i = 0, em.GetBoneCount(v) do
		local parent = em.GetBoneParent(v, i)
		local bonepos = em.GetBonePosition(v, i)
		local parentpos = em.GetBonePosition(v, parent)
		if (!parent) or (bonepos == pos) or (!bonepos || !parentpos) then continue end
		local screen1, screen2 = vm.ToScreen(bonepos), vm.ToScreen(parentpos)
		surface.SetDrawColor(colFour)
		surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
		end
	end
	if (gBool("Visuals", "Wallhack", "Glow")) then
		local wep = v:GetActiveWeapon()
		halo.Add({v, wep}, colFour, .55, .55, 5, true, true)
	end
	idiot.cam.Start3D()
		if (gBool("Visuals", "Wallhack", "Vision Line")) then
			local b1, b2 = v:EyePos(), v:GetEyeTrace().HitPos
			idiot.render.DrawLine(b1, b2, colFour)
			idiot.render.DrawWireframeSphere(b2, 2, 10, 10, colFour, b2)
		end
	idiot.cam.End3D()
	if (gBool("Visuals", "Wallhack", "Hitbox")) then
		for k, v in next, player.GetAll() do
		if (!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (v:Team() == TEAM_SPECTATOR and gBool("Visuals", "Miscellaneous", "Show Spectators")) or ((gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID()))) then continue end
		if v:IsValid() and v:Alive() and v:Health() > 0 then
			for i = 0, v:GetHitBoxGroupCount() - 1 do
			for _i = 0, v:GetHitBoxCount(i) - 1 do
			local bone = v:GetHitBoxBone(_i, i)
			if not (bone) then continue end			
			local min, max = v:GetHitBoxBounds(_i, i)			
			if (v:GetBonePosition(bone)) then
			local pos, ang = v:GetBonePosition(bone)
			if gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(ignorelist, v:UniqueID()) and !(contributors[v:SteamID()] || creator[v:SteamID()]) then
				cam.Start3D()
					render.DrawWireframeBox(pos, ang, min, max, ignoredcol)
				cam.End3D()
			elseif gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(prioritylist, v:UniqueID()) and !(contributors[v:SteamID()] || creator[v:SteamID()]) then
				cam.Start3D()
					render.DrawWireframeBox(pos, ang, min, max, prioritycol)
				cam.End3D()
			elseif gBool("Visuals", "Miscellaneous", "Team Colors") and !(contributors[v:SteamID()] || creator[v:SteamID()]) then
				cam.Start3D()
					render.DrawWireframeBox(pos, ang, min, max, team.GetColor(pm.Team(v)))
				cam.End3D()
			elseif (contributors[v:SteamID()] || creator[v:SteamID()]) then
				cam.Start3D()
					render.DrawWireframeBox(pos, ang, min, max, devcol)
				cam.End3D()
			elseif !(contributors[v:SteamID()] || creator[v:SteamID()]) then
				cam.Start3D()
					render.DrawWireframeBox(pos, ang, min, max, misccol)
				cam.End3D()
			end
		end
			end
		end
			end
		end
	end
end

local function OnScreen(v)
	if math.abs(v:LocalToWorld(v:OBBCenter()):ToScreen().x) < ScrW() * 5 and math.abs(v:LocalToWorld(v:OBBCenter()):ToScreen().y) < ScrH() * 5 then
		return true
	else
		return false
	end
end

hook.Add("RenderScreenspaceEffects", "RenderScreenspaceEffects", function()
	if not gBool("Visuals", "Wallhack", "Enabled") or gui.IsGameUIVisible() or gui.IsConsoleVisible() or (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) or menuopen then return end
	for k, v in next, player.GetAll() do
		if (not em.IsValid(v) or em.Health(v) < 1 or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or (pm.Team(v) == TEAM_SPECTATOR and not gBool("Visuals", "Miscellaneous", "Show Spectators"))) or not OnScreen(v) or not WallhackFilter(v) or not EnemyWallhackFilter(v) then continue end
		PlayerChams(v)
	end
	for k, v in next, ents.GetAll() do
		if (not gBool("Visuals", "Miscellaneous", "Show Entities") or not em.IsValid(v) or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All"))) or not OnScreen(v) or not WallhackFilter(v) then continue end
		if table.HasValue(drawnents, v:GetClass()) and v:IsValid() and v:GetPos():Distance(me:GetPos()) > 40 then
			EntityChams(v)
		end
	end
	for k, v in pairs(ents.FindByClass("npc_*")) do
		if (not gBool("Visuals", "Miscellaneous", "Show NPCs") or not em.IsValid(v) or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All"))) or not OnScreen(v) or not WallhackFilter(v) then continue end
		NPCChams(v)
	end
end)

local function ShowNPCs()
	for k, v in pairs(ents.FindByClass("npc_*")) do
	if (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or not OnScreen(v) or not WallhackFilter(v) then continue end
	local colOne = Color(0, 255, 0)
	local colTwo = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0, 255)
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
	local colOne = (Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b))
	if health < 0 then
	health = 0
	end
	local colThree = (Color(0, 0, 0))
	if v:Health() > 0 then
	if gBool("Visuals", "Miscellaneous", "NPC Box") then
		surface.SetDrawColor(colOne)
		surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h)
		surface.SetDrawColor(colThree)
		surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2)
		surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2)
	end
	if gBool("Visuals", "Miscellaneous", "NPC Name") then
		draw.SimpleText(v:GetClass(), "VisualsFont", pos.x, pos.y - h - 2 - 7, Color(255, 255, 255), 1, 1)
		surface.SetDrawColor(Color(0, 0, 0))
	end
	local colOne = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0)
	if gBool("Visuals", "Miscellaneous", "NPC Health") then
		draw.SimpleText("Health: "..health, "VisualsFont", pos.x, pos.y - 2, colOne, 1, 0)
		if (hp > h) then hp = h end
			local diff = h - hp
				surface.SetDrawColor(0, 0, 0, 255)
				surface.DrawRect(pos.x - w / 2 - 7, pos.y - h - 1, 5, h + 2)
				surface.SetDrawColor(colTwo)
				surface.DrawRect(pos.x - w / 2 - 6, pos.y - h + diff, 3, hp)
			end
		end
	end
end

hook.Add("DrawOverlay", "DrawOverlay", function()
	if gBool("Visuals", "Wallhack", "Enabled") && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) && !menuopen then
		for k, v in next, player.GetAll() do
		if ((!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or not em.IsValid(v) or em.Health(v) < 0.1 or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (pm.Team(v) == TEAM_SPECTATOR and not gBool("Visuals", "Miscellaneous", "Show Spectators"))) or not OnScreen(v) or not WallhackFilter(v) or not EnemyWallhackFilter(v) then continue end
			Visuals(v)
		end
	end
	if gBool("Visuals", "Wallhack", "Enabled") and gBool("Visuals", "Miscellaneous", "Show NPCs") && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) && !menuopen then
		ShowNPCs()
	end
	for k, v in next, ents.GetAll() do
	if engine.ActiveGamemode() == "terrortown" && gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Traitor Finder") && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) && !menuopen then
	local titems = {"weapon_ttt_turtlenade", "weapon_ttt_death_station", "weapon_ttt_tripmine", "weapon_ttt_silencedsniper", "(Disguise)", "spiderman's_swep", "weapon_ttt_trait_defilibrator", "weapon_ttt_xbow", "weapon_ttt_dhook", "weapon_awp", "weapon_ttt_ak47", "weapon_jihadbomb", "weapon_ttt_knife", "weapon_ttt_c4", "weapon_ttt_decoy", "weapon_ttt_flaregun", "weapon_ttt_phammer", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_sipistol", "weapon_ttt_teleport", "weapon_ttt_awp", "weapon_mad_awp", "weapon_real_cs_g3sg1", "weapon_ttt_cvg_g3sg1", "weapon_ttt_healthstation5", "weapon_ttt_sentry", "weapon_ttt_poison_dart", "weapon_ttt_trait_defibrillator", "weapon_ttt_tmp_s"}
		if table.HasValue(titems, v:GetClass()) then
			pos = v:GetPos()
			pos = pos:ToScreen()
			draw.DrawText(v:GetPrintName(), "MiscFont", pos.x, pos.y, Color(255,75,75), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	elseif engine.ActiveGamemode() == "murder" && gBool("Main Menu", "Murder Utilities", "Murderer Finder") && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) && !menuopen then
		if string.find(v:GetClass(), "weapon_mu_magnum") then
			pos = v:GetPos()
			pos = pos:ToScreen()
			draw.DrawText("Magnum", "MiscFont", pos.x, pos.y, Color(50,150,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if string.find(v:GetClass(), "weapon_mu_knife") then
			pos = v:GetPos()
			pos = pos:ToScreen()
			draw.DrawText("Knife", "MiscFont", pos.x, pos.y, Color(255,75,75), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if string.find(v:GetClass(), "mu_loot") then
			pos = v:GetPos()
			pos = pos:ToScreen()
			draw.DrawText("Loot", "MiscFont", pos.x, pos.y, Color(50,255,50), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	if (v:IsDormant() and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or not v:IsValid() or not OnScreen(v) or not WallhackFilter(v) or (!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) then continue end
	if gBool("Visuals", "Wallhack", "Enabled") and gBool("Visuals", "Miscellaneous", "Show Entities") && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) && !menuopen then
	if table.HasValue(drawnents, v:GetClass()) and v:IsValid() and v:GetPos():Distance(me:GetPos()) > 40 then
				local pos = em.GetPos(v) + Vector(0, 0, 0)
				local pos2 = pos + Vector(0, 0, 0)
				local pos = vm.ToScreen(pos)
				local pos2 = vm.ToScreen(pos2)
				local min, max = v:WorldSpaceAABB()
				local origin = v:GetPos()
				if gBool("Visuals", "Miscellaneous", "Entity Name") then
					draw.SimpleText(v:GetClass(), "MiscFont", pos.x, pos.y, Color(255, 255, 255), 1)
				end
				if gBool("Visuals", "Miscellaneous", "Entity Box") then
					cam.Start3D()
						render.DrawWireframeBox(origin, Angle(0, 0, 0), min - origin, max - origin, Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b), true) 
					cam.End3D()
				end
			end
		end
	end
	if gBool("Main Menu", "Priority List", "Enabled") and menuopen and ScrW() >= 1600 or ScrH() >= 1400 then
		PlayerList()
	end
	if v == me and not em.IsValid(v) then return end
	if gBool("Visuals", "Panels", "Spectators Box") && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then
		Spectator()
	end
	if gBool("Visuals", "Panels", "Radar Box") && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then
		Radar()
	end
	if gBool("Visuals", "Panels", "Custom Status") && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then
		StausTitle()
		Status()
	end
	if gBool("Visuals", "Panels", "Players List") && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then
		PlayersTitle()
		Players()
	end
	if gOption("Visuals", "Miscellaneous", "Crosshair:") ~= "Off" && !gui.IsGameUIVisible() && !gui.IsConsoleVisible() && !(IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) then
		Crosshair()
	end
	if gui.IsGameUIVisible() or gui.IsConsoleVisible() or (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) or me:IsTyping() or menuopen or (me:Team() == TEAM_SPECTATOR and not (gBool("Aim Assist", "Aim Priorities", "Target Spectators") and gBool("Main Menu", "General Utilities", "Spectator Mode"))) or not me:Alive() or me:Health() < 1 or (gBool("Aim Assist", "Triggerbot", "Enabled") and not gBool("Aim Assist", "Aimbot", "Enabled")) then return end
	for k, v in pairs(player.GetAll()) do
		if (gBool("Main Menu", "Panic Mode", "Enabled") && (gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" || gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Aimbot")) && IsValid(v:GetObserverTarget()) && v:GetObserverTarget() == me then return end
	end
	if (aimtarget and em.IsValid(aimtarget) and not FixTools() and gBool("Visuals", "Miscellaneous", "Snap Lines") and (gBool("Aim Assist", "Aimbot", "Enabled"))) then
		if me:Alive() or em.Health(me) > 0 then
			local col = Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:"))
			local pos = vm.ToScreen(em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)))
			surface.SetDrawColor(col)
			surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y)
			surface.SetDrawColor(0, 0, 0)
			surface.DrawOutlinedRect(pos.x - 2, pos.y - 2, 5, 5)
			surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:"))
			surface.DrawRect(pos.x - 1, pos.y - 1, 3, 3)
		end
	end
end)

local function AntiAFK(cmd)
	if (!gBool("Main Menu", "General Utilities", "Anti-AFK")) then
		timer.Create("afk1", 6, 0, function()
		local commands = {"moveleft", "moveright", "moveup", "movedown"}
		local command1 = table.Random(commands)
		local command2 = table.Random(commands)
		if unloaded == true or !gBool("Main Menu", "General Utilities", "Anti-AFK") then return end
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

local function AimPos(v)
	if (gOption("Aim Assist", "Aim Priorities", "Hitbox:") ~= "Head") or (v:IsPlayer() and v:IsPlayingTaunt() and gBool("Hack vs. Hack", "Resolver", "Enabled") and gBool("Hack vs. Hack", "Resolver", "Emote Resolver")) then return (em.LocalToWorld(v, em.OBBCenter(v))) end
	local eyes = em.LookupAttachment(v, "eyes")
	if (!eyes) then return(em.LocalToWorld(v, em.OBBCenter(v))) end
	local pos = em.GetAttachment(v, eyes)
	if (!pos) then return(em.LocalToWorld(v, em.OBBCenter(v))) end
	return(pos.Pos)
end

hook.Add("player_hurt", "player_hurt", function(data)
	local attacker = data.attacker
	if attacker == me:UserID() then
		if gOption("Miscellaneous", "Sounds", "Hitsounds:") ~= "Off" then
			if gOption("Miscellaneous", "Sounds", "Hitsounds:") == "Default" then
				surface.PlaySound("buttons/bell1.wav")
            elseif gOption("Miscellaneous", "Sounds", "Hitsounds:") == "Headshot 1" then
                surface.PlaySound(headshot1[math.random(#headshot1)])
			elseif gOption("Miscellaneous", "Sounds", "Hitsounds:") == "Headshot 2" then
                surface.PlaySound(headshot2[math.random(#headshot2)])
			elseif gOption("Miscellaneous", "Sounds", "Hitsounds:") == "Metal" then
                surface.PlaySound(metal[math.random(#metal)])
            elseif gOption("Miscellaneous", "Sounds", "Hitsounds:") == "Blip" then
                surface.PlaySound("buttons/blip2.wav")
			elseif gOption("Miscellaneous", "Sounds", "Hitsounds:") == "Eggcrack" then
                surface.PlaySound("phx/eggcrack.wav")
            elseif gOption("Miscellaneous", "Sounds", "Hitsounds:") == "Balloon Pop" then
                surface.PlaySound("garrysmod/balloon_pop_cute.wav")
			end
		end
	end
end)

local function Killsounds(data)
	local headshot1 = {"playerfx/headshot1.wav", "playerfx/headshot2.wav",}
	local headshot2 = {"player/headshot1.wav", "player/headshot2.wav", "player/headshot3.wav",}
	local metal = {"phx/hmetal1.wav", "phx/hmetal2.wav", "phx/hmetal3.wav",}
	local killer = idiot.Entity(data.entindex_attacker)
	local victim = idiot.Entity(data.entindex_killed)
	if (idiot.IsValid(killer) and idiot.IsValid(victim) and killer:IsPlayer() and victim:IsPlayer()) then
		if (killer == me and victim ~= me) then
			if gOption("Miscellaneous", "Sounds", "Killsounds:") ~= "Off" then
				if gOption("Miscellaneous", "Sounds", "Killsounds:") == "Default" then
					surface.PlaySound("buttons/bell1.wav")
				elseif gOption("Miscellaneous", "Sounds", "Killsounds:") == "Headshot 1" then
					surface.PlaySound(headshot1[math.random(#headshot1)])
				elseif gOption("Miscellaneous", "Sounds", "Killsounds:") == "Headshot 2" then
					surface.PlaySound(headshot2[math.random(#headshot2)])
				elseif gOption("Miscellaneous", "Sounds", "Killsounds:") == "Metal" then
					surface.PlaySound(metal[math.random(#metal)])
				elseif gOption("Miscellaneous", "Sounds", "Killsounds:") == "Blip" then
					surface.PlaySound("buttons/blip2.wav")
				elseif gOption("Miscellaneous", "Sounds", "Killsounds:") == "Eggcrack" then
					surface.PlaySound("phx/eggcrack.wav")
				elseif gOption("Miscellaneous", "Sounds", "Killsounds:") == "Balloon Pop" then
					surface.PlaySound("garrysmod/balloon_pop_cute.wav")
				end
			end
		end
	end	
end

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

hook.Add("entity_killed", "entity_killed", function(data)
	if gOption("Miscellaneous", "Sounds", "Killsounds:") ~= "Off" then
		Killsounds(data)
	end
	if gOption("Miscellaneous", "Chat", "Kill Spam:") ~= "Off" then
		KillSpam(data)
	end
	if gBool("Miscellaneous", "Chat", "Log Kills in Chat") then
		LogKills(data)
	end
end)

local function AimAssistPriorities(v)
	if gBool("Aim Assist", "Aim Priorities", "Target Players") and not gBool("Aim Assist", "Aim Priorities", "Target NPCs") then
		return v:IsPlayer()
	elseif gBool("Aim Assist", "Aim Priorities", "Target NPCs") and not gBool("Aim Assist", "Aim Priorities", "Target Players") then
		return v:IsNPC()
	elseif gBool("Aim Assist", "Aim Priorities", "Target Players") and gBool("Aim Assist", "Aim Priorities", "Target NPCs") then
		return v:IsPlayer() or v:IsNPC()
	else
		return nil
	end
end

local function Valid(v)
	local dist = gBool("Aim Assist", "Aim Priorities", "Distance:")
	local vel = gBool("Aim Assist", "Aim Priorities", "Velocity:")
    local wep = me:GetActiveWeapon()
	local maxhealth = gInt("Aim Assist", "Aim Priorities", "Max Player Health:") 
	if (!v || !em.IsValid(v) || v == me || em.Health(v) < 1 || em.IsDormant(v) || !AimAssistPriorities(v) || (v == aimignore && gOption("Aim Assist", "Aim Priorities", "Aim Priority:") == "Random")) then return false end
	if v:IsPlayer() then
	if gBool("Aim Assist", "Aim Priorities", "Distance Limit") then
		if (vm.Distance(em.GetPos(v), em.GetPos(me)) > (dist * 5)) then return false end
	end
	if gBool("Aim Assist", "Aim Priorities", "Velocity Limit") then
		if (v:GetVelocity():Length() > vel) then return false end
	end
	if gBool("Aim Assist", "Aim Priorities", "Disable in Noclip") then
		if em.GetMoveType(me) == MOVETYPE_NOCLIP then return false end
	end
	if !gBool("Aim Assist", "Aim Priorities", "Target Team") then
        if pm.Team(v) == pm.Team(me) then return false end
    end
	if !gBool("Aim Assist", "Aim Priorities", "Target Enemies") then
        if pm.Team(v) != pm.Team(me) then return false end
    end
	if !gBool("Aim Assist", "Aim Priorities", "Target Transparent Players") then
        if em.GetColor(v).a < 255 then return false end
    end
    if !gBool("Aim Assist", "Aim Priorities", "Target Steam Friends") then
        if pm.GetFriendStatus(v) == "friend" then return false end
    end
	if !gBool("Aim Assist", "Aim Priorities", "Target Bots") then
		if pm.IsBot(v) then return false end
	end
    if !gBool("Aim Assist", "Aim Priorities", "Target Admins") then
        if pm.IsAdmin(v) then return false end
    end
    if !gBool("Aim Assist", "Aim Priorities", "Target Driving Players") then
		if pm.InVehicle(v) then return false end
	end
	if !gBool("Aim Assist", "Aim Priorities", "Target Noclipping Players") then
		if em.GetMoveType(v) == MOVETYPE_NOCLIP then return false end
	end
	if !gBool("Aim Assist", "Aim Priorities", "Target Frozen Players") then
		if pm.IsFrozen(v) then return false end
	end
	if !gBool("Aim Assist", "Aim Priorities", "Target Overhealed Players") then
		if v:Health() > maxhealth then return false end
	end
	if !gBool("Aim Assist", "Aim Priorities", "Target Spectators") then
		if v:Team() == TEAM_SPECTATOR then return false end
	end
	if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Ignore Detectives as Innocent") and engine.ActiveGamemode() == "terrortown" and GetRoundState() ~= ROUND_POST and not me:IsTraitor() then
		if v:IsDetective() then return false end
	end
	if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Ignore Fellow Traitors") and engine.ActiveGamemode() == "terrortown" and GetRoundState() ~= ROUND_POST and me:IsTraitor() and not table.HasValue(prioritylist, v:UniqueID()) then
		if v:IsTraitor() then return false end
	end
	if (gBool("Main Menu", "Priority List", "Enabled") and table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Aim Assist", "Aim Priorities", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID())) then
		return false
	end
	if v:Team() == TEAM_CONNECTING then
		return false
	end
	end
	local tr = {}
        tr.start = me
        tr.endpos = v
        tr.filter = {me, v}
	if gOption("Aim Assist", "Miscellaneous", "Line-of-Sight Check:") ~= "Off" then
		if gOption("Aim Assist", "Miscellaneous", "Line-of-Sight Check:") == "Auto Wallbang" then
			tr.start = em.EyePos(me)
			tr.endpos = AimPos(v)
			tr.mask = MASK_VISIBLE_AND_NPCS
			tr.filter = {me, v}
		elseif gOption("Aim Assist", "Miscellaneous", "Line-of-Sight Check:") == "Default" then
			tr.start = em.EyePos(me)
			tr.endpos = AimPos(v)
			tr.mask = MASK_SHOT
			tr.filter = {me, v}
		end
	end
	if util.TraceLine(tr).Fraction == 1 then
        return true
    end
	return false
end

local function GetTarget()
	local opt = gOption("Aim Assist", "Aim Priorities", "Aim Priority:")
	local sticky = gOption("Aim Assist", "Aimbot", "Target Lock")
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

hook.Add("Move", "Move", function()
    if (IsFirstTimePredicted()) then
        servertime = CurTime() + engine.TickInterval()
    end
	if gBool("Aim Assist", "Miscellaneous", "Manipulate Bullet Time") then
		if gBool("Aim Assist", "Aimbot", "Auto Fire") and gInt("Aim Assist", "Miscellaneous", "Bullet Fire Delay:") ~= 1 then
			servertime = CurTime() - gInt("Aim Assist", "Miscellaneous", "Bullet Fire Delay:") / 100
		else
			servertime = CurTime()
		end
	end
end)

local function WeaponCanFire()
	local w = pm.GetActiveWeapon(me)
		if (!w || !em.IsValid(w) || !gBool("Aim Assist", "Miscellaneous", "Manipulate Bullet Time")) then return true end
	return(servertime >= wm.GetNextPrimaryFire(w))
end

GAMEMODE["EntityFireBullets"] = function(self, p, data)
	aimignore = aimtarget
	local w = pm.GetActiveWeapon(me)
	local Spread = data.Spread * - 1
	if (not w or not em.IsValid(w) or cones[em.GetClass(w)] == Spread or Spread == nullvec) then return end
	cones[em.GetClass(w)] = Spread
end

local function PredictSpread(cmd, ang)
	local w = pm.GetActiveWeapon(me)
	if (not w or not em.IsValid(w) or not cones[em.GetClass(w)] or not gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread")) then return am.Forward(ang) end
	return (box.Predict(cmd, am.Forward(ang), cones[em.GetClass(w)]))
end

local function AutoFire(cmd)
	if (pm.KeyDown(me, 1)) then
		cm.SetButtons(cmd, bit.band(cm.GetButtons(cmd), bit.bnot(1)))
	else
		cm.SetButtons(cmd, bit.bor(cm.GetButtons(cmd), 1))
	end
end

local function AutoZoom(cmd)
	if (pm.KeyDown(me, 1)) then
		cm.SetButtons(cmd, bit.band(cm.GetButtons(cmd), bit.bnot(IN_ATTACK2)))
	else
		cm.SetButtons(cmd, bit.bor(cm.GetButtons(cmd), IN_ATTACK2))
	end
end

local function SmoothAim(ang) 
	if (gInt("Aim Assist", "Aimbot", "Aim Smoothness:") > 0 && !gBool("Aim Assist", "Aimbot", "Silent Aim")) then
		ang.y = math.NormalizeAngle(ang.y) 	
		ang.p = math.NormalizeAngle(ang.p) 	
		eyeang = me:EyeAngles() 	
		local smooth = gInt("Aim Assist", "Aimbot", "Aim Smoothness:") 	
		if ((eyeang.y - ang.y) * - 1 > 180 && eyeang.y < 0) 
		then eyeang.y = eyeang.y + 360 end 	if ((ang.y - eyeang.y) * - 1 > 180 && ang.y < 0) then ang.y = ang.y + 360 end 	
		eyeang.y = eyeang.y + (ang.y - eyeang.y) / smooth eyeang.x = eyeang.x + (ang.x - eyeang.x) / smooth eyeang.r = 0 	
		return eyeang else return ang
	end 
end

local function PredictPos(aimtarget)
	local wep = me:GetActiveWeapon()
	if gBool("Aim Assist", "Miscellaneous", "Projectile Prediction") and me:GetActiveWeapon():IsValid() and me:Alive() and me:Health() > 0 then
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
	if not gBool("Aim Assist", "Miscellaneous", "Projectile Prediction") then
		return AimPos(aimtarget) - em.EyePos(me)
	end
end

local function Aimbot(cmd)
	if cm.CommandNumber(cmd) == 0 or not gBool("Aim Assist", "Aimbot", "Enabled") or not me:Alive() or me:Health() < 1 or not me:GetActiveWeapon():IsValid() or (me:Team() == TEAM_SPECTATOR and not (gBool("Aim Assist", "Aim Priorities", "Target Spectators") and gBool("Main Menu", "General Utilities", "Spectator Mode"))) then return end
	for k, v in pairs(player.GetAll()) do
	if ((gBool("Main Menu", "Panic Mode", "Enabled") && (gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" || gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Aimbot")) && IsValid(v:GetObserverTarget()) && v:GetObserverTarget() == me) || FixTools() then return end
	end
	GetTarget()
    aa = false
    if (aimtarget && aimtarget:IsValid() && gKey("Aim Assist", "Aimbot", "Toggle Key:") && WeaponCanFire()) then
	local pos = PredictPos(aimtarget)
	local ang = vm.Angle(PredictSpread(cmd, vm.Angle(pos)))
	local ady = math.abs(math.NormalizeAngle(ang.y - fa.y))
	local adp = math.abs(math.NormalizeAngle(ang.p - fa.p))
	local ang = SmoothAim(ang)
	local fov = gInt("Aim Assist", "Aimbot", "Aim FoV Value:")
	if fov == 0 then
		aa = true
		FixAngle(ang)
		cm.SetViewAngles(cmd, ang)
		if (gBool("Aim Assist", "Aimbot", "Auto Fire")) then
            AutoFire(cmd)
        end
		if (gBool("Aim Assist", "Aimbot", "Auto Zoom")) then
			AutoZoom(cmd)
		end
		if (gBool("Aim Assist", "Aimbot", "Silent Aim")) then
			FixMovement(cmd)
		else
			fa = ang
		end
	else
	if not (ady > fov or adp > fov) then
		FixAngle(ang)
		cm.SetViewAngles(cmd, ang)
        if (gBool("Aim Assist", "Aimbot", "Auto Fire")) then
            AutoFire(cmd)
        end
		if (gBool("Aim Assist", "Aimbot", "Auto Zoom")) then
			AutoZoom(cmd)
		end
		if (gBool("Aim Assist", "Aimbot", "Silent Aim")) then
			FixMovement(cmd)
		else
			fa = ang
		end
			end
		end
	end
end

local function TriggerFilter(hitbox)
	if gOption("Aim Assist", "Aim Priorities", "Hitbox:") == "Head" then
		return hitbox == 0
	end
	return hitbox ~= nil
end

local function Triggerbot(cmd)
	if cm.CommandNumber(cmd) == 0 or not gBool("Aim Assist", "Triggerbot", "Enabled") or not me:Alive() or me:Health() < 1 or (me:Team() == TEAM_SPECTATOR and not (gBool("Aim Assist", "Triggerbot", "Target Spectators") and gBool("Main Menu", "General Utilities", "Spectator Mode"))) or not gKey("Aim Assist", "Triggerbot", "Toggle Key:") or cmd:KeyDown(IN_ATTACK) or FixTools() then return end
	local dist = gBool("Aim Assist", "Aim Priorities", "Distance:")
	local vel = gBool("Aim Assist", "Aim Priorities", "Velocity:")
	local maxhealth = gInt("Aim Assist", "Aim Priorities", "Max Player Health:") 
	local trace = me:GetEyeTraceNoCursor()
	local v = trace.Entity
	local hitbox = trace.HitBox
	if (v and idiot.IsValid(v) and v:Health() > 0 and not v:IsDormant() and me:GetObserverTarget() ~= v and AimAssistPriorities(v)) and TriggerFilter(hitbox) then
	if v:IsPlayer() then
		if gBool("Aim Assist", "Aim Priorities", "Distance Limit") then
			if (vm.Distance(em.GetPos(v), em.GetPos(me)) > (dist * 5)) then return false end
		end
		if gBool("Aim Assist", "Aim Priorities", "Velocity Limit") then
			if (v:GetVelocity():Length() > vel) then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Team") then
			if pm.Team(v) == pm.Team(me) then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Enemies") then
			if pm.Team(v) != pm.Team(me) then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Transparent Players") then
			if em.GetColor(v).a < 255 then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Steam Friends") then
			if pm.GetFriendStatus(v) == "friend" then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Bots") then
			if pm.IsBot(v) then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Admins") then
			if pm.IsAdmin(v) then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Frozen Players") then
			if pm.IsFrozen(v) then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Driving Players") then
			if pm.InVehicle(v) then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Noclipping Players") then
			if em.GetMoveType(v) == MOVETYPE_NOCLIP then return false end
		end
		if gBool("Aim Assist", "Aim Priorities", "Disable in Noclip") then
			if em.GetMoveType(me) == MOVETYPE_NOCLIP then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Spectators") then
			if pm.Team(v) == TEAM_SPECTATOR then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Overhealed Players") then
			if v:Health() > maxhealth then return false end
		end
		if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Ignore Detectives as Innocent") and engine.ActiveGamemode() == "terrortown" and GetRoundState() ~= ROUND_POST and not me:IsTraitor() then
			if v:IsDetective() then return false end
		end
		if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Ignore Fellow Traitors") and engine.ActiveGamemode() == "terrortown" and GetRoundState() ~= ROUND_POST and me:IsTraitor() and not table.HasValue(prioritylist, v:UniqueID()) then
			if v:IsTraitor() then return false end
		end
		if (gBool("Main Menu", "Priority List", "Enabled") and table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Aim Assist", "Aim Priorities", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID())) then
			return false
		end
		if v:Team() == TEAM_CONNECTING then
			return false
		end
	end
	if (gBool("Aim Assist", "Triggerbot", "Auto Zoom")) then
		cmd:SetButtons(cmd:GetButtons() + IN_ATTACK2)
	end
	if not (v and idiot.IsValid(v) and v:Health() > 0 and not v:IsDormant() and me:GetObserverTarget() ~= v and AimAssistPriorities(v)) then return end
	triggering = true
	if WeaponCanFire() then
		cmd:SetButtons(cmd:GetButtons() + IN_ATTACK)
	end
	else
	triggering = false
	end
end

local function RandCoin()
	local randcoin = math.random(0, 1)
	if (randcoin == 1) then return 1 else return - 1 end
end

local function GetClosestDistance()
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

local function GetClosestCrosshair()
	local dfov = {}
	local crosshairclosest
	local x, y = ScrW(), ScrH()
	local AngA, AngB = 0
	for k, v in next, ents.GetAll() do
	if (!Valid(v)) then continue end
	local EyePos = v:EyePos():ToScreen()
	dfov[#dfov + 1] = {math.Dist(x / 2, y / 2, EyePos.x, EyePos.y), v}
	end
	table.sort(dfov, function(a, b)
	return(a[1] < b[1])
	end)
	crosshairclosest = dfov[1] && dfov[1][2] || nil
	if (!crosshairclosest) then return fa.y end
	local pos = em.GetPos(crosshairclosest)
	local pos = vm.Angle(pos - em.EyePos(me))
	return(pos.y)
end

local function LockView()
	if (gBool("Hack vs. Hack", "Anti-Aim", "Lock View") and me:Alive() and me:Health() > 0) then
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

local function Pitch()
	local opt = gOption("Hack vs. Hack", "Anti-Aim", "Pitch:")
	local randcoin = gInt("Hack vs. Hack", "Anti-Aim", "Emotion Pitch Speed:")
	if (opt == "Emotion") then
	if (math.random(100) < randcoin) then
		ox = RandCoin() * 181
	end
	elseif (opt == "Off") then
        ox = fa.x
	elseif (opt == "Down") then
		if gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Fake-Forwards" or gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Fake-Backwards" or gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Fake-Sideways" or gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Spinbot" then
			ox = 120 + math.sin(CurTime() * 10) * 5
		else
			ox = 89
		end
	elseif (opt == "Up") then
		if gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Fake-Forwards" or gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Fake-Backwards" or gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Fake-Sideways" or gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Spinbot" then
			ox = - 120 - math.sin(CurTime() * 10) * 5
		else
			ox = - 89
		end
	elseif (opt == "Center") then
		if gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Fake-Forwards" or gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Fake-Backwards" or gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Fake-Sideways" or gOption("Hack vs. Hack", "Anti-Aim", "Yaw:") == "Spinbot" then
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
		ox = math.sin(CurTime() * gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Pitch Speed:") / 8) * 60
	end
end

local function Yaw()
    local left = gOption("Hack vs. Hack", "Anti-Aim", "Anti-Aim Direction:") == "Left"
    local right = gOption("Hack vs. Hack", "Anti-Aim", "Anti-Aim Direction:") == "Right"
	local randcoin = gInt("Hack vs. Hack", "Anti-Aim", "Emotion Yaw Speed:")
	local opt = gOption("Hack vs. Hack", "Anti-Aim", "Yaw:")
	local default = gOption("Hack vs. Hack", "Anti-Aim", "Mode:") == "Default"
	local distadapt = gOption("Hack vs. Hack", "Anti-Aim", "Mode:") == "Distance Adapt"
	local crossadapt = gOption("Hack vs. Hack", "Anti-Aim", "Mode:") == "Crosshair Adapt"
	local static = gOption("Hack vs. Hack", "Anti-Aim", "Mode:") == "Static"
	if (opt == "Off") then
        oy = fa.y
	elseif (opt == "Emotion") then
	if (math.random(100) < randcoin) then
		oy = fa.y + math.random( - 180, 180)
	end
	elseif (opt == "Forwards" && default) then
		oy = fa.y
	elseif (opt == "Forwards" && distadapt) then
		oy = GetClosestDistance()
	elseif (opt == "Forwards" && crossadapt) then
		oy = GetClosestCrosshair()
	elseif (opt == "Forwards" && static) then
		oy = 180
	elseif (opt == "Backwards" && default) then
		oy = fa.y - 180
	elseif (opt == "Backwards" && distadapt) then
		oy = GetClosestDistance() - 180
	elseif (opt == "Backwards" && crossadapt) then
		oy = GetClosestCrosshair() - 180
	elseif (opt == "Backwards" && static) then
		oy = 0
	elseif (opt == "Jitter" && default) then
		oy = fa.y + math.random( - 90, 90)
	elseif (opt == "Jitter" && distadapt) then
		oy = GetClosestDistance() + math.random( - 90, 90)
	elseif (opt == "Jitter" && crossadapt) then
		oy = GetClosestCrosshair() + math.random( - 90, 90)
	elseif (opt == "Jitter" && static) then
		oy = 180 + math.random( - 90, 90)
	elseif (opt == "Backwards Jitter" && default) then
		oy = fa.y - 180 + math.random( - 90, 90)
	elseif (opt == "Backwards Jitter" && distadapt) then
		oy = GetClosestDistance() - 180 + math.random( - 90, 90)
	elseif (opt == "Backwards Jitter" && crossadapt) then
		oy = GetClosestCrosshair() - 180 + math.random( - 90, 90)
	elseif (opt == "Backwards Jitter" && static) then
		oy = 0 + math.random( - 90, 90)
	elseif (opt == "Side Switch") then
		oy = math.random( - 631, 631)
	elseif (opt == "Semi-Jitter" && default) then
		oy = fa.y + math.random (25, - 25)
	elseif (opt == "Semi-Jitter" && distadapt) then
		oy = GetClosestDistance() + math.random (25, - 25)
	elseif (opt == "Semi-Jitter" && crossadapt) then
		oy = GetClosestCrosshair() + math.random (25, - 25)
	elseif (opt == "Semi-Jitter" && static) then
		oy = 180 + math.random (25, - 25)
	elseif (opt == "Back Semi-Jitter" && default) then
		oy = fa.y - 180 + math.random (25, - 25)
	elseif (opt == "Back Semi-Jitter" && distadapt) then
		oy = GetClosestDistance() - 180 + math.random (25, - 25)
	elseif (opt == "Back Semi-Jitter" && crossadapt) then
		oy = GetClosestCrosshair() - 180 + math.random (25, - 25)
	elseif (opt == "Back Semi-Jitter" && static) then
		oy = 0 + math.random (25, - 25)
	elseif (opt == "Spinbot") then
		if left then
        oy = (idiot.CurTime() * gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Yaw Speed:") * 23) % 350, 1
   		elseif right then
        oy = (idiot.CurTime() * - gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Yaw Speed:") * 23) % 350, 1
		elseif manual then
		oy = (idiot.CurTime() * - gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Yaw Speed:") * 23) % 350, 1
		else
		oy = (idiot.CurTime() * gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Yaw Speed:") * 23) % 350, 1
	    end
	elseif (opt == "Sideways" && default) then
		if right then
		oy = fa.y - 90
		elseif left then
		oy = fa.y + 90
		elseif manual then
		oy = fa.y - 90
		else
		oy = fa.y + 90
	end
	elseif (opt == "Sideways" && distadapt) then
		if right then
		oy = GetClosestDistance() - 90
		elseif left then
		oy = GetClosestDistance() + 90
		elseif manual then
		oy = GetClosestDistance() - 90
		else
		oy = GetClosestDistance() + 90
	end
	elseif (opt == "Sideways" && crossadapt) then
		if right then
		oy = GetClosestCrosshair() - 90
		elseif left then
		oy = GetClosestCrosshair() + 90
		elseif manual then
		oy = GetClosestCrosshair() - 90
		else
		oy = GetClosestCrosshair() + 90
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
	elseif (opt == "Side Semi-Jitter" && default) then
        if left then
        oy = fa.y + 90 + math.random(0, 40)
        elseif right then
        oy = fa.y + 270 + math.random(0, - 40)
		elseif manual then
		oy = fa.y + 270 + math.random(0, - 40)
		else
		oy = fa.y + 90 + math.random(0, 40) 
        end
	elseif (opt == "Side Semi-Jitter" && distadapt) then
        if left then
        oy = GetClosestDistance() + 90 + math.random(0, 40)
        elseif right then
        oy = GetClosestDistance() + 270 + math.random(0, - 40)
		elseif manual then
		oy = GetClosestDistance() + 270 + math.random(0, - 40)
		else
		oy = GetClosestDistance() + 90 + math.random(0, 40) 
        end
	elseif (opt == "Side Semi-Jitter" && crossadapt) then
        if left then
        oy = GetClosestCrosshair() + 90 + math.random(0, 40)
        elseif right then
        oy = GetClosestCrosshair() + 270 + math.random(0, - 40)
		elseif manual then
		oy = GetClosestCrosshair() + 270 + math.random(0, - 40)
		else
		oy = GetClosestCrosshair() + 90 + math.random(0, 40) 
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
	elseif (opt == "Sideways Jitter" && default) then
		if left then
        oy = fa.y + math.random(1, 180, 1, 80, 1)
   		elseif right then
        oy = fa.y + math.random(181, 361) 
		elseif manual then
		oy = fa.y + math.random(181, 361)
		else
		oy = fa.y + math.random(1, 180, 1, 80, 1)
	    end
	elseif (opt == "Sideways Jitter" && distadapt) then
		if left then
        oy = GetClosestDistance() + math.random(1, 180, 1, 80, 1)
   		elseif right then
        oy = GetClosestDistance() + math.random(181, 361) 
		elseif manual then
		oy = GetClosestDistance() + math.random(181, 361)
		else
		oy = GetClosestDistance() + math.random(1, 180, 1, 80, 1)
	    end
	elseif (opt == "Sideways Jitter" && crossadapt) then
		if left then
        oy = GetClosestCrosshair() + math.random(1, 180, 1, 80, 1)
   		elseif right then
        oy = GetClosestCrosshair() + math.random(181, 361) 
		elseif manual then
		oy = GetClosestCrosshair() + math.random(181, 361)
		else
		oy = GetClosestCrosshair() + math.random(1, 180, 1, 80, 1)
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
	elseif (opt == "Fake-Forwards" && default) then
		if left then
        oy = fa.y - math.sin(CurTime() * 10) * 5
        elseif right then
        oy = fa.y + math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = fa.y + math.sin(CurTime() * 10) * 5
		else
		oy = fa.y - math.sin(CurTime() * 10) * 5
        end
	elseif (opt == "Fake-Forwards" && distadapt) then
        if left then
        oy = GetClosestDistance() - math.sin(CurTime() * 10) * 5
        elseif right then
        oy = GetClosestDistance() + math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = GetClosestDistance() + math.sin(CurTime() * 10) * 5
		else
		oy = GetClosestDistance() - math.sin(CurTime() * 10) * 5
        end
	elseif (opt == "Fake-Forwards" && crossadapt) then
        if left then
        oy = GetClosestCrosshair() - math.sin(CurTime() * 10) * 5
        elseif right then
        oy = GetClosestCrosshair() + math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = GetClosestCrosshair() + math.sin(CurTime() * 10) * 5
		else
		oy = GetClosestCrosshair() - math.sin(CurTime() * 10) * 5
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
	elseif (opt == "Fake-Backwards" && default) then
		if right then
		oy = fa.y + 180 + math.sin(CurTime() * 10) * 5
		elseif left then
		oy = fa.y + 180 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = fa.y + 180 + math.sin(CurTime() * 10) * 5
		else
		oy = fa.y + 180 - math.sin(CurTime() * 10) * 5
		end
	elseif (opt == "Fake-Backwards" && distadapt) then
		if right then
		oy = GetClosestDistance() + 180 + math.sin(CurTime() * 10) * 5
		elseif left then
		oy = GetClosestDistance() + 180 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = GetClosestDistance() + 180 + math.sin(CurTime() * 10) * 5
		else
		oy = GetClosestDistance() + 180 - math.sin(CurTime() * 10) * 5
		end
	elseif (opt == "Fake-Backwards" && crossadapt) then
		if right then
		oy = GetClosestCrosshair() + 180 + math.sin(CurTime() * 10) * 5
		elseif left then
		oy = GetClosestCrosshair() + 180 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = GetClosestCrosshair() + 180 + math.sin(CurTime() * 10) * 5
		else
		oy = GetClosestCrosshair() + 180 - math.sin(CurTime() * 10) * 5
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
	elseif (opt == "Fake-Sideways" && default) then
		if left then
        oy = fa.y + 90 + math.sin(CurTime() * 10) * 5
   		elseif right then
        oy = fa.y - 90 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = fa.y - 90 - math.sin(CurTime() * 10) * 5
		else
		oy = fa.y + 90 + math.sin(CurTime() * 10) * 5
	    end
	elseif (opt == "Fake-Sideways" && distadapt) then
		if left then
        oy = GetClosestDistance() + 90 + math.sin(CurTime() * 10) * 5
   		elseif right then
        oy = GetClosestDistance() - 90 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = GetClosestDistance() - 90 - math.sin(CurTime() * 10) * 5
		else
		oy = GetClosestDistance() + 90 + math.sin(CurTime() * 10) * 5
	    end
	elseif (opt == "Fake-Sideways" && crossadapt) then
		if left then
        oy = GetClosestCrosshair() + 90 + math.sin(CurTime() * 10) * 5
   		elseif right then
        oy = GetClosestCrosshair() - 90 - math.sin(CurTime() * 10) * 5
		elseif manual then
		oy = GetClosestCrosshair() - 90 - math.sin(CurTime() * 10) * 5
		else
		oy = GetClosestCrosshair() + 90 + math.sin(CurTime() * 10) * 5
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

local function DetectWalls()
	if (gBool("Hack vs. Hack", "Anti-Aim", "Detect Walls")) then
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

local function AntiAim(cmd)
	for k, v in pairs(player.GetAll()) do
	if (gBool("Main Menu", "Panic Mode", "Enabled") && (gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" || gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Anti-Aim")) && IsValid(v:GetObserverTarget()) && v:GetObserverTarget() == me then return end
	end
	local wep = pm.GetActiveWeapon(me)
	if ((gBool("Hack vs. Hack", "Anti-Aim", "Disable in Noclip") && em.GetMoveType(me) == MOVETYPE_NOCLIP) || me:Team() == TEAM_SPECTATOR || triggering == true || (cm.CommandNumber(cmd) == 0 && !ThirdpersonCheck()) || cm.KeyDown(cmd, 1) || gBool("Visuals", "Point of View", "Custom FoV") && gBool("Miscellaneous", "Free Roaming", "Enabled") && gKey("Miscellaneous", "Free Roaming", "Toggle Key:") && !ThirdpersonCheck() || me:WaterLevel() > 1 || (input.IsKeyDown(15) && gBool("Hack vs. Hack", "Anti-Aim", "Disable in 'Use' Toggle") && !(me:IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible())) || em.GetMoveType(me) == MOVETYPE_LADDER || aa || !me:Alive() || me:Health() < 1 || !gBool("Hack vs. Hack", "Anti-Aim", "Enabled") || gBool("Aim Assist", "Aimbot", "Enabled") && (gInt("Aim Assist", "Aimbot", "Aim FoV Value:") > 0 || gInt("Aim Assist", "Aimbot", "Aim Smoothness:") > 0) || gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill") && engine.ActiveGamemode() == "terrortown" && wep:IsValid() && wep:GetClass() == "weapon_zm_carry") then return end
	if gOption("Hack vs. Hack", "Anti-Aim", "Anti-Aim Direction:") == "Manual Switch" then
	if gKey("Hack vs. Hack", "Anti-Aim", "Switch Key:") and not manualpressed then
	manualpressed = true
	manual = not manual
	elseif not gKey("Hack vs. Hack", "Anti-Aim", "Switch Key:") and manualpressed then
	manualpressed = false
	end	
	end
	Pitch()
	Yaw()
	LockView()
	DetectWalls()
	local aaang = Angle(ox, oy, 0)
	cm.SetViewAngles(cmd, aaang)
	FixMovement(cmd, true)
end

local function FakeLag(cmd, Choke, Send)
	if not gBool("Hack vs. Hack", "Fake Lag", "Enabled") then return end
	if gBool("Hack vs. Hack", "Fake Lag", "Disable on Attack") and me:KeyDown(IN_ATTACK) then
		return
	end
	if cmd:CommandNumber() == 0 then
		return true
	end
	if not Choke then
		choke = gInt("Hack vs. Hack", "Fake Lag", "Lag Choke:") + 0.7
	end
	if not Send then
		send = gInt("Hack vs. Hack", "Fake Lag", "Lag Send:")
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
		if (not gBool("Aim Assist", "Miscellaneous", "Remove Weapon Recoil")) then 
			return ang + pm.GetPunchAngle(me)
		else
			return ang
		end
	end
end

local function PropKill(cmd)
	local wep = pm.GetActiveWeapon(me)
	if !gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill") or engine.ActiveGamemode() ~= "terrortown" or !wep:IsValid() or !wep:GetClass() == "weapon_zm_carry" or menuopen or me:IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible() or (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) or (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 then return end
	if (cm.CommandNumber(cmd) == 0 && !ThirdpersonCheck()) then
		return
	elseif (cm.CommandNumber(cmd) == 0 && ThirdpersonCheck()) then
		return
	end
	if gKey("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill Key:") then
		ox = fa.x - 27
		if propval < 180 then
			oy = fa.y + propval
			propval = propval + 3
		else
			oy = fa.y + 180
		end
		local aaang = Angle(ox, oy, 0)
		cm.SetViewAngles(cmd, aaang)
		FixMovement(cmd, true)
	else
		if propval > 0 then
			propval = 0
			propdelay = CurTime() + 0.5
		end
		if propdelay >= CurTime() then
			ox = - 17
			oy = fa.y
			local aaang = Angle(ox, oy, 0)
			cm.SetViewAngles(cmd, aaang)
			FixMovement(cmd, true)
		else
			propdelay = 0
		end
	end
end

local function AutoStop(cmd)
	if (gBool("Aim Assist", "Aimbot", "Enabled") && gBool("Aim Assist", "Aimbot", "Auto Stop") && aimtarget && gKey("Aim Assist", "Aimbot", "Toggle Key:") && WeaponCanFire() or gBool("Aim Assist", "Triggerbot", "Enabled") && gBool("Aim Assist", "Triggerbot", "Auto Stop") && gKey("Aim Assist", "Triggerbot", "Toggle Key:") && triggering && WeaponCanFire()) then
		cmd:SetForwardMove(0)
		cmd:SetSideMove(0)
		cmd:SetUpMove(0)
	return
	end
end

local function AutoCrouch(cmd)	
	if (gBool("Aim Assist", "Aimbot", "Enabled") && gBool("Aim Assist", "Aimbot", "Auto Crouch") && aimtarget && gKey("Aim Assist", "Aimbot", "Toggle Key:") && WeaponCanFire() or gBool("Aim Assist", "Triggerbot", "Enabled") && gBool("Aim Assist", "Triggerbot", "Auto Crouch") && gKey("Aim Assist", "Triggerbot", "Toggle Key:") && triggering && WeaponCanFire()) then
		cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
	return
	end
end

local function FakeAngles(cmd)
	if (!fa) then 
		fa = cm.GetViewAngles(cmd)
	end
    fa = fa + Angle(cm.GetMouseY(cmd) * .023, cm.GetMouseX(cmd) * - .023, 0)
    FixAngle(fa)
    if (cm.CommandNumber(cmd) == 0) then
		if not FixTools() then
			cm.SetViewAngles(cmd, GetAngle(fa))
			return
		end
	end
	if (cm.KeyDown(cmd, 1)) then
		if not FixTools() then
			local ang = GetAngle(vm.Angle(PredictSpread(cmd, fa)))
			FixAngle(ang)
			cm.SetViewAngles(cmd, ang)
		end
    end
end

local function FakeCrouch(cmd)
	if em.GetMoveType(me) == MOVETYPE_NOCLIP or (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 or me:IsFlagSet(1024) then return end
	if gBool("Miscellaneous", "Movement", "Fake Crouch") then
		if me:KeyDown(IN_DUCK) then
			if crouched <= 5 then
				cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
			elseif crouched >= 25 then
				crouched = 0
			end
			crouched = crouched + 1
		else
			if crouched <= 5 then
				cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
			elseif crouched >= 12.5 then
				crouched = 0
			end
			crouched = crouched + 1
		end
	end
end

hook.Add("CalcView", "CalcView", function(me, pos, ang, fov)
	local view = {}
		if gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Toggle Key:") and not menuopen and not me:IsTyping() and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() and not (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) and not (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) and (me:Alive() or me:Health() > 0) then
			local speed = gInt("Miscellaneous", "Free Roaming", "Speed:") / 5
			local mouseang = Angle(roamy, roamx, 0)
			if me:KeyDown(IN_SPEED) then
				speed = speed * 3
			end
			if me:KeyDown(IN_FORWARD) then
				roampos = roampos + (mouseang:Forward() * speed)
			end
			if me:KeyDown(IN_BACK) then
				roampos = roampos - (mouseang:Forward() * speed)
			end
			if me:KeyDown(IN_MOVELEFT) then
				roampos = roampos - (mouseang:Right() * speed)
			end
			if me:KeyDown(IN_MOVERIGHT) then
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
			view.fov = gInt("Miscellaneous", "Free Roaming", "FoV Value:")
			view.drawviewer = true
		end
		if gBool("Visuals", "Point of View", "Custom FoV") and not ThirdpersonCheck() and not (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Toggle Key:")) and (me:Alive() or me:Health() > 0) then
			view.origin = pos
			view.angles = angles
			view.fov = gInt("Visuals", "Point of View", "FoV Value:")
		end
		if gBool("Aim Assist", "Miscellaneous", "Remove Weapon Recoil") and (me:Alive() or me:Health() > 0) and me:GetMoveType() ~= 10 and me:GetObserverTarget() == nil then
			view.origin = me:EyePos()
			view.angles = me:EyeAngles()
		end
		if ThirdpersonCheck() and not (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Toggle Key:")) and (me:Alive() or me:Health() > 0) then
			view.angles = GetAngle(fa)
			view.origin = ThirdpersonCheck() and pos + am.Forward(fa) * (gInt("Visuals", "Point of View", "Thirdperson Range:") * - 10)
			view.fov = gInt("Visuals", "Point of View", "Thirdperson FoV Value:")
			return view
		end
		if not (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Toggle Key:")) and (me:Alive() or me:Health() > 0) then
			view.angles = GetAngle(fa)
			view.origin = pos
		end
	return view
end)

local function FreeRoam(cmd)
	if (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Toggle Key:") and not menuopen and not me:IsTyping() and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() and not (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) and not (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) and (me:Alive() or me:Health() > 0)) then
		if roamon == false then
			roampos, roamang = me:EyePos(), cmd:GetViewAngles()
			roamy, roamx = cmd:GetViewAngles().x, cmd:GetViewAngles().y
			roamon = true
		end
		cmd:ClearMovement()
		if cmd:KeyDown(IN_JUMP) then
			cmd:RemoveKey(IN_JUMP)
			roamjump = true
		elseif roamjump then
			roamjump = false
		end
		if cmd:KeyDown(IN_DUCK) then
			cmd:RemoveKey(IN_DUCK)
			roamduck = true
		elseif roamduck then
			roamduck = false
		end
		roamx = roamx - (cmd:GetMouseX() / 50)
		if roamy + (cmd:GetMouseY() / 50) > 89 then roamy = 89 elseif roamy + (cmd:GetMouseY() / 50) < - 89 then roamy = - 89 else roamy = roamy + (cmd:GetMouseY() / 50) end
			cmd:SetViewAngles(roamang)
		elseif roamon == true then
		roamon = false
	end
end

hook.Add("AdjustMouseSensitivity", "AdjustMouseSensitivity", function()
	if not gBool("Aim Assist", "Triggerbot", "Smooth Aim") or not gKey("Aim Assist", "Triggerbot", "Toggle Key:") or not triggering or FixTools() then return end
	return .10
end)

hook.Add("ShouldDrawLocalPlayer", "ShouldDrawLocalPlayer", function()
	if not (gBool("Miscellaneous", "Free Roaming", "Enabled") and gKey("Miscellaneous", "Free Roaming", "Toggle Key:")) then return ThirdpersonCheck() end
end)

hook.Add("CreateMove", "CreateMove", function(cmd)
	bSendPacket = true
	FakeLag(cmd)
	AntiAFK(cmd)
	BunnyHop(cmd)
	AutoStrafe(cmd)
	FakeAngles(cmd)
	FreeRoam(cmd)
	AutoReload(cmd)
	AntiAim(cmd)
	RapidPrimaryFire(cmd)
	RapidAltFire(cmd)
	AutoStop(cmd)
	AutoCrouch(cmd)
	FakeCrouch(cmd)
	AirCrouch(cmd)
	PropKill(cmd)
	if cm.CommandNumber(cmd) == 0 then return end
	big.StartPrediction(cmd, cm.CommandNumber(cmd))
	Aimbot(cmd)
	Triggerbot(cmd)
	big.FinishPrediction()
end)

hook.Add("player_disconnect", "player_disconnect", function(v, data)
	local quit = {"rage quit", "rage quit lol", "he raged", "he raged lmao", "he left", "he left lmfao"}
	if gOption("Miscellaneous", "Chat", "Reply Spam:") == "Disconnect Spam" then
		if (engine.ActiveGamemode() == "darkrp") then
			me:ConCommand("say /ooc "..quit[math.random(#quit)])
		else
			me:ConCommand("say "..quit[math.random(#quit)])
		end
	end
end)

hook.Add("HUDPaint2", "HUDPaint2", function()
	if gInt("Adjustments", "Others", "BG Darkness:") > 0 and menuopen then
		surface.SetDrawColor(0, 0, 0, gInt("Adjustments", "Others", "BG Darkness:") * 10)
		surface.DrawRect(0, 0, ScrW(), ScrH())
	end
	if gui.IsGameUIVisible() or gui.IsConsoleVisible() or (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) or (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 or (v == me and not em.IsValid(v)) then return end
	local cap = math.cos(math.rad(45))
	local offset = Vector(0, 0, 32)
	local trace = {}
	local witnesscolor = Color(0, 0, 0)
	if (gBool("Visuals", "Miscellaneous", "Witness Finder")) then
		local time = os.time() - 1
		local witnesses = 0
		local beingwitnessed = true
		if time < os.time() then
			time = os.time() + .5
			witnesses = 0
			beingwitnessed = false
				for k, pla in pairs(player.GetAll()) do
					if pla:IsValid() and pla != me then
						trace.start = me:EyePos() + offset
						trace.endpos = pla:EyePos() + offset
						trace.filter = {pla, me}
						traceRes = util.TraceLine(trace)
						if !traceRes.Hit then
							if (pla:EyeAngles():Forward():Dot((me:EyePos() - pla:EyePos())) > cap) then
								witnesses = witnesses + 1
								beingwitnessed = true
							end
						end
					end
				end
			end
			if beingwitnessed == false then
				witnesscolor = Color(0, 255, 0)
			else
				witnesscolor = Color(255, 0, 0)
			end
    	draw.SimpleText(witnesses.." Player(s) can see you.", "MiscFont3", (ScrW() / 2) - 65, 42, Color(maintextcol.r, maintextcol.g, maintextcol.b), 4, 1, 1, Color(0, 0, 0))
    	surface.SetDrawColor(witnesscolor)
    	surface.DrawRect((ScrW() / 2) - 73, 55, 152, 5)
    end
	local wep = pm.GetActiveWeapon(me)
	if menuopen or me:IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible() or (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) or (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 then return end
	if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill") && gKey("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill Key:") && engine.ActiveGamemode() == "terrortown" && wep:IsValid() && wep:GetClass() == "weapon_zm_carry" then
		if propval >= 180 then
			surface.DrawCircle(ScrW() / 2, ScrH() / 1.8, 80 + me:GetVelocity():Length() / 4, Color(255, 0, 0))
		else
			surface.DrawCircle(ScrW() / 2, ScrH() / 1.8, 80 + me:GetVelocity():Length() / 4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:")))
		end
	end
	if menuopen or me:IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible() or (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) or (me:Team() == TEAM_SPECTATOR and not (gBool("Aim Assist", "Aim Priorities", "Target Spectators") and gBool("Main Menu", "General Utilities", "Spectator Mode"))) or not me:Alive() or me:Health() < 1 then return end
	if gBool("Aim Assist", "Aimbot", "Enabled") and gBool("Visuals", "Miscellaneous", "Show FoV Circle") then
		local center = Vector(ScrW() / 2, ScrH() / 2, 0)
		local scale = Vector(((gInt("Aim Assist", "Aimbot", "Aim FoV Value:")) * 8.5), ((gInt("Aim Assist", "Aimbot", "Aim FoV Value:")) * 8.5), 0)
		local segmentdist = 360 / (2 * math.pi * math.max(scale.x, scale.y) / 2)
			surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "T Opacity:"))	
		for a = 0, 360 - segmentdist, segmentdist do
			surface.DrawLine(center.x + math.cos(math.rad(a)) * scale.x, center.y - math.sin(math.rad(a)) * scale.y, center.x + math.cos(math.rad(a + segmentdist)) * scale.x, center.y - math.sin(math.rad(a + segmentdist)) * scale.y)
		end
	end
end)

hook.Add("PreDrawOpaqueRenderables", "PreDrawOpaqueRenderables", function()
	if gBool("Hack vs. Hack", "Resolver", "Enabled") then
		for k, v in next, player.GetAll() do
			if v == me or not v:IsValid() or (gBool("Main Menu", "Priority List", "Enabled") and table.HasValue(ignorelist, v:UniqueID())) then continue end
			if gBool("Main Menu", "Priority List", "Enabled") and gBool("Hack vs. Hack", "Resolver", "Priority Targets Only") then
				if not table.HasValue(prioritylist, v:UniqueID()) then continue end
			end
			local pitch = v:EyeAngles().x
			local yaw = v:EyeAngles().y
			local roll = 0
			if gOption("Hack vs. Hack", "Resolver", "Pitch:") ~= "Off" then
				if gOption("Hack vs. Hack", "Resolver", "Pitch:") == "Down" then
					pitch = 90
				elseif gOption("Hack vs. Hack", "Resolver", "Pitch:") == "Up" then
					pitch = - 90
				elseif gOption("Hack vs. Hack", "Resolver", "Pitch:") == "Center" then
					pitch = 0
				elseif gOption("Hack vs. Hack", "Resolver", "Pitch:") == "Invert" then
					pitch = - pitch
				elseif gOption("Hack vs. Hack", "Resolver", "Pitch:") == "Random" then
					pitch = math.random( - 90, 90)
				else
					if pitch <= 20 and pitch >= - 10 then
						pitch = 90
					end
				end
			end
			if gOption("Hack vs. Hack", "Resolver", "Yaw:") ~= "Off" then
				if gOption("Hack vs. Hack", "Resolver", "Yaw:") == "Left" then
					yaw = yaw + 90
				elseif gOption("Hack vs. Hack", "Resolver", "Yaw:") == "Right" then
					yaw = yaw - 90
				elseif gOption("Hack vs. Hack", "Resolver", "Yaw:") == "Invert" then
					yaw = yaw + 180
				elseif gOption("Hack vs. Hack", "Resolver", "Yaw:") == "Random" then
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

hook.Add("OnPlayerChat", "OnPlayerChat", function(chatPlayer, text, teamChat)
	local randomresponse = {"shut up", "ok", "who", "nobody cares", "where", "stop spamming", "what", "yea", "lol", "english please", "lmao", "shit", "fuck",}
	local cheatcallouts = {"hac", "h4c", "h@c", "hak", "h4k", "h@k", "hck", "hax", "h4x", "h@x", "hask", "h4sk", "h@sk", "ha$k", "h4$k", "h@$k", "cheat", "ch3at", "che4t", "che@t", "ch34t", "ch3@t", "chet", "ch3t", "wall", "w4ll", "w@ll", "wa11", "w@11", "w411", "aim", "a1m", "4im", "@im", "@1m", "41m", "trigg", "tr1gg", "spin", "sp1n", "bot", "b0t", "esp", "3sp", "e$p", "3$p", "lua", "1ua", "lu4", "lu@", "1u4", "1u@", "scr", "skr", "$cr", "$kr", "skid", "sk1d", "$kid", "$k1d", "bunny", "buny", "h0p", "hop", "kick", "k1ck", "kik", "k1k", "ban", "b4n", "b@n", "fake", "f4ke", "f@ke", "fak3", "f4k3", "f@k3",}
	local replyspam = gOption("Miscellaneous", "Chat", "Reply Spam:")
    if replyspam ~= "Off" then
        if chatPlayer == me or not chatPlayer:IsValid() or (gBool("Main Menu", "Priority List", "Enabled") and table.HasValue(ignorelist, chatPlayer:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Miscellaneous", "Chat", "Priority Targets Only") and not table.HasValue(prioritylist, chatPlayer:UniqueID())) then return false end
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

timer.Simple(0.1, function()
	chat.AddText(Color(0, 255, 0), "Successfully loaded IdiotBox!")
	surface.PlaySound("buttons/bell1.wav")
end)

timer.Simple(0.1, function()
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
end)

MsgG(5.3, "Welcome, "..me:Nick()..". Press 'Insert', 'F11' or 'Home' to toggle.")
surface.PlaySound("buttons/lightswitch2.wav")

if ac != true then 
	timer.Create("ChatPrint", 5.7, 1, function() MsgG(5.3, "No anti-cheats have been detected.") end)
	timer.Create("PlaySound", 5.7, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
end

if (idiot.QAC or idiot.qac or idiot.CAC or idiot.cac or idiot.SAC or idiot.sac or idiot.DAC or idiot.dac or idiot.ZAC or idiot.zac or idiot.TAC or idiot.tac or idiot.LSAC or idiot.lsac or idiot.simplicity or idiot.Simplicity or idiot.ZARP or idiot.Zarp or idiot.zarp or idiot.swiftAC or idiot.swiftac or idiot.SwiftAC or idiot.Swiftac or idiot.SMAC or idiot.smac or idiot.MAC or idiot.mac or idiot.GAC or idiot.gac or idiot.GS or idiot.gs or idiot.GTS or idiot.gts or idiot.AE or idiot.ae or idiot.CardinalLib or idiot.cardinallib or idiot.cardinalLib or idiot.Cardinallib) then
	timer.Create("ChatPrint", 5.7, 1, function() MsgR(5.3, "An anti-cheat has been detected. Use with caution to avoid getting banned!") end)
	timer.Create("PlaySound", 5.7, 1, function() surface.PlaySound("npc/scanner/combat_scan1.wav") end)
	ac = true
	return
end



--NOTE-- This is the end of the very messy script that is IdiotBox;

--NOTE-- Thank you to everyone who still supports me to this day. Without you, this cheat wouldn't be a thing;

--NOTE-- All of my credits go out to you and the ones who helped me with the development of this cheat. <3



  //-----Script Ends Here----//
 //-------------------------//
//-------------------------//
