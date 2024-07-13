# IdiotBox cat edition

> [!WARNING]
> This version of IdiotBox uses the x86-64 branch and not the default branch!

IB Cat Edition is a version of IdiotBox made for x86-64 versions of the game. I'm planning on adding more features to this that are likely not going to be added into the original IdiotBox, however if Phizz feels like it he can take anything from here and put it into the official build.

# Installation

1. Go to the [Releases](https://github.com/aaaasdfghjkllll/ibcatedition/releases) on GitHub and download the "ibcatedition.zip".
2. Extract the "garrysmod" folder into your Garry's Mod installation and merge it with the existing folder.

# Initialize on public servers

On servers you own, you can write `sv_allowcslua 1` into the server console to allow players to load Lua scripts. If you have enabled this or if you are on a server with it enabled, you can load IB Cat Edition with the command `lua_openscript_cl ibcatedition.lua`.

If you are on a server that hasn't enabled `sv_allowcslua`, you can still load the script using external methods. There are a LOT of ways to load Lua scripts on these servers, however the method I recommend is using Interstate Editor, which is an in-game Lua editor and loader. You can find it on UnknownCheats. You can install it by extracting the "lua" folder from the zip file into the "garrysmod" folder in your Garry's Mod installation directory. Once you have installed it, use the command `interstate_openscript_cl ibcatedition.lua` while in a server and it should load.

# Reporting issues

If you encounter any bugs, errors or glitches while using IB Cat Edition, create an issue on GitHub.