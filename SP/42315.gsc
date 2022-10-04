/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42315.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 8
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:19 PM
*******************************************************************/

//Function Number: 1
lib_A54B::main()
{
	waittillframeend;
	lib_A54B::func_72E5();
}

//Function Number: 2
lib_A54B::func_72E5()
{
	if(isdefined(level._snd))
	{
		lib_A5DE::snd_register_message("snd_mech_emp_restart",::lib_A54B::func_8705);
		lib_A5DE::snd_register_message("snd_mech_add_rocketpack_raise",::lib_A54B::func_8704);
		lib_A5DE::snd_register_message("snd_mech_add_rocketpack_lower",::lib_A54B::func_8703);
	}
}

//Function Number: 3
lib_A54B::func_8705()
{
	lib_A5D2::func_289D("mech_emp_restart",self);
}

//Function Number: 4
lib_A54B::func_8704()
{
	lib_A5D2::func_289D("mech_add_rocketpack_raise",self);
}

//Function Number: 5
lib_A54B::func_8703()
{
	lib_A5D2::func_289D("mech_add_rocketpack_lower",self);
}

//Function Number: 6
lib_A54B::func_5AC9(param_00,param_01)
{
	lib_A5D2::func_289D(param_00,self);
}

//Function Number: 7
lib_A54B::func_5A96(param_00)
{
	lib_A5D2::func_289D("mech_fs_walk_slow",param_00);
}

//Function Number: 8
lib_A54B::func_5AC7(param_00)
{
	lib_A5D2::func_289D("mech_metal_rattle",param_00);
}