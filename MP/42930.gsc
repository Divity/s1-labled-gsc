/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42930.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 49
 * Decompile Time: 8 ms
 * Timestamp: 4/20/2022 8:18:30 PM
*******************************************************************/

//Function Number: 1
lib_A7B2::init()
{
	lib_A7B2::initscoreboard();
	level.teambalance = getdvarint("scr_teambalance");
	level.maxclients = getdvarint("sv_maxclients");
	lib_A7B2::setplayermodels();
	level.freeplayers = [];
	if(level.teambased)
	{
		level thread lib_A7B2::onplayerconnect();
		level thread lib_A7B2::updateteambalance();
		wait(0.15);
		level thread lib_A7B2::updateplayertimes();
		return;
	}

	level thread lib_A7B2::onfreeplayerconnect();
	wait(0.15);
	level thread lib_A7B2::updatefreeplayertimes();
}

//Function Number: 2
lib_A7B2::initscoreboard()
{
	setdvar("g_TeamName_Allies",lib_A7B2::getteamshortname("allies"));
	setdvar("g_TeamIcon_Allies",lib_A7B2::getteamicon("allies"));
	setdvar("g_TeamIcon_MyAllies",lib_A7B2::getteamicon("allies"));
	setdvar("g_TeamIcon_EnemyAllies",lib_A7B2::getteamicon("allies"));
	var_00 = lib_A7B2::getteamcolor("allies");
	setdvar("g_ScoresColor_Allies",var_00[0] + " " + var_00[1] + " " + var_00[2]);
	setdvar("g_TeamName_Axis",lib_A7B2::getteamshortname("axis"));
	setdvar("g_TeamIcon_Axis",lib_A7B2::getteamicon("axis"));
	setdvar("g_TeamIcon_MyAxis",lib_A7B2::getteamicon("axis"));
	setdvar("g_TeamIcon_EnemyAxis",lib_A7B2::getteamicon("axis"));
	var_00 = lib_A7B2::getteamcolor("axis");
	setdvar("g_ScoresColor_Axis",var_00[0] + " " + var_00[1] + " " + var_00[2]);
	setdvar("g_ScoresColor_Spectator",".25 .25 .25");
	setdvar("g_ScoresColor_Free",".76 .78 .10");
	setdvar("g_teamTitleColor_MyTeam",".6 .8 .6");
	setdvar("g_teamTitleColor_EnemyTeam","1 .45 .5");
}

//Function Number: 3
lib_A7B2::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A7B2::onjoinedteam();
		var_00 thread lib_A7B2::onjoinedspectators();
		var_00 thread lib_A7B2::onplayerspawned();
		var_00 thread lib_A7B2::trackplayedtime();
	}
}

//Function Number: 4
lib_A7B2::onfreeplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A7B2::trackfreeplayedtime();
	}
}

//Function Number: 5
lib_A7B2::onjoinedteam()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("joined_team");
		lib_A7B2::updateteamtime();
	}
}

//Function Number: 6
lib_A7B2::onjoinedspectators()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("joined_spectators");
		self.connectedpostgame["teamTime"] = undefined;
	}
}

//Function Number: 7
lib_A7B2::trackplayedtime()
{
	self endon("disconnect");
	function_02B0(self.num_lobby_idles);
	self.timeplayed["allies"] = 0;
	self.timeplayed["axis"] = 0;
	self.timeplayed["other"] = 0;
	maps\mp\_utility::gameflagwait("prematch_done");
	for(;;)
	{
		if(game["state"] == "playing")
		{
			if(self.sessionteam == "allies")
			{
				self.timeplayed["allies"]++;
				self.timeplayed["total"]++;
			}
			else if(self.sessionteam == "axis")
			{
				self.timeplayed["axis"]++;
				self.timeplayed["total"]++;
			}
			else if(self.sessionteam == "spectator")
			{
				self.timeplayed["other"]++;
			}
		}

		wait(1);
	}
}

//Function Number: 8
lib_A7B2::updateplayertimes()
{
	if(!level.rankedmatch)
	{
		return;
	}

	level endon("game_ended");
	for(;;)
	{
		maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
		foreach(var_01 in level.var_328)
		{
			var_01 lib_A7B2::updateplayedtime();
		}

		wait(1);
	}
}

//Function Number: 9
lib_A7B2::updateplayedtime()
{
	if(isai(self))
	{
		return;
	}

	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	if(self.timeplayed["allies"])
	{
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedAllies",self.timeplayed["allies"]);
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedTotal",self.timeplayed["allies"]);
		maps\mp\gametypes\_persistance::func_8D4E("round","timePlayed",self.timeplayed["allies"]);
	}

	if(self.timeplayed["axis"])
	{
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedOpfor",self.timeplayed["axis"]);
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedTotal",self.timeplayed["axis"]);
		maps\mp\gametypes\_persistance::func_8D4E("round","timePlayed",self.timeplayed["axis"]);
	}

	if(self.timeplayed["other"])
	{
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedOther",self.timeplayed["other"]);
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedTotal",self.timeplayed["other"]);
		maps\mp\gametypes\_persistance::func_8D4E("round","timePlayed",self.timeplayed["other"]);
	}

	if(game["state"] == "postgame")
	{
		return;
	}

	self.timeplayed["allies"] = 0;
	self.timeplayed["axis"] = 0;
	self.timeplayed["other"] = 0;
}

//Function Number: 10
lib_A7B2::updateteamtime()
{
	if(game["state"] != "playing")
	{
		return;
	}

	self.connectedpostgame["teamTime"] = gettime();
}

//Function Number: 11
lib_A7B2::updateteambalancedvar()
{
	for(;;)
	{
		var_00 = getdvarint("scr_teambalance");
		if(level.teambalance != var_00)
		{
			level.teambalance = getdvarint("scr_teambalance");
		}

		wait(1);
	}
}

//Function Number: 12
lib_A7B2::updateteambalance()
{
	level.teamlimit = level.maxclients / 2;
	level thread lib_A7B2::updateteambalancedvar();
	wait(0.15);
	if(level.teambalance && maps\mp\_utility::isroundbased())
	{
		if(isdefined(game["BalanceTeamsNextRound"]))
		{
			iprintlnbold(&"MP_AUTOBALANCE_NEXT_ROUND");
		}

		level waittill("restarting");
		if(isdefined(game["BalanceTeamsNextRound"]))
		{
			level lib_A7B2::balanceteams();
			game["BalanceTeamsNextRound"] = undefined;
			return;
		}

		if(!lib_A7B2::getteambalance())
		{
			game["BalanceTeamsNextRound"] = 1;
			return;
		}

		return;
	}

	level endon("game_ended");
	for(;;)
	{
		if(level.teambalance)
		{
			if(!lib_A7B2::getteambalance())
			{
				iprintlnbold(&"MP_AUTOBALANCE_SECONDS",15);
				wait(15);
				if(!lib_A7B2::getteambalance())
				{
					level lib_A7B2::balanceteams();
				}
			}

			wait(59);
		}

		wait(1);
	}
}

//Function Number: 13
lib_A7B2::getteambalance()
{
	level.inliveplayerkillstreak["allies"] = 0;
	level.inliveplayerkillstreak["axis"] = 0;
	var_00 = level.var_328;
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		if(isdefined(var_00[var_01].connectedpostgame["team"]) && var_00[var_01].connectedpostgame["team"] == "allies")
		{
			level.inliveplayerkillstreak["allies"]++;
			continue;
		}

		if(isdefined(var_00[var_01].connectedpostgame["team"]) && var_00[var_01].connectedpostgame["team"] == "axis")
		{
			level.inliveplayerkillstreak["axis"]++;
		}
	}

	if(level.inliveplayerkillstreak["allies"] > level.inliveplayerkillstreak["axis"] + level.teambalance || level.inliveplayerkillstreak["axis"] > level.inliveplayerkillstreak["allies"] + level.teambalance)
	{
		return 0;
	}

	return 1;
}

//Function Number: 14
lib_A7B2::balanceteams()
{
	iprintlnbold(game["strings"]["autobalance"]);
	var_00 = [];
	var_01 = [];
	var_02 = level.var_328;
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		if(!isdefined(var_02[var_03].connectedpostgame["teamTime"]))
		{
			continue;
		}

		if(isdefined(var_02[var_03].connectedpostgame["team"]) && var_02[var_03].connectedpostgame["team"] == "allies")
		{
			var_00[var_00.size] = var_02[var_03];
			continue;
		}

		if(isdefined(var_02[var_03].connectedpostgame["team"]) && var_02[var_03].connectedpostgame["team"] == "axis")
		{
			var_01[var_01.size] = var_02[var_03];
		}
	}

	var_04 = undefined;
	while(var_00.size > var_01.size + 1 || var_01.size > var_00.size + 1)
	{
		if(var_00.size > var_01.size + 1)
		{
			for(var_05 = 0;var_05 < var_00.size;var_05++)
			{
				if(isdefined(var_00[var_05].dont_auto_balance))
				{
					continue;
				}

				if(!isdefined(var_04))
				{
					var_04 = var_00[var_05];
					continue;
				}

				if(var_00[var_05].connectedpostgame["teamTime"] > var_04.connectedpostgame["teamTime"])
				{
					var_04 = var_00[var_05];
				}
			}

			var_04 [[ level.onteamselection ]]("axis");
		}
		else if(var_01.size > var_00.size + 1)
		{
			for(var_05 = 0;var_05 < var_01.size;var_05++)
			{
				if(isdefined(var_01[var_05].dont_auto_balance))
				{
					continue;
				}

				if(!isdefined(var_04))
				{
					var_04 = var_01[var_05];
					continue;
				}

				if(var_01[var_05].connectedpostgame["teamTime"] > var_04.connectedpostgame["teamTime"])
				{
					var_04 = var_01[var_05];
				}
			}

			var_04 [[ level.onteamselection ]]("allies");
		}

		var_04 = undefined;
		var_00 = [];
		var_01 = [];
		var_02 = level.var_328;
		for(var_03 = 0;var_03 < var_02.size;var_03++)
		{
			if(isdefined(var_02[var_03].connectedpostgame["team"]) && var_02[var_03].connectedpostgame["team"] == "allies")
			{
				var_00[var_00.size] = var_02[var_03];
				continue;
			}

			if(isdefined(var_02[var_03].connectedpostgame["team"]) && var_02[var_03].connectedpostgame["team"] == "axis")
			{
				var_01[var_01.size] = var_02[var_03];
			}
		}
	}
}

//Function Number: 15
lib_A7B2::setghilliemodels(param_00)
{
}

//Function Number: 16
lib_A7B2::setteammodels(param_00,param_01)
{
}

//Function Number: 17
lib_A7B2::setplayermodels()
{
	if(level.multiteambased)
	{
		for(var_00 = 0;var_00 < level.teamnamelist.size;var_00++)
		{
			lib_A7B2::setteammodels(level.teamnamelist[var_00],game[level.teamnamelist[var_00]]);
		}
	}
	else
	{
		lib_A7B2::setteammodels("allies",game["allies"]);
		lib_A7B2::setteammodels("axis",game["axis"]);
	}

	lib_A7B2::setghilliemodels(getmapcustomfield("environment"));
}

//Function Number: 18
lib_A7B2::playercostume()
{
	if(isagent(self) && !getdvarint("virtualLobbyActive",0))
	{
		return 1;
	}

	self method_84BA(self.costume);
	if(isdefined(self.perks) && !getdvarint("virtualLobbyActive",0))
	{
		if(maps\mp\_utility::_hasperk("specialty_exo_shoulderlauncher"))
		{
			if(!maps\mp\_utility::_hasperk("specialty_wildcard_dualtacticals"))
			{
				self attach("npc_exo_launcher_base_L","",1);
			}

			if(maps\mp\_utility::_hasperk("specialty_wildcard_duallethals"))
			{
				self attach("npc_exo_launcher_base_R","",1);
			}
		}
		else
		{
			if(!maps\mp\_utility::_hasperk("specialty_wildcard_dualtacticals") || maps\mp\_utility::isgrapplinghookgamemode())
			{
				self attach("npc_exo_arm_launcher_L","J_Elbow_LE",1);
			}

			if(maps\mp\_utility::_hasperk("specialty_wildcard_duallethals"))
			{
				self attach("npc_exo_arm_launcher_R","J_Elbow_RI",1);
			}
		}
	}

	self.voice = "american";
	self method_83DB("vestlight");
	return 1;
}

//Function Number: 19
lib_A7B2::validcostume(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	var_01 = function_029E(param_00);
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		if(param_00[var_02] != var_01[var_02])
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 20
lib_A7B2::getdefaultcostume()
{
	var_00 = function_029F();
	return var_00;
}

//Function Number: 21
lib_A7B2::getpracticeroundcostume()
{
	if(!isdefined(level.practice_round_costume))
	{
		level.practice_round_max_costumes = function_0296(level.practiceroundcostumetablename) - 1;
		level.practice_round_costume = randomint(level.practice_round_max_costumes);
	}

	var_00 = 0;
	for(var_01 = 0;var_01 < level.var_328.size;var_01++)
	{
		if(level.var_328[var_01] == self)
		{
			var_00 = var_01;
			break;
		}
	}

	var_02 = level.practice_round_costume + var_00 % level.practice_round_max_costumes;
	var_03 = function_02CF(level.practiceroundcostumetablename,var_02 + 1);
	return var_03;
}

//Function Number: 22
lib_A7B2::gethardcorecostume()
{
	var_00 = 2;
	if(self.connectedpostgame["team"] == "axis")
	{
		var_00 = 1;
	}

	var_01 = function_02CF(level.var_46C6,var_00);
	return var_01;
}

//Function Number: 23
lib_A7B2::playermodelforweapon(param_00,param_01)
{
	var_02 = self.inliveplayerkillstreak;
	var_03 = lib_A7B2::playercostume();
	self notify("player_model_set");
}

//Function Number: 24
lib_A7B2::countplayers()
{
	var_00 = [];
	for(var_01 = 0;var_01 < level.teamnamelist.size;var_01++)
	{
		var_00[level.teamnamelist[var_01]] = 0;
	}

	for(var_01 = 0;var_01 < level.var_328.size;var_01++)
	{
		if(level.var_328[var_01] == self)
		{
			continue;
		}

		if(level.var_328[var_01].connectedpostgame["team"] == "spectator")
		{
			continue;
		}

		if(isdefined(level.var_328[var_01].connectedpostgame["team"]))
		{
			var_00[level.var_328[var_01].connectedpostgame["team"]]++;
		}
	}

	return var_00;
}

//Function Number: 25
lib_A7B2::trackfreeplayedtime()
{
	self endon("disconnect");
	function_02B0(self.num_lobby_idles);
	self.timeplayed["allies"] = 0;
	self.timeplayed["axis"] = 0;
	self.timeplayed["other"] = 0;
	for(;;)
	{
		if(game["state"] == "playing")
		{
			if(isdefined(self.connectedpostgame["team"]) && self.connectedpostgame["team"] == "allies" && self.sessionteam != "spectator")
			{
				self.timeplayed["allies"]++;
				self.timeplayed["total"]++;
			}
			else if(isdefined(self.connectedpostgame["team"]) && self.connectedpostgame["team"] == "axis" && self.sessionteam != "spectator")
			{
				self.timeplayed["axis"]++;
				self.timeplayed["total"]++;
			}
			else
			{
				self.timeplayed["other"]++;
			}
		}

		wait(1);
	}
}

//Function Number: 26
lib_A7B2::updatefreeplayertimes()
{
	if(!level.rankedmatch)
	{
		return;
	}

	var_00 = 0;
	for(;;)
	{
		var_00++;
		if(var_00 >= level.var_328.size)
		{
			var_00 = 0;
		}

		if(isdefined(level.var_328[var_00]))
		{
			level.var_328[var_00] lib_A7B2::updatefreeplayedtime();
		}

		wait(1);
	}
}

//Function Number: 27
lib_A7B2::updatefreeplayedtime()
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	if(isai(self))
	{
		return;
	}

	if(self.timeplayed["allies"])
	{
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedAllies",self.timeplayed["allies"]);
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedTotal",self.timeplayed["allies"]);
		maps\mp\gametypes\_persistance::func_8D4E("round","timePlayed",self.timeplayed["allies"]);
	}

	if(self.timeplayed["axis"])
	{
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedOpfor",self.timeplayed["axis"]);
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedTotal",self.timeplayed["axis"]);
		maps\mp\gametypes\_persistance::func_8D4E("round","timePlayed",self.timeplayed["axis"]);
	}

	if(self.timeplayed["other"])
	{
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedOther",self.timeplayed["other"]);
		maps\mp\gametypes\_persistance::func_8D4B("timePlayedTotal",self.timeplayed["other"]);
		maps\mp\gametypes\_persistance::func_8D4E("round","timePlayed",self.timeplayed["other"]);
	}

	if(game["state"] == "postgame")
	{
		return;
	}

	self.timeplayed["allies"] = 0;
	self.timeplayed["axis"] = 0;
	self.timeplayed["other"] = 0;
}

//Function Number: 28
lib_A7B2::getjointeampermissions(param_00)
{
	if(maps\mp\_utility::iscoop())
	{
		return 1;
	}

	var_01 = 0;
	var_02 = 0;
	var_03 = level.var_328;
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_05 = var_03[var_04];
		if(isdefined(var_05.connectedpostgame["team"]) && var_05.connectedpostgame["team"] == param_00)
		{
			var_01++;
			if(isbot(var_05))
			{
				var_02++;
			}
		}
	}

	if(var_01 < level.teamlimit)
	{
		return 1;
	}

	if(var_02 > 0)
	{
		return 1;
	}

	if(level.gametype == "infect")
	{
		return 1;
	}

	return 0;
}

//Function Number: 29
lib_A7B2::onplayerspawned()
{
	level endon("game_ended");
	self waittill("spawned_player");
}

//Function Number: 30
lib_A7B2::mt_getteamname(param_00)
{
	return tablelookupistring("mp/MTTable.csv",0,param_00,1);
}

//Function Number: 31
lib_A7B2::mt_getteamicon(param_00)
{
	return tablelookup("mp/MTTable.csv",0,param_00,2);
}

//Function Number: 32
lib_A7B2::mt_getteamheadicon(param_00)
{
	return tablelookup("mp/MTTable.csv",0,param_00,3);
}

//Function Number: 33
lib_A7B2::getteamname(param_00)
{
	return tablelookupistring("mp/factionTable.csv",0,game[param_00],1);
}

//Function Number: 34
lib_A7B2::getteamshortname(param_00)
{
	return tablelookupistring("mp/factionTable.csv",0,game[param_00],2);
}

//Function Number: 35
lib_A7B2::getteamforfeitedstring(param_00)
{
	return tablelookupistring("mp/factionTable.csv",0,game[param_00],4);
}

//Function Number: 36
lib_A7B2::getteameliminatedstring(param_00)
{
	return tablelookupistring("mp/factionTable.csv",0,game[param_00],3);
}

//Function Number: 37
lib_A7B2::getteamicon(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],5);
}

//Function Number: 38
lib_A7B2::getteamhudicon(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],6);
}

//Function Number: 39
lib_A7B2::getteamheadicon(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],17);
}

//Function Number: 40
lib_A7B2::getteamvoiceprefix(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],7);
}

//Function Number: 41
lib_A7B2::getteamspawnmusic(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],8);
}

//Function Number: 42
lib_A7B2::getteamwinmusic(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],9);
}

//Function Number: 43
lib_A7B2::getteamflagmodel(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],10);
}

//Function Number: 44
lib_A7B2::getteamflagcarrymodel(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],11);
}

//Function Number: 45
lib_A7B2::getteamflagicon(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],12);
}

//Function Number: 46
lib_A7B2::getteamflagfx(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],13);
}

//Function Number: 47
lib_A7B2::getteamcolor(param_00)
{
	return (maps\mp\_utility::stringtofloat(tablelookup("mp/factionTable.csv",0,game[param_00],14)),maps\mp\_utility::stringtofloat(tablelookup("mp/factionTable.csv",0,game[param_00],15)),maps\mp\_utility::stringtofloat(tablelookup("mp/factionTable.csv",0,game[param_00],16)));
}

//Function Number: 48
lib_A7B2::getteamcratemodel(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],18);
}

//Function Number: 49
lib_A7B2::getteamdeploymodel(param_00)
{
	return tablelookup("mp/factionTable.csv",0,game[param_00],19);
}