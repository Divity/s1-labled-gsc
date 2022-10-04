/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42912.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 94
 * Decompile Time: 57 ms
 * Timestamp: 4/20/2022 8:18:27 PM
*******************************************************************/

//Function Number: 1
lib_A7A0::init()
{
	precachestring(&"MP_CHALLENGE_COMPLETED");
	if(!lib_A7A0::mayprocesschallenges())
	{
		return;
	}

	level.missioncallbacks = [];
	lib_A7A0::registermissioncallback("playerKilled",::lib_A7A0::ch_kills);
	lib_A7A0::registermissioncallback("playerKilled",::lib_A7A0::ch_vehicle_kills);
	lib_A7A0::registermissioncallback("playerHardpoint",::lib_A7A0::ch_hardpoints);
	lib_A7A0::registermissioncallback("playerAssist",::lib_A7A0::ch_assists);
	lib_A7A0::registermissioncallback("roundEnd",::lib_A7A0::ch_roundwin);
	lib_A7A0::registermissioncallback("roundEnd",::lib_A7A0::ch_roundplayed);
	lib_A7A0::registermissioncallback("vehicleKilled",::lib_A7A0::ch_vehicle_killed);
	level thread lib_A7A0::onplayerconnect();
}

//Function Number: 2
lib_A7A0::mayprocesschallenges()
{
	if(maps\mp\_utility::practiceroundgame())
	{
		return 0;
	}

	return level.rankedmatch;
}

//Function Number: 3
lib_A7A0::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		if(isbot(var_00))
		{
			continue;
		}

		if(!isdefined(var_00.connectedpostgame["postGameChallenges"]))
		{
			var_00.connectedpostgame["postGameChallenges"] = 0;
		}

		var_00 thread lib_A7A0::onplayerspawned();
		var_00 thread lib_A7A0::initmissiondata();
		var_00 thread lib_A7A0::monitorbombuse();
		var_00 thread lib_A7A0::monitorstreaks();
		var_00 thread lib_A7A0::monitorstreakreward();
		var_00 thread lib_A7A0::monitorscavengerpickup();
		var_00 thread lib_A7A0::monitorblastshieldsurvival();
		var_00 thread lib_A7A0::monitorprocesschallenge();
		var_00 thread lib_A7A0::monitorkillstreakprogress();
		var_00 thread lib_A7A0::monitorfinalstandsurvival();
		var_00 thread lib_A7A0::monitoradstime();
		var_00 thread lib_A7A0::monitorpronetime();
		var_00 thread monitorpowerslidetime();
		var_00 thread lib_A7A0::monitorweaponswap();
		var_00 thread lib_A7A0::monitorflashbang();
		var_00 thread lib_A7A0::monitorconcussion();
		var_00 thread lib_A7A0::monitorminetriggering();
		var_00 thread lib_A7A0::monitorboostjumpdistance();
		var_00 thread lib_A7A0::monitorplayermatchchallenges();
		var_00 notifyonplayercommand("hold_breath","+breath_sprint");
		var_00 notifyonplayercommand("hold_breath","+melee_breath");
		var_00 notifyonplayercommand("release_breath","-breath_sprint");
		var_00 notifyonplayercommand("release_breath","-melee_breath");
		var_00 thread lib_A7A0::monitorholdbreath();
		var_00 notifyonplayercommand("jumped","+goStand");
		var_00 thread lib_A7A0::monitormantle();
	}
}

//Function Number: 4
lib_A7A0::onplayerspawned()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		thread lib_A7A0::onplayerdeath();
		thread lib_A7A0::monitorsprintdistance();
	}
}

//Function Number: 5
lib_A7A0::onplayerdeath()
{
	self endon("disconnect");
	self waittill("death");
	if(isdefined(self.hasscavengedammothislife))
	{
		self.hasscavengedammothislife = 0;
	}
}

//Function Number: 6
lib_A7A0::monitorscavengerpickup()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("scavenger_pickup");
		if(self isitemunlocked("specialty_scavenger") && maps\mp\_utility::_hasperk("specialty_scavenger") && !maps\mp\_utility::isjuggernaut())
		{
			lib_A7A0::processchallenge("ch_scavenger_pro");
			self.hasscavengedammothislife = 1;
		}

		wait(0.05);
	}
}

//Function Number: 7
lib_A7A0::monitorstreakreward()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("received_earned_killstreak");
		if(self isitemunlocked("specialty_hardline") && maps\mp\_utility::_hasperk("specialty_hardline"))
		{
			lib_A7A0::processchallenge("ch_hardline_pro");
		}

		wait(0.05);
	}
}

//Function Number: 8
lib_A7A0::monitorblastshieldsurvival()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("survived_explosion",var_00);
		if(isdefined(var_00) && isplayer(var_00) && self == var_00)
		{
			continue;
		}

		if(self isitemunlocked("_specialty_blastshield") && maps\mp\_utility::_hasperk("_specialty_blastshield"))
		{
			lib_A7A0::processchallenge("ch_blastshield_pro");
		}

		wait 0.05;
	}
}

//Function Number: 9
lib_A7A0::monitorfinalstandsurvival()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("revive");
		lib_A7A0::processchallenge("ch_livingdead");
		wait 0.05;
	}
}

//Function Number: 10
lib_A7A0::initmissiondata()
{
	var_00 = getarraykeys(level.killstreakfuncs);
	foreach(var_02 in var_00)
	{
		self.connectedpostgame[var_02] = 0;
	}

	self.connectedpostgame["lastBulletKillTime"] = 0;
	self.connectedpostgame["bulletStreak"] = 0;
	self.explosiveinfo = [];
}

//Function Number: 11
lib_A7A0::registermissioncallback(param_00,param_01)
{
	if(!isdefined(level.missioncallbacks[param_00]))
	{
		level.missioncallbacks[param_00] = [];
	}

	level.missioncallbacks[param_00][level.missioncallbacks[param_00].size] = param_01;
}

//Function Number: 12
lib_A7A0::getchallengestatus(param_00)
{
	if(isdefined(self.challengedata[param_00]))
	{
		return self.challengedata[param_00];
	}

	return 0;
}

//Function Number: 13
lib_A7A0::ch_assists(param_00)
{
	var_01 = param_00.var_31D;
	var_01 lib_A7A0::processchallenge("ch_assists");
}

//Function Number: 14
lib_A7A0::ch_streak_kill(param_00)
{
	switch(param_00)
	{
		case "vulcan_kill":
			break;

		case "warbird_kill":
			break;

		case "paladin_kill":
			break;

		case "missile_strike_kill":
			break;

		case "sentry_gun_kill":
			break;

		case "strafing_run_kill":
			break;

		case "assault_drone_kill":
			break;

		case "goliath_kill":
			break;

		default:
			break;
	}
}

//Function Number: 15
lib_A7A0::ch_hardpoints(param_00)
{
	if(isbot(param_00.var_31D))
	{
		return;
	}

	var_01 = param_00.var_31D;
	var_01.connectedpostgame[param_00.hardpointtype]++;
	switch(param_00.hardpointtype)
	{
		case "uav":
			break;

		case "airdrop_assault":
			break;

		case "airdrop_sentry_minigun":
			break;

		case "nuke":
			break;
	}
}

//Function Number: 16
lib_A7A0::ch_vehicle_kills(param_00)
{
	if(!isdefined(param_00.attacker) || !isplayer(param_00.attacker))
	{
		return;
	}

	if(!maps\mp\_utility::iskillstreakweapon(param_00.sweapon))
	{
		return;
	}

	var_01 = param_00.attacker;
	if(!isdefined(var_01.connectedpostgame[param_00.sweapon + "_streak"]) || isdefined(var_01.connectedpostgame[param_00.sweapon + "_streakTime"]) && gettime() - var_01.connectedpostgame[param_00.sweapon + "_streakTime"] > 7000)
	{
		var_01.connectedpostgame[param_00.sweapon + "_streak"] = 0;
		var_01.connectedpostgame[param_00.sweapon + "_streakTime"] = gettime();
	}

	var_01.connectedpostgame[param_00.sweapon + "_streak"]++;
	switch(param_00.sweapon)
	{
		case "artillery_mp":
			break;

		case "stealth_bomb_mp":
			break;

		case "sentry_minigun_mp":
			break;

		case "ac130_40mm_mp":
		case "ac130_105mm_mp":
		case "ac130_25mm_mp":
			break;

		case "remotemissile_projectile_mp":
			break;

		case "nuke_mp":
			break;

		default:
			break;
	}
}

//Function Number: 17
lib_A7A0::ch_vehicle_killed(param_00)
{
	if(!isdefined(param_00.attacker) || !isplayer(param_00.attacker))
	{
		return;
	}

	var_01 = param_00.attacker;
	var_02 = maps\mp\_utility::getbaseweaponname(param_00.sweapon,1);
	if(maps\mp\_utility::islootweapon(var_02))
	{
		var_02 = maps\mp\gametypes\_class::getbasefromlootversion(var_02);
	}

	var_03 = lib_A7A0::get_challenge_weapon_class(param_00.sweapon,var_02);
	if(var_03 == "weapon_launcher")
	{
		var_01 lib_A7A0::processchallenge("ch_launcher_kill");
		if(isdefined(level.challengeinfo["ch_vehicle_" + var_02]))
		{
			var_01 lib_A7A0::processchallenge("ch_vehicle_" + var_02);
		}

		if(isdefined(level.challengeinfo["ch_marksman_" + var_02]))
		{
			var_01 lib_A7A0::processchallenge("ch_marksman_" + var_02);
		}
	}

	if(var_01 maps\mp\_utility::_hasperk("specialty_coldblooded") && var_01 maps\mp\_utility::_hasperk("specialty_spygame") && var_01 maps\mp\_utility::_hasperk("specialty_heartbreaker"))
	{
		if(!isdefined(param_00.vehicle) || !isdefined(param_00.vehicle.sentrytype) || param_00.vehicle.sentrytype != "prison_turret")
		{
			var_01 lib_A7A0::processchallenge("ch_precision_airhunt");
		}
	}

	if(isdefined(param_00.vehicle) && isdefined(param_00.vehicle.vehicletype) && param_00.vehicle.vehicletype == "drone_recon" && issubstr(var_02,"exoknife"))
	{
		var_01 lib_A7A0::processchallenge("ch_precision_knife");
	}

	if(var_01 maps\mp\_utility::_hasperk("specialty_class_blindeye") && !isdefined(param_00.vehicle.vehicleinfo) || param_00.vehicle.vehicleinfo != "vehicle_tracking_drone_mp")
	{
		var_01 lib_A7A0::processchallenge("ch_perk_blindeye");
	}
}

//Function Number: 18
lib_A7A0::clearidshortly(param_00)
{
	self endon("disconnect");
	self notify("clearing_expID_" + param_00);
	self endon("clearing_expID_" + param_00);
	wait(3);
	self.var_357D[param_00] = undefined;
}

//Function Number: 19
lib_A7A0::mgkill()
{
	var_00 = self;
	if(!isdefined(var_00.connectedpostgame["MGStreak"]))
	{
		var_00.connectedpostgame["MGStreak"] = 0;
		var_00 thread lib_A7A0::endmgstreakwhenleavemg();
		if(!isdefined(var_00.connectedpostgame["MGStreak"]))
		{
			return;
		}
	}

	var_00.connectedpostgame["MGStreak"]++;
	if(var_00.connectedpostgame["MGStreak"] >= 5)
	{
		var_00 lib_A7A0::processchallenge("ch_mgmaster");
	}
}

//Function Number: 20
lib_A7A0::endmgstreakwhenleavemg()
{
	self endon("disconnect");
	for(;;)
	{
		if(!isalive(self) || self usebuttonpressed())
		{
			self.connectedpostgame["MGStreak"] = undefined;
			break;
		}

		wait(0.05);
	}
}

//Function Number: 21
lib_A7A0::endmgstreak()
{
	self.connectedpostgame["MGStreak"] = undefined;
}

//Function Number: 22
lib_A7A0::killedbestenemyplayer(param_00)
{
	if(!isdefined(self.connectedpostgame["countermvp_streak"]) || !param_00)
	{
		self.connectedpostgame["countermvp_streak"] = 0;
	}

	self.connectedpostgame["countermvp_streak"]++;
	if(self.connectedpostgame["countermvp_streak"] == 3)
	{
		lib_A7A0::processchallenge("ch_thebiggertheyare");
	}
	else if(self.connectedpostgame["countermvp_streak"] == 5)
	{
		lib_A7A0::processchallenge("ch_thehardertheyfall");
	}

	if(self.connectedpostgame["countermvp_streak"] >= 10)
	{
		lib_A7A0::processchallenge("ch_countermvp");
	}
}

//Function Number: 23
lib_A7A0::ishighestscoringplayer(param_00)
{
	if(!isdefined(param_00.score) || param_00.score < 1)
	{
		return 0;
	}

	var_01 = level.var_328;
	if(level.teambased)
	{
		var_02 = param_00.connectedpostgame["team"];
	}
	else
	{
		var_02 = "all";
	}

	var_03 = param_00.score;
	for(var_04 = 0;var_04 < var_01.size;var_04++)
	{
		if(!isdefined(var_01[var_04].score))
		{
			continue;
		}

		if(var_01[var_04].score < 1)
		{
			continue;
		}

		if(var_02 != "all" && var_01[var_04].connectedpostgame["team"] != var_02)
		{
			continue;
		}

		if(var_01[var_04].score > var_03)
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 24
processchallengedaily(param_00,param_01,param_02)
{
	if(!maps\mp\_utility::rankingenabled() || maps\mp\_utility::privatematch())
	{
		return;
	}

	if(getdvarint("dailychallenge_killswitch",0) == 0 && getdvarint("dailychallenge_killswitch2",0) == 0)
	{
		return;
	}

	var_03 = self getplayerdata("dailyChallengeId",0);
	var_04 = getdvarint("scr_current_playlist",0);
	var_05 = getdvarint("scr_game_division",0);
	var_06 = 0;
	var_06 = var_04 == 1 || var_04 == 2 || var_04 == 3 || var_04 == 4;
	var_07 = 0;
	var_07 = var_04 == 3;
	if(!isdefined(var_03) || !isdefined(param_00) || var_03 != param_00)
	{
		return;
	}

	switch(var_03)
	{
		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		case 5:
			break;

		case 6:
			break;

		case 7:
			break;

		case 8:
			break;

		case 9:
			break;

		case 10:
			break;

		case 11:
			break;

		case 12:
			break;

		case 13:
			break;

		case 14:
			break;

		case 15:
			break;

		case 16:
			break;

		case 17:
			break;

		case 18:
			break;

		case 19:
			break;

		case 20:
			break;

		case 21:
			break;

		case 22:
			break;

		case 23:
			break;

		case 24:
			break;

		case 25:
			break;

		case 26:
			break;

		case 27:
			break;

		case 28:
			break;

		case 29:
			break;

		case 30:
			break;

		case 31:
			break;

		case 32:
			break;

		case 33:
			break;

		case 34:
			break;

		case 35:
			break;

		case 36:
			break;

		case 37:
			break;

		case 38:
			break;

		case 39:
			break;

		case 40:
			break;

		case 41:
			break;

		case 42:
			break;

		case 43:
			break;

		case 44:
			break;

		case 45:
			break;

		default:
			break;
	}
}

//Function Number: 25
lib_A7A0::ch_kills(param_00)
{
	param_00.victim lib_A7A0::playerdied();
	if(!isdefined(param_00.attacker) || !isplayer(param_00.attacker))
	{
		return;
	}
	else
	{
		var_01 = param_00.attacker;
	}

	if(isbot(var_01))
	{
		return;
	}

	var_02 = 0;
	var_03 = 0;
	var_04 = 1;
	var_05[param_00.victim.name] = param_00.victim.name;
	var_06[param_00.sweapon] = param_00.sweapon;
	var_07 = 1;
	var_08 = [];
	var_09 = param_00.smeansofdeath;
	var_0A = param_00.time;
	var_0B = getweaponattachments(param_00.sweapon);
	var_0C = 0;
	if(isdefined(var_01.pickedupweaponfrom[param_00.sweapon]) && !maps\mp\_utility::ismeleemod(var_09))
	{
		var_0C++;
	}

	var_0D = maps\mp\_utility::iskillstreakweapon(param_00.sweapon);
	var_0E = maps\mp\_utility::isenvironmentweapon(param_00.sweapon);
	var_0F = 0;
	if(var_09 == "MOD_HEAD_SHOT")
	{
		var_0F = 1;
	}

	var_10 = 0;
	var_11 = 0;
	if(isdefined(param_00.modifiers["longshot"]))
	{
		var_10 = 1;
		var_11++;
	}

	var_12 = param_00.was_ads;
	var_13 = 0;
	if(var_01.recentkillcount == 2)
	{
		var_13 = 1;
	}

	var_14 = 0;
	if(var_01.recentkillcount == 3)
	{
		var_14 = 1;
	}

	var_15 = "";
	if(isdefined(param_00.attackerstance))
	{
		var_15 = param_00.attackerstance;
	}

	var_16 = 0;
	var_17 = 0;
	var_18 = 0;
	var_19 = 0;
	var_1A = 0;
	var_1B = 0;
	switch(var_01.killsthislife.size + 1)
	{
		case 5:
			break;

		case 10:
			break;

		case 15:
			break;

		case 20:
			break;

		case 25:
			break;

		case 30:
			break;

		default:
			break;
	}
}

//Function Number: 26
lib_A7A0::get_challenge_weapon_class(param_00,param_01)
{
	var_02 = maps\mp\_utility::getweaponclass(param_00);
	if(!isdefined(param_01))
	{
		param_01 = maps\mp\_utility::getbaseweaponname(param_00,1);
		if(maps\mp\_utility::islootweapon(param_01))
		{
			param_01 = maps\mp\gametypes\_class::getbasefromlootversion(param_01);
		}
	}

	if(param_01 == "iw5_exocrossbow" || param_01 == "iw5_exocrossbowblops2")
	{
		return "weapon_special";
	}

	if(param_01 == "iw5_maaws" || param_01 == "iw5_mahem" || param_01 == "iw5_stingerm7")
	{
		return "weapon_launcher";
	}

	return var_02;
}

//Function Number: 27
lib_A7A0::ch_bulletdamagecommon(param_00,param_01,param_02,param_03)
{
	if(!maps\mp\_utility::isenvironmentweapon(param_00.sweapon))
	{
		param_01 lib_A7A0::endmgstreak();
	}

	if(maps\mp\_utility::iskillstreakweapon(param_00.sweapon))
	{
		return;
	}

	if(isbot(param_01))
	{
		return;
	}

	if(param_01.connectedpostgame["lastBulletKillTime"] == param_02)
	{
		param_01.connectedpostgame["bulletStreak"]++;
	}
	else
	{
		param_01.connectedpostgame["bulletStreak"] = 1;
	}

	param_01.connectedpostgame["lastBulletKillTime"] = param_02;
	if(!param_00.victimonground)
	{
		param_01 lib_A7A0::processchallenge("ch_hardlanding");
	}

	if(!param_00.attackeronground)
	{
		param_01.connectedpostgame["midairStreak"]++;
	}

	if(param_01.connectedpostgame["midairStreak"] == 2)
	{
		param_01 lib_A7A0::processchallenge("ch_airborne");
	}

	if(param_02 < param_00.victim.flashendtime)
	{
		param_01 lib_A7A0::processchallenge("ch_flashbangvet");
	}

	if(param_02 < param_01.flashendtime)
	{
		param_01 lib_A7A0::processchallenge("ch_blindfire");
	}

	if(param_02 < param_00.victim.concussionendtime)
	{
		param_01 lib_A7A0::processchallenge("ch_concussionvet");
	}

	if(param_02 < param_01.concussionendtime)
	{
		param_01 lib_A7A0::processchallenge("ch_slowbutsure");
	}

	if(param_01.connectedpostgame["bulletStreak"] == 2)
	{
		if(isdefined(param_00.modifiers["headshot"]))
		{
			foreach(var_05 in param_01.killsthislife)
			{
				if(var_05.time != param_02)
				{
					continue;
				}

				if(!isdefined(param_00.modifiers["headshot"]))
				{
					continue;
				}

				param_01 lib_A7A0::processchallenge("ch_allpro");
			}
		}

		if(param_03 == "weapon_sniper")
		{
			param_01 lib_A7A0::processchallenge("ch_collateraldamage");
		}
	}

	if(param_03 == "weapon_pistol")
	{
		if(isdefined(param_00.victim.attackerdata) && isdefined(param_00.victim.attackerdata[param_01.assistedsuicide]))
		{
			if(isdefined(param_00.victim.attackerdata[param_01.assistedsuicide].isprimary))
			{
				param_01 lib_A7A0::processchallenge("ch_fastswap");
			}
		}
	}

	if(!isdefined(param_01.infinalstand) || !param_01.infinalstand)
	{
		if(param_00.attackerstance == "crouch")
		{
			param_01 lib_A7A0::processchallenge("ch_crouchshot");
		}
		else if(param_00.attackerstance == "prone")
		{
			param_01 lib_A7A0::processchallenge("ch_proneshot");
			if(param_03 == "weapon_sniper")
			{
				param_01 lib_A7A0::processchallenge("ch_invisible");
			}
		}
	}

	if(param_03 == "weapon_sniper")
	{
		if(isdefined(param_00.modifiers["oneshotkill"]))
		{
			param_01 lib_A7A0::processchallenge("ch_ghillie");
		}
	}

	if(issubstr(param_00.sweapon,"silencer"))
	{
		param_01 lib_A7A0::processchallenge("ch_stealthvet");
	}
}

//Function Number: 28
lib_A7A0::ch_roundplayed(param_00)
{
	var_01 = param_00.var_31D;
	if(var_01.wasaliveatmatchstart)
	{
		var_02 = var_01.connectedpostgame["deaths"];
		var_03 = var_01.connectedpostgame["kills"];
		var_04 = 1000000;
		if(var_02 > 0)
		{
			var_04 = var_03 / var_02;
		}

		if(var_04 >= 5 && var_03 >= 5)
		{
			var_01 lib_A7A0::processchallenge("ch_starplayer");
		}

		if(var_02 == 0 && maps\mp\_utility::gettimepassed() > 300000)
		{
			var_01 lib_A7A0::processchallenge("ch_flawless");
		}

		if(level.placement["all"].size < 3)
		{
			return;
		}

		if(var_01.score > 0)
		{
			switch(level.gametype)
			{
				case "dm":
					break;

				case "war":
					break;

				case "kc":
					break;

				case "dd":
					break;

				case "koth":
					break;

				case "sab":
					break;

				case "sd":
					break;

				case "dom":
					break;

				case "ctf":
					break;

				case "tdef":
					break;

				case "hp":
					break;
			}
		}
	}
}

//Function Number: 29
lib_A7A0::ch_roundwin(param_00)
{
	if(!param_00.winner)
	{
		return;
	}

	var_01 = param_00.var_31D;
	if(var_01.wasaliveatmatchstart)
	{
		switch(level.gametype)
		{
			case "war":
				break;

			case "sab":
				break;

			case "sd":
				break;

			case "hc":
			case "koth":
			case "dom":
			case "ctf":
			case "dm":
			case "hp":
				break;

			default:
				break;
		}
	}
}

//Function Number: 30
lib_A7A0::playerdamaged(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isplayer(self))
	{
		return;
	}

	self endon("disconnect");
	if(isdefined(param_01))
	{
		param_01 endon("disconnect");
	}

	wait(0.05);
	maps\mp\_utility::waittillslowprocessallowed();
	var_06 = spawnstruct();
	var_06.victim = self;
	var_06.einflictor = param_00;
	var_06.attacker = param_01;
	var_06.idamage = param_02;
	var_06.smeansofdeath = param_03;
	var_06.sweapon = param_04;
	var_06.shitloc = param_05;
	var_06.victimonground = var_06.victim isonground();
	if(isplayer(param_01))
	{
		var_06.attackerinlaststand = isdefined(var_06.attacker.laststand);
		var_06.attackeronground = var_06.attacker isonground();
		var_06.attackerstance = var_06.attacker getstance();
	}
	else
	{
		var_06.attackerinlaststand = 0;
		var_06.attackeronground = 0;
		var_06.attackerstance = "stand";
	}

	if(isdefined(self) && isdefined(param_01) && isdefined(self.inliveplayerkillstreak) && isdefined(param_01.inliveplayerkillstreak))
	{
		if(self.inliveplayerkillstreak != param_01.inliveplayerkillstreak && maps\mp\_utility::_hasperk("specialty_class_flakjacket") && isexplosivedamagemod(var_06.smeansofdeath) && maps\mp\_utility::isreallyalive(self) && param_04 != "killstreak_solar_mp")
		{
			lib_A7A0::processchallenge("ch_perk_flakjack");
		}

		if(self.inliveplayerkillstreak != param_01.inliveplayerkillstreak && maps\mp\_utility::_hasperk("specialty_class_toughness"))
		{
			self.lastdamagefromenemytargettime = gettime();
		}
	}

	lib_A7A0::domissioncallback("playerDamaged",var_06);
}

//Function Number: 31
lib_A7A0::playerkilled(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	self.anglesondeath = self getplayerangles();
	if(isdefined(param_01))
	{
		param_01.anglesonkill = param_01 getplayerangles();
	}

	self endon("disconnect");
	var_08 = spawnstruct();
	var_08.victim = self;
	var_08.einflictor = param_00;
	var_08.attacker = param_01;
	var_08.idamage = param_02;
	var_08.smeansofdeath = param_03;
	var_08.sweapon = param_04;
	var_08.sprimaryweapon = param_05;
	var_08.shitloc = param_06;
	var_08.time = gettime();
	var_08.modifiers = param_07;
	var_08.victimonground = var_08.victim isonground();
	if(isplayer(param_01))
	{
		var_08.attackerinlaststand = isdefined(var_08.attacker.laststand);
		var_08.attackeronground = var_08.attacker isonground();
		var_08.attackerstance = var_08.attacker getstance();
	}
	else
	{
		var_08.attackerinlaststand = 0;
		var_08.attackeronground = 0;
		var_08.attackerstance = "stand";
	}

	var_09 = 0;
	if(isdefined(var_08.einflictor) && isdefined(var_08.einflictor.firedads))
	{
		var_09 = var_08.einflictor.firedads;
	}
	else if(isdefined(param_01) && isplayer(param_01))
	{
		var_09 = param_01 playerads();
	}

	var_08.was_ads = 0;
	if(var_09 >= 0.2)
	{
		var_08.was_ads = 1;
	}

	lib_A7A0::waitandprocessplayerkilledcallback(var_08);
	if(isdefined(param_01) && maps\mp\_utility::isreallyalive(param_01))
	{
		param_01.killsthislife[param_01.killsthislife.size] = var_08;
	}

	var_08.attacker notify("playerKilledChallengesProcessed");
}

//Function Number: 32
lib_A7A0::vehiclekilled(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = spawnstruct();
	var_07.vehicle = param_01;
	var_07.victim = param_00;
	var_07.einflictor = param_02;
	var_07.attacker = param_03;
	var_07.idamage = param_04;
	var_07.smeansofdeath = param_05;
	var_07.sweapon = param_06;
	var_07.time = gettime();
	lib_A7A0::domissioncallback("vehicleKilled",var_07);
}

//Function Number: 33
lib_A7A0::waitandprocessplayerkilledcallback(param_00)
{
	if(isdefined(param_00.attacker))
	{
		param_00.attacker endon("disconnect");
	}

	self.processingkilledchallenges = 1;
	wait(0.05);
	maps\mp\_utility::waittillslowprocessallowed();
	lib_A7A0::domissioncallback("playerKilled",param_00);
	self.processingkilledchallenges = undefined;
}

//Function Number: 34
lib_A7A0::playerassist()
{
	var_00 = spawnstruct();
	var_00.var_31D = self;
	lib_A7A0::domissioncallback("playerAssist",var_00);
}

//Function Number: 35
lib_A7A0::usehardpoint(param_00)
{
	self endon("disconnect");
	wait(0.05);
	maps\mp\_utility::waittillslowprocessallowed();
	var_01 = spawnstruct();
	var_01.var_31D = self;
	var_01.hardpointtype = param_00;
	lib_A7A0::domissioncallback("playerHardpoint",var_01);
}

//Function Number: 36
lib_A7A0::roundbegin()
{
	lib_A7A0::domissioncallback("roundBegin");
}

//Function Number: 37
lib_A7A0::roundend(param_00)
{
	var_01 = spawnstruct();
	if(level.teambased)
	{
		var_02 = "allies";
		for(var_03 = 0;var_03 < level.placement[var_02].size;var_03++)
		{
			var_01.var_31D = level.placement[var_02][var_03];
			var_01.winner = var_02 == param_00;
			var_01.place = var_03;
			lib_A7A0::domissioncallback("roundEnd",var_01);
		}

		var_02 = "axis";
		for(var_03 = 0;var_03 < level.placement[var_02].size;var_03++)
		{
			var_01.var_31D = level.placement[var_02][var_03];
			var_01.winner = var_02 == param_00;
			var_01.place = var_03;
			lib_A7A0::domissioncallback("roundEnd",var_01);
		}

		return;
	}

	for(var_03 = 0;var_03 < level.placement["all"].size;var_03++)
	{
		var_01.var_31D = level.placement["all"][var_03];
		var_01.winner = isdefined(param_00) && isplayer(param_00) && var_01.var_31D == param_00;
		var_01.place = var_03;
		lib_A7A0::domissioncallback("roundEnd",var_01);
	}
}

//Function Number: 38
lib_A7A0::domissioncallback(param_00,param_01)
{
	if(!lib_A7A0::mayprocesschallenges())
	{
		return;
	}

	if(getdvarint("disable_challenges") > 0)
	{
		return;
	}

	if(!isdefined(level.missioncallbacks[param_00]))
	{
		return;
	}

	if(isdefined(param_01))
	{
		for(var_02 = 0;var_02 < level.missioncallbacks[param_00].size;var_02++)
		{
			thread [[ level.missioncallbacks[param_00][var_02] ]](param_01);
		}

		return;
	}

	for(var_02 = 0;var_02 < level.missioncallbacks[param_00].size;var_02++)
	{
		thread [[ level.missioncallbacks[param_00][var_02] ]]();
	}
}

//Function Number: 39
lib_A7A0::monitorsprintdistance()
{
	level endon("game_ended");
	self endon("spawned_player");
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		self waittill("sprint_begin");
		self.sprintdistthissprint = 0;
		thread lib_A7A0::monitorsprinttime();
		lib_A7A0::monitorsinglesprintdistance();
		if(self isitemunlocked("specialty_longersprint") && maps\mp\_utility::_hasperk("specialty_longersprint"))
		{
			lib_A7A0::processchallenge("ch_longersprint_pro",int(self.sprintdistthissprint / 12));
		}
	}
}

//Function Number: 40
lib_A7A0::monitorsinglesprintdistance()
{
	level endon("game_ended");
	self endon("spawned_player");
	self endon("death");
	self endon("disconnect");
	self endon("sprint_end");
	var_00 = self.var_2E6;
	for(;;)
	{
		wait(0.1);
		self.sprintdistthissprint = self.sprintdistthissprint + distance(self.var_2E6,var_00);
		var_00 = self.var_2E6;
	}
}

//Function Number: 41
lib_A7A0::monitorsprinttime()
{
	level endon("game_ended");
	self endon("spawned_player");
	self endon("death");
	self endon("disconnect");
	self waittill("sprint_end");
	self.lastsprintendtime = gettime();
}

//Function Number: 42
lib_A7A0::monitorfalldistance()
{
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		if(!isalive(self))
		{
			self waittill("spawned_player");
			continue;
		}

		if(!self isonground())
		{
			var_00 = self.var_2E6[2];
			while(!self isonground() && isalive(self))
			{
				if(self.var_2E6[2] > var_00)
				{
					var_00 = self.var_2E6[2];
				}

				wait(0.05);
			}

			var_01 = var_00 - self.var_2E6[2];
			if(var_01 < 0)
			{
				var_01 = 0;
			}

			if(var_01 / 12 > 15 && isalive(self) && maps\mp\_utility::isemped())
			{
				lib_A7A0::processchallenge("ch_boot_shortcut");
			}

			if(var_01 / 12 > 30 && !isalive(self) && maps\mp\_utility::isemped())
			{
				lib_A7A0::processchallenge("ch_boot_gravity");
			}
		}

		wait(0.05);
	}
}

//Function Number: 43
lib_A7A0::monitorboostjumpdistance()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		if(!isalive(self))
		{
			self waittill("spawned_player");
			continue;
		}

		self waittill("exo_boost");
		if(!self isonground())
		{
			var_00 = self.var_2E6[2];
			var_01 = self.var_2E6[2];
			while(!self isonground() && isalive(self))
			{
				if(self.var_2E6[2] > var_00)
				{
					var_00 = self.var_2E6[2];
				}

				wait(0.05);
			}

			var_02 = var_00 - var_01;
			if(var_02 < 0)
			{
				var_02 = 0;
			}

			lib_A7A0::processchallenge("ch_exomech_frontier",int(ceil(var_02 / 12 / 10)));
		}

		wait(0.05);
	}
}

//Function Number: 44
lib_A7A0::monitorplayermatchchallenges()
{
	thread lib_A7A0::monitormatchchallenges("increment_knife_kill",15,"ch_precision_slice");
	thread lib_A7A0::monitormatchchallenges("increment_stuck_kills",5,"ch_precision_ticktick");
	thread lib_A7A0::monitormatchchallenges("increment_pistol_headshots",10,"ch_precision_pistoleer");
	thread lib_A7A0::monitormatchchallenges("increment_ar_headshots",5,"ch_precision_headhunt");
	thread lib_A7A0::monitormatchchallenges("increment_sharpshooter_kills",10,"ch_precision_sharpshoot");
	thread lib_A7A0::monitormatchchallenges("increment_oneshotgun_kills",10,"ch_precision_cqexpert");
	thread lib_A7A0::monitormatchchallenges("increment_duallethal_kills",5,"ch_precision_dangerclose");
}

//Function Number: 45
lib_A7A0::monitormatchchallenges(param_00,param_01,param_02)
{
	level endon("game_ended");
	self endon("disconnect");
	if(!isdefined(game[param_02]))
	{
		game[param_02] = [];
	}

	if(!isdefined(game[param_02][self.assistedsuicide]))
	{
		game[param_02][self.assistedsuicide] = 0;
	}

	thread lib_A7A0::remove_tracking_on_disconnect(param_02);
	for(;;)
	{
		self waittill(param_00);
		var_03 = game[param_02][self.assistedsuicide];
		var_03++;
		game[param_02][self.assistedsuicide] = var_03;
		if(var_03 == param_01)
		{
			lib_A7A0::processchallenge(param_02);
		}
	}
}

//Function Number: 46
lib_A7A0::remove_tracking_on_disconnect(param_00)
{
	level endon("game_ended");
	self waittill("disconnect");
	if(isdefined(game[param_00][self.assistedsuicide]))
	{
		game[param_00][self.assistedsuicide] = undefined;
	}
}

//Function Number: 47
lib_A7A0::lastmansd()
{
	if(!lib_A7A0::mayprocesschallenges())
	{
		return;
	}

	if(!self.wasaliveatmatchstart)
	{
		return;
	}

	if(self.teamkillsthisround > 0)
	{
		return;
	}

	lib_A7A0::processchallenge("ch_lastmanstanding");
}

//Function Number: 48
lib_A7A0::monitorbombuse()
{
	self endon("disconnect");
	for(;;)
	{
		var_00 = common_scripts\utility::waittill_any_return("bomb_planted","bomb_defused");
		if(!isdefined(var_00))
		{
			continue;
		}

		if(var_00 == "bomb_planted")
		{
			lib_A7A0::processchallenge("ch_saboteur");
			continue;
		}

		if(var_00 == "bomb_defused")
		{
			lib_A7A0::processchallenge("ch_hero");
		}
	}
}

//Function Number: 49
lib_A7A0::monitorlivetime()
{
	for(;;)
	{
		self waittill("spawned_player");
		thread lib_A7A0::survivalistchallenge();
	}
}

//Function Number: 50
lib_A7A0::survivalistchallenge()
{
	self endon("death");
	self endon("disconnect");
	wait(300);
	if(isdefined(self))
	{
		lib_A7A0::processchallenge("ch_survivalist");
	}
}

//Function Number: 51
lib_A7A0::monitorstreaks()
{
	self endon("disconnect");
	self.connectedpostgame["airstrikeStreak"] = 0;
	self.connectedpostgame["meleeKillStreak"] = 0;
	self.connectedpostgame["shieldKillStreak"] = 0;
	thread lib_A7A0::monitormisc();
	for(;;)
	{
		self waittill("death");
		self.connectedpostgame["airstrikeStreak"] = 0;
		self.connectedpostgame["meleeKillStreak"] = 0;
		self.connectedpostgame["shieldKillStreak"] = 0;
	}
}

//Function Number: 52
lib_A7A0::monitormisc()
{
	self endon("disconnect");
	for(;;)
	{
		var_00 = common_scripts\utility::waittill_any_return_no_endon_death("destroyed_explosive","begin_airstrike","destroyed_car","destroyed_car");
		lib_A7A0::monitormisccallback(var_00);
	}
}

//Function Number: 53
lib_A7A0::monitormisccallback(param_00)
{
	switch(param_00)
	{
		case "begin_airstrike":
			break;

		case "destroyed_explosive":
			break;

		case "destroyed_car":
			break;

		case "crushed_enemy":
			break;
	}
}

//Function Number: 54
lib_A7A0::healthregenerated()
{
	if(!isalive(self))
	{
		return;
	}

	if(!lib_A7A0::mayprocesschallenges())
	{
		return;
	}

	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	thread lib_A7A0::resetbrinkofdeathkillstreakshortly();
	if(isdefined(self.lastdamagewasfromenemy) && self.lastdamagewasfromenemy)
	{
		self.healthregenerationstreak++;
		if(self.healthregenerationstreak >= 5)
		{
			lib_A7A0::processchallenge("ch_invincible");
		}
	}
}

//Function Number: 55
lib_A7A0::resetbrinkofdeathkillstreakshortly()
{
	self endon("disconnect");
	self endon("death");
	self endon("damage");
	wait(1);
	self.brinkofdeathkillstreak = 0;
}

//Function Number: 56
lib_A7A0::playerspawned()
{
	self.brinkofdeathkillstreak = 0;
	self.healthregenerationstreak = 0;
}

//Function Number: 57
lib_A7A0::playerdied()
{
	self.brinkofdeathkillstreak = 0;
	self.healthregenerationstreak = 0;
}

//Function Number: 58
lib_A7A0::isatbrinkofdeath()
{
	var_00 = self.health / self.var_275;
	return var_00 <= level.healthoverlaycutoff;
}

//Function Number: 59
lib_A7A0::processchallenge(param_00,param_01,param_02)
{
	if(!lib_A7A0::mayprocesschallenges())
	{
		return;
	}

	if(level.var_328.size < 2 && !getdvarint("force_ranking"))
	{
		var_03 = undefined;
		if(isdefined(var_03))
		{
			if(var_03 == 0)
			{
				return;
			}
		}
		else
		{
			return;
		}
	}

	if(!maps\mp\_utility::rankingenabled())
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	var_04 = lib_A7A0::getchallengestatus(param_00);
	if(var_04 == 0)
	{
		return;
	}

	if(var_04 > level.challengeinfo[param_00]["targetval"].size)
	{
		return;
	}

	var_05 = maps\mp\gametypes\_hud_util::ch_getprogress(param_00);
	if(isdefined(param_02) && param_02)
	{
		var_06 = param_01;
	}
	else if(maps\mp\gametypes\_hud_util::isweaponclasschallenge(param_01))
	{
		var_06 = var_06;
	}
	else
	{
		var_06 = var_06 + param_02;
	}

	var_07 = 0;
	var_08 = level.challengeinfo[param_00]["targetval"][var_04];
	while(isdefined(var_08) && var_06 >= var_08)
	{
		var_07++;
		var_08 = level.challengeinfo[param_00]["targetval"][var_04 + var_07];
	}

	if(var_05 < var_06)
	{
		maps\mp\gametypes\_hud_util::ch_setprogress(param_00,var_06);
	}

	if(var_07 > 0)
	{
		var_09 = var_04;
		while(var_07)
		{
			thread lib_A7A0::giverankxpafterwait(param_00,var_04);
			var_0A = function_02C7(param_00,var_04);
			self method_8443(var_0A);
			var_0B = common_scripts\utility::tostring(var_0A);
			var_0C = int(getsubstr(var_0B,0,var_0B.size - 2));
			if(!isdefined(game["challengeStruct"]["challengesCompleted"][self.assistedsuicide]))
			{
				game["challengeStruct"]["challengesCompleted"][self.assistedsuicide] = [];
			}

			var_0D = 0;
			foreach(var_0F in game["challengeStruct"]["challengesCompleted"][self.assistedsuicide])
			{
				if(var_0F == var_0C)
				{
					var_0D = 1;
				}
			}

			if(!var_0D)
			{
				game["challengeStruct"]["challengesCompleted"][self.assistedsuicide][game["challengeStruct"]["challengesCompleted"][self.assistedsuicide].size] = var_0C;
			}

			if(var_04 >= level.challengeinfo[param_00]["targetval"].size && level.challengeinfo[param_00]["parent_challenge"] != "")
			{
				lib_A7A0::processchallenge(level.challengeinfo[param_00]["parent_challenge"]);
			}

			var_04++;
			var_07--;
			var_11 = function_02D3(var_0A);
			if(var_11 != 0)
			{
				maps\mp\_matchdata::logcompletedchallenge(var_0A);
			}
		}

		if(!issubstr(param_00,"ch_limited_bloodshed"))
		{
			thread maps\mp\gametypes\_hud_message::challengesplashnotify(param_00,var_09,var_04);
		}

		maps\mp\gametypes\_hud_util::ch_setstate(param_00,var_04);
		self.challengedata[param_00] = var_04;
	}
}

//Function Number: 60
lib_A7A0::giverankxpafterwait(param_00,param_01)
{
	self endon("disconnect");
	wait(0.25);
	maps\mp\gametypes\_rank::giverankxp("challenge",level.challengeinfo[param_00]["reward"][param_01],undefined,undefined,param_00);
}

//Function Number: 61
lib_A7A0::getmarksmanunlockattachment(param_00,param_01)
{
	return tablelookup("mp/unlockTable.csv",0,param_00,4 + param_01);
}

//Function Number: 62
lib_A7A0::masterychallengeprocess(param_00)
{
	if(tablelookup("mp/allChallengesTable.csv",0,"ch_" + param_00 + "_mastery",1) == "")
	{
		return;
	}

	var_01 = 0;
	var_02 = maps\mp\_utility::getweaponattachmentfromstats(param_00);
	foreach(var_04 in var_02)
	{
		if(var_04 == "")
		{
			continue;
		}

		if(maps\mp\gametypes\_class::isattachmentunlocked(param_00,var_04))
		{
			var_01++;
		}
	}

	lib_A7A0::processchallenge("ch_" + param_00 + "_mastery",var_01,1);
}

//Function Number: 63
lib_A7A0::ischallengeunlocked(param_00,param_01)
{
	var_02 = tablelookupbyrow("mp/allChallengesTable.csv",param_01,8);
	if(var_02 != "")
	{
		var_03 = lib_A7A0::getchallengestatus(var_02);
		if(var_03 > 1)
		{
			return 1;
		}
	}

	var_04 = tablelookupbyrow("mp/allChallengesTable.csv",param_01,6);
	if(var_04 != "")
	{
		var_05 = maps\mp\gametypes\_rank::getrank();
		if(var_05 < int(var_04))
		{
			return 0;
		}
	}

	var_06 = tablelookupbyrow("mp/allChallengesTable.csv",param_01,7);
	if(var_06 != "")
	{
		var_07 = lib_A7A0::getchallengestatus(var_06);
		if(var_07 <= 1)
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 64
lib_A7A0::updatechallenges()
{
	self.challengedata = [];
	if(!isdefined(self.ch_unique_earned_streaks))
	{
		self.ch_unique_earned_streaks = [];
	}

	if(!isdefined(game["challengeStruct"]))
	{
		game["challengeStruct"] = [];
	}

	if(!isdefined(game["challengeStruct"]["limitedChallengesReset"]))
	{
		game["challengeStruct"]["limitedChallengesReset"] = [];
	}

	if(!isdefined(game["challengeStruct"]["challengesCompleted"]))
	{
		game["challengeStruct"]["challengesCompleted"] = [];
	}

	self endon("disconnect");
	if(!lib_A7A0::mayprocesschallenges())
	{
		return;
	}

	if(!self isitemunlocked("challenges"))
	{
		return;
	}

	var_00 = 0;
	foreach(var_05, var_02 in level.challengeinfo)
	{
		var_00++;
		if(var_00 % 40 == 0)
		{
			wait(0.05);
		}

		self.challengedata[var_05] = 0;
		var_03 = var_02["index"];
		var_04 = maps\mp\gametypes\_hud_util::ch_getstate(var_05);
		if(maps\mp\gametypes\_hud_util::istimelimitedchallenge(var_05) && !isdefined(game["challengeStruct"]["limitedChallengesReset"][self.assistedsuicide]))
		{
			maps\mp\gametypes\_hud_util::ch_setprogress(var_05,0);
			var_04 = 0;
		}

		if(var_04 == 0)
		{
			maps\mp\gametypes\_hud_util::ch_setstate(var_05,1);
			var_04 = 1;
		}

		self.challengedata[var_05] = var_04;
	}

	game["challengeStruct"]["limitedChallengesReset"][self.assistedsuicide] = 1;
}

//Function Number: 65
lib_A7A0::isinunlocktable(param_00)
{
	return tablelookup("mp/unlockTable.csv",0,param_00,0) != "";
}

//Function Number: 66
lib_A7A0::getchallengefilter(param_00)
{
	return tablelookup("mp/allChallengesTable.csv",0,param_00,5);
}

//Function Number: 67
lib_A7A0::getchallengetable(param_00)
{
	return tablelookup("mp/challengeTable.csv",8,param_00,4);
}

//Function Number: 68
lib_A7A0::gettierfromtable(param_00,param_01)
{
	return tablelookup(param_00,0,param_01,1);
}

//Function Number: 69
lib_A7A0::isweaponchallenge(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	var_01 = lib_A7A0::getchallengefilter(param_00);
	if(isdefined(var_01) && var_01 == "riotshield")
	{
		return 1;
	}

	var_02 = maps\mp\_utility::getweaponnametokens(param_00);
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_04 = var_02[var_03];
		if(var_04 == "iw5" || var_04 == "iw6")
		{
			var_04 = var_02[var_03] + "_" + var_02[var_03 + 1];
		}

		if(maps\mp\gametypes\_class::isvalidprimary(var_04) || maps\mp\gametypes\_class::isvalidsecondary(var_04,0))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 70
lib_A7A0::getweaponfromchallenge(param_00)
{
	var_01 = "ch_";
	if(issubstr(param_00,"ch_marksman_"))
	{
		var_01 = "ch_marksman_";
	}
	else if(issubstr(param_00,"ch_expert_"))
	{
		var_01 = "ch_expert_";
	}
	else if(issubstr(param_00,"pr_marksman_"))
	{
		var_01 = "pr_marksman_";
	}
	else if(issubstr(param_00,"pr_expert_"))
	{
		var_01 = "pr_expert_";
	}

	var_02 = getsubstr(param_00,var_01.size,param_00.size);
	var_03 = maps\mp\_utility::getweaponnametokens(var_02);
	var_02 = undefined;
	if(var_03[0] == "iw5" || var_03[0] == "iw6")
	{
		var_02 = var_03[0] + "_" + var_03[1];
	}
	else
	{
		var_02 = var_03[0];
	}

	return var_02;
}

//Function Number: 71
lib_A7A0::getweaponattachmentfromchallenge(param_00)
{
	var_01 = "ch_";
	if(issubstr(param_00,"ch_marksman_"))
	{
		var_01 = "ch_marksman_";
	}
	else if(issubstr(param_00,"ch_expert_"))
	{
		var_01 = "ch_expert_";
	}
	else if(issubstr(param_00,"pr_marksman_"))
	{
		var_01 = "pr_marksman_";
	}
	else if(issubstr(param_00,"pr_expert_"))
	{
		var_01 = "pr_expert_";
	}

	var_02 = getsubstr(param_00,var_01.size,param_00.size);
	var_03 = maps\mp\_utility::getweaponnametokens(var_02);
	var_04 = undefined;
	if(isdefined(var_03[2]) && maps\mp\_utility::isattachment(var_03[2]))
	{
		var_04 = var_03[2];
	}

	return var_04;
}

//Function Number: 72
lib_A7A0::iskillstreakchallenge(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	var_01 = lib_A7A0::getchallengefilter(param_00);
	if(isdefined(var_01) && var_01 == "killstreaks_assault" || var_01 == "killstreaks_support")
	{
		return 1;
	}

	return 0;
}

//Function Number: 73
lib_A7A0::getkillstreakfromchallenge(param_00)
{
	var_01 = "ch_";
	var_02 = getsubstr(param_00,var_01.size,param_00.size);
	if(var_02 == "assault_streaks" || var_02 == "support_streaks")
	{
		var_02 = undefined;
	}

	return var_02;
}

//Function Number: 74
lib_A7A0::challenge_targetval(param_00,param_01,param_02)
{
	var_03 = tablelookup(param_00,0,param_01,9 + param_02 - 1 * 2);
	return int(var_03);
}

//Function Number: 75
lib_A7A0::challenge_rewardval(param_00,param_01,param_02)
{
	var_03 = tablelookup(param_00,0,param_01,10 + param_02 - 1 * 2);
	return int(var_03);
}

//Function Number: 76
lib_A7A0::challenge_parentchallenge(param_00,param_01)
{
	var_02 = tablelookup(param_00,0,param_01,42);
	if(!isdefined(var_02))
	{
		var_02 = "";
	}

	return var_02;
}

//Function Number: 77
lib_A7A0::buildchallengetableinfo(param_00,param_01)
{
	var_02 = 0;
	var_03 = 0;
	for(;;)
	{
		var_03++;
		var_04 = tablelookupbyrow(param_00,var_03,0);
		if(var_04 == "")
		{
			break;
		}

		var_05 = tablelookupbyrow(param_00,var_03,43);
		if(var_05 == "1")
		{
			continue;
		}

		level.challengeinfo[var_04] = [];
		level.challengeinfo[var_04]["index"] = var_03;
		level.challengeinfo[var_04]["type"] = param_01;
		level.challengeinfo[var_04]["targetval"] = [];
		level.challengeinfo[var_04]["reward"] = [];
		level.challengeinfo[var_04]["parent_challenge"] = "";
		if(lib_A7A0::isweaponchallenge(var_04))
		{
			var_06 = lib_A7A0::getweaponfromchallenge(var_04);
			var_07 = lib_A7A0::getweaponattachmentfromchallenge(var_04);
			if(isdefined(var_06))
			{
				level.challengeinfo[var_04]["weapon"] = var_06;
			}

			if(isdefined(var_07))
			{
				level.challengeinfo[var_04]["attachment"] = var_07;
			}
		}
		else if(lib_A7A0::iskillstreakchallenge(var_04))
		{
			var_08 = lib_A7A0::getkillstreakfromchallenge(var_04);
			if(isdefined(var_08))
			{
				level.challengeinfo[var_04]["killstreak"] = var_08;
			}
		}

		for(var_09 = 1;var_09 < 11;var_09++)
		{
			var_0A = lib_A7A0::challenge_targetval(param_00,var_04,var_09);
			var_0B = lib_A7A0::challenge_rewardval(param_00,var_04,var_09);
			if(var_0A == 0)
			{
				break;
			}

			level.challengeinfo[var_04]["targetval"][var_09] = var_0A;
			level.challengeinfo[var_04]["reward"][var_09] = var_0B;
			var_02 = var_02 + var_0B;
		}

		level.challengeinfo[var_04]["parent_challenge"] = lib_A7A0::challenge_parentchallenge(param_00,var_04);
	}

	return int(var_02);
}

//Function Number: 78
lib_A7A0::buildchallegeinfo()
{
	level.challengeinfo = [];
	if(getdvar("virtualLobbyActive") == "1")
	{
		return;
	}

	var_00 = 0;
	var_00 = var_00 + lib_A7A0::buildchallengetableinfo("mp/allChallengesTable.csv",0);
}

//Function Number: 79
lib_A7A0::monitorprocesschallenge()
{
	self endon("disconnect");
	level endon("game_end");
	for(;;)
	{
		if(!lib_A7A0::mayprocesschallenges())
		{
			return;
		}

		self waittill("process",var_00);
		lib_A7A0::processchallenge(var_00);
	}
}

//Function Number: 80
lib_A7A0::monitorkillstreakprogress()
{
	self endon("disconnect");
	level endon("game_end");
	for(;;)
	{
		self waittill("got_killstreak",var_00);
		if(!isdefined(var_00))
		{
			continue;
		}

		if(var_00 == 9 && isdefined(self.killstreaks[7]) && isdefined(self.killstreaks[8]) && isdefined(self.killstreaks[9]))
		{
			lib_A7A0::processchallenge("ch_6fears7");
		}

		if(var_00 == 10 && self.killstreaks.size == 0)
		{
			lib_A7A0::processchallenge("ch_theloner");
		}
	}
}

//Function Number: 81
lib_A7A0::monitorkilledkillstreak()
{
	self endon("disconnect");
	level endon("game_end");
	for(;;)
	{
		self waittill("destroyed_killstreak",var_00);
		if(self isitemunlocked("specialty_blindeye") && maps\mp\_utility::_hasperk("specialty_blindeye"))
		{
			lib_A7A0::processchallenge("ch_blindeye_pro");
		}

		if(isdefined(var_00) && var_00 == "stinger_mp")
		{
			lib_A7A0::processchallenge("ch_marksman_stinger");
			lib_A7A0::processchallenge("pr_marksman_stinger");
		}
	}
}

//Function Number: 82
lib_A7A0::genericchallenge(param_00,param_01)
{
	switch(param_00)
	{
		case "hijacker_airdrop":
			break;

		case "wargasm":
			break;

		case "weapon_assault":
			break;

		case "weapon_smg":
			break;

		case "weapon_lmg":
			break;

		case "weapon_dmr":
			break;

		case "weapon_sniper":
			break;

		case "shield_damage":
			break;

		case "shield_bullet_hits":
			break;

		case "shield_explosive_hits":
			break;
	}
}

//Function Number: 83
lib_A7A0::playerhasammo()
{
	var_00 = self getweaponslistprimaries();
	foreach(var_02 in var_00)
	{
		if(self getweaponammoclip(var_02))
		{
			return 1;
		}

		var_03 = weaponaltweaponname(var_02);
		if(!isdefined(var_03) || var_03 == "none")
		{
			continue;
		}

		if(self getweaponammoclip(var_03))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 84
lib_A7A0::monitoradstime()
{
	self endon("disconnect");
	self.adstime = 0;
	for(;;)
	{
		if(self playerads() == 1)
		{
			self.adstime = self.adstime + 0.05;
		}
		else
		{
			self.adstime = 0;
		}

		wait(0.05);
	}
}

//Function Number: 85
lib_A7A0::monitorpronetime()
{
	self endon("disconnect");
	level endon("game_ended");
	self.pronetime = undefined;
	var_00 = 0;
	for(;;)
	{
		var_01 = self getstance();
		if(var_01 == "prone" && var_00 == 0)
		{
			self.pronetime = gettime();
			var_00 = 1;
		}
		else if(var_01 != "prone")
		{
			self.pronetime = undefined;
			var_00 = 0;
		}

		wait(0.05);
	}
}

//Function Number: 86
monitorpowerslidetime()
{
	self endon("disconnect");
	level endon("game_ended");
	self.powerslidetime = undefined;
	for(;;)
	{
		while(!self method_8520())
		{
			wait(0.05);
		}

		self.powerslidetime = gettime();
		wait(0.05);
	}
}

//Function Number: 87
lib_A7A0::monitorholdbreath()
{
	self endon("disconnect");
	self.holdingbreath = 0;
	for(;;)
	{
		self waittill("hold_breath");
		self.holdingbreath = 1;
		self waittill("release_breath");
		self.holdingbreath = 0;
	}
}

//Function Number: 88
lib_A7A0::monitormantle()
{
	self endon("disconnect");
	self.mantling = 0;
	for(;;)
	{
		self waittill("jumped");
		var_00 = self getcurrentweapon();
		common_scripts\utility::waittill_notify_or_timeout("weapon_change",1);
		var_01 = self getcurrentweapon();
		if(var_01 == "none")
		{
			self.mantling = 1;
		}
		else
		{
			self.mantling = 0;
		}

		if(self.mantling)
		{
			if(self isitemunlocked("specialty_fastmantle") && maps\mp\_utility::_hasperk("specialty_fastmantle"))
			{
				lib_A7A0::processchallenge("ch_fastmantle");
			}

			common_scripts\utility::waittill_notify_or_timeout("weapon_change",1);
			var_01 = self getcurrentweapon();
			if(var_01 == var_00)
			{
				self.mantling = 0;
			}
		}
	}
}

//Function Number: 89
lib_A7A0::monitorweaponswap()
{
	self endon("disconnect");
	var_00 = self getcurrentweapon();
	for(;;)
	{
		self waittill("weapon_change",var_01);
		if(var_01 == "none")
		{
			continue;
		}

		if(var_01 == var_00)
		{
			continue;
		}

		if(maps\mp\_utility::iskillstreakweapon(var_01))
		{
			continue;
		}

		if(maps\mp\_utility::isbombsiteweapon(var_01))
		{
			continue;
		}

		var_02 = weaponinventorytype(var_01);
		if(var_02 != "primary")
		{
			continue;
		}

		self.lastprimaryweaponswaptime = gettime();
	}
}

//Function Number: 90
lib_A7A0::monitorflashbang()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("flashbang",var_00,var_01,var_02,var_03);
		if(isdefined(var_03) && self == var_03)
		{
			continue;
		}

		self.lastflashedtime = gettime();
	}
}

//Function Number: 91
lib_A7A0::monitorconcussion()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("concussed",var_00);
		if(self == var_00)
		{
			continue;
		}

		self.lastconcussedtime = gettime();
	}
}

//Function Number: 92
lib_A7A0::monitorminetriggering()
{
	self endon("disconnect");
	for(;;)
	{
		common_scripts\utility::waittill_any("triggered_mine","triggered_claymore");
		thread lib_A7A0::waitdelayminetime();
	}
}

//Function Number: 93
lib_A7A0::waitdelayminetime()
{
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	wait(level.delayminetime + 2);
	lib_A7A0::processchallenge("ch_delaymine");
}

//Function Number: 94
lib_A7A0::is_lethal_equipment(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	switch(param_00)
	{
		case "explosive_drone_mp":
		case "exoknife_mp":
		case "semtex_mp":
		case "frag_grenade_mp":
			break;

		default:
			break;
	}
}