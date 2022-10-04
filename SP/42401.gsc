/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42401.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 47
 * Decompile Time: 21 ms
 * Timestamp: 4/20/2022 8:23:27 PM
*******************************************************************/

//Function Number: 1
lib_A5A1::func_4D6F(param_00)
{
	common_scripts\utility::create_dvar("vehicle_free_path_debug",0);
	lib_A5A1::func_1E59(1);
	lib_A5A1::func_80A9();
	level.var_3247 = [];
	level.var_2DFB = ::lib_A5A1::func_9CB5;
	level.var_9CBE = lib_A5A1::func_8108(param_00);
	common_scripts\utility::run_thread_on_targetname("enable_free_path",::lib_A5A1::func_30C3);
}

//Function Number: 2
lib_A5A1::func_80A9()
{
	if(!isdefined(level.var_3A1B))
	{
		level.var_3A1B = -4000;
	}

	if(!isdefined(level.var_3A19))
	{
		level.var_3A19 = -2000;
	}

	if(!isdefined(level.var_3A18))
	{
		level.var_3A18 = 100;
	}

	if(!isdefined(level.var_3A1F))
	{
		level.var_3A1F = 650;
	}

	if(!isdefined(level.var_3A1E))
	{
		level.var_3A1E = 2000;
	}

	if(!isdefined(level.var_3A1A))
	{
		level.var_3A1A = 4000;
	}

	if(!isdefined(level.var_3A1C))
	{
		level.var_3A1C = 1;
	}

	if(!isdefined(level.var_3A1D))
	{
		level.var_3A1D = 0.6;
	}

	if(!isdefined(level.var_3A17))
	{
		level.var_3A17 = 1.6;
	}

	if(!isdefined(level.var_3A20))
	{
		level.var_3A20 = 200;
	}

	if(!isdefined(level.var_3A21))
	{
		level.var_3A21 = 200;
	}

	if(!isdefined(level.var_3A23))
	{
		level.var_3A23 = 25;
	}

	if(!isdefined(level.var_3A16))
	{
		level.var_3A16 = 200;
	}

	if(!isdefined(level.var_3A22))
	{
		level.var_3A22 = 0.9;
	}
}

//Function Number: 3
lib_A5A1::func_30C3()
{
	level endon("stop_vehicle_free_path");
	for(;;)
	{
		self waittill("trigger",var_00);
		var_00 notify("enable_free_path");
	}
}

//Function Number: 4
lib_A5A1::func_1E59(param_00)
{
	level notify("stop_vehicle_free_path");
	level.var_9CBE = undefined;
	level.var_5F9E = undefined;
	if(param_00 && isdefined(level.var_3247))
	{
		foreach(var_02 in level.var_3247)
		{
			if(!function_0294(var_02))
			{
				var_02 delete();
			}
		}
	}

	level.var_3247 = undefined;
	if(isdefined(level.var_31D.var_2E17) && isdefined(level.var_31D.var_2E17.var_7001))
	{
		level.var_31D.var_2E17.var_7001 = undefined;
	}
}

//Function Number: 5
lib_A5A1::func_8970(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(!isdefined(level.var_3247))
	{
		level.var_3247 = [];
	}

	if(level.var_3247.size >= 8)
	{
		return undefined;
	}

	if(param_02 && param_03)
	{
		var_04 = getentarray(self.target,"targetname");
		var_05 = [];
		foreach(var_07 in var_04)
		{
			if(var_07.code_classname == "info_vehicle_node")
			{
				continue;
			}

			var_05[var_05.size] = var_07;
		}

		var_05 = common_scripts\utility::get_array_of_closest(self.var_2E6,var_05);
		foreach(var_0B, var_0A in var_05)
		{
			var_0A thread lib_A59A::func_798(::lib_A5A1::func_44AD,self,var_0B);
		}

		var_0C = lib_A59A::func_896F();
		var_0C waittill("guy_entered");
		wait(3);
		if(!self.var_7507.size)
		{
			return undefined;
		}
	}
	else
	{
		var_0C = lib_A59A::func_896F();
	}

	var_0C.var_2D3C = 1;
	var_0C.var_46F8 = param_02;
	var_0C thread lib_A5A0::func_9C88();
	if(isdefined(param_00))
	{
		var_0C vehphys_setspeed(param_00);
	}

	if(param_01)
	{
		wait(0.15);
		var_0C lib_A5A1::func_5663(1,param_00);
	}
	else
	{
		var_0C thread lib_A5A1::func_5663(0,param_00);
		var_0C thread lib_A5A0::func_5C6(var_0C);
	}

	return var_0C;
}

//Function Number: 6
lib_A5A1::func_5663(param_00,param_01)
{
	self endon("death");
	self endon("script_crash_vehicle");
	if(!param_00)
	{
		level endon("stop_vehicle_free_path");
		common_scripts\utility::waittill_either("enable_free_path","reached_end_node");
	}

	var_02 = lib_A5A1::func_3DDE(self.var_2E6);
	if(isdefined(level.var_2DFB))
	{
		var_02 thread [[ level.var_2DFB ]](self,param_01);
	}

	thread lib_A5A1::func_9C8E();
}

//Function Number: 7
lib_A5A1::func_3DDE(param_00)
{
	param_00 = (param_00[0],param_00[1],0);
	var_01 = common_scripts\utility::get_array_of_closest(param_00,level.var_9CBE,undefined,3);
	var_02 = var_01[0];
	var_03 = var_02.index;
	if(var_01[1].index < var_03)
	{
		var_02 = var_01[1];
		var_03 = var_02.index;
	}

	if(var_01[2].index < var_03)
	{
		var_02 = var_01[2];
	}

	return var_02;
}

//Function Number: 8
lib_A5A1::func_44AD(param_00,param_01)
{
	lib_A5A0::func_5FC(param_00,param_01);
}

//Function Number: 9
lib_A5A1::func_8108(param_00)
{
	var_01 = lib_A5A1::func_23D1(param_00);
	lib_A5A1::func_0743(var_01);
	return var_01;
}

//Function Number: 10
lib_A5A1::func_23D1(param_00)
{
	var_01 = common_scripts\utility::getstruct(param_00,"targetname");
	var_02 = [];
	var_03 = 0;
	var_04 = var_01;
	for(;;)
	{
		var_05 = var_01;
		if(isdefined(var_01.target))
		{
			var_05 = common_scripts\utility::getstruct(var_01.target,"targetname");
		}

		var_01.var_2E6 = lib_A5A1::func_2F64(var_01.var_2E6);
		var_02[var_02.size] = var_01;
		var_01.var_60BA = var_05;
		var_01.var_6F3E = var_04;
		var_01.var_2010 = [];
		var_01.var_2013 = [];
		var_01.var_2011 = [];
		var_01.var_65A5 = [];
		var_01.var_65A5["left"] = var_01.var_2E6;
		var_06 = common_scripts\utility::getstruct(var_01.script_linkto,"script_linkname");
		var_06.var_2E6 = lib_A5A1::func_2F64(var_06.var_2E6);
		var_01.var_65A5["right"] = var_06.var_2E6;
		var_01.var_7563 = distance(var_01.var_65A5["right"],var_01.var_65A5["left"]);
		var_01.var_5C0C = var_01.var_65A5["left"] + var_01.var_65A5["right"] * 0.5;
		var_01.index = var_03;
		var_03++;
		if(var_01 == var_05)
		{
			break;
		}

		var_04 = var_01;
		var_01 = var_05;
	}

	foreach(var_08 in var_02)
	{
		if(var_08.var_60BA == var_08)
		{
			continue;
		}

		var_09 = var_08.var_5C0C;
		var_0A = var_08.var_60BA.var_5C0C;
		var_0B = vectortoangles(var_09 - var_0A);
		var_0C = anglestoright(var_0B);
		var_0D = var_08.var_7563 * 0.5;
		var_08.var_65A5["left"] = var_08.var_5C0C + var_0C * var_0D;
		var_08.var_65A5["left_warning"] = var_08.var_5C0C + var_0C * var_0D * level.var_3A22;
		var_08.var_65A5["right"] = var_08.var_5C0C + var_0C * var_0D * -1;
		var_08.var_65A5["right_warning"] = var_08.var_5C0C + var_0C * var_0D * -1 * level.var_3A22;
	}

	foreach(var_08 in var_02)
	{
		var_08.var_2B6F = distance(var_08.var_5C0C,var_08.var_60BA.var_5C0C);
	}

	return var_02;
}

//Function Number: 11
lib_A5A1::func_0743(param_00)
{
	var_01 = common_scripts\utility::getstructarray("road_path_col","targetname");
	foreach(var_03 in var_01)
	{
		var_04 = common_scripts\utility::getstruct(var_03.target,"targetname");
		var_03.var_2E6 = lib_A5A1::func_2F64(var_03.var_2E6);
		var_04.var_2E6 = lib_A5A1::func_2F64(var_04.var_2E6);
		var_03.var_65AD = var_04;
		var_04.var_65AD = var_03;
	}

	foreach(var_07 in param_00)
	{
		foreach(var_03 in var_01)
		{
			if(!isdefined(var_03.var_5764))
			{
				lib_A5A1::func_0744(var_07,var_03);
			}
		}
	}
}

//Function Number: 12
lib_A5A1::func_0744(param_00,param_01)
{
	if(param_00 == param_00.var_60BA)
	{
		return;
	}

	if(!lib_A5A1::func_929E(param_00,param_01))
	{
		return;
	}

	var_02 = param_01.var_65AD;
	var_03 = lib_A5A1::func_3E3C(param_01.var_2E6,param_00.var_5C0C,param_00.var_60BA.var_5C0C);
	var_04 = lib_A5A1::func_3E3C(var_02.var_2E6,param_00.var_5C0C,param_00.var_60BA.var_5C0C);
	param_01.var_6FFD = var_03["progress"];
	param_01.var_6376 = var_03["offset"];
	var_02.var_6FFD = var_04["progress"];
	var_02.var_6376 = var_04["offset"];
	if(var_03["progress"] < var_04["progress"])
	{
		lib_A5A1::func_0742(param_00,param_01,var_02);
		param_00.var_2010[param_00.var_2010.size] = param_01;
		param_01.var_5764 = 1;
		return;
	}

	lib_A5A1::func_0742(param_00,var_02,param_01);
	param_00.var_2010[param_00.var_2010.size] = var_02;
	param_01.var_5764 = 1;
}

//Function Number: 13
lib_A5A1::func_929E(param_00,param_01)
{
	var_02[0] = param_00.var_65A5["left"];
	var_02[1] = param_00.var_65A5["right"];
	var_02[2] = param_00.var_60BA.var_65A5["right"];
	var_02[3] = param_00.var_60BA.var_65A5["left"];
	var_03[0] = param_01.var_2E6;
	var_03[1] = param_01.var_65AD.var_2E6;
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_05 = 0;
		var_06 = 0;
		var_07 = var_02.size - 1;
		while(var_06 < var_02.size)
		{
			if(var_02[var_06][1] > var_03[var_04][1] != var_02[var_07][1] > var_03[var_04][1] && var_03[var_04][0] < var_02[var_07][0] - var_02[var_06][0] * var_03[var_04][1] - var_02[var_06][1] / var_02[var_07][1] - var_02[var_06][1] + var_02[var_06][0])
			{
				var_05 = !var_05;
			}

			var_07 = var_06;
			var_06++;
		}

		if(var_05)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 14
lib_A5A1::func_0742(param_00,param_01,param_02)
{
	var_03 = param_02.var_6FFD + 200;
	var_04 = param_01.var_6FFD - level.var_3A16;
	var_05 = undefined;
	var_06 = undefined;
	if(param_02.var_6376 > param_01.var_6376)
	{
		var_05 = param_02.var_6376;
		var_06 = param_01.var_6376;
	}
	else
	{
		var_05 = param_01.var_6376;
		var_06 = param_02.var_6376;
	}

	var_07 = param_00;
	var_08 = var_03;
	var_09 = var_04;
	var_0A = var_05;
	var_0B = var_06;
	for(;;)
	{
		var_0C = lib_A5A1::func_3E59(param_00,var_05);
		var_0D = lib_A5A1::func_3E59(param_00,var_06);
		var_0E = max(var_0C,var_0D);
		var_0F = min(var_03,var_0E);
		lib_A5A1::func_07BC(param_00,var_0F,var_04,var_05,var_06);
		if(!isdefined(param_00.var_60BA) || param_00 == param_00.var_60BA)
		{
			break;
		}

		var_03 = var_03 - var_0E;
		var_04 = 0;
		if(var_03 <= 0)
		{
			break;
		}

		var_10 = lib_A5A1::func_3E36(param_00,var_0C,var_05);
		var_11 = lib_A5A1::func_3E36(param_00,var_0D,var_06);
		param_00 = param_00.var_60BA;
		var_12 = lib_A5A1::func_3E3C(var_10,param_00.var_5C0C,param_00.var_60BA.var_5C0C);
		var_05 = var_12["offset"];
		var_13 = lib_A5A1::func_3E3C(var_11,param_00.var_5C0C,param_00.var_60BA.var_5C0C);
		var_06 = var_13["offset"];
	}

	param_00 = var_07;
	var_03 = var_08;
	var_04 = var_09;
	var_05 = var_0A;
	var_06 = var_0B;
	for(;;)
	{
		if(!isdefined(param_00.var_6F3E) || param_00 == param_00.var_6F3E)
		{
			break;
		}

		if(var_04 > 0)
		{
			break;
		}

		var_10 = lib_A5A1::func_3E36(param_00,0,var_05);
		var_11 = lib_A5A1::func_3E36(param_00,0,var_06);
		param_00 = param_00.var_6F3E;
		var_12 = lib_A5A1::func_3E3C(var_10,param_00.var_5C0C,param_00.var_60BA.var_5C0C);
		var_05 = var_12["offset"];
		var_13 = lib_A5A1::func_3E3C(var_11,param_00.var_5C0C,param_00.var_60BA.var_5C0C);
		var_06 = var_13["offset"];
		var_03 = max(var_12["progress"],var_13["progress"]);
		var_04 = var_04 + var_03;
		lib_A5A1::func_07BC(param_00,var_03,var_04,var_05,var_06);
	}
}

//Function Number: 15
lib_A5A1::func_07BC(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = spawnstruct();
	var_05.var_205B = [];
	var_05.var_205B["max"] = param_01;
	var_05.var_205B["min"] = param_02;
	if(var_05.var_205B["min"] < 0)
	{
		var_05.var_205B["min"] = 0;
	}

	if(isdefined(param_00.var_60BA) && param_00 != param_00.var_60BA)
	{
	}

	var_05.var_205B["left_offset"] = param_04;
	var_05.var_205B["right_offset"] = param_03;
	var_05.var_205B["mid_offset"] = param_03 + param_04 * 0.5;
	param_00.var_2013[param_00.var_2013.size] = var_05;
}

//Function Number: 16
lib_A5A1::func_0776(param_00,param_01)
{
	var_02 = spawnstruct();
	var_02.ent = self;
	var_02.var_1757 = param_00;
	if(isdefined(param_01) && param_01 == 1)
	{
		var_02 thread lib_A5A1::func_736A();
	}

	var_02 thread lib_A5A1::func_9AC4();
}

//Function Number: 17
lib_A5A1::func_736A()
{
	level endon("stop_vehicle_free_path");
	self.ent endon("moving_obstacle_removed");
	self.ent waittill("death");
	lib_A5A1::func_7369();
}

//Function Number: 18
lib_A5A1::func_7369()
{
	lib_A5A1::func_9A4F();
	self.ent notify("moving_obstacle_removed");
}

//Function Number: 19
lib_A5A1::func_9AC4()
{
	level endon("stop_vehicle_free_path");
	self.ent endon("moving_obstacle_removed");
	self.ent endon("death");
	self.node = self.ent lib_A5A1::func_3DDE(self.ent.var_2E6);
	var_00 = self.ent lib_A5A1::func_3E3C(self.ent.var_2E6,self.node.var_5C0C,self.node.var_60BA.var_5C0C);
	var_01 = self.ent lib_A5A1::func_5F30(self.node,var_00["progress"],var_00["offset"]);
	self.node = var_01.node;
	for(;;)
	{
		var_00 = self.ent lib_A5A1::func_3E3C(self.ent.var_2E6,self.node.var_5C0C,self.node.var_60BA.var_5C0C);
		var_01 = self.ent lib_A5A1::func_5F30(self.node,var_00["progress"],var_00["offset"]);
		if(self.node != var_01.node)
		{
			self.node = var_01.node;
		}

		lib_A5A1::func_9AC3();
		wait(0.1);
	}
}

//Function Number: 20
lib_A5A1::func_9AC3()
{
	var_00 = anglestoforward(self.ent.var_41);
	var_01 = anglestoright(self.ent.var_41);
	self.var_222A = [];
	self.var_222A[0] = lib_A5A1::func_2F64(self.ent.var_2E6 + -1 * self.var_1757["width"] / 2 * var_01 + self.var_1757["length"] / 2 * var_00);
	self.var_222A[1] = lib_A5A1::func_2F64(self.ent.var_2E6 + self.var_1757["width"] / 2 * var_01 + self.var_1757["length"] / 2 * var_00);
	self.var_222A[2] = lib_A5A1::func_2F64(self.ent.var_2E6 + -1 * self.var_1757["width"] / 2 * var_01 + -1 * self.var_1757["length"] / 2 * var_00);
	self.var_222A[3] = lib_A5A1::func_2F64(self.ent.var_2E6 + self.var_1757["width"] / 2 * var_01 + -1 * self.var_1757["length"] / 2 * var_00);
	var_02 = [];
	var_02[0] = lib_A5A1::func_3E3C(self.var_222A[0],self.node.var_5C0C,self.node.var_60BA.var_5C0C);
	var_02[1] = lib_A5A1::func_3E3C(self.var_222A[1],self.node.var_5C0C,self.node.var_60BA.var_5C0C);
	var_02[2] = lib_A5A1::func_3E3C(self.var_222A[2],self.node.var_5C0C,self.node.var_60BA.var_5C0C);
	var_02[3] = lib_A5A1::func_3E3C(self.var_222A[3],self.node.var_5C0C,self.node.var_60BA.var_5C0C);
	var_03 = var_02[0]["offset"];
	var_04 = var_03;
	var_05 = var_02[0]["progress"];
	var_06 = var_05;
	for(var_07 = 1;var_07 < var_02.size;var_07++)
	{
		if(var_02[var_07]["offset"] < var_03)
		{
			var_03 = var_02[var_07]["offset"];
		}

		if(var_02[var_07]["offset"] > var_04)
		{
			var_04 = var_02[var_07]["offset"];
		}

		if(var_02[var_07]["progress"] < var_05)
		{
			var_05 = var_02[var_07]["progress"];
		}

		if(var_02[var_07]["progress"] > var_06)
		{
			var_06 = var_02[var_07]["progress"];
		}
	}

	var_06 = var_06 + 200;
	var_05 = var_05 - 200;
	lib_A5A1::func_9A4F();
	lib_A5A1::func_72DE(var_06,var_05,var_04,var_03);
}

//Function Number: 21
lib_A5A1::func_72DE(param_00,param_01,param_02,param_03)
{
	var_04 = param_00;
	var_05 = param_01;
	var_06 = param_02;
	var_07 = param_03;
	var_08 = self.node;
	var_09 = var_08;
	for(;;)
	{
		var_0A = lib_A5A1::func_3E59(var_09,param_02);
		var_0B = lib_A5A1::func_3E59(var_09,param_03);
		var_0C = max(max(var_0A,var_0B),0);
		var_0D = min(param_00,var_0C);
		if(var_0D <= 0)
		{
			break;
		}

		lib_A5A1::func_0777(var_09,var_0D,param_01,param_02,param_03);
		if(!isdefined(var_09.var_60BA) || var_09 == var_09.var_60BA)
		{
			break;
		}

		param_00 = param_00 - var_0C;
		param_01 = 0;
		if(param_00 <= 0)
		{
			break;
		}

		var_0E = lib_A5A1::func_3E36(var_09,var_0A,param_02);
		var_0F = lib_A5A1::func_3E36(var_09,var_0B,param_03);
		var_09 = var_09.var_60BA;
		var_10 = lib_A5A1::func_3E3C(var_0E,var_09.var_5C0C,var_09.var_60BA.var_5C0C);
		param_02 = var_10["offset"];
		var_11 = lib_A5A1::func_3E3C(var_0F,var_09.var_5C0C,var_09.var_60BA.var_5C0C);
		param_03 = var_11["offset"];
	}

	var_09 = var_08;
	param_00 = var_04;
	param_01 = var_05;
	param_02 = var_06;
	param_03 = var_07;
	for(;;)
	{
		if(!isdefined(var_09.var_6F3E) || var_09 == var_09.var_6F3E)
		{
			break;
		}

		if(param_01 > 0)
		{
			break;
		}

		var_0E = lib_A5A1::func_3E36(var_09,0,param_02);
		var_0F = lib_A5A1::func_3E36(var_09,0,param_03);
		var_09 = var_09.var_6F3E;
		var_10 = lib_A5A1::func_3E3C(var_0E,var_09.var_5C0C,var_09.var_60BA.var_5C0C);
		param_02 = var_10["offset"];
		var_11 = lib_A5A1::func_3E3C(var_0F,var_09.var_5C0C,var_09.var_60BA.var_5C0C);
		param_03 = var_11["offset"];
		param_00 = max(var_10["progress"],var_11["progress"]);
		param_01 = param_01 + param_00;
		if(param_00 <= 0)
		{
			break;
		}

		lib_A5A1::func_0777(var_09,param_00,param_01,param_02,param_03);
	}
}

//Function Number: 22
lib_A5A1::func_9A4F()
{
	foreach(var_01 in level.var_9CBE)
	{
		foreach(var_03 in var_01.var_2011)
		{
			if(var_03.owner == self)
			{
				var_01.var_2011 = common_scripts\utility::array_remove(var_01.var_2011,var_03);
			}
		}
	}
}

//Function Number: 23
lib_A5A1::func_0777(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = spawnstruct();
	var_05.var_205B = [];
	var_05.owner = self;
	var_05.var_205B["max"] = param_01;
	var_05.var_205B["min"] = param_02;
	if(var_05.var_205B["min"] < 0)
	{
		var_05.var_205B["min"] = 0;
	}

	if(param_00.index != 0)
	{
	}
	else if(var_05.var_205B["min"] < var_05.var_205B["max"])
	{
		return;
	}

	var_05.var_205B["left_offset"] = param_04;
	var_05.var_205B["right_offset"] = param_03;
	var_05.var_205B["mid_offset"] = param_03 + param_04 * 0.5;
	param_00.var_2011[param_00.var_2011.size] = var_05;
}

//Function Number: 24
lib_A5A1::func_9CB5(param_00,param_01)
{
	level endon("stop_vehicle_free_path");
	param_00 endon("death");
	param_00 notify("enable_free_path");
	if(param_00.var_46F8 && !param_00.var_7507.size)
	{
		param_00 vehphys_crash();
		return;
	}

	var_02 = self;
	if(isdefined(param_01))
	{
		param_00.var_8D1F = param_01;
	}
	else
	{
		param_00.var_8D1F = param_00 veh_getspeed();
	}

	param_00.var_A33A = 0;
	param_00.var_7001 = var_02;
	param_00.var_6FFD = 0;
	param_00.var_31BB = param_00.var_2E6;
	param_00.var_359D = 0;
	param_00.var_5F0B = 0;
	param_00.var_66CB = gettime();
	common_scripts\utility::array_thread(param_00.var_7507,::lib_A5A1::func_7504,param_00);
	param_00 thread lib_A5A1::func_9CA4();
	lib_A5A1::func_9AE4(param_00);
	for(;;)
	{
		if(!isalive(param_00))
		{
			break;
		}

		if(param_00.var_A33A)
		{
			param_00 vehphys_crash();
			foreach(var_04 in param_00.var_7507)
			{
				if(isalive(var_04))
				{
					var_04 method_8052();
				}
			}

			param_00 method_8052();
			wait(5);
			if(isdefined(param_00))
			{
				param_00 delete();
			}

			lib_A5A1::func_9AE4();
			return;
		}

		if(!var_03.var_A33A && var_03 veh_getspeed() < 2)
		{
			var_03.var_5F0B++;
			if(var_03.var_5F0B > 5)
			{
				var_03 lib_A5A1::func_A33A("move fail!");
			}
		}
		else
		{
			var_03.var_5F0B = 0;
		}

		var_03 lib_A5A1::func_7EF8();
		wait(0.05);
	}
}

//Function Number: 25
lib_A5A1::func_7EF8()
{
	var_00 = self;
	var_01 = var_00.var_7001;
	if(var_01 == var_01.var_60BA)
	{
		return;
	}

	var_02 = lib_A5A1::func_3E3C(var_00.var_2E6,var_01.var_5C0C,var_01.var_60BA.var_5C0C);
	var_03 = var_02["offset"];
	var_04 = var_01.var_7563;
	var_05 = lib_A5A1::func_5F30(var_01,var_02["progress"],var_03);
	var_06 = var_05.var_6FFD;
	var_07 = var_05.var_6376;
	var_01 = var_05.node;
	var_00.var_7001 = var_01;
	var_00.var_6FFD = var_06;
	if(var_01 == var_01.var_60BA)
	{
		return;
	}

	var_08 = lib_A5A1::func_5F30(var_01,var_06 + var_00.var_359D,var_07);
	var_09 = var_08.var_6FFD;
	var_0A = var_08.var_6376;
	var_0B = var_08.node;
	var_0C = lib_A5A1::func_3D4B(var_0B,var_09);
	var_0D = lib_A5A1::func_3DFC(var_0B,var_09,var_0A,1);
	var_0E = 0;
	if(isdefined(var_0D["dodge1"]))
	{
		var_0A = var_0D["dodge1"];
		var_0E = 1;
		if(isdefined(var_0C["right"]) && var_0A > var_0C["right"])
		{
			var_0A = var_0D["dodge2"];
		}

		if(isdefined(var_0C["left"]) && var_0A < var_0C["left"])
		{
			var_0A = var_0D["dodge2"];
		}
	}

	if(isdefined(var_0C["right"]) && var_0A > var_0C["right"])
	{
		var_0A = var_0C["right"];
		var_0E = 1;
	}

	if(isdefined(var_0C["left"]) && var_0A < var_0C["left"])
	{
		var_0A = var_0C["left"];
		var_0E = 1;
	}

	var_0F = 0;
	var_00.var_31BB = var_00 lib_A5A1::func_3EB7(var_0B,var_09,var_0A,var_0F);
	var_10 = lib_A59A::func_3D44(var_00.var_2E6,var_00.var_41,var_00.var_31BB);
	var_11 = 1;
	if(var_10 > 0.9659)
	{
		var_11 = 1;
	}
	else if(var_10 > 0.866)
	{
		var_11 = 0.85;
	}
	else if(var_10 > 0.7071)
	{
		var_11 = 0.65;
	}
	else if(var_10 > 0.5)
	{
		var_11 = 0.4;
	}
	else
	{
		var_11 = 0.1;
	}

	var_12 = max(var_00.var_8D1F * var_11,level.var_3A23);
	var_00 veh_vehicledriveto(var_00.var_31BB,var_12);
	if(isdefined(level.var_31D.var_2E17))
	{
		var_00 lib_A5A1::func_59DA(var_11);
	}
}

//Function Number: 26
lib_A5A1::func_3DFC(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_03) && param_03 == 1)
	{
		foreach(var_05 in param_00.var_2013)
		{
			var_05.var_470F = 0;
		}

		foreach(var_05 in param_00.var_2011)
		{
			var_05.var_470F = 0;
		}
	}

	var_09 = [];
	var_0A = common_scripts\utility::array_combine(param_00.var_2013,param_00.var_2011);
	foreach(var_05 in var_0A)
	{
		if(var_05.var_470F == 1)
		{
			continue;
		}

		if(isdefined(var_05.owner) && isdefined(var_05.owner.ent) && var_05.owner.ent == self)
		{
			continue;
		}

		if(param_01 < var_05.var_205B["min"])
		{
			continue;
		}

		if(param_01 > var_05.var_205B["max"])
		{
			continue;
		}

		if(param_02 < var_05.var_205B["left_offset"])
		{
			continue;
		}

		if(param_02 > var_05.var_205B["right_offset"])
		{
			continue;
		}

		var_0C = var_05.var_205B["right_offset"] + 50;
		var_0D = var_05.var_205B["left_offset"] - 50;
		var_05.var_470F = 1;
		var_0E = lib_A5A1::func_3DFC(param_00,param_01,var_0C);
		var_0F = lib_A5A1::func_3DFC(param_00,param_01,var_0D);
		if(var_0E.size > 0)
		{
			if(var_0E["dodge1"] > var_0C)
			{
				var_0C = var_0E["dodge1"];
			}

			if(var_0E["dodge2"] > var_0C)
			{
				var_0C = var_0E["dodge2"];
			}

			if(var_0E["dodge1"] < var_0D)
			{
				var_0D = var_0E["dodge1"];
			}

			if(var_0E["dodge2"] < var_0D)
			{
				var_0D = var_0E["dodge2"];
			}
		}

		if(var_0F.size > 0)
		{
			if(var_0F["dodge1"] > var_0C)
			{
				var_0C = var_0F["dodge1"];
			}

			if(var_0F["dodge2"] > var_0C)
			{
				var_0C = var_0F["dodge2"];
			}

			if(var_0F["dodge1"] < var_0D)
			{
				var_0D = var_0F["dodge1"];
			}

			if(var_0F["dodge2"] < var_0D)
			{
				var_0D = var_0F["dodge2"];
			}
		}

		var_10 = var_0C + var_0D * 0.5;
		if(param_02 > var_10)
		{
			var_09["dodge1"] = var_0C;
			var_09["dodge2"] = var_0D;
		}
		else
		{
			var_09["dodge1"] = var_0D;
			var_09["dodge2"] = var_0C;
		}

		break;
	}

	return var_09;
}

//Function Number: 27
lib_A5A1::func_9AE4(param_00)
{
	var_01 = [];
	foreach(var_03 in level.var_3247)
	{
		if(!isalive(var_03))
		{
			continue;
		}

		if(var_03.var_A33A)
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	level.var_3247 = var_01;
	if(isalive(param_00) && !param_00.var_A33A)
	{
		if(!common_scripts\utility::array_contains(level.var_3247,param_00))
		{
			level.var_3247[level.var_3247.size] = param_00;
			if(1)
			{
				level.var_3247 = common_scripts\utility::array_sort_by_handler(level.var_3247,::lib_A5A1::func_3E98);
			}
		}
	}

	var_05 = level.var_3A20;
	var_06 = 200;
	foreach(var_03 in level.var_3247)
	{
		var_03.var_6AA3 = var_05;
		var_05 = var_05 + level.var_3A21;
		var_03.var_359D = var_06;
		var_06 = var_06 + 100;
	}
}

//Function Number: 28
lib_A5A1::func_3E98()
{
	var_00 = 0;
	var_01 = 0;
	var_02 = self.var_7001;
	if(!isdefined(var_02) || !isdefined(self.var_6FFD))
	{
		return 0;
	}

	var_03 = lib_A59A::func_3F80(var_02.target,"targetname");
	var_00 = self.var_6FFD;
	for(;;)
	{
		if(!isdefined(var_02.targetname))
		{
			break;
		}

		var_03 = var_02;
		var_02 = lib_A59A::func_3F80(var_02.targetname,"target");
		if(!isdefined(var_02))
		{
			break;
		}

		var_01++;
		var_00 = var_00 + distance2d(var_03.var_2E6,var_02.var_2E6);
	}

	return var_00;
}

//Function Number: 29
lib_A5A1::func_2B78()
{
	return distance2dsquared(self.var_2E6,level.var_31D.var_2E6);
}

//Function Number: 30
lib_A5A1::func_9CA4()
{
	self waittill("death");
	wait 0.05;
	lib_A5A1::func_9AE4();
}

//Function Number: 31
lib_A5A1::func_7504(param_00)
{
	self waittill("death");
	if(isdefined(param_00))
	{
		param_00 lib_A5A1::func_A33A("driver died!");
	}
}

//Function Number: 32
lib_A5A1::func_9C8E()
{
	level endon("stop_vehicle_free_path");
	self endon("death");
	for(;;)
	{
		self waittill("veh_contact",var_00,var_01,var_02,var_03,var_04);
		if(isdefined(var_03))
		{
			var_05 = length(var_03) / 63360 * 60 * 60;
			if(var_05 > 20)
			{
				lib_A5A1::func_A33A("crash");
			}
		}
	}
}

//Function Number: 33
lib_A5A1::func_A33A(param_00)
{
	self.var_A33A = 1;
}

//Function Number: 34
lib_A5A1::func_59DA(param_00)
{
	if(!isdefined(level.var_31D.var_2E17.var_7001))
	{
		level.var_31D.var_2E17.var_7001 = lib_A5A1::func_3DDE(level.var_31D.var_2E17.var_2E6);
	}

	var_01 = lib_A5A1::func_3E3C(level.var_31D.var_2E17.var_2E6,level.var_31D.var_2E17.var_7001.var_5C0C,level.var_31D.var_2E17.var_7001.var_60BA.var_5C0C);
	var_02 = lib_A5A1::func_5F30(level.var_31D.var_2E17.var_7001,var_01["progress"],var_01["offset"]);
	var_03 = var_02.var_6FFD;
	var_04 = var_02.var_6376;
	level.var_31D.var_2E17.var_7001 = var_02.node;
	var_05 = lib_A5A1::func_6FFF(self.var_7001,self.var_6FFD,var_02.node,var_02.var_6FFD);
	var_05 = var_05 - self.var_6AA3;
	if(var_05 < level.var_3A1B)
	{
		if(gettime() > self.var_66CB + 2000)
		{
			lib_A5A1::func_A33A("too far behind");
			return;
		}
	}
	else if(var_05 > level.var_3A1A)
	{
		if(gettime() > self.var_66CB + 2000)
		{
			lib_A5A1::func_A33A("too far ahead");
			return;
		}
	}
	else
	{
		self.var_66CB = gettime();
	}

	if(param_00 < 0.6)
	{
		return;
	}

	var_06 = lib_A5A1::func_3DDD(var_05);
	var_07 = max(level.var_31D.var_2E17 veh_getspeed() * var_06,level.var_3A23);
	if(self veh_isphysveh())
	{
		self vehphys_setspeed(var_07);
		return;
	}

	self veh_setspeed(var_07);
}

//Function Number: 35
lib_A5A1::func_3DDD(param_00)
{
	var_01 = level.var_3A1C;
	if(param_00 < level.var_3A19)
	{
		var_01 = level.var_3A17;
	}
	else if(param_00 > level.var_3A1E)
	{
		var_01 = level.var_3A1D;
	}
	else if(param_00 < level.var_3A18)
	{
		var_02 = level.var_3A18 - level.var_3A19;
		var_03 = level.var_3A18 - param_00 / var_02;
		var_04 = level.var_3A17 - level.var_3A1C;
		var_01 = var_03 * var_04 + level.var_3A1C;
	}
	else if(param_00 > level.var_3A1F)
	{
		var_02 = level.var_3A1E - level.var_3A1F;
		var_03 = param_00 - level.var_3A1F / var_02;
		var_04 = level.var_3A1D - level.var_3A1C;
		var_01 = var_03 * var_04 + level.var_3A1C;
	}
	else
	{
		var_05 = level.var_3A1C;
	}

	return var_01;
}

//Function Number: 36
lib_A5A1::func_6FFF(param_00,param_01,param_02,param_03)
{
	while(param_00.index > param_02.index)
	{
		param_00 = param_00.var_6F3E;
		param_01 = param_01 + param_00.var_2B6F;
	}

	while(param_02.index > param_00.index)
	{
		param_02 = param_02.var_6F3E;
		param_03 = param_03 + param_02.var_2B6F;
	}

	return param_01 - param_03;
}

//Function Number: 37
lib_A5A1::func_3E3C(param_00,param_01,param_02)
{
	var_03 = [];
	var_04 = vectornormalize(param_02 - param_01);
	var_05 = param_00 - param_01;
	var_06 = vectordot(var_05,var_04);
	var_07 = param_01 + var_04 * var_06;
	var_03["progress"] = var_06;
	var_03["offset"] = distance2d(var_07,param_00);
	var_08 = anglestoright(vectortoangles(var_04));
	var_09 = vectornormalize(var_07 - param_00);
	var_0A = vectordot(var_08,var_09);
	var_03["side"] = "right";
	if(var_0A > 0)
	{
		var_03["offset"] = var_03["offset"] * -1;
		var_03["side"] = "left";
	}

	return var_03;
}

//Function Number: 38
lib_A5A1::func_3E59(param_00,param_01)
{
	var_02 = param_00.var_2B6F;
	var_03 = undefined;
	if(param_01 > 0)
	{
		var_03 = lib_A5A1::func_3E3C(param_00.var_60BA.var_65A5["right"],param_00.var_5C0C,param_00.var_60BA.var_5C0C);
	}
	else
	{
		var_03 = lib_A5A1::func_3E3C(param_00.var_60BA.var_65A5["left"],param_00.var_5C0C,param_00.var_60BA.var_5C0C);
	}

	var_04 = param_01 / var_03["offset"];
	var_05 = var_03["progress"] - var_02 * var_04;
	return var_05 + var_02;
}

//Function Number: 39
lib_A5A1::func_3D4B(param_00,param_01)
{
	var_02 = [];
	if(isdefined(param_00.var_60BA.var_65A5["right_warning"]))
	{
		var_03 = lib_A5A1::func_3E3C(param_00.var_65A5["right_warning"],param_00.var_5C0C,param_00.var_60BA.var_5C0C);
		var_04 = lib_A5A1::func_3E3C(param_00.var_60BA.var_65A5["right_warning"],param_00.var_5C0C,param_00.var_60BA.var_5C0C);
		var_05 = param_01 / var_04["progress"] - var_03["progress"];
		var_02["right"] = var_03["offset"] + var_05 * var_04["offset"] - var_03["offset"];
	}

	if(isdefined(param_00.var_60BA.var_65A5["left_warning"]))
	{
		var_03 = lib_A5A1::func_3E3C(param_00.var_65A5["left_warning"],param_00.var_5C0C,param_00.var_60BA.var_5C0C);
		var_04 = lib_A5A1::func_3E3C(param_00.var_60BA.var_65A5["left_warning"],param_00.var_5C0C,param_00.var_60BA.var_5C0C);
		var_05 = param_01 / var_04["progress"] - var_03["progress"];
		var_02["left"] = var_03["offset"] + var_05 * var_04["offset"] - var_03["offset"];
	}

	return var_02;
}

//Function Number: 40
lib_A5A1::func_3E36(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	var_04 = vectortoangles(param_00.var_60BA.var_5C0C - param_00.var_5C0C);
	var_05 = anglestoforward(var_04);
	var_06 = anglestoright(var_04);
	return param_00.var_5C0C + var_05 * param_01 + var_06 * param_02;
}

//Function Number: 41
lib_A5A1::func_3EB7(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A5A1::func_3E36(param_00,param_01,param_02,param_03);
	return lib_A5A1::func_2F64(var_04);
}

//Function Number: 42
lib_A5A1::func_2F64(param_00)
{
	var_01 = physicstrace(param_00 + (0,0,100),param_00 + (0,0,-100));
	if(var_01 == param_00 + (0,0,-100))
	{
		var_02 = bullettrace(param_00 + (0,0,100),param_00 + (0,0,-100),0,undefined,0,0,1,0,0);
		if(var_02["position"] == var_01)
		{
			return param_00;
		}

		if(isdefined(var_02["surfacetype"]) && issubstr(var_02["surfacetype"],"water"))
		{
			var_01 = var_02["position"];
		}

		return param_00;
	}

	return var_02;
}

//Function Number: 43
lib_A5A1::func_5F30(param_00,param_01,param_02)
{
	var_03 = spawnstruct();
	for(;;)
	{
		var_04 = param_00.var_2B6F;
		if(isdefined(param_02))
		{
			var_04 = lib_A5A1::func_3E59(param_00,param_02);
		}

		if(param_01 > var_04)
		{
			if(param_00 == param_00.var_60BA)
			{
				break;
			}

			var_05 = lib_A5A1::func_3E36(param_00,var_04,param_02);
			param_01 = param_01 - var_04;
			param_00 = param_00.var_60BA;
			var_06 = lib_A5A1::func_3E3C(var_05,param_00.var_5C0C,param_00.var_60BA.var_5C0C);
			param_02 = var_06["offset"];
			continue;
		}

		if(param_01 < 0)
		{
			if(param_00 == param_00.var_6F3E)
			{
				break;
			}

			var_05 = lib_A5A1::func_3E36(param_00,0,param_02);
			param_00 = param_00.var_6F3E;
			var_06 = lib_A5A1::func_3E3C(var_05,param_00.var_5C0C,param_00.var_60BA.var_5C0C);
			param_01 = param_01 + var_06["progress"];
			param_02 = var_06["offset"];
			continue;
		}

		break;
	}

	var_03.node = param_00;
	var_03.var_6FFD = param_01;
	var_03.var_6376 = param_02;
	return var_03;
}

//Function Number: 44
lib_A5A1::func_269B()
{
}

//Function Number: 45
lib_A5A1::debug_draw_path()
{
	level endon("stop_free_path_debug");
	iprintlnbold("!!!!DEBUG PATH!!!!");
	var_00 = undefined;
	var_01 = undefined;
	for(;;)
	{
		if(!isdefined(level.var_9CBE))
		{
			wait(0.05);
			continue;
		}

		var_02 = level.var_9CBE;
		for(var_03 = 0;var_03 < var_02.size;var_03++)
		{
			var_04 = var_02[var_03];
			if(isdefined(var_04.var_60BA.var_65A5["left_warning"]))
			{
			}

			if(isdefined(var_04.var_60BA.var_65A5["right_warning"]))
			{
			}

			foreach(var_06 in var_04.var_2013)
			{
				var_04 lib_A5A1::func_2DA6(var_06.var_205B,(0.5,0,1));
			}

			foreach(var_06 in var_04.var_2011)
			{
				var_04 lib_A5A1::func_2DA6(var_06.var_205B,(1,0,0.5));
			}

			foreach(var_0B in var_04.var_2010)
			{
				var_0C = var_0B.var_2E6;
				var_0D = var_0B.var_65AD.var_2E6;
			}
		}

		wait(0.05);
	}
}

//Function Number: 46
lib_A5A1::func_267C(param_00)
{
	var_01 = (0.2,0.2,1);
	if(param_00)
	{
	}
	else
	{
	}
}

//Function Number: 47
lib_A5A1::func_2DA6(param_00,param_01)
{
	var_02 = lib_A5A1::func_3E36(self,param_00["min"],param_00["left_offset"]);
	var_03 = lib_A5A1::func_3E36(self,param_00["max"],param_00["left_offset"]);
	var_02 = lib_A5A1::func_3E36(self,param_00["min"],param_00["right_offset"]);
	var_03 = lib_A5A1::func_3E36(self,param_00["max"],param_00["right_offset"]);
	var_02 = lib_A5A1::func_3E36(self,param_00["min"],param_00["right_offset"]);
	var_03 = lib_A5A1::func_3E36(self,param_00["min"],param_00["left_offset"]);
	var_02 = lib_A5A1::func_3E36(self,param_00["max"],param_00["right_offset"]);
	var_03 = lib_A5A1::func_3E36(self,param_00["max"],param_00["left_offset"]);
}