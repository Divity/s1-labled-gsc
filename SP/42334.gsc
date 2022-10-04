/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42334.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:20 PM
*******************************************************************/

//Function Number: 1
lib_A55E::main()
{
	lib_A55E::func_6A57();
}

//Function Number: 2
lib_A55E::func_6A57()
{
	level.var_78AE["player_rig"] = #animtree;
	level.var_78B2["player_rig"] = "viewhands_player_delta";
	level.var_78A9["player_rig"]["boost_land"] = %vm_rocket_jump_airbrake;
}