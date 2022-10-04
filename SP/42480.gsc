/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42480.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:44 PM
*******************************************************************/

//Function Number: 1
lib_A5F0::func_871A(param_00,param_01,param_02,param_03)
{
	thread lib_A5F0::func_87A3(param_00,param_01,param_02,param_03);
}

//Function Number: 2
lib_A5F0::func_871C(param_00,param_01,param_02,param_03)
{
	thread lib_A5F0::func_87A3(param_00,param_01,param_02,30,param_03);
}

//Function Number: 3
lib_A5F0::func_871B(param_00,param_01,param_02)
{
	thread lib_A5F0::func_87A3(param_00,param_01,param_02,20);
}

//Function Number: 4
lib_A5F0::func_8717(param_00,param_01,param_02,param_03)
{
	thread lib_A5F0::func_87A0(param_00,param_01,param_02,param_03);
}

//Function Number: 5
lib_A5F0::func_8719(param_00,param_01,param_02)
{
	thread lib_A5F0::func_87A0(param_00,param_01,param_02,60);
}

//Function Number: 6
lib_A5F0::func_8718(param_00,param_01,param_02)
{
	thread lib_A5F0::func_87A0(param_00,param_01,param_02,30);
}

//Function Number: 7
lib_A5F0::func_8716(param_00,param_01,param_02)
{
	var_03 = lib_A5F0::func_879F(param_00);
	var_04 = var_03["animname"];
	var_05 = var_03["anime"];
	lib_A506::func_807(var_04,param_01,param_02,var_05);
}

//Function Number: 8
lib_A5F0::func_87A3(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = self;
	param_02 = lib_A5D2::func_F30(undefined,param_02);
	param_05 = lib_A5D2::func_F30(0.1,param_05);
	lib_A5F0::func_87A4(param_01,param_03);
	var_07 = spawn("script_origin",var_06.var_2E6);
	var_07 linkto(var_06);
	var_07 scalevolume(1,0);
	var_07 lib_A5F1::func_8724(param_00,"sound_done");
	var_07 endon("death");
	if(isstring(param_04))
	{
		var_07 thread lib_A5F0::func_87A2(param_05,param_04);
	}

	var_07 waittill("sound_done");
	if(isstring(param_02))
	{
		level notify(param_02);
	}

	wait(0.05);
	var_07 delete();
}

//Function Number: 9
lib_A5F0::func_87A2(param_00,param_01)
{
	self endon("death");
	var_02 = self;
	level waittill(param_01);
	var_02 thread lib_A5F0::func_87A1(param_00);
}

//Function Number: 10
lib_A5F0::func_87A1(param_00)
{
	var_01 = self;
	if(isdefined(var_01))
	{
		if(isdefined(param_00))
		{
			var_01 scalevolume(0,param_00);
			wait(param_00);
			waittillframeend;
		}

		if(isdefined(var_01))
		{
			var_01 delete();
		}
	}
}

//Function Number: 11
lib_A5F0::func_87A0(param_00,param_01,param_02,param_03)
{
	param_02 = lib_A5D2::func_F30(undefined,param_02);
	lib_A5F0::func_87A4(param_01,param_03);
	level lib_A59A::func_2A31(param_00);
	if(isstring(param_02))
	{
		level notify(param_02);
	}
}

//Function Number: 12
lib_A5F0::func_87A4(param_00,param_01)
{
	param_00 = lib_A5D2::func_F30(0,param_00);
	param_01 = lib_A5D2::func_F30(60,param_01);
	var_02 = floor(param_00);
	var_03 = param_00 - var_02 * 100;
	var_04 = var_02 + var_03 * 1 / param_01;
	wait(var_04);
}

//Function Number: 13
lib_A5F0::func_879F(param_00)
{
	foreach(var_07, var_02 in level.var_78A9)
	{
		if(isstring(var_07) && isarray(var_02))
		{
			foreach(var_06, var_04 in var_02)
			{
				if(isstring(var_06) && !isarray(var_04))
				{
					if(param_00 == var_04)
					{
						var_05 = [];
						var_05["anime"] = var_06;
						var_05["animname"] = var_07;
						return var_05;
					}
				}
			}
		}
	}
}