/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42377.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 19
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:24 PM
*******************************************************************/

//Function Number: 1
lib_A589::func_8E0E()
{
	lib_A589::func_324E();
	thread lib_A589::func_328B();
}

//Function Number: 2
lib_A589::func_328B()
{
	self endon("death");
	self endon("pain_death");
	for(;;)
	{
		lib_A59A::func_32DF("_stealth_enabled");
		self waittill("enemy");
		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		if(!isalive(self.enemy))
		{
			continue;
		}

		if(!lib_A588::func_8DE2())
		{
			if(!lib_A589::func_31DB(self.enemy))
			{
				continue;
			}
		}
		else
		{
			lib_A587::func_31D7("attack");
		}

		thread lib_A589::func_3290();
		wait(10);
		while(isdefined(self.enemy) && lib_A59A::func_32D7("_stealth_enabled"))
		{
			var_00 = gettime() - self sentient_lastknowntime(self.enemy);
			if(20000 > var_00)
			{
				wait(20000 - var_00 * 0.001);
				continue;
			}

			if(distance(self.var_2E6,self.enemy.var_2E6) > self.enemy.var_279)
			{
				break;
			}

			wait(0.5);
		}

		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		lib_A59A::func_32E3("_stealth_behavior_reaction_anim_in_progress");
		if(isdefined(self.enemy))
		{
			lib_A585::func_31DA(self.enemy,0);
		}

		self method_8166();
		lib_A587::func_31D7("reset");
	}
}

//Function Number: 3
lib_A589::func_31DB(param_00)
{
	if(!isdefined(param_00.var_669))
	{
		return 1;
	}

	if(!isdefined(param_00.var_669.var_5833.var_8A8D[self.unique_id]))
	{
		param_00.var_669.var_5833.var_8A8D[self.unique_id] = 0;
	}

	for(;;)
	{
		param_00.var_669.var_5833.var_8A8D[self.unique_id]++;
		if(lib_A59A::func_32D7("_stealth_bad_event_listener") || param_00.var_669.var_5833.var_8A8D[self.unique_id] > self.var_669.var_5833.var_9C4.var_5A19)
		{
			lib_A587::func_31D7("attack");
			return 1;
		}

		var_01 = param_00.var_669.var_5833.var_8A8D[self.unique_id];
		lib_A587::func_31D7("warning" + var_01);
		thread lib_A585::func_31DA(param_00);
		lib_A589::func_31E0(param_00);
		if(!isdefined(param_00) || gettime() - self sentient_lastknowntime(param_00) > 500)
		{
			self method_8166();
			return 0;
		}
	}
}

//Function Number: 4
lib_A589::func_3290()
{
	self endon("death");
	self endon("pain_death");
	var_00 = self.enemy;
	self.var_2D33 = undefined;
	self [[ self.var_669.var_5833.var_6EAB ]]();
	if(isdefined(var_00))
	{
		level.var_669.var_4417.var_8A8C[self.var_7ADE] = var_00;
	}

	lib_A585::func_4420("_stealth_spotted");
}

//Function Number: 5
lib_A589::func_3261()
{
	wait(2.25);
}

//Function Number: 6
lib_A589::func_31E0(param_00)
{
	if(lib_A588::func_8DD9() || lib_A59A::func_32D7("_stealth_bad_event_listener"))
	{
		return;
	}

	var_01 = distance(self.var_2E6,param_00.var_2E6) * 0.0005;
	var_02 = level.var_669.var_5833.var_5C1D + var_01;
	lib_A585::func_8DAE("WARNING time = " + var_02);
	level endon(lib_A585::func_4423("_stealth_spotted"));
	self endon("_stealth_bad_event_listener");
	wait(var_02);
}

//Function Number: 7
lib_A589::func_322E()
{
	self endon("death");
	self method_8041("grenade danger");
	self method_8041("gunshot");
	self method_8041("gunshot_teammate");
	self method_8041("silenced_shot");
	self method_8041("bulletwhizby");
	self method_8041("projectile_impact");
	for(;;)
	{
		self waittill("ai_event",var_00,var_01);
		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		if(lib_A59A::func_32DB("_stealth_behavior_asleep") && lib_A59A::func_32D7("_stealth_behavior_asleep"))
		{
			continue;
		}

		lib_A59A::func_32DD("_stealth_bad_event_listener");
	}
}

//Function Number: 8
lib_A589::func_322F()
{
	self endon("death");
	for(;;)
	{
		lib_A59A::func_32DF("_stealth_bad_event_listener");
		wait(0.65);
		lib_A59A::func_32D9("_stealth_bad_event_listener");
	}
}

//Function Number: 9
lib_A589::func_3228(param_00,param_01)
{
	lib_A59A::func_32D9("_stealth_normal");
	self.var_669.var_5833.var_33BE.var_1212[param_00] = param_01;
	self notify("event_awareness",param_00);
	level notify("event_awareness",param_00);
}

//Function Number: 10
lib_A589::func_3229(param_00)
{
	self endon("death");
	self endon("pain_death");
	self waittill(param_00,var_01,var_02);
	if(!lib_A59A::func_32D7("_stealth_enabled"))
	{
		continue;
	}

	switch(param_00)
	{
		case "awareness_alert_level":
			break;

		case "ai_event":
			break;

		default:
			break;
	}
}

//Function Number: 11
lib_A589::func_3227(param_00)
{
	self endon("death");
	self endon("pain_death");
	self.var_669.var_5833.var_33BE.var_1212[param_00] = 1;
	for(;;)
	{
		self waittill(param_00,var_01);
		if(!lib_A59A::func_32D7("_stealth_enabled"))
		{
			continue;
		}

		lib_A585::func_4420("_stealth_event");
		level thread lib_A589::func_322C(self.var_7ADE);
		lib_A589::func_3228(param_00,var_01);
		waittillframeend;
	}
}

//Function Number: 12
lib_A589::func_322C(param_00)
{
	var_01 = "enemy_event_handle_clear:" + param_00 + " Proc";
	var_02 = "enemy_event_handle_clear:" + param_00 + " Cleared";
	level notify(var_01);
	level endon(var_01);
	wait(2);
	var_03 = lib_A585::func_4422(param_00);
	if(var_03.size)
	{
		level lib_A59A::func_7BE(::lib_A59A::func_D18,var_03,"event_awareness_waitclear_ai");
		level lib_A59A::func_75B(var_01);
		level lib_A59A::func_75F(::lib_A59A::func_7C7C,var_02);
		level thread lib_A59A::func_2BDB();
		common_scripts\utility::array_thread(var_03,::lib_A589::func_33C5,var_01);
		level waittill(var_02);
	}

	lib_A585::func_441E("_stealth_event",param_00);
}

//Function Number: 13
lib_A589::func_33C5(param_00)
{
	level endon(param_00);
	lib_A589::func_33C6();
	self notify("event_awareness_waitclear_ai");
}

//Function Number: 14
lib_A589::func_33C6()
{
	self endon("death");
	waittillframeend;
	var_00 = 0;
	if(isdefined(self.var_32D7["_stealth_behavior_first_reaction"]))
	{
		var_00 = lib_A59A::func_32D7("_stealth_behavior_first_reaction");
	}

	var_01 = 0;
	if(isdefined(self.var_32D7["_stealth_behavior_reaction_anim"]))
	{
		var_01 = lib_A59A::func_32D7("_stealth_behavior_reaction_anim");
	}

	if(!var_00 && !var_01)
	{
		return;
	}

	lib_A59A::func_7BE(::lib_A59A::func_A090,"death");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"going_back");
	lib_A59A::func_2BDC();
	self endon("goal");
	var_02 = common_scripts\utility::array_combine(function_00D6("allies"),level.var_328);
	var_03 = level.var_669.var_5833.var_298D["hidden"]["crouch"];
	var_04 = var_03 * var_03;
	var_05 = 1;
	if(var_05)
	{
		var_05 = 0;
		foreach(var_07 in var_02)
		{
			if(distancesquared(self.var_2E6,var_07.var_2E6) < var_04)
			{
				continue;
			}

			var_05 = 1;
		}

		wait(1);
	}
}

//Function Number: 15
lib_A589::func_322B(param_00,param_01)
{
	var_02 = undefined;
	var_03 = self.inliveplayerkillstreak;
	if(!isalive(self))
	{
		return;
	}

	self waittill(param_00,var_04,var_05);
	if(isalive(self) && !lib_A59A::func_32D7("_stealth_enabled"))
	{
		continue;
	}

	switch(param_00)
	{
		case "death":
			break;

		case "damage":
			break;
	}
}

//Function Number: 16
lib_A589::func_324E()
{
	self method_8166();
	self.var_669 = spawnstruct();
	self.var_669.var_5833 = spawnstruct();
	lib_A59A::func_32DC("_stealth_enabled");
	lib_A59A::func_32DD("_stealth_enabled");
	lib_A59A::func_32DC("_stealth_normal");
	lib_A59A::func_32DD("_stealth_normal");
	lib_A59A::func_32DC("_stealth_attack");
	lib_A585::func_441F("_stealth_spotted");
	lib_A585::func_441F("_stealth_event");
	lib_A585::func_441F("_stealth_found_corpse");
	lib_A585::func_4418();
	if(!isdefined(level.var_669.var_13A2.sound["spotted"][self.var_7ADE]))
	{
		level.var_669.var_13A2.sound["spotted"][self.var_7ADE] = 0;
	}

	self.var_669.var_5833.var_9C4 = spawnstruct();
	self.var_669.var_5833.var_9C4.var_5A19 = 0;
	lib_A589::func_31D9();
	lib_A589::func_322D();
}

//Function Number: 17
lib_A589::func_322D()
{
	lib_A59A::func_32DC("_stealth_bad_event_listener");
	self.var_669.var_5833.var_33BE = spawnstruct();
	thread lib_A589::func_322E();
	thread lib_A589::func_322B("damage","ai_eventDistPain");
	thread lib_A589::func_322B("death","ai_eventDistDeath");
	thread lib_A589::func_322F();
	self.var_669.var_5833.var_33BE.var_1212 = [];
	self.var_669.var_5833.var_33BE.var_1210 = [];
	self.var_669.var_5833.var_33BE.var_1210["bulletwhizby"] = 1;
	self.var_669.var_5833.var_33BE.var_1210["projectile_impact"] = 1;
	self.var_669.var_5833.var_33BE.var_1210["gunshot_teammate"] = 1;
	self.var_669.var_5833.var_33BE.var_1210["grenade danger"] = 1;
	thread lib_A589::func_3229("ai_event");
	thread lib_A589::func_3229("awareness_alert_level");
	thread lib_A589::func_3229("awareness_corpse");
}

//Function Number: 18
lib_A589::func_31DF(param_00)
{
	self.var_669.var_5833.var_6EAB = param_00;
}

//Function Number: 19
lib_A589::func_31D9()
{
	self.var_669.var_5833.var_6EAB = ::lib_A589::func_3261;
}