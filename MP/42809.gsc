/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42809.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 68
 * Decompile Time: 20 ms
 * Timestamp: 4/20/2022 8:18:19 PM
*******************************************************************/

//Function Number: 1
lib_A739::watchexplosivedroneusage()
{
	self endon("spawned_player");
	self endon("disconnect");
	self endon("death");
	self endon("faux_spawn");
	if(!isdefined(level.explosivedronesettings))
	{
		lib_A739::explosivedroneinit();
	}

	for(;;)
	{
		self waittill("grenade_fire",var_00,var_01);
		var_02 = maps\mp\_utility::strip_suffix(var_01,"_lefthand");
		if(var_02 == "explosive_drone_mp")
		{
			var_00.inliveplayerkillstreak = self.inliveplayerkillstreak;
			if(!isdefined(var_00.owner))
			{
				var_00.owner = self;
			}

			if(!isdefined(var_00.fx_origin))
			{
				var_00.fx_origin = var_01;
			}

			var_00 thread lib_A739::explosivedronelink();
		}
	}
}

//Function Number: 2
lib_A739::explosivedronelink()
{
	thread lib_A739::watchforstick();
	wait(0.1);
	if(isdefined(self))
	{
		self.explosivedrone = spawn("script_model",self.var_2E6);
		self.explosivedrone.targetname = "explosive_drone_head_model";
		self.explosivedrone setmodel(level.explosivedronesettings.modelbase);
		self.explosivedrone.var_63C4 = self.explosivedrone setcontents(0);
		self.explosivedrone linkto(self,"tag_spike",(0,0,0),(0,0,0));
		self.explosivedrone.owner = self.owner;
		var_00 = self.explosivedrone;
		var_00 thread cleanup_on_grenade_death(self);
		thread lib_A739::monitorspikedestroy();
		thread lib_A739::monitorheaddestroy();
	}
}

//Function Number: 3
cleanup_on_grenade_death(param_00)
{
	param_00 waittill("death");
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 4
lib_A739::explosivegrenadedeath(param_00,param_01,param_02,param_03)
{
	if(isdefined(self))
	{
		self notify("death");
		if(isdefined(self.explosivedrone))
		{
			self.explosivedrone lib_A739::deleteexplosivedrone();
		}

		self delete();
	}
}

//Function Number: 5
lib_A739::explosiveheaddeath(param_00,param_01,param_02,param_03)
{
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 6
lib_A739::explosivedroneinit()
{
	level.explosivedronemaxperplayer = 1;
	level.explosivedronesettings = spawnstruct();
	level.explosivedronesettings.timeout = 20;
	level.explosivedronesettings.explosivetimeout = 30;
	level.explosivedronesettings.health = 60;
	level.explosivedronesettings.var_275 = 60;
	level.explosivedronesettings.vehicleinfo = "vehicle_tracking_drone_mp";
	level.explosivedronesettings.modelbase = "npc_drone_explosive_main";
	level.explosivedronesettings.fxid_sparks = loadfx("vfx/sparks/direct_hack_stun");
	level.explosivedronesettings.fxid_laser_glow = loadfx("vfx/lights/tracking_drone_laser_blue");
	level.explosivedronesettings.fxid_explode = loadfx("vfx/explosion/explosive_drone_explosion");
	level.explosivedronesettings.fxid_lethalexplode = loadfx("vfx/explosion/explosive_drone_explosion");
	level.explosivedronesettings.fxid_enemy_light = loadfx("vfx/lights/light_explosive_drone_beacon_enemy");
	level.explosivedronesettings.fxid_friendly_light = loadfx("vfx/lights/light_explosive_drone_beacon_friendly");
	level.explosivedronesettings.fxid_engine_distort = loadfx("vfx/distortion/tracking_drone_distortion_hemi");
	level.explosivedronesettings.fxid_launch_thruster = loadfx("vfx/trail/explosive_drone_thruster_large");
	level.explosivedronesettings.fxid_position_thruster = loadfx("vfx/trail/explosive_drone_thruster_small");
	level.explosivedronesettings.sound_explode = "wpn_explosive_drone_exp";
	level.explosivedronesettings.sound_lock = "wpn_explosive_drone_lock";
	level.explosivedronesettings.sound_launch = "wpn_explosive_drone_open";
	foreach(var_01 in level.var_328)
	{
		var_01.is_being_tracked = 0;
	}

	level thread lib_A739::onexplosiveplayerconnect();
	level.explosivedronetimeout = level.explosivedronesettings.timeout;
	level.explosivedronetimeout = level.explosivedronesettings.explosivetimeout;
	level.explosivedronedebugposition = 0;
	level.explosivedronedebugpositionforward = 0;
	level.explosivedronedebugpositionheight = 0;
}

//Function Number: 7
lib_A739::tryuseexplosivedrone(param_00)
{
	var_01 = 1;
	if(maps\mp\_utility::isusingremote())
	{
		return 0;
	}
	else if(lib_A739::exceededmaxexplosivedrones())
	{
		self iprintlnbold(&"MP_AIR_SPACE_TOO_CROWDED");
		return 0;
	}
	else if(maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + var_01 >= maps\mp\_utility::maxvehiclesallowed())
	{
		self iprintlnbold(&"MP_AIR_SPACE_TOO_CROWDED");
		return 0;
	}

	if(!isdefined(self.explosivedronearray))
	{
		self.explosivedronearray = [];
	}

	if(self.explosivedronearray.size)
	{
		self.explosivedronearray = common_scripts\utility::array_removeundefined(self.explosivedronearray);
		if(self.explosivedronearray.size >= level.explosivedronemaxperplayer)
		{
			if(isdefined(self.explosivedronearray[0]))
			{
				self.explosivedronearray[0] thread lib_A739::explosivedrone_leave();
			}
		}
	}

	maps\mp\_utility::incrementfauxvehiclecount();
	var_02 = param_00 lib_A739::createexplosivedrone();
	if(!isdefined(var_02))
	{
		maps\mp\_utility::decrementfauxvehiclecount();
		return 0;
	}

	self playsoundasmaster(level.explosivedronesettings.sound_launch);
	self playsoundasmaster(level.explosivedronesettings.sound_lock);
	self.explosivedronearray[self.explosivedronearray.size] = var_02;
	thread lib_A739::startexplosivedrone(var_02);
	playfxontag(level.explosivedronesettings.fxid_launch_thruster,var_02,"TAG_THRUSTER_BTM");
	param_00 notify("mine_selfdestruct");
	return var_02;
}

//Function Number: 8
lib_A739::createexplosivedrone(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	if(!param_00)
	{
		var_04 = self.var_41;
		var_05 = anglestoforward(var_04);
		var_06 = anglestoright(var_04);
		var_07 = var_05 * 50;
		var_08 = var_06 * 0;
		var_09 = 80;
		if(isdefined(self.explosivedrone))
		{
			var_0B = self.explosivedrone.var_2E6;
			var_04 = self.explosivedrone.var_41;
			self.explosivedrone lib_A739::deleteexplosivedrone();
			lib_A739::addtodeletespike();
		}
		else
		{
			var_0B = self.var_2E6;
		}
	}
	else
	{
		var_0B = param_03;
		var_0C = param_01;
		var_04 = param_02;
	}

	var_0D = anglestoup(self.var_41);
	var_0B = var_0B + var_0D * 10;
	var_0E = spawnhelicopter(self.owner,var_0B,var_04,level.explosivedronesettings.vehicleinfo,level.explosivedronesettings.modelbase);
	if(!isdefined(var_0E))
	{
		return;
	}

	var_0E.type = "explosive_drone";
	var_0E common_scripts\utility::make_entity_sentient_mp(self.owner.inliveplayerkillstreak);
	var_0E makevehiclenotcollidewithplayers(1);
	var_0E lib_A739::addtoexplosivedronelist();
	var_0E thread lib_A739::removefromexplosivedronelistondeath();
	var_0E.health = level.explosivedronesettings.health;
	var_0E.var_275 = level.explosivedronesettings.var_275;
	var_0E.damagetaken = 0;
	var_0E.speed = 20;
	var_0E.followspeed = 20;
	var_0E.owner = self.owner;
	var_0E.inliveplayerkillstreak = self.owner.inliveplayerkillstreak;
	var_0E veh_setspeed(var_0E.speed,10,10);
	var_0E veh_setyawspeed(120,90);
	var_0E veh_neargoalnotifydist(64);
	var_0E veh_sethoverparams(20,5,5);
	var_0E.fx_tag0 = undefined;
	if(isdefined(var_0E.type))
	{
		if(var_0E.type == "explosive_drone")
		{
		}
	}

	var_0E.maxtrackingrange = 2000;
	var_0E.maxlaserrange = 300;
	var_0E.trackedplayer = undefined;
	var_0F = 45;
	var_10 = 45;
	var_0E veh_setmaxpitchroll(var_0F,var_10);
	var_0E.targetpos = var_0B;
	var_0E.attract_strength = 10000;
	var_0E.attract_range = 150;
	var_0E.attractor = missilecreateattractorent(var_0E,var_0E.attract_strength,var_0E.attract_range);
	var_0E.hasdodged = 0;
	var_0E.stunned = 0;
	var_0E.inactive = 0;
	var_0E thread maps\mp\gametypes\_damage::setentitydamagecallback(var_0E.var_275,undefined,::lib_A739::onexplosivedronedeath,undefined,0);
	var_0E thread lib_A739::explosivedrone_watchdisable();
	var_0E thread lib_A739::explosivedrone_watchdeath();
	var_0E thread lib_A739::explosivedrone_watchtimeout();
	var_0E thread lib_A739::explosivedrone_watchownerloss();
	var_0E thread lib_A739::explosivedrone_watchownerdeath();
	var_0E thread lib_A739::explosivedrone_watchroundend();
	var_0E thread lib_A739::explosivedrone_watchhostmigration();
	var_0E thread lib_A739::explosivedrone_enemy_lightfx();
	var_0E thread lib_A739::explosivedrone_friendly_lightfx();
	var_0E thread lib_A739::drone_thrusterfxexplosive();
	return var_0E;
}

//Function Number: 9
lib_A739::addtodeletespike()
{
	var_00 = 5;
	if(!isdefined(level.spikelist))
	{
		level.spikelist = [];
		level.spikelistindex = 0;
	}

	if(level.spikelist.size >= var_00)
	{
		if(isdefined(level.spikelist[level.spikelistindex]))
		{
			level.spikelist[level.spikelistindex] delete();
		}
	}

	level.spikelist[level.spikelistindex] = self;
	level.spikelistindex = level.spikelistindex + 1 % var_00;
}

//Function Number: 10
lib_A739::idletargetmoverexplosive(param_00)
{
	self endon("disconnect");
	level endon("game_ended");
	param_00 endon("death");
	var_01 = anglestoforward(self.var_41);
	for(;;)
	{
		if(maps\mp\_utility::isreallyalive(self) && !maps\mp\_utility::isusingremote() && anglestoforward(self.var_41) != var_01)
		{
			var_01 = anglestoforward(self.var_41);
			var_02 = self.var_2E6 + var_01 * -100 + (0,0,40);
			param_00 moveto(var_02,0.5);
		}

		wait(0.5);
	}
}

//Function Number: 11
lib_A739::explosivedrone_enemy_lightfx()
{
	self endon("death");
	self.owner endon("faux_spawn");
	foreach(var_01 in level.var_328)
	{
		if(isdefined(var_01) && issentient(var_01) && issentient(self) && var_01.inliveplayerkillstreak != self.inliveplayerkillstreak)
		{
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
		}
	}
}

//Function Number: 12
lib_A739::explosivedrone_friendly_lightfx()
{
	self endon("death");
	self.owner endon("faux_spawn");
	foreach(var_01 in level.var_328)
	{
		if(isdefined(var_01) && issentient(var_01) && issentient(self) && var_01.inliveplayerkillstreak == self.inliveplayerkillstreak)
		{
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_01);
		}
	}

	thread lib_A739::watchconnectedplayfxexplosive();
	thread lib_A739::watchjoinedteamplayfxexplosive();
}

//Function Number: 13
lib_A739::drone_thrusterfxexplosive()
{
	self endon("death");
	self endon("disconnect");
	self.owner endon("faux_spawn");
	for(;;)
	{
		foreach(var_01 in level.var_328)
		{
			thread lib_A739::drone_thrusterfx_bottom_threaded(var_01);
			thread lib_A739::drone_thrusterfx_side_threaded(var_01);
		}

		wait(1.1);
	}
}

//Function Number: 14
lib_A739::drone_thrusterfx_side_threaded(param_00)
{
	self endon("death");
	self endon("disconnect");
	self.owner endon("faux_spawn");
	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUST_SIDE_X_nY_Z",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUST_SIDE_X_nY_nZ",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUST_SIDE_nX_nY_Z",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUST_SIDE_nX_nY_nZ",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUST_SIDE_nX_Y_nZ",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUST_SIDE_nX_Y_Z",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUST_SIDE_X_Y_Z",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUST_SIDE_X_Y_nZ",param_00);
	}
}

//Function Number: 15
lib_A739::drone_thrusterfx_bottom_threaded(param_00)
{
	self endon("death");
	self endon("disconnect");
	self.owner endon("faux_spawn");
	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_engine_distort))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_engine_distort,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_engine_distort))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_engine_distort,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_engine_distort))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_engine_distort,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_engine_distort))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_engine_distort,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_engine_distort))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_engine_distort,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_position_thruster))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_position_thruster,self,"TAG_THRUSTER_BTM",param_00);
	}

	wait(0.1);
	if(isdefined(param_00) && isdefined(self) && isdefined(level.explosivedronesettings.fxid_engine_distort))
	{
		playfxontagforclients(level.explosivedronesettings.fxid_engine_distort,self,"TAG_THRUSTER_BTM",param_00);
	}
}

//Function Number: 16
lib_A739::watchconnectedplayfxexplosive()
{
	self endon("death");
	self.owner endon("faux_spawn");
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 waittill("spawned_player");
		if(isdefined(var_00) && var_00.inliveplayerkillstreak == self.inliveplayerkillstreak)
		{
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_00);
		}
	}
}

//Function Number: 17
lib_A739::watchjoinedteamplayfxexplosive()
{
	self endon("death");
	self.owner endon("faux_spawn");
	for(;;)
	{
		level waittill("joined_team",var_00);
		var_00 waittill("spawned_player");
		if(isdefined(var_00) && var_00.inliveplayerkillstreak == self.inliveplayerkillstreak)
		{
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_friendly_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_00);
			wait(0.15);
			playfxontagforclients(level.explosivedronesettings.fxid_enemy_light,self,"TAG_BEACON",var_00);
		}
	}
}

//Function Number: 18
lib_A739::startexplosivedrone(param_00)
{
	level endon("game_ended");
	param_00 endon("death");
	param_00 thread lib_A739::explosivedrone_followtarget();
	param_00 thread lib_A739::createkillcamentity();
	if(isdefined(param_00.type))
	{
		if(param_00.type == "explosive_drone")
		{
			param_00 thread lib_A739::checkforexplosivegoalexplosive();
		}
	}
}

//Function Number: 19
lib_A739::checkforexplosivegoalexplosive()
{
	level endon("game_ended");
	level endon("host_migration_begin");
	self endon("death");
	self endon("leaving");
	var_00 = gettime();
	thread lib_A739::blowupatendoftrackingtime(var_00);
}

//Function Number: 20
lib_A739::blowupatendoftrackingtime(param_00)
{
	level endon("game_ended");
	level endon("host_migration_begin");
	self endon("death");
	self endon("leaving");
	while(gettime() - param_00 < 3000)
	{
		wait 0.05;
	}

	if(isdefined(self))
	{
		self notify("exploding");
		thread lib_A739::blowupdronesequenceexplosive();
	}
}

//Function Number: 21
lib_A739::blowupdronesequenceexplosive()
{
	var_00 = undefined;
	if(isdefined(self))
	{
		if(isdefined(self.owner))
		{
			var_00 = self.owner;
		}

		self playsoundasmaster(level.explosivedronesettings.sound_lock);
		wait(0.5);
	}

	if(isdefined(self))
	{
		self playsoundasmaster("wpn_explosive_drone_exp");
		var_01 = anglestoup(self.var_41);
		var_02 = anglestoforward(self.var_41);
		playfx(level.explosivedronesettings.fxid_lethalexplode,self.var_2E6,var_02,var_01);
		if(isdefined(var_00))
		{
			self entityradiusdamage(self.var_2E6,256,130,55,var_00,"MOD_EXPLOSIVE","explosive_drone_mp");
		}
		else
		{
			self entityradiusdamage(self.var_2E6,256,130,55,undefined,"MOD_EXPLOSIVE","explosive_drone_mp");
		}

		self notify("death");
	}
}

//Function Number: 22
lib_A739::turnondangerlightsexplosive()
{
	if(isdefined(self))
	{
	}

	wait(0.05);
	if(isdefined(self))
	{
	}

	wait(0.15);
	if(isdefined(self))
	{
	}
}

//Function Number: 23
lib_A739::explosivedrone_followtarget()
{
	level endon("game_ended");
	level endon("host_migration_begin");
	self endon("death");
	self endon("leaving");
	self endon("exploding");
	if(!isdefined(self.owner))
	{
		thread lib_A739::explosivedrone_leave();
		return;
	}

	self.owner endon("disconnect");
	self endon("owner_gone");
	self veh_setspeed(self.followspeed,10,10);
	self.previoustrackedplayer = self.owner;
	self.trackedplayer = undefined;
	for(;;)
	{
		if(isdefined(self.stunned) && self.stunned)
		{
			wait(0.5);
			continue;
		}

		if(isdefined(self.owner) && isalive(self.owner))
		{
			var_00 = self.maxtrackingrange * self.maxtrackingrange;
			var_01 = var_00;
			if(!isdefined(self.trackedplayer) || self.trackedplayer == self.owner)
			{
				foreach(var_03 in level.var_328)
				{
					if(isdefined(var_03) && isalive(var_03) && var_03 != self.owner && !level.teambased || var_03.inliveplayerkillstreak != self.inliveplayerkillstreak && !var_03 maps\mp\_utility::_hasperk("specialty_blindeye"))
					{
						var_04 = distancesquared(self.var_2E6,var_03.var_2E6);
						if(var_04 < var_01)
						{
							var_01 = var_04;
							self.trackedplayer = var_03;
							thread lib_A739::watchplayerdeathdisconnectexplosive(var_03);
						}
					}
				}
			}

			if(!isdefined(self.trackedplayer))
			{
				thread lib_A739::explosivedroneexplode();
			}

			if(isdefined(self.trackedplayer))
			{
				lib_A739::explosivedrone_movetoplayer(self.trackedplayer);
			}

			if(self.trackedplayer != self.previoustrackedplayer)
			{
				lib_A739::stophighlightingplayerexplosive(self.previoustrackedplayer);
				self.previoustrackedplayer = self.trackedplayer;
			}
		}

		wait(1);
	}
}

//Function Number: 24
lib_A739::watchplayerdeathdisconnectexplosive(param_00)
{
	param_00 common_scripts\utility::waittill_any("death","disconnect","faux_spawn","joined_team");
	if(param_00.is_being_tracked == 1)
	{
		thread lib_A739::explosivedrone_leave();
		return;
	}

	self.trackedplayer = undefined;
}

//Function Number: 25
lib_A739::explosivedrone_movetoplayer(param_00)
{
	level endon("game_ended");
	self endon("death");
	self endon("leaving");
	self.owner endon("death");
	self.owner endon("disconnect");
	self endon("owner_gone");
	self notify("explosiveDrone_moveToPlayer");
	self endon("explosiveDrone_moveToPlayer");
	var_01 = 0;
	var_02 = 0;
	var_03 = 65;
	switch(param_00 getstance())
	{
		case "stand":
			break;

		case "crouch":
			break;

		case "prone":
			break;
	}
}

//Function Number: 26
lib_A739::explosivedrone_stopmovement()
{
	self veh_setgoalpos(self.var_2E6,1);
	self.intransit = 0;
	self.inactive = 1;
}

//Function Number: 27
lib_A739::explosivedrone_changeowner(param_00)
{
	maps\mp\_utility::incrementfauxvehiclecount();
	var_01 = param_00 lib_A739::createexplosivedrone(1,self.var_2E6,self.var_41);
	if(!isdefined(var_01))
	{
		maps\mp\_utility::decrementfauxvehiclecount();
		return 0;
	}

	if(!isdefined(param_00.explosivedronearray))
	{
		param_00.explosivedronearray = [];
	}

	param_00.explosivedronearray[param_00.explosivedronearray.size] = var_01;
	param_00 thread lib_A739::startexplosivedrone(var_01);
	if(isdefined(level.explosivedronesettings.fxid_sparks))
	{
	}

	lib_A739::removeexplosivedrone();
	return 1;
}

//Function Number: 28
lib_A739::explosivedrone_highlighttarget()
{
	level endon("game_ended");
	self endon("death");
	self endon("leaving");
	if(!isdefined(self.owner))
	{
		thread lib_A739::explosivedrone_leave();
		return;
	}

	self.owner endon("disconnect");
	self.owner endon("joined_team");
	self.owner endon("joined_spectators");
	self.lasertag = spawn("script_model",self.var_2E6);
	self.lasertag setmodel("tag_laser");
	if(isdefined(self.trackedplayer))
	{
		self.lasertag.var_2E6 = self gettagorigin("tag_weapon");
		var_00 = 20;
		var_01 = (randomfloat(var_00),randomfloat(var_00),randomfloat(var_00)) - (10,10,10);
		var_02 = 65;
		switch(self.trackedplayer getstance())
		{
			case "stand":
				break;

			case "crouch":
				break;

			case "prone":
				break;
		}
	}
}

//Function Number: 29
lib_A739::starthighlightingplayerexplosive(param_00)
{
	self.lasertag method_80B2("explosive_drone_laser");
	playfxontag(level.explosivedronesettings.fxid_laser_glow,self.lasertag,"tag_laser");
	if(isdefined(level.explosivedronesettings.sound_lock))
	{
		self playsoundasmaster(level.explosivedronesettings.sound_lock);
	}

	param_00 setperk("specialty_radararrow",1,0);
	if(param_00.is_being_tracked == 0)
	{
		param_00.is_being_tracked = 1;
		param_00.trackedbyplayer = self.owner;
	}
}

//Function Number: 30
lib_A739::stophighlightingplayerexplosive(param_00)
{
	if(isdefined(self.lasertag))
	{
		self.lasertag method_80B3();
		stopfxontag(level.explosivedronesettings.fxid_laser_glow,self.lasertag,"tag_laser");
	}

	if(isdefined(param_00))
	{
		if(isdefined(level.explosivedronesettings.sound_lock))
		{
			self stoploopsound();
		}

		if(param_00 hasperk("specialty_radararrow",1))
		{
			param_00 unsetperk("specialty_radararrow",1);
		}

		param_00 notify("player_not_tracked");
		param_00.is_being_tracked = 0;
		param_00.trackedbyplayer = undefined;
	}
}

//Function Number: 31
lib_A739::onexplosiveplayerconnect()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("connected",var_00);
		var_00.is_being_tracked = 0;
		foreach(var_00 in level.var_328)
		{
			if(!isdefined(var_00.is_being_tracked))
			{
				var_00.is_being_tracked = 0;
			}
		}
	}
}

//Function Number: 32
lib_A739::explosivedrone_watchforgoal()
{
	level endon("game_ended");
	self endon("death");
	self endon("leaving");
	self.owner endon("death");
	self.owner endon("disconnect");
	self endon("owner_gone");
	self notify("explosiveDrone_watchForGoal");
	self endon("explosiveDrone_watchForGoal");
	var_00 = common_scripts\utility::waittill_any_return("goal","near_goal","hit_goal");
	self.intransit = 0;
	self.inactive = 0;
	self notify("hit_goal");
}

//Function Number: 33
lib_A739::explosivedrone_watchdeath()
{
	level endon("game_ended");
	self endon("gone");
	self waittill("death");
	thread lib_A739::explosivedronedestroyed();
}

//Function Number: 34
lib_A739::explosivedrone_watchtimeout()
{
	level endon("game_ended");
	level endon("host_migration_begin");
	self endon("death");
	self.owner endon("disconnect");
	self endon("owner_gone");
	var_00 = level.explosivedronetimeout;
	if(self.type == "explosive_drone")
	{
		var_00 = level.explosivedronetimeout;
	}

	wait(var_00);
	thread lib_A739::explosivedrone_leave();
}

//Function Number: 35
lib_A739::explosivedrone_watchownerloss()
{
	level endon("game_ended");
	self endon("death");
	self endon("leaving");
	self.owner common_scripts\utility::waittill_any("disconnect","joined_team","joined_spectators");
	self notify("owner_gone");
	thread lib_A739::explosivedrone_leave();
}

//Function Number: 36
lib_A739::explosivedrone_watchownerdeath()
{
	level endon("game_ended");
	self endon("death");
	self endon("leaving");
	for(;;)
	{
		self.owner waittill("death");
		thread lib_A739::explosivedrone_leave();
	}
}

//Function Number: 37
lib_A739::explosivedrone_watchtargetdisconnect()
{
	level endon("game_ended");
	level endon("host_migration_begin");
	self endon("death");
	self endon("leaving");
	self.owner endon("death");
	self.owner endon("disconnect");
	self endon("owner_gone");
	self notify("explosiveDrone_watchTargetDisconnect");
	self endon("explosiveDrone_watchTargetDisconnect");
	self.trackedplayer waittill("disconnect");
	lib_A739::stophighlightingplayerexplosive(self.trackedplayer);
	lib_A739::explosivedrone_movetoplayer(self.owner);
}

//Function Number: 38
lib_A739::explosivedrone_watchroundend()
{
	level endon("game_ended");
	self endon("death");
	self endon("leaving");
	self.owner endon("disconnect");
	self endon("owner_gone");
	level common_scripts\utility::waittill_any("round_end_finished","game_ended");
	thread lib_A739::explosivedrone_leave();
}

//Function Number: 39
lib_A739::explosivedrone_watchhostmigration()
{
	level endon("game_ended");
	self endon("death");
	self endon("leaving");
	self.owner endon("death");
	self.owner endon("disconnect");
	self endon("owner_gone");
	level waittill("host_migration_begin");
	lib_A739::stophighlightingplayerexplosive(self.trackedplayer);
	maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
	thread lib_A739::explosivedrone_changeowner(self.owner);
}

//Function Number: 40
lib_A739::explosivedrone_leave()
{
	self endon("death");
	self notify("leaving");
	lib_A739::stophighlightingplayerexplosive(self.trackedplayer);
	lib_A739::explosivedroneexplode();
}

//Function Number: 41
lib_A739::onexplosivedronedeath(param_00,param_01,param_02,param_03)
{
	self notify("death");
}

//Function Number: 42
lib_A739::explosivedrone_grenade_watchdisable()
{
	self endon("death");
	self.owner endon("disconnect");
	level endon("game_ended");
	self.stunned = 0;
	for(;;)
	{
		self waittill("emp_damage",var_00,var_01);
		thread lib_A739::explosivedrone_grenade_stunned();
	}
}

//Function Number: 43
lib_A739::explosivedrone_watchdisable()
{
	self endon("death");
	self.owner endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("emp_damage",var_00,var_01);
		thread lib_A739::explosivedrone_stunned();
	}
}

//Function Number: 44
lib_A739::explosivedrone_grenade_stunned()
{
	self notify("explosiveDrone_stunned");
	self endon("explosiveDrone_stunned");
	self endon("death");
	self.owner endon("disconnect");
	level endon("game_ended");
	lib_A739::explosivedrone_grenade_stunbegin();
	wait(10);
	lib_A739::explosivedrone_grenade_stunend();
}

//Function Number: 45
lib_A739::explosivedrone_stunned()
{
	self notify("explosiveDrone_stunned");
	self endon("explosiveDrone_stunned");
	self endon("death");
	self.owner endon("disconnect");
	level endon("game_ended");
	lib_A739::explosivedrone_stunbegin();
	wait(10);
	lib_A739::explosivedrone_stunend();
}

//Function Number: 46
lib_A739::explosivedrone_grenade_stunbegin()
{
	if(self.stunned)
	{
		return;
	}

	self.stunned = 1;
	if(isdefined(level.explosivedronesettings.fxid_sparks))
	{
		playfxontag(level.explosivedronesettings.fxid_sparks,self,"TAG_BEACON");
	}
}

//Function Number: 47
lib_A739::explosivedrone_stunbegin()
{
	if(self.stunned)
	{
		return;
	}

	self.stunned = 1;
	if(isdefined(level.explosivedronesettings.fxid_sparks))
	{
		playfxontag(level.explosivedronesettings.fxid_sparks,self,"TAG_BEACON");
	}

	thread lib_A739::stophighlightingplayerexplosive(self.trackedplayer);
	self.trackedplayer = undefined;
	self.previoustrackedplayer = self.owner;
	thread lib_A739::explosivedrone_stopmovement();
}

//Function Number: 48
lib_A739::explosivedrone_grenade_stunend()
{
	if(isdefined(level.explosivedronesettings.fxid_sparks))
	{
		killfxontag(level.explosivedronesettings.fxid_sparks,self,"TAG_BEACON");
	}

	self.stunned = 0;
	self.inactive = 0;
}

//Function Number: 49
lib_A739::explosivedrone_stunend()
{
	if(isdefined(level.explosivedronesettings.fxid_sparks))
	{
		killfxontag(level.explosivedronesettings.fxid_sparks,self,"TAG_BEACON");
	}

	self.stunned = 0;
	self.inactive = 0;
}

//Function Number: 50
lib_A739::explosivedronedestroyed()
{
	if(!isdefined(self))
	{
		return;
	}

	lib_A739::stophighlightingplayerexplosive(self.trackedplayer);
	lib_A739::explosivedrone_stunend();
	lib_A739::explosivedroneexplode();
}

//Function Number: 51
lib_A739::explosivedroneexplode()
{
	if(isdefined(level.explosivedronesettings.fxid_explode))
	{
		playfx(level.explosivedronesettings.fxid_explode,self.var_2E6);
	}

	if(isdefined(level.explosivedronesettings.sound_explode))
	{
		self playsoundasmaster(level.explosivedronesettings.sound_explode);
	}

	self notify("exploding");
	lib_A739::removeexplosivedrone();
}

//Function Number: 52
lib_A739::deleteexplosivedrone()
{
	if(isdefined(self.attractor))
	{
		missiledeleteattractor(self.attractor);
	}

	lib_A739::removekillcamentity();
	self delete();
}

//Function Number: 53
lib_A739::removeexplosivedrone()
{
	maps\mp\_utility::decrementfauxvehiclecount();
	if(isdefined(self.owner) && isdefined(self.owner.explosivedrone))
	{
		self.owner.explosivedrone = undefined;
	}

	lib_A739::deleteexplosivedrone();
}

//Function Number: 54
lib_A739::addtoexplosivedronelist()
{
	level.explosivedrones[self getentitynumber()] = self;
}

//Function Number: 55
lib_A739::removefromexplosivedronelistondeath()
{
	var_00 = self getentitynumber();
	self waittill("death");
	level.explosivedrones[var_00] = undefined;
	level.explosivedrones = common_scripts\utility::array_removeundefined(level.explosivedrones);
}

//Function Number: 56
lib_A739::exceededmaxexplosivedrones()
{
	if(isdefined(level.explosivedrones) && level.explosivedrones.size >= maps\mp\_utility::maxvehiclesallowed())
	{
		return 1;
	}

	return 0;
}

//Function Number: 57
lib_A739::explosivedroneproximitytrigger()
{
	self endon("mine_destroyed");
	self endon("mine_selfdestruct");
	self endon("death");
	self.owner endon("disconnect");
	self.owner endon("faux_spawn");
	wait(3);
	if(isdefined(self) && isdefined(self.explosivedrone))
	{
		var_00 = self.explosivedrone gettagorigin("TAG_BEACON") - self gettagorigin("TAG_BEACON") + (0,0,10);
		if(level.teambased)
		{
			maps\mp\_entityheadicons::setteamheadicon(self.owner.inliveplayerkillstreak,var_00,"TAG_BEACON");
		}
		else
		{
			maps\mp\_entityheadicons::setplayerheadicon(self.owner,var_00,"TAG_BEACON");
		}

		var_01 = spawn("trigger_radius",self.var_2E6 + (0,0,-96),0,192,192);
		var_01.owner = self;
		thread lib_A739::explosivedronedeletetrigger(var_01);
		thread lib_A739::watchforpickup(var_01);
		var_02 = undefined;
		while(isdefined(self) && isdefined(self.explosivedrone))
		{
			var_01 waittill("trigger",var_02);
			if(!isdefined(var_02))
			{
				wait(0.1);
				continue;
			}

			if(var_02 maps\mp\_utility::_hasperk("specialty_blindeye"))
			{
				wait(0.1);
				continue;
			}

			if(isdefined(self.explosivedrone) && !var_02 sightconetrace(self.explosivedrone gettagorigin("TAG_BEACON"),self.explosivedrone))
			{
				wait(0.1);
				continue;
			}

			if(isdefined(self.explosivedrone))
			{
				var_03 = self.explosivedrone gettagorigin("TAG_BEACON");
				var_04 = var_02 geteye();
				if(!bullettracepassed(var_03,var_04,0,self.explosivedrone))
				{
					wait(0.1);
					continue;
				}
			}

			if(maps\mp\_utility::isreallyalive(var_02) && var_02 != self.owner && !level.teambased || var_02.inliveplayerkillstreak != self.owner.inliveplayerkillstreak && !self.stunned)
			{
				var_02 lib_A739::tryuseexplosivedrone(self);
			}
		}
	}
}

//Function Number: 58
lib_A739::explosivedronedeletetrigger(param_00)
{
	common_scripts\utility::waittill_any("mine_triggered","mine_destroyed","mine_selfdestruct","death");
	if(isdefined(self.entityheadicon))
	{
		self notify("kill_entity_headicon_thread");
		self.entityheadicon destroy();
	}

	param_00 delete();
}

//Function Number: 59
lib_A739::showdebugradius(param_00)
{
	var_01 = spawnfx(level.explosivedronesettings.dome,param_00.var_2E6);
	triggerfx(var_01);
	self waittill("death");
	var_01 delete();
}

//Function Number: 60
lib_A739::endonplayerspawn()
{
	self.owner common_scripts\utility::waittill_any("spawned_player","faux_spawn","delete_explosive_drones");
	lib_A739::explosivegrenadedeath();
}

//Function Number: 61
lib_A739::monitorspikedestroy()
{
	self.owner endon("death");
	self.owner endon("disconnect");
	self.owner endon("faux_spawn");
	common_scripts\utility::waittill_any("mine_selfdestruct");
	lib_A739::explosivegrenadedeath();
}

//Function Number: 62
lib_A739::monitorheaddestroy()
{
	self.owner endon("death");
	self.owner endon("disconnect");
	self.owner endon("faux_spawn");
	while(isdefined(self.explosivedrone))
	{
		wait(0.15);
	}

	if(isdefined(self))
	{
		self playsoundasmaster("wpn_explosive_drone_exp");
		var_00 = anglestoup(self.var_41);
		var_01 = anglestoforward(self.var_41);
		playfx(level.explosivedronesettings.fxid_lethalexplode,self.var_2E6,var_01,var_00);
		self entityradiusdamage(self.var_2E6,256,130,55,self.owner,"MOD_EXPLOSIVE","explosive_drone_mp");
		self notify("death");
	}

	lib_A739::explosivegrenadedeath();
}

//Function Number: 63
lib_A739::startgrenadelightfx()
{
	self endon("death");
	self.owner endon("death");
	self.owner endon("disconnect");
	var_00 = 0.6;
	while(isdefined(self.explosivedrone))
	{
		foreach(var_02 in level.var_328)
		{
			if(isdefined(var_02) && issentient(var_02) && var_02.inliveplayerkillstreak == self.inliveplayerkillstreak && isdefined(self.explosivedrone))
			{
				thread lib_A739::fxblink(level.explosivedronesettings.fxid_friendly_light,self.explosivedrone,"TAG_BEACON",var_02);
			}

			if(isdefined(var_02) && issentient(var_02) && var_02.inliveplayerkillstreak != self.inliveplayerkillstreak && isdefined(self.explosivedrone))
			{
				thread lib_A739::fxblink(level.explosivedronesettings.fxid_enemy_light,self.explosivedrone,"TAG_BEACON",var_02);
			}
		}

		wait(var_00);
	}
}

//Function Number: 64
lib_A739::fxblink(param_00,param_01,param_02,param_03)
{
	for(var_04 = 0;var_04 <= 4 && isdefined(param_01);var_04++)
	{
		if(isdefined(param_03) && isdefined(param_01) && isdefined(self.stunned) && !self.stunned)
		{
			playfxontagforclients(param_00,param_01,param_02,param_03);
			wait(0.15);
		}
	}
}

//Function Number: 65
lib_A739::watchforstick()
{
	self endon("death");
	self.owner endon("death");
	self.owner endon("disconnect");
	var_00 = undefined;
	var_00 = common_scripts\utility::waittill_any_return_parms("missile_stuck","mp_exo_repulsor_repel");
	while(!isdefined(self.explosivedrone))
	{
		wait 0.05;
	}

	if(isdefined(var_00[1]))
	{
		var_01 = var_00[1].var_7ADA;
		if(var_00[1].classname == "script_model" && !isdefined(var_01) && var_01 == 1)
		{
			self playsoundasmaster("wpn_explosive_drone_exp");
			var_02 = anglestoup(self.var_41);
			var_03 = anglestoforward(self.var_41);
			playfx(level.explosivedronesettings.fxid_lethalexplode,self.var_2E6,var_03,var_02);
			self entityradiusdamage(self.var_2E6,256,130,55,self.owner,"MOD_EXPLOSIVE","explosive_drone_mp");
			thread lib_A739::explosivegrenadedeath();
		}
	}

	if(isdefined(self))
	{
		self.explosivedrone setcontents(self.explosivedrone.var_63C4);
		thread lib_A739::explosivedroneproximitytrigger();
		thread lib_A739::endonplayerspawn();
		thread lib_A739::explosivedrone_grenade_watchdisable();
		thread lib_A739::startgrenadelightfx();
		thread maps\mp\gametypes\_damage::setentitydamagecallback(100,undefined,::lib_A739::explosivegrenadedeath,undefined,0);
		self.explosivedrone thread maps\mp\gametypes\_damage::setentitydamagecallback(100,undefined,::lib_A739::explosiveheaddeath,undefined,0);
		thread maps\mp\gametypes\_weapons::stickyhandlemovers("mine_selfdestruct");
	}
}

//Function Number: 66
lib_A739::createkillcamentity()
{
	var_00 = (0,0,0);
	self.killcament = spawn("script_model",self.var_2E6);
	self.killcament setscriptmoverkillcam("explosive");
	self.killcament linkto(self,"TAG_THRUSTER_BTM",var_00,(0,0,0));
	self.killcament setcontents(0);
	self.killcament.starttime = gettime();
}

//Function Number: 67
lib_A739::removekillcamentity()
{
	if(isdefined(self.killcament))
	{
		self.killcament delete();
	}
}

//Function Number: 68
lib_A739::watchforpickup(param_00)
{
	self.owner endon("disconnect");
	self.owner endon("faux_spawn");
	level endon("game_ended");
	self endon("death");
	self.owner endon("death");
	self.explosivedrone makeusable();
	self.explosivedrone sethintstring(&"MP_PICKUP_EXPLOSIVE_DRONE");
	self.explosivedrone method_849B(1);
	var_01 = getdvarfloat("player_useRadius",128);
	var_01 = var_01 * var_01;
	for(;;)
	{
		if(!isdefined(self) || !isdefined(param_00))
		{
			break;
		}

		var_02 = isdefined(self.explosivedrone) && distancesquared(self.owner geteye(),self.explosivedrone.var_2E6) <= var_01;
		if(self.owner istouching(param_00) && var_02)
		{
			var_03 = 0;
			while(self.owner usebuttonpressed())
			{
				if(!maps\mp\_utility::isreallyalive(self.owner))
				{
					break;
				}

				if(!self.owner istouching(param_00))
				{
					break;
				}

				if(self.owner fragbuttonpressed() || self.owner secondaryoffhandbuttonpressed() || isdefined(self.owner.throwinggrenade))
				{
					break;
				}

				if(self.owner isusingturret() || self.owner maps\mp\_utility::isusingremote())
				{
					break;
				}

				if(isdefined(self.owner.iscapturingcrate) && self.owner.iscapturingcrate)
				{
					break;
				}

				if(isdefined(self.owner.empgrenaded) && self.owner.empgrenaded)
				{
					break;
				}

				if(isdefined(self.owner.using_remote_turret) && self.owner.using_remote_turret)
				{
					break;
				}

				var_03 = var_03 + 0.05;
				if(var_03 > 0.75)
				{
					self.owner setweaponammostock(self.fx_origin,self.owner getweaponammostock(self.fx_origin) + 1);
					self.explosivedrone lib_A739::deleteexplosivedrone();
					self delete();
					break;
				}

				wait 0.05;
			}
		}

		wait 0.05;
	}
}