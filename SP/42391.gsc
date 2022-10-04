/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42391.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:25 PM
*******************************************************************/

//Function Number: 1
lib_A597::init()
{
	lib_A597::func_9BAE();
	lib_A597::func_9BAD();
	level thread lib_A597::func_9BAA();
}

//Function Number: 2
lib_A597::func_9BAE()
{
	level.var_9BB3 = [];
	level.var_9BBE = [];
	level.var_9BBF = [];
	level.var_9BB5 = [];
	level.var_9BB7 = [];
	level.var_9BBB = [];
	level.var_9BB9 = [];
	level.var_9BB6 = [];
	level.var_9BB8 = [];
	level.var_9BBC = [];
	level.var_9BBA = [];
	var_00 = 0;
	for(;;)
	{
		var_01 = tablelookupbyrow("sp/upgrade_table.csv",var_00,0);
		if(var_01 == "")
		{
			break;
		}

		var_02 = int(var_01);
		var_03 = tablelookupbyrow("sp/upgrade_table.csv",var_00,1);
		var_04 = tablelookupbyrow("sp/upgrade_table.csv",var_00,5);
		if(var_03 == "" || var_04 == "")
		{
		}
		else
		{
			level.var_9BBF[var_03] = var_02;
			level.var_9BBE[var_02] = var_03;
			level.var_9BB5[var_02] = var_04;
			var_05 = tablelookupbyrow("sp/upgrade_table.csv",var_00,6);
			var_06 = float(tablelookupbyrow("sp/upgrade_table.csv",var_00,7));
			var_07 = float(tablelookupbyrow("sp/upgrade_table.csv",var_00,8));
			if(isdefined(var_05) && var_05 != "" && isdefined(var_06) && isdefined(var_07))
			{
				level.var_9BB7[var_02] = var_05;
				level.var_9BBB[var_02] = var_06;
				level.var_9BB9[var_02] = var_07;
			}

			var_08 = tablelookupbyrow("sp/upgrade_table.csv",var_00,9);
			if(var_08 != "")
			{
				level.var_9BB6[var_02] = var_08;
				var_09 = tablelookupbyrow("sp/upgrade_table.csv",var_00,10);
				var_0A = float(tablelookupbyrow("sp/upgrade_table.csv",var_00,11));
				var_0B = float(tablelookupbyrow("sp/upgrade_table.csv",var_00,12));
				if(isdefined(var_09) && var_09 != "" && isdefined(var_0A) && isdefined(var_0B))
				{
					level.var_9BB8[var_02] = var_09;
					level.var_9BBC[var_02] = var_0A;
					level.var_9BBA[var_02] = var_0B;
				}
			}

			if(var_04 != "")
			{
				level.var_9BB3[var_02] = ::lib_A597::func_9BB4;
			}
		}

		var_00++;
	}
}

//Function Number: 3
lib_A597::func_9BAA()
{
	self notify("upgrade_change_monitor");
	self endon("upgrade_change_monitor");
	setdvarifuninitialized("upgrades_changed",0);
	for(;;)
	{
		if(getdvarint("upgrades_changed"))
		{
			setdvar("upgrades_changed",0);
			lib_A597::func_9BAD();
		}

		wait(0.25);
	}
}

//Function Number: 4
lib_A597::func_9BAD()
{
	foreach(var_01 in level.var_328)
	{
		var_01 thread lib_A597::func_9BAC();
	}
}

//Function Number: 5
lib_A597::func_9BAC()
{
	foreach(var_01 in level.var_9BBF)
	{
		lib_A597::func_9BC0(level.var_9BBE[var_01]);
	}

	foreach(var_01 in level.var_9BBF)
	{
		if(lib_A598::func_9BB1(var_01))
		{
			lib_A597::func_9BAB(level.var_9BBE[var_01]);
		}
	}
}

//Function Number: 6
lib_A597::func_9BBD(param_00,param_01)
{
	switch(param_00)
	{
		case "specialty_detectexplosive":
			break;

		case "specialty_detectintel":
			break;

		case "specialty_extended_battery":
			break;

		case "specialty_extended_battery2":
			break;

		case "specialty_extendeddetectgren":
			break;
	}
}

//Function Number: 7
lib_A597::func_9BB4(param_00,param_01)
{
	if(param_01)
	{
		lib_A597::func_9BBD(level.var_9BB5[param_00],1);
		self setperk(level.var_9BB5[param_00],1,0);
		if(isdefined(level.var_9BB7[param_00]))
		{
			function_00D3(level.var_9BB7[param_00],level.var_9BB9[param_00]);
		}

		if(isdefined(level.var_9BB6[param_00]))
		{
			self setperk(level.var_9BB6[param_00],1,0);
			if(isdefined(level.var_9BB8[param_00]))
			{
				function_00D3(level.var_9BB8[param_00],level.var_9BBA[param_00]);
				return;
			}

			return;
		}

		return;
	}

	lib_A597::func_9BBD(level.var_9BB5[param_00],0);
	self unsetperk(level.var_9BB5[param_00],1);
	if(isdefined(level.var_9BB7[param_00]))
	{
		function_00D3(level.var_9BB7[param_00],level.var_9BBB[param_00]);
	}

	if(isdefined(level.var_9BB6[param_00]))
	{
		self unsetperk(level.var_9BB6[param_00],1);
		if(isdefined(level.var_9BB8[param_00]))
		{
			function_00D3(level.var_9BB8[param_00],level.var_9BBC[param_00]);
			return;
		}
	}
}

//Function Number: 8
lib_A597::func_9BAB(param_00)
{
	var_01 = level.var_9BBF[param_00];
	if(isdefined(level.var_9BB3[var_01]))
	{
		self [[ level.var_9BB3[var_01] ]](var_01,1);
	}

	self notify("give_perk",param_00);
}

//Function Number: 9
lib_A597::func_9BC0(param_00)
{
	var_01 = level.var_9BBF[param_00];
	if(isdefined(level.var_9BB3[var_01]))
	{
		self [[ level.var_9BB3[var_01] ]](var_01,0);
	}

	self notify("take_perk",param_00);
}