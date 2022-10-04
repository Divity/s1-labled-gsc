/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42254.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:22:03 PM
*******************************************************************/

//Function Number: 1
lib_A50E::func_1C32(param_00,param_01,param_02,param_03,param_04)
{
	level endon(param_00);
	if(isdefined(param_01))
	{
		lib_A50E::func_1C33(param_01);
	}

	if(isdefined(param_04))
	{
		lib_A50E::func_1C23(param_04);
	}

	var_05 = lib_A56C::func_77FE();
	if(isdefined(param_03) && param_03 == 1)
	{
		thread lib_A50E::func_268E(param_00);
	}

	for(;;)
	{
		wait(0.2);
		var_05 lib_A56C::func_77F5();
		var_06 = function_00D6();
		foreach(var_08 in var_06)
		{
			if(!isdefined(var_08.var_6090) && var_08.inliveplayerkillstreak == "allies")
			{
				var_08.var_6090 = 1;
			}

			if(!isdefined(var_08.var_6090) && var_08.inliveplayerkillstreak != "allies")
			{
				var_08.var_6090 = 0;
			}

			if(isdefined(var_08.var_6090) && var_08.var_6090 == 0)
			{
				var_05 lib_A56C::func_77FB(var_08);
			}
		}

		var_0A = var_06.size;
		if(var_0A > param_02)
		{
			lib_A50E::func_7886(var_05);
			var_0B = var_0A - param_02;
			foreach(var_0D in var_05.var_CD8)
			{
				if(var_0B == 0)
				{
					break;
				}

				if(isalive(var_0D) && isdefined(var_0D.var_58D4))
				{
					var_0D lib_A59A::func_8E9E();
				}

				if(var_0D.var_2855 == 1)
				{
					var_0D delete();
				}
				else
				{
					var_0D method_8052();
				}

				var_0B--;
				wait(0.05);
			}
		}
	}
}

//Function Number: 2
lib_A50E::func_1C33(param_00)
{
	foreach(var_02 in param_00)
	{
		lib_A59A::func_D0C(var_02,::lib_A50E::func_94AE);
	}
}

//Function Number: 3
lib_A50E::func_1C23(param_00)
{
	foreach(var_02 in param_00)
	{
		lib_A59A::func_D0C(var_02,::lib_A50E::func_802F);
	}
}

//Function Number: 4
lib_A50E::func_7886(param_00)
{
	foreach(var_02 in param_00.var_CD8)
	{
		var_02.var_536C = 0;
		if(!isdefined(var_02.var_56F6))
		{
			var_02.var_56F6 = 0;
		}

		if(!isdefined(var_02.var_2855))
		{
			var_02 thread lib_A50E::func_94F8();
		}

		var_02.var_536C = var_02.var_536C + var_02.var_56F6;
		if(!lib_A50E::func_1D1D(level.var_31D,var_02))
		{
			var_02.var_536C = var_02.var_536C + 10;
		}

		var_03 = level.var_31D geteye();
		if(var_02 sightconetrace(var_03) == 0)
		{
			var_02.var_536C = var_02.var_536C + 10;
		}
		else
		{
			var_02.var_536C = var_02.var_536C - var_02.var_56F6;
		}

		var_04 = distance(var_02.var_2E6,level.var_31D.var_2E6);
		if(var_04 > 1024)
		{
			var_02.var_536C = var_02.var_536C + 10;
		}
	}

	lib_A56C::func_77FD(param_00,lib_A56C::func_77F7(::lib_A50E::func_20C3));
}

//Function Number: 5
lib_A50E::func_94AE()
{
	self endon("death");
	self.var_56F6 = 0;
	for(;;)
	{
		wait(0.5);
		self.var_56F6 = self.var_56F6 + 0.5;
	}
}

//Function Number: 6
lib_A50E::func_94F8()
{
	self endon("death");
	self.var_2855 = 1;
	for(;;)
	{
		var_00 = level.var_31D geteye();
		if(self sightconetrace(var_00) == 1)
		{
			self.var_2855 = 0;
			return;
		}

		wait(0.2);
	}
}

//Function Number: 7
lib_A50E::func_20C8(param_00,param_01)
{
	if(!isdefined(param_00.var_56F6))
	{
		param_00.var_56F6 = 0;
	}

	if(!isdefined(param_01.var_56F6))
	{
		param_01.var_56F6 = 0;
	}

	return param_00.var_56F6 > param_01.var_56F6;
}

//Function Number: 8
lib_A50E::func_20C3(param_00,param_01)
{
	return param_00.var_536C > param_01.var_536C;
}

//Function Number: 9
lib_A50E::func_1D1D(param_00,param_01)
{
	var_02 = anglestoforward(param_00.var_41);
	var_03 = param_01.var_2E6 - param_00.var_2E6;
	var_04 = vectordot(var_02,var_03);
	return var_04 > 0;
}

//Function Number: 10
lib_A50E::func_802F()
{
	self.var_6090 = 1;
}

//Function Number: 11
lib_A50E::func_268E(param_00)
{
	level endon(param_00);
	var_01 = lib_A50E::func_8307();
	thread lib_A50E::func_2848(param_00,var_01);
	for(;;)
	{
		wait(0.05);
		var_02 = function_00D6();
		var_01 settext("" + var_02.size);
		foreach(var_04 in var_02)
		{
			var_05 = (0,1,0);
			if(isdefined(var_04.inliveplayerkillstreak) && var_04.inliveplayerkillstreak != "allies")
			{
				var_05 = (1,0,0);
			}
		}
	}
}

//Function Number: 12
lib_A50E::func_2848(param_00,param_01)
{
	level waittill(param_00);
	param_01 destroy();
}

//Function Number: 13
lib_A50E::func_8307()
{
	var_00 = newhudelem();
	var_00.alignx = "left";
	var_00.aligny = "top";
	var_00.x = 40;
	var_00.y = 40;
	var_00.alpha = 0.6;
	var_00.var_18C = 1.5;
	var_00.foreground = 1;
	var_00.horzalign = "fullscreen";
	var_00.vertalign = "fullscreen";
	return var_00;
}