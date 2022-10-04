/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42542.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 7
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:48 PM
*******************************************************************/

//Function Number: 1
lib_A62E::func_8720()
{
	lib_A5DA::func_118C("pdrone_player",::lib_A62E::func_6799);
	lib_A5DA::func_117D("pdrone_player_hover_spd2vol",[[0,1],[30,0.5]]);
	lib_A5DA::func_117D("pdrone_player_hover_spd2pch",[[0,1],[30,1.2]]);
	lib_A5DA::func_117D("pdrone_player_fly_spd2vol",[[7,0],[8,1],[30,1]]);
	lib_A5DA::func_117D("pdrone_player_fly_spd2pch",[[8,1],[30,1.1]]);
	lib_A5DA::func_117D("pdrone_player_look_spd2vol",[[0.09,0],[0.1,1],[1,1]]);
	lib_A5DA::func_117D("pdrone_player_look_hover_spd2vol",[[2,1],[8,0]]);
	lib_A5DA::func_117D("pdrone_player_no_duck_envelope",[[0,1],[1,1]]);
	lib_A5DA::func_1187(1,0.6,0.5);
	lib_A5DA::func_1188("veh_wasp_idle_lp");
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","pdrone_player_hover_spd2vol");
	lib_A5DA::func_1183("pitch","pdrone_player_hover_spd2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("veh_wasp_drive_med_lp");
	lib_A5DA::func_118B("SPEED");
	lib_A5DA::func_1183("volume","pdrone_player_fly_spd2vol");
	lib_A5DA::func_1183("pitch","pdrone_player_fly_spd2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("veh_wasp_look_lp");
	lib_A5DA::func_118B("player_pdrone_look");
	lib_A5DA::func_1183("volume","pdrone_player_look_spd2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("speed");
	lib_A5DA::func_1183("volume","pdrone_player_look_hover_spd2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189();
	lib_A5DA::func_118A("veh_wasp_drive_med_start","pdrone_player_no_duck_envelope",0.25,0);
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("veh_wasp_drive_med_stop","pdrone_player_no_duck_envelope",0.25,0);
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("veh_wasp_look_start","pdrone_player_no_duck_envelope",0.25,0);
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("veh_wasp_look_stop","pdrone_player_no_duck_envelope",0.25,0);
	lib_A5DA::func_119A();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_state_hover",::lib_A62E::func_6791,["speed"]);
	lib_A5DA::func_1180("all");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_start_flying",::lib_A62E::func_6790,["speed"]);
	lib_A5DA::func_1182("veh_wasp_drive_med_start");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_flying",::lib_A62E::func_6790,["speed"]);
	lib_A5DA::func_1180(["veh_wasp_idle_lp","veh_wasp_drive_med_lp"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_stop_flying",::lib_A62E::func_6791,["speed"]);
	lib_A5DA::func_1182("veh_wasp_drive_med_stop");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_idle",::lib_A62E::func_6792,["player_pdrone_look","speed"]);
	lib_A5DA::func_1180("all");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_start_looking",::lib_A62E::func_6793,["player_pdrone_look","speed"]);
	lib_A5DA::func_1182("veh_wasp_look_start");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_looking",::lib_A62E::func_6793,["player_pdrone_look","speed"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_stop_looking",::lib_A62E::func_6792,["player_pdrone_look","speed"]);
	lib_A5DA::func_1182("veh_wasp_look_stop");
	lib_A5DA::func_1196();
	lib_A5DA::func_1195();
	lib_A5DA::func_118D(0.25,50);
	lib_A5DA::func_118F("movement","state_hover","to_state_hover",50,1);
	lib_A5DA::func_118E("state_hover");
	lib_A5DA::func_1184("state_start_flying","to_state_start_flying");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_start_flying");
	lib_A5DA::func_1184("state_flying","to_state_flying");
	lib_A5DA::func_1184("state_hover","to_state_hover");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_flying");
	lib_A5DA::func_1184("state_stop_flying","to_state_stop_flying");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_stop_flying");
	lib_A5DA::func_1184("state_hover","to_state_hover");
	lib_A5DA::func_1184("state_flying","to_state_flying");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_118F("player_pdrone_look","state_idle","to_state_idle",50,1);
	lib_A5DA::func_118E("state_idle");
	lib_A5DA::func_1184("state_start_looking","to_state_start_looking");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_start_looking");
	lib_A5DA::func_1184("state_looking","to_state_looking");
	lib_A5DA::func_1184("state_idle","to_state_idle");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_looking");
	lib_A5DA::func_1184("state_stop_looking","to_state_stop_looking");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_stop_looking");
	lib_A5DA::func_1184("state_idle","to_state_idle");
	lib_A5DA::func_1184("state_looking","to_state_looking");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_119D();
	lib_A5DA::func_119C();
}

//Function Number: 2
lib_A62E::func_6799(param_00)
{
	var_01 = lib_A5DA::func_11CA();
}

//Function Number: 3
lib_A62E::func_678E()
{
	var_00 = level.var_31D getnormalizedcameramovement();
	var_01 = abs(var_00[0]);
	var_02 = abs(var_00[1]);
	if(var_01 > var_02)
	{
		return var_01;
	}

	return var_02;
}

//Function Number: 4
lib_A62E::func_6791(param_00,param_01)
{
	var_02 = param_00["speed"];
	if(var_02 <= 8)
	{
		return 1;
	}

	return 0;
}

//Function Number: 5
lib_A62E::func_6790(param_00,param_01)
{
	var_02 = param_00["speed"];
	if(var_02 > 8)
	{
		return 1;
	}

	return 0;
}

//Function Number: 6
lib_A62E::func_6792(param_00,param_01)
{
	var_02 = param_00["player_pdrone_look"];
	var_03 = param_00["speed"];
	if(var_02 <= 0.1 || var_03 > 2)
	{
		return 1;
	}

	return 0;
}

//Function Number: 7
lib_A62E::func_6793(param_00,param_01)
{
	var_02 = param_00["player_pdrone_look"];
	var_03 = param_00["speed"];
	if(var_02 > 0.1 && var_03 <= 2)
	{
		return 1;
	}

	return 0;
}