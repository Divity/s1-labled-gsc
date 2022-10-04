/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42369.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:23 PM
*******************************************************************/

//Function Number: 1
lib_A581::func_8DAD()
{
	lib_A581::func_8DAC();
}

//Function Number: 2
lib_A581::func_8DAC()
{
	common_scripts\utility::flag_init("_stealth_found_corpse");
	level.var_669.var_5833.var_222C = spawnstruct();
	level.var_669.var_5833.var_222C.var_5547 = undefined;
	level.var_669.var_5833.var_222C.var_2B7B = [];
	lib_A581::func_8D9D();
	level.var_669.var_5833.var_222C.var_2232 = 6;
	lib_A581::func_8D9E();
	lib_A581::func_8D9F();
	level.var_669.var_13A2.var_222C = spawnstruct();
}

//Function Number: 3
lib_A581::func_8D9D()
{
	var_00 = [];
	var_00["player_dist"] = 1500;
	var_00["sight_dist"] = 1500;
	var_00["detect_dist"] = 256;
	var_00["found_dist"] = 96;
	var_00["found_dog_dist"] = 50;
	lib_A581::func_8DA9(var_00);
}

//Function Number: 4
lib_A581::func_8DA9(param_00)
{
	foreach(var_03, var_02 in param_00)
	{
		level.var_669.var_5833.var_222C.var_2B7B[var_03] = var_02;
	}

	level.var_669.var_5833.var_222C.var_6AD1 = squared(level.var_669.var_5833.var_222C.var_2B7B["player_dist"]);
	level.var_669.var_5833.var_222C.var_855D = squared(level.var_669.var_5833.var_222C.var_2B7B["sight_dist"]);
	level.var_669.var_5833.var_222C.var_2989 = squared(level.var_669.var_5833.var_222C.var_2B7B["detect_dist"]);
	level.var_669.var_5833.var_222C.var_39F1 = squared(level.var_669.var_5833.var_222C.var_2B7B["found_dist"]);
	level.var_669.var_5833.var_222C.var_39F2 = squared(level.var_669.var_5833.var_222C.var_2B7B["found_dog_dist"]);
}

//Function Number: 5
lib_A581::func_8D9F()
{
	lib_A581::func_8DAB(30);
}

//Function Number: 6
lib_A581::func_8DAB(param_00)
{
	level.var_669.var_5833.var_222C.var_7437 = param_00;
}

//Function Number: 7
lib_A581::func_8D9E()
{
	lib_A581::func_8DAA(60);
}

//Function Number: 8
lib_A581::func_8DAA(param_00)
{
	level.var_669.var_5833.var_222C.var_39DF = param_00;
}

//Function Number: 9
lib_A581::func_8DA8(param_00)
{
	level.var_669.var_5833.var_222C.var_2028 = param_00;
}

//Function Number: 10
lib_A581::func_8D9C()
{
	level.var_669.var_5833.var_222C.var_2028 = undefined;
}