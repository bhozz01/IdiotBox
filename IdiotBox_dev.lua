  //----IdiotBox v7.1.b1----//
 //--------By Phizz--------//
//------------------------//

--[[

||-------------NOTES-------------||

I do not take credit for all of the features in this cheat. The contributors are listed at the bottom of this script;
This script is nowhere near perfect - there's a lot of room for improvement. It started off as a very broken, random paste that I made for fun, then it somehow turned into one of the most popular cheats in Garry's Mod;
We try to make IdiotBox a better cheat with each update that gets released, and so far, it seems to go pretty well - but we're nowhere near the end.

||------CONTACT INFORMATION------||

Discord server: https://discord.com/invite/2h4un8G;
Steam group: https://steamcommunity.com/groups/ib4g;
Creator (Phizz): https://steamcommunity.com/id/phizzofficial/, or 'phizz0777' on Discord.

]]--

local global = (_G)
local me = LocalPlayer()

--[[ !!FUTURE UPDATE!!

local allplayers = player.GetAll()
local allents = ents.GetAll()

!!FUTURE UPDATE!! ]]--

local folder = "IdiotBox"
local version = "7.1.b1-pre15"

local menukeydown, frame, menuopen, mousedown, candoslider, drawlast, notyetselected, fa, aa, aimtarget, aimignore
local optimized, manual, manualpressed, tppressed, tptoggle, applied, windowopen, pressed, usespam, displayed, blackscreen, footprints, loopedprops = false
local ib, drawnents, prioritylist, ignorelist, visible, dists, cones, traitors, tweps = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}

local toggler, playerkills, namechangeTime, circlestrafeval, timeHoldingSpaceOnGround, servertime, faketick = 0, 0, 0, 0, 0, 0, 0
local menutextcol, bgmenucol, bordercol, teamvisualscol, enemyvisualscol, prioritytargetscol, ignoredtargetscol, miscvisualscol, teamchamscol, enemychamscol, crosshaircol, viewmodelcol = Color(255, 255, 255), Color(30, 30, 37), Color(0, 155, 255), Color(255, 255, 255), Color(255, 255, 255), Color(255, 0, 100), Color(175, 175, 175), Color(0, 255, 255), Color(0, 255, 255), Color(0, 255, 255), Color(0, 235, 255), Color(0, 235, 255)

local windowX, windowY, windowW, windowH = 50, ScrH() / 3, 200, 200
local roampos, roamang, roamon, roamx, roamy, roamduck, roamjump = me:EyePos(), me:GetAngles(), false, 0, 0, false, false

local clForwardSpeedCvar = GetConVar("cl_forwardspeed")
local clSideSpeedCvar = GetConVar("cl_sidespeed")
local forwardspeedval, sidespeedval = 10000, 10000

local old_yaw = 0.0
local ox, oy = - 181, 0

local mat = GetRenderTarget("mat"..os.time(), ScrW(), ScrH())

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

CreateClientConVar("ib_changename", "www.IB4G.net | Cry, dog!", true, false)

concommand.Add("ib_usespam", function()
    usespam = !usespam
end)

surface.CreateFont("VisualsFont", {font = "Tahoma", size = 12, antialias = false, outline = true})
surface.CreateFont("VisualsFont2", {font = "Tahoma", size = 11, antialias = false, outline = true})
surface.CreateFont("MenuFont", {font = "Tahoma", size = 12, antialias = true, outline = false})
surface.CreateFont("MenuFont2", {font = "Tahoma", size = 12, weight = 674, antialias = false, outline = true})
surface.CreateFont("MenuFont3", {font = "Tahoma", size = 12, antialias = true, outline = true})
surface.CreateFont("MainFont", {font = "Tahoma", size = 16, weight = 1300, antialias = false, outline = true})
surface.CreateFont("MainFont2", {font = "Tahoma", size = 11, weight = 640, antialias = false, outline = true})
surface.CreateFont("MainFont3", {font = "Tahoma", size = 13, weight = 800, antialias = false, outline = true})
surface.CreateFont("MiscFont", {font = "Tahoma", size = 12, weight = 900, antialias = false, outline = true})
surface.CreateFont("MiscFont2", {font = "Tahoma", size = 12, weight = 900, antialias = false, outline = false})
surface.CreateFont("MiscFont3", {font = "Tahoma", size = 13, weight = 674, antialias = false, outline = true})

-- The following localizations are ones that didn't fit within the regular limit

ib.chamsmat1 = CreateMaterial("normalmat1", "VertexLitGeneric", {["$ignorez"] = 1, ["$basetexture"] = "models/debug/debugwhite", })
ib.chamsmat2 = CreateMaterial("normalmat2", "VertexLitGeneric", {["$ignorez"] = 0, ["$basetexture"] = "models/debug/debugwhite", })
ib.chamsmat3 = CreateMaterial("flatmat1", "UnLitGeneric", {["$ignorez"] = 1, ["$basetexture"] = "models/debug/debugwhite", })
ib.chamsmat4 = CreateMaterial("flatmat2", "UnLitGeneric", {["$ignorez"] = 0, ["$basetexture"] = "models/debug/debugwhite", })
ib.chamsmat5 = CreateMaterial("wiremat1", "UnLitGeneric", {["$ignorez"] = 1, ["$wireframe"] = 1, })
ib.chamsmat6 = CreateMaterial("wiremat2", "UnLitGeneric", {["$ignorez"] = 0, ["$wireframe"] = 1, })

ib.anticheatNames = {"QAC", "qac", "CAC", "cac", "SAC", "sac", "DAC", "dac", "ZAC", "zac", "TAC", "tac", "LSAC", "lsac", "simplicity", "Simplicity", "ZARP", "Zarp", "zarp", "swiftAC", "swiftac", "SwiftAC", "Swiftac", "simplac", "simplAC", "SimplAC", "Simplac", "memeac", "Memeac", "MemeAC", "memeAC" "SMAC", "smac", "MAC", "mac", "GAC", "gac", "GS", "gs", "GTS", "gts", "AE", "ae", "CardinalLib", "cardinallib", "cardinalLib", "Cardinallib"}
ib.configFiles = {"config1.txt", "config2.txt", "config3.txt", "config4.txt", "config5.txt", "config6.txt", "config7.txt", "config8.txt", "config9.txt", "config10.txt"}
ib.configOptions = {"Legit Config", "Rage Config", "HvH Config", "Misc Config #1", "Misc Config #2", "Misc Config #3", "Misc Config #4", "Misc Config #5", "Misc Config #6", "Misc Config #7"}

ib.headshot1 = {"playerfx/headshot1.wav", "playerfx/headshot2.wav",}
ib.headshot2 = {"player/headshot1.wav", "player/headshot2.wav", "player/headshot3.wav",}
ib.metal = {"phx/hmetal1.wav", "phx/hmetal2.wav", "phx/hmetal3.wav",}

ib.NetMessages = {Buildmode = {"BuildMode", "buildmode", "_Kyle_Buildmode"}, God = {"HasGodMode", "has_god", "god_mode", "ugod"}, Protected = {"LibbyProtectedSpawn", "SH_SZ.Safe", "spawn_protect", "InSpawnZone"}}
ib.frpressed, ib.frtoggle = false
ib.spread = {}

ib.propval = 0
ib.propdelay = 0
ib.crouched = 0

ib.R_ = debug.getregistry()
ib.R = table.Copy(ib.R_)

ib.creator = ib.creator or {}
ib.contributors = ib.contributors or {}

ib.creator["STEAM_0:0:63644275"] = {} -- me
ib.creator["STEAM_0:0:162667998"] = {} -- my alt
ib.contributors["STEAM_0:0:196578290"] = {} -- pinged (code dev, helped me out with optimization and many others)
ib.contributors["STEAM_0:0:37523203"] = {} -- ljackson (code dev, helped me out with loads of optimization)
ib.contributors["STEAM_0:0:4727797"] = {} -- data (code dev, helped me figure out a ton of stuff, especially lua nospread)
ib.contributors["STEAM_0:0:74527587"] = {} -- s0lum (code dev indirectly, got many features from NCMD, including lua nospread)
ib.contributors["STEAM_0:0:453356413"] = {} -- lenn (garry's mod server manager)
ib.contributors["STEAM_0:1:69272242"] = {} -- leme (code dev)
ib.contributors["STEAM_0:0:109145007"] = {} -- scottpott8 (code dev)
ib.contributors["STEAM_0:0:205376238"] = {} -- vectivus (code dev)
ib.contributors["STEAM_0:0:200336136"] = {} -- asteya (code dev)
ib.contributors["STEAM_0:1:188710062"] = {} -- uucka (code tester)
ib.contributors["STEAM_0:1:191270548"] = {} -- cal1nxd (code tester)
ib.contributors["STEAM_0:1:404757"] = {} -- xvcaligo // persix (code tester)
ib.contributors["STEAM_0:0:453611223"] = {} -- naxut (code tester & advertiser and really good friend)
ib.contributors["STEAM_0:1:126050820"] = {} -- papertek // johnrg (ex-code dev & ex-discord manager)
ib.contributors["STEAM_0:1:193781969"] = {} -- outcome // paradox (ex-code dev)
ib.contributors["STEAM_0:1:59798110"] = {} -- mrsquid (old advertiser)
ib.contributors["STEAM_0:1:4375194"] = {} -- ohhstyle (old advertiser)
ib.contributors["STEAM_0:1:101813068"] = {} -- sdunken (first user)

--NOTE-- I want to mention that these are not the only people that helped me with the development of IdiotBox, but they are the ones who helped me the most and that is why they are credited here.

--[[ !!FUTURE UPDATE!!
local function UIScale(i)
    return math.max(i * (ScrH() / 1440), 1)
end
!!FUTURE UPDATE!! ]]--
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
			{"Trouble in Terrorist Town Utilities", 16, 177, 232, 222, 218}, 
			{"Traitor Finder", "Checkbox", false, 78}, 
			{"Ignore Detectives as Innocent", "Checkbox", false, 78}, 
			{"Ignore Fellow Traitors", "Checkbox", false, 78}, 
			{"Hide Round Report", "Checkbox", false, 78}, 
			{"Panel Remover", "Checkbox", false, 78}, 
			{"Prop Kill", "Checkbox", false, 78}, 
			{"Prop Kill Key:", "Toggle", 0, 92, 0}, 
		}, 
		{
			{"DarkRP Utilities", 16, 412, 232, 148, 218}, 
			{"Suicide Near Arrest Batons", "Checkbox", false, 78}, 
			{"Transparent Props", "Checkbox", false, 78}, 
			{"Transparency:", "Slider", 175, 255, 156}, 
			{""}, 
			{"Money Value", "Checkbox", false, 78}, 
		}, 
		{
			{"Murder Utilities", 16, 573, 232, 145, 218}, 
			{"Murderer Finder", "Checkbox", false, 78}, 
			{"Hide End Round Board", "Checkbox", false, 78}, 
			{"Hide Footprints", "Checkbox", false, 78}, 
			{"No Black Screens", "Checkbox", false, 78}, 
			{"Bystander Name", "Checkbox", false, 78}, 
		}, 
		{
			{"Menus", 261, 20, 232, 225, 218}, 
			{"Entity Finder Menu", "Checkbox", false, 78}, 
			{"Plugin Loader Menu", "Checkbox", false, 78}, 
			{"Toolbar Style:", "Selection", "BG Color", {"Border Color", "BG Color"}, 92}, 
			{""}, 
			{"Menu Style:", "Selection", "Borderless", {"Bordered", "Borderless"}, 92}, 
			{""}, 
			{"Options Style:", "Selection", "Borderless", {"Bordered", "Borderless"}, 92}, 
			{""}, 
		}, 
		{
			{"Configurations", 261, 258, 232, 175, 218}, 
			{"Automatically Save", "Checkbox", false, 78}, 
			{"Save Configuration", "Button", "", 92}, 
			{"Load Configuration", "Button", "", 92}, 
			{"Delete Configuration", "Button", "", 92}, 
			{"Configuration:", "Selection", "Legit Config", {"Legit Config", "Rage Config", "HvH Config", "Misc Config #1", "Misc Config #2", "Misc Config #3", "Misc Config #4", "Misc Config #5", "Misc Config #6", "Misc Config #7"}, 92}, 
			{""}, 
		}, 
		{
          	{"Others", 261, 446, 232, 130, 218}, 
			{"Feature Tooltips", "Checkbox", true, 78}, -- Enabled by default
			{"Apply Custom Name", "Button", false, 92}, 
			{"Print Changelog", "Button", "", 92}, 
			{"Unload Cheat", "Button", "", 92}, 
		}, 
		{
			{"Priority List", 506, 20, 232, 205, 218}, 
			{"Enabled", "Checkbox", true, 78}, -- Enabled by default
			{"List Position X:", "Slider", 1356, 2000, 156}, 
			{""}, 
			{"List Position Y:", "Slider", 115, 2000, 156}, 
			{""}, 
			{"List Spacing:", "Slider", 0, 10, 156}, 
			{""}, 
		}, 
		{
			{"Panic Mode", 506, 239, 232, 100, 218}, 
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
			{"Aim FoV Value:", "Slider", 0, 180, 156}, 
			{""}, 
			{"Aim Smoothness:", "Slider", 0, 50, 156}, 
			{""}, 
			{"Silent Aim", "Checkbox", false, 78}, 
			{"Auto Fire", "Checkbox", false, 78}, 
			{"Auto Zoom", "Checkbox", false, 78}, 
			{"Auto Stop", "Checkbox", false, 78}, 
			{"Auto Crouch", "Checkbox", false, 78}, 
			{"Target Lock", "Checkbox", false, 78}, 
		}, 
		{
			{"Triggerbot", 16, 378, 232, 200, 218}, 
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
			{"Target Immune Players", "Checkbox", false, 78}, 
			{"Target Noclipping Players", "Checkbox", false, 78}, 
			{"Target Driving Players", "Checkbox", false, 78}, 
			{"Target Transparent Players", "Checkbox", false, 78}, 
			{"Target Overhealed Players", "Checkbox", false, 78}, 
			{"Max Player Health:", "Slider", 500, 5000, 156}, 
			{""}, 
			{"Distance Limit", "Checkbox", false, 78}, 
			{"Distance:", "Slider", 1500, 5000, 156}, 
			{""}, 
			{"Velocity Limit", "Checkbox", false, 78}, 
			{"Velocity:", "Slider", 1000, 5000, 156}, 
			{""}, 
		}, 
		{
			{"Miscellaneous", 506, 20, 232, 375, 218}, 
			{"Remove Weapon Recoil", "Checkbox", false, 78}, 
			{"Remove Bullet Spread", "Checkbox", false, 78}, 
			{"Projectile Prediction", "Checkbox", false, 78}, 
			{"Auto Reload", "Checkbox", false, 78}, 
			{"Rapid Fire:", "Selection", "Off", {"Off", "Primary Fire", "Alt Fire"}, 92}, 
			{""}, 
			{"Line-of-Sight Check:", "Selection", "Default", {"Off", "Default", "Auto Wallbang"}, 92}, -- Enabled by default
			{""}, 
			{"Disable Interpolation", "Checkbox", false, 78}, 
			{"Manipulate Bullet Time", "Checkbox", false, 78}, 
			{"Bullet Fire Delay:", "Slider", 0, 100, 156}, 
			{""}, 
			{"Show FoV Circle", "Checkbox", false, 78}, 
			{"Snap Lines", "Checkbox", false, 78}, 
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
			{"Yaw:", "Selection", "Off", {"Off", "Forwards", "Backwards", "Sideways", "Fake-Forwards", "Fake-Backwards", "Fake-Sideways", --[["Fake Angles",]] "Jitter", "Backwards Jitter", "Sideways Jitter", "Semi-Jitter", "Back Semi-Jitter", "Side Semi-Jitter", "Side Switch", "Emotion", "Spinbot"}, 92}, 
			{""}, 
			{"Anti-Aim Direction:", "Selection", "Left", {"Left", "Right", "Manual Switch"}, 92}, 
			{""}, 
			{"Switch Key:", "Toggle", 0, 92, 0}, 
			{""}, 
			{"Spinbot Pitch Speed:", "Slider", 30, 180, 156}, 
			{""}, 
			{"Spinbot Yaw Speed:", "Slider", 30, 180, 156}, 
			{""}, 
			{"Emotion Pitch Speed:", "Slider", 18, 100, 156}, 
			{""}, 
			{"Emotion Yaw Speed:", "Slider", 18, 100, 156}, 
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
			{"Lag Choke:", "Slider", 14, 14, 156}, 
			{""}, 
			{"Lag Send:", "Slider", 0, 14, 156}, 
			{""}, 
		}, 
	}, 
	["Visuals"] = {
		{
			{"Wallhack", 16, 20, 232, 700, 218}, 
			{"Enabled", "Checkbox", false, 78}, 
			{"Style:", "Selection", "Optimized", {"Classic", "Optimized"}, 92}, 
			{""}, 
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
			{"Position Lines:", "Selection", "Off", {"Off", "Top", "Center", "Bottom"}, 92}, 
			{""}, 
			{"Name", "Checkbox", false, 78}, 
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
		}, 
		{
			{"Point of View", 261, 20, 232, 725, 218}, 
			{"Custom FoV", "Checkbox", false, 78}, 
			{"FoV Value:", "Slider", 110, 360, 156}, 
			{""}, 
			{"Thirdperson", "Checkbox", false, 78}, 
			{"Thirdperson Key:", "Toggle", 0, 92, 0}, 
			{""}, 
			{"Thirdperson Range:", "Slider", 15, 100, 156}, 
			{""}, 
			{"Thirdperson FoV Value:", "Slider", 110, 360, 156}, 
			{""}, 
			{"Viewmodel Chams:", "Selection", "Off", {"Off", "Normal", "Flat", "Wireframe"}, 92}, 
			{""}, 
			{"Rainbow Mode", "Checkbox", false, 78}, 
			{"No Viewmodel", "Checkbox", false, 78}, 
			{"No Hands", "Checkbox", false, 78}, 
			{"Custom Positions", "Checkbox", false, 78}, 
			{"Viewmodel X:", "Slider", 50, 100, 156}, 
			{""}, 
			{"Viewmodel Y:", "Slider", 30, 60, 156}, 
			{""}, 
			{"Viewmodel Z:", "Slider", 20, 40, 156}, 
			{""}, 
			{"Viewmodel Pitch:", "Slider", 90, 180, 156}, 
			{""}, 
			{"Viewmodel Yaw:", "Slider", 90, 180, 156}, 
			{""}, 
			{"Viewmodel Roll:", "Slider", 90, 180, 156}, 
			{""}, 
		}, 
		{
			{"Miscellaneous", 506, 20, 232, 630, 218}, 
			{"Priority Targets Only", "Checkbox", false, 78}, 
			{"Hide Ignored Targets", "Checkbox", false, 78}, 
			{"Target Priority Colors", "Checkbox", true, 78}, -- Enabled by default
			{"Show Enemies Only", "Checkbox", false, 78}, 
			{"Show Spectators", "Checkbox", false, 78}, 
			{"Team Colors", "Checkbox", true, 78}, -- Enabled by default
			{"Adaptive Text Color", "Checkbox", true, 78}, -- Enabled by default
			{"Show NPCs", "Checkbox", false, 78}, 
			{"NPC Name", "Checkbox", false, 78}, 
			{"NPC Box", "Checkbox", false, 78}, 
			{"NPC Glow", "Checkbox", false, 78}, 
			{"NPC Chams:", "Selection", "Off", {"Off", "Normal", "Flat", "Wireframe", "Model"}, 92}, 
			{""}, 
			{"Show Entities", "Checkbox", false, 78}, 
			{"Entity Name", "Checkbox", false, 78}, 
			{"Entity Box", "Checkbox", false, 78}, 
			{"Entity Glow", "Checkbox", false, 78}, 
			{"Entity Chams:", "Selection", "Off", {"Off", "Normal", "Flat", "Wireframe", "Model"}, 92}, 
			{""}, 
			{"Dormant Check:", "Selection", "All", {"None", "Players", "Entities", "All"}, 92}, 
			{""}, 
			{"Distance Limit", "Checkbox", false, 78}, 
			{"Distance:", "Slider", 1500, 5000, 156}, 
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
			{"Emotes:", "Selection", "Off", {"Off", "dance", "muscle", "wave", "robot", "bow", "cheer", "laugh", "zombie", "agree", "disagree", "forward", "becon", "salute", "pers", "halt", "group", "Random"}, 92}, 
			{""}, 
			{"Murder Taunts:", "Selection", "Off", {"Off", "Funny", "Help", "Scream", "Morose", "Random"}, 92}, 
			{""}, 
		}, 
		{
			{"Textures", 16, 253, 232, 192, 218}, 
			{"Transparent Walls", "Checkbox", false, 78}, 
			{"Transparency:", "Slider", 82, 100, 156}, 
			{""}, 
			{"Remove Sky", "Checkbox", false, 78}, 
			{"Remove 3D Skybox", "Checkbox", false, 78}, 
			{"Bright Mode", "Checkbox", false, 78}, 
			{"Dark Mode", "Checkbox", false, 78}, 
		}, 
		{
			{"Panels", 16, 459, 232, 294, 218}, 
			{"Spectators Window", "Checkbox", true, 78}, -- Enabled by default
			{"Radar Window", "Checkbox", true, 78}, -- Enabled by default
			{"Radar Distance:", "Slider", 50, 100, 156}, 
			{""}, 
			{"Debug Info", "Checkbox", true, 78}, -- Enabled by default
			{"Players List", "Checkbox", true, 78}, -- Enabled by default
			{"Show List Titles", "Checkbox", true, 78}, -- Enabled by default
			{"Panels Style:", "Selection", "Borderless", {"Bordered", "Borderless"}, 92}, 
			{""}, 
			{"Radar Lines Style:", "Selection", "Border Color", {"Border Color", "BG Color"}, 92}, 
			{""}, 
		}, 
		{
			{"Movement", 261, 20, 232, 425, 218}, 
			{"Bunny Hop", "Checkbox", false, 78}, 
			{"Auto Strafe:", "Selection", "Off", {"Off", "Legit", "Rage", "Directional"}, 92}, 
			{""}, 
			{"Circle Strafe", "Checkbox", false, 78}, 
			{"Circle Strafe Key:", "Toggle", 0, 92, 0}, 
			{""}, 
			{"Circle Strafe Speed:", "Slider", 2, 6, 156}, 
			{""}, 
			{"Rage Mode", "Checkbox", false, 78}, 
			{"Air Crouch", "Checkbox", false, 78}, 
			{"Fake Crouch", "Checkbox", false, 78}, 
			{"Air Stuck", "Checkbox", false, 78}, 
			{"Air Stuck Key:", "Toggle", 0, 92, 0}, 
			{""}, 
			{"Air Stuck Value:", "Slider", 100, 500, 156}, 
			{""}, 
		}, 
		{
			{"Free Roaming", 261, 459, 232, 205, 218}, 
			{"Enabled", "Checkbox", false, 78}, 
			{"Toggle Key:", "Toggle", 0, 92, 0}, 
			{""}, 
			{"Speed:", "Slider", 30, 100, 156}, 
			{""}, 
			{"FoV Value:", "Slider", 110, 360, 156}, 
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
			{"Sounds", 506, 254, 232, 191, 218}, 
			{"Reset All Game Sounds", "Button", "", 92}, 			
			{"Hitsounds:", "Selection", "Off", {"Off", "Default", "Headshot 1", "Headshot 2", "Metal", "Blip", "Eggcrack", "Balloon Pop"}, 92}, 
			{""}, 
			{"Killsounds:", "Selection", "Off", {"Off", "Default", "Headshot 1", "Headshot 2", "Metal", "Blip", "Eggcrack", "Balloon Pop"}, 92}, 
			{""}, 
			{"Music Player:", "Selection", "Off", {"Off", "Rust", "Resonance", "Daisuke", "A Burning M...", "Libet's Delay", "Lullaby Of T...", "Erectin' a River", "Fleeting Love", "Malo Tebya", "Vermilion", "Gravity", "Remorse", "Hold", "Green Valleys", "FP3", "Random"}, 92}, 
			{""}, 
		}, 
		{
			{"GUI Settings", 506, 459, 232, 145, 218}, 
			{"Advanced Network Graph", "Checkbox", false, 78}, 
			{"Hide HUD", "Checkbox", false, 78}, 
			{"Witness Finder", "Checkbox", false, 78}, 
			{"Crosshair:", "Selection", "Off", {"Off", "Box", "Dot", "Square", "Circle", "Cross", "Edged Cross", "Swastika", "GTA IV"}, 92}, 
			{""}, 
		}, 
	}, 
	["Adjustments"] = {
		{
			{"Menu Text Color", 16, 20, 232, 105, 88}, 
			{"Red:", "SliderOld", 255, 255, 92}, 
			{"Green:", "SliderOld", 255, 255, 92}, 
			{"Blue:", "SliderOld", 255, 255, 92}, 
		}, 
		{
			{"Background Menu Color", 16, 138, 232, 105, 88}, 
			{"Red:", "SliderOld", 30, 255, 92}, 
			{"Green:", "SliderOld", 30, 255, 92}, 
			{"Blue:", "SliderOld", 37, 255, 92}, 
		}, 
		{
			{"Border Color", 16, 256, 232, 105, 88}, 
			{"Red:", "SliderOld", 0, 255, 92}, 
			{"Green:", "SliderOld", 155, 255, 92}, 
			{"Blue:", "SliderOld", 255, 255, 92}, 
		}, 
		{
			{"Viewmodel Color", 16, 374, 232, 105, 88}, 
			{"Red:", "SliderOld", 0, 255, 92}, 
			{"Green:", "SliderOld", 235, 255, 92}, 
			{"Blue:", "SliderOld", 255, 255, 92}, 
		}, 
		{
			{"Crosshair Color", 16, 492, 232, 130, 88}, 
			{"Red:", "SliderOld", 0, 255, 92}, 
			{"Green:", "SliderOld", 235, 255, 92}, 
			{"Blue:", "SliderOld", 255, 255, 92}, 
			{"Opacity:", "SliderOld", 255, 255, 92}, 
		}, 
		{
			{"Team Visuals Color", 261, 20, 232, 105, 88}, 
			{"Red:", "SliderOld", 255, 255, 92}, 
			{"Green:", "SliderOld", 255, 255, 92}, 
			{"Blue:", "SliderOld", 0, 255, 92}, 
		}, 
		{
			{"Enemy Visuals Color", 261, 138, 232, 105, 88}, 
			{"Red:", "SliderOld", 255, 255, 92}, 
			{"Green:", "SliderOld", 125, 255, 92}, 
			{"Blue:", "SliderOld", 255, 255, 92}, 
		}, 
		{
			{"Priority Targets Color", 261, 256, 232, 105, 88}, 
			{"Red:", "SliderOld", 255, 255, 92}, 
			{"Green:", "SliderOld", 0, 255, 92}, 
			{"Blue:", "SliderOld", 100, 255, 92}, 
		}, 
		{
			{"Ignored Targets Color", 261, 374, 232, 105, 88}, 
			{"Red:", "SliderOld", 175, 255, 92}, 
			{"Green:", "SliderOld", 175, 255, 92}, 
			{"Blue:", "SliderOld", 175, 255, 92}, 
		}, 
		{
			{"Others", 261, 492, 232, 105, 88}, 
			{"Text Opacity:", "SliderOld", 255, 255, 92}, 
			{"BG Darkness:", "SliderOld", 22, 25, 92}, 
			{"Roundness:", "SliderOld", 0, 30, 92}, 
		}, 
		{
			{"Misc Visuals Color", 506, 20, 232, 105, 88}, 
			{"Red:", "SliderOld", 0, 255, 92}, 
			{"Green:", "SliderOld", 255, 255, 92}, 
			{"Blue:", "SliderOld", 255, 255, 92}, 
		}, 
		{
			{"Team Chams Color", 506, 138, 232, 105, 88}, 
			{"Red:", "SliderOld", 255, 255, 92}, 
			{"Green:", "SliderOld", 215, 255, 92}, 
			{"Blue:", "SliderOld", 0, 255, 92}, 
		}, 
		{
			{"Enemy Chams Color", 506, 256, 232, 105, 88}, 
			{"Red:", "SliderOld", 255, 255, 92}, 
			{"Green:", "SliderOld", 70, 255, 92}, 
			{"Blue:", "SliderOld", 255, 255, 92}, 
		}, 
		{
			{"Window Adjustments", 506, 374, 232, 130, 88}, 
			{"Spectators X:", "SliderOld", 7, 1920, 92}, 
			{"Spectators Y:", "SliderOld", 25, 1080, 92}, 
			{"Radar X:", "SliderOld", 1710, 1920, 92}, 
			{"Radar Y:", "SliderOld", 25, 1080, 92}, 
		}, 
		{
			{"List Adjustments", 506, 518, 232, 130, 88}, 
			{"Debug Info X:", "SliderOld", 7, 1920, 92}, 
			{"Debug Info Y:", "SliderOld", 265, 1080, 92}, 
			{"Players List X:", "SliderOld", 7, 1920, 92}, 
			{"Players List Y:", "SliderOld", 444, 1080, 92}, 
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

local function GetOptionValue(men, sub, lookup)
    if not options[men] then
        return nil
    end
    for _, aaa in pairs(options[men]) do
        if aaa[1][1] == sub then
            for _, val in pairs(aaa) do
                if val[1] == lookup then
                    return val[3]
                end
            end
        end
    end
    return nil
end

local function gBool(men, sub, lookup)
    local value = GetOptionValue(men, sub, lookup)
    return value and value == true
end

local function gOption(men, sub, lookup)
    local value = GetOptionValue(men, sub, lookup)
    return value or ""
end

local function gInt(men, sub, lookup)
    local value = GetOptionValue(men, sub, lookup)
    return value or 0
end

local function gKey(men, sub, lookup)
    if not options[men] then
        return false
    end
    local value = GetOptionValue(men, sub, lookup)
    if value then
        return input.IsKeyDown(value) or input.IsMouseDown(value) or value == 0
    end
    return false
end

local function Popup(time, text, color)
    if not windowopen then
        color = color or Color(255, 255, 255)
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
            draw.DrawText(text, "MenuFont2", w / 2, 6, color, 1, 1)
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

do
	if gui.IsGameUIVisible() then
		gui.HideGameUI()
	end
	if BRANCH ~= "unknown" then
		Popup(4.3, "ERROR! Cannot load IdiotBox in this Garry's Mod branch.", Color(255, 0, 0))
		surface.PlaySound("buttons/lightswitch2.wav")
		return
	end
	if not file.Exists("lua/bin/gmcl_bsendpacket_win32.dll", "MOD") or not file.Exists("lua/bin/gmcl_chatclear_win32.dll", "MOD") or not file.Exists("lua/bin/gmcl_big_win32.dll", "MOD") then
		Popup(4.3, "ERROR! Please install the modules before initializing IdiotBox.", Color(255, 0, 0))
		surface.PlaySound("buttons/lightswitch2.wav")
		return
	end
	global.Loaded = true
end

require("bsendpacket")
require("chatclear")
require("big")

global.bSendPacket = true
global.unloaded = false
global.TickCount = 0

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

function ib.SaveConfig(index)
    if index < 1 or index > #ib.configFiles then return end
    file.Write(folder.."/"..ib.configFiles[index], util.TableToJSON(options))
end

function ib.UpdateVar(men, sub, lookup, new)
	for aa, aaa in next, options[men] do
		for key, val in next, aaa do
			if (aaa[1][1] ~= sub) then continue end
				if (val[1] == lookup) then
				val[3] = new
			end
		end
	end
end

function ib.LoadConfig(index)
    if index < 1 or index > #ib.configFiles then return end
    if file.Exists(folder.."/"..ib.configFiles[index], "DATA") then
        local tab = util.JSONToTable(file.Read(folder.."/"..ib.configFiles[index], "DATA"))
        local cursub
        for k, v in next, tab do
            if not options[k] then continue end
            for men, subtab in next, v do
                for key, val in next, subtab do
                    if key == 1 then
                        cursub = val[1]
                        continue
                    end
                    ib.UpdateVar(k, cursub, val[1], val[3])
                end
            end
        end
    end
end

for k, v in next, order do
	visible[v] = false
end

local function DrawText(w, h, title)
    local curcol, curcol2, curcol3
	curcol = Color(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 175)
	curcol2 = Color(bordercol.r, bordercol.g, bordercol.b, 175)
	curcol3 = Color(bordercol.r, bordercol.g, bordercol.b, 255)
    if gOption("Main Menu", "Menus", "Toolbar Style:") == "BG Color" then
        for i = 0, 28 do
			surface.SetDrawColor(curcol)
			surface.DrawLine(1.5, i + 1, w - 2, i + 1)
		end
		for i = 0, 1 do
			surface.SetDrawColor(curcol3)
			surface.DrawLine(0.5, i + 1, w - 1.5, i + 1)
		end
    elseif gOption("Main Menu", "Menus", "Toolbar Style:") == "Border Color" then
        for i = 0, 28 do
			surface.SetDrawColor(curcol2)
			surface.DrawLine(1.5, i + 1, w - 2, i + 1)
		end
    end
    surface.SetDrawColor(0, 0, 0, 255)
    surface.DrawLine(0.5, 3, w - 1.5, 3)
    surface.SetFont("MenuFont2")
    local tw, th = surface.GetTextSize("")
    surface.SetTextPos(37, 15 - th / 2)
    surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
    surface.SetFont("MainFont")
    surface.DrawText(title)
    if title == "IdiotBox v7.1.b1" then
        surface.SetTextPos(147, 18 - th / 2)
        surface.SetFont("MainFont2")
        surface.DrawText("Latest build: d04m12-pre15")
    end
end

local function MouseInArea(minx, miny, maxx, maxy)
    if vgui.GetHoveredPanel() ~= frame then return false end
    local mousex, mousey = gui.MousePos()
    return(mousex < maxx and mousex > minx and mousey < maxy and mousey > miny)
end

local function MouseInArea2(minx, miny, maxx, maxy) -- Probably very stupid but it'll work for now
    local mousex, mousey = gui.MousePos()
    return(mousex < maxx and mousex > minx and mousey < maxy and mousey > miny)
end

local function DrawTabs(self, w, h)
	local mx, my = self:GetPos()
	local sizeper = (w - 8) / #order
	local maxx = 0
	for k, v in next, order do
		local bMouse = MouseInArea(mx + 5 + maxx, my + 30, mx + 5 + maxx + sizeper, my + 30 + 30)
		if (visible[v]) then
			local curcol = Color(bordercol.r, bordercol.g, bordercol.b, 255)
			local curcol2 = Color(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 145)
			local curcol3 = Color(bordercol.r, bordercol.g, bordercol.b, 145)
			for i = 0, 1 do
				surface.SetDrawColor(curcol)
				surface.DrawLine(3.5 + maxx, 61 + i, 3.5 + maxx + sizeper, 61 + i)
			end
			if gOption("Main Menu", "Menus", "Toolbar Style:") == "BG Color" then
				for i = 0, 30 do
					surface.SetDrawColor(curcol2)
					surface.DrawLine(3.5 + maxx, 30 + i, 3.5 + maxx + sizeper, 30 + i)
				end
			elseif gOption("Main Menu", "Menus", "Toolbar Style:") == "Border Color" then
				for i = 0, 30 do
					surface.SetDrawColor(curcol3)
					surface.DrawLine(3.5 + maxx, 30 + i, 3.5 + maxx + sizeper, 30 + i)
				end
			end
		elseif (bMouse) then
			local curcol = Color(bordercol.r, bordercol.g, bordercol.b, 185)
			local curcol2 = Color(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 65)
			local curcol3 = Color(bordercol.r, bordercol.g, bordercol.b, 65)
			for i = 0, 1 do
				surface.SetDrawColor(curcol)
				surface.DrawLine(3.5 + maxx, 61 + i, 3.5 + maxx + sizeper, 61 + i)
			end
			if gOption("Main Menu", "Menus", "Toolbar Style:") == "BG Color" then
				for i = 0, 30 do
					surface.SetDrawColor(curcol2)
					surface.DrawLine(3.5 + maxx, 30 + i, 3.5 + maxx + sizeper, 30 + i)
				end
			elseif gOption("Main Menu", "Menus", "Toolbar Style:") == "Border Color" then
				for i = 0, 30 do
					surface.SetDrawColor(curcol3)
					surface.DrawLine(3.5 + maxx, 30 + i, 3.5 + maxx + sizeper, 30 + i)
				end
			end
		end
		if (bMouse and input.IsMouseDown(MOUSE_LEFT) and not mousedown and not visible[v]) then
			local nb = visible[v]
			for key, val in next, visible do
				visible[key] = false
			end
			visible[v] = not nb
		end
		local curcol2 = Color(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 70)
		local curcol3 = Color(bordercol.r, bordercol.g, bordercol.b, 70)
		if gOption("Main Menu", "Menus", "Toolbar Style:") == "BG Color" then
			for i = 0, 30 do
				surface.SetDrawColor(curcol2)
				surface.DrawLine(3.5 + maxx, 30 + i, 3.5 + maxx + sizeper, 30 + i)
			end
		elseif gOption("Main Menu", "Menus", "Toolbar Style:") == "Border Color" then
			for i = 0, 30 do
				surface.SetDrawColor(curcol3)
				surface.DrawLine(3.5 + maxx, 30 + i, 3.5 + maxx + sizeper, 30 + i)
			end
		end
		surface.SetFont("MainFont3")
		surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, 255)
		local tw, th = surface.GetTextSize(v)
		surface.SetTextPos(5 + maxx + sizeper / 2 - tw / 2, 31 + 15 - th / 2)
		surface.DrawText(v)
		maxx = maxx + sizeper
	end
end

local function DrawCheckbox(self, w, h, var, maxy, posx, posy, dist)
	local size = var[4]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.SetTextPos(25 + posx + 15 + 5, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(bgmenucol.r + 175, bgmenucol.g + 175, bgmenucol.b + 175, 55)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx - 193 + posx + dist, my + 61 + posy + maxy, mx - 193 + posx + dist + size - 65, my + 61 + posy + maxy + 16)
	if bMouse then
		surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:") - 155)
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
		elseif feat == "Entity Finder Menu" then
			info = "Allows you to highlight any entitiy. Enable by toggling 'Show Entities' from Wallhack > Miscellaneous."
		elseif feat == "Plugin Loader Menu" then
			info = "Allows you to load any Lua script located in your Garry's Mod 'lua' folder."
		elseif feat == "Automatically Save" then
			info = "Saves your current configuration automatically."
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
		elseif feat == "Target Immune Players" then
			info = "Makes the Aim Assist target players immune to damage."
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
		elseif feat == "Disable Interpolation" then
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
			info = "Draws the player's bystander name in Murder. Enable Wallhack for this feature to work."
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
		elseif feat == "Money Value" then
			info = "Draws the player's money value in DarkRP. Enable Wallhack for this feature to work."
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
		elseif feat == "Adaptive Text Color" then
			info = "Changes the Wallhack text color to the current Wallhack color."
		elseif feat == "Spectators Window" then
			info = "Draws a spectator box, where you will be alerted if anyone is currently spectating you."
		elseif feat == "Radar Window" then
			info = "Draws a Radar Window."
		elseif feat == "Debug Info" then
			info = "Draws your ping, framerate, current date and time etc."
		elseif feat == "Players List" then
			info = "Draws a list of the players present on a server, along with their ranks."
		elseif feat == "Show List Titles" then
			info = "Shows the titles for both Debug Info and Players List."
		elseif feat == "Show NPCs" then
			info = "Shows NPCs on Visuals. This feature uses the classic Wallhack style by default."
		elseif feat == "NPC Name" then
			info = "Draws the NPC's name."
		elseif feat == "NPC Box" then
			info = "Draws a 2D box around the NPC."
		elseif feat == "NPC Glow" then
			info = "Draws a glowing outline of the NPC."
		elseif feat == "Show Entities" then
			info = "Draws the selected entities from the Entity Finder Menu. This feature uses the classic Wallhack style by default."
		elseif feat == "Entity Name" then
			info = "Draws the names of the selected entities from the Entity Finder Menu."
		elseif feat == "Entity Box" then
			info = "Draws a 3D box around the selected entities from the Entity Finder Menu."
		elseif feat == "Entity Glow" then
			info = "Draws a glowing outline of the selected entities from the Entity Finder Menu."
		elseif feat == "Advanced Network Graph" then
			info = "Displays a very detailed network graph (net_graph 4)."
		elseif feat == "Hide HUD" then
			info = "Hides the original HUD, for example: health value, ammo value, crosshair etc."
		elseif feat == "Witness Finder" then
			info = "Shows how many people can currently see you."
		elseif feat == "Show FoV Circle" then
			info = "Draws a circle indicating your Aimbot's FoV value."
		elseif feat == "Snap Lines" then
			info = "Draws a line towards the player currently being targeted by your Aimbot."
		elseif feat == "Flash Spam" then
			info = "Spams your flashlight, for fun."
		elseif feat == "Use Spam" then
			info = "Spams the 'use' command on interactive entities."
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
		elseif feat == "Rage Mode" then
			info = "Forces the Legit and Directional auto strafers to move forwards. NOT the same as the Rage auto strafer."
		elseif feat == "Air Crouch" then
			info = "Spam-crouches you when jumping."
		elseif feat == "Fake Crouch" then
			info = "Combines walking and spam-crouching."
		elseif feat == "Air Stuck" then
			info = "Abuses sequencing in order to freeze you mid-air."
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
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.SetTextPos(posx - 193 + dist + 2, 61 + posy + maxy)
	surface.DrawText(var[1])
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(bgmenucol.r + 175, bgmenucol.g + 175, bgmenucol.b + 175, 55)
	surface.DrawRect(posx - 193 + dist + 2, 80 + posy + maxy + 9, size, 4)
	local ww = math.ceil(curnum * size / max)
	surface.SetDrawColor(bgmenucol.r + 175, bgmenucol.g + 175, bgmenucol.b + 175, 180)
	surface.DrawRect(posx - 195 + dist + 2 + ww, 81 + posy + maxy + 9 - 5, 4, 12)
	local tw, th = surface.GetTextSize(curnum)
	surface.DrawOutlinedRect(posx - 195 + dist + 2 + ww, 81 + posy + maxy + 4, 4, 12)
	surface.SetFont("MenuFont")
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

function ib.DrawOldSlider(self, w, h, var, maxy, posx, posy, dist) -- I fucking ran out of local variables (you have never seen such good optimization)
	local curnum = var[3]
	local max = var[4]
	local size = var[5]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.SetTextPos(5 + posx + 15 + 5, 61 + posy + maxy)
	surface.DrawText(var[1])
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(bgmenucol.r + 175, bgmenucol.g + 175, bgmenucol.b + 175, 55)
	surface.DrawRect(5 + posx + 15 + 5 + dist, 60 + posy + maxy + 9, size, 4)
	local ww = math.ceil(curnum * size / max)
	surface.SetDrawColor(bgmenucol.r + 175, bgmenucol.g + 175, bgmenucol.b + 175, 180)
	surface.DrawRect(3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 9 - 5, 4, 12)
	local tw, th = surface.GetTextSize(curnum)
	surface.DrawOutlinedRect(3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 4, 4, 12)
	surface.SetFont("MenuFont")
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

local function DrawDropdown(self, w, h, var, maxy, posx, posy, dist)
	local size = var[5]
	local curopt = var[3]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.SetTextPos(posx - 193 + dist + 2, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(var[1])
	surface.DrawText(var[1])
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + posx - 193 + dist + 2, my + 81 + posy + maxy, mx + posx - 193 + dist + 2 + size, my + 81 + posy + maxy + 14)
	local check = dist..posy..posx..w..h..maxy
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r - 65, menutextcol.g - 65, menutextcol.b - 50, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 55)
	surface.DrawRect(posx - 193 + dist + 2, 81 + posy + maxy + 2, size - 3, 14)
	if (bMouse || notyetselected == check) then
		surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 180)
		surface.DrawRect(posx - 193 + dist + 2, 81 + posy + maxy + 2, size - 3, 14)
		local feat = var[1]
		if feat == "Toolbar Style:" then
			info = "Choose between having a plain or a colored menu toolbar."
		elseif feat == "Menu Style:" then
			info = "Choose between having a plain or a bordered menu frame."
		elseif feat == "Options Style:" then
			info = "Choose between having a plain or a bordered options list."
		elseif feat == "Panels Style:" then
			info = "Choose between having plain or bordered panel frames."
		elseif feat == "Radar Lines Style:" then
			info = "Choose between having plain or colored radar lines."
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
		elseif feat == "Style:" then
			info = "Choose between the classic and the optimized Wallhack styles. The new optimized style is highly recommended."
		elseif feat == "Visibility:" then
			info = "Choose whether or not to show yourself as well on Wallhack."
		elseif feat == "Box:" then
			info = "Draws different types of boxes around the player."
		elseif feat == "Chams:" then
			info = "Draws playermodels through walls, either as custom models or regular playermodels."
		elseif feat == "Position Lines:" then
			info = "Draws lines that indicate player positions."
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
				surface.SetFont("MenuFont3")
				surface.SetTextColor(menutextcol.r - 65, menutextcol.g - 65, menutextcol.b - 50, gInt("Adjustments", "Others", "Text Opacity:"))
				surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 222)
				surface.DrawRect(posx - 191 + dist, 81 + posy + maxy + maxy2, size - 3, 14)
				local bMouse2 = MouseInArea(mx + posx - 193 + dist + 2, my + 81 + posy + maxy + maxy2, mx + posx - 193 + dist + 2 + size, my + 81 + posy + maxy + 14 + maxy2)
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
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.SetTextPos(posx - 193 + dist + 2, 61 + posy + maxy)
	local tw, th = surface.GetTextSize(text)
	surface.DrawText(var[1])
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + posx - 193 + dist + 2, my + 81 + posy + maxy, mx + posx - 193 + dist + 2 + size, my + 81 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r - 65, menutextcol.g - 65, menutextcol.b - 50, gInt("Adjustments", "Others", "Text Opacity:"))
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
		elseif feat == "Air Stuck Key:" then
			info = "Toggle Air Stuck by holding down your desired key."
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
        	if !input.IsKeyDown(KEY_BACKSPACE) && !input.IsKeyDown(KEY_ESCAPE) && !input.IsKeyDown(KEY_CAPSLOCK) && !input.IsKeyDown(KEY_CAPSLOCKTOGGLE) && !input.IsKeyDown(KEY_SCROLLLOCK) && !input.IsKeyDown(KEY_SCROLLLOCKTOGGLE) && !input.IsKeyDown(KEY_NUMLOCK) && !input.IsKeyDown(KEY_NUMLOCKTOGGLE) && !input.IsKeyDown(KEY_LWIN) && !input.IsKeyDown(KEY_RWIN) then
        	for i = 1, 159 do
        		if !input.IsKeyDown(KEY_BACKSPACE) && !input.IsKeyDown(KEY_ESCAPE) && !input.IsKeyDown(KEY_CAPSLOCK) && !input.IsKeyDown(KEY_CAPSLOCKTOGGLE) && !input.IsKeyDown(KEY_SCROLLLOCK) && !input.IsKeyDown(KEY_SCROLLLOCKTOGGLE) && !input.IsKeyDown(KEY_NUMLOCK) && !input.IsKeyDown(KEY_NUMLOCKTOGGLE) && !input.IsKeyDown(KEY_LWIN) && !input.IsKeyDown(KEY_RWIN) then
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
	global.unloaded = true
	local hooksToRemove = {"RenderScene", "ShutDown", "PostDrawViewModel", "PreDrawEffects", "HUDShouldDraw", "Tick", "Think", "CalcViewModelView", "PreDrawSkyBox", "PreDrawViewModel", "PreDrawPlayerHands", "RenderScreenspaceEffects", "player_hurt", "entity_killed", "Move", "CalcView", "AdjustMouseSensitivity", "ShouldDrawLocalPlayer", "CreateMove", "player_disconnect", "MiscPaint", "PreDrawOpaqueRenderables", "OnPlayerChat",}
	for _, hookName in ipairs(hooksToRemove) do
		hook.Remove(hookName, hookName)
	end
	concommand.Remove("ib_changename")
	concommand.Remove("ib_usespam")
	local selectedConfig = gOption("Main Menu", "Configurations", "Configuration:")
	local configIndex
	for index, config in ipairs(ib.configOptions) do
		if config == selectedConfig then
			configIndex = index
			break
		end
	end
	if gBool("Main Menu", "Configurations", "Automatically Save") then
		if configIndex then
			ib.SaveConfig(configIndex)
		end
	end
	me:ConCommand("M9KGasEffect 1 cl_interp 0 cl_interp_ratio 2 cl_updaterate 30")
	global.bSendPacket = true
	global.Loaded = false
	timer.Create("ChatPrint", 0.1, 1, function() Popup(2.5, "Successfully unloaded IdiotBox!", Color(0, 255, 0)) end)
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
end

function ib.Changelog() -- Ran out of local variables, again
	print("===============================================================================================\n\n")
	print("IdiotBox v7.1.b1 CODE BUGFIXES (in no particular order)")
	print("")
	print("Please note: This changelog includes bugfixes from previous updates as well.")
	print("\n")
	print("- The 'readme.txt' file is finally up-to-date and only contains important information;")
	print("- Optimized UI design for more user-friendliness;")
	print("- Cleaned up bad hooks and functions for better performance;")
	print("- Merged Ragebot and Legitbot into a single function;")
	print("- Fixed Entities not using the correct Visuals color;")
	print("- Fixed entity list not showing props and being too cluttered;")
	print("- Fixed visual bug, where weapons would display a weird name on Wallhack;")
	print("- Fixed alignment issues with the window borders;")
	print("- Fixed being unable to fly planes and rotate props or camera angles;")
	print("- Fixed Kill Spam giving script errors when an NPC was killed;") -- Old, but gold
	print("- Fixed Entity Loader Menu breaking the cheat menu after closing it;")
	print("- Fixed Aim FoV automatically disabling Anti-Aim;")
	print("- Fixed toggle keys glitching out and working improperly;")
	print("- Fixed 3D Box and Hitbox rendering issues;")
	print("- Fixed colliding options in the drop-down selecion tabs;")
	print("- Fixed extreme bug where the anti-screengrabber would make you run out of VRAM and crash your system;")
	print("- Fixed Bunny Hop and Auto Strafe breaking Free Roaming and breaking player movement when in water;")
	print("- Fixed Hitbox spamming the console with error messages;")
	print("- Fixed Snap Lines still showing when Aimbot is not enabled;")
	print("- Fixed Aimbot and Triggerbot targeting spawning players;")
	print("- Fixed misplaced tab selection lines;")
	print("- Fixed Viewmodel Chams not always covering the viewmodel hands;")
	print("- Fixed poorly placed checkboxes/ sliders/ selections;")
	print("- Fixed Anti-Aim Resolver continuing to resolve angles when set to 'Off';")
	print("- Fixed text coloring and positioning issues with the optimized Wallhack style;")
	print("- Fixed directional strafing angle calculation errors;")
	print("- Fixed Circle Strafe spaghetti code not functioning the way it should;")
	print("- Fixed Priority List staying on-screen after closing the menu;")
	print("- Fixed Advanced Network Graph breaking the net_graph command;")
	print("- Fixed name changer/ stealer reverting to your Steam username as soon as a new player joined the server;")
	print("- Fixed Visuals causing severe lag;")
	print("- Fixed Cheater Callout clearing chat when it should not;")
	print("- Fixed Triggerbot Smooth Aim slowing down your overall mouse speed;")
	print("- Fixed Witness Finder not working properly;")
	print("- Fixed Reset Sounds only working when the menu is toggled;")
	print("- Fixed certain outlines and fonts not having the proper dimensions;")
	print("- Fixed a Projectile Prediction bug where dying would cause script errors;")
	print("- Fixed Disable Interpolation, Optimize Game and Dark Mode not resetting when disabled;")
	print("- Fixed missing spread prediction and recoil compensation checks;")
	print("- Fixed improper rendering of the visuals;")
	print("- Fixed script errors appearing upon loading IdiotBox through the webloader;")
	print("- Fixed anti-screengrabber security issues;")
	print("- Fixed module issues upon reloading the script/ loading it in Single Player mode;")
	print("- Fixed local variable limit and timer issues;")
	print("- Reworked localizations and overall script for better performance;")
	print("- Reorganized certain out-of-place functions and menu options;")
	print("- Renamed certain misspelled or broken functions and menu options;")
	print("- Removed broken/ useless file.Read detour;")
	print("- Removed calls and variables that had no use;")
	print("- Removed cloned hooks for better performance.")
	print("\n")
	print("IdiotBox v7.1.b1 FEATURE CHANGES (in no particular order)")
	print("")
	print("Please note: This changelog includes feature changes from previous updates as well.")
	print("\n")
	print("- Added 'Projectile Prediction' and 'Line-of-Sight Check' to Aimbot;")
	print("- Added 'Emote Resolver' to Resolver;")
	print("- Added 'Distance Limit', 'Velocity Limit' and NPC targeting to Aim Assist;")
	print("- Added 'Default', 'Static', 'Distance Adapt' and 'Crosshair Adapt' to Anti-Aim;")
	print("- Added 'Position Lines', 'Flat' & 'Wireframe' chams materials, 'Adaptive Text Colors' and 'Target Priority Colors' to Visuals;")
	print("- Added 'Remove 3D Skybox' to Textures;")
	print("- Added 'Feature Tooltips', 'Spectator Mode' and more gamemode specific features to Main Menu;")
	print("- Added 'Target Spectators', 'Target Players', 'Target Immune Players' and 'Target Enemies' to Aim Priorities;")
	print("- Added 'Toggle Key' and 'Speed' to Free Roaming;")
	print("- Added 'Air Stuck', 'Circle Strafe Key' and 'Fake Crouch' to Movement;")
	print("- Added 'Arabic Spam' and 'Hebrew Spam' to Chat Spam;") -- Old, but gold
	print("- Added 'Thirdperson Key', 'Custom Positions', 'Rainbow Mode' and 'Flat' & 'Wireframe' chams to Point of View;")
	print("- Added 'Legit', 'Rage' and 'Directional' to Auto Strafe;")
	print("- Added 'GUI Settings' to Miscellaneous;")
	print("- Added better anti-cheat detection and protection;")
	print("- Added customizable list adjustments to Priority List;")
	print("- Added spread prediction and recoil compensation to Triggerbot;")
	print("- Added engine prediction module (big.dll);")
	print("- Added more hitsounds, killsounds, more music and a custom music player to Sounds;")
	print("- Added more customization options to Panels;")
	print("- Reworked 'Bunny Hop' and 'Auto Strafe' from scratch;")
	print("- Reworked 'Wallhack' from scratch;")
	print("- Reworked 'Radar', 'Spectators', 'Debug Info' and 'Players List' from Panels;")
	print("- Reworked 'Traitor Finder' and 'Murderer Finder' from Main Menu;")
	print("- Reworked 'Show NPCs' and 'Show Entities' from Visuals;")
	print("- Reworked 'Emotes' from Miscellaneous, allowing you to move while acting;")
	print("- Reworked 'Free Roaming' from Miscellaneous, so that you will no longer have to hold down the toggle key in order to roam;")
	print("- Reworked anti-screengrabber from scratch;")
	print("- Reworked the menu's design from scratch, again;")
	print("- Reworked old 'file.Read' blocker from scratch;")
	print("- Reworked spread prediction from scratch;")
	print("- Reworked recoil compensation from scratch;")
	print("- Removed 'Triggerbot' tab and merged it with the 'Aim Assist' tab;")
	print("- Removed 'Shoutout' and 'Drop Money' from Chat Spam;")
	print("- Removed 'Screengrab Notifications' from Miscellaneous;")
	print("- Removed 'Mirror' from Point of View;")
	print("- Removed 'dickwrap.dll' and 'fhook.dll' modules;")
	print("- Changed the Armor Bar and Armor Value colors from bright green to bright blue;")
	print("- Changed the default colors, menu size and others.")
	print("\n")
	print("IdiotBox TO-DO LIST (in no particular order)")
	print("")
	print("Please note: This list includes any potential future additions/ changes/ removals, and is subject to change.")
	print("\n")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): add 'Backtracking' and 'Multi-Tap' to Aim Assist;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): add 'Fake Lag' & 'Fake Angles' chams to Visuals;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): add true fake angles to Anti-Aim;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): add color pickers instead of manual sliders;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): add adaptive menu resolution scaling;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): rework 'Auto Wallbang' from scratch;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): rework 'Projectile Prediction' from scratch;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): rework 'Entity Finder' and 'Plugin Loader' menus;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): rework menu base from scratch;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): fix questionable UI choices;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): fix key binds getting stuck, seemingly at random times;")
	print("- WORK-IN-PROGRESS (ETA: ~v7.1.b1): fix all unoptimized calls and functions.")
	print("\n\n===============================================================================================")
	timer.Create("ChatPrint", 0.1, 1, function() Popup(2.5, "Successfully printed changelog to console!", Color(0, 255, 0)) end)
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
	if IsValid(finder) then
		if ib.finderopened then return end
		ib.finderopened = true
		finder:SetVisible(!finder:IsVisible())
		ib.finderopen = finder:IsVisible()
		candoslider = false
		drawlast = nil
		ib.finderopened = nil
		return
	end
	finder = vgui.Create("DFrame")
	finder:SetSize(661, 359)
	finder:SetTitle("")
	finder:MakePopup()
	finder:ShowCloseButton(false)
	finder:SetDraggable(true)
	if !finder:IsVisible() then
		finder:SetVisible(finder:IsVisible())
	end
	local entlist = vgui.Create("DListView", finder)
	entlist:SetPos(17, 75)
	entlist:SetSize(250, 200)
	entlist:SetMultiSelect(false)
	entlist:AddColumn("Existing entities"):SetFixedWidth(250)
	local drawlist = vgui.Create("DListView", finder)
	drawlist:SetPos(395, 75)
	drawlist:SetSize(250, 200)
	drawlist:SetMultiSelect(false)
	drawlist:AddColumn("Drawn entities"):SetFixedWidth(250)
	function ib.RefreshEntities()
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
	refresh:SetPos(281, 215)
	refresh:SetSize(100, 30)
	refresh.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
	ib.RefreshEntities()
	end
	local add = vgui.Create("DButton", finder)
	add:SetText(">>")
	add:SetPos(281, 115)
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
		ib.RefreshEntities()
	end
	local remove = vgui.Create("DButton", finder)
	remove:SetText("<<")
	remove:SetPos(281, 165)
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
		ib.RefreshEntities()
	end
	local addcustom = vgui.Create("DTextEntry", finder)
	addcustom:SetPos(437, 290)
	addcustom:SetSize(140, 20)
	addcustom:SetText("")
	local addcustombutton = vgui.Create("DButton", finder)
	addcustombutton:SetText("Add")
	addcustombutton:SetPos(581, 290)
	addcustombutton:SetSize(60, 20)
	addcustombutton.DoClick = function()
	timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		local ent = addcustom:GetValue()
		if not table.HasValue(drawnents, ent) then 
			table.insert(drawnents, ent)
			drawlist:AddLine(ent)
		end
		ib.RefreshEntities()
	end
	local find = vgui.Create("DTextEntry", finder)
	find:SetPos(57, 290)
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
		draw.RoundedBox(15, 0, 0, w, h, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:")))
	end
	drawlist.Paint = function(self, w, h)
		draw.RoundedBox(15, 0, 0, w, h, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:")))
	end
	finder.Paint = function(self, w, h)
		if gOption("Main Menu", "Menus", "Menu Style:") == "Bordered" then -- Thank you for fixing my mess, Pinged
			draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 1, 1, w - 2, h - 2, Color(bordercol.r, bordercol.g, bordercol.b, 255))
		elseif gOption("Main Menu", "Menus", "Menu Style:") == "Borderless" then
			draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 1, 1, w - 2, h - 2, Color(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 255))
		end
		draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 2, 2, w - 4, h - 4, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, 255))
		DrawText(w, h, "Entity Finder Menu")
		draw.SimpleText("Search:", "MenuFont2", 17, 299, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:")), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText("Add:", "MenuFont2", 411, 299, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:")), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	finder.othink = finder.Think
	finder.Think = function()
		if finder:IsVisible() and global.unloaded == true then
			finder:Remove()
			menuopen = false
			candoslider = false
			drawlast = nil
		end
		if (input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and (not menukeydown or global.unloaded == true) then
			file.Write(folder.."/entities.txt", util.TableToJSON(drawnents))
		end
	finder:othink()
	end
	ib.RefreshEntities()
end

local function PluginLoader()
	if IsValid(plugin) then
		if ib.pluginopened then return end
		ib.pluginopened = true
		plugin:SetVisible(!plugin:IsVisible())
		ib.pluginopen = plugin:IsVisible()
		candoslider = false
		drawlast = nil
		ib.pluginopened = nil
		return
	end
	plugin = vgui.Create("DFrame")
	plugin:SetSize(396, 332)
	plugin:SetTitle("")
	plugin:MakePopup()
	plugin:ShowCloseButton(false)
	plugin:SetDraggable(true)
	if !plugin:IsVisible() then
		plugin:SetVisible(plugin:IsVisible())
	end
	local pluginlist = vgui.Create("DListView", plugin)
	pluginlist:SetPos(17, 75)
	pluginlist:SetSize(250, 200)
	pluginlist:SetMultiSelect(false)
	pluginlist:AddColumn("Available files ("..#file.Find("lua/*.lua","GAME", "nameasc")-1 ..")"):SetFixedWidth(250)
	local pluginload = vgui.Create("DButton", plugin)
	pluginload:SetText("Load")
	pluginload:SetPos(281, 115)
	pluginload:SetSize(100, 30)
	pluginload.DoClick = function()
		chat.PlaySound()
		if pluginlist:GetSelectedLine() ~= nil then
			surface.PlaySound("buttons/button14.wav")
			Popup(3, "Successfully initialized "..pluginlist:GetLine(pluginlist:GetSelectedLine()):GetValue(1).."!", Color(0, 255, 0))
			local d = vgui.Create('DHTML')
			d:SetAllowLua(true)
			return d:ConsoleMessage([[RUNLUA: ]]..file.Read("lua/"..pluginlist:GetLine(pluginlist:GetSelectedLine()):GetValue(1), "GAME"))
		end 
	end
	local pluginrefresh = vgui.Create("DButton", plugin )
	pluginrefresh:SetText("Refresh")
	pluginrefresh:SetPos(281, 165)
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
		draw.RoundedBox(15, 0, 0, w, h, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:")))
	end
	plugin.Paint = function(self, w, h)
		if gOption("Main Menu", "Menus", "Menu Style:") == "Bordered" then -- Thank you for fixing my mess, Pinged
			draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 1, 1, w - 2, h - 2, Color(bordercol.r, bordercol.g, bordercol.b, 255))
		elseif gOption("Main Menu", "Menus", "Menu Style:") == "Borderless" then
			draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 1, 1, w - 2, h - 2, Color(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 255))
		end
		draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 2, 2, w - 4, h - 4, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, 255))
		DrawText(w, h, "Plugin Loader Menu")
	end
	plugin.othink = plugin.Think
	plugin.Think = function()
		if plugin:IsVisible() and global.unloaded == true then
			plugin:Remove()
			menuopen = false
			candoslider = false
			drawlast = nil
		end
	plugin:othink()
	end
end

local function DrawButton(self, w, h, var, maxy, posx, posy, dist)
	local text = var[1]
	local size = var[4]
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.SetDrawColor(bgmenucol.r + 75, bgmenucol.g + 75, bgmenucol.b + 75, 55)
	surface.DrawRect(posx - 193 + dist + 2, 61 + posy + maxy + 2, size + 66, 14)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx - 193 + posx + dist, my + 61 + posy + maxy, mx - 193 + posx + dist + size + 69, my + 61 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy
	surface.SetFont("MenuFont")
	surface.SetTextColor(menutextcol.r - 65, menutextcol.g - 65, menutextcol.b - 50, gInt("Adjustments", "Others", "Text Opacity:"))
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
		elseif feat == "Apply Custom Name" then
			info = "Changes your in-game name to a custom one. Use the 'ib_changename' command, followed by your desired name."
		elseif feat == "Print Changelog" then
			info = "Prints the IdiotBox changelog in the console."
		elseif feat == "Unload Cheat" then
			info = "Unloads IdiotBox."
		elseif feat == "Reset All Game Sounds" then
			info = "Clears all sounds that are currently playing on your server."
		end
	end
	local tw, th = surface.GetTextSize(text)
	surface.SetTextPos(posx - 173 + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2)
	surface.DrawText(text)
	if bMouse and input.IsMouseDown(MOUSE_LEFT) and not drawlast and not mousedown or notyetselected == check then
		local selectedConfig = gOption("Main Menu", "Configurations", "Configuration:")
		local configIndex
		for index, config in ipairs(ib.configOptions) do
			if config == selectedConfig then
				configIndex = index
				break
			end
		end
		if text == "Unload Cheat" then
			self:Remove()
			Unload()
		elseif text == "Print Changelog" then
			ib.Changelog()
		elseif text == "Save Configuration" or text == "Load Configuration" or text == "Delete Configuration" then
			if configIndex then
				if text == "Save Configuration" then
					ib.SaveConfig(configIndex)
					timer.Create("ChatPrint", 0.1, 1, function() Popup(2.5, "Configuration saved!", Color(0, 255, 0)) end)
					timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
				elseif text == "Load Configuration" then
					ib.LoadConfig(configIndex)
					timer.Create("ChatPrint", 0.1, 1, function() Popup(2.5, "Configuration loaded!", Color(255, 255, 0)) end)
					timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
				elseif text == "Delete Configuration" then
					file.Delete(folder.."/config"..configIndex..".txt")
					timer.Create("ChatPrint", 0.1, 1, function() Popup(2.5, "Configuration deleted!", Color(255, 0, 0)) end)
					timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
				end
			end
		elseif text == "Apply Custom Name" then
			big.ChangeName(GetConVarString("ib_changename"))
			timer.Create("ChatPrint", 0.1, 1, function() Popup(3.2, "Successfully applied custom username!", Color(0, 255, 0)) end)
			timer.Create("PlaySound", 0.1, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
		elseif text == "Reset All Game Sounds" then
			RunConsoleCommand("stopsound")
		end
	end
end

local function DrawSubSub(self, w, h, k, var)
	if gOption("Main Menu", "Menus", "Options Style:") == "Bordered" then
	local opt, posx, posy, sizex, sizey, dist = var[1][1], var[1][2], var[1][3], var[1][4], var[1][5], var[1][6]
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
	local startpos = 61 + posy
	surface.SetTextColor(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.SetFont("MenuFont2")
	local tw, th = surface.GetTextSize(opt)
	surface.SetDrawColor(bgmenucol.r + 13, bgmenucol.g + 13, bgmenucol.b + 13, 255)
	surface.DrawRect(5 + posx, startpos, sizex, sizey);
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
	surface.DrawLine(5 + posx, startpos, 5 + posx + 15, startpos)
	surface.DrawLine(5 + posx, startpos + 1, 5 + posx + 15, startpos + 1)
	surface.SetTextPos(5 + posx + 15 + 5, startpos - th / 2)
	surface.DrawLine(5 + posx + 15 + 5 + tw + 5, startpos, 5 + posx + sizex, startpos)
	surface.DrawLine(5 + posx + 15 + 5 + tw + 5, startpos + 1, 5 + posx + sizex, startpos + 1)
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
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
				ib.DrawOldSlider(self, w, h, v, maxy, posx, posy, dist)
			elseif (v[2] == "Selection") then
				DrawDropdown(self, w, h, v, maxy, posx, posy, dist)
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
	surface.SetTextColor(bordercol.r, bordercol.g, bordercol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.SetFont("MenuFont2")
	local tw, th = surface.GetTextSize(opt)
	surface.SetDrawColor(bgmenucol.r + 13, bgmenucol.g + 13, bgmenucol.b + 13, 255)
	surface.DrawRect(5 + posx, startpos, sizex, sizey);
	surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
	surface.DrawLine(5 + posx, startpos, 5 + posx + 15, startpos)
	surface.DrawLine(5 + posx, startpos + 1, 5 + posx + 15, startpos + 1)
	surface.SetTextPos(5 + posx + 15 + 5, startpos - th / 2)
	surface.DrawLine(5 + posx + 15 + 5 + tw + 5, startpos, 5 + posx + sizex, startpos)
	surface.DrawLine(5 + posx + 15 + 5 + tw + 5, startpos + 1, 5 + posx + sizex, startpos + 1)
	surface.SetDrawColor(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 255)
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
				ib.DrawOldSlider(self, w, h, v, maxy, posx, posy, dist)
			elseif (v[2] == "Selection") then
				DrawDropdown(self, w, h, v, maxy, posx, posy, dist)
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
	if frame then
		if ib.menuopened then return end
		ib.menuopened = true
		frame:SetVisible(!frame:IsVisible())
		menuopen = frame:IsVisible()
		candoslider = false
		drawlast = nil
		ib.menuopened = nil
		return
	end
	frame = vgui.Create("DFrame")
	--[[ !!FUTURE UPDATE!!
	frame:SetSize(UIScale(1022), UIScale(1150))
	!!FUTURE UPDATE!! ]]--
	frame:SetSize(764, 859)
	frame:Center()
	frame:SetTitle("")
	frame:MakePopup()
	frame:ShowCloseButton(false)
	frame:SetDraggable(true)
	if !frame:IsVisible() then
		frame:SetVisible(frame:IsVisible())
	end
	frame.Paint = function(self, w, h)
		if (candoslider and not mousedown and not drawlast and not input.IsMouseDown(MOUSE_LEFT)) then
			candoslider = false
		end
		info = ""
		if gOption("Main Menu", "Menus", "Menu Style:") == "Bordered" then -- Thank you for fixing my mess, Pinged
			draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 1, 1, w - 2, h - 2, Color(bordercol.r, bordercol.g, bordercol.b, 255))
		elseif gOption("Main Menu", "Menus", "Menu Style:") == "Borderless" then
			draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 1, 1, w - 2, h - 2, Color(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 255))
		end
		draw.RoundedBox(gInt("Adjustments", "Others", "Roundness:"), 2, 2, w - 4, h - 4, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, 255))
		DrawText(w, h, "IdiotBox v7.1.b1")
		DrawTabs(self, w, h)
		DrawSub(self, w, h)
		if (drawlast) then
			drawlast()
			candoslider = true
		end
		mousedown = input.IsMouseDown(MOUSE_LEFT)
		if gBool("Main Menu", "Others", "Feature Tooltips") and info ~= "" then
			draw.SimpleText(info, "MenuFont2", w / 2, h / 1.03, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:")), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	frame.othink = frame.Think
	frame.Think = function()
		local menusongs = {"https://dl.dropbox.com/s/0fdgaj0ry8uummf/Rust_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/vsz77wdjqy1xf83/HOME%20-%20Resonance.mp3?dl=1", "https://dl.dropbox.com/s/0m22ytfia8qoy4m/Daisuke%20-%20El%20Huervo.mp3?dl=1", "https://dl.dropbox.com/s/ovh8xt0nn6wjgjj/The%20Caretaker%20-%20It%27s%20just%20a%20burning%20memory%20%282016%29.mp3?dl=1", "https://dl.dropbox.com/s/bqt4dcjoziezdjk/The_Caretaker_-_Libets_Delay_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/0uly6phlgpoj4ss/1932_George_Olsen_-_Lullaby_Of_The_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/qfl7mu39us5hzn4/Erectin_a_River_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/stkat6jlp4jhpxo/Monrroe_-_Fleeting_Love_%28getmp3.pro%29.mp3?dl=1","https://dl.dropbox.com/s/vhd3il20d8ephb4/DJ_Spizdil_-_malo_tebyaHardstyle_m_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/2vf1lx9cnd5g9pq/Maduk_-_Vermilion_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/wcoo6cov1iatcao/Metrik_-_Gravity_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/8a91zs6woqz9bb4/Scattle_Remorse_REUPLOAD_CHECK_DE_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/12ztoyw2rc2q0z0/HOME_-_Hold_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/xlk7wuel56bwrr3/T_Sugah_-_Green_Valleys_LAOS_%28getmp3.pro%29.mp3?dl=1", "https://dl.dropbox.com/s/8bg55iwowf2jtv8/cuckoid%20-%20ponyinajar.mp3?dl=1",}
		local function playRandomSong()
			RunConsoleCommand("stopsound")
			local randomSongURL = menusongs[math.random(#menusongs)]
			global.sound.PlayURL(randomSongURL, "mono", function(station)
				if global.IsValid(station) then
					station:Play()
				end
			end)
		end
	local musicPlayerOptions = {"Rust", "Resonance", "Daisuke", "A Burning M...", "Libet's Delay", "Lullaby Of T...", "Erectin' a River", "Fleeting Love", "Malo Tebya", "Vermilion", "Gravity", "Remorse", "Hold", "Green Valleys", "FP3"}
	if (input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and (not menukeydown or global.unloaded == true) then
	if gOption("Miscellaneous", "Sounds", "Music Player:") ~= "Off" then
		local selectedOption = gOption("Miscellaneous", "Sounds", "Music Player:")
			if selectedOption == "Random" then
				playRandomSong()
			elseif table.HasValue(musicPlayerOptions, selectedOption) then
				RunConsoleCommand("stopsound")
				local selectedOptionIndex = table.KeyFromValue(musicPlayerOptions, selectedOption)
				local selectedSongURL = menusongs[selectedOptionIndex]
				global.sound.PlayURL(selectedSongURL, "mono", function(station)
					if global.IsValid(station) then
						station:Play()
					end
				end)
			end
		end
		local selectedConfig = gOption("Main Menu", "Configurations", "Configuration:")
		local configIndex
		for index, config in ipairs(ib.configOptions) do
			if config == selectedConfig then
				configIndex = index
				break
			end
		end
		if gBool("Main Menu", "Configurations", "Automatically Save") then
			if configIndex then
				ib.SaveConfig(configIndex)
			end
		end
	end
	CacheColors()
	frame:othink()
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

function ib.FreeRoamCheck()
	if gBool("Miscellaneous", "Free Roaming", "Enabled") then
		if gKey("Miscellaneous", "Free Roaming", "Toggle Key:") and not ib.frpressed then
			ib.frpressed = true
			ib.frtoggle = not ib.frtoggle
		elseif not gKey("Miscellaneous", "Free Roaming", "Toggle Key:") and ib.frpressed then
			ib.frpressed = false
		end
		if ib.frtoggle then
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
			if (me:Alive() or em.Health(me) > 0) and not FixTools() then
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

local function RapidAltFire(cmd)
	if gOption("Aim Assist", "Miscellaneous", "Rapid Fire:") ~= "Off" and gOption("Aim Assist", "Miscellaneous", "Rapid Fire:") == "Alt Fire" then
		if pm.KeyDown(me, IN_ATTACK) then
			if (me:Alive() or em.Health(me) > 0) and not FixTools() then
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

local function GetAngle(ang)
	if not FixTools() then
		if not isangle(ang) then 
			return ang 
		end
		if not gBool("Aim Assist", "Miscellaneous", "Remove Weapon Recoil") then 
			return ang + pm.GetPunchAngle(me)
		else
			return ang
		end
	end
end

local function FixAngle(ang)
	if (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or (not me:Alive() or me:Health() < 1) or FixTools() then return end
	ang.p = math.Clamp(math.NormalizeAngle(ang.p), -89, 89)
	ang.x = math.NormalizeAngle(ang.x)
end

local function FakeAngles(cmd)
	if (!fa) then 
		fa = cm.GetViewAngles(cmd)
	end
    fa = fa + Angle(cm.GetMouseY(cmd) * .023, cm.GetMouseX(cmd) * - .023, 0)
    FixAngle(fa)
    if cm.CommandNumber(cmd) == 0 and not FixTools() then
		cm.SetViewAngles(cmd, GetAngle(fa))
		return
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

local function StatusTitle()
	if !gBool("Miscellaneous", "Panels", "Show List Titles") then return end
	if gOption("Miscellaneous", "Panels", "Panels Style:") == "Bordered" then
		surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
		surface.DrawRect(gInt("Adjustments", "List Adjustments", "Debug Info X:"), gInt("Adjustments", "List Adjustments", "Debug Info Y:") - 24, 90, 22)
		for i = 0, 1 do
			surface.DrawLine(gInt("Adjustments", "List Adjustments", "Debug Info X:"), gInt("Adjustments", "List Adjustments", "Debug Info Y:") - 87 + 62 + i, gInt("Adjustments", "List Adjustments", "Debug Info X:") + 90, gInt("Adjustments", "List Adjustments", "Debug Info Y:") - 87 + 62 + i)
		end
	elseif gOption("Miscellaneous", "Panels", "Panels Style:") == "Borderless" then
		surface.SetDrawColor(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 255)
		surface.DrawRect(gInt("Adjustments", "List Adjustments", "Debug Info X:"), gInt("Adjustments", "List Adjustments", "Debug Info Y:") - 24, 90, 22)
		for i = 0, 1 do
			surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
			surface.DrawLine(gInt("Adjustments", "List Adjustments", "Debug Info X:"), gInt("Adjustments", "List Adjustments", "Debug Info Y:") - 87 + 62 + i, gInt("Adjustments", "List Adjustments", "Debug Info X:") + 90, gInt("Adjustments", "List Adjustments", "Debug Info Y:") - 87 + 62 + i)
		end
	end
	surface.SetDrawColor(bgmenucol.r, bgmenucol.g, bgmenucol.b, 255)
	surface.DrawRect(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 1, gInt("Adjustments", "List Adjustments", "Debug Info Y:") - 23, 88, 20)
	draw.DrawText("Debug", "MiscFont2", gInt("Adjustments", "List Adjustments", "Debug Info X:") + 45, gInt("Adjustments", "List Adjustments", "Debug Info Y:") - 22, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:")), TEXT_ALIGN_CENTER)
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
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.SetTextColor(bordercol.r, bordercol.g - 24, bordercol.b - 130, gInt("Adjustments", "Others", "Text Opacity:"))
		surface.DrawText("Health: "..hp)
	if (em.IsValid(wep)) then
		local daclip = wep:Clip1()
		if daclip < 0 then
			daclip = 0
		end
		hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Ammo: "..daclip.."/"..me:GetAmmoCount(wep:GetPrimaryAmmoType()))
	else
		hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Ammo: ".."0".."/".."0")
	end
	hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Velocity: "..math.Round(velocity))
	hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Server: "..GetHostName())
	hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Gamemode: "..engine.ActiveGamemode())
	hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Map: "..game.GetMap())
	hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Looking at: "..EntityName())
	hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Entities: "..math.Round(ents.GetCount()))
	hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Frames: "..math.Round(1 / FrameTime()))
	hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Ping: "..me:Ping())
	hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
		surface.DrawText("Date: "..os.date("%d %b %Y"))
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Debug Info X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Debug Info Y:"))
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
	local color1 = Color(0, 0, 0, gInt("Adjustments", "Others", "Text Opacity:"))
	local color2 = Color(255, 0, 0, gInt("Adjustments", "Others", "Text Opacity:"))
	local color3 = Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	local color4 = Color(0, 131, 125, gInt("Adjustments", "Others", "Text Opacity:"))
	local hudspecslength = 150
	specscount = 0
	if gOption("Miscellaneous", "Panels", "Panels Style:") == "Bordered" then
		surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
		surface.DrawRect(gInt("Adjustments", "Window Adjustments", "Spectators X:") + 1, gInt("Adjustments", "Window Adjustments", "Spectators Y:") - 0.75, windowW + 2, windowH + 2)
		for i = 0, 1 do
			surface.DrawLine(gInt("Adjustments", "Window Adjustments", "Spectators X:") + 1, gInt("Adjustments", "Window Adjustments", "Spectators Y:") - 64 + 62 + i, gInt("Adjustments", "Window Adjustments", "Spectators X:") + 203, gInt("Adjustments", "Window Adjustments", "Spectators Y:") - 64 + 62 + i)
		end
	elseif gOption("Miscellaneous", "Panels", "Panels Style:") == "Borderless" then
		surface.SetDrawColor(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 255)
		surface.DrawRect(gInt("Adjustments", "Window Adjustments", "Spectators X:") + 1, gInt("Adjustments", "Window Adjustments", "Spectators Y:") - 0.75, windowW + 2, windowH + 2)
		for i = 0, 1 do
			surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
			surface.DrawLine(gInt("Adjustments", "Window Adjustments", "Spectators X:") + 1, gInt("Adjustments", "Window Adjustments", "Spectators Y:") - 64 + 62 + i, gInt("Adjustments", "Window Adjustments", "Spectators X:") + 203, gInt("Adjustments", "Window Adjustments", "Spectators Y:") - 64 + 62 + i)
		end
	end
	surface.SetDrawColor(bgmenucol.r, bgmenucol.g, bgmenucol.b, 255)
	surface.DrawRect(gInt("Adjustments", "Window Adjustments", "Spectators X:") + 2, gInt("Adjustments", "Window Adjustments", "Spectators Y:"), windowW, windowH)
	draw.SimpleText("Spectators", "MiscFont2", gInt("Adjustments", "Window Adjustments", "Spectators X:") + 102, gInt("Adjustments", "Window Adjustments", "Spectators Y:") + 11, color3, 1, 1)
	for k, v in pairs(player.GetAll()) do
		if (v:IsValid() and IsValid(v:GetObserverTarget())) and v:GetObserverTarget() == me then
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
	local col = Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
	local everything = ents.GetAll()
	local fa = me:EyeAngles()
	if gOption("Miscellaneous", "Panels", "Panels Style:") == "Bordered" then
		draw.RoundedBox(360, gInt("Adjustments", "Window Adjustments", "Radar X:") + 1, gInt("Adjustments", "Window Adjustments", "Radar Y:") - 0.75, windowW + 2, windowH + 2, Color(bordercol.r, bordercol.g, bordercol.b, 255))
	elseif gOption("Miscellaneous", "Panels", "Panels Style:") == "Borderless" then
		draw.RoundedBox(360, gInt("Adjustments", "Window Adjustments", "Radar X:") + 1, gInt("Adjustments", "Window Adjustments", "Radar Y:") - 0.75, windowW + 2, windowH + 2, Color(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 255))
	end
	draw.RoundedBox(360, gInt("Adjustments", "Window Adjustments", "Radar X:") + 2, gInt("Adjustments", "Window Adjustments", "Radar Y:"), windowW, windowH, Color(bgmenucol.r, bgmenucol.g, bgmenucol.b, 255))
	draw.SimpleText("Radar", "MiscFont2", gInt("Adjustments", "Window Adjustments", "Radar X:") + 102, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 11, col, 1, 1)
	draw.NoTexture()
	if gOption("Miscellaneous", "Panels", "Radar Lines Style:") == "Border Color" then
		surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255 - 75)
	elseif gOption("Miscellaneous", "Panels", "Radar Lines Style:") == "BG Color" then
		surface.SetDrawColor(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 255)
	end
	surface.DrawLine(gInt("Adjustments", "Window Adjustments", "Radar X:") + 209 * 0.5, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 24, gInt("Adjustments", "Window Adjustments", "Radar X:") + 209 * 0.5, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 190)
	surface.DrawLine(gInt("Adjustments", "Window Adjustments", "Radar X:") + 12, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 209 * 0.5, gInt("Adjustments", "Window Adjustments", "Radar X:") + 191, gInt("Adjustments", "Window Adjustments", "Radar Y:") + 209 * 0.5)
	surface.SetDrawColor(team.GetColor(me:Team()))
	for k = 1, #everything do
		local v = everything[k]
		if (v != me and v:IsPlayer() and v:Health() > 0 and not (em.IsDormant(v) and gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All") and not (v:Team() == TEAM_SPECTATOR and gBool("Visuals", "Miscellaneous", "Show Spectators")) and not ((gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID()))) or (v:IsNPC() and v:Health() > 0)) then
			color = (v:IsPlayer() and ((ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || pm.GetFriendStatus(v) == "friend" && Color(0, 155, 255) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v))) or Color(255, 255, 255)
			surface.SetDrawColor(color)
			local myPos = me:GetPos()
			local theirPos = v:GetPos()
			local theirX = (windowX + (windowW / 2)) + ((theirPos.x - myPos.x) / gInt("Miscellaneous", "Panels", "Radar Distance:"))
			local theirY = (windowY + (windowH / 2)) + ((myPos.y - theirPos.y) / gInt("Miscellaneous", "Panels", "Radar Distance:"))
			local myRotation = math.rad(fa.y - 90)
			theirX = theirX - (windowX + (windowW / 2))
			theirY = theirY - (windowY + (windowH / 2))
			local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
			local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
			newX = newX + (gInt("Adjustments", "Window Adjustments", "Radar X:") + 2 + (windowW / 2))
			newY = newY + (gInt("Adjustments", "Window Adjustments", "Radar Y:") + 2 + (windowH / 2))
			if newX < (gInt("Adjustments", "Window Adjustments", "Radar X:") + 2 + windowW) and newX > gInt("Adjustments", "Window Adjustments", "Radar X:") + 2 and newY < (gInt("Adjustments", "Window Adjustments", "Radar Y:") + windowH) and newY > gInt("Adjustments", "Window Adjustments", "Radar Y:") then
				Arrow(newX + 4, newY, v:EyeAngles().y - fa.y)
			end
		end
	end
	render.SetScissorRect(0, 0, 0, 0, false)
end

local function PlayersTitle()
	if !gBool("Miscellaneous", "Panels", "Show List Titles") then return end
	if gOption("Miscellaneous", "Panels", "Panels Style:") == "Bordered" then
		surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
		surface.DrawRect(gInt("Adjustments", "List Adjustments", "Players List X:"), gInt("Adjustments", "List Adjustments", "Players List Y:") - 24, 90, 22)
		for i = 0, 1 do
			surface.DrawLine(gInt("Adjustments", "List Adjustments", "Players List X:"), gInt("Adjustments", "List Adjustments", "Players List Y:") - 87 + 62 + i, gInt("Adjustments", "List Adjustments", "Players List X:") + 90, gInt("Adjustments", "List Adjustments", "Players List Y:") - 87 + 62 + i)
		end
	elseif gOption("Miscellaneous", "Panels", "Panels Style:") == "Borderless" then
		surface.SetDrawColor(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 255)
		surface.DrawRect(gInt("Adjustments", "List Adjustments", "Players List X:"), gInt("Adjustments", "List Adjustments", "Players List Y:") - 24, 90, 22)
		for i = 0, 1 do
			surface.SetDrawColor(bordercol.r, bordercol.g, bordercol.b, 255)
			surface.DrawLine(gInt("Adjustments", "List Adjustments", "Players List X:"), gInt("Adjustments", "List Adjustments", "Players List Y:") - 87 + 62 + i, gInt("Adjustments", "List Adjustments", "Players List X:") + 90, gInt("Adjustments", "List Adjustments", "Players List Y:") - 87 + 62 + i)
		end
	end
	surface.SetDrawColor(bgmenucol.r, bgmenucol.g, bgmenucol.b, 255)
	surface.DrawRect(gInt("Adjustments", "List Adjustments", "Players List X:") + 1, gInt("Adjustments", "List Adjustments", "Players List Y:") - 23, 88, 20)
	draw.DrawText("Players", "MiscFont2", gInt("Adjustments", "List Adjustments", "Players List X:") + 45, gInt("Adjustments", "List Adjustments", "Players List Y:") - 22, Color(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:")), TEXT_ALIGN_CENTER)
end

local function Players()
	local hh = - 10
	surface.SetFont("MiscFont")
	hh = hh + 12
	surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Players List X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Players List Y:"))
	surface.SetTextColor(bordercol.r, bordercol.g - 24, bordercol.b - 80, gInt("Adjustments", "Others", "Text Opacity:"))
	surface.DrawText("Players: "..player.GetCount().."/"..game.MaxPlayers())
	local NWString = em.GetNWString(v)
	for k, v in next, player.GetAll() do
		if not v:IsValid() then continue end
		surface.SetTextColor(bordercol.r, bordercol.g - 24, bordercol.b - 80, gInt("Adjustments", "Others", "Text Opacity:"))
		hh = hh + 12
		surface.SetTextPos(gInt("Adjustments", "List Adjustments", "Players List X:") + 3, hh + gInt("Adjustments", "List Adjustments", "Players List Y:"))
		surface.DrawText(""..em.GetNWString(v, "usergroup").."")
		surface.SetTextColor(menutextcol.r, menutextcol.g, menutextcol.b, gInt("Adjustments", "Others", "Text Opacity:"))
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
	local curcol2 = Color(bgmenucol.r + 55, bgmenucol.g + 55, bgmenucol.b + 55, 175)
	local curcol3 = Color(bordercol.r, bordercol.g, bordercol.b, 175)
	local curcol4 = Color(bordercol.r, bordercol.g, bordercol.b, 255)
	for i = 0, 1 do
		surface.SetDrawColor(curcol4)
		surface.DrawLine(pos_x - 1, pos_y - 64 + 62 + i, pos_x + 348, pos_y - 64 + 62 + i)
	end
	if gOption("Main Menu", "Menus", "Toolbar Style:") == "BG Color" then
		surface.SetDrawColor(curcol2)
		surface.DrawRect(pos_x, pos_y, 350, 15)
	elseif gOption("Main Menu", "Menus", "Toolbar Style:") == "Border Color" then
		surface.SetDrawColor(curcol3)
		surface.DrawRect(pos_x, pos_y, 350, 15)
	end
	surface.SetDrawColor(0, 0, 0)
	surface.DrawOutlinedRect(pos_x, pos_y, 350, 15)
	surface.DrawOutlinedRect(pos_x, pos_y, 30, 15)
	surface.DrawOutlinedRect(pos_x + 29, pos_y, 180, 15)
	draw.SimpleText("#", "MiscFont", pos_x + 5, pos_y, Color(menutextcol.r, menutextcol.g, menutextcol.b), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	draw.SimpleText("Username", "MiscFont", pos_x + 35, pos_y, Color(menutextcol.r, menutextcol.g, menutextcol.b), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	draw.SimpleText("Priority", "MiscFont", pos_x + 214, pos_y, Color(menutextcol.r, menutextcol.g, menutextcol.b), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
	for k, v in next, player.GetAll() do
		if not v:IsValid() or v == me then continue end
		if MouseInArea2(pos_x, pos_y + offset, pos_x + 350, pos_y + offset + 14) then
			if input.IsMouseDown(107) then
				if MouseInArea2(pos_x + 30, pos_y + offset, pos_x + 209, pos_y + offset + 14) and not v:IsBot() then
					gui.OpenURL("http://steamcommunity.com/profiles/"..v:SteamID64().."/")
				elseif MouseInArea2(pos_x + 209, pos_y + offset, pos_x + 350, pos_y + offset + 14) and not pressed then
					Prioritize(v)
					pressed = true
				end
			elseif input.IsMouseDown(108) then
				if MouseInArea2(pos_x + 30, pos_y + offset, pos_x + 209, pos_y + offset + 14) and not v:IsBot() then
					SetClipboardText("http://steamcommunity.com/profiles/"..v:SteamID64().."/")
				elseif MouseInArea2(pos_x + 209, pos_y + offset, pos_x + 350, pos_y + offset + 14) and not pressed then
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
		draw.SimpleText(number, "MiscFont", pos_x + 5, pos_y + offset, Color(menutextcol.r, menutextcol.g, menutextcol.b), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
		draw.SimpleText(v:Nick(), "MiscFont", pos_x + 35, pos_y + offset, Color(menutextcol.r, menutextcol.g, menutextcol.b), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
		draw.SimpleText(Priority(v), "MiscFont", pos_x + 214, pos_y + offset, Color(menutextcol.r, menutextcol.g, menutextcol.b), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
		offset = offset + 14 + gInt("Main Menu", "Priority List", "List Spacing:")
		number = number + 1
	end
end

local function Crosshair()
	if menuopen or (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 then return end
	if (gOption("Miscellaneous", "GUI Settings", "Crosshair:") == "Box") then
	local x1, y1 = ScrW() * 0.5, ScrH() * 0.5
		surface.SetDrawColor(0, 0, 0, gInt("Adjustments", "Crosshair Color", "Opacity:"))
		surface.DrawOutlinedRect(x1 - 3, y1 - 2, 6, 6)
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Others", "Text Opacity:"))
		surface.DrawRect(x1 - 2, y1 - 1, 4, 4)
	end
	if gOption("Miscellaneous", "GUI Settings", "Crosshair:") == "Dot" then
		local crosshairSize = 0.16
		local numCircles = 20
		local opacity = gInt("Adjustments", "Crosshair Color", "Opacity:")
		for i = 1, numCircles do
			local size = crosshairSize + i * 0.16
			local color = Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, opacity)
			local outlineColor = Color(0, 0, 0, opacity)
			if i > 18 then
				surface.DrawCircle(ScrW() / 2, ScrH() / 2, size, outlineColor)
			else
				surface.DrawCircle(ScrW() / 2, ScrH() / 2, size, color)
			end
		end
	end
	if (gOption("Miscellaneous", "GUI Settings", "Crosshair:") == "Square") then
	local x1, y1 = ScrW() * 0.5, ScrH() * 0.5
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:"))
		surface.DrawOutlinedRect(x1 - 3, y1 - 2, 6, 6)
	end
	if (gOption("Miscellaneous", "GUI Settings", "Crosshair:") == "Circle") then
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:")))
	end
	if (gOption("Miscellaneous", "GUI Settings", "Crosshair:") == "Cross") then
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:"))
		surface.DrawLine(ScrW() / 2 - 11, ScrH() / 2, ScrW() / 2 + 11, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 11, ScrW() / 2 - 0, ScrH() / 2 + 11)
	end
	if (gOption("Miscellaneous", "GUI Settings", "Crosshair:") == "Edged Cross") then
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:"))
		surface.DrawLine(ScrW() / 2 - 14.5, ScrH() / 2, ScrW() / 2 + 14.5, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 14.5, ScrW() / 2 - 0, ScrH() / 2 + 14.5)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawLine(ScrW() / 2 - 9, ScrH() / 2, ScrW() / 2 + 9, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 9, ScrW() / 2 - 0, ScrH() / 2 + 9)
	end
	if (gOption("Miscellaneous", "GUI Settings", "Crosshair:") == "Swastika") then
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:"))
		surface.DrawLine(ScrW() / 2, ScrH() / 2, ScrW() / 2 + 20, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 + 20, ScrH() / 2, ScrW() / 2 + 20, ScrH() / 2 + 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2, ScrW() / 2 - 20, ScrH() / 2)
		surface.DrawLine(ScrW() / 2 - 20, ScrH() / 2, ScrW() / 2 - 20, ScrH() / 2 - 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2, ScrW() / 2, ScrH() / 2 - 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2 - 20, ScrW() / 2 + 20, ScrH() / 2 - 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2, ScrW() / 2, ScrH() / 2 + 20)
		surface.DrawLine(ScrW() / 2, ScrH() / 2 + 20, ScrW() / 2 - 20, ScrH() / 2 + 20)
	end
	if (gOption("Miscellaneous", "GUI Settings", "Crosshair:") == "GTA IV") then
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 11, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:")))
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, 1.4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:")))
	end
end

hook.Add("RenderScene", "RenderScene", function(origin, angle, fov)
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
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	}
	render.RenderView(view)
	render.CopyTexture(nil, mat)
	cam.Start2D()
		hook.Run("MiscPaint")
	cam.End2D()
	render.SetRenderTarget(mat)
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
	if gBool("Miscellaneous", "GUI Settings", "Hide HUD") and hide[name] then
		return false
	end
	if gOption("Miscellaneous", "GUI Settings", "Crosshair:") ~= "Off" and crosshairhide[name] then
		return false
	end
end)

local function ChatSpam()
	local v = player.GetAll()[math.random(#player.GetAll())]
	local messagespam = {"GET FUCKED BY IDIOTBOX KIDDIE", "YOU SUCK SHIT LMAO", "STOP BEING SUCH A WORTHLESS CUMSTAIN AND GET IDIOTBOX NOW", "MONEY WASTER LOL", "YOU FUCKING FATASS, GET IDIOTBOX AND LOSE ALL THAT WEIGHT YOU INCEL", "ARE ALL THE GIRLS IGNORING YOU? GET IDIOTBOX AND YOU'LL BE FLOODED WITH PUSSY", "DO YOU FEEL WORTHLESS? WELL, YOU ARE LOL", "GET IDIOTBOX IF YOU WANT SOME OF THAT CLOUT", "STOP WASTING YOUR TIME ON SOUNDCLOUD BECAUSE YOU AIN'T GONNA GET NOWHERE WITH IT", "GET IDIOTBOX AND YOUR DICK WILL GROW 4 TIMES ITS SIZE", "LITTLE KID LMAO",}
	local insultspam = {" is shit at building", " is no older than 13", " looks like a 2 month old corpse", " really thinks gmod is a good game", " can't afford a better pc lmao", ", so how do you like your 40 fps?", " will definitely kill himself before his 30's ", " is a fucking virgin lmao", " is a script kiddie", " thinks his 12cm penis is big lmfao", ", how does it feel when you've never seen a naked woman in person?", ", what do you like not being able to do a single push-up?", ", tell me how it feels to be shorter than every girl you've met", " is a fatass who only spends his time in front of a monitor like an incel", "'s parents have a lower than average income", " lives under a bridge lmao", " vapes because is too afraid to smoke an actual ciggarette", ", your low self esteem really pays off you loser", ", make sure you tell me what unemployment feels like", " lives off of his parents' money", ", you're a dissapointment to your entire family, fatass", " has probably fried all of his dopamine receptors by masturbating this much",}
	local spamCategories = {
		["Clear Chat"] = {function() ChatClear.Run() end},
		["OOC Clear Chat"] = {function() ChatClear.OOC() end},
		["'H' Spam"] = {"HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"},
		["N-Word Spam"] = {"nigger"},
		["N-WORD SPAM"] = {"NIGGER"},
		["Nazi 1"] = {"Die Fahne hoch! Die Reihen fest geschlossen", "SA marschiert mit ruhig festem Schritt", "Kam'raden, die Rotfront und Reaktion erschossen", "Marschier'n im Geist in unser'n Reihen mit", "Die Straße frei den braunen Bataillonen", "Die Straße frei dem Sturmabteilungsmann", "Es schau'n aufs Hakenkreuz voll Hoffnung schon Millionen", "Der Tag für Freiheit und für Brot bricht an", "Zum letzten Mal wird Sturmalarm geblasen", "Zum Kampfe steh'n wir alle schon bereit", "Schon flattern Hitlerfahnen über allen Straßen", "Die Knechtschaft dauert nur noch kurze Zeit", "Die Fahne hoch! Die Reihen fest geschlossen", "SA marschiert mit ruhig festem Schritt", "Kam'raden, die Rotfront und Reaktion erschossen", "Marschier'n im Geist in unser'n Reihen mit"},
		["Nazi 2"] = {"SS marschiert in Feindesland", "Und singt ein Teufelslied", "Ein Schütze steht am Wolgastrand", "Und leise summt er mit", "Wir pfeifen auf Unten und Oben", "Und uns kann die ganze Welt", "Verfluchen oder auch loben", "Grad wie es jedem gefällt", "Wo wir sind da geht's immer vorwärts", "Und der Teufel, der lacht nur dazu", "Ha, ha, ha, ha, ha, ha", "Wir kämpfen für Deutschland", "Wir kämpfen für Hitler", "Der Rote kommt niemehr zur Ruh'", "Wir kämpften schon in mancher Schlacht", "In Nord, Süd, Ost und West", "Und stehen nun zum Kampf bereit", "Gegen die rote Pest", "SS wird nicht ruh'n, wir vernichten", "Bis niemand mehr stört Deutschlands Glück", "Und wenn sich die Reihen auch lichten", "Für uns gibt es nie ein Zurück", "Wo wir sind da geht's immer vorwärts", "Und der Teufel, der lacht nur dazu", "Ha, ha, ha, ha, ha, ha", "Wir kämpfen für Deutschland", "Wir kämpfen für Hitler", "Der Rote kommt niemehr zur Ruh'"},
		["Nazi 3"] = {"Ade, mein liebes Schätzelein", "Ade, ade, ade", "Es muß, es muß geschieden sein", "Ade, ade, ade", "Es geht um Deutschlands Gloria", "Gloria, Gloria", "Sieg Heil! Sieg Heil Viktoria!", "Sieg Heil, Viktoria!", "Visier und Ziel sind eingestellt", "Ade, ade, ade", "Auf Stalin, Churchill, Roosevelt", "Ade, ade, ade", "Es geht um Deutschlands Gloria", "Gloria, Gloria", "Sieg Heil! Sieg Heil Viktoria!", "Sieg Heil, Viktoria!", "Wir ruhen und wir rasten nicht", "Ade, ade, ade", "Bis daß die Satansbrut zerbricht", "Ade, ade, ade", "Es geht um Deutschlands Gloria", "Gloria, Gloria", "Sieg Heil! Sieg Heil Viktoria!", "Sieg Heil, Viktoria!", "Reich mir die Hand zum Scheidegruß", "Ade, ade, ade", "Und deinen Mund zum Abschiedskuß", "Ade, ade, ade", "Es geht um Deutschlands Gloria", "Gloria, Gloria", "Sieg Heil! Sieg Heil Viktoria!", "Sieg Heil, Viktoria!"},
		["Advertising 1"] = {"[IdiotBox] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[IdiotBox] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[IdiotBox] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[IdiotBox] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[IdiotBox] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[IdiotBox] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[IdiotBox] - Destroying everyone since '16.", "[IdiotBox] - Easy to use, free Garry's Mod cheat.", "[IdiotBox] - Now you can forget that negative KD's can be possible.", "[IdiotBox] - Beats all of your other cheats.", "[IdiotBox] - IdiotBox came back, and it came back with a vengeance.", "[IdiotBox] - Join the Discord server if you have a high IQ.", "[IdiotBox] - The only high-quality free cheat, out for Garry's Mod.", "[IdiotBox] - Best cheat, created by Phizz & more.", "[IdiotBox] - Always updated, never dead.", "[IdiotBox] - A highly reliable and optimised cheating software.", "[IdiotBox] - Top class, free cheat for Garry's Mod.", "[IdiotBox] - Makes noobs cry waves of tears since forever!", "[IdiotBox] - Say goodbye to the respawn room!", "[IdiotBox] - Download the highest quality Garry's Mod cheat for free now!", "[IdiotBox] - A reliable way to go!", "[IdiotBox] - Make Garry's Mod great again!", "[IdiotBox] - Visit our website for fresh Discord invite links!", "[IdiotBox] - Monthly bugfixes & updates. It never gets outdated!", "[IdiotBox] - Download IdiotBox v7.1.b1 right now!", "[IdiotBox] - Bug-free and fully customizable!", "[IdiotBox] - Join our Steam group and Discord server to stay up-to-date!", "[IdiotBox] - Refund all your cheats, use this better and free alternative!", "[IdiotBox] - Now with more features than ever!", "[IdiotBox] - The best Garry's Mod cheat, with 24/7 support, for free!", "[IdiotBox] - Bypasses most anti-cheats and screengrabbers!"},
		["Advertising 2"] = {"[www.IB4G.net] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[www.IB4G.net] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[www.IB4G.net] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[www.IB4G.net] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[www.IB4G.net] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[www.IB4G.net] - https://phizzofficial.wixsite.com/idiotbox4gmod/", "[www.IB4G.net] - WORST FRAMERATE, BEST FEATURES!", "[www.IB4G.net] - WHAT ARE YOU WAITING FOR?", "[www.IB4G.net] - BEST GARRY'S MOD CHEAT OUT RIGHT NOW!", "[www.IB4G.net] - SAY GOODBYE TO THE RESPAWN ROOM!", "[www.IB4G.net] - NO SKILL REQUIRED!", "[www.IB4G.net] - NEVER DIE AGAIN WITH THIS!", "[www.IB4G.net] - ONLY HIGH IQ NIGGAS' USE IDIOTBOX!", "[www.IB4G.net] - THE GAME IS NOT ACTUALLY DYING, I JUST LIKE TO ANNOY KIDS LOL!", "[www.IB4G.net] - DOWNLOAD THE CHEAT FOR FREE!", "[www.IB4G.net] - NOW WITH AUTOMATIC UPDATES!", "[www.IB4G.net] - GUARANTEED SWAG AND RESPECT ON EVERY SERVER!", "[www.IB4G.net] - IDIOTBOX COMING SOON TO TETIRS!", "[www.IB4G.net] - VISIT OUR WEBSITE FOR A FRESH INVITE LINK TO OUR DISCORD!", "[www.IB4G.net] - PHIZZ IS A GOD FOR MAKING THIS!", "[www.IB4G.net] - BECOME THE SERVER MVP IN NO TIME!", "[www.IB4G.net] - 100% NO SKILL REQUIRED!", "[www.IB4G.net] - BEST CHEAT, MADE BY THE CHINESE COMMUNIST PARTY!", "[www.IB4G.net] - MAKE IDIOTBOX GREAT AGAIN!", "[www.IB4G.net] - WHY ARE YOU NOT CHEATING IN A DYING GAME?", "[www.IB4G.net] - RUINING EVERYONE'S FUN SINCE 2016!", "[www.IB4G.net] - IT'S PASTED, BUT IT'S THE BEST PASTE YOU WILL EVER USE!", "[www.IB4G.net] - A VERY CLEAN, HIGH-QUALITY AND BUG-FREE PASTE!", "[www.IB4G.net] - ALWAYS UPDATED! NEVER GETS OUTDATED!", "[www.IB4G.net] - WITH A FUCK TON OF NEW FEATURES!", "[www.IB4G.net] - ONCE YOU GO BLACK, YOU NEVER GO BACK. GET IDIOTBOX NOW!", "[www.IB4G.net] - SACRIFICE A FEW FRAMES FOR THE BEST EXPERIENCE OF YOUR LIFE!", "[www.IB4G.net] - STEAM GROUP WAS TAKEN DOWN, BUT IT'S BACK BABY!", "[www.IB4G.net] - BEST GARRY'S MOD CHEAT, NO CAP!", "[www.IB4G.net] - WITH IDIOTBOX, YOU'LL NEVER GET BANNED FOR CHEATING AGAIN!", "[www.IB4G.net] - DISCORD SERVER WAS TAKEN DOWN MANY TIMES, BUT WE ALWAYS COME BACK!"},
		["Advertising 3"] = {"Get IdiotBox you fucking smelly niggers", "IdiotBox is the best fucking cheat and that is a fact", "All of you are fucking autistic for not having IdiotBox", "Why the fuck don't you get IdiotBox lol", "Stay being gay or get IdiotBox", "Your moms should know that you play grown-up games, join our Discord to prove you are not under-aged", "I have your IPs you dumb niggers, I will delete the IPs if you get IdiotBox", "You all fucking smell like shit for not using IdiotBox", "IdiotBox makes kiddos cry and piss their pants maybe and maybe shit and cum", "IdiotBox is the best free cheat in the history of the entire world so get it faggots", "Download IdiotBox at https://phizzofficial.wixsite.com/idiotbox4gmod/ or you're retarded", "Join our fucking Discord or else you are literally an unpriviledged niggers", "IdiotBox is a cheat for people with high IQ only, use IdiotBox to prove you're smart", "Don't wanna get fucking raped? Get IdiotBox and shit on them skids", "This is the best free paste around, no other paste is better than IdiotBox", "How the fuck are you not using IdiotBox in a shitty dying game lmfao", "IdiotBox is the best and most popular Garry's Mod cheat ever, why are you not using it lol", "May cause a bit of lag but it's worth it for the fuckton of features that it has", "You're all faggots if you don't cheat with IdiotBox", "You literally go to pride month parades if you don't use IdiotBox", "Idiotbox is the highest quality, most popular free cheat, just get it already", "Shit on all of the virgins that unironically play this game with this high-quality cheat", "Get good, get IdiotBox you fucking retards", "You're mad retarded if you are not using IdiotBox, no cap", "Own every single retard in HvH with this superior cheat now", "All of you are dumb niggers for not downloading IdiotBox and that is a fact", "You suck fat cocks in public bathrooms if you're not using IdiotBox", "Just get this god-like cheat already and rape all existing servers", "No you idiots, you can't get VAC banned for using lua scripts you absolute cretins", "IdiotBox bypasses even the most complex anti-cheats and screengrabbers, you're not getting banned anytime soon", "Just use IdiotBox to revert your sad lives and feel better about yourselves", "Phizz is a god because he made this god-like cheat called IdiotBox", "I am forced to put IdiotBox in almost every sentence and advertise in a toxic way because I'm a text in a lua script", "Why are you fucking gay? Get IdiotBox today", "The sentence above is a rhyme but the script says to put random sentences so I don't think you can see it, get IdiotBox btw", "Purchase IdiotBox now! Only for OH wait it's free", "It is highly recommended that you get IdiotBox in case of getting pwned", "You are swag and good looking, but only if you get IdiotBox", "Phizz spent so many fucking nights creating this masterpiece of a cheat so get it now or he will legit kill you", "Fuck you and get IdiotBox now lol", "IdiotBox is constantly getting updated with dope-ass features, it never gets outdated so just get it", "Have IdiotBox installed if you're mega straight and zero gay", "Whoever the fuck said lua cheats are bad deserves to die in a house fire", "You get IdiotBox, everyone else on the server gets pwned, ez as that", "Many cheats copied IdiotBox, but this is the original one, fucking copycats", "Join the fucking Discord, promise it won't hurt you faggots", "Download IdiotBox at https://phizzofficial.wixsite.com/idiotbox4gmod/ right this moment or I will hire a hitman to kill you", "Join the IdiotBox group at OH wait niggers got mad and mass-reported it, kys shitkids", "Nvm, Steam group is back lol get fucked you mad skid shitkids", "IdiotBox killed all of the paid cheats because it's too good", "Get IdiotBox, it's free and very good, you sacks of crying shit", "IdiotBox is the fucking G.O.A.T.", "What the fuck are you doing not using this god-like cheat lol", "This is an epic fucking cheat called IdiotBox that was created by Phizz and others, worship your new gods kiddos", "You were fed cock milk as a baby if you're not using IdiotBox and you can not prove me wrong", "IdiotBox has the dopest anti-aims and resolvers you'll ever use, you will be a HvH god", "Just please get IdiotBox already you retards, I am tired of typing these lines for fuck's sake", "Phizz will give everyone optimized IdiotBox soon so quit your shit", "IdiotBox needs no Steam group, we're too chad for one", "Our Discord was tapped at some point but IdiotBox is back and stronger than ever", "IdiotBox came back to kill silly niggers, and it came back with a vengeance", "Download Idiotbox v7.1.b1 now, you dont even know what you're missing you mongoloids", "Have I told you about IdiotBox, the best Garry's Mod cheat ever made??", "Holy shit, IdiotBox for Garry's Mod is the best cheat that I have ever used!!"},
		["Hebrew Spam"] = {"לזיין את הכלב שלך אמא לעזאזל חרא סקס בכוס", "לעזאזל כוס כלבה בזין אני אוהבת עורלה הדוקה חתכה לי שלום כומר", "זו לא בדיחה מזוינת אני רוצה לתלות את עצמי השנה", "תזדיין שאתה יהודי הוא הגדול ביותר שכולכם כושים", "אני אהיה בן שש בשנה מכושן", "יש למול את הפין", "ישראל היא פלסטין המזוין הגדול ביותר במדינה", "זקן ישבן גדול על סנטרי, זהב בביתי, פוליטיקה במכנסיים שלי", "מזדיין לצאת מכושים ישראלים", "כוס חתולה אני מזיין את הזין ואז אני מוצץ כן", "חרא של אלוהים זה חרא של רחוב כן", "אני הולך לזיין ילד בן שתים עשרה בתחת, כן חתוך עורלה לעזאזל חרא כלבה"},
		["Arabic Spam"] = {"يمارس الجنس مع السلطة العربية سنة عظيمة", "رائحة مثل البظر دون السن القانونية هنا اسمحوا لي أن اللعنة", "ازدهار مسحوق الطاقة العربية سنة جيدة", "نحن نكره اليهو", "يمارس الجنس مع الأطفال الماعز نعم الجنس", "الله أكبر نعم رجل تفجير طفل", "هذه لحظة بره لحظة ارهابية سنة", "في تلك اللحظة التي يبدأ فيها أخاك في المغازلة مع والدتك", "الحصول على صندوق احمق نعم العربية غش كازاخستان", "يمارس الجنس مع نيغا الكلبة دا قرن الطفل", "ترك العرب باكستاني لحظة برمة تجميع كرمة", "حرق اليهود ، يمارس الجنس مع المسيح ، قتل الأطفال ، أصبح الله"},
		["Offensive Spam"] = {"fuck niggers like fr", "who else here hates black people lmao", "all niggers should be locked in cages and fed bananas", "black people are some sub-human slaves imo", "i've never met an intelligent black person", "why tf are all niggers so ugly lol", "all the black dudes i've seen look like monkeys", "ooga booga black rights", "my grandpa died in ww2, he was the best german pilot", "white people are genetically superior to every othe race", "all jews can do is hide the truth, steal money and start wars"},
		["Insult Spam"] = {function()
			local friendstatus = pm.GetFriendStatus(v)
			if (!v:IsValid() or v == me or (friendstatus == "friend") or (gBool("Main Menu", "Priority List", "Enabled") and table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Miscellaneous", "Chat", "Priority Targets Only") and not table.HasValue(prioritylist, v:UniqueID()))) then return end
			RunConsoleCommand("say", v:Name()..insultspam[math.random(#insultspam)])
		end},
		["Message Spam"] = {function()
			if (gBool("Main Menu", "Priority List", "Enabled") and table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Miscellaneous", "Chat", "Priority Targets Only") and not table.HasValue(prioritylist, v:UniqueID())) then return end
			if v ~= me and v:GetFriendStatus() ~= "friend" and not pm.IsAdmin(v) then
				me:ConCommand("ulx psay \""..v:Nick().."\" "..messagespam[math.random(#messagespam)])
			end
		end},
	}
	local selectedSpamType = gOption("Miscellaneous", "Chat", "Chat Spam:")
	local selectedSpam = spamCategories[selectedSpamType]
	if selectedSpam then
		if type(selectedSpam[1]) == "function" then
			selectedSpam[1]()
		else
			RunConsoleCommand("say", selectedSpam[math.random(#selectedSpam)])
		end
	end
end

local function EmoteSpam()
	local emotes = {"dance", "muscle", "wave", "robot", "bow", "cheer", "laugh", "zombie", "agree", "disagree", "forward", "becon", "salute", "pers", "halt", "group",}
	local selected = gOption("Miscellaneous", "Miscellaneous", "Emotes:")
	if selected == "Random" then
		RunConsoleCommand("act", emotes[math.random(#emotes)])
	elseif table.HasValue(emotes, selected) then
		RunConsoleCommand("act", selected)
	end
end

local function WallhackFilter(v)
	if (gBool("Visuals", "Miscellaneous", "Distance Limit")) then
		local dist = gInt("Visuals", "Miscellaneous", "Distance:")
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
	local col = (ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetChamsColor(v)
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
				render.MaterialOverride(ib.chamsmat1)
				render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
			em.DrawModel(wep)
				render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
				render.MaterialOverride(ib.chamsmat2)
			em.DrawModel(wep)
				render.SetColorModulation(1, 1, 1)
			cam.End3D()
		end
		cam.Start3D()
			render.MaterialOverride(ib.chamsmat1)
			render.SetColorModulation(col.b / 255, col.r / 255, col.g / 255)
		em.DrawModel(v)
			render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
			render.MaterialOverride(ib.chamsmat2)
		em.DrawModel(v)
			render.SetColorModulation(1, 1, 1)
		cam.End3D()
	end
	if gOption("Visuals", "Wallhack", "Chams:") == "Flat" then
		if wep:IsValid() then
			cam.Start3D()
				render.MaterialOverride(ib.chamsmat3)
				render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
			em.DrawModel(wep)
				render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
				render.MaterialOverride(ib.chamsmat4)
			em.DrawModel(wep)
				render.SetColorModulation(1, 1, 1)
			cam.End3D()
		end
		cam.Start3D()
			render.MaterialOverride(ib.chamsmat3)
			render.SetColorModulation(col.b / 255, col.r / 255, col.g / 255)
		em.DrawModel(v)
			render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
			render.MaterialOverride(ib.chamsmat4)
		em.DrawModel(v)
			render.SetColorModulation(1, 1, 1)
		cam.End3D()
	end
	if gOption("Visuals", "Wallhack", "Chams:") == "Wireframe" then
		if wep:IsValid() then
			cam.Start3D()
				render.MaterialOverride(ib.chamsmat5)
				render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
			em.DrawModel(wep)
				render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
				render.MaterialOverride(ib.chamsmat6)
			em.DrawModel(wep)
				render.SetColorModulation(1, 1, 1)
			cam.End3D()
		end
		cam.Start3D()
			render.MaterialOverride(ib.chamsmat5)
			render.SetColorModulation(col.b / 255, col.r / 255, col.g / 255)
		em.DrawModel(v)
			render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
			render.MaterialOverride(ib.chamsmat6)
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
			render.MaterialOverride(ib.chamsmat1)
			render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
		em.DrawModel(v)
			render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
			render.MaterialOverride(ib.chamsmat2)
		em.DrawModel(v)
			render.SetColorModulation(1, 1, 1)
		cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "Entity Chams:") == "Flat" then
		cam.Start3D()
			render.MaterialOverride(ib.chamsmat3)
			render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
		em.DrawModel(v)
			render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
			render.MaterialOverride(ib.chamsmat4)
		em.DrawModel(v)
			render.SetColorModulation(1, 1, 1)
		cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "Entity Chams:") == "Wireframe" then
		cam.Start3D()
			render.MaterialOverride(ib.chamsmat5)
			render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
		em.DrawModel(v)
			render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
			render.MaterialOverride(ib.chamsmat6)
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
			render.MaterialOverride(ib.chamsmat1)
			render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
		em.DrawModel(v)
			render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
			render.MaterialOverride(ib.chamsmat2)
		em.DrawModel(v)
			render.SetColorModulation(1, 1, 1)
		cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "NPC Chams:") == "Flat" then
		cam.Start3D()
			render.MaterialOverride(ib.chamsmat3)
			render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
		em.DrawModel(v)
			render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
			render.MaterialOverride(ib.chamsmat4)
		em.DrawModel(v)
			render.SetColorModulation(1, 1, 1)
		cam.End3D()
	end
	if gOption("Visuals", "Miscellaneous", "NPC Chams:") == "Wireframe" then
		cam.Start3D()
			render.MaterialOverride(ib.chamsmat5)
			render.SetColorModulation(miscvisualscol.b / 255, miscvisualscol.r / 255, miscvisualscol.g / 255)
		em.DrawModel(v)
			render.SetColorModulation(miscvisualscol.r / 255, miscvisualscol.g / 255, miscvisualscol.b / 255)
			render.MaterialOverride(ib.chamsmat6)
		em.DrawModel(v)
			render.SetColorModulation(1, 1, 1)
		cam.End3D()
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
	elseif cmd:KeyDown(IN_JUMP) and gBool("Miscellaneous", "Movement", "Rage Mode") then
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
        local viewangles = Angle(fa.x, fa.y, fa.z)
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
		local normalized_x = math.modf(fa.x + 180, 360) - 180
        local normalized_y = math.modf(fa.y + 180, 360) - 180
        local yaw = math.rad(normalized_y - viewangles.y + angles_move.y)
        if (normalized_x >= 90 || normalized_x <= - 90 || fa.x >= 90 && fa.x <= 200 || fa.x <= - 90 && fa.x <= 200) then
            cmd:SetForwardMove( - math.cos(yaw) * speed)
        else
            cmd:SetForwardMove(math.cos(yaw) * speed)
        end
		cmd:SetSideMove(math.sin(yaw) * speed)
	elseif cmd:KeyDown(IN_JUMP) and gBool("Miscellaneous", "Movement", "Rage Mode") then
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
		endpos = pos - global.Vector(0, 0, 50), 
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
	for k, v in global.ipairs(global.ents.GetAll()) do
		local _v = v:GetOwner()
		if not _v:IsValid() or _v == me then continue end
		if (global.GetRoundState() == 3 and v:IsWeapon() and _v:IsPlayer() and not _v.Detected and global.table.HasValue(v.CanBuy, 1)) then
			if (_v:GetRole() ~= 2) then
				_v.Detected = true
				Popup(4.3, _v:Nick().." is a Traitor. They just bought: "..v:GetPrintName(), Color(255, 255, 0))
				surface.PlaySound("npc/scanner/combat_scan1.wav")
			end
		elseif (global.GetRoundState() ~= 3) then
				v.Detected = false
			end
		end
	end
end

local function MurdererDetector()
	if not gBool("Main Menu", "Murder Utilities", "Murderer Finder") or engine.ActiveGamemode() ~= "murder" then return end
	for k, v in global.ipairs(global.player.GetAll()) do
		if not v:IsValid() or v == me then continue end
		if (GAMEMODE.RoundStage == 1 and not v.Detected and not v.Magnum) then
			if (v:HasWeapon("weapon_mu_knife")) then
				v.Detected = true
				Popup(4.3, (v:Nick().." ("..v:GetNWString("bystanderName")..") is the murderer."), Color(255, 255, 0))
				surface.PlaySound("buttons/lightswitch2.wav")
			end
			if (v:HasWeapon("weapon_mu_magnum")) then
				v.Magnum = true
				timer.Create("ChatPrint", 4.8, 1, function() Popup (4.3, (v:Nick().." ("..v:GetNWString("bystanderName")..") has a Magnum."), Color(255, 255, 0)) end)
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

ib.ddance = {} -- Credits to s0lum for this thingy right here

ib.ddance.setviewangles = FindMetaTable('CUserCmd').SetViewAngles
ib.ddance.clearbuttons = FindMetaTable('CUserCmd').ClearButtons
ib.ddance.clearmovement = FindMetaTable('CUserCmd').ClearMovement

FindMetaTable('CUserCmd').SetViewAngles = function(UserCmd, ang)

local src = string.lower(debug.getinfo(2).short_src)
	if string.find(src, 'taunt_camera') then return
		else return ib.ddance.setviewangles(UserCmd, ang)
	end
end

FindMetaTable('CUserCmd').ClearButtons = function( UserCmd )

local src = string.lower( debug.getinfo(2).short_src )
	if string.find(src, 'taunt_camera') then return
		else return ib.ddance.clearbuttons(UserCmd)
	end
end

FindMetaTable('CUserCmd').ClearMovement = function(UserCmd)

local src = string.lower(debug.getinfo(2).short_src)
	if string.find(src, 'taunt_camera') then return
		else return ib.ddance.clearmovement(UserCmd)
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
        im.SetFloat(material, "$alpha", gInt("Miscellaneous", "Textures", "Transparency:") / 100 + 0.01)
    end
end

function ib.NameStealer()
	local randomname = {"Mike Hawk", "Moe Lester", "Mike Hunt", "Ben Dover", "Harold Kundt", "Peter Pain", "Dusan Mandic", "Harry Gooch", "Mike Oxlong", "Ivana Dooyu", "Slim Shader", "Dead Walker", "Mike Oxbig", "Mike Rotch", "Hugh Jass", "Robin Banks", "Mike Litt", "Harry Wang", "Harry Cox", "Moss Cular", "Amanda Reen", "Major Kumm", "Willie Wang", "Hugh Blackstuff", "Mike Rap", "Al Coholic", "Cole Kutz", "Mike Litoris", "Dixie Normous", "Dick Pound", "Mike Ock", "Sum Ting Wong", "Ho Lee Fuk", "Harry Azcrac", "Jay L. Bate", "Hugh G. Rection", "Long Wang", "Wayne King",}
		if gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "Normal" or gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "Priority Targets" then
		local randply = player.GetAll()[math.random(#player.GetAll())]
		local friendstatus = pm.GetFriendStatus(randply)
		if (!randply:IsValid() || randply == me || friendstatus == "friend" || (gBool("Main Menu", "Priority List", "Enabled") && table.HasValue(ignorelist, randply:UniqueID())) || (gBool("Main Menu", "Priority List", "Enabled") && gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "Priority Targets" && !table.HasValue(prioritylist, randply:UniqueID()))) then return end
			big.ChangeName(randply:Name().." ")
		elseif gOption("Miscellaneous", "Miscellaneous", "Name Stealer:") == "DarkRP Name" then
			namechangetime = namechangetime + 1
		if namechangetime > 500 then
			RunConsoleCommand("say", "/name "..randomname[math.random(#randomname)])
			namechangetime = 0
		end
	end
end

local function Tick()
	TransparentWalls()
	ib.NameStealer()
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
		RunConsoleCommand("ib_usespam")
	end
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
	if gBool("Aim Assist", "Miscellaneous", "Disable Interpolation") then
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
	local skycvar = GetConVar("r_3dsky")
	if (gBool("Miscellaneous", "Textures", "Remove 3D Skybox") and skycvar:GetBool() == true) then
        RunConsoleCommand("r_3dsky", "0")
    elseif (!gBool("Miscellaneous", "Textures", "Remove 3D Skybox") and skycvar:GetBool() == false) then
        RunConsoleCommand("r_3dsky", "1")
    end
	if (gBool("Miscellaneous", "GUI Settings", "Advanced Network Graph") and GetConVar("net_graph"):GetString() ~= "4") then
        RunConsoleCommand("net_graph", "4")
    elseif (!gBool("Miscellaneous", "GUI Settings", "Advanced Network Graph") and GetConVar("net_graph"):GetString() == "4") then
        RunConsoleCommand("net_graph", "0")
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
				Popup(4.3, "Successfully removed \""..pan:GetTitle().."\"!", Color(0, 255, 0))
				surface.PlaySound("buttons/lightswitch2.wav")
			end
			pan:Remove()
			return
		end
		for k, v in pairs(pan:GetChildren()) do
			if input.IsKeyDown(17) then
				if v.GetTitle then
					Popup(4.3, "Successfully removed \""..v:GetTitle().."\"!", Color(0, 255, 0))
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

hook.Add("Tick", "Tick", function()
	Tick()
	if (input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME)) and not menukeydown then
        menuopen = true
        Menu()
		EntityFinder()
		PluginLoader()
    end
	--[[if gBool("Main Menu", "Menus", "Entity Finder Menu") and menuopen and not menukeydown then
		EntityFinder()
	end
	if gBool("Main Menu", "Menus", "Plugin Loader Menu") and menuopen and not menukeydown then
		PluginLoader()
	end]]--
    menukeydown = (input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_F11) or input.IsKeyDown(KEY_HOME))
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
			elseif gOption("Miscellaneous", "Miscellaneous", "Murder Taunts:") == "Help" then
				RunConsoleCommand("mu_taunt", "help")
			elseif gOption("Miscellaneous", "Miscellaneous", "Murder Taunts:") == "Scream" then
				RunConsoleCommand("mu_taunt", "scream")
			elseif gOption("Miscellaneous", "Miscellaneous", "Murder Taunts:") == "Morose" then
				RunConsoleCommand("mu_taunt", "morose")
			elseif gOption("Miscellaneous", "Miscellaneous", "Murder Taunts:") == "Random" then
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
			Popup(4.3, "Successfully blocked a blinding attempt!", Color(0, 255, 0))
			surface.PlaySound("buttons/lightswitch2.wav")
			hook.Remove("HUDPaint", "ulx_blind")
        end
    end
	if MOTDgd or MOTDGD then
		function MOTDgd.GetIfSkip()
		if (gBool("Main Menu", "General Utilities", "Anti-Ads")) then
			Popup(4.3, "Successfully blocked an advertisement!", Color(0, 255, 0))
			surface.PlaySound("buttons/lightswitch2.wav")
			return true
			end
		end
	end
end)

hook.Add("Think", "Think", function()
	TraitorDetector()
	MurdererDetector()
	if engine.ActiveGamemode() == "terrortown" then
		if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Traitor Finder") then
			if GetRoundState() == ROUND_ACTIVE then
				for k, v in next, ents.GetAll() do
					if not v:IsValid() or v:IsWeapon() then continue end
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
	end
end)

hook.Add("CalcViewModelView", "CalcViewModelView", function(wep, vm, oldPos, oldAng, pos, ang)
	if gBool("Visuals", "Point of View", "Custom Positions") then
		local overridepos = Vector(gInt("Visuals", "Point of View", "Viewmodel X:") - 50, gInt("Visuals", "Point of View", "Viewmodel Y:") - 30, gInt("Visuals", "Point of View", "Viewmodel Z:") - 20)
		local overrideang = Angle(gInt("Visuals", "Point of View", "Viewmodel Pitch:") - 90, gInt("Visuals", "Point of View", "Viewmodel Yaw:") - 90, gInt("Visuals", "Point of View", "Viewmodel Roll:") - 90)
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
	if (!gBool("Miscellaneous", "Textures", "Remove Sky")) then return end
		render.Clear(0, 0, 0, 255)
	return true
end)

function ib.ViewmodelChams()
	if ThirdpersonCheck() then return end
	local rainbow = HSVToColor(RealTime() * 45 % 360, 1, 1)
	if (gOption("Visuals", "Point of View", "Viewmodel Chams:") == "Normal") then
		render.MaterialOverride(ib.chamsmat2)
		render.SetColorModulation(viewmodelcol.r / 255, viewmodelcol.g / 255, viewmodelcol.b / 255)
	end
	if (gOption("Visuals", "Point of View", "Viewmodel Chams:") == "Normal") and gBool("Visuals", "Point of View", "Rainbow Mode") then
		render.MaterialOverride(ib.chamsmat2)
		render.SetColorModulation(rainbow.r / 255, rainbow.g / 255, rainbow.b / 255)
	end
	if (gOption("Visuals", "Point of View", "Viewmodel Chams:") == "Flat") then
		render.MaterialOverride(ib.chamsmat4)
		render.SetColorModulation(viewmodelcol.r / 255, viewmodelcol.g / 255, viewmodelcol.b / 255)
	end
	if (gOption("Visuals", "Point of View", "Viewmodel Chams:") == "Flat") and gBool("Visuals", "Point of View", "Rainbow Mode") then
		render.MaterialOverride(ib.chamsmat4)
		render.SetColorModulation(rainbow.r / 255, rainbow.g / 255, rainbow.b / 255)
	end
	if (gOption("Visuals", "Point of View", "Viewmodel Chams:") == "Wireframe") then
		render.MaterialOverride(ib.chamsmat6)
		render.SetColorModulation(viewmodelcol.r / 255, viewmodelcol.g / 255, viewmodelcol.b / 255)
	end
	if (gOption("Visuals", "Point of View", "Viewmodel Chams:") == "Wireframe") and gBool("Visuals", "Point of View", "Rainbow Mode") then
		render.MaterialOverride(ib.chamsmat6)
		render.SetColorModulation(rainbow.r / 255, rainbow.g / 255, rainbow.b / 255)
	end
end

hook.Add("PreDrawViewModel", "PreDrawViewModel", function()
	ib.ViewmodelChams()
	if (gBool("Visuals", "Point of View", "No Viewmodel") or ThirdpersonCheck()) then
		return true
	else
		return false
	end
end)

hook.Add("PreDrawPlayerHands", "PreDrawPlayerHands", function()
	ib.ViewmodelChams()
	if (gBool("Visuals", "Point of View", "No Hands") or ThirdpersonCheck()) then
		return true
	else
		return false
	end
end)

local function AutoReload(cmd)
	local wep = me:GetActiveWeapon()
	if not gBool("Aim Assist", "Miscellaneous", "Auto Reload") then return end
	if (me:Alive() or me:Health() > 0) and global.IsValid(wep) then
		if (wep:Clip1() <= (wep:GetMaxClip1() - 1) and wep:GetMaxClip1() > 0 and global.CurTime() > wep:GetNextPrimaryFire()) then
			cmd:SetButtons(cmd:GetButtons() + IN_RELOAD)
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

local function Visuals(v)
	local colOne = (ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) && Color(0, 0, 0) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local colTwo = (ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || Color(0, 0, 0)
	local colThree = (ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local colFour = (ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b)
	local colFive = gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b)
	local healthcol = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0)
	local armorcol = Color((100 - v:Armor()) * 2.55, v:Armor() * 2.55, v:Armor() * 2.55)
	local pingcol = Color(v:Ping() * 2.55, 255 - v:Ping() - 5 * 2, 0)
	local moneycol = Color(0, 255, 0)
	local textcol = !gBool("Visuals", "Miscellaneous", "Adaptive Text Color") && Color(255, 255, 255) || (ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) && HSVToColor(RealTime() * 45 % 360, 1, 1) || (gBool("Visuals", "Miscellaneous", "Target Priority Colors") and ((table.HasValue(ignorelist, v:UniqueID()) && Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)) or (table.HasValue(prioritylist, v:UniqueID()) && Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)))) || gBool("Visuals", "Miscellaneous", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v)
	local friendcol = Color(0, 155, 255)
	local devcol = HSVToColor(RealTime() * 45 % 360, 1, 1)
	local ignoredcol = Color(ignoredtargetscol.r, ignoredtargetscol.g, ignoredtargetscol.b)
	local prioritycol = Color(prioritytargetscol.r, prioritytargetscol.g, prioritytargetscol.b)
	local misccol = Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b)
	if (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID())) then return false end
	if (gBool("Visuals", "Wallhack", "Vision Line")) then
		local b1, b2 = v:EyePos(), v:GetEyeTrace().HitPos
			cam.Start3D()
				render.DrawLine(b1, b2, colFour)
				render.DrawWireframeSphere(b2, 2, 10, 10, colFour, b2)
			cam.End3D()	
		end
		if not OnScreen(v) then return false end -- I just thought it would make more sense for the function above to work, even if the player is off the screen
		if gOption("Visuals", "Wallhack", "Position Lines:") ~= "Off" then
			local pos = v:LocalToWorld(v:OBBCenter()):ToScreen()
				surface.SetDrawColor(colThree)
				if gOption("Visuals", "Wallhack", "Position Lines:") == "Bottom" then
					surface.DrawLine(ScrW() / 2, ScrH(), pos.x, pos.y)
				elseif gOption("Visuals", "Wallhack", "Position Lines:") == "Top" then
					surface.DrawLine(ScrW() / 2, 0, pos.x, pos.y)
				else
					surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y)
				end
			end
			if gOption("Visuals", "Wallhack", "Style:") == "Optimized" then
				local x1, y1, x2, y2 = ScrW() * 2, ScrH() * 2, - ScrW(), - ScrH()
				local min, max = em.GetCollisionBounds(v)
				local corners = {v:LocalToWorld(Vector(min.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, min.y, max.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, max.z)):ToScreen()}
				for k, v in next, corners do
					x1, y1 = math.min(x1, v.x), math.min(y1, v.y)
					x2, y2 = math.max(x2, v.x), math.max(y2, v.y)
				end
				local diff, diff2 = math.abs(x2 - x1), math.abs(y2 - y1)
				local textpos = 5
				local textpos2 = 5
				if gOption("Visuals", "Wallhack", "Box:") == "2D Box" then
					surface.SetDrawColor(colOne)
					surface.DrawOutlinedRect(x1, y1, diff, diff2)
					surface.SetDrawColor(colTwo)
					surface.DrawOutlinedRect(x1 - 1, y1 - 1, diff + 2, diff2 + 2)
					surface.DrawOutlinedRect(x1 + 1, y1 + 1, diff - 2, diff2 - 2)
				elseif gOption("Visuals", "Wallhack", "Box:") == "3D Box" then
					if (!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (v:Team() == TEAM_SPECTATOR and gBool("Visuals", "Miscellaneous", "Show Spectators")) or ((gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID()))) then return end
					if v:IsValid() and v:Alive() and v:Health() > 0 then
						local eye = v:EyeAngles()
						local origin = v:GetPos()
						local min, max = v:WorldSpaceAABB()
						if gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(ignorelist, v:UniqueID()) and !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, ignoredcol)
							cam.End3D()
						elseif gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(prioritylist, v:UniqueID()) and !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, prioritycol)
							cam.End3D()
						elseif gBool("Visuals", "Miscellaneous", "Team Colors") and !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, team.GetColor(pm.Team(v)))
							cam.End3D()
						elseif (ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, devcol)
							cam.End3D()
						elseif !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, GetColor(v))
							cam.End3D()
						end
					end
				elseif gOption("Visuals", "Wallhack", "Box:") == "Edged Box" then   
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
				if gBool("Visuals", "Wallhack", "Health Bar") then
					surface.SetDrawColor(0, 0, 0)
					surface.DrawRect(x1 - 6, y1, 3, diff2)
					surface.DrawRect(x1 - 7, y1 - 1, 5, diff2 + 2)
					surface.SetDrawColor(Color(255 - 255 / v:GetMaxHealth() * v:Health(), 255 / v:GetMaxHealth() * v:Health(), 0))
					surface.DrawRect(x1 - 6, y2 - math.Clamp(diff2 / v:GetMaxHealth() * v:Health(), 0, diff2), 3, math.Clamp(diff2 / v:GetMaxHealth() * v:Health(), 0, diff2))
				end
				if gBool("Visuals", "Wallhack", "Armor Bar") then
					surface.SetDrawColor(0, 0, 0)
					surface.DrawRect(x1 + diff + 3, y1, 3, diff2)
					surface.DrawRect(x1 + diff + 2, y1 - 1, 5, diff2 + 2)
					surface.SetDrawColor(Color(255 - 155 / v:GetMaxArmor() * v:Armor(), 255 / v:GetMaxArmor() * v:Armor(), 255 / v:GetMaxArmor() * v:Armor()))
					surface.DrawRect(x1 + diff + 3, y2 - math.Clamp(diff2 / v:GetMaxArmor() * v:Armor(), 0, diff2), 3, math.Clamp(diff2 / v:GetMaxArmor() * v:Armor(), 0, diff2))
					if gBool("Visuals", "Wallhack", "Name") then
						local friendstatus = pm.GetFriendStatus(v)
						local pos = em.GetPos(v)
						local pos = vm.ToScreen(pos)
						if (gBool("Main Menu", "Murder Utilities", "Bystander Name") && engine.ActiveGamemode() == "murder") then
							textpos = textpos + 1
							draw.SimpleText(pm.Name(v).." ("..v:GetNWString("bystanderName")..")", "MiscFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						else
							textpos = textpos + 1
							draw.SimpleText(pm.Name(v), "MiscFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
						if table.HasValue(ignorelist, v:UniqueID()) then
							textpos2 = textpos2 + 1
							draw.SimpleText("*ignored*", "VisualsFont2", pos.x, y1 + textpos2 - 20, ignoredcol, 1, 0)
							textpos2 = textpos2 - 12
						end
						if table.HasValue(prioritylist, v:UniqueID()) then
							textpos2 = textpos2 + 1
							draw.SimpleText("*prioritized*", "VisualsFont2", pos.x, y1 + textpos2 - 20, prioritycol, 1, 0)
							textpos2 = textpos2 - 12
						end
						if (friendstatus == "friend") then
							textpos2 = textpos2 + 1
							draw.SimpleText("Steam Friend", "VisualsFont2", pos.x, y1 + textpos2 - 20, friendcol, 1, 0)
							textpos2 = textpos2 - 12
						end
						if ib.creator[v:SteamID()] then
							textpos2 = textpos2 + 1
							draw.SimpleText("IdiotBox Creator", "VisualsFont2", pos.x, y1 + textpos2 - 19, devcol, 1, 0)
							textpos2 = textpos2 - 12
						end
						if ib.contributors[v:SteamID()] then
							textpos2 = textpos2 + 1
							draw.SimpleText("IdiotBox Contributor", "VisualsFont2", pos.x, y1 + textpos2 - 19, devcol, 1, 0)
							textpos2 = textpos2 - 12
						end
					end
					if gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
						if gBool("Visuals", "Wallhack", "Health Value") then
							textpos = textpos + 1
							draw.SimpleText("Health: "..em.Health(v), "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
						if gBool("Visuals", "Wallhack", "Armor Value") then
							textpos = textpos + 1
							draw.SimpleText("Armor: "..v:Armor(), "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
					elseif !gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
						if gBool("Visuals", "Wallhack", "Health Value") then
							textpos = textpos + 1
							draw.SimpleText("Health: "..em.Health(v), "VisualsFont", x2 + 9, y1 + textpos, healthcol, 0, 1)
							textpos = textpos + 9
						end
						if gBool("Visuals", "Wallhack", "Armor Value") then
							textpos = textpos + 1
							draw.SimpleText("Armor: "..v:Armor(), "VisualsFont", x2 + 9, y1 + textpos, armorcol, 0, 1)
							textpos = textpos + 9
						end
					end
					if gBool("Visuals", "Wallhack", "Weapon") then
						textpos = textpos + 1
						local w = pm.GetActiveWeapon(v)
						if (w && em.IsValid(w)) then
							draw.SimpleText("Weapon: "..language.GetPhrase(w:GetPrintName()), "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
					end
					if gBool("Visuals", "Wallhack", "Rank") then
						textpos = textpos + 1
						draw.SimpleText("Rank: "..pm.GetUserGroup(v), "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
						textpos = textpos + 9
					end
					if gBool("Visuals", "Wallhack", "Distance") then
						textpos = textpos + 1
						draw.SimpleText("Distance: "..math.Round(v:GetPos():Distance(me:GetPos()) / 40), "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
						textpos = textpos + 9
					end
					if gBool("Visuals", "Wallhack", "Velocity") then
						textpos = textpos + 1
						draw.SimpleText("Velocity: "..math.Round(v:GetVelocity():Length()), "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
						textpos = textpos + 9
					end
					if gBool("Visuals", "Wallhack", "Conditions") and v:IsPlayer() then
						if v:InVehicle() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *driving*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:GetMoveType() == MOVETYPE_NOCLIP then
							textpos = textpos + 1
							draw.SimpleText("Condition: *noclipping*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsDormant() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *dormant*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsFlagSet(2) then
							textpos = textpos + 1
							draw.SimpleText("Condition: *crouching*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:GetMoveType() == MOVETYPE_LADDER then
							textpos = textpos + 1
							draw.SimpleText("Condition: *climbing*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:GetColor(v).a < 255 then
							textpos = textpos + 1
							draw.SimpleText("Condition: *spawning*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsFlagSet(64) then
							textpos = textpos + 1
							draw.SimpleText("Condition: *frozen*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsPlayingTaunt() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *emoting*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsFlagSet(1024) then
							textpos = textpos + 1
							draw.SimpleText("Condition: *swimming*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsSprinting() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *sprinting*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsTyping() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *typing*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:GetMoveType() == MOVETYPE_WALK or v:GetMoveType() == MOVETYPE_NONE then
							textpos = textpos + 1
							draw.SimpleText("Condition: *none*", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
					end
					if gBool("Visuals", "Wallhack", "Steam ID") then
						textpos = textpos + 1
						if (v:SteamID() ~= "NULL") then
							draw.SimpleText("SteamID: "..v:SteamID(v), "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
						else
							draw.SimpleText("SteamID: BOT", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
						end
						textpos = textpos + 9
					end
					if gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
						if gBool("Visuals", "Wallhack", "Ping") then
							textpos = textpos + 1
							draw.SimpleText("Ping: "..v:Ping().."ms", "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
						if gBool("Main Menu", "DarkRP Utilities", "Money Value") then
							textpos = textpos + 1
							if gmod.GetGamemode().Name == "DarkRP" then
								if v:getDarkRPVar("money") == nil then return end
								draw.SimpleText("Money: $"..v:getDarkRPVar("money"), "VisualsFont", x2 + 9, y1 + textpos, textcol, 0, 1)
								textpos = textpos + 9
							end
						end
					elseif !gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
						if gBool("Visuals", "Wallhack", "Ping") then
							textpos = textpos + 1
							draw.SimpleText("Ping: "..v:Ping().."ms", "VisualsFont", x2 + 9, y1 + textpos, pingcol, 0, 1)
							textpos = textpos + 9
						end
						if gBool("Main Menu", "DarkRP Utilities", "Money Value") then
							textpos = textpos + 1
							if gmod.GetGamemode().Name == "DarkRP" then
								if v:getDarkRPVar("money") == nil then return end
								draw.SimpleText("Money: $"..v:getDarkRPVar("money"), "VisualsFont", x2 + 9, y1 + textpos, moneycol, 0, 1)
								textpos = textpos + 9
							end
						end
					end
				elseif !gBool("Visuals", "Wallhack", "Armor Bar") then
					if gBool("Visuals", "Wallhack", "Name") then
						local friendstatus = pm.GetFriendStatus(v)
						local pos = em.GetPos(v)
						local pos = vm.ToScreen(pos)
						if (gBool("Main Menu", "Murder Utilities", "Bystander Name") && engine.ActiveGamemode() == "murder") then
							textpos = textpos + 1
							draw.SimpleText(pm.Name(v).." ("..v:GetNWString("bystanderName")..")", "MiscFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						else
							textpos = textpos + 1
							draw.SimpleText(pm.Name(v), "MiscFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
						if table.HasValue(ignorelist, v:UniqueID()) then
							textpos2 = textpos2 + 1
							draw.SimpleText("*ignored*", "VisualsFont2", pos.x, y1 + textpos2 - 20, ignoredcol, 1, 0)
							textpos2 = textpos2 - 12
						end
						if table.HasValue(prioritylist, v:UniqueID()) then
							textpos2 = textpos2 + 1
							draw.SimpleText("*prioritized*", "VisualsFont2", pos.x, y1 + textpos2 - 20, prioritycol, 1, 0)
							textpos2 = textpos2 - 12
						end
						if (friendstatus == "friend") then
							textpos2 = textpos2 + 1
							draw.SimpleText("Steam Friend", "VisualsFont2", pos.x, y1 + textpos2 - 20, friendcol, 1, 0)
							textpos2 = textpos2 - 12
						end
						if ib.creator[v:SteamID()] then
							textpos2 = textpos2 + 1
							draw.SimpleText("IdiotBox Creator", "VisualsFont2", pos.x, y1 + textpos2 - 19, devcol, 1, 0)
							textpos2 = textpos2 - 12
						end
						if ib.contributors[v:SteamID()] then
							textpos2 = textpos2 + 1
							draw.SimpleText("IdiotBox Contributor", "VisualsFont2", pos.x, y1 + textpos2 - 19, devcol, 1, 0)
							textpos2 = textpos2 - 12
						end
					end
					if gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
						if gBool("Visuals", "Wallhack", "Health Value") then
							textpos = textpos + 1
							draw.SimpleText("Health: "..em.Health(v), "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
						if gBool("Visuals", "Wallhack", "Armor Value") then
							textpos = textpos + 1
							draw.SimpleText("Armor: "..v:Armor(), "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
					elseif !gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
						if gBool("Visuals", "Wallhack", "Health Value") then
							textpos = textpos + 1
							draw.SimpleText("Health: "..em.Health(v), "VisualsFont", x2 + 3, y1 + textpos, healthcol, 0, 1)
							textpos = textpos + 9
						end
						if gBool("Visuals", "Wallhack", "Armor Value") then
							textpos = textpos + 1
							draw.SimpleText("Armor: "..v:Armor(), "VisualsFont", x2 + 3, y1 + textpos, armorcol, 0, 1)
							textpos = textpos + 9
						end
					end
					if gBool("Visuals", "Wallhack", "Weapon") then
						textpos = textpos + 1
						local w = pm.GetActiveWeapon(v)
						if (w && em.IsValid(w)) then
							draw.SimpleText("Weapon: "..language.GetPhrase(w:GetPrintName()), "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
					end
					if gBool("Visuals", "Wallhack", "Rank") then
						textpos = textpos + 1
						draw.SimpleText("Rank: "..pm.GetUserGroup(v), "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
						textpos = textpos + 9
					end
					if gBool("Visuals", "Wallhack", "Distance") then
						textpos = textpos + 1
						draw.SimpleText("Distance: "..math.Round(v:GetPos():Distance(me:GetPos()) / 40), "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
						textpos = textpos + 9
					end
					if gBool("Visuals", "Wallhack", "Velocity") then
						textpos = textpos + 1
						draw.SimpleText("Velocity: "..math.Round(v:GetVelocity():Length()), "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
						textpos = textpos + 9
					end
					if gBool("Visuals", "Wallhack", "Conditions") and v:IsPlayer() then
						if v:InVehicle() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *driving*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:GetMoveType() == MOVETYPE_NOCLIP then
							textpos = textpos + 1
							draw.SimpleText("Condition: *noclipping*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsDormant() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *dormant*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsFlagSet(2) then
							textpos = textpos + 1
							draw.SimpleText("Condition: *crouching*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:GetMoveType() == MOVETYPE_LADDER then
							textpos = textpos + 1
							draw.SimpleText("Condition: *climbing*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:GetColor(v).a < 255 then
							textpos = textpos + 1
							draw.SimpleText("Condition: *spawning*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsFlagSet(64) then
							textpos = textpos + 1
							draw.SimpleText("Condition: *frozen*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsPlayingTaunt() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *emoting*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsFlagSet(1024) then
							textpos = textpos + 1
							draw.SimpleText("Condition: *swimming*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsSprinting() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *sprinting*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:IsTyping() then
							textpos = textpos + 1
							draw.SimpleText("Condition: *typing*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						elseif v:GetMoveType() == MOVETYPE_WALK or v:GetMoveType() == MOVETYPE_NONE then
							textpos = textpos + 1
							draw.SimpleText("Condition: *none*", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
					end
					if gBool("Visuals", "Wallhack", "Steam ID") then
						textpos = textpos + 1
						if (v:SteamID() ~= "NULL") then
							draw.SimpleText("SteamID: "..v:SteamID(v), "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
						else
							draw.SimpleText("SteamID: BOT", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
						end
						textpos = textpos + 9
					end
					if gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
						if (gBool("Visuals", "Wallhack", "Ping")) then
							textpos = textpos + 1
							draw.SimpleText("Ping: "..v:Ping().."ms", "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
							textpos = textpos + 9
						end
						if gBool("Main Menu", "DarkRP Utilities", "Money Value") then
							textpos = textpos + 1
							if gmod.GetGamemode().Name == "DarkRP" then
								if v:getDarkRPVar("money") == nil then return end
								draw.SimpleText("Money: $"..v:getDarkRPVar("money"), "VisualsFont", x2 + 3, y1 + textpos, textcol, 0, 1)
								textpos = textpos + 9
							end
						end
					elseif !gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
						if (gBool("Visuals", "Wallhack", "Ping")) then
							textpos = textpos + 1
							draw.SimpleText("Ping: "..v:Ping().."ms", "VisualsFont", x2 + 3, y1 + textpos, pingcol, 0, 1)
							textpos = textpos + 9
						end
						if gBool("Main Menu", "DarkRP Utilities", "Money Value") then
							textpos = textpos + 1
							if gmod.GetGamemode().Name == "DarkRP" then
								if v:getDarkRPVar("money") == nil then return end
								draw.SimpleText("Money: $"..v:getDarkRPVar("money"), "VisualsFont", x2 + 3, y1 + textpos, moneycol, 0, 1)
								textpos = textpos + 9
							end
						end
					end
				end
			elseif gOption("Visuals", "Wallhack", "Style:") == "Classic" then
				local min, max = em.GetCollisionBounds(v)
				local pos = em.GetPos(v)
				local pos2 = pos + Vector(0, 0, max.z)
				local pos = vm.ToScreen(pos)
				local pos2 = vm.ToScreen(pos2)
				local h = pos.y - pos2.y
				local w = h / 2
				local ww = h / 4
				local textpos = 0
				if gOption("Visuals", "Wallhack", "Box:") == "2D Box" then
					surface.SetDrawColor(colOne)
					surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h)
					surface.SetDrawColor(colTwo)
					surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2)
					surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2)
				elseif gOption("Visuals", "Wallhack", "Box:") == "3D Box" then
					if (!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (v:Team() == TEAM_SPECTATOR and gBool("Visuals", "Miscellaneous", "Show Spectators")) or ((gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID()))) then return end
					if v:IsValid() and v:Alive() and v:Health() > 0 then
						local eye = v:EyeAngles()
						local origin = v:GetPos()
						local min, max = v:WorldSpaceAABB()
						if gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(ignorelist, v:UniqueID()) and !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, ignoredcol)
							cam.End3D()
						elseif gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(prioritylist, v:UniqueID()) and !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, prioritycol)
							cam.End3D()
						elseif gBool("Visuals", "Miscellaneous", "Team Colors") and !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, team.GetColor(pm.Team(v)))
							cam.End3D()
						elseif (ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, devcol)
							cam.End3D()
						elseif !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(origin, Angle(0, eye.y, 0), min - origin, max - origin, GetColor(v))
							cam.End3D()
						end
					end
				elseif gOption("Visuals", "Wallhack", "Box:") == "Edged Box" then   
					local x1, y1, x2, y2 = ScrW() * 2, ScrH() * 2, - ScrW(), - ScrH()
					local corners = {v:LocalToWorld(Vector(min.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, min.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, min.z)):ToScreen(), v:LocalToWorld(Vector(min.x, min.y, max.z)):ToScreen(), v:LocalToWorld(Vector(min.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, max.y, max.z)):ToScreen(), v:LocalToWorld(Vector(max.x, min.y, max.z)):ToScreen()}
					local diff, diff2 = math.abs(x2 - x1), math.abs(y2 - y1)
					for _k, _v in next, corners do
						x1, y1 = math.min(x1, _v.x), math.min(y1, _v.y)
						x2, y2 = math.max(x2, _v.x), math.max(y2, _v.y)
					end
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
				if gBool("Visuals", "Wallhack", "Health Bar") then
					local hp = h * em.Health(v) / 100
					if (hp > h) then hp = h end
					local diff = h - hp
					surface.SetDrawColor(0, 0, 0, 255)
					surface.DrawRect(pos.x - w / 2 - 8, pos.y - h - 1, 5, h + 2)
					surface.SetDrawColor((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0, 255)
					surface.DrawRect(pos.x - w / 2 - 7, pos.y - h + diff, 3, hp)
				end
				if gBool("Visuals", "Wallhack", "Armor Bar") then
					local armor = v:Armor() * h / 100
					if (armor > h) then armor = h end
					local diff = h - armor
					surface.SetDrawColor(0, 0, 0, 255)
					surface.DrawRect(pos.x + ww + 3, pos.y - h - 1, 5, h + 2)
					surface.SetDrawColor((100 - v:Armor()) * 2.55, v:Armor() * 2.55, v:Armor() * 2.55, 255)
					surface.DrawRect(pos.x + ww + 4, pos.y - h + diff, 3, armor)
				end
				if gBool("Visuals", "Wallhack", "Name") then
					local friendstatus = pm.GetFriendStatus(v)
					if (friendstatus == "friend") then
						draw.SimpleText("Steam Friend", "VisualsFont", pos.x, pos.y - h - 13 - 13, friendcol, 1, 1)
					end
					if (gBool("Main Menu", "Murder Utilities", "Bystander Name") && engine.ActiveGamemode() == "murder") then
						draw.SimpleText(pm.Name(v).." ("..v:GetNWString("bystanderName")..")", "MiscFont", pos.x, pos.y - h - 1 - (friendstatus == "friend" && 12 || 12), textcol, 1, 1)
					else
						draw.SimpleText(pm.Name(v), "MiscFont", pos.x, pos.y - h - 1 - (friendstatus == "friend" && 12 || 12), textcol, 1, 1)
					end
					if (friendstatus == "friend") then
						if ib.creator[v:SteamID()] then
							draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 26 - 13, devcol, 1, 1)
						end
						if ib.contributors[v:SteamID()] then
							draw.SimpleText("IdiotBox Contributor", "VisualsFont", pos.x, pos.y - h - 26 - 13, devcol, 1, 1)
						end
					end
					if (friendstatus ~= "friend") then
						if ib.creator[v:SteamID()] then
							draw.SimpleText("IdiotBox Creator", "VisualsFont", pos.x, pos.y - h - 13 - 13, devcol, 1, 1)
						end
						if ib.contributors[v:SteamID()] then
							draw.SimpleText("IdiotBox Contributor", "VisualsFont", pos.x, pos.y - h - 13 - 13, devcol, 1, 1)
						end
					end
					if (friendstatus == "friend") and (ib.creator[v:SteamID()] or ib.contributors[v:SteamID()]) then
						if table.HasValue(ignorelist, v:UniqueID()) then
							draw.SimpleText("Ignored Target", "VisualsFont", pos.x, pos.y - h - 39 - 13, ignoredcol, 1, 1)
						end
						if table.HasValue(prioritylist, v:UniqueID()) then
							draw.SimpleText("Priority Target", "VisualsFont", pos.x, pos.y - h - 39 - 13, prioritycol, 1, 1)
						end
					end
					if (friendstatus == "friend") and not (ib.creator[v:SteamID()] or ib.contributors[v:SteamID()]) then
						if table.HasValue(ignorelist, v:UniqueID()) then
							draw.SimpleText("Ignored Target", "VisualsFont", pos.x, pos.y - h - 26 - 13, ignoredcol, 1, 1)
						end
						if table.HasValue(prioritylist, v:UniqueID()) then
							draw.SimpleText("Priority Target", "VisualsFont", pos.x, pos.y - h - 26 - 13, prioritycol, 1, 1)
						end
					end
					if (friendstatus ~= "friend") and (ib.creator[v:SteamID()] or ib.contributors[v:SteamID()]) then
						if table.HasValue(ignorelist, v:UniqueID()) then
							draw.SimpleText("Ignored Target", "VisualsFont", pos.x, pos.y - h - 26 - 13, ignoredcol, 1, 1)
						end
						if table.HasValue(prioritylist, v:UniqueID()) then
							draw.SimpleText("Priority Target", "VisualsFont", pos.x, pos.y - h - 26 - 13, prioritycol, 1, 1)
						end
					end
					if (friendstatus ~= "friend") and not (ib.creator[v:SteamID()] or ib.contributors[v:SteamID()]) then
						if table.HasValue(ignorelist, v:UniqueID()) then
							draw.SimpleText("Ignored Target", "VisualsFont", pos.x, pos.y - h - 13 - 13, ignoredcol, 1, 1)
						end
						if table.HasValue(prioritylist, v:UniqueID()) then
							draw.SimpleText("Priority Target", "VisualsFont", pos.x, pos.y - h - 13 - 13, prioritycol, 1, 1)
						end
					end
				end
				if gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
					if gBool("Visuals", "Wallhack", "Health Value") then
						textpos = textpos + 1
						draw.SimpleText("Health: "..em.Health(v), "VisualsFont", pos.x, pos.y - 1 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					end
					if gBool("Visuals", "Wallhack", "Armor Value") then
						textpos = textpos + 1
						draw.SimpleText("Armor: "..v:Armor(), "VisualsFont", pos.x, pos.y - 1 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					end
				elseif !gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
					if gBool("Visuals", "Wallhack", "Health Value") then
						textpos = textpos + 1
						draw.SimpleText("Health: "..em.Health(v), "VisualsFont", pos.x, pos.y - 1 + textpos, healthcol, 1, 0)
						textpos = textpos + 9
					end
					if gBool("Visuals", "Wallhack", "Armor Value") then
						textpos = textpos + 1
						draw.SimpleText("Armor: "..v:Armor(), "VisualsFont", pos.x, pos.y - 1 + textpos, armorcol, 1, 0)
						textpos = textpos + 9
					end
				end
				if gBool("Visuals", "Wallhack", "Weapon") then
					textpos = textpos + 1
					local w = pm.GetActiveWeapon(v)
						if (w && em.IsValid(w)) then
						draw.SimpleText("Weapon: "..language.GetPhrase(w:GetPrintName()), "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					end
				end
				if gBool("Visuals", "Wallhack", "Rank") then
					textpos = textpos + 1
					draw.SimpleText("Rank: "..pm.GetUserGroup(v), "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
					textpos = textpos + 9
				end
				if gBool("Visuals", "Wallhack", "Distance") then
					textpos = textpos + 1
					draw.SimpleText("Distance: "..math.Round(v:GetPos():Distance(me:GetPos()) / 40), "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
					textpos = textpos + 9
				end
				if gBool("Visuals", "Wallhack", "Velocity") then
					textpos = textpos + 1
					draw.SimpleText("Velocity: "..math.Round(v:GetVelocity():Length()), "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
					textpos = textpos + 9
				end
				if gBool("Visuals", "Wallhack", "Conditions") and v:IsPlayer() then
					if v:InVehicle() then
						textpos = textpos + 1
						draw.SimpleText("Condition: *driving*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:GetMoveType() == MOVETYPE_NOCLIP then
						textpos = textpos + 1
						draw.SimpleText("Condition: *noclipping*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:IsDormant() then
						textpos = textpos + 1
						draw.SimpleText("Condition: *dormant*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:IsFlagSet(2) then
						textpos = textpos + 1
						draw.SimpleText("Condition: *crouching*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:GetMoveType() == MOVETYPE_LADDER then
						textpos = textpos + 1
						draw.SimpleText("Condition: *climbing*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:GetColor(v).a < 255 then
						textpos = textpos + 1
						draw.SimpleText("Condition: *spawning*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:IsFlagSet(64) then
						textpos = textpos + 1
						draw.SimpleText("Condition: *frozen*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:IsPlayingTaunt() then
						textpos = textpos + 1
						draw.SimpleText("Condition: *emoting*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:IsFlagSet(1024) then
						textpos = textpos + 1
						draw.SimpleText("Condition: *swimming*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:IsSprinting() then
						textpos = textpos + 1
						draw.SimpleText("Condition: *sprinting*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:IsTyping() then
						textpos = textpos + 1
						draw.SimpleText("Condition: *typing*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					elseif v:GetMoveType() == MOVETYPE_WALK or v:GetMoveType() == MOVETYPE_NONE then
						textpos = textpos + 1
						draw.SimpleText("Condition: *none*", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					end
				end
				if gBool("Visuals", "Wallhack", "Steam ID") then
					textpos = textpos + 1
					if (v:SteamID() ~= "NULL") then
						draw.SimpleText("SteamID: "..v:SteamID(v), "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
					else
						draw.SimpleText("SteamID: BOT", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
					end
					textpos = textpos + 9
				end
				if gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
					if (gBool("Visuals", "Wallhack", "Ping")) then
						textpos = textpos + 1
						draw.SimpleText("Ping: "..v:Ping().."ms", "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
						textpos = textpos + 9
					end
					if gBool("Main Menu", "DarkRP Utilities", "Money Value") then
						textpos = textpos + 1
						if gmod.GetGamemode().Name == "DarkRP" then
							if v:getDarkRPVar("money") == nil then return end
							draw.SimpleText("Money: $"..v:getDarkRPVar("money"), "VisualsFont", pos.x, pos.y - 0 + textpos, textcol, 1, 0)
							textpos = textpos + 9
						end
					end
				elseif !gBool("Visuals", "Miscellaneous", "Adaptive Text Color") then
					if (gBool("Visuals", "Wallhack", "Ping")) then
						textpos = textpos + 1
						draw.SimpleText("Ping: "..v:Ping().."ms", "VisualsFont", pos.x, pos.y - 0 + textpos, pingcol, 1, 0)
						textpos = textpos + 9
					end
				if gBool("Main Menu", "DarkRP Utilities", "Money Value") then
					textpos = textpos + 1
					if gmod.GetGamemode().Name == "DarkRP" then
						if v:getDarkRPVar("money") == nil then return end
						draw.SimpleText("Money: $"..v:getDarkRPVar("money"), "VisualsFont", pos.x, pos.y - 0 + textpos, moneycol, 1, 0)
						textpos = textpos + 9
					end
				end
			end
		end
	if gBool("Visuals", "Wallhack", "Skeleton") then
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
	if gBool("Visuals", "Wallhack", "Glow") then
		local wep = v:GetActiveWeapon()
		halo.Add({v, wep}, colFour, .55, .55, 5, true, true)
	end
	if gBool("Visuals", "Wallhack", "Hitbox") then
		if (!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (v:Team() == TEAM_SPECTATOR and gBool("Visuals", "Miscellaneous", "Show Spectators")) or ((gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Hide Ignored Targets") && table.HasValue(ignorelist, v:UniqueID())) or (gBool("Main Menu", "Priority List", "Enabled") and gBool("Visuals", "Miscellaneous", "Priority Targets Only") && !table.HasValue(prioritylist, v:UniqueID()))) then return end
		if v:IsValid() and v:Alive() and v:Health() > 0 then
			for i = 0, v:GetHitBoxGroupCount() - 1 do
				for _i = 0, v:GetHitBoxCount(i) - 1 do
					local bone = v:GetHitBoxBone(_i, i)
					if not (bone) then continue end			
					local min, max = v:GetHitBoxBounds(_i, i)			
					if v:GetBonePosition(bone) then
						local pos, ang = v:GetBonePosition(bone)
						if gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(ignorelist, v:UniqueID()) and !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(pos, ang, min, max, ignoredcol)
							cam.End3D()
						elseif gBool("Visuals", "Miscellaneous", "Target Priority Colors") and table.HasValue(prioritylist, v:UniqueID()) and !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(pos, ang, min, max, prioritycol)
							cam.End3D()
						elseif gBool("Visuals", "Miscellaneous", "Team Colors") and !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(pos, ang, min, max, team.GetColor(pm.Team(v)))
							cam.End3D()
						elseif (ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
							cam.Start3D()
								render.DrawWireframeBox(pos, ang, min, max, devcol)
							cam.End3D()
						elseif !(ib.contributors[v:SteamID()] || ib.creator[v:SteamID()]) then
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

hook.Add("RenderScreenspaceEffects", "RenderScreenspaceEffects", function()
	if not gBool("Visuals", "Wallhack", "Enabled") then return end
	for k, v in next, player.GetAll() do
		if (not em.IsValid(v) or em.Health(v) < 1 or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or (pm.Team(v) == TEAM_SPECTATOR and not gBool("Visuals", "Miscellaneous", "Show Spectators"))) or not OnScreen(v) or not WallhackFilter(v) or not EnemyWallhackFilter(v) then continue end
		PlayerChams(v)
	end
	for k, v in next, ents.GetAll() do
		if not v:IsValid() or (not gBool("Visuals", "Miscellaneous", "Show Entities") or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All"))) or not OnScreen(v) or not WallhackFilter(v) then continue end
		if table.HasValue(drawnents, v:GetClass()) and v:IsValid() and v:GetPos():Distance(me:GetPos()) > 40 then
			EntityChams(v)
		end
	end
	for k, v in pairs(ents.FindByClass("npc_*")) do
		if (not gBool("Visuals", "Miscellaneous", "Show NPCs") or not em.IsValid(v) or em.Health(v) < 1 or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All"))) or not OnScreen(v) or not WallhackFilter(v) then continue end
		NPCChams(v)
	end
end)

local function ShowNPCs()
	for k, v in pairs(ents.FindByClass("npc_*")) do
	if (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or not OnScreen(v) or not WallhackFilter(v) then continue end
	local colOne = Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b)
	local colTwo = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0, 255)
	local colThree = Color(0, 0, 0)
	local colFour = Color(255, 255, 255)
	local colFive = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0)
	local min, max = em.GetCollisionBounds(v)
	local pos = em.GetPos(v)
	local pos2 = pos + Vector(0, 0, max.z)
	local pos = vm.ToScreen(pos)
	local pos2 = vm.ToScreen(pos2)
	local textpos = 0
	local h = pos.y - pos2.y
	local w = h / 1.7
	local hp = em.Health(v) * h / 100
	local health = em.Health(v)
	if health < 0 then
	health = 0
	end
	if v:IsValid() and v:Health() > 0 then
	if gBool("Visuals", "Miscellaneous", "NPC Box") then
		surface.SetDrawColor(colOne)
		surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h)
		surface.SetDrawColor(colThree)
		surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2)
		surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2)
	end
	if gBool("Visuals", "Miscellaneous", "NPC Name") then
		draw.SimpleText(v:GetClass(), "MiscFont", pos.x, pos.y - h - 2 - 7, Color(255, 255, 255), 1, 1)
		surface.SetDrawColor(Color(0, 0, 0))
	end
	if gOption("Visuals", "Wallhack", "Position Lines:") ~= "Off" then
		local pos = v:LocalToWorld(v:OBBCenter()):ToScreen()
			surface.SetDrawColor(colOne)
		if gOption("Visuals", "Wallhack", "Position Lines:") == "Bottom" then
			surface.DrawLine(ScrW() / 2, ScrH(), pos.x, pos.y)
		elseif gOption("Visuals", "Wallhack", "Position Lines:") == "Top" then
			surface.DrawLine(ScrW() / 2, 0, pos.x, pos.y)
		else
			surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y)
		end
	end
	if gBool("Visuals", "Wallhack", "Skeleton") then
		local pos = em.GetPos(v)
		for i = 0, em.GetBoneCount(v) do
		local parent = em.GetBoneParent(v, i)
		local bonepos = em.GetBonePosition(v, i)
		local parentpos = em.GetBonePosition(v, parent)
		if (!parent) or (bonepos == pos) or (!bonepos || !parentpos) then continue end
		local screen1, screen2 = vm.ToScreen(bonepos), vm.ToScreen(parentpos)
		surface.SetDrawColor(colOne)
		surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
		end
	end
	if gBool("Visuals", "Miscellaneous", "NPC Glow") then
		halo.Add({v}, colOne, .55, .55, 5, true, true)
	end
	if gBool("Visuals", "Wallhack", "Hitbox") then
			for i = 0, v:GetHitBoxGroupCount() - 1 do
			for _i = 0, v:GetHitBoxCount(i) - 1 do
			local bone = v:GetHitBoxBone(_i, i)
			if not (bone) then continue end			
			local min, max = v:GetHitBoxBounds(_i, i)			
			if (v:GetBonePosition(bone)) then
			local pos, ang = v:GetBonePosition(bone)
				cam.Start3D()
					render.DrawWireframeBox(pos, ang, min, max, colOne)
				cam.End3D()
				end
			end
		end
	end
	if gBool("Visuals", "Wallhack", "Health Value") then
		textpos = textpos + 1
		draw.SimpleText("Health: "..health, "VisualsFont", pos.x, pos.y + textpos, colFive, 1, 0)
		textpos = textpos + 9
	end
	if gBool("Visuals", "Wallhack", "Distance") then
		textpos = textpos + 1
		draw.SimpleText("Distance: "..math.Round(v:GetPos():Distance(me:GetPos()) / 40), "VisualsFont", pos.x, pos.y + textpos, colFour, 1, 0)
		textpos = textpos + 9
	end
	if gBool("Visuals", "Wallhack", "Velocity") then
		textpos = textpos + 1
		draw.SimpleText("Velocity: "..math.Round(v:GetVelocity():Length()), "VisualsFont", pos.x, pos.y + textpos, colFour, 1, 0)
		textpos = textpos + 9
	end
	if gBool("Visuals", "Wallhack", "Health Bar") then
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

local function AntiAFK(cmd)
	if (!gBool("Main Menu", "General Utilities", "Anti-AFK")) then
		timer.Create("afk1", 6, 0, function()
		local commands = {"moveleft", "moveright", "moveup", "movedown"}
		local command1 = table.Random(commands)
		local command2 = table.Random(commands)
		if global.unloaded == true or !gBool("Main Menu", "General Utilities", "Anti-AFK") then return end
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
                surface.PlaySound(ib.headshot1[math.random(#ib.headshot1)])
			elseif gOption("Miscellaneous", "Sounds", "Hitsounds:") == "Headshot 2" then
                surface.PlaySound(ib.headshot2[math.random(#ib.headshot2)])
			elseif gOption("Miscellaneous", "Sounds", "Hitsounds:") == "Metal" then
                surface.PlaySound(ib.metal[math.random(#ib.metal)])
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
	local killer = global.Entity(data.entindex_attacker)
	local victim = global.Entity(data.entindex_killed)
	if (global.IsValid(killer) and global.IsValid(victim) and killer:IsPlayer() and victim:IsPlayer()) then
		if (killer == me and victim ~= me) then
			if gOption("Miscellaneous", "Sounds", "Killsounds:") ~= "Off" then
				if gOption("Miscellaneous", "Sounds", "Killsounds:") == "Default" then
					surface.PlaySound("buttons/bell1.wav")
				elseif gOption("Miscellaneous", "Sounds", "Killsounds:") == "Headshot 1" then
					surface.PlaySound(ib.headshot1[math.random(#ib.headshot1)])
				elseif gOption("Miscellaneous", "Sounds", "Killsounds:") == "Headshot 2" then
					surface.PlaySound(ib.headshot2[math.random(#ib.headshot2)])
				elseif gOption("Miscellaneous", "Sounds", "Killsounds:") == "Metal" then
					surface.PlaySound(ib.metal[math.random(#ib.metal)])
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
	local killer = global.Entity(data.entindex_attacker)
	local victim = global.Entity(data.entindex_killed)
	if (global.IsValid(killer) and global.IsValid(victim) and killer:IsPlayer() and victim:IsPlayer()) then
	global.surface.PlaySound("buttons/lightswitch2.wav")
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
	local dist = gInt("Aim Assist", "Aim Priorities", "Distance:")
	local vel = gInt("Aim Assist", "Aim Priorities", "Velocity:")
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
	if !gBool("Aim Assist", "Aim Priorities", "Target Immune Players") then
		if pm.IsFrozen(v) then return false end
	end
	if !gBool("Aim Assist", "Aim Priorities", "Target Immune Players") then
        for i = 1, #ib.NetMessages.Buildmode do
            if tobool(v:GetNWBool(ib.NetMessages.Buildmode[i])) then
                return false
            end
        end
    end
    if !gBool("Aim Assist", "Aim Priorities", "Target Immune Players") then
        for i = 1, #ib.NetMessages.Protected do
            if tobool(v:GetNWBool(ib.NetMessages.Protected[i])) then
                return false
            end
        end
    end
    if !gBool("Aim Assist", "Aim Priorities", "Target Immune Players") then
		if v:HasGodMode() then return false end
        for i = 1, #ib.NetMessages.God do
            if tobool(v:GetNWBool(ib.NetMessages.God[i])) then
                return false
            end
        end
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
	local sticky = gBool("Aim Assist", "Aimbot", "Target Lock")
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
			if (!Valid(v)) then continue end
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
		for k, v in next, ents.GetAll() do
			if (!Valid(v)) then continue end
			local eyepos = v:EyePos():ToScreen()
			dists[#dists + 1] = {math.Dist(x / 2, y / 2, eyepos.x, eyepos.y), v}
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

ib.spread.enginespread = {
    [0] = {-0.492036, 0.286111},
    [1] = {-0.492036, 0.286111},
    [2] = {-0.255320, 0.128480},
    [3] = {0.456165, 0.356030},
    [4] = {-0.361731, 0.406344},
    [5] = {-0.146730, 0.834589},
    [6] = {-0.253288, -0.421936},
    [7] = {-0.448694, 0.111650},
    [8] = {-0.880700, 0.904610},
    [9] = {-0.379932, 0.138833},
    [10] = {0.502579, -0.494285},
    [11] = {-0.263847, -0.594805},
    [12] = {0.818612, 0.090368},
    [13] = {-0.063552, 0.044356},
    [14] = {0.490455, 0.304820},
    [15] = {-0.192024, 0.195162},
    [16] = {-0.139421, 0.857106},
    [17] = {0.715745, 0.336956},
    [18] = {-0.150103, -0.044842},
    [19] = {-0.176531, 0.275787},
    [20] = {0.155707, -0.152178},
    [21] = {-0.136486, -0.591896},
    [22] = {-0.021022, -0.761979},
    [23] = {-0.166004, -0.733964},
    [24] = {-0.102439, -0.132059},
    [25] = {-0.607531, -0.249979},
    [26] = {-0.500855, -0.185902},
    [27] = {-0.080884, 0.516556},
    [28] = {-0.003334, 0.138612},
    [29] = {-0.546388, -0.000115},
    [30] = {-0.228092, -0.018492},
    [31] = {0.542539, 0.543196},
    [32] = {-0.355162, 0.197473},
    [33] = {-0.041726, -0.015735},
    [34] = {-0.713230, -0.551701},
    [35] = {-0.045056, 0.090208},
    [36] = {0.061028, 0.417744},
    [37] = {-0.171149, -0.048811},
    [38] = {0.241499, 0.164562},
    [39] = {-0.129817, -0.111200},
    [40] = {0.007366, 0.091429},
    [41] = {-0.079268, -0.008285},
    [42] = {0.010982, -0.074707},
    [43] = {-0.517782, -0.682470},
    [44] = {-0.663822, -0.024972},
    [45] = {0.058213, -0.078307},
    [46] = {-0.302041, -0.132280},
    [47] = {0.217689, -0.209309},
    [48] = {-0.143615, 0.830349},
    [49] = {0.270912, 0.071245},
    [50] = {-0.258170, -0.598358},
    [51] = {0.099164, -0.257525},
    [52] = {-0.214676, -0.595918},
    [53] = {-0.427053, -0.523764},
    [54] = {-0.585472, 0.088522},
    [55] = {0.564305, -0.533822},
    [56] = {-0.387545, -0.422206},
    [57] = {0.690505, -0.299197},
    [58] = {0.475553, 0.169785},
    [59] = {0.347436, 0.575364},
    [60] = {-0.069555, -0.103340},
    [61] = {0.286197, -0.618916},
    [62] = {-0.505259, 0.106581},
    [63] = {-0.420214, -0.714843},
    [64] = {0.032596, -0.401891},
    [65] = {-0.238702, -0.087387},
    [66] = {0.714358, 0.197811},
    [67] = {0.208960, 0.319015},
    [68] = {-0.361140, 0.222130},
    [69] = {-0.133284, -0.492274},
    [70] = {0.022824, -0.133955},
    [71] = {-0.100850, 0.271962},
    [72] = {-0.050582, -0.319538},
    [73] = {0.577980, 0.095507},
    [74] = {0.224871, 0.242213},
    [75] = {-0.628274, 0.097248},
    [76] = {0.184266, 0.091959},
    [77] = {-0.036716, 0.474259},
    [78] = {-0.502566, -0.279520},
    [79] = {-0.073201, -0.036658},
    [80] = {0.339952, -0.293667},
    [81] = {0.042811, 0.130387},
    [82] = {0.125881, 0.007040},
    [83] = {0.138374, -0.418355},
    [84] = {0.261396, -0.392697},
    [85] = {-0.453318, -0.039618},
    [86] = {0.890159, -0.335165},
    [87] = {0.466437, -0.207762},
    [88] = {0.593253, 0.418018},
    [89] = {0.566934, -0.643837},
    [90] = {0.150918, 0.639588},
    [91] = {0.150112, 0.215963},
    [92] = {-0.130520, 0.324801},
    [93] = {-0.369819, -0.019127},
    [94] = {-0.038889, -0.650789},
    [95] = {0.490519, -0.065375},
    [96] = {-0.305940, 0.454759},
    [97] = {-0.521967, -0.550004},
    [98] = {-0.040366, 0.683259},
    [99] = {0.137676, -0.376445},
    [100] = {0.839301, 0.085979},
    [101] = {-0.319140, 0.481838},
    [102] = {0.201437, -0.033135},
    [103] = {0.384637, -0.036685},
    [104] = {0.598419, 0.144371},
    [105] = {-0.061424, -0.608645},
    [106] = {-0.065337, 0.308992},
    [107] = {-0.029356, -0.634337},
    [108] = {0.326532, 0.047639},
    [109] = {0.505681, -0.067187},
    [110] = {0.691612, 0.629364},
    [111] = {-0.038588, -0.635947},
    [112] = {0.637837, -0.011815},
    [113] = {0.765338, 0.563945},
    [114] = {0.213416, 0.068664},
    [115] = {-0.576581, 0.554824},
    [116] = {0.246580, 0.132726},
    [117] = {0.385548, -0.070054},
    [118] = {0.538735, -0.291010},
    [119] = {0.609944, 0.590973},
    [120] = {-0.463240, 0.010302},
    [121] = {-0.047718, 0.741086},
    [122] = {0.308590, -0.322179},
    [123] = {-0.291173, 0.256367},
    [124] = {0.287413, -0.510402},
    [125] = {0.864716, 0.158126},
    [126] = {0.572344, 0.561319},
    [127] = {-0.090544, 0.332633},
    [128] = {0.644714, 0.196736},
    [129] = {-0.204198, 0.603049},
    [130] = {-0.504277, -0.641931},
    [131] = {0.218554, 0.343778},
    [132] = {0.466971, 0.217517},
    [133] = {-0.400880, -0.299746},
    [134] = {-0.582451, 0.591832},
    [135] = {0.421843, 0.118453},
    [136] = {-0.215617, -0.037630},
    [137] = {0.341048, -0.283902},
    [138] = {-0.246495, -0.138214},
    [139] = {0.214287, -0.196102},
    [140] = {0.809797, -0.498168},
    [141] = {-0.115958, -0.260677},
    [142] = {-0.025448, 0.043173},
    [143] = {-0.416803, -0.180813},
    [144] = {-0.782066, 0.335273},
    [145] = {0.192178, -0.151171},
    [146] = {0.109733, 0.165085},
    [147] = {-0.617935, -0.274392},
    [148] = {0.283301, 0.171837},
    [149] = {-0.150202, 0.048709},
    [150] = {-0.179954, -0.288559},
    [151] = {-0.288267, -0.134894},
    [152] = {-0.049203, 0.231717},
    [153] = {-0.065761, 0.495457},
    [154] = {0.082018, -0.457869},
    [155] = {-0.159553, 0.032173},
    [156] = {0.508305, -0.090690},
    [157] = {0.232269, -0.338245},
    [158] = {-0.374490, -0.480945},
    [159] = {-0.541244, 0.194144},
    [160] = {-0.040063, -0.073532},
    [161] = {0.136516, -0.167617},
    [162] = {-0.237350, 0.456912},
    [163] = {-0.446604, -0.494381},
    [164] = {0.078626, -0.020068},
    [165] = {0.163208, 0.600330},
    [166] = {-0.886186, -0.345326},
    [167] = {-0.732948, -0.689349},
    [168] = {0.460564, -0.719006},
    [169] = {-0.033688, -0.333340},
    [170] = {-0.325414, -0.111704},
    [171] = {0.010928, 0.723791},
    [172] = {0.713581, -0.077733},
    [173] = {-0.050912, -0.444684},
    [174] = {-0.268509, 0.381144},
    [175] = {-0.175387, 0.147070},
    [176] = {-0.429779, 0.144737},
    [177] = {-0.054564, 0.821354},
    [178] = {0.003205, 0.178130},
    [179] = {-0.552814, 0.199046},
    [180] = {0.225919, -0.195013},
    [181] = {0.056040, -0.393974},
    [182] = {-0.505988, 0.075184},
    [183] = {-0.510223, 0.156271},
    [184] = {-0.209616, 0.111174},
    [185] = {-0.605132, -0.117104},
    [186] = {0.412433, -0.035510},
    [187] = {-0.573947, -0.691295},
    [188] = {-0.712686, 0.021719},
    [189] = {-0.643297, 0.145307},
    [190] = {0.245038, 0.343062},
    [191] = {-0.235623, -0.159307},
    [192] = {-0.834004, 0.088725},
    [193] = {0.121377, 0.671713},
    [194] = {0.528614, 0.607035},
    [195] = {-0.285699, -0.111312},
    [196] = {0.603385, 0.401094},
    [197] = {0.632098, -0.439659},
    [198] = {0.681016, -0.242436},
    [199] = {-0.261709, 0.304265},
    [200] = {-0.653737, -0.199245},
    [201] = {-0.435512, -0.762978},
    [202] = {0.701105, 0.389527},
    [203] = {0.093495, -0.148484},
    [204] = {0.715218, 0.638291},
    [205] = {-0.055431, -0.085173},
    [206] = {-0.727438, 0.889783},
    [207] = {-0.007230, -0.519183},
    [208] = {-0.359615, 0.058657},
    [209] = {0.294681, 0.601155},
    [210] = {0.226879, -0.255430},
    [211] = {-0.307847, -0.617373},
    [212] = {0.340916, -0.780086},
    [213] = {-0.028277, 0.610455},
    [214] = {-0.365067, 0.323311},
    [215] = {0.001059, -0.270451},
    [216] = {0.304025, 0.047478},
    [217] = {0.297389, 0.383859},
    [218] = {0.288059, 0.262816},
    [219] = {-0.889315, 0.533731},
    [220] = {0.215887, 0.678889},
    [221] = {0.287135, 0.343899},
    [222] = {0.423951, 0.672285},
    [223] = {0.411912, -0.812886},
    [224] = {0.081615, -0.497358},
    [225] = {-0.051963, -0.117891},
    [226] = {-0.062387, 0.331698},
    [227] = {0.020458, -0.734125},
    [228] = {-0.160176, 0.196321},
    [229] = {0.044898, -0.024032},
    [230] = {-0.153162, 0.930951},
    [231] = {-0.015084, 0.233476},
    [232] = {0.395043, 0.645227},
    [233] = {-0.232095, 0.283834},
    [234] = {-0.507699, 0.317122},
    [235] = {-0.606604, -0.227259},
    [236] = {0.526430, -0.408765},
    [237] = {0.304079, 0.135680},
    [238] = {-0.134042, 0.508741},
    [239] = {-0.276770, 0.383958},
    [240] = {-0.298963, -0.233668},
    [241] = {0.171889, 0.697367},
    [242] = {-0.292571, -0.317604},
    [243] = {0.587806, 0.115584},
    [244] = {-0.346690, -0.098320},
    [245] = {0.956701, -0.040982},
    [246] = {0.040838, 0.595304},
    [247] = {0.365201, -0.519547},
    [248] = {-0.397271, -0.090567},
    [249] = {-0.124873, -0.356800},
    [250] = {-0.122144, 0.617725},
    [251] = {0.191266, -0.197764},
    [252] = {-0.178092, 0.503667},
    [253] = {0.103221, 0.547538},
    [254] = {0.019524, 0.621226},
    [255] = {0.663918, -0.573476}
}
 
ib.spread.Const = {
    0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
    0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
    0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
    0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
    0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
    0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
    0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
    0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
    0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
    0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
    0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
    0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
    0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
    0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
    0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
    0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391,
    0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476
}

ib.md5_f = function(x, y, z) return bit.bor(bit.band(x, y), bit.band( - x - 1, z)) end
ib.md5_g = function(x, y, z) return bit.bor(bit.band(x, z), bit.band(y, - z - 1)) end
ib.md5_h = function(x, y, z) return bit.bxor(x, bit.bxor(y, z)) end
ib.md5_i = function(x, y, z) return bit.bxor(y, bit.bor(x, - z - 1)) end
 
ib.spread.md5 = {}
 
function ib.spread.md5.z(f, a, b, c, d, x, s, ac)
    a = bit.band(a + f(b, c, d) + x + ac, 0xffffffff)
    return bit.bor(bit.lshift(bit.band(a, bit.rshift(0xffffffff, s)), s), bit.rshift(a, 32 - s)) + b
end
 
function ib.spread.md5.Fix(a)
    if (a > 2 ^ 31) then
        return a - 2 ^ 32
    end
    return a
end
 
function ib.spread.md5.Transform(A, B, C, D, X)
	local a, b, c, d = A, B, C, D
    a = ib.spread.md5.z(ib.md5_f, a, b, c, d, X[0], 7, ib.spread.Const[1])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    d = ib.spread.md5.z(ib.md5_f, d, a, b, c, X[1], 12, ib.spread.Const[2])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    c = ib.spread.md5.z(ib.md5_f, c, d, a, b, X[2], 17, ib.spread.Const[3])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    b = ib.spread.md5.z(ib.md5_f, b, c, d, a, X[3], 22, ib.spread.Const[4])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    a = ib.spread.md5.z(ib.md5_f, a, b, c, d, X[4], 7, ib.spread.Const[5])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    d = ib.spread.md5.z(ib.md5_f, d, a, b, c, X[5], 12, ib.spread.Const[6])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    c = ib.spread.md5.z(ib.md5_f, c, d, a, b, X[6], 17, ib.spread.Const[7])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    b = ib.spread.md5.z(ib.md5_f, b, c, d, a, X[7], 22, ib.spread.Const[8])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    a = ib.spread.md5.z(ib.md5_f, a, b, c, d, X[8], 7, ib.spread.Const[9])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    d = ib.spread.md5.z(ib.md5_f, d, a, b, c, X[9], 12, ib.spread.Const[10])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    c = ib.spread.md5.z(ib.md5_f, c, d, a, b, X[10], 17, ib.spread.Const[11])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    b = ib.spread.md5.z(ib.md5_f, b, c, d, a, X[11], 22, ib.spread.Const[12])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    a = ib.spread.md5.z(ib.md5_f, a, b, c, d, X[12], 7, ib.spread.Const[13])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    d = ib.spread.md5.z(ib.md5_f, d, a, b, c, X[13], 12, ib.spread.Const[14])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    c = ib.spread.md5.z(ib.md5_f, c, d, a, b, X[14], 17, ib.spread.Const[15])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    b = ib.spread.md5.z(ib.md5_f, b, c, d, a, X[15], 22, ib.spread.Const[16])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     a = ib.spread.md5.z(ib.md5_g, a, b, c, d, X[1], 5, ib.spread.Const[17])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     d = ib.spread.md5.z(ib.md5_g, d, a, b, c, X[6], 9, ib.spread.Const[18])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     c = ib.spread.md5.z(ib.md5_g, c, d, a, b, X[11], 14, ib.spread.Const[19])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     b = ib.spread.md5.z(ib.md5_g, b, c, d, a, X[0], 20, ib.spread.Const[20])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     a = ib.spread.md5.z(ib.md5_g, a, b, c, d, X[5], 5, ib.spread.Const[21])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     d = ib.spread.md5.z(ib.md5_g, d, a, b, c, X[10], 9, ib.spread.Const[22])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     c = ib.spread.md5.z(ib.md5_g, c, d, a, b, X[15], 14, ib.spread.Const[23])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     b = ib.spread.md5.z(ib.md5_g, b, c, d, a, X[4], 20, ib.spread.Const[24])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     a = ib.spread.md5.z(ib.md5_g, a, b, c, d, X[9], 5, ib.spread.Const[25])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     d = ib.spread.md5.z(ib.md5_g, d, a, b, c, X[14], 9, ib.spread.Const[26])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     c = ib.spread.md5.z(ib.md5_g, c, d, a, b, X[3], 14, ib.spread.Const[27])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     b = ib.spread.md5.z(ib.md5_g, b, c, d, a, X[8], 20, ib.spread.Const[28])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     a = ib.spread.md5.z(ib.md5_g, a, b, c, d, X[13], 5, ib.spread.Const[29])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     d = ib.spread.md5.z(ib.md5_g, d, a, b, c, X[2], 9, ib.spread.Const[30])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     c = ib.spread.md5.z(ib.md5_g, c, d, a, b, X[7], 14, ib.spread.Const[31])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     b = ib.spread.md5.z(ib.md5_g, b, c, d, a, X[12], 20, ib.spread.Const[32])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    a = ib.spread.md5.z(ib.md5_h, a, b, c, d, X[5], 4, ib.spread.Const[33])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    d = ib.spread.md5.z(ib.md5_h, d, a, b, c, X[8], 11, ib.spread.Const[34])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    c = ib.spread.md5.z(ib.md5_h, c, d, a, b, X[11], 16, ib.spread.Const[35])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    b = ib.spread.md5.z(ib.md5_h, b, c, d, a, X[14], 23, ib.spread.Const[36])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    a = ib.spread.md5.z(ib.md5_h, a, b, c, d, X[1], 4, ib.spread.Const[37])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    d = ib.spread.md5.z(ib.md5_h, d, a, b, c, X[4], 11, ib.spread.Const[38])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    c = ib.spread.md5.z(ib.md5_h, c, d, a, b, X[7], 16, ib.spread.Const[39])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    b = ib.spread.md5.z(ib.md5_h, b, c, d, a, X[10], 23, ib.spread.Const[40])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    a = ib.spread.md5.z(ib.md5_h, a, b, c, d, X[13], 4, ib.spread.Const[41])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    d = ib.spread.md5.z(ib.md5_h, d, a, b, c, X[0], 11, ib.spread.Const[42])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    c = ib.spread.md5.z(ib.md5_h, c, d, a, b, X[3], 16, ib.spread.Const[43])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    b = ib.spread.md5.z(ib.md5_h, b, c, d, a, X[6], 23, ib.spread.Const[44])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    a = ib.spread.md5.z(ib.md5_h, a, b, c, d, X[9], 4, ib.spread.Const[45])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    d = ib.spread.md5.z(ib.md5_h, d, a, b, c, X[12], 11, ib.spread.Const[46])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    c = ib.spread.md5.z(ib.md5_h, c, d, a, b, X[15], 16, ib.spread.Const[47])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    b = ib.spread.md5.z(ib.md5_h, b, c, d, a, X[2], 23, ib.spread.Const[48])
    a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     a = ib.spread.md5.z(ib.md5_i, a, b, c, d, X[0], 6, ib.spread.Const[49])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     d = ib.spread.md5.z(ib.md5_i, d, a, b, c, X[7], 10, ib.spread.Const[50])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     c = ib.spread.md5.z(ib.md5_i ,c, d, a, b, X[14], 15, ib.spread.Const[51])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     b = ib.spread.md5.z(ib.md5_i, b, c, d, a, X[5], 21, ib.spread.Const[52])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     a = ib.spread.md5.z(ib.md5_i, a, b, c, d, X[12], 6, ib.spread.Const[53])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     d = ib.spread.md5.z(ib.md5_i, d, a, b, c, X[3], 10, ib.spread.Const[54])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     c = ib.spread.md5.z(ib.md5_i, c, d, a, b, X[10], 15, ib.spread.Const[55])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     b = ib.spread.md5.z(ib.md5_i, b, c, d, a, X[1], 21, ib.spread.Const[56])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     a = ib.spread.md5.z(ib.md5_i, a, b, c, d, X[8], 6, ib.spread.Const[57])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     d = ib.spread.md5.z(ib.md5_i, d, a, b, c, X[15], 10, ib.spread.Const[58])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     c = ib.spread.md5.z(ib.md5_i, c, d, a, b, X[6], 15, ib.spread.Const[59])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     b = ib.spread.md5.z(ib.md5_i, b, c, d, a, X[13], 21, ib.spread.Const[60])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     a = ib.spread.md5.z(ib.md5_i, a, b, c, d, X[4], 6, ib.spread.Const[61])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     d = ib.spread.md5.z(ib.md5_i, d, a, b, c, X[11], 10, ib.spread.Const[62])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     c = ib.spread.md5.z(ib.md5_i, c, d, a, b, X[2], 15, ib.spread.Const[63])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
     b = ib.spread.md5.z(ib.md5_i, b, c, d, a, X[9], 21, ib.spread.Const[64])
     a = ib.spread.md5.Fix(a) b = ib.spread.md5.Fix(b) c = ib.spread.md5.Fix(c) d = ib.spread.md5.Fix(d)
    return A + a, B + b, C + c, D + d
end
 
ib.spread.Spread = {
    weapon_smg1 = {0.04362, 0.04362},
    weapon_ar2 = {0.02618, 0.02618},
    weapon_shotgun = {0.08716, 0.08716},
    weapon_pistol = {0.00873, 0.00873}
}
 
function ib.spread.md5.PseudoRandom(number)
    local a, b, c, d = ib.spread.md5.Fix(ib.spread.Const[65]), ib.spread.md5.Fix(ib.spread.Const[66]), ib.spread.md5.Fix(ib.spread.Const[67]), ib.spread.md5.Fix(ib.spread.Const[68])
    local m = {}
    for iter = 0, 15 do
        m[iter] = 0
    end
        m[0] = number
        m[1] = 128
        m[14] = 32
        a, b, c, d = ib.spread.md5.Transform(a, b, c, d, m)
    return bit.rshift(ib.spread.md5.Fix(b), 16) % 256
end
 
ib.R_.Entity.FireBullets = function(pEnt, bul)
    local wep = me:GetActiveWeapon() or nil
    if not global.IsValid(wep) then return end
    local class = wep:GetClass()
    if not bul.Spread or not global.IsValid(wep) or not me:Alive() then
        return ib.R.Entity.FireBullets(pEnt, bul)
    end
    if not ib.spread.Spread[class] or ib.spread.Spread[class] ~= bul.Spread then
        ib.spread.Spread[class] = bul.Spread
    end
    return ib.R.Entity.FireBullets(pEnt, bul)
end

function ib.RemapClamped(val, A, B, C, D)
    if A == B then
        return val >= B and D or C
    end
    local cval = (val - A) / (B - A)
    cval = math.Clamp(cval, 0.0, 1.0)
    return C + (D - C) * cval
end

local function PredictSpread(cmd, ang) -- HUGE FUCKING THANKS TO S0LUM'S NCMD (and data for helping me figure shit out)
	if (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 then return end
    local wep = me:GetActiveWeapon()
	if gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") and me:GetActiveWeapon():IsValid() and me:Alive() and me:Health() > 0 then
		local class = wep:GetClass()
		local cone = ib.spread.Spread[class]
		if not cone then return ang end
		if class == 'weapon_pistol' then
			local ramp = ib.RemapClamped(wep:GetInternalVariable('m_flAccuracyPenalty'), 0, 1.5, 0, 1)
			cone = LerpVector(ramp, Vector(0.00873, 0.00873, 0.00873), Vector(0.05234, 0.05234, 0.05234))
		end
		local seed = ib.spread.md5.PseudoRandom(cm.CommandNumber(cmd))
		local x, y = ib.spread.enginespread[seed][1], ib.spread.enginespread[seed][2]
		local forward, right, up = ang:Forward(), ang:Right(), ang:Up()
		local retvec = forward + (x * cone[1] * right * - 1) + (y * cone[2] * up * - 1)
		local spreadangles =  retvec:Angle()
		spreadangles:Normalize()
    return spreadangles
	end
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
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 1600) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 110) - em.GetVelocity(me) / 50)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 3215) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 110) - em.GetVelocity(me) / 50)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_rpg7") or string.find(string.lower(wep:GetClass()), "m9k_m202") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 2600 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 4500) + me:Ping() / 950) - Vector(0, 0, 25) - em.GetVelocity(me) / 50)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 4000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 4500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 110) - em.GetVelocity(me) / 50)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 4500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 90) - em.GetVelocity(me) / 50)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_ex41") or string.find(string.lower(wep:GetClass()), "m9k_m79gl") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 1100 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2550) + me:Ping() / 950) - Vector(0, 0, 25) - em.GetVelocity(me) / 50)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 4000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2130) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 35) - em.GetVelocity(me) / 50)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 7000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2130) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 13) - em.GetVelocity(me) / 50)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2670) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 6) - em.GetVelocity(me) / 50)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_matador") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 2600 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 6500) + me:Ping() / 950) - Vector(0, 0, 25) - em.GetVelocity(me) / 50)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 4000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 6500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 110) - em.GetVelocity(me) / 50)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 6500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 90) - em.GetVelocity(me) / 50)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_milkormgl") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 1100 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2500) + me:Ping() / 950) - Vector(0, 0, 25) - em.GetVelocity(me) / 50)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 4000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2000) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 43) - em.GetVelocity(me) / 50)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 7000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2460) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 38) - em.GetVelocity(me) / 50)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2580) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 17.5) - em.GetVelocity(me) / 50)
			end
		elseif string.find(string.lower(wep:GetClass()), "m9k_m61_frag") then
			return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 650) + me:Ping() / 950) - Vector(0, 0, 225) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 4) - em.GetVelocity(me) / 50)
		elseif string.find(string.lower(wep:GetClass()), "m9k_harpoon") then
			if vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 1200 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2300) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 20) - em.GetVelocity(me) / 50)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 1750 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 2000) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 8) - em.GetVelocity(me) / 50)
			elseif vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) <= 2000 then
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 1500) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 5) - em.GetVelocity(me) / 50)
			else
				return (em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)) + em.GetVelocity(aimtarget) * ((vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 900) + me:Ping() / 950) + Vector(0, 0, vm.Distance(em.GetPos(aimtarget), em.GetPos(me)) / 3) - em.GetVelocity(me) / 50)
			end
		else
			return AimPos(aimtarget)
		end
	end
	if not gBool("Aim Assist", "Miscellaneous", "Projectile Prediction") then
		return AimPos(aimtarget)
	end
end
--[[ !!FUTURE UPDATE!!
sv_gravity = GetConVar("sv_gravity")
steptime = engine.TickInterval()

ib.tresult = {}

function ib.ProjectilePrediction(ent, projorigin, v0) -- AGAIN, THANK YOU S0LUM GOD DAMN
    local finalpos = Vector(0, 0, 0)
    local velocity = ent:GetAbsVelocity()
    local origin = ent:GetNetworkOrigin()
    local offset = ent:WorldSpaceCenter() - origin
    local onground = ent:IsOnGround()
    local innoclip = ent:GetMoveType() == MOVETYPE_NOCLIP
    local gravity = sv_gravity:GetFloat()
    local ping = LocalPlayer():Ping() / 1000
    local tdata = {
        filter = {ent},
        mask = MASK_PLAYERSOLID,
        mins = ent:OBBMins(),
        maxs = ent:OBBMaxs(),
        output = ib.tresult
    }
    local time = 0
    while time <= 1 do
        velocity.z = (not innoclip and not onground) and velocity.z - gravity * steptime or velocity.z
        local nextpos = origin + (velocity * steptime)
        tdata.start = origin
        tdata.endpos = nextpos - offset
        util.TraceHull(tdata)
        origin = ib.tresult.HitPos + offset
        local dist = (origin - projorigin):Length2D()
        local solvetime = (dist / v0) + ping
        if solvetime <= time then
            finalpos = origin
            break
        end
        time = time + steptime
    end
    if finalpos:IsZero() then return false end
    return finalpos
end
!!FUTURE UPDATE!! ]]--
function ib.GetWeaponBase()
	local wep = me:GetActiveWeapon()
    if not wep.Base then return "" end
    return string.Split(string.lower(wep.Base), "_")[1]
end

function ib.CalculateAntiRecoil()
	if not FixTools() then
		local wep = me:GetActiveWeapon()
		if not wep:IsValid() then return end
		if wep:GetClass() == "weapon_pistol" then
			return angle_zero
		end
		if wep:IsScripted() then
			if ib.GetWeaponBase(wep) ~= "cw" and ib.GetWeaponBase(wep) ~= "fas2" then
				return angle_zero
			end
		end
		return me:GetViewPunchAngles()
	end
end

local function Aimbot(cmd)
	if not gBool("Aim Assist", "Aimbot", "Enabled") or not me:Alive() or me:Health() < 1 or not me:GetActiveWeapon():IsValid() or (me:Team() == TEAM_SPECTATOR and not (gBool("Aim Assist", "Aim Priorities", "Target Spectators") and gBool("Main Menu", "General Utilities", "Spectator Mode"))) then return end
	for k, v in pairs(player.GetAll()) do
		if !v:IsValid() || ((gBool("Main Menu", "Panic Mode", "Enabled") && (gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" || gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Aimbot")) && IsValid(v:GetObserverTarget()) && v:GetObserverTarget() == me) || FixTools() then return end
	end
	GetTarget()
    aa = false
	if gBool("Aim Assist", "Aimbot", "Enabled") && gBool("Aim Assist", "Aimbot", "Auto Stop") && aimtarget && gKey("Aim Assist", "Aimbot", "Toggle Key:") && WeaponCanFire() then
		cmd:SetForwardMove(0)
		cmd:SetSideMove(0)
		cmd:SetUpMove(0)
	end
	if gBool("Aim Assist", "Aimbot", "Enabled") && gBool("Aim Assist", "Aimbot", "Auto Crouch") && aimtarget && gKey("Aim Assist", "Aimbot", "Toggle Key:") && WeaponCanFire() then
		cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
	end
    if (aimtarget && aimtarget:IsValid() && gKey("Aim Assist", "Aimbot", "Toggle Key:") && WeaponCanFire()) then
	local pos = PredictPos(aimtarget)
	local ang = (pos - me:EyePos()):Angle()
	if gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then
		ang = PredictSpread(cmd, ang)
	elseif not gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then
		ang = (pos - me:EyePos()):Angle()
	end
	local wep = me:GetActiveWeapon()
	local ady = math.abs(math.NormalizeAngle(ang.y - fa.y))
	local adp = math.abs(math.NormalizeAngle(ang.p - fa.p))
	local ang = SmoothAim(ang)
	local fov = gInt("Aim Assist", "Aimbot", "Aim FoV Value:")
	if fov == 0 then
		aa = true
		if gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then PredictSpread(cmd, ang) end
		if gBool("Aim Assist", "Miscellaneous", "Remove Weapon Recoil") then ang:Sub(ib.CalculateAntiRecoil(wep)) end
		FixAngle(ang)
		cmd:SetViewAngles(ang)
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
		if gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then PredictSpread(cmd, ang) end
		if gBool("Aim Assist", "Miscellaneous", "Remove Weapon Recoil") then ang:Sub(ib.CalculateAntiRecoil(wep)) end
		FixAngle(ang)
		cmd:SetViewAngles(ang)
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
	if not gBool("Aim Assist", "Triggerbot", "Enabled") or not me:GetActiveWeapon():IsValid() or not me:Alive() or me:Health() < 1 or (me:Team() == TEAM_SPECTATOR and not (gBool("Aim Assist", "Triggerbot", "Target Spectators") and gBool("Main Menu", "General Utilities", "Spectator Mode"))) or not gKey("Aim Assist", "Triggerbot", "Toggle Key:") or cmd:KeyDown(IN_ATTACK) or FixTools() then return end
	local dist = gInt("Aim Assist", "Aim Priorities", "Distance:")
	local vel = gInt("Aim Assist", "Aim Priorities", "Velocity:")
	local maxhealth = gInt("Aim Assist", "Aim Priorities", "Max Player Health:") 
	local trace = me:GetEyeTraceNoCursor()
	local v = trace.Entity
	local hitbox = trace.HitBox
	if (v and global.IsValid(v) and v:Health() > 0 and not v:IsDormant() and me:GetObserverTarget() ~= v and AimAssistPriorities(v)) and TriggerFilter(hitbox) then
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
		if !gBool("Aim Assist", "Aim Priorities", "Target Immune Players") then
			if pm.IsFrozen(v) then return false end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Immune Players") then
			for i = 1, #ib.NetMessages.Buildmode do
				if tobool(v:GetNWBool(ib.NetMessages.Buildmode[i])) then
					return false
				end
			end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Immune Players") then
			for i = 1, #ib.NetMessages.Protected do
				if tobool(v:GetNWBool(ib.NetMessages.Protected[i])) then
					return false
				end
			end
		end
		if !gBool("Aim Assist", "Aim Priorities", "Target Immune Players") then
			if v:HasGodMode() then return false end
			for i = 1, #ib.NetMessages.God do
				if tobool(v:GetNWBool(ib.NetMessages.God[i])) then
					return false
				end
			end
		end
		if v:Team() == TEAM_CONNECTING then
			return false
		end
	end
	if gBool("Aim Assist", "Triggerbot", "Enabled") && gBool("Aim Assist", "Triggerbot", "Auto Stop") && gKey("Aim Assist", "Triggerbot", "Toggle Key:") && triggering && WeaponCanFire() then
		cmd:SetForwardMove(0)
		cmd:SetSideMove(0)
		cmd:SetUpMove(0)
	end
	if gBool("Aim Assist", "Triggerbot", "Enabled") && gBool("Aim Assist", "Triggerbot", "Auto Crouch") && gKey("Aim Assist", "Triggerbot", "Toggle Key:") && triggering && WeaponCanFire() then
		cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
	end
	if (gBool("Aim Assist", "Triggerbot", "Auto Zoom")) then
		cmd:SetButtons(cmd:GetButtons() + IN_ATTACK2)
	end
	if triggering and (cmd:GetButtons() and IN_ATTACK) and not FixTools() then
		local ang = cm.GetViewAngles(cmd)
		if gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then
			ang = PredictSpread(cmd, ang)
		elseif not gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then
			ang = cm.GetViewAngles(cmd)
		end
		local wep = me:GetActiveWeapon()
			if gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then PredictSpread(cmd, ang) end
			if gBool("Aim Assist", "Miscellaneous", "Remove Weapon Recoil") then ang:Sub(ib.CalculateAntiRecoil(wep)) end
		FixAngle(ang)
		cm.SetViewAngles(cmd, ang)
    end
	if WeaponCanFire() then
		cmd:SetButtons(cmd:GetButtons() + IN_ATTACK)
	end
	triggering = true
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
	if !Valid(v) then continue end
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
	for k, v in next, ents.GetAll() do
		if (!Valid(v)) then continue end
		local eyepos = v:EyePos():ToScreen()
		dfov[#dfov + 1] = {math.Dist(x / 2, y / 2, eyepos.x, eyepos.y), v}
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
        oy = (global.CurTime() * gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Yaw Speed:") * 23) % 350, 1
   		elseif right then
        oy = (global.CurTime() * - gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Yaw Speed:") * 23) % 350, 1
		elseif manual then
		oy = (global.CurTime() * - gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Yaw Speed:") * 23) % 350, 1
		else
		oy = (global.CurTime() * gInt("Hack vs. Hack", "Anti-Aim", "Spinbot Yaw Speed:") * 23) % 350, 1
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
	--[[ !!FUTURE UPDATE!!
	elseif (opt == "Fake Angles" && default) then
		if bSendPacket then
		oy = fa.y + 115
		else
		oy = fa.y - 115
		end
	elseif (opt == "Fake Angles" && distadapt) then
		if bSendPacket then
		oy = GetClosestDistance() + 115
		else
		oy = GetClosestDistance() - 115
		end
	elseif (opt == "Fake Angles" && crossadapt) then
		if bSendPacket then
		oy = GetClosestCrosshair() + 115
		else
		oy = GetClosestCrosshair() - 115
		end
	elseif (opt == "Fake Angles" && static) then
		if bSendPacket then
		oy = 115
		else
		oy = - 115
		end
	!!FUTURE UPDATE!! ]]--
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
		if not v:IsValid() then continue end
		if (gBool("Main Menu", "Panic Mode", "Enabled") && (gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" || gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Anti-Aim")) && IsValid(v:GetObserverTarget()) && v:GetObserverTarget() == me then return end
	end
	local wep = pm.GetActiveWeapon(me)
	if ((gBool("Hack vs. Hack", "Anti-Aim", "Disable in Noclip") && em.GetMoveType(me) == MOVETYPE_NOCLIP) || me:Team() == TEAM_SPECTATOR || triggering || (cm.CommandNumber(cmd) == 0 && !ThirdpersonCheck()) || cm.KeyDown(cmd, 1) || gBool("Visuals", "Point of View", "Custom FoV") && ib.FreeRoamCheck() && !ThirdpersonCheck() || me:WaterLevel() > 1 || (input.IsKeyDown(15) && gBool("Hack vs. Hack", "Anti-Aim", "Disable in 'Use' Toggle") && !(me:IsTyping() or gui.IsGameUIVisible() or gui.IsConsoleVisible())) || em.GetMoveType(me) == MOVETYPE_LADDER || aa || !me:Alive() || me:Health() < 1 || !gBool("Hack vs. Hack", "Anti-Aim", "Enabled") || gBool("Aim Assist", "Aimbot", "Enabled") && gInt("Aim Assist", "Aimbot", "Aim Smoothness:") > 0 || gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill") && engine.ActiveGamemode() == "terrortown" && wep:IsValid() && wep:GetClass() == "weapon_zm_carry") then return end
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
		global.bSendPacket = false
	end
		flsend = send
	return true
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
		if ib.propval < 180 then
			oy = fa.y + ib.propval
			ib.propval = ib.propval + 3
		else
			oy = fa.y + 180
		end
		local aaang = Angle(ox, oy, 0)
		cm.SetViewAngles(cmd, aaang)
		FixMovement(cmd, true)
	else
		if ib.propval > 0 then
			ib.propval = 0
			ib.propdelay = CurTime() + 0.5
		end
		if ib.propdelay >= CurTime() then
			ox = - 17
			oy = fa.y
			local aaang = Angle(ox, oy, 0)
			cm.SetViewAngles(cmd, aaang)
			FixMovement(cmd, true)
		else
			ib.propdelay = 0
		end
	end
end

function ib.LaserBullets(cmd)
	if (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 then return end
	if cm.KeyDown(cmd, 1) and not FixTools() then
		local ang = cm.GetViewAngles(cmd)
		if gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then
			ang = PredictSpread(cmd, ang)
		elseif not gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then
			ang = cm.GetViewAngles(cmd)
		end
		local wep = me:GetActiveWeapon()
		if me:GetActiveWeapon():IsValid() and me:Alive() and me:Health() > 0 then
			if gBool("Aim Assist", "Miscellaneous", "Remove Bullet Spread") then PredictSpread(cmd, ang) end
			if gBool("Aim Assist", "Miscellaneous", "Remove Weapon Recoil") then ang:Sub(ib.CalculateAntiRecoil(wep)) end
		FixAngle(ang)
		cm.SetViewAngles(cmd, ang)
		end
    end
end

local function FakeCrouch(cmd)
	if em.GetMoveType(me) == MOVETYPE_NOCLIP or (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 or me:IsFlagSet(1024) then return end
	if gBool("Miscellaneous", "Movement", "Fake Crouch") then
		if me:KeyDown(IN_DUCK) then
			if ib.crouched <= 5 then
				cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
			elseif ib.crouched >= 25 then
				ib.crouched = 0
			end
			ib.crouched = ib.crouched + 1
		else
			if ib.crouched <= 5 then
				cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
			elseif ib.crouched >= 12.5 then
				ib.crouched = 0
			end
			ib.crouched = ib.crouched + 1
		end
	end
end

hook.Add("CalcView", "CalcView", function(me, pos, ang, fov)
	local recoil = {
		angles = ang,
		origin = pos,
		fov = fov
	}
	local calcang = me:EyeAngles() * 1
	local view = {}
		if ib.FreeRoamCheck() and not menuopen and not me:IsTyping() and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() and not (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) and not (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) and (me:Alive() or me:Health() > 0) then
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
		if gBool("Visuals", "Point of View", "Custom FoV") and not ThirdpersonCheck() and not ib.FreeRoamCheck() and (me:Alive() or me:Health() > 0) then
			view.origin = pos
			view.angles = angles
			view.fov = gInt("Visuals", "Point of View", "FoV Value:")
		end
		if (me:Alive() or me:Health() > 0) and not (me:GetMoveType() == 10 and not gBool("Main Menu", "General Utilities", "Spectator Mode")) and me:GetObserverTarget() == nil then
			local wep = me:GetActiveWeapon()
			if IsValid(wep) then
				local wepcalcview = wep.CalcView
					if wepcalcview then
						local wepangle = angle_zero
						recoil.origin, wepangle, recoil.fov = wepcalcview(wep, me, recoil.origin * 1, calcang * 1, recoil.fov)
							if not gBool("Aim Assist", "Miscellaneous", "Remove Weapon Recoil") then
								recoil.angles = wepangle
							end
						end
					end
				if gBool("Aim Assist", "Miscellaneous", "Remove Weapon Recoil") then
					recoil.angles = calcang
				end
			end
		if ThirdpersonCheck() and not ib.FreeRoamCheck() and (me:Alive() or me:Health() > 0) then
			view.angles = GetAngle(fa)
			view.origin = ThirdpersonCheck() and pos + am.Forward(fa) * (gInt("Visuals", "Point of View", "Thirdperson Range:") * - 10)
			view.fov = gInt("Visuals", "Point of View", "Thirdperson FoV Value:")
			return view
		end
		if not ib.FreeRoamCheck() and (me:Alive() or me:Health() > 0) then
			view.angles = GetAngle(fa)
			view.origin = pos
		end
	return view
end)

local function FreeRoam(cmd)
	if (ib.FreeRoamCheck() and not menuopen and not me:IsTyping() and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() and not (IsValid(g_SpawnMenu) && g_SpawnMenu:IsVisible()) and not (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) and (me:Alive() or me:Health() > 0)) then
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
	if me:GetActiveWeapon():IsValid() and me:Alive() and me:Health() > 0 then
		if not gBool("Aim Assist", "Triggerbot", "Enabled") or not gBool("Aim Assist", "Triggerbot", "Smooth Aim") or not gKey("Aim Assist", "Triggerbot", "Toggle Key:") or not triggering or FixTools() then return end
		return .10
	end
end)

hook.Add("ShouldDrawLocalPlayer", "ShouldDrawLocalPlayer", function()
	if not ib.FreeRoamCheck() then return ThirdpersonCheck() end
end)

function ib.AirStuck(cmd)
	if gBool("Miscellaneous", "Movement", "Air Stuck") then
		if gKey("Miscellaneous", "Movement", "Air Stuck Key:") then
			big.SetOutSequenceNumber(big.GetOutSequenceNumber() + gInt("Miscellaneous", "Movement", "Air Stuck Value:"))
		end
	end
end

hook.Add("CreateMove", "CreateMove", function(cmd)
	global.bSendPacket = true
	FakeAngles(cmd)
	FakeLag(cmd)
	AntiAFK(cmd)
	BunnyHop(cmd)
	AutoStrafe(cmd)
	FreeRoam(cmd)
	AutoReload(cmd)
	AntiAim(cmd)
	RapidPrimaryFire(cmd)
	RapidAltFire(cmd)
	FakeCrouch(cmd)
	AirCrouch(cmd)
	PropKill(cmd)
	if cm.CommandNumber(cmd) == 0 then return end
	ib.AirStuck(cmd)
	ib.LaserBullets(cmd)
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

function ib.DrawFinders(v)
	if engine.ActiveGamemode() == "terrortown" then
		local titems = {"weapon_ttt_turtlenade", "weapon_ttt_death_station", "weapon_ttt_tripmine", "weapon_ttt_silencedsniper", "(Disguise)", "spiderman's_swep", "weapon_ttt_trait_defilibrator", "weapon_ttt_xbow", "weapon_ttt_dhook", "weapon_awp", "weapon_ttt_ak47", "weapon_jihadbomb", "weapon_ttt_knife", "weapon_ttt_c4", "weapon_ttt_decoy", "weapon_ttt_flaregun", "weapon_ttt_phammer", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_sipistol", "weapon_ttt_teleport", "weapon_ttt_awp", "weapon_mad_awp", "weapon_real_cs_g3sg1", "weapon_ttt_cvg_g3sg1", "weapon_ttt_healthstation5", "weapon_ttt_sentry", "weapon_ttt_poison_dart", "weapon_ttt_trait_defibrillator", "weapon_ttt_tmp_s"}
		if table.HasValue(titems, v:GetClass()) then
			pos = v:GetPos()
			pos = pos:ToScreen()
			draw.DrawText(v:GetPrintName(), "MiscFont", pos.x, pos.y, Color(255,75,75), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	elseif engine.ActiveGamemode() == "murder" then
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
end

function ib.ShowEntities(v)
	if table.HasValue(drawnents, v:GetClass()) and v:IsValid() and v:GetPos():Distance(me:GetPos()) > 40 then
		local pos = em.GetPos(v) + Vector(0, 0, 0)
		local pos2 = pos + Vector(0, 0, 0)
		local pos = vm.ToScreen(pos)
		local pos2 = vm.ToScreen(pos2)
		local min, max = v:WorldSpaceAABB()
		local origin = v:GetPos()
		local textpos = 0
		if gBool("Visuals", "Miscellaneous", "Entity Name") then
			textpos = textpos + 1
			draw.SimpleText(v:GetClass(), "MiscFont", pos.x, pos.y + textpos, Color(255, 255, 255), 1)
			textpos = textpos + 9
		end
		if (gBool("Visuals", "Wallhack", "Distance")) then
			textpos = textpos + 1
			draw.SimpleText("Distance: "..math.Round(v:GetPos():Distance(me:GetPos()) / 40), "VisualsFont", pos.x, pos.y + textpos, textcol, 1, 0)
			textpos = textpos + 9
		end
		if (gBool("Visuals", "Wallhack", "Velocity")) then
			textpos = textpos + 1
			draw.SimpleText("Velocity: "..math.Round(v:GetVelocity():Length()), "VisualsFont", pos.x, pos.y + textpos, textcol, 1, 0)
			textpos = textpos + 9
		end
		if (gBool("Visuals", "Miscellaneous", "Entity Glow")) then
			halo.Add({v}, Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b), .55, .55, 5, true, true)
		end
		if gBool("Visuals", "Miscellaneous", "Entity Box") then
			cam.Start3D()
				render.DrawWireframeBox(origin, Angle(0, 0, 0), min - origin, max - origin, Color(miscvisualscol.r, miscvisualscol.g, miscvisualscol.b), true) 
			cam.End3D()
		end
	end
end

function ib.WitnessFinder()
	local cap = math.cos(math.rad(45))
	local offset = Vector(0, 0, 32)
	local trace = {}
	local witnesscolor = Color(0, 0, 0)
	if (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 or (v == me and not em.IsValid(v)) then return end
	local time = os.time() - 1
	local witnesses = 0
	local beingwitnessed = true
	if time < os.time() then
		time = os.time() + .5
		witnesses = 0
		beingwitnessed = false
		for k, v in pairs(player.GetAll()) do
			if v:IsValid() and v != me then
				trace.start = me:EyePos() + offset
				trace.endpos = v:EyePos() + offset
				trace.filter = {v, me}
				traceRes = util.TraceLine(trace)
				if !traceRes.Hit then
					if (v:EyeAngles():Forward():Dot((me:EyePos() - v:EyePos())) > cap) then
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
	draw.SimpleText(witnesses.." Player(s) can see you.", "MiscFont3", (ScrW() / 2) - 65, 42, Color(menutextcol.r, menutextcol.g, menutextcol.b), 4, 1, 1, Color(0, 0, 0))
	surface.SetDrawColor(witnesscolor)
	surface.DrawRect((ScrW() / 2) - 73, 55, 152, 5)
end

function ib.SnapLines()
	if me:Alive() or em.Health(me) > 0 then
		local col = Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:"))
		local pos = vm.ToScreen(em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)))
		surface.SetDrawColor(col)
		surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y)
		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(pos.x - 2, pos.y - 2, 5, 5)
		surface.SetDrawColor(col)
		surface.DrawRect(pos.x - 1, pos.y - 1, 3, 3)
	end
end

function ib.PropKillCircle()
	local wep = pm.GetActiveWeapon(me)
	if engine.ActiveGamemode() == "terrortown" && wep:IsValid() && wep:GetClass() == "weapon_zm_carry" then
		if (me:Team() == TEAM_SPECTATOR and not gBool("Main Menu", "General Utilities", "Spectator Mode")) or not me:Alive() or me:Health() < 1 then return end
		if ib.propval >= 180 then
			surface.DrawCircle(ScrW() / 2, ScrH() / 1.8, 80 + me:GetVelocity():Length() / 4, Color(255, 0, 0))
		else
			surface.DrawCircle(ScrW() / 2, ScrH() / 1.8, 80 + me:GetVelocity():Length() / 4, Color(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:")))
		end
	end
end

function ib.FovCircle()
	if (me:Team() == TEAM_SPECTATOR and not (gBool("Aim Assist", "Aim Priorities", "Target Spectators") and gBool("Main Menu", "General Utilities", "Spectator Mode"))) or not me:Alive() or me:Health() < 1 then return end
	local center = Vector(ScrW() / 2, ScrH() / 2, 0)
	local scale = Vector(((gInt("Aim Assist", "Aimbot", "Aim FoV Value:")) * 9.5), ((gInt("Aim Assist", "Aimbot", "Aim FoV Value:")) * 9.5), 0)
	local segmentdist = 360 / (2 * math.pi * math.max(scale.x, scale.y) / 2)
		surface.SetDrawColor(crosshaircol.r, crosshaircol.g, crosshaircol.b, gInt("Adjustments", "Crosshair Color", "Opacity:"))	
	for a = 0, 360 - segmentdist, segmentdist do
		surface.DrawLine(center.x + math.cos(math.rad(a)) * scale.x, center.y - math.sin(math.rad(a)) * scale.y, center.x + math.cos(math.rad(a + segmentdist)) * scale.x, center.y - math.sin(math.rad(a + segmentdist)) * scale.y)
	end
end

hook.Add("MiscPaint", "MiscPaint", function()
	if gBool("Visuals", "Wallhack", "Enabled") then
		for k, v in next, player.GetAll() do
		if not em.IsValid(v) or ((!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) or em.Health(v) < 0.1 or (em.IsDormant(v) and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Players" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or (pm.Team(v) == TEAM_SPECTATOR and not gBool("Visuals", "Miscellaneous", "Show Spectators"))) or not WallhackFilter(v) or not EnemyWallhackFilter(v) then continue end
			Visuals(v)
		end
	end
	if gBool("Visuals", "Wallhack", "Enabled") and gBool("Visuals", "Miscellaneous", "Show NPCs") then
		ShowNPCs()
	end
	for k, v in next, ents.GetAll() do
		if not v:IsValid() then continue end
		if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Traitor Finder") or gBool("Main Menu", "Murder Utilities", "Murderer Finder") then
			ib.DrawFinders(v)
		end
		if (v:IsDormant() and (gOption("Visuals", "Miscellaneous", "Dormant Check:") == "Entities" or gOption("Visuals", "Miscellaneous", "Dormant Check:") == "All")) or not OnScreen(v) or not WallhackFilter(v) or (!(ThirdpersonCheck() and gOption("Visuals", "Wallhack", "Visibility:") == "Clientside") and v == me) or (gOption("Visuals", "Wallhack", "Visibility:") == "Global" and v == me) then continue end
		if gBool("Visuals", "Wallhack", "Enabled") and gBool("Visuals", "Miscellaneous", "Show Entities") then
			ib.ShowEntities(v)
		end
	end
	if gInt("Adjustments", "Others", "BG Darkness:") > 0 and menuopen then
		surface.SetDrawColor(0, 0, 0, gInt("Adjustments", "Others", "BG Darkness:") * 10)
		surface.DrawRect(0, 0, ScrW(), ScrH())
	end
	if gBool("Main Menu", "Priority List", "Enabled") and menuopen then
		PlayerList()
	end
	if v == me and not em.IsValid(v) then return end
	if gBool("Miscellaneous", "Panels", "Spectators Window") then
		Spectator()
	end
	if gBool("Miscellaneous", "Panels", "Radar Window") then
		Radar()
	end
	if gBool("Miscellaneous", "Panels", "Debug Info") then
		StatusTitle()
		Status()
	end
	if gBool("Miscellaneous", "Panels", "Players List") then
		PlayersTitle()
		Players()
	end
	if gOption("Miscellaneous", "GUI Settings", "Crosshair:") ~= "Off" then
		Crosshair()
	end
	if (me:Team() == TEAM_SPECTATOR and not (gBool("Aim Assist", "Aim Priorities", "Target Spectators") and gBool("Main Menu", "General Utilities", "Spectator Mode"))) or not me:Alive() or me:Health() < 1 or (gBool("Aim Assist", "Triggerbot", "Enabled") and not gBool("Aim Assist", "Aimbot", "Enabled")) then return end
	if gBool("Miscellaneous", "GUI Settings", "Witness Finder") then
		ib.WitnessFinder()
	end
	if gBool("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill") && gKey("Main Menu", "Trouble in Terrorist Town Utilities", "Prop Kill Key:") then
		ib.PropKillCircle()
	end
	if gBool("Aim Assist", "Aimbot", "Enabled") and gBool("Aim Assist", "Miscellaneous", "Show FoV Circle") then
		ib.FovCircle()
	end
	for k, v in pairs(player.GetAll()) do
		if not v:IsValid() or (gBool("Main Menu", "Panic Mode", "Enabled") && (gOption("Main Menu", "Panic Mode", "Mode:") == "Disable All" || gOption("Main Menu", "Panic Mode", "Mode:") == "Disable Aimbot")) && IsValid(v:GetObserverTarget()) && v:GetObserverTarget() == me then return end
	end
	if (aimtarget and em.IsValid(aimtarget) and not FixTools() and gBool("Aim Assist", "Miscellaneous", "Snap Lines") and (gBool("Aim Assist", "Aimbot", "Enabled"))) then
		ib.SnapLines()
	end
end)

hook.Add("PreDrawOpaqueRenderables", "PreDrawOpaqueRenderables", function()
	if gBool("Hack vs. Hack", "Resolver", "Enabled") then
		for k, v in next, player.GetAll() do
			if not v:IsValid() or v == me or (gBool("Main Menu", "Priority List", "Enabled") and table.HasValue(ignorelist, v:UniqueID())) then continue end
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
	local cheatcallouts = {"hac", "h4c", "h@c", "hak", "h4k", "h@k", "hck", "hax", "h4x", "h@x", "hask", "h4sk", "h@sk", "ha$k", "cheat", "ch3at", "che4t", "che@t", "chet", "ch3t", "wall", "w4ll", "w@ll", "wa11", "w@11", "w411", "aim", "a1m", "4im", "@im", "trigg", "tr1gg", "spin", "sp1n", "bot", "b0t", "esp", "3sp", "e$p", "script", "skript", "$cript", "$kript", "scr1pt", "skr1pt", "$cr1pt", "$kr1pt", "skid", "sk1d", "$kid", "$k1d", "bunny", "buny", "h0p", "hop", "kick", "k1ck", "kik", "k1k", "ban", "b4n", "b@n", "fake", "f4ke", "f@ke", "fak3", "f4k3", "f@k3",}
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
	if global.game.SinglePlayer() then
		chat.AddText(Color(255, 255, 0), "Attention! You may encounter issues when using IdiotBox in Singleplayer mode.")
		chat.AddText(Color(255, 255, 0), "We recommend initializing in a Multiplayer local game/ public server.")
		surface.PlaySound("buttons/lightswitch2.wav")
	end
end)

timer.Simple(0.2, function()
	if ScrW() ~= 1920 or ScrH() ~= 1080 then
		chat.AddText(Color(255, 255, 0), "Attention! We are working on adaptive menu scaling. You may encounter visual bugs when toggling the IdiotBox menu.")
		chat.AddText(Color(255, 255, 0), "We recommend setting your game resolution to 1920x1080 for the best user experience.")
		surface.PlaySound("buttons/lightswitch2.wav")
	end
end)

timer.Simple(0.1, function()
	chat.AddText(Color(0, 255, 0), "Successfully initialized IdiotBox!")
	surface.PlaySound("buttons/bell1.wav")
end)

timer.Simple(0.1, function()
	if not file.Exists(folder.."/version.txt", "DATA") then
		file.Write(folder.."/version.txt", version)
	else
		if file.Read(folder.."/version.txt", "DATA") ~= version then
			ib.Changelog()
			chat.AddText(Color(0, 255, 0), "IdiotBox has been updated from v"..file.Read(folder.."/version.txt", "DATA").." to v"..version.."! Changelog is printed in the console.")
			surface.PlaySound("buttons/lightswitch2.wav")
			file.Write(folder.."/version.txt", version)
		end
	end
end)

Popup(5.3, "Welcome, "..me:Nick()..". Press 'Insert', 'F11' or 'Home' to toggle.", Color(0, 255, 0))
surface.PlaySound("buttons/lightswitch2.wav")

if ac != true then 
	timer.Create("ChatPrint", 5.7, 1, function() Popup(5.3, "No anti-cheats have been detected!", Color(0, 255, 0)) end)
	timer.Create("PlaySound", 5.7, 1, function() surface.PlaySound("buttons/lightswitch2.wav") end)
end

for _, anticheatName in ipairs(ib.anticheatNames) do
	if global[anticheatName] then
		timer.Create("ChatPrint", 5.7, 1, function() Popup(5.3, "An anti-cheat has been detected. Use with caution to avoid getting banned!", Color(255, 0, 0)) end)
		timer.Create("PlaySound", 5.7, 1, function() surface.PlaySound("npc/scanner/combat_scan1.wav") end)
			ac = true
		return
	end
end

--[[

||-------------NOTES-------------||

Big thanks to everyone who still supports me to this day. Without you, this wouldn't be a thing;
All of my credits go out to you and the ones who helped me with the development of IdiotBox. <3

||------------CREDITS------------||

Pinged
data
s0lum
lenn
leme
scottpott8
Vectivus
ASTEYA
uÚcka
cal1nxd
XVcaligo (PerSix)
naxut
papertek (JohnRG)
Outcome (paradox)
Mr. Squid
OhhStyle
SDunken

]]--

  //-----Script Ends Here----//
 //-------------------------//
//-------------------------//
