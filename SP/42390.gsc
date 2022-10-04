/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42390.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 20 ms
 * Timestamp: 4/20/2022 8:23:25 PM
*******************************************************************/

//Function Number: 1
lib_A596::init()
{
	lib_A596::func_9BB0();
	if(isdefined(level.var_31D))
	{
		lib_A596::func_9BAF(level.var_31D);
	}
}

//Function Number: 2
lib_A596::func_9BB0()
{
	level.var_9BA7 = [];
	level.var_9BA7["kills"] = "ch_kills";
	level.var_9BA7["headshots"] = "ch_headshots";
	level.var_9BA7["kills_grenades"] = "ch_frag_kills";
	level.var_9BA7["intel"] = "ch_intel";
	level.var_9BA5 = [];
	level.var_9BA3 = [];
	level.var_9BA6 = [];
	var_00 = 0;
	for(;;)
	{
		var_01 = int(tablelookupbyrow("sp/upgrade_challenges.csv",var_00,0));
		var_02 = tablelookupbyrow("sp/upgrade_challenges.csv",var_00,1);
		if(var_02 == "")
		{
			break;
		}

		level.var_9BA5[var_02] = var_01;
		level.var_9BA4[var_01] = [];
		level.var_9BA3[var_01] = tablelookupbyrow("sp/upgrade_challenges.csv",var_00,4);
		level.var_9BA6[var_01] = 0;
		var_03 = 10;
		for(;;)
		{
			var_04 = int(tablelookupbyrow("sp/upgrade_challenges.csv",var_00,var_03));
			if(var_04 <= 0)
			{
				break;
			}

			level.var_9BA4[var_01][level.var_9BA4[var_01].size] = var_04;
			var_03++;
		}

		var_00++;
	}
}

//Function Number: 3
lib_A596::func_9BAF(param_00)
{
	param_00 lib_A565::func_8D47(::lib_A596::func_9BB2);
	if(isdefined(level.var_9BA5) && level.var_9BA5.size > 0)
	{
		param_00.stats["upgradeChallengeStage"] = [];
		param_00.stats["upgradeChallengeProgress"] = [];
		if(!isdefined(param_00.stats["upgradePoints"]))
		{
			param_00.stats["upgradePoints"] = 0;
		}

		foreach(var_03, var_02 in level.var_9BA7)
		{
			param_00 lib_A596::func_9BB2(var_03,0);
		}
	}
}

//Function Number: 4
lib_A596::func_41CC(param_00)
{
	lib_A596::func_9BB2("kills",param_00);
}

//Function Number: 5
lib_A596::func_41CB(param_00)
{
	lib_A596::func_9BB2("headshots",param_00);
	lib_A596::func_41CC(param_00);
}

//Function Number: 6
lib_A596::func_41CA(param_00)
{
	lib_A596::func_9BB2("kills_grenades",param_00);
	lib_A596::func_41CC(param_00);
}

//Function Number: 7
lib_A596::func_9BB2(param_00,param_01)
{
	if(isdefined(level.var_9BA7) && isdefined(level.var_9BA7[param_00]))
	{
		if(!isdefined(level.var_9BA5[level.var_9BA7[param_00]]))
		{
			return;
		}

		var_02 = level.var_9BA5[level.var_9BA7[param_00]];
		var_03 = getomnvar("ui_pm_t_" + param_00);
		setomnvar("ui_pm_t_" + param_00,var_03 + param_01);
		if(param_00 == "intel")
		{
			var_04 = int(self getplayerprofiledata("sp_upgradeChallengeStage_" + var_02));
			if(!isdefined(self.stats["upgradeChallengeStage"][param_00]))
			{
				self.stats["intelUpgradePoints"] = 0;
				setomnvar("ui_pm_g_start_intel",var_04);
			}

			self.stats["upgradeChallengeStage"][param_00] = var_04;
			var_05 = int(self getplayerprofiledata("sp_upgradeChallengeProgress_" + var_02));
			if(!isdefined(self.stats["upgradeChallengeProgress"][param_00]))
			{
				setomnvar("ui_pm_p_start_intel",var_05);
			}

			self.stats["upgradeChallengeProgress"][param_00] = var_05;
		}
		else
		{
			var_04 = 0;
			if(!isdefined(self.stats["upgradeChallengeStage"][param_01]))
			{
				var_05 = int(self getplayerprofiledata("sp_upgradeChallengeStage_" + var_03));
				self.stats["upgradeChallengeStage"][param_01] = var_05;
			}
			else
			{
				var_05 = self.stats["upgradeChallengeStage"][param_01];
			}

			var_05 = 0;
			if(!isdefined(self.stats["upgradeChallengeProgress"][param_00]))
			{
				var_05 = int(self getplayerprofiledata("sp_upgradeChallengeProgress_" + var_02));
				self.stats["upgradeChallengeProgress"][param_00] = var_05;
			}
			else
			{
				var_05 = self.stats["upgradeChallengeProgress"][param_00];
			}
		}

		var_06 = level.var_9BA4[var_02].size - 1;
		var_07 = level.var_9BA4[var_02][var_06];
		if(var_04 >= var_06 && var_05 >= var_07)
		{
			setomnvar("ui_pm_g_" + param_00,level.var_9BA4[var_02][var_06]);
			setomnvar("ui_pm_p_" + param_00,var_07);
			return;
		}

		var_08 = level.var_9BA4[var_02][var_04];
		var_09 = var_05;
		var_05 = var_05 + param_01;
		var_0A = 0;
		while(var_04 <= var_06 && var_05 >= var_08 && !var_0A)
		{
			function_02AF(level.var_9BA3[var_02]);
			if(param_00 == "intel")
			{
				lib_A596::func_9BA9(var_02);
			}
			else
			{
				lib_A596::func_9BA8(var_02);
			}

			if(var_04 >= var_06 && var_05 >= var_07)
			{
				var_05 = var_07;
				var_0A = 1;
				continue;
			}

			var_05 = var_05 - var_08;
			var_04++;
			if(var_04 <= var_06)
			{
				var_08 = level.var_9BA4[var_02][var_04];
			}
		}

		self.stats["upgradeChallengeStage"][param_00] = var_04;
		self.stats["upgradeChallengeProgress"][param_00] = var_05;
		setomnvar("ui_pm_g_" + param_00,level.var_9BA4[var_02][var_04]);
		setomnvar("ui_pm_p_" + param_00,var_05);
		if(param_00 == "intel")
		{
			lib_A596::func_20BE(param_00,1);
		}
	}
}

//Function Number: 8
lib_A596::func_9BA9(param_00,param_01)
{
	lib_A596::func_20BF(1);
	self.stats["intelUpgradePoints"]++;
	level.var_9BA6[param_00] = self.stats["intelUpgradePoints"];
	var_02 = tablelookupbyrow("sp/upgrade_challenges.csv",param_00,6);
	setomnvar(var_02,level.var_9BA6[param_00]);
}

//Function Number: 9
lib_A596::func_9BA8(param_00)
{
	if(!isdefined(self.stats["upgradePoints"]))
	{
		self.stats["upgradePoints"] = 0;
	}

	self.stats["upgradePoints"]++;
	level.var_9BA6[param_00] = level.var_9BA6[param_00] + 1;
	var_01 = tablelookupbyrow("sp/upgrade_challenges.csv",param_00,6);
	setomnvar(var_01,level.var_9BA6[param_00]);
}

//Function Number: 10
lib_A596::func_20BF(param_00)
{
	if(isdefined(level.var_31D))
	{
		var_01 = level.var_31D;
		var_02 = int(var_01 getplayerprofiledata("sp_upgradePoints"));
		var_03 = var_02 + param_00;
		if(var_03 > var_02)
		{
			var_01 setplayerprofiledata("sp_upgradePoints",var_03);
		}
	}
}

//Function Number: 11
lib_A596::func_20BE(param_00,param_01)
{
	if(isdefined(level.var_31D))
	{
		var_02 = level.var_31D;
		var_03 = level.var_9BA5[level.var_9BA7[param_00]];
		var_04 = 0;
		if(isdefined(var_02.stats["upgradeChallengeStage"][param_00]))
		{
			var_04 = var_02.stats["upgradeChallengeStage"][param_00];
			var_05 = int(var_02 getplayerprofiledata("sp_upgradeChallengeStage_" + var_03));
			if(var_04 > var_05)
			{
				var_02 setplayerprofiledata("sp_upgradeChallengeStage_" + var_03,var_04);
			}
		}

		var_06 = 0;
		if(isdefined(var_02.stats["upgradeChallengeProgress"][param_00]))
		{
			var_06 = var_02.stats["upgradeChallengeProgress"][param_00];
			var_07 = int(var_02 getplayerprofiledata("sp_upgradeChallengeProgress_" + var_03));
			if(var_06 != var_07)
			{
				var_02 setplayerprofiledata("sp_upgradeChallengeProgress_" + var_03,var_06);
			}
		}

		if(param_01)
		{
			function_0004();
		}
	}
}

//Function Number: 12
lib_A596::func_20C0()
{
	if(isdefined(level.var_31D))
	{
		var_00 = level.var_31D;
		lib_A596::func_20BF(var_00.stats["upgradePoints"]);
		if(isdefined(level.var_9BA7))
		{
			foreach(var_04, var_02 in level.var_9BA7)
			{
				if(var_04 == "intel")
				{
					continue;
				}

				var_03 = var_04;
				if(!isdefined(level.var_9BA5[level.var_9BA7[var_03]]))
				{
					continue;
				}

				if(!isdefined(level.var_9BA7[var_03]))
				{
					continue;
				}

				lib_A596::func_20BE(var_03,0);
			}
		}

		function_0004();
	}
}