/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42394.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 857
 * Decompile Time: 271 ms
 * Timestamp: 4/20/2022 8:23:26 PM
*******************************************************************/

//Function Number: 1
lib_A59A::func_7E55(param_00,param_01)
{
	var_02 = undefined;
	param_00 = tolower(param_00);
	var_03["friendly"] = 3;
	var_03["enemy"] = 4;
	var_03["objective"] = 5;
	var_03["neutral"] = 0;
	var_02 = var_03[param_00];
	self hudoutlineenable(var_02,param_01);
}

//Function Number: 2
lib_A59A::func_5009()
{
	if(issplitscreen() || getdvar("coop") == "1")
	{
		return 1;
	}

	return 0;
}

//Function Number: 3
lib_A59A::func_500A()
{
	if(issplitscreen())
	{
		return 0;
	}

	if(!lib_A59A::func_5009())
	{
		return 0;
	}

	return 1;
}

//Function Number: 4
lib_A59A::func_505F(param_00)
{
	if(param_00 lib_A59A::func_32DB("laststand_downed"))
	{
		return param_00 lib_A59A::func_32D7("laststand_downed");
	}

	if(isdefined(param_00.laststand))
	{
		return param_00.laststand;
	}

	return !isalive(param_00);
}

//Function Number: 5
lib_A59A::func_5060(param_00)
{
	if(!isdefined(param_00.var_2D90))
	{
		return 0;
	}

	return param_00.var_2D90;
}

//Function Number: 6
lib_A59A::func_5369(param_00)
{
	if(lib_A59A::func_55DE())
	{
		if(isdefined(level.var_55DF))
		{
			return param_00 [[ level.var_55DF ]]();
		}
	}

	return 0;
}

//Function Number: 7
lib_A59A::func_5084()
{
	return lib_A59A::func_5080() && getdvarint("so_survival") > 0;
}

//Function Number: 8
lib_A59A::func_55DE()
{
	return isdefined(level.var_55E1) && level.var_55E1 > 0;
}

//Function Number: 9
lib_A59A::func_5080()
{
	return getdvarint("specialops") >= 1;
}

//Function Number: 10
lib_A59A::func_21A3(param_00,param_01)
{
	var_02 = "";
	if(param_00 < 0)
	{
		var_02 = var_02 + "-";
	}

	param_00 = lib_A59A::func_760F(param_00,1,0);
	var_03 = param_00 * 100;
	var_03 = int(var_03);
	var_03 = abs(var_03);
	var_04 = var_03 / 6000;
	var_04 = int(var_04);
	var_02 = var_02 + var_04;
	var_05 = var_03 / 100;
	var_05 = int(var_05);
	var_05 = var_05 - var_04 * 60;
	if(var_05 < 10)
	{
		var_02 = var_02 + ":0" + var_05;
	}
	else
	{
		var_02 = var_02 + ":" + var_05;
	}

	if(isdefined(param_01) && param_01)
	{
		var_06 = var_03;
		var_06 = var_06 - var_04 * 6000;
		var_06 = var_06 - var_05 * 100;
		var_06 = int(var_06 / 10);
		var_02 = var_02 + "." + var_06;
	}

	return var_02;
}

//Function Number: 11
lib_A59A::func_760F(param_00,param_01,param_02)
{
	param_01 = int(param_01);
	if(param_01 < 0 || param_01 > 4)
	{
		return param_00;
	}

	var_03 = 1;
	for(var_04 = 1;var_04 <= param_01;var_04++)
	{
		var_03 = var_03 * 10;
	}

	var_05 = param_00 * var_03;
	if(!isdefined(param_02) || param_02)
	{
		var_05 = floor(var_05);
	}
	else
	{
		var_05 = ceil(var_05);
	}

	param_00 = var_05 / var_03;
	return param_00;
}

//Function Number: 12
lib_A59A::func_7610(param_00,param_01,param_02)
{
	var_03 = param_00 / 1000;
	var_03 = lib_A59A::func_760F(var_03,param_01,param_02);
	param_00 = var_03 * 1000;
	return int(param_00);
}

//Function Number: 13
lib_A59A::func_7EFA(param_00,param_01)
{
	if(lib_A59B::func_4D71(param_00))
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	visionsetnaked(param_00,param_01);
	setdvar("vision_set_current",param_00);
}

//Function Number: 14
lib_A59A::func_7EFB(param_00,param_01)
{
	if(lib_A59B::func_4D71(param_00))
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	self visionsetnakedforplayer(param_00,param_01);
}

//Function Number: 15
lib_A59A::func_8FB0(param_00,param_01,param_02)
{
	param_02 = int(param_02 * 20);
	var_03 = [];
	for(var_04 = 0;var_04 < 3;var_04++)
	{
		var_03[var_04] = param_00[var_04] - param_01[var_04] / param_02;
	}

	var_05 = [];
	for(var_04 = 0;var_04 < param_02;var_04++)
	{
		wait(0.05);
		for(var_06 = 0;var_06 < 3;var_06++)
		{
			var_05[var_06] = param_00[var_06] - var_03[var_06] * var_04;
		}

		setsunlight(var_05[0],var_05[1],var_05[2]);
	}

	setsunlight(param_01[0],param_01[1],param_01[2]);
}

//Function Number: 16
lib_A59A::func_32DF(param_00)
{
	while(isdefined(self) && !self.var_32D7[param_00])
	{
		self waittill(param_00);
	}
}

//Function Number: 17
lib_A59A::func_32E2(param_00)
{
	while(isdefined(self) && !self.var_32D7[param_00])
	{
		self waittill(param_00);
	}
}

//Function Number: 18
lib_A59A::func_32E0(param_00,param_01)
{
	while(isdefined(self))
	{
		if(lib_A59A::func_32D7(param_00))
		{
			return;
		}

		if(lib_A59A::func_32D7(param_01))
		{
			return;
		}

		common_scripts\utility::waittill_either(param_00,param_01);
	}
}

//Function Number: 19
lib_A59A::func_32E1(param_00,param_01)
{
	var_02 = gettime();
	while(isdefined(self))
	{
		if(self.var_32D7[param_00])
		{
			break;
		}

		if(gettime() >= var_02 + param_01 * 1000)
		{
			break;
		}

		lib_A59B::func_32EC(param_00,param_01);
	}
}

//Function Number: 20
lib_A59A::func_32E3(param_00)
{
	while(isdefined(self) && self.var_32D7[param_00])
	{
		self waittill(param_00);
	}
}

//Function Number: 21
lib_A59A::func_32D8(param_00)
{
}

//Function Number: 22
lib_A59A::func_32E4(param_00,param_01)
{
	while(isdefined(self))
	{
		if(!lib_A59A::func_32D7(param_00))
		{
			return;
		}

		if(!lib_A59A::func_32D7(param_01))
		{
			return;
		}

		common_scripts\utility::waittill_either(param_00,param_01);
	}
}

//Function Number: 23
lib_A59A::func_32DC(param_00)
{
	if(!isdefined(self.var_32D7))
	{
		self.var_32D7 = [];
		self.var_32E5 = [];
	}

	self.var_32D7[param_00] = 0;
}

//Function Number: 24
lib_A59A::func_32DB(param_00)
{
	if(isdefined(self.var_32D7) && isdefined(self.var_32D7[param_00]))
	{
		return 1;
	}

	return 0;
}

//Function Number: 25
lib_A59A::func_32DE(param_00,param_01)
{
	self endon("death");
	wait(param_01);
	lib_A59A::func_32DD(param_00);
}

//Function Number: 26
lib_A59A::func_32DD(param_00)
{
	self.var_32D7[param_00] = 1;
	self notify(param_00);
}

//Function Number: 27
lib_A59A::func_32D9(param_00,param_01)
{
	if(self.var_32D7[param_00])
	{
		self.var_32D7[param_00] = 0;
		self notify(param_00);
	}

	if(isdefined(param_01) && param_01)
	{
		self.var_32D7[param_00] = undefined;
	}
}

//Function Number: 28
lib_A59A::func_32DA(param_00,param_01)
{
	wait(param_01);
	lib_A59A::func_32D9(param_00);
}

//Function Number: 29
lib_A59A::func_32D7(param_00)
{
	return self.var_32D7[param_00];
}

//Function Number: 30
lib_A59A::func_3D04(param_00,param_01,param_02,param_03)
{
	if(!param_00.size)
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = level.var_31D;
	}

	if(!isdefined(param_03))
	{
		param_03 = -1;
	}

	var_04 = param_01.var_2E6;
	if(isdefined(param_02) && param_02)
	{
		var_04 = param_01 geteye();
	}

	var_05 = undefined;
	var_06 = param_01 getplayerangles();
	var_07 = anglestoforward(var_06);
	var_08 = -1;
	foreach(var_0A in param_00)
	{
		var_0B = vectortoangles(var_0A.var_2E6 - var_04);
		var_0C = anglestoforward(var_0B);
		var_0D = vectordot(var_07,var_0C);
		if(var_0D < var_08)
		{
			continue;
		}

		if(var_0D < param_03)
		{
			continue;
		}

		var_08 = var_0D;
		var_05 = var_0A;
	}

	return var_05;
}

//Function Number: 31
lib_A59A::func_3CF7(param_00,param_01,param_02)
{
	if(!param_00.size)
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = level.var_31D;
	}

	var_03 = param_01.var_2E6;
	if(isdefined(param_02) && param_02)
	{
		var_03 = param_01 geteye();
	}

	var_04 = undefined;
	var_05 = param_01 getplayerangles();
	var_06 = anglestoforward(var_05);
	var_07 = -1;
	for(var_08 = 0;var_08 < param_00.size;var_08++)
	{
		var_09 = vectortoangles(param_00[var_08].var_2E6 - var_03);
		var_0A = anglestoforward(var_09);
		var_0B = vectordot(var_06,var_0A);
		if(var_0B < var_07)
		{
			continue;
		}

		var_07 = var_0B;
		var_04 = var_08;
	}

	return var_04;
}

//Function Number: 32
lib_A59A::func_3845(param_00,param_01,param_02)
{
	common_scripts\utility::flag_init(param_00);
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	param_01 thread lib_A59B::func_5AE(param_00,param_02);
	return param_01;
}

//Function Number: 33
lib_A59A::func_3846(param_00,param_01,param_02)
{
	common_scripts\utility::flag_init(param_00);
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	for(var_03 = 0;var_03 < param_01.size;var_03++)
	{
		param_01[var_03] thread lib_A59B::func_5AE(param_00,0);
	}

	return param_01;
}

//Function Number: 34
lib_A59A::func_383E(param_00,param_01)
{
	wait(param_01);
	common_scripts\utility::flag_set(param_00);
}

//Function Number: 35
lib_A59A::func_3830(param_00,param_01)
{
	wait(param_01);
	common_scripts\utility::flag_clear(param_00);
}

//Function Number: 36
lib_A59A::func_56BD()
{
	if(lib_A59A::func_0CC3())
	{
		return;
	}

	if(level.var_5CDB)
	{
		return;
	}

	if(common_scripts\utility::flag("game_saving"))
	{
		return;
	}

	for(var_00 = 0;var_00 < level.var_328.size;var_00++)
	{
		var_01 = level.var_328[var_00];
		if(!isalive(var_01))
		{
			return;
		}
	}

	common_scripts\utility::flag_set("game_saving");
	var_02 = "levelshots / autosave / autosave_" + level.script + "end";
	function_0083("levelend",&"AUTOSAVE_AUTOSAVE",var_02,1,1);
	common_scripts\utility::flag_clear("game_saving");
}

//Function Number: 37
lib_A59A::func_075D(param_00,param_01,param_02)
{
	level.var_5A7[param_00] = [];
	level.var_5A7[param_00]["func"] = param_01;
	level.var_5A7[param_00]["msg"] = param_02;
}

//Function Number: 38
lib_A59A::func_7346(param_00)
{
	level.var_5A7[param_00] = undefined;
}

//Function Number: 39
lib_A59A::func_1154()
{
	thread lib_A59A::func_1145("autosave_stealth",8,1);
}

//Function Number: 40
lib_A59A::func_1156()
{
	thread lib_A59A::func_1145("autosave_stealth",8,1,1);
}

//Function Number: 41
lib_A59A::func_1158()
{
	lib_A59B::func_115D();
	thread lib_A59B::func_115C();
}

//Function Number: 42
lib_A59A::func_1143(param_00)
{
	thread lib_A59A::func_1145(param_00);
}

//Function Number: 43
lib_A59A::func_1144(param_00)
{
	thread lib_A59A::func_1145(param_00,undefined,undefined,1);
}

//Function Number: 44
lib_A59A::func_1145(param_00,param_01,param_02,param_03)
{
	if(!isdefined(level.var_24C2))
	{
		level.var_24C2 = 1;
	}

	var_04 = "levelshots/autosave/autosave_" + level.script + level.var_24C2;
	var_05 = level lib_A50A::func_988E(level.var_24C2,"autosave",var_04,param_01,param_02,param_03);
	if(isdefined(var_05) && var_05)
	{
		level.var_24C2++;
	}
}

//Function Number: 45
lib_A59A::func_1151(param_00,param_01)
{
	thread lib_A59A::func_1145(param_00,param_01);
}

//Function Number: 46
lib_A59A::func_26AC(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 5;
	}

	if(isdefined(param_03))
	{
		param_03 endon("death");
		param_01 = param_03.var_2E6;
	}

	for(var_04 = 0;var_04 < param_02 * 20;var_04++)
	{
		if(!isdefined(param_03))
		{
		}
		else
		{
		}

		wait(0.05);
	}
}

//Function Number: 47
lib_A59A::func_26AD(param_00,param_01)
{
	self notify("debug_message_ai");
	self endon("debug_message_ai");
	self endon("death");
	if(!isdefined(param_01))
	{
		param_01 = 5;
	}

	for(var_02 = 0;var_02 < param_01 * 20;var_02++)
	{
		wait(0.05);
	}
}

//Function Number: 48
lib_A59A::func_26AE(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_03))
	{
		level notify(param_00 + param_03);
		level endon(param_00 + param_03);
	}
	else
	{
		level notify(param_00);
		level endon(param_00);
	}

	if(!isdefined(param_02))
	{
		param_02 = 5;
	}

	for(var_04 = 0;var_04 < param_02 * 20;var_04++)
	{
		wait(0.05);
	}
}

//Function Number: 49
lib_A59A::precache(param_00)
{
	var_01 = spawn("script_model",(0,0,0));
	var_01.var_2E6 = level.var_31D getorigin();
	var_01 setmodel(param_00);
	var_01 delete();
}

//Function Number: 50
lib_A59A::func_1FDF(param_00,param_01)
{
	return param_00 >= param_01;
}

//Function Number: 51
lib_A59A::func_366E(param_00,param_01)
{
	return param_00 <= param_01;
}

//Function Number: 52
lib_A59A::func_3F37(param_00,param_01,param_02)
{
	return lib_A59B::func_20CB(param_00,param_01,param_02,::lib_A59A::func_1FDF);
}

//Function Number: 53
lib_A59A::func_3CFE(param_00,param_01,param_02)
{
	var_03 = param_01[0];
	var_04 = distance(param_00,var_03);
	for(var_05 = 0;var_05 < param_01.size;var_05++)
	{
		var_06 = distance(param_00,param_01[var_05]);
		if(var_06 >= var_04)
		{
			continue;
		}

		var_04 = var_06;
		var_03 = param_01[var_05];
	}

	if(!isdefined(param_02) || var_04 <= param_02)
	{
		return var_03;
	}

	return undefined;
}

//Function Number: 54
lib_A59A::func_3D67(param_00,param_01)
{
	if(param_01.size < 1)
	{
		return;
	}

	var_02 = distance(param_01[0] getorigin(),param_00);
	var_03 = param_01[0];
	for(var_04 = 0;var_04 < param_01.size;var_04++)
	{
		var_05 = distance(param_01[var_04] getorigin(),param_00);
		if(var_05 < var_02)
		{
			continue;
		}

		var_02 = var_05;
		var_03 = param_01[var_04];
	}

	return var_03;
}

//Function Number: 55
lib_A59A::func_3ECD(param_00,param_01,param_02)
{
	var_03 = [];
	for(var_04 = 0;var_04 < param_01.size;var_04++)
	{
		if(distance(param_01[var_04].var_2E6,param_00) <= param_02)
		{
			var_03[var_03.size] = param_01[var_04];
		}
	}

	return var_03;
}

//Function Number: 56
lib_A59A::func_3E10(param_00,param_01,param_02)
{
	var_03 = [];
	for(var_04 = 0;var_04 < param_01.size;var_04++)
	{
		if(distance(param_01[var_04].var_2E6,param_00) > param_02)
		{
			var_03[var_03.size] = param_01[var_04];
		}
	}

	return var_03;
}

//Function Number: 57
lib_A59A::func_3CF8(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 9999999;
	}

	if(param_01.size < 1)
	{
		return;
	}

	var_03 = undefined;
	for(var_04 = 0;var_04 < param_01.size;var_04++)
	{
		if(!isalive(param_01[var_04]))
		{
			continue;
		}

		var_05 = distance(param_01[var_04].var_2E6,param_00);
		if(var_05 >= param_02)
		{
			continue;
		}

		param_02 = var_05;
		var_03 = param_01[var_04];
	}

	return var_03;
}

//Function Number: 58
lib_A59A::func_3D93(param_00,param_01,param_02)
{
	if(!param_02.size)
	{
		return;
	}

	var_03 = undefined;
	var_04 = vectortoangles(param_01 - param_00);
	var_05 = anglestoforward(var_04);
	var_06 = -1;
	foreach(var_08 in param_02)
	{
		var_04 = vectortoangles(var_08.var_2E6 - param_00);
		var_09 = anglestoforward(var_04);
		var_0A = vectordot(var_05,var_09);
		if(var_0A < var_06)
		{
			continue;
		}

		var_06 = var_0A;
		var_03 = var_08;
	}

	return var_03;
}

//Function Number: 59
lib_A59A::func_3CF6(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 9999999;
	}

	if(param_01.size < 1)
	{
		return;
	}

	var_03 = undefined;
	foreach(var_07, var_05 in param_01)
	{
		var_06 = distance(var_05.var_2E6,param_00);
		if(var_06 >= param_02)
		{
			continue;
		}

		param_02 = var_06;
		var_03 = var_07;
	}

	return var_03;
}

//Function Number: 60
lib_A59A::func_3CF4(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		return undefined;
	}

	var_03 = 0;
	if(isdefined(param_02) && param_02.size)
	{
		var_04 = [];
		for(var_05 = 0;var_05 < param_01.size;var_05++)
		{
			var_04[var_05] = 0;
		}

		for(var_05 = 0;var_05 < param_01.size;var_05++)
		{
			for(var_06 = 0;var_06 < param_02.size;var_06++)
			{
				if(param_01[var_05] == param_02[var_06])
				{
					var_04[var_05] = 1;
				}
			}
		}

		var_07 = 0;
		for(var_05 = 0;var_05 < param_01.size;var_05++)
		{
			if(!var_04[var_05] && isdefined(param_01[var_05]))
			{
				var_07 = 1;
				var_03 = distance(param_00,param_01[var_05].var_2E6);
				var_08 = var_05;
				var_05 = param_01.size + 1;
			}
		}

		if(!var_07)
		{
			return undefined;
		}
	}
	else
	{
		for(var_05 = 0;var_05 < param_01.size;var_05++)
		{
			if(isdefined(param_01[var_05]))
			{
				var_03 = distance(param_00,param_01[0].var_2E6);
				var_08 = var_05;
				var_05 = param_01.size + 1;
			}
		}
	}

	var_08 = undefined;
	for(var_05 = 0;var_05 < param_01.size;var_05++)
	{
		if(isdefined(param_01[var_05]))
		{
			var_04 = 0;
			if(isdefined(param_02))
			{
				for(var_06 = 0;var_06 < param_02.size;var_06++)
				{
					if(param_01[var_05] == param_02[var_06])
					{
						var_04 = 1;
					}
				}
			}

			if(!var_04)
			{
				var_09 = distance(param_00,param_01[var_05].var_2E6);
				if(var_09 <= var_03)
				{
					var_03 = var_09;
					var_08 = var_05;
				}
			}
		}
	}

	if(isdefined(var_08))
	{
		return param_01[var_08];
	}

	return undefined;
}

//Function Number: 61
lib_A59A::func_3CFC(param_00)
{
	if(level.var_328.size == 1)
	{
		return level.var_31D;
	}

	var_01 = common_scripts\utility::getclosest(param_00,level.var_328);
	return var_01;
}

//Function Number: 62
lib_A59A::func_3CFD(param_00)
{
	if(level.var_328.size == 1)
	{
		return level.var_31D;
	}

	var_01 = lib_A59A::func_3E31();
	var_02 = common_scripts\utility::getclosest(param_00,var_01);
	return var_02;
}

//Function Number: 63
lib_A59A::func_3E31()
{
	var_00 = [];
	foreach(var_02 in level.var_328)
	{
		if(lib_A59A::func_505F(var_02))
		{
			continue;
		}

		var_00[var_00.size] = var_02;
	}

	return var_00;
}

//Function Number: 64
lib_A59A::func_3CEC(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		var_03 = function_00D6(param_01);
	}
	else
	{
		var_03 = function_00D6();
	}

	if(var_03.size == 0)
	{
		return undefined;
	}

	if(isdefined(param_02))
	{
		var_03 = common_scripts\utility::array_remove_array(var_03,param_02);
	}

	return common_scripts\utility::getclosest(param_00,var_03);
}

//Function Number: 65
lib_A59A::func_3CED(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		var_03 = function_00D6(param_01);
	}
	else
	{
		var_03 = function_00D6();
	}

	if(var_03.size == 0)
	{
		return undefined;
	}

	return lib_A59A::func_3CF4(param_00,var_03,param_02);
}

//Function Number: 66
lib_A59A::func_3E3B(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = distance(param_00,param_01);
	}

	param_03 = max(0.01,param_03);
	var_04 = vectornormalize(param_01 - param_00);
	var_05 = param_02 - param_00;
	var_06 = vectordot(var_05,var_04);
	var_06 = var_06 / param_03;
	var_06 = clamp(var_06,0,1);
	return var_06;
}

//Function Number: 67
lib_A59A::func_1A4F(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	if(!lib_A59A::func_6E18(param_00))
	{
		return 0;
	}

	if(!sighttracepassed(self geteye(),param_00,param_01,self))
	{
		return 0;
	}

	return 1;
}

//Function Number: 68
lib_A59A::func_6E18(param_00)
{
	var_01 = anglestoforward(self.var_41);
	var_02 = vectornormalize(param_00 - self.var_2E6);
	var_03 = vectordot(var_01,var_02);
	return var_03 > 0.766;
}

//Function Number: 69
lib_A59A::func_8E9E()
{
	self notify("stop_magic_bullet_shield");
	if(isai(self))
	{
		self.var_56 = 1;
	}

	self.var_58D4 = undefined;
	self.var_101 = 0;
	self notify("internal_stop_magic_bullet_shield");
}

//Function Number: 70
lib_A59A::func_58D2()
{
}

//Function Number: 71
lib_A59A::func_58D4(param_00)
{
	if(isai(self))
	{
	}
	else
	{
		self.health = 100000;
	}

	self endon("internal_stop_magic_bullet_shield");
	if(isai(self))
	{
		self.var_56 = 0.1;
	}

	self notify("magic_bullet_shield");
	self.var_58D4 = 1;
	self.var_101 = 1;
	self.var_6156 = 1;
}

//Function Number: 72
lib_A59A::func_2AB0()
{
	self.var_7.var_2B17 = 1;
}

//Function Number: 73
lib_A59A::func_30CE()
{
	self.var_7.var_2B17 = 0;
}

//Function Number: 74
lib_A59A::func_30A3()
{
	self.var_85B3 = undefined;
}

//Function Number: 75
lib_A59A::func_2A7E()
{
	self.var_85B3 = 1;
}

//Function Number: 76
lib_A59A::func_27F1()
{
	lib_A59A::func_58D4(1);
}

//Function Number: 77
lib_A59A::func_3DA3()
{
	return self.ignoreme;
}

//Function Number: 78
lib_A59A::func_7E58(param_00)
{
	self.ignoreme = param_00;
}

//Function Number: 79
lib_A59A::func_7E57(param_00)
{
	self.ignoreall = param_00;
}

//Function Number: 80
lib_A59A::func_7E59(param_00)
{
	self.var_4BB8 = param_00;
}

//Function Number: 81
lib_A59A::func_7E1A(param_00)
{
	self.favoriteenemy = param_00;
}

//Function Number: 82
lib_A59A::func_3E14()
{
	return self.var_2EA;
}

//Function Number: 83
lib_A59A::func_7E8B(param_00)
{
	self.var_2EA = param_00;
}

//Function Number: 84
lib_A59A::func_4BA3(param_00)
{
	self notify("new_ignore_me_timer");
	self endon("new_ignore_me_timer");
	self endon("death");
	if(!isdefined(self.var_4BA4))
	{
		self.var_4BA4 = self.ignoreme;
	}

	var_01 = function_00D6("bad_guys");
	foreach(var_03 in var_01)
	{
		if(!isalive(var_03.enemy))
		{
			continue;
		}

		if(var_03.enemy != self)
		{
			continue;
		}

		var_03 method_8166();
	}

	self.ignoreme = 1;
	wait(param_00);
	self.ignoreme = self.var_4BA4;
	self.var_4BA4 = undefined;
}

//Function Number: 85
lib_A59A::func_280C(param_00)
{
	common_scripts\_exploder::delete_exploder_proc(param_00);
}

//Function Number: 86
lib_A59A::func_484C(param_00)
{
	common_scripts\_exploder::hide_exploder_models_proc(param_00);
}

//Function Number: 87
lib_A59A::func_84C8(param_00)
{
	common_scripts\_exploder::show_exploder_models_proc(param_00);
}

//Function Number: 88
lib_A59A::stop_exploder(param_00)
{
	common_scripts\_exploder::stop_exploder_proc(param_00);
}

//Function Number: 89
lib_A59A::func_3D5D(param_00)
{
	return common_scripts\_exploder::get_exploder_array_proc(param_00);
}

//Function Number: 90
lib_A59A::func_38ED(param_00)
{
	lib_A577::func_38EF(param_00);
}

//Function Number: 91
lib_A59A::func_7DB3(param_00,param_01)
{
	lib_A5DD::func_123A(param_00,param_01);
}

//Function Number: 92
lib_A59A::func_3990(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_01))
	{
		param_01 = 4;
	}

	thread lib_A59A::func_3991(param_00,param_01,param_02,param_03);
}

//Function Number: 93
lib_A59A::func_6611()
{
	if(isdefined(self.var_7.var_253B))
	{
		self.var_7.var_CD8["crawl"] = self.var_7.var_253B["crawl"];
		self.var_7.var_CD8["death"] = self.var_7.var_253B["death"];
		self.var_7.var_238A = self.var_7.var_253B["blood_fx_rate"];
		if(isdefined(self.var_7.var_253B["blood_fx"]))
		{
			self.var_7.var_2389 = self.var_7.var_253B["blood_fx"];
		}
	}

	self.var_7.var_CD8["stand_2_crawl"] = [];
	self.var_7.var_CD8["stand_2_crawl"][0] = %dying_stand_2_crawl_v3;
	if(isdefined(self.var_613F))
	{
		self.var_7.var_6E57 = "prone";
	}

	self method_818F("face angle",self.var_7.var_398F);
	self.var_7.var_398F = undefined;
}

//Function Number: 94
lib_A59A::func_3991(param_00,param_01,param_02,param_03)
{
	self.var_39C0 = 1;
	self.var_7.var_399B = param_01;
	self.var_6156 = 1;
	self.var_613F = param_03;
	self.var_7.var_253B = param_02;
	self.var_238F = ::lib_A59A::func_6611;
	self.var_275 = 100000;
	self.health = 100000;
	lib_A59A::func_30CE();
	if(!isdefined(param_03) || param_03 == 0)
	{
		self.var_7.var_398F = param_00 + 181.02;
		return;
	}

	self.var_7.var_398F = param_00;
	thread animscripts\notetracks::func_61DB();
}

//Function Number: 95
lib_A59A::func_608F()
{
	self endon("death");
	for(;;)
	{
		var_00 = self method_83B4();
		if(var_00)
		{
			var_01 = common_scripts\utility::waittill_any_return("exo_dodge","player_boost_land","disable_high_jump");
			if(!isdefined(var_01) || var_01 == "player_boost_land" || var_01 == "disable_high_jump")
			{
				continue;
			}

			if(!isdefined(self.var_608F))
			{
				self.var_608F = 1;
			}

			common_scripts\utility::waittill_any("player_boost_land","disable_high_jump");
			wait 0.05;
			self.var_608F = undefined;
		}

		wait 0.05;
	}
}

//Function Number: 96
lib_A59A::func_1CD4()
{
	if(getdvar("mapname","undefined") != "sanfran_b")
	{
		return;
	}

	if(!isdefined(level.var_31D.var_594A) || !level.var_31D.var_594A)
	{
		level.var_31D.var_594A = 1;
	}

	wait(2);
	level.var_31D.var_594A = undefined;
}

//Function Number: 97
lib_A59A::func_5DA6(param_00,param_01,param_02)
{
	if(param_01 != "MOD_GRENADE")
	{
		param_00.var_3CA9 = undefined;
		return;
	}

	if(!isdefined(param_00.var_3CA9))
	{
		param_00.var_3CA9 = 1;
	}
	else
	{
		param_00.var_3CA9++;
	}

	if(param_00.var_3CA9 == 4)
	{
		lib_A59A::func_41DA("SMART_GRENADE_KILL");
	}

	wait(0.1);
	param_00.var_3CA9 = undefined;
}

//Function Number: 98
lib_A59A::func_8C09()
{
	lib_A59A::func_0761("axis",::lib_A59A::func_5D95);
	common_scripts\utility::array_thread(function_00D6("axis"),::lib_A59A::func_5D95);
	level.var_43E7 = 0;
	level.var_31D.var_334F = [];
}

//Function Number: 99
lib_A59A::func_5D95()
{
	for(;;)
	{
		var_00 = undefined;
		self waittill("grenade_fire",var_00,var_01);
		var_00.unique_id = level.var_43E7;
		level.var_43E7++;
		var_00.owner = self.unique_id;
		var_00 thread lib_A59A::func_3350();
		var_00 thread lib_A59A::func_334F();
	}
}

//Function Number: 100
lib_A59A::func_3350()
{
	var_00 = level.var_31D;
	var_01 = self.unique_id;
	while(isdefined(self))
	{
		var_02 = var_00.var_2E6 - self.var_2E6;
		var_03 = getweaponexplosionradius("fraggrenade") + 23;
		var_04 = squared(var_03);
		var_05 = lengthsquared(var_02);
		if(var_05 > var_04)
		{
			if(isdefined(var_00.var_334F[self.unique_id]))
			{
				var_00.var_334F[self.unique_id] = undefined;
			}

			continue;
		}

		if(!isdefined(var_00.var_334F[self.unique_id]))
		{
			if(isdefined(self.owner))
			{
				var_00.var_334F[self.unique_id] = 1;
			}
		}

		wait 0.05;
	}

	if(isdefined(var_00.var_334F[var_01]))
	{
		var_00.var_334F[var_01] = undefined;
	}
}

//Function Number: 101
lib_A59A::func_334F()
{
	var_00 = level.var_31D;
	while(isdefined(self))
	{
		if(isdefined(var_00.var_334F[self.unique_id]))
		{
			var_01 = level.var_31D common_scripts\utility::waittill_any_timeout(4,"exo_dodge");
			if(isdefined(var_01) && var_01 == "exo_dodge")
			{
				thread lib_A59A::func_1CC2();
			}

			continue;
		}

		wait 0.05;
	}
}

//Function Number: 102
lib_A59A::func_1CC2()
{
	level.var_31D endon("death");
	while(isdefined(self))
	{
		var_00 = level.var_31D lib_A59A::func_A07B(1,"damage");
		if(isdefined(var_00) && isarray(var_00))
		{
			if(var_00[5] == "MOD_GRENADE_SPLASH" && !isdefined(level.var_31D.var_3351))
			{
				if(var_00[2].unique_id == self.owner && isdefined(level.var_31D.var_334F[self.unique_id]))
				{
					level.var_31D.var_3351 = 1;
				}
			}

			continue;
		}

		wait 0.05;
	}

	if(!isdefined(level.var_31D.var_3351))
	{
		level.var_31D lib_A59A::func_3352();
		return;
	}

	level.var_31D.var_3351 = undefined;
}

//Function Number: 103
lib_A59A::func_3352()
{
	var_00 = self getplayerprofiledata("ach_escapeArtist") + 1;
	if(var_00 == 20)
	{
		lib_A59A::func_41DA("GRENADE_DODGE");
	}

	self setplayerprofiledata("ach_escapeArtist",var_00);
}

//Function Number: 104
lib_A59A::func_A07B(param_00,param_01)
{
	if(!isdefined(param_01) || param_01 != "death")
	{
		self endon("death");
	}

	var_02 = spawnstruct();
	if(isdefined(param_01))
	{
		childthread common_scripts\utility::waittill_string_parms(param_01,var_02);
	}

	var_02 childthread common_scripts\utility::_timeout(param_00);
	var_02 waittill("returned",var_03);
	var_02 notify("die");
	return var_03;
}

//Function Number: 105
lib_A59A::func_83CA()
{
	precacheshellshock("default");
	self waittill("death");
	if(isdefined(self.var_8A25))
	{
		return;
	}

	if(getdvar("r_texturebits") == "16")
	{
		return;
	}

	self shellshock("default",3);
}

//Function Number: 106
lib_A59A::func_6D88()
{
	self endon("death");
	self endon("stop_unresolved_collision_script");
	lib_A59A::func_7439();
	childthread lib_A59A::func_6D89();
	for(;;)
	{
		if(self.var_4DE)
		{
			self.var_4DE = 0;
			if(self.var_9A50 >= 20)
			{
				if(isdefined(self.var_462F))
				{
					self [[ self.var_462F ]]();
				}
				else
				{
					lib_A59A::func_278F();
				}
			}
		}
		else
		{
			lib_A59A::func_7439();
		}

		wait(0.05);
	}
}

//Function Number: 107
lib_A59A::func_6D89()
{
	for(;;)
	{
		self waittill("unresolved_collision");
		self.var_4DE = 1;
		self.var_9A50++;
	}
}

//Function Number: 108
lib_A59A::func_7439()
{
	self.var_4DE = 0;
	self.var_9A50 = 0;
}

//Function Number: 109
lib_A59A::func_278F()
{
	var_00 = getnodesinradiussorted(self.var_2E6,300,0,200,"Path");
	if(var_00.size)
	{
		self cancelmantle();
		self dontinterpolate();
		self setorigin(var_00[0].var_2E6);
		lib_A59A::func_7439();
		return;
	}

	self method_8052();
}

//Function Number: 110
lib_A59A::func_8EA9()
{
	self notify("stop_unresolved_collision_script");
	lib_A59A::func_7439();
}

//Function Number: 111
lib_A59A::func_2825(param_00,param_01)
{
	param_00 endon("death");
	self waittill("death");
	if(isdefined(param_00))
	{
		if(param_00 method_8079())
		{
			param_00 waittill(param_01);
		}

		param_00 delete();
	}
}

//Function Number: 112
lib_A59A::func_5011()
{
	return issentient(self) && !isalive(self);
}

//Function Number: 113
lib_A59A::play_sound_on_tag(param_00,param_01,param_02,param_03,param_04)
{
	if(lib_A59A::func_5011())
	{
		return;
	}

	if(!soundexists(param_00))
	{
		return;
	}

	var_05 = spawn("script_origin",(0,0,0));
	var_05 endon("death");
	thread lib_A59A::func_2825(var_05,"sounddone");
	if(isdefined(param_01))
	{
		var_05 linkto(self,param_01,(0,0,0),(0,0,0));
	}
	else
	{
		var_05.var_2E6 = self.var_2E6;
		var_05.var_41 = self.var_41;
		var_05 linkto(self);
	}

	var_05 playsoundasmaster(param_00,"sounddone");
	if(isdefined(param_02))
	{
		if(!isdefined(lib_A59B::func_9FB4(var_05)))
		{
			var_05 stopsounds();
		}

		wait(0.05);
	}
	else
	{
		var_05 waittill("sounddone");
	}

	if(isdefined(param_03))
	{
		self notify(param_03);
	}

	var_05 delete();
}

//Function Number: 114
lib_A59A::func_69C3(param_00,param_01)
{
	lib_A59A::play_sound_on_tag(param_00,param_01,1);
}

//Function Number: 115
lib_A59A::play_sound_on_entity(param_00,param_01)
{
	lib_A59A::play_sound_on_tag(param_00,undefined,undefined,param_01);
}

//Function Number: 116
lib_A59A::func_6973(param_00,param_01,param_02,param_03)
{
	var_04 = spawn("script_origin",(0,0,0));
	var_04 endon("death");
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(param_02)
	{
		thread common_scripts\utility::delete_on_death(var_04);
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(param_03)
	{
		thread lib_A59A::func_282B(var_04);
	}

	if(isdefined(param_01))
	{
		var_04 linkto(self,param_01,(0,0,0),(0,0,0));
	}
	else
	{
		var_04.var_2E6 = self.var_2E6;
		var_04.var_41 = self.var_41;
		var_04 linkto(self);
	}

	var_04 playloopsound(param_00);
	self waittill("stop sound" + param_00);
	var_04 stoploopsound(param_00);
	var_04 delete();
}

//Function Number: 117
lib_A59A::func_282B(param_00)
{
	param_00 endon("death");
	while(isdefined(self))
	{
		wait(0.05);
	}

	if(isdefined(param_00))
	{
		param_00 delete();
	}
}

//Function Number: 118
lib_A59A::func_7802()
{
	var_00 = function_00D6("allies");
	var_01 = 0;
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		if(isdefined(var_00[var_02].var_79E9))
		{
			continue;
		}

		game["character" + var_01] = var_00[var_02] codescripts\character::save();
		var_01++;
	}

	game["total characters"] = var_01;
}

//Function Number: 119
lib_A59A::func_88EB(param_00)
{
	if(!isalive(param_00))
	{
		return 1;
	}

	if(!isdefined(param_00.finished_spawning))
	{
		param_00 common_scripts\utility::waittill_either("finished spawning","death");
	}

	if(isalive(param_00))
	{
		return 0;
	}

	return 1;
}

//Function Number: 120
lib_A59A::func_8947(param_00)
{
	codescripts\character::precache(param_00);
	self waittill("spawned",var_01);
	if(lib_A59A::func_88EB(var_01))
	{
		return;
	}

	var_01 codescripts\character::new();
	var_01 codescripts\character::load(param_00);
}

//Function Number: 121
lib_A59A::func_52E2(param_00,param_01)
{
	iprintlnbold(param_00,param_01["key1"]);
}

//Function Number: 122
lib_A59A::func_9E0C(param_00)
{
	self endon("death");
	for(;;)
	{
		lib_A51C::func_2DE6(param_00);
		wait(0.05);
	}
}

//Function Number: 123
lib_A59A::func_0D61(param_00)
{
	if(isdefined(param_00))
	{
		self.animname = param_00;
	}

	self method_8115(level.var_78AE[self.animname]);
}

//Function Number: 124
lib_A59A::func_0D68()
{
	if(isarray(level.var_78B2[self.animname]))
	{
		var_00 = randomint(level.var_78B2[self.animname].size);
		self setmodel(level.var_78B2[self.animname][var_00]);
		return;
	}

	self setmodel(level.var_78B2[self.animname]);
}

//Function Number: 125
lib_A59A::func_88CB(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = (0,0,0);
	}

	var_03 = spawn("script_model",param_01);
	var_03.animname = param_00;
	var_03 lib_A59A::func_0D61();
	var_03 lib_A59A::func_0D68();
	if(isdefined(param_02))
	{
		var_03.var_41 = param_02;
	}

	return var_03;
}

//Function Number: 126
lib_A59A::func_9805(param_00,param_01)
{
	var_02 = getent(param_00,param_01);
	if(!isdefined(var_02))
	{
		return;
	}

	var_02 waittill("trigger",var_03);
	level notify(param_00,var_03);
	return var_03;
}

//Function Number: 127
lib_A59A::func_9806(param_00)
{
	return lib_A59A::func_9805(param_00,"targetname");
}

//Function Number: 128
lib_A59A::func_7E21(param_00,param_01)
{
	thread lib_A59A::func_7E24(param_00,param_01,::lib_A59A::func_A075,"set_flag_on_dead");
}

//Function Number: 129
lib_A59A::func_7E22(param_00,param_01)
{
	thread lib_A59A::func_7E24(param_00,param_01,::lib_A59A::func_A076,"set_flag_on_dead_or_dying");
}

//Function Number: 130
lib_A59A::func_7E25(param_00,param_01)
{
	thread lib_A59A::func_7E24(param_00,param_01,::lib_A59A::func_3091,"set_flag_on_spawned");
}

//Function Number: 131
lib_A59A::func_3091(param_00)
{
}

//Function Number: 132
lib_A59A::func_7E26(param_00,param_01)
{
	self waittill("spawned",var_02);
	if(lib_A59A::func_88EB(var_02))
	{
		return;
	}

	param_00.var_8B4[param_00.var_8B4.size] = var_02;
	lib_A59A::func_32DD(param_01);
}

//Function Number: 133
lib_A59A::func_7E24(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	var_04.var_8B4 = [];
	foreach(var_06 in param_00)
	{
		var_06 lib_A59A::func_32DC(param_03);
	}

	common_scripts\utility::array_thread(param_00,::lib_A59A::func_7E26,var_04,param_03);
	foreach(var_06 in param_00)
	{
		var_06 lib_A59A::func_32DF(param_03);
	}

	[[ param_02 ]](var_04.var_8B4);
	common_scripts\utility::flag_set(param_01);
}

//Function Number: 134
lib_A59A::func_7E28(param_00,param_01)
{
	if(!common_scripts\utility::flag(param_01))
	{
		param_00 waittill("trigger",var_02);
		common_scripts\utility::flag_set(param_01);
		return var_02;
	}
}

//Function Number: 135
lib_A59A::func_7E27(param_00)
{
	if(common_scripts\utility::flag(param_00))
	{
		return;
	}

	var_01 = getent(param_00,"targetname");
	var_01 waittill("trigger");
	common_scripts\utility::flag_set(param_00);
}

//Function Number: 136
lib_A59A::func_5038(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		if(param_00[var_02] == param_01)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 137
lib_A59A::func_A075(param_00,param_01,param_02)
{
	var_0A = spawnstruct();
	if(isdefined(param_02))
	{
		var_0A endon("thread_timed_out");
		var_0A thread lib_A59A::func_A079(param_02);
	}

	var_0A.count = param_00.size;
	if(isdefined(param_01) && param_01 < var_0A.count)
	{
		var_0A.count = param_01;
	}

	common_scripts\utility::array_thread(param_00,::lib_A59A::func_A078,var_0A);
	while(var_0A.count > 0)
	{
		var_0A waittill("waittill_dead guy died");
	}
}

//Function Number: 138
lib_A59A::func_A076(param_00,param_01,param_02)
{
	var_03 = [];
	foreach(var_05 in param_00)
	{
		if(isalive(var_05) && !var_05.var_1FF)
		{
			var_03[var_03.size] = var_05;
		}
	}

	param_00 = var_03;
	var_07 = spawnstruct();
	if(isdefined(param_02))
	{
		var_07 endon("thread_timed_out");
		var_07 thread lib_A59A::func_A079(param_02);
	}

	var_07.count = param_00.size;
	if(isdefined(param_01) && param_01 < var_07.count)
	{
		var_07.count = param_01;
	}

	common_scripts\utility::array_thread(param_00,::lib_A59A::func_A077,var_07);
	while(var_07.count > 0)
	{
		var_07 waittill("waittill_dead_guy_dead_or_dying");
	}
}

//Function Number: 139
lib_A59A::func_A078(param_00)
{
	self waittill("death");
	param_00.count--;
	param_00 notify("waittill_dead guy died");
}

//Function Number: 140
lib_A59A::func_A077(param_00)
{
	common_scripts\utility::waittill_either("death","pain_death");
	param_00.count--;
	param_00 notify("waittill_dead_guy_dead_or_dying");
}

//Function Number: 141
lib_A59A::func_A079(param_00)
{
	wait(param_00);
	self notify("thread_timed_out");
}

//Function Number: 142
lib_A59A::func_A05D(param_00)
{
	while(level.var_54A[param_00].var_89C6 || level.var_54A[param_00].var_949)
	{
		wait(0.25);
	}
}

//Function Number: 143
lib_A59A::func_A05E(param_00,param_01)
{
	while(level.var_54A[param_00].var_89C6 + level.var_54A[param_00].var_949 > param_01)
	{
		wait(0.25);
	}
}

//Function Number: 144
lib_A59A::func_3CB3(param_00)
{
	return level.var_54A[param_00].var_89C6 + level.var_54A[param_00].var_949;
}

//Function Number: 145
lib_A59A::func_3CB4(param_00)
{
	return level.var_54A[param_00].var_949;
}

//Function Number: 146
lib_A59A::func_3CB2(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < level.var_54A[param_00].var_8B4.size;var_02++)
	{
		if(!isalive(level.var_54A[param_00].var_8B4[var_02]))
		{
			continue;
		}

		var_01[var_01.size] = level.var_54A[param_00].var_8B4[var_02];
	}

	return var_01;
}

//Function Number: 147
lib_A59A::func_A093(param_00)
{
	self endon("damage");
	self endon("death");
	self waittillmatch(param_00,"single anim");
}

//Function Number: 148
lib_A59A::func_3DC3(param_00,param_01)
{
	var_02 = lib_A59A::func_3DC4(param_00,param_01);
	if(var_02.size > 1)
	{
		return undefined;
	}

	return var_02[0];
}

//Function Number: 149
lib_A59A::func_3DC4(param_00,param_01)
{
	var_02 = function_00D7("all","all");
	var_03 = [];
	var_04 = var_02;
	var_06 = getfirstarraykey(var_04);
	if(isdefined(var_06))
	{
		var_05 = var_04[var_06];
		if(!isalive(var_05))
		{
			continue;
		}

		switch(param_01)
		{
			case "targetname":
				break;

			case "script_noteworthy":
				break;
		}
	}
}

//Function Number: 150
lib_A59A::func_3EB0(param_00,param_01)
{
	var_02 = lib_A59A::func_3EB4(param_00,param_01);
	if(!var_02.size)
	{
		return undefined;
	}

	return var_02[0];
}

//Function Number: 151
lib_A59A::func_3EB4(param_00,param_01)
{
	var_02 = getentarray(param_00,param_01);
	var_03 = [];
	var_04 = [];
	foreach(var_06 in var_02)
	{
		if(var_06.code_classname != "script_vehicle")
		{
			continue;
		}

		var_04[0] = var_06;
		if(isspawner(var_06))
		{
			if(isdefined(var_06.var_5559))
			{
				var_04[0] = var_06.var_5559;
				var_03 = lib_A59A::func_0CF2(var_03,var_04);
			}

			continue;
		}

		var_03 = lib_A59A::func_0CF2(var_03,var_04);
	}

	return var_03;
}

//Function Number: 152
lib_A59A::func_3DC5(param_00,param_01,param_02)
{
	var_03 = lib_A59A::func_3DC6(param_00,param_01,param_02);
	if(var_03.size > 1)
	{
		return undefined;
	}

	return var_03[0];
}

//Function Number: 153
lib_A59A::func_3DC6(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = "all";
	}

	var_03 = function_00D7("allies",param_02);
	var_03 = common_scripts\utility::array_combine(var_03,function_00D7("axis",param_02));
	var_04 = [];
	var_05 = 0;
	if(var_05 < var_03.size)
	{
		switch(param_01)
		{
			case "targetname":
				break;

			case "script_noteworthy":
				break;
		}
	}
}

//Function Number: 154
lib_A59A::func_3C5C(param_00,param_01)
{
	if(isdefined(level.var_3C5B[param_00]))
	{
		if(level.var_3C5B[param_00])
		{
			wait(0.05);
			if(isalive(self))
			{
				self notify("gather_delay_finished" + param_00 + param_01);
			}

			return;
		}

		level waittill(param_00);
		if(isalive(self))
		{
			self notify("gather_delay_finished" + param_00 + param_01);
		}

		return;
	}

	level.var_3C5B[param_00] = 0;
	wait(param_01);
	level.var_3C5B[param_00] = 1;
	level notify(param_00);
	if(isalive(self))
	{
		self notify("gat    her_delay_finished" + param_00 + param_01);
	}
}

//Function Number: 155
lib_A59A::func_3C5B(param_00,param_01)
{
	thread lib_A59A::func_3C5C(param_00,param_01);
	self waittill("gather_delay_finished" + param_00 + param_01);
}

//Function Number: 156
lib_A59A::func_264E(param_00)
{
	self waittill("death");
	level notify(param_00);
}

//Function Number: 157
lib_A59A::func_3F2C(param_00)
{
	if(param_00 == 0)
	{
		return "0";
	}

	if(param_00 == 1)
	{
		return "1";
	}

	if(param_00 == 2)
	{
		return "2";
	}

	if(param_00 == 3)
	{
		return "3";
	}

	if(param_00 == 4)
	{
		return "4";
	}

	if(param_00 == 5)
	{
		return "5";
	}

	if(param_00 == 6)
	{
		return "6";
	}

	if(param_00 == 7)
	{
		return "7";
	}

	if(param_00 == 8)
	{
		return "8";
	}

	if(param_00 == 9)
	{
		return "9";
	}
}

//Function Number: 158
lib_A59A::func_4004(param_00,param_01)
{
	var_02 = [];
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		var_04 = param_00[var_03];
		var_05 = var_04.script_linkname;
		if(!isdefined(var_05))
		{
			continue;
		}

		if(!isdefined(param_01[var_05]))
		{
			continue;
		}

		var_02[var_02.size] = var_04;
	}

	return var_02;
}

//Function Number: 159
lib_A59A::func_0CF3(param_00,param_01)
{
	if(!param_00.size)
	{
		return param_01;
	}

	if(!param_01.size)
	{
		return param_00;
	}

	var_02 = [];
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		var_04 = param_00[var_03];
		var_02[var_04.script_linkname] = 1;
	}

	for(var_03 = 0;var_03 < param_01.size;var_03++)
	{
		var_04 = param_01[var_03];
		if(isdefined(var_02[var_04.script_linkname]))
		{
			continue;
		}

		var_02[var_04.script_linkname] = 1;
		param_00[param_00.size] = var_04;
	}

	return param_00;
}

//Function Number: 160
lib_A59A::func_0CF2(param_00,param_01)
{
	if(param_00.size == 0)
	{
		return param_01;
	}

	if(param_01.size == 0)
	{
		return param_00;
	}

	var_02 = param_00;
	foreach(var_04 in param_01)
	{
		var_05 = 0;
		foreach(var_07 in param_00)
		{
			if(var_07 == var_04)
			{
				var_05 = 1;
				break;
			}
		}

		if(var_05)
		{
			continue;
		}
		else
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 161
lib_A59A::func_0CE7(param_00,param_01)
{
	var_02 = param_00;
	for(var_03 = 0;var_03 < param_01.size;var_03++)
	{
		if(lib_A59A::func_5038(param_00,param_01[var_03]))
		{
			var_02 = common_scripts\utility::array_remove(var_02,param_01[var_03]);
		}
	}

	return var_02;
}

//Function Number: 162
lib_A59A::func_0CE3(param_00,param_01)
{
	if(param_00.size != param_01.size)
	{
		return 0;
	}

	foreach(var_05, var_03 in param_00)
	{
		if(!isdefined(param_01[var_05]))
		{
			return 0;
		}

		var_04 = param_01[var_05];
		if(var_04 != var_03)
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 163
lib_A59A::func_4003()
{
	var_00 = [];
	if(isdefined(self.script_linkto))
	{
		var_01 = common_scripts\utility::get_links();
		foreach(var_03 in var_01)
		{
			var_04 = vehpath_getnodearray(var_03,"script_linkname");
			var_00 = common_scripts\utility::array_combine(var_00,var_04);
		}
	}

	return var_00;
}

//Function Number: 164
lib_A59A::func_2DB6(param_00,param_01,param_02,param_03,param_04)
{
	wait(0.05);
}

//Function Number: 165
lib_A59A::func_2DBD(param_00,param_01,param_02,param_03,param_04,param_05)
{
	param_05 = gettime() + param_05 * 1000;
	while(gettime() < param_05)
	{
		wait(0.05);
		if(!isdefined(param_01) || !isdefined(param_01.var_2E6))
		{
			return;
		}
	}
}

//Function Number: 166
lib_A59A::func_2DB8(param_00,param_01,param_02,param_03,param_04,param_05)
{
	lib_A59A::func_2DBD(param_01,param_00,param_02,param_03,param_04,param_05);
}

//Function Number: 167
lib_A59A::func_2DB9(param_00,param_01,param_02,param_03,param_04,param_05)
{
	param_00 endon("death");
	param_01 endon("death");
	param_05 = gettime() + param_05 * 1000;
	while(gettime() < param_05)
	{
		wait(0.05);
	}
}

//Function Number: 168
lib_A59A::func_2DBA(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	param_00 endon("death");
	param_01 endon("death");
	param_05 endon(param_06);
	wait(0.05);
}

//Function Number: 169
lib_A59A::draw_line_until_notify(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	param_05 endon(param_06);
	common_scripts\utility::draw_line_for_time(param_00,param_01,param_02,param_03,param_04,0.05);
}

//Function Number: 170
lib_A59A::func_2DBB(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	param_06 = gettime() + param_06 * 1000;
	param_01 = param_01 * param_02;
	while(gettime() < param_06)
	{
		wait(0.05);
		if(!isdefined(param_00) || !isdefined(param_00.var_2E6))
		{
			return;
		}
	}
}

//Function Number: 171
lib_A59A::draw_circle_until_notify(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	if(isdefined(param_07))
	{
		var_08 = param_07;
	}
	else
	{
		var_08 = 16;
	}

	var_09 = 360 / var_08;
	var_0A = [];
	for(var_0B = 0;var_0B < var_08;var_0B++)
	{
		var_0C = var_09 * var_0B;
		var_0D = cos(var_0C) * param_01;
		var_0E = sin(var_0C) * param_01;
		var_0F = param_00[0] + var_0D;
		var_10 = param_00[1] + var_0E;
		var_11 = param_00[2];
		var_0A[var_0A.size] = (var_0F,var_10,var_11);
	}

	thread lib_A59A::func_2DA3(var_0A,param_02,param_03,param_04,param_05,param_06);
}

//Function Number: 172
lib_A59A::draw_circle_for_time(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = 16;
	var_07 = 360 / var_06;
	var_08 = [];
	for(var_09 = 0;var_09 < var_06;var_09++)
	{
		var_0A = var_07 * var_09;
		var_0B = cos(var_0A) * param_01;
		var_0C = sin(var_0A) * param_01;
		var_0D = param_00[0] + var_0B;
		var_0E = param_00[1] + var_0C;
		var_0F = param_00[2];
		var_08[var_08.size] = (var_0D,var_0E,var_0F);
	}

	thread lib_A59A::func_2DA2(var_08,param_02,param_03,param_04,param_05);
}

//Function Number: 173
lib_A59A::func_2DA2(param_00,param_01,param_02,param_03,param_04)
{
	for(var_05 = 0;var_05 < param_00.size;var_05++)
	{
		var_06 = param_00[var_05];
		if(var_05 + 1 >= param_00.size)
		{
			var_07 = param_00[0];
		}
		else
		{
			var_07 = param_00[var_05 + 1];
		}

		thread common_scripts\utility::draw_line_for_time(var_06,var_07,param_01,param_02,param_03,param_04);
	}
}

//Function Number: 174
lib_A59A::func_2DA3(param_00,param_01,param_02,param_03,param_04,param_05)
{
	for(var_06 = 0;var_06 < param_00.size;var_06++)
	{
		var_07 = param_00[var_06];
		if(var_06 + 1 >= param_00.size)
		{
			var_08 = param_00[0];
		}
		else
		{
			var_08 = param_00[var_06 + 1];
		}

		thread lib_A59A::draw_line_until_notify(var_07,var_08,param_01,param_02,param_03,param_04,param_05);
	}
}

//Function Number: 175
lib_A59A::func_1EB4()
{
	self notify("enemy");
	self method_8166();
}

//Function Number: 176
lib_A59A::func_1332(param_00)
{
	level notify("battlechatter_off_thread");
	lib_A51B::func_2600(param_00);
	animscripts\battlechatter::func_134F();
	if(isdefined(param_00))
	{
		lib_A59A::func_7DDA(param_00,0);
		var_01 = function_00D6(param_00);
	}
	else
	{
		foreach(param_00 in level.var_91F9)
		{
			lib_A59A::func_7DDA(param_00,0);
		}

		var_01 = function_00D6();
	}

	if(!isdefined(level.var_1CA5) || !level.var_1CA5)
	{
		return;
	}

	for(var_04 = 0;var_04 < var_01.size;var_04++)
	{
		var_01[var_04].var_132D = 0;
	}

	for(var_04 = 0;var_04 < var_01.size;var_04++)
	{
		var_05 = var_01[var_04];
		if(!isalive(var_05))
		{
			continue;
		}

		if(!var_05.var_1CA5)
		{
			continue;
		}

		if(!var_05.var_51B0)
		{
			continue;
		}

		var_05 lib_A59B::func_9FF1();
	}

	var_06 = gettime() - level.var_55FF["allies"];
	if(var_06 < 1500)
	{
		wait(var_06 / 1000);
	}

	if(isdefined(param_00))
	{
		level notify(param_00 + " done speaking");
		return;
	}

	level notify("done speaking");
}

//Function Number: 177
lib_A59A::func_1333(param_00)
{
	thread lib_A59A::func_1334(param_00);
	lib_A51B::func_2602(param_00);
}

//Function Number: 178
lib_A59A::func_1334(param_00)
{
	level endon("battlechatter_off_thread");
	animscripts\battlechatter::func_134F();
	while(!isdefined(level.var_1CA5))
	{
		wait(0.05);
	}

	common_scripts\utility::flag_set("battlechatter_on_thread_waiting");
	wait(1.5);
	common_scripts\utility::flag_clear("battlechatter_on_thread_waiting");
	if(isdefined(param_00))
	{
		lib_A59A::func_7DDA(param_00,1);
		var_01 = function_00D6(param_00);
	}
	else
	{
		foreach(param_00 in level.var_91F9)
		{
			lib_A59A::func_7DDA(param_00,1);
		}

		var_01 = function_00D6();
	}

	for(var_04 = 0;var_04 < var_01.size;var_04++)
	{
		var_01[var_04] lib_A59A::func_7DD9(1);
	}
}

//Function Number: 179
lib_A59A::func_7DD9(param_00)
{
	lib_A59A::func_2605(!param_00);
	if(!isdefined(level.var_1CA5) || !level.var_1CA5)
	{
		return;
	}

	if(self.type == "dog")
	{
		return;
	}

	if(param_00)
	{
		if(isdefined(self.var_7958) && !self.var_7958)
		{
			self.var_132D = 0;
			return;
		}

		self.var_132D = 1;
		return;
	}

	self.var_132D = 0;
	if(isdefined(self.var_51B0) && self.var_51B0)
	{
		self waittill("done speaking");
	}
}

//Function Number: 180
lib_A59A::func_7ECC(param_00,param_01)
{
	if(!level.var_1CA5)
	{
		return;
	}

	var_02 = getarraykeys(level.var_2244);
	var_03 = common_scripts\utility::array_contains(var_02,param_01);
	if(!var_03)
	{
		return;
	}

	var_04 = function_00D6(param_00);
	foreach(var_06 in var_04)
	{
		var_06 lib_A59A::func_7DAE(param_01);
		wait 0.05;
	}
}

//Function Number: 181
lib_A59A::func_7DAE(param_00)
{
	if(!level.var_1CA5)
	{
		return;
	}

	var_01 = getarraykeys(level.var_2244);
	var_02 = common_scripts\utility::array_contains(var_01,param_00);
	if(!var_02)
	{
		return;
	}

	if(self.type == "dog")
	{
		return;
	}

	if(isdefined(self.var_51B0) && self.var_51B0)
	{
		self waittill("done speaking");
		wait(0.1);
	}

	animscripts\battlechatter_ai::func_73AB();
	waittillframeend;
	self.voice = param_00;
	animscripts\battlechatter_ai::func_850();
}

//Function Number: 182
lib_A59A::func_38CB(param_00)
{
	thread lib_A59A::func_7E2D(1,param_00);
}

//Function Number: 183
lib_A59A::func_38CA(param_00)
{
	thread lib_A59A::func_7E2D(0,param_00);
}

//Function Number: 184
lib_A59A::func_7E2D(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = "allies";
	}

	if(!level.var_1CA5)
	{
		return;
	}

	wait(1.5);
	level.var_38C9[param_01] = param_00;
	var_02 = [];
	var_02 = function_00D6(param_01);
	common_scripts\utility::array_thread(var_02,::lib_A59A::func_7E2C,param_00);
}

//Function Number: 185
lib_A59A::func_7E2C(param_00)
{
	self.var_38C9 = param_00;
}

//Function Number: 186
lib_A59A::func_3AA1()
{
	var_00 = function_00D6("allies");
	foreach(var_02 in var_00)
	{
		if(isalive(var_02))
		{
			var_02 lib_A59A::func_7E3B(0);
		}
	}

	level.var_3A9F = 0;
}

//Function Number: 187
lib_A59A::func_3AA2()
{
	var_00 = function_00D6("allies");
	foreach(var_02 in var_00)
	{
		if(isalive(var_02))
		{
			var_02 lib_A59A::func_7E3B(1);
		}
	}

	level.var_3A9F = 1;
}

//Function Number: 188
lib_A59A::func_7E3B(param_00)
{
	if(param_00)
	{
		self.var_3AA0 = undefined;
		return;
	}

	self.var_3AA0 = 1;
}

//Function Number: 189
lib_A59A::func_261E(param_00)
{
	if(!isplayer(self))
	{
		return;
	}

	switch(param_00)
	{
		case "reznov":
		case "hudson":
		case "mason":
			break;

		default:
			break;
	}
}

//Function Number: 190
lib_A59A::func_2605(param_00)
{
	if(isai(self) && isalive(self))
	{
		if(param_00)
		{
			self.var_2600 = 1;
			return;
		}

		self.var_2600 = 0;
		return;
	}
}

//Function Number: 191
lib_A59A::func_3DFB(param_00)
{
	var_01 = getentarray("objective","targetname");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(var_01[var_02].var_39B == param_00)
		{
			return var_01[var_02].var_2E6;
		}
	}
}

//Function Number: 192
lib_A59A::func_3DFA(param_00)
{
	var_01 = getentarray("objective_event","targetname");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(var_01[var_02].var_39B == param_00)
		{
			return var_01[var_02];
		}
	}
}

//Function Number: 193
lib_A59A::func_A09B()
{
	lib_A59B::func_A09D(1);
}

//Function Number: 194
lib_A59A::func_A09C()
{
	lib_A59B::func_A09D(0);
}

//Function Number: 195
lib_A59A::func_272B()
{
	self notify("Debug origin");
	self endon("Debug origin");
	self endon("death");
	for(;;)
	{
		var_00 = anglestoforward(self.var_41);
		var_01 = var_00 * 30;
		var_02 = var_00 * 20;
		var_03 = anglestoright(self.var_41);
		var_04 = var_03 * -10;
		var_03 = var_03 * 10;
		wait(0.05);
	}
}

//Function Number: 196
lib_A59A::func_3DBE()
{
	var_00 = [];
	if(isdefined(self.script_linkto))
	{
		var_01 = common_scripts\utility::get_links();
		for(var_02 = 0;var_02 < var_01.size;var_02++)
		{
			var_03 = common_scripts\utility::getstruct(var_01[var_02],"script_linkname");
			if(isdefined(var_03))
			{
				var_00[var_00.size] = var_03;
			}
		}
	}

	return var_00;
}

//Function Number: 197
lib_A59A::func_3DAF(param_00)
{
	var_01 = self;
	if(isdefined(var_01.target))
	{
		wait(0.05);
		if(isdefined(var_01.target))
		{
			switch(param_00)
			{
				case "vehiclenode":
					break;

				case "pathnode":
					break;

				case "ent":
					break;

				case "struct":
					break;

				default:
					break;
			}
		}
	}
}

//Function Number: 198
lib_A59A::func_6BF9(param_00)
{
	var_01 = spawn("script_origin",level.var_31D.var_2E6);
	var_01 linkto(level.var_31D);
	if(isdefined(param_00))
	{
		thread lib_A59A::timeout(param_00);
	}

	self method_81A7(var_01);
	if(!isdefined(self.var_63C9))
	{
		self.var_63C9 = self.var_1C7;
	}

	self.var_1C7 = 300;
	common_scripts\utility::waittill_any("goal","timeout");
	if(isdefined(self.var_63C9))
	{
		self.var_1C7 = self.var_63C9;
		self.var_63C9 = undefined;
	}

	var_01 delete();
}

//Function Number: 199
lib_A59A::timeout(param_00)
{
	self endon("death");
	wait(param_00);
	self notify("timeout");
}

//Function Number: 200
lib_A59A::func_7E39()
{
	if(isdefined(self.var_7E38))
	{
		return;
	}

	self.var_63C7 = self.var_2FB;
	self.var_63D4 = self.var_2FC;
	self.var_63D5 = self.var_277;
	self.var_2FB = 8;
	self.var_2FC = 8;
	self.var_277 = 1;
	self.var_7E38 = 1;
}

//Function Number: 201
lib_A59A::func_9A59()
{
	if(!isdefined(self.var_7E38))
	{
		return;
	}

	self.var_2FB = self.var_63C7;
	self.var_2FC = self.var_63D4;
	self.var_277 = self.var_63D5;
	self.var_7E38 = undefined;
}

//Function Number: 202
lib_A59A::func_0CFE(param_00)
{
	var_01 = [];
	var_02 = getarraykeys(param_00);
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_04 = var_02[var_03];
		if(!isalive(param_00[var_04]))
		{
			continue;
		}

		var_01[var_04] = param_00[var_04];
	}

	return var_01;
}

//Function Number: 203
lib_A59A::func_0CFD(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		if(!isalive(var_03))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 204
lib_A59A::func_0CFF(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		if(!isalive(var_03))
		{
			continue;
		}

		if(var_03 lib_A59A::func_2CE6())
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 205
lib_A59A::func_0CFB(param_00,param_01)
{
	var_02 = [];
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		if(param_00[var_03] != param_01)
		{
			var_02[var_02.size] = param_00[var_03];
		}
	}

	return var_02;
}

//Function Number: 206
lib_A59A::func_0CFA(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_00.size - 1;var_02++)
	{
		if(var_02 == param_01)
		{
			param_00[var_02] = param_00[var_02 + 1];
			param_01++;
		}
	}

	param_00[param_00.size - 1] = undefined;
	return param_00;
}

//Function Number: 207
lib_A59A::func_0CF4(param_00,param_01,param_02)
{
	foreach(var_04 in param_00)
	{
		var_04 notify(param_01,param_02);
	}
}

//Function Number: 208
lib_A59A::func_8F5C()
{
	var_00 = spawnstruct();
	var_00.var_CD8 = [];
	var_00.var_55AB = 0;
	return var_00;
}

//Function Number: 209
lib_A59A::func_8F5F(param_00,param_01)
{
	param_00.var_CD8[param_00.var_55AB] = param_01;
	param_01.var_8F5B = param_00.var_55AB;
	param_00.var_55AB++;
}

//Function Number: 210
lib_A59A::func_8F60(param_00,param_01)
{
	lib_A59A::func_8F65(param_00,param_01);
	param_00.var_CD8[param_00.var_55AB - 1] = undefined;
	param_00.var_55AB--;
}

//Function Number: 211
lib_A59A::func_8F61(param_00,param_01)
{
	if(isdefined(param_00.var_CD8[param_00.var_55AB - 1]))
	{
		param_00.var_CD8[param_01] = param_00.var_CD8[param_00.var_55AB - 1];
		param_00.var_CD8[param_01].var_8F5B = param_01;
		param_00.var_CD8[param_00.var_55AB - 1] = undefined;
		param_00.var_55AB = param_00.var_CD8.size;
		return;
	}

	param_00.var_CD8[param_01] = undefined;
	lib_A59A::func_8F62(param_00);
}

//Function Number: 212
lib_A59A::func_8F62(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00.var_CD8)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	param_00.var_CD8 = var_01;
	foreach(var_06, var_03 in param_00.var_CD8)
	{
		var_03.var_8F5B = var_06;
	}

	param_00.var_55AB = param_00.var_CD8.size;
}

//Function Number: 213
lib_A59A::func_8F65(param_00,param_01)
{
	param_00 lib_A59B::func_8F64(param_00.var_CD8[param_00.var_55AB - 1],param_01);
}

//Function Number: 214
lib_A59A::func_8F63(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_01;var_02++)
	{
		param_00 lib_A59B::func_8F64(param_00.var_CD8[var_02],param_00.var_CD8[randomint(param_00.var_55AB)]);
	}
}

//Function Number: 215
lib_A59A::func_3EAE()
{
	if(level.console)
	{
		return " + usereload";
	}

	return " + activate";
}

//Function Number: 216
lib_A59A::func_2534(param_00)
{
	return animscripts\battlechatter_ai::func_2536(param_00);
}

//Function Number: 217
lib_A59A::func_3E73(param_00,param_01)
{
	var_02 = newhudelem();
	if(level.console)
	{
		var_02.x = 68;
		var_02.y = 35;
	}
	else
	{
		var_02.x = 58;
		var_02.y = 95;
	}

	var_02.alignx = "center";
	var_02.aligny = "middle";
	var_02.horzalign = "left";
	var_02.vertalign = "middle";
	if(isdefined(param_01))
	{
		var_03 = param_01;
	}
	else
	{
		var_03 = level.var_357E;
	}

	var_02 setclock(var_03,param_00,"hudStopwatch",64,64);
	return var_02;
}

//Function Number: 218
lib_A59A::func_62ED(param_00)
{
	var_01 = 0;
	for(var_02 = 0;var_02 < level.var_71A.size;var_02++)
	{
		if(level.var_71A[var_02] != param_00)
		{
			continue;
		}

		var_01 = 1;
		break;
	}

	return var_01;
}

//Function Number: 219
lib_A59A::func_62EE(param_00)
{
	var_01 = 0;
	for(var_02 = 0;var_02 < level.var_4C0F.size;var_02++)
	{
		if(level.var_4C0F[var_02] != param_00)
		{
			continue;
		}

		var_01 = 1;
		break;
	}

	return var_01;
}

//Function Number: 220
lib_A59A::func_7E82(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < level.var_71A.size;var_02++)
	{
		if(level.var_71A[var_02] == param_00)
		{
			continue;
		}

		var_01[var_01.size] = level.var_71A[var_02];
	}

	level.var_71A = var_01;
	var_03 = 0;
	for(var_02 = 0;var_02 < level.var_4C0F.size;var_02++)
	{
		if(level.var_4C0F[var_02] != param_00)
		{
			continue;
		}

		var_03 = 1;
	}

	if(!var_03)
	{
		level.var_4C0F[level.var_4C0F.size] = param_00;
	}
}

//Function Number: 221
lib_A59A::func_7E81(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < level.var_4C0F.size;var_02++)
	{
		if(level.var_4C0F[var_02] == param_00)
		{
			continue;
		}

		var_01[var_01.size] = level.var_4C0F[var_02];
	}

	level.var_4C0F = var_01;
	var_03 = 0;
	for(var_02 = 0;var_02 < level.var_71A.size;var_02++)
	{
		if(level.var_71A[var_02] != param_00)
		{
			continue;
		}

		var_03 = 1;
	}

	if(!var_03)
	{
		level.var_71A[level.var_71A.size] = param_00;
	}
}

//Function Number: 222
lib_A59A::func_5CDC()
{
	if(level.var_5CDB)
	{
		return;
	}

	if(isdefined(level.var_60D3))
	{
		return;
	}

	function_00D3("ammoCounterHide",1);
	level.var_5CDB = 1;
	common_scripts\utility::flag_set("missionfailed");
	if(lib_A59A::func_0CC3())
	{
		return;
	}

	if(getdvar("failure_disabled") == "1")
	{
		return;
	}

	if(isdefined(level.var_5CCE))
	{
		thread [[ level.var_5CCE ]]();
		return;
	}

	lib_A59B::func_5CD4(0);
	function_0055();
}

//Function Number: 223
lib_A59A::func_7E77(param_00)
{
	level.var_5CCE = param_00;
}

//Function Number: 224
lib_A59A::script_delay()
{
	if(isdefined(self.script_delay))
	{
		wait(self.script_delay);
		return 1;
	}
	else if(isdefined(self.script_delay_min) && isdefined(self.script_delay_max))
	{
		wait(randomfloatrange(self.script_delay_min,self.script_delay_max));
		return 1;
	}

	return 0;
}

//Function Number: 225
lib_A59A::func_7B1A()
{
	var_00 = gettime();
	if(isdefined(self.var_7B1A))
	{
		wait(self.var_7B1A);
		if(isdefined(self.var_7B1B))
		{
			self.var_7B1A = self.var_7B1A + self.var_7B1B;
		}
	}
	else if(isdefined(self.var_7B1D) && isdefined(self.var_7B1C))
	{
		wait(randomfloatrange(self.var_7B1D,self.var_7B1C));
		if(isdefined(self.var_7B1B))
		{
			self.var_7B1D = self.var_7B1D + self.var_7B1B;
			self.var_7B1C = self.var_7B1C + self.var_7B1B;
		}
	}

	return gettime() - var_00;
}

//Function Number: 226
lib_A59A::func_4490(param_00)
{
	lib_A59F::func_448F(param_00);
}

//Function Number: 227
lib_A59A::func_44AA(param_00,param_01)
{
	lib_A59F::func_44A9(param_00,param_01);
}

//Function Number: 228
lib_A59A::func_3D78(param_00,param_01)
{
	var_02 = function_00D6(param_00);
	var_03 = [];
	for(var_04 = 0;var_04 < var_02.size;var_04++)
	{
		var_05 = var_02[var_04];
		if(!isdefined(var_05.var_79E1))
		{
			continue;
		}

		if(var_05.var_79E1 != param_01)
		{
			continue;
		}

		var_03[var_03.size] = var_05;
	}

	return var_03;
}

//Function Number: 229
lib_A59A::func_3CBC()
{
	var_00 = function_00D6("allies");
	var_01 = [];
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		var_03 = var_00[var_02];
		if(!isdefined(var_03.var_79E1))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 230
lib_A59A::func_3CBE(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = self.target;
	}

	var_01 = [];
	var_02 = getentarray(param_00,"targetname");
	var_01 = common_scripts\utility::array_combine(var_01,var_02);
	var_02 = getnodearray(param_00,"targetname");
	var_01 = common_scripts\utility::array_combine(var_01,var_02);
	var_02 = common_scripts\utility::getstructarray(param_00,"targetname");
	var_01 = common_scripts\utility::array_combine(var_01,var_02);
	var_02 = vehpath_getnodearray(param_00,"targetname");
	var_01 = common_scripts\utility::array_combine(var_01,var_02);
	return var_01;
}

//Function Number: 231
lib_A59A::func_3099()
{
	if(isdefined(self.var_79E1))
	{
		return;
	}

	if(!isdefined(self.var_639E))
	{
		return;
	}

	lib_A59A::func_7E32(self.var_639E);
	self.var_639E = undefined;
}

//Function Number: 232
lib_A59A::func_309A()
{
	self.var_2D2D = 1;
	lib_A59A::func_3099();
}

//Function Number: 233
lib_A59A::func_2A73()
{
	if(isdefined(self.var_6099))
	{
		self endon("death");
		self waittill("done_setting_new_color");
	}

	self method_815E();
	if(!isdefined(self.var_79E1))
	{
		return;
	}

	self.var_639E = self.var_79E1;
	lib_A512::func_7328();
}

//Function Number: 234
lib_A59A::func_1EB8()
{
	lib_A59A::func_2A73();
}

//Function Number: 235
lib_A59A::func_1CC0(param_00)
{
	var_01 = level.var_2048[tolower(param_00)];
	if(isdefined(self.var_79E1) && var_01 == self.var_79E1)
	{
		return 1;
	}

	return 0;
}

//Function Number: 236
lib_A59A::func_3D77()
{
	var_00 = self.var_79E1;
	return var_00;
}

//Function Number: 237
lib_A59A::func_7E32(param_00)
{
	var_01 = lib_A512::func_730(param_00);
}

//Function Number: 238
lib_A59A::func_51BB(param_00,param_01)
{
	lib_A512::func_51BC(param_00,param_01);
}

//Function Number: 239
lib_A59A::func_1EA5(param_00,param_01)
{
	lib_A512::func_1EA6(param_00,param_01);
}

//Function Number: 240
lib_A59A::func_1E95(param_00)
{
	foreach(var_02 in level.var_204D)
	{
		lib_A512::func_1EA6(var_02,param_00);
	}
}

//Function Number: 241
lib_A59A::func_73FF()
{
	thread lib_A512::func_2050();
}

//Function Number: 242
lib_A59A::func_2ACB()
{
	self.var_73FF = undefined;
	self notify("_disable_reinforcement");
}

//Function Number: 243
lib_A59A::func_8EB3()
{
	self notify("_disable_reinforcement");
}

//Function Number: 244
lib_A59A::func_8E5B(param_00,param_01)
{
	thread lib_A512::func_2056(param_00,param_01);
}

//Function Number: 245
lib_A59A::func_893E(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = "allies";
	}

	thread lib_A512::func_2055(param_03,param_00,param_01,param_02);
}

//Function Number: 246
lib_A59A::func_1ECF()
{
	lib_A512::func_204E();
}

//Function Number: 247
lib_A59A::func_7E9C(param_00,param_01)
{
	lib_A512::func_2052(param_00,param_01);
}

//Function Number: 248
lib_A59A::func_7E13(param_00)
{
	lib_A512::func_2051(param_00);
}

//Function Number: 249
lib_A59A::func_46E5()
{
	if(lib_A512::func_3E8D() == "axis")
	{
		return isdefined(self.var_7972) || isdefined(self.var_79E1);
	}

	return isdefined(self.var_7971) || isdefined(self.var_79E1);
}

//Function Number: 250
lib_A59A::func_3D0C()
{
	return lib_A512::func_3D0D();
}

//Function Number: 251
lib_A59A::func_3D08()
{
	return lib_A512::func_3D09();
}

//Function Number: 252
lib_A59A::flashrumbleloop(param_00)
{
	var_01 = gettime() + param_00 * 1000;
	while(gettime() < var_01)
	{
		self playrumbleonentity("damage_heavy");
		wait(0.05);
	}
}

//Function Number: 253
lib_A59A::func_38C0(param_00)
{
	self endon("death");
	self endon("flashed");
	wait(0.2);
	self method_8132(0);
	wait(param_00 + 2);
	self method_8132(1);
}

//Function Number: 254
lib_A59A::func_60EA(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = [0.8,0.7,0.7,0.6];
	var_06 = [1,0.8,0.6,0.6];
	foreach(var_0C, var_08 in var_06)
	{
		var_09 = param_01 - 0.85 / 0.15;
		if(var_09 > param_02)
		{
			param_02 = var_09;
		}

		if(param_02 < 0.25)
		{
			param_02 = 0.25;
		}

		var_0A = 0.3;
		if(param_01 > 1 - var_0A)
		{
			param_01 = 1;
		}
		else
		{
			param_01 = param_01 / 1 - var_0A;
		}

		if(param_04 != self.inliveplayerkillstreak)
		{
			var_0B = param_01 * param_02 * 6;
		}
		else
		{
			var_0B = param_01 * param_02 * 3;
		}

		if(var_0B < 0.25)
		{
			continue;
		}

		var_0B = var_08 * var_0B;
		if(isdefined(self.var_5A35) && var_0B > self.var_5A35)
		{
			var_0B = self.var_5A35;
		}

		self.var_38B4 = param_04;
		self notify("flashed");
		self.flashendtime = gettime() + var_0B * 1000;
		self shellshock("flashbang",var_0B);
		common_scripts\utility::flag_set("player_flashed");
		if(param_01 * param_02 > 0.5)
		{
			thread lib_A59A::func_38C0(var_0B);
		}

		wait(var_05[var_0C]);
	}

	thread lib_A59B::func_9A1D(0.05);
}

//Function Number: 255
lib_A59A::func_38BF()
{
	self endon("death");
	for(;;)
	{
		self waittill("flashbang",var_00,var_01,var_02,var_03,var_04);
		if("1" == getdvar("noflash"))
		{
			continue;
		}

		if(lib_A59A::func_505F(self))
		{
			continue;
		}

		if(isdefined(self.var_932F))
		{
			var_05 = 0.8;
			var_06 = 1 - var_05;
			self.var_932F = undefined;
			if(var_01 < var_06)
			{
				continue;
			}

			var_01 = var_01 - var_06 / var_05;
		}

		var_07 = var_01 - 0.85 / 0.15;
		if(var_07 > var_02)
		{
			var_02 = var_07;
		}

		if(var_02 < 0.25)
		{
			var_02 = 0.25;
		}

		var_08 = 0.3;
		if(var_01 > 1 - var_08)
		{
			var_01 = 1;
		}
		else
		{
			var_01 = var_01 / 1 - var_08;
		}

		if(var_04 != self.inliveplayerkillstreak)
		{
			var_09 = var_01 * var_02 * 6;
		}
		else
		{
			var_09 = var_01 * var_02 * 3;
		}

		if(var_09 < 0.25)
		{
			continue;
		}

		if(isdefined(self.var_5A35) && var_09 > self.var_5A35)
		{
			var_09 = self.var_5A35;
		}

		self.var_38B4 = var_04;
		self notify("flashed");
		self.flashendtime = gettime() + var_09 * 1000;
		self shellshock("flashbang",var_09);
		self method_83C1("flashed",0.1);
		common_scripts\utility::flag_set("player_flashed");
		thread lib_A59B::func_9A1D(var_09);
		wait(0.1);
		self method_83C2(var_09 - 0.1);
		if(var_01 * var_02 > 0.5)
		{
			thread lib_A59A::func_38C0(var_09);
		}

		if(var_09 > 2)
		{
			thread lib_A59A::flashrumbleloop(0.75);
		}
		else
		{
			thread lib_A59A::flashrumbleloop(0.25);
		}

		if(var_04 != "allies")
		{
			thread lib_A59A::func_38C1(var_09,var_04);
		}
	}
}

//Function Number: 256
lib_A59A::func_38C1(param_00,param_01)
{
	wait(0.05);
	var_02 = function_00D6("allies");
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		if(distancesquared(var_02[var_03].var_2E6,self.var_2E6) < 122500)
		{
			var_04 = param_00 + randomfloatrange(-1000,1500);
			if(var_04 > 4.5)
			{
				var_04 = 4.5;
			}
			else if(var_04 < 0.25)
			{
				continue;
			}

			var_05 = gettime() + var_04 * 1000;
			if(!isdefined(var_02[var_03].flashendtime) || var_02[var_03].flashendtime < var_05)
			{
				var_02[var_03].var_38B4 = param_01;
				var_02[var_03] lib_A59A::func_38A9(var_04);
			}
		}
	}
}

//Function Number: 257
lib_A59A::func_748A()
{
	common_scripts\_createfx::restart_fx_looper();
}

//Function Number: 258
lib_A59A::func_671D(param_00)
{
	param_00 = param_00 + "";
	if(isdefined(level.createfxexploders))
	{
		var_01 = level.createfxexploders[param_00];
		if(isdefined(var_01))
		{
			foreach(var_03 in var_01)
			{
				var_03 common_scripts\utility::pauseeffect();
			}

			return;
		}

		return;
	}

	foreach(var_06 in level.createfxent)
	{
		if(!isdefined(var_06.v["exploder"]))
		{
			continue;
		}

		if(var_06.v["exploder"] != var_03)
		{
			continue;
		}

		var_06 common_scripts\utility::pauseeffect();
	}
}

//Function Number: 259
lib_A59A::func_748B(param_00)
{
	param_00 = param_00 + "";
	if(isdefined(level.createfxexploders))
	{
		var_01 = level.createfxexploders[param_00];
		if(isdefined(var_01))
		{
			foreach(var_03 in var_01)
			{
				var_03 lib_A59A::func_748A();
			}

			return;
		}

		return;
	}

	foreach(var_06 in level.createfxent)
	{
		if(!isdefined(var_06.v["exploder"]))
		{
			continue;
		}

		if(var_06.v["exploder"] != var_03)
		{
			continue;
		}

		var_06 lib_A59A::func_748A();
	}
}

//Function Number: 260
lib_A59A::func_3FA7(param_00)
{
	var_01 = [];
	if(isdefined(level.createfxbyfxid))
	{
		var_02 = level.createfxbyfxid[param_00];
		if(isdefined(var_02))
		{
			var_01 = var_02;
		}
	}
	else
	{
		for(var_03 = 0;var_03 < level.createfxent.size;var_03++)
		{
			if(level.createfxent[var_03].v["fxid"] == param_00)
			{
				var_01[var_01.size] = level.createfxent[var_03];
			}
		}
	}

	return var_01;
}

//Function Number: 261
lib_A59A::func_4BAD(param_00)
{
	self notify("ignoreAllEnemies_threaded");
	self endon("ignoreAllEnemies_threaded");
	if(param_00)
	{
		self.var_63B4 = self sentient_getthreatbiasgroup();
		var_01 = undefined;
		createthreatbiasgroup("ignore_everybody");
		self sentient_setthreatbiasgroup("ignore_everybody");
		var_02 = [];
		var_02["axis"] = "allies";
		var_02["allies"] = "axis";
		var_03 = function_00D6(var_02[self.inliveplayerkillstreak]);
		var_04 = [];
		for(var_05 = 0;var_05 < var_03.size;var_05++)
		{
			var_04[var_03[var_05] sentient_getthreatbiasgroup()] = 1;
		}

		var_06 = getarraykeys(var_04);
		for(var_05 = 0;var_05 < var_06.size;var_05++)
		{
			setthreatbias(var_06[var_05],"ignore_everybody",0);
		}

		return;
	}

	var_01 = undefined;
	if(self.var_63B4 != "")
	{
		self sentient_setthreatbiasgroup(self.var_63B4);
	}

	self.var_63B4 = undefined;
}

//Function Number: 262
lib_A59A::func_9CAB()
{
	lib_A5A0::func_9D0E();
}

//Function Number: 263
lib_A59A::func_9D17()
{
	thread lib_A5A0::func_9D18();
}

//Function Number: 264
lib_A59A::func_9CED(param_00)
{
	lib_A5A0::func_9CEF(param_00);
}

//Function Number: 265
lib_A59A::func_9CF4(param_00)
{
	lib_A5A0::func_9CF5(param_00);
}

//Function Number: 266
lib_A59A::func_9CB7(param_00,param_01)
{
	lib_A59E::func_9D0F(param_00,param_01);
}

//Function Number: 267
lib_A59A::func_4414(param_00)
{
	return bullettrace(param_00,param_00 + (0,0,-100000),0,self)["position"];
}

//Function Number: 268
lib_A59A::func_1C72(param_00)
{
	self.var_6B4B = self.var_6B4B + param_00;
	self notify("update_health_packets");
	if(self.var_6B4B >= 3)
	{
		self.var_6B4B = 3;
	}
}

//Function Number: 269
lib_A59A::func_4152(param_00)
{
	var_01 = lib_A59A::func_4153(param_00);
	return var_01[0];
}

//Function Number: 270
lib_A59A::func_4153(param_00)
{
	return lib_A5A0::func_5BE(param_00);
}

//Function Number: 271
lib_A59A::func_28AF(param_00,param_01,param_02,param_03,param_04,param_05)
{
	lib_A59A::func_079D();
	if(!isdefined(level.var_8B7D))
	{
		level.var_8B7D = [];
	}

	level.var_8B7D[param_00] = lib_A59A::func_079E(param_00,param_01,param_02,param_03,[param_04],param_05);
}

//Function Number: 272
lib_A59A::func_079C(param_00,param_01,param_02,param_03,param_04,param_05)
{
	lib_A59A::func_079D();
	param_00 = tolower(param_00);
	if(isdefined(param_04))
	{
		if(param_04.size > 2)
		{
			var_06 = [];
			var_06[0] = param_04[0];
			var_06[1] = param_04[1];
			param_04 = var_06;
		}

		if(!isdefined(level.var_8CD8))
		{
			level.var_8CD8 = [];
		}

		foreach(var_08 in param_04)
		{
			if(!common_scripts\utility::array_contains(level.var_8CD8,var_08))
			{
				level.var_8CD8[level.var_8CD8.size] = var_08;
			}
		}
	}

	if(isdefined(level.var_8B7D) && isdefined(level.var_8B7D[param_00]))
	{
		var_0B = level.var_8B7D[param_00];
	}
	else
	{
		var_0B = lib_A59A::func_079E(param_01,param_02,param_03,param_04,param_05,var_0B);
	}

	if(!isdefined(param_01))
	{
		if(!isdefined(level.var_8B7D))
		{
		}
		else if(!issubstr(param_00,"no_game"))
		{
			if(!isdefined(level.var_8B7D[param_00]))
			{
				return;
			}
		}
	}

	level.var_8BAF[level.var_8BAF.size] = var_0B;
	level.var_8B2E[param_00] = var_0B;
}

//Function Number: 273
lib_A59A::func_7EBE(param_00,param_01)
{
	if(!isdefined(level.var_8B2E))
	{
		return;
	}

	if(!isdefined(level.var_8B2E[param_00]))
	{
		return;
	}

	param_00 = tolower(param_00);
	if(param_01.size > 2)
	{
		var_02 = [];
		var_02[0] = param_01[0];
		var_02[1] = param_01[1];
		param_01 = var_02;
	}

	if(!isdefined(level.var_8CD8))
	{
		level.var_8CD8 = [];
	}

	foreach(var_04 in param_01)
	{
		if(!common_scripts\utility::array_contains(level.var_8CD8,var_04))
		{
			level.var_8CD8[level.var_8CD8.size] = var_04;
		}
	}

	level.var_8B2E[param_00]["transients_to_load"] = param_01;
}

//Function Number: 274
lib_A59A::func_5053()
{
	return issubstr(level.var_8C30,"no_game");
}

//Function Number: 275
lib_A59A::func_079E(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = [];
	var_06["name"] = param_00;
	var_06["start_func"] = param_01;
	var_06["start_loc_string"] = param_02;
	var_06["logic_func"] = param_03;
	var_06["transients_to_load"] = param_04;
	var_06["catchup_function"] = param_05;
	return var_06;
}

//Function Number: 276
lib_A59A::func_079D()
{
	if(!isdefined(level.var_8BAF))
	{
		level.var_8BAF = [];
	}
}

//Function Number: 277
lib_A59A::func_56BF()
{
	return level.var_8BAF.size > 1;
}

//Function Number: 278
lib_A59A::func_7E06(param_00)
{
	level.var_278B = param_00;
}

//Function Number: 279
lib_A59A::func_278A(param_00)
{
	level.var_278A = param_00;
}

//Function Number: 280
lib_A59A::func_5774(param_00,param_01,param_02,param_03)
{
	thread lib_A59B::func_5775(param_00,param_01,param_02,param_03);
}

//Function Number: 281
lib_A59A::func_A33F(param_00,param_01,param_02,param_03)
{
	var_04 = vectornormalize((param_02[0],param_02[1],0) - (param_00[0],param_00[1],0));
	var_05 = anglestoforward((0,param_01[1],0));
	return vectordot(var_05,var_04) >= param_03;
}

//Function Number: 282
lib_A59A::func_3D44(param_00,param_01,param_02)
{
	var_03 = vectornormalize(param_02 - param_00);
	var_04 = anglestoforward(param_01);
	var_05 = vectordot(var_04,var_03);
	return var_05;
}

//Function Number: 283
lib_A59A::func_A340(param_00,param_01)
{
	var_02 = undefined;
	for(var_03 = 0;var_03 < level.var_328.size;var_03++)
	{
		var_04 = level.var_328[var_03] geteye();
		var_02 = common_scripts\utility::within_fov(var_04,level.var_328[var_03] getplayerangles(),param_00,param_01);
		if(!var_02)
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 284
lib_A59A::func_9F83(param_00,param_01)
{
	var_02 = param_01 * 1000 - gettime() - param_00;
	var_02 = var_02 * 0.001;
	if(var_02 > 0)
	{
		wait(var_02);
	}
}

//Function Number: 285
lib_A59A::func_134E()
{
	anim.var_7B3A = gettime();
}

//Function Number: 286
lib_A59A::func_2A31(param_00)
{
	var_01 = function_028C(param_00,"squelchname");
	if(self == level || var_01 != "")
	{
		lib_A59A::func_70BA(param_00,undefined,var_01);
		return;
	}

	lib_A59A::func_134E();
	lib_A506::func_C21(self,param_00);
}

//Function Number: 287
lib_A59A::func_3C8B(param_00,param_01)
{
	lib_A59A::func_134E();
	lib_A506::func_BCF(self,param_00,undefined,undefined,param_01);
}

//Function Number: 288
lib_A59A::func_70BA(param_00,param_01,param_02)
{
	if(!isdefined(level.var_6BCA))
	{
		var_03 = spawn("script_origin",(0,0,0));
		var_03 linkto(level.var_31D,"",(0,0,0),(0,0,0));
		level.var_6BCA = var_03;
	}

	lib_A59A::func_134E();
	if(!isdefined(param_01))
	{
		return level.var_6BCA lib_A59A::func_3AF0(::lib_A59A::func_70C0,param_00,param_02);
	}

	return level.var_6BCA lib_A59A::func_3AF6(param_01,::lib_A59A::func_70C0,param_00,param_02);
}

//Function Number: 289
lib_A59A::func_70C0(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = "none";
	}

	level.var_6BCC = 0;
	if(param_01 != "none" && isdefined(level.var_78B6["squelches"][param_01]))
	{
		lib_A59A::play_sound_on_tag(level.var_78B6["squelches"][param_01]["on"],undefined,1);
	}

	var_02 = 0;
	if(isdefined(level.var_78B6[param_00]))
	{
		var_02 = lib_A59A::play_sound_on_tag(level.var_78B6[param_00],undefined,1);
	}
	else
	{
		var_02 = lib_A59A::play_sound_on_tag(param_00,undefined,1);
	}

	if(param_01 != "none" && isdefined(level.var_78B6["squelches"][param_01]))
	{
		thread lib_A59A::func_70C9(param_01);
	}

	return var_02;
}

//Function Number: 290
lib_A59A::func_70BE(param_00)
{
	if(!isdefined(level.var_6BCB))
	{
		level.var_6BCB = [];
	}

	var_01 = spawn("script_origin",(0,0,0));
	level.var_6BCB[level.var_6BCB.size] = var_01;
	var_01 endon("death");
	thread lib_A59A::func_2825(var_01,"sounddone");
	var_01.var_2E6 = level.var_6BCA.var_2E6;
	var_01.var_41 = level.var_6BCA.var_41;
	var_01 linkto(level.var_6BCA);
	var_01 playsoundasmaster(level.var_78B6[param_00],"sounddone");
	if(!isdefined(lib_A59B::func_9FB4(var_01)))
	{
		var_01 stopsounds();
	}

	wait(0.05);
	level.var_6BCB = common_scripts\utility::array_remove(level.var_6BCB,var_01);
	var_01 delete();
}

//Function Number: 291
lib_A59A::func_70C6()
{
	if(!isdefined(level.var_6BCA))
	{
		return;
	}

	level.var_6BCA delete();
}

//Function Number: 292
lib_A59A::func_70BF()
{
	if(!isdefined(level.var_6BCB))
	{
		return;
	}

	foreach(var_01 in level.var_6BCB)
	{
		if(isdefined(var_01))
		{
			var_01 stopsounds();
			wait(0.05);
			var_01 delete();
		}
	}

	level.var_6BCB = undefined;
}

//Function Number: 293
lib_A59A::func_70BB()
{
	if(!isdefined(level.var_6BCA))
	{
		return;
	}

	level.var_6BCA lib_A59A::func_3AF2();
}

//Function Number: 294
lib_A59A::func_70C4(param_00)
{
	if(!isdefined(level.var_6BCA))
	{
		return;
	}

	if(!isdefined(level.var_6BCA.var_3AF0))
	{
		return;
	}

	var_01 = [];
	var_02 = 0;
	var_03 = level.var_6BCA.var_3AF0.size;
	for(var_04 = 0;var_04 < var_03;var_04++)
	{
		if(var_04 == 0 && isdefined(level.var_6BCA.var_3AF0[0].var_3AF3) && isdefined(level.var_6BCA.var_3AF0[0].var_3AF3))
		{
			var_01[var_01.size] = level.var_6BCA.var_3AF0[var_04];
			continue;
		}

		if(isdefined(level.var_6BCA.var_3AF0[var_04].var_667F) && level.var_6BCA.var_3AF0[var_04].var_667F == param_00)
		{
			level.var_6BCA.var_3AF0[var_04] notify("death");
			level.var_6BCA.var_3AF0[var_04] = undefined;
			var_02 = 1;
			continue;
		}

		var_01[var_01.size] = level.var_6BCA.var_3AF0[var_04];
	}

	if(var_02)
	{
		level.var_6BCA.var_3AF0 = var_01;
	}
}

//Function Number: 295
lib_A59A::func_70BC(param_00)
{
	if(!isdefined(level.var_6BCA))
	{
		var_01 = spawn("script_origin",(0,0,0));
		var_01 linkto(level.var_31D,"",(0,0,0),(0,0,0));
		level.var_6BCA = var_01;
	}

	level.var_6BCA lib_A59A::play_sound_on_tag(level.var_78B6[param_00],undefined,1);
}

//Function Number: 296
lib_A59A::func_70C5(param_00)
{
	return lib_A59A::func_70BA(param_00,0.05);
}

//Function Number: 297
lib_A59A::func_8666(param_00,param_01)
{
	var_02 = function_028C(param_00,"squelchname");
	lib_A59B::func_7AF(param_00);
	lib_A59A::func_70BA(param_00,param_01,var_02);
}

//Function Number: 298
lib_A59A::func_8667(param_00)
{
	lib_A59B::func_7AF(param_00);
	lib_A59A::func_70C6();
	lib_A59A::func_70BC(param_00);
}

//Function Number: 299
lib_A59A::func_8669(param_00)
{
	lib_A59B::func_7AF(param_00);
	lib_A59A::func_70BE(param_00);
}

//Function Number: 300
lib_A59A::func_8657(param_00)
{
	lib_A59B::func_7A9(param_00);
	lib_A59A::func_2A31(param_00);
}

//Function Number: 301
lib_A59A::func_8658(param_00)
{
	lib_A59B::func_7AA(param_00);
	lib_A59A::func_3C8B(param_00);
}

//Function Number: 302
lib_A59A::func_70C9(param_00,param_01)
{
	self endon("death");
	if(!isdefined(param_01))
	{
		param_01 = 0.1;
	}

	level.var_6BCC = 1;
	wait(param_01);
	if(isdefined(level.var_6BCA) && level.var_6BCC == 1)
	{
		level.var_6BCA lib_A59A::func_3AF0(::lib_A59A::play_sound_on_tag,level.var_78B6["squelches"][param_00]["off"],undefined,1);
	}
}

//Function Number: 303
lib_A59A::func_70C1(param_00,param_01)
{
	lib_A59A::func_70BA(param_00,undefined,param_01);
}

//Function Number: 304
lib_A59A::func_48C3(param_00,param_01,param_02)
{
	var_03 = spawnstruct();
	if(isdefined(param_01) && param_01 == 1)
	{
		var_03.var_141D = newhudelem();
	}

	var_03.var_305E = newhudelem();
	var_03 lib_A59A::func_48D7(param_02);
	var_03.var_305E settext(param_00);
	return var_03;
}

//Function Number: 305
lib_A59A::func_48C6()
{
	self notify("death");
	if(isdefined(self.var_305E))
	{
		self.var_305E destroy();
	}

	if(isdefined(self.var_141D))
	{
		self.var_141D destroy();
	}
}

//Function Number: 306
lib_A59A::func_48D7(param_00)
{
	if(level.console)
	{
		self.var_305E.var_18C = 2;
	}
	else
	{
		self.var_305E.var_18C = 1.6;
	}

	self.var_305E.x = 0;
	self.var_305E.y = -40;
	self.var_305E.alignx = "center";
	self.var_305E.aligny = "bottom";
	self.var_305E.horzalign = "center";
	self.var_305E.vertalign = "middle";
	self.var_305E.fontscale = 1;
	self.var_305E.alpha = 0.8;
	if(!isdefined(self.var_141D))
	{
		return;
	}

	self.var_141D.x = 0;
	self.var_141D.y = -40;
	self.var_141D.alignx = "center";
	self.var_141D.aligny = "middle";
	self.var_141D.horzalign = "center";
	self.var_141D.vertalign = "middle";
	self.var_141D.fontscale = -1;
	if(level.console)
	{
		self.var_141D setshader("popmenu_bg",650,52);
	}
	else
	{
		self.var_141D setshader("popmenu_bg",650,42);
	}

	if(!isdefined(param_00))
	{
		param_00 = 0.5;
	}

	self.var_141D.alpha = param_00;
}

//Function Number: 307
lib_A59A::func_8F4D(param_00)
{
	return "" + param_00;
}

//Function Number: 308
lib_A59A::func_5083(param_00)
{
	var_01 = float(param_00);
	return lib_A59A::func_8F4D(var_01) == param_00;
}

//Function Number: 309
lib_A59A::func_4BB0(param_00,param_01)
{
	setignoremegroup(param_00,param_01);
	setignoremegroup(param_01,param_00);
}

//Function Number: 310
lib_A59A::func_0761(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = [];
	var_05["function"] = param_01;
	var_05["param1"] = param_02;
	var_05["param2"] = param_03;
	var_05["param3"] = param_04;
	level.var_88F8[param_00][level.var_88F8[param_00].size] = var_05;
}

//Function Number: 311
lib_A59A::func_7358(param_00,param_01)
{
	var_02 = [];
	for(var_03 = 0;var_03 < level.var_88F8[param_00].size;var_03++)
	{
		if(level.var_88F8[param_00][var_03]["function"] != param_01)
		{
			var_02[var_02.size] = level.var_88F8[param_00][var_03];
		}
	}

	level.var_88F8[param_00] = var_02;
}

//Function Number: 312
lib_A59A::func_3414(param_00,param_01)
{
	if(!isdefined(level.var_88F8))
	{
		return 0;
	}

	for(var_02 = 0;var_02 < level.var_88F8[param_00].size;var_02++)
	{
		if(level.var_88F8[param_00][var_02]["function"] == param_01)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 313
lib_A59A::func_737D(param_00)
{
	var_01 = [];
	foreach(var_03 in self.var_88FA)
	{
		if(var_03["function"] == param_00)
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	self.var_88FA = var_01;
}

//Function Number: 314
lib_A59A::func_0798(param_00,param_01,param_02,param_03,param_04,param_05)
{
	foreach(var_07 in self.var_88FA)
	{
		if(var_07["function"] == param_00)
		{
			return;
		}
	}

	var_09 = [];
	var_09["function"] = param_00;
	var_09["param1"] = param_01;
	var_09["param2"] = param_02;
	var_09["param3"] = param_03;
	var_09["param4"] = param_04;
	var_09["param5"] = param_05;
	self.var_88FA[self.var_88FA.size] = var_09;
}

//Function Number: 315
lib_A59A::func_0CE5(param_00)
{
	for(var_01 = 0;var_01 < param_00.size;var_01++)
	{
		param_00[var_01] delete();
	}
}

//Function Number: 316
lib_A59A::func_0CEE(param_00)
{
	for(var_01 = 0;var_01 < param_00.size;var_01++)
	{
		param_00[var_01] method_8052();
	}
}

//Function Number: 317
lib_A59A::func_4BA9(param_00)
{
	self endon("death");
	self.var_203 = 1;
	if(isdefined(param_00))
	{
		wait(param_00);
	}
	else
	{
		wait(0.5);
	}

	self.var_203 = 0;
}

//Function Number: 318
lib_A59A::func_070A(param_00)
{
	var_01 = getent(param_00,"targetname");
	var_01 lib_A59A::func_0706();
}

//Function Number: 319
lib_A59A::func_0709(param_00)
{
	var_01 = getent(param_00,"script_noteworthy");
	var_01 lib_A59A::func_0706();
}

//Function Number: 320
lib_A59A::func_2AE7(param_00)
{
	var_01 = getent(param_00,"targetname");
	var_01 common_scripts\utility::trigger_off();
}

//Function Number: 321
lib_A59A::func_2AE6(param_00)
{
	var_01 = getent(param_00,"script_noteworthy");
	var_01 common_scripts\utility::trigger_off();
}

//Function Number: 322
lib_A59A::func_3100(param_00)
{
	var_01 = getent(param_00,"targetname");
	var_01 common_scripts\utility::trigger_on();
}

//Function Number: 323
lib_A59A::func_30FF(param_00)
{
	var_01 = getent(param_00,"script_noteworthy");
	var_01 common_scripts\utility::trigger_on();
}

//Function Number: 324
lib_A59A::func_5033()
{
	return isdefined(level.var_4837[lib_A59A::func_3CB5()]);
}

//Function Number: 325
lib_A59A::func_3CB5()
{
	if(!isdefined(self.unique_id))
	{
		lib_A59A::func_7DAF();
	}

	return self.unique_id;
}

//Function Number: 326
lib_A59A::func_7DAF()
{
	self.unique_id = "ai" + level.var_908;
	level.var_908++;
}

//Function Number: 327
lib_A59A::func_5923()
{
	level.var_4837[self.unique_id] = 1;
}

//Function Number: 328
lib_A59A::func_9A43()
{
	level.var_4837[self.unique_id] = undefined;
}

//Function Number: 329
lib_A59A::func_3D92()
{
	var_00 = [];
	var_01 = function_00D6("allies");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(var_01[var_02] lib_A59A::func_5033())
		{
			var_00[var_00.size] = var_01[var_02];
		}
	}

	return var_00;
}

//Function Number: 330
lib_A59A::func_7ECD(param_00,param_01)
{
	var_02 = function_00D6(param_00);
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_02[var_03].var_2EA = param_01;
	}
}

//Function Number: 331
lib_A59A::func_733C(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		if(!isalive(var_03))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 332
lib_A59A::func_735B(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		if(param_00[var_02] lib_A59A::func_5033())
		{
			continue;
		}

		var_01[var_01.size] = param_00[var_02];
	}

	return var_01;
}

//Function Number: 333
lib_A59A::func_7336(param_00,param_01)
{
	var_02 = [];
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		var_04 = param_00[var_03];
		if(!isdefined(var_04.var_79E1))
		{
			continue;
		}

		if(var_04.var_79E1 == param_01)
		{
			continue;
		}

		var_02[var_02.size] = var_04;
	}

	return var_02;
}

//Function Number: 334
lib_A59A::func_736F(param_00,param_01)
{
	var_02 = [];
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		var_04 = param_00[var_03];
		if(!isdefined(var_04.var_39B))
		{
			continue;
		}

		if(var_04.var_39B == param_01)
		{
			continue;
		}

		var_02[var_02.size] = var_04;
	}

	return var_02;
}

//Function Number: 335
lib_A59A::func_3CF2(param_00,param_01)
{
	var_02 = lib_A59A::func_3D78("allies",param_00);
	var_02 = lib_A59A::func_735B(var_02);
	if(!isdefined(param_01))
	{
		var_03 = level.var_31D.var_2E6;
	}
	else
	{
		var_03 = var_02;
	}

	return common_scripts\utility::getclosest(var_03,var_02);
}

//Function Number: 336
lib_A59A::func_738C(param_00,param_01)
{
	var_02 = [];
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		if(!issubstr(param_00[var_03].classname,param_01))
		{
			continue;
		}

		var_02[var_02.size] = param_00[var_03];
	}

	return var_02;
}

//Function Number: 337
lib_A59A::func_738D(param_00,param_01)
{
	var_02 = [];
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		if(!issubstr(param_00[var_03].model,param_01))
		{
			continue;
		}

		var_02[var_02.size] = param_00[var_03];
	}

	return var_02;
}

//Function Number: 338
lib_A59A::func_3CF3(param_00,param_01,param_02)
{
	var_03 = lib_A59A::func_3D78("allies",param_00);
	var_03 = lib_A59A::func_735B(var_03);
	if(!isdefined(param_02))
	{
		var_04 = level.var_31D.var_2E6;
	}
	else
	{
		var_04 = var_03;
	}

	var_03 = lib_A59A::func_738C(var_03,param_01);
	return common_scripts\utility::getclosest(var_04,var_03);
}

//Function Number: 339
lib_A59A::func_7013(param_00,param_01)
{
	for(;;)
	{
		var_02 = lib_A59A::func_3CF2(param_00);
		if(!isalive(var_02))
		{
			wait(1);
			continue;
		}

		var_02 lib_A59A::func_7E32(param_01);
	}
}

//Function Number: 340
lib_A59A::func_4E87(param_00,param_01)
{
	for(;;)
	{
		var_02 = lib_A59A::func_3CF2(param_00);
		if(!isalive(var_02))
		{
			return;
		}

		var_02 lib_A59A::func_7E32(param_01);
	}
}

//Function Number: 341
lib_A59A::func_4E88(param_00,param_01,param_02)
{
	for(;;)
	{
		var_03 = lib_A59A::func_3CF3(param_00,param_02);
		if(!isalive(var_03))
		{
			return;
		}

		var_03 lib_A59A::func_7E32(param_01);
	}
}

//Function Number: 342
lib_A59A::func_7014(param_00,param_01,param_02)
{
	for(;;)
	{
		var_03 = lib_A59A::func_3CF3(param_00,param_02);
		if(!isalive(var_03))
		{
			wait(1);
			continue;
		}

		var_03 lib_A59A::func_7E32(param_01);
	}
}

//Function Number: 343
lib_A59A::func_753D(param_00)
{
	self method_818F("face angle",param_00);
	self.var_258 = 1;
}

//Function Number: 344
lib_A59A::func_7546()
{
	self.var_258 = 0;
}

//Function Number: 345
lib_A59A::func_4E8A(param_00,param_01,param_02)
{
	var_03 = 0;
	var_04 = [];
	for(var_05 = 0;var_05 < param_00.size;var_05++)
	{
		var_06 = param_00[var_05];
		if(var_03 || !issubstr(var_06.classname,param_02))
		{
			var_04[var_04.size] = var_06;
			continue;
		}

		var_03 = 1;
		var_06 lib_A59A::func_7E32(param_01);
	}

	return var_04;
}

//Function Number: 346
lib_A59A::func_4E89(param_00,param_01)
{
	var_02 = 0;
	var_03 = [];
	for(var_04 = 0;var_04 < param_00.size;var_04++)
	{
		var_05 = param_00[var_04];
		if(var_02)
		{
			var_03[var_03.size] = var_05;
			continue;
		}

		var_02 = 1;
		var_05 lib_A59A::func_7E32(param_01);
	}

	return var_03;
}

//Function Number: 347
lib_A59A::func_9FB2(param_00)
{
	lib_A59B::func_9FBA(param_00,"script_noteworthy");
}

//Function Number: 348
lib_A59A::func_9FB7(param_00)
{
	lib_A59B::func_9FBA(param_00,"targetname");
}

//Function Number: 349
lib_A59A::func_9F98(param_00,param_01)
{
	if(common_scripts\utility::flag(param_00))
	{
		return;
	}

	level endon(param_00);
	wait(param_01);
}

//Function Number: 350
lib_A59A::func_9FAA(param_00,param_01)
{
	self endon(param_00);
	wait(param_01);
}

//Function Number: 351
lib_A59A::func_9FBF(param_00)
{
	self endon("trigger");
	wait(param_00);
}

//Function Number: 352
lib_A59A::func_9F8B(param_00,param_01)
{
	var_02 = spawnstruct();
	var_03 = [];
	var_03 = common_scripts\utility::array_combine(var_03,getentarray(param_00,"targetname"));
	var_03 = common_scripts\utility::array_combine(var_03,getentarray(param_01,"targetname"));
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_02 thread lib_A59B::func_32ED(var_03[var_04]);
	}

	var_02 waittill("done");
}

//Function Number: 353
lib_A59A::func_2F29(param_00)
{
	var_01 = lib_A577::func_89BB(param_00);
	return var_01;
}

//Function Number: 354
lib_A59A::func_2F28(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = self;
	}

	var_01 = lib_A577::func_89BB(param_00);
	var_01 [[ level.var_2EBF ]]();
	var_01.var_88F8 = param_00.var_88FA;
	var_01 thread lib_A577::func_76B3();
	var_01.spawner = param_00;
	return var_01;
}

//Function Number: 355
lib_A59A::func_8FFC(param_00)
{
	return lib_A577::func_89C2(param_00);
}

//Function Number: 356
lib_A59A::func_9001(param_00)
{
	return lib_A577::func_89C3(param_00);
}

//Function Number: 357
lib_A59A::func_3EA1()
{
	if(isdefined(self.var_79CE))
	{
		return self.var_79CE;
	}

	if(isdefined(self.var_39B))
	{
		return self.var_39B;
	}
}

//Function Number: 358
lib_A59A::func_7E05()
{
	self.var_2FC = 192;
	self.var_2FB = 192;
}

//Function Number: 359
lib_A59A::func_22DA(param_00)
{
	if(param_00 == "on")
	{
		lib_A59A::func_30AF();
		return;
	}

	lib_A59A::func_2A8C();
}

//Function Number: 360
lib_A59A::func_30AF(param_00)
{
	if(self.type == "dog")
	{
		return;
	}

	if(!isdefined(param_00))
	{
		self.var_22DD = 1;
	}

	self.var_22E0 = 1;
	self.var_4CB = 0.2;
	level thread animscripts\cqb::func_377C();
}

//Function Number: 361
lib_A59A::func_2A8C()
{
	if(self.type == "dog")
	{
		return;
	}

	self.var_22E0 = undefined;
	self.var_22DD = undefined;
	self.var_4CB = 0.3;
	self.var_22D6 = undefined;
}

//Function Number: 362
lib_A59A::func_30EA()
{
	self.var_1944 = 1;
}

//Function Number: 363
lib_A59A::func_2ACA()
{
	self.var_1944 = undefined;
}

//Function Number: 364
lib_A59A::func_22CF(param_00)
{
	if(!isdefined(param_00))
	{
		self.var_22D8 = undefined;
		return;
	}

	self.var_22D8 = param_00;
	if(!isdefined(param_00.var_2E6))
	{
	}
}

//Function Number: 365
lib_A59A::func_7E34(param_00)
{
	if(isdefined(param_00) && param_00)
	{
		self.var_39CB = 1;
		return;
	}

	self.var_39CB = undefined;
}

//Function Number: 366
lib_A59A::func_2BC2(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_01))
	{
		[[ param_00 ]](param_01);
	}
	else
	{
		[[ param_00 ]]();
	}

	if(isdefined(param_03))
	{
		[[ param_02 ]](param_03);
		return;
	}

	[[ param_02 ]]();
}

//Function Number: 367
lib_A59A::func_7C7C(param_00,param_01)
{
	if(isdefined(param_01))
	{
		self notify(param_00,param_01);
		return;
	}

	self notify(param_00);
}

//Function Number: 368
lib_A59A::func_A08F(param_00,param_01,param_02)
{
	var_03 = spawnstruct();
	var_03 endon("complete");
	var_03 lib_A59A::delaythread(param_02,::lib_A59A::func_7C7C,"complete");
	self waittillmatch(param_01,param_00);
}

//Function Number: 369
lib_A59A::func_284D(param_00)
{
	param_00 notify("deleted");
	param_00 delete();
}

//Function Number: 370
lib_A59A::func_3813(param_00)
{
	if(!isdefined(self.var_93FE))
	{
		self.var_93FE = [];
	}

	if(isdefined(self.var_93FE[param_00.unique_id]))
	{
		return 0;
	}

	self.var_93FE[param_00.unique_id] = 1;
	return 1;
}

//Function Number: 371
lib_A59A::func_3EF3(param_00)
{
	return level.var_78A9[self.animname][param_00];
}

//Function Number: 372
lib_A59A::func_4715(param_00)
{
	return isdefined(level.var_78A9[self.animname][param_00]);
}

//Function Number: 373
lib_A59A::func_3EF4(param_00,param_01)
{
	return level.var_78A9[param_01][param_00];
}

//Function Number: 374
lib_A59A::func_3EF5(param_00)
{
	return level.var_78A9["generic"][param_00];
}

//Function Number: 375
lib_A59A::func_0764(param_00,param_01,param_02)
{
	if(!isdefined(level.var_97A1))
	{
		level.var_97A1 = [];
		level.var_97A0 = [];
	}

	level.var_97A1[param_00] = param_01;
	precachestring(param_01);
	if(isdefined(param_02))
	{
		level.var_97A0[param_00] = param_02;
	}
}

//Function Number: 376
lib_A59A::func_84D5(param_00)
{
	thread lib_A59B::func_850E(param_00);
}

//Function Number: 377
lib_A59A::func_4854(param_00)
{
	param_00.timeout = 1;
}

//Function Number: 378
lib_A59A::func_37BF(param_00,param_01)
{
	var_02 = spawn("trigger_radius",param_00,0,param_01,48);
	for(;;)
	{
		var_02 waittill("trigger",var_03);
		level.var_31D dodamage(5,param_00);
	}
}

//Function Number: 379
lib_A59A::func_1F0B(param_00,param_01)
{
	setthreatbias(param_00,param_01,0);
	setthreatbias(param_01,param_00,0);
}

//Function Number: 380
lib_A59A::func_9334()
{
	animscripts\combat_utility::func_9335();
}

//Function Number: 381
lib_A59A::func_0CDF(param_00,param_01)
{
	if(!param_00.size)
	{
		return param_01;
	}

	var_02 = getarraykeys(param_01);
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		param_00[var_02[var_03]] = param_01[var_02[var_03]];
	}

	return param_00;
}

//Function Number: 382
lib_A59A::func_7E5A(param_00)
{
	self.var_202 = param_00;
}

//Function Number: 383
lib_A59A::func_7E4A(param_00)
{
	self.var_1C7 = param_00;
}

//Function Number: 384
lib_A59A::func_9883()
{
	var_00 = self.var_3582;
	for(;;)
	{
		var_01 = self method_8093();
		if(lib_A59A::func_88EB(var_01))
		{
			wait(1);
			continue;
		}

		return var_01;
	}
}

//Function Number: 385
lib_A59A::func_7DB2(param_00)
{
	self.var_31 = param_00;
}

//Function Number: 386
lib_A59A::func_7EA5(param_00,param_01)
{
	if(isdefined(param_01))
	{
		self.var_B0D = param_01;
	}
	else
	{
		self.var_B0D = 1;
	}

	lib_A59A::func_2AE9();
	self.var_76AC = level.var_78A9[self.animname][param_00];
	self.var_A0FF = self.var_76AC;
}

//Function Number: 387
lib_A59A::func_7E0F()
{
	self.var_7.var_5F58 = "walk";
	self.var_2AF2 = 1;
	self.var_2B0D = 1;
	self.var_7A73 = 1;
}

//Function Number: 388
lib_A59A::func_7DEA(param_00,param_01,param_02,param_03)
{
	animscripts\animset::func_4C82(param_00,param_01,param_02,param_03);
}

//Function Number: 389
lib_A59A::func_7E7A(param_00,param_01,param_02)
{
	var_03 = animscripts\utility::func_5861(param_00);
	if(isarray(param_01))
	{
		var_03["straight"] = param_01[0];
		var_03["move_f"] = param_01[0];
		var_03["move_l"] = param_01[1];
		var_03["move_r"] = param_01[2];
		var_03["move_b"] = param_01[3];
	}
	else
	{
		var_03["straight"] = param_01;
		var_03["move_f"] = param_01;
	}

	if(isdefined(param_02))
	{
		var_03["sprint"] = param_02;
	}

	self.var_2562[param_00] = var_03;
}

//Function Number: 390
lib_A59A::func_7E3E(param_00)
{
	var_01 = level.var_78A9["generic"][param_00];
	if(isarray(var_01))
	{
		self.var_8A29 = var_01;
		return;
	}

	self.var_8A29[0] = var_01;
}

//Function Number: 391
lib_A59A::func_7E56(param_00)
{
	var_01 = level.var_78A9[self.animname][param_00];
	if(isarray(var_01))
	{
		self.var_8A29 = var_01;
		return;
	}

	self.var_8A29[0] = var_01;
}

//Function Number: 392
lib_A59A::func_1EBA()
{
	self.var_8A29 = undefined;
	self notify("stop_specialidle");
}

//Function Number: 393
lib_A59A::func_7E3F(param_00,param_01)
{
	lib_A59A::func_7E40(param_00,undefined,param_01);
}

//Function Number: 394
lib_A59A::func_1EBB()
{
	self notify("movemode");
	lib_A59A::func_3101();
	self.var_76AC = undefined;
	self.var_A0FF = undefined;
}

//Function Number: 395
lib_A59A::func_7E40(param_00,param_01,param_02)
{
	self notify("movemode");
	if(!isdefined(param_02) || param_02)
	{
		self.var_B0D = 1;
	}
	else
	{
		self.var_B0D = undefined;
	}

	lib_A59A::func_2AE9();
	self.var_76AC = level.var_78A9["generic"][param_00];
	self.var_A0FF = self.var_76AC;
	if(isdefined(param_01))
	{
		self.var_76AB = level.var_78A9["generic"][param_01];
		self.var_A0FE = self.var_76AB;
		return;
	}

	self.var_76AB = undefined;
	self.var_A0FE = undefined;
}

//Function Number: 396
lib_A59A::func_7EA6(param_00,param_01,param_02)
{
	self notify("movemode");
	if(!isdefined(param_02) || param_02)
	{
		self.var_B0D = 1;
	}
	else
	{
		self.var_B0D = undefined;
	}

	lib_A59A::func_2AE9();
	self.var_76AC = level.var_78A9[self.animname][param_00];
	self.var_A0FF = self.var_76AC;
	if(isdefined(param_01))
	{
		self.var_76AB = level.var_78A9[self.animname][param_01];
		self.var_A0FE = self.var_76AB;
		return;
	}

	self.var_76AB = undefined;
	self.var_A0FE = undefined;
}

//Function Number: 397
lib_A59A::func_1ED1()
{
	self notify("clear_run_anim");
	self notify("movemode");
	if(self.type == "dog")
	{
		self.var_7.var_5F58 = "run";
		self.var_2AF2 = 0;
		self.var_2B0D = 0;
		self.var_7A73 = undefined;
		return;
	}

	if(!isdefined(self.var_1BC4))
	{
		lib_A59A::func_3101();
	}

	self.var_B0D = undefined;
	self.var_76AC = undefined;
	self.var_A0FF = undefined;
	self.var_76AB = undefined;
	self.var_A0FE = undefined;
}

//Function Number: 398
lib_A59A::func_273A(param_00,param_01)
{
	setdvarifuninitialized(param_00,param_01);
	return getdvarfloat(param_00);
}

//Function Number: 399
lib_A59A::func_67FF(param_00,param_01,param_02)
{
	self endon("death");
	self endon("stop_physicsjolt");
	if(!isdefined(param_00) || !isdefined(param_01) || !isdefined(param_02))
	{
		param_00 = 400;
		param_01 = 256;
		param_02 = (0,0,0.075);
	}

	var_03 = param_00 * param_00;
	var_04 = 3;
	var_05 = param_02;
	for(;;)
	{
		wait(0.1);
		param_02 = var_05;
		if(self.code_classname == "script_vehicle")
		{
			var_06 = self veh_getspeed();
			if(var_06 < var_04)
			{
				var_07 = var_06 / var_04;
				param_02 = var_05 * var_07;
			}
		}

		var_08 = distancesquared(self.var_2E6,level.var_31D.var_2E6);
		var_07 = var_03 / var_08;
		if(var_07 > 1)
		{
			var_07 = 1;
		}

		param_02 = param_02 * var_07;
		var_09 = param_02[0] + param_02[1] + param_02[2];
		if(var_09 > 0.025)
		{
			physicsradiusjitter(self.var_2E6,param_00,param_01,param_02[2],param_02[2] * 2);
		}
	}
}

//Function Number: 400
lib_A59A::func_7E42(param_00)
{
	self method_81A7(param_00);
}

//Function Number: 401
lib_A59A::func_0706(param_00,param_01,param_02)
{
	if(!isdefined(param_00))
	{
		lib_A59A::func_0707(param_02);
		return;
	}

	common_scripts\utility::array_thread(getentarray(param_00,param_01),::lib_A59A::func_0707,param_02);
}

//Function Number: 402
lib_A59A::func_0707(param_00)
{
	self notify("trigger",param_00);
}

//Function Number: 403
lib_A59A::func_7C6B()
{
	self delete();
}

//Function Number: 404
lib_A59A::func_736C(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		var_03 = param_00[var_02];
		if(var_03 lib_A59A::func_46E5())
		{
			var_01[var_01.size] = var_03;
		}
	}

	return var_01;
}

//Function Number: 405
lib_A59A::func_1EA7()
{
	lib_A59A::func_1EDA("axis");
	lib_A59A::func_1EDA("allies");
}

//Function Number: 406
lib_A59A::func_1EDA(param_00)
{
	level.var_250D[param_00]["r"] = undefined;
	level.var_250D[param_00]["b"] = undefined;
	level.var_250D[param_00]["c"] = undefined;
	level.var_250D[param_00]["y"] = undefined;
	level.var_250D[param_00]["p"] = undefined;
	level.var_250D[param_00]["o"] = undefined;
	level.var_250D[param_00]["g"] = undefined;
}

//Function Number: 407
lib_A59A::func_3E58()
{
	var_00 = [];
	var_00["r"] = (1,0,0);
	var_00["o"] = (1,0.5,0);
	var_00["y"] = (1,1,0);
	var_00["g"] = (0,1,0);
	var_00["c"] = (0,1,1);
	var_00["b"] = (0,0,1);
	var_00["p"] = (1,0,1);
	return var_00;
}

//Function Number: 408
lib_A59A::func_61FA(param_00,param_01)
{
	self endon("death");
	if(param_01 > 0)
	{
		wait(param_01);
	}

	if(!isdefined(self))
	{
		return;
	}

	self notify(param_00);
}

//Function Number: 409
lib_A59A::func_445F()
{
	if(isai(self))
	{
		animscripts\shared::func_6866(self.weapon,"none");
		return;
	}

	lib_A59A::func_2974(self.weapon);
	self detach(getweaponmodel(self.weapon),"tag_weapon_right");
}

//Function Number: 410
lib_A59A::func_445E()
{
	if(isai(self))
	{
		animscripts\shared::func_6866(self.weapon,"right");
		return;
	}

	self attach(getweaponmodel(self.weapon),"tag_weapon_right");
	lib_A59A::func_9AE6(self.weapon);
}

//Function Number: 411
lib_A59A::func_9AE6(param_00)
{
	if(isdefined(param_00) && param_00 != "none")
	{
		var_01 = function_02B4(param_00);
		var_02 = lib_A59A::func_0CFA(var_01,0);
		foreach(var_04 in var_02)
		{
			self attach(var_04["worldModel"],var_04["attachTag"]);
		}

		self method_8509(param_00);
	}
}

//Function Number: 412
lib_A59A::func_2974(param_00)
{
	if(isdefined(param_00) && param_00 != "none")
	{
		var_01 = function_02B4(param_00);
		var_02 = lib_A59A::func_0CFA(var_01,0);
		foreach(var_04 in var_02)
		{
			self detach(var_04["worldModel"],var_04["attachTag"],0);
		}
	}
}

//Function Number: 413
lib_A59A::func_0DEC(param_00)
{
	var_01 = level.var_31D getcurrentweapon();
	var_02 = function_02B4(var_01);
	var_03 = var_02[0]["weapon"];
	var_04 = lib_A59A::func_0CFA(var_02,0);
	param_00 attach(var_03,"TAG_WEAPON_RIGHT",1);
	foreach(var_06 in var_04)
	{
		param_00 attach(var_06["attachment"],var_06["attachTag"]);
	}

	param_00 method_8509(var_01);
}

//Function Number: 414
lib_A59A::func_685A(param_00,param_01)
{
	if(!animscripts\utility::func_95B(param_00))
	{
		animscripts\init::func_4E2F(param_00);
	}

	animscripts\shared::func_6866(param_00,param_01);
}

//Function Number: 415
lib_A59A::func_39CE(param_00,param_01)
{
	if(!animscripts\init::func_5205(param_00))
	{
		animscripts\init::func_4E2F(param_00);
	}

	var_02 = self.weapon != "none";
	var_03 = animscripts\utility::func_9C32();
	var_04 = param_01 == "sidearm";
	var_05 = param_01 == "secondary";
	if(var_02 && var_03 != var_04)
	{
		if(var_03)
		{
			var_06 = "none";
		}
		else if(var_06)
		{
			var_06 = "back";
		}
		else
		{
			var_06 = "chest";
		}

		animscripts\shared::func_6866(self.weapon,var_06);
		self.var_560C = self.weapon;
	}
	else
	{
		self.var_560C = param_00;
	}

	animscripts\shared::func_6866(param_00,"right");
	if(var_04)
	{
		self.var_8557 = param_00;
	}
	else if(var_05)
	{
		self.secondaryweapon = param_00;
	}
	else
	{
		self.alias = param_00;
	}

	self.weapon = param_00;
	self.var_18B0 = weaponclipsize(self.weapon);
	self notify("weapon_switch_done");
}

//Function Number: 416
lib_A59A::func_5693(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	lib_A59B::func_5695(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,0);
}

//Function Number: 417
lib_A59A::func_5694(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	lib_A59B::func_5695(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,1);
}

//Function Number: 418
lib_A59A::func_5690(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	param_09 = lib_A59A::func_3E23();
	var_0A = spawn("script_origin",(0,0,0));
	var_0A.var_2E6 = param_09.var_2E6;
	var_0A.var_41 = param_09 getplayerangles();
	if(isdefined(param_08) && param_08)
	{
		param_09 playerlinkto(var_0A,"",param_03,param_04,param_05,param_06,param_07,param_08);
	}
	else if(isdefined(param_04))
	{
		param_09 playerlinkto(var_0A,"",param_03,param_04,param_05,param_06,param_07);
	}
	else if(isdefined(param_03))
	{
		param_09 playerlinkto(var_0A,"",param_03);
	}
	else
	{
		param_09 playerlinkto(var_0A);
	}

	var_0A moveto(param_00,param_02,param_02 * 0.25);
	var_0A rotateto(param_01,param_02,param_02 * 0.25);
	wait(param_02);
	var_0A delete();
}

//Function Number: 419
lib_A59A::func_5696(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	lib_A59B::func_5697(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,0);
}

//Function Number: 420
lib_A59A::func_5692(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	var_09 = lib_A59A::func_3E23();
	var_0A = spawn("script_origin",(0,0,0));
	var_0A.var_2E6 = var_09 lib_A59A::func_3E22();
	var_0A.var_41 = var_09 getplayerangles();
	if(isdefined(param_08))
	{
		var_09 playerlinktodelta(var_0A,"",param_03,param_04,param_05,param_06,param_07,param_08);
	}
	else if(isdefined(param_04))
	{
		var_09 playerlinktodelta(var_0A,"",param_03,param_04,param_05,param_06,param_07);
	}
	else if(isdefined(param_03))
	{
		var_09 playerlinktodelta(var_0A,"",param_03);
	}
	else
	{
		var_09 playerlinktodelta(var_0A);
	}

	var_0A moveto(param_00,param_02,param_02 * 0.25);
	var_0A rotateto(param_01,param_02,param_02 * 0.25);
	wait(param_02);
	var_0A delete();
}

//Function Number: 421
lib_A59A::func_6BA4(param_00)
{
	var_01 = level.var_31D.var_2E6;
	for(;;)
	{
		if(distance(var_01,level.var_31D.var_2E6) > param_00)
		{
			break;
		}

		wait(0.05);
	}
}

//Function Number: 422
lib_A59A::func_A080(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	thread lib_A59B::func_A081(var_04,param_00,param_01);
	thread lib_A59B::func_A081(var_04,param_02,param_03);
	var_04 waittill("done");
}

//Function Number: 423
lib_A59A::func_A090(param_00)
{
	self waittill(param_00);
}

//Function Number: 424
lib_A59A::func_2B49(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = lib_A59A::func_3E23();
	if(isdefined(level.var_97A0[param_00]))
	{
		if(var_05 [[ level.var_97A0[param_00] ]]())
		{
			return;
		}

		var_05 thread lib_A59B::func_490A(level.var_97A1[param_00],level.var_97A0[param_00],param_01,param_02,param_03,undefined,undefined,param_04);
		return;
	}

	var_05 thread lib_A59B::func_490A(level.var_97A1[param_00],undefined,undefined,undefined,undefined,undefined,undefined,param_04);
}

//Function Number: 425
lib_A59A::func_48F6(param_00,param_01,param_02,param_03,param_04,param_05)
{
	lib_A59B::func_48F7(param_00);
	if(!isdefined(param_01))
	{
		lib_A59A::func_2B49(param_00,param_02,param_03,param_04,param_05);
		return;
	}

	lib_A59A::func_2B4E(param_00,param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 426
lib_A59A::func_48F9(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A59A::func_3E23();
	if(var_06 [[ level.var_97A0[param_00] ]]())
	{
		return;
	}

	lib_A59B::func_48F7(param_00);
	var_06 thread lib_A59B::func_490A(level.var_97A1[param_00],level.var_97A0[param_00],param_03,param_04,param_05,param_01,param_02);
}

//Function Number: 427
lib_A59A::func_0746(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(level.var_97A1))
	{
		level.var_97A1 = [];
		level.var_97A0 = [];
	}

	level.var_97A1[param_00] = param_01;
	level.var_48CF[param_00]["gamepad"] = param_01;
	level.var_48CF[param_00]["pc"] = param_03;
	level.var_48CF[param_00]["southpaw"] = param_04;
	precachestring(param_01);
	if(isdefined(param_03))
	{
		precachestring(param_03);
	}

	if(isdefined(param_04))
	{
		precachestring(param_04);
	}

	if(isdefined(param_02))
	{
		level.var_97A0[param_00] = param_02;
	}
}

//Function Number: 428
lib_A59A::func_4686()
{
	if(!isdefined(level.var_48E8))
	{
		level.var_48E8 = [];
	}

	for(;;)
	{
		level.var_48E8 = common_scripts\utility::array_removeundefined(level.var_48E8);
		if(isdefined(level.var_48E8) && isdefined(level.var_31D))
		{
			foreach(var_01 in level.var_48E8)
			{
				if(level.var_31D common_scripts\utility::is_player_gamepad_enabled())
				{
					var_01 sethintstring(var_01.var_42DD);
					continue;
				}

				var_01 sethintstring(var_01.var_6738);
			}
		}

		wait(0.1);
	}
}

//Function Number: 429
lib_A59A::func_07E4(param_00,param_01)
{
	if(!isdefined(level.var_48E8))
	{
		thread lib_A59A::func_4686();
		level.var_48E8 = [];
	}

	var_02 = 0;
	foreach(var_04 in level.var_48E8)
	{
		if(self == var_04)
		{
			var_04.var_42DD = param_00;
			var_04.var_6738 = param_01;
			var_02 = 1;
			break;
		}
	}

	if(!var_02)
	{
		self.var_42DD = param_00;
		self.var_6738 = param_01;
		level.var_48E8 = common_scripts\utility::array_add(level.var_48E8,self);
	}
}

//Function Number: 430
lib_A59A::func_2B4E(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A59A::func_3E23();
	if(var_06 [[ level.var_97A0[param_00] ]]())
	{
		return;
	}

	var_06 thread lib_A59B::func_490A(level.var_97A1[param_00],level.var_97A0[param_00],param_02,param_03,param_04,param_01,undefined,param_05);
}

//Function Number: 431
lib_A59A::func_2B4F(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A59A::func_3E23();
	if(var_06 [[ level.var_97A0[param_00] ]]())
	{
		return;
	}

	var_06 thread lib_A59B::func_490A(level.var_97A1[param_00],level.var_97A0[param_00],param_03,param_04,param_05,param_01,param_02);
}

//Function Number: 432
lib_A59A::func_2B4B(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	if(!isdefined(param_06))
	{
		param_06 = 0;
	}

	var_0A = lib_A59B::func_48DF(param_00,param_01,param_02,param_03,param_04,param_05,param_06);
	thread lib_A59A::func_2B49(var_0A,param_07,param_08,param_09);
	thread lib_A59B::func_48E0(param_00,param_01,param_02,param_03,param_04,param_05,param_06);
}

//Function Number: 433
lib_A59A::func_2B4C(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	if(!isdefined(param_07))
	{
		param_07 = 0;
	}

	var_0B = lib_A59B::func_48DF(param_00,param_02,param_03,param_04,param_05,param_06,param_07);
	thread lib_A59A::func_2B4E(var_0B,param_01,param_08,param_09,param_0A);
	thread lib_A59B::func_48E0(param_00,param_02,param_03,param_04,param_05,param_06,param_07);
}

//Function Number: 434
lib_A59A::func_2B4D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B)
{
	if(!isdefined(param_08))
	{
		param_08 = 0;
	}

	var_0C = lib_A59B::func_48DF(param_00,param_03,param_04,param_05,param_06,param_07,param_08);
	thread lib_A59A::func_2B4F(var_0C,param_01,param_02,param_09,param_0A,param_0B);
	thread lib_A59B::func_48E0(param_00,param_03,param_04,param_05,param_06,param_07,param_08);
}

//Function Number: 435
lib_A59A::func_1CC6(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_03))
	{
		return [[ level.var_97A0[param_00] ]](param_01,param_02,param_03);
	}

	if(isdefined(param_02))
	{
		return [[ level.var_97A0[param_00] ]](param_01,param_02);
	}

	if(isdefined(param_01))
	{
		return [[ level.var_97A0[param_00] ]](param_01);
	}

	return [[ level.var_97A0[param_00] ]]();
}

//Function Number: 436
lib_A59A::func_3FAA(param_00)
{
	return level.var_78A9["generic"][param_00];
}

//Function Number: 437
lib_A59A::func_30A9()
{
	self.var_7968 = 1;
}

//Function Number: 438
lib_A59A::func_2A85()
{
	self.var_7968 = 0;
	self notify("stop_being_careful");
}

//Function Number: 439
lib_A59A::func_30F0()
{
	self.var_8AA2 = 1;
}

//Function Number: 440
lib_A59A::func_2AD1()
{
	self.var_8AA2 = undefined;
}

//Function Number: 441
lib_A59A::func_2A84()
{
	self.var_2AF6 = 1;
}

//Function Number: 442
lib_A59A::func_30A8()
{
	self.var_2AF6 = undefined;
}

//Function Number: 443
lib_A59A::func_1EB2(param_00)
{
	setdvar(param_00,"");
}

//Function Number: 444
lib_A59A::func_7E1E()
{
	self.var_180 = 1;
}

//Function Number: 445
lib_A59A::func_7E1D()
{
	self.var_180 = 0;
}

//Function Number: 446
lib_A59A::func_88BD(param_00,param_01)
{
	if(isdefined(self.var_798B))
	{
		self endon("death");
		wait(self.var_798B);
	}

	var_02 = undefined;
	var_03 = isdefined(self.var_7ADB) && common_scripts\utility::flag("_stealth_enabled") && !common_scripts\utility::flag("_stealth_spotted");
	if(isdefined(self.var_79E6) || isdefined(param_00))
	{
		if(!isdefined(self.var_79A8))
		{
			var_02 = self method_8094(var_03);
		}
		else
		{
			var_02 = lib_A59A::func_2F28(self);
		}
	}
	else if(!isdefined(self.var_79A8))
	{
		var_02 = self method_8093(var_03);
	}
	else
	{
		var_02 = lib_A59A::func_2F28(self);
	}

	if(isdefined(param_01) && param_01 && isalive(var_02))
	{
		var_02 lib_A59A::func_58D4();
	}

	if(!isdefined(self.var_79A8))
	{
		lib_A59A::func_88EB(var_02);
	}

	if(isdefined(self.var_7AC7))
	{
		self delete();
	}

	if(isdefined(var_02))
	{
		var_02.spawner = self;
	}

	if(isdefined(var_02) && !isdefined(var_02.targetname))
	{
		if(isdefined(self.targetname))
		{
			var_02.targetname = self.targetname + "_AI";
		}
	}

	return var_02;
}

//Function Number: 447
lib_A59A::func_3AF0(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = spawnstruct();
	var_06 thread lib_A59B::func_3AF4(self,param_00,param_01,param_02,param_03,param_04,param_05);
	return lib_A59B::func_3AF8(var_06);
}

//Function Number: 448
lib_A59A::func_3AF6(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = spawnstruct();
	var_07 thread lib_A59B::func_3AF4(self,param_01,param_02,param_03,param_04,param_05,param_06);
	if(isdefined(var_07.var_3AF3) || var_07 common_scripts\utility::waittill_any_timeout(param_00,"function_stack_func_begun") != "timeout")
	{
		return lib_A59B::func_3AF8(var_07);
	}

	var_07 notify("death");
	return 0;
}

//Function Number: 449
lib_A59A::func_3AF2()
{
	var_00 = [];
	if(isdefined(self.var_3AF0[0]) && isdefined(self.var_3AF0[0].var_3AF3))
	{
		var_00[0] = self.var_3AF0[0];
	}

	self.var_3AF0 = undefined;
	self notify("clear_function_stack");
	waittillframeend;
	if(!var_00.size)
	{
		return;
	}

	if(!var_00[0].var_3AF3)
	{
		return;
	}

	self.var_3AF0 = var_00;
}

//Function Number: 450
lib_A59A::func_3CAB()
{
	if(isdefined(self.var_3CAB))
	{
		return;
	}

	self.realorigin = self getorigin();
	self moveto(self.realorigin + (0,0,-10000),0.2);
	self.var_3CAB = 1;
}

//Function Number: 451
lib_A59A::func_3CAC()
{
	if(!isdefined(self.var_3CAB))
	{
		return;
	}

	self moveto(self.realorigin,0.2);
	self waittill("movedone");
	self.var_3CAB = undefined;
}

//Function Number: 452
lib_A59A::func_2A9C()
{
	self.var_2B0D = 1;
}

//Function Number: 453
lib_A59A::func_30BC()
{
	self.var_2B0D = undefined;
}

//Function Number: 454
lib_A59A::func_2AE9()
{
	self.var_623C = 1;
}

//Function Number: 455
lib_A59A::func_3101()
{
	self.var_623C = undefined;
}

//Function Number: 456
lib_A59A::func_2A79()
{
	self.var_2AF2 = 1;
}

//Function Number: 457
lib_A59A::func_30A0()
{
	self endon("death");
	waittillframeend;
	self.var_2AF2 = undefined;
}

//Function Number: 458
lib_A59A::func_7DDC(param_00,param_01)
{
	function_0072(param_00,param_01);
}

//Function Number: 459
lib_A59A::func_7E48(param_00)
{
	self.var_1C7 = param_00;
}

//Function Number: 460
lib_A59A::func_7E45(param_00)
{
	self.var_5555 = param_00;
	self.var_5556 = undefined;
	self.var_5554 = undefined;
	self method_81A5(param_00);
}

//Function Number: 461
lib_A59A::func_7E46(param_00)
{
	var_01 = getnode(param_00,"targetname");
	lib_A59A::func_7E45(var_01);
}

//Function Number: 462
lib_A59A::func_7E47(param_00)
{
	self.var_5555 = undefined;
	self.var_5556 = param_00;
	self.var_5554 = undefined;
	self method_81A6(param_00);
}

//Function Number: 463
lib_A59A::func_7E41(param_00)
{
	lib_A59A::func_7E47(param_00.var_2E6);
	self.var_5554 = param_00;
}

//Function Number: 464
lib_A59A::func_62E9(param_00)
{
	lib_A59B::func_62F1(param_00);
	objective_state(param_00,"done");
	level notify("objective_complete" + param_00);
}

//Function Number: 465
lib_A59A::func_4694(param_00,param_01,param_02,param_03)
{
	var_04 = 1;
	if(isdefined(param_01))
	{
		var_04 = !param_01;
	}

	if(isdefined(param_02))
	{
		level endon(param_02);
	}

	if(isdefined(param_03))
	{
		level waittill(param_03);
	}

	var_05 = "signal_" + param_00;
	if(self.var_7.var_6E57 == "crouch")
	{
		var_05 = var_05 + "_crouch";
	}
	else if(self.script == "cover_right" || self.script == "cover_multi" && self.var_DA.state == "right")
	{
		var_05 = var_05 + "_coverR";
	}
	else if(animscripts\utility::func_50E6())
	{
		var_05 = var_05 + "_cqb";
	}

	if(var_04)
	{
		self method_814D(lib_A59A::func_3FAA(var_05),1,0,1.1);
		return;
	}

	lib_A506::func_BC9(self,var_05);
}

//Function Number: 466
lib_A59A::func_0D08(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	var_03 = [];
	foreach(var_05 in param_00)
	{
		var_05.count = 1;
		if(getsubstr(var_05.classname,7,10) == "veh")
		{
			var_06 = var_05 lib_A59A::func_896F();
			if(isdefined(var_06.target) && !isdefined(var_06.var_7A3A))
			{
				var_06 thread lib_A59E::func_4277();
			}

			var_03[var_03.size] = var_06;
			continue;
		}

		var_06 = var_05 lib_A59A::func_88BD(param_01);
		if(!param_02)
		{
		}

		var_03[var_03.size] = var_06;
	}

	if(!param_02)
	{
	}

	return var_03;
}

//Function Number: 467
lib_A59A::func_0D0A(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	var_04 = [];
	foreach(var_06 in param_00)
	{
		var_06.count = 1;
		if(getsubstr(var_06.classname,7,10) == "veh")
		{
			var_07 = var_06 lib_A59A::func_896F();
			if(isdefined(var_07.target) && !isdefined(var_07.var_7A3A))
			{
				var_07 thread lib_A59E::func_4277();
			}

			var_04[var_04.size] = var_07;
			continue;
		}

		var_07 = var_06 lib_A59A::func_88BD(1);
		var_04 = common_scripts\utility::array_add(var_04,var_07);
		if(isdefined(param_03))
		{
			wait(param_03);
			continue;
		}

		wait 0.05;
	}

	if(!param_02)
	{
	}

	return var_04;
}

//Function Number: 468
lib_A59A::func_0D0F(param_00,param_01,param_02,param_03)
{
	var_04 = getentarray(param_00,"targetname");
	if(isdefined(level.var_8938))
	{
		var_05 = common_scripts\utility::getstructarray(param_00,"targetname");
		if(isdefined(param_03) && param_03)
		{
			lib_A59A::func_286E(var_05);
		}

		var_06 = lib_A577::func_3E33(var_05);
		var_04 = common_scripts\utility::array_combine(var_04,var_06);
	}

	return lib_A59A::func_0D08(var_04,param_01,param_02);
}

//Function Number: 469
lib_A59A::func_0D11(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = getentarray(param_00,"targetname");
	if(isdefined(level.var_8938))
	{
		var_06 = common_scripts\utility::getstructarray(param_00,"targetname");
		if(isdefined(param_04) && param_04)
		{
			lib_A59A::func_286E(var_06);
		}

		var_07 = lib_A577::func_3E33(var_06);
		var_05 = common_scripts\utility::array_combine(var_05,var_07);
	}

	return lib_A59A::func_0D0A(var_05,param_01,param_03,param_02);
}

//Function Number: 470
lib_A59A::func_0D0E(param_00,param_01,param_02,param_03)
{
	var_04 = getentarray(param_00,"script_noteworthy");
	if(isdefined(level.var_8938))
	{
		var_05 = common_scripts\utility::getstructarray(param_00,"script_noteworthy");
		if(isdefined(param_03) && param_03)
		{
			lib_A59A::func_286E(var_05);
		}

		var_06 = lib_A577::func_3E33(var_05);
		var_04 = common_scripts\utility::array_combine(var_04,var_06);
	}

	return lib_A59A::func_0D08(var_04,param_01,param_02);
}

//Function Number: 471
lib_A59A::func_8945(param_00,param_01)
{
	var_02 = getent(param_00,"script_noteworthy");
	var_03 = var_02 lib_A59A::func_88BD(param_01);
	return var_03;
}

//Function Number: 472
lib_A59A::func_8957(param_00,param_01)
{
	var_02 = getent(param_00,"targetname");
	var_03 = var_02 lib_A59A::func_88BD(param_01);
	return var_03;
}

//Function Number: 473
lib_A59A::func_0757(param_00,param_01,param_02)
{
	if(getdvarint("loc_warnings",0))
	{
		return;
	}

	if(!isdefined(level.var_2A17))
	{
		level.var_2A17 = [];
	}

	var_03 = 0;
	for(;;)
	{
		if(!isdefined(level.var_2A17[var_03]))
		{
			break;
		}

		var_03++;
	}

	var_04 = "^3";
	if(isdefined(param_02))
	{
		switch(param_02)
		{
			case "red":
			case "r":
				break;

			case "green":
			case "g":
				break;

			case "yellow":
			case "y":
				break;

			case "blue":
			case "b":
				break;

			case "cyan":
			case "c":
				break;

			case "purple":
			case "p":
				break;

			case "white":
			case "w":
				break;

			case "black":
			case "bl":
				break;
		}
	}
}

//Function Number: 474
lib_A59A::func_290A()
{
	common_scripts\_destructible::disable_explosion();
}

//Function Number: 475
lib_A59A::func_290E()
{
	common_scripts\_destructible::force_explosion();
}

//Function Number: 476
lib_A59A::func_7E4C(param_00)
{
	self.var_1D3 = param_00;
}

//Function Number: 477
lib_A59A::func_3E22()
{
	var_00 = self.var_2E6;
	var_01 = anglestoup(self getplayerangles());
	var_02 = self getviewheight();
	var_03 = var_00 + (0,0,var_02);
	var_04 = var_00 + var_01 * var_02;
	var_05 = var_03 - var_04;
	var_06 = var_00 + var_05;
	return var_06;
}

//Function Number: 478
lib_A59A::func_7DD7(param_00)
{
	self.var_1300 = param_00;
}

//Function Number: 479
lib_A59A::set_console_status()
{
	if(!isdefined(level.console))
	{
		level.console = getdvar("consoleGame") == "true";
	}
	else
	{
	}

	if(!isdefined(level.avatarinfo))
	{
		level.avatarinfo = getdvar("xenonGame") == "true";
	}
	else
	{
	}

	if(!isdefined(level.ps3))
	{
		level.ps3 = getdvar("ps3Game") == "true";
	}
	else
	{
	}

	if(!isdefined(level.var_524))
	{
		level.var_524 = getdvar("wiiuGame") == "true";
	}
	else
	{
	}

	if(!isdefined(level.pccg))
	{
		level.pccg = getdvar("pccgGame") == "true";
	}
	else
	{
	}

	if(!isdefined(level.xb3))
	{
		level.xb3 = getdvar("xb3Game") == "true";
	}
	else
	{
	}

	if(!isdefined(level.ps4))
	{
		level.ps4 = getdvar("ps4Game") == "true";
	}
	else
	{
	}

	if(!isdefined(level.pc))
	{
		level.pc = !level.console && !level.pccg;
	}
	else
	{
	}

	if(!isdefined(level.currentgen))
	{
		level.currentgen = level.ps3 || level.pccg || level.avatarinfo || level.var_524;
	}
	else
	{
	}

	if(!isdefined(level.nextgen))
	{
		level.nextgen = level.pc || level.ps4 || level.xb3;
	}
}

//Function Number: 480
lib_A59A::is_gen4()
{
	return level.nextgen;
}

//Function Number: 481
lib_A59A::func_114E(param_00)
{
	return lib_A50A::func_55C(param_00);
}

//Function Number: 482
lib_A59A::func_114F()
{
	return lib_A50A::func_55C(1);
}

//Function Number: 483
lib_A59A::func_7E3D(param_00)
{
	self.var_2651 = lib_A59A::func_3FAA(param_00);
}

//Function Number: 484
lib_A59A::func_7E00(param_00)
{
	self.var_2651 = lib_A59A::func_3EF3(param_00);
}

//Function Number: 485
lib_A59A::func_1EAB()
{
	self.var_2651 = undefined;
}

//Function Number: 486
lib_A59A::func_4B06(param_00)
{
	wait(1.75);
	if(isdefined(param_00))
	{
		self playsoundasmaster(param_00);
	}
	else
	{
		self playsoundasmaster("door_wood_slow_open");
	}

	self rotateto(self.var_41 + (0,70,0),2,0.5,0);
	self connectpaths();
	self waittill("rotatedone");
	self rotateto(self.var_41 + (0,40,0),2,0,2);
}

//Function Number: 487
lib_A59A::func_6663(param_00)
{
	wait(1.35);
	if(isdefined(param_00))
	{
		self playsoundasmaster(param_00);
	}
	else
	{
		self playsoundasmaster("door_wood_slow_open");
	}

	self rotateto(self.var_41 + (0,70,0),2,0.5,0);
	self connectpaths();
	self waittill("rotatedone");
	self rotateto(self.var_41 + (0,40,0),2,0,2);
}

//Function Number: 488
lib_A59A::func_5686(param_00,param_01)
{
	foreach(var_03 in level.var_328)
	{
		var_03 method_8031(param_01,param_00);
	}

	wait(param_00);
}

//Function Number: 489
lib_A59A::func_5688(param_00,param_01)
{
	var_02 = getdvarfloat("cg_fovscale");
	var_03 = int(param_00 / 0.05);
	var_04 = param_01 - var_02 / var_03;
	var_05 = var_02;
	for(var_06 = 0;var_06 < var_03;var_06++)
	{
		var_05 = var_05 + var_04;
		function_00D3("cg_fovscale",var_05);
		wait(0.05);
	}

	function_00D3("cg_fovscale",param_01);
}

//Function Number: 490
lib_A59A::func_7062()
{
	animscripts\shared::func_6866(self.weapon,"none");
	self.weapon = "none";
}

//Function Number: 491
lib_A59A::func_0CA2()
{
	lib_A509::func_7E2F(0);
}

//Function Number: 492
lib_A59A::func_0CA1()
{
	lib_A509::func_7E2F(1);
}

//Function Number: 493
lib_A59A::func_0C3D()
{
	self method_8141();
	self notify("stop_loop");
	self notify("single anim","end");
	self notify("looping anim","end");
}

//Function Number: 494
lib_A59A::func_2AC1()
{
	self.var_7.var_2B1F = 1;
	self.var_34 = 0;
}

//Function Number: 495
lib_A59A::func_30D8()
{
	self.var_7.var_2B1F = 0;
	self.var_34 = 1;
}

//Function Number: 496
lib_A59A::func_057D()
{
	self delete();
}

//Function Number: 497
lib_A59A::func_05D9()
{
	self method_8052();
}

//Function Number: 498
lib_A59A::func_5343()
{
	if(isplayer(self))
	{
		if(common_scripts\utility::flag_exist("special_op_terminated") && common_scripts\utility::flag("special_op_terminated"))
		{
			return 0;
		}

		if(lib_A59A::func_505F(self))
		{
			self method_80F0();
		}
	}

	self method_80EC(0);
	self method_8052();
	return 1;
}

//Function Number: 499
lib_A59A::func_0635(param_00)
{
	self method_8167(param_00);
}

//Function Number: 500
lib_A59A::func_056A()
{
	self method_8168();
}

//Function Number: 501
lib_A59A::func_0679()
{
	self unlink();
}

//Function Number: 502
lib_A59A::func_2ABF(param_00)
{
	var_01 = getarraykeys(level.var_5C3[param_00]);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		level.var_5C3[param_00][var_01[var_02]].looper delete();
		level.var_5C3[param_00][var_01[var_02]] = undefined;
	}
}

//Function Number: 503
lib_A59A::func_0639(param_00)
{
	self setlightintensity(param_00);
}

//Function Number: 504
lib_A59A::func_05E1(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_03))
	{
		self linkto(param_00,param_01,param_02,param_03);
		return;
	}

	if(isdefined(param_02))
	{
		self linkto(param_00,param_01,param_02);
		return;
	}

	if(isdefined(param_01))
	{
		self linkto(param_00,param_01);
		return;
	}

	self linkto(param_00);
}

//Function Number: 505
lib_A59A::func_0D18(param_00,param_01,param_02)
{
	var_03 = getarraykeys(param_00);
	var_04 = [];
	for(var_05 = 0;var_05 < var_03.size;var_05++)
	{
		var_06 = var_03[var_05];
	}

	for(var_05 = 0;var_05 < var_03.size;var_05++)
	{
		var_06 = var_03[var_05];
		var_04[var_06] = spawnstruct();
		var_04[var_06].var_558 = 1;
		var_04[var_06] thread lib_A59B::func_D19(param_00[var_06],param_01,param_02);
	}

	for(var_05 = 0;var_05 < var_03.size;var_05++)
	{
		var_06 = var_03[var_05];
		if(isdefined(param_00[var_06]) && var_04[var_06].var_558)
		{
			var_04[var_06] waittill("_array_wait");
		}
	}
}

//Function Number: 506
lib_A59A::func_2A50()
{
	self method_8052((0,0,0));
}

//Function Number: 507
lib_A59A::func_4024(param_00)
{
	return level.var_78B2[param_00];
}

//Function Number: 508
lib_A59A::func_50A6()
{
	return self playerads() > 0.5;
}

//Function Number: 509
lib_A59A::func_A0A3(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_05))
	{
		param_05 = level.var_31D;
	}

	var_06 = spawnstruct();
	if(isdefined(param_03))
	{
		var_06 thread lib_A59A::func_61FA("timeout",param_03);
	}

	var_06 endon("timeout");
	if(!isdefined(param_00))
	{
		param_00 = 0.92;
	}

	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	var_07 = int(param_01 * 20);
	var_08 = var_07;
	self endon("death");
	var_09 = isai(self);
	var_0A = undefined;
	for(;;)
	{
		if(var_09)
		{
			var_0A = self geteye();
		}
		else
		{
			var_0A = self.var_2E6;
		}

		if(param_05 lib_A59A::func_6B8E(var_0A,param_00,param_02,param_04))
		{
			var_08--;
			if(var_08 <= 0)
			{
				return 1;
			}
		}
		else
		{
			var_08 = var_07;
		}

		wait(0.05);
	}
}

//Function Number: 510
lib_A59A::func_A0A4(param_00,param_01,param_02,param_03)
{
	lib_A59A::func_A0A3(param_01,param_00,param_02,undefined,param_03);
}

//Function Number: 511
lib_A59A::func_6B8E(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_01))
	{
		param_01 = 0.8;
	}

	var_04 = lib_A59A::func_3E23();
	var_05 = var_04 geteye();
	var_06 = vectortoangles(param_00 - var_05);
	var_07 = anglestoforward(var_06);
	var_08 = var_04 getplayerangles();
	var_09 = anglestoforward(var_08);
	var_0A = vectordot(var_07,var_09);
	if(var_0A < param_01)
	{
		return 0;
	}

	if(isdefined(param_02))
	{
		return 1;
	}

	var_0B = bullettrace(param_00,var_05,0,param_03);
	return var_0B["fraction"] == 1;
}

//Function Number: 512
lib_A59A::func_3020(param_00,param_01,param_02,param_03)
{
	for(var_04 = 0;var_04 < level.var_328.size;var_04++)
	{
		if(level.var_328[var_04] lib_A59A::func_6B8E(param_00,param_01,param_02,param_03))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 513
lib_A59A::func_6A95(param_00,param_01)
{
	var_02 = gettime();
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(isdefined(param_00.var_6D43) && param_00.var_6D43 + param_01 >= var_02)
	{
		return param_00.var_6D42;
	}

	param_00.var_6D43 = var_02;
	if(!common_scripts\utility::within_fov(level.var_31D.var_2E6,level.var_31D.var_41,param_00.var_2E6,0.766))
	{
		param_00.var_6D42 = 0;
		return 0;
	}

	var_03 = level.var_31D geteye();
	var_04 = param_00.var_2E6;
	if(sighttracepassed(var_03,var_04,1,level.var_31D,param_00))
	{
		param_00.var_6D42 = 1;
		return 1;
	}

	var_05 = param_00 geteye();
	if(sighttracepassed(var_03,var_05,1,level.var_31D,param_00))
	{
		param_00.var_6D42 = 1;
		return 1;
	}

	var_06 = var_05 + var_04 * 0.5;
	if(sighttracepassed(var_03,var_06,1,level.var_31D,param_00))
	{
		param_00.var_6D42 = 1;
		return 1;
	}

	param_00.var_6D42 = 0;
	return 0;
}

//Function Number: 514
lib_A59A::func_6D3A(param_00,param_01)
{
	var_02 = param_00 * param_00;
	for(var_03 = 0;var_03 < level.var_328.size;var_03++)
	{
		if(distancesquared(param_01,level.var_328[var_03].var_2E6) < var_02)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 515
lib_A59A::func_08D6(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return;
	}

	var_02 = 0.75;
	if(issplitscreen())
	{
		var_02 = 0.65;
	}

	while(param_00.size > 0)
	{
		wait(1);
		for(var_03 = 0;var_03 < param_00.size;var_03++)
		{
			if(!isdefined(param_00[var_03]) || !isalive(param_00[var_03]))
			{
				param_00 = common_scripts\utility::array_remove(param_00,param_00[var_03]);
				continue;
			}

			if(lib_A59A::func_6D3A(param_01,param_00[var_03].var_2E6))
			{
				continue;
			}

			if(lib_A59A::func_3020(param_00[var_03].var_2E6 + (0,0,48),var_02,1))
			{
				continue;
			}

			if(isdefined(param_00[var_03].var_58D4))
			{
				param_00[var_03] lib_A59A::func_8E9E();
			}

			param_00[var_03] delete();
			param_00 = common_scripts\utility::array_remove(param_00,param_00[var_03]);
		}
	}
}

//Function Number: 516
lib_A59A::func_07BE(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	var_04.var_1A08 = self;
	var_04.func = param_00;
	var_04.var_6692 = [];
	if(isdefined(param_01))
	{
		var_04.var_6692[var_04.var_6692.size] = param_01;
	}

	if(isdefined(param_02))
	{
		var_04.var_6692[var_04.var_6692.size] = param_02;
	}

	if(isdefined(param_03))
	{
		var_04.var_6692[var_04.var_6692.size] = param_03;
	}

	level.var_9F7A[level.var_9F7A.size] = var_04;
}

//Function Number: 517
lib_A59A::func_072E(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	var_04.var_1A08 = self;
	var_04.func = param_00;
	var_04.var_6692 = [];
	if(isdefined(param_01))
	{
		var_04.var_6692[var_04.var_6692.size] = param_01;
	}

	if(isdefined(param_02))
	{
		var_04.var_6692[var_04.var_6692.size] = param_02;
	}

	if(isdefined(param_03))
	{
		var_04.var_6692[var_04.var_6692.size] = param_03;
	}

	level.var_6BD[level.var_6BD.size] = var_04;
}

//Function Number: 518
lib_A59A::func_075F(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = spawnstruct();
	var_06.var_1A08 = self;
	var_06.func = param_00;
	var_06.var_6692 = [];
	if(isdefined(param_01))
	{
		var_06.var_6692[var_06.var_6692.size] = param_01;
	}

	if(isdefined(param_02))
	{
		var_06.var_6692[var_06.var_6692.size] = param_02;
	}

	if(isdefined(param_03))
	{
		var_06.var_6692[var_06.var_6692.size] = param_03;
	}

	if(isdefined(param_04))
	{
		var_06.var_6692[var_06.var_6692.size] = param_04;
	}

	if(isdefined(param_05))
	{
		var_06.var_6692[var_06.var_6692.size] = param_05;
	}

	level.var_76A8[level.var_76A8.size] = var_06;
}

//Function Number: 519
lib_A59A::func_073C(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = spawnstruct();
	var_06.var_1A08 = self;
	var_06.func = param_00;
	var_06.var_6692 = [];
	if(isdefined(param_01))
	{
		var_06.var_6692[var_06.var_6692.size] = param_01;
	}

	if(isdefined(param_02))
	{
		var_06.var_6692[var_06.var_6692.size] = param_02;
	}

	if(isdefined(param_03))
	{
		var_06.var_6692[var_06.var_6692.size] = param_03;
	}

	if(isdefined(param_04))
	{
		var_06.var_6692[var_06.var_6692.size] = param_04;
	}

	if(isdefined(param_05))
	{
		var_06.var_6692[var_06.var_6692.size] = param_05;
	}

	level.var_76A4[level.var_76A4.size] = var_06;
}

//Function Number: 520
lib_A59A::func_077B(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = spawnstruct();
	var_06.func = param_00;
	var_06.var_6692 = [];
	if(isdefined(param_01))
	{
		var_06.var_6692[var_06.var_6692.size] = param_01;
	}

	if(isdefined(param_02))
	{
		var_06.var_6692[var_06.var_6692.size] = param_02;
	}

	if(isdefined(param_03))
	{
		var_06.var_6692[var_06.var_6692.size] = param_03;
	}

	if(isdefined(param_04))
	{
		var_06.var_6692[var_06.var_6692.size] = param_04;
	}

	if(isdefined(param_05))
	{
		var_06.var_6692[var_06.var_6692.size] = param_05;
	}

	level.var_76AA[level.var_76AA.size] = var_06;
}

//Function Number: 521
lib_A59A::func_075B(param_00)
{
	var_01 = spawnstruct();
	var_01.var_1A08 = self;
	var_01.var_315A = param_00;
	level.var_2BDD[level.var_2BDD.size] = var_01;
}

//Function Number: 522
lib_A59A::func_2BDC()
{
	lib_A59A::func_2BDB(level.var_9F7A.size - 1);
}

//Function Number: 523
lib_A59A::func_2BDB(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	var_01 = spawnstruct();
	var_02 = level.var_9F7A;
	var_03 = level.var_2BDD;
	var_04 = level.var_76A8;
	var_05 = level.var_76A4;
	var_06 = level.var_76AA;
	var_07 = level.var_6BD;
	level.var_9F7A = [];
	level.var_76A8 = [];
	level.var_2BDD = [];
	level.var_6BD = [];
	level.var_76A4 = [];
	level.var_76AA = [];
	var_01.count = var_02.size;
	var_01 common_scripts\utility::array_levelthread(var_02,::lib_A59B::func_A088,var_03);
	var_01 thread lib_A59B::func_2BB4(var_07);
	var_01 endon("any_funcs_aborted");
	for(;;)
	{
		if(var_01.count <= param_00)
		{
			break;
		}

		var_01 waittill("func_ended");
	}

	var_01 notify("all_funcs_ended");
	common_scripts\utility::array_levelthread(var_04,::lib_A59B::func_33EA,[]);
	common_scripts\utility::array_levelthread(var_05,::lib_A59B::func_33E8);
	common_scripts\utility::array_levelthread(var_06,::lib_A59B::func_33E9);
}

//Function Number: 524
lib_A59A::func_2BC0()
{
	var_00 = spawnstruct();
	var_01 = level.var_76A8;
	level.var_76A8 = [];
	foreach(var_03 in var_01)
	{
		level lib_A59B::func_33EA(var_03,[]);
	}

	var_00 notify("all_funcs_ended");
}

//Function Number: 525
lib_A59A::func_5013()
{
	if(isdefined(level.var_39B4) && level.var_39B4 == 1)
	{
		return 0;
	}

	if(isdefined(level.var_278B) && level.var_278B == level.var_8C30)
	{
		return 1;
	}

	if(isdefined(level.var_278A))
	{
		return level.var_8C30 == "default";
	}

	if(lib_A59A::func_56BF())
	{
		return level.var_8C30 == level.var_8BAF[0]["name"];
	}

	return level.var_8C30 == "default";
}

//Function Number: 526
lib_A59A::func_39A4()
{
	level.var_39B4 = 1;
}

//Function Number: 527
lib_A59A::func_5027()
{
	if(!lib_A59A::func_56BF())
	{
		return 1;
	}

	return level.var_8C30 == level.var_8BAF[0]["name"];
}

//Function Number: 528
lib_A59A::func_4FF9(param_00)
{
	var_01 = 0;
	if(level.var_8C30 == param_00)
	{
		return 0;
	}

	for(var_02 = 0;var_02 < level.var_8BAF.size;var_02++)
	{
		if(level.var_8BAF[var_02]["name"] == param_00)
		{
			var_01 = 1;
			continue;
		}

		if(level.var_8BAF[var_02]["name"] == level.var_8C30)
		{
			return var_01;
		}
	}
}

//Function Number: 529
lib_A59A::func_058E(param_00,param_01,param_02,param_03)
{
	earthquake(param_00,param_01,param_02,param_03);
}

//Function Number: 530
lib_A59A::func_A290(param_00,param_01)
{
	self endon("death");
	var_02 = 0;
	if(isdefined(param_01))
	{
		var_02 = 1;
	}

	if(isdefined(param_00))
	{
		common_scripts\utility::flag_assert(param_00);
		level endon(param_00);
	}

	for(;;)
	{
		wait(randomfloatrange(0.15,0.3));
		var_03 = self.var_2E6 + (0,0,150);
		var_04 = self.var_2E6 - (0,0,150);
		var_05 = bullettrace(var_03,var_04,0,undefined);
		if(!issubstr(var_05["surfacetype"],"water"))
		{
			continue;
		}

		var_06 = "water_movement";
		if(isplayer(self))
		{
			if(distance(self getvelocity(),(0,0,0)) < 5)
			{
				var_06 = "water_stop";
			}
		}
		else if(isdefined(level._effect["water_" + self.var_7.var_5F58]))
		{
			var_06 = "water_" + self.var_7.var_5F58;
		}

		var_07 = common_scripts\utility::getfx(var_06);
		var_03 = var_05["position"];
		var_08 = (0,self.var_41[1],0);
		var_09 = anglestoforward(var_08);
		var_0A = anglestoup(var_08);
		playfx(var_07,var_03,var_0A,var_09);
		if(var_06 != "water_stop" && var_02)
		{
			thread common_scripts\utility::play_sound_in_space(param_01,var_03);
		}
	}
}

//Function Number: 531
lib_A59A::func_6D57(param_00)
{
	if(isdefined(param_00))
	{
		common_scripts\utility::flag_assert(param_00);
		level endon(param_00);
	}

	for(;;)
	{
		wait(randomfloatrange(0.25,0.5));
		var_01 = self.var_2E6 + (0,0,0);
		var_02 = self.var_2E6 - (0,0,5);
		var_03 = bullettrace(var_01,var_02,0,undefined);
		var_04 = anglestoforward(self.var_41);
		var_05 = distance(self getvelocity(),(0,0,0));
		if(isdefined(self.vehicle))
		{
			continue;
		}

		if(var_03["surfacetype"] != "snow")
		{
			continue;
		}

		if(var_05 <= 10)
		{
			continue;
		}

		var_06 = "snow_movement";
		if(distance(self getvelocity(),(0,0,0)) <= 154)
		{
			playfx(common_scripts\utility::getfx("footstep_snow_small"),var_03["position"],var_03["normal"],var_04);
		}

		if(distance(self getvelocity(),(0,0,0)) > 154)
		{
			playfx(common_scripts\utility::getfx("footstep_snow"),var_03["position"],var_03["normal"],var_04);
		}
	}
}

//Function Number: 532
lib_A59A::func_5CE9(param_00)
{
	var_01 = 60;
	for(var_02 = 0;var_02 < var_01;var_02++)
	{
		self method_803B(param_00,param_00 + "_off",var_01 - var_02 / var_01);
		wait(0.05);
	}
}

//Function Number: 533
lib_A59A::func_5CE7(param_00)
{
	var_01 = 60;
	for(var_02 = 0;var_02 < var_01;var_02++)
	{
		self method_803B(param_00,param_00 + "_off",var_02 / var_01);
		wait(0.05);
	}
}

//Function Number: 534
lib_A59A::func_596F(param_00,param_01)
{
	param_00 endon("death");
	self endon("death");
	if(!isdefined(param_01))
	{
		param_01 = (0,0,0);
	}

	for(;;)
	{
		self.var_2E6 = param_00.var_2E6 + param_01;
		self.var_41 = param_00.var_41;
		wait(0.05);
	}
}

//Function Number: 535
lib_A59A::func_60D3()
{
	lib_A59B::func_5CD4();
	lib_A526::func_5FF();
}

//Function Number: 536
lib_A59A::func_590C(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = [];
	var_05[var_05.size] = param_00;
	if(isdefined(param_01))
	{
		var_05[var_05.size] = param_01;
	}

	if(isdefined(param_02))
	{
		var_05[var_05.size] = param_02;
	}

	if(isdefined(param_03))
	{
		var_05[var_05.size] = param_03;
	}

	if(isdefined(param_04))
	{
		var_05[var_05.size] = param_04;
	}

	return var_05;
}

//Function Number: 537
lib_A59A::func_35FF()
{
	level.var_3618 = 1;
}

//Function Number: 538
lib_A59A::func_6159()
{
	level.var_3618 = 0;
}

//Function Number: 539
lib_A59A::func_4086()
{
	var_00 = self getweaponslistall();
	var_01 = [];
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		var_03 = var_00[var_02];
		var_01[var_03] = self getweaponammoclip(var_03);
	}

	var_04 = 0;
	if(isdefined(var_01["claymore"]) && var_01["claymore"] > 0)
	{
		var_04 = var_01["claymore"];
	}

	return var_04;
}

//Function Number: 540
lib_A59A::func_0694(param_00)
{
	wait(param_00);
}

//Function Number: 541
lib_A59A::func_0696(param_00,param_01)
{
	self waittillmatch(param_01,param_00);
}

//Function Number: 542
lib_A59A::func_063E(param_00,param_01)
{
	function_00D3(param_00,param_01);
}

//Function Number: 543
lib_A59A::func_5699(param_00,param_01,param_02)
{
	var_03 = getdvarfloat(param_00);
	level notify(param_00 + "_lerp_savedDvar");
	level endon(param_00 + "_lerp_savedDvar");
	var_04 = param_01 - var_03;
	var_05 = 0.05;
	var_06 = int(param_02 / var_05);
	var_07 = var_04 / var_06;
	while(var_06)
	{
		var_03 = var_03 + var_07;
		function_00D3(param_00,var_03);
		wait(var_05);
		var_06--;
	}

	function_00D3(param_00,param_01);
}

//Function Number: 544
lib_A59A::func_569A(param_00,param_01,param_02,param_03)
{
	if(lib_A59A::is_gen4())
	{
		lib_A59A::func_5699(param_00,param_02,param_03);
		return;
	}

	lib_A59A::func_5699(param_00,param_01,param_03);
}

//Function Number: 545
lib_A59A::func_41DA(param_00)
{
	if(lib_A59A::func_5014())
	{
		return;
	}

	foreach(var_02 in level.var_328)
	{
		var_02 giveachievement(param_00);
	}

	function_02A3("achievements_completed",param_00,1);
}

//Function Number: 546
lib_A59A::func_6B2A(param_00)
{
	if(lib_A59A::func_5014())
	{
		return;
	}

	self giveachievement(param_00);
}

//Function Number: 547
lib_A59A::func_076A(param_00)
{
	var_01 = spawn("script_model",(0,0,0));
	var_01 setcontents(0);
	var_01 setmodel("weapon_javelin_obj");
	var_01.var_2E6 = self.var_2E6;
	var_01.var_41 = self.var_41;
	lib_A59A::func_07BE(::lib_A59A::func_2827);
	if(isdefined(param_00))
	{
		common_scripts\utility::flag_assert(param_00);
		lib_A59A::func_07BE(::common_scripts\utility::flag_wait,param_00);
	}

	lib_A59A::func_2BDC();
	var_01 delete();
}

//Function Number: 548
lib_A59A::func_073B(param_00)
{
	var_01 = spawn("script_model",(0,0,0));
	var_01 setcontents(0);
	var_01 setmodel("weapon_c4_obj");
	var_01.var_2E6 = self.var_2E6;
	var_01.var_41 = self.var_41;
	lib_A59A::func_07BE(::lib_A59A::func_2827);
	if(isdefined(param_00))
	{
		common_scripts\utility::flag_assert(param_00);
		lib_A59A::func_07BE(::common_scripts\utility::flag_wait,param_00);
	}

	lib_A59A::func_2BDC();
	var_01 delete();
}

//Function Number: 549
lib_A59A::func_2827()
{
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		wait(0.05);
	}
}

//Function Number: 550
lib_A59A::func_8642()
{
}

//Function Number: 551
lib_A59A::func_8638()
{
}

//Function Number: 552
lib_A59A::func_8640(param_00)
{
	level.var_8631.var_8A50 = param_00;
}

//Function Number: 553
lib_A59A::func_863F(param_00)
{
	level.var_8631.var_8A4D = param_00;
}

//Function Number: 554
lib_A59A::func_863D(param_00)
{
	level.var_8631.var_56A6 = param_00;
}

//Function Number: 555
lib_A59A::func_863E(param_00)
{
	level.var_8631.var_56A7 = param_00;
}

//Function Number: 556
lib_A59A::func_863A()
{
	if(isdefined(level.var_610B) && level.var_610B)
	{
		return;
	}

	setslowmotion(level.var_8631.var_8A4D,level.var_8631.var_8A50,level.var_8631.var_56A6);
}

//Function Number: 557
lib_A59A::func_863B()
{
	if(isdefined(level.var_610B) && level.var_610B)
	{
		return;
	}

	setslowmotion(level.var_8631.var_8A50,level.var_8631.var_8A4D,level.var_8631.var_56A7);
}

//Function Number: 558
lib_A59A::func_075A(param_00,param_01,param_02,param_03)
{
	level.earthquake[param_00]["magnitude"] = param_01;
	level.earthquake[param_00]["duration"] = param_02;
	level.earthquake[param_00]["radius"] = param_03;
}

//Function Number: 559
lib_A59A::func_0CC3()
{
	return getdvar("arcademode") == "1";
}

//Function Number: 560
lib_A59A::func_0CC5()
{
	if(!isdefined(level.var_CC4))
	{
		return;
	}

	level notify("arcadeMode_remove_timer");
	level.var_CC6 = gettime();
	level.var_CC4 destroy();
	level.var_CC4 = undefined;
}

//Function Number: 561
lib_A59A::func_6005(param_00,param_01,param_02)
{
	level.var_55B.var_5558 = param_00;
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	function_0074(0);
	function_0073(param_00,0,1,1,param_02);
}

//Function Number: 562
lib_A59A::func_5FFB(param_00,param_01,param_02,param_03,param_04)
{
	thread lib_A59B::func_5FFC(param_00,param_01,param_02,param_03,param_04);
}

//Function Number: 563
lib_A59A::func_5FFE(param_00,param_01,param_02,param_03,param_04)
{
	thread lib_A59B::func_5FFC(param_00,param_01,param_02,param_03,param_04,1);
}

//Function Number: 564
lib_A59A::func_6000(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_01) && param_01 > 0)
	{
		thread lib_A59B::func_6001(param_00,param_01,param_02,param_03);
		return;
	}

	lib_A59A::func_6002();
	lib_A59A::func_6005(param_00,param_02,param_03);
}

//Function Number: 565
lib_A59A::func_5FF9(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(isdefined(level.var_55B.var_5558))
	{
		function_0074(param_01,level.var_55B.var_5558,param_03);
	}
	else
	{
		iprintln("^3WARNING!  script music_crossfade(): No previous song was played - no previous song to crossfade from - not fading out anything");
	}

	level.var_55B.var_5558 = param_00;
	function_0073(param_00,param_01,param_02,0,param_03);
	level endon("stop_music");
	wait(param_01);
	level notify("done_crossfading");
}

//Function Number: 566
lib_A59A::func_6002(param_00)
{
	if(!isdefined(param_00) || param_00 <= 0)
	{
		function_0074();
	}
	else
	{
		function_0074(param_00);
	}

	level notify("stop_music");
}

//Function Number: 567
lib_A59A::func_6B6C()
{
	var_00 = getentarray("grenade","classname");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_02 = var_00[var_01];
		if(var_02.model == "weapon_claymore")
		{
			continue;
		}

		for(var_03 = 0;var_03 < level.var_328.size;var_03++)
		{
			var_04 = level.var_328[var_03];
			if(distancesquared(var_02.var_2E6,var_04.var_2E6) < 75625)
			{
				return 1;
			}
		}
	}

	return 0;
}

//Function Number: 568
lib_A59A::func_6AC8()
{
	return getdvarint("player_died_recently","0") > 0;
}

//Function Number: 569
lib_A59A::func_09E3(param_00)
{
	foreach(var_02 in level.var_328)
	{
		if(!var_02 istouching(param_00))
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 570
lib_A59A::func_0C95(param_00)
{
	foreach(var_02 in level.var_328)
	{
		if(var_02 istouching(param_00))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 571
lib_A59A::func_3F56()
{
	if(level.gameskill < 1)
	{
		return "easy";
	}

	if(level.gameskill < 2)
	{
		return "medium";
	}

	if(level.gameskill < 3)
	{
		return "hard";
	}

	return "fu";
}

//Function Number: 572
lib_A59A::func_3F0C()
{
	var_00 = 0;
	var_01 = 0;
	var_02 = 0;
	foreach(var_04 in level.var_328)
	{
		var_00 = var_00 + var_04.var_2E6[0];
		var_01 = var_01 + var_04.var_2E6[1];
		var_02 = var_02 + var_04.var_2E6[2];
	}

	var_00 = var_00 / level.var_328.size;
	var_01 = var_01 / level.var_328.size;
	var_02 = var_02 / level.var_328.size;
	return (var_00,var_01,var_02);
}

//Function Number: 573
lib_A59A::func_3CCF(param_00)
{
	var_01 = (0,0,0);
	foreach(var_03 in param_00)
	{
		var_01 = var_01 + var_03.var_2E6;
	}

	return var_01 * 1 / param_00.size;
}

//Function Number: 574
lib_A59A::func_3C8A()
{
	self.var_257D = [];
	self endon("entitydeleted");
	self endon("stop_generic_damage_think");
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04,var_05,var_06);
		foreach(var_08 in self.var_257D)
		{
			thread [[ var_08 ]](var_00,var_01,var_02,var_03,var_04,var_05,var_06);
		}
	}
}

//Function Number: 575
lib_A59A::func_0749(param_00)
{
	self.var_257D[self.var_257D.size] = param_00;
}

//Function Number: 576
lib_A59A::func_7339(param_00)
{
	var_01 = [];
	foreach(var_03 in self.var_257D)
	{
		if(var_03 == param_00)
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	self.var_257D = var_01;
}

//Function Number: 577
lib_A59A::func_420D(param_00,param_01)
{
	if(isdefined(level.var_A398) && level.var_A398 && isdefined(level.var_A399))
	{
		self [[ level.var_A399 ]](param_00,param_01);
	}
}

//Function Number: 578
lib_A59A::func_6DBD(param_00)
{
	self method_82F4(param_00);
}

//Function Number: 579
lib_A59A::func_3115(param_00)
{
	if(level.var_328.size < 1)
	{
		return;
	}

	foreach(var_02 in level.var_328)
	{
		if(param_00 == 1)
		{
			var_02 enableweapons();
			continue;
		}

		var_02 disableweapons();
	}
}

//Function Number: 580
lib_A59A::func_9238(param_00)
{
	var_01 = undefined;
	var_02 = undefined;
	var_03 = undefined;
	foreach(var_05 in param_00)
	{
		if(isdefined(var_05.var_39B) && var_05.var_39B == "player1")
		{
			var_01 = var_05;
			continue;
		}

		if(isdefined(var_05.var_39B) && var_05.var_39B == "player2")
		{
			var_02 = var_05;
			continue;
		}

		if(!isdefined(var_01))
		{
			var_01 = var_05;
		}

		if(!isdefined(var_02))
		{
			var_02 = var_05;
		}
	}

	foreach(var_08 in level.var_328)
	{
		if(var_08 == level.var_31D)
		{
			var_03 = var_01;
		}
		else if(var_08 == level.var_6C58)
		{
			var_03 = var_02;
		}

		var_08 setorigin(var_03.var_2E6);
		var_08 setplayerangles(var_03.var_41);
	}
}

//Function Number: 581
lib_A59A::func_9237(param_00)
{
	level.var_31D setorigin(param_00.var_2E6);
	if(isdefined(param_00.var_41))
	{
		level.var_31D setplayerangles(param_00.var_41);
	}
}

//Function Number: 582
lib_A59A::func_971C()
{
	var_00 = [];
	if(isdefined(self.var_330C))
	{
		var_00 = self.var_330C;
	}

	if(isdefined(self.entity))
	{
		var_00[var_00.size] = self.entity;
	}

	common_scripts\utility::array_levelthread(var_00,::lib_A59B::func_971D);
}

//Function Number: 583
lib_A59A::func_651A(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	level.var_31D endon("stop_opening_fov");
	wait(param_00);
	level.var_31D playerlinktodelta(param_01,param_02,1,param_03,param_04,param_05,param_06,1);
}

//Function Number: 584
lib_A59A::func_3CB6(param_00,param_01,param_02)
{
	if(!isdefined(param_00))
	{
		param_00 = "all";
	}

	if(!isdefined(param_01))
	{
		param_01 = "all";
	}

	var_03 = function_00D7(param_00,param_01);
	var_04 = [];
	foreach(var_06 in var_03)
	{
		if(var_06 istouching(self))
		{
			var_04[var_04.size] = var_06;
		}
	}

	return var_04;
}

//Function Number: 585
lib_A59A::func_3D47(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "all";
	}

	var_01 = [];
	if(param_00 == "all")
	{
		var_01 = lib_A59A::func_0CF2(level.var_2F19["allies"].var_CD8,level.var_2F19["axis"].var_CD8);
		var_01 = lib_A59A::func_0CF2(var_01,level.var_2F19["neutral"].var_CD8);
	}
	else
	{
		var_01 = level.var_2F19[param_00].var_CD8;
	}

	var_02 = [];
	foreach(var_04 in var_01)
	{
		if(!isdefined(var_04))
		{
			continue;
		}

		if(var_04 istouching(self))
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 586
lib_A59A::func_3D48(param_00)
{
	var_01 = lib_A59A::func_0CF2(level.var_2F19["allies"].var_CD8,level.var_2F19["axis"].var_CD8);
	var_01 = lib_A59A::func_0CF2(var_01,level.var_2F19["neutral"].var_CD8);
	var_02 = [];
	foreach(var_04 in var_01)
	{
		if(!isdefined(var_04))
		{
			continue;
		}

		if(isdefined(var_04.targetname) && var_04.targetname == param_00)
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 587
lib_A59A::func_3E05(param_00)
{
	foreach(var_02 in level.var_328)
	{
		if(param_00 == var_02)
		{
			continue;
		}

		return var_02;
	}
}

//Function Number: 588
lib_A59A::func_7DF2(param_00)
{
	self.count = param_00;
}

//Function Number: 589
lib_A59A::func_3968(param_00,param_01,param_02,param_03)
{
	self notify("_utility::follow_path");
	self endon("_utility::follow_path");
	self endon("death");
	var_04 = undefined;
	if(!isdefined(param_00.classname))
	{
		if(!isdefined(param_00.type))
		{
			var_04 = "struct";
		}
		else
		{
			var_04 = "node";
		}
	}
	else
	{
		var_04 = "entity";
	}

	if(!isdefined(param_01))
	{
		param_01 = 300;
	}

	var_05 = self.var_79E4;
	self.var_79E4 = 1;
	lib_A577::func_423E(param_00,var_04,param_02,param_01,param_03);
	self.var_79E4 = var_05;
}

//Function Number: 590
lib_A59A::func_30BB(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_00))
	{
		param_00 = 250;
	}

	if(!isdefined(param_01))
	{
		param_01 = 100;
	}

	if(!isdefined(param_02))
	{
		param_02 = param_00 * 2;
	}

	if(!isdefined(param_03))
	{
		param_03 = param_00 * 1.25;
	}

	if(!isdefined(param_05))
	{
		param_05 = 0;
	}

	self.var_2D2B = param_05;
	thread lib_A59B::func_2FE3(param_00,param_01,param_02,param_03,param_04);
}

//Function Number: 591
lib_A59A::func_2A9A()
{
	self notify("stop_dynamic_run_speed");
}

//Function Number: 592
lib_A59A::func_6BFB()
{
	self endon("death");
	self endon("stop_player_seek");
	var_00 = 1200;
	if(lib_A59A::func_46FB())
	{
		var_00 = 250;
	}

	var_01 = distance(self.var_2E6,level.var_31D.var_2E6);
	for(;;)
	{
		wait(2);
		self.var_1C7 = var_01;
		var_02 = lib_A59A::func_3CFC(self.var_2E6);
		self method_81A7(var_02);
		var_01 = var_01 - 175;
		if(var_01 < var_00)
		{
			var_01 = var_00;
			return;
		}
	}
}

//Function Number: 593
lib_A59A::func_6BFA()
{
	self notify("stop_player_seek");
}

//Function Number: 594
lib_A59A::func_A085(param_00,param_01,param_02)
{
	self endon("death");
	param_00 endon("death");
	if(!isdefined(param_02))
	{
		param_02 = 5;
	}

	var_03 = gettime() + param_02 * 1000;
	while(isdefined(param_00))
	{
		if(distance(param_00.var_2E6,self.var_2E6) <= param_01)
		{
			break;
		}

		if(gettime() > var_03)
		{
			break;
		}

		wait(0.1);
	}
}

//Function Number: 595
lib_A59A::func_A084(param_00,param_01)
{
	self endon("death");
	param_00 endon("death");
	while(isdefined(param_00))
	{
		if(distance(param_00.var_2E6,self.var_2E6) <= param_01)
		{
			break;
		}

		wait(0.1);
	}
}

//Function Number: 596
lib_A59A::func_A086(param_00,param_01)
{
	self endon("death");
	param_00 endon("death");
	while(isdefined(param_00))
	{
		if(distance(param_00.var_2E6,self.var_2E6) > param_01)
		{
			break;
		}

		wait(0.1);
	}
}

//Function Number: 597
lib_A59A::func_46FB()
{
	self endon("death");
	if(!isdefined(self.weapon))
	{
		return 0;
	}

	if(weaponclass(self.weapon) == "spread")
	{
		return 1;
	}

	return 0;
}

//Function Number: 598
lib_A59A::isprimaryweapon(param_00)
{
	if(param_00 == "none")
	{
		return 0;
	}

	if(weaponinventorytype(param_00) != "primary")
	{
		return 0;
	}

	switch(weaponclass(param_00))
	{
		case "rifle":
		case "sniper":
		case "smg":
		case "spread":
		case "rocketlauncher":
		case "pistol":
		case "mg":
			break;

		default:
			break;
	}
}

//Function Number: 599
lib_A59A::func_6B47()
{
	var_00 = self getweaponslistall();
	if(!isdefined(var_00))
	{
		return 0;
	}

	foreach(var_02 in var_00)
	{
		if(issubstr(var_02,"thermal"))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 600
lib_A59A::func_A0BB(param_00,param_01)
{
	self endon("death");
	if(!isdefined(param_01))
	{
		param_01 = self.var_1C7;
	}

	for(;;)
	{
		self waittill("goal");
		if(distance(self.var_2E6,param_00) < param_01 + 10)
		{
			break;
		}
	}
}

//Function Number: 601
lib_A59A::func_6C1D(param_00,param_01)
{
	var_02 = int(getdvar("g_speed"));
	if(!isdefined(level.var_31D.var_3BC2))
	{
		level.var_31D.var_3BC2 = var_02;
	}

	var_03 = int(level.var_31D.var_3BC2 * param_00 * 0.01);
	level.var_31D lib_A59A::func_6C1F(var_03,param_01);
}

//Function Number: 602
lib_A59A::func_149D(param_00,param_01)
{
	var_02 = self;
	if(!isplayer(var_02))
	{
		var_02 = level.var_31D;
	}

	if(!isdefined(var_02.var_5F77))
	{
		var_02.var_5F77 = 1;
	}

	var_03 = param_00 * 0.01;
	var_02 lib_A59A::func_149B(var_03,param_01);
}

//Function Number: 603
lib_A59A::func_6C1F(param_00,param_01)
{
	var_02 = int(getdvar("g_speed"));
	if(!isdefined(level.var_31D.var_3BC2))
	{
		level.var_31D.var_3BC2 = var_02;
	}

	var_03 = ::lib_A59B::func_3BC3;
	var_04 = ::lib_A59B::func_3BC4;
	level.var_31D thread lib_A59A::func_6C1E(param_00,param_01,var_03,var_04,"player_speed_set");
}

//Function Number: 604
lib_A59A::func_6A77(param_00,param_01)
{
	var_02 = ::lib_A59B::func_3BBF;
	var_03 = ::lib_A59B::func_3BC0;
	level.var_31D thread lib_A59A::func_6C1E(param_00,param_01,var_02,var_03,"player_bob_scale_set");
}

//Function Number: 605
lib_A59A::func_149B(param_00,param_01)
{
	var_02 = self;
	if(!isplayer(var_02))
	{
		var_02 = level.var_31D;
	}

	if(!isdefined(var_02.var_5F77))
	{
		var_02.var_5F77 = 1;
	}

	var_03 = ::lib_A59B::func_5F72;
	var_04 = ::lib_A59B::func_5F76;
	var_02 thread lib_A59A::func_6C1E(param_00,param_01,var_03,var_04,"blend_movespeedscale");
}

//Function Number: 606
lib_A59A::func_6C1E(param_00,param_01,param_02,param_03,param_04)
{
	self notify(param_04);
	self endon(param_04);
	var_05 = [[ param_02 ]]();
	var_06 = param_00;
	if(isdefined(param_01))
	{
		var_07 = var_06 - var_05;
		var_08 = 0.05;
		var_09 = param_01 / var_08;
		var_0A = var_07 / var_09;
		while(abs(var_06 - var_05) > abs(var_0A * 1.1))
		{
			var_05 = var_05 + var_0A;
			[[ param_03 ]](var_05);
			wait(var_08);
		}
	}

	[[ param_03 ]](var_06);
}

//Function Number: 607
lib_A59A::func_6C1A(param_00)
{
	if(!isdefined(level.var_31D.var_3BC2))
	{
		return;
	}

	level.var_31D lib_A59A::func_6C1F(level.var_31D.var_3BC2,param_00);
	waittillframeend;
	level.var_31D.var_3BC2 = undefined;
}

//Function Number: 608
lib_A59A::func_149C(param_00)
{
	var_01 = self;
	if(!isplayer(var_01))
	{
		var_01 = level.var_31D;
	}

	if(!isdefined(var_01.var_5F77))
	{
		return;
	}

	var_01 lib_A59A::func_149B(1,param_00);
	waittillframeend;
	var_01.var_5F77 = undefined;
}

//Function Number: 609
lib_A59A::func_9212(param_00)
{
	if(isplayer(self))
	{
		self setorigin(param_00.var_2E6);
		self setplayerangles(param_00.var_41);
		return;
	}

	self method_81C6(param_00.var_2E6,param_00.var_41);
}

//Function Number: 610
lib_A59A::func_9246(param_00,param_01)
{
	var_02 = param_00 gettagorigin(param_01);
	var_03 = param_00 gettagangles(param_01);
	self dontinterpolate();
	if(isplayer(self))
	{
		self setorigin(var_02);
		self setplayerangles(var_03);
		return;
	}

	if(isai(self))
	{
		self method_81C6(var_02,var_03);
		return;
	}

	self.var_2E6 = var_02;
	self.var_41 = var_03;
}

//Function Number: 611
lib_A59A::func_9207(param_00)
{
	self method_81C6(param_00.var_2E6,param_00.var_41);
	self method_81A6(self.var_2E6);
	self method_81A5(param_00);
}

//Function Number: 612
lib_A59A::func_5EFD(param_00)
{
	foreach(var_02 in level.createfxent)
	{
		var_02.v["origin"] = var_02.v["origin"] + param_00;
	}
}

//Function Number: 613
lib_A59A::func_51A7()
{
	return isdefined(self.var_8620);
}

//Function Number: 614
lib_A59A::func_139F(param_00,param_01,param_02)
{
	var_03 = self;
	var_03 thread lib_A59A::play_sound_on_entity("foot_slide_plr_start");
	if(soundexists("foot_slide_plr_loop"))
	{
		var_03 thread lib_A59A::func_6973("foot_slide_plr_loop");
	}

	var_04 = isdefined(level.var_254B);
	if(!isdefined(param_00))
	{
		param_00 = var_03 getvelocity() + (0,0,-10);
	}

	if(!isdefined(param_01))
	{
		param_01 = 10;
	}

	if(!isdefined(param_02))
	{
		if(isdefined(level.var_861B))
		{
			param_02 = level.var_861B;
		}
		else
		{
			param_02 = 0.035;
		}
	}

	var_05 = spawn("script_origin",var_03.var_2E6);
	var_05.var_41 = var_03.var_41;
	var_03.var_8620 = var_05;
	var_05 moveslide((0,0,15),15,param_00);
	if(var_04)
	{
		var_03 playerlinktoblend(var_05,undefined,1);
	}
	else
	{
		var_03 playerlinkto(var_05);
	}

	var_03 disableweapons();
	var_03 method_811A(0);
	var_03 method_8119(1);
	var_03 method_8118(0);
	var_03 thread lib_A59B::func_2D7A(var_05,param_01,param_02);
}

//Function Number: 615
lib_A59A::func_31C6()
{
	var_00 = self;
	var_00 notify("stop soundfoot_slide_plr_loop");
	var_00 thread lib_A59A::play_sound_on_entity("foot_slide_plr_end");
	var_00 unlink();
	var_00 setvelocity(var_00.var_8620.var_3CC);
	var_00.var_8620 delete();
	var_00 enableweapons();
	var_00 method_811A(1);
	var_00 method_8119(1);
	var_00 method_8118(1);
	var_00 notify("stop_sliding");
}

//Function Number: 616
lib_A59A::func_896F()
{
	return lib_A59E::func_9D39(self);
}

//Function Number: 617
lib_A59A::func_3F87(param_00)
{
	var_01 = lib_A594::func_3DC8();
	var_02 = [];
	foreach(var_06, var_04 in var_01)
	{
		if(!issubstr(var_06,"flag"))
		{
			continue;
		}

		var_05 = getentarray(var_06,"classname");
		var_02 = common_scripts\utility::array_combine(var_02,var_05);
	}

	var_07 = lib_A594::func_3DC9();
	foreach(var_09, var_04 in var_07)
	{
		if(!issubstr(var_09,"flag"))
		{
			continue;
		}

		var_05 = getentarray(var_09,"targetname");
		var_02 = common_scripts\utility::array_combine(var_02,var_05);
	}

	var_0A = undefined;
	foreach(var_0C in var_02)
	{
		if(var_0C.var_79CE == param_00)
		{
			return var_0C;
		}
	}
}

//Function Number: 618
lib_A59A::func_3F82(param_00)
{
	var_01 = lib_A594::func_3DC8();
	var_02 = [];
	foreach(var_06, var_04 in var_01)
	{
		if(!issubstr(var_06,"flag"))
		{
			continue;
		}

		var_05 = getentarray(var_06,"classname");
		var_02 = common_scripts\utility::array_combine(var_02,var_05);
	}

	var_07 = lib_A594::func_3DC9();
	foreach(var_09, var_04 in var_07)
	{
		if(!issubstr(var_09,"flag"))
		{
			continue;
		}

		var_05 = getentarray(var_09,"targetname");
		var_02 = common_scripts\utility::array_combine(var_02,var_05);
	}

	var_0A = [];
	foreach(var_0C in var_02)
	{
		if(var_0C.var_79CE == param_00)
		{
			var_0A[var_0A.size] = var_0C;
		}
	}

	return var_0A;
}

//Function Number: 619
lib_A59A::func_7F09(param_00,param_01)
{
	return (param_00[0],param_00[1],param_01);
}

//Function Number: 620
lib_A59A::func_07C2(param_00,param_01)
{
	return (param_00[0],param_00[1],param_00[2] + param_01);
}

//Function Number: 621
lib_A59A::func_7F08(param_00,param_01)
{
	return (param_00[0],param_01,param_00[2]);
}

//Function Number: 622
lib_A59A::func_7F07(param_00,param_01)
{
	return (param_01,param_00[1],param_00[2]);
}

//Function Number: 623
lib_A59A::func_6C4B()
{
	var_00 = self getcurrentweapon();
	if(!isdefined(var_00))
	{
		return 0;
	}

	if(issubstr(tolower(var_00),"rpg"))
	{
		return 1;
	}

	if(issubstr(tolower(var_00),"stinger"))
	{
		return 1;
	}

	if(issubstr(tolower(var_00),"at4"))
	{
		return 1;
	}

	if(issubstr(tolower(var_00),"javelin"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 624
lib_A59A::func_2CE6()
{
	return isdefined(self.var_7.var_2CE6);
}

//Function Number: 625
lib_A59A::func_3E56(param_00,param_01)
{
	if(lib_A59A::func_5009())
	{
	}

	var_02 = lib_A59A::func_3E23();
	if(!isdefined(param_00))
	{
		param_00 = "steady_rumble";
	}

	var_03 = spawn("script_origin",var_02 geteye());
	if(!isdefined(param_01) || !function_02BA(param_01))
	{
		var_03.intensity = 1;
	}
	else
	{
		var_03.intensity = param_01;
	}

	var_03 thread lib_A59B::func_9AD0(var_02,param_00);
	return var_03;
}

//Function Number: 626
lib_A59A::func_7EA4(param_00)
{
	self.intensity = param_00;
}

//Function Number: 627
lib_A59A::func_768C(param_00)
{
	thread lib_A59A::func_768D(1,param_00);
}

//Function Number: 628
lib_A59A::func_768B(param_00)
{
	thread lib_A59A::func_768D(0,param_00);
}

//Function Number: 629
lib_A59A::func_768D(param_00,param_01)
{
	self notify("new_ramp");
	self endon("new_ramp");
	self endon("death");
	var_02 = param_01 * 20;
	var_03 = param_00 - self.intensity;
	var_04 = var_03 / var_02;
	for(var_05 = 0;var_05 < var_02;var_05++)
	{
		self.intensity = self.intensity + var_04;
		wait(0.05);
	}

	self.intensity = param_00;
}

//Function Number: 630
lib_A59A::func_3E23()
{
	if(isdefined(self))
	{
		if(!lib_A59A::func_5038(level.var_328,self))
		{
			return level.var_31D;
		}

		return self;
	}

	return level.var_31D;
}

//Function Number: 631
lib_A59A::func_3E24()
{
	return int(self getplayersetting("gameskill"));
}

//Function Number: 632
lib_A59A::func_4233(param_00)
{
	if(isdefined(self.var_614A))
	{
		return;
	}

	self.var_614A = self.model;
	if(!isdefined(param_00))
	{
		param_00 = self.model + "_obj";
	}

	self setmodel(param_00);
}

//Function Number: 633
lib_A59A::func_8EE6(param_00)
{
	if(!isdefined(self.var_614A))
	{
		return;
	}

	self setmodel(self.var_614A);
	self.var_614A = undefined;
}

//Function Number: 634
lib_A59A::func_0CE6(param_00,param_01,param_02)
{
	var_03 = [];
	param_01 = param_02 - param_01;
	foreach(var_05 in param_00)
	{
		var_03[var_03.size] = var_05;
		if(var_03.size == param_02)
		{
			var_03 = common_scripts\utility::array_randomize(var_03);
			for(var_06 = param_01;var_06 < var_03.size;var_06++)
			{
				var_03[var_06] delete();
			}

			var_03 = [];
		}
	}

	var_08 = [];
	foreach(var_05 in param_00)
	{
		if(!isdefined(var_05))
		{
			continue;
		}

		var_08[var_08.size] = var_05;
	}

	return var_08;
}

//Function Number: 635
lib_A59A::func_A08C(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 0.5;
	}

	self endon("death");
	while(isdefined(self))
	{
		if(distance(param_00,self.var_2E6) <= param_01)
		{
			break;
		}

		wait(param_02);
	}
}

//Function Number: 636
lib_A59A::func_07B3(param_00)
{
	var_01 = spawnstruct();
	var_01 thread lib_A59B::func_7B4(param_00);
	return var_01;
}

//Function Number: 637
lib_A59A::func_9492(param_00,param_01,param_02)
{
	var_03 = self gettagorigin(param_01);
	var_04 = self gettagangles(param_01);
	lib_A59A::func_9491(param_00,var_03,var_04,param_02);
}

//Function Number: 638
lib_A59A::func_9491(param_00,param_01,param_02,param_03)
{
	var_04 = anglestoforward(param_02);
	var_05 = bullettrace(param_01,param_01 + var_04 * param_03,0,undefined);
	if(var_05["fraction"] >= 1)
	{
		return;
	}

	var_06 = var_05["surfacetype"];
	if(!isdefined(level.var_948A[param_00][var_06]))
	{
		var_06 = "default";
	}

	var_07 = level.var_948A[param_00][var_06];
	if(isdefined(var_07["fx"]))
	{
		playfx(var_07["fx"],var_05["position"],var_05["normal"]);
	}

	if(isdefined(var_07["fx_array"]))
	{
		foreach(var_09 in var_07["fx_array"])
		{
			playfx(var_09,var_05["position"],var_05["normal"]);
		}
	}

	if(isdefined(var_07["sound"]))
	{
		level thread common_scripts\utility::play_sound_in_space(var_07["sound"],var_05["position"]);
	}

	if(isdefined(var_07["rumble"]))
	{
		var_0B = lib_A59A::func_3E23();
		var_0B playrumbleonentity(var_07["rumble"]);
	}
}

//Function Number: 639
lib_A59A::func_2AD9()
{
	self.var_2B1 = 0;
}

//Function Number: 640
lib_A59A::func_30F6()
{
	self.var_2B1 = squared(512);
}

//Function Number: 641
lib_A59A::func_30C8(param_00)
{
	self.var_4792 = 1;
	self.var_6106 = 1;
	self.var_4E7 = 1;
	if(!isdefined(param_00) || !param_00)
	{
		self.var_2D3A = 1;
		self.var_274 = 64;
		self.var_2FC = 2048;
		lib_A59A::func_2AD9();
	}

	self.var_8A2F = ::animscripts\animset::func_4794;
	self.var_2562["run"] = animscripts\utility::func_5861("heat_run");
}

//Function Number: 642
lib_A59A::func_2AAA()
{
	self.var_4792 = undefined;
	self.var_6106 = undefined;
	self.var_2D3A = undefined;
	self.var_4E7 = 0;
	self.var_274 = 512;
	self.var_8A2F = undefined;
	self.var_2562 = undefined;
}

//Function Number: 643
lib_A59A::func_4150()
{
	return veh_getarray();
}

//Function Number: 644
lib_A59A::func_48AD(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	var_03 = 0.5;
	level endon("clearing_hints");
	if(isdefined(level.var_4900))
	{
		level.var_4900 lib_A53C::destroyelem();
	}

	level.var_4900 = lib_A53C::createfontstring("default",1.5);
	level.var_4900 lib_A53C::setpoint("MIDDLE",undefined,0,30 + param_02);
	level.var_4900.color = (1,1,1);
	level.var_4900 settext(param_00);
	level.var_4900.alpha = 0;
	level.var_4900 fadeovertime(0.5);
	level.var_4900.alpha = 1;
	wait(0.5);
	level.var_4900 endon("death");
	if(isdefined(param_01))
	{
		wait(param_01);
	}
	else
	{
		return;
	}

	level.var_4900 fadeovertime(var_03);
	level.var_4900.alpha = 0;
	wait(var_03);
	level.var_4900 lib_A53C::destroyelem();
}

//Function Number: 645
lib_A59A::func_48C8()
{
	var_00 = 1;
	if(isdefined(level.var_4900))
	{
		level notify("clearing_hints");
		level.var_4900 fadeovertime(var_00);
		level.var_4900.alpha = 0;
		wait(var_00);
	}
}

//Function Number: 646
lib_A59A::func_5303(param_00,param_01,param_02)
{
	if(!isdefined(level.flag[param_00]))
	{
		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	foreach(var_04 in level.var_265A[param_00])
	{
		foreach(var_06 in var_04)
		{
			if(isalive(var_06))
			{
				var_06 thread lib_A59B::func_5304(param_01,param_02);
				continue;
			}

			var_06 delete();
		}
	}
}

//Function Number: 647
lib_A59A::func_3E2C(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = "player_view_controller";
	}

	if(!isdefined(param_02))
	{
		param_02 = (0,0,0);
	}

	var_04 = param_00 gettagorigin(param_01);
	var_05 = spawnturret("misc_turret",var_04,param_03);
	var_05.var_41 = param_00 gettagangles(param_01);
	var_05 setmodel("tag_turret");
	var_05 linkto(param_00,param_01,param_02,(0,0,0));
	var_05 makeunusable();
	var_05 hide();
	var_05 setmode("manual");
	return var_05;
}

//Function Number: 648
lib_A59A::func_239F(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	var_04 childthread lib_A59B::func_6FDC(param_00,self,param_01,param_02,param_03);
	return var_04;
}

//Function Number: 649
lib_A59A::func_7EE1(param_00,param_01)
{
	if(isdefined(self.var_9A8F))
	{
		self.var_9A8F = [];
	}

	if(!isdefined(param_01) || param_01)
	{
		self.var_9A8F[param_00] = 1;
		return;
	}

	self.var_9A8F[param_00] = undefined;
}

//Function Number: 650
lib_A59A::func_5093(param_00)
{
	if(!isdefined(self.var_9A8F))
	{
		return 0;
	}

	return isdefined(self.var_9A8F[param_00]);
}

//Function Number: 651
lib_A59A::func_8F0A(param_00)
{
	if(!isdefined(self.var_8F13))
	{
		self.var_8F13 = [];
	}

	if(!isdefined(self.var_9A8F))
	{
		self.var_9A8F = [];
	}

	var_01 = [];
	var_02 = self getweaponslistall();
	var_03 = self getcurrentweapon();
	foreach(var_05 in var_02)
	{
		if(isdefined(self.var_9A8F[var_05]))
		{
			continue;
		}

		var_01[var_05] = [];
		var_01[var_05]["clip_left"] = self getweaponammoclip(var_05,"left");
		var_01[var_05]["clip_right"] = self getweaponammoclip(var_05,"right");
		var_01[var_05]["stock"] = self getweaponammostock(var_05);
	}

	if(!isdefined(param_00))
	{
		param_00 = "default";
	}

	self.var_8F13[param_00] = [];
	if(isdefined(self.var_9A8F[var_03]))
	{
		var_07 = self getweaponslistprimaries();
		foreach(var_05 in var_07)
		{
			if(!isdefined(self.var_9A8F[var_05]))
			{
				var_03 = var_05;
				break;
			}
		}
	}

	self.var_8F13[param_00]["current_weapon"] = var_03;
	self.var_8F13[param_00]["inventory"] = var_01;
}

//Function Number: 652
lib_A59A::func_749D(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "default";
	}

	if(!isdefined(self.var_8F13) || !isdefined(self.var_8F13[param_00]))
	{
		return;
	}

	self takeallweapons();
	foreach(var_03, var_02 in self.var_8F13[param_00]["inventory"])
	{
		if(weaponinventorytype(var_03) != "altmode")
		{
			self giveweapon(var_03);
		}

		self setweaponammoclip(var_03,var_02["clip_left"],"left");
		self setweaponammoclip(var_03,var_02["clip_right"],"right");
		self setweaponammostock(var_03,var_02["stock"]);
	}

	var_04 = self.var_8F13[param_00]["current_weapon"];
	if(var_04 != "none")
	{
		self switchtoweapon(var_04);
	}
}

//Function Number: 653
lib_A59A::func_3E76()
{
	var_00 = self getweaponslistall();
	if(isdefined(self.var_9A8F))
	{
		foreach(var_02 in var_00)
		{
			if(isdefined(self.var_9A8F[var_02]))
			{
				var_00 = common_scripts\utility::array_remove(var_00,var_02);
			}
		}
	}

	return var_00;
}

//Function Number: 654
lib_A59A::func_3E77()
{
	var_00 = self getweaponslistprimaries();
	if(isdefined(self.var_9A8F))
	{
		foreach(var_02 in var_00)
		{
			if(isdefined(self.var_9A8F[var_02]))
			{
				var_00 = common_scripts\utility::array_remove(var_00,var_02);
			}
		}
	}

	return var_00;
}

//Function Number: 655
lib_A59A::func_3E75()
{
	var_00 = self getcurrentprimaryweapon();
	if(isdefined(self.var_9A8F) && isdefined(self.var_9A8F[var_00]))
	{
		var_00 = lib_A59A::func_3D6A();
	}

	return var_00;
}

//Function Number: 656
lib_A59A::func_3E74()
{
	var_00 = self getcurrentweapon();
	if(isdefined(self.var_9A8F) && isdefined(self.var_9A8F[var_00]))
	{
		var_00 = lib_A59A::func_3D6A();
	}

	return var_00;
}

//Function Number: 657
lib_A59A::func_3D6A()
{
	var_00 = lib_A59A::func_3E77();
	if(var_00.size > 0)
	{
		var_01 = var_00[0];
	}
	else
	{
		var_01 = "none";
	}

	return var_01;
}

//Function Number: 658
lib_A59A::func_484A()
{
	switch(self.code_classname)
	{
		case "light_spot":
		case "script_vehicle":
		case "script_model":
			break;

		case "script_brushmodel":
			break;

		case "trigger_multiple_flag_looking":
		case "trigger_multiple_flag_lookat":
		case "trigger_multiple_breachIcon":
		case "trigger_multiple_flag_set":
		case "trigger_use_touch":
		case "trigger_use":
		case "trigger_multiple":
		case "trigger_radius":
			break;

		default:
			break;
	}
}

//Function Number: 659
lib_A59A::func_84C4()
{
	switch(self.code_classname)
	{
		case "light_spot":
		case "script_vehicle":
		case "script_model":
			break;

		case "script_brushmodel":
			break;

		case "trigger_multiple_flag_looking":
		case "trigger_multiple_flag_lookat":
		case "trigger_multiple_breachIcon":
		case "trigger_multiple_flag_set":
		case "trigger_use_touch":
		case "trigger_use":
		case "trigger_multiple":
		case "trigger_radius":
			break;

		default:
			break;
	}
}

//Function Number: 660
lib_A59A::func_062B(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_03))
	{
		self rotateyaw(param_00,param_01,param_02,param_03);
		return;
	}

	if(isdefined(param_02))
	{
		self rotateyaw(param_00,param_01,param_02);
		return;
	}

	self rotateyaw(param_00,param_01);
}

//Function Number: 661
lib_A59A::func_7E7B(param_00,param_01,param_02)
{
	self notify("set_moveplaybackrate");
	self endon("set_moveplaybackrate");
	if(isdefined(param_02) && param_02)
	{
		thread lib_A59A::func_7E7C(param_00,param_01);
	}

	if(!isdefined(self.var_5F63))
	{
		self.var_5F63 = self.var_5F62;
	}

	if(isdefined(param_01))
	{
		var_03 = param_00 - self.var_5F62;
		var_04 = 0.05;
		var_05 = param_01 / var_04;
		var_06 = var_03 / var_05;
		while(abs(param_00 - self.var_5F62) > abs(var_06 * 1.1))
		{
			self.var_5F62 = self.var_5F62 + var_06;
			wait(var_04);
		}
	}

	self.var_5F62 = param_00;
}

//Function Number: 662
lib_A59A::func_749B(param_00,param_01)
{
	self notify("set_moveplaybackrate");
	self endon("set_moveplaybackrate");
	if(isdefined(param_01) && param_01)
	{
		thread lib_A59A::func_749C(param_00);
	}

	lib_A59A::func_7E7B(self.var_5F63,param_00,0);
	self.var_5F63 = undefined;
}

//Function Number: 663
lib_A59A::func_7E7C(param_00,param_01)
{
	self notify("set_moveplaybackrate");
	self endon("set_moveplaybackrate");
	if(!isdefined(self.var_5F95))
	{
		self.var_5F95 = self.var_5F94;
	}

	if(isdefined(param_01))
	{
		var_02 = param_00 - self.var_5F94;
		var_03 = 0.05;
		var_04 = param_01 / var_03;
		var_05 = var_02 / var_04;
		while(abs(param_00 - self.var_5F94) > abs(var_05 * 1.1))
		{
			self.var_5F94 = self.var_5F94 + var_05;
			wait(var_03);
		}
	}

	self.var_5F94 = param_00;
}

//Function Number: 664
lib_A59A::func_749C(param_00)
{
	self notify("set_moveplaybackrate");
	self endon("set_moveplaybackrate");
	lib_A59A::func_7E7C(self.var_5F95,param_00);
	self.var_5F95 = undefined;
}

//Function Number: 665
lib_A59A::func_0D0B(param_00,param_01,param_02,param_03,param_04,param_05)
{
	foreach(var_07 in param_00)
	{
		var_07 thread lib_A59A::func_0798(param_01,param_02,param_03,param_04,param_05);
	}
}

//Function Number: 666
lib_A59A::func_0D0D(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = getentarray(param_00,"targetname");
	lib_A59A::func_0D0B(var_06,param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 667
lib_A59A::func_0D0C(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = getentarray(param_00,"script_noteworthy");
	lib_A59A::func_0D0B(var_06,param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 668
lib_A59A::func_30B9()
{
	self.var_2D33 = 1;
}

//Function Number: 669
lib_A59A::func_2A99()
{
	self.var_2D33 = undefined;
}

//Function Number: 670
lib_A59A::func_23DB(param_00)
{
	if(!isdefined(level.var_8FC8))
	{
		level.var_8FC8 = [];
	}

	var_01 = spawnstruct();
	var_01.name = param_00;
	level.var_8FC8[param_00] = var_01;
	return var_01;
}

//Function Number: 671
lib_A59A::create_vision_set_fog(param_00)
{
	if(!isdefined(level.vision_set_fog))
	{
		level.vision_set_fog = [];
	}

	var_01 = spawnstruct();
	var_01.name = param_00;
	var_01.skyfogintensity = 0;
	var_01.skyfogminangle = 0;
	var_01.skyfogmaxangle = 0;
	var_01.heightfogenabled = 0;
	var_01.heightfogbaseheight = 0;
	var_01.heightfoghalfplanedistance = 1000;
	level.vision_set_fog[tolower(param_00)] = var_01;
	return var_01;
}

//Function Number: 672
lib_A59A::func_3EBD(param_00)
{
	if(!isdefined(level.vision_set_fog))
	{
		level.vision_set_fog = [];
	}

	var_01 = level.vision_set_fog[tolower(param_00)];
	if(lib_A59A::func_9C19() && isdefined(var_01) && isdefined(var_01.var_4772))
	{
		var_01 = level.vision_set_fog[tolower(var_01.var_4772)];
	}

	return var_01;
}

//Function Number: 673
lib_A59A::func_23B6(param_00)
{
	if(!isdefined(level.var_395B))
	{
		level.var_395B = [];
	}

	var_01 = spawnstruct();
	var_01.name = param_00;
	level.var_395B[tolower(param_00)] = var_01;
	return var_01;
}

//Function Number: 674
lib_A59A::get_fog(param_00)
{
	if(!isdefined(level.var_395B))
	{
		level.var_395B = [];
	}

	var_01 = level.var_395B[tolower(param_00)];
	return var_01;
}

//Function Number: 675
lib_A59A::func_4D53()
{
	if(!isdefined(self.fog_transition_ent))
	{
		self.fog_transition_ent = spawnstruct();
		self.fog_transition_ent.fogset = "";
		self.fog_transition_ent.time = 0;
	}
}

//Function Number: 676
lib_A59A::func_9C19()
{
	if(!isdefined(level.console))
	{
		lib_A59A::set_console_status();
	}

	return lib_A59A::is_gen4();
}

//Function Number: 677
lib_A59A::func_395C(param_00,param_01)
{
	if(!isplayer(self))
	{
		lib_A509::init_fog_transition();
	}
	else
	{
		lib_A59A::func_4D53();
	}

	if(!isdefined(level.var_395B))
	{
		level.var_395B = [];
	}

	var_02 = level.var_395B[tolower(param_00)];
	if(!isdefined(var_02))
	{
		var_02 = level.vision_set_fog[tolower(param_00)];
	}

	if(isdefined(var_02) && isdefined(var_02.var_4772) && lib_A59A::func_9C19())
	{
		if(isdefined(level.var_395B[tolower(var_02.var_4772)]))
		{
			var_02 = level.var_395B[tolower(var_02.var_4772)];
		}
		else if(isdefined(level.vision_set_fog))
		{
			var_02 = level.vision_set_fog[tolower(var_02.var_4772)];
		}
	}

	if(!isdefined(param_01))
	{
		param_01 = var_02.transitiontime;
	}

	if(!isplayer(self))
	{
		common_scripts\utility::set_fog_to_ent_values(var_02,param_01);
		level.fog_transition_ent.fogset = param_00;
		level.fog_transition_ent.time = param_01;
		return;
	}

	if(param_00 != "" && self.fog_transition_ent.fogset == param_00 && self.fog_transition_ent.time == param_01)
	{
		return;
	}

	common_scripts\utility::set_fog_to_ent_values(var_02,param_01);
	self.fog_transition_ent.fogset = param_00;
	self.fog_transition_ent.time = param_01;
}

//Function Number: 678
lib_A59A::func_9E65(param_00,param_01)
{
	var_02 = lib_A59A::func_9E63(param_00,param_01);
	if(var_02)
	{
		if(level.currentgen && isdefined(lib_A59A::func_3EBD(param_00 + "_cg")))
		{
			lib_A59A::func_395C(param_00 + "_cg",param_01);
			return;
		}

		if(isdefined(lib_A59A::func_3EBD(param_00)))
		{
			lib_A59A::func_395C(param_00,param_01);
			return;
		}

		clearfog(param_01);
		return;
	}
}

//Function Number: 679
lib_A59A::func_4D54()
{
	if(!isdefined(self.vision_set_transition_ent))
	{
		self.vision_set_transition_ent = spawnstruct();
		self.vision_set_transition_ent.vision_set = "";
		self.vision_set_transition_ent.time = 0;
	}
}

//Function Number: 680
lib_A59A::func_9E63(param_00,param_01)
{
	if(!isplayer(self))
	{
		var_02 = 1;
		if(!isdefined(level.vision_set_transition_ent))
		{
			level.vision_set_transition_ent = spawnstruct();
			level.vision_set_transition_ent.vision_set = "";
			level.vision_set_transition_ent.time = 0;
			var_02 = 0;
		}

		if(param_00 != "" && level.vision_set_transition_ent.vision_set == param_00 && level.vision_set_transition_ent.time == param_01)
		{
			return 0;
		}

		level.vision_set_transition_ent.vision_set = param_00;
		level.vision_set_transition_ent.time = param_01;
		if(var_02 && getdvarint("scr_art_tweak") != 0)
		{
		}
		else
		{
			visionsetnaked(param_00,param_01);
		}

		level.var_58B9 = param_00;
		setdvar("vision_set_current",param_00);
	}
	else
	{
		lib_A59A::func_4D54();
		if(param_00 != "" && self.vision_set_transition_ent.vision_set == param_00 && self.vision_set_transition_ent.time == param_01)
		{
			return 0;
		}

		self.vision_set_transition_ent.vision_set = param_00;
		self.vision_set_transition_ent.time = param_01;
		self visionsetnakedforplayer(param_00,param_01);
	}

	return 1;
}

//Function Number: 681
lib_A59A::func_30F9()
{
	thread lib_A59A::func_30FA();
}

//Function Number: 682
lib_A59A::func_30FA()
{
	self endon("death");
	for(;;)
	{
		self.var_91EA = 1;
		wait(0.05);
	}
}

//Function Number: 683
lib_A59A::func_2ADE()
{
	self.var_91EA = undefined;
}

//Function Number: 684
lib_A59A::func_061D(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_04))
	{
		radiusdamage(param_00,param_01,param_02,param_03);
		return;
	}

	radiusdamage(param_00,param_01,param_02,param_03,param_04);
}

//Function Number: 685
lib_A59A::func_59D0(param_00)
{
	var_01 = getentarray("destructible_toy","targetname");
	var_02 = getentarray("destructible_vehicle","targetname");
	var_03 = common_scripts\utility::array_combine(var_01,var_02);
	foreach(var_05 in param_00)
	{
		var_05.destructibles = [];
	}

	foreach(var_08 in var_03)
	{
		foreach(var_05 in param_00)
		{
			if(!var_05 istouching(var_08))
			{
				continue;
			}

			var_05 lib_A59B::func_7061(var_08);
			break;
		}
	}
}

//Function Number: 686
lib_A59A::func_4EA4()
{
	var_00 = [];
	var_00[0] = ["interactive_birds","targetname"];
	var_00[1] = ["interactive_vulture","targetname"];
	var_00[2] = ["interactive_fish","script_noteworthy"];
	return var_00;
}

//Function Number: 687
lib_A59A::func_59D2(param_00)
{
	var_01 = lib_A59A::func_4EA4();
	var_02 = [];
	foreach(var_04 in var_01)
	{
		var_05 = getentarray(var_04[0],var_04[1]);
		var_02 = common_scripts\utility::array_combine(var_02,var_05);
	}

	foreach(var_08 in var_02)
	{
		if(!isdefined(level.var_5D3[var_08.var_4EA2].var_781C))
		{
			continue;
		}

		foreach(var_0B in param_00)
		{
			if(!var_0B istouching(var_08))
			{
				continue;
			}

			if(!isdefined(var_0B.var_4EA5))
			{
				var_0B.var_4EA5 = [];
			}

			var_0B.var_4EA5[var_0B.var_4EA5.size] = var_08 [[ level.var_5D3[var_08.var_4EA2].var_781C ]]();
		}
	}
}

//Function Number: 688
lib_A59A::func_06FF()
{
	if(!isdefined(self.var_4EA5))
	{
		return;
	}

	foreach(var_01 in self.var_4EA5)
	{
		var_01 [[ level.var_5D3[var_01.var_4EA2].var_57D2 ]]();
	}

	self.var_4EA5 = undefined;
}

//Function Number: 689
lib_A59A::func_2814(param_00)
{
	lib_A59A::func_59D2(param_00);
	foreach(var_02 in param_00)
	{
		var_02.var_4EA5 = undefined;
	}
}

//Function Number: 690
lib_A59A::func_59D1(param_00)
{
	if(getdvar("createfx") != "")
	{
		return;
	}

	var_01 = getentarray("script_brushmodel","classname");
	var_02 = getentarray("script_model","classname");
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_01[var_01.size] = var_02[var_03];
	}

	foreach(var_05 in param_00)
	{
		foreach(var_07 in var_01)
		{
			if(isdefined(var_07.script_prefab_exploder))
			{
				var_07.script_exploder = var_07.script_prefab_exploder;
			}

			if(!isdefined(var_07.script_exploder))
			{
				continue;
			}

			if(!isdefined(var_07.model))
			{
				continue;
			}

			if(var_07.code_classname != "script_model")
			{
				continue;
			}

			if(!var_07 istouching(var_05))
			{
				continue;
			}

			var_07.masked_exploder = 1;
		}
	}
}

//Function Number: 691
lib_A59A::func_06FA()
{
	var_00 = spawn("script_origin",(0,0,0));
	foreach(var_02 in level.createfxent)
	{
		if(!isdefined(var_02.v["masked_exploder"]))
		{
			continue;
		}

		var_00.var_2E6 = var_02.v["origin"];
		var_00.var_41 = var_02.v["angles"];
		if(!var_00 istouching(self))
		{
			continue;
		}

		var_03 = var_02.v["masked_exploder"];
		var_04 = var_02.v["masked_exploder_spawnflags"];
		var_05 = var_02.v["masked_exploder_script_disconnectpaths"];
		var_06 = spawn("script_model",(0,0,0),var_04);
		var_06 setmodel(var_03);
		var_06.var_2E6 = var_02.v["origin"];
		var_06.var_41 = var_02.v["angles"];
		var_02.v["masked_exploder"] = undefined;
		var_02.v["masked_exploder_spawnflags"] = undefined;
		var_02.v["masked_exploder_script_disconnectpaths"] = undefined;
		var_06.disconnect_paths = var_05;
		var_06.script_exploder = var_02.v["exploder"];
		common_scripts\_exploder::setup_individual_exploder(var_06);
		var_02.model = var_06;
	}

	var_00 delete();
}

//Function Number: 692
lib_A59A::func_6EB7(param_00)
{
	var_01 = common_scripts\_destructible::destructible_getinfoindex(param_00);
	if(var_01 != -1)
	{
		return;
	}

	if(!isdefined(level.destructible_functions))
	{
		level.destructible_functions = [];
	}

	var_02 = spawnstruct();
	var_02.destructibleinfo = common_scripts\_destructible::destructible_gettype(param_00);
	var_02 thread common_scripts\_destructible::precache_destructibles();
	var_02 thread common_scripts\_destructible::add_destructible_fx();
}

//Function Number: 693
lib_A59A::func_2808(param_00,param_01)
{
	foreach(var_03 in param_00)
	{
		var_03.destructibles = [];
	}

	var_05 = ["destructible_toy","destructible_vehicle"];
	var_06 = 0;
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	foreach(var_08 in var_05)
	{
		var_09 = getentarray(var_08,"targetname");
		foreach(var_0B in var_09)
		{
			foreach(var_03 in param_00)
			{
				if(param_01)
				{
					var_06++;
					var_06 = var_06 % 5;
					if(var_06 == 1)
					{
						wait(0.05);
					}
				}

				if(!var_03 istouching(var_0B))
				{
					continue;
				}

				var_0B delete();
				break;
			}
		}
	}
}

//Function Number: 694
lib_A59A::func_280E(param_00,param_01)
{
	var_02 = getentarray("script_brushmodel","classname");
	var_03 = getentarray("script_model","classname");
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_02[var_02.size] = var_03[var_04];
	}

	var_05 = [];
	var_06 = spawn("script_origin",(0,0,0));
	var_07 = 0;
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	foreach(var_09 in param_00)
	{
		foreach(var_0B in var_02)
		{
			if(!isdefined(var_0B.script_exploder))
			{
				continue;
			}

			var_06.var_2E6 = var_0B getorigin();
			if(!var_09 istouching(var_06))
			{
				continue;
			}

			var_05[var_05.size] = var_0B;
		}
	}

	lib_A59A::func_0CE5(var_05);
	var_06 delete();
}

//Function Number: 695
lib_A59A::func_06F7()
{
	if(!isdefined(self.destructibles))
	{
		return;
	}

	foreach(var_01 in self.destructibles)
	{
		var_02 = spawn("script_model",(0,0,0));
		var_02 setmodel(var_01.var_9485);
		var_02.var_2E6 = var_01.var_2E6;
		var_02.var_41 = var_01.var_41;
		var_02.var_39B = var_01.var_39B;
		var_02.targetname = var_01.targetname;
		var_02.target = var_01.target;
		var_02.script_linkto = var_01.script_linkto;
		var_02.destructible_type = var_01.destructible_type;
		var_02.script_noflip = var_01.script_noflip;
		var_02 common_scripts\_destructible::setup_destructibles(1);
	}

	self.destructibles = [];
}

//Function Number: 696
lib_A59A::func_7F6B(param_00)
{
	self.var_38A6 = param_00;
}

//Function Number: 697
lib_A59A::func_38A5()
{
	var_00 = self.flashendtime - gettime();
	if(var_00 < 0)
	{
		return 0;
	}

	return var_00 * 0.001;
}

//Function Number: 698
lib_A59A::func_38A7()
{
	return lib_A59A::func_38A5() > 0;
}

//Function Number: 699
lib_A59A::func_38A9(param_00)
{
	if(isdefined(self.var_38A6) && self.var_38A6)
	{
		return;
	}

	var_01 = gettime() + param_00 * 1000;
	if(isdefined(self.flashendtime))
	{
		self.flashendtime = max(self.flashendtime,var_01);
	}
	else
	{
		self.flashendtime = var_01;
	}

	self notify("flashed");
	self method_816B(1);
}

//Function Number: 700
lib_A59A::func_A0BE()
{
	for(;;)
	{
		var_00 = function_00D7("axis","all");
		var_01 = 0;
		foreach(var_03 in var_00)
		{
			if(!isalive(var_03))
			{
				continue;
			}

			if(var_03 istouching(self))
			{
				var_01 = 1;
				break;
			}

			wait(0.0125);
		}

		if(!var_01)
		{
			var_05 = lib_A59A::func_3CB6("axis");
			if(!var_05.size)
			{
				break;
			}
		}

		wait(0.05);
	}
}

//Function Number: 701
lib_A59A::func_A0BF()
{
	var_00 = 0;
	for(;;)
	{
		var_01 = function_00D7("axis","all");
		var_02 = 0;
		foreach(var_04 in var_01)
		{
			if(!isalive(var_04))
			{
				continue;
			}

			if(var_04 istouching(self))
			{
				if(var_04 lib_A59A::func_2CE6())
				{
					continue;
				}

				var_02 = 1;
				var_00 = 1;
				break;
			}

			wait(0.0125);
		}

		if(!var_02)
		{
			var_06 = lib_A59A::func_3CB6("axis");
			if(!var_06.size)
			{
				break;
			}
			else
			{
				var_00 = 1;
			}
		}

		wait(0.05);
	}

	return var_00;
}

//Function Number: 702
lib_A59A::func_A0C0(param_00)
{
	lib_A59A::func_A0BE();
	common_scripts\utility::flag_set(param_00);
}

//Function Number: 703
lib_A59A::func_A0B4(param_00,param_01)
{
	var_02 = getent(param_00,"targetname");
	var_02 lib_A59A::func_A0C0(param_01);
}

//Function Number: 704
lib_A59A::func_6A93()
{
	level.var_31D lib_A59A::func_32D9("player_zero_attacker_accuracy");
	level.var_31D.var_201 = 0;
	level.var_31D lib_A52D::func_9ACB();
}

//Function Number: 705
lib_A59A::func_6A9E()
{
	level.var_31D lib_A59A::func_32DD("player_zero_attacker_accuracy");
	level.var_31D.var_56 = 0;
	level.var_31D.var_201 = 1;
}

//Function Number: 706
lib_A59A::func_7E92(param_00)
{
	var_01 = lib_A59A::func_3E23();
	var_01.var_443E.var_6A61 = param_00;
	var_01 lib_A52D::func_9ACB();
}

//Function Number: 707
lib_A59A::func_0CEB(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		var_01[var_03.script_parameters] = var_03;
	}

	return var_01;
}

//Function Number: 708
lib_A59A::func_0CEA(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		var_01[var_03.classname] = var_03;
	}

	return var_01;
}

//Function Number: 709
lib_A59A::func_0CEC(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		var_04 = var_03.script_index;
		if(isdefined(var_04))
		{
			var_01[var_04] = var_03;
		}
	}

	return var_01;
}

//Function Number: 710
lib_A59A::func_07A3(param_00)
{
	if(isdefined(param_00))
	{
		self.var_6857 = param_00;
	}
	else
	{
		self.var_6857 = getent(self.target,"targetname");
	}

	self linkto(self.var_6857);
}

//Function Number: 711
lib_A59A::func_38AA()
{
	self.flashendtime = undefined;
	self method_816B(0);
}

//Function Number: 712
lib_A59A::func_3F80(param_00,param_01)
{
	var_02 = getent(param_00,param_01);
	if(isdefined(var_02))
	{
		return var_02;
	}

	return common_scripts\utility::getstruct(param_00,param_01);
}

//Function Number: 713
lib_A59A::grenade_earthquake()
{
	thread lib_A59A::endondeath();
	self endon("end_explode");
	self waittill("explode",var_00);
	lib_A59A::func_2A6D(var_00);
}

//Function Number: 714
lib_A59A::endondeath()
{
	self waittill("death");
	waittillframeend;
	self notify("end_explode");
}

//Function Number: 715
lib_A59A::func_2A6D(param_00)
{
	playrumbleonposition("grenade_rumble",param_00);
	earthquake(0.3,0.5,param_00,400);
	foreach(var_02 in level.var_328)
	{
		if(distance(param_00,var_02.var_2E6) > 600)
		{
			continue;
		}

		if(var_02 damageconetrace(param_00))
		{
			var_02 thread lib_A59A::dirteffect(param_00);
		}
	}
}

//Function Number: 716
lib_A59A::func_6BE2(param_00,param_01,param_02,param_03)
{
	return lib_A59A::func_6BE0("shotgun",level.var_31D,param_00,param_01,param_02,param_03);
}

//Function Number: 717
lib_A59A::func_6BE0(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_01))
	{
		param_01 = level.var_31D;
	}

	param_01 method_8119(0);
	param_01 method_811A(0);
	param_01 disableweapons();
	var_06 = common_scripts\utility::spawn_tag_origin();
	var_06 linkto(self,"tag_passenger",lib_A59A::func_6BE1(param_00),(0,0,0));
	var_06.var_6ACB = common_scripts\utility::spawn_tag_origin();
	var_06.var_6ACB linkto(self,"tag_body",lib_A59A::func_6BDF(param_00),(0,0,0));
	if(!isdefined(param_02))
	{
		param_02 = 90;
	}

	if(!isdefined(param_03))
	{
		param_03 = 90;
	}

	if(!isdefined(param_04))
	{
		param_04 = 40;
	}

	if(!isdefined(param_05))
	{
		param_05 = 40;
	}

	param_01 disableweapons();
	param_01 playerlinkto(var_06,"tag_origin",0.8,param_02,param_03,param_04,param_05);
	param_01.var_4B03 = var_06;
	return var_06;
}

//Function Number: 718
lib_A59A::func_6BE1(param_00)
{
	switch(param_00)
	{
		case "shotgun":
			break;

		case "backleft":
			break;

		case "backright":
			break;
	}
}

//Function Number: 719
lib_A59A::func_6BDF(param_00)
{
	switch(param_00)
	{
		case "shotgun":
			break;

		case "backleft":
			break;

		case "backright":
			break;
	}
}

//Function Number: 720
lib_A59A::func_6B84(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	var_01 = self;
	var_02 = level.var_31D;
	if(isplayer(self))
	{
		var_02 = self;
		var_01 = var_02.var_4B03;
	}

	var_01 unlink();
	if(!param_00)
	{
		var_03 = 0.6;
		var_01 moveto(var_01.var_6ACB.var_2E6,var_03,var_03 * 0.5,var_03 * 0.5);
		wait(var_03);
	}

	var_02 unlink();
	var_02 enableweapons();
	var_02 method_8119(1);
	var_02 method_811A(1);
	var_02.var_4B03 = undefined;
	var_01.var_6ACB delete();
	var_01 delete();
}

//Function Number: 721
lib_A59A::dirteffect(param_00,param_01)
{
	var_02 = lib_A59A::func_791A(param_00);
	foreach(var_05, var_04 in var_02)
	{
		thread lib_A52D::func_43E4(var_05);
	}
}

//Function Number: 722
lib_A59A::func_14BA(param_00)
{
	if(!isdefined(self.var_258C))
	{
		return;
	}

	var_01 = lib_A59A::func_791A(self.var_258C.var_2E6);
	foreach(var_04, var_03 in var_01)
	{
		thread lib_A52D::func_14B6(var_04);
	}
}

//Function Number: 723
lib_A59A::func_791A(param_00)
{
	var_01 = vectornormalize(anglestoforward(self.var_41));
	var_02 = vectornormalize(anglestoright(self.var_41));
	var_03 = vectornormalize(param_00 - self.var_2E6);
	var_04 = vectordot(var_03,var_01);
	var_05 = vectordot(var_03,var_02);
	var_06 = [];
	var_07 = self getcurrentweapon();
	if(var_04 > 0 && var_04 > 0.5 && weapontype(var_07) != "riotshield")
	{
		var_06["bottom"] = 1;
	}

	if(abs(var_04) < 0.866)
	{
		if(var_05 > 0)
		{
			var_06["right"] = 1;
		}
		else
		{
			var_06["left"] = 1;
		}
	}

	return var_06;
}

//Function Number: 724
lib_A59A::func_66EC(param_00)
{
	if(!isdefined(self.var_63B1))
	{
		self.var_63B1 = self.var_2FF;
	}

	self.var_2FF = param_00;
}

//Function Number: 725
lib_A59A::func_66ED()
{
	if(isdefined(self.var_63B1))
	{
		return;
	}

	self.var_63B1 = self.var_2FF;
	self.var_2FF = 0;
}

//Function Number: 726
lib_A59A::func_66EB()
{
	self.var_2FF = self.var_63B1;
	self.var_63B1 = undefined;
}

//Function Number: 727
lib_A59A::func_A104()
{
	if(isdefined(self.var_63BD))
	{
		return;
	}

	self.var_63BC = self.var_50E;
	self.var_63BD = self.var_50F;
	self.var_50E = 0;
	self.var_50F = 0;
}

//Function Number: 728
lib_A59A::func_A102()
{
	if(!isdefined(self.var_63BD))
	{
		self.var_63BC = self.var_50E;
		self.var_63BD = self.var_50F;
	}

	self.var_50E = 999999999;
	self.var_50F = 999999999;
}

//Function Number: 729
lib_A59A::func_509D()
{
	return isdefined(self.var_63BD) || isdefined(self.var_63BC);
}

//Function Number: 730
lib_A59A::func_A103()
{
	self.var_50E = self.var_63BC;
	self.var_50F = self.var_63BD;
	self.var_63BC = undefined;
	self.var_63BD = undefined;
}

//Function Number: 731
lib_A59A::func_30CB()
{
	thread lib_A59A::func_4BB5();
}

//Function Number: 732
lib_A59A::func_4BB5()
{
	self endon("disable_ignorerandombulletdamage_drone");
	self endon("death");
	self.var_201 = 1;
	self.fakehealth = self.health;
	self.health = 1000000;
	for(;;)
	{
		self waittill("damage",var_00,var_01);
		if(!isplayer(var_01) && issentient(var_01))
		{
			if(isdefined(var_01.enemy) && var_01.enemy != self)
			{
				continue;
			}
		}

		self.fakehealth = self.fakehealth - var_00;
		if(self.fakehealth <= 0)
		{
			break;
		}
	}

	self method_8052();
}

//Function Number: 733
lib_A59A::func_7DDE(param_00)
{
	self.var_4EE = param_00;
}

//Function Number: 734
lib_A59A::func_2AAD()
{
	if(!isalive(self))
	{
		return;
	}

	if(!isdefined(self.var_201))
	{
		return;
	}

	self notify("disable_ignorerandombulletdamage_drone");
	self.var_201 = undefined;
	self.health = self.fakehealth;
}

//Function Number: 735
lib_A59A::func_9367(param_00)
{
	var_01 = spawnstruct();
	var_01 lib_A59A::delaythread(param_00,::lib_A59A::func_7C7C,"timeout");
	return var_01;
}

//Function Number: 736
lib_A59A::delaythread(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	thread lib_A59B::delaythread_proc(param_01,param_00,param_02,param_03,param_04,param_05,param_06,param_07);
}

//Function Number: 737
lib_A59A::func_27CE(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	childthread lib_A59B::func_27CF(param_01,param_00,param_02,param_03,param_04,param_05,param_06,param_07);
}

//Function Number: 738
lib_A59A::func_386D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	self endon("death");
	if(!isarray(param_00))
	{
		param_00 = [param_00,0];
	}

	thread lib_A59B::func_386E(param_01,param_00,param_02,param_03,param_04,param_05,param_06,param_07);
}

//Function Number: 739
lib_A59A::func_A0EC(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	self endon("death");
	if(!isarray(param_00))
	{
		param_00 = [param_00,0];
	}

	thread lib_A59B::func_A0ED(param_01,param_00,param_02,param_03,param_04,param_05,param_06,param_07);
}

//Function Number: 740
lib_A59A::func_30B3(param_00)
{
	param_00 = param_00 * 1000;
	self.var_128 = 1;
	self.var_105 = param_00;
	self.var_6094 = undefined;
}

//Function Number: 741
lib_A59A::func_2A8F()
{
	self.var_128 = 0;
	self.var_6094 = 1;
}

//Function Number: 742
lib_A59A::func_7E4E(param_00,param_01)
{
	level.var_885 = param_00;
	level.var_884 = param_01;
}

//Function Number: 743
lib_A59A::func_742C(param_00)
{
	level.var_5571[param_00] = gettime();
}

//Function Number: 744
lib_A59A::func_7DF6(param_00)
{
	level.var_2545 = param_00;
	thread lib_A52D::func_7459();
}

//Function Number: 745
lib_A59A::func_1EA9()
{
	level.var_2545 = undefined;
	thread lib_A52D::func_7459();
}

//Function Number: 746
lib_A59A::func_7F06(param_00,param_01,param_02)
{
	lib_A507::func_4D76();
	if(isdefined(param_02))
	{
		level.var_A323.var_9C5D = param_02;
	}

	level.var_A323.rate = param_01;
	level.var_A323.weight = param_00;
	level notify("windchange","strong");
}

//Function Number: 747
lib_A59A::func_8F50(param_00)
{
	if(param_00.size > 1)
	{
		return 0;
	}

	var_01 = [];
	var_01["0"] = 1;
	var_01["1"] = 1;
	var_01["2"] = 1;
	var_01["3"] = 1;
	var_01["4"] = 1;
	var_01["5"] = 1;
	var_01["6"] = 1;
	var_01["7"] = 1;
	var_01["8"] = 1;
	var_01["9"] = 1;
	if(isdefined(var_01[param_00]))
	{
		return 1;
	}

	return 0;
}

//Function Number: 748
lib_A59A::func_7DDA(param_00,param_01)
{
	level.var_132D[param_00] = param_01;
	lib_A59B::func_9A99();
}

//Function Number: 749
lib_A59A::func_62E8(param_00)
{
	for(var_01 = 0;var_01 < 8;var_01++)
	{
		function_010E(param_00,var_01,(0,0,0));
	}
}

//Function Number: 750
lib_A59A::func_3DD9(param_00)
{
	var_01 = [];
	var_01["minutes"] = 0;
	for(var_01["seconds"] = int(param_00 / 1000);var_01["seconds"] >= 60;var_01["seconds"] = var_01["seconds"] - 60)
	{
		var_01["minutes"]++;
	}

	if(var_01["seconds"] < 10)
	{
		var_01["seconds"] = "0" + var_01["seconds"];
	}

	return var_01;
}

//Function Number: 751
lib_A59A::func_6B48(param_00)
{
	var_01 = level.var_31D getweaponslistprimaries();
	foreach(var_03 in var_01)
	{
		if(var_03 == param_00)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 752
lib_A59A::func_62AE(param_00)
{
	if(!isdefined(level.var_62AF))
	{
		level.var_62AF = [];
	}

	if(!isdefined(level.var_62AF[param_00]))
	{
		level.var_62AF[param_00] = level.var_62AF.size + 1;
	}

	return level.var_62AF[param_00];
}

//Function Number: 753
lib_A59A::func_62BE(param_00)
{
	return isdefined(level.var_62AF) && isdefined(level.var_62AF[param_00]);
}

//Function Number: 754
lib_A59A::func_6B9F(param_00)
{
	self method_80FC(param_00);
	self.var_2E17 = param_00;
}

//Function Number: 755
lib_A59A::func_6ACE()
{
	self method_80FD();
	self.var_2E17 = undefined;
}

//Function Number: 756
lib_A59A::func_42FB(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = param_04 - param_02;
	var_06 = param_03 - param_01;
	var_07 = var_05 / var_06;
	param_00 = param_00 - param_03;
	param_00 = var_07 * param_00;
	param_00 = param_00 + param_04;
	return param_00;
}

//Function Number: 757
lib_A59A::func_3096()
{
	self.var_713F = 1;
}

//Function Number: 758
lib_A59A::func_2A71()
{
	self.var_713F = undefined;
}

//Function Number: 759
lib_A59A::func_3097(param_00)
{
	param_00 lib_A59A::func_3096();
}

//Function Number: 760
lib_A59A::func_2A72(param_00)
{
	param_00 lib_A59A::func_2A71();
}

//Function Number: 761
lib_A59A::func_6004(param_00)
{
	var_01 = tablelookup("sound/soundlength.csv",0,param_00,1);
	if(!isdefined(var_01) || var_01 == "")
	{
		return -1;
	}

	var_01 = int(var_01);
	var_01 = var_01 * 0.001;
	return var_01;
}

//Function Number: 762
lib_A59A::func_5007(param_00)
{
	var_01 = function_00DD(param_00);
	return var_01["count"];
}

//Function Number: 763
lib_A59A::func_5768(param_00,param_01,param_02)
{
	var_03 = param_02 - param_01;
	var_04 = param_00 * var_03;
	var_05 = param_01 + var_04;
	return var_05;
}

//Function Number: 764
lib_A59A::func_27B7(param_00)
{
	level.loadout = param_00;
}

//Function Number: 765
lib_A59A::func_9274(param_00)
{
	lib_A59A::func_27B7(param_00);
	level.template_script = param_00;
}

//Function Number: 766
lib_A59A::func_9276(param_00)
{
	level.var_110D = param_00;
}

//Function Number: 767
lib_A59A::func_3B8F(param_00,param_01)
{
	thread lib_A59A::func_3B90(param_00,param_01);
}

//Function Number: 768
lib_A59A::func_3B90(param_00,param_01)
{
	var_02 = getent(param_00,"script_noteworthy");
	var_02 notify("new_volume_command");
	var_02 endon("new_volume_command");
	wait(0.05);
	lib_A59A::func_3B8E(var_02,param_01);
}

//Function Number: 769
lib_A59A::func_3B8E(param_00,param_01)
{
	param_00.var_3B76 = 1;
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(param_01)
	{
		lib_A59A::func_0D14(param_00.fx,::common_scripts\utility::pauseeffect);
		return;
	}

	common_scripts\utility::array_thread(param_00.fx,::common_scripts\utility::pauseeffect);
}

//Function Number: 770
lib_A59A::func_0D14(param_00,param_01,param_02)
{
	var_03 = 0;
	if(!isdefined(param_02))
	{
		param_02 = 5;
	}

	var_04 = [];
	foreach(var_06 in param_00)
	{
		var_04[var_04.size] = var_06;
		var_03++;
		var_03 = var_03 % param_02;
		if(param_02 == 0)
		{
			common_scripts\utility::array_thread(var_04,param_01);
			wait(0.05);
			var_04 = [];
		}
	}
}

//Function Number: 771
lib_A59A::func_3B92(param_00)
{
	thread lib_A59A::func_3B93(param_00);
}

//Function Number: 772
lib_A59A::func_3B93(param_00)
{
	var_01 = getent(param_00,"script_noteworthy");
	var_01 notify("new_volume_command");
	var_01 endon("new_volume_command");
	wait(0.05);
	if(!isdefined(var_01.var_3B76))
	{
		return;
	}

	var_01.var_3B76 = undefined;
	lib_A59A::func_3B91(var_01);
}

//Function Number: 773
lib_A59A::func_3B91(param_00)
{
	common_scripts\utility::array_thread(param_00.fx,::lib_A59A::func_748A);
}

//Function Number: 774
lib_A59A::func_3834(param_00)
{
	if(!isdefined(level.var_3832))
	{
		level.var_3832 = [];
	}

	if(!isdefined(level.var_3832[param_00]))
	{
		level.var_3832[param_00] = 1;
		return;
	}

	level.var_3832[param_00]++;
}

//Function Number: 775
lib_A59A::func_3833(param_00)
{
	level.var_3832[param_00]--;
	level.var_3832[param_00] = int(max(0,level.var_3832[param_00]));
	if(level.var_3832[param_00])
	{
		return;
	}

	common_scripts\utility::flag_set(param_00);
}

//Function Number: 776
lib_A59A::func_3835(param_00,param_01)
{
	level.var_3832[param_00] = param_01;
}

//Function Number: 777
lib_A59A::func_0741(param_00,param_01)
{
	if(!isdefined(level.var_1E6A))
	{
		level.var_1E6A = [];
	}

	if(!isdefined(level.var_1E6A[param_01]))
	{
		level.var_1E6A[param_01] = [];
	}

	level.var_1E6A[param_01][level.var_1E6A[param_01].size] = param_00;
}

//Function Number: 778
lib_A59A::func_1E6A(param_00)
{
	var_01 = level.var_1E6A[param_00];
	var_01 = common_scripts\utility::array_removeundefined(var_01);
	lib_A59A::func_0CE5(var_01);
	level.var_1E6A[param_00] = undefined;
}

//Function Number: 779
lib_A59A::func_1E6B(param_00)
{
	if(!isdefined(level.var_1E6A))
	{
		return;
	}

	if(!isdefined(level.var_1E6A[param_00]))
	{
		return;
	}

	var_01 = level.var_1E6A[param_00];
	var_01 = common_scripts\utility::array_removeundefined(var_01);
	foreach(var_03 in var_01)
	{
		if(!isai(var_03))
		{
			continue;
		}

		if(!isalive(var_03))
		{
			continue;
		}

		if(!isdefined(var_03.var_58D4))
		{
			continue;
		}

		if(!var_03.var_58D4)
		{
			continue;
		}

		var_03 lib_A59A::func_8E9E();
	}

	lib_A59A::func_0CE5(var_01);
	level.var_1E6A[param_00] = undefined;
}

//Function Number: 780
lib_A59A::func_07B6(param_00)
{
	if(!isdefined(self.var_9799))
	{
		thread lib_A59B::func_7B5();
	}

	self.var_9799[self.var_9799.size] = param_00;
}

//Function Number: 781
lib_A59A::func_3EEA()
{
	var_00 = [];
	var_01 = getentarray();
	foreach(var_03 in var_01)
	{
		if(!isdefined(var_03.classname))
		{
			continue;
		}

		if(issubstr(var_03.classname,"weapon_"))
		{
			var_00[var_00.size] = var_03;
		}
	}

	return var_00;
}

//Function Number: 782
lib_A59A::func_70B7(param_00)
{
	level.var_78B6[param_00] = param_00;
}

//Function Number: 783
lib_A59A::func_5F3F(param_00,param_01,param_02)
{
	self notify("newmove");
	self endon("newmove");
	if(!isdefined(param_02))
	{
		param_02 = 200;
	}

	var_03 = distance(self.var_2E6,param_00);
	var_04 = var_03 / param_02;
	var_05 = vectornormalize(param_00 - self.var_2E6);
	self moveto(param_00,var_04,0,0);
	self rotateto(param_01,var_04,0,0);
	wait(var_04);
	if(!isdefined(self))
	{
		return;
	}

	self.var_4FF = var_05 * var_03 / var_04;
}

//Function Number: 784
lib_A59A::func_383C(param_00)
{
	level endon(param_00);
	self waittill("death");
	common_scripts\utility::flag_set(param_00);
}

//Function Number: 785
lib_A59A::func_30B1()
{
	level.var_259E = 1;
}

//Function Number: 786
lib_A59A::func_2A8D()
{
	level.var_259E = 0;
}

//Function Number: 787
lib_A59A::func_500E()
{
	return isdefined(level.var_259E) && level.var_259E;
}

//Function Number: 788
lib_A59A::func_30B2()
{
	level.var_259F = 1;
}

//Function Number: 789
lib_A59A::func_2A8E()
{
	level.var_259F = 0;
}

//Function Number: 790
lib_A59A::func_500F()
{
	return isdefined(level.var_259F) && level.var_259F;
}

//Function Number: 791
lib_A59A::func_074C()
{
	lib_A51A::monitordamage();
}

//Function Number: 792
lib_A59A::func_733A()
{
	lib_A51A::func_8EF3();
}

//Function Number: 793
lib_A59A::func_5014()
{
	if(getdvar("e3demo") == "1")
	{
		return 1;
	}

	return 0;
}

//Function Number: 794
lib_A59A::func_286D(param_00,param_01,param_02)
{
	var_03 = common_scripts\utility::getstructarray(param_00,param_01);
	lib_A59A::func_286E(var_03,param_02);
}

//Function Number: 795
lib_A59A::func_286C(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	var_01 = param_00.script_linkname;
	if(isdefined(var_01) && isdefined(level.struct_class_names["script_linkname"]) && isdefined(level.struct_class_names["script_linkname"][var_01]))
	{
		foreach(var_04, var_03 in level.struct_class_names["script_linkname"][var_01])
		{
			if(isdefined(var_03) && param_00 == var_03)
			{
				level.struct_class_names["script_linkname"][var_01][var_04] = undefined;
			}
		}

		if(level.struct_class_names["script_linkname"][var_01].size == 0)
		{
			level.struct_class_names["script_linkname"][var_01] = undefined;
		}
	}

	var_01 = param_00.var_39B;
	if(isdefined(var_01) && isdefined(level.struct_class_names["script_noteworthy"]) && isdefined(level.struct_class_names["script_noteworthy"][var_01]))
	{
		foreach(var_04, var_03 in level.struct_class_names["script_noteworthy"][var_01])
		{
			if(isdefined(var_03) && param_00 == var_03)
			{
				level.struct_class_names["script_noteworthy"][var_01][var_04] = undefined;
			}
		}

		if(level.struct_class_names["script_noteworthy"][var_01].size == 0)
		{
			level.struct_class_names["script_noteworthy"][var_01] = undefined;
		}
	}

	var_01 = param_00.target;
	if(isdefined(var_01) && isdefined(level.struct_class_names["target"]) && isdefined(level.struct_class_names["target"][var_01]))
	{
		foreach(var_04, var_03 in level.struct_class_names["target"][var_01])
		{
			if(isdefined(var_03) && param_00 == var_03)
			{
				level.struct_class_names["target"][var_01][var_04] = undefined;
			}
		}

		if(level.struct_class_names["target"][var_01].size == 0)
		{
			level.struct_class_names["target"][var_01] = undefined;
		}
	}

	var_01 = param_00.targetname;
	if(isdefined(var_01) && isdefined(level.struct_class_names["targetname"]) && isdefined(level.struct_class_names["targetname"][var_01]))
	{
		foreach(var_04, var_03 in level.struct_class_names["targetname"][var_01])
		{
			if(isdefined(var_03) && param_00 == var_03)
			{
				level.struct_class_names["targetname"][var_01][var_04] = undefined;
			}
		}

		if(level.struct_class_names["targetname"][var_01].size == 0)
		{
			level.struct_class_names["targetname"][var_01] = undefined;
		}
	}

	if(isdefined(level.struct))
	{
		foreach(var_04, var_03 in level.struct)
		{
			if(param_00 == var_03)
			{
				level.struct[var_04] = undefined;
			}
		}
	}
}

//Function Number: 796
lib_A59A::func_286E(param_00,param_01)
{
	if(!isdefined(param_00) || !isarray(param_00) || param_00.size == 0)
	{
		return;
	}

	param_01 = common_scripts\utility::ter_op(isdefined(param_01),param_01,0);
	param_01 = common_scripts\utility::ter_op(param_01 > 0,param_01,0);
	if(param_01 > 0)
	{
		foreach(var_03 in param_00)
		{
			lib_A59A::func_286C(var_03);
			wait(param_01);
		}

		return;
	}

	foreach(var_03 in param_01)
	{
		lib_A59A::func_286C(var_03);
	}
}

//Function Number: 797
lib_A59A::func_40FA(param_00,param_01)
{
	var_02 = common_scripts\utility::getstruct(param_00,param_01);
	lib_A59A::func_286C(var_02);
	return var_02;
}

//Function Number: 798
lib_A59A::func_40FC(param_00,param_01,param_02)
{
	var_03 = common_scripts\utility::getstructarray(param_00,param_01);
	lib_A59A::func_286E(var_03,param_02);
	return var_03;
}

//Function Number: 799
lib_A59A::func_3F81(param_00,param_01)
{
	var_02 = lib_A59A::func_3F80(param_00,param_01);
	if(!isdefined(var_02))
	{
		var_02 = getnode(param_00,param_01);
	}

	if(!isdefined(var_02))
	{
		var_02 = vehpath_getnode(param_00,param_01);
	}

	return var_02;
}

//Function Number: 800
lib_A59A::func_7F60(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_03))
	{
		self.entityheadiconoffset = param_03;
	}
	else
	{
		self.entityheadiconoffset = (0,0,0);
	}

	if(isdefined(param_04))
	{
		self.var_3318 = param_04;
	}

	self notify("new_head_icon");
	var_05 = newhudelem();
	var_05.archived = 1;
	var_05.alpha = 0.8;
	var_05 setshader(param_00,param_01,param_02);
	var_05 setwaypoint(0,0,0,1);
	self.entityheadicon = var_05;
	lib_A59A::func_9B10();
	thread lib_A59A::func_9B0F();
	thread lib_A59A::func_28EA();
}

//Function Number: 801
lib_A59A::func_739E()
{
	if(!isdefined(self.entityheadicon))
	{
		return;
	}

	self.entityheadicon destroy();
}

//Function Number: 802
lib_A59A::func_9B0F()
{
	self endon("new_head_icon");
	self endon("death");
	var_00 = self.var_2E6;
	for(;;)
	{
		if(var_00 != self.var_2E6)
		{
			lib_A59A::func_9B10();
			var_00 = self.var_2E6;
		}

		wait(0.05);
	}
}

//Function Number: 803
lib_A59A::func_9B10()
{
	if(isdefined(self.var_3318))
	{
		var_00 = self [[ self.var_3318 ]]();
		if(isdefined(var_00))
		{
			self.entityheadicon.x = self.entityheadiconoffset[0] + var_00[0];
			self.entityheadicon.y = self.entityheadiconoffset[1] + var_00[1];
			self.entityheadicon.z = self.entityheadiconoffset[2] + var_00[2];
			return;
		}
	}

	self.entityheadicon.x = self.var_2E6[0] + self.entityheadiconoffset[0];
	self.entityheadicon.y = self.var_2E6[1] + self.entityheadiconoffset[1];
	self.entityheadicon.z = self.var_2E6[2] + self.entityheadiconoffset[2];
}

//Function Number: 804
lib_A59A::func_28EA()
{
	self endon("new_head_icon");
	self waittill("death");
	if(!isdefined(self.entityheadicon))
	{
		return;
	}

	self.entityheadicon destroy();
}

//Function Number: 805
lib_A59A::func_A348(param_00)
{
	var_01 = param_00 - self.var_2E6;
	return (vectordot(var_01,anglestoforward(self.var_41)),-1 * vectordot(var_01,anglestoright(self.var_41)),vectordot(var_01,anglestoup(self.var_41)));
}

//Function Number: 806
lib_A59A::func_4F68(param_00,param_01,param_02,param_03,param_04)
{
	level.var_4F89 = spawnstruct();
	level.var_4F89.var_20D2 = 3;
	level.var_4F89.var_35E4 = 1.5;
	level.var_4F89.var_35DF = undefined;
	if(isdefined(param_03))
	{
		level.var_4F89.var_5771 = [param_00,param_01,param_02,param_03];
	}
	else
	{
		level.var_4F89.var_5771 = [param_00,param_01,param_02];
	}

	common_scripts\utility::noself_array_call(level.var_4F89.var_5771,::precachestring);
}

//Function Number: 807
lib_A59A::func_4F69(param_00)
{
	level.var_4F89.var_255A = param_00;
}

//Function Number: 808
lib_A59A::func_4F6A(param_00,param_01,param_02)
{
	level.var_4F89.var_20D2 = param_00;
	level.var_4F89.var_35E4 = param_01;
	level.var_4F89.var_35DF = param_02;
}

//Function Number: 809
lib_A59A::func_7E7F(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	if(isdefined(param_01))
	{
		self.var_76AC = param_01;
	}

	if(isdefined(param_02))
	{
		self.var_A0FF = param_02;
	}

	if(isdefined(param_03))
	{
		self.var_8A29 = param_03;
	}

	self.var_C4D = param_00;
	var_0A = [];
	if(isdefined(param_04) && isdefined(param_05))
	{
		var_0B = [];
		foreach(var_0D in param_06)
		{
			var_0B[var_0D] = param_04;
		}

		var_0A["cover_trans"] = var_0B;
		var_0F = [];
		foreach(var_0D in param_06)
		{
			var_0F[var_0D] = param_05;
		}

		var_0A["cover_exit"] = var_0F;
	}
	else if(isdefined(param_04) || isdefined(param_05))
	{
	}

	if(isdefined(param_07))
	{
		if(isdefined(param_08))
		{
		}

		var_0A["run_turn"] = param_07;
		var_0A["walk_turn"] = param_08;
		self.var_623C = undefined;
	}
	else if(isdefined(param_08))
	{
	}
	else
	{
		self.var_623C = 1;
	}

	if(isdefined(param_09))
	{
		var_12 = [];
		var_12["stairs_up"] = param_09["stairs_up"];
		var_12["stairs_down"] = param_09["stairs_down"];
		var_12["stairs_up_in"] = param_09["stairs_up_in"];
		var_12["stairs_down_in"] = param_09["stairs_down_in"];
		var_12["stairs_up_out"] = param_09["stairs_up_out"];
		var_12["stairs_down_out"] = param_09["stairs_down_out"];
		var_0A["walk"] = var_12;
		var_0A["run"] = var_12;
		self.var_76AD = 1;
	}
	else
	{
		self.var_76AD = undefined;
	}

	level.var_CCA[param_00] = var_0A;
	animscripts\init_move_transitions::func_4E2C(param_00);
}

//Function Number: 810
lib_A59A::func_1EC7(param_00)
{
	self.var_C4D = undefined;
	level.var_CCA[param_00] = undefined;
	self.var_76AC = undefined;
	self.var_76AD = undefined;
	self.var_A0FF = undefined;
	self.var_8A29 = undefined;
}

//Function Number: 811
lib_A59A::func_72D3(param_00,param_01,param_02)
{
	animscripts\animset::func_72EA(param_00,param_01,param_02);
}

//Function Number: 812
lib_A59A::func_0CC7(param_00)
{
	return animscripts\animset::func_CC9(param_00);
}

//Function Number: 813
lib_A59A::func_7DD2(param_00)
{
	self.var_C4D = param_00;
	self notify("move_loop_restart");
	if(param_00 == "creepwalk")
	{
		self.var_3BF = 72;
	}
}

//Function Number: 814
lib_A59A::func_1E9B()
{
	if(isdefined(self.var_C4D) && self.var_C4D == "creepwalk")
	{
		self.var_3BF = 30;
	}

	self.var_C4D = undefined;
	self notify("move_loop_restart");
}

//Function Number: 815
lib_A59A::func_8436(param_00,param_01)
{
	foreach(var_03 in level.var_328)
	{
		if(var_03 lib_A59A::func_8437(param_00,param_01))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 816
lib_A59A::func_8437(param_00,param_01)
{
	var_02 = self getpointinbounds(0,0,0);
	var_03 = var_02 - param_00;
	var_04 = length(var_03);
	var_05 = asin(clamp(60 / var_04,0,1));
	if(vectordot(vectornormalize(var_03),vectornormalize(param_01 - param_00)) > cos(var_05))
	{
		return 1;
	}

	return 0;
}

//Function Number: 817
lib_A59A::func_96F0(param_00)
{
	function_0218(param_00);
	while(!function_021E(param_00))
	{
		wait(0.1);
	}

	common_scripts\utility::flag_set(param_00 + "_loaded");
}

//Function Number: 818
lib_A59A::func_9702(param_00)
{
	function_0219(param_00);
	while(function_021E(param_00))
	{
		wait(0.1);
	}

	common_scripts\utility::flag_clear(param_00 + "_loaded");
}

//Function Number: 819
lib_A59A::func_96ED(param_00)
{
	common_scripts\utility::flag_init(param_00 + "_loaded");
}

//Function Number: 820
lib_A59A::func_96FA(param_00,param_01)
{
	if(common_scripts\utility::flag(param_00 + "_loaded"))
	{
		lib_A59A::func_9702(param_00);
	}

	if(!common_scripts\utility::flag(param_01 + "_loaded"))
	{
		lib_A59A::func_96F0(param_01);
	}
}

//Function Number: 821
lib_A59A::func_9703(param_00)
{
	function_021A();
	lib_A59A::func_96F0(param_00);
}

//Function Number: 822
lib_A59A::func_2761(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		foreach(var_04 in param_00)
		{
			if(isdefined(var_04))
			{
				if(isarray(var_04))
				{
					lib_A59A::func_2761(var_04,param_01);
					continue;
				}

				var_04 [[ param_01 ]]();
			}
		}

		return;
	}

	switch(var_05.size)
	{
		case 0:
			break;

		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		case 5:
			break;
	}
}

//Function Number: 823
lib_A59A::func_2762(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		foreach(var_04 in param_00)
		{
			if(isdefined(var_04))
			{
				if(isarray(var_04))
				{
					lib_A59A::func_2762(var_04,param_01,param_02);
					continue;
				}

				var_04 thread [[ param_01 ]]();
			}
		}

		return;
	}

	switch(var_05.size)
	{
		case 0:
			break;

		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		case 5:
			break;
	}
}

//Function Number: 824
lib_A59A::setdvar_cg_ng(param_00,param_01,param_02)
{
	if(!isdefined(level.console))
	{
		lib_A59A::set_console_status();
	}

	if(lib_A59A::is_gen4())
	{
		setdvar(param_00,param_02);
		return;
	}

	setdvar(param_00,param_01);
}

//Function Number: 825
lib_A59A::func_7FFD(param_00,param_01,param_02)
{
	if(!isdefined(level.console))
	{
		lib_A59A::set_console_status();
	}

	if(lib_A59A::is_gen4())
	{
		function_00D3(param_00,param_02);
		return;
	}

	function_00D3(param_00,param_01);
}

//Function Number: 826
lib_A59A::func_3969(param_00,param_01)
{
	self endon("death");
	self endon("stop_path");
	self notify("stop_going_to_node");
	self notify("follow_path");
	self endon("follow_path");
	wait(0.1);
	var_02 = param_00;
	var_03 = undefined;
	var_04 = undefined;
	if(!isdefined(param_01))
	{
		param_01 = 300;
	}

	self.var_24E6 = var_02;
	var_02 lib_A59A::script_delay();
	if(isdefined(var_02))
	{
		self.var_24E6 = var_02;
		if(isdefined(var_02.var_25B))
		{
			break;
		}

		if(isdefined(level.struct_class_names["targetname"][var_02.targetname]))
		{
			var_04 = ::lib_A59A::func_396C;
		}
		else if(isdefined(var_02.classname))
		{
			var_04 = ::lib_A59A::func_396A;
		}
		else
		{
			var_04 = ::lib_A59A::func_396B;
		}

		if(isdefined(var_02.radius) && var_02.radius != 0)
		{
			self.var_1C7 = var_02.radius;
		}

		if(self.var_1C7 < 16)
		{
			self.var_1C7 = 16;
		}

		if(isdefined(var_02.height) && var_02.height != 0)
		{
			self.var_1C5 = var_02.height;
		}

		var_05 = self.var_1C7;
		self childthread [[ var_04 ]](var_02);
		if(isdefined(var_02.animation))
		{
			var_02 waittill(var_02.animation);
		}
		else
		{
			for(;;)
			{
				self waittill("goal");
				if(distance(var_02.var_2E6,self.var_2E6) < var_05 + 10 || self.inliveplayerkillstreak != "allies")
				{
					break;
				}
			}
		}

		var_02 notify("trigger",self);
		if(isdefined(var_02.var_79D3))
		{
			common_scripts\utility::flag_set(var_02.var_79D3);
		}

		if(isdefined(var_02.script_parameters))
		{
			var_06 = strtok(var_02.script_parameters," ");
			var_07 = 0;
			if(var_07 < var_06.size)
			{
				if(isdefined(level.var_2542))
				{
					self [[ level.var_2542 ]](var_06[var_07],var_02);
				}

				if(self.type == "dog")
				{
					continue;
				}

				switch(var_06[var_07])
				{
					case "enable_cqb":
						break;

					case "disable_cqb":
						break;

					case "deleteme":
						break;
				}
			}
		}
	}
}

//Function Number: 827
lib_A59A::func_396D(param_00,param_01)
{
	if(distance(level.var_31D.var_2E6,param_00.var_2E6) < distance(self.var_2E6,param_00.var_2E6))
	{
		return 1;
	}

	var_02 = undefined;
	var_02 = anglestoforward(self.var_41);
	var_03 = vectornormalize(level.var_31D.var_2E6 - self.var_2E6);
	if(isdefined(param_00.target))
	{
		var_04 = common_scripts\utility::get_target_ent(param_00.target);
		var_02 = vectornormalize(var_04.var_2E6 - param_00.var_2E6);
	}
	else if(isdefined(param_00.var_41))
	{
		var_02 = anglestoforward(param_00.var_41);
	}
	else
	{
		var_02 = anglestoforward(self.var_41);
	}

	if(vectordot(var_02,var_03) > 0)
	{
		return 1;
	}

	if(distance(level.var_31D.var_2E6,self.var_2E6) < param_01)
	{
		return 1;
	}

	return 0;
}

//Function Number: 828
lib_A59A::func_396B(param_00)
{
	self notify("follow_path_new_goal");
	if(isdefined(param_00.animation))
	{
		param_00 lib_A506::func_BD0(self,param_00.animation);
		self notify("starting_anim",param_00.animation);
		if(isdefined(param_00.script_parameters) && issubstr(param_00.script_parameters,"gravity"))
		{
			param_00 lib_A506::func_BCD(self,param_00.animation);
		}
		else
		{
			param_00 lib_A506::func_BD2(self,param_00.animation);
		}

		self method_81A6(self.var_2E6);
		return;
	}

	lib_A59A::func_7E45(param_00);
}

//Function Number: 829
lib_A59A::func_396A(param_00)
{
	self notify("follow_path_new_goal");
	if(isdefined(param_00.animation))
	{
		param_00 lib_A506::func_BD0(self,param_00.animation);
		self notify("starting_anim",param_00.animation);
		if(isdefined(param_00.script_parameters) && issubstr(param_00.script_parameters,"gravity"))
		{
			param_00 lib_A506::func_BCD(self,param_00.animation);
		}
		else
		{
			param_00 lib_A506::func_BD2(self,param_00.animation);
		}

		self method_81A6(self.var_2E6);
		return;
	}

	lib_A59A::func_7E41(param_00);
}

//Function Number: 830
lib_A59A::func_396C(param_00)
{
	self notify("follow_path_new_goal");
	if(isdefined(param_00.animation))
	{
		param_00 lib_A506::func_BD0(self,param_00.animation);
		self notify("starting_anim",param_00.animation);
		lib_A59A::func_2A9C();
		if(isdefined(param_00.script_parameters) && issubstr(param_00.script_parameters,"gravity"))
		{
			param_00 lib_A506::func_BCD(self,param_00.animation);
		}
		else
		{
			param_00 lib_A506::func_BD2(self,param_00.animation);
		}

		lib_A59A::delaythread(0.05,::lib_A59A::func_30BC);
		self method_81A6(self.var_2E6);
		return;
	}

	lib_A59A::func_7E47(param_00.var_2E6);
}

//Function Number: 831
lib_A59A::func_6E78(param_00)
{
	if(!isdefined(level.var_6E77))
	{
		level.var_6E77 = [];
	}

	level.var_6E77 = common_scripts\utility::array_add(level.var_6E77,param_00);
}

//Function Number: 832
lib_A59A::func_3BD0()
{
	if(level.avatarinfo)
	{
		return 1;
	}

	if(level.ps3)
	{
		return 1;
	}

	return 0;
}

//Function Number: 833
lib_A59A::func_56AE(param_00,param_01)
{
	thread lib_A59A::func_56AF(param_00,param_01);
}

//Function Number: 834
lib_A59A::func_56AF(param_00,param_01)
{
	self notify("new_lerp_Fov_Saved");
	self endon("new_lerp_Fov_Saved");
	self method_8031(param_00,param_01);
	wait(param_01);
	function_00D3("cg_fov",param_00);
}

//Function Number: 835
lib_A59A::func_3F71(param_00,param_01)
{
	var_02 = getdvar(param_00);
	if(var_02 != "")
	{
		return float(var_02);
	}

	return param_01;
}

//Function Number: 836
lib_A59A::func_3F72(param_00,param_01)
{
	var_02 = getdvar(param_00);
	if(var_02 != "")
	{
		return int(var_02);
	}

	return param_01;
}

//Function Number: 837
lib_A59A::func_99E9(param_00)
{
	var_01 = "ui_actionslot_" + param_00 + "_forceActive";
	setdvar(var_01,"on");
}

//Function Number: 838
lib_A59A::func_99E8(param_00)
{
	var_01 = "ui_actionslot_" + param_00 + "_forceActive";
	setdvar(var_01,"turn_off");
}

//Function Number: 839
lib_A59A::func_99EA(param_00)
{
	var_01 = "ui_actionslot_" + param_00 + "_forceActive";
	setdvar(var_01,"onetime");
}

//Function Number: 840
lib_A59A::hastag(param_00,param_01)
{
	var_02 = getnumparts(param_00);
	for(var_03 = 0;var_03 < var_02;var_03++)
	{
		if(tolower(getpartname(param_00,var_03)) == tolower(param_01))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 841
lib_A59A::func_8F73(param_00,param_01,param_02,param_03)
{
	if(!isarray(param_00))
	{
		param_00 = [param_00];
	}

	var_04 = 320;
	var_05 = 200;
	var_06 = [];
	foreach(var_0A, var_08 in param_00)
	{
		var_09 = lib_A541::func_8F75(var_08,param_01,var_04,var_05 + var_0A * 20,"center",param_02,param_03);
		var_06 = common_scripts\utility::array_combine(var_09,var_06);
	}

	wait(param_01);
	lib_A541::func_8F74(var_06,var_04,var_05,param_00.size);
}

//Function Number: 842
lib_A59A::func_1C13(param_00)
{
	thread lib_A541::func_1C12(param_00);
}

//Function Number: 843
lib_A59A::func_30EC(param_00)
{
	if(!lib_A59A::func_76FC())
	{
		return;
	}

	if(isdefined(self.var_5A77) && self.var_5A77)
	{
		return;
	}

	if(!level.nextgen)
	{
		return;
	}

	if(isdefined(param_00) && param_00)
	{
		if(!isdefined(self.var_C4D) || self.var_C4D == "soldier")
		{
			self.var_C4D = "s1_soldier";
			return;
		}

		return;
	}

	if(!isdefined(self.var_C4D) || self.var_C4D == "s1_soldier")
	{
		self.var_C4D = "soldier";
	}
}

//Function Number: 844
lib_A59A::func_76FC()
{
	if(level.nextgen)
	{
		return 1;
	}

	return 0;
}

//Function Number: 845
lib_A59A::func_08EB()
{
	if(isdefined(self.var_79A8))
	{
		return;
	}

	if(isdefined(self.var_5CF))
	{
		lib_A59A::func_0933();
	}

	self.var_5CF = [];
	self.var_124 = lib_A59B::func_90F(self.var_124,"disableplayeradsloscheck",1);
	self.ignoreall = lib_A59B::func_90F(self.ignoreall,"ignoreall",1);
	self.ignoreme = lib_A59B::func_90F(self.ignoreme,"ignoreme",1);
	self.var_1D4 = lib_A59B::func_90F(self.var_1D4,"grenadeawareness",0);
	self.var_6B = lib_A59B::func_90F(self.var_6B,"badplaceawareness",0);
	self.var_1FE = lib_A59B::func_90F(self.var_1FE,"ignoreexplosionevents",1);
	self.var_201 = lib_A59B::func_90F(self.var_201,"ignorerandombulletdamage",1);
	self.var_202 = lib_A59B::func_90F(self.var_202,"ignoresuppression",1);
	self.var_131 = lib_A59B::func_90F(self.var_131,"dontavoidplayer",1);
	self.var_2B1 = lib_A59B::func_90F(self.var_2B1,"newEnemyReactionDistSq",0);
	self.var_2AF6 = lib_A59B::func_90F(self.var_2AF6,"disableBulletWhizbyReaction",1);
	self.var_2B11 = lib_A59B::func_90F(self.var_2B11,"disableFriendlyFireReaction",1);
	self.var_2D37 = lib_A59B::func_90F(self.var_2D37,"dontMelee",1);
	self.var_38A6 = lib_A59B::func_90F(self.var_38A6,"flashBangImmunity",1);
	self.var_128 = lib_A59B::func_90F(self.var_128,"doDangerReact",0);
	self.var_6094 = lib_A59B::func_90F(self.var_6094,"neverSprintForVariation",1);
	self.var_7.var_2B1F = lib_A59B::func_90F(self.var_7.var_2B1F,"a.disablePain",1);
	self.var_34 = lib_A59B::func_90F(self.var_34,"allowPain",0);
	self.var_180 = lib_A59B::func_90F(self.var_180,"fixedNode",1);
	self.var_79E4 = lib_A59B::func_90F(self.var_79E4,"script_forcegoal",1);
	self.var_1C7 = lib_A59B::func_90F(self.var_1C7,"goalradius",5);
	lib_A59A::func_2A73();
}

//Function Number: 846
lib_A59A::func_0933(param_00)
{
	if(isdefined(self.var_79A8))
	{
		return;
	}

	if(isdefined(param_00) && param_00)
	{
		if(isdefined(self.var_5CF))
		{
			self.var_5CF = undefined;
		}
	}

	self.var_124 = lib_A59B::func_90D("disableplayeradsloscheck",0);
	self.ignoreall = lib_A59B::func_90D("ignoreall",0);
	self.ignoreme = lib_A59B::func_90D("ignoreme",0);
	self.var_1D4 = lib_A59B::func_90D("grenadeawareness",1);
	self.var_6B = lib_A59B::func_90D("badplaceawareness",1);
	self.var_1FE = lib_A59B::func_90D("ignoreexplosionevents",0);
	self.var_201 = lib_A59B::func_90D("ignorerandombulletdamage",0);
	self.var_202 = lib_A59B::func_90D("ignoresuppression",0);
	self.var_131 = lib_A59B::func_90D("dontavoidplayer",0);
	self.var_2B1 = lib_A59B::func_90D("newEnemyReactionDistSq",262144);
	self.var_2AF6 = lib_A59B::func_90D("disableBulletWhizbyReaction",undefined);
	self.var_2B11 = lib_A59B::func_90D("disableFriendlyFireReaction",undefined);
	self.var_2D37 = lib_A59B::func_90D("dontMelee",undefined);
	self.var_38A6 = lib_A59B::func_90D("flashBangImmunity",undefined);
	self.var_128 = lib_A59B::func_90D("doDangerReact",1);
	self.var_6094 = lib_A59B::func_90D("neverSprintForVariation",undefined);
	self.var_7.var_2B1F = lib_A59B::func_90D("a.disablePain",0);
	self.var_34 = lib_A59B::func_90D("allowPain",1);
	self.var_180 = lib_A59B::func_90D("fixedNode",0);
	self.var_79E4 = lib_A59B::func_90D("script_forcegoal",0);
	self.var_1C7 = lib_A59B::func_90D("goalradius",100);
	lib_A59A::func_3099();
	self.var_5CF = undefined;
}

//Function Number: 847
lib_A59A::func_0DEB(param_00)
{
	var_01 = level.var_31D getcurrentweapon();
	var_02 = function_02B4(var_01);
	var_03 = var_02[0]["weapon"];
	var_04 = lib_A59A::func_0CFA(var_02,0);
	self attach(var_03,param_00,1);
	foreach(var_06 in var_04)
	{
		self attach(var_06["attachment"],var_06["attachTag"]);
	}

	self method_8509(var_01);
}

//Function Number: 848
lib_A59A::func_6C5C(param_00,param_01)
{
	lib_A59A::_playerallow("altmelee",param_00,param_01,::lib_A59A::func_054D,0);
}

//Function Number: 849
lib_A59A::func_054D(param_00)
{
	if(param_00)
	{
		self method_84F2();
		return;
	}

	self method_84F1();
}

//Function Number: 850
lib_A59A::func_6C62(param_00,param_01)
{
	lib_A59A::_playerallow("weaponPickup",param_00,param_01,::lib_A59A::func_054E,0);
}

//Function Number: 851
lib_A59A::func_054E(param_00)
{
	if(param_00)
	{
		self enableweaponpickup();
		return;
	}

	self disableweaponpickup();
}

//Function Number: 852
lib_A59A::_playerallow(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(self.var_6C87))
	{
		self.var_6C87 = [];
	}

	if(!isdefined(self.var_6C87[param_00]))
	{
		self.var_6C87[param_00] = [];
	}

	if(!isdefined(param_02))
	{
		param_02 = "default";
	}

	if(param_01)
	{
		self.var_6C87[param_00] = common_scripts\utility::array_remove(self.var_6C87[param_00],param_02);
		if(!self.var_6C87[param_00].size)
		{
			if(!isdefined(param_04) || param_04)
			{
				self [[ param_03 ]](1);
				return;
			}

			self [[ param_03 ]](1);
			return;
		}

		return;
	}

	if(!isdefined(common_scripts\utility::array_find(self.var_6C87[param_00],param_02)))
	{
		self.var_6C87[param_00] = common_scripts\utility::array_add(self.var_6C87[param_00],param_02);
	}

	if(!isdefined(param_04) || param_04)
	{
		self [[ param_03 ]](0);
		return;
	}

	self [[ param_03 ]](0);
}

//Function Number: 853
lib_A59A::func_6F2E()
{
	if(!isalive(self))
	{
		return;
	}

	self.var_6F2F = 1;
	self method_84ED("disable");
	self disableaimassist();
	self.ignoreme = 1;
	self.var_4BB8 = 1;
}

//Function Number: 854
lib_A59A::func_92D0()
{
	precacheshader("loading_animation");
	common_scripts\utility::flag_init("tff_sync_complete");
	lib_A59B::func_674();
}

//Function Number: 855
lib_A59A::func_92CE(param_00)
{
	if(isdefined(param_00))
	{
		wait(param_00);
	}

	if(function_021C())
	{
		common_scripts\utility::flag_clear("tff_sync_complete");
		function_021B();
		while(function_021C())
		{
			wait(0.05);
		}

		common_scripts\utility::flag_set("tff_sync_complete");
	}
}

//Function Number: 856
lib_A59A::func_92CF(param_00,param_01)
{
	lib_A59A::func_92CE(param_01);
}

//Function Number: 857
lib_A59A::func_581D()
{
	level.var_31D endon("death");
	for(;;)
	{
		var_00 = function_02B9();
		var_01 = var_00[4];
		var_02 = gettime();
		function_02D2(level.var_31D,var_01,var_02);
		wait(2);
	}
}