/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42376.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 85
 * Decompile Time: 4 ms
 * Timestamp: 4/20/2022 8:23:24 PM
*******************************************************************/

//Function Number: 1
lib_A588::func_8DAF()
{
	lib_A588::func_8DEE();
	if(isplayer(self))
	{
		return;
	}

	switch(self.inliveplayerkillstreak)
	{
		case "team3":
		case "axis":
			break;

		case "allies":
			break;
	}
}

//Function Number: 2
lib_A588::func_8DFB(param_00,param_01)
{
	level.var_8DB0[param_00] = param_01;
}

//Function Number: 3
lib_A588::func_8DEE(param_00)
{
	if(isplayer(self))
	{
		lib_A58A::func_8E0F();
		return;
	}

	if(!isdefined(self.var_669) || !isdefined(self.var_669.var_6DF3.var_131B))
	{
		switch(self.inliveplayerkillstreak)
		{
			case "allies":
				break;

			case "team3":
			case "axis":
				break;
		}
	}
}

//Function Number: 4
lib_A588::func_8D8E(param_00)
{
	switch(self.inliveplayerkillstreak)
	{
		case "allies":
			break;

		case "team3":
		case "axis":
			break;
	}
}

//Function Number: 5
lib_A588::func_8D8F()
{
	switch(self.inliveplayerkillstreak)
	{
		case "allies":
			break;

		case "team3":
		case "axis":
			break;
	}
}

//Function Number: 6
lib_A588::func_8DF8(param_00)
{
	lib_A589::func_31DF(param_00);
}

//Function Number: 7
lib_A588::func_8DF9()
{
	lib_A589::func_31D9();
}

//Function Number: 8
lib_A588::func_8DF7(param_00)
{
	if(!isdefined(self.var_669.var_6DF3.var_9310))
	{
		lib_A587::func_8E0C();
	}

	if(isdefined(param_00))
	{
		lib_A588::func_8E0B(param_00);
	}
}

//Function Number: 9
lib_A588::func_8DC2()
{
	self.var_7ADC = 0;
}

//Function Number: 10
lib_A588::func_8DB4()
{
	self.var_7ADC = 1;
}

//Function Number: 11
lib_A588::func_8E08(param_00,param_01)
{
	if(isdefined(param_00))
	{
		lib_A587::func_3274(param_00);
	}

	if(isdefined(param_01))
	{
		lib_A587::func_3273(param_01);
	}
}

//Function Number: 12
lib_A588::func_8E0B(param_00,param_01)
{
	var_02 = "threat";
	var_03 = "warning";
	var_04 = 1;
	var_05 = var_03 + var_04;
	if(isdefined(param_00))
	{
		while(isdefined(self.var_669.var_13A2.var_8E6[var_02][var_05]))
		{
			if(!isdefined(param_00[var_05]))
			{
				param_00[var_05] = lib_A585::func_8E9(var_02,var_05);
			}

			var_04++;
			var_05 = var_03 + var_04;
		}
	}

	lib_A588::func_8E08(param_00,param_01);
}

//Function Number: 13
lib_A588::func_8E0A()
{
	var_00 = [];
	lib_A588::func_8E08(var_00);
}

//Function Number: 14
lib_A588::func_8E09()
{
	lib_A587::func_321F();
	lib_A587::func_321E();
}

//Function Number: 15
lib_A588::func_8D8A(param_00)
{
	level.var_669.var_5833.var_5C1D = param_00;
}

//Function Number: 16
lib_A588::func_8DEF(param_00)
{
	if(!isdefined(self.var_669.var_6DF3.var_222C))
	{
		lib_A580::func_8DA0();
	}

	if(isdefined(param_00))
	{
		lib_A588::func_8D99(param_00);
	}
}

//Function Number: 17
lib_A588::func_8D99(param_00)
{
	lib_A580::func_3216(param_00);
}

//Function Number: 18
lib_A588::func_8D9A()
{
	lib_A580::func_321C();
}

//Function Number: 19
lib_A588::func_8DA2()
{
	lib_A581::func_8D9E();
}

//Function Number: 20
lib_A588::func_8DA1(param_00)
{
	lib_A581::func_8DAA(param_00);
}

//Function Number: 21
lib_A588::func_8DA7()
{
	lib_A581::func_8D9F();
}

//Function Number: 22
lib_A588::func_8DA6(param_00)
{
	lib_A581::func_8DAB(param_00);
}

//Function Number: 23
lib_A588::func_8D9B(param_00)
{
	lib_A581::func_8DA8(param_00);
}

//Function Number: 24
lib_A588::func_8DA5()
{
	lib_A581::func_8D9C();
}

//Function Number: 25
lib_A588::func_8DF0(param_00,param_01)
{
	lib_A588::func_8DF5();
	lib_A584::func_8DCD(param_01);
	if(isdefined(param_00))
	{
		foreach(var_04, var_03 in param_00)
		{
			lib_A584::func_8DCC(var_04,var_03);
		}
	}
}

//Function Number: 26
lib_A588::func_8DF5()
{
	if(!isdefined(self.var_669.var_6DF3.var_33BE))
	{
		lib_A584::func_8DC9();
	}
}

//Function Number: 27
lib_A588::func_8DF4(param_00,param_01)
{
	lib_A588::func_8DF5();
	lib_A584::func_8DCC("heard_scream",param_00,param_01);
}

//Function Number: 28
lib_A588::func_8DF3(param_00,param_01)
{
	lib_A588::func_8DF5();
	lib_A584::func_8DCC("doFlashBanged",param_00,param_01);
}

//Function Number: 29
lib_A588::func_8DF2(param_00,param_01)
{
	lib_A588::func_8DF5();
	lib_A584::func_8DCC("explode",param_00,param_01);
}

//Function Number: 30
lib_A588::func_8DF1(param_00,param_01,param_02,param_03)
{
	lib_A588::func_8DF5();
	lib_A584::func_8DCC(param_00,param_01,param_02,param_03);
}

//Function Number: 31
lib_A588::func_8DED(param_00)
{
	if(!isdefined(self.var_669.var_6DF3.var_2041))
	{
		lib_A57F::func_8D96();
	}

	if(isdefined(param_00))
	{
		lib_A588::func_8D97(param_00);
	}
}

//Function Number: 32
lib_A588::func_8D97(param_00)
{
	lib_A57F::func_3A4E(param_00);
}

//Function Number: 33
lib_A588::func_8D98()
{
	lib_A57F::func_3A51();
}

//Function Number: 34
lib_A588::func_8DEC(param_00)
{
	if(!isdefined(self.var_669.var_6DF3.var_6D2))
	{
		lib_A579::func_8D7C();
	}

	if(isdefined(param_00))
	{
		lib_A588::func_8D7D(param_00);
	}
}

//Function Number: 35
lib_A588::func_8D7D(param_00)
{
	lib_A579::func_3A4D(param_00);
}

//Function Number: 36
lib_A588::func_8D7E()
{
	lib_A579::func_3A50();
}

//Function Number: 37
lib_A588::func_8DF6()
{
	lib_A586::func_8E03();
}

//Function Number: 38
lib_A588::func_30F3()
{
	lib_A59A::func_32DD("_stealth_stance_handler");
}

//Function Number: 39
lib_A588::func_2AD6()
{
	lib_A59A::func_32D9("_stealth_stance_handler");
}

//Function Number: 40
lib_A588::func_8DC6()
{
	waittillframeend;
	lib_A59A::func_32E3("_stealth_normal");
}

//Function Number: 41
lib_A588::func_8DE8()
{
	var_00 = level.var_669.var_4417.var_443B;
	foreach(var_07, var_02 in var_00)
	{
		var_03 = lib_A585::func_4422(var_07);
		foreach(var_05 in var_03)
		{
			if(!var_05 lib_A59A::func_32D7("_stealth_normal"))
			{
				return 0;
			}
		}
	}

	return 1;
}

//Function Number: 42
lib_A588::func_8DC4()
{
	lib_A588::func_8DC6();
	waittillframeend;
	self notify("stealth_enemy_endon_alert");
}

//Function Number: 43
lib_A588::func_8DCA(param_00,param_01)
{
	thread lib_A585::func_33C4(param_00,param_01);
}

//Function Number: 44
lib_A588::func_8DB3(param_00,param_01)
{
	lib_A58B::func_908C(param_00,param_01);
}

//Function Number: 45
lib_A588::func_8DB2()
{
	lib_A58B::func_9084();
}

//Function Number: 46
lib_A588::func_8DA3(param_00)
{
	lib_A581::func_8DA9(param_00);
}

//Function Number: 47
lib_A588::func_8DA4()
{
	lib_A581::func_8D9D();
}

//Function Number: 48
lib_A588::func_8D81(param_00)
{
	var_01 = level.var_669.var_5833.var_29A0;
	lib_A58B::func_908D(param_00);
	lib_A58B::func_9086(var_01);
}

//Function Number: 49
lib_A588::func_8D82()
{
	var_00 = level.var_669.var_5833.var_29A0;
	lib_A58B::func_9085();
	lib_A58B::func_9086(var_00);
}

//Function Number: 50
lib_A588::func_8DD3(param_00,param_01)
{
	lib_A58A::func_3A7B(param_00,param_01);
}

//Function Number: 51
lib_A588::func_8DD2()
{
	lib_A58A::func_3A52();
}

//Function Number: 52
lib_A588::func_8DD5(param_00,param_01,param_02)
{
	lib_A586::func_3A7C(param_00,param_01,param_02);
}

//Function Number: 53
lib_A588::func_8DD4()
{
	lib_A586::func_3A53();
}

//Function Number: 54
lib_A588::func_8D7F(param_00)
{
	lib_A585::func_8C7(param_00);
}

//Function Number: 55
lib_A588::func_8D80()
{
	lib_A585::func_8C6();
}

//Function Number: 56
lib_A588::func_8D83(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_04))
	{
	}

	param_00 lib_A588::func_8DE7();
	var_05 = param_00 lib_A585::func_4423("_stealth_spotted");
	if(common_scripts\utility::flag(var_05))
	{
		return;
	}

	var_06 = "stop_loop";
	param_00.var_31 = 1;
	if(!isdefined(param_04))
	{
		thread lib_A506::func_BCB(param_00,"gravity",param_01,param_03);
	}
	else
	{
		thread lib_A506::func_BCE(param_00,param_01,param_03);
	}

	param_00 lib_A585::func_910(self,param_02,param_03,var_06);
	lib_A59A::func_7BE(::lib_A59A::func_A090,"stop_idle_proc");
	lib_A59A::func_75F(::lib_A588::func_8D7F);
	thread lib_A588::func_2BDE();
}

//Function Number: 57
lib_A588::func_2BDE()
{
	self endon("death");
	lib_A59A::func_2BDB();
}

//Function Number: 58
lib_A588::func_8D89(param_00,param_01,param_02)
{
	param_00 lib_A588::func_8DE7();
	param_00 lib_A585::func_910(self,param_01,param_02,"stop_loop");
}

//Function Number: 59
lib_A588::func_8D87(param_00,param_01,param_02,param_03,param_04)
{
	param_00 lib_A588::func_8DE7();
	thread lib_A588::func_8D88(param_00,param_01,param_02,param_03,param_04);
}

//Function Number: 60
lib_A588::func_8D88(param_00,param_01,param_02,param_03,param_04)
{
	param_00 lib_A588::func_8DE7();
	param_00 thread lib_A588::func_8DC4();
	param_00 endon("stealth_enemy_endon_alert");
	param_00 endon("death");
	lib_A506::func_BD0(param_00,param_01,param_04);
	lib_A588::func_8D83(param_00,param_02,param_03,param_04);
}

//Function Number: 61
lib_A588::func_8D85(param_00,param_01,param_02,param_03,param_04)
{
	param_00 lib_A588::func_8DE7();
	thread lib_A588::func_8D86(param_00,param_01,param_02,param_03,param_04);
}

//Function Number: 62
lib_A588::func_8D86(param_00,param_01,param_02,param_03,param_04)
{
	param_00 lib_A588::func_8DE7();
	param_00 thread lib_A588::func_8DC4();
	param_00 endon("stealth_enemy_endon_alert");
	param_00 endon("death");
	lib_A506::func_BD1(param_00,param_01,param_04);
	lib_A588::func_8D83(param_00,param_02,param_03,param_04);
}

//Function Number: 63
lib_A588::func_8DE7()
{
}

//Function Number: 64
lib_A588::func_8DE1()
{
	return lib_A585::func_442F("_stealth_spotted");
}

//Function Number: 65
lib_A588::func_8DE0()
{
	return lib_A585::func_442F("_stealth_event");
}

//Function Number: 66
lib_A588::func_8DDF()
{
	return lib_A585::func_442F("_stealth_found_corpse");
}

//Function Number: 67
lib_A588::func_8DDE()
{
	return lib_A585::func_442E("_stealth_spotted");
}

//Function Number: 68
lib_A588::func_8DDD()
{
	return lib_A585::func_442E("_stealth_event");
}

//Function Number: 69
lib_A588::func_8DDC()
{
	return lib_A585::func_442E("_stealth_found_corpse");
}

//Function Number: 70
lib_A588::func_8DE2()
{
	var_00 = lib_A585::func_4423("_stealth_spotted");
	return common_scripts\utility::flag(var_00);
}

//Function Number: 71
lib_A588::func_8DD9()
{
	var_00 = lib_A585::func_4423("_stealth_found_corpse");
	return common_scripts\utility::flag(var_00);
}

//Function Number: 72
lib_A588::func_8DE3()
{
	var_00 = lib_A585::func_4423("_stealth_spotted");
	common_scripts\utility::flag_wait(var_00);
}

//Function Number: 73
lib_A588::func_8DDA()
{
	var_00 = lib_A585::func_4423("_stealth_found_corpse");
	common_scripts\utility::flag_wait(var_00);
}

//Function Number: 74
lib_A588::func_8DE4()
{
	var_00 = lib_A585::func_4423("_stealth_spotted");
	return common_scripts\utility::flag_waitopen(var_00);
}

//Function Number: 75
lib_A588::func_8DDB()
{
	var_00 = lib_A585::func_4423("_stealth_found_corpse");
	return common_scripts\utility::flag_waitopen(var_00);
}

//Function Number: 76
lib_A588::func_8DD8()
{
	return lib_A585::func_4423("_stealth_spotted");
}

//Function Number: 77
lib_A588::func_8DD7()
{
	return lib_A585::func_4423("_stealth_found_corpse");
}

//Function Number: 78
lib_A588::func_8DFC(param_00)
{
	lib_A588::func_8DFE(param_00);
}

//Function Number: 79
lib_A588::func_8DFD()
{
	lib_A588::func_8DFE("default");
}

//Function Number: 80
lib_A588::func_8DFE(param_00)
{
	if(isdefined(self.var_7ADE))
	{
		level.var_669.var_4417.var_443B[self.var_7ADE] = common_scripts\utility::array_remove(level.var_669.var_4417.var_443B[self.var_7ADE],self);
	}

	self.var_7ADE = lib_A59A::func_8F4D(param_00);
	if(isdefined(self.var_669.var_6DF3.var_131B))
	{
		lib_A585::func_441F("_stealth_spotted");
		lib_A585::func_441F("_stealth_event");
		lib_A585::func_441F("_stealth_found_corpse");
		lib_A585::func_4418();
	}
}

//Function Number: 81
lib_A588::func_8DD6()
{
	return self.var_7ADE;
}

//Function Number: 82
lib_A588::func_30F4()
{
	common_scripts\utility::flag_set("_stealth_enabled");
	var_00 = function_00D7("all","all");
	foreach(var_02 in var_00)
	{
		var_02 lib_A588::func_30F2();
	}

	foreach(var_05 in level.var_328)
	{
		if(var_05 lib_A59A::func_32DB("_stealth_enabled"))
		{
			var_05 lib_A59A::func_32DD("_stealth_enabled");
		}

		var_05 lib_A58A::func_3A8B();
	}

	lib_A58B::func_9086("hidden");
}

//Function Number: 83
lib_A588::func_2AD7()
{
	common_scripts\utility::flag_clear("_stealth_enabled");
	var_00 = function_00D7("all","all");
	foreach(var_02 in var_00)
	{
		var_02 lib_A588::func_2AD5();
	}

	foreach(var_05 in level.var_328)
	{
		var_05.var_279 = 8192;
		if(var_05 lib_A59A::func_32DB("_stealth_enabled"))
		{
			var_05 lib_A59A::func_32D9("_stealth_enabled");
		}
	}

	lib_A58B::func_9086("spotted");
}

//Function Number: 84
lib_A588::func_30F2()
{
	if(lib_A59A::func_32DB("_stealth_enabled"))
	{
		lib_A59A::func_32DD("_stealth_enabled");
	}

	if(self.inliveplayerkillstreak == "allies")
	{
		thread lib_A58A::func_3A8B();
	}
}

//Function Number: 85
lib_A588::func_2AD5()
{
	if(lib_A59A::func_32DB("_stealth_enabled"))
	{
		lib_A59A::func_32D9("_stealth_enabled");
	}

	self.var_279 = 8192;
}