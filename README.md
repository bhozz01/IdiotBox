-----INSTALLING AND INITIALIZING:-----

1. Drag 'IdiotBox_latest.lua' and the 'bin' folder located in the .zip file into the following directory: Program Files (x86) > Steam > steamapps > common > GarrysMod > garrysmod > lua;
2. Open Garry's Mod in the 32-bit version of the game, NOT the 64-bit branch (x86-64 beta branch as of now), as the modules (located in the 'bin' folder) are ONLY COMPATIBLE with the default version of the game;
3. Join a multiplayer game/ public server that allows players to load .lua scripts (the server must have 'sv_allowcslua' set to 1);
4. Open the console and type the following command: 'lua_openscript_cl IdiotBox_latest.lua" (or whatever your script's name is);
5. Run the command;
6. Enjoy!
*If GitHub's servers are down and you cannot load IdiotBox, use the 'IdiotBox_backup.lua' file. The backup version does not load the script from GitHub, thus requiring manual updating when new versions come out.

-----HOW TO INITIALIZE IDIOTBOX ON PUBLIC SERVERS:-----

There are a lot of methods out there for loading .lua scripts on servers that don't have 'sv_allowcslua' enabled. Some of these methods can change from time to time, as they get patched and replaced by others;
My method of choice is using a loader named 'external.dll' (message me on Discord and I will send it to you). To use it, follow these steps:
1. Create a folder in 'C:\Documents' named 'external' (other names won't work); 
2. Drag 'IdiotBox_latest.lua' or any other .lua script of your choice in said folder;
3. Open Garry's Mod in the 32-bit version of the game, NOT the 64-bit branch (x86-64 beta branch as of now), as the modules (located in the 'bin' folder) are ONLY COMPATIBLE with the default version of the game;
4. Inject 'external.dll' into Garry's Mod (with an injector of your choice);
5. Join a multiplayer game/ public server;
6. Open the console and type the following command: 'external IdiotBox_latest.lua" (or whatever your script's name is);
7. Run the command;
8. Enjoy!
*If you are using a gLua loader, you will have to copy the script itself (which you can do by opening the .lua file with any text editor), paste it into the loader's console and execute it from there;
*If you are using a prorpietary .lua script loader, follow the tutorial that came with it. There is not much else I can help you with in this instance;
*If you are having trouble with loading IdiotBox or other .lua scripts on public servers, add me on Discord (Phizz#1667) and I will assist you as much as I possibly can.

-----REPORTING ISSUES:-----

If you encounter any bugs, errors or glitches while using IdiotBox, contact me through Discord (Phizz#1667) and I will assist you as much as I possibly can;
Alternatively, you can add me on Steam (https://steamcommunity.com/id/phizzofficial), however, my friends list is usually full and you might not be able to add me, but you can always leave a comment.

-----NOTES:-----

*To reiterate, DRAG BOTH 'IdiotBox_latest.lua' AND THE 'bin' FOLDER INTO THE AFOREMENTIONED DIRECTORY;
*The 'IdiotBox_dev.lua' file lets you access the currently work-in-progress version of IdiotBox - but as a heads up - it can be very buggy and unstable.

-----CREDITS:-----

Pasteware - Many of the basic features;
Others - Smaller features.

Happy Cheating!
   ~Phizz
