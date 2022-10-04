/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42368.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 22
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:23:23 PM
*******************************************************************/

//Function Number: 1
lib_A580::func_8DA0()
{
	lib_A580::func_324E();
	thread lib_A580::func_320F();
	thread lib_A580::func_3210();
}

//Function Number: 2
lib_A580::func_3210()
{
	self endon("death");
	self endon("pain_death");
	thread lib_A580::func_3246();
	for(;;)
	{
		self waittill("_stealth_saw_corpse");
		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		lib_A580::func_326F();
	}
}

//Function Number: 3
lib_A580::func_3246()
{
	var_00 = lib_A585::func_4423("_stealth_spotted");
	var_01 = lib_A585::func_4423("_stealth_found_corpse");
	self endon("death");
	self endon("pain_death");
	if(common_scripts\utility::flag(var_00))
	{
		return;
	}

	level endon(var_00);
	for(;;)
	{
		lib_A59A::func_32DF("_stealth_enabled");
		if(lib_A59A::func_32DB("_stealth_behavior_asleep"))
		{
			lib_A59A::func_32E3("_stealth_behavior_asleep");
		}

		lib_A588::func_8DDA();
		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		while(lib_A588::func_8DD9())
		{
			if(!lib_A59A::func_32D7("_stealth_enabled"))
			{
				break;
			}

			lib_A580::func_320E();
			level waittill(var_01);
		}
	}
}

//Function Number: 4
lib_A580::func_326F()
{
	var_00 = lib_A585::func_4423("_stealth_spotted");
	var_01 = lib_A585::func_4423("_stealth_found_corpse");
	if(common_scripts\utility::flag(var_00))
	{
		return;
	}

	level endon(var_00);
	self endon("attack");
	level endon(var_01);
	for(;;)
	{
		lib_A59A::func_32E3("_stealth_enemy_alert_level_action");
		lib_A580::func_3214();
		self waittill("normal");
	}
}

//Function Number: 5
lib_A580::func_3214()
{
	lib_A585::func_3242();
	self endon("enemy_alert_level_change");
	thread lib_A585::func_31F6();
	lib_A59A::func_32DD("_stealth_running_to_corpse");
	lib_A59A::func_32DD("_stealth_override_goalpos");
	var_00 = self.var_669.var_13A2.var_8E6["corpse"];
	self [[ var_00["saw"] ]]();
}

//Function Number: 6
lib_A580::func_320E()
{
	lib_A585::func_3242();
	if(!lib_A59A::func_32D7("_stealth_found_corpse"))
	{
		self notify("awareness_corpse","heard_corpse",(0,0,0));
	}

	lib_A585::func_3264();
	if(self.type == "dog")
	{
		lib_A59A::func_32DD("_stealth_override_goalpos");
	}

	thread lib_A580::func_3212();
	var_00 = self.var_669.var_13A2.var_8E6["corpse"];
	self [[ var_00["found"] ]]();
}

//Function Number: 7
lib_A580::func_3212()
{
	var_00 = lib_A585::func_4423("_stealth_spotted");
	self endon("death");
	self endon("_stealth_enemy_alert_level_change");
	level endon(var_00);
	waittillframeend;
	self endon("enemy_awareness_reaction");
	lib_A588::func_8DDB();
	lib_A59A::func_32DD("_stealth_normal");
	var_01 = self.var_669.var_13A2.var_8E6["corpse"];
	self thread [[ var_01["reset"] ]]();
}

//Function Number: 8
lib_A580::func_3213()
{
	self.var_2AF2 = 0;
	self.var_2B0D = 0;
	if(self.type != "dog")
	{
		lib_A585::func_8E00("_stealth_combat_jog");
	}
	else
	{
		lib_A59A::func_1ED1();
		self.var_7A06 = 1;
		self.var_7A73 = 1;
	}

	self.var_1C7 = 80;
	self method_81A6(self.var_669.var_5833.var_222C.var_2E6);
}

//Function Number: 9
lib_A580::func_320C()
{
	if(self.type == "dog")
	{
		self method_81A6(self.var_2E6);
		return;
	}

	var_00 = lib_A585::func_3241(level.var_669.var_5833.var_222C.var_5547,512,40);
	if(!isdefined(var_00))
	{
		return;
	}

	thread lib_A585::func_326E(var_00);
}

//Function Number: 10
lib_A580::func_3211()
{
	self endon("death");
	wait(randomfloatrange(0,5));
	lib_A585::func_327D();
	lib_A587::func_31D7("reset");
}

//Function Number: 11
lib_A580::func_6A99(param_00)
{
	var_01 = lib_A59A::func_3CFC(param_00);
	var_02 = distance(var_01.var_2E6,param_00);
	if(var_02 < 150)
	{
		return 1;
	}

	if(var_02 > level.var_669.var_5833.var_222C.var_6AD1)
	{
		return 0;
	}

	return sighttracepassed(param_00 + (0,0,48),var_01 geteye(),0,var_01);
}

//Function Number: 12
lib_A580::func_320F()
{
	self endon("death");
	self endon("pain_death");
	thread lib_A580::func_320D();
	for(;;)
	{
		if(lib_A59A::func_32DB("_stealth_behavior_asleep"))
		{
			lib_A59A::func_32E3("_stealth_behavior_asleep");
		}

		lib_A59A::func_32DF("_stealth_enabled");
		while(!lib_A588::func_8DE2() && !lib_A59A::func_32D7("_stealth_attack"))
		{
			var_00 = 0;
			var_01 = 0;
			var_02 = undefined;
			var_03 = undefined;
			var_04 = lib_A580::func_3D14();
			for(var_05 = 0;var_05 < var_04.size;var_05++)
			{
				var_02 = var_04[var_05];
				if(isdefined(var_02.var_39EF))
				{
					continue;
				}

				if(!isdefined(level.var_222F))
				{
					if(!lib_A580::func_6A99(var_02.var_2E6))
					{
						continue;
					}
				}

				var_06 = distancesquared(self.var_2E6,var_02.var_2E6);
				if(self.type != "dog")
				{
					var_03 = level.var_669.var_5833.var_222C.var_39F1;
				}
				else
				{
					var_03 = level.var_669.var_5833.var_222C.var_39F2;
				}

				if(var_06 < var_03)
				{
					var_00 = 1;
					break;
				}

				if(isdefined(self.var_669.var_5833.var_222C.var_2231))
				{
					if(self.var_669.var_5833.var_222C.var_2231 == var_02)
					{
						continue;
					}

					var_07 = distancesquared(self.var_2E6,self.var_669.var_5833.var_222C.var_2231.var_2E6);
					if(var_07 <= var_06)
					{
						continue;
					}
				}

				if(var_06 > level.var_669.var_5833.var_222C.var_855D)
				{
					continue;
				}

				if(var_06 < level.var_669.var_5833.var_222C.var_2989)
				{
					if(self method_81BE(var_02))
					{
						var_01 = 1;
						break;
					}
				}

				var_08 = self gettagangles("tag_eye");
				var_09 = self geteye();
				var_0A = anglestoforward(var_08);
				var_0B = vectornormalize(var_02.var_2E6 - var_09);
				if(vectordot(var_0A,var_0B) > 0.55)
				{
					if(self method_81BE(var_02))
					{
						var_01 = 1;
						break;
					}
				}
			}

			if(var_00)
			{
				if(!lib_A59A::func_32D7("_stealth_found_corpse"))
				{
					lib_A59A::func_32DD("_stealth_found_corpse");
				}
				else
				{
					self notify("_stealth_found_corpse");
				}

				lib_A59A::func_32D9("_stealth_saw_corpse");
				thread lib_A580::func_320B(var_02);
				self notify("awareness_corpse","found_corpse",var_02);
				continue;
			}

			if(var_01)
			{
				self.var_669.var_5833.var_222C.var_2231 = var_02;
				self.var_669.var_5833.var_222C.var_2E6 = var_02.var_2E6;
				if(!lib_A59A::func_32D7("_stealth_saw_corpse"))
				{
					lib_A59A::func_32DD("_stealth_saw_corpse");
				}
				else
				{
					self notify("_stealth_saw_corpse");
				}

				level notify("_stealth_saw_corpse");
				self notify("awareness_corpse","saw_corpse",var_02);
			}

			wait(0.5);
		}

		lib_A580::func_7337();
		lib_A588::func_8DE4();
		lib_A59A::func_32E3("_stealth_attack");
	}
}

//Function Number: 13
lib_A580::func_7337()
{
	var_00 = lib_A585::func_4423("_stealth_spotted");
	while(common_scripts\utility::flag(var_00))
	{
		var_01 = lib_A580::func_3D14();
		for(var_02 = 0;var_02 < var_01.size;var_02++)
		{
			var_03 = var_01[var_02];
			if(isdefined(var_03.var_39EF))
			{
				continue;
			}

			var_04 = distancesquared(self.var_2E6,var_03.var_2E6);
			if(self.type != "dog")
			{
				var_05 = level.var_669.var_5833.var_222C.var_39F1;
			}
			else
			{
				var_05 = level.var_669.var_5833.var_222C.var_39F2;
			}

			if(var_04 < var_05)
			{
				var_03 method_803E(10);
				var_03.var_39EF = 1;
			}
		}

		wait(0.5);
	}
}

//Function Number: 14
lib_A580::func_320D()
{
	self endon("death");
	self endon("pain_death");
	var_00 = lib_A588::func_8DD7();
	for(;;)
	{
		level waittill(var_00);
		if(!lib_A588::func_8DD9())
		{
			continue;
		}

		lib_A580::func_3209();
	}
}

//Function Number: 15
lib_A580::func_3209()
{
	var_00 = undefined;
	if(isdefined(self.enemy))
	{
		var_00 = self.enemy;
	}
	else
	{
		var_00 = common_scripts\utility::random(level.var_328);
	}

	if(!isdefined(var_00.var_669) && !isplayer(var_00))
	{
		return;
	}

	if(!isdefined(var_00.var_669.var_5833.var_8A8D[self.unique_id]))
	{
		var_00.var_669.var_5833.var_8A8D[self.unique_id] = 0;
	}

	if(var_00.var_669.var_5833.var_8A8D[self.unique_id] < self.var_669.var_5833.var_9C4.var_5A19)
	{
		var_00.var_669.var_5833.var_8A8D[self.unique_id]++;
		thread lib_A585::func_31DA(var_00);
	}
}

//Function Number: 16
lib_A580::func_320B(param_00)
{
	self endon("death");
	level.var_669.var_5833.var_222C.var_5547 = param_00.var_2E6;
	param_00 method_803E(level.var_669.var_5833.var_222C.var_7437);
	param_00.var_39EF = 1;
	if(self.type == "dog" && lib_A59A::func_32DB("_stealth_behavior_reaction_anim_in_progress"))
	{
		wait(0.1);
		lib_A59A::func_32E3("_stealth_behavior_reaction_anim_in_progress");
		wait(0.5);
	}
	else
	{
		wait(2);
	}

	thread lib_A585::func_31F4();
	wait(2);
	var_01 = lib_A585::func_4423("_stealth_found_corpse");
	if(!lib_A588::func_8DD9())
	{
		lib_A585::func_4420("_stealth_found_corpse");
	}
	else
	{
		level notify(var_01);
	}

	thread lib_A580::func_320A();
}

//Function Number: 17
lib_A580::func_320A()
{
	var_00 = lib_A585::func_4423("_stealth_found_corpse");
	var_01 = self.var_7ADE;
	level endon(var_00);
	lib_A59A::func_A076(lib_A585::func_4422(var_01),undefined,level.var_669.var_5833.var_222C.var_7437);
	thread lib_A585::func_441E("_stealth_found_corpse",var_01);
}

//Function Number: 18
lib_A580::func_324E()
{
	self.var_669.var_5833.var_222C = spawnstruct();
	self.var_669.var_5833.var_222C.var_2231 = undefined;
	lib_A59A::func_32DC("_stealth_saw_corpse");
	lib_A59A::func_32DC("_stealth_found_corpse");
	lib_A580::func_321C();
	lib_A580::func_321B();
	self.var_669.var_6DF3.var_222C = 1;
}

//Function Number: 19
lib_A580::func_321B()
{
	if(self.type == "dog")
	{
		lib_A585::func_8D2("animation","heard_corpse",::lib_A57A::func_2C84);
		lib_A585::func_8D2("animation","saw_corpse",::lib_A57A::func_2C86);
		lib_A585::func_8D2("animation","found_corpse",::lib_A57A::func_2C83);
		lib_A585::func_8D2("animation","howl",::lib_A57A::func_2C85);
		return;
	}

	lib_A585::func_8D2("animation","heard_corpse",::lib_A57A::func_31EA);
	lib_A585::func_8D2("animation","saw_corpse",::lib_A57A::func_31F0);
	lib_A585::func_8D2("animation","found_corpse",::lib_A57A::func_31E9);
}

//Function Number: 20
lib_A580::func_321C()
{
	var_00 = [];
	var_00["saw"] = ::lib_A580::func_3213;
	var_00["found"] = ::lib_A580::func_320C;
	var_00["reset"] = ::lib_A580::func_3211;
	lib_A580::func_3216(var_00);
}

//Function Number: 21
lib_A580::func_3216(param_00)
{
	foreach(var_03, var_02 in param_00)
	{
		lib_A585::func_8D2("corpse",var_03,var_02);
	}
}

//Function Number: 22
lib_A580::func_3D14()
{
	if(isdefined(level.var_669.var_5833.var_222C.var_2028))
	{
		return [[ level.var_669.var_5833.var_222C.var_2028 ]]();
	}

	return function_00D9();
}