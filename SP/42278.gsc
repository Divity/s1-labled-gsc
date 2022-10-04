/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42278.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 40
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:22:05 PM
*******************************************************************/

//Function Number: 1
lib_A526::main()
{
	var_00 = [];
	var_00 = lib_A526::func_242B("THE_BEST_OF_THE_BEST");
	var_00 lib_A526::func_07FD("seoul",0,"LEVEL_1",0,undefined,2);
	var_00 lib_A526::func_07FD("recovery",0,"LEVEL_2",0,undefined,2);
	var_00 lib_A526::func_07FD("lagos",0,"LEVEL_3",0,undefined,2);
	var_00 lib_A526::func_07FD("fusion",0,"LEVEL_4",0,undefined,2);
	var_00 lib_A526::func_07FD("detroit",0,"LEVEL_5",0,undefined,2);
	var_00 lib_A526::func_07FD("greece",0,"LEVEL_6",0,undefined,2);
	var_00 lib_A526::func_07FD("betrayal",0,"LEVEL_7",0,undefined,2);
	var_00 lib_A526::func_07FD("irons_estate",0,"LEVEL_8",0,undefined,2);
	var_00 lib_A526::func_07FD("crash",0,"LEVEL_9",0,undefined,3);
	var_00 lib_A526::func_07FD("lab",0,"LEVEL_10",0,undefined,2);
	var_00 lib_A526::func_07FD("sanfran",1,"LEVEL_11",0,undefined,3);
	var_00 lib_A526::func_07FD("sanfran_b",0,"LEVEL_12",0,undefined,2);
	var_00 lib_A526::func_07FD("df_fly",0,undefined,1,undefined,undefined);
	var_00 lib_A526::func_07FD("df_baghdad",0,"LEVEL_13",0,undefined,2);
	var_00 lib_A526::func_07FD("captured",0,"LEVEL_14",0,undefined,2);
	var_00 lib_A526::func_07FD("finale",0,undefined,0,undefined,2);
	if(isdefined(level.var_31B5))
	{
		[[ level.var_31B5 ]]();
		level.var_31B5 = undefined;
	}

	level.var_5CDD = var_00;
}

//Function Number: 2
lib_A526::func_270F()
{
	wait(10);
	while(getdvarint("test_next_mission") < 1)
	{
		wait(3);
	}

	lib_A526::func_05FF();
}

//Function Number: 3
lib_A526::func_05FF()
{
	if(lib_A59A::func_5014())
	{
		function_00D3("ui_nextMission","0");
		if(isdefined(level.var_60D4))
		{
			function_0053("",0,level.var_60D4);
		}
		else
		{
			function_0053("",0);
		}

		return;
	}

	level notify("nextmission");
	level.var_60D3 = 1;
	level.var_31D method_80EF();
	var_00 = undefined;
	function_00D3("ui_nextMission","1");
	setdvar("ui_showPopup","0");
	setdvar("ui_popupString","");
	setdvar("ui_prev_map",level.script);
	game["previous_map"] = level.script;
	var_00 = level.var_5CDD lib_A526::func_3FFE(level.script);
	if(level.script == "sp_intro" && !getdvarint("prologue_select"))
	{
		for(var_01 = var_00 + 1;var_01 < level.var_5CDD.var_56E2.size - 1;var_01++)
		{
			if(level.var_5CDD.var_56E2[var_01].name == "sp_intro")
			{
				var_00 = var_01;
				break;
			}
		}
	}

	setdvar("prologue_select","0");
	if(level.var_5CDD lib_A526::func_4710(var_00))
	{
		lib_A59A::func_41DA(level.var_5CDD lib_A526::func_3ED6(var_00));
	}

	lib_A52D::func_1123("aa_main_" + level.script);
	if(!isdefined(var_00))
	{
		function_0054(level.script);
		return;
	}

	lib_A526::func_3138(level.var_5CDD lib_A526::func_3F8E(var_00));
	if(level.script != "finale")
	{
		lib_A59A::func_56BD();
	}

	level.var_5CDD lib_A526::func_7F99(var_00);
	var_02 = level.var_31D getplayersetting("gameskill");
	lib_A565::func_72DA(level.var_2A62[int(var_02)],0);
	lib_A576::func_56BA(level.script);
	var_03 = lib_A526::func_9B6B();
	lib_A596::func_20C0();
	function_002C();
	lib_A526::func_1CB1();
	if(level.script == "finale")
	{
		function_0054("",0);
		return;
	}

	var_04 = var_00 + 1;
	if(lib_A59A::func_CC3())
	{
		if(!getdvarint("arcademode_full"))
		{
			function_00D3("ui_nextMission","0");
			function_0054(level.script);
			return;
		}
	}

	if(level.var_5CDD lib_A526::func_85BC(var_00))
	{
		if(isdefined(level.var_5CDD lib_A526::func_3F8E(var_00)))
		{
			function_0053(level.var_5CDD lib_A526::func_3FFF(var_04),level.var_5CDD lib_A526::func_3FDC(var_00),level.var_5CDD lib_A526::func_3F8E(var_00));
			return;
		}

		function_0053(level.var_5CDD lib_A526::func_3FFF(var_04),level.var_5CDD lib_A526::func_3FDC(var_00));
		return;
	}

	function_0054(level.var_5CDD lib_A526::func_3FFF(var_04),level.var_5CDD lib_A526::func_3FDC(var_00));
}

//Function Number: 4
lib_A526::func_9B6B()
{
	var_00 = int(lib_A526::func_4133() * 100);
	if(getdvarint("mis_cheat") == 0)
	{
		level.var_31D setplayerprofiledata("percentCompleteSP",var_00);
	}

	return var_00;
}

//Function Number: 5
lib_A526::func_4133()
{
	var_00 = max(lib_A526::func_40EB(),lib_A526::func_40EF());
	var_01 = 0.5;
	var_02 = lib_A526::func_40EC();
	var_03 = 0.25;
	var_04 = lib_A526::func_40F0();
	var_05 = 0.1;
	var_06 = lib_A526::func_40ED();
	var_07 = 0.15;
	var_08 = 0;
	var_08 = var_08 + var_01 * var_00;
	var_08 = var_08 + var_03 * var_02;
	var_08 = var_08 + var_05 * var_04;
	var_08 = var_08 + var_07 * var_06;
	return var_08;
}

//Function Number: 6
lib_A526::func_40EE(param_00)
{
	var_01 = level.var_31D getplayerprofiledata("missionHighestDifficulty");
	var_02 = 0;
	var_03 = [];
	var_04 = 0;
	for(var_05 = 0;var_05 < level.var_5CDD.var_56E2.size;var_05++)
	{
		if(int(var_01[var_05]) >= param_00)
		{
			var_02++;
		}
	}

	var_06 = var_02 / level.var_5CDD.var_56E2.size * 100;
	return var_06;
}

//Function Number: 7
lib_A526::func_40EB()
{
	var_00 = 1;
	return lib_A526::func_40EE(var_00);
}

//Function Number: 8
lib_A526::func_40EF()
{
	var_00 = 2;
	return lib_A526::func_40EE(var_00);
}

//Function Number: 9
lib_A526::func_40EC()
{
	var_00 = 3;
	return lib_A526::func_40EE(var_00);
}

//Function Number: 10
lib_A526::func_40F0()
{
	var_00 = 4;
	return lib_A526::func_40EE(var_00);
}

//Function Number: 11
lib_A526::func_40ED()
{
	var_00 = 45;
	var_01 = level.var_31D getplayerprofiledata("cheatPoints") / var_00 * 100;
	return var_01;
}

//Function Number: 12
lib_A526::func_3FFD(param_00)
{
	return int(level.var_31D getplayerprofiledata("missionHighestDifficulty")[param_00]);
}

//Function Number: 13
lib_A526::func_40CD(param_00)
{
	return int(level.var_31D getplayerprofiledata("missionSOHighestDifficulty")[param_00]);
}

//Function Number: 14
lib_A526::func_7F99(param_00)
{
	var_01 = level.var_31D getplayerprofiledata("missionHighestDifficulty");
	var_02 = "";
	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		if(var_03 != param_00)
		{
			var_02 = var_02 + var_01[var_03];
			continue;
		}

		if(level.gameskill + 1 > int(var_01[param_00]))
		{
			var_02 = var_02 + level.gameskill + 1;
			continue;
		}

		var_02 = var_02 + var_01[var_03];
	}

	var_04 = "";
	var_05 = 0;
	var_06 = 0;
	for(var_07 = 0;var_07 < var_02.size;var_07++)
	{
		if(int(var_02[var_07]) == 0 || var_05)
		{
			var_04 = var_04 + "0";
			var_05 = 1;
			continue;
		}

		var_04 = var_04 + var_02[var_07];
		var_06++;
	}

	lib_A526::func_0636(var_06);
	lib_A526::func_063A(var_04);
}

//Function Number: 15
lib_A526::func_0636(param_00)
{
	if(getdvar("mis_cheat") == "1")
	{
		return;
	}

	level.var_31D setplayerprofiledata("highestMission",param_00);
}

//Function Number: 16
lib_A526::func_063A(param_00)
{
	if(getdvar("mis_cheat") == "1")
	{
		return;
	}

	level.var_31D setplayerprofiledata("missionHighestDifficulty",param_00);
}

//Function Number: 17
lib_A526::func_4000(param_00)
{
	var_01 = level.var_31D getplayerprofiledata("missionHighestDifficulty");
	return int(var_01[param_00]);
}

//Function Number: 18
lib_A526::func_4023(param_00)
{
	if(param_00 < 9)
	{
		return "mis_0" + param_00 + 1;
	}

	return "mis_" + param_00 + 1;
}

//Function Number: 19
lib_A526::func_4012()
{
	var_00 = level.var_31D getplayerprofiledata("missionHighestDifficulty");
	var_01 = 4;
	for(var_02 = 0;var_02 < self.var_56E2.size;var_02++)
	{
		if(int(var_00[var_02]) < var_01)
		{
			var_01 = int(var_00[var_02]);
		}
	}

	return var_01;
}

//Function Number: 20
lib_A526::func_242B(param_00)
{
	var_01 = spawnstruct();
	var_01.var_56E2 = [];
	var_01.var_6F1B = [];
	var_01.var_46C9 = param_00;
	return var_01;
}

//Function Number: 21
lib_A526::func_07FD(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = self.var_56E2.size;
	self.var_56E2[var_07] = spawnstruct();
	self.var_56E2[var_07].name = param_00;
	self.var_56E2[var_07].var_52E1 = param_01;
	self.var_56E2[var_07].var_6DF = param_02;
	self.var_56E2[var_07].var_85BC = param_03;
	self.var_56E2[var_07].var_9D8A = param_04;
	if(isdefined(param_05))
	{
		self.var_56E2[var_07].var_35E7 = param_05;
	}
}

//Function Number: 22
lib_A526::func_0821(param_00)
{
	var_01 = self.var_6F1B.size;
	self.var_6F1B[var_01] = param_00;
}

//Function Number: 23
lib_A526::func_3FFE(param_00)
{
	foreach(var_03, var_02 in self.var_56E2)
	{
		if(var_02.name == param_00)
		{
			return var_03;
		}
	}

	return undefined;
}

//Function Number: 24
lib_A526::func_3FFF(param_00)
{
	return self.var_56E2[param_00].name;
}

//Function Number: 25
lib_A526::func_3FDC(param_00)
{
	return self.var_56E2[param_00].var_52E1;
}

//Function Number: 26
lib_A526::func_3ED6(param_00)
{
	return self.var_56E2[param_00].var_6DF;
}

//Function Number: 27
lib_A526::func_4001(param_00)
{
	return self.var_56E2[param_00].var_9D8A;
}

//Function Number: 28
lib_A526::func_3F8E(param_00)
{
	if(!isdefined(self.var_56E2[param_00].var_35E7))
	{
		return undefined;
	}

	return self.var_56E2[param_00].var_35E7;
}

//Function Number: 29
lib_A526::func_4731(param_00)
{
	if(isdefined(self.var_56E2[param_00].var_9D8A))
	{
		return 1;
	}

	return 0;
}

//Function Number: 30
lib_A526::func_4710(param_00)
{
	if(isdefined(self.var_56E2[param_00].var_6DF))
	{
		return 1;
	}

	return 0;
}

//Function Number: 31
lib_A526::func_1CDA(param_00)
{
	for(var_01 = 0;var_01 < self.var_56E2.size;var_01++)
	{
		if(var_01 == param_00)
		{
			continue;
		}

		if(!lib_A526::func_4731(var_01))
		{
			continue;
		}

		if(self.var_56E2[var_01].var_9D8A == self.var_56E2[param_00].var_9D8A)
		{
			if(lib_A526::func_3FFD(var_01) < 4)
			{
				return 0;
			}
		}
	}

	return 1;
}

//Function Number: 32
lib_A526::func_1CB1()
{
	var_00 = 0;
	var_01 = 0;
	if(lib_A526::func_40F0() >= 100)
	{
		lib_A59A::func_41DA("CAMPAIGN_VETERAN");
		var_00 = 1;
		level.var_31D setplayerprofiledata("sp_mpGearUnlocks",0,"1");
	}

	if(lib_A526::func_40EC() >= 100 || var_00)
	{
		lib_A59A::func_41DA("CAMPAIGN_HARDENED");
		var_01 = 1;
	}

	if(lib_A526::func_40EB() >= 100 || lib_A526::func_40EF() >= 100 || var_01)
	{
		lib_A59A::func_41DA("CAMPAIGN_COMPLETE");
	}
}

//Function Number: 33
lib_A526::func_85BC(param_00)
{
	if(!isdefined(self.var_56E2[param_00].var_85BC))
	{
		return 0;
	}

	return self.var_56E2[param_00].var_85BC;
}

//Function Number: 34
lib_A526::func_3FC0()
{
	return self.var_46C9;
}

//Function Number: 35
lib_A526::func_4737()
{
	if(isdefined(self.var_46C9))
	{
		return 1;
	}

	return 0;
}

//Function Number: 36
lib_A526::func_403C()
{
	for(var_00 = 0;var_00 < self.var_56E2.size;var_00++)
	{
		if(!lib_A526::func_4000(var_00))
		{
			return var_00;
		}
	}

	return 0;
}

//Function Number: 37
lib_A526::func_3986()
{
	var_00 = level.var_31D getplayerprofiledata("missionHighestDifficulty");
	var_01 = "";
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		if(var_02 < 20)
		{
			var_01 = var_01 + 2;
			continue;
		}

		var_01 = var_01 + 0;
	}

	level.var_31D setplayerprofiledata("missionHighestDifficulty",var_01);
	level.var_31D setplayerprofiledata("highestMission",20);
}

//Function Number: 38
lib_A526::func_1EE2()
{
	level.var_31D setplayerprofiledata("missionHighestDifficulty","00000000000000000000000000000000000000000000000000");
	level.var_31D setplayerprofiledata("highestMission",1);
}

//Function Number: 39
lib_A526::func_2452()
{
	function_0053("airplane",0);
}

//Function Number: 40
lib_A526::func_3138(param_00)
{
	if(!isdefined(param_00) || param_00 == 0)
	{
		return;
	}

	lib_A5DE::snd_message("finish_mission_fade",param_00);
	var_01 = lib_A53C::func_23A2("black",0,level.var_31D);
	var_01.fontscale = 100;
	var_01 fadeovertime(param_00);
	var_01.alpha = 1;
	wait(param_00);
}