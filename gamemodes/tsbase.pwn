#include <a_samp>

main()
{
	print("\n/*-----------------------------------*\\");
	print("|*=====[TS Base GameMode Loaded]=====*|");
	print("\\*-----------------------------------*/\n");
}

new bool:JustConnected[MAX_PLAYERS];
#define _TS_VERSION "TS 2.4 (Enhanced)"
#define _VERSION "2.4 (Enhanced)"

#define         STEALTH_GREEN          0x33DD1100
#define         STEALTH_ORANGE         0xFF880000
#define         STEALTH_YELLOW         0xFFFF00AA

public OnPlayerRequestClass(playerid, classid)
{
	TogglePlayerSpectating(playerid, true);
	if(JustConnected[playerid])
	{
		JustConnected[playerid] = false;
		SetTimerEx("OnPlayerRequestClass", 100, false, "ii", playerid, classid);
	}
	else
	{
		TogglePlayerSpectating(playerid, false);
		SpawnPlayer(playerid);
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid,"~r~T~w~exture ~r~S~w~tudio ~b~ "_VERSION,5000,5);
	JustConnected[playerid] = true;
    
    new name[MAX_PLAYER_NAME];
	new str[144];
	
    GetPlayerName(playerid, name, sizeof(name));
	
	format(str, sizeof(str), "%s has joined to the server", name);
    
    SendClientMessageToAll(STEALTH_ORANGE, "______________________________________________");
    SendClientMessageToAll(STEALTH_GREEN, str);
	return 1;
}

public OnGameModeInit()
{
	SetGameModeText(_TS_VERSION);
	SendRconCommand("hostname Texture Studio "_VERSION);
	DisableInteriorEnterExits();
	ShowPlayerMarkers(true);
	UsePlayerPedAnims();

	AddPlayerClass(265,1322.1832,1564.2081,10.8203,300.1425,0,0,0,0,-1,-1);
	AddPlayerClass(263,1958.3783,1343.1572,15.3746,270.1425,0,0,0,0,-1,-1);

	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerColor(playerid, 0xFF880000);
	SetPlayerHealth(playerid, 99999);
	SetPlayerArmour(playerid, 10000);
	GameTextForPlayer(playerid,"~r~T~w~exture ~r~S~w~tudio ~b~ "_VERSION,3000,5);
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		SetVehiclePos(vehicleid, fX, fY, fZ+10);
		GameTextForPlayer(playerid,"~r~T~w~exture ~r~S~w~tudio ~b~ "_VERSION,3000,5);
	}
	else
	{
		SetPlayerPos(playerid, fX, fY, fZ);
		GameTextForPlayer(playerid,"~r~T~w~exture ~r~S~w~tudio ~b~ "_VERSION,3000,5);
	}
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    new name[MAX_PLAYER_NAME];
	new str[144];
	
    GetPlayerName(playerid, name, sizeof(name));

    new DisconnectReason[3][] =
    {
        "Timeout/Crash",
        "Quit",
        "Kick/Ban"
    };
	
	format(str, sizeof(str), "%s has left the server (%s)", name, DisconnectReason[reason]);
	
    SendClientMessageToAll(STEALTH_ORANGE, "______________________________________________");
    SendClientMessageToAll(STEALTH_GREEN, str);
    return 1;
}