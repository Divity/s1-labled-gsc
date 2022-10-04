/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42326.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:20 PM
*******************************************************************/

//Function Number: 1
lib_A556::main()
{
	lib_A556::func_4B00();
	lib_A556::func_2CD7();
}

//Function Number: 2
lib_A556::func_4B00()
{
	level.var_78A9["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
	level.var_78A9["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
	level.var_78A9["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
	level.var_78A9["generic"]["patrol_start"] = %patrol_bored_2_walk;
	level.var_78A9["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
	level.var_78A9["generic"]["patrol_radio_in_clear"] = %patrolwalk_cold_gunup_transition;
	level.var_78A9["generic"]["patrol_idle"] = %patrol_bored_idle;
	level.var_78A9["generic"]["patrol_idle_1"] = %patrol_bored_idle;
	level.var_78A9["generic"]["patrol_idle_2"] = %patrol_bored_idle_smoke;
	level.var_78A9["generic"]["patrol_idle_3"] = %patrol_bored_idle_cellphone;
	level.var_78A9["generic"]["patrol_idle_4"] = %patrol_bored_twitch_bug;
	level.var_78A9["generic"]["patrol_idle_5"] = %patrol_bored_twitch_checkphone;
	level.var_78A9["generic"]["patrol_idle_6"] = %patrol_bored_twitch_stretch;
	level.var_78A9["generic"]["patrol_idle_smoke"] = %patrol_bored_idle_smoke;
	level.var_78A9["generic"]["patrol_idle_checkphone"] = %patrol_bored_twitch_checkphone;
	level.var_78A9["generic"]["patrol_idle_stretch"] = %patrol_bored_twitch_stretch;
	level.var_78A9["generic"]["patrol_idle_phone"] = %patrol_bored_idle_cellphone;
}

//Function Number: 3
lib_A556::func_2CD7()
{
	level.var_78A9["generic"]["patrol_dog_stop"] = %iw6_dog_attackidle_runin_8;
	level.var_78A9["generic"]["patrol_dog_start"] = %iw6_dog_attackidle_runout_8;
}