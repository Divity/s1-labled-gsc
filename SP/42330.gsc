/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42330.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:20 PM
*******************************************************************/

//Function Number: 1
lib_A55A::main()
{
	lib_A55A::func_4B00();
	lib_A55A::func_2CD7();
}

//Function Number: 2
lib_A55A::func_4B00()
{
	level.var_78A9["generic"]["_stealth_patrol_walk_patroljog"] = %patrol_jog;
	level.var_78A9["generic"]["patrol_walk_patroljog"][0] = %patrol_jog;
	level.var_78A9["generic"]["patrol_lookup"] = %patrol_jog_look_up_once;
	level.var_78A9["generic"]["patrol_orders"] = %patrol_jog_orders_once;
	level.var_78A9["generic"]["patrol_360"] = %patrol_jog_360_once;
	level.var_6712["patrol_lookup"] = "patrol_lookup";
	level.var_6712["patrol_orders"] = "patrol_orders";
	level.var_6712["patrol_360"] = "patrol_360";
}

//Function Number: 3
lib_A55A::func_2CD7()
{
}