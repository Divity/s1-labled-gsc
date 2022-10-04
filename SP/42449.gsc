/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42449.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:28 PM
*******************************************************************/

//Function Number: 1
lib_A5D1::func_823D(param_00,param_01)
{
	if(!isdefined(param_00) || !isdefined(level.var_B23[param_00]))
	{
		lib_A5D1::func_262D(param_01);
		return 0;
	}

	if(level.var_333B[param_01] == param_00)
	{
		return 0;
	}

	level.var_333B[param_01] = param_00;
	lib_A5D1::func_9BD0(param_00,param_01);
	return 1;
}

//Function Number: 2
lib_A5D1::func_9BD0(param_00,param_01)
{
	if(level.var_31D lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		return;
	}

	lib_A5ED::func_874E(param_00,param_01);
}

//Function Number: 3
lib_A5D1::func_262D(param_00)
{
	level.var_333B[param_00] = "";
	level.var_31D method_8129(param_00);
}

//Function Number: 4
lib_A5D1::func_9BDE(param_00)
{
	if(level.var_31D lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		return;
	}

	lib_A5D8::func_76F0(param_00);
}

//Function Number: 5
lib_A5D1::func_262E()
{
	lib_A5D8::func_76EB();
}

//Function Number: 6
lib_A5D1::func_0B4F(param_00,param_01,param_02)
{
	lib_A5D2::func_102D("ambientDelay called, this is deprecated! Use new preset string tables.");
}

//Function Number: 7
lib_A5D1::func_0B50(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	lib_A5D2::func_102D("ambientEvent called, this is deprecated! Use new preset string tables.");
}

//Function Number: 8
lib_A5D1::func_0B51(param_00)
{
	lib_A5D2::func_102D("ambientEventStart called, this is deprecated! Use maps_utility::set_ambient( track, fade_ ).");
	lib_A59A::func_7DB3(param_00);
}

//Function Number: 9
lib_A5D1::func_8B26(param_00)
{
	lib_A5D2::func_102D("start_ambient_event called, this is deprecated! Use maps_utility::set_ambient( track, fade_ ).");
	lib_A59A::func_7DB3(param_00);
}