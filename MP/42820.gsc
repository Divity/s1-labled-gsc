/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42820.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 38
 * Decompile Time: 39 ms
 * Timestamp: 4/20/2022 8:18:21 PM
*******************************************************************/

//Function Number: 1
lib_A744::init()
{
	if(!isdefined(game["gamestarted"]))
	{
		function_012F("mp/matchdata.def");
		setmatchdata("map",level.script);
		if(level.hardcoremode)
		{
			var_00 = level.gametype + " hc";
			setmatchdata("gametype",var_00);
		}
		else
		{
			setmatchdata("gametype",level.gametype);
		}

		setmatchdata("buildVersion",function_0136());
		setmatchdata("buildNumber",function_0137());
		function_0131();
	}

	level.maxlives = 490;
	level.maxevents = 150;
	level.maxkillstreaks = 64;
	level.maxlogclients = 30;
	level.maxnumchallengesperplayer = 5;
	level.maxnumawardsperplayer = 10;
	level.maxloadouts = 10;
	level thread lib_A744::gameendlistener();
	if(getdvar("virtualLobbyActive") != "1")
	{
		level thread lib_A744::reconlogplayerinfo();
	}
}

//Function Number: 2
lib_A744::matchstarted()
{
	if(getdvar("virtualLobbyActive") == "1")
	{
		return;
	}

	if(getdvar("mapname") == getdvar("virtualLobbyMap"))
	{
		return;
	}

	function_02B6("MatchStarted: Completed");
	var_00 = function_02C3();
	setmatchdata("playlistName",var_00);
	var_01 = function_02C4();
	setmatchdata("localTimeStringAtMatchStart",var_01);
	if(lib_A744::getmatchstarttimeutc() == 0)
	{
		setmatchdata("startTimeUTC",function_0138());
	}

	setmatchdata("iseSports",maps\mp\_utility::ismlgmatch());
	if(maps\mp\_utility::privatematch())
	{
		setmatchdata("privateMatch",1);
	}

	if(maps\mp\_utility::practiceroundgame())
	{
		setmatchdata("practiceRound",1);
	}

	if(!maps\mp\_utility::isaugmentedgamemode())
	{
		setmatchdata("classicMode",1);
	}

	if(maps\mp\_utility::isdivisionmode())
	{
		setmatchdata("divisionMode",1);
	}

	var_02 = 0;
	if(isdefined(level.iszombiegame) && level.iszombiegame && isdefined(game["start_in_zmb_hard_mode"]) && game["start_in_zmb_hard_mode"])
	{
		var_02 = 1;
	}

	setmatchdata("isHardMode",var_02);
	thread lib_A744::logbreadcrumbdata();
	thread lib_A744::accumulateplayerpingdata();
}

//Function Number: 3
lib_A744::logbreadcrumbdata()
{
	level endon("game_ended");
	for(;;)
	{
		var_00 = maps\mp\_utility::getgametimepassedseconds();
		foreach(var_02 in level.var_328)
		{
			if(isbot(var_02) || function_0286(var_02))
			{
				continue;
			}

			if(maps\mp\_utility::isreallyalive(var_02) && isdefined(var_02.lifeid) && lib_A744::canloglife(var_02.lifeid))
			{
				var_03 = 31;
				if(isdefined(var_02.lastshotby))
				{
					var_03 = var_02.lastshotby;
				}

				function_02B3(var_02,var_02.lifeid,var_00,var_03);
				var_02.lastshotby = undefined;
			}
		}

		if(isdefined(level.iszombiegame) && level.iszombiegame)
		{
			wait(5);
			continue;
		}

		wait(2);
	}
}

//Function Number: 4
lib_A744::accumulateplayerpingdata()
{
	level endon("game_ended");
	for(;;)
	{
		foreach(var_01 in level.var_328)
		{
			if(isbot(var_01) || function_0286(var_01))
			{
				continue;
			}

			if(!isdefined(var_01.connectedpostgame["pingAccumulation"]) || !isdefined(var_01.connectedpostgame["minPing"]) || !isdefined(var_01.connectedpostgame["maxPing"]) || !isdefined(var_01.connectedpostgame["pingSampleCount"]))
			{
				continue;
			}

			var_02 = var_01 method_8522();
			var_01.connectedpostgame["pingAccumulation"] = var_01.connectedpostgame["pingAccumulation"] + var_02;
			var_01.connectedpostgame["pingSampleCount"]++;
			if(var_01.connectedpostgame["pingSampleCount"] > 5 && var_02 > 0)
			{
				if(var_02 > var_01.connectedpostgame["maxPing"])
				{
					var_01.connectedpostgame["maxPing"] = var_02;
				}

				if(var_02 < var_01.connectedpostgame["minPing"])
				{
					var_01.connectedpostgame["minPing"] = var_02;
				}
			}
		}

		wait(2);
	}
}

//Function Number: 5
lib_A744::getmatchstarttimeutc()
{
	return getmatchdata("startTimeUTC");
}

//Function Number: 6
lib_A744::logkillstreakevent(param_00,param_01)
{
	if(!lib_A744::canlogclient(self) || !lib_A744::canlogkillstreak())
	{
		return;
	}

	var_02 = getmatchdata("killstreakCount");
	setmatchdata("killstreakCount",var_02 + 1);
	setmatchdata("killstreaks",var_02,"eventType",param_00);
	setmatchdata("killstreaks",var_02,"player",self.clientid);
	setmatchdata("killstreaks",var_02,"eventStartTimeDeciSecondsFromMatchStart",maps\mp\_utility::gettimepasseddeciseconds());
	setmatchdata("killstreaks",var_02,"eventPos",0,int(param_01[0]));
	setmatchdata("killstreaks",var_02,"eventPos",1,int(param_01[1]));
	setmatchdata("killstreaks",var_02,"eventPos",2,int(param_01[2]));
	setmatchdata("killstreaks",var_02,"index",var_02);
	setmatchdata("killstreaks",var_02,"coopPlayerIndex",255);
	self.var_2517 = var_02;
	function_0101(param_01,"script_mp_killstreak: eventType %s, player_name %s, player %d, gameTime %d",param_00,self.name,self.clientid,gettime());
}

//Function Number: 7
lib_A744::loggameevent(param_00,param_01)
{
	if(!lib_A744::canlogclient(self) || !lib_A744::canlogevent())
	{
		return;
	}

	var_02 = getmatchdata("eventCount");
	setmatchdata("eventCount",var_02 + 1);
	setmatchdata("events",var_02,"eventType",param_00);
	setmatchdata("events",var_02,"player",self.clientid);
	setmatchdata("events",var_02,"eventTimeDeciSecondsFromMatchStart",maps\mp\_utility::gettimepasseddeciseconds());
	setmatchdata("events",var_02,"eventPos",0,int(param_01[0]));
	setmatchdata("events",var_02,"eventPos",1,int(param_01[1]));
	setmatchdata("events",var_02,"eventPos",2,int(param_01[2]));
	function_0101(param_01,"script_mp_event: event_type %s, player_name %s, player %d, gameTime %d",param_00,self.name,self.clientid,gettime());
}

//Function Number: 8
lib_A744::logkillevent(param_00,param_01)
{
	if(!lib_A744::canloglife(param_00))
	{
		return;
	}

	setmatchdata("lives",param_00,"modifiers",param_01,1);
}

//Function Number: 9
lib_A744::logmultikill(param_00,param_01)
{
	if(!lib_A744::canloglife(param_00))
	{
		return;
	}

	setmatchdata("lives",param_00,"multikill",param_01);
}

//Function Number: 10
lib_A744::logplayerlife(param_00)
{
	if(!lib_A744::canlogclient(self) || !lib_A744::canloglife(self.lifeid))
	{
		return;
	}

	var_01 = gettime() - self.spawntime;
	self.totallifetime = self.totallifetime + var_01;
	var_02 = maps\mp\_utility::convertmillisecondstodecisecondsandclamptoshort(var_01);
	setmatchdata("lives",self.lifeid,"player",self.clientid);
	setmatchdata("lives",self.lifeid,"spawnPos",0,int(self.var_3DC[0]));
	setmatchdata("lives",self.lifeid,"spawnPos",1,int(self.var_3DC[1]));
	setmatchdata("lives",self.lifeid,"spawnPos",2,int(self.var_3DC[2]));
	setmatchdata("lives",self.lifeid,"wasTacticalInsertion",self.var_A1C9);
	setmatchdata("lives",self.lifeid,"team",self.inliveplayerkillstreak);
	if(isdefined(self.spawntimedecisecondsfrommatchstart))
	{
		setmatchdata("lives",self.lifeid,"spawnTimeDeciSecondsFromMatchStart",self.spawntimedecisecondsfrommatchstart);
	}
	else
	{
		setmatchdata("lives",self.lifeid,"spawnTimeDeciSecondsFromMatchStart",-1);
	}

	setmatchdata("lives",self.lifeid,"durationDeciSeconds",var_02);
	var_03 = lib_A744::logloadout();
	setmatchdata("lives",self.lifeid,"loadoutIndex",var_03);
	var_04 = maps\mp\_utility::clamptoshort(self.connectedpostgame["score"] - self.var_7895);
	setmatchdata("lives",self.lifeid,"scoreEarnedDuringThisLife",var_04);
	if(isdefined(self.connectedpostgame["summary"]) && isdefined(self.connectedpostgame["summary"]["xp"]))
	{
		if(isdefined(self.xpatlifestart))
		{
			var_05 = maps\mp\_utility::clamptoshort(self.connectedpostgame["summary"]["xp"] - self.xpatlifestart);
			setmatchdata("lives",self.lifeid,"xpEarnedDuringThisLife",var_05);
		}
	}
}

//Function Number: 11
lib_A744::logplayerxp(param_00,param_01)
{
	if(!lib_A744::canlogclient(self))
	{
		return;
	}

	setmatchdata("players",self.clientid,param_01,param_00);
}

//Function Number: 12
lib_A744::logcompletedchallenge(param_00)
{
	if(!isplayer(self) || !lib_A744::canlogclient(self) || isbot(self))
	{
		return;
	}

	var_01 = getmatchdata("players",self.clientid,"challengeCount");
	if(var_01 < level.maxnumchallengesperplayer)
	{
		setmatchdata("players",self.clientid,"challenges",var_01,param_00);
		setmatchdata("players",self.clientid,"challengeCount",var_01 + 1);
	}
}

//Function Number: 13
lib_A744::logloadout()
{
	var_00 = 255;
	if(!lib_A744::canlogclient(self) || !lib_A744::canloglife(self.lifeid) || self.curclass == "gamemode")
	{
		return var_00;
	}

	var_01 = self.curclass;
	var_02 = 0;
	for(var_02 = 0;var_02 < level.maxloadouts;var_02++)
	{
		var_03 = getmatchdata("players",self.clientid,"loadouts",var_02,"slotUsed");
		if(!var_03)
		{
			break;
		}
		else
		{
			var_04 = getmatchdata("players",self.clientid,"loadouts",var_02,"className");
			if(var_01 == var_04)
			{
				return var_02;
			}
		}
	}

	if(var_02 == level.maxloadouts)
	{
		return var_00;
	}

	setmatchdata("players",self.clientid,"loadouts",var_02,"slotUsed",1);
	setmatchdata("players",self.clientid,"loadouts",var_02,"className",var_01);
	var_05 = "";
	var_06 = "";
	var_07 = "";
	var_08 = "";
	var_09 = [];
	var_0A = [];
	var_0B = "";
	var_0C = 0;
	var_0D = "";
	var_0E = "";
	var_0F = 0;
	if(var_01 == "copycat")
	{
		var_10 = self.connectedpostgame["copyCatLoadout"];
		var_11 = var_10["loadoutPrimary"];
		var_12 = var_10["loadoutPrimaryAttachment"];
		var_13 = var_10["loadoutPrimaryAttachment2"];
		var_14 = var_10["loadoutPrimaryAttachment3"];
		var_15 = var_10["loadoutPrimaryCamo"];
		var_16 = var_10["loadoutPrimaryReticle"];
		var_17 = var_10["loadoutSecondary"];
		var_18 = var_10["loadoutSecondaryAttachment"];
		var_19 = var_10["loadoutSecondaryAttachment2"];
		var_1A = var_10["loadoutSecondaryCamo"];
		var_1B = var_10["loadoutSecondaryReticle"];
		var_0B = var_10["loadoutEquipment"];
		var_0C = var_10["loadoutEquipmentExtra"];
		var_0D = var_10["loadoutOffhand"];
		var_0F = var_10["loadoutOffhandExtra"];
		for(var_1C = 0;var_1C < 6;var_1C++)
		{
			var_09[var_1C] = var_10["loadoutPerks"][var_1C];
		}

		for(var_1C = 0;var_1C < 3;var_1C++)
		{
			var_0A[var_1C] = var_10["loadoutWildcards"][var_1C];
		}

		var_05 = var_10["loadoutKillstreaks"][0];
		var_1D = var_10["loadoutKillstreakModules"][0][0];
		var_1E = var_10["loadoutKillstreakModules"][0][1];
		var_1F = var_10["loadoutKillstreakModules"][0][2];
		var_06 = var_10["loadoutKillstreaks"][1];
		var_20 = var_10["loadoutKillstreakModules"][1][0];
		var_21 = var_10["loadoutKillstreakModules"][1][1];
		var_22 = var_10["loadoutKillstreakModules"][1][2];
		var_07 = var_10["loadoutKillstreaks"][2];
		var_23 = var_10["loadoutKillstreakModules"][2][0];
		var_24 = var_10["loadoutKillstreakModules"][2][1];
		var_25 = var_10["loadoutKillstreakModules"][2][2];
		var_08 = var_10["loadoutKillstreaks"][3];
		var_26 = var_10["loadoutKillstreakModules"][3][0];
		var_27 = var_10["loadoutKillstreakModules"][3][1];
		var_28 = var_10["loadoutKillstreakModules"][3][2];
	}
	else if(issubstr(var_19,"custom"))
	{
		var_29 = maps\mp\_utility::getclassindex(var_19);
		var_11 = maps\mp\gametypes\_class::cac_getweapon(var_29,0);
		var_12 = maps\mp\gametypes\_class::cac_getweaponattachment(var_29,0);
		var_13 = maps\mp\gametypes\_class::cac_getweaponattachmenttwo(var_29,0);
		var_14 = maps\mp\gametypes\_class::cac_getweaponattachmentthree(var_29,0);
		var_15 = maps\mp\gametypes\_class::cac_getweaponcamo(var_29,0);
		for(var_1C = 0;var_1C < 6;var_1C++)
		{
			var_09[var_1C] = maps\mp\gametypes\_class::cac_getperk(var_29,var_1C);
		}

		for(var_1C = 0;var_1C < 3;var_1C++)
		{
			var_0A[var_1C] = maps\mp\gametypes\_class::cac_getwildcard(var_29,var_1C);
		}

		var_17 = maps\mp\gametypes\_class::cac_getweapon(var_29,1);
		var_18 = maps\mp\gametypes\_class::cac_getweaponattachment(var_29,1);
		var_19 = maps\mp\gametypes\_class::cac_getweaponattachmenttwo(var_29,1);
		var_1A = maps\mp\gametypes\_class::cac_getweaponcamo(var_29,1);
		var_0B = maps\mp\gametypes\_class::cac_getequipment(var_29,0);
		var_0C = maps\mp\gametypes\_class::cac_getequipmentextra(var_29,0);
		var_0D = maps\mp\gametypes\_class::cac_getoffhand(var_29);
		var_05 = maps\mp\gametypes\_class::cac_getkillstreak(var_29,0);
		var_1D = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,0,0);
		var_1E = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,0,1);
		var_1F = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,0,2);
		var_06 = maps\mp\gametypes\_class::cac_getkillstreak(var_29,1);
		var_20 = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,1,0);
		var_21 = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,1,1);
		var_22 = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,1,2);
		var_07 = maps\mp\gametypes\_class::cac_getkillstreak(var_29,2);
		var_23 = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,2,0);
		var_24 = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,2,1);
		var_25 = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,2,2);
		var_08 = maps\mp\gametypes\_class::cac_getkillstreak(var_29,3);
		var_26 = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,3,0);
		var_27 = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,3,1);
		var_28 = maps\mp\gametypes\_class::cac_getkillstreakmodule(var_29,3,2);
	}
	else if(issubstr(var_1A,"practice"))
	{
		var_29 = maps\mp\_utility::getclassindex(var_1A);
		var_29 = self.connectedpostgame["practiceRoundClasses"][var_29];
		var_11 = maps\mp\gametypes\_class::table_getweapon(level.practiceroundclasstablename,var_29,0);
		var_12 = maps\mp\gametypes\_class::table_getweaponattachment(level.practiceroundclasstablename,var_29,0,0);
		var_13 = maps\mp\gametypes\_class::table_getweaponattachment(level.practiceroundclasstablename,var_29,0,1);
		var_14 = maps\mp\gametypes\_class::table_getweaponattachment(level.practiceroundclasstablename,var_29,0,2);
		var_15 = maps\mp\gametypes\_class::table_getweaponcamo(level.practiceroundclasstablename,var_29,0);
		var_17 = maps\mp\gametypes\_class::table_getweapon(level.practiceroundclasstablename,var_29,1);
		var_18 = maps\mp\gametypes\_class::table_getweaponattachment(level.practiceroundclasstablename,var_29,1,0);
		var_19 = maps\mp\gametypes\_class::table_getweaponattachment(level.practiceroundclasstablename,var_29,1,1);
		var_1A = maps\mp\gametypes\_class::table_getweaponcamo(level.practiceroundclasstablename,var_29,1);
		var_0B = maps\mp\gametypes\_class::table_getequipment(level.practiceroundclasstablename,var_29);
		var_0C = maps\mp\gametypes\_class::table_getequipmentextra(level.practiceroundclasstablename,var_29);
		var_0D = maps\mp\gametypes\_class::table_getoffhand(level.practiceroundclasstablename,var_29);
		for(var_1C = 0;var_1C < 6;var_1C++)
		{
			var_09[var_1C] = maps\mp\gametypes\_class::table_getperk(level.practiceroundclasstablename,var_29,var_1C);
		}

		for(var_1C = 0;var_1C < 3;var_1C++)
		{
			var_0A[var_1C] = maps\mp\gametypes\_class::table_getwildcard(level.practiceroundclasstablename,var_29,var_1C);
		}

		var_05 = maps\mp\gametypes\_class::table_getkillstreak(level.practiceroundclasstablename,var_29,0);
		var_1D = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,0,0);
		var_1E = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,0,1);
		var_1F = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,0,2);
		var_06 = maps\mp\gametypes\_class::table_getkillstreak(level.practiceroundclasstablename,var_29,1);
		var_20 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,1,0);
		var_21 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,1,1);
		var_22 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,1,2);
		var_07 = maps\mp\gametypes\_class::table_getkillstreak(level.practiceroundclasstablename,var_29,2);
		var_23 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,2,0);
		var_24 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,2,1);
		var_25 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,2,2);
		var_08 = maps\mp\gametypes\_class::table_getkillstreak(level.practiceroundclasstablename,var_29,3);
		var_26 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,3,0);
		var_27 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,3,1);
		var_28 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.practiceroundclasstablename,var_29,3,2);
	}
	else
	{
		var_29 = maps\mp\_utility::getclassindex(var_1A);
		var_11 = maps\mp\gametypes\_class::table_getweapon(level.classtablename,var_29,0);
		var_12 = maps\mp\gametypes\_class::table_getweaponattachment(level.classtablename,var_29,0,0);
		var_13 = maps\mp\gametypes\_class::table_getweaponattachment(level.classtablename,var_29,0,1);
		var_14 = maps\mp\gametypes\_class::table_getweaponattachment(level.classtablename,var_29,0,2);
		var_15 = maps\mp\gametypes\_class::table_getweaponcamo(level.classtablename,var_29,0);
		for(var_1C = 0;var_1C < 6;var_1C++)
		{
			var_09[var_1C] = maps\mp\gametypes\_class::table_getperk(level.classtablename,var_29,var_1C);
		}

		for(var_1C = 0;var_1C < 3;var_1C++)
		{
			var_0A[var_1C] = maps\mp\gametypes\_class::table_getwildcard(level.classtablename,var_29,var_1C);
		}

		var_17 = maps\mp\gametypes\_class::table_getweapon(level.classtablename,var_29,1);
		var_18 = maps\mp\gametypes\_class::table_getweaponattachment(level.classtablename,var_29,1,0);
		var_19 = maps\mp\gametypes\_class::table_getweaponattachment(level.classtablename,var_29,1,1);
		var_1A = maps\mp\gametypes\_class::table_getweaponcamo(level.classtablename,var_29,1);
		var_0B = maps\mp\gametypes\_class::table_getequipment(level.classtablename,var_29);
		var_0C = maps\mp\gametypes\_class::table_getequipmentextra(level.classtablename,var_29);
		var_0D = maps\mp\gametypes\_class::table_getoffhand(level.classtablename,var_29);
		var_05 = maps\mp\gametypes\_class::table_getkillstreak(level.classtablename,var_29,0);
		var_1D = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,0,0);
		var_1E = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,0,1);
		var_1F = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,0,2);
		var_06 = maps\mp\gametypes\_class::table_getkillstreak(level.classtablename,var_29,1);
		var_20 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,1,0);
		var_21 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,1,1);
		var_22 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,1,2);
		var_07 = maps\mp\gametypes\_class::table_getkillstreak(level.classtablename,var_29,2);
		var_23 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,2,0);
		var_24 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,2,1);
		var_25 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,2,2);
		var_08 = maps\mp\gametypes\_class::table_getkillstreak(level.classtablename,var_29,3);
		var_26 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,3,0);
		var_27 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,3,1);
		var_28 = maps\mp\gametypes\_class::table_getkillstreakmodule(level.classtablename,var_29,3,2);
	}

	var_12 = maps\mp\_utility::attachmentmap_tobase(var_12);
	var_13 = maps\mp\_utility::attachmentmap_tobase(var_13);
	var_14 = maps\mp\_utility::attachmentmap_tobase(var_14);
	var_18 = maps\mp\_utility::attachmentmap_tobase(var_18);
	var_19 = maps\mp\_utility::attachmentmap_tobase(var_19);
	setmatchdata("players",self.clientid,"loadouts",var_02,"primaryWeapon",var_11);
	setmatchdata("players",self.clientid,"loadouts",var_02,"primaryAttachments",0,var_12);
	setmatchdata("players",self.clientid,"loadouts",var_02,"primaryAttachments",1,var_13);
	setmatchdata("players",self.clientid,"loadouts",var_02,"primaryAttachments",2,var_14);
	for(var_1C = 0;var_1C < 6;var_1C++)
	{
		setmatchdata("players",self.clientid,"loadouts",var_02,"perkSlots",var_1C,var_09[var_1C]);
	}

	for(var_1C = 0;var_1C < 3;var_1C++)
	{
		setmatchdata("players",self.clientid,"loadouts",var_02,"wildcardSlots",var_1C,var_0A[var_1C]);
	}

	setmatchdata("players",self.clientid,"loadouts",var_02,"secondaryWeapon",var_17);
	setmatchdata("players",self.clientid,"loadouts",var_02,"secondaryAttachments",0,var_18);
	setmatchdata("players",self.clientid,"loadouts",var_02,"secondaryAttachments",1,var_19);
	setmatchdata("players",self.clientid,"loadouts",var_02,"offhandWeapon",var_0D);
	setmatchdata("players",self.clientid,"loadouts",var_02,"equipment",var_0B);
	setmatchdata("players",self.clientid,"loadouts",var_02,"equipmentWeaponExtra",var_0C);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",0,"streak",var_05);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",0,"modules",0,var_1D);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",0,"modules",1,var_1E);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",0,"modules",2,var_1F);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",1,"streak",var_06);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",1,"modules",0,var_20);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",1,"modules",1,var_21);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",1,"modules",2,var_22);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",2,"streak",var_07);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",2,"modules",0,var_23);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",2,"modules",1,var_24);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",2,"modules",2,var_25);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",3,"streak",var_08);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",3,"modules",0,var_26);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",3,"modules",1,var_27);
	setmatchdata("players",self.clientid,"loadouts",var_02,"assaultStreaks",3,"modules",2,var_28);
	thread lib_A744::recon_log_loadout(self,var_11,var_12,var_13,var_14,var_15,var_17,var_18,var_19,var_1A,var_0B,var_0C,var_0D,var_09[0],var_09[1],var_09[2],var_09[3],var_09[4],var_09[5],var_0A[0],var_0A[1],var_0A[2],var_05,var_1D,var_1E,var_1F,var_06,var_20,var_21,var_22,var_07,var_23,var_24,var_25,var_08,var_26,var_27,var_28);
	return var_02;
}

//Function Number: 14
lib_A744::recon_log_loadout(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C,param_0D,param_0E,param_0F,param_10,param_11,param_12,param_13,param_14,param_15,param_16,param_17,param_18,param_19,param_1A,param_1B,param_1C,param_1D,param_1E,param_1F,param_20,param_21,param_22,param_23,param_24,param_25)
{
	var_26 = isbot(param_00) || function_0286(param_00);
	var_27 = "_matchdata.gsc";
	var_28 = param_00.spawntime;
	var_29 = param_00.curclass;
	var_2A = param_00.name;
	function_0100("@"script_mp_loadout_gear: script_file %s, gameTime %d, player_name %s, is_bot %b, class %s, primary_weapon %s, primary_attach_1 %s, primary_attach_2 %s, primary_attach_3 %s, primary_camo %s, secondary_weapon %s, secondary_attach_1 %s, secondary_attach_2 %s, secondary_camo %s, equipment %s, equipment_extra %b, exo_ability %s",var_27,var_28,var_2A,var_26,var_29,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C);
	function_0100("script_mp_loadout_perks: script_file %s, gameTime %d, player_name %s, perk_1 %s, perk_2 %s, perk_3 %s, perk_4 %s, perk_5 %s, perk_6 %s, wildcard_1 %s, wildcard_2 %s, wildcard_3 %s",var_27,var_28,var_2A,param_0D,param_0E,param_0F,param_10,param_11,param_12,param_13,param_14,param_15);
	function_0100("@"script_mp_loadout_killstreaks: script_file %s, gameTime %d, player_name %s, killstreak_1 %s, killstreak_1_module_a %s, killstreak_1_module_b %s, killstreak_1_module_c %s, killstreak_2 %s, killstreak_2_module_a %s, killstreak_2_module_b %s, killstreak_2_module_c %s, killstreak_3 %s, killstreak_3_module_a %s, killstreak_3_module_b %s, killstreak_3_module_c %s, killstreak_4 %s, killstreak_4_module_a %s, killstreak_4_module_b %s, killstreak_4_module_c %s",var_27,var_28,var_2A,param_16,param_17,param_18,param_19,param_1A,param_1B,param_1C,param_1D,param_1E,param_1F,param_20,param_21,param_22,param_23,param_24,param_25);
}

//Function Number: 15
lib_A744::logplayerandkillerexomovedata(param_00,param_01)
{
	if(!lib_A744::canlogclient(self) || isplayer(param_01) && !lib_A744::canlogclient(param_01) || !lib_A744::canloglife(param_00))
	{
		return;
	}

	if(param_00 >= level.maxlives)
	{
		return;
	}

	var_02 = maps\mp\_utility::gettimepasseddecisecondsincludingrounds();
	if(isdefined(self.var_3501["exo_boost"]) && isdefined(self.currentfirefightshots["exo_boost"]))
	{
		var_03 = maps\mp\_utility::clamptobyte(self.var_3501["exo_boost"]);
		setmatchdata("lives",param_00,"numberOfBoosts",var_03);
		var_04 = maps\mp\_utility::clamptobyte(var_02 - self.currentfirefightshots["exo_boost"]);
		setmatchdata("lives",param_00,"victimDeciSecondsSinceLastBoost",var_04);
	}

	if(isdefined(self.var_3501["ground_slam"]) && isdefined(self.currentfirefightshots["ground_slam"]))
	{
		var_03 = maps\mp\_utility::clamptobyte(self.var_3501["ground_slam"]);
		setmatchdata("lives",param_00,"numberOfBoostsSlams",var_03);
		var_04 = maps\mp\_utility::clamptobyte(var_02 - self.currentfirefightshots["ground_slam"]);
		setmatchdata("lives",param_00,"victimDeciSecondsSinceLastBoostSlam",var_04);
	}

	if(isdefined(self.var_3501["exo_dodge"]) && isdefined(self.currentfirefightshots["exo_dodge"]))
	{
		var_03 = maps\mp\_utility::clamptobyte(self.var_3501["exo_dodge"]);
		setmatchdata("lives",param_00,"numberOfDodges",var_03);
		var_04 = maps\mp\_utility::clamptobyte(var_02 - self.currentfirefightshots["exo_dodge"]);
		setmatchdata("lives",param_00,"victimDeciSecondsSinceLastDodge",var_04);
	}

	if(isdefined(self.var_3501["exo_slide"]))
	{
		var_03 = maps\mp\_utility::clamptobyte(self.var_3501["exo_slide"]);
		setmatchdata("lives",param_00,"numberOfKneeSlides",var_03);
	}

	if(isplayer(param_01))
	{
		if(!isdefined(param_01.currentfirefightshots))
		{
			return;
		}

		if(isdefined(param_01.currentfirefightshots["exo_boost"]))
		{
			var_04 = maps\mp\_utility::clamptobyte(var_02 - param_01.currentfirefightshots["exo_boost"]);
			setmatchdata("lives",param_00,"killerDeciSecondsSinceLastBoost",var_04);
		}

		if(isdefined(param_01.currentfirefightshots["ground_slam"]))
		{
			var_04 = maps\mp\_utility::clamptobyte(var_02 - param_01.currentfirefightshots["ground_slam"]);
			setmatchdata("lives",param_00,"killerDeciSecondsSinceLastBoostSlam",var_04);
		}

		if(isdefined(param_01.currentfirefightshots["exo_dodge"]))
		{
			var_04 = maps\mp\_utility::clamptobyte(var_02 - param_01.currentfirefightshots["exo_dodge"]);
			setmatchdata("lives",param_00,"killerDeciSecondsSinceLastDodge",var_04);
		}
	}
}

//Function Number: 16
lib_A744::logplayerandkilleradsandfov(param_00,param_01)
{
	if(!lib_A744::canlogclient(self) || isplayer(param_01) && !lib_A744::canlogclient(param_01) || !lib_A744::canloglife(param_00))
	{
		return;
	}

	if(param_00 >= level.maxlives)
	{
		return;
	}

	if(isplayer(param_01))
	{
		if(param_01 playerads() > 0.5)
		{
			setmatchdata("lives",param_00,"killerWasADS",1);
		}

		var_02 = param_01 geteye();
		if(common_scripts\utility::within_fov(var_02,param_01.var_41,self.var_2E6,cos(getdvarfloat("cg_fov"))))
		{
			setmatchdata("lives",param_00,"victimWasInKillersFOV",1);
		}

		var_03 = self geteye();
		if(common_scripts\utility::within_fov(var_03,self.var_41,param_01.var_2E6,cos(getdvarfloat("cg_fov"))))
		{
			setmatchdata("lives",param_00,"killerWasInVictimsFOV",1);
		}
	}

	if(self playerads() > 0.5)
	{
		setmatchdata("lives",param_00,"victimWasADS",1);
	}
}

//Function Number: 17
lib_A744::logplayerandkillershieldcloakhoveractive(param_00,param_01)
{
	if(!lib_A744::canlogclient(self) || isplayer(param_01) && !lib_A744::canlogclient(param_01) || !lib_A744::canloglife(param_00))
	{
		return;
	}

	if(param_00 >= level.maxlives)
	{
		return;
	}

	if(isdefined(self.exo_shield_on) && self.exo_shield_on)
	{
		setmatchdata("lives",param_00,"victimShieldActive",1);
	}

	if(isdefined(self.exo_hover_on) && self.exo_hover_on)
	{
		setmatchdata("lives",param_00,"victimHoverActive",1);
	}

	if(self method_84F8())
	{
		setmatchdata("lives",param_00,"victimCloakingActive",1);
	}

	if(isplayer(param_01))
	{
		if(isdefined(param_01.exo_shield_on) && param_01.exo_shield_on)
		{
			setmatchdata("lives",param_00,"killerShieldActive",1);
		}

		if(isdefined(param_01.exo_hover_on) && param_01.exo_hover_on)
		{
			setmatchdata("lives",param_00,"killerHoverActive",1);
		}

		if(param_01 method_84F8())
		{
			setmatchdata("lives",param_00,"killerCloakingActive",1);
		}
	}
}

//Function Number: 18
lib_A744::determineweaponnameandattachments(param_00,param_01)
{
	var_02 = undefined;
	var_03 = undefined;
	if(param_00 == "none")
	{
		var_02 = "none";
		var_03 = "none";
	}
	else
	{
		var_02 = weaponinventorytype(param_00);
		var_03 = weaponclass(param_00);
	}

	if(issubstr(param_00,"destructible"))
	{
		param_00 = "destructible";
	}

	var_04 = [];
	var_04[0] = "None";
	var_04[1] = "None";
	var_04[2] = "None";
	var_05 = "";
	if(isdefined(var_02) && var_02 == "primary" || var_02 == "altmode" && var_03 == "pistol" || var_03 == "smg" || var_03 == "rifle" || var_03 == "spread" || var_03 == "mg" || var_03 == "grenade" || var_03 == "rocketlauncher" || var_03 == "sniper" || var_03 == "cone" || var_03 == "beam" || var_03 == "shield")
	{
		if(var_02 == "altmode")
		{
			if(isdefined(param_01))
			{
				param_00 = param_01;
			}
		}

		var_06 = maps\mp\_utility::getweaponnametokens(param_00);
		var_05 = maps\mp\_utility::getbaseweaponname(param_00);
		if(var_06[0] == "iw5" || var_06[0] == "iw6")
		{
			var_07 = getweaponattachments(param_00);
			var_08 = 0;
			foreach(var_0A in var_07)
			{
				if(!maps\mp\_utility::isattachment(var_0A))
				{
					continue;
				}

				var_0B = maps\mp\_utility::attachmentmap_tobase(var_0A);
				if(var_08 <= 2)
				{
					var_04[var_08] = var_0B;
					var_08++;
					continue;
				}

				break;
			}
		}
		else if(var_06[0] == "alt")
		{
			var_0D = var_06[1] + "_" + var_06[2];
			var_05 = var_0D;
			if(isdefined(var_06[4]) && maps\mp\_utility::isattachment(var_06[4]))
			{
				var_0B = maps\mp\_utility::attachmentmap_tobase(var_06[4]);
				var_04[0] = var_0B;
			}

			if(isdefined(var_06[5]) && maps\mp\_utility::isattachment(var_06[5]))
			{
				var_0B = maps\mp\_utility::attachmentmap_tobase(var_06[5]);
				var_04[1] = var_0B;
			}
		}
		else
		{
			var_06[var_06.size - 1] = undefined;
			if(isdefined(var_06[1]) && var_02 != "altmode")
			{
				var_0B = maps\mp\_utility::attachmentmap_tobase(var_06[1]);
				var_04[0] = var_0B;
			}

			if(isdefined(var_06[2]) && var_02 != "altmode")
			{
				var_0B = maps\mp\_utility::attachmentmap_tobase(var_06[2]);
				var_04[1] = var_0B;
			}
		}
	}
	else if(var_02 == "item" || var_02 == "offhand")
	{
		var_05 = maps\mp\_utility::strip_suffix(param_00,"_lefthand");
		var_05 = maps\mp\_utility::strip_suffix(var_05,"_mp");
	}
	else
	{
		var_05 = param_00;
	}

	var_0E = spawnstruct();
	var_0E.fx_origin = var_05;
	var_0E.var_53 = var_04;
	var_0E.var_A2EA = var_02;
	var_0E.var_A2CC = var_03;
	var_0E.currentkillstreakindex = param_00;
	return var_0E;
}

//Function Number: 19
lib_A744::logfirefightshotshits(param_00,param_01)
{
	if(!lib_A744::canlogclient(self) || isplayer(param_01) && !lib_A744::canlogclient(param_01) || !lib_A744::canloglife(param_00))
	{
		return;
	}

	if(!isplayer(param_01))
	{
		return;
	}

	if(param_00 >= level.maxlives)
	{
		return;
	}

	if(self.var_2515 > 0)
	{
		setmatchdata("lives",param_00,"shots",maps\mp\_utility::clamptobyte(self.var_2515));
	}

	if(isdefined(param_01.enemyhitcounts) && isdefined(param_01.enemyhitcounts[self.assistedsuicide]) && param_01.enemyhitcounts[self.assistedsuicide] > 0)
	{
		setmatchdata("lives",param_00,"hits",maps\mp\_utility::clamptobyte(param_01.enemyhitcounts[self.assistedsuicide]));
	}

	if(param_01.var_2515 > 0)
	{
		setmatchdata("lives",param_00,"killerShots",maps\mp\_utility::clamptobyte(param_01.var_2515));
	}

	if(isdefined(self.enemyhitcounts) && isdefined(self.enemyhitcounts[param_01.assistedsuicide]) && self.enemyhitcounts[param_01.assistedsuicide] > 0)
	{
		setmatchdata("lives",param_00,"killerHits",maps\mp\_utility::clamptobyte(self.enemyhitcounts[param_01.assistedsuicide]));
	}
}

//Function Number: 20
lib_A744::logplayerandkillerstanceandmotionstate(param_00,param_01)
{
	if(!lib_A744::canloglife(param_00))
	{
		return;
	}

	if(isplayer(self) && lib_A744::canlogclient(self))
	{
		var_02 = function_02BE(self);
		setmatchdata("lives",param_00,"victimStanceAndMotionState",var_02);
	}

	if(isplayer(param_01) && lib_A744::canlogclient(param_01))
	{
		var_02 = function_02BE(param_01);
		setmatchdata("lives",param_00,"killerStanceAndMotionState",var_02);
	}
}

//Function Number: 21
lib_A744::logassists(param_00,param_01)
{
	if(!lib_A744::canloglife(param_00))
	{
		return;
	}

	if(isplayer(self) && lib_A744::canlogclient(self))
	{
		if(isdefined(self.attackerdata))
		{
			var_02 = 0;
			foreach(var_04 in self.attackerdata)
			{
				if(isplayer(var_04.attackerent))
				{
					if(var_04.attackerent != param_01)
					{
						setmatchdata("lives",param_00,"assists",var_02,"assistingPlayerIndex",var_04.attackerent.clientid);
						setmatchdata("lives",param_00,"assists",var_02,"damage",maps\mp\_utility::clamptobyte(var_04.damage));
						var_02++;
						if(var_02 == 5)
						{
							break;
						}
					}
				}
			}

			if(var_02 < 5)
			{
				for(var_06 = var_02;var_06 < 5;var_06++)
				{
					setmatchdata("lives",param_00,"assists",var_06,"assistingPlayerIndex",255);
				}

				return;
			}
		}
	}
}

//Function Number: 22
lib_A744::logspecialassists(param_00,param_01)
{
	if(!isplayer(self) || !lib_A744::canlogclient(self))
	{
		return;
	}

	if(!isplayer(param_00) || !lib_A744::canlogclient(param_00))
	{
		return;
	}

	var_02 = self.lifeid;
	if(!lib_A744::canloglife(var_02))
	{
		return;
	}

	if(param_01 == "assist_emp" || param_01 == "assist_uav" || param_01 == "assist_uav_plus" || param_01 == "assist_riot_shield")
	{
		for(var_03 = 0;var_03 < 5;var_03++)
		{
			var_04 = getmatchdata("lives",var_02,"assists",var_03,"assistingPlayerIndex");
			if(var_04 == param_00.clientid || var_04 == 255)
			{
				if(var_04 == 255)
				{
					setmatchdata("lives",var_02,"assists",var_03,"assistingPlayerIndex",param_00.clientid);
				}

				if(param_01 == "assist_emp")
				{
					setmatchdata("lives",var_02,"assists",var_03,"assistEMP",1);
				}
				else if(param_01 == "assist_uav")
				{
					setmatchdata("lives",var_02,"assists",var_03,"assistUAV",1);
				}
				else if(param_01 == "assist_uav_plus")
				{
					setmatchdata("lives",var_02,"assists",var_03,"assistUAVPlus",1);
				}
				else if(param_01 == "assist_riot_shield")
				{
					setmatchdata("lives",var_02,"assists",var_03,"assistRiotShield",1);
				}
				else
				{
				}

				break;
			}
		}
	}
}

//Function Number: 23
lib_A744::logplayerdeath(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	if(!lib_A744::canlogclient(self) || isplayer(param_01) && !lib_A744::canlogclient(param_01) || !lib_A744::canloglife(param_00))
	{
		return;
	}

	if(param_00 >= level.maxlives)
	{
		return;
	}

	if(level.iszombiegame)
	{
		return;
	}

	if(isdefined(level.var_511A) && level.var_511A)
	{
		return;
	}

	lib_A744::logplayerandkillerexomovedata(param_00,param_01);
	lib_A744::logplayerandkilleradsandfov(param_00,param_01);
	lib_A744::logplayerandkillershieldcloakhoveractive(param_00,param_01);
	lib_A744::logfirefightshotshits(param_00,param_01);
	lib_A744::logplayerandkillerstanceandmotionstate(param_00,param_01);
	lib_A744::logassists(param_00,param_01);
	var_08 = lib_A744::determineweaponnameandattachments(param_04,param_05);
	for(var_09 = 0;var_09 < 3;var_09++)
	{
		if(isdefined(var_08.var_53[var_09]) && var_08.var_53[var_09] != "None")
		{
			setmatchdata("lives",param_00,"killersWeaponAttachments",var_09,var_08.var_53[var_09]);
		}
	}

	if(var_08.var_A2EA != "exclusive")
	{
		setmatchdata("lives",param_00,"killersWeapon",var_08.fx_origin);
	}

	if(var_08.currentkillstreakindex == "altmode")
	{
		setmatchdata("lives",param_00,"killersWeaponAltMode",1);
	}

	if(maps\mp\_utility::iskillstreakweapon(var_08.currentkillstreakindex))
	{
		setmatchdata("lives",param_00,"modifiers","killstreak",1);
		if(isdefined(param_01.var_2517))
		{
			var_0A = getmatchdata("killstreaks",param_01.var_2517,"killsTotal");
			var_0A++;
			setmatchdata("killstreaks",param_01.var_2517,"killsTotal",maps\mp\_utility::clamptoshort(var_0A));
			setmatchdata("lives",param_00,"killerKillstreakIndex",param_01.var_2517);
		}
	}
	else
	{
		setmatchdata("lives",param_00,"killerKillstreakIndex",255);
	}

	var_0B = lib_A744::determineweaponnameandattachments(param_07,undefined);
	for(var_09 = 0;var_09 < 3;var_09++)
	{
		if(isdefined(var_0B.var_53[var_09]) && var_0B.var_53[var_09] != "None")
		{
			setmatchdata("lives",param_00,"victimCurrentWeaponAtDeathAttachments",var_09,var_0B.var_53[var_09]);
		}
	}

	if(var_0B.var_A2EA != "exclusive")
	{
		if(maps\mp\_utility::iskillstreakweapon(var_0B.fx_origin))
		{
			if(isdefined(self.alias))
			{
				var_0C = maps\mp\_utility::getbaseweaponname(self.alias);
				setmatchdata("lives",param_00,"victimCurrentWeaponAtDeath",var_0C);
			}
		}
		else
		{
			setmatchdata("lives",param_00,"victimCurrentWeaponAtDeath",var_0B.fx_origin);
		}
	}

	if(isdefined(self.pickedupweaponfrom) && isdefined(self.pickedupweaponfrom[var_0B.currentkillstreakindex]))
	{
		setmatchdata("lives",param_00,"victimCurrentWeaponPickedUp",1);
	}

	setmatchdata("lives",param_00,"meansOfDeath",param_03);
	var_0D = 2;
	if(isplayer(param_01))
	{
		setmatchdata("lives",param_00,"killer",param_01.clientid);
		setmatchdata("lives",param_00,"killerLifeIndex",param_01.lifeid);
		setmatchdata("lives",param_00,"killerPos",0,int(param_01.var_2E6[0]));
		setmatchdata("lives",param_00,"killerPos",1,int(param_01.var_2E6[1]));
		setmatchdata("lives",param_00,"killerPos",2,int(param_01.var_2E6[2]));
		setmatchdata("lives",param_00,"killerAngles",0,int(param_01.var_41[0]));
		setmatchdata("lives",param_00,"killerAngles",1,int(param_01.var_41[1]));
		setmatchdata("lives",param_00,"killerAngles",2,int(param_01.var_41[2]));
		var_0E = anglestoforward((0,self.var_41[1],0));
		var_0F = self.var_2E6 - param_01.var_2E6;
		var_0F = vectornormalize((var_0F[0],var_0F[1],0));
		var_0D = vectordot(var_0E,var_0F);
		setmatchdata("lives",param_00,"dotOfDeath",var_0D);
		if(param_01 maps\mp\_utility::isjuggernaut())
		{
			setmatchdata("lives",param_00,"killerIsJuggernaut",1);
		}

		if(isdefined(param_01.pickedupweaponfrom) && isdefined(param_01.pickedupweaponfrom[var_08.currentkillstreakindex]))
		{
			setmatchdata("lives",param_00,"killerCurrentWeaponPickedUp",1);
		}
	}
	else
	{
		setmatchdata("lives",param_00,"killer",255);
		setmatchdata("lives",param_00,"killerLifeIndex",65535);
		setmatchdata("lives",param_00,"killerPos",0,int(self.var_2E6[0]));
		setmatchdata("lives",param_00,"killerPos",1,int(self.var_2E6[1]));
		setmatchdata("lives",param_00,"killerPos",2,int(self.var_2E6[2]));
		setmatchdata("lives",param_00,"killerAngles",0,int(self.var_41[0]));
		setmatchdata("lives",param_00,"killerAngles",1,int(self.var_41[1]));
		setmatchdata("lives",param_00,"killerAngles",2,int(self.var_41[2]));
	}

	setmatchdata("lives",param_00,"player",self.clientid);
	setmatchdata("lives",param_00,"victimPos",0,int(self.var_2E6[0]));
	setmatchdata("lives",param_00,"victimPos",1,int(self.var_2E6[1]));
	setmatchdata("lives",param_00,"victimPos",2,int(self.var_2E6[2]));
	setmatchdata("lives",param_00,"victimAngles",0,int(self.var_41[0]));
	setmatchdata("lives",param_00,"victimAngles",1,int(self.var_41[1]));
	setmatchdata("lives",param_00,"victimAngles",2,int(self.var_41[2]));
	var_10 = "world";
	if(isplayer(param_01))
	{
		var_10 = param_01.name;
	}

	var_11 = 1;
	var_12 = 0;
	var_13 = maps\mp\_utility::isaiteamparticipant(self);
	var_14 = 0;
	if(isplayer(param_01))
	{
		var_14 = maps\mp\_utility::isaiteamparticipant(param_01);
	}

	var_15 = length(self.var_2E6 - param_01.var_2E6);
	var_16 = 0;
	var_17 = 0;
	var_18 = -1;
	var_19 = -1;
	var_1A = gettime();
	if(isplayer(param_01))
	{
		var_17 = param_01 playerads();
	}

	var_1B = param_01.clientid;
	if(!isdefined(var_1B))
	{
		var_1B = -1;
	}

	var_1C = param_01.lifeid;
	if(!isdefined(var_1C))
	{
		var_1C = -1;
	}

	var_1D = 0.1;
	if(self.damage_info.size > 1)
	{
		var_11 = 0;
	}

	if(isdefined(self.damage_info[param_01 getentitynumber()]))
	{
		var_12 = self.damage_info[param_01 getentitynumber()].var_6288;
	}

	var_1E = self.connectedpostgame["primaryWeapon"] + "_mp";
	var_1F = weaponclass(var_1E);
	if(issubstr(var_08.fx_origin,"loot"))
	{
		var_16 = 1;
	}

	if(isdefined(self.var_89DE) && isdefined(self.var_89DE.spawntime))
	{
		var_18 = var_1A - self.var_89DE.spawntime / 1000;
	}

	if(isdefined(param_01.var_89DE) && isdefined(param_01.var_89DE.spawntime) && isplayer(param_01))
	{
		var_19 = var_1A - param_01.var_89DE.spawntime / 1000;
	}

	function_0101(self.var_2E6,"script_mp_playerdeath: player_name %s, life_id %d, angles %v, death_dot %f, is_jugg %b, is_killstreak %b, mod %s, gameTime %d, spawnToDeathTime %f, attackerAliveTime %f, attacker_life_id %d",self.name,self.lifeid,self.var_41,var_0D,param_01 maps\mp\_utility::isjuggernaut(),maps\mp\_utility::iskillstreakweapon(var_08.currentkillstreakindex),param_03,var_1A,var_18,var_19,var_1C);
	function_0101(self.var_2E6,"@"script_mp_weaponinfo: player_name %s, life_id %d, isbot %b, attacker_name %s, attacker %d, attacker_pos %v, distance %f, ads_fraction %f, is_jugg %b, is_killstreak %b, weapon_type %s, weapon_class %s, weapon_name %s, isLoot %b, attachment0 %s, attachment1 %s, attachment2 %s, numShots %d, soleAttacker %b, gameTime %d",self.name,self.lifeid,var_13,var_10,var_1B,param_01.var_2E6,var_15,var_17,param_01 maps\mp\_utility::isjuggernaut(),maps\mp\_utility::iskillstreakweapon(var_08.currentkillstreakindex),var_08.var_A2EA,var_08.var_A2CC,var_08.fx_origin,var_16,var_08.var_53[0],var_08.var_53[1],var_08.var_53[2],var_12,var_11,var_1A);
	function_0101(self.var_2E6,"script_mp_weaponinfo_ext: player_name %s, life_id %d, gametime %d, version %f, victimWeapon %s, victimWeaponClass %s, killerIsBot %b",self.name,self.lifeid,var_1A,var_1D,var_1E,var_1F,var_14);
	if(!isdefined(level.damagedealttoofast))
	{
		level.damagedealttoofast = [];
	}

	if(!isdefined(level.damagedealttoofast["deathCount"]))
	{
		level.damagedealttoofast["deathCount"] = 1;
	}
	else
	{
		level.damagedealttoofast["deathCount"]++;
	}

	if(var_18 <= 3)
	{
		if(!isdefined(level.damagedealttoofast["badSpawnDiedTooFastCount"]))
		{
			level.damagedealttoofast["badSpawnDiedTooFastCount"] = 1;
		}
		else
		{
			level.damagedealttoofast["badSpawnDiedTooFastCount"]++;
		}

		if(self.var_89DE.var_126D == 0)
		{
			if(!isdefined(level.damagedealttoofast["badSpawnByAnyMeansCount"]))
			{
				level.damagedealttoofast["badSpawnByAnyMeansCount"] = 1;
			}
			else
			{
				level.damagedealttoofast["badSpawnByAnyMeansCount"]++;
			}

			self.var_89DE.var_126D = 1;
		}
	}

	if(isplayer(param_01) && var_19 <= 3 && !var_08.fx_origin == "sentry_minigun_mp")
	{
		if(!isdefined(level.damagedealttoofast["badSpawnKilledTooFastCount"]))
		{
			level.damagedealttoofast["badSpawnKilledTooFastCount"] = 1;
		}
		else
		{
			level.damagedealttoofast["badSpawnKilledTooFastCount"]++;
		}

		if(param_01.var_89DE.var_126D == 0)
		{
			if(!isdefined(level.damagedealttoofast["badSpawnByAnyMeansCount"]))
			{
				level.damagedealttoofast["badSpawnByAnyMeansCount"] = 1;
			}
			else
			{
				level.damagedealttoofast["badSpawnByAnyMeansCount"]++;
			}

			param_01.var_89DE.var_126D = 1;
		}
	}
}

//Function Number: 24
lib_A744::logplayerdata()
{
	if(!lib_A744::canlogclient(self))
	{
		return;
	}

	setmatchdata("players",self.clientid,"score",maps\mp\_utility::getpersstat("score"));
	if(maps\mp\_utility::getpersstat("assists") > 255)
	{
		setmatchdata("players",self.clientid,"assists",255);
	}
	else
	{
		setmatchdata("players",self.clientid,"assists",maps\mp\_utility::getpersstat("assists"));
	}

	if(maps\mp\_utility::getpersstat("longestStreak") > 255)
	{
		setmatchdata("players",self.clientid,"longestStreak",255);
	}
	else
	{
		setmatchdata("players",self.clientid,"longestStreak",maps\mp\_utility::getpersstat("longestStreak"));
	}

	if(isdefined(self) && isdefined(self.connectedpostgame) && isdefined(self.connectedpostgame["validationInfractions"]))
	{
		if(maps\mp\_utility::getpersstat("validationInfractions") > 255)
		{
			setmatchdata("players",self.clientid,"validationInfractions",255);
			return;
		}

		setmatchdata("players",self.clientid,"validationInfractions",maps\mp\_utility::getpersstat("validationInfractions"));
	}
}

//Function Number: 25
lib_A744::endofgamesummarylogger()
{
	foreach(var_01 in level.var_328)
	{
		wait(0.05);
		if(!isdefined(var_01))
		{
			continue;
		}

		lib_A744::logplayerping(var_01);
		if(isdefined(var_01.detectedexploit) && var_01.detectedexploit && var_01 maps\mp\_utility::rankingenabled())
		{
			var_01 setrankedplayerdata("restXPGoal",var_01.detectedexploit);
		}

		var_02 = undefined;
		var_03 = 0;
		if(isdefined(game["challengeStruct"]) && isdefined(game["challengeStruct"]["challengesCompleted"]) && isdefined(game["challengeStruct"]["challengesCompleted"][var_01.assistedsuicide]))
		{
			var_03 = 1;
		}

		if(var_03)
		{
			var_02 = game["challengeStruct"]["challengesCompleted"][var_01.assistedsuicide];
			if(var_02.size > 0)
			{
				var_01 setcommonplayerdata("round","challengeNumCompleted",var_02.size);
				var_04 = maps\mp\_utility::clamptobyte(var_02.size);
				setmatchdata("players",var_01.clientid,"challengesCompleted",var_04);
			}
			else
			{
				var_01 setcommonplayerdata("round","challengeNumCompleted",0);
			}
		}
		else
		{
			var_01 setcommonplayerdata("round","challengeNumCompleted",0);
		}

		for(var_05 = 0;var_05 < 20;var_05++)
		{
			if(isdefined(var_02) && isdefined(var_02[var_05]) && var_02[var_05] != 8000)
			{
				var_01 setcommonplayerdata("round","challengesCompleted",var_05,var_02[var_05]);
				continue;
			}

			var_01 setcommonplayerdata("round","challengesCompleted",var_05,0);
		}

		var_01 setcommonplayerdata("round","gameMode",level.gametype);
		var_01 setcommonplayerdata("round","map",tolower(getdvar("mapname")));
	}
}

//Function Number: 26
lib_A744::logplayerping(param_00)
{
	if(!isdefined(param_00.connectedpostgame["maxPing"]) || !isdefined(param_00.connectedpostgame["minPing"]) || !isdefined(param_00.connectedpostgame["pingAccumulation"]) || !isdefined(param_00.connectedpostgame["pingSampleCount"]))
	{
		return;
	}

	if(param_00.connectedpostgame["pingSampleCount"] > 0 && param_00.connectedpostgame["maxPing"] > 0)
	{
		var_01 = maps\mp\_utility::clamptoshort(param_00.connectedpostgame["pingAccumulation"] / param_00.connectedpostgame["pingSampleCount"]);
		setmatchdata("players",param_00.clientid,"averagePing",var_01);
		setmatchdata("players",param_00.clientid,"maxPing",maps\mp\_utility::clamptoshort(param_00.connectedpostgame["maxPing"]));
		setmatchdata("players",param_00.clientid,"minPing",maps\mp\_utility::clamptoshort(param_00.connectedpostgame["minPing"]));
	}
}

//Function Number: 27
lib_A744::gameendlistener()
{
	level waittill("game_ended");
	foreach(var_01 in level.var_328)
	{
		var_01 lib_A744::logplayerdata();
		if(!isalive(var_01))
		{
			continue;
		}

		var_01 lib_A744::logplayerlife(0);
	}

	foreach(var_01 in level.var_328)
	{
		if(var_01.totallifetime > 0)
		{
			var_04 = var_01 maps\mp\_utility::getpersstat("score") / var_01.totallifetime / 60000;
			function_0241(var_01.num_lobby_idles,var_04,var_01.inliveplayerkillstreak);
		}

		var_01.totallifetime = 0;
	}
}

//Function Number: 28
lib_A744::canlogclient(param_00)
{
	if(isagent(param_00))
	{
		return 0;
	}

	var_01 = param_00.code_classname;
	if(!isdefined(var_01))
	{
		var_01 = "undefined";
	}

	return param_00.clientid < level.maxlogclients;
}

//Function Number: 29
lib_A744::canlogevent()
{
	return getmatchdata("eventCount") < level.maxevents;
}

//Function Number: 30
lib_A744::canlogkillstreak()
{
	return getmatchdata("killstreakCount") < level.maxkillstreaks;
}

//Function Number: 31
lib_A744::canloglife(param_00)
{
	return getmatchdata("lifeCount") < level.maxlives;
}

//Function Number: 32
lib_A744::logweaponstat(param_00,param_01,param_02)
{
	if(!lib_A744::canlogclient(self))
	{
		return;
	}

	if(maps\mp\_utility::iskillstreakweapon(param_00))
	{
		return;
	}

	if(!isdefined(self.connectedpostgame["mpWeaponStats"][param_00]))
	{
		self.connectedpostgame["mpWeaponStats"][param_00] = [];
	}

	if(!isdefined(self.connectedpostgame["mpWeaponStats"][param_00][param_01]))
	{
		self.connectedpostgame["mpWeaponStats"][param_00][param_01] = 0;
	}

	var_03 = self.connectedpostgame["mpWeaponStats"][param_00][param_01];
	var_03 = var_03 + param_02;
	self.connectedpostgame["mpWeaponStats"][param_00][param_01] = var_03;
}

//Function Number: 33
lib_A744::buildbaseweaponlist()
{
	var_00 = [];
	var_01 = 149;
	for(var_02 = 0;var_02 <= var_01;var_02++)
	{
		var_03 = tablelookup("mp/statstable.csv",0,var_02,4);
		if(var_03 == "")
		{
			continue;
		}

		if(!issubstr(tablelookup("mp/statsTable.csv",0,var_02,2),"weapon_"))
		{
			continue;
		}

		if(tablelookup("mp/statsTable.csv",0,var_02,2) == "weapon_other")
		{
			continue;
		}

		if(tablelookup("mp/statsTable.csv",0,var_02,51) != "")
		{
			continue;
		}

		var_00[var_00.size] = var_03;
	}

	return var_00;
}

//Function Number: 34
lib_A744::logkillsconfirmed()
{
	if(!lib_A744::canlogclient(self))
	{
		return;
	}

	setmatchdata("players",self.clientid,"killsConfirmed",self.connectedpostgame["confirmed"]);
}

//Function Number: 35
lib_A744::logkillsdenied()
{
	if(!lib_A744::canlogclient(self))
	{
		return;
	}

	setmatchdata("players",self.clientid,"killsDenied",self.connectedpostgame["denied"]);
}

//Function Number: 36
lib_A744::loginitialstats()
{
	if(getdvarint("mdsd") > 0)
	{
		var_00 = self getrankedplayerdata("experience");
		setmatchdata("players",self.clientid,"startXp",var_00);
		setmatchdata("players",self.clientid,"startKills",self getrankedplayerdata("kills"));
		setmatchdata("players",self.clientid,"startDeaths",self getrankedplayerdata("deaths"));
		setmatchdata("players",self.clientid,"startWins",self getrankedplayerdata("wins"));
		setmatchdata("players",self.clientid,"startLosses",self getrankedplayerdata("losses"));
		setmatchdata("players",self.clientid,"startHits",self getrankedplayerdata("hits"));
		setmatchdata("players",self.clientid,"startMisses",self getrankedplayerdata("misses"));
		setmatchdata("players",self.clientid,"startGamesPlayed",self getrankedplayerdata("gamesPlayed"));
		setmatchdata("players",self.clientid,"startScore",self getrankedplayerdata("score"));
		setmatchdata("players",self.clientid,"startUnlockPoints",self getrankedplayerdata("unlockPoints"));
		setmatchdata("players",self.clientid,"startPrestige",self getrankedplayerdata("prestige"));
		setmatchdata("players",self.clientid,"startDP",self getrankedplayerdata("division"));
		var_01 = self getrankedplayerdata("mmr");
		setmatchdata("players",self.clientid,"startMMR",var_01);
	}
}

//Function Number: 37
lib_A744::logfinalstats()
{
	if(getdvarint("mdsd") > 0)
	{
		var_00 = self getrankedplayerdata("experience");
		setmatchdata("players",self.clientid,"endXp",var_00);
		setmatchdata("players",self.clientid,"endKills",self getrankedplayerdata("kills"));
		setmatchdata("players",self.clientid,"endDeaths",self getrankedplayerdata("deaths"));
		setmatchdata("players",self.clientid,"endWins",self getrankedplayerdata("wins"));
		setmatchdata("players",self.clientid,"endLosses",self getrankedplayerdata("losses"));
		setmatchdata("players",self.clientid,"endHits",self getrankedplayerdata("hits"));
		setmatchdata("players",self.clientid,"endMisses",self getrankedplayerdata("misses"));
		setmatchdata("players",self.clientid,"endGamesPlayed",self getrankedplayerdata("gamesPlayed"));
		setmatchdata("players",self.clientid,"endScore",self getrankedplayerdata("score"));
		setmatchdata("players",self.clientid,"endUnlockPoints",self getrankedplayerdata("unlockPoints"));
		setmatchdata("players",self.clientid,"endPrestige",self getrankedplayerdata("prestige"));
		var_01 = self getrankedplayerdata("mmr");
		setmatchdata("players",self.clientid,"endMMR",var_01);
		if(isdefined(self.connectedpostgame["rank"]))
		{
			var_03 = maps\mp\_utility::clamptobyte(maps\mp\gametypes\_rank::getrank());
			setmatchdata("players",self.clientid,"rankAtEnd",var_03);
		}
	}
}

//Function Number: 38
lib_A744::reconlogplayerinfo()
{
	for(;;)
	{
		if(getdvarint("cl_freemove") == 0)
		{
			foreach(var_01 in level.var_328)
			{
				var_02 = 0;
				if(maps\mp\_utility::isreallyalive(var_01))
				{
					var_02 = 1;
				}

				if(function_0286(var_01))
				{
					continue;
				}

				if(!isdefined(var_01.var_2E6))
				{
					continue;
				}

				var_03 = "disconnected?";
				if(isdefined(var_01.name))
				{
					var_03 = var_01.name;
				}

				var_04 = -1;
				if(isdefined(var_01.clientid))
				{
					var_04 = var_01.clientid;
				}

				var_05 = (-999,-999,-999);
				if(isdefined(var_01.var_41))
				{
					var_05 = var_01.var_41;
				}

				var_06 = "undefined";
				if(isdefined(var_01.inliveplayerkillstreak))
				{
					var_06 = var_01.inliveplayerkillstreak;
				}

				var_07 = gettime();
				function_0101(var_01.var_2E6,"script_mp_playerpos: player_name %s, angles %v, gameTime %d, playerTeam %s, is_alive %b",var_03,var_05,var_07,var_06,var_02);
			}
		}

		wait(0.2);
	}
}