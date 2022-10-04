/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42364.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 5 ms
 * Timestamp: 4/20/2022 8:23:23 PM
*******************************************************************/

//Function Number: 1
lib_A57C::func_8D90()
{
	lib_A57C::func_324E();
	var_00 = self.var_669.var_13A2.var_8E6["state"]["hidden"];
	thread lib_A585::func_903(var_00,"enemy_behavior");
	var_00 = self.var_669.var_13A2.var_8E6["state"]["spotted"];
	thread lib_A585::func_904(var_00,"enemy_behavior");
	thread lib_A57C::func_31EB();
}

//Function Number: 2
lib_A57C::func_31EB()
{
	self endon("death");
	self endon("pain_death");
	self endon("damage");
	for(;;)
	{
		self waittill("event_awareness",var_00);
		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		var_01 = self.var_669.var_13A2.var_8E6["animation"]["wrapper"];
		self thread [[ var_01 ]](var_00);
	}
}

//Function Number: 3
lib_A57C::func_327B()
{
	self.var_19D = 0.5;
	self.var_19E = 0.1;
	self.favoriteenemy = undefined;
	self.var_2D2A = 1;
	self.var_2D33 = 1;
	thread lib_A59A::func_7DD9(0);
	if(self.type == "dog")
	{
		return;
	}

	self.var_120 = 1;
	self method_8166();
}

//Function Number: 4
lib_A57C::func_327C(param_00)
{
	self.var_19D = 0.01;
	if(!isdefined(self.var_2C8F))
	{
		self.ignoreall = 0;
		thread lib_A59A::func_7DD9(1);
	}

	self.var_2D2A = undefined;
	self.var_2D33 = undefined;
	if(isdefined(self.var_63C8))
	{
		self.var_180 = self.var_63C8;
	}

	if(self.type != "dog")
	{
		self.var_120 = 0;
		if(!isdefined(param_00))
		{
			lib_A59A::func_1ED1();
			lib_A585::func_327D();
		}
	}
	else
	{
		self.var_7A06 = undefined;
		self.var_7A73 = undefined;
	}

	if(isdefined(param_00))
	{
		return;
	}

	if(isdefined(level.var_669.var_4417.var_8A8C))
	{
		var_01 = level.var_669.var_4417.var_8A8C[self.var_7ADE];
		if(isdefined(var_01))
		{
			self getenemyinfo(var_01);
		}
	}
}

//Function Number: 5
lib_A57C::func_324E()
{
	lib_A59A::func_32DC("_stealth_override_goalpos");
	lib_A59A::func_32DC("_stealth_enemy_alert_level_action");
	lib_A59A::func_32DC("_stealth_running_to_corpse");
	lib_A59A::func_32DC("_stealth_behavior_reaction_anim");
	lib_A59A::func_32DC("_stealth_behavior_first_reaction");
	lib_A59A::func_32DC("_stealth_behavior_reaction_anim_in_progress");
	self.var_669.var_13A2 = spawnstruct();
	self.var_7.var_6140 = 1;
	self.var_669.var_13A2.var_8E6 = [];
	lib_A57C::func_321D();
	lib_A57C::func_321A();
	self.var_669.var_13A2.var_33BE = spawnstruct();
	if(self.type == "dog")
	{
		lib_A57C::func_3222();
	}

	self.var_669.var_6DF3 = spawnstruct();
	thread lib_A585::func_923();
}

//Function Number: 6
lib_A57C::func_3222()
{
	if(threatbiasgroupexists("dog"))
	{
		self sentient_setthreatbiasgroup("dog");
	}

	if(isdefined(self.enemy) || isdefined(self.favoriteenemy))
	{
		return;
	}

	lib_A59A::func_32DC("_stealth_behavior_asleep");
	if(isdefined(self.var_7A99) || isdefined(self.var_7A96))
	{
		return;
	}

	self.ignoreme = 1;
	self.ignoreall = 1;
	self.var_31 = 1;
	thread lib_A506::func_BCB(self,"gravity","_stealth_dog_sleeping");
	lib_A59A::func_32DD("_stealth_behavior_asleep");
}

//Function Number: 7
lib_A57C::func_3218(param_00)
{
	foreach(var_03, var_02 in param_00)
	{
		lib_A585::func_8D2("state",var_03,var_02);
	}

	var_04 = self.var_669.var_13A2.var_8E6["state"]["hidden"];
	thread lib_A585::func_903(var_04,"enemy_behavior");
	var_04 = self.var_669.var_13A2.var_8E6["state"]["spotted"];
	thread lib_A585::func_904(var_04,"enemy_behavior");
}

//Function Number: 8
lib_A57C::func_321D()
{
	var_00 = [];
	var_00["hidden"] = ::lib_A57C::func_327B;
	var_00["spotted"] = ::lib_A57C::func_327C;
	lib_A57C::func_3218(var_00);
}

//Function Number: 9
lib_A57C::func_321A()
{
	lib_A585::func_8D2("animation","wrapper",::lib_A585::func_31F1);
	if(self.type == "dog")
	{
		lib_A585::func_8D2("animation","grenade danger",::lib_A57A::func_2C87);
		lib_A585::func_8D2("animation","bulletwhizby",::lib_A57A::func_2C87);
		lib_A585::func_8D2("animation","gunshot_teammate",::lib_A57A::func_2C87);
		lib_A585::func_8D2("animation","projectile_impact",::lib_A57A::func_2C88);
		return;
	}

	lib_A585::func_8D2("animation","grenade danger",::lib_A57A::func_31EC);
	lib_A585::func_8D2("animation","bulletwhizby",::lib_A57A::func_31EC);
	lib_A585::func_8D2("animation","gunshot_teammate",::lib_A57A::func_31EC);
	lib_A585::func_8D2("animation","projectile_impact",::lib_A57A::func_31EC);
}