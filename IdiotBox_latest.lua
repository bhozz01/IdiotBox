//----IdiotBox 5.7------//
//-------By CodeX-------//
//-------VVVVVVVV-------//

local idiot			= table.Copy(_G) or {}
local _Hooks		= {}
local ply			= LocalPlayer()

do
	if (idiot.game.SinglePlayer()) then
		surface.PlaySound("buttons/button11.wav")
		idiot.sound.PlayURL("https://puu.sh/r4iyy/09758e5394.wav", "mono", function(station)
		if (idiot.IsValid(station)) then
			station:Play()
		end
	end)
		chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Not going to load in Single Player!") 
		return
	end
	if (_G.QAC or _G.CAC) then 
		surface.PlaySound("ambient/alarms/klaxon1.wav")
		chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n[", "IdiotBox", "] ", Color( 255, 0, 0 ), "An anti-cheat was detected. Disconnecting to prevent being banned!")
		ply:ConCommand("disconnect") 
		return
		end
	if (_G.Loaded) then
		surface.PlaySound("npc/crow/alert2.wav")
		chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Already loaded!")
		return
	end

	_G.Loaded = true 
end

chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Loading...")
surface.PlaySound("buttons/bell1.wav")
idiot.sound.PlayURL("https://puu.sh/r4auX/9f8bf19eda.wav", "mono", function(station) 
		if (idiot.IsValid(station)) then
			station:Play()
		end
		end)

local missingpng 					   = file.Read("materials/missing256.png", "GAME")
local paste_antiscreengrab 			   = "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"
local paste_antiscreengrab2 		   = "iVBORw0KGgoAAAANSUhEUgAAAAcAAAAECAIAAADNpLIqAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYSURBVBhXY2BgYmBmYGFgZEAFlIkyMAAACDAAKdIBq3cAAAAASUVORK5CYII="
render.Capture = function() return paste_antiscreengrab end
render.Capture = function() return paste_antiscreengrab end
render.Capture = function() return paste_antiscreengrab end  
render.Capture = function() return paste_antiscreengrab2 end 
render.Capture = function() return paste_antiscreengrab2 end
render.Capture = function() return paste_antiscreengrab2 end
render.Capture = function() return chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Someone tried to Screengrab you! Sucessfully blocked!")
end

local oldRead = file.Read
function file.Read( fn, path ) 
if string.find(fn, "javelin*") then
	idiot.surface.PlaySound("buttons/lightswitch2.wav")
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Someone tried to steal a LUA file from you! Sucessfully blocked!")
else
    return oldRead( fn, path )
end
end

local type = type
local next = next

local IdiotBox = IdiotBox or {}

local function Copy(tt, lt)
	local copy = {}
	if lt then
		if type(tt) == "table" then
			for k,v in next, tt do
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
		for k,v in next, tt do
			copy[k] = Copy(k, v)
		end
	end
	return copy
end

local FindMetaTable = FindMetaTable
local em = FindMetaTable("Entity")
local pm = FindMetaTable("Player")
local cm = FindMetaTable("CUserCmd")
local wm = FindMetaTable("Weapon")
local am = FindMetaTable("Angle")
local vm = FindMetaTable("Vector")
local cn = FindMetaTable("ConVar")
local im =  FindMetaTable("IMaterial")
local Vector = Vector
local Angle = Angle
local render = Copy(render)
local cam = Copy(cam)
local surface = Copy(surface)
local vgui = Copy(vgui)
local input = Copy(input)
local player = Copy(player)
local gui = Copy(gui)
local math = Copy(math)
local file = Copy(file)
local util = Copy(util)
local Material = Material
local CreateMaterial = CreateMaterial
local Color = Color
local require = require
local unpack = unpack
local IsValid = IsValid
local ScrW, ScrH = ScrW, ScrH
local LocalPlayer = LocalPlayer
local me = LocalPlayer()
local _G = _G
me:ConCommand("cl_interp 0.066; cl_interp_ratio 2; cl_updaterate 200; cl_cmdrate 200");
IdiotBox.pGetAll = player.GetAll
IdiotBox.eGetAll = ents.GetAll
bSendPacket = true
require("bsendpacket")
require("fhook")
require("dickwrap")
require("aaa")
require("ChatClear")

//.ChangeName = _fhook_changename
IdiotBox.Predict = dickwrap.Predict

//_G._fhook_changename = nil
_G.dickwrap.Predict = nil

surface.CreateFont( "ESPFont", {
	font = "Calibri",
	size = 16,
	weight = 500,
	blursize = 0.1,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = true,
} )

surface.CreateFont("MenuFont", {
	font = "Calibri",
	size = 18,
	antialias = true,
	outline  = true,
})

surface.CreateFont("MiscFont", {
	font = "Calibri",
	size = 18,
	antialias = false,
	outline  = true,
})

local badcmds = {
"__ac",
"__imacheater",
"gm_possess",
"achievementRefresh",
"__uc_",
"_____b__c",
"___m",
"sc",
"bg",
"bm",
"kickme",
"gw_iamacheater",
"imafaggot",
"birdcage_browse",
"reportmod",
"_fuckme",
"st_openmenu",
"_NOPENOPE",
"__ping",
"ar_check",
"GForceRecoil",
"~__ac_auth",
"blade_client_check",
"blade_client_detected_message",
"disconnect",
"exit",
"retry",
"kill",
"-voicerecord",
"+voicerecord",
"dac_imcheating",
"dac_pleasebanme",
"_hz_perp_bans_2hz1",
"rdm",
}
 
local old_rcc = RunConsoleCommand;
function RunConsoleCommand(cmd,...)
        if !table.HasValue(badcmds,cmd) then
                return old_rcc(cmd,...)
        else
                idiot.surface.PlaySound("buttons/lightswitch2.wav")
				chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Possible bad command blocked by IdiotBox.")
                return
        end
end

function idiot.AddHook(event_name, func)
	local name = idiot.RandomString()

	hook.Add(event_name, name, func)

	if not (_Hooks[event_name]) then
		_Hooks[event_name] = {}
	end

	_Hooks[event_name][name] = func
end

function idiot.RandomString()
	local len = idiot.math.random(15, 30)
	local str = ""

	for i = 1, len do
		str = str .. idiot.string.char(idiot.math.random(32, 126))
	end

	return str
end

GAMEMODE["storedFuncs"] = GAMEMODE["storedFuncs"] || {};
GAMEMODE["addedHooks"] = GAMEMODE["addedHooks"] || {};
GAMEMODE["AddHook"] = function(self, type, name, func)
	self["addedHooks"][type] = self["addedHooks"][type] || {};
	self["addedHooks"][type][name] = func;
	self["storedFuncs"][type] = self["storedFuncs"][type] || function() end;
	self[type] = function(self, ...)
	self["storedFuncs"][type](self, ...);
	for k,v in next, self["addedHooks"][type] do
		local args = {v(...)};
		if(#args == 0) then continue; end
		return(unpack(args));
		end
	end
end

GAMEMODE["RemoveHook"] = function(self, type, name)
	if(!self["addedHooks"][type]) then return; end
	self["addedHooks"][type][name] = nil;
end

GAMEMODE["RemoveDetour"] = function(self, type)
	if(!self["storedFuncs"][type]) then return; end
	self[type] = self["storedFuncs"][type];
end

function GAMEMODE:Detour(hType)
    if(not self.oldFunctions) then
        self.oldFunctions = {}
    end
    self.oldFunctions[hType] = self[hType] or function() end

    self[hType] = function(self, ...)
        local originalRet = {self.oldFunctions[hType](self, ...)}

        for k,v in next, self.addedHooks[hType] do
            local ret = {v(...)}
            if(#ret ~= 0) then
                return(unpack(ret))
            end
        end

        return(unpack(originalRet))
    end
end

function GAMEMODE:AddHook(hType, name, func)
    if(not self.addedHooks) then
        self.addedHooks = {}
    end
    if(not self.addedHooks[hType]) then
        self.addedHooks[hType] = {}
        self:Detour(hType)
    end
    self.addedHooks[hType][name] = func
end

function GAMEMODE:RemoveHook(hType, name)
    if(not self.addedHooks or not self.addedHooks[hType]) then
        return
    end
    self.addedHooks[hType][name] = nil
end

local options = {
        ["Aimbot"] = {
                {
					{"Aimbot", 20, 20, 350, 180, 120},
					{"Enabled", "Checkbox", false, 0},
					{"Aim-Key:", "Selection", "None", {"None", "Scroll-Wheel Click", "Left 'ALT' Key", "The 'E' Key", "The 'F' Key"}, 150},
					{"Silent", "Checkbox", false, 0},
					{"pSilent", "Checkbox", false, 0},
					{"Auto Fire", "Checkbox", false, 0},
					{"Target Lock", "Checkbox", false, 0},
                },
                {
					{"Aim Options", 15, 220, 350, 240, 160},
					{"Priority", "Selection", "Distance", {"Random", "Distance", "Health"}, 150 },
					{"Ignore Head", "Checkbox", false, 0},
					{"Ignore Team", "Checkbox", false, 0},
					{"Ignore Friends", "Checkbox", false, 0},
					{"Ignore Bots", "Checkbox", false, 0},
					{"Ignore Admins", "Checkbox", false, 0},
					{"Ignore Vehicles", "Checkbox", false, 0},
					{"Ignore Noclip", "Checkbox", false, 0},
					{"Disable in Noclip", "Checkbox", false, 0},
                },
                {
					{"More...", 380, 20, 350, 240, 120},
					{"No Recoil", "Checkbox", false, 0},
					{"No Spread", "Checkbox", false, 0},
					{"Snap Lines", "Checkbox", false, 0},
					{"Bullet Time", "Checkbox", false, 0},
					{"Auto Wall", "Checkbox", false, 0},
					{"Anti-AFK", "Checkbox", false, 0},
					{"Fake Lag", "Checkbox", false, 0},
					{"Lag Choke", "Slider", 0, 50, 150},
					{"Lag Send", "Slider", 0, 14, 150},
                },
                {
					{"Anti-Aim", 380, 280, 350, 170, 140},
					{"Enabled", "Checkbox", false, 0},
					{"Y-Axis", "Selection", "Static", {"Static", "Static-Inverted", "Jitter", "FakeBackwards", "FakeBackwards-Jitter", "Sideways", "Fake-Sideways", "SideSwitch", "Wiggle", "Spinbot", "Fake-Angles #1", "Fake-Angles #2"}, 135},
					{"X-Axis", "Selection", "Down", {"Down", "Up", "Fake-Down", "Jitter", "Fake-Angles"}, 85},
					{"Spinbot Direction", "Selection", "Left", {"Left", "Right"}, 85},
					{"Spinbot Speed", "Slider", 200, 800, 88},
					{"Air Duck", "Checkbox", false, 0},
                },
        },
        ["ESP"] = {
                {
					{"ESP", 20, 20, 350, 450, 220},
					{"Enabled", "Checkbox", false, 54},
					{"Box", "Checkbox", false, 54},
					{"Box Type", "Selection", "2D Box", {"2D Box", "3D Box"}, 70},
					{"Name", "Checkbox", false, 54},
					{"Healthbar", "Checkbox", false, 54},
					{"Health Value", "Checkbox", false, 54},
					{"Weapon", "Checkbox", false, 54},
					{"Rank", "Checkbox", false, 54},
					{"Ping", "Checkbox", false, 54},
					{"Money", "Checkbox", false, 54},
					{"Entities", "Checkbox", false, 54},
					{"Skeleton", "Checkbox", false, 54},
					{"Health Skeleton", "Checkbox", false, 54},
					{"XQZ", "Checkbox", false, 54},
					{"Chams", "Checkbox", false, 54},
					{"Transparent Chams", "Checkbox", false, 54},
					{"Traitor Finder", "Checkbox", false, 54},
                },
                {
					{"Misc", 380, 20, 350, 360, 220},
					{"Chat Spam", "Checkbox", false, 74},
					{"Spam Type", "Selection", "IdiotBox", {"IdiotBox", "Clear Chat", "DarkRP Clear", "Offensive", "Insult", "Message", "Shoutout", "Killstreak", "Drop Money"}, 88},
					{"Name Stealer", "Checkbox", false, 74},
					{"Steal Type", "Selection", "Normal", {"Normal", "DarkRP"}, 88},
					{"Mirror", "Checkbox", false, 74},
					{"Emotes", "Checkbox", false, 74},
					{"Emote Type", "Selection", "Laugh", {"Dance", "Sexy", "Wave", "Robot", "Bow", "Cheer", "Laugh", "Zombie", "Agree", "Disagree", "Forward", "Back", "Salute", "Wave", "Pose", "Halt", "Group"}, 88 },
					{"Auto-Strafing BHop", "Checkbox", false, 74},
					{"Spectators", "Checkbox", false, 74},
					{"Radar", "Checkbox", false, 74},
					{"Team Colors", "Checkbox", false, 74},
					{"Thirdperson", "Checkbox", false, 74},
					{"Thirdperson Distance", "Slider", 9, 100, 88},
                },
        },
        ["More..."] = {
                {
					{"More...", 20, 20, 250, 240, 130},
					{"Custom Stats", "Checkbox", false, 54},
					{"Crosshair", "Checkbox", false, 54},
					{"Crosshair Type", "Selection", "Square", {"Square", "Cross", "Aimware", "Box", "Circle", "Dot", "GTA IV"}, 76},
					{"No Sky", "Checkbox", false, 54},
					{"Fullbright", "Checkbox", false, 54},
					{"Rapid Fire", "Checkbox", false, 54},
					{"Flashlight Spam", "Checkbox", false, 54},
					{"Kill Spam", "Checkbox", false, 54},
					{"Kill Spam Type", "Selection", "Normal", {"Normal", "HvH"}, 68},
                },
				{
					{"Viewmodel", 290, 20, 205, 150, 100},
					{"Wireframe", "Checkbox", false, 54},
					{"No Hands", "Checkbox", false, 54},
					{"Red", "Slider", 0, 255, 75},
					{"Green", "Slider", 255, 255, 75},
					{"Blue", "Slider", 255, 255, 75},
                },
				{
                	{"AutoReload", 500, 20, 240, 80, 130},
                	{"Enabled", "Checkbox", false, 54},
                	{"AutoReload at", "Slider", 1, 99, 75},
                },
				{
                	{"Chat", 500, 110, 240, 80, 100},
                	{"Death Notify", "Checkbox", false, 54},
					{"Copy Messages", "Checkbox", false, 54},
                },
				{
                	{"Custom FoV", 500, 205, 200, 75, 25},
                	{"Enabled", "Checkbox", false, 54},
					{"FoV", "Slider", 90, 175, 88},
                },
				 {
                	{"Auto-Response", 290, 185, 200, 70, 25},
                	{"Enabled", "Checkbox", false, 40},
					{"Say                    as Response", "Selection", "shut up", {"shut up", "ok", "who", "nobod...", "where", "XD sto...", "what", "yea", "Random"}, 55},
          		},
				{
					{"Change Log - Update 5.7", 30, 290, 750, 140, 130},
					{"- New Anti-Aim - Beta", "Checkbox", false, 9999},
					{"- Classic HL2 Stats Show", "Checkbox", false, 9999},
					{"- Bigger Menu", "Checkbox", false, 9999},
					{"- New Titles", "Checkbox", false, 9999},
					{"- Small Function Changes", "Checkbox", false, 9999},
				},
        },
		["Settings"] = {
                {
					{"Menu Color", 45, 20, 250, 105, 130},
					{"Red", "Slider", 0, 255, 88},
					{"Green", "Slider", 255, 255, 88},
					{"Blue", "Slider", 75, 255, 88},
				},
				{
					{"Team ESP Color", 45, 270, 250, 105, 130},
					{"Red", "Slider", 255, 255, 88},
					{"Green", "Slider", 255, 255, 88},
					{"Blue", "Slider", 0, 255, 88},
                },
				{
					{"Enemy ESP Color", 315, 20, 205, 105, 100},
					{"Red", "Slider", 255, 255, 75},
					{"Green", "Slider", 255, 255, 75},
					{"Blue", "Slider", 0, 255, 75},
                },
				{
					{"Entities ESP Color", 45, 145, 250, 105, 130},
					{"Red", "Slider", 149, 255, 88},
					{"Green", "Slider", 98, 255, 88},
					{"Blue", "Slider", 0, 255, 88},
                },
				{
					{"Team Chams Color", 315, 145, 205, 105, 100},
					{"Red", "Slider", 140, 255, 75},
					{"Green", "Slider", 255, 255, 75},
					{"Blue", "Slider", 0, 255, 75},
                },
				{
					{"Enemy Chams Color", 315, 270, 205, 105, 100},
					{"Red", "Slider", 0, 255, 75},
					{"Green", "Slider", 165, 255, 75},
					{"Blue", "Slider", 0, 255, 75},
                },
				{
					{"Crosshair Color", 540, 20, 255, 105, 130},
					{"Red", "Slider", 0, 255, 88},
					{"Green", "Slider", 255, 255, 88},
					{"Blue", "Slider", 75, 255, 88},
                },
				{
					{"Positions", 540, 145, 255, 130, 130},
					{"Status X", "Slider", 12, 1000, 88},
					{"Status Y", "Slider", 35, 1000, 88},
					{"Window X", "Slider", 942, 1000, 88},
					{"Window Y", "Slider", 12, 1000, 88},
                },
				{
					{"Skeleton ESP Color", 300, 390, 205, 105, 100},
					{"Red", "Slider", 255, 255, 88},
					{"Green", "Slider", 255, 255, 88},
					{"Blue", "Slider", 0, 255, 88},
                },
				{
					{"Filter", 540, 295, 255, 80, 130},
					{"ESP", "Checkbox", false, 54},
					{"Distance", "Slider", 0, 5000, 88},
                },
          
        },
}

local order = {
	"Aimbot",
	"ESP",
	"More...",
	"Settings",
}

local function updatevar( men, sub, lookup, new )
	for aa,aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] ~= sub) then continue end
				if(val[1] == lookup) then
					val[3] = new
			end
		end
	end
end

local function loadconfig()
	if(not file.Exists("IdiotBox_realbot.txt", "DATA")) then return end
	local tab = util.JSONToTable( file.Read("IdiotBox_realbot.txt", "DATA") )
	local cursub
	for k,v in next, tab do
			if(not options[k]) then continue end
			for men, subtab in next, v do
					for key, val in next, subtab do
							if(key == 1) then cursub = val[1] continue end
							updatevar(k, cursub, val[1], val[3])
					end
			end
	end
end

local function loadconfig2()
	if(not file.Exists("IdiotBox_ragebot.txt", "DATA")) then return end
	local tab = util.JSONToTable( file.Read("IdiotBox_ragebot.txt", "DATA") )
	local cursub
	for k,v in next, tab do
			if(not options[k]) then continue end
			for men, subtab in next, v do
					for key, val in next, subtab do
							if(key == 1) then cursub = val[1] continue end
							updatevar(k, cursub, val[1], val[3])
					end
			end
	end
end

local function gBool(men, sub, lookup)
	if(not options[men]) then return end
	for aa,aaa in next, options[men] do
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
	for aa,aaa in next, options[men] do
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
	for aa,aaa in next, options[men] do
			for key, val in next, aaa do
					if(aaa[1][1] ~= sub) then continue end
					if(val[1] == lookup) then
							return val[3]
					end
			end
	end
	return 0
end

local function saveconfig()
	file.Write("IdiotBox_realbot.txt", util.TableToJSON(options))
end

local function saveconfig2()
	file.Write("IdiotBox_ragebot.txt", util.TableToJSON(options))
end

local mousedown
local candoslider
local drawlast

local visible = {}

for k,v in next, order do
	visible[v] = false
end

local titles = {
	"The #1 Choice for GMod Cheats",
	"Best Quality Copy-Paste",
	"Credits to Pasteware and Liquid",
	"By CodeX & More",
	"Make Sure you don't miss ANY of our updates! Join our Official Group Now!",
	}

render.Capture = function( ... )
    print( "Blocked render.Capture() Call Stack Entry" )
    return util.Base64Encode( util.CRC( "Field Spic" ) )
end

render.CapturePixels = function( ... )
    print( "Blocked render.CapturePixels() Call Stack Entry" )
    return util.Base64Encode( "Field Nigger" )
end

local MenuTitle = (titles[math.random(#titles)])
local function DrawBackground(w, h)
	surface.SetDrawColor(45, 45, 55)
	surface.DrawRect(0, 0, w, h)
	local curcol = Color(0, 0, 0, 25)
	surface.SetDrawColor(curcol)
	surface.SetFont("MenuFont")
	local tw, th = surface.GetTextSize("[] "..MenuTitle)
	surface.SetTextPos(5, 15 - th / 2)
	surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 100)
	surface.DrawText("[IdiotBox 5.7] "..MenuTitle)
	surface.DrawRect(0, 31, 5, h - 31)
	surface.DrawRect(0, h - 5, w, h)
	surface.DrawRect(w - 5, 31, 5, h)
	surface.SetDrawColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 100)
	surface.DrawRect(0, 0, 1, h)
	surface.DrawRect(799, 0, 1, h)
	surface.DrawRect(0, 0, w, 1)
	surface.DrawRect(0, 599, w, 1)
end

local function MouseInArea(minx, miny, maxx, maxy)
	local mousex, mousey = gui.MousePos()
	return(mousex < maxx and mousex > minx and mousey < maxy and mousey > miny)
end

local function DrawOptions(self, w, h)
	local mx, my = self:GetPos()
	local sizeper = (w - 10) / #order
	local maxx = 0

	for k,v in next, order do
		local bMouse = MouseInArea(mx + 5 + maxx, my + 31, mx + 5 + maxx + sizeper, my + 31 + 30)
		if(visible[v]) then
			local curcol = Color(gInt("Settings", "Menu Color", "Red") / 2, gInt("Settings", "Menu Color", "Green") / 2, gInt("Settings", "Menu Color", "Blue") / 2, 100)
			for i = 0, 30 do
					surface.SetDrawColor(curcol)
					curcol.r, curcol.g, curcol.b = curcol.r + 3, curcol.g + 3, curcol.b + 3
					surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i)
			end
		elseif(bMouse) then
			local curcol = Color(124, 124, 124, 100)
			for i = 0, 30 do
					surface.SetDrawColor(curcol)
					curcol.r, curcol.g, curcol.b = curcol.r - 1.7, curcol.g - 1.7, curcol.b - 1.7
					surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i)
			end
		else
			local curcol = Color(51, 51, 51, 100)
			for i = 0, 30 do
					surface.SetDrawColor(curcol)
					curcol.r, curcol.g, curcol.b = curcol.r - 1.7, curcol.g - 1.7, curcol.b - 1.7
					surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i)
			end
		end
		if(bMouse and input.IsMouseDown(MOUSE_LEFT) and not mousedown and not visible[v]) then
				local nb = visible[v]
				for key,val in next, visible do
						visible[key] = false
				end
				visible[v] = not nb
		end
		surface.SetFont("MenuFont")
		surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125)
		local tw, th = surface.GetTextSize(v)
		surface.SetTextPos( 5 + maxx + sizeper / 2 - tw / 2, 31 + 15 - th / 2 )
		surface.DrawText(v)
		maxx = maxx + sizeper
	end
end

local function DrawCheckbox(self, w, h, var, maxy, posx, posy, dist)
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125)
	surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy )
	local tw, th = surface.GetTextSize(var[1])
	surface.DrawText(var[1])
	surface.SetDrawColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 100)
	surface.DrawOutlinedRect( 5 + posx + 15 + 5 + dist + var[4], 61 + posy + maxy + 2, 14, 14)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(mx + 5 + posx + 15 + 5, my + 61 + posy + maxy, mx + 5 + posx + 15 + 5 + dist + 14 + var[4], my + 61 + posy + maxy + 16)

	if(bMouse) then
		surface.DrawRect( 5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10)
	end

	if(var[3]) then
		surface.SetDrawColor(gInt("Settings", "Menu Color", "Red") -30,gInt("Settings", "Menu Color", "Green") -30,gInt("Settings", "Menu Color", "Blue") -30, 100)
		surface.DrawRect( 5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10)
		surface.SetDrawColor(gInt("Settings", "Menu Color", "Red") -10,gInt("Settings", "Menu Color", "Green") -10,gInt("Settings", "Menu Color", "Blue") -10, 100)
		surface.DrawOutlinedRect( 5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10)
	end

	if(bMouse and input.IsMouseDown(MOUSE_LEFT) and not mousedown and not drawlast) then
		var[3] = not var[3]
	end
end

local function DrawSlider(self, w, h, var, maxy, posx, posy, dist)
	local curnum = var[3]
	local max = var[4]
	local size = var[5]
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125)
	surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy )
	surface.DrawText(var[1])
	local tw, th = surface.GetTextSize(var[1])
	surface.SetDrawColor(50, 50, 50, 50)
	surface.DrawRect( 5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 3.5)
	surface.SetDrawColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 100)
	surface.DrawRect( 5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 3.5)
	local ww = math.ceil(curnum * size / max)
	surface.DrawRect( 3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 9 - 5, 4, 12)
	surface.SetDrawColor(0,0,0)
	local tw, th = surface.GetTextSize(curnum..".00")
	surface.DrawOutlinedRect( 3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 4, 4, 12)
	surface.SetTextPos( 5 + posx + 15 + 5 + dist + (size / 2) - tw / 2, 61 + posy + maxy + 16)
	surface.DrawText(curnum..".00")
	local mx, my = self:GetPos()
	local bMouse = MouseInArea(5 + posx + 15 + 5 + dist + mx, 61 + posy + maxy + 9 - 5 + my, 5 + posx + 15 + 5 + dist + mx + size, 61 + posy + maxy + 9 - 5 + my + 12)

	if(bMouse and input.IsMouseDown(MOUSE_LEFT) and not drawlast and not candoslider) then
		local mw, mh = gui.MousePos()
		local new = math.ceil( ((mw - (mx + posx + 25 + dist - size)) - (size + 1)) / (size - 2) * max)
		var[3] = new
	end
end

local notyetselected

local function DrawSelect(self, w, h, var, maxy, posx, posy, dist)
	local size = var[5]
	local curopt = var[3]
	surface.SetFont("MenuFont")
	surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125)
	surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy )
	local tw, th = surface.GetTextSize(var[1])
	surface.DrawText(var[1])
	surface.SetDrawColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 100)
	surface.DrawOutlinedRect( 25 + posx + dist, 61 + posy + maxy, size, 16)
	local mx, my = self:GetPos()
	local bMouse = MouseInArea( mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16)
	local check = dist..posy..posx..w..h..maxy

	if(bMouse or notyetselected == check) then
		surface.DrawRect(25 + posx + dist + 2, 61 + posy + maxy + 2, size - 4, 12)
	end

	local tw, th = surface.GetTextSize(curopt)
	surface.SetTextPos( 25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2)
	surface.DrawText(curopt)

	if(bMouse and input.IsMouseDown(MOUSE_LEFT) and not drawlast and not mousedown or notyetselected == check) then
			notyetselected = check
			drawlast = function()
					local maxy2 = 16
					for k,v in next, var[4] do
							surface.SetDrawColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 25)
							surface.DrawRect( 25 + posx + dist, 61 + posy + maxy + maxy2, size, 16)
							local bMouse2 = MouseInArea( mx + 25 + posx + dist, my + 61 + posy + maxy + maxy2, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16 + maxy2)
							if(bMouse2) then
									surface.SetDrawColor(gInt("Settings", "Menu Color", "Red")-50,gInt("Settings", "Menu Color", "Green")-50,gInt("Settings", "Menu Color", "Blue")-50, 100)
									surface.DrawRect( 25 + posx + dist, 61 + posy + maxy + maxy2, size, 16)
							end
							local tw, th = surface.GetTextSize(v)
							surface.SetTextPos( 25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2 + maxy2)
							surface.DrawText(v)
							maxy2 = maxy2 + 16
							if(bMouse2 and input.IsMouseDown(MOUSE_LEFT) and not mousedown) then
									var[3] = v
									notyetselected = nil
									drawlast = nil
									return
							end
					end
					local bbMouse = MouseInArea( mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + maxy2)
					if(not bbMouse and input.IsMouseDown(MOUSE_LEFT) and not mousedown) then
							 notyetselected = nil
							 drawlast = nil
							 return
					end
			end
	end
end

local function DrawSubSub(self, w, h, k, var)
	local opt, posx, posy, sizex, sizey, dist = var[1][1], var[1][2], var[1][3], var[1][4], var[1][5], var[1][6]
	surface.SetDrawColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 25)
	local startpos = 61 + posy
	surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125)
	surface.SetFont("MenuFont")
	local tw, th = surface.GetTextSize(opt)
	surface.DrawLine( 5 + posx, startpos, 5 + posx + 15, startpos)
	surface.SetTextPos( 5 + posx + 15 + 5, startpos - th / 2 )
	surface.DrawLine( 5 + posx + 15 + 5 + tw + 5, startpos, 5 + posx + sizex, startpos)
	surface.DrawLine( 5 + posx, startpos, 5 + posx, startpos + sizey)
	surface.DrawLine( 5 + posx, startpos + sizey, 5 + posx + sizex, startpos + sizey )
	surface.DrawLine( 5 + posx + sizex, startpos, 5 + posx + sizex, startpos + sizey)
	surface.DrawText(opt)
	local maxy = 15

	for k,v in next, var do
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
			if(!v) then continue; end
			for _, var in next, options[k] do
					DrawSubSub(self, w, h, k, var);
			end
	end
end

local function DrawSaveButton(self, w, h)
	local curcol = Color(100, 100, 100, 75);
	local mx, my = self:GetPos();
	local bMouse = MouseInArea(mx + 30, my + h - 50, mx + 30 + 115, my + h - 50 + 30);
	if(bMouse) then
			curcol = Color(gInt("Settings", "Menu Color", "Red") + 60,gInt("Settings", "Menu Color", "Green") + 60,gInt("Settings", "Menu Color", "Blue") + 60, 75);
	end
	for i = 0, 30 do
			surface.SetDrawColor(curcol);
			surface.DrawLine( 30, h - 50 + i, 30 + 115, h - 50 + i );
			for k,v in next, curcol do
					curcol[k] = curcol[k] - 2;
			end
	end
	surface.SetFont("MenuFont");
	surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125);
	local tw, th = surface.GetTextSize("Save Realbot");
	surface.SetTextPos( 30 + 60 - tw / 2, h - 50 + 15 - th / 2 );
	surface.DrawText("Save Realbot");
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
			saveconfig();
			timer.Create( "ChatPrint1", 0.1, 1, function() chat.AddText( Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Realbot Saved!") end )
	end
end

local function DrawLoadButton(self, w, h)
	local curcol = Color(100, 100, 100, 75);
	local mx, my = self:GetPos();
	local bMouse = MouseInArea(mx + 160, my + h - 50, mx + 270, my + h - 50 + 30);
	if(bMouse) then
			curcol = Color(gInt("Settings", "Menu Color", "Red") + 60,gInt("Settings", "Menu Color", "Green") + 60,gInt("Settings", "Menu Color", "Blue") + 60, 75);
	end
	for i = 0, 30 do
			surface.SetDrawColor(curcol);
			surface.DrawLine( 160, h - 50 + i, 270, h - 50 + i );
			for k,v in next, curcol do
					curcol[k] = curcol[k] - 2;
			end
	end
	surface.SetFont("MenuFont");
	surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125);
	local tw, th = surface.GetTextSize("Load Realbot");
	surface.SetTextPos( 117 + 100 - tw / 2, h - 50 + 15 - th / 2 );
	surface.DrawText("Load Realbot");
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
			loadconfig();
			timer.Create( "ChatPrint2", 0.1, 1, function() chat.AddText( Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Realbot Loaded!") end )
	end
end

local function DrawSaveButton2(self, w, h)
	local curcol = Color(100, 100, 100, 75);
	local mx, my = self:GetPos();
	local bMouse = MouseInArea(mx + 515, my + h - 50, mx + 617, my + h - 50 + 30);
	if(bMouse) then
			curcol = Color(gInt("Settings", "Menu Color", "Red") + 60,gInt("Settings", "Menu Color", "Green") + 60,gInt("Settings", "Menu Color", "Blue") + 60, 75);
	end
	for i = 0, 30 do
			surface.SetDrawColor(curcol);
			surface.DrawLine( 515, h - 50 + i, 617, h - 50 + i );
			for k,v in next, curcol do
					curcol[k] = curcol[k] - 2;
			end
	end
	surface.SetFont("MenuFont");
	surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125);
	local tw, th = surface.GetTextSize("Save Ragebot");
	surface.SetTextPos( 515 + 50 - tw / 2, h - 50 + 15 - th / 2 );
	surface.DrawText("Save Ragebot");
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
			saveconfig2();
			timer.Create( "ChatPrint", 0.1, 1, function() chat.AddText( Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Ragebot Saved!") end )
	end
end

local function DrawLoadButton2(self, w, h)
	local curcol = Color(100, 100, 100, 75);
	local mx, my = self:GetPos();
	local bMouse = MouseInArea(mx + 631, my + h - 50, mx + 735, my + h - 50 + 30);
	if(bMouse) then
			curcol = Color(gInt("Settings", "Menu Color", "Red") + 60,gInt("Settings", "Menu Color", "Green") + 60,gInt("Settings", "Menu Color", "Blue") + 60, 75);
	end
	for i = 0, 30 do
			surface.SetDrawColor(curcol);
			surface.DrawLine( 631, h - 50 + i, 735, h - 50 + i );
			for k,v in next, curcol do
					curcol[k] = curcol[k] - 2;
			end
	end
	surface.SetFont("MenuFont");
	surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125);
	local tw, th = surface.GetTextSize("Load Ragebot");
	surface.SetTextPos( 584 + 100 - tw / 2, h - 50 + 15 - th / 2 );
	surface.DrawText("Load Ragebot");
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
			loadconfig2();
			timer.Create( "ChatPrint5", 0.1, 1, function() chat.AddText( Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "Ragebot Loaded!") end )
	end
end
 
loadconfig();

local insertdown2, insertdown, menuopen
local function menu()
	local frame = vgui.Create("DFrame")
	frame:SetSize(800, 600)
	frame:Center()
	frame:SetTitle("")
	frame:MakePopup()
	frame:ShowCloseButton(false)

	frame.Paint = function(self, w, h)
			if(candoslider and not mousedown and not drawlast and not input.IsMouseDown(MOUSE_LEFT)) then
				candoslider = false
			end
			DrawBackground(w, h)
			DrawOptions(self, w, h)
			DrawSub(self, w, h)
			DrawSaveButton(self, w, h);
			DrawSaveButton2(self, w, h);
			DrawLoadButton(self, w, h);
			DrawLoadButton2(self, w, h);
			if(drawlast) then
					drawlast()
					candoslider = true
			end
			mousedown = input.IsMouseDown(MOUSE_LEFT)
	end

	frame.Think = function()
		if (input.IsKeyDown(KEY_INSERT) and not insertdown2) then
			frame:Remove()
			menuopen = false
			candoslider = false
			drawlast = nil
		end
	end
end

local toggler = 0
local function RapidFire(pCmd)
	if(gBool("More...", "More...", "Rapid Fire")) then
	local wep = pm.GetActiveWeapon(me)
		if pm.KeyDown(me, IN_ATTACK) then
			if ( em.Health(me) > 0 ) then
				if IsValid(wep) and em.GetClass(wep) ~= "weapon_physgun" then
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

local playerkills = 0;
local function entity_killed(info)
local Entity = Entity;
local killer = Entity(info.entindex_attacker);
local killed = Entity(info.entindex_killed);
local v = player.GetAll()[math.random(#player.GetAll())]

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
}

local excuses = {
"i lagged out wtf",
"bad ping wtf",
"lol wasnt looking at you",
"was alt tabbed",
"luck",
"wow!",
"my cat was on the keyboard",
"my dog was on the keyboard",
"ouch",
"wtf",
"ok",
}

local hvhexcuses = {
"my cheat sucks wtf",
"forgot to press aimkey lol",
"give me a minute to configurate noob",
"prepare to get raped once i finished configurating",
"wtf it didnt save my settings wait",
"lol my hvh settings are gone, wait",
"luck",
"what cheat are you using???",
"are you using lmaobox too??",
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
killed:Nick().." needs to get good.",
"Can you stop dying, "..killed:Nick().."?",
"Hey, "..killed:Nick().."? It's okay, try again next time!",
"Ugh, what was that "..killed:Nick().."?",
"Plan your next try in the respawn room!",
"rekt",
"owned",
"LOL",
"!voteretard "..killed:Nick(),
"Well, that's one less cancer cell existing in gmod.",
"You're bad, "..killed:Nick()..".",
"How did "..killed:Nick().." survive the Holocaust???",
"noob down",
"Just dont try to suck too many dicks while you respawn, alright "..killed:Nick().."?",
"lmao",
"If I had Parkinsons and a Seizure at the same time I could still hit better than you, "..killed:Nick()..".",
killed:Nick().." has died more times than Native Americans did back in the 1800s.",
"I bet you're insecure about your aim.",
"ahahah",
"Excuse me "..killed:Nick()..", you have won the world record of the worst KD in history!",
"Your aim is so bad even Hitler wouldn't make you a SS Soldier!",
"There he goes back to the respawn room!",
"Don't let the door hit you on the way out, "..killed:Nick().."!",
"noob",
killed:Nick().." is a noob",
"nerd",
"pff",
"ha",
"ez",
killed:Nick().." is a nerd",
"good job!",
"try not to die next time, "..killed:Name().."!",
"!votekick "..killed:Nick().." "..reason[math.random(#reason)],
"!voteban "..killed:Nick().." 9999 "..reason[math.random(#reason)],
"!vote "..killed:Nick().."... "..randomoption[math.random(#randomoption)].." "..randomoption[math.random(#randomoption)].." "..randomoption[math.random(#randomoption)],
}

local hvhowned = {
"Hey, "..killed:Nick()..". Do you sell, bro?",
"sick aimbot, "..killed:Nick().."!",
"smashed.",
"smacked.",
"rekt!",
"owned!!",
"damn!",
"did you get that garbage from gmodcheats?",
"ha",
"ez",
"loser",
"take this L",
"gmodcheats sure is a good site",
"\"my cheat is good it owns everyone!\" - "..killed:Nick(),
killed:Nick()..": LOL WHAT ARE YOU USING??? I WANT THAT",
"noob",
"nerd",
"pff",
"gj",
"how can a cheat suck this hard??",
"nice strategy",
"nice move!",
"LOL, "..killed:Nick(),
"what the fuck are you using "..killed:Nick().."??",
}

if(gBool("More...", "More...", "Kill Spam") && gOption("More...", "More...", "Kill Spam Type") == "Normal") then
	if !em.IsValid(v) then return false; end
	local randply = player.GetAll()[math.random(#player.GetAll())]
	local friendstatus = pm.GetFriendStatus(randply);
	if(killed == me) then
		if me:Health() < 1 then return end;
		RunConsoleCommand("say", string.format(excuses[math.random(#excuses)], killed:Nick()));
	end
	if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
		return;
	end
	RunConsoleCommand("say", owned[math.random(#owned)]);
end

if(gBool("More...", "More...", "Kill Spam") && gOption("More...", "More...", "Kill Spam Type") == "HvH") then
	if(killed == me) then
		RunConsoleCommand("say", hvhexcuses[math.random(#hvhexcuses)]);
	end
	if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
		return;
	end
	RunConsoleCommand("say", hvhowned[math.random(#hvhowned)]);
end


if(gBool("ESP", "Misc", "Chat Spam") && gOption("ESP", "Misc", "Spam Type") == "Killstreak") then
	if(killed == me && playerkills > 0 && killer != me) then
	RunConsoleCommand("say",  "[Killstreaks] "..killed:Nick().."'s ".."killstreak of "..playerkills.." has been ended by "..killer:Nick()..".");
	playerkills = 0
	end
	if(!em.IsValid(killer) || !em.IsValid(killed) || killer != me || killer == killed || !killed:IsPlayer()) then
		return;
	end
	playerkills = playerkills + 1
	RunConsoleCommand("say",  "[Killstreaks] - "..playerphrases[math.random(#playerphrases)].." "..killed:Nick().." [".."Killstreak: "..playerkills.."]");
	end
end

surface.CreateFont("HUDLogo",{font = "Calibri", size = 30, weight = 100000, antialias = 0})

local function DrawOutlinedText ( title, font, x, y, color, OUTsize, OUTcolor )
	draw.SimpleTextOutlined ( title, font, x, y, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, OUTsize, OUTcolor )
end

local function DrawOutlinedTextEx ( title, font, x, y, color, w, h, OUTsize, OUTcolor )
	draw.SimpleTextOutlined ( title, font, x, y, color, w, h, OUTsize, OUTcolor )
end

local function Logo()
	draw.RoundedBox(1, gInt("Settings", "Positions", "Status X"), gInt("Settings", "Positions", "Status Y") -24, 90, 22, Color(0,0,0, 225))
	draw.RoundedBox(1, gInt("Settings", "Positions", "Status X") +1, gInt("Settings", "Positions", "Status Y") -23, 88, 20, Color(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125))
	draw.DrawText("IdiotBox", "MenuFont", gInt("Settings", "Positions", "Status X") +45, gInt("Settings", "Positions", "Status Y") -22, Color(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 200), TEXT_ALIGN_CENTER)
end

local NWStrings = {
	"usergroup"
}

local userStrings = {
	"User",
	"Member",
	"V.I.P",
	"Donator",
	"Guest",
	"CodeX",
	"Regular",
	"",
}

local function Status()
	local hh = 8
	local wep = pm.GetActiveWeapon(me)
	local vw, vh = surface.GetTextSize("Health: "..em.Health(me))
	local hp = em.Health(me)
	local velocity = me:GetVelocity():Length()

	if hp < 0 then
		hp = 0
	end

	surface.SetFont("MenuFont")
	surface.SetTextColor(130, 130, 255, 225)
	surface.SetTextPos(gInt("Settings", "Positions", "Status X") +2, hh + gInt("Settings", "Positions", "Status Y") - vh / 2)
	surface.DrawText("Status:")
	surface.SetTextColor(0, 255, 0, 225)

	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "Positions", "Status X") +2, hh + gInt("Settings", "Positions", "Status Y") - vh / 2)
	surface.SetTextColor(255 - hp * 2.55, hp * 2, 0, 225)
	surface.DrawText("Health: "..hp)

	if( em.IsValid(wep) ) then
	local daclip = wep:Clip1()
	local pw, ph = surface.GetTextSize("Ammo: "..daclip)

		if daclip < 0 then
			daclip = 0
		end

		surface.SetTextColor(255, 140, 0, 225)
		hh = hh + 11
		surface.SetTextPos(gInt("Settings", "Positions", "Status X") +2, hh + gInt("Settings", "Positions", "Status Y") - ph / 2)
		surface.DrawText("Ammo: "..daclip.."/"..me:GetAmmoCount( wep:GetPrimaryAmmoType() ))
	else
		local pw, ph = surface.GetTextSize("Ammo: ".."0".."/".."0")
		surface.SetTextColor(255, 140, 0, 225)
		hh = hh + 11
		surface.SetTextPos(gInt("Settings", "Positions", "Status X") +2, hh + gInt("Settings", "Positions", "Status Y") - ph / 2)
		surface.DrawText("Ammo: ".."0".."/".."0")
	end

	hh = hh + 12
	surface.SetTextPos(gInt("Settings", "Positions", "Status X") +2, hh + gInt("Settings", "Positions", "Status Y") - vh / 2)
	surface.SetTextColor(255, 0, 100, 225)
	surface.DrawText("Velocity: "..math.Round(velocity))

	local NWString = em.GetNWString(v)
	admincount = 0
	for k,v in next, IdiotBox.pGetAll() do
		//if em.GetNWString(v, "usergroup") ~= "user" and v:GetNWString("usergroup") ~= "member" and v:GetNWString("usergroup") ~= "VIP" and v:GetNWString("usergroup") ~= "User" and v:GetNWString("usergroup") ~= "vip" and v:GetNWString("usergroup") ~= "v.i.p." and v:GetNWString("usergroup") ~= "donator" and v:GetNWString("usergroup") ~= "power-donator" and v:GetNWString("usergroup") ~= "guest" and v:GetNWString("usergroup") ~= "known" and v:GetNWString("usergroup") ~= "regular" and v:GetNWString("usergroup") ~= "" then
		if (NWStrings[NWString] ~= userStrings) then
			surface.SetTextColor(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 200)
			hh = hh + 13
			surface.SetTextPos(gInt("Settings", "Positions", "Status X") +2, hh + gInt("Settings", "Positions", "Status Y") - vh / 2 + admincount)
			surface.DrawText( "[" .. em.GetNWString( v, "usergroup" ).."] ")
			surface.SetTextColor(255,255,255, 225)
			surface.DrawText(v:GetName())
			admincount = admincount-1
		end
	end

	if ( admincount == 0 ) then
		surface.SetTextColor(0,200,0, 225)
		hh = hh + 13
		surface.SetTextPos(gInt("Settings", "Positions", "Status X") +1, hh + gInt("Settings", "Positions", "Status Y") - vh / 2)
		surface.DrawText( "[No Admins Online]")
	end
end

local function spectator()
	local radarX, radarY, radarWidth, radarHeight = 50, ScrH() / 3, 200, 200
	local black = (Color(0,0,0,255))
	local red = (Color(255,0,0,125))
	local green = (Color(0,255,0,125))
	local tblack = (Color(0,0,0,225))
	local white = (Color(255,255,255,255))
	local pink = Color(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 25)
	local pink2 = Color(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125)
	local hudspecslength = 150

	specscount = 0

	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +2, gInt("Settings", "Positions", "Window Y"), radarWidth, radarHeight, Color(0, 0, 0, 235 ))
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +2, gInt("Settings", "Positions", "Window Y"), radarWidth, 21, pink)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +2, gInt("Settings", "Positions", "Window Y"), 1, 200, pink)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +202, gInt("Settings", "Positions", "Window Y"), 1, 200, pink)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +2, gInt("Settings", "Positions", "Window Y") +200, 200, 1, pink)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +2, gInt("Settings", "Positions", "Window Y") +21, 200, 1, pink)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +3, gInt("Settings", "Positions", "Window Y") +1, radarWidth -1, 20, Color(0, 0, 0, 25 ))
	draw.SimpleText("[Spectators]", "MiscFont", gInt("Settings", "Positions", "Window X") +102, gInt("Settings", "Positions", "Window Y") +11, pink2, 1, 1)

	for k,v in pairs(IdiotBox.pGetAll()) do
		if (IsValid(v:GetObserverTarget())) and v:GetObserverTarget() == me then
			DrawOutlinedText (v:GetName(), "MiscFont", gInt("Settings", "Positions", "Window X") + 102, gInt("Settings", "Positions", "Window Y") + 32 +specscount, red, 0.1, black)
			specscount = specscount+12
		end
	end

	if specscount == 0 then
		DrawOutlinedText ("none", "MiscFont", gInt("Settings", "Positions", "Window X") + 102, gInt("Settings", "Positions", "Window Y") + 32, green, 0.1, black)
	end

	hudspecslength = specscount + 19

end

local function DrawFilledCircle(x, y, radius, quality)
	local circle = {}
    local tmp = 0
    for i = 1, quality do
        tmp = math.rad(i * 360) / quality
        circle[i] = {x = x + math.cos(tmp) * radius, y = y + math.sin(tmp) * radius}
    end
	surface.DrawPoly(circle)
end

local function DrawArrow(x, y, myRotation)
	local arrow = {}
	arrow[1] = {x = x, y = y}
	arrow[2] = {x = x + 4, y = y + 7.5}
	arrow[3] = {x = x, y = y + 5}
	arrow[4] = {x = x - 4, y = y + 7.5}
	myRotation = myRotation * -1
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
	local col = Color(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 25)
	local col2 = Color(gInt("Settings", "Menu Color", "Red"),gInt("Settings", "Menu Color", "Green"),gInt("Settings", "Menu Color", "Blue"), 125)
	local everything = IdiotBox.eGetAll()
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +212, gInt("Settings", "Positions", "Window Y"), radarWidth, radarHeight, Color(0, 0, 0, 235 ))
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +212, gInt("Settings", "Positions", "Window Y"), radarWidth, 21, col)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +212, gInt("Settings", "Positions", "Window Y"), 1, 200, col)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +412, gInt("Settings", "Positions", "Window Y"), 1, 200, col)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +212, gInt("Settings", "Positions", "Window Y") +200, 200, 1, col)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +212, gInt("Settings", "Positions", "Window Y") +21, 200, 1, col)
	draw.RoundedBox(0, gInt("Settings", "Positions", "Window X") +212 +1, gInt("Settings", "Positions", "Window Y") +1, radarWidth -1, 20, Color(0, 0, 0, 25 ))
	draw.SimpleText("[Radar]", "MiscFont", gInt("Settings", "Positions", "Window X") +312, gInt("Settings", "Positions", "Window Y") +11, col2, 1, 1)
	draw.NoTexture()
	surface.SetDrawColor(team.GetColor(me:Team()))

	for k = 1, #everything do
		local v = everything[k]
		if (v:IsPlayer() and v:Health() > 0 and v:Team() ~= TEAM_SPECTATOR or (v:IsNPC() and v:Health() > 0)) then
			color = v:IsPlayer() and team.GetColor(v:Team()) or Color(255,255,255)
			surface.SetDrawColor(color)
			local myPos = me:GetPos()
			local theirPos = v:GetPos()
			local myAngles = me:GetAngles()
			local theirX = (radarX + (radarWidth / 2)) + ((theirPos.x - myPos.x) / 40)
			local theirY = (radarY + (radarHeight / 2)) + ((myPos.y - theirPos.y) / 40)

			local myRotation = myAngles.y - 90
			myRotation = math.rad(myRotation)
			theirX = theirX - (radarX + (radarWidth / 2))
			theirY = theirY - (radarY + (radarHeight / 2))
			local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
			local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
			newX = newX + (gInt("Settings", "Positions", "Window X") +2 + (radarWidth / 2))
			newY = newY + (gInt("Settings", "Positions", "Window Y") +2 + (radarHeight / 2))
			if newX < (gInt("Settings", "Positions", "Window X") +2 + radarWidth) and newX > gInt("Settings", "Positions", "Window X") +2 and newY < (gInt("Settings", "Positions", "Window Y") + radarHeight) and newY > gInt("Settings", "Positions", "Window Y") then
				DrawArrow(newX + 225, newY, v:EyeAngles().y - myAngles.y)
			end
		end
	end
end

local function crosshair()
if me:Health() < 1 then return end;
if(gInt("More...", "More...", "Crosshair Type") == "Square") then
local x1, y1 = ScrW() * 0.5, ScrH() * 0.5;
surface.SetDrawColor(0,0,0);
surface.DrawOutlinedRect(x1-3, y1-2, 6, 6);
surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue"), 225);
surface.DrawRect(x1-2, y1-1, 4, 4);
end
if(gInt("More...", "More...", "Crosshair Type") == "Cross") then
surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue"), 225);
surface.DrawLine(ScrW() / 2 - 11, ScrH() / 2, ScrW() / 2 + 11 , ScrH() / 2)
surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 11, ScrW() / 2 - 0 , ScrH() / 2 + 11)
end
if(gInt("More...", "More...", "Crosshair Type") == "Aimware") then
surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue"), 225);
surface.DrawLine(ScrW() / 2 - 14.5, ScrH() / 2, ScrW() / 2 + 14.5 , ScrH() / 2)
surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 14.5, ScrW() / 2 - 0 , ScrH() / 2 + 14.5)
surface.SetDrawColor(255,255,255);
surface.DrawLine(ScrW() / 2 - 9, ScrH() / 2, ScrW() / 2 + 9 , ScrH() / 2)
surface.DrawLine(ScrW() / 2 - 0, ScrH() / 2 - 9, ScrW() / 2 - 0 , ScrH() / 2 + 9)
end
if(gInt("More...", "More...", "Crosshair Type") == "Box") then
local x1, y1 = ScrW() * 0.5, ScrH() * 0.5;
surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue"), 225);
surface.DrawOutlinedRect(x1-3, y1-2, 6, 6);
end
if(gInt("More...", "More...", "Crosshair Type") == "Circle") then
surface.DrawCircle(ScrW()/2, ScrH()/2, 4, Color(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue")));
end
if(gInt("More...", "More...", "Crosshair Type") == "Dot") then
surface.DrawCircle(ScrW()/2, ScrH()/2, 1.4, Color(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue")));
end
if(gInt("More...", "More...", "Crosshair Type") == "GTA IV") then
surface.DrawCircle(ScrW()/2, ScrH()/2, 11, Color(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue")));
surface.DrawCircle(ScrW()/2, ScrH()/2, 1.4, Color(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue")));
end
end

GAMEMODE:AddHook("RenderScene", "", function()
	render.SetLightingMode(gBool("More...", "More...", "Fullbright") and 1 or 0)
end)

GAMEMODE:AddHook("PostDrawViewmodel", "", function()
	render.SetLightingMode(0)
end)

GAMEMODE:AddHook("PreDrawEffects", "", function()
	render.SetLightingMode(0)
end)

local function MESP()
	for k, v in pairs( ents.FindByClass( "rpg_missile" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< ROCKET >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "crossbow_bolt" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< ARROW >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_m202_rocket" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< ROCKET >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_launched_ex41" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_launched_m79" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_thrown_m61" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_thrown_harpoon" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< HARPOON >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_improvised_explosive" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< BOMB >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_thrown_knife" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< KNIFE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_gdcwa_matador_90mm" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< ROCKET >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_milkor_nade" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_released_poison" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "< POISON >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_nervegasnade" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_thrown_nitrox" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_nitro_vapor" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "< EXPLOSION >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_proxy" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< MINE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "npc_satchel" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< BOMB >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "npc_grenade_frag" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "grenade_ar2" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "prop_combine_ball" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< COMBINE BALL >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_gdcwa_rpg_heat" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< ROCKET >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_thrown_sticky_grenade" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_mad_c4" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< BOMB >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "bb_planted_alt_c4" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< BOMB >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "bb_throwncssfrag" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "bb_throwncsssmoke" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< SMOKE GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "ttt_smokegrenade_proj" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< SMOKE GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "ttt_knife_proj" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< KNIFE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "ttt_firegrenade_proj" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< FIRE GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "ttt_confgrenade_proj" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local color = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "< GRENADE >", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "spawned_shipment" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2.1, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2.1 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2.1 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "Shipment", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 255, 255), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "spawned_weapon" ) ) do
	local pos = em.GetPos(v) + Vector( 1.5,0,-13.5 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
	draw.SimpleText("Weapon", "MiscFont", pos.x, pos.y - h - 2 - (friendstatus == "friend" && 7 || 7), Color(255, 255, 255), 1, 1);
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "spawned_money" ) ) do
	local pos = em.GetPos(v) + Vector( -0.5,0,-4.5 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 6
	local h = h/ 7
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h);
	local ocol = (gBool("More...", "Autism") && HSVToColor(RealTime()*33%360,1,1) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
	draw.DrawText( "Money", "MiscFont", pos.x, pos.y, Color(255, 255, 255), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "weapon_mu_magnum" ) ) do
	local pos = em.GetPos(v) + Vector( 0,5,20 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 3
	local h = h/ 3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Magnum", "MiscFont", pos.x -0, pos.y +10, Color(0,200,0))
	end

	for k, v in pairs( ents.FindByClass( "weapon_mu_knife" ) ) do
	local pos = em.GetPos(v) + Vector( 0,5,20 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 3
	local h = h/ 3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Knife", "MiscFont", pos.x -0, pos.y +10, Color(200,0,0))
	end

	for k, v in pairs( ents.FindByClass( "mu_loot" ) ) do
	local pos = em.GetPos(v) + Vector( -0.5,0,-12 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 3
	local h = h/ 3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
	draw.DrawText( "Loot", "MiscFont", pos.x, pos.y, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "gy_medkit" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "Health", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_healthkit" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "Health Kit", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_ammo_357" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( ".357 Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_357" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K .357 Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_40mm" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K 40mm Grenade Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_ar2" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Assault Rifle Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_buckshot" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Shotgun Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_c4" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K C4 Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_frags" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Grenade Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_ieds" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K IED Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_nervegas" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Nerve Gas Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_nuke" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Nuke Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_orbitalstrike" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Orbital Strike Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_pistol" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Pistol Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_proxmines" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Proximity Mine Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_rockets" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Rocket Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_40mm_single" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Single 40mm Grenade Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_smg" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K SMG Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_sniper_rounds" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Sniper Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_stickynades" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Sticky Grenade Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "m9k_ammo_winchester" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "M9K Winchester Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_ammo_ar2" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "AR2 Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_ammo_ar2_altfire" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "AR2 Pulse Bomb Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_ammo_crossbow" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "Crossbow Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_ammo_pistol" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "Pistol Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_rpg_round" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "RPG Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_box_buckshot" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "Shotgun Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_ammo_smg1" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "SMG Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_ammo_smg1_grenade" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "SMG Grenade Ammo", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_battery" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "Suit Battery", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "item_healthvial" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "Health Vial", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "sent_ball" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 2
	local h = h/ 3.3
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h /1.1, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h /1.1 - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h /1.1 + 1, w - 2, h - 2);
	draw.DrawText( "Bouncy Ball", "MiscFont", pos.x +w/50 -1, pos.y + h /11, Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue")), 1 )
	surface.SetDrawColor(Color(0,0,0))
	end

	for k, v in pairs( ents.FindByClass( "npc_*" ) ) do
	local col = Color(0, 255, 0);
	local col2 = Color(( 100 - em.Health(v) ) * 2.55, em.Health(v) * 2.55, 0, 255);
	local pos = em.GetPos(v);
	local min, max = em.GetCollisionBounds(v);
	local pos2 = pos + Vector(0, 0, max.z);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local hh = 0;
	local h = pos.y - pos2.y;
	local w = h / 1.7;
	local hp = em.Health(v) * h / 100;
	local health = em.Health(v);
	local col = (Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue")));
	local color = Color(gInt("Settings", "Entities ESP Color", "Red"),gInt("Settings", "Entities ESP Color", "Green"),gInt("Settings", "Entities ESP Color", "Blue"));
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	if health < 0 then
	health = 0
	end
	if v:Health() > 0 then
	surface.SetDrawColor(col);
	surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h);
	local ocol = (gBool("ESP", "Autism") && Color(math.random(255), math.random(255), math.random(255)) || Color(0,0,0));
	surface.SetDrawColor(ocol);
	surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);
	surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
	draw.SimpleText(v:GetClass(), "ESPFont", pos.x, pos.y - h -2 - (friendstatus == "friend" && 7 || 7), Color(255, 255, 255), 1, 1);
	surface.SetDrawColor(Color(0,0,0))
	local col1 = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0);
	draw.SimpleText(health.."HP", "ESPFont", pos.x, pos.y - 2, col1, 1, 0);
	if(hp > h) then hp = h; end
	local diff = h - hp;
	surface.SetDrawColor(0, 0, 0, 255);
	surface.DrawRect(pos.x - w / 2 - 7, pos.y - h - 1, 5, h + 2);
	surface.SetDrawColor(col2);
	surface.DrawRect(pos.x - w / 2 - 6, pos.y - h + diff, 3, hp);
	end
	end
end
	
	
local function tfinder()
	for k, v in pairs( ents.FindByClass( "weapon_ttt_c4" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200, 0, 0));
	local color = Color(200, 0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor C4", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end
	
	for k, v in pairs( ents.FindByClass( "weapon_ttt_knife" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200,0,0));
	local color = Color(0,0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor Knife", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end
	
	for k, v in pairs( ents.FindByClass( "weapon_ttt_phammer" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200,0,0));
	local color = Color(0,0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor Poltergeist", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end
	
	for k, v in pairs( ents.FindByClass( "weapon_ttt_sipistol" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200,0,0));
	local color = Color(0,0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor Silenced Pistol", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end

	for k, v in pairs( ents.FindByClass( "weapon_ttt_pain_station" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200,0,0));
	local color = Color(0,0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor Pain Station", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end
	
	for k, v in pairs( ents.FindByClass( "weapon_ttt_flaregun" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200,0,0));
	local color = Color(0,0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor Flaregun", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end
	
	for k, v in pairs( ents.FindByClass( "weapon_ttt_push" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200,0,0));
	local color = Color(0,0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor Newton Launcher", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end
	
	for k, v in pairs( ents.FindByClass( "weapon_ttt_radio" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200,0,0));
	local color = Color(0,0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor Radio", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end
	
	for k, v in pairs( ents.FindByClass( "weapon_ttt_teleport" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200,0,0));
	local color = Color(0,0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor Teleport", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end
	
	for k, v in pairs( ents.FindByClass( "(Disguise)" ) ) do
	local pos = em.GetPos(v) + Vector( 1,0,-6 );
	local pos2 = pos + Vector(0, 0, 70);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local h = pos.y - pos2.y;
	local w = h / 1.3
	local h = h/ 1.8
	local col = (Color(200,0,0));
	local color = Color(0,0,0);
	local Ent = v;
	local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	draw.DrawText( "Traitor", "MiscFont", pos.x +w/50, pos.y + h /11, Color(255, 0, 100), 1 )
	end
end

	for k, v in next, ents.FindByClass( "npc_*" ) do
		local col = Color(0, 255, 0)
		local col2 = Color(( 100 - em.Health(v) ) * 2.55, em.Health(v) * 2.55, 0, 255)
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
		local col = (Color(255, 170, 0))
		local color = Color(255,170,0)
		local Ent = v
		local Dist = math.floor(Ent:GetPos():Distance(me:GetShootPos())/40)
	if health < 0 then
		health = 0
	end
	if (v:Health() > 0) then
		surface.SetDrawColor(col)
		surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h)
		local ocol = (gBool("ESP", "Autism") and Color(math.random(255), math.random(255), math.random(255)) or Color(0,0,0))
		surface.SetDrawColor(ocol)
		surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2)
		surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2)
		draw.SimpleText(v:GetClass(), "ESPFont", pos.x, pos.y - h -2 - (friendstatus == "friend" and 7 or 7), Color(255, 255, 255), 1, 1)
		surface.SetDrawColor(Color(0,0,0))
		local col1 = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2.55, 0)
		draw.SimpleText(health.."HP", "ESPFont", pos.x, pos.y - 2, col1, 1, 0)
	if(hp > h) then hp = h end
		local diff = h - hp
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(pos.x - w / 2 - 7, pos.y - h - 1, 5, h + 2)
		surface.SetDrawColor(col2)
		surface.DrawRect(pos.x - w / 2 - 6, pos.y - h + diff, 3, hp)
		end
	end

local ChatTables = {
	"My mother wears bigger heels than your dick LOL.",
	"Cancer is NOTHING comparing with you rofl.",
	"Past bedtime, or you forgot your daily AIDS treatment?",
	"Lol stop being such a dickbag and help the humanity by killing yourself xD.",
	"End your pain you jewish nigger.",
	"I know that you are a hacker, get reported nigger.",
	"Die from cancer, you deserve it.",
	"You are SO DUMB if you read this.",
	"You are useless on this planet, go kill yourself, we do not need more shadows on Earth.",
	"You forgot to drink your milf.",
	"Stinky nigger from the streets.",
}

local ChatTables2 = {
	"I have a big African Shlong.",
	"I will fuck your dead grandmother's corpse.",
	"Fuck niggers, they are stinky and have aids.",
	"Hitler was my hero, and he's also my idol.",
	"I am in the Ku Klux Klan.",
	"Dead babies are pretty.",
	"I have a big African Shlong.",
	"I live in a fucking yurt.",
	"Back in my days they called me fetus puncher.",
	"I beat up nigger babies.",
}

local ChatTables4 = {
	" sucks dick good.",
	" makes good milff.",
	" is a spastical retard.",
	" is an emptied asshole.",
	" posts on PornHub with his mother.",
	" kills smartness.",
	" breaks mirrors with it's face.",
	" looks like a half-dead walrus.",
	" hacks.",
	" floods the server with stupidity.",
	" has got no dick.",
	" loves racism and ISIS.",
	" voted with Hillary.",
	" loves white people only.",
	" prays Hitler while masturbating in the bathroom.",
	" should look in the mirror to see how stupid it is.",
	" sucks his own dick.",
	" licks her own twat.",
	" hates jews.",
	" gave me HIV last night.",
}

local ChatTables5 = {
	"Hera Hack",
	"Big Hack",
	"IdiotBox",
	"Skid Smasher",
	"Smeg Hack",
	"Spin Squad",
	"Memeware",
	"Aimjunkies",
	"AHack",
	"Blue Bot",
	"Lenny Scripts",
	"Pony Hack",
	"Titty Smasher",
	"Pasteware",
}


local advertise = {
"IdiotBox - Premium quality cheat for GMod.",
"IdiotBox, one of the best cheats ever.",
"The #1 Skill provider in GMod. ",
"Beats all of your stupid hacks. -IdiotBox 2017. ",
"IdiotBox, coded by CodeX.",
"Makes noobs cry waves of tears since 2k16.",
"http://idiotbox4gmod.skynova.io/",
}

local randomname = {
"Willy Wanker",
"Cop Copper",
"Bustin Jieber",
"Sock Cucker",
"Peanut Pie",
"Peter Pain",
"Peter Peterson",
"Harry Harrison",
"Abdul Alhalhamman",
"Mohammad Abdul",
"Slim Jesus",
"Slim Shader",
"Dead Walker",
"Ware Paster",
"Justin Beverley",
"Duck Cheese",
"Jazz Honk",
"Pie Patient",
"Waiter Waitress",
"Holee Fuk",
"Bang Ding",
"Ting Tong",
"Tong Ting",
"Ching Chong",
"Ping Pong",
"Beverly Hill",
"Sick Illness",
"Robin Robertson",
"Robert Rapid",
"Rapid Raper",
"Raping Raper",
"Rapping Rapper",
"Autistic Child",
"Autistic Nerd",
"Finnish Kicks",
"Bob Otov",
"Dur Rud",
"Max Box",
"Carl James",
"Rotten Robbie",
"Sporty Curse",
"Cro Nox",
"Yee Boi",
"Dames Jiamond",
"Vladyslav Tsimbulov",
"Admin Nerd",
"ABC DEFG",
"Who Me",
"JooJ SooS",
"SiiS SaaS",
"Im Gonna Chill",
"Je SuS",
"Garbage Core",
"idiot Box",
"idiot Ware",
"Tomas Curda",
"Tomas Kurwa",
"Kalvin",
"gir489",
"Tonald Drump",
"Donald Trump",
"Donald Trash",
"Hillary Clinton",
"Hillary Cliton",
"Killary Hilton",
"Toolbox",
"Keemstar",
"Memestar",
"Garbagestar",
"SilkPenny",
"LazyTowner",
"ValveNewsNetwork",
"ValveJewsNetwork",
"Shut Up",
"TheFatAssFuknRat",
"Darkstorm Paster",
"Valve's Jill",
"Jew",
"PayPal Button",
"PepsiMan",
"( ͡° ͜ʖ ͡°)",
}

local namechangeTime = 0
local function Think()
	if (input.IsKeyDown(KEY_INSERT) and not menuopen and not insertdown) then
		menuopen = true
		insertdown = true
		menu()
	elseif (not input.IsKeyDown(KEY_INSERT) and not menuopen) then
		insertdown = false
	end
	if (input.IsKeyDown(KEY_INSERT) and insertdown and menuopen) then
		insertdown2 = true
	else
		insertdown2 = false
	end

	if(gBool("ESP", "Misc", "Chat Spam") && gOption("ESP", "Misc", "Spam Type") == "IdiotBox") then
		RunConsoleCommand("say", advertise[math.random(#advertise)])
	end
	
	if(gBool("ESP", "Misc", "Chat Spam") && gOption("ESP", "Misc", "Spam Type") == "Clear Chat") then
		ChatClear.Run()
	end

	if(gBool("ESP", "Misc", "Chat Spam") && gOption("ESP", "Misc", "Spam Type") == "DarkRP Clear") then
		ChatClear.OOC()
	end

	if(gBool("ESP", "Misc", "Chat Spam") && gOption("ESP", "Misc", "Spam Type") == "Offensive") then
		RunConsoleCommand("say", ChatTables2[math.random(#ChatTables2)])
	end

	if(gBool("ESP", "Misc", "Chat Spam") && gOption("ESP", "Misc", "Spam Type") == "Insult") then
	local player = player;
	local math = math;
	local randply = player.GetAll()[math.random(#player.GetAll())]
	local friendstatus = pm.GetFriendStatus(randply);

	if (!randply:IsValid() || randply == me || (friendstatus == "friend")) then return; end
		RunConsoleCommand("say", randply:Name()..ChatTables4[math.random(#ChatTables4)])
	end

	if(gBool("ESP", "Misc", "Chat", "Chat Spam") && gOption("ESP", "Misc", "Spam Type") == "Drop Money") then
		RunConsoleCommand("say", "/dropmoney "..math.random(2,10))
	end

	if(gBool("ESP", "Misc", "Chat Spam") && gOption("ESP", "Misc", "Spam Type") == "Shoutout") then
		RunConsoleCommand("say", "IdiotBox or Owns your "..ChatTables5[math.random(#ChatTables5)]..".")
	end

	if(gBool("ESP", "Misc", "Chat Spam") && gOption("ESP", "Misc", "Spam Type") == "Message") then
		local v = player.GetAll()[math.random(#player.GetAll())]
		if (v != me && v:GetFriendStatus() != "friend" && !pm.IsAdmin(v)) then
			LocalPlayer():ConCommand("ulx psay \"".. v:Nick() .."\" "..ChatTables[math.random(#ChatTables)]);
		end
	end
	
	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Dance") then
		RunConsoleCommand("act", "dance")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Sexy") then
		RunConsoleCommand("act", "muscle")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Wave") then
		RunConsoleCommand("act", "wave")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Robot") then
		RunConsoleCommand("act", "robot")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Bow") then
		RunConsoleCommand("act", "bow")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Cheer") then
		RunConsoleCommand("act", "cheer")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Laugh") then
		RunConsoleCommand("act", "laugh")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Zombie") then
		RunConsoleCommand("act", "zombie")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Agree") then
		RunConsoleCommand("act", "agree")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Disagree") then
		RunConsoleCommand("act", "disagree")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Forward") then
		RunConsoleCommand("act", "forward")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Back") then
		RunConsoleCommand("act", "becon")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Salute") then
		RunConsoleCommand("act", "salute")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Wave") then
		RunConsoleCommand("act", "wave")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Pose") then
		RunConsoleCommand("act", "pers")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Halt") then
		RunConsoleCommand("act", "halt")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Group") then
		RunConsoleCommand("act", "group")
	end
	
	if(gBool("More...", "More...", "Flashlight Spam")) then
		RunConsoleCommand("impulse", "100" )
	end

	if(gBool("ESP", "Misc", "Name Stealer") && gOption("ESP", "Misc", "Steal Type") == "Normal") then
	local player = player;
	local math = math;
	local randply = player.GetAll()[math.random(#player.GetAll())]
	local friendstatus = pm.GetFriendStatus(randply);
	local rank = pm.IsAdmin(randply);
	GAMEMODE:RemoveHook("Think", "nametaker2")
	GAMEMODE:AddHook("Think", "nametaker", function()
		if (!randply:IsValid() || randply == me || friendstatus == "friend" || rank ) then return; end
		_fhook_changename(randply:Name().." ");
		end)
	elseif(!gBool("ESP", "Misc", "Name Stealer") && gOption("ESP", "Misc", "Steal Type") == "DarkRP") then
	GAMEMODE:RemoveHook("Think", "nametaker")
	GAMEMODE:AddHook("Think", "nametaker2", function()
		_fhook_changename(myName);
		end)
	end

if(gBool("ESP", "Misc", "Name Stealer") && gOption("ESP", "Misc", "Steal Type") == "DarkRP") then
	namechangeTime = namechangeTime + 1;
	if namechangeTime > 500 then
	RunConsoleCommand("say", "/name "..randomname[math.random(#randomname)]);
	namechangeTime = 0;
	end
	end
end

local function OriginCam()
	if(!gBool("ESP", "Misc", "Mirror")) then return; end
	local CamData = {}
	CamData.angles = Angle(180,LocalPlayer():EyeAngles().yaw,180)
	CamData.origin = LocalPlayer():GetPos()+Vector(10,0,65)
	CamData.x = 650
	CamData.y = 0
	CamData.w = ScrW() / 3
	CamData.h = ScrH() / 5
	render.RenderView( CamData )
end
hook.Add("HUDPaint", "OriginCam", OriginCam)

GAMEMODE:AddHook("Think", "", Think)

local function Filter(v)
	if(gBool("Settings", "Filter", "ESP")) then
	local friendstatus = pm.GetFriendStatus(v)
		if friendstatus == "friend" then return true end
		local dist = gBool("Settings", "Filter", "Distance")
			if( vm.Distance( em.GetPos(v), em.GetPos(me) ) > (dist * 5) ) then return false end
		end
	return true
end

local function GetChamsColor(v)
        if(pm.Team(v) == pm.Team(me)) then
			local r = gInt("Settings", "Team Chams Color", "Red")
			local g = gInt("Settings", "Team Chams Color", "Green")
			local b = gInt("Settings", "Team Chams Color", "Blue")
			return(Color(r, g, b, 220))
        end
			local r = gInt("Settings", "Enemy Chams Color", "Red")
			local g = gInt("Settings", "Enemy Chams Color", "Green")
			local b = gInt("Settings", "Enemy Chams Color", "Blue")
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
if(gBool("ESP", "ESP", "XQZ")) then
		cam.Start3D();
			cam.IgnoreZ(true);
			em.DrawModel(v);
			cam.IgnoreZ(false);
		cam.End3D();
	end
if(gBool("ESP", "ESP", "Chams")) then
local col = gBool("ESP", "Misc", "Team Colors") && team.GetColor(pm.Team(v)) || GetChamsColor(v);
	local wep = v:GetActiveWeapon()
	if wep:IsValid() then
	cam.Start3D();
	render.MaterialOverride(chamsmat);
	render.SetColorModulation(col.r/255, col.g/255, col.b/255, 255);
	em.DrawModel(wep);
	render.SetColorModulation(col.r/170, col.g/170, col.b/170, 255);
	render.MaterialOverride(chamsmat2);
	em.DrawModel(wep);
	cam.End3D();
	end

	cam.Start3D();
	render.MaterialOverride(chamsmat);
	render.SetColorModulation(col.b / 255, col.r / 255, col.g / 255);
	em.DrawModel(v);
	render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255);
	render.MaterialOverride(chamsmat2);
	em.DrawModel(v);
	render.SetColorModulation(1, 1, 1);
	cam.End3D();
	end
end

local Matinfo = {
["$basetexture"] = "models/debug/debugwhite",
["$model"]       = 1,
["$nocull"]      = 1,
["$ignorez"]     = 1
}

mat1 = (CreateMaterial( "chams", "VertexLitGeneric", Matinfo ))
mat2 = (CreateMaterial( "wireframe", "Wireframe", Matinfo ))
trans = Color(0, 255, 0, 80)
trans2 = Color(0, 255, 100)
trans3 = Color(255, 155, 0, 200)
 
function Xray()
if(gBool("ESP", "ESP", "Transparent Chams")) then
local ColScheme = Color(gInt("Settings", "Team Chams Color", "Red"), gInt("Settings", "Team Chams Color", "Green"), gInt("Settings", "Team Chams Color", "Blue"), gInt("Settings", "Enemy Chams Color", "Red"), gInt("Settings", "Enemy Chams Color", "Green"), gInt("Settings", "Enemy Chams Color", "Blue")), 100
local ColSchemeV = Vector(gInt("Settings", "Team Chams Color", "Red"), gInt("Settings", "Team Chams Color", "Green"), gInt("Settings", "Team Chams Color", "Blue"), gInt("Settings", "Enemy Chams Color", "Red"), gInt("Settings", "Enemy Chams Color", "Green"), gInt("Settings", "Enemy Chams Color", "Blue") / 255)
local ColSchemeV2 = Vector(math.Clamp(ColSchemeV.x + 0.2, 0, 1), math.Clamp(ColSchemeV.y + 0.5, 0, 1), math.Clamp(ColSchemeV.z + 0.2, 0, 1))
    if !xray then
        xray = true
        hook.Add("HUDPaint", "xxrayz", function()
            for k,v in pairs(ents.GetAll()) do
                local position = (v:GetPos()+Vector(0,0,80)):ToScreen()
                if v:IsPlayer() && v:Alive() then    
                    cam.Start3D(EyePos(),EyeAngles())
                    v:SetMaterial(mat2)
                    v:SetRenderMode(4)
                    v:SetColor(ColScheme)
                    render.SuppressEngineLighting( true )
                    render.MaterialOverride( mat1 )
                    render.SetColorModulation( ColSchemeV2.x, ColSchemeV2.y, ColSchemeV2.z )
                    render.SetBlend(0.3)
                    v:DrawModel()
                    render.SetBlend(1)
                    render.SuppressEngineLighting( false )
                    render.MaterialOverride( )
                    cam.End3D()
                end
            end
        end)
        end
    elseif xray then
        xray = false
        for k,v in pairs(ents.GetAll()) do
            if v:GetClass()==("prop_door_rotating") or v:GetClass()==("func_door_rotating") or v:GetClass()== "prop_physics" or v:IsPlayer() then
                v:SetMaterial("")
                v:SetColor(Color(255,255,255))
            end
        end
        hook.Remove("HUDPaint", "xxrayz")
    end
end

local duckTime = 0
local function Bunnyhop(pCmd)
	local duckEstimate = math.Round(58 + 1 / engine.TickInterval())
	if(not gBool("ESP", "Misc", "Auto-Strafing BHop") or em.GetMoveType(me) == MOVETYPE_NOCLIP or me:Health() < 1) then return end
	if(not me:IsOnGround()) then
			pCmd:RemoveKey(2)
			duckTime = duckTime + 1
	if(pCmd:GetMouseX() > 1 or pCmd:GetMouseX() < -1) then
		if(pCmd:GetMouseX() < 0) then
			pCmd:SetSideMove(-10000)
		else
			pCmd:SetSideMove(10000)
		end
	else
			pCmd:SetForwardMove(10000 / me:GetVelocity():Length2D())
			pCmd:SetSideMove((pCmd:CommandNumber() % 2) == 0 and -10000 or 10000)
		end
	else
		if(pCmd:KeyDown(2)) then
			pCmd:SetForwardMove(10000)
		end
	end
end

function idiot.DuckJump(pCmd)
	if(gBool("Aimbot", "HvH", "Air Duck")) then
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

function idiot.CheckTeam(v)
	if not (v:IsPlayer()) then
		return false
	end
	
	if (v == ply) then
		return true
	end
	
	if (idiot.engine.ActiveGamemode() == "terrortown") then
		if (v.Detected and not ply:IsTraitor()) then
			return false
		elseif (ply:IsTraitor() and not v:IsTraitor()) then
			return false
		end
		
		return true
	else
		return ply:Team() == v:Team()
	end
end

function idiot.TraitorDetector()
	if (idiot.engine.ActiveGamemode() ~= "terrortown") then return end
	if(gBool("ESP", "ESP", "Traitor Finder")) then
	for k, v in idiot.ipairs(idiot.ents.GetAll()) do
		local _v = v:GetOwner()
		if (_v == ply ) then continue end
		if (idiot.GetRoundState() == 3 and v:IsWeapon() and _v:IsPlayer() and not _v.Detected and idiot.table.HasValue(v.CanBuy, 1)) then
			if (_v:GetRole() ~= 2) then
				_v.Detected = true
				surface.PlaySound("npc/scanner/combat_scan1.wav")
				chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 0, 255 ), _v:Nick(), Color( 255, 255, 255 ), " is a Traitor. He just bought: ", Color( 255, 255, 0 ), v:GetPrintName())
			end
		elseif (idiot.GetRoundState() ~= 3) then
			v.Detected = false
		end
	end
end
end

idiot.AddHook("Think", function()
	idiot.TraitorDetector()
end)

GAMEMODE:AddHook("PreDrawSkyBox", "", function()
	if (not gBool("More...", "More...", "No Sky")) then return end
		render.Clear(0, 0, 0, 255)
	return true
end )

local wireframeMat = Material("models/wireframe")
GAMEMODE:AddHook("PreDrawViewModel", "", function()
	if(not gBool("More...", "Viewmodel", "Wireframe") or gBool("ESP", "Misc", "Thirdperson")) then return end
	local WepMat = Material("models/wireframe")
	render.MaterialOverride(WepMat)
	render.SetColorModulation(gInt("More...", "Viewmodel", "Red") /255,gInt("More...", "Viewmodel", "Green") /255,gInt("More...", "Viewmodel", "Blue") / 255 )
end )

GAMEMODE:AddHook("PreDrawPlayerHands", "", function()
	if(gBool("More...", "Viewmodel", "No Hands") or gBool("ESP", "Misc", "Thirdperson")) then
		return true
	else
		return false
	end
end )

idiot.AddHook("CalcView", function(ply, pos, ang, fov)
	if(!gBool("More...", "Custom FoV", "Enabled")) then return; end
	if(gBool("ESP", "Misc", "Thirdperson")) then return; end
	local view = {}
	view.origin = pos
	view.angles = angles
	view.fov = gInt("More...", "Custom FoV", "FoV")
	if (ply:Health() > 0 and ply:GetMoveType() ~= 10 and ply:GetObserverTarget() == nil) then
		if (gBool("Aimbot", "More...", "No Recoil")) then
			view.origin = ply:EyePos()
			view.angles = ply:EyeAngles()
		end
	end
	return view
end)

local randomresponse = {
"shut up",
"ok",
"who",
"nobody cares fgt",
"where",
"XD stop spamming",
"what",
"yea",
}

 gameevent.Listen("player_say");
    hook.Add("player_say", "", function()
	if(!gBool("More...", "Auto-Response", "Enabled")) then return; end
		if(gOption("More...", "Auto-Response", "Say                as Response") == "shut up") then
		RunConsoleCommand("say", "shut up")
		elseif(gOption("More...", "Auto-Response", "Say                as Response") == "ok") then
		RunConsoleCommand("say", "ok")
		elseif(gOption("More...", "Auto-Response", "Say                as Response") == "who") then
		RunConsoleCommand("say", "who")
		elseif(gOption("More...", "Auto-Response", "Say                as Response") == "nobod...") then
		RunConsoleCommand("say", "nobody cares fgt")
		elseif(gOption("More...", "Auto-Response", "Say                as Response") == "where") then
		RunConsoleCommand("say", "where")
		elseif(gOption("More...", "Auto-Response", "Say                as Response") == "XD sto...") then
		RunConsoleCommand("say", "XD stop spamming")
		elseif(gOption("More...", "Auto-Response", "Say                as Response") == "what") then
		RunConsoleCommand("say", "what")
		elseif(gOption("More...", "Auto-Response", "Say                as Response") == "yea") then
		RunConsoleCommand("say", "yea")
		elseif(gOption("More...", "Auto-Response", "Say                as Response") == "Random") then
		RunConsoleCommand("say", randomresponse[math.random(#randomresponse)])
		end
	end)

function AutoReload(pCmd)
local wep = ply:GetActiveWeapon()
if(not gBool("More...", "AutoReload", "Enabled")) then return end
	if (ply:Alive() and idiot.IsValid(wep)) then
		if (wep:Clip1() <= (gInt("More...", "AutoReload", "AutoReload at")) and wep:GetMaxClip1() > 0 and idiot.CurTime() > wep:GetNextPrimaryFire()) then
			pCmd:SetButtons(pCmd:GetButtons() + IN_RELOAD)
		end
	end
end

idiot.AddHook("OnPlayerChat", function(v, text, team)
	if (!gBool("More...", "Chat", "Copy Messages")) then return end
	if (v ~= ply) then
		if (team) then
			ply:ConCommand("say_team '" .. text .. "' - " .. v:Nick())
		else
			ply:ConCommand("say '" .. text .. "' - " .. v:Nick())
			end
		end
	end)

local function WeaponShootable()
    local wep = pm.GetActiveWeapon(me);
    if( em.IsValid(wep) ) then
	    local n = string.lower(wep:GetPrintName())
	    if( wep:Clip1() <= -1 ) then
		   return;
		end
		if( string.find(n,"knife") or string.find(n,"grenade") or string.find(n,"sword") or string.find(n,"bomb") or string.find(n,"ied") or string.find(n,"c4") or string.find(n,"slam") or string.find(n,"climb") or string.find(n,"fist") or string.find(n,"crossbow") or string.find(n,"gravitygun")) then
		   return false;
		end
	return true;
	end
end

local function GetColor(v)
    if(pm.Team(v) == pm.Team(me)) then
		local r = gInt("Settings", "Team ESP Color", "Red")
		local g = gInt("Settings", "Team ESP Color", "Green")
		local b = gInt("Settings", "Team ESP Color", "Blue")
		return(Color(r, g, b, 220))
    end
		local r = gInt("Settings", "Enemy ESP Color", "Red")
		local g = gInt("Settings", "Enemy ESP Color", "Green")
		local b = gInt("Settings", "Enemy ESP Color", "Blue")
	return(Color(r, g, b, 220))
end

local function GetColor2(v)
    if(pm.Team(v) == pm.Team(me)) then
		local r = gInt("Settings", "Team ESP Color", "Red")
		local g = gInt("Settings", "Team ESP Color", "Green")
		local b = gInt("Settings", "Team ESP Color", "Blue")
			return(Color(r, g, b, 25))
    end
	local r = gInt("Settings", "Enemy ESP Color", "Red")
	local g = gInt("Settings", "Enemy ESP Color", "Green")
	local b = gInt("Settings", "Enemy ESP Color", "Blue")
		return(Color(r, g, b, 25))
end

local INT_MAX = 2147483647

local corners = {}
local screen = {}

local function GetCorners( e )
	local mins, maxs = em.OBBMins( e ), em.OBBMaxs( e )
	local pos = em.GetPos( e )

	corners = {
		Vector( mins.x, mins.y, mins.z ),
		Vector( mins.x, mins.y, maxs.z ),
		Vector( mins.x, maxs.y, mins.z ),
		Vector( mins.x, maxs.y, maxs.z ),
		Vector( maxs.x, mins.y, mins.z ),
		Vector( maxs.x, mins.y, maxs.z ),
		Vector( maxs.x, maxs.y, mins.z ),
		Vector( maxs.x, maxs.y, maxs.z )
	}

	local x1, y1, x2, y2 = INT_MAX, INT_MAX, 0, 0

	for k, v in next, corners do
		screen = vm.ToScreen( pos + v )

		if ( screen ) then
			x1, y1 = math.min( x1, screen.x ), math.min( y1, screen.y )
			x2, y2 = math.max( x2, screen.x ), math.max( y2, screen.y )
		end
	end

	if ( x1 ~= INT_MAX ) and ( y1 ~= INT_MAX ) and ( x2 ~= 0 ) and ( y2 ~= 0 ) then
		return x1, y1, x2 - x1, y2 - y1
	end
end

local function ESP(v)
	local pos = em.GetPos(v);
	local min, max = em.GetCollisionBounds(v);
	local pos2 = pos + Vector(0, 0, max.z);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local hh = 0;
	local h = pos.y - pos2.y;
	local w = h / 2;
	local col = gBool("ESP", "Misc", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v);
	local col2 = gBool("ESP", "Misc", "Team Colors") && team.GetColor(pm.Team(v), 25) || GetColor2(v);
	local ocol = gBool("Misc", "Autism") && HSVToColor(RealTime()*33%360,1,1) || Color(0,0,0);
	local color = team.GetColor(pm.Team(v));
	local hh = 0;

	if(gBool("ESP", "ESP", "Box") && gOption("ESP", "ESP", "Box Type") == "2D Box") then
		local friendstatus = pm.GetFriendStatus(v);
		if (friendstatus == "friend") then
			surface.SetDrawColor(HSVToColor(RealTime()*65%360,1,1));
			surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h);
			surface.SetDrawColor(ocol);
			surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);
			surface.DrawOutlinedRect( pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
		else
			surface.SetDrawColor(col);
			surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h);
			surface.SetDrawColor(ocol);
			surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);
			surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
		hook.Remove( "HUDPaint", "3D-Box", function()
			end)
		end
	end

	if(gBool("ESP", "ESP", "Box") && gOption("ESP", "ESP", "Box Type") == "3D Box") then
		local eye = v:EyeAngles();
		local min, max = v:WorldSpaceAABB();
		local origin = v:GetPos();
		local friendstatus = pm.GetFriendStatus(v);
		if (friendstatus == "friend") then
			cam.Start3D()
			render.DrawWireframeBox( origin,  Angle(0, eye.y, 0), min-origin, max-origin, HSVToColor(RealTime()*65%360,1,1))
			cam.End3D()
		end
	end

	if(gBool("ESP", "ESP", "Box") && gOption("ESP", "ESP", "Box Type") == "3D Box") then
		hook.Add( "HUDPaint", "3D-Box", function()
	for k,v in pairs(player.GetAll()) do
		if v != LocalPlayer() and v:IsValid() and v:Alive() and v:Health() >= 0 then
			local eye = v:EyeAngles();
			local min, max = v:WorldSpaceAABB();
			local origin = v:GetPos();
			cam.Start3D()
				render.DrawWireframeBox( origin,  Angle(0, eye.y, 0), min-origin, max-origin, Color(gInt("Settings", "Team ESP Color", "Red"), gInt("Settings", "Team ESP Color", "Green"), gInt("Settings", "Team ESP Color", "Blue"), gInt("Settings", "Enemy ESP Color", "Red"), gInt("Settings", "Enemy ESP Color", "Green"), gInt("Settings", "Enemy ESP Color", "Blue")))
			cam.End3D()
		end
		hook.Remove( "HUDPaint", "3D-Box", function()
		end)
	end
	end)
	end

	surface.SetFont("ESPFont");
	surface.SetTextColor(255, 255, 255);

	if(gBool("ESP", "ESP", "Healthbar")) then
		local col = Color(( 100 - em.Health(v) ) * 2.55, em.Health(v) * 2, 0, 255);
		local hp = em.Health(v) * h / 100;
		if(hp > h) then hp = h; end
		local diff = h - hp;
		surface.SetDrawColor(0, 0, 0, 255);
		surface.DrawRect(pos.x - w / 2 - 8, pos.y - h - 1, 5, h + 2);
		surface.SetDrawColor( ( 100 - em.Health(v) ) * 2.55, em.Health(v) * 2.55, 0, 255);
		surface.DrawRect(pos.x - w / 2 - 7, pos.y - h + diff, 3, hp);
	end

	if(gBool("ESP", "ESP", "Name")) then
        local col1 = Color(255,255,255)
		local col2 = Color(100,100,255);
		local friendstatus = pm.GetFriendStatus(v);
		draw.SimpleText(pm.Name(v), "ESPFont", pos.x, pos.y - h - 1 - (friendstatus == "friend" && 12 || 12), col1, 1, 1);
		if (friendstatus == "friend") then
		draw.SimpleText("Friend", "ESPFont", pos.x, pos.y - h - 13 - 13, HSVToColor(RealTime()*65%360,1,1), 1, 1);
		end
	end

	if(gBool("ESP", "ESP", "Health Value")) then
		hh = hh + 1;
		local col1 = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2, 0);
		draw.SimpleText(em.Health(v).."HP", "ESPFont", pos.x, pos.y - 2 + hh, col1, 1, 0);
		hh = hh + 9;
	end

	if(gBool("ESP", "ESP", "Weapon")) then
		hh = hh + 1;
		local w = pm.GetActiveWeapon(v);
		if(w && em.IsValid(w)) then
		local col = Color(200,150,150);
		draw.SimpleText(w:GetPrintName(), "ESPFont", pos.x, pos.y - 0 + hh, col, 1, 0);
		hh = hh + 9;
		end
	end

	if(gBool("ESP", "ESP", "Rank")) then
	hh = hh + 1;
	local col = Color(255,255,255);
	draw.SimpleText(pm.GetUserGroup(v), "ESPFont", pos.x, pos.y - 0 + hh, col, 1, 0);
	hh = hh + 9;
	end

	if(gBool("ESP", "ESP", "Ping")) then
	hh = hh + 1;
	local col1 = Color(v:Ping() * 2.55, 255 - v:Ping() - 5 * 2, 0);
	draw.SimpleText(v:Ping().."ms", "ESPFont", pos.x, pos.y - -2 + hh, col1, 1, 0);
	hh = hh + 9;
	end
	
	if(gBool("ESP", "ESP", "Money")) then
		hh = hh + 1;
		if (gmod.GetGamemode().Name == "DarkRP") then
		local col1 = Color(0,150,0);
		if (v:getDarkRPVar("money") == nil) then return end;
		local cash = v:getDarkRPVar("money")
		draw.SimpleText(cash.."$", "ESPFont", pos.x, pos.y - 2 + hh, col1, 1, 0);
		hh = hh + 9;
		end
	end

	if(gBool("ESP", "ESP", "Skeleton")) then
		local col = gBool("ESP", "Misc", "Team Colors") && team.GetColor(pm.Team(v)) || GetColor(v);
		local pos = em.GetPos(v);
		for i = 0, em.GetBoneCount(v) do
		local parent = em.GetBoneParent(v, i);
		if(!parent) then continue; end
		local bonepos = em.GetBonePosition(v, i);
		if(bonepos == pos) then continue; end
		local parentpos = em.GetBonePosition(v, parent);
		if(!bonepos || !parentpos) then continue; end
		local screen1, screen2 = vm.ToScreen(bonepos), vm.ToScreen(parentpos);
		surface.SetDrawColor(gInt("Settings", "Skeleton ESP Color", "Red"), gInt("Settings", "Skeleton ESP Color", "Green"), gInt("Settings", "Skeleton ESP Color", "Blue"));
		surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y);
		end
	end

	if(gBool("ESP", "ESP", "Health Skeleton")) then
			local origin = em.GetPos(v);
			for i = 1, em.GetBoneCount(v) do
					local parent = em.GetBoneParent(v, i);
					if(!parent) then continue; end
					local bonepos, parentpos = em.GetBonePosition(v, i), em.GetBonePosition(v, parent);
					if(!bonepos || !parentpos || bonepos == origin) then continue; end
					local bs, ps = vm.ToScreen(bonepos), vm.ToScreen(parentpos);
					local hp = em.Health(v) * h / 100;
			if(hp > h) then hp = h; end
			local diff = h - hp;
			surface.SetDrawColor(0, 0, 0, 255);
			surface.SetDrawColor( ( 100 - em.Health(v) ) * 2.55, em.Health(v) * 2.55, 0, 255);
			surface.DrawLine(bs.x, bs.y, ps.x, ps.y);
		end
	end
end

local aimtarget
GAMEMODE:AddHook("DrawOverlay", "", function()

	if mode == 0 and fs then
		if not rec then
			rec = Material( 'gmod/recording.png' )
		end

		surface.SetDrawColor( color_white )
		surface.SetMaterial( rec )
		surface.DrawTexturedRect( ScrW() - 512, 0, 512, 256, 0 )
	end

	if mode == 1 then
		local prev
		for k, v in next, waypoints do
			local scr = vm.ToScreen(v)
			if not scr.visible then continue end

		if prev and prev.x and prev.y then
			surface.SetDrawColor( color_white )
			surface.DrawLine( prev.x, prev.y, scr.x, scr.y )
		end

			DrawFancyBox( v, next_waypoint == k and Color(0, 225, 0) or Color(255, 0, 100) )
			prev = scr
		end
	end

	if(aimtarget and em.IsValid(aimtarget) and gBool("Aimbot", "More...", "Snap Lines")) then
		if em.Health(me) > 0 then
			local col = Color(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue"), 125)
			local pos = vm.ToScreen(em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)))
			surface.SetDrawColor(col)
			surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y)
			surface.SetDrawColor(0,0,0)
			surface.DrawOutlinedRect(pos.x -2, pos.y -2, 5, 5)
			surface.SetDrawColor(gInt("Settings", "Crosshair Color", "Red"),gInt("Settings", "Crosshair Color", "Green"),gInt("Settings", "Crosshair Color", "Blue"))
			surface.DrawRect(pos.x -1, pos.y -1, 3, 3)
		end
	end

	if(gBool("ESP", "ESP", "Enabled")) then
		for k,v in next, IdiotBox.pGetAll() do
		if( v == me or not em.IsValid(v) or em.Health(v) < 0.1 or em.IsDormant( v ) or pm.Team(v) == TEAM_SPECTATOR) then continue end
		if(not Filter(v)) then continue end
			ESP(v)
		end
	end

	if(gBool("ESP", "ESP", "Entities")) then
		MESP()
	end
	
	if(gBool("ESP", "ESP", "Traitor Finder")) then
	tfinder();
	end

	if(gBool("ESP", "Misc", "Radar")) then
		RadarDraw()
	end

	if(gBool("More...", "More...", "Custom Stats")) then
		Logo()
		Status()
	end

	if(gBool("ESP", "Misc", "Spectators")) then
		spectator()
	end
	
	if(gBool("More...", "More...", "Crosshair")) then
	crosshair()
	end
end)

GAMEMODE:AddHook("RenderScreenspaceEffects", "", function()
	if(not gBool("ESP", "ESP", "Enabled")) then return end
		for k,v in next, IdiotBox.pGetAll() do
		if(not em.IsValid(v) or em.Health(v) < 1 or v == me or pm.Team(v) == TEAM_SPECTATOR) then continue end
		if(not Filter(v)) then continue end
			Chams(v);
			Xray();
	end
end )

local fa;
local aa;
local oldAngles = Angle();
local function normalizeAngle(ang)
	ang.p = math.NormalizeAngle(ang.p);
	ang.p = math.Clamp(ang.p, -89, 89);
	ang.y = math.NormalizeAngle(ang.y);
end

--fix movement
local function FixMovement(pCmd)
	local vec = Vector(cm.GetForwardMove(pCmd), cm.GetSideMove(pCmd), 0);
	local vel = math.sqrt(vec.x*vec.x + vec.y*vec.y);
	local mang = vm.Angle(vec);
	local yaw = cm.GetViewAngles(pCmd).y - fa.y + mang.y;
	if (((cm.GetViewAngles(pCmd).p+90)%360) > 180) then
	yaw = 180 - yaw;
	end
	yaw = ((yaw + 180)%360)-180;
	pCmd:SetForwardMove(math.cos(math.rad(yaw)) * vel);
	pCmd:SetSideMove(math.sin(math.rad(yaw)) * vel);
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
	ang.x = math.NormalizeAngle(ang.x)
	ang.p = math.Clamp(ang.p, -89, 89)
end

local trace_walls = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
local NoPenetration = {[MAT_SLOSH] = true}
local PenMod = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
local trace_normal = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)

local function fasAutowall(wep, startPos, aimPos, ply)
	if not gBool("Aimbot", "More...", "Auto Wall") then return end
    local traces = {}
    local traceResults = {}
    local dir = (aimPos - startPos):GetNormalized()
    traces[1] = { start = startPos, filter = me, mask = trace_normal, endpos = aimPos, }
    traceResults[1] = util.TraceLine(traces[1])
    if(NoPenetration[traceResults[1].MatType]) then return false end
    if(-dir:DotProduct(traceResults[1].HitNormal) <= .26) then return false end

    traces[2] = { start = traceResults[1].HitPos, endpos = traceResults[1].HitPos + dir * wep.PenStr * (PenMod[traceResults[1].MatType] or 1) * wep.PenMod, filter = me, mask = trace_walls, }
    traceResults[2] = util.TraceLine(traces[2])
    traces[3] = { start = traceResults[2].HitPos, endpos = traceResults[2].HitPos + dir * .1, filter = me, mask = trace_normal, }
    traceResults [3] = util.TraceLine(traces[3])
    traces[4] = { start = traceResults[2].HitPos, endpos = aimPos, filter = me, mask = MASK_SHOT, }
    traceResults[4] = util.TraceLine(traces[4])
    if(traceResults[4].Entity ~= ply) then return false end
    return(not traceResults[3].Hit)
end

local function m9kAutowall(wep)
	if not gBool("Aimbot", "More...", "Auto Wall") then return end
	local wep = me:GetActiveWeapon()
    local trace = {
        endpos = aimPos,
        start = me:EyePos(),
        mask = MASK_SHOT,
        filter = me,
    }
    return wep:BulletPenetrate(10, nil, util.TraceLine(trace), DamageInfo())
end

local function AntiAFK()
if(!gBool("Aimbot", "More...", "Anti-AFK")) then
	timer.Create("afk1", 6, 0, function()
	local commands = {"moveleft", "moveright", "moveup", "movedown"}
	local command1 = table.Random( commands )
	local command2 = table.Random( commands )
	timer.Create("afk2", 1, 1, function()
	RunConsoleCommand( "+"..command1 ) RunConsoleCommand( "+"..command2 )
	end)
	timer.Create("afk3", 4, 1, function()
	RunConsoleCommand( "-"..command1 ) RunConsoleCommand( "-"..command2 )
	end)
	end)
	end
end

local table = Copy(table);
local dists = {};
local function GetPos(v)
	if(gBool("Aimbot", "Aim Options", "Ignore Head")) then return(em.LocalToWorld(v, em.OBBCenter(v))); end
	local eyes = em.LookupAttachment(v, "eyes");
	if(!eyes) then return( em.LocalToWorld(v, em.OBBCenter(v))); end
	local pos = em.GetAttachment(v, eyes);
	if(!pos) then return( em.LocalToWorld(v, em.OBBCenter(v))); end
	return(pos.Pos);
end

idiot.AddHook("entity_killed", function(data)
	if(!gBool("More...", "Chat", "Death Notify")) then return end

	local inflictor = idiot.Entity(data.entindex_inflictor)
	local killer = idiot.Entity(data.entindex_attacker)
	local victim = idiot.Entity(data.entindex_killed)

	if (idiot.IsValid(killer) and idiot.IsValid(victim) and killer:IsPlayer() and victim:IsPlayer()) then
	idiot.surface.PlaySound("buttons/lightswitch2.wav")
		if (killer == victim and victim ~= ply) then
			chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), victim:Nick() .. " killed themself.")
		elseif (killer == victim and victim == ply) then
			chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "You killed yourself.")
		elseif (killer == ply) then
			chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "You killed " .. victim:Nick() .. ".")
		elseif (victim == ply) then
			chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "You were killed by " .. killer:Nick() .. ".")
		else
			chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), killer:Nick() .. " killed " .. victim:Nick() .. ".")
		end
	elseif (idiot.IsValid(victim) and not killer:IsPlayer() and victim:IsPlayer()) then
	idiot.surface.PlaySound("buttons/lightswitch2.wav")
		if (idiot.IsValid(inflictor) and inflictor:GetClass() == "prop_physics") then
			if (victim == ply) then
				chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "You were killed by a prop.")
			else
				chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), victim:Nick() .. " was killed by a prop.")
			end
		elseif (victim == ply) then
			chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "You were killed by life.")
		else
			chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), victim:Nick() .. " was killed by life.")
		end
	end
end)

local aimignore;
local function Valid(v)
    local wep = me:GetActiveWeapon();
    if(!v || !em.IsValid(v) || v == me || em.Health(v) < 1 || em.IsDormant(v) || pm.Team(v) == 1002 || (v == aimignore && gOption("Aimbot", "Aim Options", "Priority") == "Random")) then return false; end
    if(gBool("Aimbot", "Aim Options", "Ignore Team")) then
        if(pm.Team(v) == pm.Team(me)) then return false; end
    end
    if(gBool("Aimbot", "Aim Options", "Ignore Friends")) then
        if(pm.GetFriendStatus(v) == "friend") then return false; end
    end
		if(gBool("Aimbot", "Aim Options", "Ignore Bots")) then
		if(pm.IsBot(v)) then return false; end
	end
    if(gBool("Aimbot", "Aim Options", "Ignore Admins")) then
        if pm.IsAdmin(v) then return false; end
    end
    if(gBool("Aimbot", "Aim Options", "Ignore Vehicles")) then
		if pm.InVehicle(v) then return false; end
	end
	if(gBool("Aimbot", "Aim Options", "Ignore Noclip")) then
		if (em.GetMoveType(v) == MOVETYPE_NOCLIP) then return false; end
	end
	if(gBool("Aimbot", "Aim Options", "Disable in Noclip")) then
		if (em.GetMoveType(me) == MOVETYPE_NOCLIP) then return false; end
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
        return fasAutowall(wep, tr.start, tr.endpos, v)
	elseif (wep and wep:IsValid() and wep.BulletPenetrate) then
		return m9kAutowall(wep, tr.start, tr.endpos, v)
    end
    return false
end

local function gettarget()
local opt = gOption("Aimbot", "Aim Options", "Priority");
local sticky = gOption("Aimbot", "Aimbot", "Target Lock");

if(opt == "Distance") then
	if( sticky && Valid(aimtarget) ) then return; end
	dists = {};
	for k,v in next, player.GetAll() do
			if(!Valid(v)) then continue; end
			dists[#dists + 1] = { vm.Distance( em.GetPos(v), em.GetPos(me) ), v };
	end
	table.sort(dists, function(a, b)
			return(a[1] < b[1]);
	end);
	aimtarget = dists[1] && dists[1][2] || nil;
elseif(opt == "Health") then
	if( !sticky && Valid(aimtarget) ) then return; end
	dists = {};
	for k,v in next, player.GetAll() do
			if(!Valid(v)) then continue; end
			dists[#dists + 1] = { em.Health(v), v };
	end
	table.sort(dists, function(a, b)
			return(a[1] < b[1]);
	end);
	aimtarget = dists[1] && dists[1][2] || nil;
elseif(opt == "Random") then
if( !sticky && Valid(aimtarget) ) then return; end
	aimtarget = nil;
	local allplys = player.GetAll();
	local avaib = {};
	for k,v in next,allplys do
			avaib[math.random(100)] = v;
	end
	for k,v in next, avaib do
			if(Valid(v)) then
					aimtarget = v;
			end
	end
end
end

local cones = {}
local pcall = pcall
local require = require
local nullvec = Vector() * -1
local IsFirstTimePredicted = IsFirstTimePredicted
local CurTime = CurTime
local servertime = 0
local bit = Copy(bit)

local badSequences = {
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

GAMEMODE:AddHook("Move", "", function()
    if(IsFirstTimePredicted()) then
        servertime = CurTime() + engine.TickInterval()
    end
end )

local function WeaponCanFire()
local w = pm.GetActiveWeapon(me);
if(!w || !em.IsValid(w) || !gBool("Aimbot", "More...", "Bullet Time")) then return true; end
return( servertime >= wm.GetNextPrimaryFire(w) );
end

GAMEMODE["EntityFireBullets"] = function(self, p, data)
	aimignore = aimtarget
	local w = pm.GetActiveWeapon(me)
	local Spread = data.Spread * -1
	if(not w or not em.IsValid(w) or cones[em.GetClass(w)] == Spread or Spread == nullvec) then return end
	cones[em.GetClass(w)] = Spread
end

local function PredictSpread(pCmd, ang)
	local w = pm.GetActiveWeapon(me)
	if(not w or not em.IsValid(w) or not cones[em.GetClass(w)] or not gBool("Aimbot", "More...", "No Spread")) then return am.Forward(ang) end
	return ( IdiotBox.Predict(pCmd, am.Forward(ang), cones[em.GetClass(w)]))
end

local function Autofire(pCmd)
	if(pm.KeyDown(me, 1)) then
		cm.SetButtons(pCmd, bit.band(cm.GetButtons(pCmd), bit.bnot(1)))
	else
		cm.SetButtons(pCmd, bit.bor(cm.GetButtons(pCmd), 1))
	end
end

local function PredictPos(pos)
local myvel = LocalPlayer():GetVelocity()
local pos = pos - (myvel * engine.TickInterval());
return pos;
end

local function aimkeycheck()
	if(gBool("Aimbot", "Aimbot", "Aim-Key:") == "None") then
		return true;
	end
	if(gBool("Aimbot", "Aimbot", "Aim-Key:") == "Scroll-Wheel Click") then
		if input.IsMouseDown(109) then return true; end
	end
	if(gBool("Aimbot", "Aimbot", "Aim-Key:") == "Left 'ALT' Key") then
		if input.IsKeyDown(KEY_LALT) then return true; end
	end
	if(gBool("Aimbot", "Aimbot", "Aim-Key:") == "The 'E' Key") then
		if input.IsKeyDown(15) then return true; end
	end
	if(gBool("Aimbot", "Aimbot", "Aim-Key:") == "The 'F' Key") then
		if input.IsKeyDown(KEY_F) then return true; end
	end
end

local function Aimbot(pCmd)
	if me:Health() < 1 then return; end
	if(cm.CommandNumber(pCmd) == 0 || !gBool("Aimbot", "Aimbot", "Enabled")) then return; end
	gettarget();
	aa = false;
	if(aimtarget && aimkeycheck() && WeaponShootable() && WeaponCanFire() ) then
		aa = true;
		local pos = GetPos(aimtarget) - em.EyePos(me);
		PredictPos(pos);
		local ang = vm.Angle(PredictSpread(pCmd, vm.Angle(pos)));
		NormalizeAngle(ang);
		cm.SetViewAngles(pCmd, ang);
		local wep = ply:GetActiveWeapon()
		local n = string.lower(wep:GetPrintName())
		if(gBool("Aimbot", "Aimbot", "Auto Fire")) then
			Autofire(pCmd)
		end
		if(gBool("Aimbot", "Aimbot", "Silent")) then
			FixMovement(pCmd);
		else
			fa = ang;
		end
		if(gBool("Aimbot", "Aimbot", "pSilent")) then
			bSendPacket = false
		end
	end
end

local FakeLagTick = 1

local spindirection = {
-gInt("Aimbot", "Anti-Aim", "Spinbot Speed"),
gInt("Aimbot", "Anti-Aim", "Spinbot Speed"),
}

local ox=-181;
local oy=0;

local function RandCoin()
	local randcoin = math.random(0,1);
	if(randcoin == 1) then return 1; else return -1; end
end

local function GetX()
	local opt = gOption("Aimbot", "Anti-Aim", "X-Axis");
	if( opt == "Up" ) then
		ox = 181;
	elseif( opt == "Down" ) then
		ox = -181;
	elseif(opt == "Jitter") then
		ox = ox * -1;
	elseif( opt == "Fake-Down") then
		ox = -180.000005;
	elseif(opt == "Fake-Angles") then
		ox = math.random(1, 180.000005, 1, 180.000005, 1, 180.000005);
	end
end

local function GetClosest()
	local ddists = {};
	local closest;
	for k,v in next, player.GetAll() do
	if(!Valid(v)) then continue; end
	ddists[#ddists + 1] = { vm.Distance( em.GetPos(v), em.GetPos(me) ), v };
	end
	table.sort(ddists, function(a, b)
	return(a[1] < b[1]);
	end);
	closest = ddists[1] && ddists[1][2] || nil;
	if(!closest) then return fa.y; end
	local pos = em.GetPos(closest);
	local pos = vm.Angle(pos - em.EyePos(me));
	return( pos.y );
end

local function GetY()
	local opt = gOption("Aimbot", "Anti-Aim", "Y-Axis");
	if( opt == "Sideways" ) then
		if(gOption("Aimbot", "Anti-Aim", "Spinbot Direction") == "Right") then
		oy = fa.y - 90;
		elseif(gOption("Aimbot", "Anti-Aim", "Spinbot Direction") == "Left") then
		oy = fa.y + 90;
	end
	elseif(opt == "Jitter") then
		oy = fa.y + math.random(-90, 90);
	elseif(opt == "FakeBackwards-Jitter") then
		oy = fa.y - 180 + math.random (0, -40);
	elseif(opt == "FakeBackwards") then
		oy = fa.y + math.random(1, -80, 1);
	elseif(opt == "SideSwitch") then
		oy = math.random(-631, 631);
	elseif(opt == "Wiggle") then
		oy = math.random (0, -40);
	elseif(opt == "Static") then
		oy = 0;
	elseif(opt == "Static-Inverted") then
        oy = 180;
	elseif(opt == "Spinbot") then
		if(gOption("Aimbot", "Anti-Aim", "Spinbot Direction") == "Left") then
        oy = (idiot.CurTime() * gInt("Aimbot", "Anti-Aim", "Spinbot Speed")) % 360, 0;
   		elseif(gOption("Aimbot", "Anti-Aim", "Spinbot Direction") == "Right") then
        oy = (idiot.CurTime() * -gInt("Aimbot", "Anti-Aim", "Spinbot Speed")) % 360, 0; 
	    end
	elseif(opt == "Fake-Sideways") then
		oy = fa.y + math.random(1, -40, 1);
	elseif(opt == "Fake-Angles #1") then
		oy = fa.y + math.random(1, 180, 1, 80, 1);
	elseif(opt == "Fake-Angles #2") then
		oy = fa.y + math.random(181, 361);
	end
end

local function Antiaim2()
	local eye = em.EyePos(me);
	local tr = util.TraceLine({
		start = eye,
		endpos = (eye + (am.Forward(fa) * 10)),
		mask = MASK_ALL,
	});
	if(tr.Hit) then
		ox = -181;
		oy = -90;
	end
end

local function Antiaim(pCmd)
	if( (cm.CommandNumber(pCmd) == 0 && !gBool("ESP", "Misc", "Thirdperson")) || cm.KeyDown(pCmd, 1) || cm.KeyDown(pCmd, 32) || em.GetMoveType(me) == MOVETYPE_LADDER || em.GetMoveType(me) == MOVETYPE_NOCLIP || aa || me:Health() < 1 || !gBool("Aimbot", "Anti-Aim", "Enabled")) then return; end
	GetX();
	GetY();
	Antiaim2();
	local aaang = Angle(ox, oy, 0);
	cm.SetViewAngles(pCmd, aaang);
	FixMovement(pCmd, true);
end

local function Fakelag(pCmd, Choke, Send)
	if not gBool("Aimbot", "More...", "Fake Lag") then return end
		if (pCmd:CommandNumber() == 0) then
			return true
		end
	if (not Choke) then
		Choke = gInt("Aimbot", "More...", "Lag Choke")
	end
	if (not Send) then
		Send = gInt("Aimbot", "More...", "Lag Send")
	end
	FakeLagTick = FakeLagTick + 1
	if (FakeLagTick > (Choke + Send)) then
		FakeLagTick = 0
	end
	if not (Send >= FakeLagTick) then
		bSendPacket = false
	end
	return true
end

/*
local tick = 0
local function fakeLag(pCmd)
	tick = tick + 1
    bSendPacket = (tick % (gInt("Aimbot", "More...", "Lag Choke") + 1)) == 0;
end
*/

local function GetAngle(ang)
	if(not gBool("Aimbot", "More...", "No Recoil")) then return ang + pm.GetPunchAngle(me) end
	return ang
end

local function rapidfire(pCmd)
	if(pm.KeyDown(me, 1)) then
		cm.SetButtons(pCmd, bit.band( cm.GetButtons(pCmd), bit.bnot( 1 ) ) )
	end
end

local function FakeAngs(pCmd)
	if(not fa) then fa = cm.GetViewAngles(pCmd) end
		fa = fa + Angle(cm.GetMouseY(pCmd) * .022, cm.GetMouseX(pCmd) * -.022, 0)
        NormalizeAngle(fa)
	//if(pCmd ~= nil or cm.CommandNumber(pCmd) == 0) then
		cm.SetViewAngles(pCmd, GetAngle(fa))
		//return
   // end
	if(cm.KeyDown(pCmd, 1)) then
			local ang = GetAngle(vm.Angle(PredictSpread(pCmd, fa ) ) )
			NormalizeAngle(ang)
			cm.SetViewAngles(pCmd, ang)
        end
end

GAMEMODE:AddHook("CreateMove", "", function(pCmd)
	Bunnyhop(pCmd);
	FakeAngs(pCmd);
	bSendPacket = true;
	if(pCmd:CommandNumber() != 0) then
	localindex = me:EntIndex();
	currentcommand = pCmd:CommandNumber();
	end
	local oldAngles = pCmd:GetViewAngles();
	AutoReload(pCmd);
	Aimbot(pCmd);
	Fakelag(pCmd)
	Antiaim(pCmd);
	RapidFire(pCmd);
	AntiAFK();
	idiot.DuckJump(pCmd);
	if(oldAngles != pCmd:GetViewAngles()) then
	local x = pCmd:GetViewAngles().x;
	end
end);

GAMEMODE:AddHook("ShouldDrawLocalPlayer", "", function()
	return(gBool("ESP", "Misc", "Thirdperson"))
end)

GAMEMODE:AddHook("CalcView", "", function(p, o, a, f)
	local view = {
		angles = GetAngle(fa),
		origin = (gBool("ESP", "Misc", "Thirdperson") and o + am.Forward(fa) * (gInt("ESP", "Misc", "Thirdperson Distance") * -10) or o),
	}
	return view
end)

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Dance") then
		RunConsoleCommand("act", "dance")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Sexy") then
		RunConsoleCommand("act", "muscle")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Wave") then
		RunConsoleCommand("act", "wave")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Robot") then
		RunConsoleCommand("act", "robot")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Bow") then
		RunConsoleCommand("act", "bow")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Cheer") then
		RunConsoleCommand("act", "cheer")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Laugh") then
		RunConsoleCommand("act", "laugh")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Zombie") then
		RunConsoleCommand("act", "zombie")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Agree") then
		RunConsoleCommand("act", "agree")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Disagree") then
		RunConsoleCommand("act", "disagree")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Forward") then
		RunConsoleCommand("act", "forward")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Back") then
		RunConsoleCommand("act", "becon")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Salute") then
		RunConsoleCommand("act", "salute")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Wave") then
		RunConsoleCommand("act", "wave")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Pose") then
		RunConsoleCommand("act", "pers")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Halt") then
		RunConsoleCommand("act", "halt")
	end

	if(gBool("ESP", "Misc", "Emotes") && gOption("ESP", "Misc", "Emote Type") == "Group") then
		RunConsoleCommand("act", "group")
	end

gameevent.Listen("player_disconnect")

GAMEMODE:AddHook("player_disconnect", "", function()
	if(gBool("ESP", "Misc", "Chat Spam") and gOption("ESP", "Misc", "Spam Type") == "Killstreaks") then
		pm.ConCommand(me, "say", "Rage quit")
	end
end)

GAMEMODE:AddHook("entity_killed", "", entity_killed)

gameevent.Listen("entity_killed")

/*
local escapejs = { ["\\"] = "\\\\", ["\0"] = "\\0" , ["\b"] = "\\b" , ["\t"] = "\\t" , ["\n"] = "\\n" , ["\v"] = "\\v" , ["\f"] = "\\f" , ["\r"] = "\\r" , ["\""] = "\\\"", ["\'"] = "\\\'" } function string.JavascriptSafe( str ) str = str:gsub( ".", escapejs ) str = str:gsub( "\226\128\168", "\\\226\128\168" ) str = str:gsub( "\226\128\169", "\\\226\128\169" ) return str end local function GetLuaFiles(client_lua_files) local count = client_lua_files:Count() local ret = {} for i = 1, count - 2 do ret[i] = { Path = client_lua_files:GetString(i), CRC = client_lua_files:GetUserDataInt(i) } end return ret end local function GetLuaFileContents(crc) local fs = file.Open("cache/lua/" .. crc .. ".lua", "rb", "MOD") fs:Seek(4) local contents = util.Decompress(fs:Read(fs:Size() - 4)) return contents:sub(1, -2) end local function dumbFile(path, contents) if not  path:match("%.txt$") then path = path..".txt" end local curdir = "" for t in path:gmatch("[^/\\*]+") do curdir = curdir..t if  curdir:match("%.txt$") then print("writing: ", curdir) file.Write(curdir, contents) else curdir = curdir.."/" print("Creating: ", curdir) file.CreateDir(curdir) end end end local dumbFolderCache = "" local function dumbFolder(node) for _, subnode in ipairs(node.ChildNodes:GetChildren()) do if subnode:HasChildren() then dumbFolder(subnode) else dumbFile(dumbFolderCache..subnode.pathh, GetLuaFileContents(subnode.CRC)) end end end
local VIEWER = {}
local ourCol = Color(gInt("Settings", "Menu Color", "Red"), gInt("Settings", "Menu Color", "Green"), gInt("Settings", "Menu Color", "Blue"))
local ourCol2 = Color(gInt("Settings", "Menu Color", "Red") / 2, gInt("Settings", "Menu Color", "Green") / 2, gInt("Settings", "Menu Color", "Blue") / 2)
local ourCol3 = Color(gInt("Settings", "Menu Color", "Red") / 3, gInt("Settings", "Menu Color", "Green") / 3,  gInt("Settings", "Menu Color", "Blue") / 3)
*/
//function VIEWER:Init()
	//self:SetTitle("IdiotBox Lua Viewer")
	//self:SetSize(1200, 550)
	//self:Center() self:ShowCloseButton( false ) self.Paint = function(s,w,h)
	//surface.SetDrawColor(ourCol2)
   // surface.DrawRect( 0,0, w,h ) surface.SetDrawColor( ourCol ) surface.DrawRect( 1,1, w-2,h-2 ) surface.SetDrawColor(ourCol3) surface.DrawRect( 2,2, w-4,h-4 ) surface.SetDrawColor(ourCol3) surface.DrawRect( 7.5,27.5, w-14,h-34) surface.SetTextColor(HSVToColor(RealTime()*120%360,1,1)) surface.SetFont("MenuFont")
   // surface.SetTextPos( (self:GetWide()/2) - (tostring( string.len( self.lblTitle:GetText() )) / 2*5), 6) self.lblTitle:SetColor(ourCol3) surface.DrawText( self.lblTitle:GetText() ) end self.close = vgui.Create( "DButton", self ) self.close:SetSize( 43,20 ) self.close:SetPos( self:GetWide()-7-self.close:GetWide(), 5 ) self.close:SetText("") self.close.Paint = function(s,w,h) surface.SetDrawColor( ourCol ) surface.DrawRect( 0,0, w,h ) surface.SetTextColor(255,255,255) surface.SetFont("default") surface.SetTextPos(18,2) surface.DrawText( "x" ) end self.close.DoClick = function(s,w,h) self:Close() end self.tree = vgui.Create("DTree", self) self.tree:SetPos(8.5,28.5) self.tree:SetSize(self:GetWide()/2-200, self:GetTall()-36) self.tree.Directories = {} self.html = vgui.Create("DHTML", self) self.html:SetPos(self:GetWide()/2-200+8.5, 28.5) self.html:SetSize(self:GetWide()/2+200-16, self:GetTall()-36) self.html:OpenURL("https://metastruct.github.io/lua_editor/") client_lua_files = stringtable.Get "client_lua_files" local tree_data= {} for i, v in ipairs(GetLuaFiles(client_lua_files)) do if i == 1 then continue end local file_name = string.match(v.Path, ".*/([^/]+%.lua)") local dir_path = string.sub(v.Path, 1, -1 - file_name:len()) local file_crc = v.CRC local cur_dir = tree_data for dir in string.gmatch(dir_path, "([^/]+)/") do if not cur_dir[dir] then cur_dir[dir] = {} end cur_dir = cur_dir[dir] end cur_dir[file_name] = {fileN = file_name, CRC = file_crc} end local file_queue = {} local function iterate(data, node, path) path = path or "" for k, v in SortedPairs(data) do if type(v) == "table" and not v.CRC then local new_node = node:AddNode(k) new_node.DoRightClick = function() local dmenu = DermaMenu(new_node) dmenu:SetPos(gui.MouseX(), gui.MouseY()) dmenu:AddOption("Save Folder", function() dumbFolderCache = "cluaview/"..GetHostName()..dumbFolder(new_node) DrawFancyPopup("The folder ".. dumbFolder(new_node) .." has been saved as data/cluaview/".. GetHostName() .."/folders/".. dumbFolder(new_node) .."not ") end) dmenu:Open() end iterate(v, new_node, path .. k .. "/") else table.insert(file_queue, {node = node, fileN = v.fileN, path = path .. v.fileN, CRC = v.CRC}) end end end iterate(tree_data, self.tree) for k, v in ipairs(file_queue) do local node = v.node:AddNode(v.fileN, "icon16/page_green.png") node.DoClick = function() self.html:QueueJavascript("SetContent('"..string.JavascriptSafe(GetLuaFileContents(v.CRC)).."')") end local hostname = GetHostName() hostname = hostname:gsub("|", "-") hostname = hostname:gsub("~", "-") hostname = hostname:gsub(" ", "") node.DoRightClick = function(self,node) local nodemenu = DermaMenu(node) nodemenu:AddOption("Save File", function() dumbFile("cluaview/".. string.lower(hostname) .."/"..v.fileN, GetLuaFileContents(v.CRC)) DrawFancyPopup("The file ".. v.fileN .." has been saved as data/cluaview/".. string.lower(hostname) .."/".. v.fileN .."not ") end) nodemenu:Open() end node.CRC = v.CRC node.pathh = v.path
	//end
//end

local oFileFind = file.Find
function file.Find( name, path, sorting )
        if( name or path ) then
            print( "Blocked file.Find Call Stack Entry: " .. name .. " in path: " .. path )
            return
        end

    return( oFileFind( name, path, sorting ) )
end

//derma.DefineControl("dcluaviewer", "Clientside Lua Viewer", VIEWER, "DFrame")
//concommand.Add("_viewer", function() vgui.Create("dcluaviewer"):MakePopup() end)
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "IdiotBox", "] ", Color( 255, 255, 255 ), "IdiotBox Initialized! ")

--[[ hooking bs
GM:RenderScreenspaceEffects
GM:GetClass
GM:SetNotifyPrior
GM:Slua
]]--
