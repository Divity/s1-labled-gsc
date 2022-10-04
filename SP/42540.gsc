/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42540.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 37
 * Decompile Time: 59 ms
 * Timestamp: 4/20/2022 8:23:48 PM
*******************************************************************/

//Function Number: 1
lib_A62C::func_8722()
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
	lib_A5DA::func_118C("pdrone_swarm");
	lib_A5DA::func_1187(0.25);
	lib_A5DA::func_1188("pdrn_swarm_rotor_ww");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","pdrn_rotor_vel2vol");
	lib_A5DA::func_1183("pitch","pdrn_rotor_vel2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated");
	lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("pdrn_swarm_rotor_main_lp");
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_1183("volume","pdrn_rotor_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated",0.65,0.3);
	lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_118A("pdrone_flyby","pdrn_flyby_duck_envelope",0.25,1,["pdrn_by_comp"]);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("pitch","pdrn_flyby_vel2pch");
	lib_A5DA::func_1183("volume","pdrn_flyby_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated",1,1);
	lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_state_hover",::lib_A62C::func_67B1,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flying",::lib_A62C::func_67B0,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_distant",::lib_A62C::func_67AF,["distance2d"]);
	lib_A5DA::func_1180("pdrn_swarm_rotor_main_lp");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flyby",::lib_A62C::func_6769,["distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("pdrone_flyby");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_deathspin",::lib_A62C::func_6766);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_destruct",::lib_A62C::func_6767);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_off",::lib_A62C::func_676D);
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
	lib_A5DA::func_117D("pdrn_loopset_vol_env",[[var_04 * 0,0.65 * var_00],[var_04 * 0.0204,0.66155 * var_00],[var_04 * 0.0816,0.670545 * var_00],[var_04 * 0.1836,0.688885 * var_00],[var_04 * 0.3265,0.7274899 * var_00],[var_04 * 0.5102,0.80554 * var_00],[var_04 * 0.7346,0.926535 * var_00],[var_04 * 1,1 * var_00]]);
	lib_A5DA::func_117D("pdrn_rotor_vel2vol",[[var_02,var_07],[var_04,var_07]]);
	lib_A5DA::func_117D("pdrn_rotor_vel2pch",[[var_02,var_08],[var_03,var_09],[var_04,var_0A]]);
	lib_A5DA::func_117D("pdrn_flyby_vel2vol",[[var_02,var_14],[var_04,var_15]]);
	lib_A5DA::func_117D("pdrn_flyby_vel2pch",[[var_02,var_16],[var_04,var_17]]);
	lib_A5DA::func_117D("pdrn_flyby_duck_envelope",[[0,1],[1,1]]);
	lib_A5DA::func_117D("pdrn_doppler2pch",[[0,0],[2,2]]);
	lib_A5DA::func_119C();
}

//Function Number: 2
lib_A62C::func_67B1(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_2B70(var_04);
	if(var_03 <= 5.1 && var_05 < 50)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 3
lib_A62C::func_67B0(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_2B70(var_04);
	if(var_03 > 5.1 && var_05 < 50)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 4
lib_A62C::func_67AF(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["distance2d"];
	var_04 = lib_A5DA::func_2B70(var_03);
	if(var_04 >= 50)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 5
lib_A62C::func_871D()
{
	var_00 = 0;
	var_01 = 10;
	var_02 = 30;
	var_03 = var_02 - var_00;
	var_04 = 0.4;
	var_05 = 0.4;
	var_06 = var_05 - var_04;
	var_07 = 1.5;
	var_08 = 1.9;
	var_09 = var_08 - var_07;
	var_0A = 270;
	var_0B = 1080;
	var_0C = 0;
	var_0D = 1;
	var_0E = var_0D - var_0C;
	var_0F = 1;
	var_10 = 2;
	var_11 = var_10 - var_0F;
	var_12 = 0;
	var_13 = 0.45;
	var_14 = var_13 - var_12;
	var_15 = 0.9;
	var_16 = 1.4;
	var_17 = var_16 - var_15;
	var_18 = 0;
	var_19 = 0.5;
	var_1A = var_02 * 0;
	var_1B = var_02 * 0.65;
	var_1C = 288;
	var_1D = 720;
	var_1E = 0;
	var_1F = 1;
	var_20 = var_02 * 0.6;
	var_21 = var_02 * 1;
	var_22 = var_21 - var_20;
	var_23 = 0.85;
	var_24 = 1.25;
	var_25 = 30;
	var_26 = 0;
	var_27 = 0.8;
	var_28 = 0.75;
	var_29 = 1.25;
	var_2A = 100;
	var_2B = 200;
	var_2C = 500;
	var_2D = 6;
	var_2E = 5;
	var_2F = undefined;
	var_30 = 0.6;
	var_31 = 0.5;
	lib_A5DA::func_118C("pdrone_atlas",::lib_A62C::func_6762);
	lib_A5DA::func_117D("atlasdrn_realhelo_spd2vol",[[var_00,var_04],[var_02,var_05]]);
	lib_A5DA::func_117D("atlasdrn_realhelo_spd2pch",[[var_00,var_07],[var_02,var_08]]);
	lib_A5DA::func_117D("atlasdrn_snthhelo_spd2pch",[[var_02 * 0,var_0F + 0 * var_11],[var_02 * 0.0204,var_0F + 0.033 * var_11],[var_02 * 0.0816,var_0F + 0.0587 * var_11],[var_02 * 0.1836,var_0F + 0.1111 * var_11],[var_02 * 0.3265,var_0F + 0.2214 * var_11],[var_02 * 0.5102,var_0F + 0.4444 * var_11],[var_02 * 0.7346,var_0F + 0.7901 * var_11],[var_02 * 1,var_0F + 1 * var_11]]);
	lib_A5DA::func_117D("atlasdrn_snthhelo_dst2vol",[[var_0A,var_0D],[var_0B,var_0C]]);
	lib_A5DA::func_117D("atlasdrn_snthhelo_spd2vol",[[var_00,var_0C],[var_02,var_0D]]);
	lib_A5DA::func_117D("atlasdrn_hover_spd2pch",[[var_00,var_15],[var_02,var_16]]);
	lib_A5DA::func_117D("atlasdrn_hover_spd2vol",[[var_00,var_13],[var_02,var_12]]);
	lib_A5DA::func_117D("atlasdrn_travelslw_spd2vol",[[var_1A,var_19],[var_1B,var_18]]);
	lib_A5DA::func_117D("atlasdrn_travelfst_dst2vol",[[var_1C,var_1F],[var_1D,var_1E]]);
	lib_A5DA::func_117D("atlasdrn_travelfst_spd2vol",[[var_20 + var_22 * 0,var_1F * 0],[var_20 + var_22 * 0.0204,var_1F * 0.033],[var_20 + var_22 * 0.0816,var_1F * 0.0587],[var_20 + var_22 * 0.1836,var_1F * 0.1111],[var_20 + var_22 * 0.3265,var_1F * 0.2214],[var_20 + var_22 * 0.5102,var_1F * 0.4444],[var_20 + var_22 * 0.7346,var_1F * 0.7901],[var_20 + var_22 * 1,var_1F * 1]]);
	lib_A5DA::func_117D("atlasdrn_travelfst_spd2pch",[[var_00,var_23],[var_02,var_24]]);
	lib_A5DA::func_117D("atlasdrn_flyby_vel2vol",[[var_00,var_26],[var_03 * 0.25,var_27 * 0.5],[var_02,var_27]]);
	lib_A5DA::func_117D("atlasdrn_flyby_vel2pch",[[var_00,var_28],[var_02,var_29]]);
	lib_A5DA::func_117D("atlasdrn_doppler2pch",[[0,0],[2,2]]);
	lib_A5DA::func_117D("atlasdrn_flyby_duck_envelope",[[0,1],[0.4,0.7],[0.6,0.5],[0.8,0.7],[1,1]]);
	lib_A5DA::func_1187(1,var_30,var_31);
	lib_A5DA::func_1188("atlasdrn_real_helo_lp");
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","atlasdrn_realhelo_spd2vol");
	lib_A5DA::func_1183("pitch","atlasdrn_realhelo_spd2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("DOPPLER_EXAGGERATED");
	lib_A5DA::func_1183("pitch","atlasdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("atlasdrn_snth_helo_lp");
	lib_A5DA::func_118B("DISTANCE");
	lib_A5DA::func_1183("volume","atlasdrn_snthhelo_dst2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","atlasdrn_snthhelo_spd2vol");
	lib_A5DA::func_1183("pitch","atlasdrn_snthhelo_spd2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("DOPPLER");
	lib_A5DA::func_1183("pitch","atlasdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("atlasdrn_hover_lp");
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","atlasdrn_hover_spd2vol");
	lib_A5DA::func_1183("pitch","atlasdrn_hover_spd2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("atlasdrn_travel_fst_lp");
	lib_A5DA::func_118B("DISTANCE2D");
	lib_A5DA::func_1183("volume","atlasdrn_travelfst_dst2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","atlasdrn_travelfst_spd2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("DOPPLER");
	lib_A5DA::func_1183("pitch","atlasdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_118A("atlasdrn_flyby1","atlasdrn_flyby_duck_envelope",0.25);
	lib_A5DA::func_118B("SPEED",1,1);
	lib_A5DA::func_1183("pitch","atlasdrn_flyby_vel2pch");
	lib_A5DA::func_1183("volume","atlasdrn_flyby_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_state_hover",::lib_A62C::func_0DAB,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flying",::lib_A62C::func_0DA9,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_distant",::lib_A62C::func_0DA7,["distance2d"]);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flyby",::lib_A62C::func_0DA8,["distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("atlasdrn_flyby1");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_deathspin",::lib_A62C::func_0DA5);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_destruct",::lib_A62C::func_0DA6);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_off",::lib_A62C::func_0DAC);
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
	lib_A5DA::func_119C();
}

//Function Number: 6
lib_A62C::func_6762(param_00)
{
	var_01 = self;
	var_02 = var_01 lib_A5DA::func_11CA();
	var_02 thread lib_A62C::func_0DAD();
}

//Function Number: 7
lib_A62C::func_0DAC()
{
	return 0;
}

//Function Number: 8
lib_A62C::func_0DAB(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_2B70(var_04);
	if(var_03 <= 5.1 && var_05 < 20)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 9
lib_A62C::func_0DA9(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_2B70(var_04);
	if(var_03 > 5.1 && var_05 < 20)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 10
lib_A62C::func_0DA7(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["distance2d"];
	var_04 = lib_A5DA::func_2B70(var_03);
	if(var_04 >= 20)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 11
lib_A62C::func_0DA8(param_00,param_01)
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
			var_02 = 1;
		}

		param_01.var_391B.var_6F48 = var_04;
		param_01.var_391B.var_6F39 = var_05;
	}

	return var_02;
}

//Function Number: 12
lib_A62C::func_0DAA(param_00,param_01)
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

//Function Number: 13
lib_A62C::func_0DA5(param_00,param_01)
{
	return 0;
}

//Function Number: 14
lib_A62C::func_0DA6(param_00,param_01)
{
	return 0;
}

//Function Number: 15
lib_A62C::func_0DAD()
{
	self endon("death");
	var_00 = self;
	var_01 = 360;
	var_02 = level.var_31D.var_2E6;
	var_03 = 0.25;
	var_04 = 17.6;
	while(isdefined(var_00))
	{
		if(distance(level.var_31D.var_2E6,var_00.var_2E6) < var_01)
		{
			var_05 = length(level.var_31D getvelocity()) / var_04;
			if(var_05 > 0.5)
			{
				if(lib_A5D2::func_FE9(20))
				{
					var_00 lib_A59A::play_sound_on_entity("atlasdrn_lens_focus");
					wait(randomfloatrange(2,5));
				}
			}

			var_02 = level.var_31D.var_2E6;
		}

		wait(var_03);
	}
}

//Function Number: 16
lib_A62C::func_871E()
{
	var_00 = 0;
	var_01 = 30;
	var_02 = var_01 - var_00;
	var_03 = 0.4;
	var_04 = 0.4;
	var_05 = 1.5;
	var_06 = 1.9;
	var_07 = 270;
	var_08 = 3600;
	var_09 = 0;
	var_0A = 1;
	var_0B = var_0A - var_09;
	var_0C = 1;
	var_0D = 2;
	var_0E = var_0D - var_0C;
	var_0F = 0;
	var_10 = 0.45;
	var_11 = var_10 - var_0F;
	var_12 = 0.9;
	var_13 = 1.4;
	var_14 = var_13 - var_12;
	var_15 = 288;
	var_16 = 720;
	var_17 = 0;
	var_18 = 1;
	var_19 = var_01 * 0.6;
	var_1A = var_01 * 1;
	var_1B = var_1A - var_19;
	var_1C = 0.85;
	var_1D = 1.25;
	var_1E = 0;
	var_1F = 1;
	var_20 = 0.5;
	var_21 = 1.5;
	var_22 = 100;
	var_23 = 200;
	var_24 = 500;
	var_25 = 6;
	var_26 = 20;
	var_27 = 5;
	var_28 = undefined;
	var_29 = 0.3;
	var_2A = 0.3;
	lib_A5DA::func_118C("pdrone_atlas_large");
	lib_A5DA::func_1187(3,var_29,var_2A);
	lib_A5DA::func_1188("adrn_real_helo_lp");
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","adrn_realhelo_spd2vol");
	lib_A5DA::func_1183("pitch","adrn_realhelo_spd2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("DOPPLER_EXAGGERATED");
	lib_A5DA::func_1183("pitch","adrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("adrn_snth_helo_lp");
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","adrn_snthhelo_spd2vol");
	lib_A5DA::func_1183("pitch","adrn_snthhelo_spd2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("DOPPLER");
	lib_A5DA::func_1183("pitch","adrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("adrn_hover_lp");
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","adrn_hover_spd2vol");
	lib_A5DA::func_1183("pitch","adrn_hover_spd2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("adrn_travel_fst_lp");
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","adrn_travelfst_spd2vol");
	lib_A5DA::func_1183("pitch","adrn_travelfst_spd2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("DOPPLER");
	lib_A5DA::func_1183("pitch","adrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_118A("adrn_flyby1","adrn_flyby_duckenvelope",0.25);
	lib_A5DA::func_118B("SPEED",1,1);
	lib_A5DA::func_1183("pitch","adrn_flyby_vel2pch");
	lib_A5DA::func_1183("volume","adrn_flyby_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_state_hover",::lib_A62C::func_0871,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flying",::lib_A62C::func_086F,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_distant",::lib_A62C::func_086D,["distance2d"]);
	lib_A5DA::func_1180(["adrn_real_helo_lp"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flyby",::lib_A62C::func_086E,["distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("adrn_flyby1");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_deathspin",::lib_A62C::func_086B);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_destruct",::lib_A62C::func_086C);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_off",::lib_A62C::func_0872);
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
	lib_A5DA::func_117D("adrn_realhelo_spd2vol",[[0,0.2827],[30,0.466]]);
	lib_A5DA::func_117D("adrn_realhelo_spd2pch",[[0,1.45],[22.5178,1.7906],[30,2]]);
	lib_A5DA::func_117D("adrn_snthhelo_spd2vol",[[0,0.0026],[4.2043,0],[12.4703,0.144],[30,0.5]]);
	lib_A5DA::func_117D("adrn_snthhelo_spd2pch",[[0,0.555],[30,2]]);
	lib_A5DA::func_117D("adrn_snthhelo_dst2vol",[[var_07,var_0A],[var_08,var_09]]);
	lib_A5DA::func_117D("adrn_hover_spd2vol",[[0,0.0974],[2.3515,0.0958],[5.4157,0.1084],[13.4679,0.2027],[18.171,0.2403],[30,0.3]]);
	lib_A5DA::func_117D("adrn_hover_spd2pch",[[0,0.8584],[30,1.25]]);
	lib_A5DA::func_117D("adrn_travelfst_spd2vol",[[0,0],[7.4109,0],[13.9667,0.0385],[19.1686,0.1026],[23.3729,0.1686],[26.2233,0.2456],[30,0.35]]);
	lib_A5DA::func_117D("adrn_travelfst_spd2pch",[[0,0.8584],[30,1.25]]);
	lib_A5DA::func_117D("adrn_travelfst_dst2vol",[[0,0.2827],[30,0.466]]);
	lib_A5DA::func_117D("adrn_flyby_vel2vol",[[var_00,var_1E],[var_02 * 0.25,var_1F * 0.5],[var_01,var_1F]]);
	lib_A5DA::func_117D("adrn_flyby_vel2pch",[[var_00,var_20],[var_01,var_21]]);
	lib_A5DA::func_117D("adrn_doppler2pch",[[0,0],[2,2]]);
	lib_A5DA::func_117D("adrn_flyby_duckenvelope",[[0,1],[0.4,0.7],[0.6,0.5],[0.8,0.7],[1,1]]);
	lib_A5DA::func_119C();
}

//Function Number: 17
lib_A62C::func_0872()
{
	return 0;
}

//Function Number: 18
lib_A62C::func_0871(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_2B70(var_04);
	if(var_03 <= 5.1 && var_05 < 30)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 19
lib_A62C::func_086F(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_2B70(var_04);
	if(var_03 > 5.1 && var_05 < 30)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 20
lib_A62C::func_086D(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["distance2d"];
	var_04 = lib_A5DA::func_2B70(var_03);
	if(var_04 >= 30)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 21
lib_A62C::func_086E(param_00,param_01)
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
			var_02 = 1;
		}

		param_01.var_391B.var_6F48 = var_04;
		param_01.var_391B.var_6F39 = var_05;
	}

	return var_02;
}

//Function Number: 22
lib_A62C::func_0870(param_00,param_01)
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

//Function Number: 23
lib_A62C::func_086B(param_00,param_01)
{
	return 0;
}

//Function Number: 24
lib_A62C::func_086C(param_00,param_01)
{
	return 0;
}

//Function Number: 25
lib_A62C::func_871F()
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
	lib_A5DA::func_118C("pdrone");
	lib_A5DA::func_1187(3);
	lib_A5DA::func_1188("pdrn_rotor_ww_lw");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","pdrn_rotor_ww_lw");
	lib_A5DA::func_1183("volume","pdrn_loopset_vol_env");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated");
	lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("pdrn_rotor_ww_md");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","pdrn_rotor_ww_hi");
	lib_A5DA::func_1183("volume","pdrn_loopset_vol_env");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated");
	lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("pdrn_rotor_ww_hi");
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","pdrn_rotor_ww_md");
	lib_A5DA::func_1183("volume","pdrn_loopset_vol_env");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated");
	lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("pdrn_rotor_main_lp");
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_1183("volume","pdrn_rotor_vel2vol");
	lib_A5DA::func_1183("volume","pdrn_loopset_vol_env");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated",0.65,0.3);
	lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	if(!level.currentgen)
	{
		lib_A5DA::func_1188("pdrn_whine_lp");
		lib_A5DA::func_118B("speed",0.65,0.3);
		lib_A5DA::func_1183("volume","pdrn_whine_vel2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("doppler_exaggerated",0.65,0.3);
		lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
		lib_A5DA::func_119B();
		lib_A5DA::func_1198();
		lib_A5DA::func_1188("pdrn_pink_hipass_lp");
		lib_A5DA::func_118B("speed");
		lib_A5DA::func_1183("volume","pdrn_noise_hi_vel2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("distance");
		lib_A5DA::func_1183("volume","pdrn_noise_hi_dist2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("doppler_exaggerated",0.65,0.3);
		lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
		lib_A5DA::func_119B();
		lib_A5DA::func_1198();
		lib_A5DA::func_1188("pdrn_pink_lopass_lp");
		lib_A5DA::func_118B("speed");
		lib_A5DA::func_1183("volume","pdrn_noise_lo_vel2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("distance");
		lib_A5DA::func_1183("volume","pdrn_noise_lo_dist2vol");
		lib_A5DA::func_119B();
		lib_A5DA::func_118B("doppler_exaggerated",0.65,0.3);
		lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
		lib_A5DA::func_119B();
		lib_A5DA::func_1198();
	}

	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_118A("pdrone_flyby","pdrn_flyby_duck_envelope",0.25,1,["pdrn_by_1","pdrn_by_2"]);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("pitch","pdrn_flyby_vel2pch");
	lib_A5DA::func_1183("volume","pdrn_flyby_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated",1,1);
	lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("foo_oneshot","pdrn_flyby_duck_envelope",0.25,1,["pdrn_by_1","pdrn_by_2"]);
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("pitch","pdrn_flyby_vel2pch");
	lib_A5DA::func_1183("volume","pdrn_flyby_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("doppler_exaggerated",1,1);
	lib_A5DA::func_1183("pitch","pdrn_doppler2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_state_hover",::lib_A62C::func_676C,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flying",::lib_A62C::func_676A,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1182("foo_oneshot");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_distant",::lib_A62C::func_6768,["distance2d"]);
	lib_A5DA::func_1180("pdrn_rotor_main_lp");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flyby",::lib_A62C::func_6769,["distance2d"]);
	lib_A5DA::func_1180("ALL");
	if(!0)
	{
		lib_A5DA::func_1182("pdrone_flyby");
	}

	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_deathspin",::lib_A62C::func_6766);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_destruct",::lib_A62C::func_6767);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_off",::lib_A62C::func_676D);
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
	lib_A5DA::func_117D("pdrn_foo_env_function",::lib_A62C::func_397F);
	lib_A5DA::func_117D("pdrn_loopset_vol_env",[[var_04 * 0,0.65 * var_00],[var_04 * 0.0204,0.66155 * var_00],[var_04 * 0.0816,0.670545 * var_00],[var_04 * 0.1836,0.688885 * var_00],[var_04 * 0.3265,0.7274899 * var_00],[var_04 * 0.5102,0.80554 * var_00],[var_04 * 0.7346,0.926535 * var_00],[var_04 * 1,1 * var_00]]);
	lib_A5DA::func_117D("pdrn_rotor_ww_lw",[[var_04 * 0,1],[var_04 * 0.333,1],[var_04 * 0.666,0],[var_04 * 1,0]]);
	lib_A5DA::func_117D("pdrn_rotor_ww_md",[[var_04 * 0,0],[var_04 * 0.333,1],[var_04 * 0.666,1],[var_04 * 1,0]]);
	lib_A5DA::func_117D("pdrn_rotor_ww_hi",[[var_04 * 0,0],[var_04 * 0.333,0],[var_04 * 0.666,1],[var_04 * 1,1]]);
	lib_A5DA::func_117D("pdrn_rotor_vel2vol",[[var_02,var_06],[var_04,var_07]]);
	lib_A5DA::func_117D("pdrn_rotor_vel2pch",[[var_02,var_08],[var_03,var_09],[var_04,var_0A]]);
	lib_A5DA::func_117D("pdrn_whine_vel2vol",[[var_02,var_0B],[var_02 + var_04 - var_02 * 0.666,var_0B + var_0C - var_0B * 0],[var_04,var_0C]]);
	lib_A5DA::func_117D("pdrn_whine_vel2pch",[[var_02,var_0D],[var_04,var_0E]]);
	lib_A5DA::func_117D("pdrn_noise_lo_vel2vol",[[var_02,var_0F],[var_02 + var_04 - var_02 * 0.66,var_0B],[var_04,var_10]]);
	lib_A5DA::func_117D("pdrn_noise_hi_vel2vol",[[var_02,var_0F],[var_02 + var_04 - var_02 * 0.66,var_0B],[var_04,var_11]]);
	lib_A5DA::func_117D("pdrn_noise_vel2pch",[[var_02,var_12],[var_04,var_12]]);
	lib_A5DA::func_117D("pdrn_noise_hi_dist2vol",[[lib_A5DA::func_A3A9(0),var_11],[lib_A5DA::func_A3A9(4),var_11 * 0.25],[lib_A5DA::func_A3A9(6),var_11 * 0.4],[lib_A5DA::func_A3A9(8),var_0F]]);
	lib_A5DA::func_117D("pdrn_noise_lo_dist2vol",[[lib_A5DA::func_A3A9(3),var_10],[lib_A5DA::func_A3A9(12),var_0F]]);
	lib_A5DA::func_117D("pdrn_flyby_vel2vol",[[var_02,var_14],[var_04,var_15]]);
	lib_A5DA::func_117D("pdrn_flyby_vel2pch",[[var_02,var_16],[var_04,var_17]]);
	lib_A5DA::func_117D("pdrn_flyby_duck_envelope",[[0,1],[0.33,0.33],[0.66,0.33],[1.33,1]]);
	lib_A5DA::func_117D("pdrn_doppler2pch",[[0,0],[2,2]]);
	lib_A5DA::func_119C();
}

//Function Number: 26
lib_A62C::func_397F()
{
	return 1;
}

//Function Number: 27
lib_A62C::func_676D()
{
	return 0;
}

//Function Number: 28
lib_A62C::func_676C(param_00,param_01)
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

//Function Number: 29
lib_A62C::func_676A(param_00,param_01)
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

//Function Number: 30
lib_A62C::func_6768(param_00,param_01)
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

//Function Number: 31
lib_A62C::func_6769(param_00,param_01)
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
				var_02 = ["pdrone_flyby"];
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

//Function Number: 32
lib_A62C::func_676B(param_00,param_01)
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

//Function Number: 33
lib_A62C::func_6766(param_00,param_01)
{
	return 0;
}

//Function Number: 34
lib_A62C::func_6767(param_00,param_01)
{
	return 0;
}

//Function Number: 35
lib_A62C::func_67AE(param_00,param_01)
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

//Function Number: 36
lib_A62C::func_67AD(param_00,param_01)
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

//Function Number: 37
lib_A62C::func_67AC(param_00,param_01)
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