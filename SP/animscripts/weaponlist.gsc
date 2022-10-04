/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: weaponlist.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 327 ms
 * Timestamp: 4/20/2022 8:21:00 PM
*******************************************************************/

//Function Number: 1
func_9C24()
{
	return weaponisauto(self.weapon) || weaponburstcount(self.weapon) > 0;
}

//Function Number: 2
func_9C30()
{
	return weaponissemiauto(self.weapon);
}

//Function Number: 3
func_116C()
{
	if(func_9C24())
	{
		return 0.1 / weaponfiretime(self.weapon);
	}

	return 0.5;
}

//Function Number: 4
func_1934()
{
	if(func_9C24())
	{
		return 0.1 / weaponfiretime(self.weapon);
	}

	return 0.2;
}

//Function Number: 5
func_9FFB()
{
	return 0.25;
}

//Function Number: 6
func_83E3(param_00)
{
	if(!func_9C24() || isdefined(param_00) && param_00 == 1)
	{
		var_01 = 0.5 + randomfloat(1);
		return weaponfiretime(self.weapon) * var_01;
	}

	return weaponfiretime(self.weapon);
}

//Function Number: 7
func_72AE()
{
	if(self.weapon == "none")
	{
		self.var_18B0 = 0;
		return 0;
	}

	if(!isdefined(self.var_18B0))
	{
		self.var_18B0 = weaponclipsize(self.weapon);
	}
	else
	{
		self.var_18B0 = weaponclipsize(self.weapon);
	}

	if(self.var_18B0 <= 0)
	{
		return 0;
	}

	return 1;
}

//Function Number: 8
func_07C1(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_02))
	{
		param_02 = 3;
	}

	if(!isdefined(param_03))
	{
		param_02 = 1;
	}

	if(!isdefined(param_04))
	{
		param_04 = "rifle";
	}

	param_00 = tolower(param_00);
	level.var_9AC[param_00]["type"] = param_01;
	level.var_9AC[param_00]["time"] = param_02;
	level.var_9AC[param_00]["clipsize"] = param_03;
	level.var_9AC[param_00]["anims"] = param_04;
}

//Function Number: 9
func_0857(param_00)
{
	level.var_9AC[tolower(param_00)]["type"] = "turret";
}