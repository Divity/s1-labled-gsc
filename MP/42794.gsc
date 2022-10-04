/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42794.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 7
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:18:17 PM
*******************************************************************/

//Function Number: 1
lib_A72A::init()
{
	var_00 = getentarray("destructable","targetname");
	if(getdvar("scr_destructables") == "0")
	{
		for(var_01 = 0;var_01 < var_00.size;var_01++)
		{
			var_00[var_01] delete();
		}

		return;
	}

	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_00[var_01] thread lib_A72A::destructable_think();
	}
}

//Function Number: 2
lib_A72A::destructable_think()
{
	var_00 = 40;
	var_01 = 0;
	if(isdefined(self.script_accumulate))
	{
		var_00 = self.script_accumulate;
	}

	if(isdefined(self.script_threshold))
	{
		var_01 = self.script_threshold;
	}

	if(isdefined(self.script_destructable_area))
	{
		var_02 = strtok(self.script_destructable_area," ");
		for(var_03 = 0;var_03 < var_02.size;var_03++)
		{
			lib_A72A::blockarea(var_02[var_03]);
		}
	}

	if(isdefined(self.script_fxid))
	{
		self.fx = loadfx(self.script_fxid);
	}

	var_04 = 0;
	self setcandamage(1);
	for(;;)
	{
		self waittill("damage",var_05,var_06);
		if(var_05 >= var_01)
		{
			var_04 = var_04 + var_05;
			if(var_04 >= var_00)
			{
				thread lib_A72A::destructable_destruct();
				return;
			}
		}
	}
}

//Function Number: 3
lib_A72A::destructable_destruct()
{
	var_00 = self;
	if(isdefined(self.script_destructable_area))
	{
		var_01 = strtok(self.script_destructable_area," ");
		for(var_02 = 0;var_02 < var_01.size;var_02++)
		{
			lib_A72A::unblockarea(var_01[var_02]);
		}
	}

	if(isdefined(var_00.fx))
	{
		playfx(var_00.fx,var_00.var_2E6 + (0,0,6));
	}

	var_00 delete();
}

//Function Number: 4
lib_A72A::blockarea(param_00)
{
}

//Function Number: 5
lib_A72A::blockentsinarea(param_00,param_01)
{
}

//Function Number: 6
lib_A72A::unblockarea(param_00)
{
}

//Function Number: 7
lib_A72A::unblockentsinarea(param_00,param_01)
{
}