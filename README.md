# IdiotBox cat edition

IB Cat Edition is a version of IdiotBox with default and x86-64 branch support. I'm planning on adding more features to this that are likely not going to be added into the original IdiotBox, however if Phizz feels like it he can take anything from here and put it into the official build.

Current features different from original IdiotBox:
* Newline support in name changer (use `\n` in the convar and it will turn into a newline)
* Custom disconnect messages (only in x86-64 because big module doesn't have the function)

Known issues:
* ChatClear only works in 32-bit. Since the module was released in 2016, the source code was never published and the creator was last online 2021, this will likely stay this way for a long time
* Keybind buttons do not work

Module credits:
* [zxcmodule](https://github.com/tihomirocrew/zxcmodule) by D3D9C
* [big](https://github.com/6b45/engineprediction) by razor
* [ChatClear](https://www.mpgh.net/forum/showthread.php?t=1168652) by Herp

# Installation

1. Go to the [Releases](https://github.com/aaaasdfghjkllll/ibcatedition/releases) on GitHub and download the "ibcatedition.zip".
2. Extract the "garrysmod" folder into your Garry's Mod installation and merge it with the existing folder.

# Initialize on public servers

On servers you own, you can write `sv_allowcslua 1` into the server console to allow players to load Lua scripts. If you have enabled this or if you are on a server with it enabled, you can load IB Cat Edition with the command `lua_openscript_cl ibcatedition.lua`.

If you are on a server that hasn't enabled `sv_allowcslua`, you can still load the script using external methods. There are a LOT of ways to load Lua scripts on these servers, however the method I recommend is using Interstate Editor, which is an in-game Lua editor and loader. You can find it on UnknownCheats. You can install it by extracting the "lua" folder from the zip file into the "garrysmod" folder in your Garry's Mod installation directory. Once you have installed it, use the command `interstate_openscript_cl ibcatedition.lua` while in a server and it should load.

# Reporting issues

If you encounter any bugs, errors or glitches while using IB Cat Edition, create an issue on GitHub.