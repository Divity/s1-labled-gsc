/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42530.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:23:47 PM
*******************************************************************/

//Function Number: 1
lib_A622::func_45B2()
{
	self endon("death");
	lib_A5DE::snd_message("rec_littlebird_formation_spawn",self);
	if(issubstr(self.classname,"sentinel") || issubstr(self.classname,"armed") || issubstr(self.classname,"atlas_bench"))
	{
		var_00 = 0.25;
		if(level.currentgen)
		{
			var_00 = 1;
		}

		var_01 = 0;
		var_02 = 0;
		var_03 = spawnstruct();
		var_03.var_6F1E = "littlebird_sentinel";
		var_03.var_35EE = 3;
		var_03.var_35F3 = 3;
		lib_A5DE::snd_message("snd_register_vehicle","littlebird_sentinel",::lib_A622::func_57B2);
		for(;;)
		{
			var_04 = distance(self.var_2E6,level.var_31D.var_2E6);
			if(!var_01 && var_04 < 5400)
			{
				lib_A5DE::snd_message("snd_start_vehicle",var_03);
				var_01 = 1;
				continue;
			}

			if(var_01 && var_04 > 5400)
			{
				lib_A5DE::snd_message("snd_stop_vehicle");
				var_01 = 0;
			}

			wait(var_00);
		}
	}
}

//Function Number: 2
lib_A622::func_57B2()
{
	var_00 = undefined;
	var_01 = 1;
	var_02 = 1;
	lib_A5DA::func_118C("littlebird_sentinel");
	lib_A5DA::func_1187(var_00,var_01,var_02);
	lib_A5DA::func_1188("lbs_near");
	lib_A5DA::func_118B("DISTANCE");
	lib_A5DA::func_1183("volume","lbs_near_dist2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("pitch");
	lib_A5DA::func_1183("volume","lbs_near_pch2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("DOPPLER");
	lib_A5DA::func_1183("pitch","lbs_dplr2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("lbs_far");
	lib_A5DA::func_118B("DISTANCE");
	lib_A5DA::func_1183("volume","lbs_far_dist2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("pitch");
	lib_A5DA::func_1183("volume","lbs_far_pch2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("DOPPLER");
	lib_A5DA::func_1183("pitch","lbs_dplr2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("lbs_pitch");
	lib_A5DA::func_118B("pitch");
	lib_A5DA::func_1183("volume","lbs_pitch_pch2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("DOPPLER");
	lib_A5DA::func_1183("pitch","lbs_dplr2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_state_hover",::lib_A622::func_5638,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flying",::lib_A622::func_5636,["speed","distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_distant",::lib_A622::func_5634,["distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flyby",::lib_A622::func_5635,["distance2d"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_deathspin",::lib_A622::func_5632);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_destruct",::lib_A622::func_5633);
	lib_A5DA::func_1180("NONE");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_off",::lib_A622::func_5639);
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
	var_03 = 0;
	var_04 = 10;
	var_05 = 30;
	var_06 = var_05 - var_03;
	var_07 = lib_A5DA::func_A3AA(0);
	var_08 = lib_A5DA::func_A3AA(99.00001);
	var_09 = var_08 - var_07;
	var_0A = 0;
	var_0B = 1;
	var_0C = var_0B - var_0A;
	var_0D = lib_A5DA::func_A3AA(10);
	var_0E = lib_A5DA::func_A3AA(30);
	var_0F = lib_A5DA::func_A3AA(1000000);
	var_10 = var_0F - var_0D;
	var_11 = 0;
	var_12 = 1;
	var_13 = var_12 - var_11;
	var_14 = -25;
	var_15 = 0;
	var_16 = 25;
	var_17 = lib_A5DA::func_A3AA(0);
	var_18 = lib_A5DA::func_A3AA(75);
	var_19 = var_18 - var_17;
	var_1A = 0;
	var_1B = 1;
	var_1C = var_1B - var_1A;
	var_1D = 0.6;
	var_1E = 1;
	var_1F = 1.6;
	var_20 = lib_A5DA::func_A3AA(0);
	var_21 = lib_A5DA::func_A3AA(150);
	var_22 = var_18 - var_17;
	var_23 = 0;
	var_24 = 0.4;
	var_25 = var_1B - var_1A;
	var_26 = 0;
	var_27 = 0.5;
	var_28 = var_1B - var_1A;
	var_29 = var_17;
	var_2A = var_18;
	var_2B = 0;
	var_2C = 1;
	var_2D = var_2C - var_2B;
	var_2E = 1;
	var_2F = 2;
	var_30 = var_2F - var_2E;
	var_31 = 30;
	var_32 = 0;
	var_33 = 1;
	var_34 = 0.5;
	var_35 = 1.5;
	var_36 = 100;
	var_37 = 200;
	var_38 = 500;
	var_39 = 6;
	lib_A5DA::func_117D("lbs_near_dist2vol",[[var_07,1],[var_08,0]]);
	lib_A5DA::func_117D("lbs_far_dist2vol",[[var_0D,0],[var_0E,1],[var_0F,1]]);
	lib_A5DA::func_117D("lbs_near_pch2vol",[[var_14,0.2],[var_15,1],[var_16,0.2]]);
	lib_A5DA::func_117D("lbs_far_pch2vol",[[var_14,0.2],[var_15,1],[var_16,0.2]]);
	lib_A5DA::func_117D("lbs_pitch_pch2vol",[[var_14,1],[var_15,0],[var_16,1]]);
	lib_A5DA::func_117D("lbs_live_dist2vol",[[var_17,1],[var_18,0]]);
	lib_A5DA::func_117D("lbs_dist_far_dist2vol",[[var_20,0],[var_21 * 0.333,0.333],[var_21,0]]);
	lib_A5DA::func_117D("lbs_live1_accel2pch",[[var_26,0.9],[var_27,1.1]]);
	lib_A5DA::func_117D("lbs_live1_accel2vol",[[var_26,0],[var_27,1]]);
	lib_A5DA::func_117D("lbs_live1_dst2vol",[[var_29,var_2C],[var_2A,var_2B]]);
	lib_A5DA::func_117D("lbs_flyby_vel2vol",[[var_03,var_32],[var_06 * 0.25,var_33 * 0.5],[var_05,var_33]]);
	lib_A5DA::func_117D("lbs_flyby_vel2pch",[[var_03,var_34],[var_05,var_35]]);
	lib_A5DA::func_117D("lbs_dplr2pch",[[0,0],[2,2]]);
	lib_A5DA::func_117D("lbs_dplr2vol",[[var_1D,var_1B],[var_1E,var_1A],[var_1F,var_1B]]);
	lib_A5DA::func_117D("lbs_flyby_duck_envelope",[[0,1],[0.4,0.7],[0.6,0.5],[0.8,0.7],[1,1]]);
	lib_A5DA::func_119C();
}

//Function Number: 3
lib_A622::func_5639()
{
	return 0;
}

//Function Number: 4
lib_A622::func_5638(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_9A22(var_04);
	if(var_03 <= 5.1 && var_05 < 100)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 5
lib_A622::func_5636(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["distance2d"];
	var_05 = lib_A5DA::func_9A22(var_04);
	if(var_03 > 5.1 && var_05 < 100)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 6
lib_A622::func_5634(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["distance2d"];
	var_04 = lib_A5DA::func_9A22(var_03);
	if(var_04 >= 100)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 7
lib_A622::func_5635(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["distance2d"];
	var_04 = lib_A5DA::func_9A22(var_03);
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

//Function Number: 8
lib_A622::func_5637(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["distance2d"];
	var_04 = param_00["relative_speed"];
	var_05 = lib_A5DA::func_9A22(var_03);
	if(var_05 < 30)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 9
lib_A622::func_5632(param_00,param_01)
{
	return 0;
}

//Function Number: 10
lib_A622::func_5633(param_00,param_01)
{
	return 0;
}