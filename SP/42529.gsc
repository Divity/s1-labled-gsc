/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42529.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 15
 * Decompile Time: 13 ms
 * Timestamp: 4/20/2022 8:23:47 PM
*******************************************************************/

//Function Number: 1
lib_A621::func_0CD0(param_00,param_01)
{
	return issubstr(param_00,"armed") || issubstr(param_01,"armed");
}

//Function Number: 2
lib_A621::main(param_00,param_01,param_02)
{
	if(lib_A621::func_0CD0(param_00,param_02))
	{
		lib_A5FF::func_6EF8();
	}

	if(issubstr(param_02,"bench"))
	{
		precachemodel("vehicle_sentinel_littlebird_benchleft");
		precachemodel("vehicle_sentinel_littlebird_benchright");
	}

	lib_A59E::func_186C("littlebird",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A621::func_4D0D);
	lib_A59E::func_1845("vehicle_little_bird_armed");
	lib_A59E::func_1845("vehicle_little_bird_bench");
	if(issubstr(param_02,"kva") || issubstr(param_02,"atlas") || issubstr(param_02,"sentinel"))
	{
		lib_A59E::func_1849(%mil_helicopter_littlebird_ai_rotors,undefined,0,3);
	}
	else
	{
		lib_A59E::func_1849(%mi28_rotors,undefined,0,3);
	}

	lib_A59E::func_1842("fx/explosions/helicopter_explosion_secondary_small","tag_engine","littlebird_helicopter_secondary_exp",undefined,undefined,undefined,0,1);
	lib_A59E::func_1842("vfx/trail/trail_fire_smoke_l","tag_engine","littlebird_helicopter_dying_loop",1,0.05,1,0.5,1);
	lib_A59E::func_1842("fx/explosions/helicopter_explosion_secondary_small","tag_engine",undefined,undefined,undefined,undefined,2.5,1);
	lib_A59E::func_1842("vfx/explosion/vehicle_littlebird_explosion_a",undefined,"littlebird_helicopter_crash",undefined,undefined,undefined,-1,undefined,"stop_crash_loop_sound");
	lib_A59E::func_1864("vfx/explosion/vehicle_littlebird_explosion_a","tag_deathfx","littlebird_helicopter_crash",undefined,undefined,undefined,undefined,1,undefined,0);
	lib_A59E::func_1846(0.8,1.6,2048);
	lib_A59E::func_186E(param_02,"default","vfx/treadfx/heli_dust_default");
	lib_A59E::func_1856(799);
	lib_A59E::func_186A("axis");
	lib_A59E::func_185A();
	lib_A59E::func_1873(::lib_A621::func_9A35);
	lib_A59E::func_1839(::lib_A621::func_7F1D,::lib_A621::func_7EF4);
	var_03 = randomfloatrange(0,1);
	lib_A59E::func_1857(param_02,"white_blink","TAG_LIGHT_BELLY","vfx/lights/aircraft_light_white_blink","running",var_03);
	lib_A59E::func_1857(param_02,"red_blink1","TAG_LIGHT_TAIL1","vfx/lights/aircraft_light_red_blink","running",var_03);
	lib_A59E::func_1857(param_02,"red_blink2","TAG_LIGHT_TAIL2","vfx/lights/aircraft_light_red_blink","running",var_03);
	lib_A59E::func_1857(param_02,"headlight_nose","tag_light_nose","vfx/lights/headlight_gaz","headlights",0);
	var_04 = "littlebird_gunpod";
	lib_A59E::func_1872(var_04,"TAG_MINIGUN_ATTACH_LEFT","vehicle_mil_helicopter_littlebird_gunpodleft");
	lib_A59E::func_1872(var_04,"TAG_MINIGUN_ATTACH_RIGHT","vehicle_mil_helicopter_littlebird_gunpodright");
	lib_A59E::func_1855();
	lib_A623::func_4D0A();
}

//Function Number: 3
lib_A621::func_4D0D()
{
	self endon("death");
	self.var_65A4 = distance(self gettagorigin("tag_origin"),self gettagorigin("tag_ground"));
	self.var_7953 = 0;
	self.var_2D2F = 1;
	self.var_9D00 = 6;
	thread lib_A623::func_57AE();
	thread lib_A621::func_0DE7();
	thread lib_A59E::func_9CFA("running");
	if(issubstr(self.classname,"sentinel"))
	{
		self hidepart("main_rotor_static_jnt");
	}

	waittillframeend;
	if(!lib_A621::func_0CD0(self.model,self.classname))
	{
		lib_A59E::func_5BCF();
		foreach(var_01 in self.mgturret)
		{
			var_01 hide();
		}
	}

	thread lib_A622::func_45B2();
	self.var_3068 = ::lib_A621::func_57AB;
	lib_A59A::func_749(::lib_A621::func_57AA);
}

//Function Number: 4
lib_A621::func_84BC()
{
	if(issubstr(self.classname,"sentinel"))
	{
		self hidepart("main_rotor_static_jnt");
		self showpart("main_rotor_jnt");
	}
}

//Function Number: 5
lib_A621::func_84EA()
{
	if(issubstr(self.classname,"sentinel"))
	{
		self showpart("main_rotor_static_jnt");
		self hidepart("main_rotor_jnt");
	}
}

//Function Number: 6
lib_A621::func_0DE7()
{
	switch(self.classname)
	{
		case "script_vehicle_littlebird_atlas_bench":
		case "script_vehicle_littlebird_sentinel_bench":
			break;

		default:
			break;
	}
}

//Function Number: 7
lib_A621::func_7EF4(param_00)
{
	return param_00;
}

//Function Number: 8
lib_A621::func_7F1D()
{
	var_00 = [];
	for(var_01 = 0;var_01 < 8;var_01++)
	{
		var_00[var_01] = spawnstruct();
	}

	var_00[0].var_85A8 = "tag_pilot1";
	var_00[1].var_85A8 = "tag_pilot2";
	var_00[2].var_85A8 = "tag_detach_right";
	var_00[3].var_85A8 = "tag_detach_right";
	var_00[4].var_85A8 = "tag_detach_right";
	var_00[5].var_85A8 = "tag_detach_left";
	var_00[6].var_85A8 = "tag_detach_left";
	var_00[7].var_85A8 = "tag_detach_left";
	var_00[0].var_4B60[0] = %helicopter_pilot1_idle;
	var_00[0].var_4B60[1] = %helicopter_pilot1_twitch_clickpannel;
	var_00[0].var_4B60[2] = %helicopter_pilot1_twitch_lookback;
	var_00[0].var_4B60[3] = %helicopter_pilot1_twitch_lookoutside;
	var_00[0].var_4B7B[0] = 500;
	var_00[0].var_4B7B[1] = 100;
	var_00[0].var_4B7B[2] = 100;
	var_00[0].var_4B7B[3] = 100;
	var_00[1].var_4B60[0] = %helicopter_pilot2_idle;
	var_00[1].var_4B60[1] = %helicopter_pilot2_twitch_clickpannel;
	var_00[1].var_4B60[2] = %helicopter_pilot2_twitch_lookoutside;
	var_00[1].var_4B60[3] = %helicopter_pilot2_twitch_radio;
	var_00[1].var_4B7B[0] = 450;
	var_00[1].var_4B7B[1] = 100;
	var_00[1].var_4B7B[2] = 100;
	var_00[1].var_4B7B[3] = 100;
	var_00[2].var_4B60[0] = %little_bird_casual_idle_guy1;
	var_00[3].var_4B60[0] = %little_bird_casual_idle_guy3;
	var_00[4].var_4B60[0] = %little_bird_casual_idle_guy2;
	var_00[5].var_4B60[0] = %little_bird_casual_idle_guy1;
	var_00[6].var_4B60[0] = %little_bird_casual_idle_guy3;
	var_00[7].var_4B60[0] = %little_bird_casual_idle_guy2;
	var_00[2].var_4B7B[0] = 100;
	var_00[3].var_4B7B[0] = 166;
	var_00[4].var_4B7B[0] = 122;
	var_00[5].var_4B7B[0] = 177;
	var_00[6].var_4B7B[0] = 136;
	var_00[7].var_4B7B[0] = 188;
	var_00[2].var_4B60[1] = %little_bird_aim_idle_guy1;
	var_00[3].var_4B60[1] = %little_bird_aim_idle_guy3;
	var_00[4].var_4B60[1] = %little_bird_aim_idle_guy2;
	var_00[5].var_4B60[1] = %little_bird_aim_idle_guy1;
	var_00[7].var_4B60[1] = %little_bird_aim_idle_guy2;
	var_00[2].var_4B7B[1] = 200;
	var_00[3].var_4B7B[1] = 266;
	var_00[4].var_4B7B[1] = 156;
	var_00[5].var_4B7B[1] = 277;
	var_00[7].var_4B7B[1] = 288;
	var_00[2].var_4B61 = %little_bird_alert_idle_guy1;
	var_00[3].var_4B61 = %little_bird_alert_idle_guy3;
	var_00[4].var_4B61 = %little_bird_alert_idle_guy2;
	var_00[5].var_4B61 = %little_bird_alert_idle_guy1;
	var_00[6].var_4B61 = %little_bird_alert_idle_guy3;
	var_00[7].var_4B61 = %little_bird_alert_idle_guy2;
	var_00[2].var_4B62 = %little_bird_alert_2_aim_guy1;
	var_00[3].var_4B62 = %little_bird_alert_2_aim_guy3;
	var_00[4].var_4B62 = %little_bird_alert_2_aim_guy2;
	var_00[5].var_4B62 = %little_bird_alert_2_aim_guy1;
	var_00[6].var_4B62 = %little_bird_alert_2_aim_guy3;
	var_00[7].var_4B62 = %little_bird_alert_2_aim_guy2;
	var_00[2].var_4066 = %little_bird_dismount_guy1;
	var_00[3].var_4066 = %little_bird_dismount_guy3;
	var_00[4].var_4066 = %little_bird_dismount_guy2;
	var_00[5].var_4066 = %little_bird_dismount_guy1;
	var_00[6].var_4066 = %little_bird_dismount_guy3;
	var_00[7].var_4066 = %little_bird_dismount_guy2;
	var_00[2].var_57B4 = 1;
	var_00[3].var_57B4 = 1;
	var_00[4].var_57B4 = 1;
	var_00[5].var_57B4 = 1;
	var_00[6].var_57B4 = 1;
	var_00[7].var_57B4 = 1;
	var_00[2].var_3FD0 = %little_bird_mount_guy1;
	var_00[2].var_3FD1 = "mount_finish";
	var_00[3].var_3FD0 = %little_bird_mount_guy3;
	var_00[3].var_3FD1 = "mount_finish";
	var_00[4].var_3FD0 = %little_bird_mount_guy2;
	var_00[4].var_3FD1 = "mount_finish";
	var_00[5].var_3FD0 = %little_bird_mount_guy1;
	var_00[5].var_3FD1 = "mount_finish";
	var_00[6].var_3FD0 = %little_bird_mount_guy3;
	var_00[6].var_3FD1 = "mount_finish";
	var_00[7].var_3FD0 = %little_bird_mount_guy2;
	var_00[7].var_3FD1 = "mount_finish";
	var_00[2].var_3FD2 = ::lib_A59F::func_4499;
	var_00[3].var_3FD2 = ::lib_A59F::func_4499;
	var_00[4].var_3FD2 = ::lib_A59F::func_4499;
	var_00[5].var_3FD2 = ::lib_A59F::func_4499;
	var_00[6].var_3FD2 = ::lib_A59F::func_4499;
	var_00[7].var_3FD2 = ::lib_A59F::func_4499;
	var_00[2].var_6EAC = %little_bird_aim_2_prelanding_guy1;
	var_00[3].var_6EAC = %little_bird_aim_2_prelanding_guy3;
	var_00[4].var_6EAC = %little_bird_aim_2_prelanding_guy2;
	var_00[5].var_6EAC = %little_bird_aim_2_prelanding_guy1;
	var_00[6].var_6EAC = %little_bird_aim_2_prelanding_guy3;
	var_00[7].var_6EAC = %little_bird_aim_2_prelanding_guy2;
	var_00[2].var_6EAD = %little_bird_prelanding_idle_guy1;
	var_00[3].var_6EAD = %little_bird_prelanding_idle_guy3;
	var_00[4].var_6EAD = %little_bird_prelanding_idle_guy2;
	var_00[5].var_6EAD = %little_bird_prelanding_idle_guy1;
	var_00[6].var_6EAD = %little_bird_prelanding_idle_guy3;
	var_00[7].var_6EAD = %little_bird_prelanding_idle_guy2;
	var_00[0].var_1433 = 0;
	var_00[1].var_1433 = 0;
	return var_00;
}

//Function Number: 9
lib_A621::func_9A35()
{
	var_00 = [];
	var_00["first_guy_left"] = [];
	var_00["first_guy_right"] = [];
	var_00["left"] = [];
	var_00["right"] = [];
	var_00["passengers"] = [];
	var_00["default"] = [];
	var_00["first_guy_left"][0] = 5;
	var_00["first_guy_right"][0] = 2;
	var_00["stage_guy_left"][0] = 7;
	var_00["stage_guy_right"][0] = 4;
	var_00["left"][var_00["left"].size] = 5;
	var_00["left"][var_00["left"].size] = 6;
	var_00["left"][var_00["left"].size] = 7;
	var_00["right"][var_00["right"].size] = 2;
	var_00["right"][var_00["right"].size] = 3;
	var_00["right"][var_00["right"].size] = 4;
	var_00["passengers"][var_00["passengers"].size] = 2;
	var_00["passengers"][var_00["passengers"].size] = 3;
	var_00["passengers"][var_00["passengers"].size] = 4;
	var_00["passengers"][var_00["passengers"].size] = 5;
	var_00["passengers"][var_00["passengers"].size] = 6;
	var_00["passengers"][var_00["passengers"].size] = 7;
	var_00["default"] = var_00["passengers"];
	return var_00;
}

//Function Number: 10
lib_A621::func_57AA(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(param_04 == "MOD_ENERGY" && isdefined(self.var_3068))
	{
		self thread [[ self.var_3068 ]](param_01,param_04);
	}
}

//Function Number: 11
lib_A621::func_57AB(param_00,param_01)
{
	self endon("death");
	self endon("in_air_explosion");
	self notify("emp_death");
	lib_A59E::func_9CF9("all");
	self.var_9D43 = 1;
	var_02 = self veh_getvelocity();
	var_03 = 250;
	if(isdefined(level.var_3DC2))
	{
		var_04 = [[ level.var_3DC2 ]]();
	}
	else
	{
		var_05 = (self.var_2E6[0] + var_03[0] * 5,self.var_2E6[1] + var_03[1] * 5,self.var_2E6[2] - 2000);
		var_04 = bullettrace(self.var_2E6,var_05,0,self)["position"];
	}

	self notify("newpath");
	self notify("deathspin");
	thread lib_A621::func_57A8();
	var_06 = 1000;
	self veh_setspeed(var_06,40,1000);
	self veh_neargoalnotifydist(var_03);
	self veh_setgoalpos(var_04,0);
	thread lib_A621::func_57A9(var_04,var_03,var_06);
	common_scripts\utility::waittill_any("goal","near_goal");
	self notify("stop_crash_loop_sound");
	self notify("crash_done");
	self.var_B0C = 1;
	self.var_3117 = 1;
	lib_A5A0::func_9CE8(param_00,param_01);
	if(getdvar("mapname") == "lab")
	{
		lib_A621::func_1CD0();
	}

	self method_8052(self.var_2E6,param_00);
}

//Function Number: 12
lib_A621::func_1CD0()
{
	if(!isdefined(level.var_74B6))
	{
		level.var_74B6 = 0;
	}

	level.var_74B6++;
	if(level.var_74B6 >= 10)
	{
		lib_A59A::func_41DA("LEVEL_10A");
	}
}

//Function Number: 13
lib_A621::func_57A8()
{
	self endon("crash_done");
	self veh_clearlookatent();
	self veh_setyawspeed(400,100,100);
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		var_00 = randomintrange(90,120);
		self veh_settargetyaw(self.var_41[1] + var_00);
		wait(0.5);
	}
}

//Function Number: 14
lib_A621::func_57A9(param_00,param_01,param_02)
{
	self endon("crash_done");
	self veh_clearlookatent();
	self veh_setyawspeed(400,100,100);
	var_03 = 400;
	var_04 = 100;
	var_05 = undefined;
	var_06 = 90 * randomintrange(-2,3);
	for(;;)
	{
		if(self.var_2E6[2] < param_00[2] + param_01)
		{
			self notify("near_goal");
		}

		wait(0.05);
	}
}

//Function Number: 15
lib_A621::func_4806()
{
	self endon("crash_done");
	self veh_clearlookatent();
	self veh_setyawspeed(400,100,100);
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		var_00 = randomintrange(90,120);
		self veh_settargetyaw(self.var_41[1] + var_00);
		wait(0.5);
	}
}