/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42328.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:20 PM
*******************************************************************/

//Function Number: 1
lib_A558::main()
{
	lib_A558::func_4B00();
	lib_A558::func_2CD7();
}

//Function Number: 2
lib_A558::func_4B00()
{
	level.var_78A9["generic"]["_stealth_patrol_walk_casualkiller"] = %casual_killer_jog_b;
	level.var_78A9["generic"]["patrol_walk_casualkiller"] = %casual_killer_jog_b;
	level.var_78A9["generic"]["patrol_idle_casualkiller"][0] = %casual_stand_idle;
	level.var_78A9["generic"]["patrol_stop_casualkiller"] = %casual_killer_walk_stop;
	level.var_78A9["generic"]["patrol_start_casualkiller"] = %casual_killer_walk_start;
}

//Function Number: 3
lib_A558::func_2CD7()
{
}

//Function Number: 4
lib_A558::func_30AA()
{
	self.script_animation = "casualkiller";
	if(isdefined(self.var_7A96) && self.var_7A96)
	{
		lib_A555::func_7E8E();
	}
}

//Function Number: 5
lib_A558::func_4CBF()
{
	if(isdefined(level.var_CCA) && lib_A59A::func_CC7("casualkiller"))
	{
		return;
	}

	var_00 = [];
	var_00["cover_trans_angles"]["casualkiller"][1] = 45;
	var_00["cover_trans_angles"]["casualkiller"][2] = 0;
	var_00["cover_trans_angles"]["casualkiller"][3] = -45;
	var_00["cover_trans_angles"]["casualkiller"][4] = 90;
	var_00["cover_trans_angles"]["casualkiller"][6] = -90;
	var_00["cover_trans_angles"]["casualkiller"][8] = 180;
	var_00["run"]["straight"] = %casual_killer_jog_b;
	var_00["run"]["move_f"] = %casual_killer_jog_b;
	var_00["run"]["straight_twitch"] = [%casual_killer_walk_f_weapon_swap,%casual_killer_walk_wave,%casual_killer_walk_point];
	lib_A59A::func_72D3("casualkiller",var_00);
}