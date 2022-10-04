/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42893.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:18:26 PM
*******************************************************************/

//Function Number: 1
lib_A78D::init()
{
	level.splitscreen = issplitscreen();
	level.ps3 = getdvar("ps3Game") == "true";
	level.avatarinfo = getdvar("xenonGame") == "true";
	level.console = getdvar("consoleGame") == "true";
	level.onlinegame = function_02BB();
	level.rankedmatch = level.onlinegame && !getdvarint("xblive_privatematch");
	level.practiceround = getdvarint("practiceroundgame");
	level.script = tolower(getdvar("mapname"));
	if(getdvarint("virtualLobbyActive",0))
	{
		level.gametype = "vlobby";
	}
	else
	{
		level.gametype = tolower(getdvar("g_gametype"));
	}

	level.teamnamelist = ["axis","allies"];
	level.matchbonus["allies"] = "axis";
	level.matchbonus["axis"] = "allies";
	level.multiteambased = 0;
	level.teambased = 0;
	level.objectivebased = 0;
	level.endgameontimelimit = 1;
	level.showingfinalkillcam = 0;
	level.tispawndelay = getdvarint("scr_tispawndelay");
	if(!isdefined(level.tweakablesinitialized))
	{
		maps\mp\gametypes\_tweakables::init();
	}

	precachestring(&"MP_HALFTIME");
	precachestring(&"MP_OVERTIME");
	precachestring(&"MP_ROUNDEND");
	precachestring(&"MP_INTERMISSION");
	precachestring(&"MP_SWITCHING_SIDES");
	precachestring(&"MP_FRIENDLY_FIRE_WILL_NOT");
	precachestring(&"MP_SUICIDE_PUNISHED");
	precachestring(&"PLATFORM_REVIVE");
	precachestring(&"MP_OBITUARY_NEUTRAL");
	precachestring(&"MP_OBITUARY_FRIENDLY");
	precachestring(&"MP_OBITUARY_ENEMY");
	if(level.splitscreen)
	{
		precachestring(&"MP_ENDED_GAME");
	}
	else
	{
		precachestring(&"MP_HOST_ENDED_GAME");
	}

	level.halftimetype = "halftime";
	level.halftimeonscorelimit = 0;
	level.laststatustime = 0;
	level.waswinning = "none";
	level.lastslowprocessframe = 0;
	level.placement["allies"] = [];
	level.placement["axis"] = [];
	level.placement["all"] = [];
	level.postroundtime = 5;
	if(maps\mp\_utility::practiceroundgame())
	{
		level.postroundtime = 0;
	}

	level.playerslookingforsafespawn = [];
	lib_A78D::registerdvars();
	precachemodel("tag_origin");
	if(!level.practiceround && maps\mp\_utility::matchmakinggame() || (level.gametype == "horde" || level.gametype == "zombies") && level.onlinegame)
	{
		var_00 = " LB_MAP_" + getdvar("ui_mapname");
		var_01 = " LB_GM_" + level.gametype;
		if(getdvarint("g_hardcore"))
		{
			var_01 = var_01 + "_HC";
		}
		else if(!maps\mp\_utility::isaugmentedgamemode())
		{
			var_01 = var_01 + "_CL";
		}

		if(level.gametype == "horde" && level.onlinegame)
		{
			precacheleaderboards("LB_GM_HORDE LB_GM_HORDE_BESTS");
		}
		else if(level.gametype == "zombies" && level.onlinegame)
		{
			switch(level.script)
			{
				case "mp_zombie_brg":
					break;

				case "mp_zombie_ark":
					break;

				case "mp_zombie_h2o":
					break;

				case "mp_zombie_lab":
				default:
					break;
			}
		}
	}
}

//Function Number: 2
lib_A78D::init_multiteamdata(param_00)
{
	for(var_01 = 0;var_01 < param_00;var_01++)
	{
		var_02 = "team_" + var_01;
		level.placement[var_02] = [];
		level.teamcount[var_02] = 0;
		level.alivecount[var_02] = 0;
		level.livescount[var_02] = 0;
		level.afk[var_02] = 0;
	}
}

//Function Number: 3
lib_A78D::registerdvars()
{
	setomnvar("ui_bomb_timer",0);
	setomnvar("ui_nuke_end_milliseconds",0);
	setdvar("ui_danger_team","");
	setdvar("ui_inhostmigration",0);
	setdvar("camera_thirdPerson",getdvarint("scr_thirdPerson"));
}

//Function Number: 4
lib_A78D::setupcallbacks()
{
	level.onxpevent = ::lib_A78D::onxpevent;
	level.getspawnpoint = ::lib_A78D::blank;
	level.onspawnplayer = ::lib_A78D::blank;
	level.onrespawndelay = ::lib_A78D::blank;
	level.ontimelimit = ::maps\mp\gametypes\_gamelogic::default_ontimelimit;
	level.onhalftime = ::maps\mp\gametypes\_gamelogic::default_onhalftime;
	level.ondeadevent = ::maps\mp\gametypes\_gamelogic::default_ondeadevent;
	level.ononeleftevent = ::maps\mp\gametypes\_gamelogic::default_ononeleftevent;
	level.onprecachegametype = ::lib_A78D::blank;
	level.onstartgametype = ::lib_A78D::blank;
	level.onplayerkilled = ::lib_A78D::blank;
	level.autoassign = ::maps\mp\gametypes\_menus::autoassign;
}

//Function Number: 5
lib_A78D::blank(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
}

//Function Number: 6
lib_A78D::testmenu()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		wait(10);
		var_00 = spawnstruct();
		var_00.titletext = &"MP_CHALLENGE_COMPLETED";
		var_00.notifytext = "wheee";
		var_00.sound = "mp_challenge_complete";
		thread maps\mp\gametypes\_hud_message::notifymessage(var_00);
	}
}

//Function Number: 7
lib_A78D::testshock()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		wait(3);
		var_00 = randomint(6);
		for(var_01 = 0;var_01 < var_00;var_01++)
		{
			iprintlnbold(var_00);
			self shellshock("frag_grenade_mp",0.2);
			wait(0.1);
		}
	}
}

//Function Number: 8
lib_A78D::onxpevent(param_00)
{
	level thread maps\mp\gametypes\_rank::awardgameevent(param_00,self);
}

//Function Number: 9
lib_A78D::debugline(param_00,param_01)
{
	for(var_02 = 0;var_02 < 50;var_02++)
	{
		wait(0.05);
	}
}