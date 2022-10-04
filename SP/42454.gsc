/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42454.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 22
 * Decompile Time: 8 ms
 * Timestamp: 4/20/2022 8:23:43 PM
*******************************************************************/

//Function Number: 1
lib_A5D6::func_29BD()
{
	var_00 = 0.1;
	var_01 = 0.05;
	lib_A5DA::func_118C("detroit_music");
	lib_A5DA::func_117D("env_low_intensity",[[0,1],[0.25,0.5],[1,0]]);
	lib_A5DA::func_117D("env_high_intensity",[[0,0],[0.25,0.75],[1,1]]);
	lib_A5DA::func_1187(5,var_00,var_01);
	lib_A5DA::func_1188("mus_dtrt_refugee_camp");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","env_low_intensity");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("mus_dtrt_school");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","env_low_intensity");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("mus_dtrt_low_tension1");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","env_low_intensity");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("mus_dtrt_low_tension2");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","env_low_intensity");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("mus_dtrt_low_tension3");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","env_low_intensity");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("mus_dtrt_generic_combat");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","env_high_intensity");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_refugee_camp",::lib_A5D6::func_93A7);
	lib_A5DA::func_1180(["mus_dtrt_refugee_camp","mus_dtrt_generic_combat"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_school1",::lib_A5D6::func_93A8);
	lib_A5DA::func_1180(["mus_dtrt_low_tension1","mus_dtrt_generic_combat"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_school2",::lib_A5D6::func_93A9);
	lib_A5DA::func_1180(["mus_dtrt_low_tension2","mus_dtrt_generic_combat"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_school3",::lib_A5D6::func_93AA);
	lib_A5DA::func_1180(["mus_dtrt_low_tension3","mus_dtrt_generic_combat"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1195();
	lib_A5DA::func_118D(0.25,50);
	lib_A5DA::func_118F("main_group","refugee_camp","to_refugee_camp");
	lib_A5DA::func_118E("refugee_camp");
	lib_A5DA::func_1184("school1","to_school1");
	lib_A5DA::func_1184("school2","to_school2");
	lib_A5DA::func_1184("school3","to_school3");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("school1");
	lib_A5DA::func_1184("school2","to_school2");
	lib_A5DA::func_1184("school3","to_school3");
	lib_A5DA::func_1184("refugee_camp","to_refugee_camp");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("school2");
	lib_A5DA::func_1184("school1","to_school1");
	lib_A5DA::func_1184("school3","to_school3");
	lib_A5DA::func_1184("refugee_camp","to_refugee_camp");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("school3");
	lib_A5DA::func_1184("school1","to_school1");
	lib_A5DA::func_1184("school2","to_school2");
	lib_A5DA::func_1184("refugee_camp","to_refugee_camp");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_119D();
	lib_A5DA::func_119C();
}

//Function Number: 2
lib_A5D6::func_93A7(param_00,param_01)
{
	return lib_A5D5::func_B84() == "refugee_camp";
}

//Function Number: 3
lib_A5D6::func_93A8(param_00,param_01)
{
	return lib_A5D5::func_B84() == "school1";
}

//Function Number: 4
lib_A5D6::func_93A9(param_00,param_01)
{
	return lib_A5D5::func_B84() == "school2";
}

//Function Number: 5
lib_A5D6::func_93AA(param_00,param_01)
{
	return lib_A5D5::func_B84() == "school3";
}

//Function Number: 6
lib_A5D6::func_9E4E()
{
	var_00 = 0.65;
	var_01 = 0.75;
	var_02 = 0;
	var_03 = 1;
	var_04 = 0.5;
	var_05 = 0.6;
	var_06 = 0.7;
	var_07 = 0.8;
	var_08 = 0;
	var_09 = 1;
	var_0A = 0.3;
	var_0B = 1;
	var_0C = 0;
	var_0D = 1;
	var_0E = 0.2;
	var_0F = 1;
	var_10 = 0;
	var_11 = 1;
	var_12 = 0.1;
	var_13 = 1;
	var_14 = 0;
	var_15 = 1;
	var_16 = 0;
	var_17 = 1;
	var_18 = 0.15;
	var_19 = 1;
	lib_A5DA::func_118C("virus1",::lib_A5D6::func_9F4A);
	lib_A5DA::func_1187(5,0.1,0.05);
	lib_A5DA::func_1188("virus1_mix1");
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("virus1_mix2");
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("virus1_tilbell");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","virus1_tilbell_i2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("virus1_bigshufl");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","virus1_bigshufl_i2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("virus1_tribelgruv");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","virus1_tribelgruv_i2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("virus1_bsgprc1");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","virus1_bsgprc1_i2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("virus1_bsgprc2");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","virus1_bsgprc2_i2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("virus1_badbrain");
	lib_A5DA::func_118B("ams_intensity");
	lib_A5DA::func_1183("volume","virus1_badbrain_i2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_mix1",::lib_A5D6::func_9F45);
	lib_A5DA::func_1180(["virus1_mix1"]);
	lib_A5DA::func_117F(::lib_A5D6::func_9F48);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_mix2",::lib_A5D6::func_9F46);
	lib_A5DA::func_1180(["virus1_mix2"]);
	lib_A5DA::func_117F(::lib_A5D6::func_9F49);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_adaptive",::lib_A5D6::func_9F44);
	lib_A5DA::func_1180(["virus1_tilbell","virus1_bigshufl","virus1_badbrain","virus1_tribelgruv","virus1_bsgprc1","virus1_bsgprc2"]);
	lib_A5DA::func_117F(::lib_A5D6::func_9F47);
	lib_A5DA::func_1196();
	lib_A5DA::func_1195();
	lib_A5DA::func_118D(0.25,50);
	lib_A5DA::func_118F("main_group","mix1","to_mix1");
	lib_A5DA::func_118E("mix1");
	lib_A5DA::func_1184("mix2","to_mix2");
	lib_A5DA::func_1184("adaptive","to_adaptive");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("mix2");
	lib_A5DA::func_1184("mix1","to_mix1");
	lib_A5DA::func_1184("adaptive","to_adaptive");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("adaptive");
	lib_A5DA::func_1184("mix1","to_mix1");
	lib_A5DA::func_1184("mix2","to_mix2");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_119D();
	lib_A5DA::func_117D("virus1_bsgprc2_i2vol",[[var_00,var_02],[var_01,var_03]]);
	lib_A5DA::func_117D("virus1_bsgprc1_i2vol",[[var_04,var_08],[var_05,var_09],[var_06,var_09],[var_07,var_08]]);
	lib_A5DA::func_117D("virus1_bigshufl_i2vol",[[var_0A,var_0C],[var_0B,var_0D]]);
	lib_A5DA::func_117D("virus1_tribelgruv_i2vol",[[var_0E,var_10],[var_0F,var_11]]);
	lib_A5DA::func_117D("virus1_tilbell_i2vol",[[0,0],[var_12,var_14],[var_13,var_15]]);
	lib_A5DA::func_117D("virus1_badbrain_i2vol",[[var_16,var_18],[var_17,var_19]]);
	lib_A5DA::func_119C();
}

//Function Number: 7
lib_A5D6::func_9F4A(param_00)
{
}

//Function Number: 8
lib_A5D6::func_9F45(param_00,param_01)
{
	return lib_A5D5::func_B84() == "mix1";
}

//Function Number: 9
lib_A5D6::func_9F46(param_00,param_01)
{
	return lib_A5D5::func_B84() == "mix2";
}

//Function Number: 10
lib_A5D6::func_9F44(param_00,param_01)
{
	return lib_A5D5::func_B84() == "adaptive";
}

//Function Number: 11
lib_A5D6::func_9F48(param_00)
{
	lib_A5DA::func_11A4(1,3);
}

//Function Number: 12
lib_A5D6::func_9F49(param_00)
{
	lib_A5DA::func_11A4(1,3);
}

//Function Number: 13
lib_A5D6::func_9F47(param_00)
{
	lib_A5DA::func_11A4(1,3);
}

//Function Number: 14
lib_A5D6::func_1829()
{
	lib_A5DA::func_118C("bsgods_preset",::lib_A5D6::func_182A);
	lib_A5DA::func_1187(3,0.08,0.08);
	lib_A5DA::func_1188("mus_sfa_street_breakdown",3.1);
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","intro_loop_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_prc_lyr1");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_prc_lyr1_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_prc_lyr2");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_prc_lyr2_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_prc_lyr3");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_prc_lyr3_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_lps_lyr1");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_lps_lyr1_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_lps_lyr2");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_lps_lyr2_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_lps_lyr3");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_lps_lyr3_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_lps_lyr4");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_lps_lyr4_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_lps_lyr5");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_lps_lyr5_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_atm_lyr2");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_atm_lyr1_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("bsgods_ris_lyr1");
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_ris_lyr1_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_118A("bsgods_prc_hit1","bsgods_prc_hit_duck_envelope",0.25,0);
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_prc_hit_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("bsgods_prc_hit2","bsgods_prc_hit_duck_envelope",0.25,0);
	lib_A5DA::func_118B("ams_proxy_vehicle_speed");
	lib_A5DA::func_1183("volume","bsgods_prc_hit_speed_to_vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_state_intro",::lib_A5D6::func_1826,["ams_proxy_vehicle_speed"]);
	lib_A5DA::func_1180(["mus_sfa_street_breakdown"]);
	lib_A5DA::func_1182("bsgods_prc_hit1");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_driving",::lib_A5D6::func_1825);
	lib_A5DA::func_1180(["bsgods_prc_lyr1","bsgods_prc_lyr2","bsgods_prc_lyr3","bsgods_lps_lyr1","bsgods_lps_lyr2","bsgods_lps_lyr3","bsgods_lps_lyr4","bsgods_lps_lyr5","bsgods_atm_lyr2","bsgods_ris_lyr1"]);
	lib_A5DA::func_1182("bsgods_prc_hit1");
	lib_A5DA::func_117F(::lib_A5D6::func_1827);
	lib_A5DA::func_117E(::lib_A5D6::func_1828);
	lib_A5DA::func_118B("ams_proxy_vehicle_speed",0.025,0.025);
	lib_A5DA::func_119B();
	lib_A5DA::func_1196();
	lib_A5DA::func_1195();
	lib_A5DA::func_118D(0.25,50);
	lib_A5DA::func_118F("main_group","state_driving","to_state_driving");
	lib_A5DA::func_118E("state_intro");
	lib_A5DA::func_1184("state_driving","to_state_driving");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_driving");
	lib_A5DA::func_1184("state_intro","to_state_intro");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_119D();
	lib_A5DA::func_117D("intro_loop_speed_to_vol",[[0,1],[60,1]]);
	var_00 = [0,0.166,0.333,0.5,0.666,0.833,1];
	lib_A5DA::func_117D("bsgods_prc_lyr1_speed_to_vol",[[0 + 60 * var_00[0],1],[0 + 60 * var_00[2],1],[0 + 60 * var_00[3],0]]);
	lib_A5DA::func_117D("bsgods_prc_lyr2_speed_to_vol",[[0 + 60 * var_00[1],0],[0 + 60 * var_00[2],1],[0 + 60 * var_00[4],1],[0 + 60 * var_00[5],0]]);
	lib_A5DA::func_117D("bsgods_prc_lyr3_speed_to_vol",[[0 + 60 * var_00[3],0],[0 + 60 * var_00[4],1],[0 + 60 * var_00[6],1]]);
	lib_A5DA::func_117D("bsgods_prc_hit_speed_to_vol",[[0,0.5],[60,0.5]]);
	var_00 = [0,0.166,0.333,0.5,0.666,0.833,1];
	lib_A5DA::func_117D("bsgods_lps_lyr1_speed_to_vol",[[0 + 60 * var_00[0],1],[0 + 60 * var_00[1],1],[0 + 60 * var_00[2],1],[0 + 60 * var_00[2] + 0.1,0]]);
	lib_A5DA::func_117D("bsgods_lps_lyr2_speed_to_vol",[[0 + 60 * var_00[2] - 0.1,0],[0 + 60 * var_00[2],1],[0 + 60 * var_00[3],1],[0 + 60 * var_00[3] + 0.1,0]]);
	lib_A5DA::func_117D("bsgods_lps_lyr3_speed_to_vol",[[0 + 60 * var_00[3] - 0.1,0],[0 + 60 * var_00[3],1],[0 + 60 * var_00[4],1],[0 + 60 * var_00[4] + 0.1,0]]);
	lib_A5DA::func_117D("bsgods_lps_lyr4_speed_to_vol",[[0 + 60 * var_00[4] - 0.1,0],[0 + 60 * var_00[4],1],[0 + 60 * var_00[5],1],[0 + 60 * var_00[5] + 0.1,0]]);
	lib_A5DA::func_117D("bsgods_lps_lyr5_speed_to_vol",[[0 + 60 * var_00[5] - 0.1,0],[0 + 60 * var_00[5],1],[0 + 60 * var_00[6],1]]);
	var_00 = [0,0.166,0.333,0.5,0.666,0.833,1];
	lib_A5DA::func_117D("bsgods_atm_lyr1_speed_to_vol",[[0 + 60 * var_00[3],0],[0 + 60 * var_00[4],0.4],[0 + 60 * var_00[5],0.7],[0 + 60 * var_00[6],0.7]]);
	var_00 = [0.8,0.9,1];
	lib_A5DA::func_117D("bsgods_ris_lyr1_speed_to_vol",[[0 + 60 * var_00[0],0],[0 + 60 * var_00[1],1],[0 + 60 * var_00[2],1]]);
	lib_A5DA::func_117D("bsgods_prc_hit_duck_envelope",[[0,1],[0.05,0.5],[0.3,0.75],[1.12,1]]);
	lib_A5DA::func_119C();
}

//Function Number: 15
lib_A5D6::func_182A(param_00)
{
}

//Function Number: 16
lib_A5D6::func_1826(param_00,param_01)
{
	return lib_A5D5::func_B84() == "intro";
}

//Function Number: 17
lib_A5D6::func_1825(param_00,param_01)
{
	return lib_A5D5::func_B84() == "driving";
}

//Function Number: 18
lib_A5D6::func_1827(param_00)
{
	if(!isdefined(param_00.var_8ADB))
	{
		param_00.var_8ADB = spawnstruct();
	}

	param_00.var_8ADB.var_7557 = 1;
	param_00.var_8ADB.var_755A = 0;
	param_00.var_8ADB.var_755B = 0;
	param_00.var_8ADB.var_7558 = 36;
	param_00.var_8ADB.var_7559 = 18;
	param_00.var_8ADB.var_DAE = 1;
	param_00.var_8ADB.var_DB1 = 0;
	param_00.var_8ADB.var_DB2 = 0;
	param_00.var_8ADB.var_DAF = 18;
	param_00.var_8ADB.var_DB0 = 9;
	lib_A5DA::func_11A5("bsgods_ris_lyr1",param_00.var_8ADB.var_7557,0.05);
	param_00.var_8ADB.var_755A = lib_A5DE::func_86E5();
	lib_A5DA::func_11A5("bsgods_atm_lyr2",param_00.var_8ADB.var_DAE,0.05);
	param_00.var_8ADB.var_DB1 = lib_A5DE::func_86E5();
}

//Function Number: 19
lib_A5D6::func_1828(param_00,param_01)
{
	var_02 = param_00["ams_proxy_vehicle_speed"];
	if(var_02 > 45)
	{
		var_03 = 4;
		var_04 = lib_A5DE::func_86E5() - param_01.var_8ADB.var_755A;
		if(param_01.var_8ADB.var_7557 && var_04 > param_01.var_8ADB.var_7558)
		{
			lib_A5DA::func_11A5("bsgods_ris_lyr1",0,var_03);
			param_01.var_8ADB.var_7557 = 0;
			param_01.var_8ADB.var_755A = lib_A5DE::func_86E5();
		}
		else if(!param_01.var_8ADB.var_7557 && var_04 > param_01.var_8ADB.var_7559)
		{
			lib_A5DA::func_11A5("bsgods_ris_lyr1",1,var_03);
			param_01.var_8ADB.var_7557 = 1;
			param_01.var_8ADB.var_755A = lib_A5DE::func_86E5();
		}
	}
	else if(!param_01.var_8ADB.var_7557)
	{
		param_01.var_8ADB.var_7557 = 1;
		lib_A5DA::func_11A5("bsgods_ris_lyr1",param_01.var_8ADB.var_7557,1);
		param_01.var_8ADB.var_755A = lib_A5DE::func_86E5();
	}

	if(var_02 > 30)
	{
		var_03 = 2;
		var_04 = lib_A5DE::func_86E5() - param_01.var_8ADB.var_DB1;
		if(param_01.var_8ADB.var_DAE && var_04 > param_01.var_8ADB.var_DAF)
		{
			lib_A5DA::func_11A5("bsgods_atm_lyr2",0,var_03);
			param_01.var_8ADB.var_DAE = 0;
			param_01.var_8ADB.var_DB1 = lib_A5DE::func_86E5();
			return;
		}

		if(!param_01.var_8ADB.var_DAE && var_04 > param_01.var_8ADB.var_DB0)
		{
			lib_A5DA::func_11A5("bsgods_atm_lyr2",1,var_03);
			param_01.var_8ADB.var_DAE = 1;
			param_01.var_8ADB.var_DB1 = lib_A5DE::func_86E5();
			return;
		}

		return;
	}

	if(!param_01.var_8ADB.var_DAE)
	{
		param_01.var_8ADB.var_DAE = 1;
		lib_A5DA::func_11A5("bsgods_atm_lyr2",param_01.var_8ADB.var_DAE,1);
		param_01.var_8ADB.var_DB1 = lib_A5DE::func_86E5();
	}
}

//Function Number: 20
lib_A5D6::func_10F8(param_00,param_01)
{
	lib_A5D2::func_102D("CALLING MUSIC_MOODS PRESET USING OLD METHOD!");
}

//Function Number: 21
lib_A5D6::func_10F6(param_00,param_01)
{
	lib_A5D2::func_102D("CALLING MUSIC_CUE_GROUPS PRESET USING OLD METHOD!");
}

//Function Number: 22
lib_A5D6::func_10F7(param_00,param_01)
{
	lib_A5D2::func_102D("CALLING MUSIC_CUES PRESET USING OLD METHOD!");
}