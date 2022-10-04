/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42287.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:16 PM
*******************************************************************/

//Function Number: 1
lib_A52F::global_fx(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(level._effect))
	{
		level._effect = [];
	}

	level.global_fx[param_00] = param_03;
	var_05 = lib_A59A::func_40FC(param_00,"targetname");
	if(!isdefined(var_05))
	{
		return;
	}

	if(!var_05.size)
	{
		return;
	}

	if(!isdefined(param_03))
	{
		param_03 = param_01;
	}

	if(!isdefined(param_02))
	{
		param_02 = randomfloatrange(-20,-15);
	}

	foreach(var_07 in var_05)
	{
		if(!isdefined(level._effect[param_03]))
		{
			level._effect[param_03] = loadfx(param_01);
		}

		if(!isdefined(var_07.var_41))
		{
			var_07.var_41 = (0,0,0);
		}

		var_08 = common_scripts\utility::createoneshoteffect(param_03);
		var_08.v["origin"] = var_07.var_2E6;
		var_08.v["angles"] = var_07.var_41;
		var_08.v["fxid"] = param_03;
		var_08.v["delay"] = param_02;
		if(isdefined(param_04))
		{
			var_08.v["soundalias"] = param_04;
		}

		if(!isdefined(var_07.var_39B))
		{
			continue;
		}

		var_09 = var_07.var_39B;
		if(!isdefined(level.var_5C3[var_09]))
		{
			level.var_5C3[var_09] = [];
		}

		level.var_5C3[var_09][level.var_5C3[var_09].size] = var_08;
	}
}

//Function Number: 2
lib_A52F::init()
{
	if(!isdefined(level.global_fx))
	{
		level.global_fx = [];
	}

	level.var_5C3 = [];
}