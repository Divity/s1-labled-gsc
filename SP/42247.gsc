/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42247.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 7
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:22:02 PM
*******************************************************************/

//Function Number: 1
lib_A507::main()
{
	waittillframeend;
	lib_A507::func_4D76();
	level.var_4C75 = [];
	level.var_BED = #animtree;
	if(!isdefined(level.anim_prop_models))
	{
		level.anim_prop_models = [];
	}

	if(!isdefined(level.var_BEB))
	{
		level.var_BEB = [];
	}

	var_00 = getentarray("animated_model","targetname");
	common_scripts\utility::array_thread(var_00,::lib_A507::func_5D38);
	if(isdefined(level.var_4C75) && level.var_4C75.size)
	{
		var_01 = " ";
		foreach(var_03 in level.var_4C75)
		{
			var_01 = var_01 + var_03 + " ";
		}
	}

	foreach(var_06 in var_00)
	{
		if(isdefined(level.var_BEB[var_06.model]))
		{
			var_06 thread [[ level.var_BEB[var_06.model] ]]();
			continue;
		}

		var_07 = getarraykeys(level.anim_prop_models[var_06.model]);
		var_08 = 0;
		foreach(var_0A in var_07)
		{
			if(var_0A == "still")
			{
				var_08 = 1;
				break;
			}
		}

		if(var_08)
		{
			var_06 thread lib_A507::func_0C66();
		}
		else
		{
			var_06 thread lib_A507::animatemodel();
		}
	}
}

//Function Number: 2
lib_A507::func_4D76()
{
	if(isdefined(level.var_A323))
	{
		return;
	}

	level.var_A323 = spawnstruct();
	level.var_A323.rate = 0.4;
	level.var_A323.weight = 1;
	level.var_A323.var_9C5D = 0.2;
}

//Function Number: 3
lib_A507::func_5D38()
{
	if(!isdefined(level.anim_prop_models[self.model]))
	{
		if(!lib_A507::func_0AFB(level.var_4C75,self.model))
		{
			level.var_4C75[level.var_4C75.size] = self.model;
		}
	}
}

//Function Number: 4
lib_A507::func_0AFB(param_00,param_01)
{
	if(param_00.size <= 0)
	{
		return 0;
	}

	foreach(var_03 in param_00)
	{
		if(var_03 == param_01)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 5
lib_A507::animatemodel()
{
	self method_8115(#animtree);
	var_00 = getarraykeys(level.anim_prop_models[self.model]);
	var_01 = var_00[randomint(var_00.size)];
	var_02 = level.anim_prop_models[self.model][var_01];
	self method_814B(var_02,1,self method_814F(var_02),1);
	self method_8117(var_02,randomfloatrange(0,1));
}

//Function Number: 6
lib_A507::func_0C66()
{
	self method_8115(#animtree);
	var_00 = "strong";
	for(;;)
	{
		thread lib_A507::func_14A6(var_00);
		level waittill("windchange",var_00);
	}
}

//Function Number: 7
lib_A507::func_14A6(param_00)
{
	level endon("windchange");
	var_01 = level.var_A323.weight;
	var_02 = level.var_A323.rate + randomfloat(level.var_A323.var_9C5D);
	self method_814B(level.anim_prop_models[self.model]["still"],1,self method_814F(level.anim_prop_models[self.model]["still"]),var_02);
	self method_814B(level.anim_prop_models[self.model][param_00],var_01,self method_814F(level.anim_prop_models[self.model][param_00]),var_02);
}