/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42955.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 77
 * Decompile Time: 38 ms
 * Timestamp: 4/20/2022 8:18:34 PM
*******************************************************************/

//Function Number: 1
lib_A7CB::init()
{
	level.orbitalsupportoverrides = spawnstruct();
	level.orbitalsupportoverrides.spawnorigin = undefined;
	level.orbitalsupportoverrides.spawnangle = undefined;
	level.orbitalsupportoverrides.spawnanglemax = undefined;
	level.orbitalsupportoverrides.spawnanglemin = undefined;
	level.orbitalsupportoverrides.spawnradius = undefined;
	level.orbitalsupportoverrides.spawnheight = undefined;
	level.orbitalsupportoverrides.speed = undefined;
	level.orbitalsupportoverrides.turretpitch = undefined;
	level.orbitalsupportoverrides.leftarc = undefined;
	level.orbitalsupportoverrides.rightarc = undefined;
	level.orbitalsupportoverrides.toparc = undefined;
	level.orbitalsupportoverrides.bottomarc = undefined;
	if(isdefined(level.orbitalsupportoverridefunc))
	{
		[[ level.orbitalsupportoverridefunc ]]();
	}

	level.orbitalsupport_use_duration = 40;
	level.orbitalsupport_speed = 123;
	if(isdefined(level.orbitalsupportoverrides.speed))
	{
		level.orbitalsupport_speed = level.orbitalsupportoverrides.speed;
	}

	var_00 = getentarray("minimap_corner","targetname");
	var_01 = (0,0,0);
	if(var_00.size)
	{
		var_01 = maps\mp\gametypes\_spawnlogic::findboxcenter(var_00[0].var_2E6,var_00[1].var_2E6);
	}

	if(isdefined(level.orbitalsupportoverrides.spawnorigin))
	{
		var_01 = level.orbitalsupportoverrides.spawnorigin;
	}

	level.osprig = spawn("script_model",var_01);
	level.osprig setmodel("c130_zoomrig");
	level.osprig.var_41 = (0,115,0);
	level.osprig hide();
	thread lib_A7CB::rotateplane(level.orbitalsupport_speed);
	level._effect["orbitalsupport_cloud"] = loadfx("vfx/cloud/orbitalsupport_cloud");
	level._effect["orbitalsupport_rocket_explode_player"] = loadfx("vfx/explosion/rocket_explosion_distant");
	level._effect["orbitalsupport_entry"] = loadfx("vfx/vehicle/vehicle_osp_enter_clouds_parent");
	level._effect["orbitalsupport_entry_complete"] = loadfx("vfx/vehicle/vehicle_osp_enter_shock");
	level._effect["vehicle_osp_jet"] = loadfx("vfx/vehicle/vehicle_osp_jet");
	level._effect["vehicle_osp_jet_lg"] = loadfx("vfx/vehicle/vehicle_osp_jet_lg");
	level._effect["vehicle_osp_rocket_marker"] = loadfx("vfx/unique/vfx_marker_killstreak_guide");
	level._effect["vehicle_osp_jet_lg_trl"] = loadfx("vfx/vehicle/vehicle_osp_jet_lg_trl");
	level._effect["orbitalsupport_entry_flash"] = loadfx("vfx/vehicle/vehicle_osp_enter_flash");
	level._effect["orbitalsupport_explosion"] = loadfx("vfx/explosion/vehicle_mil_blimp_explosion");
	level._effect["orbitalsupport_explosion_jet"] = loadfx("vfx/explosion/vehicle_mil_blimp_explosion_jet");
	level._effect["orbitalsupport_light"] = loadfx("vfx/lights/vehicle_osp_light");
	level.var_6801["orbitalsupport_40mm_mp"] = 600;
	level.var_6801["orbitalsupport_40mmbuddy_mp"] = 600;
	level.var_6801["orbitalsupport_105mm_mp"] = 1000;
	level.physicssphereradius["orbitalsupport_40mm_mp"] = 3;
	level.physicssphereradius["orbitalsupport_40mmbuddy_mp"] = 3;
	level.physicssphereradius["orbitalsupport_105mm_mp"] = 6;
	level.orbitalsupportinuse = 0;
	level thread lib_A7CB::onorbitalsupportplayerconnect();
	level.killstreakfuncs["orbitalsupport"] = ::lib_A7CB::tryuseorbitalsupport;
	level.killstreakwieldweapons["orbitalsupport_105mm_mp"] = "orbitalsupport";
	level.killstreakwieldweapons["orbitalsupport_40mm_mp"] = "orbitalsupport";
	level.killstreakwieldweapons["orbitalsupport_40mmbuddy_mp"] = "orbitalsupport";
	level.killstreakwieldweapons["orbitalsupport_big_turret_mp"] = "orbitalsupport";
	level.killstreakwieldweapons["orbitalsupport_missile_mp"] = "orbitalsupport";
	level.orbitalsupport_chatter_timer = 0;
	level.orbitalsupport_buddy_chatter_timer = 0;
	game["dialog"]["assist_mp_paladin"] = "ks_paladin_joinreq";
	game["dialog"]["pilot_sup_mp_paladin"] = "pilot_sup_mp_paladin";
	game["dialog"]["pilot_aslt_mp_paladin"] = "pilot_aslt_mp_paladin";
	game["dialog"]["copilot_sup_mp_paladin"] = "copilot_sup_mp_paladin";
	game["dialog"]["copilot_aslt_mp_paladin"] = "copilot_aslt_mp_paladin";
	game["dialog"]["copilot_enemykill_mp_paladin"] = "copilot_enemykill_mp_paladin";
	game["dialog"]["copilot_marked_mp_paladin"] = "copilot_marked_mp_paladin";
}

//Function Number: 2
lib_A7CB::tryuseorbitalsupport(param_00,param_01)
{
	if(isdefined(level.orbitalsupport_player) || level.orbitalsupportinuse)
	{
		self iprintlnbold(&"MP_ORBITALSUPPORT_IN_USE");
		return 0;
	}

	level.orbitalsupportinuse = 1;
	thread lib_A7CB::playerclearorbitalsupportonteamchange();
	var_02 = maps\mp\killstreaks\_killstreaks::initridekillstreak("paladin",0,undefined,3);
	if(var_02 != "success")
	{
		level.orbitalsupportinuse = 0;
		return 0;
	}

	maps\mp\_utility::setusingremote("orbitalsupport");
	thread lib_A7CB::setorbitalsupportplayer(self,param_01);
	maps\mp\_matchdata::logkillstreakevent("orbitalsupport",self.var_2E6);
	level.orbitalsupport_planemodel.crashed = undefined;
	return 1;
}

//Function Number: 3
lib_A7CB::playerclearorbitalsupportonteamchange()
{
	self endon("rideKillstreakBlack");
	self waittill("joined_team");
	level.orbitalsupportinuse = 0;
}

//Function Number: 4
lib_A7CB::setorbitalsupportplayer(param_00,param_01)
{
	self endon("orbitalsupport_player_removed");
	self endon("disconnect");
	level.orbitalsupport_player = param_00;
	param_00 maps\mp\_utility::playersaveangles();
	param_00 lib_A7CB::orbitalsupport_spawn();
	level.orbitalsupport_planemodel.incomingmissile = 0;
	level.orbitalsupport_planemodel.vehicletype = "paladin";
	level.orbitalsupport_planemodel thread maps\mp\gametypes\_damage::setentitydamagecallback(3000,undefined,::lib_A7CB::crashplane,::maps\mp\killstreaks\_aerial_utility::heli_modifydamage,1);
	level.orbitalsupport_planemodel.var_5D57 = param_01;
	level.orbitalsupport_planemodel.hasrockets = common_scripts\utility::array_contains(param_01,"orbitalsupport_rockets");
	level.orbitalsupport_planemodel.hasturret = common_scripts\utility::array_contains(param_01,"orbitalsupport_turret");
	level.orbitalsupport_planemodel.coopoffensive = common_scripts\utility::array_contains(param_01,"orbitalsupport_coop_offensive");
	level.orbitalsupport_planemodel.extraflare = common_scripts\utility::array_contains(param_01,"orbitalsupport_flares");
	level.orbitalsupport_planemodel.ammofeeder = common_scripts\utility::array_contains(param_01,"orbitalsupport_ammo");
	level.orbitalsupport_planemodel.var_31D = param_00;
	if(level.orbitalsupport_planemodel.extraflare)
	{
		var_02 = 1;
	}
	else
	{
		var_02 = 0;
	}

	level.orbitalsupport_planemodel.helitype = "osp";
	level.orbitalsupport_planemodel thread maps\mp\killstreaks\_aerial_utility::heli_flares_monitor(var_02);
	thread maps\mp\_utility::teamplayercardsplash("used_orbitalsupport",param_00);
	param_00 method_834A();
	param_00 maps\mp\killstreaks\_aerial_utility::playerdisablestreakstatic();
	param_00 maps\mp\killstreaks\_killstreaks::playerwaittillridekillstreakcomplete();
	param_00 thread lib_A7CB::waitsetthermal(1);
	param_00 thread lib_A7CB::waitdisableshadows(1);
	param_00 thread lib_A7CB::setospvisionandlightsetpermap(1.25);
	param_00 thread lib_A7CB::clouds();
	if(getdvarint("camera_thirdPerson"))
	{
		param_00 maps\mp\_utility::setthirdpersondof(0);
	}

	param_00 lib_A7CB::playerswitchtoturret(level.var_6563);
	param_00.controlled_orbitalsupport_turret = "medium";
	param_00.var_7315 = 0;
	param_00.reloading_medium_orbitalsupport_gun = 0;
	param_00.reloading_rocket_orbitalsupport_gun = 0;
	param_00.reloading_buddy_medium_orbitalsupport_gun = 0;
	param_00.medium_orbitalsupport_ammo = 8;
	param_00 thread lib_A7CB::removeorbitalsupportplayerondisconnect();
	param_00 thread lib_A7CB::removeorbitalsupportplayeronchangeteams();
	param_00 thread lib_A7CB::removeorbitalsupportplayeronspectate();
	param_00 thread lib_A7CB::removeorbitalsupportplayeroncrash();
	param_00 thread lib_A7CB::removeorbitalsupportplayerongamecleanup();
	wait(1);
	maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	param_00 lib_A7CB::playersetavailableweaponshud();
	param_00 setclientomnvar("ui_osp_weapon",1);
	param_00 setclientomnvar("ui_osp_toggle",1);
	param_00 thread lib_A7CB::waitsetstatic(0.1);
	param_00 thread lib_A7CB::pulseorbitalsupportreloadtext();
	var_03 = level.orbitalsupport_use_duration;
	if(common_scripts\utility::array_contains(param_01,"orbitalsupport_time"))
	{
		var_03 = var_03 + 15;
	}

	param_00.orbitalsupport_endtime = gettime() + var_03 * 1000;
	param_00 setclientomnvar("ui_warbird_countdown",param_00.orbitalsupport_endtime);
	self notifyonplayercommand("orbitalsupport_fire","+attack");
	self notifyonplayercommand("orbitalsupport_fire","+attack_akimbo_accessible");
	param_00 thread lib_A7CB::changeweapons();
	param_00 thread lib_A7CB::firebigorbitalsupportgun();
	param_00 thread lib_A7CB::firemediumorbitalsupportgun();
	param_00 thread lib_A7CB::firerocketorbitalsupportgun();
	param_00 thread lib_A7CB::showaerialmarker();
	param_00 thread lib_A7CB::removeorbitalsupportplayeraftertime(var_03);
	param_00 thread lib_A7CB::removeorbitalsupportplayeroncommand();
	if(level.teambased)
	{
		level thread lib_A7CB::handlecoopjoining(param_00);
	}

	level thread lib_A7CB::setupplayersduringstreak();
}

//Function Number: 5
lib_A7CB::waitsetstatic(param_00)
{
	self endon("orbitalsupport_player_removed");
	self endon("disconnect");
	wait(param_00);
	maps\mp\killstreaks\_aerial_utility::playerenablestreakstatic();
}

//Function Number: 6
lib_A7CB::waitsetthermal(param_00)
{
	self endon("disconnect");
	level endon("orbitalsupport_player_removed");
	self endon("orbitalsupport_player_removed");
	wait(param_00);
	self method_80B8();
	var_01 = 9275;
	if(isdefined(level.orbitalsupportoverrides.spawnheight))
	{
		var_01 = level.orbitalsupportoverrides.spawnheight - level.var_5983[2];
	}

	var_02 = 0.3;
	var_03 = var_01;
	var_04 = 0.3;
	var_05 = var_01 * 0.75;
	var_06 = 20;
	var_07 = 30;
	thread maps\mp\killstreaks\_aerial_utility::thermalvision("orbitalsupport_player_removed",var_02,var_03,var_04,var_05,var_06,var_07);
}

//Function Number: 7
lib_A7CB::waitdisableshadows(param_00)
{
	self endon("disconnect");
	level endon("orbitalsupport_player_removed");
	self endon("orbitalsupport_player_removed");
	wait(param_00);
	self method_851A(0);
}

//Function Number: 8
lib_A7CB::setospvisionandlightsetpermap(param_00)
{
	self endon("disconnect");
	level endon("orbitalsupport_player_removed");
	wait(param_00);
	if(isdefined(level.ospvisionset))
	{
		self method_847A(level.ospvisionset,0);
	}

	if(isdefined(level.osplightset))
	{
		self method_83C0(level.osplightset);
	}

	maps\mp\killstreaks\_aerial_utility::handle_player_starting_aerial_view();
}

//Function Number: 9
lib_A7CB::removeospvisionandlightsetpermap(param_00)
{
	self method_847A("",param_00);
	self method_83C0("");
	maps\mp\killstreaks\_aerial_utility::handle_player_ending_aerial_view();
}

//Function Number: 10
lib_A7CB::removeorbitalsupportplayeroncommand()
{
	self endon("orbitalsupport_player_removed");
	var_00 = 0;
	for(;;)
	{
		if(self usebuttonpressed())
		{
			var_00 = var_00 + 0.05;
			if(var_00 > 1)
			{
				if((isdefined(level.orbitalsupport_buddy) && level.orbitalsupport_buddy.joined == 1) || !isdefined(level.orbitalsupport_buddy))
				{
					level thread lib_A7CB::removeorbitalsupportplayer(self,0);
					return;
				}
			}
		}
		else
		{
			var_00 = 0;
		}

		wait(0.05);
	}
}

//Function Number: 11
lib_A7CB::removeorbitalsupportplayerongamecleanup()
{
	self endon("orbitalsupport_player_removed");
	level waittill("game_ended");
	level thread lib_A7CB::removeorbitalsupportplayer(self,0);
}

//Function Number: 12
lib_A7CB::removeorbitalsupportplayeroncrash()
{
	self endon("orbitalsupport_player_removed");
	level.orbitalsupport_planemodel waittill("crashing");
	level thread lib_A7CB::removeorbitalsupportplayer(self,0);
}

//Function Number: 13
lib_A7CB::removeorbitalsupportplayerondisconnect()
{
	self endon("orbitalsupport_player_removed");
	self waittill("disconnect");
	level thread lib_A7CB::removeorbitalsupportplayer(self,1);
}

//Function Number: 14
lib_A7CB::removeorbitalsupportplayeronchangeteams()
{
	self endon("orbitalsupport_player_removed");
	self waittill("joined_team");
	level thread lib_A7CB::removeorbitalsupportplayer(self,0);
}

//Function Number: 15
lib_A7CB::removeorbitalsupportplayeronspectate()
{
	self endon("orbitalsupport_player_removed");
	common_scripts\utility::waittill_any("joined_spectators","spawned");
	level thread lib_A7CB::removeorbitalsupportplayer(self,0);
}

//Function Number: 16
lib_A7CB::removeorbitalsupportplayeraftertime(param_00)
{
	self endon("orbitalsupport_player_removed");
	if(maps\mp\_utility::_hasperk("specialty_blackbox") && isdefined(self.specialty_blackbox_bonus))
	{
		param_00 = param_00 * self.specialty_blackbox_bonus;
	}

	maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause(param_00);
	if(isdefined(level.orbitalsupport_buddy))
	{
		maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause(7);
	}

	level thread lib_A7CB::removeorbitalsupportplayer(self,0);
}

//Function Number: 17
lib_A7CB::removeorbitalsupportplayer(param_00,param_01)
{
	param_00 notify("orbitalsupport_player_removed");
	level notify("orbitalsupport_player_removed");
	waittillframeend;
	level.orbitalsupport_planemodel.var_31D = undefined;
	if(isdefined(level.orbitalsupport_buddy))
	{
		level.orbitalsupport_buddy thread lib_A7CB::removeorbitalsupportbuddy(0);
	}

	if(!param_01)
	{
		param_00 lib_A7CB::playerresetospomnvars();
		param_00 method_849C("orbitalsupport_fire","+attack");
		param_00 method_849C("orbitalsupport_fire","+attack_akimbo_accessible");
		if(!isbot(param_00) && level.orbitalsupport_planemodel.hasrockets || level.orbitalsupport_planemodel.hasturret)
		{
			param_00 method_849C("switch_orbitalsupport_turret","weapnext");
		}

		param_00 remotecontrolturretoff(level.var_6563);
		level.var_6563 hide();
		param_00 unlink();
		var_02 = maps\mp\_utility::getkillstreakweapon("orbitalsupport");
		param_00 takeweapon(var_02);
		if(param_00 maps\mp\_utility::isusingremote())
		{
			param_00 maps\mp\_utility::clearusingremote();
		}

		maps\mp\killstreaks\_aerial_utility::disableorbitalthermal(param_00);
		param_00 method_851A(1);
		param_00 method_80B9();
		param_00 setblurforplayer(0,0);
		param_00 lib_A7CB::removeospvisionandlightsetpermap(1.5);
		param_00 method_834B();
		if(getdvarint("camera_thirdPerson"))
		{
			param_00 maps\mp\_utility::setthirdpersondof(1);
		}

		if(isdefined(param_00.darkscreenoverlay))
		{
			param_00.darkscreenoverlay destroy();
		}

		param_00.var_7315 = undefined;
		param_00.reloading_medium_orbitalsupport_gun = undefined;
		param_00.reloading_rocket_orbitalsupport_gun = undefined;
		param_00.reloading_buddy_medium_orbitalsupport_gun = undefined;
		param_00 maps\mp\_utility::playerrestoreangles();
	}

	if(isdefined(level.orbitalsupport_planemodel.crashed))
	{
		level.orbitalsupport_player = undefined;
		return;
	}

	level.orbitalsupport_player = undefined;
	level.orbitalsupport_planemodel stoploopsound();
	level.orbitalsupport_planemodel playsoundasmaster("paladin_orbit_return");
	level.orbitalsupport_planemodel lib_A7CB::orbitalsupportexit();
}

//Function Number: 18
lib_A7CB::cleanupospents()
{
	level.orbitalsupport_planemodel stoploopsound();
	if(isdefined(level.orbitalsupport_targetent))
	{
		stopfxontag(common_scripts\utility::getfx("vehicle_osp_rocket_marker"),level.orbitalsupport_targetent,"tag_origin");
		level.orbitalsupport_targetent delete();
	}

	level.orbitalsupport_buddy_turret turretdeletesoundent();
	level.orbitalsupport_buddy_turret delete();
	if(isdefined(level.orbitalsupport_planemodel.farflightsound))
	{
		level.orbitalsupport_planemodel.farflightsound stoploopsound();
		level.orbitalsupport_planemodel.farflightsound delete();
	}

	if(isdefined(level.orbitalsupport_planemodel.closeflightsound))
	{
		level.orbitalsupport_planemodel.closeflightsound stoploopsound();
		level.orbitalsupport_planemodel.closeflightsound delete();
	}

	if(isdefined(level.orbitalsupport_planemodel.minimapicon))
	{
		level.orbitalsupport_planemodel.minimapicon delete();
	}
}

//Function Number: 19
lib_A7CB::orbitalsupport_spawn()
{
	var_00 = getentarray("minimap_corner","targetname");
	var_01 = (0,0,0);
	if(var_00.size)
	{
		var_01 = maps\mp\gametypes\_spawnlogic::findboxcenter(var_00[0].var_2E6,var_00[1].var_2E6);
		var_01 = (var_01[0],var_01[1],0);
	}

	if(isdefined(level.orbitalsupportoverrides.spawnorigin))
	{
		var_01 = level.orbitalsupportoverrides.spawnorigin;
		var_01 = (var_01[0],var_01[1],0);
	}

	level.orbitalsupport_planemodel = spawn("script_model",var_01);
	level.orbitalsupport_planemodel.var_41 = (0,0,0);
	level.orbitalsupport_planemodel setmodel("vehicle_mil_blimp_orbital_platform_ai");
	level.orbitalsupport_planemodel.owner = self;
	level.orbitalsupport_planemodel common_scripts\utility::make_entity_sentient_mp(self.inliveplayerkillstreak);
	level.orbitalsupport_planemodel.minimapicon = spawnplane(self,"script_model",var_01,"compass_objpoint_ac130_friendly","compass_objpoint_ac130_enemy");
	level.orbitalsupport_planemodel.minimapicon setmodel("tag_origin");
	level.orbitalsupport_planemodel.minimapicon method_8446(level.orbitalsupport_planemodel,"tag_origin",(0,0,0),(0,0,0));
	level.orbitalsupport_planemodel setcandamage(1);
	level.orbitalsupport_planemodel setcanradiusdamage(1);
	level.orbitalsupport_planemodel.var_275 = 2000;
	level.orbitalsupport_planemodel.health = level.orbitalsupport_planemodel.var_275;
	level.orbitalsupport_planemodel.showthreatmarker = 0;
	level.orbitalsupport_planemodel lib_A7CB::setrandomorbitalsupportstartposition();
	level.var_6563 = lib_A7CB::spawnorbitalsupportturret("orbitalsupport_big_turret_mp","orbitalsupport_big_turret","tag_orbitalsupport_biggun",0);
	level.orbitalsupport_buddy_turret = lib_A7CB::spawnorbitalsupportturret("orbitalsupport_buddy_turret_mp","orbitalsupport_small_turret","tag_orbitalsupport_mediumgun2",1);
	level.orbitalsupport_planemodel thread lib_A7CB::moveorbitalsupporttodestination();
}

//Function Number: 20
lib_A7CB::spawnorbitalsupportturret(param_00,param_01,param_02,param_03)
{
	var_04 = spawnturret("misc_turret",level.orbitalsupport_planemodel gettagorigin(param_02),param_00,0);
	var_04.var_41 = level.orbitalsupport_planemodel gettagangles(param_02);
	var_04 setmodel(param_01);
	var_04 setdefaultdroppitch(45);
	var_04 linkto(level.orbitalsupport_planemodel,param_02,(0,0,0),(0,0,0));
	var_04.owner = undefined;
	var_04.health = 99999;
	var_04.var_275 = 1000;
	var_04.damagetaken = 0;
	var_04.stunned = 0;
	var_04.stunnedtime = 0;
	var_04 setcandamage(0);
	var_04 setcanradiusdamage(0);
	var_04 turretfiredisable();
	if(param_03)
	{
		var_04 thread turretspawnsoundent(param_02);
	}

	return var_04;
}

//Function Number: 21
turretspawnsoundent(param_00)
{
	wait 0.05;
	self.soundent = spawn("script_model",self.var_2E6);
	self.soundent setmodel("tag_origin");
	self.soundent linkto(level.orbitalsupport_planemodel,param_00,(0,0,0),(0,0,0));
}

//Function Number: 22
lib_A7CB::pulseorbitalsupportreloadtext()
{
	level endon("orbitalsupport_player_removed");
	self endon("orbitalsupport_player_removed");
	self endon("switch_orbitalsupport_turret");
	self setclientomnvar("ui_osp_reload_bitfield",0);
	var_00 = 1;
	var_01 = 2;
	var_02 = 4;
	for(;;)
	{
		var_03 = 0;
		if(self.var_7315)
		{
			var_03 = var_03 + var_00;
		}

		if(self.reloading_medium_orbitalsupport_gun || self.reloading_buddy_medium_orbitalsupport_gun)
		{
			var_03 = var_03 + var_01;
		}

		if(self.reloading_rocket_orbitalsupport_gun)
		{
			var_03 = var_03 + var_02;
		}

		self setclientomnvar("ui_osp_reload_bitfield",var_03);
		wait(0.05);
	}
}

//Function Number: 23
lib_A7CB::changeweapons()
{
	self endon("orbitalsupport_player_removed");
	if(isbot(self))
	{
		return;
	}

	var_00 = level.orbitalsupport_planemodel.hasrockets;
	var_01 = level.orbitalsupport_planemodel.hasturret;
	if(!var_00 && !var_01)
	{
		return;
	}

	self notifyonplayercommand("switch_orbitalsupport_turret","weapnext");
	wait(0.05);
	self setclientomnvar("ui_osp_weapon",1);
	for(;;)
	{
		self waittill("switch_orbitalsupport_turret");
		if(self.controlled_orbitalsupport_turret == "medium")
		{
			if(var_00)
			{
				lib_A7CB::playerswitchtorocketturret();
			}
			else
			{
				lib_A7CB::playerswitchtobigturret();
			}
		}
		else if(self.controlled_orbitalsupport_turret == "rocket")
		{
			if(var_01)
			{
				lib_A7CB::playerswitchtobigturret();
			}
			else
			{
				lib_A7CB::playerswitchtomediumturret();
			}
		}
		else if(self.controlled_orbitalsupport_turret == "big")
		{
			lib_A7CB::playerswitchtomediumturret();
		}

		self method_82F4("paladin_weapon_cycle_plr");
	}
}

//Function Number: 24
lib_A7CB::playersetavailableweaponshud()
{
	var_00 = level.orbitalsupport_planemodel.hasrockets;
	var_01 = level.orbitalsupport_planemodel.hasturret;
	var_02 = 1;
	if(var_01)
	{
		var_02 = var_02 + 2;
	}

	if(var_00)
	{
		var_02 = var_02 + 4;
	}

	self setclientomnvar("ui_osp_avail_weapons",var_02);
}

//Function Number: 25
lib_A7CB::playerswitchtoturret(param_00)
{
	self unlink();
	level thread lib_A7CB::handleturretsoundent(param_00);
	var_01 = 25;
	var_02 = 25;
	var_03 = -25;
	var_04 = 60;
	if(isdefined(level.orbitalsupportoverrides.rightarc))
	{
		var_01 = level.orbitalsupportoverrides.rightarc;
	}

	if(isdefined(level.orbitalsupportoverrides.leftarc))
	{
		var_02 = level.orbitalsupportoverrides.leftarc;
	}

	if(isdefined(level.orbitalsupportoverrides.toparc))
	{
		var_03 = level.orbitalsupportoverrides.toparc;
	}

	if(isdefined(level.orbitalsupportoverrides.bottomarc))
	{
		var_04 = level.orbitalsupportoverrides.bottomarc;
	}

	self playerlinkweaponviewtodelta(param_00,"tag_player",0,var_01,var_02,var_03,var_04,1);
	self playerlinkedsetusebaseangleforviewclamp(1);
	var_05 = 45;
	if(isdefined(level.orbitalsupportoverrides.turretpitch))
	{
		var_05 = level.orbitalsupportoverrides.turretpitch;
	}

	self remotecontrolturret(param_00,var_05);
}

//Function Number: 26
lib_A7CB::handleturretsoundent(param_00)
{
	param_00 endon("death");
	param_00 notify("startHandleSoundEnt");
	param_00 endon("startHandleSoundEnt");
	if(isdefined(param_00.soundent))
	{
		param_00.soundent hide();
	}

	foreach(var_02 in level.var_328)
	{
		if(isdefined(param_00.owner) && param_00.owner != var_02)
		{
			if(isdefined(param_00.soundent))
			{
				param_00.soundent showtoplayer(var_02);
			}
		}
	}

	for(;;)
	{
		level waittill("connected",var_02);
		if(isdefined(param_00.soundent))
		{
			param_00.soundent showtoplayer(var_02);
		}
	}
}

//Function Number: 27
lib_A7CB::playerswitchtobigturret()
{
	self.controlled_orbitalsupport_turret = "big";
	self setclientomnvar("ui_osp_weapon",0);
	thread lib_A7CB::pulseorbitalsupportreloadtext();
	if(isdefined(level.orbitalsupport_targetent))
	{
		stopfxontag(common_scripts\utility::getfx("vehicle_osp_rocket_marker"),level.orbitalsupport_targetent,"tag_origin");
	}
}

//Function Number: 28
lib_A7CB::playerswitchtorocketturret()
{
	self.controlled_orbitalsupport_turret = "rocket";
	self setclientomnvar("ui_osp_weapon",3);
	thread lib_A7CB::pulseorbitalsupportreloadtext();
	if(isdefined(level.orbitalsupport_targetent))
	{
		playfxontag(common_scripts\utility::getfx("vehicle_osp_rocket_marker"),level.orbitalsupport_targetent,"tag_origin");
	}
}

//Function Number: 29
lib_A7CB::playerswitchtomediumturret()
{
	self.controlled_orbitalsupport_turret = "medium";
	self setclientomnvar("ui_osp_weapon",1);
	thread lib_A7CB::pulseorbitalsupportreloadtext();
	if(isdefined(level.orbitalsupport_targetent))
	{
		stopfxontag(common_scripts\utility::getfx("vehicle_osp_rocket_marker"),level.orbitalsupport_targetent,"tag_origin");
	}
}

//Function Number: 30
lib_A7CB::playergetturretendpoint(param_00)
{
	if(!isdefined(param_00) || !param_00)
	{
		return level.var_6563 gettagorigin("tag_player") + anglestoforward(level.var_6563 gettagangles("tag_player")) * 20000;
	}

	return level.orbitalsupport_buddy_turret gettagorigin("tag_player") + anglestoforward(level.orbitalsupport_buddy_turret gettagangles("tag_player")) * 20000;
}

//Function Number: 31
lib_A7CB::firebigorbitalsupportgun()
{
	self endon("orbitalsupport_player_removed");
	if(!level.orbitalsupport_planemodel.ammofeeder)
	{
		var_00 = 6;
	}
	else
	{
		var_00 = 4;
	}

	while(!isdefined(level.orbitalsupport_planemodel.paladinflying))
	{
		wait 0.05;
	}

	for(;;)
	{
		self.var_7315 = 0;
		self waittill("orbitalsupport_fire");
		if(isdefined(level.hostmigrationtimer))
		{
			continue;
		}

		if(self.controlled_orbitalsupport_turret == "big")
		{
			var_01 = lib_A7CB::playergetturretendpoint();
			var_02 = level.var_6563 gettagorigin("tag_missile1");
			var_03 = magicbullet("orbitalsupport_105mm_mp",var_02,var_01,self,1);
			var_03.var_9CBC = level.orbitalsupport_planemodel;
			level.orbitalsupport_planemodel playsoundasmaster("paladin_cannon_snap");
			var_03 playsoundasmaster("orbitalsupport_105mm_proj_travel");
			self playrumbleonentity("ac130_105mm_fire");
			self method_82F4("paladin_cannon_reload");
			earthquake(0.3,1,level.orbitalsupport_planemodel.var_2E6,1000,self);
			self.var_7315 = 1;
			wait(var_00);
		}
	}
}

//Function Number: 32
lib_A7CB::firemediumorbitalsupportgun()
{
	self endon("orbitalsupport_player_removed");
	while(!isdefined(level.orbitalsupport_planemodel.paladinflying))
	{
		wait 0.05;
	}

	for(;;)
	{
		self.reloading_medium_orbitalsupport_gun = 0;
		if(!level.orbitalsupport_planemodel.ammofeeder)
		{
			var_00 = 3;
		}
		else
		{
			var_00 = 2;
		}

		if(self.controlled_orbitalsupport_turret == "medium" && self attackbuttonpressed() && !isdefined(level.hostmigrationtimer))
		{
			var_01 = level.var_6563 gettagorigin("tag_missile1");
			var_02 = lib_A7CB::playergetturretendpoint();
			level.orbitalsupport_planemodel playsoundasmaster("paladin_mgun_burst_plr");
			var_03 = magicbullet("orbitalsupport_40mm_mp",var_01,var_02,self,1);
			var_03.var_9CBC = level.orbitalsupport_planemodel;
			var_04 = bullettrace(var_01,var_02,0);
			wait(0.05);
			earthquake(0.1,0.5,level.orbitalsupport_planemodel.var_2E6,1000,self);
			lib_A7CB::firemediumorbitalsupportvolley(var_04["position"],"orbitalsupport_40mm_mp");
			lib_A7CB::firemediumorbitalsupportvolley(var_04["position"],"orbitalsupport_40mm_mp");
			lib_A7CB::firemediumorbitalsupportvolley(var_04["position"],"orbitalsupport_40mm_mp");
			self.medium_orbitalsupport_ammo--;
			if(self.medium_orbitalsupport_ammo <= 0)
			{
				self.reloading_medium_orbitalsupport_gun = 1;
				wait(var_00);
				self.medium_orbitalsupport_ammo = 8;
			}
		}

		wait(0.05);
	}
}

//Function Number: 33
lib_A7CB::firebuddythreatgrenades()
{
	self endon("orbitalsupport_player_removed");
	for(;;)
	{
		self waittill("orbitalsupport_fire");
		maps\mp\killstreaks\_aerial_utility::playerfakeshootpaintmissile(level.orbitalsupport_buddy_turret.soundent);
		wait(2);
	}
}

//Function Number: 34
lib_A7CB::firebuddymediumorbitalsupportgun()
{
	self endon("orbitalsupport_player_removed");
	var_00 = 6;
	self.reloading_buddy_medium_orbitalsupport_gun = 0;
	self.controlled_orbitalsupport_turret = "buddy";
	thread lib_A7CB::pulseorbitalsupportreloadtext();
	for(;;)
	{
		self.reloading_buddy_medium_orbitalsupport_gun = 0;
		if(!level.orbitalsupport_planemodel.ammofeeder)
		{
			var_01 = 5;
		}
		else
		{
			var_01 = 3;
		}

		if(self attackbuttonpressed())
		{
			var_02 = level.orbitalsupport_buddy_turret gettagorigin("tag_missile1");
			var_03 = lib_A7CB::playergetturretendpoint(1);
			level.orbitalsupport_planemodel playsoundasmaster("paladin_mgun_burst_plr");
			var_04 = magicbullet("orbitalsupport_40mmbuddy_mp",var_02,var_03,self);
			var_04.var_9CBC = level.orbitalsupport_planemodel;
			var_05 = bullettrace(var_02,var_03,0);
			wait 0.05;
			earthquake(0.1,0.5,level.orbitalsupport_planemodel.var_2E6,1000,self);
			lib_A7CB::firemediumorbitalsupportvolley(var_05["position"],"orbitalsupport_40mmbuddy_mp");
			lib_A7CB::firemediumorbitalsupportvolley(var_05["position"],"orbitalsupport_40mmbuddy_mp");
			lib_A7CB::firemediumorbitalsupportvolley(var_05["position"],"orbitalsupport_40mmbuddy_mp");
			var_00--;
			if(var_00 <= 0)
			{
				self.reloading_buddy_medium_orbitalsupport_gun = 1;
				wait(var_01);
				var_00 = 6;
			}
		}

		wait(0.05);
	}
}

//Function Number: 35
lib_A7CB::firemediumorbitalsupportvolley(param_00,param_01)
{
	var_02 = level.orbitalsupport_planemodel gettagorigin("tag_orbitalsupport_mediumgun1");
	var_03 = randomfloat(400) - 200;
	var_04 = randomfloat(400) - 200;
	var_05 = magicbullet(param_01,var_02,(param_00[0] + var_03,param_00[1] + var_04,param_00[2]),self,1);
	var_05.var_9CBC = level.orbitalsupport_planemodel;
	self playrumbleonentity("ac130_25mm_fire");
	wait(0.05);
	var_02 = level.orbitalsupport_planemodel gettagorigin("tag_orbitalsupport_mediumgun0");
	var_03 = randomfloat(400) - 200;
	var_04 = randomfloat(400) - 200;
	var_05 = magicbullet(param_01,var_02,(param_00[0] + var_03,param_00[1] + var_04,param_00[2]),self,1);
	var_05.var_9CBC = level.orbitalsupport_planemodel;
	self playrumbleonentity("ac130_25mm_fire");
	wait(0.05);
	var_02 = level.orbitalsupport_planemodel gettagorigin("tag_orbitalsupport_mediumgun3");
	var_03 = randomfloat(400) - 200;
	var_04 = randomfloat(400) - 200;
	var_05 = magicbullet(param_01,var_02,(param_00[0] + var_03,param_00[1] + var_04,param_00[2]),self,1);
	var_05.var_9CBC = level.orbitalsupport_planemodel;
	self playrumbleonentity("ac130_25mm_fire");
	wait(0.05);
}

//Function Number: 36
lib_A7CB::random_vector(param_00)
{
	return (randomfloat(param_00) - param_00 * 0.5,randomfloat(param_00) - param_00 * 0.5,randomfloat(param_00) - param_00 * 0.5);
}

//Function Number: 37
lib_A7CB::firerocketorbitalsupportgun()
{
	self endon("orbitalsupport_player_removed");
	var_00 = 3;
	var_01 = var_00;
	self setclientomnvar("ui_osp_rockets",var_01);
	if(!level.orbitalsupport_planemodel.ammofeeder)
	{
		var_02 = 6;
	}
	else
	{
		var_02 = 4;
	}

	thread lib_A7CB::updateshootinglocation();
	while(!isdefined(level.orbitalsupport_planemodel.paladinflying))
	{
		wait 0.05;
	}

	for(;;)
	{
		self.reloading_rocket_orbitalsupport_gun = 0;
		if(self.controlled_orbitalsupport_turret == "rocket" && self attackbuttonpressed() && !isdefined(level.hostmigrationtimer))
		{
			earthquake(0.3,1,level.orbitalsupport_planemodel.var_2E6,1000,self);
			var_03 = level.var_6563 gettagorigin("tag_missile1");
			var_04 = vectornormalize(anglestoforward(self getplayerangles()));
			var_05 = vectornormalize(anglestoforward(level.orbitalsupport_planemodel gettagangles("tag_origin")));
			for(var_06 = 0;var_06 < 3;var_06++)
			{
				var_07 = var_04 + (0,0,0.4) + lib_A7CB::random_vector(1);
				var_08 = magicbullet("orbitalsupport_missile_mp",var_03,var_03 + var_07,self);
				var_08.var_9CBC = level.orbitalsupport_planemodel;
				self method_82F4("paladin_missile_shot_2d");
				self playrumbleonentity("ac130_40mm_fire");
				var_08 missilesettargetent(level.orbitalsupport_targetent);
				var_08 missilesetflightmodedirect();
				wait(0.1);
			}

			var_01--;
			self setclientomnvar("ui_osp_rockets",var_01);
			if(var_01 == 0)
			{
				self.reloading_rocket_orbitalsupport_gun = 1;
				thread lib_A7CB::rocketreloadsound(var_02);
				wait(var_02);
				var_01 = var_00;
				self setclientomnvar("ui_osp_rockets",var_01);
				self notify("rocketReloadComplete");
				continue;
			}
			else
			{
				wait(1.3);
			}
		}

		wait 0.05;
	}
}

//Function Number: 38
lib_A7CB::updateshootinglocation()
{
	self endon("orbitalsupport_player_removed");
	level.orbitalsupport_targetent = spawn("script_model",(0,0,0));
	level.orbitalsupport_targetent setmodel("tag_origin");
	level.var_6563 method_8508(level.orbitalsupport_targetent);
	for(;;)
	{
		var_00 = level.var_6563 gettagorigin("tag_player");
		var_01 = level.var_6563 gettagorigin("tag_player") + anglestoforward(level.var_6563 gettagangles("tag_player")) * 20000;
		var_02 = bullettrace(var_00,var_01,0,level.var_6563);
		var_03 = var_02["position"];
		level.orbitalsupport_targetent.var_2E6 = var_03;
		wait 0.05;
	}
}

//Function Number: 39
lib_A7CB::rocketreloadsound(param_00)
{
	self endon("rocketReloadComplete");
	self endon("orbitalsupport_player_removed");
	var_01 = 3;
	self method_82F4("warbird_missile_reload_bed");
	wait(0.5);
	for(;;)
	{
		self method_82F4("warbird_missile_reload");
		wait(param_00 / var_01);
	}
}

//Function Number: 40
lib_A7CB::showaerialmarker()
{
	level.orbitalsupport_planemodel endon("death");
	while(!isdefined(level.orbitalsupport_planemodel.paladinflying))
	{
		wait 0.05;
	}

	level.orbitalsupport_planemodel.showthreatmarker = 1;
	level.orbitalsupport_planemodel thread maps\mp\killstreaks\_killstreaks::updateaerialkillstreakmarker();
	level.orbitalsupport_planemodel common_scripts\utility::waittill_either("crashing","leaving");
	level.orbitalsupport_planemodel.showthreatmarker = 0;
	level.orbitalsupport_planemodel thread maps\mp\killstreaks\_killstreaks::updateaerialkillstreakmarker();
}

//Function Number: 41
lib_A7CB::clouds()
{
	self endon("orbitalsupport_player_removed");
	wait(6);
	lib_A7CB::clouds_create();
	for(;;)
	{
		wait(randomfloatrange(40,80));
		lib_A7CB::clouds_create();
	}
}

//Function Number: 42
lib_A7CB::clouds_create()
{
	if(isdefined(level.playerweapon) && issubstr(tolower(level.playerweapon),"25"))
	{
		return;
	}

	playfxontagforclients(level._effect["orbitalsupport_cloud"],level.orbitalsupport_planemodel,"tag_player",level.orbitalsupport_player);
}

//Function Number: 43
lib_A7CB::crashplane(param_00,param_01,param_02,param_03)
{
	level.orbitalsupport_planemodel notify("crashing");
	level.orbitalsupport_planemodel.crashed = 1;
	level.orbitalsupport_planemodel maps\mp\gametypes\_damage::onkillstreakkilled(param_00,param_01,param_02,param_03,"paladin_destroyed",undefined,"callout_destroyed_orbitalsupport",1);
	thread lib_A7CB::crashfx();
	level.orbitalsupport_planemodel stopsounds();
	playsoundatpos(level.orbitalsupport_planemodel.var_2E6,"paladin_ground_death");
	wait 0.05;
	lib_A7CB::cleanupospents();
	level.orbitalsupport_planemodel delete();
	level.orbitalsupportinuse = 0;
}

//Function Number: 44
lib_A7CB::crashfx()
{
	var_00 = lib_A7CB::getosptaginfo("TAG_FX_ENGINE_B");
	var_01 = lib_A7CB::getosptaginfo("tag_origin");
	var_02 = lib_A7CB::getosptaginfo("tag_light_belly");
	var_03 = lib_A7CB::getosptaginfo("TAG_FX_ENGINE_L_1");
	var_04 = lib_A7CB::getosptaginfo("TAG_FX_ENGINE_L_2");
	var_05 = lib_A7CB::getosptaginfo("TAG_FX_ENGINE_R_1");
	var_06 = lib_A7CB::getosptaginfo("TAG_FX_ENGINE_R_2");
	playfx(common_scripts\utility::getfx("orbitalsupport_explosion"),var_01.var_2E6,var_02.dir);
	playfx(common_scripts\utility::getfx("orbitalsupport_explosion_jet"),var_03.var_2E6,var_03.dir);
	playfx(common_scripts\utility::getfx("orbitalsupport_explosion_jet"),var_04.var_2E6,var_04.dir);
	wait(0.05);
	playfx(common_scripts\utility::getfx("orbitalsupport_explosion_jet"),var_05.var_2E6,var_05.dir);
	playfx(common_scripts\utility::getfx("orbitalsupport_explosion_jet"),var_06.var_2E6,var_06.dir);
}

//Function Number: 45
lib_A7CB::getosptaginfo(param_00)
{
	var_01 = spawnstruct();
	var_01.var_2E6 = level.orbitalsupport_planemodel gettagorigin(param_00);
	var_01.dir = anglestoforward(level.orbitalsupport_planemodel gettagangles(param_00));
	return var_01;
}

//Function Number: 46
lib_A7CB::handlecoopjoining(param_00)
{
	var_01 = "orbitalsupport_coop_defensive";
	var_02 = &"MP_JOIN_ORBITALSUPPORT_DEF";
	var_03 = "pilot_sup_mp_paladin";
	var_04 = "copilot_sup_mp_paladin";
	if(level.orbitalsupport_planemodel.coopoffensive)
	{
		var_01 = "orbitalsupport_coop_offensive";
		var_02 = &"MP_JOIN_ORBITALSUPPORT_OFF";
		var_03 = "pilot_aslt_mp_paladin";
		var_04 = "copilot_aslt_mp_paladin";
	}

	for(;;)
	{
		var_05 = maps\mp\killstreaks\_coop_util::promptforstreaksupport(param_00.inliveplayerkillstreak,var_02,var_01,"assist_mp_paladin",var_03,param_00,var_04);
		level thread lib_A7CB::watchforjoin(var_05,param_00);
		var_06 = lib_A7CB::waittillpromptcomplete("orbitalsupport_buddy_added");
		maps\mp\killstreaks\_coop_util::stoppromptforstreaksupport(var_05);
		if(!isdefined(var_06))
		{
			return;
		}

		var_06 = lib_A7CB::waittillpromptcomplete("orbitalsupport_buddy_removed");
		if(!isdefined(var_06))
		{
			return;
		}

		waittillframeend;
	}
}

//Function Number: 47
lib_A7CB::waittillpromptcomplete(param_00)
{
	level endon("orbitalsupport_player_removed");
	level waittill(param_00);
	return 1;
}

//Function Number: 48
lib_A7CB::watchforjoin(param_00,param_01)
{
	level endon("orbitalsupport_player_removed");
	var_02 = maps\mp\killstreaks\_coop_util::waittillbuddyjoinedstreak(param_00);
	var_02 thread lib_A7CB::setorbitalsupportbuddy(param_01);
}

//Function Number: 49
lib_A7CB::onorbitalsupportplayerconnect()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("connected",var_00);
		var_00.orbitalsupport_hold_time = 0;
	}
}

//Function Number: 50
lib_A7CB::setorbitalsupportbuddy(param_00)
{
	self endon("orbitalsupport_player_removed");
	level.orbitalsupport_buddy = self;
	level.orbitalsupport_buddy.joined = 0;
	level.orbitalsupport_buddy_chatter_timer = 0;
	level notify("orbitalsupport_buddy_added");
	param_00 maps\mp\_utility::playersaveangles();
	lib_A7CB::setupflightsounds();
	level thread maps\mp\_utility::teamplayercardsplash("joined_orbitalsupport",self);
	if(getdvarint("camera_thirdPerson"))
	{
		maps\mp\_utility::setthirdpersondof(0);
	}

	thread lib_A7CB::playerdoridekillstreak();
	self waittill("initRideKillstreak_complete",var_01);
	if(!var_01)
	{
		return;
	}

	maps\mp\_utility::setusingremote("orbitalsupport");
	self method_834A();
	maps\mp\killstreaks\_aerial_utility::playerdisablestreakstatic();
	lib_A7CB::playerswitchtoturret(level.orbitalsupport_buddy_turret);
	thread lib_A7CB::waitsetstatic(0.1);
	thread lib_A7CB::waitsetthermal(1);
	thread lib_A7CB::waitdisableshadows(1);
	thread lib_A7CB::setospvisionandlightsetpermap(1.25);
	thread lib_A7CB::clouds();
	self.var_7315 = 0;
	self.reloading_medium_orbitalsupport_gun = 0;
	self.reloading_rocket_orbitalsupport_gun = 0;
	self.reloading_buddy_medium_orbitalsupport_gun = 0;
	if(isdefined(level.orbitalsupport_planemodel) && level.orbitalsupport_planemodel.coopoffensive)
	{
		self setclientomnvar("ui_osp_avail_weapons",1);
		self setclientomnvar("ui_osp_weapon",1);
		thread lib_A7CB::firebuddymediumorbitalsupportgun();
	}
	else
	{
		self notifyonplayercommand("orbitalsupport_fire","+attack");
		self notifyonplayercommand("orbitalsupport_fire","+attack_akimbo_accessible");
		self setclientomnvar("ui_osp_weapon",4);
		thread lib_A7CB::firebuddythreatgrenades();
	}

	thread lib_A7CB::removeorbitalsupportbuddyondisconnect();
	thread lib_A7CB::removeorbitalsupportbuddyonchangeteams();
	thread lib_A7CB::removeorbitalsupportbuddyonspectate();
	if(!isbot(self))
	{
		thread lib_A7CB::removeorbitalsupportbuddyoncommand();
	}

	wait(0.5);
	level.orbitalsupport_buddy.joined = 1;
	self setclientomnvar("ui_osp_toggle",2);
	self setclientomnvar("ui_warbird_countdown",param_00.orbitalsupport_endtime);
	var_02 = param_00 getentitynumber();
	self setclientomnvar("ui_coop_primary_num",var_02);
}

//Function Number: 51
lib_A7CB::playerdoridekillstreak()
{
	var_00 = maps\mp\killstreaks\_killstreaks::initridekillstreak("coop");
	if(var_00 != "success")
	{
		lib_A7CB::removeorbitalsupportbuddy(var_00 == "disconnect");
		self notify("initRideKillstreak_complete",0);
		return;
	}

	self notify("initRideKillstreak_complete",1);
}

//Function Number: 52
lib_A7CB::removeorbitalsupportbuddy(param_00)
{
	self notify("orbitalsupport_player_removed");
	level notify("orbitalsupport_buddy_removed");
	if(!param_00)
	{
		lib_A7CB::playerresetospomnvars();
		thread lib_A7CB::removeospvisionandlightsetpermap(0.5);
		maps\mp\_utility::revertvisionsetforplayer(0);
		self method_849C("ExitButtonDown","+activate");
		self method_849C("ExitButtonUp","-activate");
		self method_849C("ExitButtonDown","+usereload");
		self method_849C("ExitButtonUp","-usereload");
		if(!isdefined(level.orbitalsupport_planemodel) || !level.orbitalsupport_planemodel.coopoffensive)
		{
			self method_849C("orbitalsupport_fire","+attack");
			self method_849C("orbitalsupport_fire","+attack_akimbo_accessible");
		}

		self remotecontrolturretoff(level.orbitalsupport_buddy_turret);
		self unlink();
		level.orbitalsupport_buddy_turret hide();
		maps\mp\killstreaks\_aerial_utility::disableorbitalthermal(self);
		self method_851A(1);
		self method_80B9();
		self setblurforplayer(0,0);
		maps\mp\killstreaks\_aerial_utility::handle_player_ending_aerial_view();
		self method_834B();
		if(getdvarint("camera_thirdPerson"))
		{
			maps\mp\_utility::setthirdpersondof(1);
		}

		if(isdefined(self.darkscreenoverlay))
		{
			self.darkscreenoverlay destroy();
		}

		if(maps\mp\_utility::isusingremote())
		{
			maps\mp\_utility::clearusingremote();
		}

		self.var_7315 = undefined;
		self.reloading_medium_orbitalsupport_gun = undefined;
		self.reloading_rocket_orbitalsupport_gun = undefined;
		self.reloading_buddy_medium_orbitalsupport_gun = undefined;
		maps\mp\_utility::playerrestoreangles();
		maps\mp\killstreaks\_coop_util::playerresetaftercoopstreak();
		maps\mp\_utility::playerremotekillstreakshowhud();
	}

	level.orbitalsupport_buddy = undefined;
	lib_A7CB::setupflightsounds();
}

//Function Number: 53
lib_A7CB::removeorbitalsupportbuddyondisconnect()
{
	self endon("orbitalsupport_player_removed");
	self waittill("disconnect");
	thread lib_A7CB::removeorbitalsupportbuddy(1);
}

//Function Number: 54
lib_A7CB::removeorbitalsupportbuddyonchangeteams()
{
	self endon("orbitalsupport_player_removed");
	self waittill("joined_team");
	thread lib_A7CB::removeorbitalsupportbuddy(0);
}

//Function Number: 55
lib_A7CB::removeorbitalsupportbuddyonspectate()
{
	self endon("orbitalsupport_player_removed");
	common_scripts\utility::waittill_any("joined_spectators","spawned");
	thread lib_A7CB::removeorbitalsupportbuddy(0);
}

//Function Number: 56
lib_A7CB::removeorbitalsupportbuddyoncommand()
{
	self endon("orbitalsupport_player_removed");
	self notifyonplayercommand("ExitButtonDown","+activate");
	self notifyonplayercommand("ExitButtonUp","-activate");
	self notifyonplayercommand("ExitButtonDown","+usereload");
	self notifyonplayercommand("ExitButtonUp","-usereload");
	for(;;)
	{
		self waittill("ExitButtonDown");
		thread lib_A7CB::startospbuddyexitcommand();
		thread lib_A7CB::cancelospbuddyexitcommand();
	}
}

//Function Number: 57
lib_A7CB::startospbuddyexitcommand()
{
	self endon("orbitalsupport_player_removed");
	self endon("ExitButtonUp");
	self.osp_buddy_exit = 1;
	wait(0.5);
	if(self.osp_buddy_exit == 1)
	{
		thread lib_A7CB::removeorbitalsupportbuddy(0);
	}
}

//Function Number: 58
lib_A7CB::cancelospbuddyexitcommand()
{
	self endon("orbitalsupport_player_removed");
	self waittill("ExitButtonUp");
	self.osp_buddy_exit = 0;
}

//Function Number: 59
lib_A7CB::setrandomorbitalsupportstartposition()
{
	var_00 = level.var_5983[2] + 9275;
	var_01 = 8000;
	var_02 = (0,randomint(360),0);
	if(isdefined(level.orbitalsupportoverrides.spawnangle))
	{
		var_02 = (0,level.orbitalsupportoverrides.spawnangle,0);
	}
	else if(isdefined(level.orbitalsupportoverrides.spawnanglemin) && isdefined(level.orbitalsupportoverrides.spawnanglemax))
	{
		var_02 = (0,randomintrange(level.orbitalsupportoverrides.spawnanglemin,level.orbitalsupportoverrides.spawnanglemax),0);
	}

	if(isdefined(level.orbitalsupportoverrides.spawnradius))
	{
		var_01 = level.orbitalsupportoverrides.spawnradius;
	}

	if(isdefined(level.orbitalsupportoverrides.spawnheight))
	{
		var_00 = level.orbitalsupportoverrides.spawnheight;
	}

	level.orbitalsupport_planemodel.var_41 = var_02;
	level.orbitalsupport_planemodel.var_2E6 = level.orbitalsupport_planemodel.var_2E6 - vectornormalize(-1 * anglestoright(level.orbitalsupport_planemodel gettagangles("tag_origin"))) * var_01;
	level.orbitalsupport_planemodel.var_2E6 = level.orbitalsupport_planemodel.var_2E6 + (0,0,var_00);
	level.orbitalsupport_planemodel.destination2 = spawnstruct();
	level.orbitalsupport_planemodel.destination2.var_2E6 = level.orbitalsupport_planemodel.var_2E6;
	level.orbitalsupport_planemodel.destination2.var_41 = level.orbitalsupport_planemodel.var_41;
	level.orbitalsupport_planemodel.var_2E6 = level.orbitalsupport_planemodel.var_2E6 + (0,0,65000);
}

//Function Number: 60
lib_A7CB::moveorbitalsupporttodestination(param_00)
{
	self endon("death");
	self endon("crashing");
	level endon("game_ended");
	level endon("orbitalsupport_player_removed");
	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	thread lib_A7CB::rotateplane(1,"off");
	level.orbitalsupport_planemodel thread lib_A7CB::playjetfx();
	thread lib_A7CB::playentrysounddelayed();
	level.orbitalsupport_planemodel scriptmodelplayanimdeltamotion("paladin_ks_callin","paladin_notetrack");
	if(isdefined(level.orbitalsupport_planemodel.owner))
	{
		level.orbitalsupport_planemodel.owner thread lib_A7CB::playerdelayrumble(1.5);
	}

	level.orbitalsupport_planemodel waittillmatch("engines_full","paladin_notetrack");
	level.orbitalsupport_planemodel waittillmatch("downward_stop","paladin_notetrack");
	if(isdefined(level.orbitalsupport_planemodel.owner))
	{
		level.orbitalsupport_planemodel.owner stoprumble("orbital_laser_charge");
		level.orbitalsupport_planemodel.owner playrumbleonentity("ac130_105mm_fire");
		earthquake(0.2,2,level.orbitalsupport_planemodel.destination2.var_2E6,1000);
	}

	level.orbitalsupport_planemodel waittillmatch("engines_idle","paladin_notetrack");
	if(param_00)
	{
		level.orbitalsupport_planemodel method_8446(level.osprig,"tag_player");
		thread lib_A7CB::rotateplane(level.orbitalsupport_speed);
	}

	level.orbitalsupport_planemodel waittillmatch("end","paladin_notetrack");
	level.orbitalsupport_planemodel scriptmodelclearanim();
	level.orbitalsupport_planemodel scriptmodelplayanim("paladin_ks_loop","paladin_notetrack");
	if(isdefined(level.orbitalsupport_planemodel.owner))
	{
		level.orbitalsupport_planemodel.closeflightsound = spawn("script_origin",(0,0,0));
		level.orbitalsupport_planemodel.closeflightsound method_8446(level.orbitalsupport_planemodel,"tag_origin",(0,0,0),(0,0,0));
		level.orbitalsupport_planemodel.closeflightsound playloopsound("paladin_flight_loop_near");
	}

	level.orbitalsupport_planemodel.farflightsound = spawn("script_origin",(0,0,0));
	level.orbitalsupport_planemodel.farflightsound method_8446(level.orbitalsupport_planemodel,"tag_origin",(0,0,0),(0,0,0));
	level.orbitalsupport_planemodel.farflightsound playloopsound("paladin_flight_loop_dist");
	lib_A7CB::setupflightsounds();
	level.orbitalsupport_planemodel.paladinflying = 1;
}

//Function Number: 61
lib_A7CB::setupflightsounds()
{
	if(isdefined(level.orbitalsupport_planemodel.closeflightsound))
	{
		level.orbitalsupport_planemodel.closeflightsound hide();
		if(isdefined(level.orbitalsupport_planemodel.owner))
		{
			level.orbitalsupport_planemodel.closeflightsound showtoplayer(level.orbitalsupport_planemodel.owner);
		}

		if(isdefined(level.orbitalsupport_buddy) && !level.splitscreen && !lib_A7CB::bothplayerssplitscreen(level.orbitalsupport_planemodel.owner,level.orbitalsupport_buddy))
		{
			level.orbitalsupport_planemodel.closeflightsound showtoplayer(level.orbitalsupport_buddy);
		}
	}

	if(isdefined(level.orbitalsupport_planemodel.farflightsound))
	{
		level.orbitalsupport_planemodel.farflightsound hide();
		foreach(var_01 in level.var_328)
		{
			if(level.splitscreen || isdefined(level.orbitalsupport_planemodel.owner) && lib_A7CB::bothplayerssplitscreen(level.orbitalsupport_planemodel.owner,var_01))
			{
				continue;
			}

			if(isdefined(level.orbitalsupport_planemodel.owner) && var_01 != level.orbitalsupport_planemodel.owner)
			{
				level.orbitalsupport_planemodel.farflightsound showtoplayer(var_01);
			}
		}
	}
}

//Function Number: 62
lib_A7CB::bothplayerssplitscreen(param_00,param_01)
{
	return param_00 issplitscreenplayer() && param_01 issplitscreenplayer();
}

//Function Number: 63
lib_A7CB::playerdelayrumble(param_00)
{
	self endon("disconnect");
	self endon("orbitalsupport_player_removed");
	wait(param_00);
	self playrumbleonentity("orbital_laser_charge");
}

//Function Number: 64
lib_A7CB::playjetfx()
{
	level.orbitalsupport_planemodel endon("death");
	level.orbitalsupport_planemodel endon("crashing");
	level endon("game_ended");
	level endon("orbitalsupport_player_removed");
	level.orbitalsupport_planemodel endon("stopEffects");
	playfxontag(common_scripts\utility::getfx("orbitalsupport_entry"),level.orbitalsupport_planemodel,"tag_origin");
	wait 0.05;
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_1");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_2");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_1");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_2");
	wait 0.05;
	playfx(common_scripts\utility::getfx("orbitalsupport_entry_flash"),level.orbitalsupport_planemodel.destination2.var_2E6);
	level.orbitalsupport_planemodel waittillmatch("engines_full","paladin_notetrack");
	playfxontag(common_scripts\utility::getfx("orbitalsupport_light"),level.orbitalsupport_planemodel,"tag_light_tail");
	playfxontag(common_scripts\utility::getfx("orbitalsupport_entry_complete"),level.orbitalsupport_planemodel,"tag_light_belly");
	wait 0.05;
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_1");
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_1");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_1");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_2");
	wait 0.05;
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_2");
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_2");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_1");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_2");
	level.orbitalsupport_planemodel waittillmatch("engines_idle","paladin_notetrack");
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_1");
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_1");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_1");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_1");
	wait 0.05;
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_2");
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_2");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_2");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_2");
	wait 0.05;
	stopfxontag(common_scripts\utility::getfx("orbitalsupport_entry"),level.orbitalsupport_planemodel,"tag_origin");
}

//Function Number: 65
lib_A7CB::playentrysounddelayed()
{
	self endon("death");
	self endon("crashing");
	level endon("game_ended");
	level endon("orbitalsupport_player_removed");
	wait(1);
	playsoundatpos(level.orbitalsupport_planemodel.destination2.var_2E6,"paladin_orbit_drop");
}

//Function Number: 66
lib_A7CB::orbitalsupportexit()
{
	level.orbitalsupport_planemodel endon("crashing");
	level.orbitalsupport_planemodel notify("leaving");
	level.orbitalsupport_planemodel unlink();
	level.orbitalsupport_planemodel scriptmodelplayanimdeltamotion("paladin_ks_exit","paladin_notetrack");
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_1");
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_2");
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_1");
	stopfxontag(common_scripts\utility::getfx("vehicle_osp_jet"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_2");
	wait 0.05;
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg_trl"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_1");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg_trl"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_L_2");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg_trl"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_1");
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg_trl"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_R_2");
	wait 0.05;
	playfxontag(common_scripts\utility::getfx("vehicle_osp_jet_lg_trl"),level.orbitalsupport_planemodel,"TAG_FX_ENGINE_B");
	wait(4.8);
	lib_A7CB::cleanupospents();
	level.orbitalsupport_planemodel delete();
	level.orbitalsupportinuse = 0;
}

//Function Number: 67
lib_A7CB::setupplayersduringstreak()
{
	level.orbitalsupport_chatter_timer = 0;
	foreach(var_01 in level.var_328)
	{
		if(isdefined(var_01.inliveplayerkillstreak) && level.orbitalsupport_planemodel.owner.inliveplayerkillstreak == var_01.inliveplayerkillstreak)
		{
			continue;
		}
		else if(!isdefined(var_01.inliveplayerkillstreak))
		{
			var_01 lib_A7CB::onplayerspawnedduringstreak();
			continue;
		}

		var_01 thread lib_A7CB::playermonitordeath();
		var_01 thread lib_A7CB::playermonitormarkedtarget();
	}

	level thread lib_A7CB::onplayerconnectduringstreak();
}

//Function Number: 68
lib_A7CB::onplayerconnectduringstreak()
{
	level endon("game_ended");
	level.orbitalsupport_planemodel.owner endon("orbitalsupport_player_removed");
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread lib_A7CB::onplayerspawnedduringstreak();
	}
}

//Function Number: 69
lib_A7CB::onplayerspawnedduringstreak()
{
	self waittill("spawned_player");
	thread lib_A7CB::playermonitordeath();
	thread lib_A7CB::playermonitormarkedtarget();
	lib_A7CB::setupflightsounds();
}

//Function Number: 70
lib_A7CB::playermonitormarkedtarget()
{
	self endon("disconnect");
	level.orbitalsupport_planemodel.owner endon("orbitalsupport_player_removed");
	var_00 = level.orbitalsupport_planemodel.owner.inliveplayerkillstreak;
	for(;;)
	{
		self waittill("paint_marked_target",var_01);
		if(self.inliveplayerkillstreak == var_00 || !isdefined(var_01))
		{
			continue;
		}

		if(isdefined(level.orbitalsupport_buddy) && var_01 == level.orbitalsupport_buddy && gettime() > level.orbitalsupport_buddy_chatter_timer)
		{
			level.orbitalsupport_buddy_chatter_timer = gettime() + 10000;
			if(!level.orbitalsupport_planemodel.coopoffensive)
			{
				var_01 maps\mp\_utility::leaderdialogonplayer("copilot_marked_mp_paladin");
			}
		}
	}
}

//Function Number: 71
lib_A7CB::playermonitordeath()
{
	self endon("disconnect");
	level.orbitalsupport_planemodel.owner endon("orbitalsupport_player_removed");
	var_00 = level.orbitalsupport_planemodel.owner.inliveplayerkillstreak;
	for(;;)
	{
		self waittill("death",var_01,var_02,var_03);
		if(self.inliveplayerkillstreak == var_00 || !isdefined(var_01))
		{
			continue;
		}

		if(var_01 == level.orbitalsupport_planemodel.owner && gettime() > level.orbitalsupport_chatter_timer)
		{
			level.orbitalsupport_chatter_timer = gettime() + 10000;
			var_01 maps\mp\_utility::leaderdialogonplayer("copilot_enemykill_mp_paladin");
		}

		if(isdefined(level.orbitalsupport_buddy) && var_01 == level.orbitalsupport_buddy && gettime() > level.orbitalsupport_buddy_chatter_timer)
		{
			level.orbitalsupport_buddy_chatter_timer = gettime() + 10000;
			if(level.orbitalsupport_planemodel.coopoffensive)
			{
				var_01 maps\mp\_utility::leaderdialogonplayer("copilot_enemykill_mp_paladin");
			}
		}
	}
}

//Function Number: 72
turretdeletesoundent()
{
	if(isdefined(self.soundent))
	{
		self.soundent delete();
	}
}

//Function Number: 73
lib_A7CB::playerresetospomnvars()
{
	self setclientomnvar("ui_killstreak_optic",0);
	self setclientomnvar("ui_osp_rockets",0);
	self setclientomnvar("ui_osp_avail_weapons",0);
	self setclientomnvar("ui_osp_weapon",0);
	self setclientomnvar("ui_osp_reload_bitfield",0);
	self setclientomnvar("ui_osp_toggle",0);
	self setclientomnvar("ui_coop_primary_num",0);
	maps\mp\killstreaks\_aerial_utility::playerdisablestreakstatic();
}

//Function Number: 74
lib_A7CB::rotateplane(param_00,param_01)
{
	level notify("stop_rotatePlane_thread");
	level endon("stop_rotatePlane_thread");
	if(!isdefined(param_01))
	{
		param_01 = "on";
	}

	if(param_01 == "on")
	{
		level.osprig rotateyaw(360,param_00,0.5);
		wait(param_00);
		for(;;)
		{
			level.osprig rotateyaw(360,param_00);
			wait(param_00);
		}

		return;
	}

	if(param_01 == "off")
	{
		var_02 = 10;
		var_03 = param_00 / 360 * var_02;
		level.osprig rotateyaw(level.osprig.var_41[2] + var_02,var_03,0,var_03);
	}
}

//Function Number: 75
spawnmuzzleflashent(param_00,param_01,param_02)
{
	var_03 = spawn("script_model",(0,0,0));
	var_03 setmodel("tag_origin");
	var_03 linkto(param_00,param_01,(0,0,0),(0,0,0));
	var_03 hide();
	foreach(var_05 in level.var_328)
	{
		if(var_05 != param_02)
		{
			var_03 showtoplayer(var_05);
		}
	}

	thread onplayerconnectmuzzleflashent(var_03);
	return var_03;
}

//Function Number: 76
onplayerconnectmuzzleflashent(param_00)
{
	param_00 endon("death");
	for(;;)
	{
		level waittill("connected",var_01);
		thread onplayerspawnedmuzzleflashent(param_00,var_01);
	}
}

//Function Number: 77
onplayerspawnedmuzzleflashent(param_00,param_01)
{
	param_00 endon("death");
	param_01 endon("disconnect");
	param_01 waittill("spawned_player");
	param_00 showtoplayer(param_01);
}