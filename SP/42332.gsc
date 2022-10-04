/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42332.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:20 PM
*******************************************************************/

//Function Number: 1
lib_A55C::main()
{
	lib_A52A::func_1CA9();
	lib_A559::main();
	lib_A55A::main();
	lib_A557::main();
	lib_A558::main();
	lib_A556::main();
	lib_A55C::func_3596();
}

//Function Number: 2
lib_A55C::func_399C(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	self.var_6716 = undefined;
	self.var_6715 = undefined;
	self.script_animation = param_00;
	if(param_02)
	{
		lib_A555::func_66F9();
	}

	lib_A555::func_7E8E();
	self.var_1C7 = 32;
	self method_81CA("stand");
	self.var_2AF2 = 1;
	self.var_2B0D = 1;
	self.var_31 = 1;
	lib_A59A::func_2A8C();
	self.var_6700 = param_00;
	if(isdefined(param_01) && param_01)
	{
		self.var_30C2 = ::lib_A52A::func_740;
		lib_A52A::func_740("flashlight",undefined,param_03);
	}
}

//Function Number: 3
lib_A55C::func_3596()
{
	lib_A53D::func_4B6F();
	level.var_4B65 = ::lib_A55C::func_05A6;
	level.var_78A9["generic"]["flashlight_high_idle"][0] = %so_hijack_search_flashlight_high_loop;
	level.var_78A9["generic"]["flashlight_high_react"] = %so_hijack_search_flashlight_high_reaction;
	level.var_78A9["generic"]["flashlight_low_idle"][0] = %so_hijack_search_flashlight_low_loop;
	level.var_78A9["generic"]["flashlight_low_react"] = %so_hijack_search_flashlight_low_reaction;
	level.var_78A9["generic"]["flashlight_high2_into_idle"] = %patrol_flashlight_high_stop;
	level.var_78A9["generic"]["flashlight_high2_idle"][0] = %patrol_flashlight_high_idle_v1;
	level.var_78A9["generic"]["flashlight_high2_react"] = %patrol_flashlight_high_putaway;
	lib_A506::func_807("generic","flashlight_hide",::lib_A52A::func_1CA8,"flashlight_high2_react");
	level.var_78A9["generic"]["flashlight_high2_takeout"] = %patrol_flashlight_high_takeout;
	lib_A506::func_807("generic","flashlight_show",::lib_A52A::func_1CAB,"flashlight_high2_takeout");
}

//Function Number: 4
lib_A55C::func_05A6(param_00)
{
	param_00[param_00.size] = "flashlight_high";
	param_00[param_00.size] = "flashlight_low";
	param_00[param_00.size] = "flashlight_high2";
	return param_00;
}