/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42931.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 8
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:18:30 PM
*******************************************************************/

//Function Number: 1
lib_A7B3::gettweakabledvarvalue(param_00,param_01)
{
	switch(param_00)
	{
		case "rule":
			break;

		case "game":
			break;

		case "team":
			break;

		case "player":
			break;

		case "class":
			break;

		case "weapon":
			break;

		case "hardpoint":
			break;

		case "hud":
			break;

		default:
			break;
	}
}

//Function Number: 2
lib_A7B3::gettweakabledvar(param_00,param_01)
{
	switch(param_00)
	{
		case "rule":
			break;

		case "game":
			break;

		case "team":
			break;

		case "player":
			break;

		case "class":
			break;

		case "weapon":
			break;

		case "hardpoint":
			break;

		case "hud":
			break;

		default:
			break;
	}
}

//Function Number: 3
lib_A7B3::gettweakablevalue(param_00,param_01)
{
	switch(param_00)
	{
		case "rule":
			break;

		case "game":
			break;

		case "team":
			break;

		case "player":
			break;

		case "class":
			break;

		case "weapon":
			break;

		case "hardpoint":
			break;

		case "hud":
			break;

		default:
			break;
	}
}

//Function Number: 4
lib_A7B3::gettweakablelastvalue(param_00,param_01)
{
	switch(param_00)
	{
		case "rule":
			break;

		case "game":
			break;

		case "team":
			break;

		case "player":
			break;

		case "class":
			break;

		case "weapon":
			break;

		case "hardpoint":
			break;

		case "hud":
			break;

		default:
			break;
	}
}

//Function Number: 5
lib_A7B3::settweakablevalue(param_00,param_01,param_02)
{
	switch(param_00)
	{
		case "rule":
			break;

		case "game":
			break;

		case "team":
			break;

		case "player":
			break;

		case "class":
			break;

		case "weapon":
			break;

		case "hardpoint":
			break;

		case "hud":
			break;

		default:
			break;
	}
}

//Function Number: 6
lib_A7B3::settweakablelastvalue(param_00,param_01,param_02)
{
	switch(param_00)
	{
		case "rule":
			break;

		case "game":
			break;

		case "team":
			break;

		case "player":
			break;

		case "class":
			break;

		case "weapon":
			break;

		case "hardpoint":
			break;

		case "hud":
			break;

		default:
			break;
	}
}

//Function Number: 7
lib_A7B3::registertweakable(param_00,param_01,param_02,param_03)
{
	if(isstring(param_03))
	{
		param_03 = getdvar(param_02,param_03);
	}
	else
	{
		param_03 = getdvarint(param_02,param_03);
	}

	switch(param_00)
	{
		case "rule":
			break;

		case "game":
			break;

		case "team":
			break;

		case "player":
			break;

		case "class":
			break;

		case "weapon":
			break;

		case "hardpoint":
			break;

		case "hud":
			break;
	}
}

//Function Number: 8
lib_A7B3::init()
{
	level.clienttweakables = [];
	level.tweakablesinitialized = 1;
	level.rules = [];
	level.gametweaks = [];
	level.teamtweaks = [];
	level.playertweaks = [];
	level.classtweaks = [];
	level.weapontweaks = [];
	level.hardpointtweaks = [];
	level.hudtweaks = [];
	if(level.console)
	{
		lib_A7B3::registertweakable("game","graceperiod","scr_game_graceperiod",15);
		lib_A7B3::registertweakable("game","graceperiod_ds","scr_game_graceperiod_ds",20);
	}
	else
	{
		lib_A7B3::registertweakable("game","playerwaittime","scr_game_playerwaittime",15);
		lib_A7B3::registertweakable("game","playerwaittime_ds","scr_game_playerwaittime_ds",20);
	}

	lib_A7B3::registertweakable("game","matchstarttime","scr_game_matchstarttime",15);
	lib_A7B3::registertweakable("game","roundstarttime","scr_game_roundstarttime",5);
	lib_A7B3::registertweakable("game","onlyheadshots","scr_game_onlyheadshots",0);
	lib_A7B3::registertweakable("game","allowkillcam","scr_game_allowkillcam",1);
	lib_A7B3::registertweakable("game","spectatetype","scr_game_spectatetype",2);
	lib_A7B3::registertweakable("game","lockspectatepov","scr_game_lockspectatorpov",0);
	lib_A7B3::registertweakable("game","deathpointloss","scr_game_deathpointloss",0);
	lib_A7B3::registertweakable("game","suicidepointloss","scr_game_suicidepointloss",0);
	lib_A7B3::registertweakable("game","suicidespawndelay","scr_game_suicidespawndelay",0);
	lib_A7B3::registertweakable("team","teamkillpointloss","scr_team_teamkillpointloss",0);
	lib_A7B3::registertweakable("team","fftype","scr_team_fftype",0);
	lib_A7B3::registertweakable("team","teamkillspawndelay","scr_team_teamkillspawndelay",20);
	lib_A7B3::registertweakable("team","teamkillkicklimit","scr_team_teamkillkicklimit",0);
	lib_A7B3::registertweakable("player","maxhealth","scr_player_maxhealth",100);
	lib_A7B3::registertweakable("player","healthregentime","scr_player_healthregentime",5);
	lib_A7B3::registertweakable("player","forcerespawn","scr_player_forcerespawn",1);
	lib_A7B3::registertweakable("weapon","allowfrag","scr_weapon_allowfrags",1);
	lib_A7B3::registertweakable("weapon","allowsmoke","scr_weapon_allowsmoke",1);
	lib_A7B3::registertweakable("weapon","allowflash","scr_weapon_allowflash",1);
	lib_A7B3::registertweakable("weapon","allowc4","scr_weapon_allowc4",1);
	lib_A7B3::registertweakable("weapon","allowclaymores","scr_weapon_allowclaymores",1);
	lib_A7B3::registertweakable("weapon","allowrpgs","scr_weapon_allowrpgs",1);
	lib_A7B3::registertweakable("weapon","allowmines","scr_weapon_allowmines",1);
	lib_A7B3::registertweakable("hardpoint","allowartillery","scr_hardpoint_allowartillery",1);
	lib_A7B3::registertweakable("hardpoint","allowuav","scr_hardpoint_allowuav",1);
	lib_A7B3::registertweakable("hardpoint","allowsupply","scr_hardpoint_allowsupply",1);
	lib_A7B3::registertweakable("hardpoint","allowhelicopter","scr_hardpoint_allowhelicopter",1);
}