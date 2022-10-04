/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42372.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:24 PM
*******************************************************************/

//Function Number: 1
lib_A584::func_8DC9()
{
	thread lib_A584::func_3230();
	self.var_669.var_6DF3.var_33BE = 1;
}

//Function Number: 2
lib_A584::func_3230()
{
	self endon("death");
	self endon("pain_death");
	for(;;)
	{
		self waittill("event_awareness",var_00);
		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		if(lib_A588::func_8DE2())
		{
			continue;
		}

		var_01 = self.var_669.var_13A2.var_8E6["event"];
		if(!isdefined(var_01[var_00]))
		{
			continue;
		}

		thread lib_A584::func_323E(var_00);
	}
}

//Function Number: 3
lib_A584::func_323E(param_00)
{
	var_01 = lib_A585::func_4423("_stealth_spotted");
	self endon("_stealth_enemy_alert_level_change");
	level endon(var_01);
	self endon("death");
	waittillframeend;
	self endon("enemy_awareness_reaction");
	self endon("event_awareness");
	lib_A585::func_3264();
	lib_A585::func_3242();
	lib_A585::func_327D();
	var_02 = self.var_669.var_13A2.var_8E6["event"][param_00];
	self [[ var_02 ]](param_00);
	lib_A587::func_31D7("reset");
}

//Function Number: 4
lib_A584::func_3237(param_00)
{
	var_01 = self.var_669.var_5833.var_33BE.var_1212[param_00];
	wait(0.05);
	lib_A59A::func_32E3("_stealth_behavior_reaction_anim_in_progress");
	var_02 = lib_A585::func_3241(var_01,300,40);
	lib_A584::func_324F(var_02);
}

//Function Number: 5
lib_A584::func_3233(param_00)
{
	var_01 = self.var_669.var_5833.var_33BE.var_1212[param_00];
	if(common_scripts\utility::isflashed() && self.script == "<custom>")
	{
		wait(0.05);
		self method_816B(1);
	}

	wait(0.05);
	if(self.script == "flashed")
	{
		self waittill("stop_flashbang_effect");
	}

	var_02 = lib_A585::func_3241(var_01,300,40);
	if(isdefined(var_02))
	{
		thread lib_A585::func_31FC();
		thread lib_A585::func_31FB(var_01);
	}

	lib_A584::func_324F(var_02);
}

//Function Number: 6
lib_A584::func_3232(param_00)
{
	var_01 = self.var_669.var_5833.var_33BE.var_1212[param_00];
	wait(0.05);
	lib_A59A::func_32E3("_stealth_behavior_reaction_anim_in_progress");
	var_02 = lib_A585::func_3241(var_01,300,40);
	thread lib_A585::func_31FC();
	lib_A584::func_324F(var_02);
}

//Function Number: 7
lib_A584::func_323A(param_00)
{
}

//Function Number: 8
lib_A584::func_324F(param_00,param_01)
{
	if(isdefined(param_00))
	{
		wait(randomfloat(1));
		thread lib_A585::func_3263(param_00,param_01);
		thread lib_A585::func_326E(param_00,param_01);
		self.var_2AF2 = 0;
		self.var_2B0D = 0;
		self waittill("goal");
		wait(randomfloatrange(15,25));
		return;
	}

	wait(randomfloatrange(1,4));
}

//Function Number: 9
lib_A584::func_8DCD(param_00)
{
	if(!isdefined(param_00) || !common_scripts\utility::array_contains(param_00,"heard_scream"))
	{
		lib_A584::func_8DCC("heard_scream");
	}

	if(!isdefined(param_00) || !common_scripts\utility::array_contains(param_00,"doFlashBanged"))
	{
		lib_A584::func_8DCC("doFlashBanged");
	}

	if(!isdefined(param_00) || !common_scripts\utility::array_contains(param_00,"explode"))
	{
		lib_A584::func_8DCC("explode");
	}
}

//Function Number: 10
lib_A584::func_8DCC(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A584::func_8DC8();
	var_05 = lib_A584::func_8DC7();
	if(!isdefined(param_01))
	{
		param_01 = var_04[param_00];
	}

	if(!isdefined(param_02))
	{
		param_02 = var_05[param_00];
	}

	if(!isdefined(param_03))
	{
		param_03 = lib_A584::func_8DCB(param_00);
	}

	lib_A585::func_8D2("event",param_00,param_01);
	lib_A585::func_8D2("animation",param_00,param_02);
	thread lib_A589::func_3227(param_00);
	if(param_03)
	{
		self method_8041(param_00);
	}

	switch(param_00)
	{
		case "explode":
			break;
	}
}

//Function Number: 11
lib_A584::func_8DC8()
{
	var_00 = [];
	if(self.type == "dog")
	{
		var_00["heard_scream"] = ::lib_A584::func_323A;
		var_00["doFlashBanged"] = ::lib_A584::func_323A;
	}
	else
	{
		var_00["heard_scream"] = ::lib_A584::func_3237;
		var_00["doFlashBanged"] = ::lib_A584::func_3233;
	}

	var_00["explode"] = ::lib_A584::func_3232;
	return var_00;
}

//Function Number: 12
lib_A584::func_8DCB(param_00)
{
	switch(param_00)
	{
		case "heard_scream":
			break;

		case "doFlashBanged":
			break;

		case "explode":
			break;

		default:
			break;
	}
}

//Function Number: 13
lib_A584::func_8DC7()
{
	var_00 = [];
	var_00["doFlashBanged"] = ::lib_A57A::func_31EC;
	if(self.type == "dog")
	{
		var_00["heard_scream"] = ::lib_A57A::func_2C84;
		var_00["explode"] = ::lib_A57A::func_2C87;
	}
	else
	{
		var_00["heard_scream"] = ::lib_A57A::func_31EA;
		var_00["explode"] = ::lib_A57A::func_31EA;
	}

	return var_00;
}