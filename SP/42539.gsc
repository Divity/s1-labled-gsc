/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42539.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 68
 * Decompile Time: 46 ms
 * Timestamp: 4/20/2022 8:23:48 PM
*******************************************************************/

//Function Number: 1
lib_A62B::main(param_00,param_01,param_02)
{
	precachemodel(param_00);
	lib_A59A::set_console_status();
	lib_A62B::func_8252(param_02);
	level._effect["pdrone_death_explosion"] = loadfx("vfx/explosion/vehicle_pdrone_explosion");
	level._effect["pdrone_large_death_explosion"] = loadfx("vfx/explosion/vehicle_pdrone_large_explosion");
	level._effect["pdrone_emp_death"] = loadfx("vfx/explosion/vehicle_pdrone_explosion");
	level._effect["emp_drone_damage"] = loadfx("vfx/sparks/emp_drone_damage");
	level._effect["pdrone_smoke_trail"] = loadfx("vfx/trail/trail_drone_fire_smk_sm_runner_1");
	level._effect["drone_muzzle_flash"] = loadfx("vfx/muzzleflash/pdrone_flash_wv");
	level._effect["drone_fan_distortion"] = loadfx("vfx/distortion/drone_fan_distortion");
	level._effect["drone_fan_distortion_large"] = loadfx("vfx/distortion/drone_fan_distortion_large");
	level._effect["drone_thruster_distortion"] = loadfx("vfx/distortion/drone_thruster_distortion");
	level._effect["drone_beacon_red"] = loadfx("vfx/lights/light_drone_beacon_red");
	level._effect["drone_beacon_red_fast"] = loadfx("vfx/lights/light_drone_beacon_red_fast");
	level._effect["drone_beacon_blue_fast"] = loadfx("vfx/lights/light_drone_beacon_blue_fast");
	level._effect["drone_beacon_red_slow_nolight"] = loadfx("vfx/lights/light_drone_beacon_red_slow_nolight");
	level._effect["drone_beacon_blue_slow_nolight"] = loadfx("vfx/lights/light_drone_beacon_blue_slow_nolight");
	level._effect["drone_beacon_red_sm_nolight"] = loadfx("vfx/lights/light_drone_beacon_red_sm_nolight");
	level.var_78AE["personal_drone"] = #animtree;
	level.var_78B2["personal_drone"] = param_00;
	level.var_78A9["personal_drone"]["drone_deploy_crouch_to_crouch"] = %drone_deploy_crouch_to_crouch;
	level.var_78A9["personal_drone"]["drone_deploy_crouch_to_run"] = %drone_deploy_crouch_to_run;
	level.var_78A9["personal_drone"]["drone_deploy_run_to_run"] = %drone_deploy_run_to_run;
	level.var_78A9["personal_drone"]["drone_deploy_run_to_stand"] = %drone_deploy_run_to_stand;
	level.var_78A9["personal_drone"]["personal_drone_folded_idle"][0] = %personal_drone_folded_idle;
	lib_A62B::func_8066();
	var_03 = "pdrone";
	if(isdefined(param_01))
	{
		var_03 = param_01;
	}

	lib_A59E::func_186C(var_03,param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A62B::func_4D0D);
	lib_A59E::func_1849(%atlas_assault_drone_lage_rotors,undefined,0);
	lib_A59E::func_1846(0.4,0.8,1024);
	lib_A59E::func_1856(level.var_678B[param_02]["health"]);
	lib_A59E::func_186A("allies");
	lib_A59E::func_185A();
	var_04 = randomfloatrange(0,1);
	var_05 = param_02;
	lib_A59E::func_1855();
}

//Function Number: 2
lib_A62B::func_8066()
{
	level.var_78A9["generic"]["drone_deploy_crouch_to_crouch"] = %drone_deploy_crouch_to_crouch_guy;
	level.var_78A9["generic"]["drone_deploy_crouch_to_run"] = %drone_deploy_crouch_to_run_guy;
	level.var_78A9["generic"]["drone_deploy_run_to_run"] = %drone_deploy_run_to_run_guy;
	level.var_78A9["generic"]["drone_deploy_run_to_stand"] = %drone_deploy_run_to_stand_guy;
}

//Function Number: 3
lib_A62B::func_8252(param_00)
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
	level.var_678B[param_00]["health"] = 110;
	level.var_678B[param_00]["speed"] = 45;
	level.var_678B[param_00]["accel"] = 50;
	level.var_678B[param_00]["decel"] = 50;
	level.var_678B[param_00]["hover_radius"] = 0;
	level.var_678B[param_00]["hover_speed"] = 0;
	level.var_678B[param_00]["hover_accel"] = 0;
	level.var_678B[param_00]["pitchmax"] = 60;
	level.var_678B[param_00]["rollmax"] = 60;
	level.var_678B[param_00]["angle_vel_pitch"] = 90;
	level.var_678B[param_00]["angle_vel_yaw"] = 120;
	level.var_678B[param_00]["angle_vel_roll"] = 90;
	level.var_678B[param_00]["angle_accel"] = 400;
	level.var_678B[param_00]["yaw_speed"] = 180;
	level.var_678B[param_00]["yaw_accel"] = 250;
	level.var_678B[param_00]["yaw_decel"] = 100;
	level.var_678B[param_00]["yaw_over"] = 0.1;
	level.var_678B[param_00]["axial_move"] = 0;
	level.var_678B[param_00]["weap_fire_tags"] = ["tag_flash"];
	level.var_678B[param_00]["clear_look"] = 1;
}

//Function Number: 4
lib_A62B::func_2E9C(param_00)
{
	return level.var_678B[self.classname][param_00];
}

//Function Number: 5
lib_A62B::func_4CC1(param_00,param_01,param_02)
{
	self veh_sethoverparams(lib_A62B::func_2E9C("hover_radius"),lib_A62B::func_2E9C("hover_speed"),lib_A62B::func_2E9C("hover_accel"));
	self veh_setmaxpitchroll(lib_A62B::func_2E9C("pitchmax"),lib_A62B::func_2E9C("rollmax"));
	var_03 = lib_A62B::func_2E9C("speed");
	var_04 = lib_A62B::func_2E9C("accel");
	var_05 = lib_A62B::func_2E9C("decel");
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
	self method_84B1(lib_A62B::func_2E9C("angle_vel_pitch"),lib_A62B::func_2E9C("angle_vel_yaw"),lib_A62B::func_2E9C("angle_vel_roll"));
	self method_84B2(lib_A62B::func_2E9C("angle_accel"));
	self veh_neargoalnotifydist(5);
	self veh_setyawspeed(lib_A62B::func_2E9C("yaw_speed"),lib_A62B::func_2E9C("yaw_accel"),lib_A62B::func_2E9C("yaw_decel"),lib_A62B::func_2E9C("yaw_over"));
	self method_84E4(lib_A62B::func_2E9C("axial_move"));
}

//Function Number: 6
lib_A62B::func_4D0D()
{
	self endon("death");
	self.var_65A4 = distance(self gettagorigin("tag_origin"),self gettagorigin("tag_ground"));
	self.var_7953 = 0;
	self.var_2D2F = 1;
	self.var_9CDA = ::lib_A62B::func_4CC1;
	if(lib_A62B::func_90AB())
	{
		lib_A62B::func_4CC1();
	}

	if(self.var_7AE9 == "allies")
	{
		thread lib_A59E::func_9CFA("friendly");
		self.var_2161 = self setcontents(0);
	}
	else
	{
		thread lib_A59E::func_9CFA("hostile");
		self.var_4B9E = 1;
		self.var_797B = "pdrone";
	}

	lib_A59A::func_32DC("sentient_controlled");
	lib_A59A::func_32DC("fire_disabled");
	if(lib_A62B::func_90AB())
	{
		self.var_9347 = 0;
		self.var_9346 = 0;
		self.var_E0E = 0;
		self.var_38E7 = (0,0,0);
		self.var_38E6 = (0,0,0);
	}

	self.var_8F6D = 0;
	self.var_6DAD = 0;
	if(lib_A62B::func_846C())
	{
		lib_A62B::func_8251();
	}

	lib_A632::func_186D();
	waittillframeend;
	self.var_3068 = ::lib_A62B::func_6777;
	lib_A59A::func_749(::lib_A62B::func_6771);
	thread lib_A51A::monitordamage();
	self.var_253C = ::lib_A62B::func_4541;
	var_00 = 0;
	if(isdefined(self.script_parameters) && self.script_parameters == "expendable")
	{
		var_00 = 1;
	}

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

	thread lib_A62B::func_6760(var_00);
	thread lib_A62B::func_677C();
	self notify("stop_kicking_up_dust");
	thread lib_A62B::func_45D7();
}

//Function Number: 7
lib_A62B::func_45D7()
{
	self endon("death");
	var_00 = spawnstruct();
	var_00.var_6F1E = "pdrone_atlas";
	var_01 = ::lib_A62C::func_871D;
	if(issubstr(self.classname,"pdrone_atlas_large"))
	{
		var_00.var_6F1E = "pdrone_atlas";
		var_01 = ::lib_A62C::func_871D;
	}
	else if(issubstr(self.classname,"pdrone_atlas"))
	{
		var_00.var_6F1E = "pdrone_atlas";
		var_01 = ::lib_A62C::func_871D;
	}
	else if(isdefined(level.script) && level.script == "greece")
	{
		var_00.var_6F1E = "pdrone_swarm";
		var_01 = ::lib_A62C::func_8722;
	}

	lib_A5DE::snd_message("snd_register_vehicle",var_00.var_6F1E,var_01);
	lib_A5DE::snd_message("snd_start_vehicle",var_00);
}

//Function Number: 8
lib_A62B::func_6760(param_00)
{
	self endon("death");
	self sentient_makeentitysentient(self.var_7AE9,param_00);
	self veh_setmaxpitchroll(lib_A62B::func_2E9C("pitchmax"),lib_A62B::func_2E9C("rollmax"));
	if(isdefined(self.owner))
	{
		thread lib_A62B::func_6785();
		thread lib_A62B::func_0E23();
	}

	thread lib_A632::func_67B3();
	thread lib_A62B::func_67B2();
}

//Function Number: 9
lib_A62B::func_677C()
{
	self endon("death");
	var_00 = 0.3;
	if(self.classname == "script_vehicle_pdrone_atlas" || self.classname == "script_vehicle_pdrone_atlas_lab")
	{
		playfxontag(common_scripts\utility::getfx("drone_fan_distortion"),self,"TAG_FX_FAN_L");
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("drone_fan_distortion"),self,"TAG_FX_FAN_R");
	}

	if(self.classname == "script_vehicle_pdrone_atlas_large")
	{
		playfxontag(common_scripts\utility::getfx("drone_fan_distortion_large"),self,"TAG_FX_FAN_L");
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("drone_fan_distortion_large"),self,"TAG_FX_FAN_R");
	}

	if(self.classname != "script_vehicle_pdrone_atlas" && self.classname != "script_vehicle_pdrone_atlas_lab")
	{
		playfxontag(common_scripts\utility::getfx("drone_thruster_distortion"),self,"TAG_FX_THRUSTER_L");
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("drone_thruster_distortion"),self,"TAG_FX_THRUSTER_R");
	}

	if(self.var_7AE9 == "axis")
	{
		if(self.classname == "script_vehicle_pdrone_atlas_lab")
		{
			playfxontag(common_scripts\utility::getfx("drone_beacon_red_sm_nolight"),self,"TAG_FX_BEACON_0");
			playfxontag(common_scripts\utility::getfx("drone_beacon_red_sm_nolight"),self,"TAG_FX_BEACON_1");
			return;
		}

		playfxontag(common_scripts\utility::getfx("drone_beacon_red"),self,"TAG_FX_BEACON_0");
		wait(var_00);
		playfxontag(common_scripts\utility::getfx("drone_beacon_red"),self,"TAG_FX_BEACON_1");
		wait(var_00);
		playfxontag(common_scripts\utility::getfx("drone_beacon_red"),self,"TAG_FX_BEACON_2");
	}
}

//Function Number: 10
lib_A62B::func_0E23()
{
	self endon("death");
	self.owner waittill("death",var_00);
	if(!isdefined(var_00))
	{
		self delete();
		return;
	}

	thread lib_A62B::func_3926();
}

//Function Number: 11
lib_A62B::func_6785()
{
	self.owner endon("pdrone_returning");
	self.owner endon("death");
	self endon("death");
	if(self.var_7AE9 == "allies")
	{
		self veh_sethoverparams(20,20,20);
		self.var_1C7 = 64;
	}
	else
	{
		self veh_sethoverparams(0,0,0.05);
		self.var_1C7 = 8;
	}

	self veh_setspeed(20,20,20);
	self veh_setyawspeedbyname("faster");
	thread lib_A62B::func_6784();
	for(;;)
	{
		self.owner waittill("pdrone_defend_point",var_00);
		thread lib_A62B::func_6786(var_00);
	}
}

//Function Number: 12
lib_A62B::func_6784()
{
	self notify("change_movement_type");
	self endon("change_movement_type");
	self.owner endon("pdrone_returning");
	self.owner endon("death");
	self endon("death");
	var_00 = 0.2;
	if(isplayer(self.owner))
	{
		var_01 = (1,5,3);
		var_02 = (-50,130,90);
	}
	else
	{
		var_01 = (1,64,10);
		var_02 = (-60,0,95);
	}

	wait(randomfloat(var_00));
	var_03 = 0;
	var_04 = self.var_2E6;
	var_05 = self.var_2E6;
	var_06 = self.var_2E6;
	var_07 = 0;
	var_08 = (0,0,0);
	var_09 = 0;
	var_0A = 0;
	var_0B = self.var_2E6;
	var_0C = 0.05;
	if(level.currentgen)
	{
		var_0C = 0.25;
	}

	for(;;)
	{
		var_09 = var_09 + var_0C;
		var_07 = var_07 + var_0C;
		if(var_07 > 2)
		{
			var_07 = 0;
			var_08 = (randomfloatrange(-0.5,0.5) * var_01[0],randomfloatrange(-0.5,0.5) * var_01[1],randomfloatrange(-0.5,0.5) * var_01[2]);
		}

		var_06 = transformmove(self.owner.var_2E6,self.owner.var_41,(0,0,0),(0,var_03,0),var_02 + var_08,(0,0,0))["origin"];
		if(distance(var_06,var_05) > 16)
		{
			if(var_09 > var_00)
			{
				if(var_0A > 0.5 && common_scripts\utility::cointoss())
				{
					var_0D = 1;
					var_0E = vectornormalize(self.owner.var_2E6 - self.var_2E6);
					var_0F = vectorcross(var_0E,(0,0,1));
					var_10 = self.var_2E6 + var_0F * randomfloatrange(-1,1) * 256;
				}
				else
				{
					var_0D = 0;
					var_10 = var_07;
				}

				if(lib_A62B::func_6763(self.var_2E6,var_10) && lib_A62B::func_6764(var_10))
				{
					var_0A = 0;
					var_05 = var_10;
					var_04 = var_10;
				}
				else
				{
					var_0A = var_0A + var_09;
					var_11 = randomfloat(1) + randomfloat(1) - 1;
					var_03 = angleclamp360(angleclamp180(var_03) * 0.5 + var_11 * 250);
				}

				var_09 = 0;
			}
		}
		else
		{
			var_04 = var_06;
			var_0A = 0;
		}

		if(var_0A > 3)
		{
			if(!level.var_31D lib_A59A::func_6E18(var_06) && !level.var_31D lib_A59A::func_6E18(self.var_2E6) && lib_A62B::func_6764(var_06) && lib_A62B::func_6765(var_06))
			{
				self veh_teleport(var_06,self.var_41);
				var_04 = var_06;
				var_05 = var_06;
			}
		}

		self veh_setgoalpos(var_04,1);
		wait(var_0C);
	}
}

//Function Number: 13
lib_A62B::func_6763(param_00,param_01)
{
	param_01 = param_01 + vectornormalize(param_01 - param_00) * 32;
	param_00 = param_00 + (0,0,-24);
	param_01 = param_01 + (0,0,-24);
	var_02 = playerphysicstrace(param_00,param_01);
	var_03 = distancesquared(var_02,param_01) < 0.01;
	return var_03;
}

//Function Number: 14
lib_A62B::func_6765(param_00)
{
	var_01 = param_00 + (0,0,12);
	var_02 = playerphysicstrace(var_01,param_00);
	var_03 = distancesquared(var_02,param_00) < 0.01;
	return var_03;
}

//Function Number: 15
lib_A62B::func_6764(param_00)
{
	var_01 = self.owner geteye();
	var_02 = sighttracepassed(param_00,var_01,0,self);
	return var_02;
}

//Function Number: 16
lib_A62B::func_6786(param_00)
{
	self notify("change_movement_type");
	self endon("change_movement_type");
	self.owner endon("pdrone_returning");
	self.owner endon("death");
	self endon("death");
	var_01 = 110;
	var_02 = param_00["position"] + var_01 * param_00["normal"];
	self veh_setgoalpos(var_02,1);
	self.owner common_scripts\utility::waittill_any_timeout(10,"stop_pdrone_pov");
	thread lib_A62B::func_6784();
}

//Function Number: 17
lib_A62B::func_67B2(param_00)
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
		if(isdefined(self.var_2EDD.var_9310))
		{
			self veh_setlookatent(self.var_2EDD.var_9310);
			thread lib_A62B::func_6778(self.var_2EDD.var_9310,param_00);
			self.var_2EDD.var_9310 common_scripts\utility::waittill_any_timeout(5,"death","target_lost");
			continue;
		}

		if(lib_A62B::func_2E9C("clear_look"))
		{
			self veh_clearlookatent();
		}

		if(isdefined(self.owner))
		{
			self veh_settargetyaw(self.owner.var_41[1]);
		}
	}
}

//Function Number: 18
lib_A62B::func_19CD(param_00)
{
	var_01 = param_00.var_2E6 - self.var_2E6 * (1,1,0);
	var_01 = vectornormalize(var_01);
	var_01 = (var_01[1],var_01[0] * -1,0);
	var_02 = abs(vectordot(var_01,param_00 getvelocity()));
	var_02 = clamp(var_02,0,250) / 250;
	var_02 = 1 - var_02;
	var_02 = clamp(var_02,0.5,1);
	return var_02;
}

//Function Number: 19
lib_A62B::func_19D3(param_00)
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

//Function Number: 20
lib_A62B::func_19D0(param_00)
{
	if(level.var_31D lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		return 0.5;
	}

	return 1;
}

//Function Number: 21
lib_A62B::func_19C6(param_00,param_01,param_02)
{
	var_03 = self.var_2E6 - param_00.var_2E6;
	var_03 = var_03 * (1,1,0);
	var_03 = vectornormalize(var_03);
	if(isplayer(param_00))
	{
		param_01 = param_01 * lib_A62B::func_19CD(param_00);
		param_01 = param_01 * lib_A62B::func_19D3(param_00);
		param_01 = param_01 * lib_A62B::func_19D0(param_00);
	}

	var_04 = vectorcross(var_03,(0,0,1));
	var_04 = vectornormalize(var_04);
	var_05 = var_04 * 8 / param_01 * randomfloatrange(-1,1);
	var_06 = (0,0,8) / param_01 * randomfloatrange(-1,1);
	if(isdefined(param_02) && param_02)
	{
	}

	return var_05 + var_06;
}

//Function Number: 22
lib_A62B::func_37A4(param_00,param_01,param_02,param_03,param_04)
{
	param_01 endon("death");
	self endon("death");
	self endon("emp_death");
	self endon("pdrone_targeting");
	while(param_00 > 0)
	{
		var_05 = 1;
		if(isplayer(param_01))
		{
			var_06 = min(self.var_2EDD.var_931E,15) / 15;
			var_05 = lib_A59A::func_5768(var_06,0.15,0.8);
		}

		if(isdefined(self.var_E0D))
		{
			var_05 = var_05 * self.var_E0D;
		}

		var_07 = lib_A62B::func_19C6(param_01,var_05,0);
		self.var_24D4 = var_07;
		var_08 = param_02 + var_07;
		var_09 = self.var_2E6;
		if(self method_8442(param_03) != -1)
		{
			var_09 = self gettagorigin(param_03);
		}

		var_0A = param_01.var_2E6 + var_08 - var_09;
		var_0A = vectornormalize(var_0A);
		if(lib_A62B::func_676E(var_09,var_09 + var_0A * 10000))
		{
			param_01 notify("target_lost");
			return;
		}

		lib_A62B::func_677B(var_09,param_01.var_2E6 + var_08);
		param_00 = param_00 - param_04;
		wait(param_04);
	}
}

//Function Number: 23
lib_A62B::func_6778(param_00,param_01)
{
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
	var_02 = param_00 geteye() - param_00.var_2E6;
	var_03 = (0,0,var_02[2]);
	var_04 = 0.095;
	if(!isdefined(param_01))
	{
		param_01 = 0.25;
	}

	var_05 = param_01 * 0.8;
	var_06 = param_01 * 1.2;
	if(level.currentgen)
	{
		var_04 = 0.2499;
		var_05 = var_05 * 2.5;
		var_06 = var_06 * 2.5;
	}

	var_07 = lib_A62B::func_19C6(param_00,1,0);
	var_08 = var_03 + var_07;
	for(;;)
	{
		self veh_setturrettargetent(param_00,var_08);
		var_09 = self.var_2E6;
		var_0A = lib_A62B::func_2E9C("weap_fire_tags");
		var_0B = var_0A[0];
		if(self method_8442(var_0B) != -1)
		{
			var_09 = self gettagorigin(var_0B);
		}

		if(self.var_6DAD || self.var_8F6D > 0 || lib_A62B::func_676E(var_09,param_00.var_2E6 + var_08) || !isdefined(self.var_2EDD.var_9310) || self.var_2EDD.var_9310 != param_00)
		{
			param_00 notify("target_lost");
			return;
		}

		if(lib_A62B::func_90AB())
		{
			if(isdefined(self.var_E0E) && !self.var_E0E)
			{
				wait(0.05);
				continue;
			}

			if(length(self veh_getvelocity()) > 1)
			{
				wait(0.05);
				continue;
			}

			if(isdefined(self.var_E26) && self.var_E26 && !sighttracepassed(var_09,param_00 geteye(),0,self,param_00))
			{
				self.var_E0E = 0;
				wait(0.05);
				continue;
			}
		}

		var_0C = randomfloatrange(2,3);
		while(var_0C > 0)
		{
			if(self.var_6DAD || self.var_8F6D > 0)
			{
				break;
			}

			var_0D = randomfloatrange(var_05,var_06);
			var_0D = min(var_0D,var_0C);
			lib_A62B::func_37A4(var_0D,param_00,var_03,var_0B,var_04);
			var_0C = var_0C - var_0D;
			if(lib_A62B::func_90AB())
			{
				self.var_E0E = 0;
				wait(0.05);
				break;
			}

			var_0E = randomfloatrange(0.5,1);
			var_0E = min(var_0E,var_0C);
			if(var_0E > 0)
			{
				var_0C = var_0C - var_0E;
				wait(var_0E);
			}
		}
	}
}

//Function Number: 24
lib_A62B::func_677B(param_00,param_01)
{
	self notify("weapon_fired");
	playfxontag(level._effect["drone_muzzle_flash"],self,"tag_flash");
	magicbullet("pdrone_turret",param_00,param_01);
}

//Function Number: 25
lib_A62B::func_0BA2(param_00,param_01)
{
	return (angleclamp180(param_00[0] - param_01[0]),angleclamp180(param_00[1] - param_01[1]),angleclamp180(param_00[2] - param_01[2]));
}

//Function Number: 26
lib_A62B::func_676E(param_00,param_01)
{
	if(self.var_7AE9 == "axis")
	{
		return 0;
	}

	return lib_A59A::func_8436(param_00,param_01);
}

//Function Number: 27
lib_A62B::func_6771(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(isdefined(param_01) && isdefined(param_01.var_7AE9) && self.var_7AE9 == param_01.var_7AE9)
	{
		return;
	}

	if(isdefined(param_01) && isdefined(param_01.classname) && param_01.classname == "worldspawn")
	{
		self.health = int(min(self.var_275,self.health + param_00));
		return;
	}

	self.var_5512 = param_01;
	self.var_5513 = param_02;
	self.var_5514 = param_03;
	if(param_04 == "MOD_ENERGY")
	{
		self dodamage(param_00 * 4,param_01.var_2E6,param_01);
	}
	else if(isalive(self) && isdefined(param_01) && !isplayer(param_01))
	{
		self.health = int(min(self.var_275,self.health + param_00 * 0.7));
	}

	if(lib_A62B::func_846C())
	{
		lib_A62B::func_695C();
	}
}

//Function Number: 28
lib_A62B::func_68B1()
{
	if(self.classname == "script_vehicle_pdrone_atlas_large")
	{
		playfx(common_scripts\utility::getfx("pdrone_large_death_explosion"),self gettagorigin("tag_origin"));
		lib_A5DE::snd_message("pdrone_death_explode");
		return;
	}

	playfx(common_scripts\utility::getfx("pdrone_death_explosion"),self gettagorigin("tag_origin"));
	lib_A5DE::snd_message("pdrone_death_explode");
}

//Function Number: 29
lib_A62B::func_4541()
{
	if(!isdefined(self))
	{
		return;
	}

	self.var_235D = 1;
	if(self.var_7AE9 != "allies" && !isdefined(self.owner) && isdefined(self.var_5512) && randomfloat(1) < 0.4)
	{
		var_00 = randomintrange(0,3);
		switch(var_00)
		{
			case 0:
				break;

			case 1:
				break;

			case 2:
				break;
		}
	}
}

//Function Number: 30
lib_A62B::func_6777()
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
	thread lib_A62B::func_2E3B();
	var_04 = 60;
	self veh_setspeed(var_04,60,1000);
	self veh_neargoalnotifydist(var_01);
	self veh_setgoalpos(var_02,0);
	thread lib_A62B::func_2E43(var_02,var_01,var_04);
	common_scripts\utility::waittill_any("goal","near_goal");
	self notify("stop_crash_loop_sound");
	self notify("crash_done");
	lib_A62B::func_68B1();
	self delete();
}

//Function Number: 31
lib_A62B::func_2E3B()
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

//Function Number: 32
lib_A62B::func_2E43(param_00,param_01,param_02)
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

//Function Number: 33
lib_A62B::func_264B(param_00)
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

	self hide();
	stopfxontag(common_scripts\utility::getfx("drone_beacon_red"),self,"tag_origin");
	playfxontag(common_scripts\utility::getfx("emp_drone_damage"),var_01,"TAG_ORIGIN");
	lib_A5DE::snd_message("pdrone_emp_death",var_01);
	var_02 = (self.var_2E6[0],self.var_2E6[1],self.var_2E6[2] - 500);
	var_03 = physicstrace(self.var_2E6,var_02);
	var_04 = 0;
	var_05 = 5;
	var_06 = param_00.var_2E6 - var_01.var_2E6;
	var_06 = vectornormalize(var_06);
	var_07 = vectorcross((0,0,1),var_06);
	var_07 = vectornormalize(var_07);
	var_08 = 100;
	var_09 = var_01.var_2E6 + var_07 * var_08;
	var_0A = vectortoangles(var_01.var_2E6 - var_09);
	var_0B = 1;
	if(common_scripts\utility::cointoss())
	{
		var_0B = -1;
	}

	while(var_04 < 5)
	{
		wait(0.05);
		var_04 = var_04 + 0.05;
		var_0A = var_0A + (0,10,0) * var_0B;
		var_0C = lib_A59A::func_5768(clamp(var_04 / 3,0,1),2,30);
		var_09 = var_09 - (0,0,var_0C);
		var_0D = var_09 + anglestoforward(var_0A) * var_08;
		var_0E = physicstrace(var_01.var_2E6,var_0D,var_01);
		var_01.var_2E6 = var_0D;
		var_01.var_41 = var_01.var_41 + (0,50,0) * var_0B;
		var_0F = length(var_03 - var_01.var_2E6);
		if(var_0F < 60 || var_01.var_2E6[2] < var_03[2] + 15 || var_0E != var_0D)
		{
			break;
		}
	}

	playfx(common_scripts\utility::getfx("pdrone_death_explosion"),var_01.var_2E6);
	lib_A5DE::snd_message("pdrone_crash_land",var_01.var_2E6);
	var_01 delete();
}

//Function Number: 34
lib_A62B::func_263E(param_00)
{
	self.var_9D43 = 1;
	var_01 = param_00.var_2E6 - self.var_2E6;
	var_01 = vectornormalize(var_01);
	var_02 = vectorcross((0,0,1),var_01);
	var_02 = vectornormalize(var_02);
	if(common_scripts\utility::cointoss())
	{
		var_02 = var_02 * -1;
	}

	var_03 = param_00.var_2E6 - var_01 * (1,1,0) * 250 + var_02 * 250;
	var_03 = (var_03[0],var_03[1],self.var_2E6[2]);
	var_04 = common_scripts\utility::randomvectorincone(vectornormalize(var_03 - self.var_2E6),15);
	var_05 = self.var_2E6 + var_04 * 250;
	var_03 = physicstrace(self.var_2E6,var_05);
	self notify("newpath");
	self notify("deathspin");
	self veh_neargoalnotifydist(60);
	self veh_helisetgoal(var_03,lib_A62B::func_2E9C("speed") * 0.75,lib_A62B::func_2E9C("accel"),lib_A62B::func_2E9C("decel"),undefined,undefined,0,0,0,0,0,0,0);
	common_scripts\utility::waittill_any("goal","near_goal");
	lib_A62B::func_2648();
	self notify("stop_crash_loop_sound");
	self notify("crash_done");
}

//Function Number: 35
lib_A62B::func_2648()
{
	var_00 = spawn("script_model",self.var_2E6);
	var_00.var_41 = self.var_41;
	var_00 setmodel(self.model);
	self hide();
	if(!issubstr(self.classname,"_security"))
	{
		stopfxontag(common_scripts\utility::getfx("drone_beacon_red"),self,"tag_origin");
	}

	var_01 = 0;
	var_02 = self veh_getvelocity();
	var_03 = squared(0.05);
	var_04 = (0,0,-980);
	while(var_01 < 5)
	{
		wait(0.05);
		var_02 = var_04 * 0.05 + var_02;
		var_02 = function_0284(var_02,1000);
		var_05 = var_02 * 0.05 + var_04 * var_03 / 2;
		var_06 = var_00.var_2E6 + var_05;
		var_07 = physicstrace(var_00.var_2E6,var_06,var_00);
		if(var_07 != var_06)
		{
			break;
		}

		var_00.var_2E6 = var_06;
		var_00.var_41 = var_00.var_41 + (0,5,0);
		var_01 = var_01 + 0.05;
	}

	playfx(common_scripts\utility::getfx("pdrone_death_explosion"),var_00.var_2E6);
	lib_A5DE::snd_message("pdrone_crash_land",var_00.var_2E6);
	var_00 delete();
}

//Function Number: 36
lib_A62B::func_2649(param_00)
{
	var_01 = self.var_2E6;
	self hide();
	var_02 = 0;
	var_03 = 1;
	var_04 = 0;
	var_05 = 0;
	var_06 = level.var_31D geteye() - var_01;
	var_07 = self.var_2E6;
	var_08 = level.var_31D.var_2E6 - self.var_2E6;
	var_08 = vectornormalize(var_08);
	var_09 = var_08 * (1,1,0);
	var_0A = vectorcross((0,0,1),var_08);
	var_0A = vectornormalize(var_0A);
	var_0B = -5;
	if(common_scripts\utility::cointoss())
	{
		var_0A = var_0A * -1;
		var_0B = 5;
	}

	var_0C = var_0A;
	var_0D = var_07 + var_0C * 600 + (0,0,250);
	var_0E = var_07 + var_0C * 300 + (0,0,500);
	var_0F = common_scripts\utility::spawn_tag_origin();
	var_0F.var_2E6 = var_07;
	var_0F.var_6685 = var_07;
	var_0F.var_2F38 = spawn("script_model",var_07);
	var_0F.var_2F38.var_41 = self.var_41;
	var_0F.var_2F38 setmodel(self.model);
	var_0F.var_4FF = (0,0,0);
	playfxontag(common_scripts\utility::getfx("pdrone_smoke_trail"),var_0F.var_2F38,"TAG_ORIGIN");
	thread lib_A62B::func_758F(var_01,level.var_31D,var_0F,var_02,var_04,var_05);
	var_10 = 0;
	var_11 = 1 / var_03 * 20;
	var_12 = 0;
	var_13 = 0;
	var_14 = 0;
	while(var_12 <= 1)
	{
		wait(0.05);
		var_15 = squared(1 - var_10) * var_07 + 2 * var_10 * 1 - var_10 * var_0E + squared(var_10) * var_0D;
		var_16 = var_0F.var_6685;
		var_0F.var_6685 = var_15;
		var_0F.var_4FF = var_0F.var_6685 - var_16;
		var_17 = physicstrace(var_16,var_0F.var_6685,var_0F.var_2F38);
		if(var_17 != var_0F.var_6685)
		{
			var_14 = 1;
			break;
		}

		var_18 = anglestoaxis(var_0F.var_2F38.var_41);
		var_19 = var_18["forward"];
		var_1A = var_18["up"];
		var_1B = var_18["right"];
		var_19 = rotatepointaroundvector(var_09,var_19,var_0B);
		var_1A = rotatepointaroundvector(var_09,var_1A,var_0B);
		var_1B = rotatepointaroundvector(var_09,var_1B,var_0B);
		var_0F.var_2F38.var_41 = axistoangles(var_19,var_1B,var_1A);
		var_12 = var_12 + var_11;
		var_10 = squared(var_12);
		if(var_13)
		{
			break;
		}

		if(var_12 > 1)
		{
			var_12 = 1;
			var_13 = 1;
		}
	}

	var_0F notify("RocketPositionUpdate");
	var_1C = 0;
	var_1D = var_0F.var_4FF * 20;
	var_1E = squared(0.05);
	var_1F = (0,0,-980);
	while(var_1C < 5 && !var_14)
	{
		wait(0.05);
		var_1D = var_1F * 0.05 + var_1D;
		var_1D = function_0284(var_1D,1000);
		var_20 = var_1D * 0.05 + var_1F * var_1E / 2;
		var_21 = var_0F.var_2F38.var_2E6 + var_20;
		var_17 = physicstrace(var_0F.var_2F38.var_2E6,var_21,var_0F.var_2F38);
		if(var_17 != var_21)
		{
			break;
		}

		var_0F.var_2F38.var_2E6 = var_21;
		var_1C = var_1C + 0.05;
	}

	playfx(common_scripts\utility::getfx("pdrone_death_explosion"),var_0F.var_2F38.var_2E6);
	lib_A5DE::snd_message("pdrone_crash_land",var_0F.var_2F38.var_2E6);
	var_0F.var_2F38 delete();
	var_0F delete();
}

//Function Number: 37
lib_A62B::func_758F(param_00,param_01,param_02,param_03,param_04,param_05)
{
	param_02 endon("RocketPositionUpdate");
	var_06 = vectortoangles(param_01.var_2E6 - param_00);
	var_07 = param_03;
	var_08 = (0,0,0);
	if(common_scripts\utility::cointoss())
	{
		param_04 = param_04 * -1;
	}

	var_09 = param_05 / 5;
	var_0A = 0;
	for(;;)
	{
		wait(0.05);
		var_07 = var_07 + param_04;
		if(isdefined(param_02.var_912F))
		{
			var_06 = vectortoangles(param_02.var_912F);
		}

		var_08 = (0,0,1) * var_0A;
		var_0B = transformmove(param_02.var_6685,var_06,(0,0,0),(0,0,var_07),var_08,(0,0,0));
		var_08 = var_0B["origin"];
		param_02.var_2E6 = vectorlerp(param_02.var_2E6,var_08,0.5);
		param_02.var_2F38.var_2E6 = param_02.var_2E6;
		var_0A = var_0A + var_09;
		var_0A = clamp(var_0A,0,param_05);
	}
}

//Function Number: 38
lib_A62B::func_6761(param_00)
{
	var_01 = param_00 lib_A59A::func_88BD(1);
	var_01.animname = "generic";
	var_02 = common_scripts\utility::getstruct(param_00.target,"targetname");
	var_03 = spawn("script_origin",var_02.var_2E6);
	var_03.var_41 = var_02.var_41;
	var_04 = getent(var_02.target,"targetname");
	var_05 = 0;
	var_06 = undefined;
	switch(var_02.animation)
	{
		case "drone_deploy_crouch_to_crouch_guy":
			break;

		case "drone_deploy_crouch_to_run_guy":
			break;

		case "drone_deploy_run_to_run_guy":
			break;

		case "drone_deploy_run_to_stand_guy":
			break;

		default:
			break;
	}
}

//Function Number: 39
lib_A62B::func_28C2()
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

//Function Number: 40
lib_A62B::func_392A()
{
	level.var_6C2C = common_scripts\utility::getstructarray("player_test_point","targetname");
	level.var_2E1D = getentarray("drone_air_space","script_noteworthy");
	if(!isdefined(level.flying_attack_drones))
	{
		level.flying_attack_drones = [];
	}
}

//Function Number: 41
lib_A62B::func_8BA9(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "flying_attack_drone";
	}

	var_01 = lib_A59E::func_8977(param_00);
	foreach(var_03 in var_01)
	{
		if(isdefined(var_03))
		{
			var_03.var_6030 = param_00;
			var_03 thread lib_A62B::func_3926();
		}
	}

	return var_01;
}

//Function Number: 42
lib_A62B::func_8BA8(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "flying_attack_drone";
	}

	var_01 = lib_A59E::func_8973(param_00);
	if(isdefined(var_01))
	{
		var_01.var_6030 = param_00;
		var_01 thread lib_A62B::func_3926();
	}

	return var_01;
}

//Function Number: 43
lib_A62B::func_4CE0()
{
	if(lib_A62B::func_90AB())
	{
		return;
	}

	var_00 = undefined;
	if(!isdefined(self.script_airspeed))
	{
		var_00 = 40;
	}
	else
	{
		var_00 = self.script_airspeed;
	}

	self veh_neargoalnotifydist(30);
	self veh_setspeed(var_00,var_00 / 4,var_00 / 4);
}

//Function Number: 44
lib_A62B::func_3926(param_00)
{
	self notify("pdrone_flying_attack_drone_logic");
	self endon("pdrone_flying_attack_drone_logic");
	self endon("death");
	param_00 = self;
	param_00 childthread lib_A62B::func_3922();
	param_00 childthread lib_A62B::func_3929();
	param_00 thread lib_A62B::func_3924();
	param_00 lib_A62B::func_4CE0();
	if(isdefined(param_00.target))
	{
		param_00 waittill("reached_dynamic_path_end");
	}

	if(lib_A62B::func_90AB())
	{
		param_00 childthread lib_A62B::func_9AAD();
	}
	else
	{
		param_00 childthread lib_A62B::func_3928();
	}

	if(lib_A62B::func_846C())
	{
		param_00 childthread lib_A62B::func_4B64();
	}
}

//Function Number: 45
lib_A62B::func_8EB9()
{
	self.target = undefined;
	lib_A59A::func_9CAB();
	thread lib_A62B::func_3926();
}

//Function Number: 46
lib_A62B::func_90AB()
{
	return isdefined(level.var_2ED5) && isdefined(level.var_2ED5.enabled);
}

//Function Number: 47
lib_A62B::func_3E86(param_00)
{
	if(lib_A62B::func_90AB())
	{
		return level.var_2ED5.var_9191;
	}

	var_01 = common_scripts\utility::getclosest(param_00.var_2E6,level.var_6C2C);
	return getent(var_01.target,"targetname");
}

//Function Number: 48
lib_A62B::func_3928()
{
	self endon("death");
	self endon("pdrone_flying_attack_drone_logic");
	if(!isdefined(level.var_2E1D))
	{
		return;
	}

	self.var_24D5 = common_scripts\utility::getclosest(self.var_2E6,level.var_2E1D);
	lib_A62B::func_9AB6();
	self waittill("near_goal");
	wait(0.05);
	for(;;)
	{
		var_00 = lib_A59A::func_3CFD(self.var_2E6);
		self veh_setlookatent(var_00);
		var_01 = lib_A62B::func_3E86(var_00);
		if(var_01 != self.var_24D5)
		{
			var_02 = lib_A62B::func_3DE8(self.var_24D5,var_01,level.var_2E1D);
			if(isdefined(var_02))
			{
				self.var_24D5 = var_02;
			}
		}

		lib_A62B::func_9AB6();
		self waittill("near_goal");
		if(var_01 == self.var_24D5)
		{
			lib_A62B::func_9FD0();
			lib_A62B::func_9F9D();
		}
	}
}

//Function Number: 49
lib_A62B::func_9AAD()
{
	self endon("death");
	if(!isdefined(level.var_2E1D))
	{
		return;
	}

	self.var_24D5 = common_scripts\utility::getclosest(self.var_2E6,level.var_2E1D);
	lib_A62B::func_9AB6();
	self waittill("near_goal");
	wait(0.05);
	for(;;)
	{
		var_00 = lib_A59A::func_3CFD(self.var_2E6);
		self veh_setlookatent(var_00);
		var_01 = level.var_2ED5.var_9191;
		if(var_01 != self.var_24D5)
		{
			if(randomfloat(1) > 0.5)
			{
				wait(randomfloat(1));
			}

			var_02 = lib_A62B::func_3DE8(self.var_24D5,var_01,level.var_2E1D);
			if(isdefined(var_02))
			{
				self.var_24D5 = var_02;
			}
		}

		if(lib_A62B::func_90AA())
		{
			self waittill("near_goal");
		}

		if(var_01 == self.var_24D5)
		{
			wait(0.05);
			lib_A62B::func_9F9D();
		}
	}
}

//Function Number: 50
lib_A62B::func_9FD0()
{
	level endon("pdrone_wait_in_current_air_space");
	if(!lib_A62B::func_90AB())
	{
		wait(randomfloatrange(0.5,1.5));
		return;
	}

	var_00 = 0;
	if(lib_A62B::func_90AB())
	{
		if(randomfloat(1) < 0.25)
		{
			var_00 = randomfloatrange(1,2.5);
		}
		else
		{
			var_00 = randomfloatrange(0,1);
		}
	}

	var_01 = 0;
	while(var_01 < var_00)
	{
		wait(0.05);
		var_01 = var_01 + 0.05;
		if(self.var_24D5 != level.var_2ED5.var_9191)
		{
			break;
		}
	}
}

//Function Number: 51
lib_A62B::func_9F9D()
{
	self endon("death");
	while(self.var_6DAD || self.var_8F6D > 0)
	{
		wait(0.05);
		self.var_8F6D = self.var_8F6D - 0.05;
	}
}

//Function Number: 52
lib_A62B::func_19C0()
{
	var_00 = self.var_2E6;
	if(!ispointinvolume(var_00,self.var_24D5))
	{
		var_00 = lib_A62B::func_3E43(self.var_24D5);
	}
	else
	{
		var_01 = 0;
		var_02 = 0;
		var_03 = (0,0,0);
		var_04 = 0;
		var_05 = (0,0,0);
		foreach(var_07 in level.flying_attack_drones)
		{
			if(self != var_07 && isdefined(self.var_24D5) && isdefined(var_07.var_24D5))
			{
				if(self.var_24D5 == var_07.var_24D5)
				{
					var_01++;
					var_08 = var_07.var_2E6 - self.var_2E6;
					var_09 = length(var_08);
					if(var_09 < 90)
					{
						var_02++;
						var_03 = var_03 - 0.5 * 90 - var_09 * var_08 / var_09;
					}
					else if(var_09 > 150)
					{
						var_04++;
						var_05 = var_05 + 0.5 * var_09 - 150 * var_08 / var_09;
					}
				}
			}
		}

		if(var_01 > 0)
		{
			if(randomint(5) == 0)
			{
				var_00 = lib_A62B::func_3E43(self.var_24D5);
			}
			else
			{
				if(var_02 > 0)
				{
					var_00 = var_00 + var_03 / var_02;
				}

				if(var_04 > 0)
				{
					var_00 = var_00 + var_05 / var_04;
				}
			}
		}
		else
		{
			var_00 = lib_A62B::func_3E43(self.var_24D5);
		}
	}

	return var_00;
}

//Function Number: 53
lib_A62B::func_3E82()
{
	if(self.var_24D5 != level.var_2ED5.var_9191 || !isdefined(self.var_24EB) || !isdefined(self.var_24EA))
	{
		return lib_A62B::func_3E43(self.var_24D5);
	}

	if(isdefined(self.var_2C28))
	{
		return self.var_2C28;
	}

	var_00 = self.var_24EB + self.var_24EA;
	if(length(var_00 - self.var_2E6) < 10)
	{
		return undefined;
	}

	return var_00;
}

//Function Number: 54
lib_A62B::func_19CF(param_00)
{
	if(isdefined(self.var_2E88))
	{
		return vectortoyaw(self.var_2E88.var_2E6 - param_00);
	}

	if(!isdefined(self.var_2EDD) || !isdefined(self.var_2EDD.var_9310))
	{
		var_01 = param_00 - self.var_2E6;
		if(var_01 != (0,0,0))
		{
			return vectortoyaw(var_01);
		}

		return self.var_41[1];
	}

	return undefined;
}

//Function Number: 55
lib_A62B::func_90AA()
{
	var_00 = lib_A62B::func_3E82();
	if(!isdefined(var_00))
	{
		return 0;
	}

	var_01 = lib_A62B::func_19CF(var_00);
	var_02 = undefined;
	if(isdefined(var_01))
	{
		var_02 = 1;
	}
	else
	{
		var_01 = self.var_41[1];
	}

	self veh_helisetgoal(var_00,lib_A62B::func_2E9C("speed"),lib_A62B::func_2E9C("accel"),lib_A62B::func_2E9C("decel"),undefined,var_02,var_01,0,0,0,0,0,1);
	return 1;
}

//Function Number: 56
lib_A62B::func_9AB6()
{
	if(lib_A62B::func_90AB())
	{
		lib_A62B::func_90AA();
		return;
	}

	self veh_setgoalpos(lib_A62B::func_19C0(),1);
}

//Function Number: 57
lib_A62B::func_3E43(param_00)
{
	for(var_01 = param_00 getpointinbounds(randomfloatrange(-1,1),randomfloatrange(-1,1),randomfloatrange(-1,1));!ispointinvolume(var_01,param_00);var_01 = param_00 getpointinbounds(randomfloatrange(-1,1),randomfloatrange(-1,1),randomfloatrange(-1,1)))
	{
	}

	return var_01;
}

//Function Number: 58
lib_A62B::func_3922()
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
		thread lib_A62B::func_3923();
	}
}

//Function Number: 59
lib_A62B::func_3923()
{
	self notify("taking damage");
	self endon("taking damage");
	self endon("death");
	self.var_51C5 = 1;
	wait(1);
	self.var_51C5 = 0;
}

//Function Number: 60
lib_A62B::func_3924()
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

//Function Number: 61
lib_A62B::func_3DB9(param_00,param_01)
{
	var_02 = [];
	var_03 = [];
	if(isdefined(param_00.script_linkto))
	{
		var_03 = strtok(param_00.script_linkto," ");
	}

	for(var_04 = 0;var_04 < param_01.size;var_04++)
	{
		var_05 = 0;
		if(isdefined(param_01[var_04].script_linkname))
		{
			for(var_06 = 0;var_06 < var_03.size;var_06++)
			{
				if(param_01[var_04].script_linkname == var_03[var_06])
				{
					var_02[var_02.size] = param_01[var_04];
					var_05 = 1;
					break;
				}
			}
		}

		if(!var_05 && isdefined(param_01[var_04].script_linkto) && isdefined(param_00.script_linkname))
		{
			var_07 = strtok(param_01[var_04].script_linkto," ");
			for(var_06 = 0;var_06 < var_07.size;var_06++)
			{
				if(param_00.script_linkname == var_07[var_06])
				{
					var_02[var_02.size] = param_01[var_04];
					break;
				}
			}
		}
	}

	return var_02;
}

//Function Number: 62
lib_A62B::func_3DE8(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	var_04 = [];
	foreach(var_06 in param_02)
	{
		var_06.var_3BC1 = 0;
	}

	param_00.var_35B2 = param_00.var_3BC1 + distance(param_00.var_2E6,param_01.var_2E6);
	while(var_03.size > 0)
	{
		var_08 = undefined;
		var_09 = 500000;
		foreach(var_0B in var_03)
		{
			if(var_0B.var_35B2 < var_09)
			{
				var_08 = var_0B;
				var_09 = var_0B.var_35B2;
			}
		}

		if(var_08 == param_01)
		{
			var_0D = param_01;
			while(var_0D.var_1A12 != param_00)
			{
				var_0D = var_0D.var_1A12;
			}

			return var_0D;
		}

		var_04 = common_scripts\utility::array_remove(var_04,var_09);
		var_05[var_05.size] = var_09;
		var_0F = lib_A62B::func_3DB9(var_09,var_03);
		foreach(var_0C in var_0F)
		{
			var_11 = var_09.var_3BC1 + distance(var_09.var_2E6,var_0C.var_2E6);
			if(common_scripts\utility::array_contains(var_05,var_0C) && var_11 >= var_0C.var_3BC1)
			{
				continue;
			}

			var_12 = common_scripts\utility::array_contains(var_04,var_0C);
			if(!var_12 || var_11 < var_0C.var_3BC1)
			{
				var_0C.var_1A12 = var_09;
				var_0C.var_3BC1 = var_11;
				var_0C.var_35B2 = var_0C.var_3BC1 + distance(var_0C.var_2E6,param_02.var_2E6);
				if(!var_12)
				{
					var_04[var_04.size] = var_0C;
				}
			}
		}
	}

	return undefined;
}

//Function Number: 63
lib_A62B::func_846C()
{
	return self.classname == "script_vehicle_pdrone_kva" || self.classname == "script_vehicle_pdrone_atlas_large";
}

//Function Number: 64
lib_A62B::func_8251()
{
	switch(self.classname)
	{
		case "script_vehicle_pdrone_kva":
			break;

		case "script_vehicle_pdrone_atlas_large":
			break;

		default:
			break;
	}
}

//Function Number: 65
lib_A62B::func_695C()
{
	if(!isdefined(level.var_78A9["personal_drone"]["hit_reaction"]))
	{
		return;
	}

	self method_8115(level.var_78AE["personal_drone"]);
	var_00 = randomint(level.var_78A9["personal_drone"]["hit_reaction"].size);
	var_01 = function_0063(level.var_78A9["personal_drone"]["hit_reaction"][var_00]);
	self method_8145(level.var_78A9["personal_drone"]["hit_reaction"][var_00]);
	self.var_6DAD = 1;
	wait(var_01);
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}

	self.var_6DAD = 0;
}

//Function Number: 66
lib_A62B::func_4B64()
{
	self endon("death");
	self method_8115(level.var_78AE["personal_drone"]);
	var_00 = 0;
	var_01 = 0;
	for(;;)
	{
		wait(0.05);
		if(!var_00 && !self.var_6DAD)
		{
			var_02 = randomint(level.var_78A9["personal_drone"]["idle"].size);
			var_01 = function_0063(level.var_78A9["personal_drone"]["idle"][var_02]);
			self method_8143(level.var_78A9["personal_drone"]["idle"][var_02]);
			var_00 = 1;
		}
		else if(self.var_6DAD || var_01 <= 0)
		{
			var_00 = 0;
		}

		var_01 = var_01 - 0.05;
	}
}

//Function Number: 67
lib_A62B::func_3929()
{
	self endon("death");
	for(;;)
	{
		self waittill("stun_drone");
		lib_A62B::func_8F6C();
	}
}

//Function Number: 68
lib_A62B::func_8F6C()
{
	self.var_8F6D = 2;
	if(self.var_6DAD)
	{
		return;
	}

	thread lib_A62B::func_695C();
}