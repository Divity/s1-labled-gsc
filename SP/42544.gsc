/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42544.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 25 ms
 * Timestamp: 4/20/2022 8:23:49 PM
*******************************************************************/

//Function Number: 1
lib_A630::func_8721()
{
	var_00 = 1;
	var_01 = 0.8;
	var_02 = 0;
	var_03 = 10;
	var_04 = 15;
	var_05 = var_04 - var_02;
	var_06 = 0.7;
	var_07 = 1;
	var_08 = 0.8;
	var_09 = 1;
	var_0A = 1.1;
	var_0B = 0;
	var_0C = 0.5;
	var_0D = 0.85;
	var_0E = 1;
	var_0F = 0;
	var_10 = 0.5;
	var_11 = 1;
	var_12 = 0.8;
	var_13 = 1.1;
	var_14 = 0;
	var_15 = 1;
	var_16 = 0.5;
	var_17 = 1.5;
	lib_A5DA::func_118C("pdrone_security");
	lib_A5DA::func_1187(3);
	lib_A5DA::func_1188("sdrone_thrusters_lw");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","sdrone_thrusters_lw");
	lib_A5DA::func_1183("volume","pdrone_security_loopset_vol_env");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated");
	lib_A5DA::func_1183("pitch","pdrone_security_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("sdrone_thrusters_md");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","sdrone_thrusters_hi");
	lib_A5DA::func_1183("volume","pdrone_security_loopset_vol_env");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated");
	lib_A5DA::func_1183("pitch","pdrone_security_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("sdrone_thrusters_hi");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","sdrone_thrusters_md");
	lib_A5DA::func_1183("volume","pdrone_security_loopset_vol_env");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated");
	lib_A5DA::func_1183("pitch","pdrone_security_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("sdrone_thrusters_main_lp");
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_1183("volume","pdrone_security_rotor_vel2vol");
	lib_A5DA::func_1183("volume","pdrone_security_loopset_vol_env");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated",0.65,0.3);
	lib_A5DA::func_1183("pitch","pdrone_security_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	if(!level.currentgen)
	{
		lib_A5DA::func_1188("sdrone_thrusters_whine_lp");
		lib_A5DA::func_118B("speed",0.65,0.3);
		lib_A5DA::func_1183("volume","pdrone_security_whine_vel2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("doppler_exaggerated",0.65,0.3);
		lib_A5DA::func_1183("pitch","pdrone_security_doppler2pch");
		lib_A5DA::func_119B();
		lib_A5DA::func_1198();
		lib_A5DA::func_1188("pdrone_security_pink_hipass_lp");
		lib_A5DA::func_118B("speed");
		lib_A5DA::func_1183("volume","pdrone_security_noise_hi_vel2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("distance");
		lib_A5DA::func_1183("volume","pdrone_security_noise_hi_dist2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("doppler_exaggerated",0.65,0.3);
		lib_A5DA::func_1183("pitch","pdrone_security_doppler2pch");
		lib_A5DA::func_119B();
		lib_A5DA::func_1198();
		lib_A5DA::func_1188("pdrone_security_pink_lopass_lp");
		lib_A5DA::func_118B("speed");
		lib_A5DA::func_1183("volume","pdrone_security_noise_lo_vel2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("distance");
		lib_A5DA::func_1183("volume","pdrone_security_noise_lo_dist2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("doppler_exaggerated",0.65,0.3);
		lib_A5DA::func_1183("pitch","pdrone_security_doppler2pch");
		lib_A5DA::func_119B();
		lib_A5DA::func_1198();
	}

	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_118A("pdrone_security_flyby","pdrone_security_flyby_duck_envelope",0.25,1,["sdrone_by_1","sdrone_by_2"]);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("pitch","pdrone_security_flyby_vel2pch");
	lib_A5DA::func_1183("volume","pdrone_security_flyby_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated",1,1);
	lib_A5DA::func_1183("pitch","pdrone_security_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("foo_oneshot","pdrone_security_flyby_duck_envelope",0.25,1,["sdrone_by_1","sdrone_by_2"]);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("pitch","pdrone_security_flyby_vel2pch");
	lib_A5DA::func_1183("volume","pdrone_security_flyby_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated",1,1);
	lib_A5DA::func_1183("pitch","pdrone_security_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_state_hover",::lib_A630::func_67A6,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flying",::lib_A630::func_67A4,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("foo_oneshot");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_distant",::lib_A630::func_67A2,["distance2d"]);
	lib_A5DA::func_1180("sdrone_thrusters_main_lp");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flyby",::lib_A630::func_67A3,["distance2d"]);
	lib_A5DA::func_1180("ALL");
	if(!0)
	{
		lib_A5DA::func_1182("pdrone_security_flyby");
	}

	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_deathspin",::lib_A630::func_67A0);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_destruct",::lib_A630::func_67A1);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_off",::lib_A630::func_67A7);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1195();
	lib_A5DA::func_118D(0.25,50);
	lib_A5DA::func_118F("main_oneshots","state_hover","to_state_hover",50,1);
	lib_A5DA::func_118E("state_off");
	lib_A5DA::func_1184("state_hover","to_state_hover");
	lib_A5DA::func_1184("state_distant","to_state_distant");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_hover");
	lib_A5DA::func_1184("state_flyby","to_state_flyby");
	lib_A5DA::func_1184("state_flying","to_state_flying");
	lib_A5DA::func_1184("state_distant","to_state_distant");
	lib_A5DA::func_1184("state_deathspin","to_state_deathspin");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_flying");
	lib_A5DA::func_1184("state_flyby","to_state_flyby");
	lib_A5DA::func_1184("state_distant","to_state_distant");
	lib_A5DA::func_1184("state_deathspin","to_state_deathspin");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_distant");
	lib_A5DA::func_1184("state_hover","to_state_hover");
	lib_A5DA::func_1184("state_flying","to_state_flying");
	lib_A5DA::func_1184("state_flyby","to_state_flyby");
	lib_A5DA::func_1184("state_deathspin","to_state_deathspin");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_flyby",3);
	lib_A5DA::func_1184("state_hover","to_state_hover");
	lib_A5DA::func_1184("state_flying","to_state_flying");
	lib_A5DA::func_1184("state_flyby","to_state_flyby");
	lib_A5DA::func_1184("state_distant","to_state_distant");
	lib_A5DA::func_1184("state_deathspin","to_state_deathspin");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_deathspin");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_destruct");
	lib_A5DA::func_1184("state_off","to_state_off");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_119D();
	lib_A5DA::func_117D("pdrone_security_foo_env_function",::lib_A630::func_397F);
	lib_A5DA::func_117D("pdrone_security_loopset_vol_env",[[var_04 * 0,0.65 * var_00],[var_04 * 0.0204,0.66155 * var_00],[var_04 * 0.0816,0.670545 * var_00],[var_04 * 0.1836,0.688885 * var_00],[var_04 * 0.3265,0.7274899 * var_00],[var_04 * 0.5102,0.80554 * var_00],[var_04 * 0.7346,0.926535 * var_00],[var_04 * 1,1 * var_00]]);
	lib_A5DA::func_117D("sdrone_thrusters_lw",[[var_04 * 0,1],[var_04 * 0.333,1],[var_04 * 0.666,0],[var_04 * 1,0]]);
	lib_A5DA::func_117D("sdrone_thrusters_md",[[var_04 * 0,0],[var_04 * 0.333,1],[var_04 * 0.666,1],[var_04 * 1,0]]);
	lib_A5DA::func_117D("sdrone_thrusters_hi",[[var_04 * 0,0],[var_04 * 0.333,0],[var_04 * 0.666,1],[var_04 * 1,1]]);
	lib_A5DA::func_117D("pdrone_security_rotor_vel2vol",[[var_02,var_06],[var_04,var_07]]);
	lib_A5DA::func_117D("pdrone_security_rotor_vel2pch",[[var_02,var_08],[var_03,var_09],[var_04,var_0A]]);
	lib_A5DA::func_117D("pdrone_security_whine_vel2vol",[[var_02,var_0B],[var_02 + var_04 - var_02 * 0.666,var_0B + var_0C - var_0B * 0],[var_04,var_0C]]);
	lib_A5DA::func_117D("pdrone_security_whine_vel2pch",[[var_02,var_0D],[var_04,var_0E]]);
	lib_A5DA::func_117D("pdrone_security_noise_lo_vel2vol",[[var_02,var_0F],[var_02 + var_04 - var_02 * 0.66,var_0B],[var_04,var_10]]);
	lib_A5DA::func_117D("pdrone_security_noise_hi_vel2vol",[[var_02,var_0F],[var_02 + var_04 - var_02 * 0.66,var_0B],[var_04,var_11]]);
	lib_A5DA::func_117D("pdrone_security_noise_vel2pch",[[var_02,var_12],[var_04,var_12]]);
	lib_A5DA::func_117D("pdrone_security_noise_hi_dist2vol",[[lib_A5DA::func_A3A9(0),var_11],[lib_A5DA::func_A3A9(4),var_11 * 0.25],[lib_A5DA::func_A3A9(6),var_11 * 0.4],[lib_A5DA::func_A3A9(8),var_0F]]);
	lib_A5DA::func_117D("pdrone_security_noise_lo_dist2vol",[[lib_A5DA::func_A3A9(3),var_10],[lib_A5DA::func_A3A9(12),var_0F]]);
	lib_A5DA::func_117D("pdrone_security_flyby_vel2vol",[[var_02,var_14],[var_04,var_15]]);
	lib_A5DA::func_117D("pdrone_security_flyby_vel2pch",[[var_02,var_16],[var_04,var_17]]);
	lib_A5DA::func_117D("pdrone_security_flyby_duck_envelope",[[0,1],[0.33,0.33],[0.66,0.33],[1.33,1]]);
	lib_A5DA::func_117D("pdrone_security_doppler2pch",[[0,0],[2,2]]);
	lib_A5DA::func_119C();
}

//Function Number: 2
lib_A630::func_397F()
{
	return 1;
}

//Function Number: 3
lib_A630::func_67A7()
{
	return 0;
}

//Function Number: 4
lib_A630::func_67A6(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_2B70(var_04);
	if(var_03 <= 5.1 && var_05 < 25)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 5
lib_A630::func_67A4(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_2B70(var_04);
	if(var_03 > 5.1 && var_05 < 25)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 6
lib_A630::func_67A2(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["distance2d"];
	var_04 = lib_A5DA::func_2B70(var_03);
	if(var_04 >= 25)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 7
lib_A630::func_67A3(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["distance2d"];
	var_04 = lib_A5DA::func_2B70(var_03);
	if(!isdefined(param_01.var_391B))
	{
		param_01.var_391B = spawnstruct();
		param_01.var_391B.var_6F48 = var_04;
		param_01.var_391B.var_6F39 = 0;
	}
	else
	{
		var_05 = var_04 - param_01.var_391B.var_6F48;
		if(var_05 < 0 && var_04 < 6)
		{
			if(0)
			{
				var_02 = ["pdrone_security_flyby"];
			}
			else
			{
				var_02 = 1;
			}
		}

		param_01.var_391B.var_6F48 = var_04;
		param_01.var_391B.var_6F39 = var_05;
	}

	return var_02;
}

//Function Number: 8
lib_A630::func_67A5(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["distance2d"];
	var_04 = param_00["relative_speed"];
	var_05 = lib_A5DA::func_2B70(var_03);
	if(var_05 < 30)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 9
lib_A630::func_67A0(param_00,param_01)
{
	return 0;
}

//Function Number: 10
lib_A630::func_67A1(param_00,param_01)
{
	return 0;
}

//Function Number: 11
lib_A630::func_67AA(param_00,param_01)
{
	if(!isdefined(param_01.var_4E7C))
	{
		param_01.var_4E7C = 1;
		param_01.var_4E7B = 1;
		param_01.var_5C30 = 0.7;
		param_01.var_5A10 = 1.2;
		param_01.var_868B = 0.65;
		param_01.var_8686 = 0.3;
	}

	if(abs(param_01.var_4E7B - param_01.var_4E7C) < 0.0001)
	{
		param_01.var_4E7C = randomfloatrange(param_01.var_5C30,param_01.var_5A10);
	}

	if(param_01.var_4E7C > param_01.var_4E7B)
	{
		var_02 = param_01.var_868B;
	}
	else
	{
		var_02 = var_02.var_8686;
	}

	param_01.var_4E7B = param_01.var_4E7B + var_02 * param_01.var_4E7C - param_01.var_4E7B;
	return param_00 * param_01.var_4E7B;
}

//Function Number: 12
lib_A630::func_67A9(param_00,param_01)
{
	if(!isdefined(param_01.var_4E7C))
	{
		param_01.var_A346 = 0;
	}

	param_01.var_A346 = param_01.var_A346 + 1;
	var_02 = gettime() * 0.001;
	var_03 = 0;
	var_04 = 2;
	var_05 = 2;
	var_06 = 1;
	var_07 = function_00FE(var_02,var_03,var_04,var_05,1);
	return param_00 * 1;
}

//Function Number: 13
lib_A630::func_67A8(param_00,param_01)
{
	if(!isdefined(param_01.var_4E7C) || gettime() >= param_01.var_4E7D + param_01.var_4E60)
	{
		param_01.var_4E7B = 1;
		param_01.var_4E7C = randomfloatrange(0.7,1.2);
		param_01.var_4E7D = gettime();
		param_01.var_4E60 = randomintrange(500,500);
	}

	var_02 = param_01.var_4E7C - param_01.var_4E7B / param_01.var_4E60;
	param_01.var_4E7B = param_01.var_4E7B + var_02;
	return param_00 * 1;
}