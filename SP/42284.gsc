/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42284.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 17
 * Decompile Time: 25 ms
 * Timestamp: 4/20/2022 8:22:06 PM
*******************************************************************/

//Function Number: 1
lib_A52C::main()
{
	level.friendlyfire["min_participation"] = -200;
	level.friendlyfire["max_participation"] = 1000;
	level.friendlyfire["enemy_kill_points"] = 250;
	level.friendlyfire["friend_kill_points"] = -650;
	level.friendlyfire["point_loss_interval"] = 1.25;
	level.var_31D.var_669B = 0;
	level.var_3AA5 = 0;
	level.friendlyfiredisabledfordestructible = 0;
	setdvarifuninitialized("friendlyfire_dev_disabled","0");
	common_scripts\utility::flag_init("friendly_fire_warning");
	thread lib_A52C::func_269D();
	thread lib_A52C::func_669D();
}

//Function Number: 2
lib_A52C::func_269D()
{
}

//Function Number: 3
lib_A52C::func_0CA3(param_00)
{
	level.var_3A9A = param_00;
}

//Function Number: 4
lib_A52C::func_734A(param_00)
{
	level.var_3A9A = undefined;
}

//Function Number: 5
lib_A52C::func_3A57(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	if(!isdefined(param_00.inliveplayerkillstreak))
	{
		param_00.inliveplayerkillstreak = "allies";
	}

	if(isdefined(level.var_60F7))
	{
		return;
	}

	level endon("mission failed");
	level thread lib_A52C::func_6225(param_00);
	level thread lib_A52C::func_6227(param_00);
	level thread lib_A52C::func_6228(param_00);
	for(;;)
	{
		if(!isdefined(param_00))
		{
			return;
		}

		if(param_00.health <= 0)
		{
			return;
		}

		var_01 = undefined;
		var_02 = undefined;
		var_03 = undefined;
		var_04 = undefined;
		var_05 = undefined;
		var_06 = undefined;
		var_07 = undefined;
		param_00 waittill("friendlyfire_notify",var_01,var_02,var_03,var_04,var_05,var_06);
		if(!isdefined(param_00))
		{
			return;
		}

		if(!isdefined(var_02))
		{
			continue;
		}

		if(isdefined(level.var_3A9A))
		{
			var_01 = var_01 * level.var_3A9A;
			var_01 = int(var_01);
		}

		var_08 = 0;
		if(!isdefined(var_06))
		{
			var_06 = param_00.var_103;
		}

		if(isdefined(level.var_3A9B))
		{
			if(isdefined(var_02.damageowner))
			{
				var_07 = 1;
				var_02 = var_02.damageowner;
			}
		}

		if(isdefined(level.var_3A9C))
		{
			if(isdefined(var_02) && isdefined(var_02.owner) && var_02.owner == level.var_31D)
			{
				var_08 = 1;
			}
		}

		if(isplayer(var_02))
		{
			var_08 = 1;
			if(isdefined(var_06) && var_06 == "none")
			{
				var_08 = 0;
			}

			if(var_02 isusingturret())
			{
				var_08 = 1;
			}

			if(isdefined(var_07))
			{
				var_08 = 1;
			}
		}
		else if(isdefined(var_02.code_classname) && var_02.code_classname == "script_vehicle")
		{
			var_09 = var_02 veh_getvehicleowner();
			if(isdefined(var_09) && isplayer(var_09))
			{
				var_08 = 1;
			}
		}

		if(!var_08)
		{
			continue;
		}

		if(!isdefined(param_00.inliveplayerkillstreak))
		{
			continue;
		}

		var_0A = param_00.inliveplayerkillstreak == level.var_31D.inliveplayerkillstreak;
		var_0B = undefined;
		if(isdefined(param_00.type) && param_00.type == "civilian")
		{
			var_0B = 1;
		}
		else
		{
			var_0B = issubstr(param_00.classname,"civilian");
		}

		var_0C = var_01 == -1;
		if(!var_0A && !var_0B)
		{
			if(var_0C)
			{
				level.var_31D.var_669B = level.var_31D.var_669B + level.friendlyfire["enemy_kill_points"];
				lib_A52C::func_669C();
				return;
			}

			continue;
		}

		if(isdefined(param_00.var_60F7))
		{
			continue;
		}

		if(var_05 == "MOD_PROJECTILE_SPLASH" && isdefined(level.var_60F8))
		{
			continue;
		}

		if(isdefined(var_06) && var_06 == "claymore")
		{
			continue;
		}

		if(var_0C)
		{
			if(isdefined(param_00.var_3A38))
			{
				level.var_31D.var_669B = level.var_31D.var_669B + param_00.var_3A38;
			}
			else
			{
				level.var_31D.var_669B = level.var_31D.var_669B + level.friendlyfire["friend_kill_points"];
			}
		}
		else
		{
			level.var_31D.var_669B = level.var_31D.var_669B - var_01;
		}

		lib_A52C::func_669C();
		if(lib_A52C::func_1CC1(param_00,var_05) && lib_A52C::func_780C())
		{
			if(var_0C)
			{
				return;
			}
			else
			{
				continue;
			}
		}

		if(isdefined(level.var_3A56))
		{
			[[ level.var_3A56 ]](param_00,var_01,var_02,var_03,var_04,var_05,var_06);
			continue;
		}

		lib_A52C::func_3A55(var_0B);
	}
}

//Function Number: 6
lib_A52C::func_3A55(param_00)
{
	if(isdefined(level.var_3618) && level.var_3618)
	{
		level thread lib_A52C::func_5CDA(param_00);
		return;
	}

	var_01 = level.friendlyfiredisabledfordestructible;
	if(isdefined(level.var_3A9B) && param_00)
	{
		var_01 = 0;
	}

	if(var_01)
	{
		return;
	}

	if(level.var_3AA5 == 1)
	{
		return;
	}

	if(level.var_31D.var_669B <= level.friendlyfire["min_participation"])
	{
		level thread lib_A52C::func_5CDA(param_00);
	}
}

//Function Number: 7
lib_A52C::func_1CC1(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	var_02 = 0;
	if(isdefined(param_00.var_103) && param_00.var_103 == "none")
	{
		var_02 = 1;
	}

	if(isdefined(param_01) && param_01 == "MOD_GRENADE_SPLASH")
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 8
lib_A52C::func_780C()
{
	var_00 = gettime();
	if(var_00 < 4500)
	{
		return 1;
	}
	else if(var_00 - level.var_5575 < 4500)
	{
		return 1;
	}

	return 0;
}

//Function Number: 9
lib_A52C::func_669C()
{
	if(level.var_31D.var_669B > level.friendlyfire["max_participation"])
	{
		level.var_31D.var_669B = level.friendlyfire["max_participation"];
	}

	if(level.var_31D.var_669B < level.friendlyfire["min_participation"])
	{
		level.var_31D.var_669B = level.friendlyfire["min_participation"];
	}
}

//Function Number: 10
lib_A52C::func_669D()
{
	level endon("mission failed");
	for(;;)
	{
		if(level.var_31D.var_669B > 0)
		{
			level.var_31D.var_669B--;
		}
		else if(level.var_31D.var_669B < 0)
		{
			level.var_31D.var_669B++;
		}

		wait(level.friendlyfire["point_loss_interval"]);
	}
}

//Function Number: 11
lib_A52C::func_9926()
{
	level.var_3AA5 = 0;
}

//Function Number: 12
lib_A52C::func_992A()
{
	level.var_3AA5 = 1;
}

//Function Number: 13
lib_A52C::func_5CDA(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	if(getdvar("friendlyfire_dev_disabled") == "1")
	{
		return;
	}

	level.var_31D endon("death");
	if(!isalive(level.var_31D))
	{
		return;
	}

	level endon("mine death");
	level notify("mission failed");
	level notify("friendlyfire_mission_fail");
	waittillframeend;
	function_00D3("hud_missionFailed",1);
	function_00D3("ammoCounterHide",1);
	function_00D3("hud_showstance",0);
	function_00D3("actionSlotsHide",1);
	if(isdefined(level.var_31D.var_3613))
	{
		return;
	}

	if(param_00)
	{
		lib_A560::func_7DFD(&"SCRIPT_MISSIONFAIL_CIVILIAN_KILLED");
	}
	else if(isdefined(level.var_2543))
	{
		lib_A560::func_7DFD(level.var_2543);
	}
	else if(level.var_1A3D == "british")
	{
		lib_A560::func_7DFD(&"SCRIPT_MISSIONFAIL_KILLTEAM_BRITISH");
	}
	else if(level.var_1A3D == "russian")
	{
		lib_A560::func_7DFD(&"SCRIPT_MISSIONFAIL_KILLTEAM_RUSSIAN");
	}
	else
	{
		lib_A560::func_7DFD(&"SCRIPT_MISSIONFAIL_KILLTEAM_AMERICAN");
	}

	if(isdefined(level.var_2544))
	{
		thread lib_A560::func_7DFE(level.var_2544,64,64,0);
	}

	function_0101(level.var_31D.var_2E6,"script_friendlyfire: civilian %d",param_00);
	lib_A59A::func_5CDC();
}

//Function Number: 14
lib_A52C::func_6225(param_00)
{
	level endon("mission failed");
	param_00 endon("death");
	for(;;)
	{
		var_01 = undefined;
		var_02 = undefined;
		var_03 = undefined;
		var_04 = undefined;
		var_05 = undefined;
		var_06 = undefined;
		var_07 = undefined;
		var_08 = undefined;
		var_09 = undefined;
		var_0A = undefined;
		param_00 waittill("damage",var_01,var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09,var_0A);
		param_00 notify("friendlyfire_notify",var_01,var_02,var_03,var_04,var_05,var_0A);
	}
}

//Function Number: 15
lib_A52C::func_6227(param_00)
{
	level endon("mission failed");
	param_00 waittill("damage_notdone",var_01,var_02,var_03,var_04,var_05);
	param_00 notify("friendlyfire_notify",-1,var_02,undefined,undefined,var_05);
}

//Function Number: 16
lib_A52C::func_6228(param_00)
{
	level endon("mission failed");
	param_00 waittill("death",var_01,var_02,var_03);
	param_00 notify("friendlyfire_notify",-1,var_01,undefined,undefined,var_02,var_03);
}

//Function Number: 17
lib_A52C::func_2992(param_00)
{
}