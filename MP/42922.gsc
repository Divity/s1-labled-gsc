/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42922.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 28
 * Decompile Time: 7 ms
 * Timestamp: 4/20/2022 8:18:29 PM
*******************************************************************/

//Function Number: 1
lib_A7AA::init()
{
	level.xpscale = lib_A7AA::getxpscale();
	level.xpeventinfo = [];
	level.ranktable = [];
	level.maxrank = int(tablelookup("mp/rankTable.csv",0,"maxrank",1));
	level.masterprestige = int(tablelookup("mp/rankIconTable.csv",0,"masterPrestige",1));
	level.grandmasterprestige = int(tablelookup("mp/rankIconTable.csv",0,"grandMasterPrestige",1));
	var_00 = 0;
	var_01 = tablelookup("mp/rankTable.csv",0,var_00,1);
	while(isdefined(var_01) && var_01 != "")
	{
		level.ranktable[var_00][1] = tablelookup("mp/rankTable.csv",0,var_00,1);
		level.ranktable[var_00][2] = tablelookup("mp/rankTable.csv",0,var_00,2);
		level.ranktable[var_00][3] = tablelookup("mp/rankTable.csv",0,var_00,3);
		level.ranktable[var_00][7] = tablelookup("mp/rankTable.csv",0,var_00,7);
		var_00++;
		var_01 = tablelookup("mp/rankTable.csv",0,var_00,1);
	}

	maps\mp\gametypes\_missions::buildchallegeinfo();
	level thread lib_A7AA::onplayerconnect();
}

//Function Number: 2
lib_A7AA::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		if(!isai(var_00) && var_00 maps\mp\_utility::rankingenabled())
		{
			var_01 = var_00 lib_A7AA::getprestigelevel();
			var_02 = var_00 maps\mp\gametypes\_persistance::func_8D62("experience");
			if(var_02 < 0)
			{
				var_02 = 0;
			}

			var_03 = var_00 method_8507() - var_02;
			var_04 = var_00 method_8507();
			if(!maps\mp\_utility::invirtuallobby() && !isdefined(var_00.connectedpostgame["gamesPlayedSet"]) || !var_00.connectedpostgame["gamesPlayedSet"])
			{
				var_00 maps\mp\gametypes\_persistance::func_8D4A("gamesPlayed",1);
				var_00.connectedpostgame["gamesPlayedSet"] = 1;
			}
		}
		else if(isai(var_00))
		{
			var_00 maps\mp\_utility::set_rank_xp_and_prestige_for_bot();
			var_02 = var_00.connectedpostgame["rankxp"];
			var_01 = var_00.connectedpostgame["prestige"];
			var_03 = 0;
			var_04 = var_02;
		}
		else
		{
			var_01 = 0;
			var_02 = 0;
			var_03 = 0;
			var_04 = var_02;
		}

		var_00.connectedpostgame["rankxp"] = var_02;
		var_00.connectedpostgame["redeemedxp"] = var_03;
		var_00.connectedpostgame["prestige"] = var_01;
		if(!isdefined(var_00.connectedpostgame["participation"]))
		{
			var_00.connectedpostgame["participation"] = 0;
		}

		var_05 = var_00 lib_A7AA::getrankforxp(var_00 lib_A7AA::gettotalxp());
		var_00.connectedpostgame["rank"] = var_05;
		var_00.var_A3A2 = 0;
		var_00.postgamepromotion = 0;
		var_00.var_357D[0] = 0;
		var_00 setrank(var_05,var_01);
		var_00 processprestigemastery(var_01,var_02);
		if(var_00.clientid < level.maxlogclients)
		{
			setmatchdata("players",var_00.clientid,"Prestige",var_01);
			setmatchdata("players",var_00.clientid,"rankAtStart",maps\mp\_utility::clamptobyte(var_00.connectedpostgame["rank"]));
		}

		if(!isdefined(var_00.connectedpostgame["postGameChallenges"]))
		{
			var_00 setclientdvars("ui_challenge_1_ref","","ui_challenge_2_ref","","ui_challenge_3_ref","","ui_challenge_4_ref","","ui_challenge_5_ref","","ui_challenge_6_ref","","ui_challenge_7_ref","");
		}

		var_00 setclientdvar("ui_promotion",0);
		if(!isdefined(var_00.connectedpostgame["summary"]))
		{
			var_00.connectedpostgame["summary"] = [];
			var_00.connectedpostgame["summary"]["xp"] = 0;
			var_00.connectedpostgame["summary"]["score"] = 0;
			var_00.connectedpostgame["summary"]["challenge"] = 0;
			var_00.connectedpostgame["summary"]["match"] = 0;
			var_00.connectedpostgame["summary"]["misc"] = 0;
			var_00.connectedpostgame["summary"]["entitlementXP"] = 0;
			var_00.connectedpostgame["summary"]["clanWarsXP"] = 0;
			var_00.connectedpostgame["summary"]["matchStartXp"] = var_04;
		}

		if(getdvar("virtualLobbyActive") != "1")
		{
			var_00 setclientdvar("ui_opensummary",0);
			var_00 thread maps\mp\gametypes\_missions::updatechallenges();
		}

		var_00 thread lib_A7AA::onplayerspawned();
	}
}

//Function Number: 3
lib_A7AA::onplayerspawned()
{
	self endon("disconnect");
	self waittill("spawned_player");
}

//Function Number: 4
lib_A7AA::getxpscale()
{
	var_00 = getdvarint("scr_xpscale");
	if(var_00 > 4 || var_00 < 0)
	{
		exitlevel(0);
	}

	return var_00;
}

//Function Number: 5
lib_A7AA::isregisteredevent(param_00)
{
	if(isdefined(level.xpeventinfo[param_00]))
	{
		return 1;
	}

	return 0;
}

//Function Number: 6
lib_A7AA::registerxpeventinfo(param_00,param_01,param_02,param_03)
{
	level.xpeventinfo[param_00]["value"] = param_01;
	level.xpeventinfo[param_00]["allowPlayerScore"] = 0;
	level.xpeventinfo[param_00]["playSplash"] = 0;
	if(isdefined(param_02) && param_02)
	{
		level.xpeventinfo[param_00]["allowPlayerScore"] = 1;
	}

	if(isdefined(param_03) && param_03)
	{
		level.xpeventinfo[param_00]["playSplash"] = 1;
	}
}

//Function Number: 7
lib_A7AA::allowplayerscore(param_00)
{
	return level.xpeventinfo[param_00]["allowPlayerScore"];
}

//Function Number: 8
lib_A7AA::shouldplaysplash(param_00)
{
	return level.xpeventinfo[param_00]["playSplash"];
}

//Function Number: 9
lib_A7AA::getscoreinfovalue(param_00)
{
	var_01 = "scr_" + level.gametype + "_score_" + param_00;
	if(getdvar(var_01) != "")
	{
		return getdvarint(var_01);
	}

	return level.xpeventinfo[param_00]["value"];
}

//Function Number: 10
lib_A7AA::getrankinfominxp(param_00)
{
	return int(level.ranktable[param_00][2]);
}

//Function Number: 11
lib_A7AA::getrankinfoxpamt(param_00)
{
	return int(level.ranktable[param_00][3]);
}

//Function Number: 12
lib_A7AA::getrankinfomaxxp(param_00)
{
	return int(level.ranktable[param_00][7]);
}

//Function Number: 13
lib_A7AA::getrankinfofull(param_00)
{
	return tablelookupistring("mp/rankTable.csv",0,param_00,16);
}

//Function Number: 14
lib_A7AA::getrankinfolevel(param_00)
{
	return int(tablelookup("mp/rankTable.csv",0,param_00,13));
}

//Function Number: 15
lib_A7AA::awardgameevent(param_00,param_01,param_02,param_03,param_04)
{
	if(maps\mp\_utility::invirtuallobby())
	{
		return;
	}

	if(lib_A7AA::shouldplaysplash(param_00))
	{
		param_01 thread maps\mp\gametypes\_hud_message::splashnotify(param_00);
	}

	param_01 lib_A7AA::giverankxp(param_00,undefined,param_02,param_04,undefined,param_03);
	if(lib_A7AA::allowplayerscore(param_00))
	{
		param_01 maps\mp\gametypes\_gamescore::giveplayerscore(param_00,param_01,param_03);
	}
}

//Function Number: 16
lib_A7AA::giverankxp(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("disconnect");
	if(isdefined(self.owner) && !isbot(self))
	{
		self.owner lib_A7AA::giverankxp(param_00,param_01,param_02,param_03,param_04,param_05);
		return;
	}

	if(isai(self))
	{
		return;
	}

	if(!isplayer(self))
	{
		return;
	}

	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	if(level.teambased && !level.teamcount["allies"] || !level.teamcount["axis"] && param_00 != "win")
	{
		return;
	}

	if(!level.teambased && level.teamcount["allies"] + level.teamcount["axis"] < 2)
	{
		return;
	}

	if(isdefined(level.disableranking) && level.disableranking)
	{
		return;
	}

	if(maps\mp\_utility::practiceroundgame())
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = lib_A7AA::getscoreinfovalue(param_00);
	}

	if(param_01 == 0)
	{
		return;
	}

	if(param_01 > 0 && !isdefined(self.lootplaytimevalidated))
	{
		self.lootplaytimevalidated = 1;
		function_02B2(self.num_lobby_idles);
	}

	var_06 = param_01;
	var_07 = 0;
	switch(param_00)
	{
		case "loss":
		case "win":
		case "tie":
		case "challenge":
			break;

		default:
			break;
	}
}

//Function Number: 17
lib_A7AA::updaterank(param_00)
{
	var_01 = lib_A7AA::getrank();
	if(var_01 == self.connectedpostgame["rank"])
	{
		return 0;
	}

	var_02 = self.connectedpostgame["rank"];
	self.connectedpostgame["rank"] = var_01;
	self setrank(var_01);
	return 1;
}

//Function Number: 18
lib_A7AA::updaterankannouncehud()
{
	self endon("disconnect");
	self notify("update_rank");
	self endon("update_rank");
	var_00 = self.connectedpostgame["team"];
	if(!isdefined(var_00))
	{
		return;
	}

	if(!maps\mp\_utility::levelflag("game_over"))
	{
		level common_scripts\utility::waittill_notify_or_timeout("game_over",0.25);
	}

	var_01 = lib_A7AA::getrankinfofull(self.connectedpostgame["rank"]);
	var_02 = level.ranktable[self.connectedpostgame["rank"]][1];
	var_03 = int(var_02[var_02.size - 1]);
	thread maps\mp\gametypes\_hud_message::rankupsplashnotify("ranked_up",self.connectedpostgame["rank"],self.connectedpostgame["prestige"]);
	if(var_03 > 1)
	{
		return;
	}

	for(var_04 = 0;var_04 < level.var_328.size;var_04++)
	{
		var_05 = level.var_328[var_04];
		var_06 = var_05.connectedpostgame["team"];
		if(isdefined(var_06) && var_05 != self)
		{
			if(var_06 == var_00)
			{
				var_05 iprintln(&"RANK_PLAYER_WAS_PROMOTED",self,var_01);
			}
		}
	}
}

//Function Number: 19
lib_A7AA::xppointspopup(param_00,param_01)
{
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	if(param_01 == 0)
	{
		return;
	}

	self notify("xpPointsPopup");
	self endon("xpPointsPopup");
	self.var_A3A2 = self.var_A3A2 + param_01;
	self setclientomnvar("ui_points_popup",self.var_A3A2);
	var_02 = tablelookuprownum("mp/xp_event_table.csv",0,param_00);
	if(!isdefined(var_02) || isdefined(var_02) && var_02 == -1)
	{
	}
	else
	{
		self setclientomnvar("ui_points_popup_event",var_02);
	}

	wait(1);
	self.var_A3A2 = 0;
}

//Function Number: 20
lib_A7AA::getrank()
{
	var_00 = lib_A7AA::gettotalxp();
	var_01 = self.connectedpostgame["rank"];
	if(var_00 < lib_A7AA::getrankinfominxp(var_01) + lib_A7AA::getrankinfoxpamt(var_01))
	{
		return var_01;
	}

	return lib_A7AA::getrankforxp(var_00);
}

//Function Number: 21
lib_A7AA::getrankforxp(param_00)
{
	var_01 = 0;
	for(var_02 = level.ranktable[var_01][1];isdefined(var_02) && var_02 != "";var_02 = undefined)
	{
		if(param_00 < lib_A7AA::getrankinfominxp(var_01) + lib_A7AA::getrankinfoxpamt(var_01))
		{
			return var_01;
		}

		var_01++;
		if(isdefined(level.ranktable[var_01]))
		{
			var_02 = level.ranktable[var_01][1];
			continue;
		}
	}

	var_01--;
	return var_01;
}

//Function Number: 22
lib_A7AA::getprestigelevel()
{
	if(isai(self) && isdefined(self.connectedpostgame["prestige_fake"]))
	{
		return self.connectedpostgame["prestige_fake"];
	}

	return maps\mp\gametypes\_persistance::func_8D62("prestige");
}

//Function Number: 23
lib_A7AA::getrankxp()
{
	if(isdefined(self.connectedpostgame["rankxp"]))
	{
		return self.connectedpostgame["rankxp"];
	}

	return 0;
}

//Function Number: 24
lib_A7AA::getredeemedxp()
{
	if(isdefined(self.connectedpostgame["redeemedxp"]))
	{
		return self.connectedpostgame["redeemedxp"];
	}

	return 0;
}

//Function Number: 25
lib_A7AA::gettotalxp()
{
	return lib_A7AA::getrankxp() + lib_A7AA::getredeemedxp();
}

//Function Number: 26
lib_A7AA::incrankxp(param_00)
{
	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	var_01 = lib_A7AA::getrankxp();
	var_02 = self.connectedpostgame["prestige"];
	var_03 = lib_A7AA::getrankinfomaxxp(level.maxrank) - lib_A7AA::getredeemedxp();
	var_04 = int(min(var_01,var_03)) + param_00;
	if(var_04 > var_03)
	{
		var_04 = var_03;
	}

	self.connectedpostgame["rankxp"] = var_04;
	processprestigemastery(var_02,var_04);
}

//Function Number: 27
processprestigemastery(param_00,param_01)
{
	var_02 = lib_A7AA::getrankinfomaxxp(level.maxrank) - lib_A7AA::getredeemedxp();
	if(param_00 == level.masterprestige && param_01 >= var_02 && !isdefined(self.connectedpostgame["prestigeMaster"]))
	{
		self.connectedpostgame["prestigeMaster"] = self method_854B();
		if(isdefined(self.connectedpostgame["prestigeMaster"]))
		{
			thread maps\mp\gametypes\_hud_message::splashnotifyurgent("prestigeMaster");
		}
	}

	if(param_00 == level.grandmasterprestige && param_01 >= var_02 && !isdefined(self.connectedpostgame["prestigeGrandMaster"]))
	{
		self.connectedpostgame["prestigeGrandMaster"] = self method_854B();
		if(isdefined(self.connectedpostgame["prestigeGrandMaster"]))
		{
			thread maps\mp\gametypes\_hud_message::splashnotifyurgent("prestigeGrandMaster");
		}
	}
}

//Function Number: 28
lib_A7AA::syncxpstat()
{
	var_00 = lib_A7AA::getrankxp();
	maps\mp\gametypes\_persistance::func_8D72("experience",var_00);
}