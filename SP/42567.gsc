/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42567.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 31
 * Decompile Time: 31 ms
 * Timestamp: 4/20/2022 8:23:51 PM
*******************************************************************/

//Function Number: 1
lib_A647::func_86F6()
{
	lib_A5DA::func_11A3("x4wwt_zvelocity_front_left",::lib_A647::func_A392);
	lib_A5DA::func_11A3("x4wwt_zvelocity_front_right",::lib_A647::func_A393);
	lib_A5DA::func_11A3("x4wwt_zvelocity_rear_left",::lib_A647::func_A394);
	lib_A5DA::func_11A3("x4wwt_zvelocity_rear_right",::lib_A647::func_A395);
	lib_A5DA::func_11A3("x4wwt_gun_pitch_rate",::lib_A647::func_A38E);
	lib_A5DA::func_11A3("x4wwt_gun_yaw_rate",::lib_A647::func_A38F);
	lib_A5DA::func_11A3("x4wwt_player_driver",::lib_A647::func_A390);
	lib_A5DA::func_11A3("x4wwt_gun_pitch_rate2",::lib_A647::func_A38E);
	lib_A5DA::func_11A3("x4wwt_gun_yaw_rate2",::lib_A647::func_A38F);
	lib_A5DE::snd_message("snd_register_vehicle","x4walker_wheels_turret",::lib_A647::func_877E);
}

//Function Number: 2
lib_A647::func_876D(param_00)
{
	if(isdefined(self.var_86F8))
	{
		wait(1);
		var_01 = 1;
		lib_A5DE::snd_message("snd_stop_vehicle",var_01);
		lib_A5DE::snd_message("player_exit_walker");
	}

	if(param_00 == "npc")
	{
		return;
	}

	var_02 = spawnstruct();
	var_02.var_6F1E = "x4walker_wheels_turret";
	var_02.var_6B9E = param_00 == "plr";
	lib_A5DE::snd_message("snd_start_vehicle",var_02);
	lib_A5DE::snd_message("player_enter_walker");
}

//Function Number: 3
lib_A647::func_877E()
{
	lib_A5DA::func_118C("x4walker_wheels_turret");
	lib_A5DA::func_1187();
	lib_A5DA::func_1188("x4_turret_idle2");
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_1183("volume","x4_idle_vel2vol","x4_idle_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("x4_turret_move");
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_1183("volume","x4_move_vel2vol","x4_move_vel2vol");
	lib_A5DA::func_1183("pitch","x4_move_vel2pch","x4_move_vel2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("pitch",0.65,0.3);
	lib_A5DA::func_1183("pitch","x4_move_pit2pch","x4_move_pit2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("x4_turret_move2");
	lib_A5DA::func_118B("speed",0.65,0.8);
	lib_A5DA::func_1183("volume","x4_move2_lp_vel2vol");
	lib_A5DA::func_1183("pitch","x4_move2_lp_vel2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("pitch",0.65,0.3);
	lib_A5DA::func_1183("pitch","x4_move_pit2pch","x4_move_pit2pch");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("x4_turret_sub_lp");
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_1183("volume","x4_sub_lp_vel2vol","x4_sub_lp_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("x4_turret_rotate_faster");
	lib_A5DA::func_118B("x4wwt_gun_yaw_rate",0.3,0.3);
	lib_A5DA::func_1183("volume","x4_turret_rot_fast_vel2vol","x4_turret_rot_fast_vel2vol");
	lib_A5DA::func_1183("pitch","x4_turret_rot_slow_vel2pit","x4_turret_rot_slow_vel2pit");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("speed",0.3,0.3);
	lib_A5DA::func_1183("volume","x4_veh_speed_to_turret_rot_vel2vol","x4_veh_speed_to_turret_rot_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("x4wwt_gun_yaw_rate2",0.9,0.9);
	lib_A5DA::func_1183("volume","x4_veh_speed_to_turret_rot_gate","x4_veh_speed_to_turret_rot_gate");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("x4_turret_rotate_slow");
	lib_A5DA::func_118B("x4wwt_gun_yaw_rate",0.3,0.3);
	lib_A5DA::func_1183("volume","x4_turret_rot_slow_vel2vol","x4_turret_rot_slow_vel2vol");
	lib_A5DA::func_1183("pitch","x4_turret_rot_slow_vel2pit","x4_turret_rot_slow_vel2pit");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("x4wwt_gun_yaw_rate2",1,1);
	lib_A5DA::func_1183("volume","x4_veh_speed_to_turret_rot_gate","x4_veh_speed_to_turret_rot_gate");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1188("x4_turret_elevate");
	lib_A5DA::func_118B("x4wwt_gun_pitch_rate",0.3,0.3);
	lib_A5DA::func_1183("volume","x4_turret_pitch_rate_vel2vol","x4_turret_pitch_rate_vel2vol");
	lib_A5DA::func_1183("pitch","x4_turret_pitch_rate_vel2pit","x4_turret_pitch_rate_vel2pit");
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("x4wwt_gun_pitch_rate2",1,1);
	lib_A5DA::func_1183("volume","x4_turret_pitch_rate_gate","x4_turret_pitch_rate_gate");
	lib_A5DA::func_119B();
	lib_A5DA::func_1198();
	lib_A5DA::func_1197();
	lib_A5DA::func_1189(0.25);
	lib_A5DA::func_118A("x4_turret_startup","x4_startup_duck_envelope");
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("x4_turret_shutoff","xwalk_shutoff_duck_envelope");
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("x4_turret_accel_hard","xwalk_accel_duck_envelope");
	lib_A5DA::func_118B("acceleration_g",0.65,0.3);
	lib_A5DA::func_1183("volume","x4_accel_1shot_accel2vol","x4_accel_1shot_accel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("x4_turret_decel_1","xwalk_stop_duck_envelope",0.5,1,["x4_turret_decel"]);
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_1183("volume","x4_break_squeal_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("x4_turret_decel_2","xwalk_stop_duck_envelope",0.5,1,["x4_turret_decel","x4_turret_stop_squeal"]);
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_1183("volume","x4_break_squeal_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("x4_turret_stop_chuff");
	lib_A5DA::func_118B("speed",1,1);
	lib_A5DA::func_1183("volume","x4_chuff_vel2vol","x4_chuff_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("x4_turret_suspen_bump_hard","xwalk_stop_duck_envelope");
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_1183("volume","x4_suspen_vel2vol");
	lib_A5DA::func_119B();
	lib_A5DA::func_119A();
	lib_A5DA::func_118A("x4_turret_rotate_stop","xwalk_stop_duck_envelope");
	lib_A5DA::func_119A();
	lib_A5DA::func_1199();
	lib_A5DA::func_1185();
	lib_A5DA::func_1186("to_state_off",::lib_A647::func_A382);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_startup",::lib_A647::func_A385);
	lib_A5DA::func_1182("x4_turret_startup");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_shutoff",::lib_A647::func_A383,["x4wwt_player_driver"]);
	lib_A5DA::func_1182("x4_turret_shutoff");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_enter_vehicle",::lib_A647::func_A37E,["x4wwt_player_driver"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_idle",::lib_A647::func_A380,["speed"]);
	lib_A5DA::func_1180("ALL");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_start_move",::lib_A647::func_A384);
	lib_A5DA::func_1182("x4_turret_accel_hard");
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_119B();
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_moving",::lib_A647::func_A381,["speed"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_breaking",::lib_A647::func_A37C);
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("pitch",0.65,0.3);
	lib_A5DA::func_119B();
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_stop",::lib_A647::func_A386,["speed"]);
	lib_A5DA::func_1182("x4_turret_stop_chuff");
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_destruct",::lib_A647::func_A37D);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_wheels_neutral",::lib_A647::func_A38D);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_wheels_bump_impact",::lib_A647::func_A38C);
	lib_A5DA::func_1182("x4_turret_suspen_bump_hard");
	lib_A5DA::func_118B("x4wwt_zvelocity_front_left",0.65,0.3);
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("x4wwt_zvelocity_front_right",0.65,0.3);
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("x4wwt_zvelocity_rear_left",0.65,0.3);
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("x4wwt_zvelocity_rear_right",0.65,0.3);
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("speed",0.65,0.3);
	lib_A5DA::func_119B();
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_turret_rotate",::lib_A647::func_A388,["x4wwt_gun_yaw_rate"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_turret_rotate_accel",::lib_A647::func_A389);
	lib_A5DA::func_1182("x4_turret_rotate_stop");
	lib_A5DA::func_118B("x4wwt_gun_yaw_rate",1,1);
	lib_A5DA::func_119B();
	lib_A5DA::func_118B("speed",0.6,0.6);
	lib_A5DA::func_119B();
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_turret_rotate_decel",::lib_A647::func_A38A,["x4wwt_gun_yaw_rate"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_turret_stopped",::lib_A647::func_A38B,["pitch","x4wwt_gun_yaw_rate"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1186("to_state_turret_elevate",::lib_A647::func_A387,["x4wwt_gun_pitch_rate"]);
	lib_A5DA::func_1196();
	lib_A5DA::func_1195();
	lib_A5DA::func_118D();
	lib_A5DA::func_118F("main_oneshots","state_enter_vehicle","to_state_enter_vehicle",50,1);
	lib_A5DA::func_118E("state_off");
	lib_A5DA::func_1184("state_enter_vehicle","to_state_enter_vehicle");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_startup");
	lib_A5DA::func_1184("state_idle","to_state_idle");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_shutoff");
	lib_A5DA::func_1184("state_off","to_state_off");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_idle");
	lib_A5DA::func_1184("state_start_move","to_state_start_move");
	lib_A5DA::func_1184("state_shutoff","to_state_shutoff");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_start_move");
	lib_A5DA::func_1184("state_moving","to_state_moving");
	lib_A5DA::func_1184("state_shutoff","to_state_shutoff");
	lib_A5DA::func_1184("state_stop","to_state_stop");
	lib_A5DA::func_1184("state_breaking","to_state_breaking");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_breaking");
	lib_A5DA::func_1184("state_stop","to_state_stop");
	lib_A5DA::func_1184("state_moving","to_state_moving");
	lib_A5DA::func_1184("state_shutoff","to_state_shutoff");
	lib_A5DA::func_1184("state_start_move","to_state_start_move");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_stop");
	lib_A5DA::func_1184("state_idle","to_state_idle");
	lib_A5DA::func_1184("state_shutoff","to_state_shutoff");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_enter_vehicle");
	lib_A5DA::func_1184("state_startup","to_state_startup");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_exit_vehicle");
	lib_A5DA::func_1184("state_off","to_state_off");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_moving");
	lib_A5DA::func_1184("state_breaking","to_state_breaking");
	lib_A5DA::func_1184("state_stop","to_state_stop");
	lib_A5DA::func_1184("state_shutoff","to_state_shutoff");
	lib_A5DA::func_1184("state_start_move","to_state_start_move");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_destruct");
	lib_A5DA::func_1184("state_off","to_state_off");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_118F("wheel_legs","state_wheels_neutral","to_state_wheels_neutral",50,1);
	lib_A5DA::func_118E("state_wheels_neutral");
	lib_A5DA::func_1184("state_wheels_bump_impact","to_state_wheels_bump_impact");
	lib_A5DA::func_1184("state_wheels_neutral","to_state_wheels_neutral");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_wheels_bump_impact");
	lib_A5DA::func_1184("state_wheels_bump_impact","to_state_wheels_bump_impact");
	lib_A5DA::func_1184("state_wheels_neutral","to_state_wheels_neutral");
	lib_A5DA::func_1184("state_destruct","to_state_destruct");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_118F("turret_rotate","state_turret_rotate_accel","to_state_turret_rotate_accel",50,1);
	lib_A5DA::func_118E("state_turret_stopped");
	lib_A5DA::func_1184("state_turret_rotate","to_state_turret_rotate");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_turret_rotate");
	lib_A5DA::func_1184("state_turret_rotate","to_state_turret_rotate");
	lib_A5DA::func_1184("state_turret_rotate_accel","to_state_turret_rotate_accel");
	lib_A5DA::func_1184("state_turret_rotate_decel","to_state_turret_rotate_decel");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_turret_rotate_accel");
	lib_A5DA::func_1184("state_turret_rotate_accel","to_state_turret_rotate_accel");
	lib_A5DA::func_119E();
	lib_A5DA::func_118E("state_turret_rotate_decel");
	lib_A5DA::func_1184("state_turret_rotate","to_state_turret_rotate");
	lib_A5DA::func_1184("state_turret_rotate_accel","to_state_turret_rotate_accel");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_118F("turret_elevate","state_turret_elevate","to_state_turret_elevate",50,1);
	lib_A5DA::func_118E("state_turret_elevate");
	lib_A5DA::func_1184("state_turret_elevate","to_state_turret_elevate");
	lib_A5DA::func_119E();
	lib_A5DA::func_119F();
	lib_A5DA::func_119D();
	lib_A5DA::func_117D("x4_idle_vel2vol",[[0,0.8],[1.75,0.3],[3.5,0.1]]);
	lib_A5DA::func_117D("x4_move_vel2vol",[[0,0],[1.75,0.9],[7,0]]);
	lib_A5DA::func_117D("x4_move2_lp_vel2vol",[[0,0],[1.75,0.7],[7,1]]);
	lib_A5DA::func_117D("x4_chuff_vel2vol",[[0,0.75],[1,1]]);
	lib_A5DA::func_117D("x4_break_squeal_vel2vol",[[0,0],[7,0.7]]);
	lib_A5DA::func_117D("x4_turret_rot_fast_vel2vol",[[-100,0.6],[-30,0.2],[0,0],[30,0.2],[100,0.6]]);
	lib_A5DA::func_117D("x4_turret_rot_slow_vel2vol",[[-100,0.6],[-10,0.5],[0,0],[10,0.5],[100,0.6]]);
	lib_A5DA::func_117D("x4_turret_rot_slow_vel2pit",[[-30,0.7],[0,0.5],[30,0.7]]);
	lib_A5DA::func_117D("x4_turret_rot_fast_vel2pit",[[-150,3],[-30,0.3],[0,0],[30,0.3],[150,3]]);
	lib_A5DA::func_117D("x4_turret_pitch_rate_vel2vol",[[-10,0.6],[-1,0.4],[0,0],[1,0.4],[10,0.6]]);
	lib_A5DA::func_117D("x4_turret_pitch_rate_gate",[[-0.3,1],[-0.2,0],[0,0],[0.2,0],[0.3,1]]);
	lib_A5DA::func_117D("x4_turret_pitch_rate_vel2pit",[[-100,0.5],[0,0.5],[100,0.5]]);
	lib_A5DA::func_117D("x4_move_vel2pch",[[0,0.9],[7,1.1]]);
	lib_A5DA::func_117D("x4_move2_lp_vel2pch",[[0,0.9],[2,0.9],[7,1.2]]);
	lib_A5DA::func_117D("x4_sub_lp_vel2vol",[[0,0.2],[7,0.4]]);
	lib_A5DA::func_117D("x4_veh_speed_to_turret_rot_vel2vol",[[0,1],[1.4,0],[7,0]]);
	lib_A5DA::func_117D("x4_veh_speed_to_turret_rot_gate",[[-1,1],[0,0],[1,1]]);
	lib_A5DA::func_117D("x4_suspen_vel2vol",[[0,0],[7,0.5]]);
	lib_A5DA::func_117D("x4_accel_1shot_accel2vol",[[0,1],[0.02,1],[0.1,1],[0.2,1]]);
	lib_A5DA::func_117D("xwalk_accel_duck_envelope",[[0,1],[0.55,0.4],[1,0.6],[2,1]]);
	lib_A5DA::func_117D("x4_move_pit2pch",[[-2,0.9],[0,1],[2,1.1]]);
	lib_A5DA::func_117D("xwalk_stop_duck_envelope",[[0,1],[0.55,0.8],[0.85,0.8],[2,1]]);
	lib_A5DA::func_117D("x4_startup_duck_envelope",[[0,0],[1,0.5],[1.6,1]]);
	lib_A5DA::func_117D("xwalk_shutoff_duck_envelope",[[0,1],[0.16,0.4],[1.1,0]]);
	lib_A5DA::func_119C();
}

//Function Number: 4
lib_A647::func_A382(param_00,param_01)
{
	return 1;
}

//Function Number: 5
lib_A647::func_A37E(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["x4wwt_player_driver"];
	if(var_03)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 6
lib_A647::func_A37F(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["x4wwt_player_driver"];
	if(!var_03)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 7
lib_A647::func_A385(param_00,param_01)
{
	param_01.var_3BCA = 0;
	param_01.var_3BCE = 1;
	param_01.var_3BCC = 0;
	return 1;
}

//Function Number: 8
lib_A647::func_A383(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["x4wwt_player_driver"];
	if(!var_03)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 9
lib_A647::func_A380(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(var_03 <= 0.0001)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 10
lib_A647::func_A384(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(!isdefined(param_01.var_3F5))
	{
		param_01.var_3F5 = spawnstruct();
		param_01.var_3F5.var_6F47 = var_03;
		param_01.var_3F5.var_9343 = 0;
		param_01.var_3F5.var_6D6 = 0;
		param_01.var_3F5.var_6D5 = 0;
		param_01.var_3F5.var_8F1B = 0;
		param_01.var_3F5.var_8F1C = 1000;
	}
	else
	{
		var_04 = var_03 - param_01.var_3F5.var_6F47;
		if(param_01.var_3F5.var_6D5 == 0 && var_04 > 0)
		{
			param_01.var_3F5.var_6D5 = 1;
			param_01.var_3F5.var_6D6 = gettime();
		}
		else if(param_01.var_3F5.var_6D5 == 1 && var_04 > 0)
		{
			param_01.var_3F5.var_9343 = param_01.var_3F5.var_9343 + gettime() - param_01.var_3F5.var_6D6;
		}
		else if(var_04 <= 0 || var_03 >= 7)
		{
			param_01.var_3F5.var_6D5 = 0;
			param_01.var_3F5.var_6D6 = 0;
			param_01.var_3F5.var_9343 = 0;
		}

		if(param_01.var_3BCA == 1 && var_04 > 0)
		{
			var_05 = gettime() - param_01.var_3F5.var_8F1B;
			if(var_05 > 4000)
			{
				var_02 = 1;
				param_01.var_3BCC = gettime();
				param_01.var_3F5.var_6D6 = 0;
				param_01.var_3F5.var_6D5 = 0;
				param_01.var_3F5.var_9343 = 0;
				param_01.var_3BCA = 0;
				param_01.var_3F5.var_8F1B = gettime();
				param_01.var_3BCE = 0;
			}
		}
		else if(param_01.var_3F5.var_9343 > 400 && var_04 > 0.4)
		{
			var_02 = 1;
			param_01.var_3BCC = gettime();
			param_01.var_3F5.var_6D6 = 0;
			param_01.var_3F5.var_6D5 = 0;
			param_01.var_3F5.var_9343 = 0;
			param_01.var_3BCE = 0;
		}
		else if(var_03 >= 7 && param_01.var_3BCE)
		{
			var_02 = 1;
			param_01.var_3BCC = gettime();
			param_01.var_3F5.var_6D6 = 0;
			param_01.var_3F5.var_6D5 = 0;
			param_01.var_3F5.var_9343 = 0;
			param_01.var_3BCE = 0;
		}

		param_01.var_3F5.var_6F47 = var_03;
	}

	return var_02;
}

//Function Number: 11
lib_A647::func_A381(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(var_03 > 0.1)
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 12
lib_A647::func_A37C(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	var_04 = param_00["pitch"];
	var_05 = gettime() - param_01.var_3BCC;
	if(!isdefined(param_01.var_17DE))
	{
		param_01.var_17DE = spawnstruct();
		param_01.var_17DE.var_6F47 = var_03;
		param_01.var_17DE.var_9349 = 0;
		param_01.var_17DE.var_17E3 = 0;
		param_01.var_17DE.var_5004 = 0;
		param_01.var_17DE.var_6F3F = 0;
		param_01.var_17DE.var_6F37 = 0;
		param_01.var_17DE.var_934F = 0;
		param_01.var_17DE.var_6855 = 0;
		param_01.var_17DE.var_6856 = 0;
	}
	else
	{
		var_06 = var_04 - param_01.var_17DE.var_6F3F;
		if(abs(var_06) > 0.5)
		{
			var_02 = ["x4_turret_decel_1"];
			param_01.var_3BCA = 1;
		}

		var_07 = var_03 - param_01.var_17DE.var_6F47;
		if(param_01.var_17DE.var_5004 == 0 && var_07 < 0)
		{
			param_01.var_17DE.var_5004 = 1;
			param_01.var_17E3 = gettime();
		}
		else if(param_01.var_17DE.var_5004 == 1 && var_07 < 0)
		{
			param_01.var_17DE.var_9349 = param_01.var_17DE.var_9349 + gettime() - param_01.var_17DE.var_17E3;
		}
		else if(var_07 >= 0)
		{
			param_01.var_17DE.var_17DE = 0;
			param_01.var_17DE.var_17E3 = 0;
			param_01.var_17DE.var_9349 = 0;
		}

		if(param_01.var_17DE.var_9349 > 400 && var_07 < -0.6 && var_05 > 2000)
		{
			param_01.var_17DE.var_17E3 = 0;
			param_01.var_17DE.var_17DE = 0;
			param_01.var_17DE.var_9349 = 0;
			var_02 = ["x4_turret_decel_2"];
		}
		else if(param_01.var_17DE.var_9349 > 400 && var_07 < -0.6 && var_05 <= 2000)
		{
			param_01.var_17DE.var_17E3 = 0;
			param_01.var_17DE.var_17DE = 0;
			param_01.var_17DE.var_9349 = 0;
			var_02 = ["x4_turret_decel_1"];
		}
		else if(var_03 < 0.1)
		{
			var_02 = 1;
			param_01.var_17DE.var_17E3 = 0;
			param_01.var_17DE.var_17DE = 0;
			param_01.var_17DE.var_9349 = 0;
			var_02 = ["x4_turret_decel_1"];
		}

		param_01.var_17DE.var_6F47 = var_03;
		param_01.var_17DE.var_6F3F = var_04;
	}

	return var_02;
}

//Function Number: 13
lib_A647::func_A386(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_00["speed"];
	if(var_03 < 0.1)
	{
		var_02 = 1;
		param_01.var_3BCE = 1;
	}

	return var_02;
}

//Function Number: 14
lib_A647::func_A37D(param_00,param_01)
{
	return 0;
}

//Function Number: 15
lib_A647::func_A38D(param_00,param_01)
{
	return 0;
}

//Function Number: 16
lib_A647::func_A38C(param_00,param_01)
{
	var_02 = ["zv_front_left","zv_front_right","zv_rear_left","zv_rear_right"];
	var_03 = [];
	var_03["zv_front_left"] = param_00["x4wwt_zvelocity_front_left"];
	var_03["zv_front_right"] = param_00["x4wwt_zvelocity_front_right"];
	var_03["zv_rear_left"] = param_00["x4wwt_zvelocity_rear_left"];
	var_03["zv_rear_right"] = param_00["x4wwt_zvelocity_rear_right"];
	var_04 = param_00["speed"];
	var_05 = 0;
	if(!isdefined(param_01.var_A2F8))
	{
		param_01.var_A2F8 = spawnstruct();
		param_01.var_A2F8.var_6F49 = [];
		foreach(var_07 in var_02)
		{
			param_01.var_A2F8.var_6F49[var_07] = var_03[var_07];
		}

		var_09 = 0;
	}
	else
	{
		foreach(var_0B in var_03)
		{
			var_09 = var_03[var_0B] - param_01.var_A2F8.var_6F49[var_0B];
			if(abs(var_09) > 20 && var_04 > 0)
			{
				var_05 = 1;
			}

			param_01.var_A2F8.var_6F49[var_0B] = var_03[var_0B];
		}
	}

	return var_05;
}

//Function Number: 17
lib_A647::func_A388(param_00,param_01)
{
	var_02 = 0;
	return var_02;
}

//Function Number: 18
lib_A647::func_A38B(param_00,param_01)
{
	var_02 = 0;
	return var_02;
}

//Function Number: 19
lib_A647::func_A389(param_00,param_01)
{
	var_02 = 0;
	var_03 = abs(param_00["x4wwt_gun_yaw_rate"]);
	var_04 = param_00["speed"];
	if(!isdefined(param_01.var_997B))
	{
		param_01.var_997B = spawnstruct();
		param_01.var_997B.var_6F47 = var_03;
		param_01.var_997B.var_6F38 = 0;
		param_01.var_997B.var_5091 = 0;
		param_01.var_997B.var_9353 = 0;
		param_01.var_997B.var_9352 = 0;
		param_01.var_997B.var_934C = 1000;
		param_01.var_997B.var_1A58 = 1;
		param_01.var_997B.var_9354 = 0;
		param_01.var_997B.var_5092 = 0;
		param_01.var_997B.var_9355 = 0;
	}
	else
	{
		var_05 = var_03 - param_01.var_997B.var_6F47;
		if(param_01.var_997B.var_5091 == 0 && var_05 > 0)
		{
			param_01.var_997B.var_5091 = 1;
			param_01.var_997B.var_9352 = gettime();
		}
		else if(param_01.var_997B.var_5091 == 1 && var_05 > 0)
		{
			param_01.var_997B.var_9353 = param_01.var_997B.var_9353 + gettime() - param_01.var_997B.var_9352;
		}
		else if(var_05 <= 0)
		{
			param_01.var_997B.var_5091 = 0;
			param_01.var_997B.var_9353 = 0;
			param_01.var_997B.var_9352 = 0;
		}

		var_06 = gettime() - param_01.var_997B.var_934C;
		if(var_03 > 0.1 && param_01.var_997B.var_5092 == 0)
		{
			if(var_03 > 2 && var_05 > 0.05 && param_01.var_997B.var_1A58 == 1 && var_04 < 0.1)
			{
				var_02 = ["x4_turret_rotate_stop"];
				param_01.var_997B.var_934C = gettime();
				param_01.var_997B.var_1A58 = 0;
				param_01.var_997B.var_9355 = gettime();
				param_01.var_997B.var_5092 = 1;
			}
			else if(var_03 > 0.5 && param_01.var_997B.var_1A58 == 1)
			{
				param_01.var_997B.var_1A58 = 0;
				param_01.var_997B.var_9355 = gettime();
				param_01.var_997B.var_5092 = 1;
			}
		}
		else if(var_03 <= 0.1 && param_01.var_997B.var_5092 == 1 && var_04 < 0.1)
		{
			var_07 = gettime() - param_01.var_997B.var_9355;
			if(var_07 > 1500 && param_01.var_997B.var_1A58 == 0)
			{
				var_02 = ["x4_turret_rotate_stop"];
				param_01.var_997B.var_1A58 = 1;
				param_01.var_997B.var_5092 = 0;
				var_07 = 0;
			}
			else if(var_07 <= 1500)
			{
				param_01.var_997B.var_5092 = 0;
				param_01.var_997B.var_1A58 = 1;
				var_07 = 0;
			}
		}
		else if(var_03 <= 0.1 && param_01.var_997B.var_5092 == 1 && var_04 >= 0.1)
		{
			param_01.var_997B.var_5092 = 0;
			param_01.var_997B.var_1A58 = 1;
			var_07 = 0;
		}

		param_01.var_997B.var_6F47 = var_03;
		param_01.var_997B.var_6F38 = var_05;
	}

	return var_02;
}

//Function Number: 20
lib_A647::func_A38A(param_00,param_01)
{
	var_02 = 0;
	return var_02;
}

//Function Number: 21
lib_A647::func_A387(param_00,param_01)
{
	var_02 = 0;
	return var_02;
}

//Function Number: 22
lib_A647::func_A392()
{
	return lib_A647::func_A391("tag_wheel_front_left");
}

//Function Number: 23
lib_A647::func_A393()
{
	return lib_A647::func_A391("tag_wheel_front_right");
}

//Function Number: 24
lib_A647::func_A394()
{
	return lib_A647::func_A391("tag_wheel_back_left");
}

//Function Number: 25
lib_A647::func_A395()
{
	return lib_A647::func_A391("tag_wheel_back_right");
}

//Function Number: 26
lib_A647::func_A391(param_00)
{
	var_01 = lib_A5DA::func_11CA();
	var_02 = var_01 lib_A646::func_3EC7(param_00);
	var_03 = var_02[2];
	return var_03;
}

//Function Number: 27
lib_A647::func_A38E()
{
	var_00 = lib_A5DA::func_11CA();
	var_01 = var_00 lib_A646::func_3D8A();
	return var_01;
}

//Function Number: 28
lib_A647::func_A38F()
{
	var_00 = lib_A5DA::func_11CA();
	var_01 = var_00 lib_A646::func_3D8B();
	return var_01;
}

//Function Number: 29
lib_A647::func_A390()
{
	var_00 = lib_A5DA::func_11CA();
	return isdefined(var_00.var_6ADE);
}

//Function Number: 30
lib_A647::func_705A(param_00,param_01)
{
	for(var_02 = param_00.size - 1;var_02 > 0;var_02--)
	{
		param_00[var_02] = param_00[var_02 - 1];
	}

	param_00[0] = param_01;
	return param_00;
}

//Function Number: 31
lib_A647::func_3CCE(param_00)
{
	var_01 = 0;
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		var_01 = var_01 + param_00[var_02];
	}

	var_03 = var_01 / param_00.size;
	return var_03;
}