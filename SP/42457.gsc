/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42457.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:43 PM
*******************************************************************/

//Function Number: 1
lib_A5D9::func_864D()
{
	level.var_55B.var_8F29 = spawnstruct();
	level.var_55B.var_8F29.var_5FF8 = spawnstruct();
	level.var_55B.var_8F29.var_5FF8.var_24CA = lib_A5D9::func_8692();
	level.var_55B.var_8F29.var_5FF8.prev = lib_A5D9::func_8692();
	level.var_55B.var_8F29.var_B16 = spawnstruct();
	level.var_55B.var_8F29.var_B16.var_24CA = lib_A5D9::func_8692();
	level.var_55B.var_8F29.var_B16.prev = lib_A5D9::func_8692();
}

//Function Number: 2
lib_A5D9::func_8650(param_00,param_01,param_02,param_03,param_04)
{
	if(!soundexists(param_00))
	{
		return;
	}

	var_06 = 1;
	if(isdefined(param_01))
	{
		var_06 = max(param_01,0);
	}

	var_07 = 1;
	if(isdefined(param_04))
	{
		var_07 = max(param_04,0);
	}

	lib_A5D9::func_8693(level.var_55B.var_8F29.var_B16.prev,level.var_55B.var_8F29.var_B16.var_24CA.name,level.var_55B.var_8F29.var_B16.var_24CA.var_9F2E,level.var_55B.var_8F29.var_B16.var_24CA.var_35D7);
	lib_A5D9::func_8693(level.var_55B.var_8F29.var_B16.var_24CA,param_00,var_07,var_06);
	function_0122(param_00,var_06,var_07);
}

//Function Number: 3
lib_A5D9::func_864F(param_00,param_01,param_02,param_03,param_04)
{
	if(!soundexists(param_00))
	{
		return;
	}

	var_06 = 1;
	if(isdefined(param_01))
	{
		var_06 = max(param_01,0);
	}

	var_07 = 1;
	if(isdefined(param_02))
	{
		var_07 = param_02;
	}

	var_08 = 1;
	if(isdefined(param_03))
	{
		var_08 = max(param_03,0);
	}

	lib_A5D9::func_8693(level.var_55B.var_8F29.var_5FF8.prev,level.var_55B.var_8F29.var_5FF8.var_24CA.name,level.var_55B.var_8F29.var_5FF8.var_24CA.var_9F2E,level.var_55B.var_8F29.var_5FF8.var_24CA.var_35D7);
	lib_A5D9::func_8693(level.var_55B.var_8F29.var_5FF8.var_24CA,param_00,var_08,var_06);
	if(isdefined(param_04))
	{
		function_0074(var_07,param_04);
		function_0073(param_00,var_06,var_08,0);
		return;
	}

	function_0073(param_00,var_06,var_08);
}

//Function Number: 4
lib_A5D9::func_8652(param_00,param_01)
{
	if(param_00 != "none")
	{
		if(!soundexists(param_00))
		{
			return;
		}

		var_03 = 1;
		if(isdefined(param_01))
		{
			var_03 = max(param_01,0);
		}

		if(level.var_55B.var_8F29.var_B16.var_24CA.name == param_00)
		{
			level.var_55B.var_8F29.var_B16.var_24CA = level.var_55B.var_8F29.var_B16.prev;
			lib_A5D9::func_8691(level.var_55B.var_8F29.var_B16.prev);
		}
		else if(level.var_55B.var_8F29.var_B16.prev.name == param_00)
		{
			lib_A5D9::func_8691(level.var_55B.var_8F29.var_B16.prev);
		}

		function_0142(var_03,param_00);
	}
}

//Function Number: 5
lib_A5D9::func_8654(param_00,param_01)
{
	if(!soundexists(param_00))
	{
		return;
	}

	var_03 = 1;
	if(isdefined(param_01))
	{
		var_03 = max(param_01,0);
	}

	if(level.var_55B.var_8F29.var_5FF8.var_24CA.name == param_00)
	{
		level.var_55B.var_8F29.var_5FF8.var_24CA = level.var_55B.var_8F29.var_5FF8.prev;
		lib_A5D9::func_8691(level.var_55B.var_8F29.var_5FF8.prev);
	}
	else if(level.var_55B.var_8F29.var_B16.prev.name == param_00)
	{
		lib_A5D9::func_8691(level.var_55B.var_8F29.var_5FF8.prev);
	}

	function_0074(var_03,param_00);
}

//Function Number: 6
lib_A5D9::func_8651(param_00)
{
	var_01 = 1;
	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	function_0142(var_01);
}

//Function Number: 7
lib_A5D9::func_8653(param_00)
{
	var_01 = 1;
	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	lib_A5D9::func_8691(level.var_55B.var_8F29.var_5FF8.var_24CA);
	lib_A5D9::func_8691(level.var_55B.var_8F29.var_5FF8.prev);
	function_0074(var_01);
}

//Function Number: 8
lib_A5D9::func_864E(param_00)
{
	var_01 = 0.009;
	if(param_00.size == 1)
	{
		lib_A5D9::func_8693(level.var_55B.var_8F29.var_B16.var_24CA,param_00[0].var_9D6,param_00[0].var_9F2E,param_00[0].var_35D7);
	}
	else if(param_00.size == 2)
	{
		lib_A5D9::func_8693(level.var_55B.var_8F29.var_B16.prev,param_00[0].var_9D6,param_00[0].var_9F2E,param_00[0].var_35D7);
		lib_A5D9::func_8693(level.var_55B.var_8F29.var_B16.var_24CA,param_00[1].var_9D6,param_00[1].var_9F2E,param_00[1].var_35D7);
	}

	for(var_06 = 0;var_06 < param_00.size;var_06++)
	{
		var_07 = param_00[var_06].var_9D6;
		var_08 = max(param_00[var_06].var_9F2E,0);
		var_09 = clamp(param_00[var_06].var_35D7,0,1);
		if(var_07 != "none")
		{
			if(!soundexists(var_07))
			{
				continue;
			}

			if(var_08 < var_01)
			{
				function_0142(var_09,var_07);
				continue;
			}

			function_0122(var_07,var_09,var_08,0);
		}
	}
}

//Function Number: 9
lib_A5D9::func_864B()
{
	return level.var_55B.var_8F29.var_B16.var_24CA.name;
}

//Function Number: 10
lib_A5D9::func_864C()
{
	return level.var_55B.var_8F29.var_5FF8.var_24CA.name;
}

//Function Number: 11
lib_A5D9::func_8693(param_00,param_01,param_02,param_03)
{
	param_00.name = param_01;
	param_00.var_9F2E = param_02;
	param_00.var_35D7 = param_03;
}

//Function Number: 12
lib_A5D9::func_8692()
{
	var_00 = spawnstruct();
	var_00.name = "";
	var_00.var_9F2E = 0;
	var_00.var_35D7 = 0;
	return var_00;
}

//Function Number: 13
lib_A5D9::func_8691(param_00)
{
	param_00.name = "";
	param_00.var_9F2E = 0;
	param_00.var_35D7 = 0;
}