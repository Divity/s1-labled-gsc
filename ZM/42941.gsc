/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42941.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 39
 * Decompile Time: 18 ms
 * Timestamp: 4/20/2022 8:24:13 PM
*******************************************************************/

//Function Number: 1
lib_A7BD::init()
{
	level._effect["assault_c4_explode"] = loadfx("vfx/vehicle/vehicle_assault_drone_rocket");
	level._effect["remote_tank_explode"] = loadfx("vfx/explosion/vehicle_assault_drone_death");
	level._effect["c4_forward_blur"] = loadfx("vfx/unique/forward_view_radial_blur");
	level._effect["assault_drone_exhaust"] = loadfx("vfx/vehicle/vehicle_mp_assault_drone_exhaust");
	level._effect["assault_drone_thruster"] = loadfx("vfx/vehicle/vehicle_mp_assault_drone_thruster");
	level._effect["assault_drone_marker"] = loadfx("vfx/ui/vfx_marker_drone_assault");
	level._effect["assault_drone_exhaust_bottom"] = loadfx("vfx/vehicle/vehicle_mp_assault_drone_exhaust");
	level.killstreakfuncs["assault_ugv"] = ::lib_A7BD::tryuseassaultdrone;
	level.killstreakwieldweapons["drone_assault_remote_turret_mp"] = "assault_ugv";
	level.killstreakwieldweapons["ugv_missile_mp"] = "assault_ugv";
	level.killstreakwieldweapons["assaultdrone_c4_mp"] = "assault_ugv";
	level.killstreakwieldweapons["killstreak_terrace_mp"] = "mp_terrace";
	thread maps\mp\killstreaks\_assaultdrone_ai::assault_vehicle_ai_init();
	game["dialog"]["ks_adrone_destroyed"] = "ks_adrone_destroyed";
}

//Function Number: 2
lib_A7BD::getdronespawnpoint(param_00)
{
	var_01 = undefined;
	var_02 = undefined;
	var_03 = undefined;
	var_04 = spawnstruct();
	var_04.placementok = 1;
	if(common_scripts\utility::array_contains(param_00,"mp_terrace"))
	{
		var_05 = getent("killstreak_orbit_initial","targetname");
		var_06 = getent("killstreak_orbit_lookat","targetname");
		if(isdefined(var_05) && isdefined(var_06))
		{
			var_04.var_2E6 = var_05.var_2E6;
			var_04.var_41 = vectortoangles(var_06.var_2E6 - var_05.var_2E6);
		}
		else
		{
			var_07 = common_scripts\utility::getstruct("mp_terrace_killstreak_start","targetname");
			var_04.var_2E6 = var_07.var_2E6;
			var_04.var_41 = var_07.var_41;
		}
	}
	else
	{
		var_04 = maps\mp\killstreaks\_drone_common::dronegetspawnpoint();
	}

	return var_04;
}

//Function Number: 3
lib_A7BD::tryuseassaultdrone(param_00,param_01)
{
	if(isdefined(level.var_511A) && level.var_511A)
	{
		if(isdefined(self.aerialdrone))
		{
			self.aerialdrone notify("death");
		}
	}

	var_02 = 1;
	if(maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + var_02 >= maps\mp\_utility::maxvehiclesallowed())
	{
		self iprintlnbold(&"MP_TOO_MANY_VEHICLES");
		return 0;
	}

	maps\mp\_utility::incrementfauxvehiclecount();
	var_03 = lib_A7BD::getdronespawnpoint(param_01);
	if(!var_03.placementok)
	{
		self iprintlnbold(&"MP_DRONE_PLACEMENT_INVALID");
		maps\mp\_utility::decrementfauxvehiclecount();
		return 0;
	}

	var_04 = common_scripts\utility::array_contains(param_01,"assault_ugv_ai");
	if(!var_04)
	{
		common_scripts\utility::_disableweaponswitch();
		var_05 = maps\mp\killstreaks\_killstreaks::initridekillstreak("assault_ugv");
		if(var_05 != "success")
		{
			common_scripts\utility::_enableweaponswitch();
			maps\mp\_utility::decrementfauxvehiclecount();
			return 0;
		}

		maps\mp\_utility::setusingremote("assault_ugv");
	}

	var_06 = lib_A7BD::createassaultuav(param_00,param_01,var_03.var_2E6,var_03.var_41);
	if(!var_04)
	{
		common_scripts\utility::_enableweaponswitch();
		self switchtoweapon("killstreak_predator_missile_mp");
	}

	if(isdefined(var_06))
	{
		if(common_scripts\utility::array_contains(param_01,"mp_terrace"))
		{
			maps\mp\_matchdata::logkillstreakevent("mp_terrace",self.var_2E6);
			thread maps\mp\_utility::teamplayercardsplash("used_mp_terrace",self);
		}
		else
		{
			maps\mp\_matchdata::logkillstreakevent("assault_ugv",self.var_2E6);
			thread maps\mp\_utility::teamplayercardsplash("used_assault_ugv",self);
		}

		if(isdefined(level.var_511A) && level.var_511A)
		{
			self.aerialdrone = var_06;
		}

		return 1;
	}

	return 0;
}

//Function Number: 4
lib_A7BD::createassaultuav(param_00,param_01,param_02,param_03)
{
	var_04 = common_scripts\utility::array_contains(param_01,"assault_ugv_mg") || common_scripts\utility::array_contains(param_01,"assault_ugv_rockets") || common_scripts\utility::array_contains(param_01,"mp_terrace");
	var_05 = common_scripts\utility::array_contains(param_01,"mp_terrace");
	var_06 = "assault_uav_mp";
	var_07 = 30;
	if(var_04)
	{
		var_06 = "mg_assault_uav_mp";
		var_07 = 45;
	}

	var_08 = "vehicle_atlas_aerial_drone_01_assult_mp_noturret_clr_50p";
	if(!var_04)
	{
		var_08 = "vehicle_atlas_aerial_drone_01_patrol_mp_static_clr_01_50p";
	}

	if(var_05)
	{
		var_06 = "assault_uav_mp_terrace";
		var_08 = "vehicle_sniper_drone_cloak_mp";
		var_07 = 30;
	}

	var_09 = spawnhelicopter(self,param_02,param_03,var_06,var_08);
	if(!isdefined(var_09))
	{
		return;
	}

	thread lib_A7BD::setupcommonassaultdroneproperties(var_09,param_00,var_07,param_01);
	var_09.getstingertargetposfunc = ::lib_A7BD::assault_drone_stinger_target_pos;
	return var_09;
}

//Function Number: 5
lib_A7BD::assault_drone_stinger_target_pos()
{
	return self gettagorigin("tag_origin");
}

//Function Number: 6
lib_A7BD::setupplayercommands(param_00)
{
	if(isbot(self))
	{
		return;
	}

	if(isdefined(param_00) && param_00.hasaioption)
	{
		return;
	}

	self notifyonplayercommand("FirePrimaryWeapon","+attack");
	self notifyonplayercommand("FirePrimaryWeapon","+attack_akimbo_accessible");
	self notifyonplayercommand("FireSecondaryWeapon","+speed_throw");
	self notifyonplayercommand("FireSecondaryWeapon","+toggleads_throw");
	self notifyonplayercommand("FireSecondaryWeapon","+ads_akimbo_accessible");
	if(isdefined(param_00) && param_00.hascloak)
	{
		self notifyonplayercommand("Cloak","+usereload");
		self notifyonplayercommand("Cloak","+activate");
	}
}

//Function Number: 7
lib_A7BD::disableplayercommands(param_00)
{
	if(isbot(self))
	{
		return;
	}

	if(isdefined(param_00) && param_00.hasaioption)
	{
		return;
	}

	self method_849C("FirePrimaryWeapon","+attack");
	self method_849C("FirePrimaryWeapon","+attack_akimbo_accessible");
	self method_849C("FireSecondaryWeapon","+speed_throw");
	self method_849C("FireSecondaryWeapon","+toggleads_throw");
	self method_849C("FireSecondaryWeapon","+ads_akimbo_accessible");
	if(isdefined(param_00) && param_00.hascloak)
	{
		self method_849C("Cloak","+usereload");
		self method_849C("Cloak","+activate");
	}
}

//Function Number: 8
lib_A7BD::setupcommonassaultdroneproperties(param_00,param_01,param_02,param_03)
{
	param_00 makeunusable();
	param_00 makevehiclesolidcapsule(23,23,23);
	param_00.lifeid = param_01;
	param_00.inliveplayerkillstreak = self.inliveplayerkillstreak;
	param_00.owner = self;
	param_00.var_275 = 250;
	param_00.destroyed = 0;
	param_00.vehicletype = "drone_assault";
	param_00 common_scripts\utility::make_entity_sentient_mp(self.inliveplayerkillstreak);
	param_00.var_5D57 = param_03;
	param_00.mp_terrace = common_scripts\utility::array_contains(param_03,"mp_terrace");
	param_00.hardened = common_scripts\utility::array_contains(param_03,"assault_ugv_hardened");
	param_00.hasmg = common_scripts\utility::array_contains(param_03,"assault_ugv_mg") || param_00.mp_terrace;
	param_00.hasrockets = common_scripts\utility::array_contains(param_03,"assault_ugv_rockets");
	param_00.hascloak = common_scripts\utility::array_contains(param_03,"assault_ugv_cloak");
	param_00.hasaioption = common_scripts\utility::array_contains(param_03,"assault_ugv_ai");
	param_00.hasarhud = common_scripts\utility::array_contains(param_03,"assault_ugv_ar_hud") || param_00.mp_terrace;
	param_00.hasturret = param_00.hasmg || param_00.hasrockets;
	param_00.endtime = gettime() + param_02 * 1000;
	if(param_00.hardened)
	{
		param_00.var_275 = int(param_00.var_275 * 1.3);
	}

	if(!param_00.hasaioption)
	{
		lib_A7BD::setupplayercommands(param_00);
		thread lib_A7BD::notify_assault_drone_on_player_command(param_00);
	}

	param_00 setcandamage(1);
	param_00.empgrenaded = 0;
	param_00.damagefade = 1;
	param_00 thread maps\mp\gametypes\_damage::setentitydamagecallback(param_00.var_275,undefined,::lib_A7BD::onassaultdronedeath,::maps\mp\killstreaks\_aerial_utility::heli_modifydamage,1);
	param_00 method_8510();
	thread maps\mp\killstreaks\_drone_common::dronesetupcloaking(param_00,param_00.hascloak);
	if(param_00.hascloak)
	{
		thread maps\mp\killstreaks\_drone_common::dronecloakready(param_00,param_00.hascloak);
	}

	self.using_remote_tank = !param_00.hasaioption;
	self.hasaiassaultdrone = param_00.hasaioption;
	if(!param_00.hasaioption)
	{
		lib_A7BD::playerstartusingassaultvehicle(param_00);
		thread lib_A7BD::assaulthudsetup(param_00);
		thread lib_A7BD::monitoruavsafearea(param_00);
	}
	else
	{
		thread maps\mp\killstreaks\_assaultdrone_ai::aistartusingassaultvehicle(param_00);
	}

	thread lib_A7BD::monitorplayerdisconnect(param_00);
	thread lib_A7BD::assaulthandledeath(param_00);
	thread lib_A7BD::monitorplayerswitchteams(param_00);
	thread lib_A7BD::monitorplayergameended(param_00);
	thread maps\mp\killstreaks\_drone_common::playerwatchfordroneemp(param_00);
	if(param_00.mp_terrace)
	{
		var_04 = getent("killstreak_orbit_origin","targetname");
		var_05 = getent("killstreak_orbit_initial","targetname");
		var_06 = getent("killstreak_orbit_lookat","targetname");
		if(isdefined(var_04) && isdefined(var_05) && isdefined(var_06))
		{
			param_00 method_850B(self,var_04,var_05,var_06);
		}
	}

	if(!param_00.mp_terrace)
	{
		thread maps\mp\killstreaks\_drone_common::playerhandleexhaustfx(param_00,"assault_drone_exhaust","TAG_EXHAUST_REAR","assaultDroneHunterKiller");
		thread maps\mp\killstreaks\_drone_common::playerhandleexhaustfx(param_00,"assault_drone_exhaust_bottom","tag_exhaust_lt");
		thread maps\mp\killstreaks\_drone_common::playerhandleexhaustfx(param_00,"assault_drone_exhaust_bottom","tag_exhaust_rt");
	}

	if(!isdefined(level.var_511A) || isdefined(level.var_511A) && self getclientomnvar("ui_horde_player_class") != "drone")
	{
		thread lib_A7BD::assaulthandletimeoutwarning(param_00,param_02);
	}

	lib_A7BD::assaultvehiclemonitorweapons(param_00);
	thread maps\mp\killstreaks\_drone_common::updateshootinglocation(param_00,common_scripts\utility::getfx("assault_drone_marker"));
	thread lib_A7BD::debug_show_origin(param_00);
	var_07 = spawnstruct();
	var_07.validateaccuratetouching = 1;
	var_07.deathoverridecallback = ::lib_A7BD::override_drone_platform_death;
	param_00 thread maps\mp\_movers::handle_moving_platforms(var_07);
	return param_00;
}

//Function Number: 9
lib_A7BD::override_drone_platform_death(param_00)
{
	self notify("death");
}

//Function Number: 10
lib_A7BD::debug_show_origin(param_00)
{
}

//Function Number: 11
lib_A7BD::notify_assault_drone_on_player_command(param_00)
{
	self endon("disconnect");
	param_00 endon("death");
	for(;;)
	{
		var_01 = common_scripts\utility::waittill_any_return("FirePrimaryWeapon","FireSecondaryWeapon","Cloak");
		if(isdefined(var_01))
		{
			param_00 notify(var_01);
		}
	}
}

//Function Number: 12
lib_A7BD::playerstartusingassaultvehicle(param_00)
{
	var_01 = self;
	if(getdvarint("camera_thirdPerson"))
	{
		var_01 maps\mp\_utility::setthirdpersondof(0);
	}

	var_01 maps\mp\_utility::playersaveangles();
	if(!param_00.mp_terrace)
	{
		var_01 cameralinkto(param_00,"tag_origin");
	}

	var_01 remotecontrolvehicle(param_00);
	var_01 thread maps\mp\killstreaks\_drone_common::setdronevisionandlightsetpermap(1.5,param_00);
	var_01.using_remote_tank = 1;
	return 1;
}

//Function Number: 13
lib_A7BD::assaultvehiclemonitorweapons(param_00)
{
	if(param_00.hasturret)
	{
		thread lib_A7BD::spawnmgturret(param_00);
	}
	else
	{
		thread lib_A7BD::waitforc4detonation(param_00);
	}

	if(param_00.hasrockets)
	{
		thread lib_A7BD::setuprockets(param_00);
	}

	thread lib_A7BD::assaultplayerexit(param_00);
}

//Function Number: 14
lib_A7BD::getassaultvehiclec4radius()
{
	return 200;
}

//Function Number: 15
lib_A7BD::waitforc4detonation(param_00)
{
	level endon("game_ended");
	param_00 endon("death");
	if(!param_00.hasaioption)
	{
		thread lib_A7BD::playerhudoutlineshunterkiller(param_00);
	}

	wait(2);
	param_00 waittill("FirePrimaryWeapon");
	self notify("ForceUncloak");
	lib_A7BD::playerdohunterkillerbehavior(param_00);
	param_00 entityradiusdamage(param_00.var_2E6 + (0,0,50),lib_A7BD::getassaultvehiclec4radius(),200,200,self,"MOD_EXPLOSIVE","AssaultDrone_C4_mp");
	playfx(common_scripts\utility::getfx("assault_c4_explode"),param_00.var_2E6);
	param_00 notify("death");
}

//Function Number: 16
lib_A7BD::playerhudoutlineshunterkiller(param_00)
{
	foreach(var_02 in level.var_328)
	{
		if(self.inliveplayerkillstreak != var_02.inliveplayerkillstreak && !var_02 maps\mp\_utility::_hasperk("specialty_blindeye"))
		{
			var_02 hudoutlineenableforclient(self,0,1);
		}
	}

	param_00 waittill("death");
	if(!isdefined(self))
	{
		return;
	}

	foreach(var_02 in level.var_328)
	{
		if(self.inliveplayerkillstreak != var_02.inliveplayerkillstreak)
		{
			var_02 hudoutlinedisableforclient(self);
		}
	}
}

//Function Number: 17
lib_A7BD::onplayerconnecthunterkiller(param_00)
{
	param_00 endon("death");
	for(;;)
	{
		level waittill("connected",var_01);
		if(!isdefined(self))
		{
			return;
		}

		if(self.inliveplayerkillstreak != var_01.inliveplayerkillstreak)
		{
			var_01 thread lib_A7BD::onplayerspawnedhunterkiller();
		}
	}
}

//Function Number: 18
lib_A7BD::onplayerspawnedhunterkiller(param_00)
{
	self endon("disconnect");
	self waittill("spawned_player");
	if(isdefined(param_00))
	{
		self hudoutlineenableforclient(param_00,0,1);
	}
}

//Function Number: 19
lib_A7BD::playerdohunterkillerbehavior(param_00)
{
	var_01 = 7000;
	var_02 = 22500;
	var_03 = 3600;
	self notify("assaultDroneHunterKiller");
	param_00.hunterkiller = 1;
	if(param_00.hasaioption)
	{
		var_04 = param_00.var_2E6;
	}
	else
	{
		var_04 = self getvieworigin(1);
	}

	var_05 = param_00.targetent.var_2E6;
	var_06 = vectornormalize(var_05 - var_04);
	var_05 = var_04 + var_06 * 20000;
	var_07 = bullettrace(var_04,var_05,0,param_00,0,0,1,0,0);
	var_08 = var_07["position"];
	var_09 = distancesquared(param_00.var_2E6,var_08);
	if(var_09 > var_03)
	{
		var_0A = undefined;
		if(param_00.hasaioption)
		{
			var_0B = param_00.var_2E6;
			var_0C = param_00.var_41;
		}
		else
		{
			var_0B = self getvieworigin(1);
			var_0C = self getplayerangles();
			param_00.camlinkent = spawn("script_model",var_0B);
			param_00.camlinkent setmodel("tag_player");
			param_00.camlinkent.var_41 = var_0C;
			param_00.camlinkent linkto(param_00,"tag_origin");
			wait 0.05;
			self playerlinkweaponviewtodelta(param_00.camlinkent,"tag_player",1,0,0,0,0,1);
			self playerlinkedsetviewznear(0);
			self remotecontrolvehicleoff();
			earthquake(0.2,1,var_0B,100);
			var_0A = spawnfxforclient(common_scripts\utility::getfx("c4_forward_blur"),var_0B,self);
			triggerfx(var_0A);
		}

		stopfxontag(common_scripts\utility::getfx("assault_drone_exhaust"),param_00,"TAG_EXHAUST_REAR");
		param_00 notify("stopShootLocationUpdate");
		param_00 method_8383(undefined);
		param_00 veh_teleport(param_00.var_2E6,param_00.var_41,0,0);
		wait 0.05;
		thread lib_A7BD::playerplaytargetfx(param_00,var_08);
		thread lib_A7BD::playerplaythrustersound(param_00);
		var_0D = gettime() + var_01;
		var_0E = 120;
		var_0F = var_0E * 4 / 5;
		param_00 veh_setspeed(var_0E,var_0F);
		param_00 veh_setgoalpos(var_08,0);
		param_00.staticlevelwaittime = 0.3;
		param_00.var_B0E = 1;
		param_00 setcontents(0);
		wait 0.05;
		playfxontag(common_scripts\utility::getfx("assault_drone_thruster"),param_00,"TAG_EXHAUST_REAR");
		var_09 = distancesquared(param_00.var_2E6,var_08);
		while(gettime() < var_0D && var_09 > var_02)
		{
			wait 0.05;
			var_09 = distancesquared(param_00.var_2E6,var_08);
			glassradiusdamage(param_00.var_2E6,70,200,200);
		}

		if(!param_00.hasaioption)
		{
			param_00.camlinkent unlink();
		}

		while(gettime() < var_0D && var_09 > var_03)
		{
			wait 0.05;
			var_09 = distancesquared(param_00.var_2E6,var_08);
			glassradiusdamage(param_00.var_2E6,70,200,200);
		}

		param_00 veh_setspeedimmediate(0);
		if(!param_00.hasaioption)
		{
			var_0A delete();
		}
	}
}

//Function Number: 20
lib_A7BD::playerplaythrustersound(param_00)
{
	var_01 = spawn("script_model",param_00.var_2E6);
	var_01 linkto(param_00,"tag_origin");
	var_01 hide();
	foreach(var_03 in level.var_328)
	{
		if(self == var_03)
		{
			continue;
		}

		var_01 showtoplayer(var_03);
	}

	var_01 playsoundonmovingent("assault_drn_kamikaze_boost_npc");
	self method_82F4("assault_drn_kamikaze_boost_plr");
	wait(2);
	var_01 delete();
}

//Function Number: 21
lib_A7BD::playerplaytargetfx(param_00,param_01)
{
	var_02 = spawn("script_model",param_01);
	var_02 setmodel("tag_origin");
	var_02.var_41 = (-90,0,0);
	playfxontagforclients(common_scripts\utility::getfx("assault_drone_marker"),var_02,"tag_origin",self);
	param_00 waittill("death");
	stopfxontag(common_scripts\utility::getfx("assault_drone_marker"),var_02,"tag_origin");
	wait 0.05;
	var_02 delete();
}

//Function Number: 22
lib_A7BD::spawnmgturret(param_00)
{
	param_00 endon("death");
	self endon("disconnect");
	var_01 = "drone_assault_remote_turret_mp";
	var_02 = "vehicle_atlas_aerial_drone_01_mp_turret_50p";
	var_03 = 0;
	var_04 = "tag_origin";
	var_05 = (0,0,0);
	var_06 = (0,0,0);
	if(param_00.mp_terrace)
	{
		var_01 = "killstreak_terrace_mp";
		var_02 = "vehicle_sniper_drone_turret_mp_cloak";
	}

	var_07 = param_00 gettagorigin(var_04);
	var_08 = spawnturret("misc_turret",var_07,var_01,0);
	var_08.var_41 = param_00.var_41;
	var_08 setmodel(var_02);
	var_08 setdefaultdroppitch(var_03);
	var_08 linkto(param_00,var_04,var_05,var_06);
	var_08.owner = self;
	var_08.health = 99999;
	var_08 setcandamage(0);
	var_08 setcanradiusdamage(0);
	var_08.tank = param_00;
	var_08 makeunusable();
	if(param_00.hasaioption)
	{
		var_08.killcament = param_00;
	}

	param_00.mgturret = var_08;
	param_00.mgturret setmode("sentry_manual");
	param_00.mgturret setsentryowner(self);
	param_00.mgturret setturretminimapvisible(0);
	param_00.mgturret method_844B();
	if(!param_00.hasmg)
	{
		param_00.mgturret turretfiredisable();
	}

	if(param_00.mp_terrace)
	{
		self method_80FE(0.2,0.3,0.8,0.8);
		thread lib_A7BD::terrace_turret_fx(param_00);
	}

	if(!param_00.hasaioption)
	{
		if(param_00.mp_terrace)
		{
			thread lib_A7BD::control_turret_after_delay(param_00,0);
		}
		else
		{
			thread lib_A7BD::control_turret_after_delay(param_00,1.6);
		}
	}

	thread lib_A7BD::delete_turret_on_death(param_00);
	if(param_00.hascloak && param_00.hasmg)
	{
		thread lib_A7BD::watchmgfireuncloak(param_00);
	}
}

//Function Number: 23
lib_A7BD::control_turret_after_delay(param_00,param_01)
{
	var_02 = 0;
	if(param_01 > 0)
	{
		wait(param_01);
	}

	if(isdefined(self) && isdefined(param_00) && isdefined(param_00.mgturret))
	{
		self remotecontrolturret(param_00.mgturret,var_02);
	}
}

//Function Number: 24
lib_A7BD::watchmgfireuncloak(param_00)
{
	param_00 endon("death");
	self endon("disconnect");
	for(;;)
	{
		param_00 waittill("FirePrimaryWeapon");
		self notify("ForceUncloak");
	}
}

//Function Number: 25
lib_A7BD::terrace_turret_fx(param_00)
{
	param_00 endon("death");
	level endon("game_ended");
	wait 0.05;
	playfxontagforclients(level._effect["sniper_drone_thruster_view"],param_00.mgturret,"tag_fx2",self);
	wait 0.05;
	playfxontagforclients(level._effect["sniper_drone_wind_marker"],param_00.mgturret,"tag_fx1",self);
}

//Function Number: 26
lib_A7BD::delete_turret_on_death(param_00)
{
	param_00 waittill("death");
	if(isdefined(self) && isdefined(param_00.hasaioption) && !param_00.hasaioption)
	{
		self remotecontrolturretoff(param_00.mgturret);
		self method_80B9();
	}

	if(param_00.mp_terrace)
	{
		stopfxontag(level._effect["sniper_drone_thruster_view"],param_00.mgturret,"tag_fx2");
		stopfxontag(level._effect["sniper_drone_wind_marker"],param_00.mgturret,"tag_fx1");
	}

	param_00.mgturret delete();
}

//Function Number: 27
lib_A7BD::setuprockets(param_00)
{
	param_00 endon("death");
	self endon("disconnect");
	param_00.rocketammo = 3;
	if(self getclientomnvar("ui_assaultdrone_toggle"))
	{
		self setclientomnvar("ui_assaultdrone_rockets",param_00.rocketammo);
	}

	for(;;)
	{
		if(param_00.hasmg)
		{
			param_00 waittill("FireSecondaryWeapon");
		}
		else
		{
			param_00 waittill("FirePrimaryWeapon");
		}

		self notify("ForceUncloak");
		earthquake(0.3,1,param_00.var_2E6,500);
		self playrumbleonentity("damage_heavy");
		var_01 = param_00.mgturret gettagorigin("tag_flash");
		var_02 = param_00.targetent.var_2E6;
		if(param_00.hasaioption)
		{
			var_03 = param_00 veh_getvelocity();
		}
		else
		{
			var_03 = param_00 getentityvelocity();
		}

		var_04 = magicbullet("ugv_missile_mp",var_01 + var_03 / 10,var_02,self);
		var_04 missilesettargetent(param_00.targetent);
		var_04 missilesetflightmodedirect();
		if(param_00.hasaioption)
		{
			var_04.killcament = param_00;
		}

		param_00.rocketammo--;
		if(param_00.rocketammo > 0)
		{
			self setclientomnvar("ui_assaultdrone_rockets",param_00.rocketammo);
			wait(1);
			continue;
		}

		self setclientomnvar("ui_assaultdrone_rockets",4);
		wait(5);
		param_00.rocketammo = 3;
		self setclientomnvar("ui_assaultdrone_rockets",param_00.rocketammo);
	}
}

//Function Number: 28
lib_A7BD::assaulthudsetup(param_00)
{
	param_00 endon("death");
	self endon("disconnect");
	lib_A7BD::assaulthudremove(param_00);
	wait(0.5);
	self setclientomnvar("ui_assaultdrone_toggle",1);
	if(param_00.mp_terrace)
	{
		self method_8532();
	}

	maps\mp\killstreaks\_aerial_utility::playerenablestreakstatic();
	self setclientomnvar("ui_assaultdrone_countdown",param_00.endtime);
	if(!param_00.hasturret)
	{
		self setclientomnvar("ui_assaultdrone_weapon",2);
	}
	else if(param_00.mp_terrace)
	{
		self setclientomnvar("ui_assaultdrone_weapon",3);
	}
	else if(param_00.hasmg)
	{
		self setclientomnvar("ui_assaultdrone_weapon",1);
	}

	if(param_00.hasrockets && isdefined(param_00.rocketammo))
	{
		self setclientomnvar("ui_assaultdrone_rockets",param_00.rocketammo);
	}

	if(param_00.hascloak)
	{
		self setclientomnvar("ui_drone_cloak",2);
	}

	if(isdefined(level.var_511A) && level.var_511A && self getclientomnvar("ui_horde_player_class") == "drone")
	{
		self setclientomnvar("ui_horde_drone_heal",1);
	}

	if(param_00.hasarhud)
	{
		self method_80B8();
	}
}

//Function Number: 29
lib_A7BD::assaulthudremove(param_00)
{
	self setclientomnvar("ui_assaultdrone_toggle",0);
	self setclientomnvar("ui_assaultdrone_countdown",0);
	self setclientomnvar("ui_drone_cloak",0);
	self setclientomnvar("ui_drone_cloak_time",0);
	self setclientomnvar("ui_drone_cloak_cooldown",0);
	self setclientomnvar("ui_assaultdrone_weapon",0);
	self setclientomnvar("ui_assaultdrone_rockets",0);
	maps\mp\killstreaks\_aerial_utility::playerdisablestreakstatic();
	if(param_00.mp_terrace)
	{
		self method_8533();
	}
}

//Function Number: 30
lib_A7BD::monitoruavsafearea(param_00)
{
	self endon("assaultStreakComplete");
	if(param_00.mp_terrace)
	{
		return;
	}

	thread maps\mp\killstreaks\_aerial_utility::playerhandleboundarystatic(param_00,"assaultStreakComplete");
	thread maps\mp\killstreaks\_aerial_utility::playerhandlekillvehicle(param_00,"assaultStreakComplete");
	param_00 waittill("outOfBounds");
	wait(2);
	param_00 notify("death");
}

//Function Number: 31
lib_A7BD::monitorplayerdisconnect(param_00)
{
	self endon("StopWaitForDisconnect");
	param_00 endon("death");
	self waittill("disconnect");
	param_00 notify("death");
}

//Function Number: 32
lib_A7BD::monitorplayerswitchteams(param_00)
{
	self endon("assaultStreakComplete");
	common_scripts\utility::waittill_any("joined_team","joined_spectators");
	param_00 notify("death");
}

//Function Number: 33
lib_A7BD::monitorplayergameended(param_00)
{
	self endon("assaultStreakComplete");
	level waittill("game_ended");
	param_00 notify("death");
}

//Function Number: 34
lib_A7BD::onassaultdronedeath(param_00,param_01,param_02,param_03)
{
	self notify("death",param_00,param_02,param_01);
	if(isdefined(level.var_511A) && level.var_511A)
	{
		if((isdefined(param_00.ishordeenemysentry) && param_00.ishordeenemysentry) || isdefined(param_00.ishordeenemywarbird) && param_00.ishordeenemywarbird)
		{
			return;
		}
	}

	if(self.mp_terrace)
	{
		maps\mp\gametypes\_damage::onkillstreakkilled(param_00,param_01,param_02,param_03,"map_killstreak_destroyed",undefined,"callout_destroyed_terrace_sniper_drone",1);
		return;
	}

	maps\mp\gametypes\_damage::onkillstreakkilled(param_00,param_01,param_02,param_03,"assault_drone_destroyed",undefined,"callout_destroyed_drone_assault",1);
}

//Function Number: 35
lib_A7BD::assaulthandletimeoutwarning(param_00,param_01)
{
	param_00 endon("death");
	maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause(param_01 - 10);
	var_02 = 10;
	while(var_02 != 0)
	{
		if(!param_00.hasaioption)
		{
			param_00 playsoundasmaster("mp_warbird_outofbounds_warning");
		}

		var_02 = var_02 - 1;
		wait(1);
	}

	if(isdefined(param_00.hunterkiller))
	{
		return;
	}

	param_00 notify("death");
}

//Function Number: 36
lib_A7BD::assaulthandledeath(param_00)
{
	var_01 = param_00 getentitynumber();
	param_00 maps\mp\killstreaks\_drone_common::droneaddtogloballist(var_01);
	param_00 waittill("death",var_02);
	if(isdefined(param_00.camlinkent))
	{
		param_00.camlinkent unlink();
	}

	if(isdefined(param_00))
	{
		param_00 method_8510();
	}

	if(isdefined(param_00.mgturret))
	{
		param_00.mgturret method_8510();
	}

	if(isdefined(self) && !param_00.hasaioption)
	{
		maps\mp\_utility::freezecontrolswrapper(1);
	}

	self notify("assaultStreakComplete");
	self notify("StopWaitForDisconnect");
	param_00 playsoundasmaster("assault_drn_death");
	playfx(level._effect["remote_tank_explode"],param_00.var_2E6);
	param_00 maps\mp\killstreaks\_drone_common::droneremovefromgloballist(var_01);
	if(isdefined(self) && !param_00.hasturret && !param_00.hasaioption && !level.gameended)
	{
		wait(1);
		maps\mp\killstreaks\_aerial_utility::playershowfullstatic();
		wait(0.8);
		maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	}

	if(isdefined(self) && isdefined(var_02) && self != var_02)
	{
		thread maps\mp\_utility::leaderdialogonplayer("ks_adrone_destroyed",undefined,undefined,self.var_2E6);
	}

	if(!param_00.hasaioption)
	{
		if(isdefined(self) && !level.gameended)
		{
			maps\mp\_utility::freezecontrolswrapper(0);
		}

		if(isdefined(self) && self.using_remote_tank || maps\mp\_utility::isusingremote())
		{
			lib_A7BD::assaultsetinactivity(param_00);
			self.using_remote_tank = 0;
		}
	}
	else if(isdefined(self))
	{
		self.hasaiassaultdrone = 0;
	}

	maps\mp\_utility::decrementfauxvehiclecount();
	if(isdefined(param_00.camlinkent))
	{
		param_00.camlinkent delete();
	}

	param_00 delete();
}

//Function Number: 37
lib_A7BD::assaultsetinactivity(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	var_01 = self;
	if(isdefined(var_01.using_remote_tank) && var_01.using_remote_tank)
	{
		var_01 notify("end_remote");
		var_01 method_80FF();
		var_01 remotecontrolvehicleoff(param_00);
		var_01 method_80B9();
		thread maps\mp\killstreaks\_drone_common::removedronevisionandlightsetpermap(1.5);
		var_01 unlink();
		if(var_01 maps\mp\_utility::isusingremote() && !level.gameended)
		{
			var_01 maps\mp\_utility::clearusingremote();
		}

		var_01 lib_A7BD::switch_back_to_player_weapon();
		var_01 maps\mp\_utility::playerrestoreangles();
		var_01 lib_A7BD::disableplayercommands(param_00);
		thread lib_A7BD::assaulthudremove(param_00);
		if(getdvarint("camera_thirdPerson"))
		{
			var_01 maps\mp\_utility::setthirdpersondof(1);
		}

		if(isdefined(var_01.disabledusability) && var_01.disabledusability)
		{
			var_01 common_scripts\utility::_enableusability();
		}

		var_01.using_remote_tank = 0;
	}
}

//Function Number: 38
lib_A7BD::switch_back_to_player_weapon()
{
	var_00 = maps\mp\_utility::getkillstreakweapon("orbitalsupport");
	self takeweapon(var_00);
	self enableweaponswitch();
	self switchtoweapon(common_scripts\utility::getlastweapon());
}

//Function Number: 39
lib_A7BD::assaultplayerexit(param_00)
{
	if(!isdefined(self))
	{
		return;
	}

	var_01 = self;
	level endon("game_ended");
	var_01 endon("disconnect");
	var_01 endon("assaultDroneHunterKiller");
	param_00 endon("death");
	for(;;)
	{
		var_02 = 0;
		while(!param_00.hasaioption && var_01 usebuttonpressed())
		{
			var_02 = var_02 + 0.05;
			if(var_02 > 0.75)
			{
				param_00 notify("death");
				return;
			}

			wait(0.05);
		}

		wait(0.05);
	}
}