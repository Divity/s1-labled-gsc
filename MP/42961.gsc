/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42961.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 93
 * Decompile Time: 35 ms
 * Timestamp: 4/20/2022 8:18:35 PM
*******************************************************************/

//Function Number: 1
lib_A7D1::init()
{
	level.warbirdsetting = [];
	level.warbirdsetting["Warbird"] = spawnstruct();
	level.warbirdsetting["Warbird"].vehicle = "warbird_player_mp";
	level.warbirdsetting["Warbird"].modelbase = "vehicle_xh9_warbird_low_cloaked_in_out_mp_cloak";
	level.warbirdsetting["Warbird"].helitype = "warbird";
	level.warbirdsetting["Warbird"].var_275 = level.heli_maxhealth;
	level.killstreakfuncs["warbird"] = ::lib_A7D1::tryusewarbird;
	level.killstreakwieldweapons["warbird_remote_turret_mp"] = "warbird";
	level.killstreakwieldweapons["warbird_player_turret_mp"] = "warbird";
	level.killstreakwieldweapons["warbird_missile_mp"] = "warbird";
	level.killstreakwieldweapons["paint_missile_killstreak_mp"] = "warbird";
	if(!isdefined(level.spawnedwarbirds))
	{
		level.spawnedwarbirds = [];
	}

	if(!isdefined(level.warbirdinuse))
	{
		level.warbirdinuse = 0;
	}

	level.chopper_fx["light"]["warbird"] = loadfx("vfx/lights/air_light_wingtip_red");
	level.chopper_fx["engine"]["warbird"] = loadfx("vfx/distortion/distortion_warbird_mp");
	maps\mp\killstreaks\_aerial_utility::makehelitype("warbird","vfx/explosion/vehicle_warbird_explosion_midair",::lib_A7D1::warbirdlightfx);
	maps\mp\killstreaks\_aerial_utility::addairexplosion("warbird","vfx/explosion/vehicle_warbird_explosion_midair");
	game["dialog"]["assist_mp_warbird"] = "ks_warbird_joinreq";
	game["dialog"]["pilot_sup_mp_warbird"] = "pilot_sup_mp_warbird";
	game["dialog"]["pilot_aslt_mp_warbird"] = "pilot_aslt_mp_warbird";
	game["dialog"]["ks_warbird_destroyed"] = "ks_warbird_destroyed";
}

//Function Number: 2
lib_A7D1::tryusewarbird(param_00,param_01)
{
	if(!lib_A7D1::canusewarbird())
	{
		self iprintlnbold(&"KILLSTREAKS_AIR_SPACE_TOO_CROWDED");
		return 0;
	}
	else if(maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + 1 >= maps\mp\_utility::maxvehiclesallowed())
	{
		self iprintlnbold(&"MP_TOO_MANY_VEHICLES");
		return 0;
	}

	maps\mp\_utility::incrementfauxvehiclecount();
	level.warbirdinuse = 1;
	var_02 = common_scripts\utility::array_contains(param_01,"warbird_ai_attack") || common_scripts\utility::array_contains(param_01,"warbird_ai_follow");
	if(!var_02)
	{
		thread lib_A7D1::playerclearwarbirdonteamchange();
		var_03 = maps\mp\killstreaks\_killstreaks::initridekillstreak("warbird");
		if(var_03 != "success")
		{
			maps\mp\_utility::decrementfauxvehiclecount();
			level.warbirdinuse = 0;
			return 0;
		}

		maps\mp\_utility::setusingremote("warbird");
	}

	var_03 = lib_A7D1::setupwarbirdkillstreak(param_00,param_01);
	if(var_03)
	{
		maps\mp\_matchdata::logkillstreakevent("warbird",self.var_2E6);
	}

	return var_03;
}

//Function Number: 3
lib_A7D1::playerclearwarbirdonteamchange()
{
	self endon("rideKillstreakBlack");
	self endon("rideKillstreakFailed");
	self waittill("joined_team");
	level.warbirdinuse = 0;
	maps\mp\_utility::decrementfauxvehiclecount();
}

//Function Number: 4
lib_A7D1::canusewarbird()
{
	return !level.warbirdinuse;
}

//Function Number: 5
lib_A7D1::iscontrollingwarbird()
{
	return isdefined(self.controllingwarbird) && self.controllingwarbird;
}

//Function Number: 6
lib_A7D1::warbirdmakevehiclesolidcapsule()
{
	self endon("death");
	wait 0.05;
	self makevehiclesolidcapsule(300,-9,160);
}

//Function Number: 7
lib_A7D1::setupplayercommands(param_00)
{
	if(isbot(self))
	{
		return;
	}

	self notifyonplayercommand("SwitchVisionMode","+actionslot 1");
	self notifyonplayercommand("SwitchWeapon","weapnext");
	self notifyonplayercommand("ToggleControlState","+activate");
	self notifyonplayercommand("ToggleControlCancel","-activate");
	self notifyonplayercommand("ToggleControlState","+usereload");
	self notifyonplayercommand("ToggleControlCancel","-usereload");
	self notifyonplayercommand("StartFire","+attack");
	self notifyonplayercommand("StartFire","+attack_akimbo_accessible");
	if(isdefined(param_00) && common_scripts\utility::array_contains(param_00,"warbird_cloak"))
	{
		self notifyonplayercommand("Cloak","+smoke");
	}
}

//Function Number: 8
lib_A7D1::disableplayercommands(param_00)
{
	if(isbot(self))
	{
		return;
	}

	self method_849C("SwitchVisionMode","+actionslot 1");
	self method_849C("SwitchWeapon","weapnext");
	self method_849C("ToggleControlState","+activate");
	self method_849C("ToggleControlCancel","-activate");
	self method_849C("ToggleControlState","+usereload");
	self method_849C("ToggleControlCancel","-usereload");
	self method_849C("StartFire","+attack");
	self method_849C("StartFire","+attack_akimbo_accessible");
	if(isdefined(param_00) && param_00.cancloak)
	{
		self method_849C("Cloak","+smoke");
	}
}

//Function Number: 9
lib_A7D1::setupwarbirdkillstreak(param_00,param_01)
{
	self endon("warbirdStreakComplete");
	lib_A7D1::setupplayercommands(param_01);
	self.possesswarbird = 0;
	self.controllingwarbird = 0;
	self.warbirdinit = 1;
	var_02 = lib_A7D1::buildvalidflightpaths();
	var_03 = lib_A7D1::findbestspawnlocation(var_02);
	var_03 = lib_A7D1::rotatehelispawn(var_03);
	var_04 = spawnhelicopter(self,var_03.var_2E6,var_03.var_41,level.warbirdsetting["Warbird"].vehicle,level.warbirdsetting["Warbird"].modelbase);
	var_04.var_251D = var_03;
	if(!isdefined(var_04))
	{
		return 0;
	}

	var_04 thread lib_A7D1::warbird_audio();
	var_04 hide();
	var_04 thread lib_A7D1::warbirdmakevehiclesolidcapsule();
	var_04.targetent = spawn("script_origin",(0,0,0));
	var_04.vehicletype = "Warbird";
	var_04.heli_type = level.warbirdsetting["Warbird"].helitype;
	var_04.helitype = level.warbirdsetting["Warbird"].helitype;
	var_04.attractor = missilecreateattractorent(var_04,level.heli_attract_strength,level.heli_attract_range);
	var_04.lifeid = param_00;
	var_04.inliveplayerkillstreak = self.connectedpostgame["team"];
	var_04.connectedpostgame["team"] = self.connectedpostgame["team"];
	var_04.owner = self;
	var_04.var_275 = level.warbirdsetting["Warbird"].var_275;
	var_04.zoffset = (0,0,0);
	var_04.targeting_delay = level.heli_targeting_delay;
	var_04.primarytarget = undefined;
	var_04.secondarytarget = undefined;
	var_04.attacker = undefined;
	var_04.currentstate = "ok";
	var_04.picknewtarget = 1;
	var_04.lineofsight = 0;
	var_04.overheattime = 6;
	var_04.firetime = 0;
	var_04.weaponfire = 0;
	var_04.var_5154 = 1;
	var_04.cloakcooldown = 0;
	var_04.iscrashing = 0;
	var_04.ispossessed = 0;
	var_04.var_5D57 = param_01;
	var_04.aiattack = common_scripts\utility::array_contains(var_04.var_5D57,"warbird_ai_attack");
	var_04.aifollow = common_scripts\utility::array_contains(var_04.var_5D57,"warbird_ai_follow");
	var_04.hasai = var_04.aiattack || var_04.aifollow;
	var_04.cancloak = common_scripts\utility::array_contains(var_04.var_5D57,"warbird_cloak");
	var_04.hasrockets = common_scripts\utility::array_contains(var_04.var_5D57,"warbird_rockets");
	var_04.coopoffensive = common_scripts\utility::array_contains(var_04.var_5D57,"warbird_coop_offensive");
	var_04.extraflare = common_scripts\utility::array_contains(var_04.var_5D57,"warbird_flares");
	if(var_04.extraflare)
	{
		var_04.numextraflares = 1;
	}
	else
	{
		var_04.numextraflares = 0;
	}

	if(var_04.hasrockets)
	{
		var_04.rocketclip = 3;
	}
	else
	{
		var_04.rocketclip = 0;
	}

	var_04.remainingrocketshots = var_04.rocketclip;
	if(var_04.hasai)
	{
		var_04.usableent = spawn("script_origin",(0,0,0));
		var_04.usableent linkto(var_04);
		var_04.usableent maps\mp\_utility::makegloballyusablebytype("killstreakRemote",&"MP_WARBIRD_PLAYER_PROMPT",self);
	}

	var_04 thread [[ level.lightfxfunc["warbird"] ]]();
	var_04 common_scripts\utility::make_entity_sentient_mp(var_04.inliveplayerkillstreak);
	if(!isdefined(level.spawnedwarbirds))
	{
		level.spawnedwarbirds = [];
	}

	level.spawnedwarbirds = common_scripts\utility::array_add(level.spawnedwarbirds,var_04);
	var_04 maps\mp\killstreaks\_aerial_utility::addtohelilist();
	var_04 thread maps\mp\killstreaks\_aerial_utility::heli_flares_monitor(var_04.numextraflares);
	var_04 thread maps\mp\killstreaks\_aerial_utility::heli_leave_on_disconnect(self);
	var_04 thread maps\mp\killstreaks\_aerial_utility::heli_leave_on_changeteams(self);
	var_04 thread maps\mp\killstreaks\_aerial_utility::heli_leave_on_gameended(self);
	var_05 = 30;
	if(common_scripts\utility::array_contains(var_04.var_5D57,"warbird_time"))
	{
		var_05 = 45;
	}

	if(maps\mp\_utility::_hasperk("specialty_blackbox") && isdefined(self.specialty_blackbox_bonus))
	{
		var_05 = var_05 * self.specialty_blackbox_bonus;
	}

	var_04.endtime = gettime() + var_05 * 1000;
	var_04 thread maps\mp\killstreaks\_aerial_utility::heli_leave_on_timeout(var_05);
	var_04 thread maps\mp\killstreaks\_aerial_utility::heli_monitoremp();
	var_04 thread maps\mp\gametypes\_damage::setentitydamagecallback(var_04.var_275,undefined,::lib_A7D1::warbirdondeath,::maps\mp\killstreaks\_aerial_utility::heli_modifydamage,1);
	var_04 thread lib_A7D1::warbird_health();
	var_04 thread maps\mp\killstreaks\_aerial_utility::heli_existance();
	thread lib_A7D1::monitoraiwarbirddeathortimeout(var_04);
	thread lib_A7D1::monitorplayerdisconnect(var_04);
	var_04.warbirdturret = var_04 lib_A7D1::spawn_warbird_turret("warbird_remote_turret_mp","vehicle_xh9_warbird_turret_cloaked_inout_killstreak_mp_cloak","tag_player_mp",0);
	var_04.warbirdturret hide();
	if(!var_04.aiattack && !var_04.aifollow)
	{
		var_04.warbirdturret showtoplayer(self);
	}

	var_06 = "orbitalsupport_big_turret_mp";
	if(var_04.coopoffensive)
	{
		var_06 = "warbird_remote_turret_mp";
	}

	var_04.warbirdbuddyturret = var_04 lib_A7D1::spawn_warbird_turret(var_06,"vehicle_xh9_warbird_turret_cloaked_inout_killstreak_mp_cloak","tag_playerbuddy_mp",1);
	var_04.warbirdbuddyturret hide();
	thread lib_A7D1::setupcloaking(var_04);
	thread lib_A7D1::warbirdoverheatbarcolormonitor(var_04,var_04.warbirdturret);
	if(var_04.aiattack || var_04.aifollow)
	{
		thread lib_A7D1::playermonitorwarbirdpossession(var_04);
	}
	else
	{
		thread lib_A7D1::playercontrolwarbirdsetup(var_04);
	}

	if(isdefined(var_04))
	{
		if(level.teambased)
		{
			level thread lib_A7D1::handlecoopjoining(var_04,self);
		}

		return 1;
	}

	return 0;
}

//Function Number: 10
lib_A7D1::playermonitorwarbirdpossession(param_00)
{
	self endon("warbirdStreakComplete");
	param_00 waittill("cloaked");
	wait 0.05;
	for(;;)
	{
		lib_A7D1::monitoraiwarbirdswitch(param_00);
		param_00.usableent waittill("trigger");
		thread lib_A7D1::manuallyjoinwarbird();
		lib_A7D1::playercontrolwarbirdsetup(param_00);
	}
}

//Function Number: 11
lib_A7D1::manuallyjoinwarbird()
{
	self.manuallyjoiningkillstreak = 1;
	common_scripts\utility::waittill_any("death","initRideKillstreak_complete","warbirdStreakComplete");
	self.manuallyjoiningkillstreak = 0;
}

//Function Number: 12
lib_A7D1::warbirdondeath(param_00,param_01,param_02,param_03)
{
	maps\mp\gametypes\_damage::onkillstreakkilled(param_00,param_01,param_02,param_03,"warbird_destroyed","ks_warbird_destroyed","callout_destroyed_warbird",1);
}

//Function Number: 13
lib_A7D1::setupcloaking(param_00)
{
	param_00.cloakstate = 0;
	lib_A7D1::cloakingtransition(param_00,1,1);
}

//Function Number: 14
lib_A7D1::warbirdrockethudupdate(param_00)
{
	if(!param_00.hasrockets)
	{
		return;
	}

	switch(param_00.remainingrocketshots)
	{
		case 0:
			break;

		case 1:
			break;

		case 2:
			break;

		case 3:
			break;
	}
}

//Function Number: 15
lib_A7D1::setupwarbirdhud(param_00,param_01,param_02)
{
	self endon("warbirdStreakComplete");
	param_00 endon("death");
	self endon("ResumeWarbirdAI");
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	self method_8532();
	maps\mp\killstreaks\_aerial_utility::playerdisablestreakstatic();
	wait(0.05);
	if(param_01)
	{
		self setclientomnvar("ui_warbird_toggle",2);
	}
	else
	{
		self setclientomnvar("ui_warbird_toggle",1);
	}

	maps\mp\killstreaks\_aerial_utility::playerenablestreakstatic();
	self setclientomnvar("ui_warbird_cloak",0);
	self setclientomnvar("ui_warbird_countdown",param_00.endtime);
	if(!param_01)
	{
		lib_A7D1::warbirdrockethudupdate(param_00);
	}

	if(param_01 && !param_00.coopoffensive)
	{
		self setclientomnvar("ui_warbird_weapon",3);
	}
	else if(param_01 && param_00.coopoffensive)
	{
		self setclientomnvar("ui_warbird_weapon",0);
	}
	else if(param_00.hasrockets)
	{
		self setclientomnvar("ui_warbird_weapon",1);
	}
	else
	{
		self setclientomnvar("ui_warbird_weapon",0);
	}

	if(param_01)
	{
		var_03 = param_02 getentitynumber();
		self setclientomnvar("ui_coop_primary_num",var_03);
	}

	if(param_00.cancloak && !param_01)
	{
		self setclientomnvar("ui_warbird_cloaktext",1);
	}
	else
	{
		self setclientomnvar("ui_warbird_cloaktext",0);
	}

	self setclientomnvar("ui_killstreak_optic",0);
}

//Function Number: 16
lib_A7D1::warbirdoverheatbarcolormonitor(param_00,param_01)
{
	self endon("warbirdStreakComplete");
	param_00 endon("death");
	for(;;)
	{
		param_01.heat_level = param_01 method_844E();
		self setclientomnvar("ui_warbird_heat",param_01.heat_level);
		var_02 = 0;
		if(isdefined(param_01))
		{
			var_02 = param_01 method_844F();
		}

		if(var_02)
		{
			self setclientomnvar("ui_warbird_fire",1);
		}
		else if(param_01.heat_level > 0.7)
		{
			self setclientomnvar("ui_warbird_fire",2);
		}
		else
		{
			self setclientomnvar("ui_warbird_fire",0);
		}

		while(var_02)
		{
			wait(0.05);
			var_02 = param_01 method_844F();
			param_01.heat_level = param_01 method_844E();
			self setclientomnvar("ui_warbird_heat",param_01.heat_level);
		}

		self notify("overheatFinished");
		wait 0.05;
	}
}

//Function Number: 17
lib_A7D1::spawn_warbird_turret(param_00,param_01,param_02,param_03)
{
	var_04 = spawnturret("misc_turret",self gettagorigin(param_02),param_00,0);
	var_04.var_41 = self gettagangles(param_02);
	var_04 setmodel(param_01);
	var_04 setdefaultdroppitch(45);
	var_04 linkto(self,param_02,(0,0,0),(0,0,0));
	var_04.owner = self.owner;
	var_04.health = 99999;
	var_04.var_275 = 1000;
	var_04.damagetaken = 0;
	var_04.stunned = 0;
	var_04.stunnedtime = 0;
	var_04 setcandamage(0);
	var_04 setcanradiusdamage(0);
	var_04.inliveplayerkillstreak = self.inliveplayerkillstreak;
	var_04.connectedpostgame["team"] = self.inliveplayerkillstreak;
	if(level.teambased)
	{
		var_04 setturretteam(self.inliveplayerkillstreak);
	}

	var_04 setmode("sentry_manual");
	var_04 setsentryowner(self.owner);
	var_04 setturretminimapvisible(0);
	var_04.chopper = self;
	if(param_03)
	{
		var_04.firesoundent = spawn("script_model",self gettagorigin(param_02));
		var_04.firesoundent setmodel("tag_origin");
		var_04.firesoundent method_8446(self,param_02,(0,0,0),(0,0,0));
	}

	return var_04;
}

//Function Number: 18
lib_A7D1::takeover_warbird_turret_buddy(param_00)
{
	if(getdvarint("camera_thirdPerson"))
	{
		maps\mp\_utility::setthirdpersondof(0);
	}

	param_00.warbirdbuddyturret.owner = self;
	param_00.warbirdbuddyturret setmode("sentry_manual");
	param_00.warbirdbuddyturret setsentryowner(self);
	self playerlinkweaponviewtodelta(param_00.warbirdbuddyturret,"tag_player",0,180,180,-20,180,0);
	self playerlinkedsetviewznear(0);
	self playerlinkedsetusebaseangleforviewclamp(1);
	self remotecontrolturret(param_00.warbirdbuddyturret,45,param_00.var_41[1]);
}

//Function Number: 19
lib_A7D1::findbestspawnlocation(param_00)
{
	var_01 = common_scripts\utility::get_array_of_closest(self.var_2E6,param_00);
	return var_01[0];
}

//Function Number: 20
lib_A7D1::rotatehelispawn(param_00)
{
	var_01 = maps\mp\killstreaks\_aerial_utility::gethelianchor();
	var_02 = anglestoforward(param_00.var_41);
	var_03 = var_01.var_2E6 - param_00.var_2E6;
	var_04 = vectortoangles(var_03);
	param_00.var_41 = var_04;
	return param_00;
}

//Function Number: 21
lib_A7D1::buildvalidflightpaths()
{
	self endon("warbirdStreakComplete");
	if(!isdefined(level.warbirdflightpathnodes))
	{
		level.warbirdflightpathnodes = [];
	}
	else
	{
		return level.warbirdflightpathnodes;
	}

	var_00 = maps\mp\killstreaks\_aerial_utility::getentorstruct("heli_loop_start","targetname");
	var_01 = var_00;
	var_02 = maps\mp\killstreaks\_aerial_utility::gethelianchor();
	var_03 = var_02.var_2E6[2];
	for(;;)
	{
		var_04 = maps\mp\killstreaks\_aerial_utility::getentorstruct(var_01.target,"targetname");
		var_01.next = var_04;
		var_04.prev = var_01;
		var_04.var_2E6 = (var_04.var_2E6[0],var_04.var_2E6[1],var_03);
		if(lib_A7D1::isinarray(level.warbirdflightpathnodes,var_04))
		{
			break;
		}

		level.warbirdflightpathnodes = common_scripts\utility::array_add(level.warbirdflightpathnodes,var_04);
		var_01 = var_04;
	}

	foreach(var_06 in level.warbirdflightpathnodes)
	{
	}

	return level.warbirdflightpathnodes;
}

//Function Number: 22
lib_A7D1::isinarray(param_00,param_01)
{
	if(isdefined(param_00))
	{
		foreach(var_03 in param_00)
		{
			if(var_03 == param_01)
			{
				return 1;
			}
		}
	}

	return 0;
}

//Function Number: 23
lib_A7D1::monitorwarbirdsafearea(param_00)
{
	self endon("warbirdStreakComplete");
	self endon("ResumeWarbirdAI");
	thread maps\mp\killstreaks\_aerial_utility::playerhandleboundarystatic(param_00,"warbirdStreakComplete","ResumeWarbirdAI");
	param_00 waittill("outOfBounds");
	wait(2);
	param_00 thread maps\mp\killstreaks\_aerial_utility::heli_leave();
}

//Function Number: 24
lib_A7D1::warbirdaiattack(param_00)
{
	thread lib_A7D1::warbirdfire(param_00);
	thread lib_A7D1::warbirdlookatenemy(param_00);
	thread lib_A7D1::warbirdmovetoattackpoint(param_00);
}

//Function Number: 25
lib_A7D1::warbirdmovetoattackpoint(param_00)
{
	self endon("warbirdPlayerControlled");
	self endon("warbirdStreakComplete");
	if(!isdefined(level.warbirdaiattackbasespeed))
	{
		level.warbirdaiattackbasespeed = 40;
	}

	if(!isdefined(level.warbirdaiattackneargoal))
	{
		level.warbirdaiattackneargoal = 100;
	}

	var_01 = level.warbirdaiattackbasespeed;
	param_00 veh_setspeed(var_01,var_01 / 4,var_01 / 4);
	param_00 veh_neargoalnotifydist(level.warbirdaiattackneargoal);
	var_02 = param_00.var_251D;
	if(!isdefined(var_02))
	{
		var_03 = common_scripts\utility::get_array_of_closest(param_00.var_2E6,lib_A7D1::buildvalidflightpaths());
		var_04 = param_00.var_2E6;
		for(var_05 = 0;var_05 < var_03.size;var_05++)
		{
			var_06 = var_03[var_05].var_2E6;
			if(maps\mp\killstreaks\_aerial_utility::flynodeorgtracepassed(var_04,var_06,param_00))
			{
				var_07 = var_06 - var_04;
				var_08 = distance(var_04,var_06);
				var_09 = rotatevector(var_07,(0,90,0));
				var_0A = var_04 + var_09 * 100;
				var_0B = var_0A + var_07 * var_08;
				if(maps\mp\killstreaks\_aerial_utility::flynodeorgtracepassed(var_0A,var_0B,param_00))
				{
					var_0C = rotatevector(var_07,(0,-90,0));
					var_0A = var_04 + var_0C * 100;
					var_0B = var_0A + var_07 * var_08;
					if(maps\mp\killstreaks\_aerial_utility::flynodeorgtracepassed(var_0A,var_0B,param_00))
					{
						var_02 = var_03[var_05];
						break;
					}
				}
			}

			wait 0.05;
		}
	}
	else
	{
		var_02 = var_02.next;
	}

	if(!isdefined(var_02))
	{
		return;
	}

	for(;;)
	{
		var_0D = 0;
		if(param_00.aifollow)
		{
			var_0D = 1;
		}

		param_00 veh_setgoalpos(var_02.var_2E6,var_0D);
		param_00.var_5154 = 1;
		param_00 waittill("near_goal");
		param_00.var_251D = var_02;
		param_00.var_5154 = 0;
		var_02 = lib_A7D1::waituntilmovereturnnode(param_00);
		param_00.var_251D = undefined;
	}
}

//Function Number: 26
lib_A7D1::waituntilmovereturnnode(param_00)
{
	if(param_00.aifollow && isdefined(param_00.owner))
	{
		var_01 = param_00.var_251D;
		var_02 = var_01.next;
		var_03 = var_01.prev;
		while(isdefined(param_00.owner))
		{
			var_04 = distance2dsquared(param_00.owner.var_2E6,var_01.var_2E6);
			var_05 = distance2dsquared(param_00.owner.var_2E6,var_02.var_2E6);
			var_06 = distance2dsquared(param_00.owner.var_2E6,var_03.var_2E6);
			if(var_05 < var_04 && var_05 < var_06)
			{
				return var_02;
			}
			else if(var_06 < var_04 && var_06 < var_05)
			{
				return var_03;
			}

			wait 0.05;
		}

		return;
	}

	return var_06.var_251D.next;
}

//Function Number: 27
lib_A7D1::warbirdlookatenemy(param_00)
{
	self endon("warbirdPlayerControlled");
	self endon("warbirdStreakComplete");
	for(;;)
	{
		if(isdefined(param_00.enemy_target))
		{
			lib_A7D1::monitorlookatent(param_00);
			param_00.warbirdturret cleartargetentity();
		}

		wait 0.05;
	}
}

//Function Number: 28
lib_A7D1::monitorlookatent(param_00)
{
	self endon("warbirdPlayerControlled");
	self endon("warbirdStreakComplete");
	param_00 endon("pickNewTarget");
	param_00 veh_setlookatent(param_00.enemy_target);
	param_00.warbirdturret settargetentity(param_00.enemy_target);
	param_00.enemy_target common_scripts\utility::waittill_either("death","disconnect");
	param_00.picknewtarget = 1;
	param_00.lineofsight = 0;
}

//Function Number: 29
lib_A7D1::warbirdfire(param_00)
{
	self endon("warbirdPlayerControlled");
	self endon("warbirdStreakComplete");
	thread lib_A7D1::fireai(param_00);
	for(;;)
	{
		if(param_00.picknewtarget)
		{
			var_01 = level.participants;
			var_02 = [];
			foreach(var_04 in var_01)
			{
				if(var_04.inliveplayerkillstreak != self.inliveplayerkillstreak)
				{
					var_02 = common_scripts\utility::array_add(var_02,var_04);
				}
			}

			if(param_00.aiattack)
			{
				var_02 = sortbydistance(var_02,param_00.var_2E6);
			}
			else
			{
				var_02 = sortbydistance(var_02,self.var_2E6);
			}

			var_06 = undefined;
			foreach(var_04 in var_02)
			{
				if(!isdefined(var_04))
				{
					continue;
				}

				if(!isalive(var_04))
				{
					continue;
				}

				if(var_04 maps\mp\_utility::_hasperk("specialty_blindeye"))
				{
					continue;
				}

				if(isdefined(var_04.spawntime) && gettime() - var_04.spawntime / 1000 < 5)
				{
					continue;
				}

				var_06 = var_04;
				param_00.enemy_target = var_06;
				lib_A7D1::checkwarbirdtargetlos(param_00);
				break;
			}
		}

		param_00 notify("LostLOS");
		wait(0.05);
	}
}

//Function Number: 30
lib_A7D1::fireai(param_00)
{
	self endon("warbirdPlayerControlled");
	self endon("warbirdStreakComplete");
	param_00.remainingrocketshots = param_00.rocketclip;
	for(;;)
	{
		wait 0.05;
		if(!isdefined(param_00.enemy_target) || !isalive(param_00.enemy_target) || !param_00.lineofsight)
		{
			continue;
		}

		if(param_00.hasrockets && param_00.remainingrocketshots)
		{
			lib_A7D1::fireairocket(param_00);
		}

		param_00.warbirdturret shootturret();
	}
}

//Function Number: 31
lib_A7D1::fireairocket(param_00)
{
	var_01 = param_00 gettagorigin("tag_missile_right");
	var_02 = vectornormalize(anglestoforward(param_00.var_41));
	var_03 = param_00 veh_getvelocity();
	var_04 = magicbullet("warbird_missile_mp",var_01 + var_03 / 10,self geteye() + var_03 + var_02 * 1000,self);
	var_04.killcament = param_00;
	playfxontag(level.chopper_fx["rocketlaunch"]["warbird"],param_00,"tag_missile_right");
	var_04 missilesettargetent(param_00.enemy_target);
	var_04 missilesetflightmodedirect();
	param_00.remainingrocketshots--;
	if(param_00.remainingrocketshots <= 0)
	{
		thread lib_A7D1::warbirdairocketreload(param_00);
	}

	lib_A7D1::waittillrocketdeath(param_00,var_04);
}

//Function Number: 32
lib_A7D1::warbirdairocketreload(param_00)
{
	param_00 endon("warbirdStreakComplete");
	wait(6);
	param_00.remainingrocketshots = param_00.rocketclip;
}

//Function Number: 33
lib_A7D1::waittillrocketdeath(param_00,param_01)
{
	param_00.enemy_target endon("death");
	param_00.enemy_target endon("disconnect");
	param_01 waittill("death");
}

//Function Number: 34
lib_A7D1::checkwarbirdtargetlos(param_00)
{
	self endon("warbirdPlayerControlled");
	self endon("warbirdStreakComplete");
	param_00.enemy_target endon("death");
	param_00.enemy_target endon("disconnect");
	for(;;)
	{
		var_01 = param_00 gettagorigin("TAG_FLASH1");
		var_02 = param_00.enemy_target geteye();
		var_03 = vectornormalize(var_02 - var_01);
		var_04 = var_01 + var_03 * 20;
		var_05 = bullettrace(var_04,var_02,0,param_00,0,0,0,0,0);
		if(!lib_A7D1::checktargetisinvision(param_00) && var_05["fraction"] < 1)
		{
			param_00.lineofsight = 0;
			param_00.picknewtarget = 1;
			param_00.enemy_target = undefined;
			param_00 notify("pickNewTarget");
			return;
		}

		param_00.lineofsight = 1;
		wait(0.25);
	}
}

//Function Number: 35
lib_A7D1::checktargetisinvision(param_00)
{
	var_01 = anglestoforward(param_00.var_41);
	var_02 = param_00.enemy_target.var_2E6 - param_00.var_2E6;
	var_03 = vectordot(var_01,var_02);
	return var_03 < 0;
}

//Function Number: 36
lib_A7D1::playercontrolwarbirdsetup(param_00)
{
	self endon("warbirdStreakComplete");
	self.possesswarbird = 1;
	self.controllingwarbird = 1;
	param_00.var_31D = self;
	param_00.var_251D = undefined;
	maps\mp\_utility::playersaveangles();
	wait 0.05;
	self notify("warbirdPlayerControlled");
	param_00.ispossessed = 1;
	param_00.var_534F = undefined;
	param_00.warbirdturret.killcament = undefined;
	if(self.warbirdinit != 1)
	{
		maps\mp\_utility::_giveweapon("killstreak_predator_missile_mp");
		self switchtoweapon("killstreak_predator_missile_mp");
		while(self getcurrentweapon() != "killstreak_predator_missile_mp")
		{
			wait 0.05;
		}

		thread lib_A7D1::playerdoridekillstreak(param_00,0);
		self waittill("initRideKillstreak_complete",var_01);
		if(!var_01)
		{
			return;
		}

		maps\mp\_utility::setusingremote("Warbird");
	}

	thread lib_A7D1::setupwarbirdhud(param_00);
	thread lib_A7D1::monitorwarbirdsafearea(param_00);
	thread lib_A7D1::waitsetthermal(0.5);
	thread lib_A7D1::setwarbirdvisionsetpermap(0.5);
	self method_80FE(0.3,0.3);
	lib_A7D1::pausewarbirdenginefxforplayer(param_00);
	param_00.playerattachpoint = spawn("script_model",(0,0,0));
	param_00.playerattachpoint setmodel("tag_player");
	param_00.playerattachpoint hide();
	var_02 = param_00 gettagorigin("tag_origin");
	var_03 = param_00 gettagangles("tag_origin");
	var_04 = anglestoforward(var_03);
	var_02 = var_02 + var_04 * 165;
	var_02 = var_02 + (0,0,-10);
	param_00.playerattachpoint.var_2E6 = var_02;
	param_00.playerattachpoint.var_41 = var_03;
	param_00.playerattachpoint linkto(param_00,"tag_player_mp");
	self unlink();
	param_00 method_8444(param_00);
	thread lib_A7D1::warbirdrocketdamageindicator(param_00);
	self remotecontrolvehicle(param_00);
	thread lib_A7D1::weaponsetup(param_00);
	thread lib_A7D1::playercloakready(param_00);
	param_00.warbirdturret setmode("sentry_manual");
	self remotecontrolturret(param_00.warbirdturret,45);
	while(self.possesswarbird)
	{
		lib_A7D1::exitwarbirdcontrolstate(param_00);
	}

	maps\mp\_utility::playerrestoreangles();
	if(!param_00.aiattack && !param_00.aifollow)
	{
		param_00 thread maps\mp\killstreaks\_aerial_utility::heli_leave();
	}
}

//Function Number: 37
lib_A7D1::setwarbirdvisionsetpermap(param_00)
{
	self endon("disconnect");
	self endon("warbirdStreakComplete");
	wait(param_00);
	if(isdefined(level.warbirdvisionset))
	{
		self method_847A(level.warbirdvisionset,0);
	}
}

//Function Number: 38
lib_A7D1::removewarbirdvisionsetpermap(param_00)
{
	self method_847A("",param_00);
}

//Function Number: 39
lib_A7D1::playerdoridekillstreak(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	var_02 = "warbird";
	if(param_01)
	{
		var_02 = "coop";
	}

	var_03 = maps\mp\killstreaks\_killstreaks::initridekillstreak(var_02);
	if(var_03 != "success" || param_01 && !level.warbirdinuse || !isdefined(param_00) || isdefined(param_00.isleaving) && param_00.isleaving)
	{
		if(param_01)
		{
			lib_A7D1::removewarbirdbuddy(param_00,var_03 == "disconnect");
		}
		else if(var_03 != "disconnect")
		{
			lib_A7D1::playerreset(param_00);
		}

		self notify("initRideKillstreak_complete",0);
		return;
	}

	self notify("initRideKillstreak_complete",1);
}

//Function Number: 40
lib_A7D1::exitwarbirdcontrolstate(param_00)
{
	self endon("warbirdStreakComplete");
	self waittill("ToggleControlState");
	thread lib_A7D1::cancelexitbuttonpressmonitor();
	self.possesswarbird = 0;
	wait(0.5);
	self notify("ExitHoldTimeComplete");
}

//Function Number: 41
lib_A7D1::cancelexitbuttonpressmonitor()
{
	self endon("warbirdStreakComplete");
	self endon("ExitHoldTimeComplete");
	self waittill("ToggleControlCancel");
	self.possesswarbird = 1;
}

//Function Number: 42
lib_A7D1::waitsetthermal(param_00)
{
	self endon("warbirdStreakComplete");
	self endon("ResumeWarbirdAI");
	wait(param_00);
	self method_80B8();
	self setblurforplayer(1.1,0);
	var_01 = 135;
	var_02 = 0;
	var_03 = 60;
	var_04 = 0;
	var_05 = 12;
	var_06 = 5;
	maps\mp\killstreaks\_aerial_utility::thermalvision("warbirdThermalOff",var_01,var_02,var_03,var_04,var_05,var_06);
}

//Function Number: 43
waitsetthermalbuddy(param_00)
{
	self endon("warbirdStreakComplete");
	self endon("ResumeWarbirdAI");
	wait(param_00);
	self method_80B8();
	self setblurforplayer(1.1,0);
	var_01 = 100;
	var_02 = 60;
	var_03 = 512;
	var_04 = 0;
	var_05 = 12;
	var_06 = 5;
	maps\mp\killstreaks\_aerial_utility::thermalvision("warbirdThermalOff",var_01,var_02,var_03,var_04,var_05,var_06);
}

//Function Number: 44
lib_A7D1::playercloakready(param_00,param_01)
{
	self endon("warbirdStreakComplete");
	self endon("ResumeWarbirdAI");
	if(isdefined(self.warbirdinit) && self.warbirdinit == 1)
	{
		param_00 waittill("cloaked");
		common_scripts\utility::waittill_any_return_no_endon_death("ForceUncloak","Cloak","ResumeWarbirdAI");
		lib_A7D1::switchtovisible(param_00);
		param_00.playerattachpoint lib_A7D1::play_sound_on_entity("warbird_cloak_deactivate");
	}

	for(;;)
	{
		thread lib_A7D1::playercloakactivated(param_00);
		thread lib_A7D1::playercloakcooldown(param_00);
		if(param_00.cloakcooldown != 0)
		{
			self setclientomnvar("ui_warbird_cloaktext",3);
			wait(param_00.cloakcooldown);
		}

		thread lib_A7D1::cloakreadydialog();
		if(param_00.cancloak)
		{
			self setclientomnvar("ui_warbird_cloaktext",1);
		}

		self waittill("Cloak");
		self notify("ActivateCloak");
		param_00 lib_A7D1::play_sound_on_entity("warbird_cloak_activate");
		self waittill("CloakCharged");
	}
}

//Function Number: 45
lib_A7D1::playercloakactivated(param_00)
{
	self endon("warbirdStreakComplete");
	self endon("ResumeWarbirdAI");
	self waittill("ActivateCloak");
	var_01 = 10000;
	self setclientomnvar("ui_warbird_cloaktime",var_01 + gettime());
	lib_A7D1::switchtocloaked(param_00);
	thread lib_A7D1::cloakactivateddialog(param_00);
	self setclientomnvar("ui_warbird_cloaktext",2);
	param_00.cloakcooldown = 5;
	thread lib_A7D1::cloakcooldown(param_00);
	thread lib_A7D1::playercloakwaitforexit(param_00);
}

//Function Number: 46
lib_A7D1::playercloakcooldown(param_00)
{
	self endon("warbirdStreakComplete");
	self waittill("UnCloak");
	thread lib_A7D1::playcloakoverheatdialog(param_00);
	lib_A7D1::switchtovisible(param_00);
	self setclientomnvar("ui_warbird_cloaktext",3);
	thread lib_A7D1::cloakdeactivateddialog(param_00);
}

//Function Number: 47
lib_A7D1::cloakcooldown(param_00)
{
	self endon("warbirdStreakComplete");
	self waittill("UnCloak");
	while(param_00.cloakcooldown > 0)
	{
		param_00.cloakcooldown = param_00.cloakcooldown - 0.5;
		wait(0.5);
	}

	param_00.cloakcooldown = 0;
	self notify("CloakCharged");
}

//Function Number: 48
lib_A7D1::playercloakwaitforexit(param_00)
{
	self endon("warbirdStreakComplete");
	var_01 = gettime();
	common_scripts\utility::waittill_any_timeout_no_endon_death(10,"ForceUncloak","Cloak","ResumeWarbirdAI");
	var_02 = gettime();
	var_03 = max(var_02 - var_01,5000);
	param_00.cloakcooldown = var_03 / 1000;
	var_04 = gettime() + var_03;
	self setclientomnvar("ui_warbird_cloakdur",var_04);
	self notify("UnCloak");
}

//Function Number: 49
lib_A7D1::switchtocloaked(param_00)
{
	if(isdefined(param_00))
	{
		thread lib_A7D1::cloakingtransition(param_00,1);
		missiledeleteattractor(param_00.attractor);
		self setclientomnvar("ui_warbird_cloak",1);
		thread lib_A7D1::monitordamagewhilecloaking(param_00);
	}
}

//Function Number: 50
lib_A7D1::switchtovisible(param_00)
{
	if(isdefined(param_00))
	{
		thread lib_A7D1::cloakingtransition(param_00,0);
		param_00.attractor = missilecreateattractorent(param_00,level.heli_attract_strength,level.heli_attract_range);
		self setclientomnvar("ui_warbird_cloak",0);
	}
}

//Function Number: 51
lib_A7D1::cloakingtransition(param_00,param_01,param_02)
{
	param_00 notify("cloaking_transition");
	param_00 endon("cloaking_transition");
	param_00 endon("warbirdStreakComplete");
	if(param_01)
	{
		if(param_00.cloakstate == -2)
		{
			return;
		}

		param_00.cloakstate = -1;
		param_00 method_844B();
		param_00.warbirdturret method_844B();
		if(param_00.coopoffensive)
		{
			param_00.warbirdbuddyturret method_844B();
		}

		param_00 method_848F(0);
		if(!isdefined(param_02) || !param_02)
		{
			wait(0.2);
		}
		else
		{
			wait(1.5);
		}

		param_00 show();
		param_00.warbirdturret show();
		if(param_00.coopoffensive)
		{
			param_00.warbirdbuddyturret show();
		}

		param_00.cloakstate = -2;
		param_00 notify("cloaked");
		param_00 lib_A7D1::stopwarbirdenginefx();
		return;
	}

	if(param_00.cloakstate == 2)
	{
		return;
	}

	param_00.cloakstate = 1;
	param_00 method_844C();
	param_00 method_848F(1);
	param_00.warbirdturret method_844C();
	if(param_00.coopoffensive)
	{
		param_00.warbirdbuddyturret method_844C();
	}

	wait(2.2);
	param_00.cloakstate = 2;
	param_00 lib_A7D1::playwarbirdenginefx();
}

//Function Number: 52
lib_A7D1::cloakdeactivateddialog(param_00)
{
	self endon("CloakCharged");
	self endon("warbirdStreakComplete");
	self endon("ResumeWarbirdAI");
	for(;;)
	{
		self waittill("Cloak");
		param_00.playerattachpoint lib_A7D1::play_sound_on_entity("warbird_cloak_notready");
		wait(1);
	}
}

//Function Number: 53
lib_A7D1::cloakreadydialog()
{
}

//Function Number: 54
lib_A7D1::cloakactivateddialog(param_00)
{
}

//Function Number: 55
lib_A7D1::playcloakoverheatdialog(param_00)
{
	param_00.playerattachpoint lib_A7D1::play_sound_on_entity("warbird_cloak_deactivate");
}

//Function Number: 56
lib_A7D1::cloakwarbirdexit(param_00,param_01)
{
	if(isdefined(param_00) && param_00.iscrashing == 0)
	{
		if(isdefined(param_01))
		{
			param_01 notify("ActivateCloak");
		}

		thread lib_A7D1::cloakingtransition(param_00,1);
		missiledeleteattractor(param_00.attractor);
	}
}

//Function Number: 57
lib_A7D1::monitordamagewhilecloaking(param_00)
{
	self endon("UnCloak");
	self endon("warbirdStreakComplete");
	self endon("ResumeWarbirdAI");
	wait(1);
	param_00 waittill("damage",var_01,var_02,var_03,var_04,var_05);
	self notify("ForceUncloak");
}

//Function Number: 58
lib_A7D1::warbirdrocketdamageindicator(param_00)
{
	self endon("ResumeWarbirdAI");
	self endon("warbirdStreakComplete");
	for(;;)
	{
		param_00 waittill("damage",var_01,var_02,var_03,var_04,var_05);
		if(var_05 == "MOD_PROJECTILE")
		{
			earthquake(0.75,1,param_00.var_2E6,1000);
			self shellshock("frag_grenade_mp",0.5);
		}
	}
}

//Function Number: 59
lib_A7D1::updateshootinglocation(param_00)
{
	self endon("warbirdStreakComplete");
	level endon("ResumeWarbirdAI");
	for(;;)
	{
		var_01 = self getplayerangles();
		var_02 = param_00.playerattachpoint.var_2E6;
		var_03 = anglestoforward(var_01);
		var_04 = var_02 + var_03 * 4000;
		param_00.targetent.var_2E6 = var_04;
		wait(0.05);
	}
}

//Function Number: 60
lib_A7D1::monitorweaponselection(param_00)
{
	self endon("warbirdStreakComplete");
	self endon("ResumeWarbirdAI");
	self.current_warbird_weapon = "turret";
	param_00.warbirdturret turretfireenable();
	if(!param_00.hasrockets)
	{
		return;
	}

	for(;;)
	{
		self waittill("SwitchWeapon");
		if(self.current_warbird_weapon == "turret")
		{
			self.current_warbird_weapon = "missiles";
			param_00.warbirdturret turretfiredisable();
			self setclientomnvar("ui_warbird_weapon",2);
		}
		else if(self.current_warbird_weapon == "missiles")
		{
			self.current_warbird_weapon = "turret";
			param_00.warbirdturret turretfireenable();
			self setclientomnvar("ui_warbird_weapon",1);
		}

		self method_82F4("warbird_weapon_cycle_plr");
	}
}

//Function Number: 61
lib_A7D1::weaponsetup(param_00)
{
	if(param_00.hasrockets)
	{
		thread lib_A7D1::firewarbirdrockets(param_00);
	}

	thread lib_A7D1::monitorweaponselection(param_00);
	thread lib_A7D1::updateshootinglocation(param_00);
	thread lib_A7D1::force_uncloak_on_fire(param_00);
}

//Function Number: 62
lib_A7D1::waittillturretfired(param_00)
{
	param_00 endon("warbirdStreakComplete");
	param_00.warbirdturret endon("turret_fire");
	if(param_00.coopoffensive)
	{
		param_00.warbirdbuddyturret endon("turret_fire");
	}

	level waittill("forever");
}

//Function Number: 63
lib_A7D1::force_uncloak_on_fire(param_00)
{
	level endon("game_ended");
	self endon("warbirdStreakComplete");
	for(;;)
	{
		lib_A7D1::waittillturretfired(param_00);
		self notify("ForceUncloak");
		wait(0.05);
	}
}

//Function Number: 64
lib_A7D1::firewarbirdthreatgrenades(param_00)
{
	param_00 endon("warbirdStreakComplete");
	self endon("warbirdStreakComplete");
	self endon("warbird_player_removed");
	for(;;)
	{
		self waittill("StartFire");
		maps\mp\killstreaks\_aerial_utility::playerfakeshootpaintmissile(param_00.warbirdbuddyturret.firesoundent);
		playfxontag(level.chopper_fx["rocketlaunch"]["warbird"],param_00,"tag_origin");
		wait(2);
	}
}

//Function Number: 65
lib_A7D1::firewarbirdrockets(param_00)
{
	self endon("ResumeWarbirdAI");
	self endon("warbirdStreakComplete");
	param_00.remainingrocketshots = param_00.rocketclip;
	for(;;)
	{
		if(self.assistedsuicide == "bot0" || self.assistedsuicide == "bot1" || self.assistedsuicide == "bot2" || self.assistedsuicide == "bot3")
		{
			wait(3);
		}
		else
		{
			self waittill("StartFire");
		}

		if(self.current_warbird_weapon == "missiles" || self.assistedsuicide == "bot0" || self.assistedsuicide == "bot1" || self.assistedsuicide == "bot2" || self.assistedsuicide == "bot3")
		{
			earthquake(0.4,1,param_00.var_2E6,1000);
			self playrumbleonentity("ac130_105mm_fire");
			var_01 = param_00 gettagorigin("tag_missile_right");
			var_02 = vectornormalize(anglestoforward(self getplayerangles()));
			var_03 = param_00 getentityvelocity();
			var_04 = magicbullet("warbird_missile_mp",var_01 + var_03 / 10,self geteye() + var_03 + var_02 * 1000,self);
			playfxontag(level.chopper_fx["rocketlaunch"]["warbird"],param_00,"tag_missile_right");
			var_04 missilesettargetent(param_00.targetent);
			var_04 missilesetflightmodedirect();
			param_00.remainingrocketshots--;
			self notify("ForceUncloak");
			lib_A7D1::warbirdrockethudupdate(param_00);
			if(param_00.remainingrocketshots == 0)
			{
				thread lib_A7D1::warbirdrocketreloadsound(param_00,6);
				wait(6);
				param_00.remainingrocketshots = param_00.rocketclip;
				self notify("rocketReloadComplete");
				lib_A7D1::warbirdrockethudupdate(param_00);
			}
			else
			{
				wait(0.05);
			}
		}
	}
}

//Function Number: 66
lib_A7D1::warbirdrocketreloadsound(param_00,param_01)
{
	self endon("rocketReloadComplete");
	self endon("ResumeWarbirdAI");
	self endon("warbirdStreakComplete");
	var_02 = 3;
	self method_82F4("warbird_missile_reload_bed");
	wait(0.5);
	for(;;)
	{
		self method_82F4("warbird_missile_reload");
		wait(param_01 / var_02);
	}
}

//Function Number: 67
lib_A7D1::handlecoopjoining(param_00,param_01)
{
	var_02 = "warbird_coop_defensive";
	var_03 = &"MP_JOIN_WARBIRD_DEF";
	var_04 = "pilot_sup_mp_warbird";
	var_05 = "copilot_sup_mp_paladin";
	if(param_00.coopoffensive)
	{
		var_02 = "warbird_coop_offensive";
		var_03 = &"MP_JOIN_WARBIRD_OFF";
		var_04 = "pilot_aslt_mp_warbird";
		var_05 = "copilot_aslt_mp_paladin";
	}

	for(;;)
	{
		var_06 = maps\mp\killstreaks\_coop_util::promptforstreaksupport(param_01.inliveplayerkillstreak,var_03,var_02,"assist_mp_warbird",var_04,param_01,var_05);
		level thread lib_A7D1::watchforjoin(var_06,param_00,param_01);
		var_07 = lib_A7D1::waittillpromptcomplete(param_00,"buddyJoinedStreak");
		maps\mp\killstreaks\_coop_util::stoppromptforstreaksupport(var_06);
		if(!isdefined(var_07))
		{
			return;
		}

		var_07 = lib_A7D1::waittillpromptcomplete(param_00,"buddyLeftWarbird");
		if(!isdefined(var_07))
		{
			return;
		}
	}
}

//Function Number: 68
lib_A7D1::waittillpromptcomplete(param_00,param_01)
{
	param_00 endon("warbirdStreakComplete");
	param_00 waittill(param_01);
	return 1;
}

//Function Number: 69
lib_A7D1::watchforjoin(param_00,param_01,param_02)
{
	param_01 endon("warbirdStreakComplete");
	var_03 = maps\mp\killstreaks\_coop_util::waittillbuddyjoinedstreak(param_00);
	param_01 notify("buddyJoinedStreak");
	var_03 thread lib_A7D1::buddyjoinwarbirdsetup(param_01,param_02);
}

//Function Number: 70
lib_A7D1::buddyjoinwarbirdsetup(param_00,param_01)
{
	param_00 endon("warbirdStreakComplete");
	self endon("warbirdStreakComplete");
	self endon("warbird_player_removed");
	thread lib_A7D1::warbirdoverheatbarcolormonitor(param_00,param_00.warbirdbuddyturret);
	param_00.buddy = self;
	self.controllingwarbird = 1;
	thread lib_A7D1::playerdoridekillstreak(param_00,1);
	self waittill("initRideKillstreak_complete",var_02);
	if(!var_02)
	{
		return;
	}

	maps\mp\_utility::setusingremote("Warbird");
	maps\mp\_utility::playersaveangles();
	thread lib_A7D1::setupwarbirdhud(param_00,1,param_01);
	thread lib_A7D1::monitorbuddywarbirddeathortimeout(param_00);
	thread lib_A7D1::monitorbuddydisconnect(param_00);
	thread waitsetthermalbuddy(0.5);
	thread lib_A7D1::setwarbirdvisionsetpermap(0.5);
	lib_A7D1::pausewarbirdenginefxforplayer(param_00);
	thread lib_A7D1::warbirdrocketdamageindicator(param_00);
	lib_A7D1::takeover_warbird_turret_buddy(param_00);
	lib_A7D1::setupplayercommands();
	if(!param_00.coopoffensive)
	{
		thread lib_A7D1::firewarbirdthreatgrenades(param_00);
	}

	if(!isbot(self))
	{
		thread lib_A7D1::removewarbirdbuddyoncommand(param_00);
	}
}

//Function Number: 71
lib_A7D1::removewarbirdbuddy(param_00,param_01)
{
	self notify("warbird_player_removed");
	if(!param_01)
	{
		lib_A7D1::playerresetwarbirdomnvars();
		self setblurforplayer(0,0);
		self notify("warbirdThermalOff");
		maps\mp\killstreaks\_aerial_utility::disableorbitalthermal(self);
		thread lib_A7D1::removewarbirdvisionsetpermap(1.5);
		self method_80B9();
		if(isdefined(param_00.warbirdbuddyturret) && lib_A7D1::iscontrollingwarbird())
		{
			self remotecontrolturretoff(param_00.warbirdbuddyturret);
		}

		self.controllingwarbird = undefined;
		self enableweapons();
		self unlink();
		maps\mp\killstreaks\_coop_util::playerresetaftercoopstreak();
		self method_80FF();
		lib_A7D1::disableplayercommands(param_00);
		lib_A7D1::restartwarbirdenginefxforplayer(param_00);
		if(maps\mp\_utility::isusingremote())
		{
			maps\mp\_utility::clearusingremote();
		}

		maps\mp\_utility::playerremotekillstreakshowhud();
		maps\mp\_utility::playerrestoreangles();
	}

	param_00 notify("buddyLeftWarbird");
	param_00.buddy = undefined;
}

//Function Number: 72
lib_A7D1::monitorbuddywarbirddeathortimeout(param_00)
{
	self endon("disconnect");
	param_00 common_scripts\utility::waittill_any("leaving","death","crashing");
	self notify("warbirdStreakComplete");
	self notify("StopWaitForDisconnect");
	waittillframeend;
	maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	thread lib_A7D1::removewarbirdbuddy(param_00,0);
}

//Function Number: 73
lib_A7D1::monitorbuddydisconnect(param_00)
{
	self endon("StopWaitForDisconnect");
	self waittill("disconnect");
	thread lib_A7D1::removewarbirdbuddy(param_00,1);
}

//Function Number: 74
lib_A7D1::removewarbirdbuddyoncommand(param_00)
{
	self endon("warbird_player_removed");
	for(;;)
	{
		self waittill("ToggleControlState");
		thread lib_A7D1::startwarbirdbuddyexitcommand(param_00);
		thread lib_A7D1::cancelwarbirdbuddyexitcommand();
	}
}

//Function Number: 75
lib_A7D1::startwarbirdbuddyexitcommand(param_00)
{
	self endon("warbird_player_removed");
	self endon("ToggleControlCancel");
	self.warbird_buddy_exit = 1;
	wait(0.5);
	if(self.warbird_buddy_exit == 1)
	{
		thread lib_A7D1::removewarbirdbuddy(param_00,0);
	}
}

//Function Number: 76
lib_A7D1::cancelwarbirdbuddyexitcommand()
{
	self endon("warbird_player_removed");
	self waittill("ToggleControlCancel");
	self.warbird_buddy_exit = 0;
}

//Function Number: 77
lib_A7D1::monitoraiwarbirdswitch(param_00,param_01)
{
	self endon("warbirdStreakComplete");
	self.warbirdinit = 0;
	self notify("ResumeWarbirdAI");
	self notify("warbirdThermalOff");
	param_00.ispossessed = 0;
	thread lib_A7D1::cloakingtransition(param_00,0);
	param_00.warbirdturret setmode("auto_nonai");
	lib_A7D1::playerresetwarbirdomnvars();
	waittillframeend;
	thread lib_A7D1::warbirdaiattack(param_00);
	param_00.var_534F = gettime();
	param_00.warbirdturret.killcament = param_00;
	param_00.var_31D = undefined;
	if(maps\mp\_utility::isusingremote())
	{
		lib_A7D1::playerreset(param_00);
	}

	wait 0.05;
}

//Function Number: 78
lib_A7D1::monitoraiwarbirddeathortimeout(param_00)
{
	self endon("disconnect");
	thread lib_A7D1::checkforcrashing(param_00);
	var_01 = param_00 common_scripts\utility::waittill_any_return("leaving","death","crashing");
	lib_A7D1::playerresetafterwarbird(param_00);
	level thread lib_A7D1::warbirdcleanup(param_00,self,var_01 != "death");
}

//Function Number: 79
lib_A7D1::warbirdcleanup(param_00,param_01,param_02)
{
	level.spawnedwarbirds = common_scripts\utility::array_remove(level.spawnedwarbirds,param_00);
	level.warbirdinuse = 0;
	if(isdefined(param_00.usableent))
	{
		param_00.usableent maps\mp\_utility::makegloballyunusablebytype();
	}

	thread lib_A7D1::cloakwarbirdexit(param_00,param_01);
	if(isdefined(param_00.attractor))
	{
		missiledeleteattractor(param_00.attractor);
	}

	if(isdefined(param_00.playerattachpoint))
	{
		param_00.playerattachpoint delete();
	}

	param_00.enemy_target = undefined;
	if(param_02)
	{
		param_00 waittill("death");
	}
	else
	{
		waittillframeend;
	}

	var_03 = maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	if(var_03 != 0)
	{
		wait 0.05;
	}

	param_00.warbirdturret delete();
	if(isdefined(param_00.warbirdbuddyturret))
	{
		if(isdefined(param_00.warbirdbuddyturret.firesoundent))
		{
			param_00.warbirdbuddyturret.firesoundent delete();
		}

		param_00.warbirdbuddyturret delete();
	}

	if(isdefined(param_00.usableent))
	{
		param_00.usableent delete();
	}
}

//Function Number: 80
lib_A7D1::playerresetafterwarbird(param_00)
{
	self notify("warbirdStreakComplete");
	param_00 notify("warbirdStreakComplete");
	waittillframeend;
	lib_A7D1::playerresetwarbirdomnvars();
	if(param_00.ispossessed && !maps\mp\_utility::isinremotetransition())
	{
		lib_A7D1::playerreset(param_00);
		param_00.ispossessed = 0;
	}

	lib_A7D1::disableplayercommands(param_00);
	self notify("StopWaitForDisconnect");
}

//Function Number: 81
lib_A7D1::playerreset(param_00)
{
	self setblurforplayer(0,0);
	maps\mp\killstreaks\_aerial_utility::disableorbitalthermal(self);
	self method_80B9();
	thread lib_A7D1::removewarbirdvisionsetpermap(1.5);
	self remotecontrolvehicleoff();
	if(isdefined(param_00.warbirdturret) && lib_A7D1::iscontrollingwarbird())
	{
		self remotecontrolturretoff(param_00.warbirdturret);
	}

	self.controllingwarbird = undefined;
	self.possesswarbird = undefined;
	self enableweapons();
	self unlink();
	if(maps\mp\_utility::isusingremote())
	{
		maps\mp\_utility::clearusingremote();
	}
	else
	{
		var_01 = self getcurrentweapon();
		if(var_01 == "none" || maps\mp\_utility::iskillstreakweapon(var_01))
		{
			self switchtoweapon(common_scripts\utility::getlastweapon());
		}

		maps\mp\_utility::playerremotekillstreakshowhud();
	}

	thread lib_A7D1::playerdelaycontrol();
	if(param_00.hasai)
	{
		maps\mp\killstreaks\_killstreaks::takekillstreakweaponifnodupe("killstreak_predator_missile_mp");
	}

	self enableweaponswitch();
	self method_80FF();
	if(!isdefined(param_00.isleaving) || !param_00.isleaving)
	{
		lib_A7D1::restartwarbirdenginefxforplayer(param_00);
	}

	maps\mp\_utility::playerrestoreangles();
}

//Function Number: 82
lib_A7D1::playerdelaycontrol()
{
	self endon("disconnect");
	maps\mp\_utility::freezecontrolswrapper(1);
	wait(0.5);
	maps\mp\_utility::freezecontrolswrapper(0);
}

//Function Number: 83
lib_A7D1::checkforcrashing(param_00)
{
	param_00 common_scripts\utility::waittill_any("crashing","death");
	param_00.iscrashing = 1;
}

//Function Number: 84
lib_A7D1::monitorplayerdisconnect(param_00)
{
	self endon("StopWaitForDisconnect");
	self waittill("disconnect");
	param_00 notify("warbirdStreakComplete");
	self notify("warbirdStreakComplete");
	self notify("warbirdThermalOff");
	param_00 thread maps\mp\killstreaks\_aerial_utility::heli_leave();
	level thread lib_A7D1::warbirdcleanup(param_00,self,1);
}

//Function Number: 85
lib_A7D1::play_sound_on_entity(param_00)
{
	self playsoundasmaster(param_00);
}

//Function Number: 86
lib_A7D1::warbird_health()
{
	self endon("death");
	self endon("leaving");
	self endon("crashing");
	self.currentstate = "ok";
	self.laststate = "ok";
	self heli_setdamagestage(3);
	var_00 = 3;
	self heli_setdamagestage(var_00);
	for(;;)
	{
		if(self.damagetaken >= self.var_275 * 0.33 && var_00 == 3)
		{
			var_00 = 2;
			self heli_setdamagestage(var_00);
			self.currentstate = "light smoke";
			playfxontag(level.chopper_fx["damage"]["light_smoke"],self,"tag_static_main_rotor_l");
		}
		else if(self.damagetaken >= self.var_275 * 0.66 && var_00 == 2)
		{
			var_00 = 1;
			self heli_setdamagestage(var_00);
			self.currentstate = "heavy smoke";
			stopfxontag(level.chopper_fx["damage"]["light_smoke"],self,"tag_static_main_rotor_l");
			playfxontag(level.chopper_fx["damage"]["heavy_smoke"],self,"tag_static_main_rotor_l");
		}
		else if(self.damagetaken >= self.var_275)
		{
			var_00 = 0;
			self heli_setdamagestage(var_00);
			if(isdefined(self.largeprojectiledamage) && self.largeprojectiledamage)
			{
				thread maps\mp\killstreaks\_aerial_utility::heli_explode(1);
			}
			else
			{
				playfxontag(level.chopper_fx["damage"]["on_fire"],self,"TAG_TAIL_FX");
				thread maps\mp\killstreaks\_aerial_utility::heli_crash();
			}
		}

		wait(0.05);
	}
}

//Function Number: 87
lib_A7D1::playerresetwarbirdomnvars()
{
	self setclientomnvar("ui_warbird_heat",0);
	self setclientomnvar("ui_warbird_flares",0);
	self setclientomnvar("ui_warbird_fire",0);
	self setclientomnvar("ui_warbird_cloak",0);
	self setclientomnvar("ui_warbird_cloaktime",0);
	self setclientomnvar("ui_warbird_cloakdur",0);
	self setclientomnvar("ui_warbird_countdown",0);
	self setclientomnvar("ui_warbird_missile",-1);
	self setclientomnvar("ui_warbird_weapon",0);
	self setclientomnvar("ui_warbird_cloaktext",0);
	self setclientomnvar("ui_warbird_toggle",0);
	self setclientomnvar("ui_coop_primary_num",0);
	maps\mp\killstreaks\_aerial_utility::playerdisablestreakstatic();
	self method_8533();
}

//Function Number: 88
lib_A7D1::playwarbirdenginefx()
{
	playfxontag(level.chopper_fx["engine"]["warbird"],self,"tag_static_main_rotor_r");
	playfxontag(level.chopper_fx["engine"]["warbird"],self,"tag_static_main_rotor_l");
	if(isdefined(self.var_31D))
	{
		self.var_31D lib_A7D1::pausewarbirdenginefxforplayer(self);
	}

	if(isdefined(self.buddy))
	{
		self.buddy lib_A7D1::pausewarbirdenginefxforplayer(self);
	}
}

//Function Number: 89
lib_A7D1::stopwarbirdenginefx()
{
	stopfxontag(level.chopper_fx["engine"]["warbird"],self,"tag_static_main_rotor_r");
	stopfxontag(level.chopper_fx["engine"]["warbird"],self,"tag_static_main_rotor_l");
}

//Function Number: 90
lib_A7D1::pausewarbirdenginefxforplayer(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	function_02AC(level.chopper_fx["engine"]["warbird"],param_00,"tag_static_main_rotor_r",self);
	function_02AC(level.chopper_fx["engine"]["warbird"],param_00,"tag_static_main_rotor_l",self);
}

//Function Number: 91
lib_A7D1::restartwarbirdenginefxforplayer(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	if(maps\mp\killstreaks\_aerial_utility::vehicleiscloaked())
	{
		return;
	}

	playfxontagforclients(level.chopper_fx["engine"]["warbird"],param_00,"tag_static_main_rotor_r",self);
	playfxontagforclients(level.chopper_fx["engine"]["warbird"],param_00,"tag_static_main_rotor_l",self);
}

//Function Number: 92
lib_A7D1::warbird_audio()
{
	if(isdefined(self))
	{
	}
}

//Function Number: 93
lib_A7D1::warbirdlightfx()
{
	self endon("death");
	for(;;)
	{
		self.owner waittill("UnCloak");
		playfxontag(level.chopper_fx["light"]["warbird"],self,"tag_light_body_L");
		wait(0.05);
		playfxontag(level.chopper_fx["light"]["warbird"],self,"tag_light_body_R");
		wait(0.05);
		playfxontag(level.chopper_fx["light"]["warbird"],self,"tag_light_tail");
		self.owner waittill("ActivateCloak");
		stopfxontag(level.chopper_fx["light"]["warbird"],self,"tag_light_body_L");
		wait(0.05);
		stopfxontag(level.chopper_fx["light"]["warbird"],self,"tag_light_body_R");
		wait(0.05);
		stopfxontag(level.chopper_fx["light"]["warbird"],self,"tag_light_tail");
	}
}