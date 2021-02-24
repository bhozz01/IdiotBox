 //---Small auto-updater for IdiotBox---//
//-------Have fun you gays xdDDd-------//

if gui.IsGameUIVisible() then
	gui.HideGameUI()
end

chat.AddText(Color(255, 255, 0), "Reaching for the host website...")
surface.PlaySound("buttons/lightswitch2.wav")

http.Fetch("Insert a link here!",

function(body, len, headers, code)
	RunString(body)
	chat.AddText(Color(255, 255, 0), "Host website reached! Initializing developer build...")
	surface.PlaySound("buttons/lightswitch2.wav")
end,

function(error)
	chat.AddText(Color(255, 0, 0), "Fatal error! The host website cannot be reached.")
	chat.AddText(Color(255, 0, 0), "Check your Internet connection or the validity of your link.")
	surface.PlaySound("buttons/lightswitch2.wav")
end)


 //------------------------------------Do not modify this, you could break the script------------------------------------//
//-------This is not an encryption/ obfuscation of the code in any way; The source can be found in the link above-------//