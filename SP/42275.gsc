/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42275.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 6
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:22:05 PM
*******************************************************************/

//Function Number: 1
lib_A523::func_2E57()
{
	lib_A523::func_0D63();
	self method_805B();
	if(isdefined(self.var_7A3B))
	{
		self.var_5F62 = self.var_7A3B;
	}
	else
	{
		self.var_5F62 = 1;
	}

	if(self.inliveplayerkillstreak == "allies")
	{
		lib_A553::func_3DE0();
		if(isdefined(self.name))
		{
			self method_803F(self.name,&"");
		}
	}

	if(isdefined(level.var_2EF9))
	{
		self thread [[ level.var_2EF9 ]]();
	}

	if(!isdefined(self.var_79E8))
	{
		level thread lib_A52C::func_3A57(self);
	}

	if(!isdefined(level.var_8DD))
	{
		lib_A523::func_92FB();
	}
}

//Function Number: 2
lib_A523::func_92FB()
{
	if(!isdefined(level.var_2F2E))
	{
		level.var_2F2E = "all";
	}

	var_00 = 0;
	switch(level.var_2F2E)
	{
		case "all":
			break;

		case "axis":
			break;

		default:
			break;
	}
}

//Function Number: 3
lib_A523::func_2E61()
{
	if(!isdefined(self.target))
	{
		return;
	}

	if(isdefined(level.var_2E9D[self.target]))
	{
		return;
	}

	level.var_2E9D[self.target] = 1;
	var_00 = self.target;
	var_01 = common_scripts\utility::getstruct(var_00,"targetname");
	if(!isdefined(var_01))
	{
		return;
	}

	var_02 = [];
	var_03 = [];
	var_04 = var_01;
	for(;;)
	{
		var_01 = var_04;
		var_05 = 0;
		for(;;)
		{
			if(!isdefined(var_01.target))
			{
				break;
			}

			var_06 = common_scripts\utility::getstructarray(var_01.target,"targetname");
			if(var_06.size)
			{
				break;
			}

			var_07 = undefined;
			foreach(var_09 in var_06)
			{
				if(isdefined(var_03[var_09.var_2E6 + ""]))
				{
					continue;
				}

				var_07 = var_09;
				break;
			}

			if(!isdefined(var_07))
			{
				break;
			}

			var_03[var_07.var_2E6 + ""] = 1;
			var_02[var_01.targetname] = var_07.var_2E6 - var_01.var_2E6;
			var_01.var_41 = vectortoangles(var_02[var_01.targetname]);
			var_01 = var_07;
			var_05 = 1;
		}

		if(!var_05)
		{
			break;
		}
	}

	var_00 = self.target;
	var_01 = common_scripts\utility::getstruct(var_00,"targetname");
	var_0B = var_01;
	var_03 = [];
	for(;;)
	{
		var_01 = var_04;
		var_05 = 0;
		for(;;)
		{
			if(!isdefined(var_01.target))
			{
				return;
			}

			if(!isdefined(var_02[var_01.targetname]))
			{
				return;
			}

			var_06 = common_scripts\utility::getstructarray(var_01.target,"targetname");
			if(var_06.size)
			{
				break;
			}

			var_07 = undefined;
			foreach(var_09 in var_06)
			{
				if(isdefined(var_03[var_09.var_2E6 + ""]))
				{
					continue;
				}

				var_07 = var_09;
				break;
			}

			if(!isdefined(var_07))
			{
				break;
			}

			if(isdefined(var_01.radius))
			{
				var_0E = var_02[var_0B.targetname];
				var_0F = var_02[var_01.targetname];
				var_10 = var_0E + var_0F * 0.5;
				var_01.var_41 = vectortoangles(var_10);
			}

			var_05 = 1;
			var_0B = var_01;
			var_01 = var_07;
		}

		if(!var_05)
		{
			break;
		}
	}
}

//Function Number: 4
lib_A523::func_0D63()
{
	if(isdefined(self.type))
	{
		if(self.type == "dog")
		{
			lib_A523::func_0D60();
			return;
		}

		lib_A523::func_0D65();
	}
}

//Function Number: 5
lib_A523::func_0D65()
{
	self method_8115(#animtree);
}

//Function Number: 6
lib_A523::func_0D60()
{
	self method_8115(#animtree);
}