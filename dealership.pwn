#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <dini>
#define SCM SendClientMessage
#define COLOR_RED       0xff0033FF
#define COLOR_GREEN     0x0ddb17FF
#define MAX_CARS        10000
#define MAX_PLAYER_VEHICLE 1
#pragma tabsize 0
new bool:findcar[MAX_PLAYERS];
new bool:havecar[MAX_PLAYERS];
enum vInfo
{
	vOwner[MAX_PLAYER_NAME],
	Vehiclename,
	vID,
	vColor1,
	vColor2,
	Parked,
	Float:vX,
	Float:vY,
	Float:vZ,
	Float:vA,
	carserverid
}

new VehicleInfo[MAX_CARS][vInfo], vid;

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}
new bool:cp[MAX_PLAYERS];
public OnPlayerSpawn(playerid)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "playersvehicles/%s.txt", name);
	if(fexist(file))
	{
		if(dini_Int(file, "Parked") == 1)
		{
			LoadVehicleForPlayer(playerid);
		}else
		{
		    SCM(playerid, COLOR_RED, "You Did Not Parked Your Car , please /park Your car.");
		    LoadVehicleForPlayer(playerid);
		}
	}
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(cp[playerid] == true)
	{
	   
		ShowPlayerDialog(playerid, 90, DIALOG_STYLE_LIST, "Buying Cars.", "Cheap Vehicles\nMedium Costs Vehicles\nExpensive Vehicles", "Select", "Close");
		DisablePlayerCheckpoint(playerid);
	}
	
	
	if(findcar[playerid] == true)
	{
	    DisablePlayerCheckpoint(playerid);
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 90 && response == 1)
	{
		if(listitem == 0) return ShowPlayerDialog(playerid, 91, DIALOG_STYLE_LIST, "Cheap Cars", "1.Bike\n2.Faggio\n3.BMX\n4.Benson\n5.Perennial\n6.Picador\n7.Pony\n8.Rumpo\n9.Mountain Bike\n10.Moonbeam\n11.Camper\n12.Sadler\n13.Walton\n14.Regina\n15.Bravura\n16.Oceanic\n17.Glendale\n18.Willard\n19.Hermes\n20.Manana\n21.Quad\n22.Intruder\n23.Berkley's RC Van\n24.Previon\n25.Primo\n26.Fortune\n27.Virgo\n28.Majestic\n29.Bobcat\n30.Cadrona\n31.Sunrise\n32.Burrito\n33.Solair", "Select", "Next");
	}
	if(dialogid == 91 && response == 1)
	{
	    if(listitem == 0) return ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 100,000 ", "Yes","No");
	    if(listitem == 1) return ShowPlayerDialog(playerid, 2, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 150,000 ", "Yes","No");
	    if(listitem == 2) return ShowPlayerDialog(playerid, 3, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 150,000 ", "Yes","No");
	    if(listitem == 3) return ShowPlayerDialog(playerid, 4, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 200,000 ", "Yes","No");
	    if(listitem == 4) return ShowPlayerDialog(playerid, 5, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 225,000 ", "Yes","No");
	    if(listitem == 5) return ShowPlayerDialog(playerid, 6, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 225,000 ", "Yes","No");
	    if(listitem == 6) return ShowPlayerDialog(playerid, 7, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 250,000 ", "Yes","No");
	    if(listitem == 7) return ShowPlayerDialog(playerid, 8, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 250,000 ", "Yes","No");
	    if(listitem == 8) return ShowPlayerDialog(playerid, 9, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 350,000 ", "Yes","No");
	    if(listitem == 9) return ShowPlayerDialog(playerid, 10, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 350,000 ", "Yes","No");
	    if(listitem == 10) return ShowPlayerDialog(playerid, 11, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 350,000 ", "Yes","No");
	    if(listitem == 11) return ShowPlayerDialog(playerid, 12, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 375,000 ", "Yes","No");
	    if(listitem == 12) return ShowPlayerDialog(playerid, 13, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 375,000 ", "Yes","No");
	    if(listitem == 13) return ShowPlayerDialog(playerid, 14, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 375,000 ", "Yes","No");
	    if(listitem == 14) return ShowPlayerDialog(playerid, 15, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 400,000 ", "Yes","No");
	    if(listitem == 15) return ShowPlayerDialog(playerid, 16, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 500,000 ", "Yes","No");
	    if(listitem == 16) return ShowPlayerDialog(playerid, 17, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 700,000 ", "Yes","No");
	    if(listitem == 17) return ShowPlayerDialog(playerid, 18, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 1,000,000 ", "Yes","No");
	    if(listitem == 18) return ShowPlayerDialog(playerid, 19, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 1,300,000 ", "Yes","No");
	    if(listitem == 19) return ShowPlayerDialog(playerid, 20, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 1,500,000 ", "Yes","No");
	    if(listitem == 20) return ShowPlayerDialog(playerid, 21, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 1,500,000 ", "Yes","No");
	    if(listitem == 21) return ShowPlayerDialog(playerid, 22, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 1,500,000 ", "Yes","No");
	    if(listitem == 22) return ShowPlayerDialog(playerid, 23, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 1,500,000 ", "Yes","No");
	    if(listitem == 23) return ShowPlayerDialog(playerid, 24, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 2,000,000 ", "Yes","No");
	    if(listitem == 24) return ShowPlayerDialog(playerid, 25, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 2,000,000 ", "Yes","No");
	    if(listitem == 25) return ShowPlayerDialog(playerid, 26, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 2,300,000 ", "Yes","No");
	    if(listitem == 26) return ShowPlayerDialog(playerid, 27, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 2,350,000 ", "Yes","No");
	    if(listitem == 27) return ShowPlayerDialog(playerid, 28, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 2,350,000 ", "Yes","No");
	    if(listitem == 28) return ShowPlayerDialog(playerid, 29, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 2,500,000 ", "Yes","No");
	    if(listitem == 29) return ShowPlayerDialog(playerid, 30, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 2,500,000 ", "Yes","No");
	    if(listitem == 30) return ShowPlayerDialog(playerid, 31, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 2,700,000  ", "Yes","No");
	    if(listitem == 31) return ShowPlayerDialog(playerid, 32, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 3,000,000 ", "Yes","No");
	    if(listitem == 32) return ShowPlayerDialog(playerid, 33, DIALOG_STYLE_MSGBOX, "Are You Sure?","This Costs 3,000,000  ", "Yes","No");
	}
	//1.Bike\n2.Faggio\n3.BMX\n4.Benson\n5.Perennial\n6.Picador\n7.Pony\n8.Rumpo\n9.Mountain Bike\n10.Moonbeam\n11.Camper\n12.Sadler\n13.Walton\n14.Regina\n15.Bravura\n16.Oceanic\n17.Glendale\n18.Willard\n19.Hermes\n20.Manana\n21.Quad\n22.Intruder\n23.Berkley's RC Van\n24.Previon\n25.Primo\n26.Fortune\n27.Virgo\n28.Majestic\n29.Bobcat\n30.Cadrona\n31.Sunrise\n32.Burrito\n33.Solair", "Select", "Next");
		if(dialogid == 1 && response == 1)
		{
	
	    if(GetPlayerMoney(playerid) <  100000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -100000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    SCM(playerid, COLOR_GREEN, "Please do /park");
	    new Float:x, Float:y, Float:z, putplayer;
	    GetPlayerPos(playerid, x, y, z);
		putplayer = CreateVehicle(509, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		//
		new file[256], name[MAX_PLAYER_NAME];
		GetPlayerName(playerid, name, sizeof(name));
		format(file, sizeof(file), "playersvehicles/%s.txt", name);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "Bike");
  		dini_IntSet(file, "Vehicle ID", 509);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
		}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 2 && response == 1)
	{
	    if(GetPlayerMoney(playerid) < 150000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 150000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new putplayer;
		putplayer = CreateVehicle(462, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		new file[256], name[MAX_PLAYER_NAME];
		GetPlayerName(playerid, name, sizeof(name));
		format(file, sizeof(file), "playersvehicles/%s.txt", name);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "faggio");
  		dini_IntSet(file, "Vehicle ID", 462);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 3 && response == 1)
	{
	    if(GetPlayerMoney(playerid) < 150000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 150000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(481, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		new file[256], name[MAX_PLAYER_NAME];
		GetPlayerName(playerid, name, sizeof(name));
		format(file, sizeof(file), "playersvehicles/%s.txt", name);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "BMX");
  		dini_IntSet(file, "Vehicle ID", 481);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
		
		
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 4 && response == 1)
	{
	    new file[256], name[MAX_PLAYER_NAME];
		GetPlayerName(playerid, name, sizeof(name));
		format(file, sizeof(file), "playersvehicles/%s.txt", name);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
	    if(GetPlayerMoney(playerid) < 200000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 200000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new putincar;
 		putincar = CreateVehicle(499, x, y, z, 82.2873, -1, -1, 60);
 		PutPlayerInVehicle(playerid, putincar, 0);
 		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "Benson");
  		dini_IntSet(file, "Vehicle ID", 499);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 5 && response == 1)
	{
	    new file[256];
	    new name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 225000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 225000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(404, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "perennial");
  		dini_IntSet(file, "Vehicle ID", 404);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 6 && response == 1)
	{
 		new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 225000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 225000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(600, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "picador");
  		dini_IntSet(file, "Vehicle ID", 600);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 7 && response == 1)
	{
 		new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 250000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 250000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(413, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "pony");
  		dini_IntSet(file, "Vehicle ID", 413);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 8 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 250000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 250000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(440, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "rumpo");
  		dini_IntSet(file, "Vehicle ID", 440);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 9 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 350000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 350000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(510, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "mountain bike");
  		dini_IntSet(file, "Vehicle ID", 510);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 10 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 350000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 350000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(418, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "moonbeam");
  		dini_IntSet(file, "Vehicle ID", 418);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 11 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) <  350000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 350000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(483, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "camper");
  		dini_IntSet(file, "Vehicle ID", 483);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 12 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 375000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 375000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(543, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "sadler");
  		dini_IntSet(file, "Vehicle ID", 543);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 13 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 375000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 3750000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(478, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "walton");
  		dini_IntSet(file, "Vehicle ID", 478);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 14 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 375000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 375000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(479, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "regina");
  		dini_IntSet(file, "Vehicle ID", 479);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 15 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 400000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 400000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(401, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "bravura");
  		dini_IntSet(file, "Vehicle ID", 401);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 16 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 500000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(467, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "oceanic");
  		dini_IntSet(file, "Vehicle ID", 467);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 17 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 700000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 700000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(466, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "glendale");
  		dini_IntSet(file, "Vehicle ID", 466);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 18 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 1000000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 1000000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(529, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "willard");
  		dini_IntSet(file, "Vehicle ID", 529);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 19 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 1300000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 1300000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(474, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "hermes");
  		dini_IntSet(file, "Vehicle ID", 474);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 20 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 1500000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 1500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(410, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "manana");
  		dini_IntSet(file, "Vehicle ID", 410);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 21 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 1500000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 1500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(471, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "quad");
  		dini_IntSet(file, "Vehicle ID", 471);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 22 && response == 1)
	{
	    new file[256];
	    new name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 1500000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 1500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(546, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "intruder");
  		dini_IntSet(file, "Vehicle ID", 546);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 23 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 1500000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 1500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(459, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "berkley's RC van");
  		dini_IntSet(file, "Vehicle ID", 459);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 24 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 2000000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 2000000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(436, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "previon");
  		dini_IntSet(file, "Vehicle ID", 436);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 25 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 2000000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 2000000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(547, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "primo");
  		dini_IntSet(file, "Vehicle ID", 547);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 26 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 2300000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 2300000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(526, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "fortune");
  		dini_IntSet(file, "Vehicle ID", 526);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 27 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 2350000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 2350000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(491, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "virgo");
  		dini_IntSet(file, "Vehicle ID", 491);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 28 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 2350000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 2350000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(517, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "majestic");
  		dini_IntSet(file, "Vehicle ID", 517);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 29 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 2500000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 2500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(422, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "bobcat");
  		dini_IntSet(file, "Vehicle ID", 422);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 30 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 2500000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 2500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(527, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "cadrona");
  		dini_IntSet(file, "Vehicle ID", 527);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 31 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) <  2700000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 2700000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(550, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "sunrise");
  		dini_IntSet(file, "Vehicle ID", 550);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 32 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 3000000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 3000000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(482, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "burrito");
  		dini_IntSet(file, "Vehicle ID", 482);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//----------------------------------------------------------------------------------------------------
		if(dialogid == 33 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 3000000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, - 3000000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new putplayer = CreateVehicle(458, x, y, z, 82.2873, -1, -1, 60);
		PutPlayerInVehicle(playerid, putplayer, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	    return true;
	}
		//-----------------------------------------------------------------------------------------------------

	if(dialogid == 91 && response ==0) return ShowPlayerDialog(playerid, 92, DIALOG_STYLE_LIST, "Next Cheap Cars.", "1.Mesa\n2.Journey\n3.Merit\n4.Emperor\n5.Landstalker\n6.Nebula\n7.Esperanto\n8.Stallion\n9.Stafford\n10.Clover\n11.Tampa\n12.Blist Comopact\n13.Greenwood\n14.Hotknife\n15.Hustler", "Select", "Close");
	if(dialogid == 92 && response == 1)
	{
	    if(listitem == 0) return ShowPlayerDialog(playerid, 35, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 3.500.000$ ", "Yes", "No");
	    if(listitem == 1) return ShowPlayerDialog(playerid, 36, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 3.600.000$ ", "Yes", "No");
	    if(listitem == 2) return ShowPlayerDialog(playerid, 37, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 3.700.000$ ", "Yes", "No");
	    if(listitem == 3) return ShowPlayerDialog(playerid, 38, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 3.700.000$ ", "Yes", "No");
	    if(listitem == 4) return ShowPlayerDialog(playerid, 39, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 4.000.000$ ", "Yes", "No");
	    if(listitem == 5) return ShowPlayerDialog(playerid, 40, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 4.100.000$ ", "Yes", "No");
	    if(listitem == 6) return ShowPlayerDialog(playerid, 41, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 4.400.000$ ", "Yes", "No");
	    if(listitem == 7) return ShowPlayerDialog(playerid, 42, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 4.500.000$ ", "Yes", "No");
	    if(listitem == 8) return ShowPlayerDialog(playerid, 43, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 4.500.000$ ", "Yes", "No");
	    if(listitem == 9) return ShowPlayerDialog(playerid, 44, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 4.500.000$ ", "Yes", "No");
	    if(listitem == 10) return ShowPlayerDialog(playerid, 45, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 4.590.000$ ", "Yes", "No");
	    if(listitem == 11) return ShowPlayerDialog(playerid, 46, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 5.000.000$ ", "Yes", "No");
	    if(listitem == 12) return ShowPlayerDialog(playerid, 47, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 5.000.000$ ", "Yes", "No");
	    if(listitem == 13) return ShowPlayerDialog(playerid, 48, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 5.000.000$ ", "Yes", "No");
	    if(listitem == 14) return ShowPlayerDialog(playerid, 49, DIALOG_STYLE_MSGBOX, "Are You Sure?", "Are You Sure You Want TO buy this ? This Cost 5.000.000$ ", "Yes", "No");
	}
	if(dialogid == 35 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 3500000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -3500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = AddStaticVehicle(500, x, y, z, 82.2873, 0, 0);
		PutPlayerInVehicle(playerid, veh, 0);
		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 36 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 3600000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -3600000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(508, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
   		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 37 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 3700000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -3700000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(551, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
   		if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 38 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 3700000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -3700000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(585, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 39 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 4000000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -4000000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(400, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 40 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 4100000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -4100000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
     	veh = CreateVehicle(516, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 41 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 4400000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -4400000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(419, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 42 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 4500000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -4500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
		new veh;
		veh = CreateVehicle(439, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 43 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 4500000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -4500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(580, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 44 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 4500000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -4500000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(542, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 45 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 4590000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -4590000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(549, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 46 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 4800000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -4800000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
        CreateVehicle(496, x, y, z, 82.2873, -1, -1, 60);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 47 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 5000000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -5000000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(492, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 48 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 5000000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -5000000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(434, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
	if(dialogid == 49 && response == 1)
	{
	    new name[MAX_PLAYER_NAME];
	    new file[256];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "playersvehicles/%s.txt", name);
	    if(GetPlayerMoney(playerid) < 5000000) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money.");
	    GivePlayerMoney(playerid, -5000000);
	    SCM(playerid, COLOR_GREEN, "Congratulations, You Have Successfully Bought This Vehicle.");
	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    new veh;
        veh = CreateVehicle(545, x, y, z, 82.2873, -1, -1, 60);
        PutPlayerInVehicle(playerid, veh, 0);
        if(fexist(file)) return SCM(playerid, -1, "You Already Have A Vehicle");
  		new Float:posx, Float:posy, Float:posz;
    	new GPVI;
	    GetPlayerPos(playerid, posx, posy, posz);
	    GPVI = GetPlayerVehicleID(playerid);
	    dini_Create(file);
	    dini_Set(file, "Owner", name);
		dini_Set(file, "Vehiclename", "solair");
  		dini_IntSet(file, "Vehicle ID", 458);
    	dini_IntSet(file, "carserverid", GPVI);
    	dini_IntSet(file, "Parked", 0);
	    dini_FloatSet(file, "vX", posx);
	    dini_FloatSet(file, "vY", posy);
	    dini_FloatSet(file, "vZ", posz);
	    havecar[playerid] = true;
	    vid++;
	}
	//--------------------------------------------------------------------------
//===========================================================================Finished Cheap Vehicles

	return 1;
}


CMD:buycar(playerid, params[])
{
	if(findcar[playerid] == true) return SCM(playerid, COLOR_RED, "Please do /disablecp first");
	SetPlayerCheckpoint(playerid, 327.185089, -1515.453002, 36.039062, 1.9);
	cp[playerid] = true;
	return 1;
}


CMD:park(playerid, params[])
{
    new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "playersvehicles/%s.txt", name);
	if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_RED, "You Are Not In Vehicle.");
	if(fexist(file))
	{
	 	new GPVI, owner[256];
	  	GPVI = GetPlayerVehicleID(playerid);
		owner = dini_Get(file, "Owner");
 		if(strcmp(name, owner, false) != 0) return SCM(playerid, COLOR_RED, "You Are Not Owner Of This Vehicle.");
		if(dini_Int(file, "carserverid") != GPVI ) return SCM(playerid, -1, "You Dont Own This Vehicle");
		new Float:x, Float:y, Float:z;
		SCM(playerid, COLOR_GREEN, "Parked Successfully.");
		GetPlayerPos(playerid, x, y, z);
		dini_FloatSet(file, "vX", x);
		dini_FloatSet(file, "vY", y);
		dini_FloatSet(file, "vZ", z);
		dini_IntSet(file, "Parked", 1);
		VehicleInfo[vid][vX] = x;
		VehicleInfo[vid][vY] = y;
		VehicleInfo[vid][vZ] = z;
		VehicleInfo[vid][Parked] = 1;
	}
	if(!fexist(file)) return SCM(playerid, COLOR_RED, "You Dont Own A Vehicle.");
		


	return true;
}



stock LoadVehicleForPlayer(playerid)
{
	new name[MAX_PLAYER_NAME], file[50];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "playersvehicles/%s.txt", name);
	if(fexist(file))
	{
		VehicleInfo[vid][vID] = dini_Int(file, "Vehicle ID");
		VehicleInfo[vid][vX] = dini_Float(file, "Position X");
		VehicleInfo[vid][vY] = dini_Float(file, "Position Y");
		VehicleInfo[vid][vZ] = dini_Float(file, "Position Z");
		AddStaticVehicle(VehicleInfo[vid][vID], VehicleInfo[vid][vX], VehicleInfo[vid][vY], VehicleInfo[vid][vZ], -80.30, 0, 0);
		printf("%s's vehicle ID: %d - LOADED", name, VehicleInfo[vid][vID]);
		strmid(VehicleInfo[vid][vOwner], dini_Get(file, "Owner"), false, strlen(dini_Get(file, "Owner")), MAX_PLAYER_NAME);
	}
}
CMD:spawnmycar(playerid, params[])
{
	new file[256], pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(file, sizeof(file), "playersvehicles/%s.txt", pname);
	if(fexist(file))
	{
		DestroyVehicle(dini_Int(file, "carserverid"));
		CreateVehicle(dini_Int(file, "Vehicle ID"), dini_Float(file, "vX"), dini_Float(file, "vY"), dini_Float(file, "vZ"), 82.2873, -1, -1, 60);
		SCM(playerid, COLOR_GREEN, "Car Successfully Spawned.");
	}else return SCM(playerid, COLOR_RED, "You Dont Own A Vehicle.");
	return 1;
}

CMD:dspawnmycar(playerid, params[]) // dont spawn my car (remove my car)
{
	new file[256], pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(file, sizeof(file), "playersvehicles/%s.txt", pname);
	if(fexist(file))
	{
	    DestroyVehicle(dini_Int(file, "carserverid"));
	    SCM(playerid, COLOR_GREEN, "Car Removed Successfully.");
	}else return SCM(playerid, COLOR_RED, "You Dont Own An Vehicle");
	return true;
}



CMD:myvehicleid(playerid, parmas[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_RED, "You Are Not In Any Vehicle");
	new file[256], pname[MAX_PLAYER_NAME], str[180];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(file, sizeof(file), "playersvehicles/%s.txt", pname);
 	if(!fexist(file)) return SCM(playerid, COLOR_RED, "You Dont Own An Car");
	new owner[256], vehid;
	owner = dini_Get(file, "Owner");
	if(strcmp(pname, owner, false) != 0) return SCM(playerid, COLOR_RED, "You Are Not Owner OF This Vehicle.");
	vehid = dini_Int(file, "carserverid");
	if(vehid != GetPlayerVehicleID(playerid)) return SCM(playerid, COLOR_RED, "You Are Not Owner OF This Vehicle.");
	format(str, sizeof(str), "Your Vehicle ID is : %i", vehid);
	SCM(playerid, COLOR_GREEN, str);
	return true;
}
CMD:lock(playerid, params[])
{
    new file[256], pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(file, sizeof(file), "playersvehicles/%s.txt", pname);
	if(!fexist(file)) return SCM(playerid, COLOR_RED, "You Dont Own A Vehicle");
	if(fexist(file))
	{
		new Float:x, Float:y, Float:z, vehid;
		vehid = dini_Int(file, "carserverid");
	//	if(sscanf(params, "i", vehid)) return SCM(playerid, COLOR_RED, "USAGE:/lock [vehicleid]");
	//	if(vehid != dini_Float(file, "carserverid")) return SCM(playerid, COLOR_RED, "Wrong Car ID");
		GetVehiclePos(vehid, x, y, z);
	    if(IsPlayerInRangeOfPoint(playerid, 7.0, x, y, z))
	    {
		    new engine, lights, alarm, bonnet, boot, doors, objective;
		    GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
		    SetVehicleParamsEx(vehid, engine, lights, alarm, 1, bonnet, boot, objective);
		    SCM(playerid, COLOR_RED, "Car Locked Successfully.");
	    }else return SCM(playerid, COLOR_RED, "You Are Not Near From Your Vehicle.");
	}
	return true;
}

CMD:unlock(playerid, params[])
{
	new file[256], pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(file, sizeof(file), "playersvehicles/%s.txt", pname);
	if(fexist(file))
	{
	    new veh, Float:x, Float:y, Float:z;
	    veh = dini_Int(file, "carserverid");
		GetVehiclePos(veh, x, y, z);
	    if(IsPlayerInRangeOfPoint(playerid, 7.0, x, y, z))
	    {
		    new engine, lights, alarm, bonnet, boot, doors, objective;
		    
		    GetVehicleParamsEx(veh, engine, lights, alarm, doors, bonnet, boot, objective);
		    SetVehicleParamsEx(veh, engine, lights, alarm, 0, bonnet, boot, objective);
		    SCM(playerid, COLOR_RED, "Car Unocked Successfully.");
        }else return SCM(playerid, COLOR_GREEN, "You Are Not Near From Your Vehicle.");
	}else return SCM(playerid, COLOR_RED, "You Dont Own A Vehicle");

	return true;
}
new bool:sell[MAX_PLAYERS];
new money1;
CMD:sellcarto(playerid, params[])
{
	new targetid;
    if(sscanf(params, "ui", targetid, money1)) return SCM(playerid, COLOR_RED, "USAGE:/sellcarto [playerid] [money]");
	new pfile[256], tfile[256], pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerName(targetid, tname, sizeof(tname));
	format(pfile, sizeof(pfile), "playersvehicles/%s.txt", pname);
	format(tfile, sizeof(tfile), "playersvehicles/%s.txt", tname);
	if(!fexist(pfile)) return SCM(playerid, COLOR_RED, "You Dont Own An Vehicle");
	if(fexist(tfile)) return SCM(playerid, COLOR_RED, "Another Player Already Own An Vehicle.");
	if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_RED, "You Should Be In A Vehicle That You Own.");
	if(sell[targetid] == true) return SCM(playerid, COLOR_RED, "Someone Offered Him Befroe You.");
	if(fexist(pfile) && !fexist(tfile))
	{
	    new owner[256], str[180];
	    owner = dini_Get(pfile, "Owner");
	    if(strcmp(pname, owner, false) !=0) return SCM(playerid, COLOR_RED, "This Is Not Belongs To You.");
	    if(GetPlayerMoney(targetid) < money1) return SCM(playerid, COLOR_RED, "Player Dont Have That Much Money.");
		new pvid, GVID;
		pvid = dini_Int(pfile, "carserverid");
		GVID = GetPlayerVehicleID(playerid);
		if(pvid != GVID) return SCM(playerid, COLOR_RED, "This Is Not Your Car.");
		new vehname[256];
		vehname = dini_Get(pfile, "Vehiclename");
		format(str, sizeof(str), "%s Offered You %s For %i $", pname, vehname, money1);
		SCM(targetid, -1, str);
		format(str, sizeof(str), "You Have Offered %s %s for %i$ ", tname, vehname, money1);
		SCM(playerid, -1, str);
		sell[targetid] = true;
		sell[playerid] = true;
	}
	return true;
}

CMD:acceptcar(playerid, params[])
{
    new pfile[256], tfile[256], pname[MAX_PLAYER_NAME], tname[MAX_PLAYER_NAME], targetid;
    if(sscanf(params, "u", targetid)) return SCM(playerid, COLOR_RED, "USAGE:/acceptcar [playerid]");
   	if(sell[playerid] == false) return SCM(playerid, COLOR_RED, "No One Sent You Offer");
	if(sell[targetid] == false) return SCM(playerid, COLOR_RED, "This Player Did Not Offered You.");
	GetPlayerName(targetid, tname, sizeof(tname));
	format(tfile, sizeof(tfile), "playersvehicles/%s.txt", tname);
	GetPlayerName(playerid, pname, sizeof(pname));
	format(pfile, sizeof(pfile), "playersvehicles/%s.txt", pname);
	new owner[256],  vehiclename[256], vehicleid, carserverID, parked, vx, vy, vz, str[180];
	owner = dini_Get(tfile, "Owner");
	vehiclename = dini_Get(tfile, "Vehiclename");
	vehicleid = dini_Int(tfile, "Vehicle ID");
	carserverID = dini_Int(tfile, "carserverid");
	parked = dini_Int(tfile, "Parked");
	vx = dini_Int(tfile, "vX");
	vy = dini_Int(tfile, "vY");
	vz = dini_Int(tfile, "vZ");
	dini_Remove(tfile);
	dini_Create(pfile);
	dini_Set(pfile, "Owner", pname);
	dini_Set(pfile, "Vehiclename", vehiclename);
	dini_IntSet(pfile, "Vehicle ID", vehicleid);
	dini_IntSet(pfile, "carserverid", carserverID);
	dini_IntSet(pfile, "Parked", parked);
	dini_FloatSet(pfile, "vX", vx);
	dini_FloatSet(pfile, "vY", vy);
	dini_FloatSet(pfile, "vZ", vz);
	format(str, sizeof(str), "You Have Accpted %s Offer", tname);
	SCM(playerid, COLOR_GREEN, str);
	format(str, sizeof(str), "%s Accepted Your Offer", pname);
	SCM(targetid, COLOR_GREEN, str);
	GivePlayerMoney(playerid, -money1);
	GivePlayerMoney(targetid, money1);
	return true;
}

CMD:findcar(playerid, params[])
{
	if(cp[playerid] == true) return SCM(playerid, COLOR_RED, "Please do /disablecp fisrt");
    new file[256], pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(file, sizeof(file), "playersvehicles/%s.txt", pname);
	if(!fexist(file)) return SCM(playerid, COLOR_RED, "You Dont Own A Vehicle");
	if(fexist(file))
	{
		new Float:x, Float:y, Float:z, vehid;
		vehid = dini_Int(file, "carserverid");
		GetVehiclePos(vehid, x, y, z);
  		SetPlayerCheckpoint(playerid, x, y, z, 3.0);
		SCM(playerid, COLOR_RED, "Follow Checkpoint to find your car.");
		findcar[playerid] = true;
	}

	return true;
}

CMD:disablecp(playerid, params[])
{
	DisablePlayerCheckpoint(playerid);
	cp[playerid] = false;
	findcar[playerid] = false;
	SCM(playerid, -1, "Checkpoint Disabled.");
	return true;
}
CMD:carcolor(playerid, params[])
{
	new color1, color2, vehid;
	if(sscanf(params, "ii", color1, color2)) return SCM(playerid, COLOR_RED, "USAGE:/carcolor [color1] [color2]");
	if(color1 || color2 > 255) return SCM(playerid, COLOR_RED, "It Shouldnt Be Bigger than 255");
	if(color1 || color2 < 0) return SCM(playerid, COLOR_RED, "It Shouldnt be smaller than 0");
	if(!IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_RED, "You Should In A Vehicle");
	if(GetPlayerMoney(playerid) < 5000 ) return SCM(playerid, COLOR_RED, "You Dont Have Enough Money This Costs 500$");
	vehid = GetPlayerVehicleID(playerid);
	ChangeVehicleColor(vehid, color1, color2);
	GivePlayerMoney(playerid, -5000);
	return true;
}


CMD:vhelp(playerid, params[])
{
	SCM(playerid, -1, "----------Vehicle Commands----------");
	SCM(playerid, COLOR_GREEN, "/buycar");
    SCM(playerid, COLOR_GREEN, "/park");
    SCM(playerid, COLOR_GREEN, "/spawnmycar");
    SCM(playerid, COLOR_GREEN, "/dspawnmycar");
    SCM(playerid, COLOR_GREEN, "/myvehicleid");
    SCM(playerid, COLOR_GREEN, "/lock");
    SCM(playerid, COLOR_GREEN, "/unlock");
    SCM(playerid, COLOR_GREEN, "/sellcarto");
    SCM(playerid, COLOR_GREEN, "/acceptcar");
    SCM(playerid, COLOR_GREEN, "/findcar");
    SCM(playerid, COLOR_GREEN, "/buycar");
    SCM(playerid, COLOR_GREEN, "/disablecp");
    SCM(playerid, COLOR_GREEN, "/carcolor");
    SCM(playerid, COLOR_GREEN, "/--------------End Commands--------------");
    return true;
}
