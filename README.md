-----INSTALLING AND INITIALIZING:-----

1. Drag 'IdiotBox_latest.lua' and the 'bin' folder located in the Zip file into the following directory: Program Files (x86) > Steam > steamapps > common > GarrysMod > garrysmod > lua;
2. Open Garry's Mod in the default version of the game (make sure you are NOT in any beta branch, such as x86-64/ chromium/ dev/ prerelease), as the modules (located in the 'bin' folder) are ONLY COMPATIBLE with the DEFAULT VERSION of the game;
3. Join a multiplayer game/ public server that allows players to load Lua scripts (the server must have 'sv_allowcslua' set to 1);
4. Open the console and type the following command: 'lua_openscript_cl IdiotBox_latest.lua' (or whatever your script's name is);
5. Run the command;
6. Enjoy!

-----HOW TO INITIALIZE IDIOTBOX ON PUBLIC SERVERS:-----

There are a lot of methods out there for loading Lua scripts on servers that don't have 'sv_allowcslua' enabled. Some of these methods can change from time to time, as they get patched and replaced by others;

My method of choice is using a loader named 'external.dll' (message me on Discord at 'phizz0777' and I will send it to you). To use it, follow these steps:

1. Create a folder in 'C:\Documents' named 'external' (other names won't work); 
2. Drag 'IdiotBox_latest.lua' or any other Lua script of your choice in said folder;
3. Open Garry's Mod in the default version of the game (make sure you are NOT in any beta branch, such as x86-64/ chromium/ dev/ prerelease), as the modules (located in the 'bin' folder) are ONLY COMPATIBLE with the DEFAULT VERSION of the game;
4. Inject 'external.dll' into Garry's Mod (with an injector of your choice);
5. Join a multiplayer game/ public server;
6. Open the console and type the following command: 'external IdiotBox_latest.lua' (or whatever your script's name is);
7. Run the command;
8. Enjoy!

-----NOTES:-----

1. If you are using a gLua loader, you will have to copy the script itself (which you can do by opening the Lua file with any text editor), paste it into the loader's console and execute it from there.
2. If you are using a prorpietary Lua script loader, follow the tutorial that came with it. There is not much else I can help you with in this instance.
3. If you are having trouble with loading IdiotBox or other Lua scripts on public servers, message me on Discord (phizz0777) and I will assist you as best as I possibly can.
4. To reiterate, DRAG BOTH 'IdiotBox_latest.lua' AND THE 'bin' FOLDER INTO THE AFOREMENTIONED DIRECTORY;
5. The 'IdiotBox_dev.lua' file lets you access the currently work-in-progress version of IdiotBox - but as a heads up - it can be very buggy and unstable.
6. If GitHub's servers are down and you cannot load IdiotBox, use the 'IdiotBox_backup.lua' file. The backup version does not load the script from GitHub, thus requiring manual updating when new versions come out.

-----REPORTING ISSUES:-----

If you encounter any bugs, errors or glitches while using IdiotBox, contact me through Discord (phizz0777) and I will assist you as much as I possibly can. Alternatively, you can add me on Steam (https://steamcommunity.com/id/phizzofficial), however, my friends list is usually full and you might not be able to add me, but you can always leave a comment.

Happy Cheating! ~Phizz
