/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42950.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 63
 * Decompile Time: 33 ms
 * Timestamp: 4/20/2022 8:18:33 PM
*******************************************************************/

//Function Number: 1
lib_A7C6::init()
{
	setdvar("missileRemoteSteerPitchRange","60 87");
	level._missile_strike_setting = [];
	level._missile_strike_setting["Particle_FX"] = spawnstruct();
	level._missile_strike_setting["Particle_FX"].gas = loadfx("vfx/unique/vfx_killstreak_missilestrike_dna");
	level._missile_strike_setting["Particle_FX"].gasfriendly = loadfx("vfx/unique/vfx_killstreak_missilestrike_dna_friendly");
	level._missile_strike_setting["Audio"] = spawnstruct();
	level._missile_strike_setting["Launch_Value"] = spawnstruct();
	var_00 = getdvar("mapname");
	if(var_00 == "mp_suburbia")
	{
		level._missile_strike_setting["Launch_Value"].vert = 7000;
		level._missile_strike_setting["Launch_Value"].horz = 10000;
		level._missile_strike_setting["Launch_Value"].targetdest = 2000;
	}
	else if(var_00 == "mp_mainstreet")
	{
		level._missile_strike_setting["Launch_Value"].vert = 7000;
		level._missile_strike_setting["Launch_Value"].horz = 10000;
		level._missile_strike_setting["Launch_Value"].targetdest = 2000;
	}
	else
	{
		level._missile_strike_setting["Launch_Value"].vert = 24000;
		level._missile_strike_setting["Launch_Value"].horz = 7000;
		level._missile_strike_setting["Launch_Value"].targetdest = 1500;
	}

	level.rockets = [];
	level.missile_strike_gas_clouds = [];
	level.killstreakfuncs["missile_strike"] = ::lib_A7C6::tryusemissilestrike;
	level.killstreakwieldweapons["remotemissile_projectile_mp"] = "missile_strike";
	level.killstreakwieldweapons["remotemissile_projectile_gas_mp"] = "missile_strike";
	level.killstreakwieldweapons["remotemissile_projectile_cluster_parent_mp"] = "missile_strike";
	level.killstreakwieldweapons["remotemissile_projectile_cluster_child_mp"] = "missile_strike";
	level.killstreakwieldweapons["remotemissile_projectile_cluster_child_hellfire_mp"] = "missile_strike";
	level.killstreakwieldweapons["remotemissile_projectile_secondary_mp"] = "missile_strike";
	level.killstreakwieldweapons["killstreak_strike_missile_gas_mp"] = "missile_strike";
	level.remotemissile_fx["explode"] = loadfx("vfx/explosion/rocket_explosion_airburst");
	thread lib_A7C6::onplayerconnect();
}

//Function Number: 2
lib_A7C6::tryusemissilestrike(param_00,param_01)
{
	var_02 = maps\mp\killstreaks\_killstreaks::initridekillstreak("missile_strike");
	if(var_02 != "success")
	{
		return 0;
	}

	maps\mp\_utility::playersaveangles();
	maps\mp\_utility::setusingremote("missile_strike");
	var_03 = lib_A7C6::buildweaponsettings(param_01);
	if(isdefined(level.var_511A) && level.var_511A)
	{
		self.missileweapon = var_03;
		if(self.killstreakindexweapon == 1)
		{
			self notify("used_horde_missile_strike");
		}
	}

	level thread lib_A7C6::_fire(param_00,self,var_03);
	return 1;
}

//Function Number: 3
lib_A7C6::buildweaponsettings(param_00)
{
	var_01 = spawnstruct();
	var_01.var_5D57 = param_00;
	var_01.name = "remotemissile_projectile_mp";
	var_01.gasmissile = 0;
	var_01.clustermissile = 0;
	var_01.clusterhellfire = 0;
	var_01.clusterspiral = 0;
	if(common_scripts\utility::array_contains(var_01.var_5D57,"missile_strike_hellfire"))
	{
		var_01.name = "remotemissile_projectile_cluster_parent_mp";
		var_01.clustermissile = 1;
		var_01.clusterhellfire = 1;
	}

	if(common_scripts\utility::array_contains(var_01.var_5D57,"missile_strike_cluster"))
	{
		var_01.name = "remotemissile_projectile_cluster_parent_mp";
		var_01.clustermissile = 1;
		var_01.clusterspiral = 1;
		thread prespawnclusterrotationentities(var_01);
	}
	else if(common_scripts\utility::array_contains(var_01.var_5D57,"missile_strike_chem"))
	{
		var_01.name = "remotemissile_projectile_gas_mp";
		var_01.gasmissile = 1;
	}

	var_01.rocketammo = 1;
	if(common_scripts\utility::array_contains(var_01.var_5D57,"missile_strike_extra_1"))
	{
		var_01.rocketammo++;
	}

	if(common_scripts\utility::array_contains(var_01.var_5D57,"missile_strike_extra_2"))
	{
		var_01.rocketammo++;
	}

	return var_01;
}

//Function Number: 4
prespawnclusterrotationentities(param_00)
{
	var_01 = (0,0,-1000);
	param_00.prespawnedkillcament = spawn("script_model",var_01);
	param_00.prespawnedkillcament setcontents(0);
	param_00.prespawnedkillcament setscriptmoverkillcam("large explosive");
	wait 0.05;
	param_00.prespawnedrotationents = [];
	param_00.prespawnedindex = 0;
	for(var_02 = 0;var_02 < 12;var_02++)
	{
		var_03 = spawn("script_origin",var_01);
		param_00.prespawnedrotationents[param_00.prespawnedrotationents.size] = var_03;
		wait 0.05;
	}
}

//Function Number: 5
lib_A7C6::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A7C6::waitingforspawnduringstreak();
	}
}

//Function Number: 6
lib_A7C6::waitingforspawnduringstreak()
{
	self waittill("spawned_player");
	self.missilestrikegastime = 0;
	thread lib_A7C6::creategastrackingoverlay();
	thread lib_A7C6::waitforgasdamage();
}

//Function Number: 7
lib_A7C6::getbestspawnpoint(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		var_03.validplayers = [];
		var_03.spawnscore = 0;
	}

	foreach(var_06 in level.var_328)
	{
		if(!maps\mp\_utility::isreallyalive(var_06))
		{
			continue;
		}

		if(var_06.inliveplayerkillstreak == self.inliveplayerkillstreak)
		{
			continue;
		}

		if(var_06.inliveplayerkillstreak == "spectator")
		{
			continue;
		}

		var_07 = 999999999;
		var_08 = undefined;
		foreach(var_03 in param_00)
		{
			var_03.validplayers[var_03.validplayers.size] = var_06;
			var_0A = distance2d(var_03.targetent.var_2E6,var_06.var_2E6);
			if(var_0A <= var_07)
			{
				var_07 = var_0A;
				var_08 = var_03;
			}
		}

		var_08.spawnscore = var_08.spawnscore + 2;
	}

	var_0D = param_00[0];
	foreach(var_03 in param_00)
	{
		foreach(var_06 in var_03.validplayers)
		{
			var_03.spawnscore = var_03.spawnscore + 1;
			if(bullettracepassed(var_06.var_2E6 + (0,0,32),var_03.var_2E6,0,var_06))
			{
				var_03.spawnscore = var_03.spawnscore + 3;
			}

			if(var_03.spawnscore > var_0D.spawnscore)
			{
				var_0D = var_03;
				continue;
			}

			if(var_03.spawnscore == var_0D.spawnscore)
			{
				if(common_scripts\utility::cointoss())
				{
					var_0D = var_03;
				}
			}
		}
	}

	return var_0D;
}

//Function Number: 8
lib_A7C6::_fire(param_00,param_01,param_02)
{
	var_03 = param_02.name;
	param_01 lib_A7C6::playeraddnotifycommands();
	var_04 = lib_A7C6::fireorbitalmissile(param_01,var_03);
	if(isdefined(level.var_511A) && level.var_511A)
	{
		param_01.rocket = var_04;
	}

	param_02.rocketammo--;
	if(param_02.rocketammo > 0 || param_02.clustermissile)
	{
		var_04 disablemissileboosting();
	}

	var_04.owner = param_01;
	var_04.inliveplayerkillstreak = param_01.inliveplayerkillstreak;
	var_04.lifeid = param_00;
	var_04.type = "remote";
	level.remotemissileinprogress = 1;
	var_04 thread maps\mp\gametypes\_damage::setentitydamagecallback(10,undefined,::lib_A7C6::missilestrikeondeath,undefined,1);
	if(isdefined(level.var_511A) && level.var_511A)
	{
		var_04 thread rocketimpact_dronekillcheck(param_01);
	}

	var_04 setmissileminimapvisible(1);
	var_04 playsoundtoteam("mstrike_entry_npc",maps\mp\_utility::getotherteam(var_04.inliveplayerkillstreak));
	var_04 playsoundtoteam("mstrike_entry_npc",var_04.inliveplayerkillstreak,param_01);
	lib_A7C6::missileeyes(param_01,var_04,param_02);
}

//Function Number: 9
rocketimpact_dronekillcheck(param_00)
{
	self waittill("death");
	if(isdefined(level.flying_attack_drones))
	{
		foreach(var_02 in level.flying_attack_drones)
		{
			if(var_02.var_2E6[2] > self.var_2E6[2] && var_02.var_2E6[2] < self.var_2E6[2] + 1200 && distance2dsquared(var_02.var_2E6,self.var_2E6) < 40000)
			{
				var_02 dodamage(350,self.var_2E6,param_00,param_00,"MOD_PROJECTILE_SPLASH","remotemissile_projectile_mp");
			}
		}
	}
}

//Function Number: 10
lib_A7C6::missilestrikeondeath(param_00,param_01,param_02,param_03)
{
	if(isdefined(level.var_511A) && level.var_511A)
	{
		if(isdefined(self.owner))
		{
			self.owner.missileweapon = undefined;
			self.owner.rocket = undefined;
		}
	}

	playfx(level.remotemissile_fx["explode"],self.var_2E6);
	maps\mp\gametypes\_damage::onkillstreakkilled(param_00,param_01,param_02,param_03,"missile_strike_destroyed",undefined,undefined,0);
	self delete();
}

//Function Number: 11
lib_A7C6::fireorbitalmissile(param_00,param_01)
{
	var_02 = maps\mp\killstreaks\_aerial_utility::getentorstructarray("remoteMissileSpawn","targetname");
	foreach(var_04 in var_02)
	{
		if(isdefined(var_04.target))
		{
			var_04.targetent = getent(var_04.target,"targetname");
		}
	}

	if(var_02.size > 0)
	{
		var_06 = param_00 lib_A7C6::getbestspawnpoint(var_02);
	}
	else
	{
		var_06 = undefined;
	}

	var_07 = undefined;
	var_08 = undefined;
	if(isdefined(var_06))
	{
		var_07 = var_06.var_2E6;
		var_08 = var_06.targetent.var_2E6;
		var_09 = 24000;
		if(isdefined(level.remote_missile_height_override))
		{
			var_09 = level.remote_missile_height_override;
		}

		var_0A = vectornormalize(var_07 - var_08);
		var_07 = var_0A * var_09 + var_08;
	}
	else
	{
		var_0B = (0,0,level._missile_strike_setting["Launch_Value"].vert);
		var_09 = level._missile_strike_setting["Launch_Value"].horz;
		var_0C = level._missile_strike_setting["Launch_Value"].targetdest;
		var_0D = anglestoforward(param_00.var_41);
		var_07 = param_00.var_2E6 + var_0B + var_0D * var_09 * -1;
		var_08 = param_00.var_2E6 + var_0D * var_0C;
	}

	return magicbullet(param_01,var_07,var_08,param_00);
}

//Function Number: 12
lib_A7C6::missileeyes(param_00,param_01,param_02)
{
	param_00 endon("joined_team");
	param_00 endon("joined_spectators");
	param_02 endon("missile_strike_complete");
	param_00 endon("disconnect");
	param_01 thread lib_A7C6::rocket_cleanupondeath();
	param_00 thread lib_A7C6::player_cleanupongameended(param_01,param_02);
	param_00 thread lib_A7C6::player_cleanuponteamchange(param_01,param_02);
	param_00.clusterdeployed = 0;
	param_00.missileboostused = 0;
	param_00 cameralinkto(param_01,"tag_origin");
	param_00 controlslinkto(param_01);
	if(getdvarint("camera_thirdPerson"))
	{
		param_00 maps\mp\_utility::setthirdpersondof(0);
	}

	param_00 thread lib_A7C6::init_hud(param_01,param_02);
	param_00 thread lib_A7C6::playerwaitreset(param_02);
	if(param_02.clustermissile)
	{
		param_00 thread lib_A7C6::watchforclustersplit(param_01,param_02);
	}

	if(param_02.rocketammo <= 0 && !param_02.clustermissile)
	{
		param_01 enablemissileboosting();
		param_00 thread lib_A7C6::hud_watch_for_boost_active(param_01,param_02);
	}
	else
	{
		param_00 thread lib_A7C6::watchforextramissilefire(param_01,param_02);
	}

	param_00 thread lib_A7C6::playerwatchforearlyexit(param_02);
	param_01 waittill("death");
	if(param_02.gasmissile)
	{
		if(isdefined(param_01))
		{
			param_00 thread lib_A7C6::releasegas(param_01.var_2E6);
		}
	}

	if(isdefined(param_01))
	{
		param_00 maps\mp\_matchdata::logkillstreakevent("missile_strike",param_01.var_2E6);
	}

	param_02 notify("missile_strike_complete");
}

//Function Number: 13
lib_A7C6::playerwatchforearlyexit(param_00)
{
	level endon("game_ended");
	param_00 endon("missile_strike_complete");
	self endon("disconnect");
	for(;;)
	{
		var_01 = 0;
		while(self usebuttonpressed())
		{
			var_01 = var_01 + 0.05;
			if(var_01 > 0.5)
			{
				param_00 notify("ms_early_exit");
				return;
			}

			wait 0.05;
		}

		wait 0.05;
	}
}

//Function Number: 14
lib_A7C6::playerwaitreset(param_00)
{
	param_00 common_scripts\utility::waittill_either("missile_strike_complete","ms_early_exit");
	lib_A7C6::playerreset();
}

//Function Number: 15
lib_A7C6::playerreset()
{
	self endon("disconnect");
	self controlsunlink();
	maps\mp\_utility::freezecontrolswrapper(1);
	lib_A7C6::playerremovenotifycommands();
	lib_A7C6::stopmissileboostsounds();
	if(!level.gameended || isdefined(self.finalkill))
	{
		maps\mp\killstreaks\_aerial_utility::playershowfullstatic();
	}

	wait(0.5);
	maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	lib_A7C6::remove_hud();
	self cameraunlink();
	maps\mp\_utility::freezecontrolswrapper(0);
	if(maps\mp\_utility::isusingremote())
	{
		maps\mp\_utility::clearusingremote();
	}

	if(getdvarint("camera_thirdPerson"))
	{
		maps\mp\_utility::setthirdpersondof(1);
	}

	maps\mp\_utility::playerrestoreangles();
	if(isdefined(level.script))
	{
		self visionsetnakedforplayer(level.script,0);
	}

	maps\mp\_utility::revertvisionsetforplayer(0.02);
}

//Function Number: 16
lib_A7C6::stopmissileboostsounds()
{
	self method_82F5("mstrike_boost_shot");
	self method_82F5("mstrike_boost_boom");
	self method_82F5("mstrike_boost_swoop");
	self method_82F5("mstrike_boost_jet");
	self method_82F5("mstrike_boost_roar");
}

//Function Number: 17
lib_A7C6::watchforextramissilefire(param_00,param_01)
{
	param_00 endon("death");
	wait(0.5);
	for(;;)
	{
		self waittill("FireButtonPressed");
		if(param_01.rocketammo > 0)
		{
			thread lib_A7C6::firebabymissile(param_00,param_01);
		}
		else
		{
			break;
		}

		wait(0.1);
	}
}

//Function Number: 18
lib_A7C6::enableboost(param_00)
{
	wait(0.5);
	param_00 enablemissileboosting();
}

//Function Number: 19
lib_A7C6::firebabymissile(param_00,param_01)
{
	var_02 = param_01.name;
	var_03 = (0,32,0);
	var_04 = param_01.rocketammo % 2;
	if(var_04 == 0)
	{
		var_03 = (0,-64,0);
	}

	var_05 = param_00.var_2E6 + anglestoforward(param_00.var_41) * 32000;
	var_06 = bullettrace(param_00.var_2E6,var_05,0,param_00,0,0,0,1,0);
	var_07 = param_00.var_2E6 + var_03 + anglestoforward(param_00.var_41) * 750;
	var_08 = var_06["position"];
	var_09 = magicbullet("remotemissile_projectile_secondary_mp",var_07,var_08,self);
	if(!isdefined(var_09))
	{
		return;
	}

	param_01.rocketammo--;
	if(param_01.rocketammo <= 0 && !param_01.clustermissile)
	{
		lib_A7C6::hud_update_fire_text(var_09,param_01);
		thread lib_A7C6::hud_watch_for_boost_active(param_00,param_01);
		thread lib_A7C6::enableboost(param_00);
	}

	if(isdefined(var_02))
	{
		if(isdefined(param_00.targets) && param_00.targets.size)
		{
			var_09 missilesettargetent(param_00.targets[0]);
		}
	}

	var_09.inliveplayerkillstreak = self.inliveplayerkillstreak;
	var_09 setmissileminimapvisible(1);
	self playrumbleonentity("sniper_fire");
	earthquake(0.2,0.2,param_00.var_2E6,200);
	var_09 thread maps\mp\gametypes\_damage::setentitydamagecallback(10,undefined,::lib_A7C6::missilestrikeondeath,undefined,1);
}

//Function Number: 20
lib_A7C6::watchforclustersplit(param_00,param_01)
{
	param_01 endon("missile_strike_complete");
	self endon("spawned_player");
	param_00 endon("death");
	while(param_01.rocketammo > 0)
	{
		self waittill("FireButtonPressed");
	}

	wait(0.25);
	self waittill("FireButtonPressed");
	self.clusterdeployed = 1;
	lib_A7C6::hud_update_fire_text(param_00,param_01);
	thread lib_A7C6::split_rocket(param_00,param_01);
}

//Function Number: 21
lib_A7C6::split_rocket(param_00,param_01)
{
	if(param_01.clusterhellfire)
	{
		thread lib_A7C6::split_rocket_hellfire(param_00,param_01);
		return;
	}

	thread lib_A7C6::split_rocket_spiral(param_00,param_01);
}

//Function Number: 22
lib_A7C6::split_rocket_hellfire(param_00,param_01)
{
	var_02 = 2;
	var_03 = [];
	if(isdefined(param_00.targets) && param_00.targets.size)
	{
		var_03 = param_00.targets;
	}

	thread lib_A7C6::fire_straight_bomblet(param_00,0,param_01);
	foreach(var_05 in var_03)
	{
		thread lib_A7C6::fire_targeted_bomblet(param_00,var_05,var_02,param_01);
		var_02++;
	}

	for(var_07 = var_03.size;var_07 <= 8;var_07++)
	{
		thread lib_A7C6::fire_random_bomblet(param_00,var_07 % 6,var_02,param_01);
		var_02++;
	}

	self playrumbleonentity("sniper_fire");
	earthquake(0.2,0.2,param_00.var_2E6,200);
	param_00 method_8505(1);
	thread lib_A7C6::fade_to_white();
	thread lib_A7C6::bomblet_camera_waiter(param_00,param_01);
}

//Function Number: 23
lib_A7C6::split_rocket_spiral(param_00,param_01)
{
	param_01 endon("missile_strike_complete");
	self endon("spawned_player");
	param_00 endon("death");
	thread lib_A7C6::fade_to_white();
	self waittill("full_white");
	thread maps\mp\_utility::freezecontrolswrapper(1);
	if(!isdefined(param_00))
	{
		return;
	}

	self.strikerocketstoredposition = param_00.var_2E6;
	self.strikerocketstoredangles = param_00.var_41;
	var_02 = distance(param_00.var_2E6,self.var_2E6) + 10000;
	var_03 = param_00.var_2E6 + anglestoforward(param_00.var_41) * var_02;
	var_04 = self.strikerocketstoredposition;
	var_05 = param_00.var_2E6 + anglestoforward(param_00.var_41) * 3250;
	param_00 method_8505(1);
	thread lib_A7C6::bomblet_camera_waiter(param_00,param_01);
	thread lib_A7C6::spawnclusterchildren(var_03,self.strikerocketstoredposition,var_05,param_01);
	self waittill("fade_white_over");
	wait(9);
	maps\mp\_utility::freezecontrolswrapper(0);
}

//Function Number: 24
lib_A7C6::fire_straight_bomblet(param_00,param_01,param_02)
{
	param_02 endon("missile_strike_complete");
	var_03 = param_00.var_2E6;
	var_04 = param_00.var_41;
	var_05 = param_00.owner;
	if(param_01 > 0)
	{
		wait(param_01 * 0.05);
	}

	var_06 = magicbullet("remotemissile_projectile_cluster_child_hellfire_mp",var_03,var_03 + anglestoforward(var_04) * 1000,self);
	var_06.inliveplayerkillstreak = self.inliveplayerkillstreak;
	var_06.killcament = self;
	var_06 setmissileminimapvisible(1);
	var_06 thread lib_A7C6::bomblet_explosion_waiter(self,param_02);
}

//Function Number: 25
lib_A7C6::fire_targeted_bomblet(param_00,param_01,param_02,param_03)
{
	param_03 endon("missile_strike_complete");
	var_04 = param_00.var_2E6;
	var_05 = param_00.var_41;
	var_06 = param_00.owner;
	var_07 = param_01.var_2E6;
	wait(param_02 * 0.05);
	if(isdefined(param_01) && distance2dsquared(param_01.var_2E6,var_07) < 57600)
	{
		var_07 = param_01.var_2E6;
	}

	var_08 = magicbullet("remotemissile_projectile_cluster_child_hellfire_mp",var_04,var_07,self);
	var_08.inliveplayerkillstreak = self.inliveplayerkillstreak;
	var_08.killcament = self;
	if(isdefined(param_01))
	{
		var_08 missilesettargetent(param_01);
	}

	var_08 setmissileminimapvisible(1);
	var_08 thread lib_A7C6::bomblet_explosion_waiter(self,param_03);
}

//Function Number: 26
lib_A7C6::fire_random_bomblet(param_00,param_01,param_02,param_03)
{
	param_03 endon("missile_strike_complete");
	var_04 = 600;
	var_05 = param_00.var_2E6;
	var_06 = param_00.var_41;
	var_07 = param_00.owner;
	var_08 = param_00.aimtarget;
	wait(param_02 * 0.05);
	var_09 = randomintrange(10 + 60 * param_01,50 + 60 * param_01);
	var_0A = randomintrange(200,var_04 + 100);
	var_0B = min(var_0A,var_04 - 50) * cos(var_09);
	var_0C = min(var_0A,var_04 - 50) * sin(var_09);
	var_0D = magicbullet("remotemissile_projectile_cluster_child_hellfire_mp",var_05,var_08 + (var_0B,var_0C,0),self);
	var_0D.inliveplayerkillstreak = self.inliveplayerkillstreak;
	var_0D.killcament = self;
	var_0D setmissileminimapvisible(1);
	var_0D thread lib_A7C6::bomblet_explosion_waiter(self,param_03);
}

//Function Number: 27
lib_A7C6::bomblet_explosion_waiter(param_00,param_01)
{
	param_00 endon("disconnect");
	param_01 endon("ms_early_exit");
	param_01 endon("missile_strike_complete");
	level endon("game_ended");
	self waittill("death");
	param_01 notify("bomblet_exploded");
}

//Function Number: 28
lib_A7C6::bomblet_camera_waiter(param_00,param_01)
{
	self endon("disconnect");
	param_01 endon("ms_early_exit");
	param_01 endon("missile_strike_complete");
	param_00 endon("death");
	level endon("game_ended");
	param_01 waittill("bomblet_exploded");
	wait(1);
	thread lib_A7C6::bomblet_camera_waiter_complete(param_00,param_01);
}

//Function Number: 29
lib_A7C6::bomblet_camera_waiter_complete(param_00,param_01)
{
	param_00 notify("death");
	param_01 notify("missile_strike_complete");
}

//Function Number: 30
getprespawnedclusterrotationent(param_00,param_01)
{
	while(param_00.prespawnedrotationents.size < param_00.prespawnedindex + 1)
	{
		wait 0.05;
	}

	var_02 = param_00.prespawnedrotationents[param_00.prespawnedindex];
	param_00.prespawnedindex++;
	if(isdefined(param_01))
	{
		var_02.var_2E6 = param_01;
	}

	return var_02;
}

//Function Number: 31
lib_A7C6::spawnclusterchildren(param_00,param_01,param_02,param_03)
{
	var_04 = randomintrange(16,64);
	if(randomint(100) > 50)
	{
		var_04 = var_04 * -1;
	}

	var_05 = randomintrange(16,64);
	if(randomint(100) > 50)
	{
		var_05 = var_05 * -1;
	}

	var_06 = param_01 + (var_04,var_05,0);
	var_07 = param_02 + (var_04,var_05,0);
	var_08 = getprespawnedclusterrotationent(param_03,param_02);
	var_08.rotatinglinkarray = [];
	var_08.rotatinglinkarray[0] = getprespawnedclusterrotationent(param_03,var_07);
	var_08.rotatinglinkarray[0] method_8446(var_08);
	var_09 = magicbullet("remotemissile_projectile_cluster_child_mp",var_06,var_07,self);
	var_09 missilesettargetent(var_08.rotatinglinkarray[0]);
	var_09 missilesetflightmodedirect();
	var_09.owner = self;
	var_09.inliveplayerkillstreak = self.inliveplayerkillstreak;
	var_09 setmissileminimapvisible(1);
	var_09 thread lib_A7C6::bomblet_explosion_waiter(self,param_03);
	var_0A = var_07 - var_06;
	var_0A = vectornormalize((var_0A[0],var_0A[1],0));
	var_0A = var_0A * -30;
	var_0A = var_0A + (0,0,200);
	var_0B = param_03.prespawnedkillcament;
	var_0B.var_2E6 = var_06 + var_0A;
	var_0B.var_534F = gettime();
	var_0B linkto(var_09);
	var_0B thread killcamrocketdeath(var_09);
	var_09.killcament = var_0B;
	var_0C = 10;
	param_03.rotatinglinkarrayindex = var_08.rotatinglinkarray.size;
	for(var_0D = 0;var_0D < var_0C;var_0D++)
	{
		var_0E = var_08.rotatinglinkarray.size;
		var_08.rotatinglinkarray[var_0E] = getprespawnedclusterrotationent(param_03);
	}

	var_09 endon("death");
	thread lib_A7C6::deleterotationents(var_08,var_09);
	thread lib_A7C6::rotatetargets(var_08,var_09);
	thread lib_A7C6::movetargets(var_08,var_09);
	wait 0.05;
	for(var_0D = 1;var_0D <= var_0C;var_0D++)
	{
		var_0F = getmissileposition(param_01,param_02,var_08,param_03);
		var_07 = var_0F.var_2E6;
		var_06 = var_0F.randomposition;
		var_10 = magicbullet("remotemissile_projectile_cluster_child_mp",var_06,var_07,self);
		var_10 missilesettargetent(var_08.rotatinglinkarray[var_0D]);
		var_10 missilesetflightmodedirect();
		var_10.owner = self;
		var_10.inliveplayerkillstreak = self.inliveplayerkillstreak;
		var_10.killcament = var_0B;
		var_10 setmissileminimapvisible(1);
		var_10 thread lib_A7C6::bomblet_explosion_waiter(self,param_03);
		wait 0.05;
	}
}

//Function Number: 32
getmissileposition(param_00,param_01,param_02,param_03)
{
	var_04 = param_02.rotatinglinkarray[param_03.rotatinglinkarrayindex];
	param_03.rotatinglinkarrayindex++;
	var_05 = param_02.var_2E6 - param_01;
	param_00 = param_00 + var_05;
	var_06 = randomintrange(64,500);
	var_07 = var_06 + 0;
	if(randomint(100) > 50)
	{
		var_06 = var_06 * -1;
		var_07 = var_06 - 0;
	}

	var_08 = randomintrange(64,500);
	var_09 = var_08 + 0;
	if(randomint(100) > 50)
	{
		var_08 = var_08 * -1;
		var_09 = var_08 - 0;
	}

	var_0A = param_00 + (var_06,var_08,0);
	var_0B = param_02.var_2E6 + (var_07,var_09,0);
	var_04.var_2E6 = var_0B;
	var_04.randomposition = var_0A;
	var_04 method_8446(param_02);
	return var_04;
}

//Function Number: 33
killcamrocketdeath(param_00)
{
	self endon("death");
	param_00 waittill("death");
	self unlink();
	self.var_2E6 = self.var_2E6 + (0,0,50);
	wait(3);
	self delete();
}

//Function Number: 34
lib_A7C6::rotatetargets(param_00,param_01)
{
	param_01 endon("death");
	var_02 = 10;
	for(;;)
	{
		param_00 rotatevelocity((0,120,0),var_02);
		wait(var_02);
	}
}

//Function Number: 35
lib_A7C6::movetargets(param_00,param_01)
{
	param_01 endon("death");
	var_02 = param_01.var_2E6;
	var_03 = distance(param_01.var_2E6,param_00.var_2E6);
	var_04 = self.strikerocketstoredangles;
	var_05 = self.strikerocketstoredposition;
	for(;;)
	{
		var_06 = distance(param_01.var_2E6,var_02);
		var_07 = var_05 + anglestoforward(var_04) * var_03 + var_06;
		param_00.var_2E6 = var_07;
		wait 0.05;
	}
}

//Function Number: 36
lib_A7C6::deleterotationents(param_00,param_01)
{
	param_01 waittill("death");
	if(isdefined(param_00))
	{
		foreach(var_03 in param_00.rotatinglinkarray)
		{
			var_03 delete();
		}

		param_00 delete();
	}
}

//Function Number: 37
lib_A7C6::releasegas(param_00)
{
	var_01 = param_00 + (0,0,40);
	var_02 = spawn("script_model",var_01);
	var_02 setmodel("tag_origin");
	var_03 = spawn("script_model",var_02.var_2E6);
	var_02.killcament = var_03;
	var_02.killcament setscriptmoverkillcam("explosive");
	var_02.killcament method_8446(var_02);
	var_04 = spawnstruct();
	var_04.var_2E6 = var_01;
	var_04.inliveplayerkillstreak = self.inliveplayerkillstreak;
	level.missile_strike_gas_clouds[level.missile_strike_gas_clouds.size] = var_04;
	var_02 thread lib_A7C6::showgascloud(self);
	var_02.objidenemy = maps\mp\gametypes\_gameobjects::getnextobjid();
	objective_add(var_02.objidenemy,"active",var_02.var_2E6,"hud_gas_enemy");
	objective_playerenemyteam(var_02.objidenemy,self getentitynumber());
	var_02.objidfriendly = maps\mp\gametypes\_gameobjects::getnextobjid();
	objective_add(var_02.objidfriendly,"active",var_02.var_2E6,"hud_gas_friendly");
	objective_playerteam(var_02.objidfriendly,self getentitynumber());
	thread lib_A7C6::chemdamagethink(var_02,var_01,self);
	common_scripts\utility::waittill_any_timeout_no_endon_death(20,"joined_team","joined_spectators","disconnect");
	maps\mp\_utility::_objective_delete(var_02.objidenemy);
	maps\mp\_utility::_objective_delete(var_02.objidfriendly);
	wait(2);
	var_02 lib_A7C6::friendlyenemyeffectsstop();
	var_02.killcament delete();
	var_02 delete();
	var_05 = 0;
	var_06 = [];
	for(var_07 = 0;var_07 < level.missile_strike_gas_clouds.size;var_07++)
	{
		if(!var_05 && level.missile_strike_gas_clouds[var_07].var_2E6 == var_01)
		{
			var_05 = 1;
			continue;
		}

		var_06[var_06.size] = level.missile_strike_gas_clouds[var_07];
	}

	level.missile_strike_gas_clouds = var_06;
}

//Function Number: 38
lib_A7C6::showgascloud(param_00)
{
	var_01 = level._missile_strike_setting["Particle_FX"].gasfriendly;
	var_02 = level._missile_strike_setting["Particle_FX"].gas;
	var_03 = self gettagorigin("tag_origin");
	var_04 = (1,0,0);
	self.friendlyfx = maps\mp\_utility::spawnfxshowtoteam(var_01,param_00.inliveplayerkillstreak,var_03,var_04);
	self.enemyfx = maps\mp\_utility::spawnfxshowtoteam(var_02,maps\mp\_utility::getotherteam(param_00.inliveplayerkillstreak),var_03,var_04);
}

//Function Number: 39
lib_A7C6::friendlyenemyeffectsstop()
{
	if(isdefined(self.friendlyfx))
	{
		self.friendlyfx delete();
	}

	if(isdefined(self.enemyfx))
	{
		self.enemyfx delete();
	}
}

//Function Number: 40
lib_A7C6::creategastrackingoverlay()
{
	if(!isdefined(self.strikegastrackingoverlay))
	{
		self.strikegastrackingoverlay = newclienthudelem(self);
		self.strikegastrackingoverlay.x = 0;
		self.strikegastrackingoverlay.y = 0;
		self.strikegastrackingoverlay setshader("lab_gas_overlay",640,480);
		self.strikegastrackingoverlay.alignx = "left";
		self.strikegastrackingoverlay.aligny = "top";
		self.strikegastrackingoverlay.horzalign = "fullscreen";
		self.strikegastrackingoverlay.vertalign = "fullscreen";
		self.strikegastrackingoverlay.alpha = 0;
	}
}

//Function Number: 41
lib_A7C6::chemdamagethink(param_00,param_01,param_02)
{
	param_00 endon("death");
	param_02 endon("joined_team");
	param_02 endon("joined_spectators");
	param_02 endon("disconnect");
	var_03 = 200;
	var_04 = 20;
	for(;;)
	{
		if(!isdefined(param_02))
		{
			return;
		}

		param_00.killcament entityradiusdamage(param_01,var_03,var_04,var_04,param_02,"MOD_TRIGGER_HURT","killstreak_strike_missile_gas_mp",0);
		wait(1);
	}
}

//Function Number: 42
lib_A7C6::waitforgasdamage()
{
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09);
		if(isdefined(var_01) && self == var_01)
		{
			continue;
		}

		if(maps\mp\_utility::_hasperk("specialty_stun_resistance"))
		{
			continue;
		}

		if(isdefined(var_09) && var_09 == "killstreak_strike_missile_gas_mp")
		{
			thread lib_A7C6::shockthink();
		}
	}
}

//Function Number: 43
lib_A7C6::shockthink()
{
	if(self.missilestrikegastime <= 0)
	{
		thread lib_A7C6::fadeinoutgastrackingoverlay();
		thread lib_A7C6::removeoverlaydeath();
	}

	self.missilestrikegastime = 2;
	self shellshock("mp_lab_gas",1);
	while(self.missilestrikegastime > 0)
	{
		self.missilestrikegastime--;
		wait(1);
	}

	self notify("missile_strike_gas_end");
	lib_A7C6::endgastrackingoverlay();
}

//Function Number: 44
lib_A7C6::fadeinoutgastrackingoverlay()
{
	level endon("game_ended");
	self endon("missile_strike_gas_end");
	self endon("death");
	if(isdefined(self.strikegastrackingoverlay))
	{
		for(;;)
		{
			self.strikegastrackingoverlay fadeovertime(0.4);
			self.strikegastrackingoverlay.alpha = 1;
			wait(0.5);
			self.strikegastrackingoverlay fadeovertime(0.4);
			self.strikegastrackingoverlay.alpha = 0.5;
			wait(0.5);
		}
	}
}

//Function Number: 45
lib_A7C6::endgastrackingoverlay()
{
	if(isdefined(self.strikegastrackingoverlay))
	{
		self.strikegastrackingoverlay fadeovertime(0.2);
		self.strikegastrackingoverlay.alpha = 0;
	}
}

//Function Number: 46
lib_A7C6::endgastrackingoverlaydeath()
{
	if(isdefined(self.strikegastrackingoverlay))
	{
		self.strikegastrackingoverlay.alpha = 0;
	}
}

//Function Number: 47
lib_A7C6::removeoverlaydeath()
{
	self endon("missile_strike_gas_end");
	self waittill("death");
	thread lib_A7C6::endgastrackingoverlaydeath();
}

//Function Number: 48
lib_A7C6::player_cleanuponteamchange(param_00,param_01)
{
	param_00 endon("death");
	self endon("disconnect");
	common_scripts\utility::waittill_any("joined_team","joined_spectators");
	param_01 notify("missile_strike_complete");
	level.remotemissileinprogress = undefined;
}

//Function Number: 49
lib_A7C6::rocket_cleanupondeath()
{
	var_00 = self getentitynumber();
	level.rockets[var_00] = self;
	self waittill("death");
	level.rockets[var_00] = undefined;
	level.remotemissileinprogress = undefined;
}

//Function Number: 50
lib_A7C6::player_cleanupongameended(param_00,param_01)
{
	param_00 endon("death");
	self endon("disconnect");
	level waittill("game_ended");
	param_01 notify("missile_strike_complete");
}

//Function Number: 51
lib_A7C6::player_is_valid_target(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(function_0285(param_00,self))
	{
		return 0;
	}

	if(!isalive(param_00))
	{
		return 0;
	}

	if(param_00 maps\mp\_utility::_hasperk("specialty_blindeye"))
	{
		return 0;
	}

	if(isdefined(param_00.spawntime) && gettime() - param_00.spawntime / 1000 < 5)
	{
		return 0;
	}

	return 1;
}

//Function Number: 52
lib_A7C6::getenemytargets()
{
	var_00 = [];
	foreach(var_02 in level.var_328)
	{
		if(!lib_A7C6::player_is_valid_target(var_02))
		{
			continue;
		}

		var_00[var_00.size] = var_02;
	}

	return var_00;
}

//Function Number: 53
lib_A7C6::getvalidtargetssorted(param_00,param_01,param_02)
{
	var_03 = param_02.name;
	var_04 = 600;
	var_05 = var_04 * var_04;
	var_06 = [];
	var_07 = anglestoforward(param_00.var_41);
	var_08 = param_00.var_2E6[2];
	var_09 = level.var_5983[2];
	var_0A = var_09 - var_08;
	var_0B = var_0A / var_07[2];
	var_0C = param_00.var_2E6 + var_07 * var_0B;
	param_00.aimtarget = var_0C;
	var_0D = 0;
	if(param_02.rocketammo > 0)
	{
		var_0D = 1;
	}
	else if(param_02.clustermissile && param_02.clusterhellfire && !self.clusterdeployed)
	{
		var_0D = 10;
	}
	else
	{
		return var_06;
	}

	var_0E = lib_A7C6::getenemytargets();
	foreach(var_10 in var_0E)
	{
		if(distance2dsquared(var_10.var_2E6,var_0C) < var_05)
		{
			if(param_01)
			{
				if(bullettracepassed(var_10.var_2E6 + (0,0,60),var_10.var_2E6 + (0,0,180),0,var_10))
				{
					var_06[var_06.size] = var_10;
				}

				continue;
			}

			var_06[var_06.size] = var_10;
		}
	}

	var_12 = common_scripts\utility::get_array_of_closest(param_00.aimtarget,var_06,undefined,var_0D);
	return var_12;
}

//Function Number: 54
lib_A7C6::targeting_hud_init()
{
	lib_A7C6::targeting_hud_destroy();
	var_00 = 10;
	self.missile_target_icons = [];
	for(var_01 = 0;var_01 < var_00;var_01++)
	{
		var_02 = newclienthudelem(self);
		var_02.x = 0;
		var_02.y = 0;
		var_02.z = 0;
		var_02.alpha = 0;
		var_02.archived = 0;
		var_02.shader = "hud_fofbox_hostile";
		var_02 setshader("hud_fofbox_hostile",450,450);
		var_02 setwaypoint(0,0,0,0);
		var_02 method_8514(0);
		var_02 method_8534(1);
		self.missile_target_icons[var_01] = var_02;
	}
}

//Function Number: 55
lib_A7C6::targeting_hud_destroy()
{
	if(!isdefined(self.missile_target_icons))
	{
		return;
	}

	var_00 = 10;
	for(var_01 = 0;var_01 < var_00;var_01++)
	{
		if(isdefined(self.missile_target_icons[var_01]))
		{
			self.missile_target_icons[var_01] destroy();
		}
	}

	self.missile_target_icons = undefined;
}

//Function Number: 56
lib_A7C6::targeting_hud_think(param_00,param_01)
{
	self endon("disconnect");
	param_01 endon("ms_early_exit");
	param_01 endon("missile_strike_complete");
	param_00 endon("death");
	level endon("game_ended");
	wait(1);
	var_02 = param_01.name;
	param_00.targets = lib_A7C6::getvalidtargetssorted(param_00,1,param_01);
	var_03 = 10;
	var_04 = 5;
	var_05 = 0;
	var_06 = 47;
	for(;;)
	{
		foreach(var_08 in self.missile_target_icons)
		{
			var_08.alpha = 0;
		}

		var_05++;
		if(var_05 > var_04)
		{
			param_00.targets = lib_A7C6::getvalidtargetssorted(param_00,1,param_01);
			var_05 = 0;
		}

		var_0A = self.missile_target_icons[0];
		var_0A.x = self.var_2E6[0];
		var_0A.y = self.var_2E6[1];
		var_0A.z = self.var_2E6[2];
		var_0A.alpha = 1;
		if(var_0A.shader != "hud_fofbox_self")
		{
			var_0A.shader = "hud_fofbox_self";
			var_0A setshader("hud_fofbox_self",450,450);
			var_0A setwaypoint(0,0,0,0);
			var_0A method_8514(0);
			var_0A method_8534(1);
		}

		var_0B = 1;
		var_0C = 0;
		var_0D = level.agentarray;
		if(!isdefined(var_0D))
		{
			var_0D = [];
		}

		var_0E = common_scripts\utility::array_combine(level.var_328,var_0D);
		param_00.targets = common_scripts\utility::array_removeundefined(param_00.targets);
		var_0F = common_scripts\utility::array_remove_array(var_0E,param_00.targets);
		var_10 = [];
		foreach(var_12 in var_0F)
		{
			if(lib_A7C6::player_is_valid_target(var_12))
			{
				var_10[var_10.size] = var_12;
			}
		}

		var_14 = common_scripts\utility::get_array_of_closest(param_00.aimtarget,var_10,undefined,undefined);
		var_0E = common_scripts\utility::array_combine(param_00.targets,var_14);
		foreach(var_16 in var_0E)
		{
			if(!isdefined(var_16))
			{
				continue;
			}

			var_0A = self.missile_target_icons[var_0B];
			if(!isdefined(var_0A))
			{
				break;
			}

			if((isplayer(var_16) || isagent(var_16)) && lib_A7C6::player_is_valid_target(var_16))
			{
				var_0A.x = var_16.var_2E6[0];
				var_0A.y = var_16.var_2E6[1];
				var_0A.z = var_16.var_2E6[2];
				var_0A.alpha = 1;
				var_0B++;
				if(common_scripts\utility::array_contains(param_00.targets,var_16) && var_0A.shader == "hud_fofbox_hostile")
				{
					var_0A.shader = "hud_fofbox_hostile_ms_target";
					var_0A setshader("hud_fofbox_hostile_ms_target",450,450);
					var_0A setwaypoint(0,0,0,0,0);
					var_0A fadeovertime(0.05);
					var_0A method_8514(0);
					var_0A method_8534(1);
					var_0C++;
					continue;
				}

				if(!common_scripts\utility::array_contains(param_00.targets,var_16) && var_0A.shader == "hud_fofbox_hostile_ms_target")
				{
					var_0A.shader = "hud_fofbox_hostile";
					var_0A setshader("hud_fofbox_hostile",450,450);
					var_0A setwaypoint(0,0,0,0);
					var_0A fadeovertime(0.05);
					var_0A method_8514(0);
					var_0A method_8534(1);
				}
			}
		}

		if(var_0C == 1)
		{
			param_00 playsoundtoplayer("mstrike_locked_on_single",param_00.owner);
		}

		if(var_0C > 1)
		{
			param_00 playsoundtoplayer("mstrike_locked_on_multiple",param_00.owner);
		}

		wait 0.05;
	}
}

//Function Number: 57
lib_A7C6::init_hud(param_00,param_01)
{
	self endon("disconnect");
	thread lib_A7C6::targeting_hud_init();
	thread lib_A7C6::targeting_hud_think(param_00,param_01);
	self setclientomnvar("ui_predator_missile",1);
	self setclientomnvar("ui_predator_missile_count",param_01.rocketammo);
	var_02 = param_01.name;
	if(var_02 == "remotemissile_projectile_mp")
	{
		self setclientomnvar("ui_predator_missile_type",1);
	}
	else if(var_02 == "remotemissile_projectile_gas_mp")
	{
		self setclientomnvar("ui_predator_missile_type",2);
	}
	else if(var_02 == "remotemissile_projectile_cluster_parent_mp")
	{
		if(param_01.clusterhellfire)
		{
			self setclientomnvar("ui_predator_missile_type",4);
		}
		else
		{
			self setclientomnvar("ui_predator_missile_type",3);
		}
	}

	wait 0.05;
	lib_A7C6::hud_update_fire_text(param_00,param_01);
	maps\mp\killstreaks\_aerial_utility::playerenablestreakstatic();
}

//Function Number: 58
lib_A7C6::remove_hud()
{
	self setclientomnvar("ui_predator_missile",0);
	self setclientomnvar("ui_predator_missile_text",0);
	self setclientomnvar("ui_predator_missile_type",0);
	self setclientomnvar("ui_predator_missile_count",0);
	lib_A7C6::targeting_hud_destroy();
	maps\mp\killstreaks\_aerial_utility::playerdisablestreakstatic();
}

//Function Number: 59
lib_A7C6::hud_update_fire_text(param_00,param_01)
{
	self setclientomnvar("ui_predator_missile_count",param_01.rocketammo);
	if(param_01.rocketammo > 0)
	{
		self setclientomnvar("ui_predator_missile_text",param_01.rocketammo);
		return;
	}

	if(param_01.clustermissile)
	{
		if(!self.clusterdeployed)
		{
			self setclientomnvar("ui_predator_missile_text",5);
			return;
		}

		self setclientomnvar("ui_predator_missile_text",6);
		return;
	}

	if(!self.missileboostused)
	{
		self setclientomnvar("ui_predator_missile_text",3);
		return;
	}

	self setclientomnvar("ui_predator_missile_text",4);
}

//Function Number: 60
lib_A7C6::hud_watch_for_boost_active(param_00,param_01)
{
	self endon("disconnect");
	param_01 endon("missile_strike_complete");
	param_01 endon("ms_early_exit");
	self waittill("FireButtonPressed");
	self playrumbleonentity("sniper_fire");
	self.missileboostused = 1;
	lib_A7C6::hud_update_fire_text(param_00,param_01);
}

//Function Number: 61
lib_A7C6::fade_to_white()
{
	self endon("disconnect");
	if(!isdefined(self.strikewhitefade))
	{
		self.strikewhitefade = newclienthudelem(self);
		self.strikewhitefade.x = 0;
		self.strikewhitefade.y = 0;
		self.strikewhitefade setshader("white",640,480);
		self.strikewhitefade.alignx = "left";
		self.strikewhitefade.aligny = "top";
		self.strikewhitefade.horzalign = "fullscreen";
		self.strikewhitefade.vertalign = "fullscreen";
		self.strikewhitefade.alpha = 0;
	}

	self.strikewhitefade fadeovertime(0.15);
	self.strikewhitefade.alpha = 1;
	wait(0.15);
	self notify("full_white");
	self.strikewhitefade fadeovertime(0.2);
	self.strikewhitefade.alpha = 0;
	wait(0.2);
	self notify("fade_white_over");
	self.strikewhitefade destroy();
}

//Function Number: 62
lib_A7C6::playeraddnotifycommands()
{
	self notifyonplayercommand("FireButtonPressed","+attack");
	self notifyonplayercommand("FireButtonPressed","+attack_akimbo_accessible");
}

//Function Number: 63
lib_A7C6::playerremovenotifycommands()
{
	self method_849C("FireButtonPressed","+attack");
	self method_849C("FireButtonPressed","+attack_akimbo_accessible");
}