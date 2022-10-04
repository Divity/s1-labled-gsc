/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42363.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 8 ms
 * Timestamp: 4/20/2022 8:23:23 PM
*******************************************************************/

//Function Number: 1
lib_A57B::main()
{
	lib_A57B::func_4B00();
	lib_A57B::func_2CD7();
}

//Function Number: 2
lib_A57B::func_4B00()
{
	level.var_78A9["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
	level.var_78A9["generic"]["patrol_radio_in_clear"] = %patrolwalk_cold_gunup_transition;
	level.var_78A9["generic"]["_stealth_patrol_jog"] = %patrol_jog;
	level.var_78A9["generic"]["_stealth_patrol_walk"] = %patrol_bored_patrolwalk;
	level.var_78A9["generic"]["_stealth_combat_jog"] = %combat_jog;
	level.var_78A9["generic"]["_stealth_patrol_cqb"] = %cqb_walk_iw6;
	if(!isdefined(level.var_78A9["generic"]["_stealth_patrol_search_a"]))
	{
		level.var_78A9["generic"]["_stealth_patrol_search_a"] = %patrol_boredwalk_lookcycle_a;
		level.var_78A9["generic"]["_stealth_patrol_search_b"] = %patrol_boredwalk_lookcycle_b;
	}

	level.var_78A9["generic"]["_stealth_behavior_spotted_short"] = %exposed_idle_twitch_v4;
	level.var_78A9["generic"]["_stealth_behavior_spotted_long"] = %patrol_bored_react_walkstop_short;
	level.var_78A9["generic"]["_stealth_look_around"][0] = %patrol_bored_react_look_v1;
	level.var_78A9["generic"]["_stealth_look_around"][1] = %patrol_bored_react_look_v2;
	level.var_78A9["generic"]["mech_stealth_look_around"][0] = %mech_unaware_idle;
	level.var_78A9["generic"]["mech_stealth_look_around"][1] = %mech_unaware_idle;
	level.var_78A9["generic"]["_stealth_behavior_saw_corpse"] = %exposed_idle_twitch_v4;
	level.var_78A9["generic"]["_stealth_behavior_generic1"] = %patrol_bored_react_look_advance;
	level.var_78A9["generic"]["_stealth_behavior_generic2"] = %patrol_bored_react_look_retreat;
	level.var_78A9["generic"]["_stealth_behavior_generic3"] = %patrol_bored_react_walkstop;
	level.var_78A9["generic"]["_stealth_behavior_generic4"] = %patrol_bored_react_walkstop_short;
	level.var_78A9["generic"]["_stealth_idle_to_run_2"] = %patrol_bored_duckandrun_b;
	level.var_78A9["generic"]["_stealth_idle_to_run_4"] = %patrol_bored_duckandrun_l;
	level.var_78A9["generic"]["_stealth_idle_to_run_6"] = %patrol_bored_duckandrun_r;
	level.var_78A9["generic"]["_stealth_idle_to_run_8"] = %patrol_bored_duckandrun_f;
	level.var_78A9["generic"]["mech_stealth_idle_to_run_2"] = %patrol_bored_duckandrun_b;
	level.var_78A9["generic"]["mech_stealth_idle_to_run_4"] = %patrol_bored_duckandrun_l;
	level.var_78A9["generic"]["mech_stealth_idle_to_run_6"] = %patrol_bored_duckandrun_r;
	level.var_78A9["generic"]["mech_stealth_idle_to_run_8"] = %patrol_bored_duckandrun_f;
	level.var_78A9["generic"]["_stealth_find_jog"] = %patrol_boredjog_find;
	level.var_78A9["generic"]["_stealth_find_stand"] = %patrol_bored_react_look_v2;
	level.var_78A9["generic"]["_stealth_prone_idle"][0] = %prone_aim_idle;
	level.var_78A9["generic"]["_stealth_prone_stop"] = %prone_crawl_2_prone;
	level.var_78A9["generic"]["_stealth_prone_start"] = %prone_2_prone_crawl;
	level.var_78A9["generic"]["_stealth_prone_2_run_roll"] = %hunted_pronehide_2_stand_v4;
}

//Function Number: 3
lib_A57B::func_2CD7()
{
	level.var_78A9["generic"]["_stealth_dog_sleeping"][0] = %german_shepherd_sleeping;
	level.var_78A9["generic"]["_stealth_dog_stop"] = %iw6_dog_attackidle_runin_8;
	level.var_78A9["generic"]["_stealth_dog_find"] = %german_shepherd_run_flashbang_b;
	level.var_78A9["generic"]["_stealth_dog_howl"] = %iw6_dog_attackidle_bark;
	level.var_78A9["generic"]["_stealth_dog_saw_corpse"] = %iw6_dog_attackidle_bark;
	level.var_78A9["generic"]["_stealth_dog_growl"] = %iw6_dog_attackidle;
	level.var_78A9["generic"]["_stealth_dog_wakeup_fast"] = %german_shepherd_wakeup_fast;
	level.var_78A9["generic"]["_stealth_dog_wakeup_slow"] = %german_shepherd_wakeup_slow;
}