/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42276.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:22:05 PM
*******************************************************************/

//Function Number: 1
lib_A524::init()
{
	level.var_2E21["neutral"]["stand"]["idle"] = %casual_stand_idle;
	level.var_2E21["neutral"]["stand"]["run"] = %unarmed_scared_run;
	level.var_2E21["neutral"]["stand"]["death"] = %exposed_death;
	level.var_E0A = ::animscripts\civilian\civilian_init::func_E09;
	lib_A521::initglobals();
}