/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42362.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 5 ms
 * Timestamp: 4/20/2022 8:23:23 PM
*******************************************************************/

//Function Number: 1
lib_A57A::func_1E98(param_00)
{
	self method_8142(%root,param_00);
}

//Function Number: 2
lib_A57A::func_31E6(param_00)
{
	var_01 = 600;
	if(isdefined(self.var_5A77) && self.var_5A77)
	{
		return;
	}

	if(isdefined(self.enemy))
	{
		var_01 = distance(self.enemy.var_2E6,self.var_2E6);
	}

	if(var_01 < 512)
	{
		var_02 = "_stealth_behavior_spotted_short";
	}
	else
	{
		var_02 = "_stealth_behavior_spotted_long";
	}

	self.var_31 = 1;
	thread lib_A585::func_8D8D(self,"gravity",var_02);
	if(var_01 < 200)
	{
		wait(0.5);
	}
	else
	{
		common_scripts\utility::waittill_notify_or_timeout(var_02,randomfloatrange(1.5,3));
	}

	self notify("stop_animmode");
}

//Function Number: 3
lib_A57A::func_31EC(param_00)
{
}

//Function Number: 4
lib_A57A::func_31EA(param_00)
{
	self.var_31 = 1;
	var_01 = level.var_31D;
	if(isdefined(self.enemy))
	{
		var_01 = self.enemy;
	}
	else if(isdefined(self.favoriteenemy))
	{
		var_01 = self.favoriteenemy;
	}

	var_02 = distance(self.var_2E6,var_01.var_2E6);
	var_03 = 4;
	var_04 = 1024;
	for(var_05 = 1;var_05 < var_03;var_05++)
	{
		var_06 = var_04 * var_05 / var_03;
		if(var_02 < var_06)
		{
			break;
		}
	}

	var_07 = "_stealth_behavior_generic" + var_05;
	lib_A585::func_8D8D(self,"gravity",var_07);
}

//Function Number: 5
lib_A57A::func_2C84(param_00)
{
	self.var_31 = 1;
	var_01 = undefined;
	if(isdefined(self.var_5B88))
	{
		var_02 = self.var_5B88;
		if(isdefined(var_02.var_6C4D) && isdefined(var_02.var_6C4D.var_12D) && self == var_02.var_6C4D.var_12D)
		{
			return;
		}
	}

	if(lib_A59A::func_32D7("_stealth_behavior_asleep"))
	{
		if(randomint(100) < 50)
		{
			var_01 = "_stealth_dog_wakeup_fast";
		}
		else
		{
			var_01 = "_stealth_dog_wakeup_slow";
		}
	}
	else
	{
		var_01 = "_stealth_dog_growl";
	}

	lib_A585::func_8D8D(self,"gravity",var_01);
}

//Function Number: 6
lib_A57A::func_2C87(param_00)
{
	self.var_31 = 1;
	var_01 = undefined;
	if(lib_A59A::func_32D7("_stealth_behavior_asleep"))
	{
		var_01 = "_stealth_dog_wakeup_fast";
	}
	else
	{
		var_01 = "_stealth_dog_growl";
	}

	lib_A585::func_8D8D(self,"gravity",var_01);
}

//Function Number: 7
lib_A57A::func_2C88(param_00)
{
	self.var_31 = 1;
	var_01 = undefined;
	if(lib_A59A::func_32D7("_stealth_behavior_asleep"))
	{
		var_01 = "_stealth_dog_wakeup_slow";
	}
	else
	{
		var_01 = "_stealth_dog_growl";
	}

	lib_A585::func_8D8D(self,"gravity",var_01);
}

//Function Number: 8
lib_A57A::func_31F0(param_00)
{
	self.var_31 = 1;
	var_01 = "_stealth_behavior_saw_corpse";
	lib_A585::func_8D8D(self,"gravity",var_01);
}

//Function Number: 9
lib_A57A::func_2C86(param_00)
{
	self.var_31 = 1;
	var_01 = "_stealth_dog_saw_corpse";
	lib_A585::func_8D8D(self,"gravity",var_01);
}

//Function Number: 10
lib_A57A::func_2C85(param_00)
{
	self.var_31 = 1;
	var_01 = "_stealth_dog_howl";
	lib_A585::func_8D8D(self,"gravity",var_01);
	lib_A585::func_8D8D(self,"gravity",var_01);
	lib_A585::func_8D8D(self,"gravity",var_01);
	lib_A585::func_8D8D(self,"gravity",var_01);
	lib_A585::func_8D8D(self,"gravity",var_01);
	lib_A585::func_8D8D(self,"gravity",var_01);
}

//Function Number: 11
lib_A57A::func_31E9(param_00)
{
	self endon("enemy");
	if(isdefined(self.enemy))
	{
		return;
	}

	self.var_31 = 1;
	if(self.var_7.var_5F58 == "stop")
	{
		var_01 = "_stealth_find_stand";
	}
	else
	{
		var_01 = "_stealth_find_jog";
	}

	lib_A585::func_8D8D(self,"gravity",var_01);
}

//Function Number: 12
lib_A57A::func_2C83(param_00)
{
	self endon("enemy");
	if(isdefined(self.enemy))
	{
		return;
	}

	self.var_31 = 1;
	var_01 = "_stealth_dog_find";
	lib_A585::func_8D8D(self,"gravity",var_01);
}