/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42543.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 85
 * Decompile Time: 57 ms
 * Timestamp: 4/20/2022 8:23:49 PM
*******************************************************************/

//Function Number: 1
lib_A62F::main(param_00,param_01,param_02)
{
	precachemodel(param_00);
	lib_A59A::set_console_status();
	lib_A62F::func_8252(param_02);
	level._effect["pdrone_death_explosion"] = loadfx("vfx/explosion/vehicle_pdrone_explosion");
	level._effect["pdrone_large_death_explosion"] = loadfx("vfx/explosion/vehicle_pdrone_large_explosion");
	level._effect["pdrone_emp_death"] = loadfx("vfx/explosion/vehicle_pdrone_explosion");
	level._effect["emp_drone_damage"] = loadfx("vfx/sparks/emp_drone_damage");
	level._effect["ie_drone_thrusters_side"] = loadfx("vfx/map/irons_estate/ie_drone_thrusters_side");
	level._effect["ie_drone_thrusters"] = loadfx("vfx/map/irons_estate/ie_drone_thrusters");
	level._effect["ie_drone_eye_emissive"] = loadfx("vfx/map/irons_estate/ie_drone_eye_emissive");
	level._effect["ie_drone_eye_emissive_bootup"] = loadfx("vfx/map/irons_estate/ie_drone_eye_emissive_bootup");
	level._effect["drone_search_lt"] = loadfx("vfx/lights/drone_search_lt");
	level._effect["atlas_drone_shell"] = loadfx("vfx/shelleject/atlas_drone_shell");
	level._effect["atlas_drone_turret_flash"] = loadfx("vfx/muzzleflash/atlas_drone_turret_flash");
	level._effect["ie_drone_gun_lights"] = loadfx("vfx/map/irons_estate/ie_drone_gun_lights");
	level._effect["ie_drone_thrusters_side"] = loadfx("vfx/map/irons_estate/ie_drone_thrusters_side");
	level._effect["ie_drone_thrusters"] = loadfx("vfx/map/irons_estate/ie_drone_thrusters");
	level._effect["ie_drone_eye_emissive"] = loadfx("vfx/map/irons_estate/ie_drone_eye_emissive");
	level._effect["ie_drone_eye_emissive_bootup"] = loadfx("vfx/map/irons_estate/ie_drone_eye_emissive_bootup");
	level._effect["ie_drone_wash"] = loadfx("vfx/map/irons_estate/ie_drone_wash");
	level._effect["drone_search_lt"] = loadfx("vfx/lights/drone_search_lt");
	level._effect["drone_scan"] = loadfx("vfx/map/irons_estate/ie_drone_scan");
	level._effect["ie_drone_cam_distort"] = loadfx("vfx/map/irons_estate/ie_drone_cam_distort");
	level.var_7B71 = ["sdrone_weapon_fire","sdrone_weapon_fire_alt1","sdrone_weapon_fire_alt2"];
	level.var_7B70 = 0;
	var_03 = "pdrone_security";
	if(isdefined(param_01))
	{
		var_03 = param_01;
	}

	lib_A59E::func_186C(var_03,param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A62F::func_4D0D);
	lib_A59E::func_1849(undefined,undefined,0);
	lib_A59E::func_1846(0.4,0.8,1024);
	lib_A59E::func_1856(level.var_678B[param_02]["health"]);
	lib_A59E::func_186A("allies");
	lib_A59E::func_185A();
	var_04 = randomfloatrange(0,1);
	var_05 = param_02;
	lib_A59E::func_1855();
}

//Function Number: 2
lib_A62F::func_8252(param_00)
{
	if(!isdefined(level.var_678B))
	{
		level.var_678B = [];
	}

	if(isdefined(level.var_678B[param_00]))
	{
		return;
	}

	level.var_678B[param_00] = [];
	level.var_678B[param_00]["health"] = 800;
	level.var_678B[param_00]["axial_move"] = 1;
	level.var_678B[param_00]["hover_radius"] = 16;
	level.var_678B[param_00]["hover_speed"] = 8;
	level.var_678B[param_00]["hover_accel"] = 8;
	level.var_678B[param_00]["speed"] = 40;
	level.var_678B[param_00]["accel"] = 80;
	level.var_678B[param_00]["decel"] = 80;
	level.var_678B[param_00]["angle_vel_pitch"] = 1000;
	level.var_678B[param_00]["angle_vel_yaw"] = 2000;
	level.var_678B[param_00]["angle_vel_roll"] = 10;
	level.var_678B[param_00]["angle_accel"] = 1000;
	level.var_678B[param_00]["yaw_speed"] = 2000;
	level.var_678B[param_00]["yaw_accel"] = 2000;
	level.var_678B[param_00]["yaw_decel"] = 2000;
	level.var_678B[param_00]["yaw_over"] = 0;
	level.var_678B[param_00]["pitchmax"] = 5;
	level.var_678B[param_00]["rollmax"] = 5;
	level.var_678B[param_00]["weap_fire_tags"] = ["tag_muzzle_flash_lt","tag_muzzle_flash_rt"];
	level.var_678B[param_00]["clear_look"] = 0;
}

//Function Number: 3
lib_A62F::func_2E9C(param_00)
{
	return level.var_678B[self.classname][param_00];
}

//Function Number: 4
lib_A62F::func_4CC1(param_00,param_01,param_02)
{
	self veh_sethoverparams(lib_A62F::func_2E9C("hover_radius"),lib_A62F::func_2E9C("hover_speed"),lib_A62F::func_2E9C("hover_accel"));
	self veh_setmaxpitchroll(lib_A62F::func_2E9C("pitchmax"),lib_A62F::func_2E9C("rollmax"));
	var_03 = lib_A62F::func_2E9C("speed");
	var_04 = lib_A62F::func_2E9C("accel");
	var_05 = lib_A62F::func_2E9C("decel");
	if(isdefined(param_00))
	{
		var_03 = param_00;
	}

	if(isdefined(param_01))
	{
		var_04 = param_01;
	}

	if(isdefined(param_02))
	{
		var_05 = param_02;
	}

	self veh_setspeed(var_03,var_04,var_05);
	self method_84B1(lib_A62F::func_2E9C("angle_vel_pitch"),lib_A62F::func_2E9C("angle_vel_yaw"),lib_A62F::func_2E9C("angle_vel_roll"));
	self method_84B2(lib_A62F::func_2E9C("angle_accel"));
	self veh_neargoalnotifydist(5);
	self veh_setyawspeed(lib_A62F::func_2E9C("yaw_speed"),lib_A62F::func_2E9C("yaw_accel"),lib_A62F::func_2E9C("yaw_decel"),lib_A62F::func_2E9C("yaw_over"));
	self method_84E4(lib_A62F::func_2E9C("axial_move"));
}

//Function Number: 5
lib_A62F::func_4D0D()
{
	self endon("death");
	self.var_65A4 = distance(self gettagorigin("tag_origin"),self gettagorigin("tag_ground"));
	self.var_7953 = 0;
	self.var_2D2F = 1;
	self.var_9CDA = ::lib_A62F::func_4CC1;
	lib_A62F::func_4CC1();
	self veh_setweapon("pdrone_turret_security");
	if(self.var_7AE9 == "allies")
	{
		thread lib_A59E::func_9CFA("friendly");
		self.var_2161 = self setcontents(0);
	}
	else
	{
		thread lib_A59E::func_9CFA("hostile");
		self.var_4B9E = 1;
		self.delete_on_death = 1;
		thread lib_A62F::func_677F();
	}

	lib_A59A::func_32DC("sentient_controlled");
	lib_A59A::func_32DC("fire_disabled");
	self.var_6DAD = 0;
	self.var_2EA5 = 0;
	self.var_2E50 = 0;
	lib_A632::func_186D();
	waittillframeend;
	self.var_3068 = ::lib_A62F::func_6777;
	lib_A59A::func_749(::lib_A62F::func_6771);
	thread lib_A51A::monitordamage();
	if(self.var_7AE9 != "allies")
	{
		self enableaimassist();
		thread lib_A571::func_591C();
	}

	if(isdefined(self.script_parameters) && self.script_parameters == "diveboat_weapon_target")
	{
		function_009A(self,(0,0,0));
		function_00A6(self,level.var_31D);
	}
	else if(self.classname != "script_vehicle_pdrone_kva")
	{
		function_009A(self,(0,0,0));
		function_00A5(self,1);
	}

	thread lib_A62F::func_6760(0);
	thread lib_A62F::func_677C();
	self notify("stop_kicking_up_dust");
	thread lib_A62F::func_45D7();
}

//Function Number: 6
lib_A62F::func_45D7()
{
	self endon("death");
	var_00 = spawnstruct();
	var_00.var_6F1E = "pdrone_security";
	var_01 = ::lib_A630::func_8721;
	lib_A5DE::snd_message("snd_register_vehicle",var_00.var_6F1E,var_01);
	lib_A5DE::snd_message("snd_start_vehicle",var_00);
}

//Function Number: 7
lib_A62F::func_6760(param_00)
{
	self endon("death");
	self sentient_makeentitysentient(self.var_7AE9,param_00);
	self veh_setmaxpitchroll(lib_A62F::func_2E9C("pitchmax"),lib_A62F::func_2E9C("rollmax"));
	thread lib_A632::func_67B3();
	thread lib_A62F::func_678F();
}

//Function Number: 8
lib_A62F::func_678F()
{
	self endon("death");
	var_00 = undefined;
	var_01 = 0;
	while(isdefined(self))
	{
		var_02 = distancesquared(level.var_31D.var_2E6,self.var_2E6);
		var_03 = var_02 < 16384 && level.var_31D.var_2E6[2] > self.var_2E6[2];
		if(!var_01 && var_03)
		{
			var_00 = self setcontents(0);
			var_01 = 1;
			continue;
		}

		if(var_01 && !var_03)
		{
			self setcontents(var_00);
			var_01 = 0;
		}

		wait(0.05);
	}
}

//Function Number: 9
lib_A62F::func_677C()
{
	self endon("death");
	var_00 = 0.3;
	playfxontag(common_scripts\utility::getfx("ie_drone_eye_emissive"),self,"TAG_MAIN_CAMERA");
	playfxontag(common_scripts\utility::getfx("ie_drone_thrusters"),self,"TAG_EXHAUST_REAR");
	playfxontag(common_scripts\utility::getfx("ie_drone_thrusters_side"),self,"TAG_EXHAUST_LT");
	playfxontag(common_scripts\utility::getfx("ie_drone_thrusters_side"),self,"TAG_EXHAUST_RT");
	thread lib_A62F::func_2EB4("ie_drone_wash","ie_drone_cam_distort","TAG_ORIGIN",105);
}

//Function Number: 10
lib_A62F::func_2EB4(param_00,param_01,param_02,param_03)
{
	self endon("death");
	var_04 = param_03 * 3 * param_03 * 3;
	var_05 = ["",""];
	var_06 = ["",""];
	var_07 = [];
	for(var_08 = 0;var_08 < var_05.size;var_08++)
	{
		var_07[var_08] = common_scripts\utility::spawn_tag_origin();
		var_07[var_08].var_41 = (-90,0,0);
		var_07[var_08] thread lib_A62F::func_2EB5(self);
	}

	for(;;)
	{
		var_09 = self gettagorigin(param_02);
		var_0A = var_09 - (0,0,param_03);
		var_0B = bullettrace(var_09,var_0A,0,self,1);
		var_05[0] = "";
		var_05[1] = "";
		if(var_0B["fraction"] < 1)
		{
			var_05[0] = param_00;
			if(self == level.var_31D.var_1FE0 && distancesquared(var_09,level.var_31D geteye()) < var_04 && isdefined(level.var_31D.inwater) && isdefined(level.var_31D.underwater))
			{
				var_05[1] = param_01;
			}

			for(var_08 = 0;var_08 < var_05.size;var_08++)
			{
				var_07[var_08] unlink();
				var_07[var_08].var_2E6 = var_0B["position"];
				var_07[var_08] linkto(self);
			}
		}

		for(var_08 = 0;var_08 < var_05.size;var_08++)
		{
			if(var_05[var_08] != var_06[var_08])
			{
				if(var_06[var_08] != "")
				{
					stopfxontag(common_scripts\utility::getfx(var_06[var_08]),var_07[var_08],"tag_origin");
					var_06[var_08] = "";
				}

				if(var_05[var_08] != "")
				{
					playfxontag(common_scripts\utility::getfx(var_05[var_08]),var_07[var_08],"tag_origin");
					var_06[var_08] = var_05[var_08];
				}
			}
		}

		wait(0.25);
	}
}

//Function Number: 11
lib_A62F::func_2EB5(param_00)
{
	self notify("drone_security_thrust_fx_cleanup");
	self endon("drone_security_thrust_fx_cleanup");
	self endon("death");
	param_00 waittill("death");
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 12
lib_A62F::func_677D(param_00,param_01,param_02,param_03)
{
	return getnodesinradius(param_00,param_01,param_02,param_03,"Path","Exposed");
}

//Function Number: 13
lib_A62F::func_6763(param_00,param_01)
{
	param_01 = param_01 + vectornormalize(param_01 - param_00) * 32;
	param_00 = param_00 + (0,0,-24);
	param_01 = param_01 + (0,0,-24);
	var_02 = playerphysicstrace(param_00,param_01);
	var_03 = distancesquared(var_02,param_01) < 0.01;
	return var_03;
}

//Function Number: 14
lib_A62F::func_6765(param_00)
{
	var_01 = param_00 + (0,0,12);
	var_02 = playerphysicstrace(var_01,param_00);
	var_03 = distancesquared(var_02,param_00) < 0.01;
	return var_03;
}

//Function Number: 15
lib_A62F::func_6764(param_00)
{
	var_01 = self.owner geteye();
	var_02 = sighttracepassed(param_00,var_01,0,self);
	return var_02;
}

//Function Number: 16
lib_A62F::func_67B2(param_00)
{
	self notify("pdrone_targeting");
	self endon("pdrone_targeting");
	if(isdefined(self.owner))
	{
		self.owner endon("pdrone_returning");
	}

	self endon("death");
	self endon("emp_death");
	var_01 = "axis";
	if(self.var_7AE9 == "axis")
	{
		var_01 = "allies";
		if(isdefined(self.mgturret))
		{
			foreach(var_03 in self.mgturret)
			{
				var_03.var_7AE9 = "axis";
			}
		}
	}

	for(;;)
	{
		wait(0.05);
		if(self.var_7171 && isdefined(self.var_2EDD.var_9310))
		{
			thread lib_A62F::func_6778(self.var_2EDD.var_9310,param_00);
			self.var_2EDD.var_9310 common_scripts\utility::waittill_any("death","target_lost");
			continue;
		}

		if(lib_A62F::func_2E9C("clear_look"))
		{
			self veh_clearlookatent();
		}

		if(isdefined(self.owner))
		{
			self veh_settargetyaw(self.owner.var_41[1]);
		}
	}
}

//Function Number: 17
lib_A62F::func_19CD(param_00)
{
	var_01 = param_00.var_2E6 - self.var_2E6 * (1,1,0);
	var_01 = vectornormalize(var_01);
	var_01 = (var_01[1],var_01[0] * -1,0);
	var_02 = abs(vectordot(var_01,param_00 getvelocity()));
	var_02 = clamp(var_02,0,250) / 250;
	var_02 = 1 - var_02;
	var_02 = clamp(var_02,0.3,1);
	return var_02;
}

//Function Number: 18
lib_A62F::func_19D3(param_00)
{
	if(param_00 getstance() == "crouch")
	{
		return 0.75;
	}
	else if(param_00 getstance() == "prone")
	{
		return 0.5;
	}

	return 1;
}

//Function Number: 19
lib_A62F::func_19D0(param_00)
{
	if(level.var_31D lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		return 0.5;
	}

	return 1;
}

//Function Number: 20
lib_A62F::func_19C6(param_00,param_01)
{
	var_02 = self.var_2E6 - param_00.var_2E6;
	var_02 = var_02 * (1,1,0);
	var_02 = vectornormalize(var_02);
	if(isplayer(param_00))
	{
		param_01 = param_01 * lib_A62F::func_19CD(param_00);
		param_01 = param_01 * lib_A62F::func_19D3(param_00);
		param_01 = param_01 * lib_A62F::func_19D0(param_00);
	}

	var_03 = vectorcross((0,0,1),var_02);
	var_04 = var_03 * 10 / param_01 * randomfloatrange(-1,1);
	var_05 = (0,0,5) / param_01 * randomfloatrange(-1,1);
	return var_04 + var_05;
}

//Function Number: 21
lib_A62F::func_67AB()
{
	if(self.var_2E50)
	{
		return 0;
	}

	if(self.var_2EA5)
	{
		return 1;
	}

	return !lib_A62F::func_677A();
}

//Function Number: 22
lib_A62F::func_677A()
{
	var_00 = 2;
	if(!isdefined(level.var_2E4D))
	{
		level.var_2E4D = [];
	}

	level.var_2E4D = common_scripts\utility::array_removeundefined(level.var_2E4D);
	if(!common_scripts\utility::array_contains(level.var_2E4D,self))
	{
		level.var_2E4D = common_scripts\utility::array_add(level.var_2E4D,self);
	}

	for(var_01 = 0;var_01 < var_00;var_01++)
	{
		if(level.var_2E4D[var_01] == self)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 23
lib_A62F::func_6779()
{
	self.var_2E50 = 0;
	level.var_2E4D = common_scripts\utility::array_remove(level.var_2E4D,self);
}

//Function Number: 24
lib_A62F::func_6770()
{
	self.var_A2BA = level.var_7B70;
	level.var_7B70 = level.var_7B70 + 1;
	if(level.var_7B70 >= level.var_7B71.size)
	{
		level.var_7B70 = 0;
	}
}

//Function Number: 25
lib_A62F::func_6778(param_00,param_01)
{
	self notify("pdrone_fire_at_enemy");
	self endon("pdrone_fire_at_enemy");
	param_00 endon("death");
	self endon("death");
	self endon("emp_death");
	self endon("pdrone_targeting");
	if(isdefined(self.owner))
	{
		self.owner endon("pdrone_returning");
	}

	self notify("new_target");
	self endon("new_target");
	self.var_2E50 = 0;
	var_02 = param_00 geteye() - param_00.var_2E6;
	if(isdefined(param_00.inwater) && param_00.inwater)
	{
		var_03 = (0,0,var_02[2]);
	}
	else
	{
		var_03 = (0,0,var_03[2] / 2);
	}

	var_04 = 1;
	if(isdefined(self.var_E0D))
	{
		var_04 = self.var_E0D;
	}

	if(isplayer(param_00))
	{
		var_05 = 0.15 * var_04;
	}
	else
	{
		var_05 = 0.3 * var_05;
	}

	var_06 = 0.095;
	if(!isdefined(param_01))
	{
		param_01 = 0.25;
	}

	var_07 = param_01 - param_01 * 0.2;
	var_08 = param_01 + param_01 * 0.2;
	if(level.currentgen)
	{
		var_06 = 0.2499;
		var_07 = var_07 * 2.5;
		var_08 = var_08 * 2.5;
	}

	var_09 = var_03 + lib_A62F::func_19C6(param_00,var_05);
	if(!isdefined(self.var_379F))
	{
		self.var_379F = common_scripts\utility::spawn_tag_origin();
		self.var_379F thread lib_A62F::func_2E4B(self);
	}

	if(isdefined(self.var_379F))
	{
		self veh_setlookatent(self.var_379F);
	}
	else
	{
		self veh_setlookatent(param_00);
	}

	for(;;)
	{
		self veh_setturrettargetent(param_00,var_09);
		if(isdefined(self.var_379F))
		{
			self.var_379F unlink();
			self.var_379F.var_2E6 = param_00.var_2E6 + var_09;
			self.var_379F linkto(param_00);
		}

		if(lib_A62F::func_67AB())
		{
			wait(0.05);
			continue;
		}

		var_0A = self.var_2E6;
		var_0B = self.var_41;
		var_0C = lib_A62F::func_2E9C("weap_fire_tags");
		var_0D = var_0C[0];
		if(self method_8442(var_0D) != -1)
		{
			var_0B = self gettagangles(var_0D);
			var_0A = self gettagorigin(var_0D);
		}

		if(lib_A62F::func_676E(var_0A,param_00.var_2E6 + var_09) || !isdefined(self.var_2EDD.var_9310) || self.var_2EDD.var_9310 != param_00)
		{
			param_00 notify("target_lost");
			return;
		}

		var_0E = randomfloatrange(2,3);
		var_09 = var_03 + lib_A62F::func_19C6(param_00,var_05);
		while(var_0E > 0)
		{
			if(lib_A62F::func_67AB())
			{
				var_0E = randomfloatrange(2,3);
				wait(0.05);
				continue;
			}

			lib_A62F::func_6770();
			var_0F = randomfloatrange(var_07,var_08);
			var_10 = min(var_0F,var_0E);
			while(var_10 > 0)
			{
				if(lib_A62F::func_67AB())
				{
					var_10 = min(var_0F,var_0E);
					var_0E = randomfloatrange(2,3);
					wait(var_06);
					lib_A62F::func_6779();
					continue;
				}

				self.var_2E50 = 1;
				var_0A = self.var_2E6;
				var_0B = self.var_41;
				if(self method_8442(var_0D) != -1)
				{
					var_0B = self gettagangles(var_0D);
					var_0A = self gettagorigin(var_0D);
				}

				var_11 = var_0A;
				var_12 = lib_A62F::func_20D8(var_11,var_0B,param_00.var_2E6 + var_09,10);
				if(lib_A62F::func_676E(var_11,var_11 + var_12 * 10000))
				{
					param_00 notify("target_lost");
					return;
				}

				lib_A62F::func_677B();
				var_0E = var_0E - var_06;
				var_10 = var_10 - var_06;
				wait(var_06);
			}

			lib_A62F::func_6779();
			var_13 = randomfloatrange(0.5,1);
			var_13 = min(var_13,var_0E);
			if(var_13 > 0)
			{
				var_0E = var_0E - var_13;
				wait(var_13);
			}
		}
	}
}

//Function Number: 26
lib_A62F::func_2E4B(param_00)
{
	param_00 waittill("death");
	self delete();
}

//Function Number: 27
lib_A62F::func_677B()
{
	var_00 = lib_A62F::func_2E9C("weap_fire_tags");
	lib_A5F1::snd_play_linked(level.var_7B71[self.var_A2BA]);
	lib_A62F::func_677E();
	foreach(var_02 in var_00)
	{
		self veh_fireweapon(var_02);
		self.var_8434 = 1;
	}
}

//Function Number: 28
lib_A62F::func_677E()
{
	if(!isdefined(self.var_555E) || gettime() - self.var_555E > 1000)
	{
		self.var_555E = gettime();
		var_00 = function_00D6(self.inliveplayerkillstreak);
		foreach(var_02 in var_00)
		{
			if(distancesquared(var_02.var_2E6,self.var_2E6) < 640000)
			{
				var_02 notify("gunshot_teammate",self.var_2E6);
			}
		}
	}
}

//Function Number: 29
lib_A62F::func_20D8(param_00,param_01,param_02,param_03)
{
	var_04 = vectortoangles(param_02 - param_00);
	var_05 = lib_A62F::func_0BA2(param_01,var_04);
	var_05 = (clamp(var_05[0],0 - param_03,param_03),clamp(var_05[1],0 - param_03,param_03),0);
	param_01 = lib_A62F::func_0BA2(param_01,var_05);
	var_06 = anglestoforward(param_01);
	return var_06;
}

//Function Number: 30
lib_A62F::func_0BA2(param_00,param_01)
{
	return (angleclamp180(param_00[0] - param_01[0]),angleclamp180(param_00[1] - param_01[1]),angleclamp180(param_00[2] - param_01[2]));
}

//Function Number: 31
lib_A62F::func_676E(param_00,param_01)
{
	if(self.var_7AE9 == "axis")
	{
		return 0;
	}

	return lib_A59A::func_8436(param_00,param_01);
}

//Function Number: 32
lib_A62F::func_6771(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(isdefined(param_01) && isdefined(param_01.var_7AE9) && self.var_7AE9 == param_01.var_7AE9)
	{
		return;
	}

	if(param_04 == "MOD_ENERGY")
	{
		self dodamage(param_00 * 4,param_01.var_2E6,param_01);
		return;
	}

	if(isalive(self) && isdefined(param_01) && !isplayer(param_01))
	{
		self.health = int(min(self.var_275,self.health + param_00 * 0.7));
	}
}

//Function Number: 33
lib_A62F::func_68B1()
{
	playfx(common_scripts\utility::getfx("pdrone_death_explosion"),self gettagorigin("tag_origin"));
	lib_A5DE::snd_message("pdrone_death_explode");
	lib_A62F::func_6787();
}

//Function Number: 34
lib_A62F::func_6787()
{
	var_00 = self gettagorigin("tag_origin");
	var_01 = function_00D6("axis","allies","neutral");
	var_01 = common_scripts\utility::get_array_of_closest(var_00,var_01,undefined,undefined,1500,undefined);
	var_01 = lib_A59A::func_CFF(var_01);
	if(isdefined(var_01) && var_01.size > 0)
	{
		foreach(var_03 in var_01)
		{
			var_03 notify("explode",var_00);
		}
	}
}

//Function Number: 35
lib_A62F::func_677F()
{
	self waittill("death",var_00);
	if(!isdefined(self))
	{
		return;
	}

	setdvarifuninitialized("drone_spin_death_chance",0.85);
	if(self.var_7AE9 != "allies" && !isdefined(self.owner) && randomfloat(1) <= getdvarfloat("drone_spin_death_chance"))
	{
		thread lib_A62F::func_2646(var_00);
		return;
	}

	lib_A62F::func_68B1();
}

//Function Number: 36
lib_A62F::func_6777()
{
	self endon("death");
	self endon("in_air_explosion");
	self notify("emp_death");
	self.var_9D43 = 1;
	var_00 = self veh_getvelocity();
	var_01 = 60;
	if(isdefined(level.var_3E19))
	{
		var_02 = [[ level.var_3E19 ]]();
	}
	else
	{
		var_03 = (self.var_2E6[0] + var_01[0] * 10,self.var_2E6[1] + var_01[1] * 10,self.var_2E6[2] - 2000);
		var_02 = physicstrace(self.var_2E6,var_03);
	}

	self notify("newpath");
	self notify("deathspin");
	thread lib_A62F::func_2E3B();
	var_04 = 60;
	self veh_setspeed(var_04,60,1000);
	self veh_neargoalnotifydist(var_01);
	self veh_setgoalpos(var_02,0);
	thread lib_A62F::func_2E43(var_02,var_01,var_04);
	common_scripts\utility::waittill_any("goal","near_goal");
	self notify("stop_crash_loop_sound");
	self notify("crash_done");
	lib_A62F::func_68B1();
	self delete();
}

//Function Number: 37
lib_A62F::func_2E3B()
{
	level.var_78AE["pdrone_dummy"] = #animtree;
	level.var_78A9["pdrone_dummy"]["roll_left"][0] = %rotate_x_l;
	level.var_78A9["pdrone_dummy"]["roll_right"][0] = %rotate_x_r;
	var_00 = spawn("script_model",self.var_2E6);
	var_00.var_41 = self.var_41;
	var_00 linkto(self);
	if(isdefined(self.var_2644))
	{
		var_00 setmodel(self.var_2644);
	}
	else
	{
		var_00 setmodel(self.model);
	}

	self hide();
	stopfxontag(common_scripts\utility::getfx("drone_beacon_red"),self,"tag_origin");
	playfxontag(common_scripts\utility::getfx("emp_drone_damage"),var_00,"TAG_ORIGIN");
	var_00.animname = "pdrone_dummy";
	var_00 lib_A59A::func_D61();
	if(common_scripts\utility::cointoss())
	{
		var_01 = "roll_left";
	}
	else
	{
		var_01 = "roll_right";
	}

	var_00 thread lib_A506::func_BE1(var_00,var_01);
	self waittill("death");
	var_00 delete();
}

//Function Number: 38
lib_A62F::func_2E43(param_00,param_01,param_02)
{
	self endon("crash_done");
	self veh_clearlookatent();
	self veh_setmaxpitchroll(180,180);
	self veh_setyawspeed(400,100,100);
	self veh_setturningability(1);
	var_03 = 1400;
	var_04 = 800;
	var_05 = undefined;
	var_06 = 90 * randomintrange(-2,3);
	for(;;)
	{
		if(!isdefined(self))
		{
			break;
		}

		if(self.var_2E6[2] < param_00[2] + param_01)
		{
			self notify("near_goal");
		}

		if(common_scripts\utility::cointoss())
		{
			var_05 = self.var_41[1] - 300;
			self veh_setyawspeed(var_03,var_04);
			self veh_settargetyaw(var_05);
			self veh_settargetyaw(var_05);
		}

		wait(0.05);
	}
}

//Function Number: 39
lib_A62F::func_2646(param_00)
{
	var_01 = spawn("script_model",self.var_2E6);
	var_01.var_41 = self.var_41;
	if(isdefined(self.var_2644))
	{
		var_01 setmodel(self.var_2644);
	}
	else
	{
		var_01 setmodel(self.model);
	}

	var_01 setcontents(0);
	self setcontents(0);
	self hide();
	playfxontag(common_scripts\utility::getfx("emp_drone_damage"),var_01,"TAG_ORIGIN");
	lib_A5DE::snd_message("pdrone_emp_death",var_01);
	playfxontag(common_scripts\utility::getfx("ie_drone_thrusters"),var_01,"TAG_EXHAUST_REAR");
	playfxontag(common_scripts\utility::getfx("ie_drone_thrusters_side"),var_01,"TAG_EXHAUST_LT");
	playfxontag(common_scripts\utility::getfx("ie_drone_thrusters_side"),var_01,"TAG_EXHAUST_RT");
	var_02 = (self.var_2E6[0],self.var_2E6[1],self.var_2E6[2] - 500);
	var_03 = physicstrace(self.var_2E6,var_02);
	var_04 = 0;
	var_05 = param_00.var_2E6 - var_01.var_2E6;
	var_05 = vectornormalize(var_05);
	var_06 = vectorcross((0,0,1),var_05);
	var_06 = vectornormalize(var_06);
	var_07 = 100;
	var_08 = var_01.var_2E6 + var_06 * var_07;
	var_09 = vectortoangles(var_01.var_2E6 - var_08);
	var_0A = 1;
	if(common_scripts\utility::cointoss())
	{
		var_0A = -1;
	}

	var_0B = 5;
	var_0C = 25;
	var_0D = 0;
	var_0E = var_0B;
	if(common_scripts\utility::cointoss())
	{
		var_0E = randomfloatrange(0,1);
	}

	var_0F = -2;
	var_10 = var_0E + 1;
	var_11 = 0;
	var_12 = 0;
	while(var_04 < var_0B)
	{
		wait(0.05);
		var_04 = var_04 + 0.05;
		if(!var_12 && var_10 < var_0B && var_04 >= var_10)
		{
			playfxontag(common_scripts\utility::getfx("emp_drone_damage"),var_01,"TAG_ORIGIN");
			lib_A5DE::snd_message("pdrone_emp_death",var_01);
			stopfxontag(common_scripts\utility::getfx("ie_drone_eye_emissive"),var_01,"TAG_MAIN_CAMERA");
			var_12 = 1;
		}

		if(var_04 >= var_0E && var_04 < var_10)
		{
			if(!var_11)
			{
				playfxontag(common_scripts\utility::getfx("ie_drone_eye_emissive"),var_01,"TAG_MAIN_CAMERA");
				var_11 = 1;
			}

			var_0F = var_0F + 0.5;
			var_0D = clamp(var_0D - 2.5,var_0C * -1,var_0C);
		}
		else
		{
			var_0F = var_0F - 0.5;
			var_0D = clamp(var_0D + 2.5,var_0C * -1,var_0C);
		}

		var_09 = var_09 + (0,abs(var_0D) * 0.4,0) * var_0A;
		var_08 = var_08 + (0,0,var_0F);
		var_13 = var_08 + anglestoforward(var_09) * var_07;
		var_14 = physicstrace(var_01.var_2E6,var_13,var_01);
		var_01.var_2E6 = var_13;
		var_01.var_41 = var_01.var_41 + (0,var_0D,0) * var_0A;
		var_01.var_41 = (var_01.var_41[0],var_01.var_41[1],cos(var_04) * 10);
		var_15 = length(var_03 - var_01.var_2E6);
		if(var_15 < 60 || var_01.var_2E6[2] < var_03[2] + 15 || var_14 != var_13)
		{
			break;
		}
	}

	playfx(common_scripts\utility::getfx("pdrone_death_explosion"),var_01.var_2E6);
	lib_A5DE::snd_message("pdrone_crash_land",var_01.var_2E6);
	var_01 lib_A62F::func_6787();
	var_01 delete();
}

//Function Number: 40
lib_A62F::func_28C2()
{
	self endon("death");
	for(;;)
	{
		if(getdvar("debug_nuke") == "on")
		{
			self dodamage(self.health + 99999,(0,0,-500),level.var_31D);
		}

		wait(0.05);
	}
}

//Function Number: 41
lib_A62F::func_3926(param_00)
{
	self notify("pdrone_flying_attack_drone_logic");
	self endon("pdrone_flying_attack_drone_logic");
	self endon("death");
	param_00 = self;
	param_00 childthread lib_A62F::func_3922();
	param_00 thread lib_A62F::func_3924();
	setdvarifuninitialized("drone_attack_delay",1);
	setdvarifuninitialized("drone_attack_accuracy",10);
	setdvarifuninitialized("drone_attack_sight_required",0);
	param_00.var_E11 = getdvarfloat("drone_attack_delay");
	param_00.var_E0D = getdvarfloat("drone_attack_accuracy");
	param_00.var_E26 = getdvarint("drone_attack_sight_required");
	lib_A62F::func_4CC1();
	if(isdefined(param_00.target))
	{
		param_00 waittill("reached_dynamic_path_end");
	}

	if(!isdefined(level.var_31D.var_2E26))
	{
		level.var_31D thread lib_A62F::func_6A5D();
	}

	param_00 childthread lib_A62F::func_3925();
}

//Function Number: 42
lib_A62F::func_6A5D()
{
	self notify("player_attack_nodes_update");
	self endon("player_attack_nodes_update");
	self endon("death");
	self.var_2E26 = [];
	for(;;)
	{
		var_00 = 0;
		if(isdefined(level.var_716))
		{
			foreach(var_02 in level.var_716)
			{
				if(isdefined(var_02) && var_02.var_5D32 == "attack")
				{
					var_00 = 1;
					break;
				}
			}
		}

		if(!var_00)
		{
			self.var_2E26 = undefined;
			self notify("player_attack_nodes_update");
			return;
		}

		var_04 = [];
		var_05 = level.var_31D.var_2E6;
		var_06 = level.var_31D method_8387();
		if(!isdefined(var_06))
		{
			wait(0.05);
			continue;
		}

		var_07 = lib_A62F::func_677D(var_05,800,300,512);
		var_08 = 0;
		foreach(var_0A in var_07)
		{
			if(!function_01FF(var_06,var_0A))
			{
				continue;
			}

			if(var_08 >= 3)
			{
				wait(0.05);
				var_08 = 0;
			}

			var_08++;
			if(!lib_A62F::func_2EE8(var_0A))
			{
				continue;
			}

			var_04[var_04.size] = var_0A;
		}

		self.var_2E26 = var_04;
		wait(1);
	}
}

//Function Number: 43
lib_A62F::func_2EEF()
{
	self.var_2EA5 = 1;
	self waittill("goal");
	self.var_2EA5 = 0;
}

//Function Number: 44
lib_A62F::func_2E93()
{
	var_00 = cos(3);
	for(;;)
	{
		if(isalive(level.var_31D))
		{
			var_01 = vectornormalize(self gettagorigin("tag_origin") - level.var_31D geteye());
			var_02 = anglestoforward(level.var_31D getplayerangles());
			if(vectordot(var_01,var_02) > var_00)
			{
				self notify("aimed_at");
			}
		}

		wait(0.25);
	}
}

//Function Number: 45
lib_A62F::func_3925()
{
	self notify("flying_attack_drone_goal_update");
	self endon("flying_attack_drone_goal_update");
	self endon("death");
	childthread lib_A62F::func_2E93();
	for(;;)
	{
		var_00 = common_scripts\utility::waittill_any_timeout(randomfloatrange(1,2),"aimed_at");
		var_01 = self gettagorigin("tag_origin");
		var_02 = self gettagangles("tag_origin");
		var_03 = var_01;
		if(common_scripts\utility::cointoss())
		{
			var_03 = var_03 + anglestoright(var_02) * 200;
		}
		else
		{
			var_03 = var_03 + anglestoright(var_02) * -200;
		}

		if(isdefined(level.var_31D.var_2E26) && level.var_31D.var_2E26.size > 0)
		{
			if(!isdefined(self.var_1E1F))
			{
				var_04 = sortbydistance(level.var_31D.var_2E26,var_03);
				foreach(var_06 in var_04)
				{
					if(lib_A62F::func_2E99(var_06))
					{
						continue;
					}

					lib_A62F::func_2E2C(var_06);
					break;
				}

				if(isdefined(self.var_1E1F))
				{
					var_08 = self.var_1E1F.var_2E6;
					var_09 = var_08[2] + 100;
					lib_A62F::func_4CC1(100,200,200);
					if(isdefined(self.var_6F33))
					{
						self veh_setgoalyaw(vectortoyaw(var_08 - var_01));
						self veh_setgoalpos((self.var_2E6[0],self.var_2E6[1],max(var_09 + 500,var_01[2])),1);
						lib_A62F::func_2EEF();
						self veh_setgoalyaw(vectortoyaw(var_08 - var_01));
						self veh_setgoalpos((var_08[0],var_08[1],max(var_09 + 500,var_01[2])),1);
						lib_A62F::func_2EEF();
					}

					self veh_setgoalyaw(vectortoyaw(var_08 - var_01));
					self veh_setgoalpos((var_08[0],var_08[1],max(var_09,var_01[2])),1);
					lib_A62F::func_2EEF();
					lib_A62F::func_4CC1();
					self veh_setgoalpos((var_08[0],var_08[1],var_09),1);
					lib_A62F::func_2EEF();
					self.var_7171 = 1;
				}
			}

			var_0A = sortbydistance(level.var_31D.var_2E26,var_03);
			var_0B = self.var_1E1F;
			var_0C = var_01[2];
			var_0D = 0;
			foreach(var_06 in var_0A)
			{
				if(isdefined(self.var_1E1F) && var_06 == self.var_1E1F)
				{
					continue;
				}

				if(lib_A62F::func_2E99(var_06))
				{
					continue;
				}

				if(!isdefined(self.var_1E1F))
				{
					var_0B = var_06;
					break;
				}

				wait(0.05);
				var_0F = level.var_31D.var_2E6[2] + 100;
				var_10 = lib_A62F::func_2EE9(self.var_1E1F,var_01[2],var_06,var_0F);
				if(var_10)
				{
					var_0D = var_0D + 1;
				}
				else
				{
					wait(0.05);
					var_10 = lib_A62F::func_2EE9(self.var_1E1F,var_01[2],var_06,undefined);
					if(var_10)
					{
						var_0D = var_0D + 1;
						var_0F = var_06.var_2E6[2] + 100;
					}
				}

				if(var_10 && randomfloat(1) <= 1 / var_0D)
				{
					var_0B = var_06;
					var_0C = var_0F;
					if(var_0D >= 5 || var_00 == "aimed_at")
					{
						break;
					}
				}
			}

			if(isdefined(var_0B) && !isdefined(self.var_1E1F) || var_0B != self.var_1E1F)
			{
				while(self.var_2E50)
				{
					wait(0.05);
				}

				if(lib_A62F::func_2E99(var_0B))
				{
					continue;
				}

				lib_A62F::func_2E2C(var_0B);
				lib_A62F::func_4CC1();
				self veh_setmaxpitchroll(80,lib_A62F::func_2E9C("rollmax"));
				self veh_setgoalpos((var_0B.var_2E6[0],var_0B.var_2E6[1],var_0C),1);
				lib_A62F::func_2EEF();
				self.var_7171 = 1;
				self veh_setspeedimmediate(0.05,0.05,0.05);
			}
		}
	}
}

//Function Number: 46
lib_A62F::func_3922()
{
	self endon("death");
	self.damagetaken = 0;
	self.var_51C5 = 0;
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04);
		if(!isdefined(var_01) || !isplayer(var_01))
		{
			continue;
		}

		self notify("flying_attack_drone_damaged_by_player");
		thread lib_A62F::func_3923();
	}
}

//Function Number: 47
lib_A62F::func_3923()
{
	self notify("taking damage");
	self endon("taking damage");
	self endon("death");
	self.var_51C5 = 1;
	wait(1);
	self.var_51C5 = 0;
}

//Function Number: 48
lib_A62F::func_3924()
{
	if(!isdefined(level.flying_attack_drones))
	{
		level.flying_attack_drones = [];
	}

	level.flying_attack_drones = common_scripts\utility::array_add(level.flying_attack_drones,self);
	common_scripts\utility::waittill_any("death","pdrone_flying_attack_drone_logic");
	level.flying_attack_drones = common_scripts\utility::array_remove(level.flying_attack_drones,self);
	level notify("flying_attack_drone_destroyed");
}

//Function Number: 49
lib_A62F::func_2E77(param_00,param_01,param_02)
{
	if((!isdefined(param_02) && !isdefined(level.var_2F2C)) || level.var_2F2C.size == 0)
	{
		return 0;
	}

	var_03 = lib_A62F::func_677D(param_00 + (0,0,-512),1000,0,1024);
	if(var_03.size == 0)
	{
		return 0;
	}

	var_03 = sortbydistance(var_03,param_00);
	var_04 = param_00;
	param_00 = var_03[0].var_2E6;
	var_05 = 0;
	if(!isdefined(param_01))
	{
		foreach(var_07 in level.var_2E7A)
		{
			if(distancesquared(var_03[0].var_2E6,var_07) < 1000000)
			{
				var_05 = 1;
			}
		}
	}

	if(var_05)
	{
		return 0;
	}

	var_09 = param_02;
	if(!isdefined(var_09))
	{
		level.var_2F2C = sortbydistance(level.var_2F2C,param_00);
		var_0A = anglestoforward(level.var_31D getplayerangles());
		var_0B = cos(60);
		var_09 = level.var_2F2C[0];
		foreach(param_02 in level.var_2F2C)
		{
			var_0D = vectornormalize(param_02.var_2E6 - level.var_31D.var_2E6);
			if(vectordot(var_0D,var_0A) > var_0B)
			{
				continue;
			}

			var_09 = param_02;
			break;
		}
	}

	var_0F = lib_A62F::func_2EC1(var_09);
	var_10 = 0;
	var_11 = 0;
	for(var_12 = 0;var_12 < var_03.size;var_12++)
	{
		if(var_11 >= 100)
		{
			return 0;
		}

		if(!function_01FF(var_03[var_12],var_03[0]))
		{
			continue;
		}

		var_10 = lib_A62F::func_2EE8(var_03[var_12]);
		if(!sighttracepassed(var_04 + (0,0,50),var_03[var_12].var_2E6 + (0,0,100),0,undefined,undefined,0))
		{
			var_10 = 0;
		}

		if(var_10)
		{
			break;
		}
		else
		{
		}

		var_11++;
		wait(0.05);
	}

	if(var_10)
	{
		var_13 = var_09;
		if(level.var_2F2B.size > 0)
		{
			level.var_2F2B = sortbydistance(level.var_2F2B,param_00);
			var_13 = level.var_2F2B[0];
		}

		level thread lib_A62F::func_2E6C(var_09,var_13,var_03[var_12],var_0F,var_04,param_01);
	}

	return var_10;
}

//Function Number: 50
lib_A62F::func_2EC1(param_00)
{
	if(isdefined(param_00.script_parameters))
	{
		var_01 = int(param_00.script_parameters);
		if(var_01 != 0)
		{
			return var_01;
		}
	}

	return max(param_00.var_2E6[2],1500);
}

//Function Number: 51
lib_A62F::func_2EE8(param_00)
{
	var_01 = param_00.var_2E6;
	var_02 = var_01 + (0,0,10);
	var_03 = (var_01[0],var_01[1],param_00.var_2E6[2] + 10000);
	var_04 = playerphysicstrace(var_02,var_03,level.var_31D);
	var_05 = distancesquared(var_04,var_03) < 0.01;
	return var_05;
}

//Function Number: 52
lib_A62F::func_2EE9(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(!isdefined(param_02))
	{
		return 0;
	}

	if(!isdefined(param_01))
	{
		param_01 = param_00.var_2E6[2] + 100;
	}

	if(!isdefined(param_03))
	{
		param_03 = param_02.var_2E6[2] + 100;
	}

	if(param_03 < param_02.var_2E6[2] + 50)
	{
		return 0;
	}

	var_04 = (param_00.var_2E6[0],param_00.var_2E6[1],param_01);
	var_05 = (param_00.var_2E6[0],param_00.var_2E6[1],param_03);
	var_06 = playerphysicstrace(var_04,var_05,self);
	if(distancesquared(var_05,var_06) < 0.01)
	{
		var_04 = (param_00.var_2E6[0],param_00.var_2E6[1],param_03);
		var_05 = (param_02.var_2E6[0],param_02.var_2E6[1],param_03);
		var_06 = playerphysicstrace(var_04,var_05,self);
		return distancesquared(var_05,var_06) < 0.01;
	}

	return 0;
}

//Function Number: 53
lib_A62F::func_2E6C(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A62F::func_2EBD(param_00,"patrol");
	var_06 childthread lib_A62F::func_2E74(param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 54
lib_A62F::func_2E74(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = self;
	var_06 = param_01.var_2E6;
	level.var_2E7A[level.var_2E7A.size] = var_06;
	var_05 endon("death");
	var_05 notify("drone_investigate");
	var_05 endon("drone_investigate");
	var_05 lib_A62F::func_2E1B();
	level notify("drone_investigate_start",var_05);
	level.var_EE5 = 1;
	var_07 = var_05.var_2E6;
	var_08 = (0,0,100);
	var_09 = var_06 + var_08;
	var_05 thread lib_A62F::func_2E6D(var_06);
	var_05 thread lib_A62F::func_2E71();
	var_05 childthread lib_A62F::func_2E6E(param_01,var_07,param_02,param_03);
	var_05 lib_A62F::func_4CC1();
	var_05 veh_setgoalyaw(vectortoyaw(var_06 - var_07));
	var_05 veh_setgoalpos((var_07[0],var_07[1],param_02),1);
	var_05 lib_A62F::func_2EEF();
	var_05 lib_A62F::func_4CC1(100,200,200);
	var_05 veh_setgoalyaw(vectortoyaw(var_06 - var_07));
	var_05 veh_setgoalpos((var_09[0],var_09[1],param_02),1);
	var_05 lib_A62F::func_2EEF();
	var_05 lib_A62F::func_4CC1();
	if(isdefined(param_04))
	{
		var_05 thread lib_A62F::func_2E73(param_01,param_04[2],param_04,1);
	}
	else
	{
		var_05 thread lib_A62F::func_2E73(param_01,param_03[2] + 100);
	}

	var_05 waittill("drone_investigate_spot_finished");
	for(var_0A = 0;var_0A < min(var_05.var_4FA0.size,2);var_0A++)
	{
		if(isdefined(param_04))
		{
			var_05 thread lib_A62F::func_2E73(var_05.var_4FA0[var_0A],param_04[2],param_04,1);
		}
		else
		{
			var_05 thread lib_A62F::func_2E73(var_05.var_4FA0[var_0A]);
		}

		var_05 waittill("drone_investigate_spot_finished");
	}

	var_05 lib_A62F::func_2EA7(param_00,self.var_6F33);
}

//Function Number: 55
lib_A62F::func_2EA7(param_00,param_01)
{
	var_02 = self;
	var_02 notify("drone_return_home");
	var_02 endon("drone_return_home");
	var_02 endon("death");
	var_02 lib_A62F::func_2EB7("patrol",0);
	if(!isdefined(param_00))
	{
		if(level.var_2F2B.size > 0)
		{
			level.var_2F2B = sortbydistance(level.var_2F2B,var_02.var_2E6);
			param_00 = level.var_2F2B[0];
		}
	}

	if(!isdefined(param_00) && !isdefined(param_01))
	{
		return;
	}

	var_03 = param_00.var_2E6;
	if(isdefined(param_01))
	{
		var_03 = param_01.var_2E6;
	}

	var_02 notify("drone_investigate_cleanup");
	var_04 = lib_A62F::func_2EC1(param_00);
	var_02 veh_setgoalyaw(vectortoyaw(param_00.var_2E6 - var_02.var_2E6));
	var_02 veh_setgoalpos((var_02.var_2E6[0],var_02.var_2E6[1],var_04),1);
	var_02 lib_A62F::func_2EEF();
	level.var_EE5 = 0;
	var_02 lib_A62F::func_4CC1(100,200,200);
	var_02 veh_setgoalyaw(vectortoyaw(var_03 - var_02.var_2E6));
	var_02 veh_setgoalpos((var_03[0],var_03[1],var_04),1);
	var_02 lib_A62F::func_2EEF();
	if(isdefined(param_01))
	{
		var_02 thread lib_A5A0::func_9D10(param_01);
		return;
	}

	if(isdefined(self.var_90DB))
	{
		var_02 lib_A591::func_90BE(0);
	}

	var_02 veh_setgoalpos(param_00.var_2E6,1);
	var_02 lib_A62F::func_2EEF();
	var_02 delete();
}

//Function Number: 56
lib_A62F::func_2E6E(param_00,param_01,param_02,param_03)
{
	var_04 = 400;
	var_05 = 40000;
	var_06 = lib_A62F::func_677D(param_00.var_2E6,var_04,0,512);
	var_07 = [];
	foreach(var_09 in var_06)
	{
		if(lib_A62F::func_2E99(var_09))
		{
			continue;
		}

		if(!function_01FF(var_09,param_00))
		{
			continue;
		}

		if(distancesquared(var_09.var_2E6,param_00.var_2E6) < var_05)
		{
			continue;
		}

		var_0A = 0;
		foreach(var_0C in var_07)
		{
			if(distancesquared(var_09.var_2E6,var_0C.var_2E6) < var_05)
			{
				var_0A = 1;
				break;
			}
		}

		if(var_0A)
		{
			continue;
		}

		wait(0.05);
		if(lib_A62F::func_2EE8(var_09))
		{
			var_07[var_07.size] = var_09;
		}
	}

	var_0F = common_scripts\utility::array_randomize(var_07);
	var_10 = [];
	foreach(var_09 in var_0F)
	{
		if(var_10.size == 0 && lib_A62F::func_2EE9(param_00,param_03[2] + 100,var_09,undefined))
		{
			var_10[var_10.size] = var_09;
		}
		else if(var_10.size > 0 && lib_A62F::func_2EE9(var_10[var_10.size - 1],undefined,var_09,undefined))
		{
			var_10[var_10.size] = var_09;
		}

		wait(0.05);
	}

	self.var_4FA0 = var_10;
}

//Function Number: 57
lib_A62F::func_2E99(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(!isdefined(param_00.var_1E1E))
	{
		return 0;
	}

	if(param_00.var_1E1E == self)
	{
		return 0;
	}

	return 1;
}

//Function Number: 58
lib_A62F::func_2E2C(param_00)
{
	if(isdefined(self.var_1E1F))
	{
		self.var_1E1F.var_1E1E = undefined;
		self.var_1E1F = undefined;
	}

	if(isdefined(param_00))
	{
		if(isdefined(param_00.var_1E1E) && param_00.var_1E1E != self)
		{
			param_00.var_1E1E notify("node_kicked");
			param_00.var_1E1E lib_A62F::func_2E2C(undefined);
		}

		self.var_1E1F = param_00;
		param_00.var_1E1E = self;
	}
}

//Function Number: 59
lib_A62F::func_2E73(param_00,param_01,param_02,param_03)
{
	self notify("drone_investigate_spot");
	self endon("drone_investigate_spot");
	self endon("drone_investigate");
	self endon("death");
	lib_A62F::func_2E2C(param_00);
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(!isdefined(param_01))
	{
		param_01 = param_00.var_2E6[2] + 100;
	}

	var_04 = (param_00.var_2E6[0],param_00.var_2E6[1],param_01);
	self.var_9E78 = undefined;
	lib_A62F::func_4CC1();
	self veh_cleargoalyaw();
	if(isdefined(param_02))
	{
		lib_A62F::func_2EAE(1);
		self veh_settargetyaw(vectortoyaw(param_02 - self.var_2E6));
	}
	else
	{
		lib_A62F::func_2EAE(0);
		self veh_settargetyaw(vectortoyaw(var_04 - self.var_2E6));
	}

	self veh_setgoalpos(var_04,1);
	var_05 = "timeout";
	while(var_05 == "timeout")
	{
		if(isdefined(param_02))
		{
			self veh_settargetyaw(vectortoyaw(param_02 - self.var_2E6));
		}

		var_05 = common_scripts\utility::waittill_any_timeout(0.05,"goal");
	}

	self.var_7171 = 1;
	self veh_setspeedimmediate(0.05,0.05,0.05);
	var_06 = self.var_41[1];
	var_07 = 1;
	while(var_07)
	{
		var_07 = 0;
		for(var_08 = 0;var_08 < 4;var_08++)
		{
			var_09 = 2;
			self.var_7857 = 0;
			var_0A = 0;
			while(var_09 > 0)
			{
				var_0B = var_06 + var_08 * 90;
				if(isdefined(param_02))
				{
					var_0B = vectortoyaw(param_02 - self.var_2E6);
				}

				var_0C = lib_A62F::func_2E79(var_0B);
				if(var_0C > 0)
				{
					var_0A = var_0A + 0.05;
					var_09 = 2;
				}

				if(var_0A > 0.5)
				{
					var_07 = 1;
					if(var_0C > 250)
					{
						childthread lib_A62F::func_2E78(param_00);
					}
				}

				var_09 = var_09 - 0.05;
				self.var_7857 = self.var_7857 + 0.05;
				wait(0.05);
			}

			if(!param_03)
			{
				param_02 = undefined;
			}
		}
	}

	lib_A62F::func_4CC1();
	self.var_7857 = 0;
	if(isdefined(self.var_4F9F) && self.var_4F9F.size > 0)
	{
		var_0D = self.var_4F9F[self.var_4F9F.size - 1];
		self.var_4F9F[self.var_4F9F.size - 1] = undefined;
		thread lib_A62F::func_2E73(var_0D);
		return;
	}

	self veh_cleartargetyaw();
	self notify("drone_investigate_spot_finished");
}

//Function Number: 60
lib_A62F::func_2E78(param_00)
{
	if(isdefined(self.var_9E78))
	{
		return;
	}

	self.var_9E78 = param_00;
	var_01 = lib_A62F::func_677D(level.var_31D.var_2E6 - (0,0,256),512,128,512);
	var_01 = sortbydistance(var_01,level.var_31D.var_2E6);
	foreach(var_03 in var_01)
	{
		if(distancesquared(var_03.var_2E6,param_00.var_2E6) < 22500)
		{
			self.var_9E78 = undefined;
			return;
		}

		wait(0.05);
		if(lib_A62F::func_2EE9(param_00,undefined,var_03,level.var_31D.var_2E6[2] + 100))
		{
			wait(0.05);
			if(lib_A62F::func_2EE9(var_03,level.var_31D.var_2E6[2],param_00,undefined))
			{
				if(!isdefined(self.var_4F9F))
				{
					self.var_4F9F = [];
				}

				self.var_4F9F[self.var_4F9F.size] = param_00;
				thread lib_A62F::func_2E73(var_03,level.var_31D.var_2E6[2] + 100,level.var_31D.var_2E6);
				return;
			}
		}
	}

	self.var_9E78 = undefined;
}

//Function Number: 61
lib_A62F::func_2E71()
{
	self endon("death");
	self endon("drone_investigate");
	self.var_7852 = 0;
	self.var_7857 = 0;
	self.var_7854 childthread lib_A62F::func_2E72(self);
	for(;;)
	{
		if(self.var_7854.var_7C46)
		{
			wait(0.05);
			continue;
		}

		if((self.var_7857 <= 0.3 || self.var_5D32 == "attack") && self.var_7852)
		{
			level notify("aud_stop_drone_scanning");
			stopfxontag(level._effect["drone_scan"],self.var_7854,"tag_origin");
			self.var_7852 = 0;
			self.var_7854.active = 0;
		}
		else if(self.var_7857 > 0.3 && !self.var_7852)
		{
			self.var_7854 linkto(self,"tag_top_camera",(0,0,0),(0,-45,0));
			wait(0.05);
			self.var_7854 method_842A((0,90,0),1.7,0,0);
			self.var_7854.active = 1;
			self.var_7855 lib_A5F1::func_873C("sdrn_scan_lp","aud_stop_drone_scanning",0.1,0.1);
			playfxontag(level._effect["drone_scan"],self.var_7854,"tag_origin");
			self.var_7852 = 1;
		}

		wait(0.05);
	}
}

//Function Number: 62
lib_A62F::func_2E72(param_00)
{
	self.var_7C46 = 0;
	for(;;)
	{
		self waittill("sight");
		self linkto(param_00,"tag_top_camera",(0,0,0),(0,0,0));
		self.var_7C46 = 1;
		wait(3);
		self.var_7C46 = 0;
	}
}

//Function Number: 63
lib_A62F::func_2EB3(param_00)
{
	self notify("drone_security_scan_tag_cleanup");
	self endon("drone_security_scan_tag_cleanup");
	param_00 waittill("death");
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 64
lib_A62F::func_2EB2(param_00,param_01)
{
	self notify("drone_security_scan_tag_audio");
	self endon("drone_security_scan_tag_audio");
	param_00 endon("death");
	self endon("death");
	var_02 = 0;
	while(isdefined(self) && isdefined(param_00) && isdefined(param_00.var_7854))
	{
		var_03 = param_01;
		var_04 = distancesquared(level.var_31D.var_2E6,param_00.var_7854.var_2E6);
		if(var_04 < param_01 * param_01)
		{
			var_03 = sqrt(var_04);
		}

		if(var_02 != var_03)
		{
			self unlink();
			var_02 = var_03;
			self.var_2E6 = param_00.var_7854.var_2E6;
			self.var_2E6 = self.var_2E6 + anglestoforward(param_00.var_7854.var_41) * var_02;
			self linkto(param_00.var_7854);
		}

		wait(0.05);
	}
}

//Function Number: 65
lib_A62F::func_2E79(param_00)
{
	if(isdefined(self.var_554F) && gettime() - self.var_5550 < 1000)
	{
		self veh_settargetyaw(vectortoyaw(self.var_554F - self.var_2E6));
		return gettime() - self.var_5550;
	}

	self veh_settargetyaw(param_00);
	return -1;
}

//Function Number: 66
lib_A62F::func_2E6D(param_00)
{
	self.var_4FA1 = 1;
	common_scripts\utility::flag_set("drones_investigating");
	common_scripts\utility::waittill_any("death","drone_investigate","drone_investigate_cleanup");
	level.var_2E7A = common_scripts\utility::array_remove(level.var_2E7A,param_00);
	if(isdefined(self))
	{
		self.var_4FA1 = undefined;
		level notify("drone_investigate_finished",self);
	}

	wait(0.1);
	if(level.var_2E7A.size == 0)
	{
		common_scripts\utility::flag_clear("drones_investigating");
	}
}

//Function Number: 67
lib_A62F::func_2EBD(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = "patrol";
	}

	if(!isdefined(param_00))
	{
		return undefined;
	}

	var_02 = lib_A62F::func_2EC0(param_00);
	if(!isdefined(var_02))
	{
		return undefined;
	}

	var_02 thread lib_A62F::func_2E1C();
	var_02 lib_A62F::func_2EB7(param_01);
	return var_02;
}

//Function Number: 68
lib_A62F::func_2EBE(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = "patrol";
	}

	if(!isdefined(param_00))
	{
		return [];
	}

	var_02 = common_scripts\utility::getstructarray(param_00,"targetname");
	var_03 = [];
	foreach(var_05 in var_02)
	{
		var_06 = lib_A62F::func_2EC0(var_05);
		var_06 thread lib_A62F::func_2E1C();
		var_06 lib_A62F::func_2EB7(param_01);
		var_03[var_03.size] = var_06;
	}

	return var_03;
}

//Function Number: 69
lib_A62F::func_2EC0(param_00)
{
	if(!isdefined(level.var_2F2D))
	{
		return undefined;
	}

	while(isdefined(level.var_2F2D.var_9D3C))
	{
		wait(0.05);
	}

	level.var_2F2D.var_2E6 = param_00.var_2E6;
	level.var_2F2D.var_41 = param_00.var_41;
	level.var_2F2D.target = param_00.target;
	level.var_2F2D.var_39B = param_00.var_39B;
	var_01 = level.var_2F2D lib_A59E::func_8971();
	return var_01;
}

//Function Number: 70
lib_A62F::func_2E1C()
{
	if(!isdefined(level.var_551A))
	{
		level.var_551A = 0;
	}

	if(!isdefined(level.var_551B))
	{
		level.var_551B = 0;
	}

	if(!isdefined(level.var_551D))
	{
		level.var_551D = 0;
	}

	if(!isdefined(level.var_551C))
	{
		level.var_551C = 0;
	}

	if(!isdefined(level.var_716))
	{
		level.var_716 = [];
	}

	level.var_716 = common_scripts\utility::array_add(level.var_716,self);
	level.var_31D thread lib_A62F::func_2E2E();
	childthread lib_A62F::func_2EA2();
	childthread lib_A62F::func_2EC3();
	self waittill("death");
	level.var_716 = common_scripts\utility::array_remove(level.var_716,self);
}

//Function Number: 71
lib_A62F::func_2E2E()
{
	self notify("drone_closest");
	self endon("drone_closest");
	while(isdefined(level.var_716) && isdefined(self))
	{
		var_00 = sortbydistance(level.var_716,self.var_2E6);
		if(var_00.size > 0)
		{
			self.var_1FE0 = var_00[0];
			continue;
		}

		self.var_1FE0 = undefined;
		wait(0.5);
	}
}

//Function Number: 72
lib_A62F::func_2EC3()
{
	self endon("death");
	var_00 = 0;
	var_01 = angleclamp180(self gettagangles("tag_origin")[1]);
	while(isdefined(self))
	{
		var_02 = angleclamp180(self gettagangles("tag_origin")[1]);
		if(abs(var_02 - var_01) > 1)
		{
			if(!var_00)
			{
				lib_A5F1::snd_play_linked("sdrone_pivot");
			}

			var_00 = 1;
		}
		else
		{
			var_00 = 0;
		}

		var_01 = var_02;
		wait(0.05);
	}
}

//Function Number: 73
lib_A62F::func_2EA2()
{
	self endon("death");
	while(isdefined(self))
	{
		if(!common_scripts\utility::flag("_stealth_spotted") && common_scripts\utility::flag("drones_investigating"))
		{
			if(gettime() - level.var_551B > 3000)
			{
				var_00 = level.var_31D.var_1FE0;
				if(isdefined(var_00))
				{
					level.var_551B = gettime();
					if(randomint(5) > 1)
					{
						var_00 lib_A5F1::snd_play_linked("sdrone_voc_suspicious");
					}
					else
					{
						var_00 lib_A5F1::snd_play_linked("sdrone_voc_aggressive");
					}
				}
			}

			if(randomint(5) > 3 && gettime() - level.var_551C > 3000)
			{
				var_00 = level.var_31D.var_1FE0;
				if(isdefined(var_00))
				{
					level.var_551C = gettime();
					var_00 lib_A5F1::snd_play_linked("sdrone_lens_movement");
				}
			}

			wait(randomfloatrange(0.2,6));
			continue;
		}

		if(gettime() - level.var_551D > 5000)
		{
			var_00 = level.var_31D.var_1FE0;
			if(isdefined(var_00))
			{
				level.var_551D = gettime();
				var_00 lib_A5F1::snd_play_linked("sdrone_voc_curious");
			}
		}

		wait(randomfloatrange(5,10));
		wait(0.05);
	}
}

//Function Number: 74
lib_A62F::func_2E1E(param_00,param_01,param_02,param_03,param_04)
{
	self notify("drone_alert_sight");
	self endon("death");
	self endon("drone_alert_sight");
	self.var_4B4 = 1;
	self.var_4B5 = 1;
	self.var_932B = 0;
	self.var_222E = 0;
	if(!isdefined(self.var_19F) || self.var_19F == 0)
	{
		self.var_19F = cos(10);
	}

	if(!isdefined(self.var_19D) || self.var_19D == 0)
	{
		self.var_19D = cos(45);
	}

	if(!isdefined(param_03))
	{
		param_03 = 1;
	}

	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	var_05 = 0.05;
	for(;;)
	{
		if(!isdefined(level.var_669) || !common_scripts\utility::flag_exist("_stealth_enabled") || !common_scripts\utility::flag("_stealth_enabled"))
		{
			wait(0.05);
			continue;
		}

		var_06 = getdvarfloat("ai_threatSightDelayDistMin");
		var_07 = getdvarfloat("ai_threatSightDelayDistMax");
		var_08 = getdvarfloat("ai_threatSightDelayRateMin");
		var_09 = getdvarfloat("ai_threatSightDelayRateMax");
		var_0A = level.var_31D.var_279;
		if(isai(self))
		{
			var_0B = self geteye();
			var_0C = anglestoforward(self.var_41);
		}
		else
		{
			var_0B = self gettagorigin("tag_origin");
			var_0C = anglestoforward(self gettagangles("tag_origin"));
		}

		var_0D = var_0A;
		if(isdefined(level.var_669) && isdefined(level.var_669.var_5833) && isdefined(level.var_669.var_5833.var_298D))
		{
			var_0E = level.var_669.var_5833.var_298D["hidden"][level.var_31D getstance()];
			if(isdefined(var_0E))
			{
				var_0D = min(var_0E,var_0D);
			}
		}

		var_0F = lib_A62F::func_2E20(level.var_31D,var_0B,param_01,param_02,var_0D * param_03);
		self.var_1AE3 = var_0F != 0;
		if(self.var_1AE3)
		{
			if(var_0F <= var_06 * var_06)
			{
				self.var_932B = self.var_932B + var_05;
			}
			else
			{
				var_10 = sqrt(var_0F);
				if(param_04 != 1)
				{
					var_11 = var_10 / param_04;
					var_12 = vectornormalize(level.var_31D.var_2E6 - var_0B);
					var_13 = vectordot(var_12,var_0C);
					var_14 = var_13 - self.var_19D / 1 - self.var_19D;
					var_10 = var_10 + var_11 - var_10 * var_14;
				}

				var_15 = clamp(var_10 - var_06 / var_07 - var_06,0,1);
				var_16 = var_08 + var_09 - var_08 * var_15;
				self.var_932B = self.var_932B + var_05 * var_16;
			}

			self.var_554F = level.var_31D.var_2E6;
			self.var_5550 = gettime();
			level.var_31D.var_8D95 = 1;
		}
		else
		{
			var_17 = getdvarfloat("ai_threatSightDelayFalloff");
			self.var_932B = self.var_932B - var_05 * var_17;
		}

		if(!self.var_1AE3)
		{
			if(gettime() > self.var_222E)
			{
				self.var_222D = sortbydistance(function_00D9(),self.var_2E6,1000,1);
				self.var_222E = gettime() + randomintrange(500,1000);
			}

			if(isdefined(self.var_222D))
			{
				foreach(var_19 in self.var_222D)
				{
					if(!isdefined(var_19))
					{
						continue;
					}

					if(isdefined(var_19.var_2233) && isdefined(var_19.var_2233[self getentitynumber()]))
					{
						continue;
					}

					if(lib_A62F::func_2E20(var_19,var_0B,param_01,param_02,1000) != 0)
					{
						var_19.var_2233[self getentitynumber()] = 1;
						self notify("see_corpse",var_19);
						wait(0.05);
					}
				}
			}
		}

		self.var_932B = clamp(self.var_932B,0,1);
		if(self.var_932B >= 1)
		{
			self notify(param_00);
			return;
		}

		wait(var_05);
	}
}

//Function Number: 75
lib_A62F::func_2E20(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_00.ignoreme) && param_00.ignoreme)
	{
		return 0;
	}

	var_05 = param_00.var_2E6 + (0,0,20);
	if(isplayer(param_00))
	{
		var_05 = param_00 geteye();
	}

	var_06 = var_05 - param_01;
	var_07 = lengthsquared(var_06);
	var_08 = 0;
	var_09 = 4900;
	if(var_07 < var_09)
	{
		var_08 = var_07;
	}
	else
	{
		if(lib_A62F::func_2E1F(var_05,param_04,1,isplayer(param_00)))
		{
			var_08 = var_07;
		}

		if(var_08 == 0 && isplayer(param_00) && isdefined(param_02) && param_02.active)
		{
			if(param_02 lib_A62F::func_2E1F(var_05,param_03,0,isplayer(param_00)))
			{
				var_08 = var_07;
			}

			if(var_08 != 0)
			{
				param_02 notify("sight",var_05);
			}
		}
	}

	return var_08;
}

//Function Number: 76
lib_A62F::func_2E1F(param_00,param_01,param_02,param_03)
{
	var_04 = self gettagorigin("tag_origin");
	if(isai(self))
	{
		var_04 = self geteye();
	}

	var_05 = param_00 - var_04;
	var_06 = lengthsquared(var_05);
	var_07 = param_01 * param_01;
	var_08 = var_06 <= var_07;
	var_09 = getdvarfloat("ai_threatSightDelayDistMin");
	if(var_08)
	{
		if(isai(self) && param_03 && !isdefined(self.var_855E))
		{
			var_08 = self method_81BE(level.var_31D);
		}
		else
		{
			var_0A = anglestoforward(self gettagangles("tag_origin"));
			var_05 = param_00 - var_04;
			var_0B = vectornormalize(var_05);
			var_0C = vectordot(var_0A,var_0B);
			var_08 = var_0C >= self.var_19D;
			if(var_08)
			{
				if(self.var_19F > self.var_19D && isdefined(self.var_855E) || lengthsquared(var_05) > var_09 * var_09)
				{
					var_0D = (var_0A[0],var_0A[1],0) * length((var_05[0],var_05[1],0));
					var_0E = var_04 + (var_0D[0],var_0D[1],var_05[2]);
					var_0F = vectornormalize(var_0E - var_04);
					var_10 = vectordot(var_0F,var_0A);
					var_08 = var_10 >= self.var_19F;
				}

				if(var_08)
				{
					var_08 = sighttracepassed(var_04,param_00,0,self.var_855E,self,param_02);
				}
			}
		}
	}

	return var_08;
}

//Function Number: 77
lib_A62F::func_2EB7(param_00,param_01)
{
	self endon("death");
	if(!isdefined(param_00))
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	var_02 = self;
	var_03 = 0;
	if(isdefined(var_02.var_5D32) && var_02.var_5D32 == param_00)
	{
		return;
	}

	if(!isdefined(var_02.var_5D32))
	{
		var_03 = 1;
		var_02.var_7171 = 0;
		var_02 method_8115(#animtree);
		if(param_00 == "attack")
		{
			var_02 method_814B(%ie_drone_deploy,1,0,1);
			var_02 method_8117(%ie_drone_deploy,1);
			var_02.var_1338 = 1;
		}
		else
		{
			var_02 method_814B(%ie_drone_retract,1,0,1);
			var_02 method_8117(%ie_drone_retract,1);
			var_02.var_1338 = 0;
		}
	}

	self notify("drone_set_mode");
	self endon("drone_set_mode");
	var_04 = var_02.var_5D32;
	var_02.var_5D32 = param_00;
	if(!isdefined(var_02.var_7854))
	{
		var_02.var_7854 = common_scripts\utility::spawn_tag_origin();
		var_02.var_7854 thread lib_A62F::func_2EB3(var_02);
		var_02.var_7854.var_19F = 0;
		var_02.var_7854.var_19D = cos(30);
		var_02.var_7854.active = 0;
		var_02.var_7854.var_855E = var_02;
		var_02.var_7855 = common_scripts\utility::spawn_tag_origin();
		var_02.var_7855 thread lib_A62F::func_2EB3(var_02);
		var_02.var_7855 thread lib_A62F::func_2EB2(var_02,300);
	}

	if(isdefined(level.var_8E07))
	{
		level.var_8E07 = common_scripts\utility::array_remove(level.var_8E07,self);
	}

	wait(0.1);
	switch(param_00)
	{
		case "patrol":
			break;

		case "attack":
			break;
	}
}

//Function Number: 78
lib_A62F::func_2E36()
{
	self notify("drone_corpse_monitor");
	self endon("drone_corpse_monitor");
	self endon("death");
	for(;;)
	{
		self waittill("see_corpse",var_00);
		var_01 = lib_A62F::func_677D(var_00.var_2E6,500,0,500);
		var_01 = sortbydistance(var_01,var_00.var_2E6,500,1);
		if(isdefined(var_01) && var_01.size > 0)
		{
			lib_A62F::func_2E74(undefined,var_01[0],var_01[0].var_2E6[2] + 500,var_00.var_2E6);
		}
	}
}

//Function Number: 79
lib_A62F::func_2EAE(param_00)
{
	if(!isdefined(self.var_1338))
	{
		self.var_1338 = 0;
	}

	if(self.var_1338 != param_00)
	{
		self.var_1338 = param_00;
		if(param_00)
		{
			lib_A5F1::snd_play_linked("sdrone_wpn_bays_open");
			playfxontag(level._effect["ie_drone_gun_lights"],self,"tag_origin");
			self method_814D(%ie_drone_deploy,1,0,1);
			self method_814B(%ie_drone_retract,0,0,1);
			wait(function_0063(%ie_drone_deploy));
			return;
		}

		lib_A5F1::snd_play_linked("sdrone_wpn_bays_close");
		stopfxontag(level._effect["ie_drone_gun_lights"],self,"tag_origin");
		self method_814D(%ie_drone_retract,1,0,1);
		self method_814B(%ie_drone_deploy,0,0,1);
		wait(function_0063(%ie_drone_retract));
	}
}

//Function Number: 80
lib_A62F::func_2EB1(param_00)
{
	self notify("drone_security_prepare_attack");
	self notify("drone_security_prepare_patrol");
	self endon("drone_security_prepare_attack");
	self endon("drone_security_prepare_patrol");
	self veh_setspeedimmediate(0.05,0.05,0.05);
	if(gettime() - level.var_551D > 2000)
	{
		var_01 = level.var_31D.var_1FE0;
		if(isdefined(var_01))
		{
			level.var_551D = gettime();
			var_01 lib_A5F1::snd_play_linked("sdrone_voc_curious");
		}

		if(!param_00)
		{
			wait(0.75);
		}
	}

	if(!param_00)
	{
		lib_A62F::func_2EAE(0);
		wait(0.5);
	}

	lib_A62F::func_4CC1();
}

//Function Number: 81
lib_A62F::func_2E1B()
{
	if(isdefined(self.var_DF6))
	{
		self.var_6F33 = self.var_DF6;
		var_00 = self gettagorigin("tag_origin");
		self.var_7171 = 1;
		self notify("newpath");
		self veh_helisetgoal(var_00,0,0,0,1,0,self gettagangles("tag_origin")[1],0,0,1,0,0,1,1);
	}
}

//Function Number: 82
lib_A62F::func_2EAF(param_00)
{
	self notify("drone_security_prepare_attack");
	self notify("drone_security_prepare_patrol");
	self endon("drone_security_prepare_attack");
	self endon("drone_security_prepare_patrol");
	self endon("death");
	thread lib_A62F::func_2EB0(randomfloatrange(0.3,0.6));
	lib_A62F::func_2E1B();
	self veh_setspeedimmediate(0.05,0.05,0.05);
	self veh_setlookatent(level.var_31D);
	if(gettime() - level.var_551A > 6000)
	{
		var_01 = level.var_31D.var_1FE0;
		if(isdefined(var_01))
		{
			level.var_551A = gettime();
			var_01 lib_A5F1::snd_play_linked("sdrone_alert");
		}

		if(!param_00)
		{
			wait(0.75);
		}
	}

	if(!param_00)
	{
		lib_A62F::func_2EAE(1);
		wait(0.5);
	}

	thread lib_A62F::func_3926();
	thread lib_A62F::func_67B2(1);
	self notify("reached_dynamic_path_end");
	wait(0.05);
	self veh_setlookatent(level.var_31D);
	self veh_setmaxpitchroll(80,lib_A62F::func_2E9C("rollmax"));
}

//Function Number: 83
lib_A62F::func_2E91(param_00)
{
	if(!isdefined(level.var_716))
	{
		return 0;
	}

	var_01 = 0;
	foreach(var_03 in level.var_716)
	{
		if(isdefined(var_03) && var_03.var_5D32 == param_00)
		{
			var_01++;
		}
	}

	return var_01;
}

//Function Number: 84
lib_A62F::func_2EB0(param_00)
{
	self notify("drone_security_prepare_attack_relay");
	self endon("drone_security_prepare_attack_relay");
	self endon("drone_security_prepare_attack");
	self endon("drone_security_prepare_patrol");
	self endon("drone_set_mode");
	self endon("death");
	wait(param_00);
	while(isdefined(self) && lib_A62F::func_2E91("attack") >= 4)
	{
		wait(1);
	}

	if(!isdefined(self))
	{
		return;
	}

	var_01 = sortbydistance(level.var_716,self.var_2E6);
	foreach(var_03 in var_01)
	{
		if(var_03 != self && distancesquared(var_03.var_2E6,self.var_2E6) < 1000000 && !isdefined(var_03.var_5D32) || var_03.var_5D32 != "attack")
		{
			var_03 lib_A62F::func_2EB7("attack");
			break;
		}
	}
}

//Function Number: 85
lib_A62F::func_2EEC()
{
	self notify("drone_wait_for_attack");
	self endon("death");
	self endon("drone_wait_for_attack");
	var_00 = common_scripts\utility::waittill_any_return("attack","damage");
	if(!common_scripts\utility::flag("_stealth_spotted"))
	{
		level.var_31D lib_A5F1::func_8725("irons_spotted_alert");
	}

	common_scripts\utility::flag_set("_stealth_spotted");
	if(isdefined(self))
	{
		thread lib_A62F::func_2EB7("attack");
	}
}