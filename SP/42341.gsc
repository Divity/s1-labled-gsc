/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42341.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 20
 * Decompile Time: 4 ms
 * Timestamp: 4/20/2022 8:23:21 PM
*******************************************************************/

//Function Number: 1
lib_A565::func_4D5F()
{
	self.stats["kills"] = 0;
	self.stats["kills_melee"] = 0;
	self.stats["kills_explosives"] = 0;
	self.stats["kills_grenades"] = 0;
	self.stats["kills_juggernaut"] = 0;
	self.stats["kills_vehicle"] = 0;
	self.stats["kills_sentry"] = 0;
	self.stats["headshots"] = 0;
	self.stats["shots_fired"] = 0;
	self.stats["shots_hit"] = 0;
	self.stats["weapon"] = [];
	self.stats["current_checkpoint"] = 0;
	self.stats["checkpoint_start"] = 0;
	self.stats["final_difficulty"] = "";
	self.stats["level_name"] = "";
	self.stats["start_difficulty"] = "";
	self.stats["career_kills_total"] = 0;
	self.stats["career_deaths_total"] = 0;
	self.stats["career_levels_completed"] = [];
	self.stats["career_level_completed_timestamps"] = [];
	self.stats["register_kills_for_vehicle_occupants"] = 1;
	thread lib_A565::func_8441();
}

//Function Number: 2
lib_A565::func_A1B1()
{
	if(isdefined(self.var_2A53) && self.var_2A53)
	{
		return 1;
	}

	if(!isdefined(self.var_FE))
	{
		return 0;
	}

	return self.var_FE == "helmet" || self.var_FE == "head" || self.var_FE == "neck";
}

//Function Number: 3
lib_A565::func_72DA(param_00,param_01)
{
	var_02 = self;
	if(isdefined(self.owner))
	{
		var_02 = self.owner;
	}

	if(!isplayer(var_02))
	{
		return;
	}

	if(param_01)
	{
		var_02.stats["start_difficulty"] = param_00;
		function_02A3("start_difficulty",param_00);
		return;
	}

	var_02.stats["final_difficulty"] = param_00;
	function_02A3("final_difficulty",param_00);
}

//Function Number: 4
lib_A565::func_72DD(param_00)
{
	var_01 = self;
	if(isdefined(self.owner))
	{
		var_01 = self.owner;
	}

	if(!isplayer(var_01))
	{
		return;
	}

	var_01.stats["level_name"] = param_00;
	function_02A3("level_name",param_00);
}

//Function Number: 5
lib_A565::func_93D2(param_00)
{
	var_01 = self;
	if(isdefined(self.owner))
	{
		var_01 = self.owner;
	}

	if(!isplayer(var_01))
	{
		return;
	}

	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	var_01.stats["register_kills_for_vehicle_occupants"] = param_00;
}

//Function Number: 6
lib_A565::func_846E()
{
	var_00 = self;
	if(isdefined(self.owner))
	{
		var_00 = self.owner;
	}

	if(!isplayer(var_00))
	{
		return 1;
	}

	if(isdefined(var_00.stats["register_kills_for_vehicle_occupants"]) && var_00.stats["register_kills_for_vehicle_occupants"])
	{
		return 1;
	}

	return 0;
}

//Function Number: 7
lib_A565::func_72DC(param_00,param_01,param_02,param_03)
{
	var_04 = self;
	var_05 = 0;
	if(isdefined(self.owner))
	{
		var_04 = self.owner;
	}

	if(!isplayer(var_04))
	{
		if(isdefined(level.var_6DFF) && level.var_6DFF)
		{
			var_04 = level.var_328[randomint(level.var_328.size)];
		}
	}

	if(!isplayer(var_04))
	{
		return;
	}

	if(isdefined(level.var_85B0) && isdefined(param_00.var_2E17) && param_00.var_2E17)
	{
		return;
	}

	var_04.stats["kills"]++;
	var_04 lib_A565::func_1B89("kills",1);
	if(lib_A59A::func_5080())
	{
		level notify("specops_player_kill",var_04,param_00,param_02,param_03);
	}

	if(isdefined(param_00))
	{
		if(param_00 lib_A565::func_A1B1() && param_01 != "MOD_MELEE" && param_01 != "MOD_MELEE_ALT")
		{
			var_04.stats["headshots"]++;
			var_04 lib_A565::func_1B89("headshots",1);
			var_05 = 1;
		}

		if(isdefined(param_00.juggernaut))
		{
			var_04.stats["kills_juggernaut"]++;
			var_04 lib_A565::func_1B89("kills_juggernaut",1);
		}

		if(isdefined(param_00.var_519A))
		{
			var_04.stats["kills_sentry"]++;
		}

		if(param_00.code_classname == "script_vehicle")
		{
			var_04.stats["kills_vehicle"]++;
			if(var_04 lib_A565::func_846E())
			{
				if(isdefined(param_00.var_7507))
				{
					foreach(var_07 in param_00.var_7507)
					{
						if(isdefined(var_07))
						{
							var_04 lib_A565::func_72DC(var_07,param_01,param_02,param_03);
						}
					}
				}
			}
		}
	}

	var_09 = 0;
	if(lib_A565::func_1BD6(param_01))
	{
		var_04.stats["kills_explosives"]++;
		var_09 = 1;
	}

	if(lib_A565::func_1BD7(param_01,param_02) && !isdefined(var_04.var_5B1A) || !isdefined(var_04.var_5B1A.active) || !var_04.var_5B1A.active)
	{
		var_04.stats["kills_grenades"]++;
		var_04 lib_A565::func_8D45("kills_grenades",1);
		var_09 = 1;
	}

	if(!isdefined(param_02))
	{
		param_02 = var_04 getcurrentweapon();
	}

	if(issubstr(tolower(param_01),"melee"))
	{
		var_04.stats["kills_melee"]++;
		if(weaponinventorytype(param_02) == "primary")
		{
			return;
		}
	}

	if(var_04 lib_A565::func_5052(param_02))
	{
		var_04 lib_A565::func_72DF(param_02);
	}

	var_04.stats["weapon"][param_02].kills++;
	var_04.stats["career_kills_total"]++;
	if(!var_09)
	{
		lib_A576::func_4C35(param_02,var_05);
	}
}

//Function Number: 8
lib_A565::func_8D47(param_00)
{
	if(!isdefined(self.var_8D46))
	{
		self.var_8D46 = [];
	}

	self.var_8D46[self.var_8D46.size] = param_00;
}

//Function Number: 9
lib_A565::func_8D45(param_00,param_01)
{
	if(isdefined(self.var_8D46))
	{
		foreach(var_03 in self.var_8D46)
		{
			self [[ var_03 ]](param_00,param_01);
		}
	}
}

//Function Number: 10
lib_A565::func_1B89(param_00,param_01)
{
	lib_A565::func_8D45(param_00,param_01);
	if(!lib_A59A::func_5080())
	{
		return;
	}

	var_02 = int(self getplayerdata("career",param_00)) + param_01;
	self setplayerdata("career",param_00,var_02);
}

//Function Number: 11
lib_A565::func_72E4()
{
	if(!isplayer(self))
	{
		return;
	}

	if(isdefined(self.var_72ED))
	{
		return;
	}

	self.var_72ED = 1;
	self.stats["shots_hit"]++;
	lib_A565::func_1B89("bullets_hit",1);
	var_00 = self getcurrentweapon();
	if(lib_A565::func_5052(var_00))
	{
		lib_A565::func_72DF(var_00);
	}

	self.stats["weapon"][var_00].var_8442++;
	thread lib_A576::func_4C34(var_00);
	waittillframeend;
	self.var_72ED = undefined;
}

//Function Number: 12
lib_A565::func_8441()
{
	self endon("death");
	for(;;)
	{
		self waittill("weapon_fired");
		var_00 = self getcurrentweapon();
		if(!isdefined(var_00) || !lib_A59A::isprimaryweapon(var_00))
		{
			continue;
		}

		self.stats["shots_fired"]++;
		lib_A565::func_1B89("bullets_fired",1);
		if(lib_A565::func_5052(var_00))
		{
			lib_A565::func_72DF(var_00);
		}

		self.stats["weapon"][var_00].var_8440++;
		thread lib_A576::func_8440(var_00);
	}
}

//Function Number: 13
lib_A565::func_5052(param_00)
{
	if(isdefined(self.stats["weapon"][param_00]))
	{
		return 0;
	}

	return 1;
}

//Function Number: 14
lib_A565::func_1BD6(param_00)
{
	param_00 = tolower(param_00);
	switch(param_00)
	{
		case "splash":
		case "mod_explosive":
		case "mod_projectile_splash":
		case "mod_projectile":
		case "mod_grenade_splash":
		case "mod_grenade":
			break;

		default:
			break;
	}
}

//Function Number: 15
lib_A565::func_1BD7(param_00,param_01)
{
	param_00 = tolower(param_00);
	switch(param_00)
	{
		case "emp_grenade":
			break;

		case "mod_projectile_splash":
			break;

		case "mod_grenade_splash":
		case "mod_grenade":
			break;

		default:
			break;
	}
}

//Function Number: 16
lib_A565::func_72DF(param_00)
{
	self.stats["weapon"][param_00] = spawnstruct();
	self.stats["weapon"][param_00].name = param_00;
	self.stats["weapon"][param_00].var_8440 = 0;
	self.stats["weapon"][param_00].var_8442 = 0;
	self.stats["weapon"][param_00].kills = 0;
	self.stats["weapon"][param_00].deaths = 0;
}

//Function Number: 17
lib_A565::func_7EBF()
{
	var_00 = 1;
	foreach(var_02 in level.var_328)
	{
		setdvar("stats_" + var_00 + "_kills_melee",var_02.stats["kills_melee"]);
		setdvar("stats_" + var_00 + "_kills_juggernaut",var_02.stats["kills_juggernaut"]);
		setdvar("stats_" + var_00 + "_kills_explosives",var_02.stats["kills_explosives"]);
		setdvar("stats_" + var_00 + "_kills_vehicle",var_02.stats["kills_vehicle"]);
		setdvar("stats_" + var_00 + "_kills_sentry",var_02.stats["kills_sentry"]);
		var_03 = var_02 lib_A565::func_3CD8(5);
		foreach(var_05 in var_03)
		{
			var_05.var_A = 0;
			if(var_05.var_8440 > 0)
			{
				var_05.var_A = int(var_05.var_8442 / var_05.var_8440 * 100);
			}
		}

		for(var_07 = 1;var_07 < 6;var_07++)
		{
			setdvar("stats_" + var_00 + "_weapon" + var_07 + "_name"," ");
			setdvar("stats_" + var_00 + "_weapon" + var_07 + "_kills"," ");
			setdvar("stats_" + var_00 + "_weapon" + var_07 + "_shots"," ");
			setdvar("stats_" + var_00 + "_weapon" + var_07 + "_accuracy"," ");
		}

		for(var_07 = 0;var_07 < var_03.size;var_07++)
		{
			if(!isdefined(var_03[var_07]))
			{
				break;
			}

			setdvar("stats_" + var_00 + "_weapon" + var_07 + 1 + "_name",var_03[var_07].name);
			setdvar("stats_" + var_00 + "_weapon" + var_07 + 1 + "_kills",var_03[var_07].kills);
			setdvar("stats_" + var_00 + "_weapon" + var_07 + 1 + "_shots",var_03[var_07].var_8440);
			setdvar("stats_" + var_00 + "_weapon" + var_07 + 1 + "_accuracy",var_03[var_07].var_A + "%");
		}

		var_00++;
	}
}

//Function Number: 18
lib_A565::func_3CD8(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < param_00;var_02++)
	{
		var_01[var_02] = lib_A565::func_3EC6(var_01);
	}

	return var_01;
}

//Function Number: 19
lib_A565::func_3EC6(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = [];
	}

	var_01 = undefined;
	foreach(var_03 in self.stats["weapon"])
	{
		var_04 = 0;
		foreach(var_06 in param_00)
		{
			if(var_03.name == var_06.name)
			{
				var_04 = 1;
				break;
			}
		}

		if(var_04)
		{
			continue;
		}

		if(!isdefined(var_01))
		{
			var_01 = var_03;
			continue;
		}

		if(var_03.kills > var_01.kills)
		{
			var_01 = var_03;
		}
	}

	return var_01;
}

//Function Number: 20
lib_A565::func_599C()
{
}