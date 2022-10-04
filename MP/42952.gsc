/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42952.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 38
 * Decompile Time: 43 ms
 * Timestamp: 4/20/2022 8:18:34 PM
*******************************************************************/

//Function Number: 1
lib_A7C8::init()
{
	level._orbital_care_pod = [];
	level.orbitaldropmarkers = [];
	level._effect["ocp_death"] = loadfx("vfx/explosion/exo_droppod_explosion");
	level._effect["ocp_midair"] = loadfx("vfx/explosion/exo_droppod_split");
	level._effect["ocp_ground_marker"] = loadfx("vfx/unique/vfx_marker_killstreak_guide_carepackage");
	level._effect["ocp_ground_marker_bad"] = loadfx("vfx/unique/vfx_marker_killstreak_guide_carepackage_fizzle");
	level._effect["ocp_exhaust"] = loadfx("vfx/vehicle/vehicle_ocp_exhaust");
	level._effect["ocp_thruster_small"] = loadfx("vfx/vehicle/vehicle_ocp_thrusters_small");
	level._effect["vfx_ocp_steam"] = loadfx("vfx/steam/vfx_ocp_steam");
	level._effect["vfx_ocp_steam2"] = loadfx("vfx/steam/vfx_ocp_steam2");
	level._effect["ocp_glow"] = loadfx("vfx/unique/orbital_carepackage_glow");
	level.killstreakfuncs["orbital_carepackage"] = ::lib_A7C8::tryusedefaultorbitalcarepackage;
	level.killstreakwieldweapons["orbital_carepackage_pod_mp"] = "orbital_carepackage";
	level.killstreakfuncs["orbital_carepackage_juggernaut_exosuit"] = ::lib_A7C8::tryuseorbitaljuggernautexosuit;
	precachempanim("orbital_care_package_open");
	precachempanim("orbital_care_package_fan_spin");
	level.ocp_weap_name = "orbital_carepackage_pod_mp";
	if(!isdefined(level.missileitemclipdelay))
	{
		level.missileitemclipdelay = 3;
	}
}

//Function Number: 2
lib_A7C8::tryusedefaultorbitalcarepackage(param_00,param_01)
{
	return lib_A7C8::tryuseorbitalcarepackage(param_00,"orbital_carepackage",param_01);
}

//Function Number: 3
lib_A7C8::tryuseorbitaljuggernautexosuit(param_00,param_01)
{
	return lib_A7C8::tryuseorbitalcarepackage(param_00,"orbital_carepackage_juggernaut_exosuit",param_01);
}

//Function Number: 4
lib_A7C8::tryuseorbitalcarepackage(param_00,param_01,param_02)
{
	if((common_scripts\utility::array_contains(param_02,"orbital_carepackage_drone") && maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed()) || level.fauxvehiclecount + 1 >= maps\mp\_utility::maxvehiclesallowed())
	{
		self iprintlnbold(&"MP_TOO_MANY_VEHICLES");
		return 0;
	}

	var_03 = lib_A7C8::playerlaunchcarepackage(param_01,param_02);
	if(!isdefined(var_03) || !var_03)
	{
		return 0;
	}

	if(param_01 == "orbital_carepackage")
	{
		maps\mp\gametypes\_missions::processchallenge("ch_streak_orbitalcare",1);
	}

	return 1;
}

//Function Number: 5
lib_A7C8::playerlaunchcarepackage(param_00,param_01)
{
	var_02 = maps\mp\killstreaks\_orbital_util::playergetoutsidenode("carepackage");
	var_03 = undefined;
	if(isdefined(var_02))
	{
		var_03 = var_02.var_2E6;
	}
	else if(isdefined(level.var_511A) && level.var_511A)
	{
		var_02 = [[ level.var_4995 ]]();
		var_03 = var_02.var_2E6;
	}
	else
	{
		thread maps\mp\killstreaks\_orbital_util::playerplayinvalidpositioneffect(common_scripts\utility::getfx("ocp_ground_marker_bad"));
		self setclientomnvar("ui_invalid_orbital_care_package",1);
		return 0;
	}

	var_04 = undefined;
	if(common_scripts\utility::array_contains(param_01,"orbital_carepackage_drone"))
	{
		var_04 = spawnhelicopter(self,var_03 + (0,0,200),(0,0,0),"orbital_carepackage_drone_mp","orbital_carepackage_pod_01_vehicle");
		if(!isdefined(var_04))
		{
			return 0;
		}

		var_04 hide();
	}

	var_05 = lib_A7C8::firepod(level.ocp_weap_name,self,var_02,param_00,param_01,var_04,undefined,undefined,1);
	return isdefined(var_05);
}

//Function Number: 6
lib_A7C8::firepod(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	if(!isdefined(param_06))
	{
		param_06 = param_01 maps\mp\killstreaks\_orbital_util::playergetorbitalstartpos(param_02,"carepackage");
	}

	var_09 = param_02.var_2E6;
	if(!isdefined(param_07))
	{
		param_07 = [];
	}

	var_0A = magicbullet(param_00,param_06,var_09,param_01,0,1);
	if(!isdefined(var_0A))
	{
		return;
	}

	var_0A thread lib_A7C8::setmissilespecialclipmaskdelayed(level.missileitemclipdelay);
	if(!isdefined(level.iszombiegame) || !level.iszombiegame)
	{
		var_0A thread lib_A7C8::trajectory_kill(param_01);
	}

	var_0B = param_01 lib_A7C8::createplayerdroppod(var_0A);
	var_0B.streakname = param_03;
	var_0B.var_5D57 = param_04;
	var_0B.var_2F8D = param_02.var_2E6;
	var_0B.var_2E19 = param_05;
	var_0B.givebackcarepackage = param_08;
	var_0A.inliveplayerkillstreak = param_01.inliveplayerkillstreak;
	var_0A.owner = param_01;
	var_0A.type = "remote";
	return lib_A7C8::monitordrop(param_01,var_0A,var_0B,param_03,param_07,param_00);
}

//Function Number: 7
lib_A7C8::trajectory_kill(param_00)
{
	self endon("death");
	var_01 = self.var_2E6;
	while(isdefined(self))
	{
		if(!level.teambased)
		{
			lib_A7C8::capsule_damage(10000,self.var_2E6,var_01,30,undefined,param_00);
		}
		else
		{
			lib_A7C8::capsule_damage(10000,self.var_2E6,var_01,30,level.matchbonus[param_00.inliveplayerkillstreak],param_00);
		}

		var_01 = self.var_2E6;
		wait(0.05);
	}
}

//Function Number: 8
lib_A7C8::capsule_damage(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = param_02 - param_01;
	var_07 = vectornormalize(var_06);
	var_08 = length(var_06);
	var_09 = param_03 * param_03;
	foreach(var_0B in level.characters)
	{
		if(!isalive(var_0B))
		{
			continue;
		}

		if(var_0B != param_05 && isdefined(param_04) && isdefined(var_0B.inliveplayerkillstreak) && var_0B.inliveplayerkillstreak != param_04)
		{
			continue;
		}

		var_0C = var_0B.var_2E6 - param_01;
		var_0D = vectordot(var_0C,var_07);
		if(var_0D > param_03 * -1 && var_0D < var_08 + param_03)
		{
			var_0E = param_01 + var_07 * var_0D;
			var_0F = distancesquared(var_0E,var_0B.var_2E6);
			if(var_0F <= var_09)
			{
				var_0B dodamage(param_00,var_0E,param_05,self,"MOD_EXPLOSIVE",level.ocp_weap_name);
			}
		}
	}
}

//Function Number: 9
lib_A7C8::setmissilespecialclipmaskdelayed(param_00)
{
	self endon("death");
	wait(param_00);
	self method_851C(1);
}

//Function Number: 10
lib_A7C8::createplayerdroppod(param_00)
{
	var_01 = 0;
	if(!isdefined(level._orbital_care_pod))
	{
		level._orbital_care_pod = [];
	}
	else
	{
		level._orbital_care_pod = maps\mp\_utility::cleanarray(level._orbital_care_pod);
		var_01 = level._orbital_care_pod.size;
	}

	level._orbital_care_pod[var_01] = spawnstruct();
	level._orbital_care_pod[var_01].hasleftcam = 0;
	level._orbital_care_pod[var_01].podrocket = param_00;
	level._orbital_care_pod[var_01].podrocket.var_275 = 100;
	level._orbital_care_pod[var_01].podrocket.health = 100;
	level._orbital_care_pod[var_01].podrocket.damagetaken = 0;
	level._orbital_care_pod[var_01].podrocket.ispodrocket = 1;
	level._orbital_care_pod[var_01].owner = self;
	level._orbital_care_pod[var_01].alive = 1;
	return level._orbital_care_pod[var_01];
}

//Function Number: 11
lib_A7C8::rocket_cleanupondeath()
{
	var_00 = self getentitynumber();
	level.rockets[var_00] = self;
	self waittill("death");
	if(isdefined(level.orbitaldropupgrade) && level.orbitaldropupgrade == 1)
	{
		function_0071("dna_aoe_grenade_throw_zombie_mp",self.var_2E6 + (0,0,64),(0,0,0),3,level.var_31D,1);
	}

	level.rockets[var_00] = undefined;
	if(isdefined(self.killcament))
	{
		self.killcament unlink();
		self.killcament.var_2E6 = self.killcament.var_2E6 + (0,0,300);
	}
}

//Function Number: 12
lib_A7C8::getdroptypefromstreakname(param_00)
{
	switch(param_00)
	{
		case "orbital_carepackage_juggernaut_exosuit":
			break;

		case "airdrop_reinforcement_common":
			break;

		case "airdrop_reinforcement_uncommon":
			break;

		case "airdrop_reinforcement_rare":
			break;

		case "airdrop_reinforcement_practice":
			break;

		case "horde_support_drop":
			break;

		default:
			break;
	}
}

//Function Number: 13
lib_A7C8::allowdronedelivery(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(level.teambased && level.var_91E7[param_00.inliveplayerkillstreak])
	{
		return 0;
	}

	if(!level.teambased && isdefined(level.empplayer) && level.empplayer != param_00)
	{
		return 0;
	}

	return 1;
}

//Function Number: 14
lib_A7C8::monitordrop(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A7C8::getdroptypefromstreakname(param_03);
	if(var_06 == "airdrop_assault" && common_scripts\utility::array_contains(param_02.var_5D57,"orbital_carepackage_odds"))
	{
		var_06 = "airdrop_assault_odds";
	}

	if(isdefined(level.getcratefordroptype))
	{
		var_07 = [[ level.getcratefordroptype ]](var_06);
	}
	else
	{
		var_07 = maps\mp\killstreaks\_airdrop::getcratetypefordroptype(var_07);
	}

	thread lib_A7C8::monitordropinternal(param_00,param_01,param_02,var_06,var_07,param_05);
	return var_07;
}

//Function Number: 15
lib_A7C8::monitordropinternal(param_00,param_01,param_02,param_03,param_04,param_05)
{
	level endon("game_ended");
	param_01 thread lib_A7C8::rocket_cleanupondeath();
	var_06 = common_scripts\utility::array_contains(param_02.var_5D57,"orbital_carepackage_trap");
	var_07 = param_00 maps\mp\killstreaks\_airdrop::createairdropcrate(param_00,param_03,param_04,param_01.var_2E6,undefined,var_06,0);
	var_07.moduletrap = common_scripts\utility::array_contains(param_02.var_5D57,"orbital_carepackage_trap");
	var_07.modulehide = common_scripts\utility::array_contains(param_02.var_5D57,"orbital_carepackage_hide");
	var_07.moduleroll = common_scripts\utility::array_contains(param_02.var_5D57,"orbital_carepackage_roll");
	var_07.modulepickup = common_scripts\utility::array_contains(param_02.var_5D57,"orbital_carepackage_fast_pickup");
	var_07.var_41 = (0,0,0);
	var_07.en_route_in_air = 1;
	param_01.killcament = var_07.killcament;
	if(param_05 == "orbital_carepackage_pod_plane_mp")
	{
		param_01.killcament.var_534F = gettime();
	}

	var_08 = common_scripts\utility::array_contains(param_02.var_5D57,"orbital_carepackage_drone");
	var_09 = spawn("script_model",param_02.var_2F8D + (0,0,5));
	var_09.var_41 = (-90,0,0);
	var_09 setmodel("tag_origin");
	var_09 hide();
	var_09 showtoplayer(param_00);
	playfxontag(common_scripts\utility::getfx("ocp_ground_marker"),var_09,"tag_origin");
	var_09 thread lib_A7C8::carepackagesetupminimap(param_02.var_5D57,param_00);
	maps\mp\killstreaks\_orbital_util::adddropmarker(var_09);
	if(var_08)
	{
		param_00 thread lib_A7C8::playermonitorfordronedelivery(param_01,param_02,var_09,var_07);
	}

	var_07 linkto(param_01,"tag_origin",(0,0,0),(-90,0,0));
	param_01 waittill("death",var_0A,var_0B,var_0C);
	if(isdefined(param_01) && !var_08 && param_01.var_2E6[2] > param_02.var_2F8D[2] && distancesquared(param_01.var_2E6,param_02.var_2F8D) > 22500)
	{
		if(param_02.givebackcarepackage)
		{
			if(isdefined(level.var_511A) && level.var_511A)
			{
				var_0D = [[ level.var_4995 ]]();
				lib_A7C8::firepod(level.ocp_weap_name,self,var_0D,"horde_support_drop",param_02.var_5D57,0,undefined,undefined,1);
			}
			else if(isdefined(param_00))
			{
				param_00 lib_A7C8::playergivebackcarepackage(param_02);
			}
		}

		level thread lib_A7C8::cleanupcarepackage(param_02,var_07,var_09);
		return;
	}

	if(var_08 && lib_A7C8::allowdronedelivery(param_00) && isdefined(param_02.var_2E19))
	{
		param_02.var_2E19 show();
	}
	else
	{
		earthquake(0.4,1,param_02.var_2F8D,800);
		playrumbleonposition("artillery_rumble",param_02.var_2F8D);
	}

	killfxontag(common_scripts\utility::getfx("ocp_ground_marker"),var_09,"tag_origin");
	param_02.alive = 0;
	if(var_08 && lib_A7C8::allowdronedelivery(param_00) && isdefined(param_02.var_2E19))
	{
		param_02.var_2E19 waittill("delivered");
		var_07 setcontents(var_07.var_63C4);
		var_07.var_63C4 = undefined;
	}

	var_09 thread lib_A7C8::carepackagecleanup(var_07);
	var_07 clonebrushmodeltoscriptmodel(level.var_996);
	var_07.droppingtoground = 1;
	var_07 unlink();
	var_07 physicslaunchserver((0,0,0));
	var_07 thread lib_A7C8::cratedetectstopphysics();
	var_07 thread lib_A7C8::orbitalphysicswaiter(param_03,param_04,param_00);
	level thread lib_A7C8::removepod(var_07,param_02);
	var_07.en_route_in_air = 0;
}

//Function Number: 16
lib_A7C8::crateimpactcleanup(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	var_01 = getnodesinradiussorted(self.var_2E6,300,0,300);
	foreach(var_03 in level.characters)
	{
		if(!isalive(var_03))
		{
			continue;
		}

		if(function_0285(var_03,param_00))
		{
			if(var_03 istouching(self))
			{
				foreach(var_05 in var_01)
				{
					if(distancesquared(var_05.var_2E6,self.var_2E6) > 10000)
					{
						var_03 setorigin(var_05.var_2E6,1);
						var_01 = common_scripts\utility::array_remove(var_01,var_05);
						break;
					}
				}
			}
		}
	}
}

//Function Number: 17
lib_A7C8::cratedetectstopphysics()
{
	self endon("physics_finished");
	self endon("death");
	var_00 = 4;
	var_01 = var_00 / 0.05;
	var_02 = 25;
	var_03 = 0;
	var_04 = self.var_2E6;
	for(;;)
	{
		wait 0.05;
		var_05 = distancesquared(var_04,self.var_2E6);
		if(var_05 < var_02)
		{
			var_03++;
		}
		else
		{
			var_03 = 0;
		}

		var_04 = self.var_2E6;
		if(var_03 >= var_01)
		{
			self method_84E1();
			return;
		}
	}
}

//Function Number: 18
lib_A7C8::playergivebackcarepackage(param_00)
{
	var_01 = maps\mp\killstreaks\_killstreaks::getstreakcost("orbital_carepackage");
	var_02 = maps\mp\killstreaks\_killstreaks::getnextkillstreakslotindex("orbital_carepackage",0);
	thread maps\mp\gametypes\_hud_message::killstreaksplashnotify("orbital_carepackage",var_01,undefined,param_00.var_5D57,var_02);
	thread maps\mp\killstreaks\_killstreaks::givekillstreak("orbital_carepackage",0,0,self,param_00.var_5D57);
}

//Function Number: 19
lib_A7C8::cleanupcarepackage(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		thread lib_A7C8::removepod(param_01,param_00);
		param_01 delete();
	}

	if(isdefined(param_00.var_2E19))
	{
		param_00.var_2E19 maps\mp\killstreaks\_drone_carepackage::carepackagedrone_remove();
	}

	if(isdefined(param_02))
	{
		if(isdefined(param_02.objidfriendly))
		{
			maps\mp\_utility::_objective_delete(param_02.objidfriendly);
		}

		if(isdefined(param_02.objidenemy))
		{
			maps\mp\_utility::_objective_delete(param_02.objidenemy);
		}

		killfxontag(common_scripts\utility::getfx("ocp_ground_marker"),param_02,"tag_origin");
		wait 0.05;
		param_02 delete();
	}
}

//Function Number: 20
lib_A7C8::orbitalphysicswaiter(param_00,param_01,param_02)
{
	self endon("death");
	maps\mp\killstreaks\_airdrop::physicswaiter(param_00,param_01);
	self playsoundasmaster("orbital_pkg_panel");
	if(isdefined(self.enemymodel))
	{
		self.enemymodel thread lib_A7C8::orbitalanimate();
		self.enemymodel solid();
	}

	if(isdefined(self.var_3AB6))
	{
		self.var_3AB6 thread lib_A7C8::orbitalanimate();
		self.var_3AB6 solid();
	}

	thread lib_A7C8::crateimpactcleanup(param_02);
}

//Function Number: 21
lib_A7C8::orbitalanimate(param_00)
{
	self endon("death");
	if(!isdefined(param_00) || !param_00)
	{
		wait(0.75);
	}

	if(isdefined(param_00) && param_00)
	{
		self scriptmodelplayanim("orbital_care_package_open_loop");
	}
	else
	{
		self scriptmodelplayanim("orbital_care_package_open");
	}

	playfxontag(common_scripts\utility::getfx("ocp_glow"),self,"TAG_ORIGIN");
	if(!isdefined(param_00) || !param_00)
	{
		wait 0.05;
		playfxontag(common_scripts\utility::getfx("vfx_ocp_steam2"),self,"TAG_FX_PANEL_F");
		playfxontag(common_scripts\utility::getfx("vfx_ocp_steam2"),self,"TAG_FX_PANEL_K");
		wait 0.05;
		playfxontag(common_scripts\utility::getfx("vfx_ocp_steam"),self,"TAG_FX_PANEL_FR");
		playfxontag(common_scripts\utility::getfx("vfx_ocp_steam"),self,"TAG_FX_PANEL_KL");
		wait 0.05;
		playfxontag(common_scripts\utility::getfx("vfx_ocp_steam"),self,"TAG_FX_PANEL_FL");
		playfxontag(common_scripts\utility::getfx("vfx_ocp_steam"),self,"TAG_FX_PANEL_KR");
	}
}

//Function Number: 22
lib_A7C8::delaycleanupdroppod(param_00)
{
	wait(5);
	param_00 delete();
}

//Function Number: 23
lib_A7C8::removepod(param_00,param_01)
{
	param_00 waittill("death");
	wait(15);
	for(var_02 = 0;var_02 < level._orbital_care_pod.size;var_02++)
	{
		if(isdefined(level._orbital_care_pod[var_02]) && level._orbital_care_pod[var_02] == param_01)
		{
			if(level._orbital_care_pod[var_02].alive == 0)
			{
				level._orbital_care_pod[var_02] = undefined;
			}
		}
	}

	if(isdefined(param_01))
	{
		param_01 = undefined;
	}
}

//Function Number: 24
lib_A7C8::carepackagesetupminimap(param_00,param_01)
{
	self endon("death");
	if(common_scripts\utility::array_contains(param_00,"orbital_carepackage_hide"))
	{
		return;
	}

	var_02 = maps\mp\gametypes\_gameobjects::getnextobjid();
	objective_add(var_02,"invisible",(0,0,0));
	objective_position(var_02,self.var_2E6);
	objective_state(var_02,"active");
	var_03 = "compass_objpoint_ammo_friendly";
	objective_icon(var_02,var_03);
	if(!level.teambased)
	{
		objective_playerteam(var_02,param_01 getentitynumber());
	}
	else
	{
		objective_team(var_02,param_01.inliveplayerkillstreak);
	}

	self.objidfriendly = var_02;
	if(!isdefined(level.var_511A) && level.var_511A)
	{
		var_02 = maps\mp\gametypes\_gameobjects::getnextobjid();
		objective_add(var_02,"invisible",(0,0,0));
		objective_position(var_02,self.var_2E6);
		objective_state(var_02,"active");
		objective_icon(var_02,"compass_objpoint_ammo_enemy");
		if(!level.teambased)
		{
			objective_playerenemyteam(var_02,param_01 getentitynumber());
		}
		else
		{
			objective_team(var_02,level.matchbonus[param_01.inliveplayerkillstreak]);
		}

		self.objidenemy = var_02;
	}

	if(common_scripts\utility::array_contains(param_00,"orbital_carepackage_drone"))
	{
		self waittill("linkedToDrone");
		objective_onentity(self.objidfriendly,self);
		if(isdefined(self.objidenemy))
		{
			objective_onentity(self.objidenemy,self);
			self show();
		}
	}
}

//Function Number: 25
lib_A7C8::carepackagecleanup(param_00)
{
	param_00 common_scripts\utility::waittill_any("physics_finished","death");
	if(isdefined(self.objidfriendly))
	{
		maps\mp\_utility::_objective_delete(self.objidfriendly);
	}

	if(isdefined(self.objidenemy))
	{
		maps\mp\_utility::_objective_delete(self.objidenemy);
	}

	killfxontag(common_scripts\utility::getfx("ocp_glow"),self,"TAG_ORIGIN");
	if(isdefined(level.var_511A) && level.var_511A)
	{
		param_00 notify("drop_pod_cleared");
	}

	wait 0.05;
	self delete();
}

//Function Number: 26
lib_A7C8::setupdamagecallback(param_00)
{
	param_00.health = 500;
	param_00.var_275 = param_00.health;
	param_00.readytodie = 0;
	lib_A7C8::setupdamagecallbackinternal(param_00.var_3AB6);
	lib_A7C8::setupdamagecallbackinternal(param_00.enemymodel);
}

//Function Number: 27
lib_A7C8::setupdamagecallbackinternal(param_00)
{
	param_00 thread maps\mp\gametypes\_damage::setentitydamagecallback(9999,undefined,undefined,::lib_A7C8::cratehandledamagecallback,1);
}

//Function Number: 28
lib_A7C8::disabledamagecallback(param_00)
{
	lib_A7C8::disabledamagecallbackinternal(param_00.var_3AB6);
	lib_A7C8::disabledamagecallbackinternal(param_00.enemymodel);
}

//Function Number: 29
lib_A7C8::disabledamagecallbackinternal(param_00)
{
	param_00.damagecallback = undefined;
	param_00 setcandamage(0);
	param_00 method_8495(0);
}

//Function Number: 30
lib_A7C8::cratehandledamagecallback(param_00,param_01,param_02,param_03)
{
	var_04 = self;
	if(isdefined(self.var_6684))
	{
		var_04 = self.var_6684;
	}

	var_05 = maps\mp\gametypes\_damage::modifydamage(param_00,param_01,param_02,param_03);
	var_04.health = var_04.health - var_05;
	if(var_04.health <= 0)
	{
		lib_A7C8::disabledamagecallback(var_04);
		var_04 notify("disabled");
	}

	return 0;
}

//Function Number: 31
lib_A7C8::playermonitorfordronedelivery(param_00,param_01,param_02,param_03)
{
	self endon("disconenct");
	self endon("joined_team");
	self endon("joined_spectators");
	var_04 = 576;
	var_05 = 250000;
	var_06 = param_01.var_2F8D;
	var_07 = param_00.var_2E6;
	var_08 = distancesquared(var_07,var_06);
	lib_A7C8::setupdamagecallback(param_03);
	var_09 = param_01.var_2E19;
	var_09 thread lib_A7C8::carepackagedronewatchcratedeath(param_03);
	param_03.var_63C4 = param_03 setcontents(0);
	param_03.var_3AB6 solid();
	param_03.enemymodel solid();
	for(;;)
	{
		if(!isdefined(param_00))
		{
			break;
		}

		var_07 = param_00.var_2E6;
		var_08 = distancesquared(var_07,var_06);
		if(var_08 <= var_05)
		{
			break;
		}

		wait 0.05;
	}

	if(var_08 > var_05)
	{
		if(param_01.givebackcarepackage && lib_A7C8::allowdronedelivery(self))
		{
			lib_A7C8::playergivebackcarepackage(param_01);
		}

		level thread lib_A7C8::cleanupcarepackage(param_01,param_03,param_02);
		return;
	}

	if(!isdefined(self))
	{
		level thread lib_A7C8::cleanupcarepackage(param_01,param_03,param_02);
		return;
	}

	if(!lib_A7C8::allowdronedelivery(self))
	{
		level thread lib_A7C8::cleanupcarepackage(param_03,undefined,undefined);
		return;
	}

	var_09 thread lib_A7C8::carepackagedronewatchdeath();
	var_09 endon("death");
	var_09 veh_teleport(param_03.var_2E6,param_03.var_41,0,0);
	param_03 linkto(var_09,"tag_origin",(0,0,0),(0,0,0));
	param_03.var_3AB6 scriptmodelplayanim("orbital_care_package_fan_spin","nothing");
	param_03.enemymodel scriptmodelplayanim("orbital_care_package_fan_spin","nothing");
	maps\mp\killstreaks\_drone_carepackage::setupcarepackagedrone(var_09,1);
	var_09.crate = param_03;
	if(isdefined(param_00))
	{
		var_07 = param_00.var_2E6;
		param_00 notify("death");
		param_00 delete();
	}

	playsoundatpos(var_07,"orbital_pkg_pod_midair_exp");
	playfx(common_scripts\utility::getfx("ocp_midair"),var_07,getdvarvector("scr_ocp_forward",(0,0,-1)));
	var_09 thread lib_A7C8::drone_thrusterfx();
	var_0A = param_01.var_2F8D + (0,0,35);
	var_09 veh_setgoalpos(var_0A,1);
	var_09 veh_setspeedimmediate(getdvarfloat("scr_ocp_dropspeed",30),getdvarfloat("scr_ocp_dropa",20),getdvarfloat("scr_ocp_dropd",1));
	var_09 veh_sethoverparams(30,5,5);
	var_09 veh_setmaxpitchroll(15,15);
	while(distancesquared(var_09.var_2E6,var_0A) > var_04 && param_03.health > 0)
	{
		wait 0.05;
	}

	if(param_03.health > 0)
	{
		wait(1);
	}

	if(param_03.health > 0)
	{
		param_02 linkto(var_09,"tag_origin");
		param_02 notify("linkedToDrone");
		var_09 thread maps\mp\killstreaks\_drone_carepackage::carepackagedrone_deleteonactivate();
		var_09 lib_A7C8::carepackagedronefindowner();
	}

	lib_A7C8::disabledamagecallback(param_03);
	param_03 playsoundonmovingent("orbital_pkg_drone_jets_off");
	if(isdefined(var_09))
	{
		var_09 lib_A7C8::drone_stopthrustereffects();
	}

	param_03.var_3AB6 scriptmodelclearanim("orbital_care_package_fan_spin","nothing");
	param_03.enemymodel scriptmodelclearanim("orbital_care_package_fan_spin","nothing");
	wait 0.05;
	if(isdefined(var_09))
	{
		var_09 maps\mp\killstreaks\_drone_carepackage::carepackagedrone_delete();
	}
}

//Function Number: 32
lib_A7C8::carepackagedronewatchdeath()
{
	self endon("delivered");
	self waittill("death");
	self notify("delivered");
}

//Function Number: 33
lib_A7C8::carepackagedronewatchcratedeath(param_00)
{
	self endon("delivered");
	param_00 waittill("disabled");
	self notify("delivered");
}

//Function Number: 34
lib_A7C8::carepackagedronefindowner()
{
	var_00 = self.owner;
	var_00 endon("disconnect");
	self endon("death");
	self endon("delivered");
	var_01 = 22500;
	var_02 = 1;
	var_03 = gettime();
	for(;;)
	{
		var_04 = maps\mp\_utility::isreallyalive(var_00);
		if(!var_04)
		{
			var_02 = 1;
			wait 0.05;
		}

		if(var_03 < gettime() || var_02)
		{
			var_02 = 0;
			self veh_setdronegoalpos(var_00,(0,-100,15));
			var_03 = gettime() + 1000;
		}

		var_05 = distancesquared(self.var_2E6,var_00.var_2E6 + (0,0,15));
		if(var_05 < var_01)
		{
			wait(getdvarfloat("scr_ocp_waitDeliver",1));
			self notify("delivered");
			return;
		}

		wait 0.05;
	}
}

//Function Number: 35
lib_A7C8::drone_thrusterfx()
{
	self endon("death");
	playfxontag(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_fl");
	playfxontag(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_fr");
	playfxontag(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_kl");
	playfxontag(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_kr");
	wait 0.05;
	wait 0.05;
	if(isdefined(self))
	{
		playfxontag(common_scripts\utility::getfx("ocp_exhaust"),self,"tag_fx");
	}

	for(;;)
	{
		level waittill("connected",var_00);
		thread lib_A7C8::drone_thrusterplayerconnected(var_00);
	}
}

//Function Number: 36
lib_A7C8::drone_thrusterplayerconnected(param_00)
{
	param_00 endon("disconnect");
	param_00 waittill("spawned_player");
	if(isdefined(param_00) && isdefined(self))
	{
		lib_A7C8::drone_thrusterplayer(param_00);
	}
}

//Function Number: 37
lib_A7C8::drone_thrusterplayer(param_00)
{
	param_00 endon("disconnect");
	self endon("death");
	playfxontagforclients(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_fl",param_00);
	playfxontagforclients(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_fr",param_00);
	playfxontagforclients(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_kl",param_00);
	playfxontagforclients(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_kr",param_00);
	wait 0.05;
	wait 0.05;
	if(isdefined(self))
	{
		playfxontagforclients(common_scripts\utility::getfx("ocp_exhaust"),self,"tag_fx",param_00);
	}
}

//Function Number: 38
lib_A7C8::drone_stopthrustereffects()
{
	killfxontag(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_fl");
	killfxontag(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_fr");
	killfxontag(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_kl");
	killfxontag(common_scripts\utility::getfx("ocp_thruster_small"),self,"j_thruster_kr");
	wait 0.05;
	wait 0.05;
	if(isdefined(self))
	{
		killfxontag(common_scripts\utility::getfx("ocp_exhaust"),self,"tag_fx");
	}
}