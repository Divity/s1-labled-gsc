/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42548.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 15
 * Decompile Time: 10 ms
 * Timestamp: 4/20/2022 8:23:50 PM
*******************************************************************/

//Function Number: 1
lib_A634::func_8723()
{
	lib_A5DA::func_11A3("throttle",::lib_A5DA::func_4E54);
	lib_A5DA::func_118C("pitbull",::lib_A634::func_6731);
	lib_A5DA::func_1187();
	lib_A5DA::func_1188("pbull_rpm_idle_lp");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","pbull_rpm_idle_vol_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("pbull_rpm_hi_lp");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","pbull_rpm_hi_vol_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("pbull_int_sus_lp");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","pbull_int_sus_lo_vol_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("pbull_reverse_lp");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","pbull_reverse_loop_vol_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_118A("pbull_rev_low_to_hi",undefined,0.75,1);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("volume","dummy_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("pbull_rev_med_to_hi",undefined,0.75,1);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("volume","dummy_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("pbull_rev_hi_to_max",undefined,0.75,1);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("volume","dummy_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("pbull_brakes_med",undefined,0.75,1);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("volume","dummy_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("pbull_int_brake_pedal",undefined,0.75,1);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("volume","dummy_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("blank_oneshot",undefined,0.75,1);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("volume","dummy_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("pbull_reverse",undefined,0.75,0);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("volume","dummy_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("pbull_decel_to_idle",undefined,0.75,1);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("volume","dummy_map");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("from_any_to_gas_off",::lib_A634::func_672E,["speed"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("pbull_decel_to_idle");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("from_any_to_crash",::lib_A634::func_6728,["speed"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("pbull_decel_to_idle");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("from_stopped_to_reverse",::lib_A634::func_672D,["speed"]);
	lib_A5DA::func_1180(["pbull_int_sus_lp","pbull_reverse_lp"]);
	lib_A5DA::func_1182("pbull_reverse");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("from_reverse_to_reverse_gas_off",::lib_A634::func_672C,["speed"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("pbull_decel_to_idle");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("from_gas_off_to_rev_low",::lib_A634::func_672A,["speed"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("pbull_rev_low_to_hi");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("from_gas_off_to_rev_med",::lib_A634::func_672B,["speed"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("pbull_rev_med_to_hi");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("from_gas_off_to_rev_hi",::lib_A634::func_6729,["speed"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("pbull_rev_hi_to_max");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("from_any_to_brakes_med",::lib_A634::func_672F,["speed"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("pbull_brakes_med");
	lib_A5DA::func_1182("pbull_int_brake_pedal");
	lib_A5DA::func_1196();
	lib_A5DA::func_1195();
	lib_A5DA::func_118D(0.25,50);
	lib_A5DA::func_118F("main_oneshots","state_gas_off","from_any_to_gas_off",50,1);
	lib_A5DA::func_118E("state_gas_off",0.75,2);
	lib_A5DA::func_1184("state_rev_low","from_gas_off_to_rev_low");
	lib_A5DA::func_1184("state_rev_med","from_gas_off_to_rev_med");
	lib_A5DA::func_1184("state_rev_hi","from_gas_off_to_rev_hi");
	lib_A5DA::func_1184("state_brakes_skid","from_any_to_brakes_med");
	lib_A5DA::func_1184("state_reverse","from_stopped_to_reverse");
	lib_A5DA::func_1184("state_crash","from_any_to_crash");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_reverse",0.75,2);
	lib_A5DA::func_1184("state_brakes_skid","from_any_to_brakes_med");
	lib_A5DA::func_1184("state_reverse_gas_off","from_reverse_to_reverse_gas_off");
	lib_A5DA::func_1184("state_crash","from_any_to_crash");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_reverse_gas_off",0.75,2);
	lib_A5DA::func_1184("state_rev_low","from_gas_off_to_rev_low");
	lib_A5DA::func_1184("state_rev_med","from_gas_off_to_rev_med");
	lib_A5DA::func_1184("state_rev_hi","from_gas_off_to_rev_hi");
	lib_A5DA::func_1184("state_brakes_skid","from_any_to_brakes_med");
	lib_A5DA::func_1184("state_crash","from_any_to_crash");
	lib_A5DA::func_1184("state_reverse","from_stopped_to_reverse");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_rev_low",0.75,3);
	lib_A5DA::func_1184("state_brakes_skid","from_any_to_brakes_med");
	lib_A5DA::func_1184("state_gas_off","from_any_to_gas_off");
	lib_A5DA::func_1184("state_crash","from_any_to_crash");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_rev_med",0.75,3);
	lib_A5DA::func_1184("state_brakes_skid","from_any_to_brakes_med");
	lib_A5DA::func_1184("state_gas_off","from_any_to_gas_off");
	lib_A5DA::func_1184("state_crash","from_any_to_crash");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_rev_hi",0.75,3);
	lib_A5DA::func_1184("state_brakes_skid","from_any_to_brakes_med");
	lib_A5DA::func_1184("state_gas_off","from_any_to_gas_off");
	lib_A5DA::func_1184("state_crash","from_any_to_crash");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_brakes_skid",3.5,1);
	lib_A5DA::func_1184("state_rev_low","from_gas_off_to_rev_low");
	lib_A5DA::func_1184("state_rev_med","from_gas_off_to_rev_med");
	lib_A5DA::func_1184("state_rev_hi","from_gas_off_to_rev_hi");
	lib_A5DA::func_1184("state_gas_off","from_any_to_gas_off");
	lib_A5DA::func_1184("state_crash","from_any_to_crash");
	lib_A5DA::func_1184("state_reverse","from_stopped_to_reverse");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_crash",3.5,1);
	lib_A5DA::func_1184("state_rev_low","from_gas_off_to_rev_low");
	lib_A5DA::func_1184("state_rev_med","from_gas_off_to_rev_med");
	lib_A5DA::func_1184("state_rev_hi","from_gas_off_to_rev_hi");
	lib_A5DA::func_1184("state_gas_off","from_any_to_gas_off");
	lib_A5DA::func_1184("state_reverse","from_stopped_to_reverse");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_off",3.5,1);
	lib_A5DA::func_1184("state_rev_low","from_gas_off_to_rev_low");
	lib_A5DA::func_1184("state_rev_med","from_gas_off_to_rev_med");
	lib_A5DA::func_1184("state_rev_hi","from_gas_off_to_rev_hi");
	lib_A5DA::func_1184("state_gas_off","from_any_to_gas_off");
	lib_A5DA::func_1184("state_reverse","from_stopped_to_reverse");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_119D();
	lib_A5DA::func_117D("pbull_rpm_idle_vol_map",[[1,0.7],[30,0.45],[63,0]]);
	lib_A5DA::func_117D("pbull_rpm_med_vol_map",[[1,0],[40,0.8],[63,0]]);
	lib_A5DA::func_117D("pbull_rpm_med_pitch_map",[[1,0.8],[70,1.2]]);
	lib_A5DA::func_117D("pbull_rpm_hi_vol_map",[[1,0],[40,0.1],[63,0.3],[70,0.8]]);
	lib_A5DA::func_117D("pbull_int_sus_lo_vol_map",[[1,0.1],[40,0.75],[70,0.78]]);
	lib_A5DA::func_117D("pbull_reverse_loop_vol_map",[[1,1],[70,1]]);
	lib_A5DA::func_117D("dummy_map",[[1,1],[70,1]]);
	lib_A5DA::func_117D("pbull_rev_ducks_lp_env",[[0,1],[0.33,0.33],[0.66,0.33],[1.33,1]]);
	lib_A5DA::func_119C();
}

//Function Number: 2
lib_A634::func_397F()
{
	return 1;
}

//Function Number: 3
lib_A634::func_6731(param_00)
{
	var_01 = self;
	var_02 = var_01 lib_A5DA::func_11CA();
	param_00.var_6734 = 0;
	param_00.var_6733 = 0;
	param_00.var_6735 = 0;
	param_00.var_6732 = 0;
	param_00.var_22FB = spawnstruct();
	param_00.var_22FB.var_2300 = 0;
	param_00.var_22FB.var_2357 = undefined;
	param_00.var_22FB.var_2351 = 0;
	var_02 thread lib_A634::func_6730(param_00);
	var_02 thread lib_A634::func_6737(param_00);
}

//Function Number: 4
lib_A634::func_672E(param_00,param_01)
{
	var_02 = 0;
	if(param_01.var_6735 == 1)
	{
		var_02 = 1;
		param_01.var_6735 = 0;
		param_01.var_6734 = 0;
	}
	else
	{
		var_03 = param_00["speed"];
		if(!level.var_31D attackbuttonpressed() && param_01.var_6734 == 1)
		{
			param_01.var_6734 = 0;
			param_01.var_6733 = 0;
			var_02 = 1;
		}
	}

	return var_02;
}

//Function Number: 5
lib_A634::func_672F(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(level.var_31D buttonpresseddevonly("BUTTON_B") && var_03 > 20 && !level.var_31D attackbuttonpressed() && !param_01.var_6733)
	{
		param_01.var_6734 = 0;
		param_01.var_6733 = 0;
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 6
lib_A634::func_672A(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(level.var_31D attackbuttonpressed() && var_03 < 40 && param_01.var_6734 == 0 && var_03 > 3)
	{
		param_01.var_6734 = 1;
		param_01.var_6733 = 0;
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 7
lib_A634::func_672B(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(level.var_31D attackbuttonpressed() && var_03 > 40 && var_03 < 63 && param_01.var_6734 == 0)
	{
		param_01.var_6734 = 1;
		param_01.var_6733 = 0;
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 8
lib_A634::func_6729(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(level.var_31D attackbuttonpressed() && var_03 > 63 && var_03 < 67 && param_01.var_6734 == 0)
	{
		param_01.var_6734 = 1;
		param_01.var_6733 = 0;
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 9
lib_A634::func_672D(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(level.var_31D buttonpresseddevonly("BUTTON_B") && var_03 > 0 && !param_01.var_6733)
	{
		param_01.var_6733 = 1;
		thread lib_A634::func_6736(param_01);
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 10
lib_A634::func_672C(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(!level.var_31D buttonpresseddevonly("BUTTON_B"))
	{
		param_01.var_6734 = 0;
		param_01.var_6733 = 0;
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 11
lib_A634::func_6728(param_00,param_01)
{
	var_02 = 0;
	if(param_01.var_22FB.var_2300 == 1)
	{
		if(!isdefined(param_01.var_22FB.var_2357))
		{
			param_01.var_22FB.var_2357 = gettime();
			param_01.var_22FB.var_2351 = param_00["speed"];
		}
		else
		{
			var_03 = gettime() - param_01.var_22FB.var_2357;
			if(var_03 > 300)
			{
				var_04 = param_01.var_22FB.var_2351 - param_00["speed"];
				if(var_04 > 3)
				{
					param_01.var_6734 = 0;
					param_01.var_6733 = 0;
					var_02 = 1;
				}

				param_01.var_22FB.var_2300 = 0;
				param_01.var_22FB.var_2357 = undefined;
			}
		}
	}

	return var_02;
}

//Function Number: 12
lib_A634::func_6BB2()
{
	var_00 = "honk";
	level.var_31D notifyonplayercommand(var_00,"+usereload");
	for(;;)
	{
		level.var_31D waittill(var_00);
		level.var_31D lib_A5F1::func_8724("pbull_honk");
		wait(0.3);
	}
}

//Function Number: 13
lib_A634::func_6736(param_00)
{
	wait(0.5);
	while(param_00.var_6733)
	{
		level.var_31D lib_A5F1::func_8724("pbull_reverse_beep");
		wait(1);
	}
}

//Function Number: 14
lib_A634::func_6730(param_00,param_01)
{
	for(;;)
	{
		level.var_6BB6 waittill("veh_contact",var_02,var_03,var_04,var_05,var_06);
		param_00.var_22FB.var_2300 = 1;
	}
}

//Function Number: 15
lib_A634::func_6737(param_00)
{
	for(;;)
	{
		self waittill("audio_shift",var_01);
		lib_A5F1::func_8724("pbull_int_shift");
		var_02 = self veh_getspeed();
		if(var_01 == "gear_up")
		{
			if(var_02 > 35)
			{
				param_00.var_6735 = 1;
				param_00.var_6732 = 0;
			}

			continue;
		}

		if(var_01 == "gear_down")
		{
			if(var_02 < 35)
			{
				param_00.var_6735 = 0;
				param_00.var_6732 = 1;
				lib_A5F1::func_8724("pbull_downshift_to_idle");
			}
		}
	}
}