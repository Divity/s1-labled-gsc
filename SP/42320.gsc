/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42320.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 6
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:19 PM
*******************************************************************/

//Function Number: 1
lib_A550::init()
{
	precacheitem("iw5_microdronelauncher_sp");
	foreach(var_01 in level.var_328)
	{
		var_01 thread lib_A550::func_5DBB();
	}
}

//Function Number: 2
lib_A550::func_5DBB()
{
	self endon("death");
	for(;;)
	{
		self waittill("missile_fire",var_00,var_01);
		if(issubstr(var_01,"microdronelauncher"))
		{
			if(issubstr(var_01,"smartgrenade"))
			{
				var_00 thread lib_A59D::func_94C9(self);
				continue;
			}

			var_00 thread lib_A550::func_5BFC(self);
		}
	}
}

//Function Number: 3
lib_A550::func_5BFC(param_00)
{
	self endon("death");
	var_01 = self.var_2E6;
	lib_A571::func_3D3C();
	wait(0.05);
	lib_A571::func_3D3C();
	wait(0.05);
	var_02 = 0.1;
	var_03 = lib_A571::func_3D3C();
	for(;;)
	{
		var_04 = lib_A571::func_3D3C();
		var_05 = 0;
		if(var_02 >= 0.35)
		{
			var_06 = lib_A550::func_5BF9(var_01,vectornormalize(var_03),var_04,param_00);
			if(isdefined(var_06))
			{
				self missilesettargetpos(lib_A550::func_5BFB(var_06));
				var_05 = 1;
				var_03 = var_04;
			}
		}
		else
		{
		}

		if(!var_05)
		{
			var_07 = vectornormalize(var_03 + (0,0,-400 * squared(var_02)));
			self missilesettargetpos(self.var_2E6 + var_07 * 10000);
		}

		wait(0.05);
		var_02 = var_02 + 0.05;
	}
}

//Function Number: 4
lib_A550::func_5BF9(param_00,param_01,param_02,param_03)
{
	var_04 = cos(15);
	var_05 = undefined;
	var_06 = cos(15);
	foreach(var_08 in common_scripts\utility::array_combine(function_00D6("axis"),veh_getarray()))
	{
		if(lib_A550::func_501C(var_08,param_03) && !isdefined(var_08.var_6F2F))
		{
			var_09 = lib_A550::func_5BFB(var_08);
			var_0A = vectordot(vectornormalize(param_02),vectornormalize(var_09 - self.var_2E6));
			if(var_0A > var_06)
			{
				if(bullettracepassed(self.var_2E6,var_09,0,var_08))
				{
					var_05 = var_08;
					var_06 = var_0A;
				}
				else
				{
				}
			}
		}
	}

	return var_05;
}

//Function Number: 5
lib_A550::func_501C(param_00,param_01)
{
	var_02 = undefined;
	if(isai(param_00))
	{
		var_02 = param_00.inliveplayerkillstreak;
	}
	else if(isdefined(param_00.var_7AE9))
	{
		var_02 = param_00.var_7AE9;
	}

	return isenemyteam(var_02,param_01.inliveplayerkillstreak);
}

//Function Number: 6
lib_A550::func_5BFB(param_00)
{
	return param_00 method_8097();
}