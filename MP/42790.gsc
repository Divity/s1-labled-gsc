/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42790.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:18:17 PM
*******************************************************************/

//Function Number: 1
lib_A726::resolvebraggingrights()
{
	var_00 = lib_A726::getnumbraggingrights();
	var_01 = [];
	for(var_02 = 0;var_02 < var_00;var_02++)
	{
		var_01[var_02] = [];
	}

	foreach(var_04 in level.var_328)
	{
		if(isalive(var_04))
		{
			var_05 = var_04 method_83B7();
			if(var_05 < var_00)
			{
				var_06 = var_01[var_05].size;
				var_01[var_05][var_06] = var_04;
			}
		}
	}

	foreach(var_02, var_05 in var_01)
	{
		if(var_05.size > 1)
		{
			var_09 = tablelookupbyrow("mp/braggingrights.csv",var_02,2);
			var_0A = undefined;
			var_0B = undefined;
			foreach(var_0D in var_05)
			{
				var_0E = var_0D maps\mp\_utility::getplayerstat(var_09);
				if(!isdefined(var_0A) || var_0E > var_0A)
				{
					var_0B = var_0D;
					var_0A = var_0E;
				}
			}

			foreach(var_0D in var_05)
			{
				if(var_0D == var_0B)
				{
					if(!isdefined(var_0D.var_59DC))
					{
						var_0D.var_59DC = 0;
					}

					var_11 = 0;
					foreach(var_04 in var_05)
					{
						if(isdefined(var_04.var_59DC))
						{
							var_11 = var_11 + var_04.var_59DC;
						}
					}

					var_0D.var_59DC = var_0D.var_59DC + var_11;
					continue;
				}

				var_0D.braggingrightsloser = 1;
			}
		}
	}

	foreach(var_04 in level.var_328)
	{
		if(isdefined(var_04.braggingrightsloser) && var_04.braggingrightsloser)
		{
			var_04.var_59DC = 0;
		}
	}
}

//Function Number: 2
lib_A726::getnumbraggingrights()
{
	var_00 = -1;
	var_01 = "temp";
	while(var_01 != "")
	{
		var_00++;
		var_01 = tablelookupbyrow("mp/braggingrights.csv",var_00,0);
	}

	return var_00;
}