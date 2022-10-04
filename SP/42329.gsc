/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42329.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:20 PM
*******************************************************************/

//Function Number: 1
lib_A559::main()
{
	lib_A559::func_4B00();
	lib_A559::func_2CD7();
}

//Function Number: 2
lib_A559::func_4B00()
{
	level.var_78A9["generic"]["_stealth_patrol_walk_creepwalk"] = %creepwalk_f;
	level.var_78A9["generic"]["patrol_walk_creepwalk"][0] = %creepwalk_f;
	level.var_78A9["generic"]["patrol_walk_creepwalk"][1] = %creepwalk_twitch_a_1;
	level.var_78A9["generic"]["patrol_walk_creepwalk"][2] = %creepwalk_twitch_a_2;
	level.var_78A9["generic"]["patrol_walk_creepwalk"][3] = %creepwalk_twitch_a_3;
	level.var_78A9["generic"]["patrol_walk_creepwalk"][4] = %creepwalk_twitch_a_4;
	level.var_78A9["generic"]["patrol_idle_creepwalk"][0] = %readystand_idle;
	var_00 = [4,1,1,1,1];
	level.var_78A9["generic"]["patrol_walk_weights_creepwalk"] = common_scripts\utility::get_cumulative_weights(var_00);
	level.var_78A9["generic"]["patrol_stop_creepwalk"] = %creepwalk_2_readystand;
	level.var_78A9["generic"]["patrol_start_creepwalk"] = %readystand_2_creepwalk;
}

//Function Number: 3
lib_A559::func_2CD7()
{
}

//Function Number: 4
lib_A559::func_30B0()
{
	self.script_animation = "creepwalk";
	if(isdefined(self.var_7A96) && self.var_7A96)
	{
		lib_A555::func_7E8E();
	}
}

//Function Number: 5
lib_A559::func_4CCA()
{
	if(isdefined(level.var_CCA) && lib_A59A::func_CC7("creepwalk"))
	{
		return;
	}

	var_00 = [];
	var_00["cover_trans_angles"]["creepwalk"][1] = 45;
	var_00["cover_trans_angles"]["creepwalk"][2] = 0;
	var_00["cover_trans_angles"]["creepwalk"][3] = -45;
	var_00["cover_trans_angles"]["creepwalk"][4] = 90;
	var_00["cover_trans_angles"]["creepwalk"][6] = -90;
	var_00["cover_trans_angles"]["creepwalk"][8] = 180;
	var_00["run"]["straight"] = %creepwalk_f;
	var_00["run"]["move_f"] = %creepwalk_f;
	var_00["walk"]["straight"] = %creepwalk_f;
	var_00["walk"]["move_f"] = %creepwalk_f;
	var_00["run"]["straight_twitch"] = [%creepwalk_twitch_a_1,%creepwalk_twitch_a_2,%creepwalk_twitch_a_3];
	var_00["run_turn"][2] = [%creepwalk_turn_90_l,%creepwalk_turn_90_l_aiming];
	var_00["run_turn"][3] = %creepwalk_turn_45_l;
	var_00["run_turn"][5] = %creepwalk_turn_45_r;
	var_00["run_turn"][6] = [%creepwalk_turn_90_r,%creepwalk_turn_90_r_aiming];
	lib_A59A::func_72D3("creepwalk",var_00);
}