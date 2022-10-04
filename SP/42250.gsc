/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42250.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 28
 * Decompile Time: 8 ms
 * Timestamp: 4/20/2022 8:22:02 PM
*******************************************************************/

//Function Number: 1
lib_A50A::main()
{
	level.var_5575 = 0;
	common_scripts\utility::flag_init("game_saving");
	common_scripts\utility::flag_init("can_save");
	common_scripts\utility::flag_set("can_save");
	common_scripts\utility::flag_init("disable_autosaves");
	if(!isdefined(level.var_5A7))
	{
		level.var_5A7 = [];
	}

	level.var_1152 = ::lib_A50A::func_1152;
}

//Function Number: 2
lib_A50A::func_3F51()
{
	return &"AUTOSAVE_AUTOSAVE";
}

//Function Number: 3
lib_A50A::func_4030(param_00)
{
	if(param_00 == 0)
	{
		var_01 = &"AUTOSAVE_GAME";
	}
	else
	{
		var_01 = &"AUTOSAVE_NOGAME";
	}

	return var_01;
}

//Function Number: 4
lib_A50A::func_139E()
{
	common_scripts\utility::flag_wait("introscreen_complete");
	if(isdefined(level.var_4F8A))
	{
		wait(level.var_4F8A);
	}

	if(level.var_5CDB)
	{
		return;
	}

	if(common_scripts\utility::flag("game_saving"))
	{
		return;
	}

	common_scripts\utility::flag_set("game_saving");
	var_00 = "levelshots / autosave / autosave_" + level.script + "start";
	function_0083("levelstart",&"AUTOSAVE_LEVELSTART",var_00,1);
	setdvar("ui_grenade_death","0");
	common_scripts\utility::flag_clear("game_saving");
}

//Function Number: 5
lib_A50A::func_9753(param_00)
{
	param_00 waittill("trigger");
	lib_A59A::func_1154();
}

//Function Number: 6
lib_A50A::func_9754(param_00)
{
	param_00 waittill("trigger");
	lib_A59A::func_1158();
}

//Function Number: 7
lib_A50A::func_9751(param_00)
{
	if(!isdefined(param_00.var_794D))
	{
		param_00.var_794D = 0;
	}

	lib_A50A::func_1169(param_00);
}

//Function Number: 8
lib_A50A::func_1169(param_00)
{
	var_01 = lib_A50A::func_4030(param_00.var_794D);
	if(!isdefined(var_01))
	{
		return;
	}

	wait(1);
	param_00 waittill("trigger");
	var_02 = param_00.var_794D;
	var_03 = "levelshots / autosave / autosave_" + level.script + var_02;
	lib_A50A::func_988E(var_02,var_01,var_03);
	if(isdefined(param_00))
	{
		param_00 delete();
	}
}

//Function Number: 9
lib_A50A::func_1166(param_00)
{
	if(lib_A59A::func_5053())
	{
		return;
	}

	wait(1);
	param_00 waittill("trigger");
	if(!isdefined(param_00))
	{
		return;
	}

	var_01 = param_00.var_794E;
	param_00 delete();
	if(isdefined(level.var_2552))
	{
		if(![[ level.var_2552 ]]())
		{
			return;
		}
	}

	lib_A59A::func_1143(var_01);
}

//Function Number: 10
lib_A50A::func_9752(param_00)
{
	param_00 waittill("trigger");
}

//Function Number: 11
lib_A50A::func_1168(param_00,param_01)
{
	if(isdefined(param_01))
	{
	}
}

//Function Number: 12
lib_A50A::func_115F(param_00)
{
	level endon("trying_new_autosave");
	level endon("autosave_complete");
	wait(param_00);
	common_scripts\utility::flag_clear("game_saving");
	level notify("autosave_timeout");
}

//Function Number: 13
lib_A50A::func_055D()
{
	var_00 = "levelshots / autosave / autosave_" + level.script + "start";
	function_0083("levelstart",&"AUTOSAVE_LEVELSTART",var_00,1);
	lib_A50A::func_1153(0);
}

//Function Number: 14
lib_A50A::func_055E()
{
	var_00 = "levelshots / autosave / autosave_" + level.script + "start";
	if(getdvarint("g_reloading") == 0)
	{
		function_0083("levelstart",&"AUTOSAVE_LEVELSTART",var_00,1);
		lib_A50A::func_1153(0);
	}
}

//Function Number: 15
lib_A50A::func_055C(param_00)
{
	if(isdefined(level.var_5CDB) && level.var_5CDB)
	{
		return;
	}

	if(common_scripts\utility::flag("game_saving"))
	{
		return 0;
	}

	for(var_01 = 0;var_01 < level.var_328.size;var_01++)
	{
		var_02 = level.var_328[var_01];
		if(!isalive(var_02))
		{
			return 0;
		}
	}

	var_03 = "save_now";
	var_04 = lib_A50A::func_3F51();
	if(isdefined(param_00))
	{
		var_05 = function_0086(var_03,var_04,"$default",1);
	}
	else
	{
		var_05 = function_0086(var_04,var_05);
	}

	wait(0.05);
	if(function_0085())
	{
		level.var_5575 = gettime();
		return 0;
	}

	if(var_05 < 0)
	{
		return 0;
	}

	if(!lib_A50A::func_9887())
	{
		return 0;
	}

	common_scripts\utility::flag_set("game_saving");
	wait(2);
	common_scripts\utility::flag_clear("game_saving");
	if(!function_0088(var_05))
	{
		return 0;
	}

	if(lib_A50A::func_9887())
	{
		lib_A50A::func_1153(var_05);
		function_0087(var_05);
		setdvar("ui_grenade_death","0");
	}

	return 1;
}

//Function Number: 16
lib_A50A::func_1150(param_00)
{
	param_00 waittill("trigger");
	lib_A59A::func_114E();
}

//Function Number: 17
lib_A50A::func_9887()
{
	if(!function_0084())
	{
		return 0;
	}

	for(var_00 = 0;var_00 < level.var_328.size;var_00++)
	{
		var_01 = level.var_328[var_00];
		if(!var_01 lib_A50A::func_1165())
		{
			return 0;
		}
	}

	if(!common_scripts\utility::flag("can_save"))
	{
		return 0;
	}

	return 1;
}

//Function Number: 18
lib_A50A::func_988E(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(common_scripts\utility::flag("disable_autosaves"))
	{
		return 0;
	}

	level endon("nextmission");
	level.var_31D endon("death");
	if(lib_A59A::func_5009())
	{
		level.var_6C58 endon("death");
	}

	level notify("trying_new_autosave");
	if(common_scripts\utility::flag("game_saving"))
	{
		return 0;
	}

	if(isdefined(level.var_60D3))
	{
		return 0;
	}

	var_06 = 1.25;
	var_07 = 1.25;
	if(isdefined(param_03) && param_03 < var_06 + var_07)
	{
	}

	if(!isdefined(param_05))
	{
		param_05 = 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = "$default";
	}

	if(!isdefined(param_04))
	{
		param_04 = 0;
	}

	common_scripts\utility::flag_set("game_saving");
	var_08 = lib_A50A::func_3F51();
	var_09 = gettime();
	for(;;)
	{
		if(lib_A50A::func_1161(undefined,param_04))
		{
			var_0A = function_0086(param_00,var_08,param_02,param_05);
			if(var_0A < 0)
			{
				break;
			}

			wait(0.05);
			if(function_0085())
			{
				level.var_5575 = gettime();
				break;
			}

			wait(var_06);
			if(!lib_A50A::func_1161(undefined,param_04))
			{
				continue;
			}

			wait(var_07);
			if(!lib_A50A::func_1162())
			{
				continue;
			}

			if(isdefined(param_03))
			{
				if(gettime() > var_09 + param_03 * 1000)
				{
					break;
				}
			}

			if(!common_scripts\utility::flag("can_save"))
			{
				break;
			}

			if(!function_0088(var_0A))
			{
				common_scripts\utility::flag_clear("game_saving");
				return 0;
			}

			lib_A50A::func_1153(var_0A);
			function_0087(var_0A);
			level.var_55D3 = gettime();
			setdvar("ui_grenade_death","0");
			break;
		}

		wait(0.25);
	}

	common_scripts\utility::flag_clear("game_saving");
	return 1;
}

//Function Number: 19
lib_A50A::func_3599()
{
	foreach(var_01 in level.var_5A7)
	{
		if(![[ var_01["func"] ]]())
		{
			lib_A50A::func_1168("autosave failed: " + var_01["msg"]);
			return 1;
		}
	}

	return 0;
}

//Function Number: 20
lib_A50A::func_1162()
{
	return lib_A50A::func_1161(0,0);
}

//Function Number: 21
lib_A50A::func_1161(param_00,param_01)
{
	if(isdefined(level.var_1146))
	{
		return [[ level.var_1146 ]]();
	}

	if(isdefined(level.var_8A16) && ![[ level.var_8A16 ]]())
	{
		return 0;
	}

	if(level.var_5CDB)
	{
		return 0;
	}

	if(!isdefined(param_00))
	{
		param_00 = level.var_2D6F;
	}

	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(param_01)
	{
		if(![[ level.var_4221["_autosave_stealthcheck"] ]]())
		{
			return 0;
		}
	}

	for(var_02 = 0;var_02 < level.var_328.size;var_02++)
	{
		var_03 = level.var_328[var_02];
		if(!var_03 lib_A50A::func_1165())
		{
			return 0;
		}

		if(param_00 && !var_03 lib_A50A::func_1160())
		{
			return 0;
		}
	}

	if(level.var_115E)
	{
		if(!lib_A50A::func_116B(param_00))
		{
			return 0;
		}
	}

	for(var_02 = 0;var_02 < level.var_328.size;var_02++)
	{
		var_03 = level.var_328[var_02];
		if(!var_03 lib_A50A::func_1167(param_00))
		{
			return 0;
		}
	}

	if(isdefined(level.var_781A) && !level.var_781A)
	{
		return 0;
	}

	if(isdefined(level.var_1ADC) && !level.var_1ADC)
	{
		return 0;
	}

	if(lib_A50A::func_3599())
	{
		return 0;
	}

	if(!function_0084())
	{
		lib_A50A::func_1168("autosave failed: save call was unsuccessful");
		return 0;
	}

	return 1;
}

//Function Number: 22
lib_A50A::func_1167(param_00)
{
	if(isdefined(level.var_6D0) && level.var_6D0 == self)
	{
		return 1;
	}

	if(self ismeleeing() && param_00)
	{
		lib_A50A::func_1168("autosave failed:player is meleeing");
		return 0;
	}

	if(self method_812C() && param_00)
	{
		lib_A50A::func_1168("autosave failed:player is throwing a grenade");
		return 0;
	}

	if(self method_812D() && param_00)
	{
		lib_A50A::func_1168("autosave failed:player is firing");
		return 0;
	}

	if(isdefined(self.var_83B7) && self.var_83B7)
	{
		lib_A50A::func_1168("autosave failed:player is in shellshock");
		return 0;
	}

	if(common_scripts\utility::isflashed())
	{
		lib_A50A::func_1168("autosave failed:player is flashbanged");
		return 0;
	}

	return 1;
}

//Function Number: 23
lib_A50A::func_1160()
{
	if(isdefined(level.var_6118) && level.var_6118)
	{
		return 1;
	}

	if(isdefined(level.var_6D0) && level.var_6D0 == self)
	{
		return 1;
	}

	var_00 = self getweaponslistprimaries();
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_02 = self getfractionmaxammo(var_00[var_01]);
		if(var_02 > 0.1)
		{
			return 1;
		}
	}

	lib_A50A::func_1168("autosave failed: ammo too low");
	return 0;
}

//Function Number: 24
lib_A50A::func_1165()
{
	if(isdefined(level.var_6D0) && level.var_6D0 == self)
	{
		return 1;
	}

	if(lib_A59A::func_32DB("laststand_downed") && lib_A59A::func_32D7("laststand_downed"))
	{
		return 0;
	}

	var_00 = self.health / self.var_275;
	if(var_00 < 0.5)
	{
		return 0;
	}

	if(common_scripts\utility::flag("_radiation_poisoning"))
	{
		return 0;
	}

	if(lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		return 0;
	}

	return 1;
}

//Function Number: 25
lib_A50A::func_116B(param_00)
{
	if(isdefined(level.var_6D0) && level.var_6D0 == self)
	{
		return 1;
	}

	var_01 = function_00D7("bad_guys","all");
	foreach(var_03 in var_01)
	{
		if(!isdefined(var_03.enemy))
		{
			continue;
		}

		if(!isplayer(var_03.enemy))
		{
			continue;
		}

		if(var_03.type == "dog")
		{
			foreach(var_05 in level.var_328)
			{
				if(distance(var_03.var_2E6,var_05.var_2E6) < 384)
				{
					return 0;
				}
			}

			continue;
		}

		if(isdefined(var_03.var_5B33) && isdefined(var_03.var_5B33.target) && isplayer(var_03.var_5B33.target))
		{
			return 0;
		}

		var_07 = [[ level.var_1152 ]](var_03);
		if(var_07 == "return_even_if_low_accuracy")
		{
			return 0;
		}

		if(var_03.var_17D < 0.021 && var_03.var_17D > -1)
		{
			continue;
		}

		if(var_07 == "return")
		{
			return 0;
		}

		if(var_07 == "none")
		{
			continue;
		}

		if(var_03.var_7.var_55D4 > gettime() - 500)
		{
			if(param_00 || var_03 animscripts\utility::func_1AE1(0) && var_03 method_81BD(0))
			{
				return 0;
			}
		}

		if(isdefined(var_03.var_7.var_979) && var_03 animscripts\utility::func_1AE1(0) && var_03 method_81BD(0))
		{
			return 0;
		}
	}

	if(lib_A59A::func_6B6C())
	{
		return 0;
	}

	var_09 = getentarray("destructible","classname");
	foreach(var_0B in var_09)
	{
		if(!isdefined(var_0B.healthdrain))
		{
			continue;
		}

		foreach(var_05 in level.var_328)
		{
			if(distance(var_0B.var_2E6,var_05.var_2E6) < 400)
			{
				return 0;
			}
		}
	}

	return 1;
}

//Function Number: 26
lib_A50A::func_3250()
{
	if(self.var_17D >= 0.021)
	{
		return 1;
	}

	foreach(var_01 in level.var_328)
	{
		if(distance(self.var_2E6,var_01.var_2E6) < 500)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 27
lib_A50A::func_1152(param_00)
{
	foreach(var_02 in level.var_328)
	{
		var_03 = distance(param_00.var_2E6,var_02.var_2E6);
		if(var_03 < 200)
		{
			return "return_even_if_low_accuracy";
		}
		else if(var_03 < 360)
		{
			return "return";
		}
		else if(var_03 < 1000)
		{
			return "threat_exists";
		}
	}

	return "none";
}

//Function Number: 28
lib_A50A::func_1153(param_00)
{
	if(!lib_A59A::func_5013())
	{
		return;
	}

	var_01 = lib_A59B::func_3DB6();
	var_02 = var_01;
	if(isdefined(level.var_7269))
	{
		var_02 = var_01 - level.var_7269;
	}

	level.var_7269 = var_01;
	function_0100("script_checkpoint: id %d, leveltime %d, deltatime %d",param_00,var_01,var_02);
}