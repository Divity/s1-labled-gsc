/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42546.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:49 PM
*******************************************************************/

//Function Number: 1
lib_A632::func_186D()
{
	var_00 = spawnstruct();
	var_00.var_9310 = undefined;
	var_00.var_931E = 0;
	self.var_2EDD = var_00;
}

//Function Number: 2
lib_A632::func_67B3()
{
	self notify("pdrone_update_threat_sensor");
	self endon("pdrone_update_threat_sensor");
	self endon("death");
	self endon("emp_death");
	var_00 = "allies";
	if(self.var_7AE9 == "allies")
	{
		var_00 = "axis";
	}

	for(;;)
	{
		wait(0.05);
		if(lib_A59A::func_32D7("fire_disabled") || isdefined(self.var_2EA) && self.var_2EA || isdefined(self.ignoreall) && self.ignoreall)
		{
			self.var_2EDD.var_9310 = undefined;
			continue;
		}

		if(isdefined(self.favoriteenemy))
		{
			self.var_2EDD.var_9310 = self.favoriteenemy;
			continue;
		}

		var_01 = function_00D6(var_00);
		if(self.var_7AE9 == "axis")
		{
			var_01 = common_scripts\utility::array_add(var_01,level.var_31D);
		}

		var_02 = undefined;
		var_03 = -1;
		foreach(var_05 in var_01)
		{
			wait(0.05);
			var_06 = lib_A632::func_19D6(self.var_2EDD,var_05);
			if(var_06 > var_03)
			{
				var_03 = var_06;
				var_02 = var_05;
			}
		}

		self.var_2EDD.var_9310 = var_02;
	}
}

//Function Number: 3
lib_A632::func_19D6(param_00,param_01)
{
	var_02 = 0;
	var_03[0] = ::lib_A632::func_33AE;
	var_03[1] = ::lib_A632::func_33AD;
	var_03[2] = ::lib_A632::func_33AC;
	var_03[3] = ::lib_A632::func_33AA;
	var_03[4] = ::lib_A632::func_33AB;
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_05 = self [[ var_03[var_04] ]](param_01);
		if(var_05 < 0)
		{
			return -1;
		}

		var_02 = var_02 + var_05;
	}

	return var_02 / var_03.size;
}

//Function Number: 4
lib_A632::func_33AE(param_00)
{
	if(!isdefined(param_00) || !isalive(param_00))
	{
		return -1;
	}

	if(isdefined(param_00.ignoreme) && param_00.ignoreme == 1)
	{
		return -1;
	}

	return 1;
}

//Function Number: 5
lib_A632::func_33AB(param_00)
{
	if(self.var_7AE9 == "allies")
	{
		return 1;
	}

	var_01 = self.var_2E6;
	if(self method_8442("tag_flash") != -1)
	{
		var_01 = self gettagorigin("tag_flash");
	}

	if(lib_A632::func_948D(var_01,param_00,undefined))
	{
		if(param_00 == level.var_31D)
		{
			self.var_2EDD.var_931E = self.var_2EDD.var_931E + 0.05;
		}

		return 1;
	}

	if(param_00 == level.var_31D)
	{
		self.var_2EDD.var_931E = 0;
	}

	return -1;
}

//Function Number: 6
lib_A632::func_33AD(param_00)
{
	var_01 = length(param_00.var_2E6 - self.var_2E6);
	var_02 = max(1 - var_01 / 3000,0);
	return var_02;
}

//Function Number: 7
lib_A632::func_33AC(param_00)
{
	if(!isplayer(param_00))
	{
		return 0.8;
	}

	return 1;
}

//Function Number: 8
lib_A632::func_33AA(param_00)
{
	if(self.var_7AE9 == "axis")
	{
		return 1;
	}

	if(lib_A59A::func_8436(self.var_2E6,param_00.var_2E6))
	{
		return -1;
	}

	return 1;
}

//Function Number: 9
lib_A632::func_948D(param_00,param_01,param_02)
{
	var_03 = bullettrace(param_00,param_01 geteye(),0,param_02,0,0,0,0,0);
	if(isdefined(var_03["entity"]) && var_03["entity"] lib_A59E::func_51FA())
	{
		if(isdefined(var_03["entity"].vehicletype) && var_03["entity"].vehicletype == "pdrone")
		{
			return 1;
		}

		var_04 = var_03["entity"] veh_getvehicleowner();
		if(isdefined(var_04) && var_04 == param_01)
		{
			return 1;
		}
	}

	return var_03["fraction"] == 1;
}