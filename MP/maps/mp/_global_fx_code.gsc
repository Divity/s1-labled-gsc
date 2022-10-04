/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _global_fx_code - 42816.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 33 ms
 * Timestamp: 4/20/2022 8:17:26 PM
*******************************************************************/

//Function Number: 1
global_fx(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = common_scripts\utility::getstructarray(param_00,"targetname");
	if(var_05.size <= 0)
	{
		return;
	}

	if(!isdefined(param_02))
	{
		param_02 = randomfloatrange(-20,-15);
	}

	if(!isdefined(param_03))
	{
		param_03 = param_01;
	}

	foreach(var_07 in var_05)
	{
		if(!isdefined(level._effect))
		{
			level._effect = [];
		}

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
	}
}