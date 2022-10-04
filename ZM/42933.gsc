/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42933.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 77
 * Decompile Time: 22 ms
 * Timestamp: 4/20/2022 8:24:12 PM
*******************************************************************/

//Function Number: 1
lib_A7B5::init()
{
	if(getdvarint("virtuallobbyactive",0))
	{
		return;
	}

	level.helis = [];
	level.littlebirds = [];
	level.heli_leave_nodes = lib_A7B5::getentorstructarray("heli_leave","targetname");
	level.heli_crash_nodes = lib_A7B5::getentorstructarray("heli_crash_start","targetname");
	level.chopper_fx["explode"]["death"] = [];
	level.chopper_fx["explode"]["air_death"] = [];
	level.chopper_fx["damage"]["light_smoke"] = loadfx("vfx/trail/smoke_trail_white_heli_emitter");
	level.chopper_fx["damage"]["heavy_smoke"] = loadfx("vfx/trail/smoke_trail_black_heli_emitter");
	level.chopper_fx["damage"]["on_fire"] = loadfx("vfx/fire/helicopter_damaged_fire_m");
	level.chopper_fx["explode"]["large"] = loadfx("fx/explosions/helicopter_explosion_secondary_small");
	level.chopper_fx["rocketlaunch"]["warbird"] = loadfx("vfx/muzzleflash/rocket_launch_air_to_ground");
	level.heli_sound["allies"]["hit"] = "warbird_death_explo";
	level.heli_sound["axis"]["hit"] = "warbird_death_explo";
	level.heli_sound["allies"]["spinloop"] = "warbird_death_spin_loop";
	level.heli_sound["axis"]["spinloop"] = "warbird_death_spin_loop";
	level.heli_sound["allies"]["crash"] = "warbird_air_death";
	level.heli_sound["axis"]["crash"] = "warbird_air_death";
	level._effect["flare"] = loadfx("vfx/lensflare/flares_warbird");
	level.heli_attract_strength = 1000;
	level.heli_attract_range = 4096;
	level.heli_maxhealth = 2000;
	level.heli_targeting_delay = 0.5;
}

//Function Number: 2
lib_A7B5::makehelitype(param_00,param_01,param_02)
{
	level.chopper_fx["explode"]["death"][param_00] = loadfx(param_01);
	level.lightfxfunc[param_00] = param_02;
}

//Function Number: 3
lib_A7B5::addairexplosion(param_00,param_01)
{
	level.chopper_fx["explode"]["air_death"][param_00] = loadfx(param_01);
}

//Function Number: 4
lib_A7B5::addtohelilist()
{
	level.helis[self getentitynumber()] = self;
}

//Function Number: 5
lib_A7B5::removefromhelilist(param_00)
{
	level.helis[param_00] = undefined;
}

//Function Number: 6
lib_A7B5::addtolittlebirdlist(param_00)
{
	level.littlebirds[self getentitynumber()] = self;
}

//Function Number: 7
lib_A7B5::removefromlittlebirdlistondeath(param_00)
{
	var_01 = self getentitynumber();
	self waittill("death");
	level.littlebirds[var_01] = undefined;
}

//Function Number: 8
lib_A7B5::exceededmaxlittlebirds(param_00)
{
	if(level.littlebirds.size >= 4)
	{
		return 1;
	}

	return 0;
}

//Function Number: 9
lib_A7B5::heli_leave_on_disconnect(param_00)
{
	self endon("death");
	self endon("helicopter_done");
	param_00 waittill("disconnect");
	thread lib_A7B5::heli_leave();
}

//Function Number: 10
lib_A7B5::heli_leave_on_changeteams(param_00)
{
	self endon("death");
	self endon("helicopter_done");
	param_00 common_scripts\utility::waittill_any("joined_team","joined_spectators");
	thread lib_A7B5::heli_leave();
}

//Function Number: 11
lib_A7B5::heli_modifydamage(param_00,param_01,param_02,param_03)
{
	var_04 = maps\mp\gametypes\_damage::modifydamage(param_00,param_01,param_02,param_03);
	if(var_04 > 0)
	{
		lib_A7B5::heli_staticdamage(param_01,param_02,var_04);
	}

	return var_04;
}

//Function Number: 12
lib_A7B5::heli_addrecentdamage(param_00)
{
	self endon("death");
	self.recentdamageamount = self.recentdamageamount + param_00;
	wait(4);
	self.recentdamageamount = self.recentdamageamount - param_00;
}

//Function Number: 13
lib_A7B5::heli_leave_on_timeout(param_00)
{
	self endon("death");
	self endon("helicopter_done");
	maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause(param_00);
	thread lib_A7B5::heli_leave();
}

//Function Number: 14
lib_A7B5::heli_leave_on_gameended(param_00)
{
	self endon("death");
	self endon("helicopter_done");
	level waittill("game_ended");
	thread lib_A7B5::heli_leave();
}

//Function Number: 15
lib_A7B5::heli_leave(param_00)
{
	self notify("leaving");
	self.isleaving = 1;
	self veh_clearlookatent();
	var_01 = undefined;
	if(!isdefined(param_00))
	{
		var_01 = lib_A7B5::heli_pick_fly_node(level.heli_leave_nodes);
		param_00 = var_01.var_2E6;
	}

	var_02 = spawn("script_origin",param_00);
	if(isdefined(var_02))
	{
		self veh_setlookatent(var_02);
		var_02 thread lib_A7B5::wait_and_delete(3);
	}

	lib_A7B5::heli_reset();
	self veh_setspeed(100,45);
	if(isdefined(var_01))
	{
		if(isdefined(var_01.target))
		{
			lib_A7B5::heli_fly_simple_path(var_01);
		}
		else
		{
			lib_A7B5::_setvehgoalpos(var_01.var_2E6,0);
			self waittillmatch("goal");
		}
	}
	else
	{
		lib_A7B5::_setvehgoalpos(param_00,0);
		self waittillmatch("goal");
	}

	self notify("death");
	wait(0.05);
	if(isdefined(self.killcament))
	{
		self.killcament delete();
	}

	maps\mp\_utility::decrementfauxvehiclecount();
	self delete();
}

//Function Number: 16
lib_A7B5::heli_pick_fly_node(param_00)
{
	var_01 = self.var_2E6;
	var_02 = undefined;
	for(var_06 = 0;var_06 < param_00.size;var_06++)
	{
		var_07 = param_00[var_06].var_2E6;
		if(lib_A7B5::flynodeorgtracepassed(var_01,var_07,self))
		{
			var_08 = var_07 - var_01;
			var_09 = distance(var_01,var_07);
			var_0A = rotatevector(var_08,(0,90,0));
			var_0B = var_01 + var_0A * 100;
			var_0C = var_0B + var_08 * var_09;
			if(lib_A7B5::flynodeorgtracepassed(var_0B,var_0C,self))
			{
				var_0D = rotatevector(var_08,(0,-90,0));
				var_0B = var_01 + var_0D * 100;
				var_0C = var_0B + var_08 * var_09;
				if(lib_A7B5::flynodeorgtracepassed(var_0B,var_0C,self))
				{
					return param_00[var_06];
				}
			}
		}
	}

	return param_00[randomint(param_00.size)];
}

//Function Number: 17
lib_A7B5::flynodeorgtracepassed(param_00,param_01,param_02)
{
	var_03 = bullettrace(param_00,param_01,0,param_02,0,0,1,0,0);
	var_04 = var_03["fraction"] >= 1;
}

//Function Number: 18
lib_A7B5::wait_and_delete(param_00)
{
	self endon("death");
	level endon("game_ended");
	wait(param_00);
	self delete();
}

//Function Number: 19
lib_A7B5::deleteaftertime(param_00)
{
	wait(param_00);
	self delete();
}

//Function Number: 20
lib_A7B5::heli_reset()
{
	self veh_cleartargetyaw();
	self veh_cleargoalyaw();
	self veh_setspeed(60,25);
	self veh_setyawspeed(100,45,45);
	self veh_setmaxpitchroll(30,30);
	self veh_neargoalnotifydist(100);
	self veh_setturningability(1);
}

//Function Number: 21
lib_A7B5::_setvehgoalpos(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	self veh_setgoalpos(param_00,param_01);
}

//Function Number: 22
lib_A7B5::heli_flares_monitor(param_00)
{
	switch(self.helitype)
	{
		default:
			break;
	}
}

//Function Number: 23
lib_A7B5::handleincomingstinger(param_00)
{
	level endon("game_ended");
	self endon("death");
	self endon("crashing");
	self endon("leaving");
	self endon("helicopter_done");
	for(;;)
	{
		level waittill("stinger_fired",var_01,var_02);
		if(!maps\mp\_javelin::func_C99(var_02,self))
		{
			continue;
		}

		if(!isdefined(var_02))
		{
			continue;
		}

		if(isdefined(param_00))
		{
			level thread [[ param_00 ]](var_02,var_01,var_01.inliveplayerkillstreak);
			continue;
		}

		level thread lib_A7B5::watchmissileproximity(var_02,var_01,var_01.inliveplayerkillstreak);
	}
}

//Function Number: 24
lib_A7B5::watchmissileproximity(param_00,param_01,param_02)
{
	foreach(var_04 in param_00)
	{
		var_04 thread lib_A7B5::missilewatchproximity(param_01,param_02,var_04.lockedstingertarget);
	}
}

//Function Number: 25
lib_A7B5::missilewatchproximity(param_00,param_01,param_02)
{
	self endon("death");
	param_02 endon("death");
	var_03 = 5;
	var_04 = 4000;
	for(;;)
	{
		if(!isdefined(param_02))
		{
			break;
		}

		var_05 = param_02 getpointinbounds(0,0,0);
		var_06 = distance(self.var_2E6,var_05);
		if(isdefined(param_02.var_31D))
		{
			param_02.var_31D thread lib_A7B5::doproximityalarm(self,param_02);
		}

		if(var_06 < var_04)
		{
			if(param_02.numflares > 0 || isdefined(param_02.flarestarget))
			{
				if(isdefined(param_02.owner) && lib_A7B5::iswarbird(param_02))
				{
					if(param_02.numflares == 2)
					{
						param_02.owner setclientomnvar("ui_warbird_flares",1);
					}
					else if(param_02.numflares == 1)
					{
						param_02.owner setclientomnvar("ui_warbird_flares",2);
					}

					param_02.owner method_82F4("paladin_deploy_flares");
				}

				var_07 = param_02 lib_A7B5::deployflares(var_03);
				playfxontag(common_scripts\utility::getfx("flare"),var_07,"tag_origin");
				if(!isdefined(param_02.flarestarget))
				{
					param_02.numflares--;
					level thread lib_A7B5::handleflarestimer(param_02,var_07,var_03);
				}

				self missilesettargetent(var_07);
				return;
			}
		}

		wait(0.05);
	}
}

//Function Number: 26
lib_A7B5::deployflares(param_00)
{
	var_01 = self gettagorigin("tag_origin") + (0,0,-50);
	var_02 = spawn("script_model",var_01);
	var_02 setmodel("tag_origin");
	var_02.var_41 = self.var_41;
	if(!isdefined(self.flaresdeployedyaw))
	{
		self.flaresdeployedyaw = randomfloatrange(-180,180);
	}
	else
	{
		self.flaresdeployedyaw = self.flaresdeployedyaw + 90;
	}

	var_03 = anglestoforward((self.var_41[0],self.flaresdeployedyaw,self.var_41[2]));
	var_03 = lib_A7B5::vehiclemodifyflarevector(var_03);
	var_02 gravitymove(var_03,param_00);
	var_02 thread lib_A7B5::deleteaftertime(param_00);
	return var_02;
}

//Function Number: 27
lib_A7B5::vehiclemodifyflarevector(param_00)
{
	if(self.vehicletype == "warbird")
	{
		return vectornormalize(param_00 + (0,0,-0.2)) * 300;
	}

	if(self.vehicletype == "paladin")
	{
		return vectornormalize(param_00 + (0,0,-0.5)) * 2000;
	}

	return vectornormalize(param_00 + (0,0,-0.4)) * 1000;
}

//Function Number: 28
lib_A7B5::handleflarestimer(param_00,param_01,param_02)
{
	param_00 endon("death");
	param_00.flarestarget = param_01;
	wait(param_02);
	param_00.flarestarget = undefined;
	if(isdefined(param_00.owner) && lib_A7B5::iswarbird(param_00))
	{
		param_00.owner setclientomnvar("ui_warbird_flares",0);
	}
}

//Function Number: 29
lib_A7B5::hastag(param_00,param_01)
{
	var_02 = getnumparts(param_00);
	for(var_03 = 0;var_03 < var_02;var_03++)
	{
		if(tolower(getpartname(param_00,var_03)) == tolower(param_01))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 30
lib_A7B5::iswarbird(param_00)
{
	return isdefined(param_00.heli_type) && param_00.heli_type == "warbird";
}

//Function Number: 31
lib_A7B5::doproximityalarm(param_00,param_01)
{
	self endon("disconnect");
	if(lib_A7B5::shouldstopproximityalarm(param_00,param_01) || isdefined(param_01.incomingmissilesound))
	{
		return;
	}

	if(lib_A7B5::iswarbird(param_01))
	{
		self setclientomnvar("ui_warbird_flares",3);
	}

	self method_82F4("mp_aerial_enemy_locked");
	param_01.incomingmissilesound = 1;
	for(;;)
	{
		if(lib_A7B5::shouldstopproximityalarm(param_00,param_01))
		{
			self method_82F5("mp_aerial_enemy_locked");
			param_01.incomingmissilesound = undefined;
			return;
		}

		wait 0.05;
	}
}

//Function Number: 32
lib_A7B5::playerfakeshootpaintmissile(param_00)
{
	var_01 = vectornormalize(anglestoforward(self getplayerangles()));
	var_02 = vectornormalize(anglestoright(self getplayerangles()));
	var_03 = self geteye() + var_01 * 100;
	var_04 = var_03 + var_01 * 20000;
	var_05 = bullettrace(var_03,var_04,0);
	if(var_05["fraction"] == 1)
	{
		return;
	}

	earthquake(0.1,1,self geteye(),500,self);
	var_03 = self geteye() + var_02 * -1 * 50;
	var_04 = var_05["position"];
	var_06 = magicbullet("paint_missile_killstreak_mp",var_03,var_04,self);
	var_06.owner = self;
	var_06 thread lib_A7B5::watchpaintgrenade();
	thread lib_A7B5::playerfiresounds(param_00,"paladin_threat_bomb_shot_2d","paladin_threat_bomb_shot_3d");
}

//Function Number: 33
lib_A7B5::playerfakeshootpaintgrenadeattarget(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 5000;
	earthquake(0.2,1,self getvieworigin(),300);
	var_06 = vectornormalize(param_02 - param_01);
	var_07 = var_06 * var_05;
	var_08 = function_0071("paint_grenade_killstreak_mp",param_01,var_07,2,self);
	var_08.owner = self;
	var_08 thread lib_A7B5::watchpaintgrenade(param_03,param_04);
	thread lib_A7B5::playerfiresounds(param_00,"recon_drn_launcher_shot_plr","recon_drn_launcher_shot_npc");
	self playrumbleonentity("damage_heavy");
}

//Function Number: 34
lib_A7B5::playerfakeshootempgrenadeattarget(param_00,param_01,param_02)
{
	var_03 = 5000;
	earthquake(0.2,1,self getvieworigin(),300);
	var_04 = vectornormalize(param_02 - param_01);
	var_05 = var_04 * var_03;
	var_06 = function_0071("emp_grenade_killstreak_mp",param_01,var_05,2,self);
	var_06.owner = self;
	thread lib_A7B5::playerfiresounds(param_00,"recon_drn_launcher_shot_plr","recon_drn_launcher_shot_npc");
	self playrumbleonentity("damage_heavy");
}

//Function Number: 35
lib_A7B5::playerfiresounds(param_00,param_01,param_02)
{
	if(isdefined(param_02))
	{
		param_00 playsoundonmovingent(param_02);
	}

	if(isdefined(param_01))
	{
		self method_82F4(param_01);
	}
}

//Function Number: 36
lib_A7B5::watchpaintgrenade(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	var_02 = self.owner;
	var_02 endon("disconnect");
	var_02 endon("death");
	self waittill("explode",var_03);
	if(var_02 maps\mp\_utility::isemped() && isdefined(level.empequipmentdisabled) && level.empequipmentdisabled)
	{
		return;
	}

	lib_A7B5::detectiongrenadethink(var_03,var_02,param_00,param_01);
}

//Function Number: 37
lib_A7B5::detectiongrenadethink(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	foreach(var_05 in level.var_328)
	{
		if(!isdefined(var_05) || !maps\mp\_utility::isreallyalive(var_05) || !function_0285(param_01,var_05))
		{
			continue;
		}

		thread maps\mp\_threatdetection::detection_grenade_hud_effect(var_05,param_00,1,400);
		thread maps\mp\_threatdetection::detection_highlight_hud_effect(var_05,5);
	}

	var_07 = lib_A7B5::getplayersonteam(param_01.inliveplayerkillstreak);
	foreach(var_05 in level.participants)
	{
		if(!isdefined(var_05) || !maps\mp\_utility::isreallyalive(var_05) || function_0285(param_01,var_05) || var_05 maps\mp\_utility::_hasperk("specialty_coldblooded"))
		{
			continue;
		}

		if(distance(var_05.var_2E6,param_00) < 400)
		{
			var_05 maps\mp\_threatdetection::addthreatevent(var_07,5,"PAINT_GRENADE",1,0);
			param_01 maps\mp\gametypes\_damagefeedback::updatedamagefeedback("paint");
			var_05 thread lib_A7B5::detectiongrenadewatch(param_01,5);
			var_05 notify("paint_marked_target",param_01);
			if(param_02)
			{
				maps\mp\gametypes\_weapons::flashbangplayer(var_05,param_00,param_01);
			}

			if(isdefined(param_03) && param_03.vehname == "recon_uav")
			{
				param_01 maps\mp\gametypes\_missions::processchallenge("ch_streak_recon");
			}
		}
	}
}

//Function Number: 38
lib_A7B5::detectiongrenadewatch(param_00,param_01)
{
	level endon("game_ended");
	self notify("detectionGrenadeWatch");
	self endon("detectionGrenadeWatch");
	if(!isdefined(self.tagmarkedby) || self.tagmarkedby != param_00)
	{
		if(!isdefined(level.var_511A))
		{
			param_00 thread maps\mp\_events::killstreaktagevent();
		}

		param_00 playrumbleonentity("damage_heavy");
	}

	if(!isagent(self))
	{
		self method_849A(1);
	}

	self.tagmarkedby = param_00;
	common_scripts\utility::waittill_any_timeout(param_01,"death","disconnect");
	if(isdefined(self))
	{
		if(!isagent(self))
		{
			self method_849A(0);
		}

		self.tagmarkedby = undefined;
	}
}

//Function Number: 39
lib_A7B5::getplayersonteam(param_00)
{
	var_01 = [];
	foreach(var_03 in level.var_328)
	{
		if(var_03.afk && isalive(var_03) && param_00 == var_03.inliveplayerkillstreak && !isplayer(self) || var_03 != self)
		{
			var_01[var_01.size] = var_03;
		}
	}

	return var_01;
}

//Function Number: 40
lib_A7B5::shouldstopproximityalarm(param_00,param_01)
{
	return !isdefined(param_01) || !isdefined(param_01.var_31D) || !isdefined(param_00) || isdefined(param_01.flarestarget) || !maps\mp\_utility::isreallyalive(self) || isdefined(param_01.crashed) || isdefined(param_01.iscrashing);
}

//Function Number: 41
lib_A7B5::heli_staticdamage(param_00,param_01,param_02)
{
	if(param_02 > 0 && isdefined(self.owner))
	{
		self.owner thread lib_A7B5::playershowstreakstaticfordamage();
	}

	if(param_02 > 0 && isdefined(self.warbirdbuddyturret) && isdefined(self.warbirdbuddyturret.owner))
	{
		self.warbirdbuddyturret.owner thread lib_A7B5::playershowstreakstaticfordamage();
	}
}

//Function Number: 42
lib_A7B5::heli_monitoremp()
{
	level endon("game_ended");
	self endon("death");
	self endon("crashing");
	self endon("leaving");
	for(;;)
	{
		self waittill("emp_damage");
		thread lib_A7B5::heli_empgrenaded();
	}
}

//Function Number: 43
lib_A7B5::heli_empgrenaded()
{
	self notify("heli_EMPGrenaded");
	self endon("heli_EMPGrenaded");
	self endon("death");
	self endon("leaving");
	self endon("crashing");
	self.owner endon("disconnect");
	level endon("game_ended");
	self.empgrenaded = 1;
	if(isdefined(self.mgturretleft))
	{
		self.mgturretleft notify("stop_shooting");
	}

	if(isdefined(self.mgturretright))
	{
		self.mgturretright notify("stop_shooting");
	}

	wait(3.5);
	self.empgrenaded = 0;
	if(isdefined(self.mgturretleft))
	{
		self.mgturretleft notify("turretstatechange");
	}

	if(isdefined(self.mgturretright))
	{
		self.mgturretright notify("turretstatechange");
	}
}

//Function Number: 44
lib_A7B5::heli_existance()
{
	var_00 = self getentitynumber();
	common_scripts\utility::waittill_any("death","crashing","leaving");
	lib_A7B5::removefromhelilist(var_00);
	self notify("helicopter_done");
}

//Function Number: 45
lib_A7B5::heli_crash()
{
	self notify("crashing");
	self playsoundonmovingent("orbital_pkg_self_destruct");
	self veh_clearlookatent();
	self.iscrashing = 1;
	var_00 = lib_A7B5::heli_pick_fly_node(level.heli_crash_nodes);
	if(isdefined(self.mgturretleft))
	{
		self.mgturretleft notify("stop_shooting");
	}

	if(isdefined(self.mgturretright))
	{
		self.mgturretright notify("stop_shooting");
	}

	thread lib_A7B5::heli_spin(180);
	thread lib_A7B5::heli_secondary_explosions();
	self veh_setspeed(100,45);
	if(isdefined(var_00.target))
	{
		lib_A7B5::heli_fly_simple_path(var_00);
	}
	else
	{
		lib_A7B5::_setvehgoalpos(var_00.var_2E6,0);
		self waittillmatch("goal");
	}

	thread lib_A7B5::heli_explode();
}

//Function Number: 46
lib_A7B5::heli_secondary_explosions()
{
	var_00 = self.inliveplayerkillstreak;
	playfxontag(level.chopper_fx["explode"]["large"],self,"tag_engine_left");
	if(isdefined(level.heli_sound[var_00]["hitsecondary"]))
	{
		self playsoundasmaster(level.heli_sound[var_00]["hitsecondary"]);
	}

	wait(3);
	if(!isdefined(self))
	{
		return;
	}

	playfxontag(level.chopper_fx["explode"]["large"],self,"tag_engine_left");
	if(isdefined(level.heli_sound[var_00]["hitsecondary"]))
	{
		self playsoundasmaster(level.heli_sound[var_00]["hitsecondary"]);
	}
}

//Function Number: 47
lib_A7B5::heli_spin(param_00)
{
	self endon("death");
	var_01 = self.inliveplayerkillstreak;
	self playsoundasmaster(level.heli_sound[var_01]["hit"]);
	thread lib_A7B5::spinsoundshortly();
	self veh_setyawspeed(param_00,param_00,param_00);
	while(isdefined(self))
	{
		self veh_settargetyaw(self.var_41[1] + param_00 * 0.9);
		wait(1);
	}
}

//Function Number: 48
lib_A7B5::spinsoundshortly()
{
	self endon("death");
	wait(0.25);
	var_00 = self.inliveplayerkillstreak;
	self stoploopsound();
	wait(0.05);
	self playloopsound(level.heli_sound[var_00]["spinloop"]);
	wait(0.05);
	if(isdefined(level.heli_sound[var_00]["spinstart"]))
	{
		self playloopsound(level.heli_sound[var_00]["spinstart"]);
	}
}

//Function Number: 49
lib_A7B5::heli_explode(param_00)
{
	self notify("death");
	if(isdefined(param_00) && isdefined(level.chopper_fx["explode"]["air_death"][self.heli_type]))
	{
		var_01 = self gettagangles("tag_deathfx");
		playfx(level.chopper_fx["explode"]["air_death"][self.heli_type],self gettagorigin("tag_deathfx"),anglestoforward(var_01),anglestoup(var_01));
	}
	else
	{
		var_02 = self.var_2E6;
		var_03 = self.var_2E6 + (0,0,1) - self.var_2E6;
		playfx(level.chopper_fx["explode"]["death"][self.heli_type],var_02,var_03);
	}

	var_04 = self.inliveplayerkillstreak;
	self playsoundasmaster(level.heli_sound[var_04]["crash"]);
	wait(0.05);
	if(isdefined(self.killcament))
	{
		self.killcament delete();
	}

	maps\mp\_utility::decrementfauxvehiclecount();
	self delete();
}

//Function Number: 50
lib_A7B5::heli_fly_simple_path(param_00)
{
	self endon("death");
	self endon("leaving");
	self notify("flying");
	self endon("flying");
	lib_A7B5::heli_reset();
	for(var_01 = param_00;isdefined(var_01.target);var_01 = var_02)
	{
		var_02 = lib_A7B5::getentorstruct(var_01.target,"targetname");
		if(isdefined(var_01.script_airspeed) && isdefined(var_01.script_accel))
		{
			var_03 = var_01.script_airspeed;
			var_04 = var_01.script_accel;
		}
		else
		{
			var_03 = 30 + randomint(20);
			var_04 = 15 + randomint(15);
		}

		if(isdefined(self.isattacking) && self.isattacking)
		{
			wait(0.05);
			continue;
		}

		if(isdefined(self.isperformingmaneuver) && self.isperformingmaneuver)
		{
			wait(0.05);
			continue;
		}

		self veh_setspeed(var_03,var_04);
		if(!isdefined(var_02.target))
		{
			lib_A7B5::_setvehgoalpos(var_02.var_2E6 + self.zoffset,0);
			self waittill("near_goal");
			continue;
		}

		lib_A7B5::_setvehgoalpos(var_02.var_2E6 + self.zoffset,0);
		self waittill("near_goal");
		self veh_setgoalyaw(var_02.var_41[1]);
		self waittillmatch("goal");
	}
}

//Function Number: 51
lib_A7B5::handle_player_starting_aerial_view()
{
	self notify("player_start_aerial_view");
}

//Function Number: 52
lib_A7B5::handle_player_ending_aerial_view()
{
	self notify("player_stop_aerial_view");
}

//Function Number: 53
lib_A7B5::gethelianchor()
{
	if(isdefined(level.helianchor))
	{
		return level.helianchor;
	}

	var_00 = lib_A7B5::getentorstruct("warbird_anchor","targetname");
	if(!isdefined(var_00))
	{
		var_00 = spawnstruct();
		var_00.var_2E6 = (0,0,2032);
		var_00.targetname = "warbird_anchor";
	}

	if(!isdefined(var_00.var_39B))
	{
		var_00.var_39B = 3500;
	}

	level.helianchor = var_00;
	return level.helianchor;
}

//Function Number: 54
lib_A7B5::playerhandleboundarystatic(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		self endon(param_01);
	}

	if(isdefined(param_02))
	{
		self endon(param_02);
	}

	var_03 = getentarray("remote_heli_range","targetname");
	if(!isdefined(param_00.vehicletype) || var_03.size == 0)
	{
		lib_A7B5::playerhandleboundarystaticradius(param_00,param_01,param_02);
		return;
	}

	for(;;)
	{
		var_04 = 0;
		if(isdefined(level.isoutofboundscustomfunc))
		{
			var_04 = [[ level.isoutofboundscustomfunc ]](param_00,self,var_03);
		}
		else
		{
			var_04 = param_00 lib_A7B5::vehicletouchinganytrigger(var_03);
		}

		if(var_04)
		{
			thread lib_A7B5::playerstartoutofboundsstatic(param_00,param_01,param_02);
			for(;;)
			{
				wait 0.05;
				if(!isdefined(param_00.var_B0E) || !param_00.var_B0E)
				{
					var_04 = 0;
					if(isdefined(level.isoutofboundscustomfunc))
					{
						var_04 = [[ level.isoutofboundscustomfunc ]](param_00,self,var_03);
					}
					else
					{
						var_04 = param_00 lib_A7B5::vehicletouchinganytrigger(var_03);
					}

					if(!var_04)
					{
						param_00 notify("staticDone");
						thread lib_A7B5::playerstatictonormal(param_00,param_01,param_02);
						break;
					}
				}
			}
		}

		wait 0.05;
	}
}

//Function Number: 55
lib_A7B5::vehicletouchinganytrigger(param_00)
{
	foreach(var_02 in param_00)
	{
		if(self istouching(var_02))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 56
lib_A7B5::playerstatictonormal(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		self endon(param_01);
	}

	if(isdefined(param_02))
	{
		self endon(param_02);
	}

	param_00 endon("staticStarting");
	param_00.staticlevel--;
	while(param_00.staticlevel > 0)
	{
		lib_A7B5::playershowstreakstaticforrange(param_00.staticlevel);
		if(isdefined(param_00.buddy))
		{
			param_00.buddy lib_A7B5::playershowstreakstaticforrange(param_00.staticlevel);
		}

		wait(0.5);
		param_00.staticlevel--;
	}

	lib_A7B5::playershowstreakstaticforrange(0);
	if(isdefined(param_00.buddy))
	{
		param_00.buddy lib_A7B5::playershowstreakstaticforrange(0);
	}
}

//Function Number: 57
lib_A7B5::playerstartoutofboundsstatic(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		self endon(param_01);
	}

	if(isdefined(param_02))
	{
		self endon(param_02);
	}

	param_00 notify("staticStarting");
	param_00 endon("staticDone");
	if(!isdefined(param_00.staticlevel) || param_00.staticlevel == 0)
	{
		param_00.staticlevel = 1;
	}

	while(param_00.staticlevel < 4)
	{
		lib_A7B5::playershowstreakstaticforrange(param_00.staticlevel);
		if(isdefined(param_00.buddy))
		{
			param_00.buddy lib_A7B5::playershowstreakstaticforrange(param_00.staticlevel);
		}

		if(isdefined(param_00.playerattachpoint))
		{
			param_00.playerattachpoint playsoundasmaster("mp_warbird_outofbounds_warning");
		}

		if(isdefined(param_00.staticlevelwaittime))
		{
			wait(param_00.staticlevelwaittime);
			continue;
		}

		wait(2);
		param_00.staticlevel++;
	}

	param_00 notify("outOfBounds");
}

//Function Number: 58
lib_A7B5::playerhandleboundarystaticradius(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		self endon(param_01);
	}

	if(isdefined(param_02))
	{
		self endon(param_02);
	}

	var_03 = lib_A7B5::gethelianchor();
	var_04 = int(var_03.var_39B);
	for(;;)
	{
		var_05 = distance(var_03.var_2E6,param_00.var_2E6);
		if(var_05 < var_04)
		{
			lib_A7B5::playershowstreakstaticforrange(0);
		}
		else if(var_05 > var_04 && var_05 < var_04 + 500)
		{
			lib_A7B5::playershowstreakstaticforrange(1);
			if(isdefined(param_00.playerattachpoint))
			{
				param_00.playerattachpoint playsoundasmaster("mp_warbird_outofbounds_warning");
			}
		}
		else if(var_05 > var_04 + 500 && var_05 < var_04 + 1000)
		{
			lib_A7B5::playershowstreakstaticforrange(2);
			if(isdefined(param_00.playerattachpoint))
			{
				param_00.playerattachpoint playsoundasmaster("mp_warbird_outofbounds_warning");
			}
		}
		else if(var_05 > var_04 + 1000 && var_05 < var_04 + 1500)
		{
			lib_A7B5::playershowstreakstaticforrange(3);
			if(isdefined(param_00.playerattachpoint))
			{
				param_00.playerattachpoint playsoundasmaster("mp_warbird_outofbounds_warning");
			}
		}
		else
		{
			lib_A7B5::playershowstreakstaticforrange(4);
			param_00 notify("outOfBounds");
		}

		wait(0.5);
	}
}

//Function Number: 59
lib_A7B5::playerenablestreakstatic()
{
	self notify("playerUpdateStreakStatic");
	self setclientomnvar("ui_streak_overlay_state",1);
}

//Function Number: 60
lib_A7B5::playerdisablestreakstatic()
{
	self notify("playerUpdateStreakStatic");
	self setclientomnvar("ui_streak_overlay_state",0);
}

//Function Number: 61
lib_A7B5::playershowfullstatic()
{
	self notify("playerUpdateStreakStatic");
	self setclientomnvar("ui_streak_overlay_state",7);
}

//Function Number: 62
lib_A7B5::playershowstreakstaticfordamage()
{
	self endon("disconnect");
	if(self getclientomnvar("ui_streak_overlay_state") != 1)
	{
		return;
	}

	self notify("playerUpdateStreakStatic");
	self endon("playerUpdateStreakStatic");
	self setclientomnvar("ui_streak_overlay_state",2);
	wait(1);
	self setclientomnvar("ui_streak_overlay_state",1);
}

//Function Number: 63
lib_A7B5::playershowstreakstaticforrange(param_00)
{
	var_01 = 1;
	switch(param_00)
	{
		case 0:
			break;

		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		default:
			break;
	}
}

//Function Number: 64
lib_A7B5::getentorstruct(param_00,param_01)
{
	var_02 = getent(param_00,param_01);
	if(isdefined(var_02))
	{
		return var_02;
	}

	return common_scripts\utility::getstruct(param_00,param_01);
}

//Function Number: 65
lib_A7B5::getentorstructarray(param_00,param_01)
{
	var_02 = common_scripts\utility::getstructarray(param_00,param_01);
	var_03 = getentarray(param_00,param_01);
	if(var_03.size > 0)
	{
		var_02 = common_scripts\utility::array_combine(var_02,var_03);
	}

	return var_02;
}

//Function Number: 66
lib_A7B5::playerhandlekillvehicle(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		self endon(param_01);
	}

	if(isdefined(param_02))
	{
		self endon(param_02);
	}

	if(!isdefined(level.vehicle_kill_triggers))
	{
		return;
	}

	for(;;)
	{
		var_03 = param_00 lib_A7B5::vehicletouchinganytrigger(level.vehicle_kill_triggers);
		if(var_03)
		{
			param_00 notify("death");
		}

		wait 0.05;
	}
}

//Function Number: 67
lib_A7B5::setup_kill_drone_trig(param_00,param_01)
{
	if(isdefined(param_00) && isdefined(param_01))
	{
		var_02 = getentarray(param_00,param_01);
		common_scripts\utility::array_thread(var_02,::lib_A7B5::setup_kill_drone_trig_proc);
		return;
	}

	if(lib_A7B5::isvehiclekilltrigger())
	{
		lib_A7B5::setup_kill_drone_trig_proc();
	}
}

//Function Number: 68
lib_A7B5::setup_kill_drone_trig_proc()
{
	if(lib_A7B5::isvehiclekilltrigger())
	{
		if(!isdefined(level.vehicle_kill_triggers))
		{
			level.vehicle_kill_triggers = [];
		}

		level.vehicle_kill_triggers[level.vehicle_kill_triggers.size] = self;
	}
}

//Function Number: 69
lib_A7B5::isvehiclekilltrigger()
{
	if(isdefined(self.classname) && issubstr(self.classname,"trigger_multiple") && isdefined(self.spawnflags) && self.spawnflags & 16)
	{
		return 1;
	}

	return 0;
}

//Function Number: 70
lib_A7B5::vehicleiscloaked()
{
	return isdefined(self.cloakstate) && self.cloakstate < 1;
}

//Function Number: 71
lib_A7B5::thermalvision(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	self endon(param_00);
	var_07 = 0;
	lib_A7B5::disableorbitalthermal(self);
	self visionsetthermalforplayer("default",0.25);
	self setclientomnvar("ui_killstreak_optic",0);
	if(isbot(self))
	{
		return;
	}

	self notifyonplayercommand("switch thermal","+actionslot 1");
	thread lib_A7B5::playercleanupthermalvisioncommands(param_00);
	for(;;)
	{
		self waittill("switch thermal");
		if(!var_07)
		{
			lib_A7B5::enableorbitalthermal(self,param_00,param_01,param_02,param_03,param_04,param_05,param_06);
			self setclientomnvar("ui_killstreak_optic",1);
			self method_82F4("paladin_toggle_flir_plr");
		}
		else
		{
			lib_A7B5::disableorbitalthermal(self);
			self setclientomnvar("ui_killstreak_optic",0);
			self method_82F4("paladin_toggle_flir_plr");
		}

		var_07 = !var_07;
	}
}

//Function Number: 72
lib_A7B5::playercleanupthermalvisioncommands(param_00)
{
	self endon("disconnect");
	self waittill(param_00);
	self method_849C("switch thermal","+actionslot 1");
}

//Function Number: 73
lib_A7B5::disableorbitalthermal(param_00)
{
	param_00 method_80B7();
	param_00 notify("thermal_vision_off");
	param_00 method_84AA();
	param_00.orbitalthermalmode = 0;
}

//Function Number: 74
lib_A7B5::enableorbitalthermal(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	param_00 endon("disconnect");
	param_00 endon("death");
	param_00 endon("faux_spawn");
	param_00 endon(param_01);
	if(!isdefined(param_00.opticsthermalenabled))
	{
		param_00.opticsthermalenabled = 0;
	}

	if(!isdefined(param_00.orbitalthermalmode))
	{
		param_00.orbitalthermalmode = 0;
	}

	param_00.orbitalthermalmode = 1;
	while(param_00.opticsthermalenabled)
	{
		wait(0.05);
	}

	param_00 method_80B6();
	param_00 method_84A9(3);
	param_00 thread lib_A7B5::setthermaldof(param_01,param_02,param_03,param_04,param_05,param_06,param_07);
}

//Function Number: 75
lib_A7B5::setthermaldof(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	self endon(param_00);
	self endon("disconnect");
	self endon("thermal_vision_off");
	for(;;)
	{
		var_07 = self playerads();
		var_08 = lib_A7B5::float_lerp(param_03,param_01,var_07);
		var_09 = lib_A7B5::float_lerp(param_04,param_02,var_07);
		self method_84AB(var_08,var_09,param_05,param_06);
		wait(0.1);
	}
}

//Function Number: 76
lib_A7B5::float_lerp(param_00,param_01,param_02)
{
	return param_00 + param_02 * param_01 - param_00;
}

//Function Number: 77
patchheliloopnode(param_00,param_01)
{
	var_02 = [];
	var_03 = lib_A7B5::getentorstruct("heli_loop_start","targetname");
	for(;;)
	{
		if(common_scripts\utility::array_contains(var_02,var_03))
		{
			break;
		}

		if(var_03.var_2E6 == param_00)
		{
			var_03.var_2E6 = param_01;
			return;
		}

		var_02[var_02.size] = var_03;
		var_03 = lib_A7B5::getentorstruct(var_03.target,"targetname");
	}
}