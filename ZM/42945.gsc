/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42945.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 32
 * Decompile Time: 19 ms
 * Timestamp: 4/20/2022 8:24:14 PM
*******************************************************************/

//Function Number: 1
lib_A7C1::init()
{
	level._effect["emp_third_person_sparks"] = loadfx("vfx/explosion/electrical_sparks_small_emp_runner");
	if(level.multiteambased)
	{
		for(var_00 = 0;var_00 < level.teamnamelist.size;var_00++)
		{
			level.var_91E7[level.teamnamelist[var_00]] = 0;
		}
	}
	else
	{
		level.var_91E7["allies"] = 0;
		level.var_91E7["axis"] = 0;
	}

	level.empowner = undefined;
	level.empplayer = undefined;
	level.empstreaksdisabled = 0;
	level.empequipmentdisabled = 0;
	level.empassistpoints = 0;
	level.empexodisabled = 0;
	level.var_3090 = 0;
	level thread lib_A7C1::emp_playertracker();
	level.killstreakfuncs["emp"] = ::lib_A7C1::emp_use;
	level thread lib_A7C1::onplayerconnect();
}

//Function Number: 2
lib_A7C1::getmodulelineemp(param_00)
{
	var_01 = common_scripts\utility::array_contains(param_00,"emp_streak_kill");
	var_02 = common_scripts\utility::array_contains(param_00,"emp_equipment_kill");
	var_03 = common_scripts\utility::array_contains(param_00,"emp_exo_kill");
	if(!var_01 && !var_02 && !var_03)
	{
		return "_01";
	}

	if(var_01 && !var_02 && !var_03)
	{
		return "_02";
	}

	if(!var_01 && var_02 && !var_03)
	{
		return "_03";
	}

	if(!var_01 && !var_02 && var_03)
	{
		return "_04";
	}

	if(var_01 && var_02 && !var_03)
	{
		return "_05";
	}

	if(var_01 && !var_02 && var_03)
	{
		return "_06";
	}

	if(!var_01 && var_02 && var_03)
	{
		return "_07";
	}

	return "_08";
}

//Function Number: 3
lib_A7C1::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A7C1::onplayerspawned();
	}
}

//Function Number: 4
lib_A7C1::onplayerspawned()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		if(lib_A7C1::issystemhacked() && !maps\mp\_utility::_hasperk("specialty_empimmune"))
		{
			lib_A7C1::applyemp();
		}

		self waittill("death");
		if(self.inliveplayerkillstreak == "spectator" || lib_A7C1::issystemhacked())
		{
			lib_A7C1::removeemp();
		}
	}
}

//Function Number: 5
lib_A7C1::issystemhacked()
{
	return (level.teambased && level.var_91E7[self.inliveplayerkillstreak]) || !level.teambased && isdefined(level.empplayer) && level.empplayer != self;
}

//Function Number: 6
lib_A7C1::applyemp(param_00)
{
	var_01 = 2;
	if(level.empexodisabled)
	{
		var_01 = 1;
		if(maps\mp\_utility::isaugmentedgamemode())
		{
			maps\mp\_utility::playerallowhighjump(0,"emp");
			maps\mp\_utility::playerallowhighjumpdrop(0,"emp");
			maps\mp\_utility::playerallowboostjump(0,"emp");
			maps\mp\_utility::playerallowpowerslide(0,"emp");
			maps\mp\_utility::playerallowdodge(0,"emp");
		}
	}

	self.empscrambleid = maps\mp\gametypes\_scrambler::playersethudempscrambled(level.empendtime,var_01,"emp");
	self setsystemhack("digital_distort_mp");
	self method_8064(1,1);
	self.empon = 1;
	self notify("applyEMPkillstreak");
	self setempjammed(1,level.empequipmentdisabled);
	if(isdefined(param_00) && param_00 == "emp_update")
	{
		self playsoundtoplayer("emp_system_hacked",self);
	}

	thread lib_A7C1::dynamicdistortion();
	thread lib_A7C1::playerdelaystartsparkseffect();
}

//Function Number: 7
lib_A7C1::playerdelaystartsparkseffect()
{
	self endon("death");
	self endon("disconnect");
	level endon("emp_update");
	if(!isdefined(self.costume))
	{
		self waittill("player_model_set");
	}

	if(!isdefined(self.empfx))
	{
		self.empfx = function_02C1(common_scripts\utility::getfx("emp_third_person_sparks"),self,"j_shoulder_ri");
		triggerfx(self.empfx);
		function_0155(self.empfx,1);
	}
}

//Function Number: 8
lib_A7C1::dynamicdistortion()
{
	self notify("dynamicDistortion");
	self endon("death");
	self endon("disconnect");
	self endon("dynamicDistortion");
	wait(0.1);
	var_00 = 0;
	var_01 = 0.55;
	var_02 = 0.2;
	var_03 = var_01 - var_02;
	var_04 = 0.2;
	var_05 = level.empendtime - gettime() / 1000 - 0.2;
	while(var_00 < var_05)
	{
		if(isdefined(self.empon) && !self.empon)
		{
			break;
		}

		var_06 = var_05 - var_00 / var_05;
		self method_8064(var_06 * var_03 + var_02,1);
		var_00 = var_00 + var_04;
		wait(var_04);
	}

	self method_8064(0,0);
}

//Function Number: 9
lib_A7C1::removeemp(param_00)
{
	if(maps\mp\_utility::isaugmentedgamemode())
	{
		maps\mp\_utility::playerallowhighjump(1,"emp");
		maps\mp\_utility::playerallowhighjumpdrop(1,"emp");
		maps\mp\_utility::playerallowboostjump(1,"emp");
		maps\mp\_utility::playerallowpowerslide(1,"emp");
		maps\mp\_utility::playerallowdodge(1,"emp");
	}

	if(isdefined(self.empscrambleid))
	{
		maps\mp\gametypes\_scrambler::playersethudempscrambledoff(self.empscrambleid);
		self.empscrambleid = undefined;
	}
	else if(self.inliveplayerkillstreak == "spectator")
	{
		self setclientomnvar("ui_exo_reboot_end_time",0);
		self setclientomnvar("ui_exo_reboot_type",0);
	}

	self method_8064(0,0);
	self.empon = undefined;
	self notify("removeEMPkillstreak");
	self setempjammed(0);
	if(isdefined(param_00) && param_00 == "emp_update")
	{
		self playsoundtoplayer("emp_system_reboot",self);
	}

	if(isdefined(self.empfx))
	{
		self.empfx delete();
	}
}

//Function Number: 10
lib_A7C1::emp_use(param_00,param_01)
{
	var_02 = self.connectedpostgame["team"];
	if(level.teambased)
	{
		var_03 = level.matchbonus[var_02];
		thread lib_A7C1::emp_jamteam(var_03,param_01);
	}
	else
	{
		thread lib_A7C1::emp_jamplayers(self,param_01);
	}

	maps\mp\_matchdata::logkillstreakevent("emp",self.var_2E6);
	maps\mp\gametypes\_missions::processchallenge("ch_streak_emp",1);
	return 1;
}

//Function Number: 11
lib_A7C1::emp_gettimeoutfrommodules(param_00)
{
	var_01 = 20;
	if(common_scripts\utility::array_contains(param_00,"emp_time_1") && common_scripts\utility::array_contains(param_00,"emp_time_2"))
	{
		var_01 = 40;
	}
	else if(common_scripts\utility::array_contains(param_00,"emp_time_1") || common_scripts\utility::array_contains(param_00,"emp_time_2"))
	{
		var_01 = 30;
	}

	if(isdefined(level.var_511A) && level.var_511A)
	{
		return 60;
	}

	return var_01;
}

//Function Number: 12
lib_A7C1::emp_artifacts(param_00)
{
	self endon("disconnect");
	self notify("EMP_Artifacts");
	self endon("EMP_Artifacts");
	if(isdefined(level.var_511A) && level.var_511A)
	{
		wait(0.1);
	}

	self setclientomnvar("ui_hud_static",2);
	wait(param_00);
	self setclientomnvar("ui_hud_static",0);
}

//Function Number: 13
lib_A7C1::emp_jamteam(param_00,param_01)
{
	level endon("game_ended");
	if(!isdefined(level.var_511A))
	{
		thread maps\mp\_utility::teamplayercardsplash("used_emp",self);
	}

	level notify("EMP_JamTeam" + param_00);
	level endon("EMP_JamTeam" + param_00);
	level.empowner = self;
	var_02 = lib_A7C1::emp_gettimeoutfrommodules(param_01);
	foreach(var_04 in level.var_328)
	{
		var_04 method_82F4("emp_big_activate");
		if(var_04.inliveplayerkillstreak != param_00)
		{
			continue;
		}

		if(var_04 maps\mp\_utility::_hasperk("specialty_empimmune"))
		{
			continue;
		}

		if(var_04 maps\mp\_utility::_hasperk("specialty_localjammer"))
		{
			var_04 method_8212(1);
		}

		var_04 thread lib_A7C1::emp_artifacts(var_02);
	}

	visionsetnaked("coup_sunblind",0.1);
	if(common_scripts\utility::array_contains(param_01,"emp_flash"))
	{
		foreach(var_04 in level.var_328)
		{
			if(var_04.inliveplayerkillstreak != param_00 || !maps\mp\_utility::isreallyalive(var_04) || isdefined(var_04.usingremote))
			{
				continue;
			}

			if(var_04 maps\mp\_utility::_hasperk("specialty_empimmune"))
			{
				continue;
			}

			var_04 thread maps\mp\_flashgrenades::applyflash(2.5,0.75);
		}
	}

	wait(0.1);
	visionsetnaked("coup_sunblind",0);
	if(isdefined(level.nukedetonated))
	{
		visionsetnaked(level.nukevisionset,3);
	}
	else
	{
		visionsetnaked("",3);
	}

	level.var_91E7[param_00] = 1;
	level.empstreaksdisabled = common_scripts\utility::array_contains(param_01,"emp_streak_kill");
	level.empequipmentdisabled = common_scripts\utility::array_contains(param_01,"emp_equipment_kill");
	level.empassistpoints = common_scripts\utility::array_contains(param_01,"emp_assist");
	level.empexodisabled = common_scripts\utility::array_contains(param_01,"emp_exo_kill");
	level notify("emp_update");
	level.empendtime = gettime() + int(var_02 * 1000);
	if(level.empstreaksdisabled)
	{
		level lib_A7C1::destroyactivestreakvehicles(self,param_00);
	}

	if(level.empequipmentdisabled)
	{
		level lib_A7C1::destroyactiveequipmentvehicles(self,param_00);
	}

	level thread lib_A7C1::keepemptimeremaining(var_02);
	maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause(var_02);
	level.var_91E7[param_00] = 0;
	foreach(var_04 in level.var_328)
	{
		if(var_04.inliveplayerkillstreak != param_00)
		{
			continue;
		}

		if(var_04 maps\mp\_utility::_hasperk("specialty_localjammer"))
		{
			var_04 method_8212(0);
		}
	}

	level.empowner = undefined;
	level.empstreaksdisabled = 0;
	level.empequipmentdisabled = 0;
	level.empassistpoints = 0;
	level.empexodisabled = 0;
	level notify("emp_update");
}

//Function Number: 14
lib_A7C1::emp_jamplayers(param_00,param_01)
{
	level notify("EMP_JamPlayers");
	level endon("EMP_JamPlayers");
	level.empowner = param_00;
	var_02 = lib_A7C1::emp_gettimeoutfrommodules(param_01);
	foreach(var_04 in level.var_328)
	{
		var_04 method_82F4("emp_big_activate");
		if(var_04 == param_00)
		{
			continue;
		}

		if(var_04 maps\mp\_utility::_hasperk("specialty_localjammer"))
		{
			var_04 method_8212(1);
		}

		var_04 thread lib_A7C1::emp_artifacts(var_02);
	}

	visionsetnaked("coup_sunblind",0.1);
	if(common_scripts\utility::array_contains(param_01,"emp_flash"))
	{
		foreach(var_04 in level.var_328)
		{
			if(var_04 == param_00 || !maps\mp\_utility::isreallyalive(var_04) || isdefined(var_04.usingremote))
			{
				continue;
			}

			var_04 thread maps\mp\_flashgrenades::applyflash(2.5,0.75);
		}
	}

	wait(0.1);
	visionsetnaked("coup_sunblind",0);
	if(isdefined(level.nukedetonated))
	{
		visionsetnaked(level.nukevisionset,3);
	}
	else
	{
		visionsetnaked("",3);
	}

	level notify("emp_update");
	level.empplayer = param_00;
	level.empplayer thread lib_A7C1::empplayerffadisconnect();
	level.empstreaksdisabled = common_scripts\utility::array_contains(param_01,"emp_streak_kill");
	level.empequipmentdisabled = common_scripts\utility::array_contains(param_01,"emp_equipment_kill");
	level.empassistpoints = common_scripts\utility::array_contains(param_01,"emp_assist");
	level.empexodisabled = common_scripts\utility::array_contains(param_01,"emp_exo_kill");
	level.empendtime = gettime() + int(var_02 * 1000);
	if(level.empstreaksdisabled)
	{
		level lib_A7C1::destroyactivestreakvehicles(param_00);
	}

	if(level.empequipmentdisabled)
	{
		level lib_A7C1::destroyactiveequipmentvehicles(param_00);
	}

	level notify("emp_update");
	level thread lib_A7C1::keepemptimeremaining(var_02);
	maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause(var_02);
	foreach(var_04 in level.var_328)
	{
		if(var_04 == param_00)
		{
			continue;
		}

		if(var_04 maps\mp\_utility::_hasperk("specialty_localjammer"))
		{
			var_04 method_8212(0);
		}
	}

	level.empplayer = undefined;
	level.empowner = undefined;
	level.empstreaksdisabled = 0;
	level.empequipmentdisabled = 0;
	level.empassistpoints = 0;
	level.empexodisabled = 0;
	level notify("emp_update");
	level notify("emp_ended");
}

//Function Number: 15
lib_A7C1::keepemptimeremaining(param_00)
{
	level notify("keepEMPTimeRemaining");
	level endon("keepEMPTimeRemaining");
	level endon("emp_ended");
	level.var_3090 = int(param_00);
	while(level.var_3090)
	{
		wait(1);
		level.var_3090--;
	}
}

//Function Number: 16
lib_A7C1::empplayerffadisconnect()
{
	level endon("EMP_JamPlayers");
	level endon("emp_ended");
	self waittill("disconnect");
	level notify("emp_update");
}

//Function Number: 17
lib_A7C1::emp_playertracker()
{
	for(;;)
	{
		var_00 = level common_scripts\utility::waittill_any_return_no_endon_death("joined_team","emp_update","game_ended");
		foreach(var_02 in level.var_328)
		{
			if(var_02.inliveplayerkillstreak == "spectator")
			{
				var_03 = var_02 getspectatingplayer();
				if(!isdefined(var_03) || !var_03 lib_A7C1::issystemhacked())
				{
					var_02 lib_A7C1::removeemp(var_00);
				}

				continue;
			}

			if(var_02 maps\mp\_utility::_hasperk("specialty_empimmune"))
			{
				continue;
			}

			if(maps\mp\_utility::isreallyalive(var_02) && var_02 lib_A7C1::issystemhacked() && !level.gameended)
			{
				var_02 lib_A7C1::applyemp(var_00);
				continue;
			}

			var_02 lib_A7C1::removeemp(var_00);
		}

		if(level.gameended)
		{
			return;
		}
	}
}

//Function Number: 18
lib_A7C1::destroyactivevehicles(param_00,param_01)
{
	thread lib_A7C1::destroyactivestreakvehicles(param_00,param_01);
	thread lib_A7C1::destroyactiveequipmentvehicles(param_00,param_01);
}

//Function Number: 19
lib_A7C1::destroyactivestreakvehicles(param_00,param_01)
{
	thread lib_A7C1::destroyactivehelis(param_00,param_01);
	thread lib_A7C1::destroyactivelittlebirds(param_00,param_01);
	thread lib_A7C1::destroyactiveturrets(param_00,param_01);
	thread lib_A7C1::destroyactiverockets(param_00,param_01);
	thread lib_A7C1::destroyactiveuavs(param_00,param_01);
	thread lib_A7C1::destroyactiveugvs(param_00,param_01);
	thread lib_A7C1::destroyactiveorbitallasers(param_00,param_01);
	thread destroyactivegoliaths(param_00,param_01);
}

//Function Number: 20
lib_A7C1::destroyactiveequipmentvehicles(param_00,param_01)
{
	thread lib_A7C1::destroyactivedrones(param_00,param_01);
}

//Function Number: 21
lib_A7C1::destroyempobjectsinradius(param_00,param_01,param_02,param_03)
{
	thread lib_A7C1::destroyactivehelis(param_00,param_01,param_02,param_03);
	thread lib_A7C1::destroyactivelittlebirds(param_00,param_01,param_02,param_03);
	thread lib_A7C1::destroyactiveturrets(param_00,param_01,param_02,param_03);
	thread lib_A7C1::destroyactiverockets(param_00,param_01,param_02,param_03);
	thread lib_A7C1::destroyactiveuavs(param_00,param_01,param_02,param_03);
	thread lib_A7C1::destroyactiveugvs(param_00,param_01,param_02,param_03);
	thread lib_A7C1::destroyactiveorbitallasers(param_00,param_01,param_02,param_03);
	thread lib_A7C1::destroyactivedrones(param_00,param_01,param_02,param_03);
}

//Function Number: 22
lib_A7C1::destroyactivehelis(param_00,param_01,param_02,param_03)
{
	var_04 = "MOD_EXPLOSIVE";
	var_05 = "killstreak_emp_mp";
	var_06 = 5000;
	var_07 = level.helis;
	if(isdefined(level.orbitalsupport_planemodel))
	{
		var_07[var_07.size] = level.orbitalsupport_planemodel;
	}

	foreach(var_09 in var_07)
	{
		if(level.teambased && isdefined(param_01))
		{
			if(isdefined(var_09.inliveplayerkillstreak) && var_09.inliveplayerkillstreak != param_01)
			{
				continue;
			}
		}
		else if(isdefined(var_09.owner) && var_09.owner == param_00)
		{
			continue;
		}

		if(isdefined(param_02) && isdefined(param_03))
		{
			var_0A = param_02;
			if(distancesquared(var_09.var_2E6,param_02) > param_03 * param_03)
			{
				continue;
			}
		}

		var_06 = var_09.var_275 + 1;
		var_09 dodamage(var_06,var_09.var_2E6,param_00,param_00,var_04,var_05);
		wait(0.05);
	}
}

//Function Number: 23
lib_A7C1::destroyactivelittlebirds(param_00,param_01,param_02,param_03)
{
	var_04 = "MOD_EXPLOSIVE";
	var_05 = "killstreak_emp_mp";
	var_06 = 5000;
	var_07 = common_scripts\utility::array_combine(level.planes,level.littlebirds);
	foreach(var_09 in level.carepackagedrones)
	{
		if(isdefined(var_09.crate))
		{
			var_07[var_07.size] = var_09.crate;
		}
	}

	foreach(var_0C in var_07)
	{
		if(level.teambased && isdefined(param_01))
		{
			if(isdefined(var_0C.inliveplayerkillstreak) && var_0C.inliveplayerkillstreak != param_01)
			{
				continue;
			}
		}
		else if(isdefined(var_0C.owner) && var_0C.owner == param_00)
		{
			continue;
		}

		if(isdefined(param_02) && isdefined(param_03))
		{
			var_0D = param_02;
			if(distancesquared(var_0C.var_2E6,param_02) > param_03 * param_03)
			{
				continue;
			}
		}

		var_06 = var_0C.var_275 + 1;
		if(isdefined(var_0C.cratetype))
		{
			var_0C = var_0C.enemymodel;
		}

		var_0C dodamage(var_06,var_0C.var_2E6,param_00,param_00,var_04,var_05);
		wait(0.05);
	}
}

//Function Number: 24
lib_A7C1::destroyactiveturrets(param_00,param_01,param_02,param_03)
{
	var_04 = "MOD_EXPLOSIVE";
	var_05 = "killstreak_emp_mp";
	var_06 = 5000;
	foreach(var_08 in level.turrets)
	{
		if(level.teambased && isdefined(param_01))
		{
			if(isdefined(var_08.inliveplayerkillstreak) && var_08.inliveplayerkillstreak != param_01)
			{
				continue;
			}
		}
		else if(isdefined(var_08.owner) && var_08.owner == param_00)
		{
			continue;
		}

		if(isdefined(param_02) && isdefined(param_03))
		{
			var_09 = param_02;
			if(distancesquared(var_08.var_2E6,param_02) > param_03 * param_03)
			{
				continue;
			}
		}

		var_06 = var_08.var_275 + 1;
		var_08 dodamage(var_06,var_08.var_2E6,param_00,param_00,var_04,var_05);
	}

	if(isdefined(level.var_511A) && level.var_511A)
	{
		foreach(var_0C in level.var_328)
		{
			if(isdefined(var_0C.iscarrying) && var_0C.iscarrying)
			{
				var_0C notify("force_cancel_placement");
			}
		}
	}
}

//Function Number: 25
lib_A7C1::destroyactiverockets(param_00,param_01,param_02,param_03)
{
	var_04 = "MOD_EXPLOSIVE";
	var_05 = "killstreak_emp_mp";
	var_06 = 5000;
	foreach(var_08 in level.rockets)
	{
		if(isdefined(var_08.fx_origin) && lib_A7C1::skiprocketemp(var_08.fx_origin))
		{
			continue;
		}

		if(level.teambased && isdefined(param_01))
		{
			if(isdefined(var_08.inliveplayerkillstreak) && var_08.inliveplayerkillstreak != param_01)
			{
				continue;
			}
		}
		else if(isdefined(var_08.owner) && var_08.owner == param_00)
		{
			continue;
		}

		if(isdefined(param_02) && isdefined(param_03))
		{
			var_09 = param_02;
			if(distancesquared(var_08.var_2E6,param_02) > param_03 * param_03)
			{
				continue;
			}
		}

		if(lib_A7C1::shoulddamagerocket(var_08))
		{
			var_06 = var_08.var_275 + 1;
			var_08 dodamage(var_06,var_08.var_2E6,param_00,param_00,var_04,var_05);
		}
		else
		{
			playfx(level.remotemissile_fx["explode"],var_08.var_2E6);
			var_08 delete();
		}

		wait(0.05);
	}
}

//Function Number: 26
lib_A7C1::shoulddamagerocket(param_00)
{
	return isdefined(param_00.damagecallback);
}

//Function Number: 27
lib_A7C1::skiprocketemp(param_00)
{
	return param_00 == "orbital_carepackage_pod_mp";
}

//Function Number: 28
lib_A7C1::destroyactiveuavs(param_00,param_01,param_02,param_03)
{
	var_04 = "MOD_EXPLOSIVE";
	var_05 = "killstreak_emp_mp";
	var_06 = 5000;
	var_07 = level.uavmodels;
	if(level.teambased && isdefined(param_01))
	{
		var_07 = level.uavmodels[param_01];
	}

	foreach(var_09 in var_07)
	{
		if(level.teambased && isdefined(param_01))
		{
		}
		else if(isdefined(var_09.owner) && var_09.owner == param_00)
		{
			continue;
		}

		if(isdefined(param_02) && isdefined(param_03))
		{
			var_0A = param_02;
			if(distancesquared(var_09.var_2E6,param_02) > param_03 * param_03)
			{
				continue;
			}
		}

		var_06 = var_09.var_275 + 1;
		var_09 dodamage(var_06,var_09.var_2E6,param_00,param_00,var_04,var_05);
		wait(0.05);
	}
}

//Function Number: 29
lib_A7C1::destroyactiveugvs(param_00,param_01,param_02,param_03)
{
	var_04 = "MOD_EXPLOSIVE";
	var_05 = "killstreak_emp_mp";
	var_06 = 5000;
	foreach(var_08 in level.ugvs)
	{
		if(level.teambased && isdefined(param_01))
		{
			if(isdefined(var_08.inliveplayerkillstreak) && var_08.inliveplayerkillstreak != param_01)
			{
				continue;
			}
		}
		else if(isdefined(var_08.owner) && var_08.owner == param_00)
		{
			continue;
		}

		if(isdefined(param_02) && isdefined(param_03))
		{
			var_09 = param_02;
			if(distancesquared(var_08.var_2E6,param_02) > param_03 * param_03)
			{
				continue;
			}
		}

		var_06 = var_08.var_275 + 1;
		var_08 dodamage(var_06,var_08.var_2E6,param_00,param_00,var_04,var_05);
		wait(0.05);
	}
}

//Function Number: 30
lib_A7C1::destroyactivedrones(param_00,param_01,param_02,param_03)
{
	var_04 = "MOD_EXPLOSIVE";
	var_05 = "killstreak_emp_mp";
	var_06 = 5000;
	var_07 = common_scripts\utility::array_combine(level.trackingdrones,level.explosivedrones);
	foreach(var_09 in var_07)
	{
		if(level.teambased && isdefined(param_01))
		{
			if(isdefined(var_09.inliveplayerkillstreak) && var_09.inliveplayerkillstreak != param_01)
			{
				continue;
			}
		}
		else if(isdefined(var_09.owner) && var_09.owner == param_00)
		{
			continue;
		}

		if(isdefined(param_02) && isdefined(param_03))
		{
			var_0A = param_02;
			if(distancesquared(var_09.var_2E6,param_02) > param_03 * param_03)
			{
				continue;
			}
		}

		var_06 = var_09.var_275 + 1;
		var_09 dodamage(var_06,var_09.var_2E6,param_00,param_00,var_04,var_05);
	}

	foreach(var_0D in level.grenades)
	{
		if(!isdefined(var_0D.fx_origin) || !issubstr(var_0D.fx_origin,"explosive_drone_mp"))
		{
			continue;
		}

		if(level.teambased && isdefined(param_01))
		{
			if(isdefined(var_0D.inliveplayerkillstreak) && var_0D.inliveplayerkillstreak != param_01)
			{
				continue;
			}
		}
		else if(isdefined(var_0D.owner) && var_0D.owner == param_00)
		{
			continue;
		}

		if(isdefined(param_02) && isdefined(param_03))
		{
			var_0A = param_02;
			if(distancesquared(var_0D.var_2E6,param_02) > param_03 * param_03)
			{
				continue;
			}
		}

		var_0D thread maps\mp\_explosive_drone::explosivegrenadedeath();
	}
}

//Function Number: 31
lib_A7C1::destroyactiveorbitallasers(param_00,param_01,param_02,param_03)
{
	var_04 = "MOD_EXPLOSIVE";
	var_05 = "killstreak_emp_mp";
	var_06 = 5000;
	var_07 = (0,0,0);
	var_08 = (0,0,0);
	var_09 = "";
	var_0A = "";
	var_0B = "";
	var_0C = undefined;
	foreach(var_0E in level.orbital_lasers)
	{
		if(level.teambased && isdefined(param_01))
		{
			if(isdefined(var_0E.inliveplayerkillstreak) && var_0E.inliveplayerkillstreak != param_01)
			{
				continue;
			}
		}
		else if(isdefined(var_0E.owner) && var_0E.owner == param_00)
		{
			continue;
		}

		var_0E notify("death",param_00,var_04,var_05);
		wait(0.05);
	}
}

//Function Number: 32
destroyactivegoliaths(param_00,param_01)
{
	foreach(var_03 in level.var_328)
	{
		if(var_03 maps\mp\_utility::isjuggernaut())
		{
			if(level.teambased && isdefined(param_01))
			{
				if(isdefined(var_03.inliveplayerkillstreak) && var_03.inliveplayerkillstreak != param_01)
				{
					continue;
				}
			}

			if(isdefined(level.var_511A) && level.var_511A)
			{
				var_03 maps\mp\_snd_common_mp::snd_message("goliath_self_destruct");
				playfx(common_scripts\utility::getfx("goliath_self_destruct"),var_03.var_2E6,anglestoup(var_03.var_41));
				var_03 thread [[ level.hordehandlejuggdeath ]]();
				continue;
			}

			var_03 thread maps\mp\killstreaks\_juggernaut::playerkillheavyexo(var_03.var_2E6,param_00,"MOD_EXPLOSIVE","killstreak_goliathsd_mp");
		}
	}
}