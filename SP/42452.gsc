/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42452.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 18
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:43 PM
*******************************************************************/

//Function Number: 1
lib_A5D4::func_5CF7()
{
	if(!isdefined(level.var_55B))
	{
		level.var_55B = spawnstruct();
	}

	if(!isdefined(level.var_55B.var_5CE5))
	{
		level.var_55B.var_5CE5 = spawnstruct();
	}

	level.var_55B.var_5CE5.var_24D1 = undefined;
	level.var_55B.var_5CE5.var_A3EA = [];
}

//Function Number: 2
lib_A5D4::func_5CFD(param_00,param_01)
{
	if(!isdefined(level.var_55B.var_5CE5.var_24D1) || param_00 != level.var_55B.var_5CE5.var_24D1)
	{
		function_0078(0);
		if(isdefined(param_01))
		{
			function_0076(param_00,param_01);
		}
		else
		{
			function_0076(param_00);
		}

		level.var_55B.var_5CE5.var_24D1 = param_00;
	}
}

//Function Number: 3
lib_A5D4::func_5CFE(param_00)
{
	foreach(var_02 in level.var_55B.var_5CE5.var_A3EA)
	{
		if(param_00 != var_02)
		{
			function_007B(var_02);
			function_0077(var_02,1);
			level.var_55B.var_5CE5.var_A3EA[var_02] = undefined;
		}
	}

	lib_A5D4::func_5CFF(param_00);
}

//Function Number: 4
lib_A5D4::func_5CF6(param_00,param_01)
{
	var_02 = 1;
	if(isdefined(param_01))
	{
		var_02 = param_01;
	}

	if(!isdefined(param_00))
	{
		foreach(param_00 in level.var_55B.var_5CE5.var_A3EA)
		{
			function_007B(param_00);
			function_0077(param_00,var_02);
			level.var_55B.var_5CE5.var_A3EA[param_00] = undefined;
		}

		return;
	}

	if(isdefined(level.var_55B.var_5CE5.var_A3EA[param_00]))
	{
		function_007B(param_00);
		function_0077(param_00,var_02);
		level.var_55B.var_5CE5.var_A3EA[param_00] = undefined;
	}
}

//Function Number: 5
lib_A5D4::func_5CF1(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_00) && param_00 != "none")
	{
		if(param_01 == 0)
		{
			lib_A5D4::func_5CF6(param_00,0);
		}
		else
		{
			lib_A5D4::func_5CFF(param_00);
			function_0079(param_00,param_01,0);
		}
	}

	if(isdefined(param_02) && param_02 != "none")
	{
		if(param_03 == 0)
		{
			lib_A5D4::func_5CF6(param_02,0);
			return;
		}

		lib_A5D4::func_5CFF(param_02);
		function_0079(param_02,param_03,0);
	}
}

//Function Number: 6
lib_A5D4::func_5CF4(param_00)
{
	function_0078(param_00);
	level.var_55B.var_5CE5.var_24D1 = undefined;
}

//Function Number: 7
lib_A5D4::func_5CF8(param_00)
{
	function_007A(param_00);
}

//Function Number: 8
lib_A5D4::func_5CF9(param_00)
{
	function_007B(param_00);
}

//Function Number: 9
lib_A5D4::func_5CEF(param_00,param_01)
{
	if(isdefined(param_01))
	{
		function_0076(param_00,param_01);
		return;
	}

	function_0076(param_00);
}

//Function Number: 10
lib_A5D4::func_5CFB(param_00,param_01,param_02)
{
	var_03 = 0;
	if(isdefined(param_02))
	{
		var_03 = param_02;
	}

	function_0076(param_00,var_03,param_01);
}

//Function Number: 11
lib_A5D4::func_5CF0(param_00,param_01,param_02)
{
	param_01 = clamp(param_01,0,1);
	var_03 = 0;
	if(isdefined(param_02))
	{
		var_03 = param_02;
	}

	function_0079(param_00,param_01,var_03);
}

//Function Number: 12
lib_A5D4::func_5CF3(param_00,param_01)
{
	if(isdefined(param_01))
	{
		function_0077(param_00,param_01);
	}
	else
	{
		function_0077(param_00);
	}

	if(isdefined(level.var_55B.var_5CE5.var_24D1) && level.var_55B.var_5CE5.var_24D1 == param_00)
	{
		level.var_55B.var_5CE5.var_24D1 = undefined;
	}
}

//Function Number: 13
lib_A5D4::func_5CEE(param_00,param_01,param_02)
{
	var_03 = 0;
	if(isdefined(param_02))
	{
		var_03 = param_02;
	}

	function_0076(param_00,var_03,1,param_01);
}

//Function Number: 14
lib_A5D4::func_5CFA(param_00,param_01)
{
	var_02 = [];
	if(isstring(param_00))
	{
		var_02[var_02.size] = param_00;
		var_02[var_02.size] = 0;
	}
	else
	{
		foreach(var_04 in param_00)
		{
			var_02[var_02.size] = var_04;
			var_02[var_02.size] = 0;
		}
	}

	lib_A5D4::func_5CEE("mm_mute",var_02,param_01);
}

//Function Number: 15
lib_A5D4::func_5CF5(param_00)
{
	if(isdefined(param_00))
	{
		function_0077("mm_mute",param_00);
		return;
	}

	function_0077("mm_mute");
}

//Function Number: 16
lib_A5D4::func_5CFC(param_00,param_01)
{
	var_02 = [];
	var_02[var_02.size] = "set_all";
	var_02[var_02.size] = 0;
	if(isstring(param_00))
	{
		var_02[var_02.size] = param_00;
		var_02[var_02.size] = 1;
	}
	else
	{
		foreach(var_04 in param_00)
		{
			var_02[var_02.size] = var_04;
			var_02[var_02.size] = 1;
		}
	}

	lib_A5D4::func_5CEE("mm_solo",var_02,param_01);
}

//Function Number: 17
lib_A5D4::func_5CF2(param_00)
{
	if(isdefined(param_00))
	{
		function_0077("mm_solo",param_00);
		return;
	}

	function_0077("mm_solo");
}

//Function Number: 18
lib_A5D4::func_5CFF(param_00)
{
	if(!isdefined(level.var_55B.var_5CE5.var_A3EA[param_00]))
	{
		function_0076(param_00);
		function_007A(param_00);
		level.var_55B.var_5CE5.var_A3EA[param_00] = param_00;
	}
}