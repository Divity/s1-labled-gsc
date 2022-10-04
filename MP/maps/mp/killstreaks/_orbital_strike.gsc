/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _orbital_strike - 42953.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 75
 * Decompile Time: 3484 ms
 * Timestamp: 4/20/2022 8:16:29 PM
*******************************************************************/

//Function Number: 1
init()
{
	level._effect["orbital_laser_clouds"] = loadfx("vfx/unique/vfx_odin_parallax_clouds");
	level._effect["orbital_laser_warmup"] = loadfx("vfx/beam/orbital_laser_warmup");
	level._effect["orbital_laser_warmup_water"] = loadfx("vfx/beam/orbital_laser_water_boiling");
	level._effect["orbital_laser_warmup_wide"] = loadfx("vfx/beam/orbital_laser_warmup_large");
	level._effect["orbital_laser_warmup_wide_water"] = loadfx("vfx/beam/orbital_laser_water_boiling");
	level._effect["orbital_laser_warmup_lightshow"] = loadfx("vfx/beam/orbital_laser_warmup_lightshow");
	level._effect["orbital_laser_warmup_lightshow_water"] = loadfx("vfx/beam/orbital_laser_water_boiling");
	level._effect["orbital_laser_warmup_lightshow_wide"] = loadfx("vfx/beam/orbital_laser_warmup_lightshow_large");
	level._effect["orbital_laser_warmup_lightshow_wide_water"] = loadfx("vfx/beam/orbital_laser_water_boiling");
	level._effect["orbital_laser_fire"] = loadfx("vfx/beam/orbital_laser_fire_small");
	level._effect["orbital_laser_fire_water"] = loadfx("vfx/beam/orbital_laser_water_sm");
	level._effect["orbital_laser_fire_wide"] = loadfx("vfx/beam/orbital_laser_fire_large");
	level._effect["orbital_laser_fire_wide_water"] = loadfx("vfx/beam/orbital_laser_water_sm");
	level._effect["orbital_laser_fire_lightshow"] = loadfx("vfx/beam/orbital_laser_fire_lightshow");
	level._effect["orbital_laser_fire_lightshow_water"] = loadfx("vfx/beam/orbital_laser_water_sm");
	level._effect["orbital_laser_fire_lightshow_wide"] = loadfx("vfx/beam/orbital_laser_fire_lightshow_large");
	level._effect["orbital_laser_fire_lightshow_wide_water"] = loadfx("vfx/beam/orbital_laser_water_sm");
	level._effect["orbital_laser_ending"] = loadfx("vfx/beam/orbital_laser_ending");
	level._effect["orbital_laser_ending_water"] = loadfx("vfx/beam/orbital_laser_water_aftermath");
	level._effect["orbital_laser_beam"] = loadfx("vfx/beam/orbital_laser_lightbeam");
	level._effect["orbital_laser_beam_wide"] = loadfx("vfx/beam/orbital_laser_lightbeam_lg");
	level._effect["orbital_laser_beam_lightshow"] = loadfx("vfx/beam/orbital_laser_lightbeam_lightshow");
	level._effect["orbital_laser_beam_lightshow_wide"] = loadfx("vfx/beam/orbital_laser_lightbeam_lightshow_lg");
	level._effect["orbital_laser_smoldering"] = loadfx("vfx/beam/orbital_laser_smoldering");
	level._effect["orbital_laser_death"] = loadfx("vfx/beam/orbital_laser_lightbeam_burnmark");
	level._orbital_strike_setting = [];
	level._orbital_strike_setting = spawnstruct();
	level._orbital_strike_setting.vehicle = "orbital_laser_strike_mp";
	level._orbital_strike_setting.helitype = "OrbitalStrike";
	level._orbital_strike_setting.var_275 = 9999999;
	level.killstreakfuncs["orbital_strike_laser"] = ::tryuseorbitalstrike;
	level.killstreakwieldweapons["orbital_laser_fov_mp"] = "orbital_strike_laser";
	if(!isdefined(level.orbital_lasers))
	{
		level.orbital_lasers = [];
	}

	if(level.teambased)
	{
		level.orbital_laser_axis = 0;
		level.orbital_laser_allies = 0;
	}

	level.orbitallaseroverrides = spawnstruct();
	level.orbitallaseroverrides.spawnheight = undefined;
	level.orbitallaseroverrides.var_89F7 = undefined;
	if(isdefined(level.orbitallaseroverridefunc))
	{
		[[ level.orbitallaseroverridefunc ]]();
	}
}

//Function Number: 2
tryuseorbitalstrike(param_00,param_01)
{
	if(checkorbitallaserusage())
	{
		self iprintlnbold(&"KILLSTREAKS_AIR_SPACE_TOO_CROWDED");
		return 0;
	}

	if(maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + 1 >= maps\mp\_utility::maxvehiclesallowed())
	{
		self iprintlnbold(&"MP_TOO_MANY_VEHICLES");
		return 0;
	}

	maps\mp\_utility::incrementfauxvehiclecount();
	var_02 = undefined;
	if(level.teambased)
	{
		var_02 = self.inliveplayerkillstreak;
		setorbitallaserforteam(var_02,1);
	}

	var_03 = maps\mp\killstreaks\_killstreaks::initridekillstreak("orbital_strike");
	if(var_03 != "success")
	{
		maps\mp\_utility::decrementfauxvehiclecount();
		if(level.teambased)
		{
			setorbitallaserforteam(var_02,0);
		}

		return 0;
	}

	if(isdefined(level.var_511A) && level.var_511A && self.killstreakindexweapon == 1)
	{
		self notify("used_horde_orbital");
	}

	maps\mp\_utility::setusingremote("orbital_strike");
	var_03 = setuporbitalstrike(param_00,param_01);
	maps\mp\_matchdata::logkillstreakevent("orbital_strike",self.var_2E6);
	return var_03;
}

//Function Number: 3
checkorbitallaserusage()
{
	if(level.teambased)
	{
		if(self.inliveplayerkillstreak == "allies")
		{
			return level.orbital_laser_allies;
		}

		return level.orbital_laser_axis;
	}

	return level.orbital_lasers.size >= 2;
}

//Function Number: 4
setorbitallaserforteam(param_00,param_01)
{
	if(param_00 == "allies")
	{
		level.orbital_laser_allies = param_01;
		return;
	}

	level.orbital_laser_axis = param_01;
}

//Function Number: 5
orbitalstrikesetupdelay(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	wait 0.05;
	param_00 method_8000();
}

//Function Number: 6
setuporbitalstrike(param_00,param_01)
{
	playeraddnotifycommands();
	var_02 = findbestspawnlocation();
	var_03 = spawnhelicopter(self,var_02.var_2E6,(0,0,0),level._orbital_strike_setting.vehicle,"tag_origin");
	if(!isdefined(var_03))
	{
		return 0;
	}

	thread orbitalstrikesetupdelay(var_03);
	level.orbital_lasers = common_scripts\utility::array_add(level.orbital_lasers,var_03);
	var_03.var_5D57 = param_01;
	var_03.vehicletype = "orbital_strike";
	var_03.lifeid = param_00;
	var_03.inliveplayerkillstreak = self.connectedpostgame["team"];
	var_03.connectedpostgame["team"] = self.connectedpostgame["team"];
	var_03.owner = self;
	var_03.var_275 = level._orbital_strike_setting.var_275;
	var_03.zoffset = (0,0,0);
	var_03.targeting_delay = level.heli_targeting_delay;
	var_03.primarytarget = undefined;
	var_03.secondarytarget = undefined;
	var_03.attacker = undefined;
	var_03.cloakstate = 0;
	var_03.numcharges = 1;
	if(common_scripts\utility::array_contains(var_03.var_5D57,"orbital_strike_laser_burst1"))
	{
		var_03.numcharges++;
	}

	if(common_scripts\utility::array_contains(var_03.var_5D57,"orbital_strike_laser_burst2"))
	{
		var_03.numcharges++;
	}

	var_03.widebeam = common_scripts\utility::array_contains(var_03.var_5D57,"orbital_strike_laser_width");
	var_03.beams = common_scripts\utility::array_contains(var_03.var_5D57,"orbital_strike_laser_beam");
	var_03.fireduration = 6;
	if(common_scripts\utility::array_contains(var_03.var_5D57,"orbital_strike_laser_duration"))
	{
		var_03.fireduration = var_03.fireduration * 1.5;
	}

	self.controllingorbitallaser = 1;
	thread monitororbitalstriketimeout(var_03);
	thread monitororbitalstrikedeath(var_03);
	thread monitorplayerdisconnect(var_03);
	thread monitorplayerteamchange(var_03);
	thread monitorgameended(var_03);
	thread playercontrolorbitalstrike(var_03);
	thread watchallplayerdeath(var_03,self);
	thread onplayerconnect(var_03,self);
	return 1;
}

//Function Number: 7
onplayerconnect(param_00,param_01)
{
	param_01 endon("OrbitalStrikeStreakComplete");
	param_01 endon("disconnect");
	param_00 endon("death");
	param_00 endon("PossessHoldTimeComplete");
	param_00 endon("leaving");
	for(;;)
	{
		level waittill("connected",var_02);
		var_02 thread waitforlaserdeath(param_00,param_01);
	}
}

//Function Number: 8
zoomslam(param_00)
{
	var_01 = spawn("script_model",param_00.var_2E6 + (0,0,3000));
	var_01.var_41 = vectortoangles((0,0,1));
	var_01 setmodel("tag_origin");
	var_01 thread waitanddelete(5);
	var_02 = common_scripts\utility::array_add(maps\mp\_utility::get_players_watching(),self);
	foreach(var_04 in var_02)
	{
		var_04 setclientomnvar("cam_scene_name","odin_zoom_down");
		var_04 setclientomnvar("cam_scene_lead",param_00 getentitynumber());
		var_04 setclientomnvar("cam_scene_support",var_01 getentitynumber());
		var_04 method_82F4("vulcan_hud_transition");
		var_04 thread clouds(param_00);
	}
}

//Function Number: 9
clouds(param_00)
{
	level endon("game_ended");
	var_01 = spawn("script_model",param_00.var_2E6 + (0,0,-1000));
	var_01.var_41 = vectortoangles((0,0,1));
	var_01 setmodel("tag_origin");
	var_01 thread waitanddelete(5);
	playfxontagforclients(level._effect["orbital_laser_clouds"],var_01,"tag_origin",self);
}

//Function Number: 10
waitanddelete(param_00)
{
	self endon("death");
	level endon("game_ended");
	wait(param_00);
	self delete();
}

//Function Number: 11
turnonandhideorbitalhud()
{
	self setclientomnvar("ui_orbital_laser",1);
	self setclientomnvar("ui_orbital_laser_mode",0);
	self setclientomnvar("ui_orbital_laser_charge",0);
	self setclientomnvar("ui_orbital_laser_bursts",0);
	maps\mp\killstreaks\_aerial_utility::playerenablestreakstatic();
}

//Function Number: 12
showorbitalstrikehud(param_00)
{
	thread activatethermal();
	self setclientomnvar("ui_orbital_laser_mode",1);
	self setclientomnvar("ui_orbital_laser_bursts",param_00.numcharges);
	maps\mp\killstreaks\_aerial_utility::playerenablestreakstatic();
}

//Function Number: 13
orbitalstrikebeginchargeup(param_00,param_01)
{
	self endon("disconnect");
	self endon("OrbitalStrikeStreakComplete");
	var_02 = gettime() + param_01 * 1000;
	self setclientomnvar("ui_orbital_laser_charge",var_02);
	self setclientomnvar("ui_orbital_laser_mode",1);
	self playrumbleonentity("orbital_laser_charge");
	playwarmupsounds(param_00,0);
	wait(0.1);
	playwarmupeffects(param_00);
}

//Function Number: 14
orbitalstrikchargeupspeedup(param_00,param_01)
{
	var_02 = gettime() + param_01 * 1000;
	self setclientomnvar("ui_orbital_laser_charge",var_02);
	self stoprumble("orbital_laser_charge");
	self playrumbleonentity("orbital_laser_charge_quick");
	playwarmupsounds(param_00,1);
}

//Function Number: 15
orbitalstrikechargeupcomplete(param_00)
{
	self setclientomnvar("ui_orbital_laser_charge",0);
	self stoprumble("orbital_laser_charge");
	self stoprumble("orbital_laser_charge_quick");
	self playrumblelooponentity("orbital_laser_fire");
}

//Function Number: 16
createorbitaltimer(param_00,param_01)
{
	var_02 = gettime() + param_01 * 1000;
	thread orbitalstrikebeginchargeup(param_00,param_01);
	maps\mp\_utility::waitfortimeornotify(param_01,"StartFire");
	var_03 = var_02 - gettime();
	if(var_03 > 2500)
	{
		orbitalstrikchargeupspeedup(param_00,1.1);
		wait(1.1);
	}
	else
	{
		stopwarmupsounds(param_00);
	}

	orbitalstrikechargeupcomplete(param_00);
}

//Function Number: 17
hidefirehud(param_00)
{
	self setclientomnvar("ui_orbital_laser_mode",2);
}

//Function Number: 18
sethudnumbursts(param_00)
{
	self setclientomnvar("ui_orbital_laser_bursts",param_00.numcharges);
}

//Function Number: 19
getorbitallaserzheight()
{
	if(isdefined(level.orbitallaseroverrides.spawnheight))
	{
		return level.orbitallaseroverrides.spawnheight;
	}

	var_00 = maps\mp\killstreaks\_aerial_utility::gethelianchor();
	var_01 = var_00.var_2E6[2] + 1024;
	if(isdefined(level.airstrikeoverrides) && isdefined(level.airstrikeoverrides.spawnheight))
	{
		var_01 = var_01 + level.airstrikeoverrides.spawnheight;
	}

	return var_01;
}

//Function Number: 20
findbestspawnlocation()
{
	if(!isdefined(self.strikespawnpoint))
	{
		self.strikespawnpoint = spawnstruct();
	}

	var_00 = maps\mp\killstreaks\_aerial_utility::gethelianchor();
	var_01 = getorbitallaserzheight();
	var_02 = level.var_5983;
	if(isdefined(level.orbitallaseroverrides.var_89F7))
	{
		var_02 = level.orbitallaseroverrides.var_89F7;
	}

	self.strikespawnpoint.var_2E6 = var_02 + (0,0,var_01);
	self.strikespawnpoint.var_41 = (0,self.var_41[1],0);
	return self.strikespawnpoint;
}

//Function Number: 21
monitororbitalstrikesafearea(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	thread maps\mp\killstreaks\_aerial_utility::playerhandleboundarystatic(param_00,"OrbitalStrikeStreakComplete");
	param_00 waittill("outOfBounds");
	wait(2);
	param_00 notify("leaving");
}

//Function Number: 22
playercontrolorbitalstrike(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	thread maps\mp\_utility::freezecontrolswrapper(1);
	thread monitororbitalstrikesafearea(param_00);
	maps\mp\_utility::playersaveangles();
	wait(0.45);
	thread setvulcanvisionandlightsetpermap(0.5);
	zoomslam(param_00);
	turnonandhideorbitalhud();
	wait(1.5);
	maps\mp\killstreaks\_aerial_utility::playershowfullstatic();
	thread maps\mp\_utility::freezecontrolswrapper(0);
	maps\mp\_utility::_giveweapon("orbital_laser_fov_mp");
	self switchtoweapon("orbital_laser_fov_mp");
	common_scripts\utility::_disableweaponswitch();
	self unlink();
	param_00 veh_sethoverparams(0,0,0);
	param_00 veh_setjitterparams((0,0,0),0,0);
	thread leaveorbitalstrikeearly(param_00);
	thread playinteriorsound(param_00);
	self setplayerangles((0,0,0));
	self remotecontrolvehicle(param_00);
	wait(0.05);
	self cameralinkto(param_00,"tag_origin");
	wait(0.55);
	maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	param_00.var_534F = gettime();
	showorbitalstrikehud(param_00);
	thread weaponsetup(param_00);
}

//Function Number: 23
setplayerstance()
{
	if(self getstance() == "prone")
	{
		self setstance("crouch");
	}
}

//Function Number: 24
leaveorbitalstrikeearly(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	param_00 endon("death");
	var_01 = 5;
	for(;;)
	{
		self waittill("ToggleControlState");
		thread cancelpossessbuttonpressmonitor();
		self.holdingleavebutton = 1;
		for(var_02 = 0;var_02 <= var_01;var_02++)
		{
			wait(0.1);
			if(self.holdingleavebutton == 1 && var_02 == var_01)
			{
				param_00 notify("PossessHoldTimeComplete");
				continue;
			}

			if(self.holdingleavebutton == 0)
			{
				break;
			}
		}
	}
}

//Function Number: 25
cancelpossessbuttonpressmonitor()
{
	self endon("OrbitalStrikeStreakComplete");
	self endon("PossessHoldTimeComplete");
	self waittill("ToggleControlCancel");
	self.holdingleavebutton = 0;
}

//Function Number: 26
activatethermal()
{
	self method_851A(0);
	self method_80B8();
	self setblurforplayer(1.1,0);
	var_00 = 0.125;
	var_01 = 8500;
	var_02 = 0.125;
	var_03 = 5500;
	var_04 = 20;
	var_05 = 30;
	thread maps\mp\killstreaks\_aerial_utility::thermalvision("OrbitalStrikeStreakComplete",var_00,var_01,var_02,var_03,var_04,var_05);
}

//Function Number: 27
playinteriorsound(param_00)
{
	var_01 = common_scripts\utility::array_add(maps\mp\_utility::get_players_watching(),self);
	if(isdefined(param_00))
	{
		param_00 thread maps\mp\_utility::playloopsoundtoplayers("vulcan_interior_loop_plr",undefined,var_01);
	}

	common_scripts\utility::waittill_any("OrbitalStrikeStreakComplete");
	if(isdefined(param_00))
	{
		param_00 common_scripts\utility::stop_loop_sound_on_entity("vulcan_interior_loop_plr");
	}
}

//Function Number: 28
weaponlistenforstopfire(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	var_01 = gettime() + param_00.fireduration * 1000;
	self setclientomnvar("ui_orbital_laser_fire",var_01);
	wait(param_00.fireduration);
	self setclientomnvar("ui_orbital_laser_fire",0);
	param_00 notify("stop_charge");
}

//Function Number: 29
getlaserradius(param_00)
{
	if(param_00.widebeam)
	{
		return 256;
	}

	return 128;
}

//Function Number: 30
weaponsetup(param_00)
{
	var_01 = anglestoforward(param_00.var_41);
	var_02 = anglestoright(param_00.var_41);
	var_03 = param_00 gettagorigin("tag_origin") + var_01 * 30;
	var_04 = (0,0,-1);
	var_05 = var_03 + var_04 * 5000;
	var_06 = bullettrace(var_03,var_05,0,param_00);
	var_07 = var_06["position"];
	var_08 = getlaserradius(param_00);
	param_00.weaponlinker = spawn("script_model",var_03);
	param_00.weaponlinker setmodel("generic_prop_raven");
	param_00.weaponlinker method_8446(param_00,"tag_origin");
	var_09 = var_07;
	var_0A = vectortoangles(var_09 - var_03);
	var_0B = spawn("script_model",var_03);
	var_0B setmodel("tag_origin");
	var_0B.var_41 = var_0A;
	var_0B method_8446(param_00.weaponlinker,"tag_origin");
	param_00.weapontag01 = var_0B;
	var_0C = spawn("script_model",var_09);
	var_0C.var_41 = (-90,0,0);
	var_0C setmodel("tag_origin");
	var_0C method_8383(var_0B);
	var_0C show();
	param_00.weapontag01.targetedent = var_0C;
	if(param_00.beams)
	{
		var_09 = var_07 + var_01 * var_08;
		var_0A = vectortoangles(var_09 - var_03);
		var_0D = spawn("script_model",var_03);
		var_0D setmodel("tag_origin");
		var_0D.var_41 = var_0A;
		var_0D method_8446(param_00.weaponlinker,"j_prop_1");
		param_00.weapontag02 = var_0D;
		var_0E = spawn("script_model",var_09);
		var_0E.var_41 = (-90,0,0);
		var_0E setmodel("tag_origin");
		var_0E method_8383(var_0D);
		var_0E show();
		param_00.weapontag02.targetedent = var_0E;
		var_0F = sin(60) * var_08;
		var_10 = cos(60) * var_08;
		var_09 = var_07 - var_01 * var_10 + var_02 * var_0F;
		var_0A = vectortoangles(var_09 - var_03);
		var_11 = spawn("script_model",var_03);
		var_11 setmodel("tag_origin");
		var_11.var_41 = var_0A;
		var_11 method_8446(param_00.weaponlinker,"j_prop_1");
		param_00.weapontag03 = var_11;
		var_12 = spawn("script_model",var_09);
		var_12.var_41 = (-90,0,0);
		var_12 setmodel("tag_origin");
		var_12 method_8383(var_11);
		var_12 show();
		param_00.weapontag03.targetedent = var_12;
		var_09 = var_07 - var_01 * var_10 - var_02 * var_0F;
		var_0A = vectortoangles(var_09 - var_03);
		var_13 = spawn("script_model",var_03);
		var_13 setmodel("tag_origin");
		var_13.var_41 = var_0A;
		var_13 method_8446(param_00.weaponlinker,"j_prop_1");
		param_00.weapontag04 = var_13;
		var_14 = spawn("script_model",var_09);
		var_14.var_41 = (-90,0,0);
		var_14 setmodel("tag_origin");
		var_14 method_8383(var_13);
		var_14 show();
		param_00.weapontag04.targetedent = var_14;
	}

	thread spinthelasers(param_00);
	thread monitororbitalstrikeweapon(param_00);
}

//Function Number: 31
deleteweaponmodels(param_00)
{
	if(isdefined(param_00.weapontag01))
	{
		param_00.weapontag01.targetedent delete();
		param_00.weapontag01 delete();
		if(param_00.beams)
		{
			param_00.weapontag02.targetedent delete();
			param_00.weapontag02 delete();
			param_00.weapontag03.targetedent delete();
			param_00.weapontag03 delete();
			param_00.weapontag04.targetedent delete();
			param_00.weapontag04 delete();
		}
	}

	if(isdefined(param_00.weaponlinker))
	{
		param_00.weaponlinker delete();
	}
}

//Function Number: 32
spinthelasers(param_00)
{
	param_00.weaponlinker scriptmodelplayanim("mp_generic_prop_spin","hello");
}

//Function Number: 33
monitororbitalstrikeweapon(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	param_00 veh_clearturrettargetent();
	wait(1);
	var_01 = 6;
	while(param_00.numcharges > 0)
	{
		createorbitaltimer(param_00,var_01);
		param_00.numcharges--;
		sethudnumbursts(param_00);
		thread weaponlistenforstopfire(param_00);
		hidefirehud(param_00);
		laserweapon(param_00);
		wait(0.1);
	}

	param_00 notify("done");
}

//Function Number: 34
oneshotsoundonmovingent(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 5;
	}

	var_02 = spawn("script_model",self.var_2E6);
	var_02 setmodel("tag_origin");
	var_02 method_8446(self);
	var_02 playsoundasmaster(param_00);
	var_02 thread waitanddelete(param_01);
}

//Function Number: 35
oneshotsoundonstationaryent(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 5;
	}

	var_02 = spawn("script_model",self.var_2E6);
	var_02 setmodel("tag_origin");
	var_02 playsoundasmaster(param_00);
	var_02 thread waitanddelete(param_01);
}

//Function Number: 36
startlasersounds(param_00)
{
	param_00.playingloopfiresounds = 1;
	var_01 = common_scripts\utility::array_add(maps\mp\_utility::get_players_watching(),self);
	param_00.weapontag01.targetedent thread common_scripts\utility::play_loop_sound_on_entity("vulcan_beam_loop_npc");
	param_00.weapontag01.targetedent thread common_scripts\utility::play_loop_sound_on_entity("vulcan_impact_loop_npc");
	param_00.weapontag01.targetedent oneshotsoundonmovingent("vulcan_shot_snap_npc");
	param_00.weapontag01.targetedent oneshotsoundonmovingent("vulcan_shot_tail_npc");
	var_02 = "vulcan_std_beam_loop_plr";
	if(param_00.beams)
	{
		var_02 = "vulcan_lshow_beam_loop_plr";
	}
	else if(param_00.widebeam)
	{
		var_02 = "vulcan_wide_beam_loop_plr";
	}

	param_00 thread maps\mp\_utility::playloopsoundtoplayers("vulcan_beam_loop_plr",undefined,var_01);
	param_00 thread maps\mp\_utility::playloopsoundtoplayers(var_02,undefined,var_01);
	var_03 = "vulcan_shot_snap_plr";
	if(param_00.beams)
	{
		var_03 = "vulcan_shot_snap_lshow_plr";
	}
	else if(param_00.widebeam)
	{
		var_03 = "vulcan_shot_snap_wide_plr";
	}

	self method_82F4(var_03);
	self method_82F4("vulcan_shot_tail_plr");
}

//Function Number: 37
stoplasersounds(param_00)
{
	if(isdefined(param_00.weapontag01))
	{
		param_00.weapontag01.targetedent common_scripts\utility::stop_loop_sound_on_entity("vulcan_beam_loop_npc");
		param_00.weapontag01.targetedent common_scripts\utility::stop_loop_sound_on_entity("vulcan_impact_loop_npc");
		if(param_00.beams)
		{
			param_00.weapontag02.targetedent common_scripts\utility::stop_loop_sound_on_entity("vulcan_beam_loop_npc");
			param_00.weapontag02.targetedent common_scripts\utility::stop_loop_sound_on_entity("vulcan_impact_loop_npc");
			param_00.weapontag03.targetedent common_scripts\utility::stop_loop_sound_on_entity("vulcan_beam_loop_npc");
			param_00.weapontag03.targetedent common_scripts\utility::stop_loop_sound_on_entity("vulcan_impact_loop_npc");
			param_00.weapontag04.targetedent common_scripts\utility::stop_loop_sound_on_entity("vulcan_beam_loop_npc");
			param_00.weapontag04.targetedent common_scripts\utility::stop_loop_sound_on_entity("vulcan_impact_loop_npc");
		}
	}

	var_01 = "vulcan_std_beam_loop_plr";
	if(param_00.widebeam)
	{
		var_01 = "vulcan_wide_beam_loop_plr";
	}

	param_00 common_scripts\utility::stop_loop_sound_on_entity("vulcan_beam_loop_plr");
	param_00 common_scripts\utility::stop_loop_sound_on_entity(var_01);
	if(isdefined(param_00.playingloopfiresounds) && param_00.playingloopfiresounds)
	{
		param_00.playingloopfiresounds = 0;
		if(isdefined(param_00.weapontag01))
		{
			param_00.weapontag01.targetedent oneshotsoundonstationaryent("vulcan_beam_stop_npc");
			if(param_00.beams)
			{
				param_00.weapontag02.targetedent oneshotsoundonstationaryent("vulcan_beam_stop_npc");
				param_00.weapontag03.targetedent oneshotsoundonstationaryent("vulcan_beam_stop_npc");
				param_00.weapontag04.targetedent oneshotsoundonstationaryent("vulcan_beam_stop_npc");
			}
		}

		if(self.controllingorbitallaser)
		{
			var_02 = 1;
			if(isdefined(self) && var_02)
			{
				self method_82F4("vulcan_beam_stop_plr");
				return;
			}
		}
	}
}

//Function Number: 38
laserweapon(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	stopwarmupeffects(param_00);
	wait 0.05;
	wait 0.05;
	thread firelaserbeam(param_00);
	thread laserpilotquake(param_00);
	thread lasersurfacequake(param_00);
	thread laserdophysics(param_00);
	thread laserdodamge(param_00);
	self method_84E2(0.3);
	param_00 waittill("stop_charge");
	self method_84E2(1);
}

//Function Number: 39
laserdodamge(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	param_00 endon("death");
	param_00 endon("PossessHoldTimeComplete");
	param_00 endon("leaving");
	param_00 endon("stop_charge");
	var_01 = getlaserradius(param_00);
	for(;;)
	{
		param_00 entityradiusdamage(param_00.weapontag01.targetedent.var_2E6 + (0,0,8),var_01,90,90,self,"MOD_TRIGGER_HURT","orbital_laser_fov_mp");
		if(isdefined(level.var_511A) && level.var_511A && isdefined(level.flying_attack_drones))
		{
			foreach(var_03 in level.flying_attack_drones)
			{
				if(var_03.var_2E6[2] > param_00.weapontag01.targetedent.var_2E6[2] && distance2dsquared(var_03.var_2E6,param_00.weapontag01.targetedent.var_2E6) < int(var_01 * var_01 / 9))
				{
					var_03 dodamage(90,param_00.weapontag01.targetedent.var_2E6,self,self,"MOD_TRIGGER_HURT","orbital_laser_fov_mp");
				}
			}
		}

		if(param_00.beams)
		{
			param_00 entityradiusdamage(param_00.weapontag02.targetedent.var_2E6 + (0,0,8),var_01,90,90,self,"MOD_TRIGGER_HURT","orbital_laser_fov_mp");
			param_00 entityradiusdamage(param_00.weapontag03.targetedent.var_2E6 + (0,0,8),var_01,90,90,self,"MOD_TRIGGER_HURT","orbital_laser_fov_mp");
			param_00 entityradiusdamage(param_00.weapontag04.targetedent.var_2E6 + (0,0,8),var_01,90,90,self,"MOD_TRIGGER_HURT","orbital_laser_fov_mp");
		}

		glassradiusdamage(param_00.weapontag01.targetedent.var_2E6 + (0,0,32),var_01 * 2,200,200);
		if(param_00.beams)
		{
			glassradiusdamage(param_00.weapontag02.targetedent.var_2E6 + (0,0,32),var_01 * 2,200,200);
			glassradiusdamage(param_00.weapontag03.targetedent.var_2E6 + (0,0,32),var_01 * 2,200,200);
			glassradiusdamage(param_00.weapontag04.targetedent.var_2E6 + (0,0,32),var_01 * 2,200,200);
		}

		wait(0.15);
	}
}

//Function Number: 40
watchallplayerdeath(param_00,param_01)
{
	foreach(var_03 in level.var_328)
	{
		var_03 thread waitforlaserdeath(param_00,param_01);
	}
}

//Function Number: 41
waitforlaserdeath(param_00,param_01)
{
	self endon("OrbitalStrikeStreakComplete");
	param_00 endon("death");
	param_00 endon("PossessHoldTimeComplete");
	param_00 endon("leaving");
	for(;;)
	{
		self waittill("death",var_02,var_03,var_04);
		if(isdefined(var_04) && isdefined(var_02) && var_02 == param_01 && var_04 == "orbital_laser_fov_mp")
		{
			var_05 = 10;
			for(var_06 = 0;var_06 < var_05;var_06++)
			{
				wait(0.05);
				if(isdefined(self) && isdefined(self.body))
				{
					playfxontag(level._effect["orbital_laser_death"],self.body,"tag_origin");
					break;
				}
			}
		}

		wait(0.05);
	}
}

//Function Number: 42
laserdophysics(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	param_00 endon("death");
	param_00 endon("PossessHoldTimeComplete");
	param_00 endon("leaving");
	param_00 endon("stop_charge");
	var_01 = getlaserradius(param_00);
	var_02 = 2;
	for(;;)
	{
		var_03 = randomfloatrange(0.65,0.8);
		var_04 = randomintrange(-180,180);
		var_05 = (param_00.weapontag01.targetedent.var_41[0] * var_03,var_04,var_04);
		var_06 = anglestoforward(var_05);
		physicsexplosionsphere(param_00.weapontag01.targetedent.var_2E6 + (0,0,1),var_01,96,var_02);
		wait(0.4);
	}
}

//Function Number: 43
firelaserbeam(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	param_00 endon("death");
	playfireeffects(param_00);
	playbeameffects(param_00);
	startlasersounds(param_00);
	param_00 waittill("stop_charge");
	if(isdefined(param_00))
	{
		stopfireeffects(param_00);
		stopbeameffects(param_00);
		stoplasersounds(param_00);
	}
}

//Function Number: 44
laserpilotquake(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	param_00 endon("death");
	param_00 endon("stop_weapon");
	param_00 endon("stop_charge");
	var_01 = 0.25;
	earthquake(0.07,var_01,param_00.var_2E6,256);
	wait(var_01);
}

//Function Number: 45
lasersurfacequake(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	param_00 endon("death");
	param_00 endon("stop_weapon");
	param_00 endon("stop_charge");
	var_01 = 0.25;
	earthquake(0.5,var_01,param_00.weapontag01.targetedent.var_2E6 + (0,0,16),384);
	wait(var_01);
}

//Function Number: 46
playeffectongroundent(param_00,param_01,param_02)
{
	level endon("game_ended");
	self endon("death");
	var_03 = self method_850D();
	if(var_03)
	{
		playfxontag(param_01,self,"tag_origin");
	}
	else
	{
		playfxontag(param_00,self,"tag_origin");
	}

	for(;;)
	{
		var_04 = var_03;
		var_03 = self method_850D();
		if(var_03 != var_04)
		{
			if(var_03)
			{
				stopfxontag(param_00,self,"tag_origin");
				playfxontag(param_01,self,"tag_origin");
			}
			else
			{
				stopfxontag(param_01,self,"tag_origin");
				playfxontag(param_00,self,"tag_origin");
			}
		}

		var_05 = common_scripts\utility::waittill_notify_or_timeout_return(param_02,0.05);
		if(!isdefined(var_05) || var_05 != "timeout")
		{
			break;
		}
	}

	if(var_03)
	{
		stopfxontag(param_01,self,"tag_origin");
		return;
	}

	stopfxontag(param_00,self,"tag_origin");
}

//Function Number: 47
playwarmupeffects(param_00)
{
	var_01 = "stop_warmup_fx";
	var_02 = getwarmupeffect(param_00);
	var_03 = getwarmupeffect(param_00,1);
	param_00.weapontag01.targetedent thread playeffectongroundent(var_02,var_03,var_01);
	if(param_00.beams)
	{
		var_04 = getwarmuplightshoweffect(param_00);
		var_05 = getwarmuplightshoweffect(param_00,1);
		param_00.weapontag02.targetedent thread playeffectongroundent(var_04,var_05,var_01);
		param_00.weapontag03.targetedent thread playeffectongroundent(var_04,var_05,var_01);
		param_00.weapontag04.targetedent thread playeffectongroundent(var_04,var_05,var_01);
	}
}

//Function Number: 48
stopwarmupeffects(param_00)
{
	var_01 = "stop_warmup_fx";
	if(isdefined(param_00.weapontag01))
	{
		param_00.weapontag01.targetedent notify(var_01);
		if(param_00.beams)
		{
			param_00.weapontag02.targetedent notify(var_01);
			param_00.weapontag03.targetedent notify(var_01);
			param_00.weapontag04.targetedent notify(var_01);
		}
	}
}

//Function Number: 49
getwarmupeffect(param_00,param_01)
{
	var_02 = "orbital_laser_warmup";
	if(param_00.widebeam)
	{
		var_02 = var_02 + "_wide";
	}

	if(isdefined(param_01) && param_01)
	{
		var_02 = var_02 + "_water";
	}

	return common_scripts\utility::getfx(var_02);
}

//Function Number: 50
getwarmuplightshoweffect(param_00,param_01)
{
	var_02 = "orbital_laser_warmup_lightshow";
	if(param_00.widebeam)
	{
		var_02 = var_02 + "_wide";
	}

	if(isdefined(param_01) && param_01)
	{
		var_02 = var_02 + "_water";
	}

	return common_scripts\utility::getfx(var_02);
}

//Function Number: 51
playwarmupsounds(param_00,param_01)
{
	stopwarmupsounds(param_00);
	var_02 = "vulcan_charge_start_npc";
	var_03 = "vulcan_charge_start_plr";
	if(param_01)
	{
		var_02 = "vulcan_charge_up_npc";
		var_03 = "vulcan_charge_up_plr";
	}

	param_00.weapontag01.targetedent playsoundonmovingent(var_02);
	if(param_00.beams)
	{
		param_00.weapontag02.targetedent playsoundonmovingent(var_02);
		param_00.weapontag03.targetedent playsoundonmovingent(var_02);
		param_00.weapontag04.targetedent playsoundonmovingent(var_02);
	}

	self method_82F4(var_03);
}

//Function Number: 52
stopwarmupsounds(param_00)
{
	if(isdefined(param_00.weapontag01))
	{
		param_00.weapontag01.targetedent stopsounds();
		if(param_00.beams)
		{
			param_00.weapontag02.targetedent stopsounds();
			param_00.weapontag03.targetedent stopsounds();
			param_00.weapontag04.targetedent stopsounds();
		}
	}

	if(isdefined(self))
	{
		self method_82F5("vulcan_charge_start_plr");
		self method_82F5("vulcan_charge_up_plr");
	}
}

//Function Number: 53
playfireeffects(param_00)
{
	var_01 = "stop_fire_fx";
	var_02 = getfireeffect(param_00);
	var_03 = getfireeffect(param_00,1);
	var_04 = getfirelightshoweffect(param_00);
	var_05 = getfirelightshoweffect(param_00,1);
	if(param_00.beams)
	{
		param_00.weapontag01.targetedent thread playeffectongroundent(var_04,var_05,var_01);
		param_00.weapontag02.targetedent thread playeffectongroundent(var_04,var_05,var_01);
		param_00.weapontag03.targetedent thread playeffectongroundent(var_04,var_05,var_01);
		param_00.weapontag04.targetedent thread playeffectongroundent(var_04,var_05,var_01);
		return;
	}

	param_00.weapontag01.targetedent thread playeffectongroundent(var_02,var_03,var_01);
}

//Function Number: 54
stopfireeffects(param_00)
{
	var_01 = "stop_fire_fx";
	if(isdefined(param_00.weapontag01))
	{
		param_00.weapontag01.targetedent notify(var_01);
		if(param_00.beams)
		{
			param_00.weapontag02.targetedent notify(var_01);
			param_00.weapontag03.targetedent notify(var_01);
			param_00.weapontag04.targetedent notify(var_01);
		}

		playlaserendingeffect(param_00);
	}
}

//Function Number: 55
playlaserendingeffect(param_00)
{
	var_01 = param_00.weapontag01.targetedent;
	if(var_01 method_850D())
	{
		playfx(level._effect["orbital_laser_ending_water"],var_01.var_2E6,anglestoforward(var_01.var_41),anglestoup(var_01.var_41));
		return;
	}

	playfx(level._effect["orbital_laser_ending"],var_01.var_2E6,anglestoforward(var_01.var_41),anglestoup(var_01.var_41));
}

//Function Number: 56
getfireeffect(param_00,param_01)
{
	var_02 = "orbital_laser_fire";
	if(param_00.widebeam)
	{
		var_02 = var_02 + "_wide";
	}

	if(isdefined(param_01) && param_01)
	{
		var_02 = var_02 + "_water";
	}

	return common_scripts\utility::getfx(var_02);
}

//Function Number: 57
getfirelightshoweffect(param_00,param_01)
{
	var_02 = "orbital_laser_fire_lightshow";
	if(param_00.widebeam)
	{
		var_02 = var_02 + "_wide";
	}

	if(isdefined(param_01) && param_01)
	{
		var_02 = var_02 + "_water";
	}

	return common_scripts\utility::getfx(var_02);
}

//Function Number: 58
playbeameffects(param_00)
{
	var_01 = getbeameffect(param_00);
	playfxontag(var_01,param_00.weapontag01.targetedent,"tag_origin");
	if(param_00.beams)
	{
		var_02 = getlightshowbeameffect(param_00);
		playfxontag(var_02,param_00.weapontag02.targetedent,"tag_origin");
		playfxontag(var_02,param_00.weapontag03.targetedent,"tag_origin");
		playfxontag(var_02,param_00.weapontag04.targetedent,"tag_origin");
	}
}

//Function Number: 59
stopbeameffects(param_00)
{
	var_01 = getbeameffect(param_00);
	wait 0.05;
	if(isdefined(param_00.weapontag01))
	{
		stopfxontag(var_01,param_00.weapontag01.targetedent,"tag_origin");
		if(param_00.beams)
		{
			var_02 = getlightshowbeameffect(param_00);
			stopfxontag(var_02,param_00.weapontag02.targetedent,"tag_origin");
			stopfxontag(var_02,param_00.weapontag03.targetedent,"tag_origin");
			stopfxontag(var_02,param_00.weapontag04.targetedent,"tag_origin");
		}
	}
}

//Function Number: 60
playlingereffects(param_00)
{
	playfxontag("orbital_laser_smoldering",param_00.weapontag01.targetedent,"tag_origin");
}

//Function Number: 61
getbeameffect(param_00)
{
	var_01 = "orbital_laser_beam";
	if(param_00.widebeam)
	{
		var_01 = var_01 + "_wide";
	}

	return common_scripts\utility::getfx(var_01);
}

//Function Number: 62
getlightshowbeameffect(param_00)
{
	var_01 = "orbital_laser_beam_lightshow";
	if(param_00.widebeam)
	{
		var_01 = var_01 + "_wide";
	}

	return common_scripts\utility::getfx(var_01);
}

//Function Number: 63
orbitalstriketimer(param_00,param_01)
{
	self endon("disconnect");
	self endon("OrbitalStrikeStreakComplete");
	wait(param_00);
	param_01 notify("leaving");
}

//Function Number: 64
monitororbitalstrikedeath(param_00)
{
	self endon("disconnect");
	self endon("game_ended");
	self endon("OrbitalStrikeStreakComplete");
	param_00 waittill("death",var_01,var_02,var_03);
	param_00 maps\mp\gametypes\_damage::onkillstreakkilled(var_01,var_03,var_02,param_00.health + 1,"vulcan_destroyed",undefined,undefined,1);
	param_00 notify("finish_death");
}

//Function Number: 65
monitororbitalstriketimeout(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	param_00 common_scripts\utility::waittill_any("leaving","crashing","PossessHoldTimeComplete","done","finish_death");
	thread orbitalstrikecleanup(param_00);
}

//Function Number: 66
givecontrolback(param_00)
{
	if(isdefined(param_00) && isdefined(param_00.weapontag01))
	{
		param_00.weapontag01.targetedent method_8383(undefined);
		if(param_00.beams)
		{
			param_00.weapontag02.targetedent method_8383(undefined);
			param_00.weapontag03.targetedent method_8383(undefined);
			param_00.weapontag04.targetedent method_8383(undefined);
		}
	}

	self setclientomnvar("ui_orbital_laser_charge",0);
	self setclientomnvar("ui_orbital_laser_mode",0);
	self setclientomnvar("ui_orbital_laser_bursts",0);
	self setclientomnvar("ui_orbital_laser_fire",0);
	self setclientomnvar("ui_orbital_laser",0);
	maps\mp\killstreaks\_aerial_utility::playerdisablestreakstatic();
	self takeweapon("orbital_laser_fov_mp");
	if(self.disabledweaponswitch > 0)
	{
		common_scripts\utility::_enableweaponswitch();
	}

	self setblurforplayer(0,0);
	self method_851A(1);
	maps\mp\killstreaks\_aerial_utility::disableorbitalthermal(self);
	self method_80B9();
	self remotecontrolvehicleoff();
	self controlsunlink();
	self cameraunlink();
	if(maps\mp\_utility::isusingremote())
	{
		maps\mp\_utility::clearusingremote();
	}

	thread delaycontrol();
	thread removevulcanvisionandlightsetpermap(0.5);
	if(getdvarint("camera_thirdPerson"))
	{
		maps\mp\_utility::setthirdpersondof(1);
	}

	maps\mp\_utility::playerrestoreangles();
	self notify("player_control_strike_over");
}

//Function Number: 67
delaycontrol()
{
	self freezecontrols(1);
	wait(0.5);
	self freezecontrols(0);
}

//Function Number: 68
monitorplayerdisconnect(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	self waittill("disconnect");
	thread orbitalstrikecleanup(param_00,1);
}

//Function Number: 69
monitorplayerteamchange(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	common_scripts\utility::waittill_either("joined_team","joined_spectators");
	thread orbitalstrikecleanup(param_00);
}

//Function Number: 70
monitorgameended(param_00)
{
	self endon("OrbitalStrikeStreakComplete");
	level waittill("game_ended");
	thread orbitalstrikecleanup(param_00);
}

//Function Number: 71
orbitalstrikecleanup(param_00,param_01)
{
	self notify("OrbitalStrikeStreakComplete");
	waittillframeend;
	if(!isdefined(param_00))
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(!param_01)
	{
		self.controllingorbitallaser = 0;
		givecontrolback(param_00);
		playerremovenotifycommands();
	}

	level.orbital_lasers = common_scripts\utility::array_remove(level.orbital_lasers,param_00);
	if(level.teambased)
	{
		setorbitallaserforteam(param_00.inliveplayerkillstreak,0);
	}

	stopwarmupsounds(param_00);
	stoplasersounds(param_00);
	stopwarmupeffects(param_00);
	stopfireeffects(param_00);
	stopbeameffects(param_00);
	deleteweaponmodels(param_00);
	param_00 delete();
	maps\mp\_utility::decrementfauxvehiclecount();
	wait 0.05;
	if(isdefined(self))
	{
		self stoprumble("orbital_laser_charge");
		self stoprumble("orbital_laser_charge_quick");
	}

	wait 0.05;
	if(isdefined(self))
	{
		self stoprumble("orbital_laser_fire");
	}
}

//Function Number: 72
playeraddnotifycommands()
{
	if(!isbot(self))
	{
		self notifyonplayercommand("SwitchVisionMode","+actionslot 1");
		self notifyonplayercommand("ToggleControlState","+activate");
		self notifyonplayercommand("ToggleControlCancel","-activate");
		self notifyonplayercommand("ToggleControlState","+usereload");
		self notifyonplayercommand("ToggleControlCancel","-usereload");
		self notifyonplayercommand("StartFire","+attack");
		self notifyonplayercommand("StartFire","+attack_akimbo_accessible");
	}
}

//Function Number: 73
playerremovenotifycommands()
{
	if(!isbot(self))
	{
		self method_849C("SwitchVisionMode","+actionslot 1");
		self method_849C("ToggleControlState","+activate");
		self method_849C("ToggleControlCancel","-activate");
		self method_849C("ToggleControlState","+usereload");
		self method_849C("ToggleControlCancel","-usereload");
		self method_849C("StartFire","+attack");
		self method_849C("StartFire","+attack_akimbo_accessible");
	}
}

//Function Number: 74
setvulcanvisionandlightsetpermap(param_00)
{
	self endon("disconnect");
	self endon("game_ended");
	self endon("OrbitalStrikeStreakComplete");
	wait(param_00);
	if(isdefined(level.vulcanvisionset))
	{
		self method_847A(level.vulcanvisionset,0);
	}

	if(isdefined(level.vulcanlightset))
	{
		self method_83C0(level.vulcanlightset);
	}

	maps\mp\killstreaks\_aerial_utility::handle_player_starting_aerial_view();
}

//Function Number: 75
removevulcanvisionandlightsetpermap(param_00)
{
	self method_847A("",param_00);
	self method_83C0("");
	maps\mp\killstreaks\_aerial_utility::handle_player_ending_aerial_view();
}