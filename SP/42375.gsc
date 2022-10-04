/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42375.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 25
 * Decompile Time: 4 ms
 * Timestamp: 4/20/2022 8:23:24 PM
*******************************************************************/

//Function Number: 1
lib_A587::func_8E0C()
{
	lib_A587::func_324E();
	thread lib_A587::func_328F();
}

//Function Number: 2
lib_A587::func_328F()
{
	self endon("death");
	self endon("pain_death");
	if(self.type == "dog")
	{
		thread lib_A587::func_328C();
	}

	for(;;)
	{
		self waittill("_stealth_enemy_alert_level_change",var_00);
		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		lib_A587::func_31D8(var_00);
	}
}

//Function Number: 3
lib_A587::func_31D8(param_00)
{
	lib_A59A::func_32DD("_stealth_enemy_alert_level_action");
	var_01 = param_00;
	if(issubstr(param_00,"warning"))
	{
		var_01 = "warning";
	}

	switch(var_01)
	{
		case "warning":
			break;

		case "attack":
			break;

		case "reset":
			break;
	}
}

//Function Number: 4
lib_A587::func_328C()
{
	self endon("death");
	self endon("pain_death");
	if(!lib_A59A::func_32D7("_stealth_behavior_asleep"))
	{
		return;
	}

	lib_A587::func_328D();
	wait(0.5);
	lib_A59A::delaythread(0.6,::lib_A59A::func_32D9,"_stealth_behavior_asleep");
	self.ignoreall = 0;
}

//Function Number: 5
lib_A587::func_328D()
{
	self endon("pain");
	self endon("enemy");
	common_scripts\utility::array_thread(level.var_328,::lib_A587::func_328E,self,128);
	for(;;)
	{
		self waittill("event_awareness",var_00);
		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		if(var_00 == "heard_scream" || var_00 == "bulletwhizby" || var_00 == "projectile_impact" || var_00 == "explode")
		{
			return;
		}
	}
}

//Function Number: 6
lib_A587::func_328E(param_00,param_01)
{
	param_00 endon("death");
	self endon("death");
	if(!param_00 lib_A59A::func_32D7("_stealth_behavior_asleep"))
	{
		return;
	}

	param_00 endon("_stealth_behavior_asleep");
	var_02 = param_01 * param_01;
	while(distancesquared(self.var_2E6,param_00.var_2E6) > var_02 && lib_A59A::func_32D7("_stealth_enabled"))
	{
		wait(0.1);
	}

	param_00.ignoreall = 0;
	param_00.favoriteenemy = self;
	wait(0.1);
	param_00.favoriteenemy = undefined;
}

//Function Number: 7
lib_A587::func_31DE()
{
	self endon("_stealth_enemy_alert_level_change");
	self endon("enemy_awareness_reaction");
	self endon("death");
	self endon("pain_death");
	lib_A588::func_8DE4();
	lib_A585::func_327D();
	lib_A59A::func_32D9("_stealth_enemy_alert_level_action");
	if(isdefined(self.var_669.var_6DF3.var_222C))
	{
		lib_A59A::func_32D9("_stealth_saw_corpse");
		lib_A59A::func_32D9("_stealth_found_corpse");
	}

	lib_A59A::func_32D9("_stealth_attack");
	lib_A59A::func_32DD("_stealth_normal");
	var_00 = lib_A585::func_8E9("threat","reset");
	self thread [[ var_00 ]]();
}

//Function Number: 8
lib_A587::func_31E1(param_00)
{
	var_01 = lib_A585::func_4423("_stealth_spotted");
	self endon("_stealth_enemy_alert_level_change");
	level endon(var_01);
	self endon("death");
	self endon("pain_death");
	self endon("event_awareness");
	lib_A585::func_3242();
	lib_A585::func_327D();
	var_02 = lib_A585::func_8E9("threat",param_00);
	self [[ var_02 ]]();
	lib_A587::func_31DD();
}

//Function Number: 9
lib_A587::func_3258(param_00)
{
	var_01 = self.var_19D;
	self.var_19D = 0.1;
	if(isdefined(self.var_5A77) && self.var_5A77)
	{
		lib_A585::func_8DFF("mech_stealth_look_around");
	}
	else
	{
		lib_A585::func_8DFF("_stealth_look_around");
	}

	wait(param_00);
	lib_A59A::func_1EBA();
	self.var_19D = var_01;
}

//Function Number: 10
lib_A587::func_31F2()
{
	self endon("death");
	wait(0.25);
	if(isdefined(self.enemy) && self method_81BE(self.enemy))
	{
		lib_A585::func_31F7("huh");
		thread lib_A585::func_31F3();
		return;
	}

	thread lib_A585::func_31F6();
}

//Function Number: 11
lib_A587::func_31E2()
{
	if(!isdefined(self.enemy))
	{
		return;
	}

	thread lib_A587::func_31F2();
	if(isdefined(self.var_7A96))
	{
		if(self.type != "dog")
		{
			var_00 = "a";
			if(common_scripts\utility::cointoss())
			{
				var_00 = "b";
			}

			lib_A585::func_8E00("_stealth_patrol_search_" + var_00,1);
		}
		else
		{
			lib_A59A::func_7E0F();
			self.var_7A06 = 1;
		}

		self.var_2AF2 = 1;
		self.var_2B0D = 1;
	}
	else if(self.type == "dog")
	{
		lib_A59A::func_7E0F();
		self.var_7A06 = 1;
		self.var_2AF2 = 1;
		self.var_2B0D = 1;
	}

	var_01 = vectornormalize(self.enemy.var_2E6 - self.var_2E6);
	var_02 = distance(self.enemy.var_2E6,self.var_2E6);
	var_02 = var_02 * 0.25;
	var_02 = clamp(var_02,64,128);
	var_01 = var_01 * var_02;
	var_03 = self.var_2E6 + var_01 + (0,0,16);
	var_04 = var_03 + (0,0,-96);
	var_03 = physicstrace(var_03,var_04);
	if(var_03 == var_04)
	{
		return;
	}

	lib_A59A::func_32DD("_stealth_override_goalpos");
	self method_81A6(var_03);
	self.var_1C7 = 64;
	common_scripts\utility::waittill_notify_or_timeout("goal",2);
	if(!self method_815F(self.var_2E6))
	{
		self.var_840B = var_03 + (0,0,64);
	}

	lib_A587::func_3258(10);
	self.var_840B = undefined;
}

//Function Number: 12
lib_A587::func_31E3()
{
	if(!isdefined(self.enemy))
	{
		return;
	}

	thread lib_A587::func_31F2();
	if(self.type != "dog")
	{
		lib_A585::func_8E00("_stealth_patrol_cqb");
	}
	else
	{
		lib_A59A::func_1ED1();
		self.var_7A73 = 1;
		self.var_7A06 = 1;
	}

	self.var_2AF2 = 0;
	self.var_2B0D = 0;
	var_00 = self.enemy.var_2E6;
	var_01 = distance(var_00,self.var_2E6);
	lib_A59A::func_32DD("_stealth_override_goalpos");
	self method_81A6(var_00);
	self.var_1C7 = var_01 * 0.5;
	self waittill("goal");
	if(self.type != "dog")
	{
		var_02 = "_stealth_patrol_search_a";
		if(common_scripts\utility::cointoss())
		{
			var_02 = "_stealth_patrol_search_b";
		}

		lib_A585::func_8E00(var_02,1);
	}
	else
	{
		lib_A585::func_8D8D(self,"gravity","_stealth_dog_stop");
		lib_A59A::func_7E0F();
	}

	self method_81A6(var_00);
	self.var_1C7 = 64;
	self.var_2AF2 = 1;
	self.var_2B0D = 1;
	self waittill("goal");
	lib_A587::func_3258(15);
	if(self.type != "dog")
	{
		var_02 = "a";
		if(randomint(100) > 50)
		{
			var_02 = "b";
		}

		lib_A585::func_8E00("_stealth_patrol_search_" + var_02,1);
		return;
	}

	lib_A59A::func_7E0F();
	self.var_7A06 = undefined;
}

//Function Number: 13
lib_A587::func_31D6()
{
	self endon("death");
	self endon("pain_death");
	self endon("_stealth_enemy_alert_level_change");
	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		var_00 = self.var_2E6;
		self method_8160(var_00);
	}
	else
	{
		self notify("endNewEnemyReactionAnim");
	}

	self notify("movemode");
	self.var_2AF2 = 0;
	self.var_2B0D = 0;
	lib_A585::func_3242();
	lib_A59A::func_32DD("_stealth_attack");
	var_01 = lib_A585::func_8E9("threat","attack");
	self [[ var_01 ]]();
}

//Function Number: 14
lib_A587::func_31D5()
{
	thread lib_A585::func_31F9(self.var_2E6);
	if(isdefined(self.var_79FE))
	{
		thread lib_A577::func_7E49();
		return;
	}

	lib_A587::func_3207();
}

//Function Number: 15
lib_A587::func_3207()
{
	var_00 = 2048;
	self.var_1C7 = var_00;
	if(isdefined(self.var_7ADC) && self.var_7ADC == 1)
	{
		return;
	}

	self endon("death");
	lib_A59A::func_32DD("_stealth_override_goalpos");
	while(isdefined(self.enemy) && lib_A59A::func_32D7("_stealth_enabled"))
	{
		self method_81A6(self.enemy.var_2E6);
		self.var_1C7 = var_00;
		if(var_00 > 600)
		{
			var_00 = var_00 * 0.75;
		}
		else
		{
			return;
		}

		wait(15);
		if(isdefined(self.var_7ADC) && self.var_7ADC == 1)
		{
			return;
		}
	}
}

//Function Number: 16
lib_A587::func_31DD()
{
	lib_A587::func_3271("reset");
	lib_A59A::func_32D9("_stealth_enemy_alert_level_action");
	if(lib_A59A::func_32DB("_stealth_saw_corpse"))
	{
		lib_A59A::func_32E3("_stealth_saw_corpse");
	}

	wait(0.05);
	if(lib_A59A::func_32DB("_stealth_found_corpse"))
	{
		lib_A59A::func_32E3("_stealth_found_corpse");
	}

	lib_A59A::func_32DD("_stealth_normal");
	var_00 = lib_A585::func_8E9("threat","normal");
	self [[ var_00 ]]();
}

//Function Number: 17
lib_A587::func_31DC()
{
	thread lib_A585::func_31F5();
	lib_A585::func_3249();
}

//Function Number: 18
lib_A587::func_324E()
{
	lib_A587::func_321F();
	lib_A587::func_321E();
	self.var_669.var_6DF3.var_9310 = 1;
	self.var_7ADC = 1;
	self.var_26 = "noncombat";
	self.var_2B1 = squared(level.var_669.var_5833.var_1E["ai_eventDistFootstepSprint"]["hidden"]);
}

//Function Number: 19
lib_A587::func_321F()
{
	var_00 = [];
	var_00["reset"] = ::lib_A587::func_31DC;
	var_00["warning1"] = ::lib_A587::func_31E2;
	var_00["warning2"] = ::lib_A587::func_31E3;
	var_00["attack"] = ::lib_A587::func_31D5;
	var_00["normal"] = ::lib_A587::func_31DC;
	if(!isdefined(level.var_669.var_5833.var_9C5))
	{
		level.var_669.var_5833.var_9C5 = [];
		level.var_669.var_5833.var_9C5["reset"] = "noncombat";
		level.var_669.var_5833.var_9C5["warning"] = "alert";
		level.var_669.var_5833.var_9C5["attack"] = "combat";
	}

	lib_A587::func_3274(var_00);
}

//Function Number: 20
lib_A587::func_3271(param_00)
{
	self.var_26 = level.var_669.var_5833.var_9C5[param_00];
}

//Function Number: 21
lib_A587::func_3274(param_00)
{
	self.var_669.var_13A2.var_8E6["threat"] = [];
	if(!isdefined(param_00["reset"]))
	{
		param_00["reset"] = ::lib_A587::func_31DC;
	}

	if(!isdefined(param_00["attack"]))
	{
		param_00["attack"] = ::lib_A587::func_31D5;
	}

	if(!isdefined(param_00["normal"]))
	{
		param_00["normal"] = ::lib_A587::func_31DC;
	}

	foreach(var_03, var_02 in param_00)
	{
		lib_A585::func_8D2("threat",var_03,var_02);
	}

	self.var_669.var_5833.var_9C4.var_5A19 = param_00.size - 3;
}

//Function Number: 22
lib_A587::func_31D7(param_00)
{
	self notify("_stealth_enemy_alert_level_change",param_00);
	if(!isdefined(self.var_669.var_6DF3.var_9310))
	{
		self.var_1C7 = level.var_277F;
		return;
	}

	if(issubstr(param_00,"warning"))
	{
		param_00 = "warning";
	}

	lib_A587::func_3271(param_00);
	self notify("awareness_alert_level",param_00);
}

//Function Number: 23
lib_A587::func_328A()
{
	var_00 = [];
	var_00["reset"] = ::lib_A57A::func_31EC;
	var_00["warning"] = ::lib_A57A::func_31EC;
	if(self.type == "dog")
	{
		var_00["attack"] = ::lib_A57A::func_2C84;
	}
	else
	{
		var_00["attack"] = ::lib_A57A::func_31E6;
	}

	return var_00;
}

//Function Number: 24
lib_A587::func_3273(param_00)
{
	var_01 = lib_A587::func_328A();
	if(!isdefined(param_00["reset"]))
	{
		param_00["reset"] = var_01["reset"];
	}

	if(!isdefined(param_00["warning"]))
	{
		param_00["warning"] = var_01["warning"];
	}

	if(!isdefined(param_00["attack"]))
	{
		param_00["attack"] = var_01["attack"];
	}

	foreach(var_04, var_03 in param_00)
	{
		lib_A585::func_8D2("animation",var_04,var_03);
	}
}

//Function Number: 25
lib_A587::func_321E()
{
	var_00 = lib_A587::func_328A();
	lib_A587::func_3273(var_00);
}