/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42789.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 19
 * Decompile Time: 7 ms
 * Timestamp: 4/20/2022 8:24:06 PM
*******************************************************************/

//Function Number: 1
lib_A725::init()
{
	lib_A725::initawards();
	level thread lib_A725::onplayerconnect();
}

//Function Number: 2
lib_A725::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		if(!isdefined(var_00.connectedpostgame["stats"]))
		{
			var_00.connectedpostgame["stats"] = [];
		}

		var_00.stats = var_00.connectedpostgame["stats"];
		if(!var_00.stats.size)
		{
			foreach(var_03, var_02 in level.awards)
			{
				var_00 maps\mp\_utility::initplayerstat(var_03,level.awards[var_03].defaultvalue);
			}
		}
	}
}

//Function Number: 3
lib_A725::initawards()
{
	lib_A725::initstataward("headshots",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("multikill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("avengekills",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("comebacks",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("rescues",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("longshots",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("revengekills",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("bulletpenkills",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("throwback_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("firstblood",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("posthumous",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("assistedsuicide",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("buzzkill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("oneshotkill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("air_to_air_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("air_to_ground_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("ground_to_air_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("doublekill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("triplekill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("fourkill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("fivekill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("sixkill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("sevenkill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("eightkill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("hijacker",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("backstab",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("5killstreak",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("10killstreak",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("15killstreak",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("20killstreak",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("25killstreak",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("30killstreak",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("30pluskillstreak",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("pointblank",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("firstplacekill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("boostslamkill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("assault",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("defends",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("exo_knife_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("exo_knife_recall_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("near_death_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("slide_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("flash_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("riot_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("melee_air_to_air",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("assist_riot_shield",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("semtex_stick",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("stuck_with_explosive",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("crossbow_stick",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("multiKillOneBullet",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("think_fast",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("take_and_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("four_play",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("sharepackage",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("map_killstreak",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("killstreak_tag",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("killstreak_join",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("kills",0,0,::lib_A725::highestwins);
	lib_A725::initstataward("longestkillstreak",0,0,::lib_A725::highestwins);
	lib_A725::initstataward("knifekills",0,0,::lib_A725::highestwins);
	lib_A725::initstataward("kdratio",0,0,::lib_A725::highestwins);
	lib_A725::initstataward("deaths",0,0,::lib_A725::lowestwithhalfplayedtime);
	lib_A725::initstataward("assists",0,0,::lib_A725::highestwins);
	lib_A725::initstataward("totalGameScore",0,0,::lib_A725::highestwins);
	lib_A725::initstataward("scorePerMinute",0,0,::lib_A725::highestwins);
	lib_A725::initstataward("mostScorePerLife",0,0,::lib_A725::highestwins);
	lib_A725::initstataward("killStreaksUsed",0,0,::lib_A725::highestwins);
	lib_A725::initstataward("humiliation",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("regicide",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("gunslinger",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("dejavu",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("levelup",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("omegaman",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("plague",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("patientzero",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("careless",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("survivor",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("contagious",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("flagscaptured",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("flagsreturned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("flagcarrierkills",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("flagscarried",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("killsasflagcarrier",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("pointscaptured",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("kill_while_capture",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("opening_move",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("hp_secure",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("targetsdestroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("bombsplanted",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("bombsdefused",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("ninja_defuse",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("last_man_defuse",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("elimination",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("last_man_standing",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("sr_tag_elimination",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("sr_tag_revive",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("killsconfirmed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("killsdenied",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("kill_denied_retrieved",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("tag_collector",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("touchdown",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("fieldgoal",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("interception",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("kill_with_ball",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("ball_score_assist",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("pass_kill_pickup",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("killedBallCarrier",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("uav_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("warbird_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("paladin_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("vulcan_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("goliath_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("missile_strike_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("sentry_gun_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("strafing_run_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("assault_drone_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("recon_drone_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("map_killstreak_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("assist_killstreak_destroyed",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("warbird_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("paladin_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("vulcan_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("goliath_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("airdrop_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("airdrop_trap_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("missile_strike_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("sentry_gun_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("strafing_run_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("assault_drone_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("map_killstreak_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("coop_killstreak_kill",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("uav_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("warbird_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("orbitalsupport_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("orbital_strike_laser_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("orbital_carepackage_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("heavy_exosuit_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("missile_strike_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("remote_mg_sentry_turret_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("strafing_run_airstrike_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("assault_ugv_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("recon_ugv_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("emp_earned",0,1,::highesetwinsupdateplayerdata);
	lib_A725::initstataward("numMatchesRecorded",0,0,::lib_A725::highestwins);
}

//Function Number: 4
lib_A725::initstataward(param_00,param_01,param_02,param_03,param_04,param_05)
{
	level.awards[param_00] = spawnstruct();
	level.awards[param_00].defaultvalue = param_01;
	if(isdefined(param_03))
	{
		level.awards[param_00].var_6FDA = param_03;
	}

	if(isdefined(param_02))
	{
		level.awards[param_00].saveonupdate = param_02;
	}

	if(isdefined(param_04))
	{
		level.awards[param_00].var_9C55 = param_04;
	}

	if(isdefined(param_05))
	{
		level.awards[param_00].var_9C56 = param_05;
	}
}

//Function Number: 5
lib_A725::setpersonalbestifgreater(param_00)
{
	var_01 = self getcommonplayerdata("bests",param_00);
	var_02 = maps\mp\_utility::getplayerstat(param_00);
	var_02 = lib_A725::getformattedvalue(param_00,var_02);
	if(var_01 == 0 || var_02 > var_01)
	{
		self setcommonplayerdata("bests",param_00,var_02);
	}
}

//Function Number: 6
lib_A725::setpersonalbestiflower(param_00)
{
	var_01 = self getcommonplayerdata("bests",param_00);
	var_02 = maps\mp\_utility::getplayerstat(param_00);
	var_02 = lib_A725::getformattedvalue(param_00,var_02);
	if(var_01 == 0 || var_02 < var_01)
	{
		self setcommonplayerdata("bests",param_00,var_02);
	}
}

//Function Number: 7
lib_A725::calculatekd(param_00)
{
	var_01 = param_00 maps\mp\_utility::getplayerstat("kills");
	var_02 = param_00 maps\mp\_utility::getplayerstat("deaths");
	if(var_02 == 0)
	{
		var_02 = 1;
	}

	param_00 maps\mp\_utility::setplayerstat("kdratio",var_01 / var_02);
}

//Function Number: 8
lib_A725::gettotalscore(param_00)
{
	var_01 = param_00.score;
	if(!level.teambased)
	{
		var_01 = param_00.extrascore0;
	}

	return var_01;
}

//Function Number: 9
lib_A725::calculatespm(param_00)
{
	if(param_00.timeplayed["total"] < 1)
	{
		return;
	}

	var_01 = lib_A725::gettotalscore(param_00);
	var_02 = param_00.timeplayed["total"];
	var_03 = var_01 / var_02 / 60;
	param_00 maps\mp\_utility::setplayerstat("totalGameScore",var_01);
	param_00 maps\mp\_utility::setplayerstat("scorePerMinute",var_03);
}

//Function Number: 10
lib_A725::assignawards()
{
	foreach(var_01 in level.var_328)
	{
		if(!var_01 maps\mp\_utility::rankingenabled())
		{
			return;
		}

		var_01 maps\mp\_utility::incplayerstat("numMatchesRecorded",1);
		lib_A725::calculatekd(var_01);
		lib_A725::calculatespm(var_01);
	}

	foreach(var_08, var_04 in level.awards)
	{
		if(!isdefined(level.awards[var_08].var_6FDA) || isdefined(level.awards[var_08].saveonupdate) && level.awards[var_08].saveonupdate)
		{
			continue;
		}

		var_05 = level.awards[var_08].var_6FDA;
		var_06 = level.awards[var_08].var_9C55;
		var_07 = level.awards[var_08].var_9C56;
		if(isdefined(var_06) && isdefined(var_07))
		{
			[[ var_05 ]](var_08,var_06,var_07);
			continue;
		}

		if(isdefined(var_06))
		{
			[[ var_05 ]](var_08,var_06);
			continue;
		}

		[[ var_05 ]](var_08);
	}
}

//Function Number: 11
lib_A725::giveaward(param_00,param_01)
{
	param_01 = lib_A725::getformattedvalue(param_00,param_01);
	var_02 = self getcommonplayerdata("round","awards",param_00);
	self setcommonplayerdata("round","awards",param_00,var_02 + param_01);
	if(maps\mp\_utility::practiceroundgame())
	{
		return;
	}

	if(lib_A725::shouldaveragetotal(param_00))
	{
		var_03 = self getcommonplayerdata("awards","numMatchesRecorded");
		var_04 = self getcommonplayerdata("awards",param_00);
		var_05 = var_04 * var_03;
		var_06 = int(var_05 + param_01 / var_03 + 1);
		self setcommonplayerdata("awards",param_00,var_06);
		return;
	}

	var_02 = self getcommonplayerdata("awards",param_00);
	self setcommonplayerdata("awards",param_00,var_02 + param_01);
}

//Function Number: 12
lib_A725::shouldaveragetotal(param_00)
{
	switch(param_00)
	{
		case "scorePerMinute":
		case "kdratio":
			break;
	}
}

//Function Number: 13
lib_A725::getformattedvalue(param_00,param_01)
{
	var_02 = tablelookup("mp/awardTable.csv",1,param_00,5);
	switch(var_02)
	{
		case "float":
			break;

		case "multi":
		case "ratio":
		case "time":
		case "count":
		case "distance":
		case "none":
		default:
			break;
	}
}

//Function Number: 14
highesetwinsupdateplayerdata(param_00,param_01)
{
	if(maps\mp\_utility::rankingenabled())
	{
		lib_A725::giveaward(param_00,param_01);
		lib_A725::setpersonalbestifgreater(param_00);
	}
}

//Function Number: 15
lowestwinsupdateplayerdata(param_00,param_01)
{
	if(maps\mp\_utility::rankingenabled())
	{
		lib_A725::giveaward(param_00,param_01);
		lib_A725::setpersonalbestiflower(param_00);
	}
}

//Function Number: 16
lib_A725::highestwins(param_00,param_01)
{
	foreach(var_03 in level.var_328)
	{
		if(var_03 maps\mp\_utility::rankingenabled() && var_03 lib_A725::statvaluechanged(param_00) && !isdefined(param_01) || var_03 maps\mp\_utility::getplayerstat(param_00) >= param_01)
		{
			var_04 = var_03 maps\mp\_utility::getplayerstat(param_00);
			var_03 highesetwinsupdateplayerdata(param_00,var_04);
		}
	}
}

//Function Number: 17
lib_A725::lowestwins(param_00,param_01)
{
	foreach(var_03 in level.var_328)
	{
		if(var_03 maps\mp\_utility::rankingenabled() && var_03 lib_A725::statvaluechanged(param_00) && !isdefined(param_01) || var_03 maps\mp\_utility::getplayerstat(param_00) <= param_01)
		{
			var_04 = var_03 maps\mp\_utility::getplayerstat(param_00);
			var_03 lowestwinsupdateplayerdata(param_00,var_04);
		}
	}
}

//Function Number: 18
lib_A725::lowestwithhalfplayedtime(param_00)
{
	var_01 = maps\mp\_utility::gettimepassed() / 1000;
	var_02 = var_01 * 0.5;
	foreach(var_04 in level.var_328)
	{
		if(var_04.afk && var_04.timeplayed["total"] >= var_02)
		{
			var_05 = var_04 maps\mp\_utility::getplayerstat(param_00);
			var_04 lowestwinsupdateplayerdata(param_00,var_05);
		}
	}
}

//Function Number: 19
lib_A725::statvaluechanged(param_00)
{
	var_01 = maps\mp\_utility::getplayerstat(param_00);
	var_02 = level.awards[param_00].defaultvalue;
	if(var_01 == var_02)
	{
		return 0;
	}

	return 1;
}