/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42460.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:44 PM
*******************************************************************/

//Function Number: 1
lib_A5DC::func_A305()
{
	level.var_55B.var_A304 = spawnstruct();
	level.var_55B.var_A304.var_9BDF = 0;
}

//Function Number: 2
lib_A5DC::func_A30B()
{
	level.var_55B.var_A304.var_9BDF = 1;
}

//Function Number: 3
lib_A5DC::func_A307(param_00)
{
	var_01 = [];
	var_01 = lib_A5DC::func_A30F(param_00);
	var_01["name"] = param_00;
	var_02 = var_01["probability"];
	var_03 = var_01["spread"];
	var_04 = var_01["radius"];
	var_05 = var_01["offset"];
	level.var_31D method_80C3(var_02[0],var_02[1],var_02[2]);
	level.var_31D setwhizbyspreads(var_03[0],var_03[1],var_03[2]);
	level.var_31D setwhizbyradii(var_04[0],var_04[1],var_04[2]);
	level.var_31D method_8102(var_05);
}

//Function Number: 4
lib_A5DC::func_A308(param_00,param_01,param_02)
{
	level.var_31D method_80C3(param_00,param_01,param_02);
}

//Function Number: 5
lib_A5DC::func_A30A(param_00,param_01,param_02)
{
	level.var_31D setwhizbyspreads(param_00,param_01,param_02);
}

//Function Number: 6
lib_A5DC::func_A309(param_00,param_01,param_02)
{
	level.var_31D setwhizbyradii(param_00,param_01,param_02);
}

//Function Number: 7
lib_A5DC::func_A306(param_00)
{
	level.var_31D method_8102(param_00);
}

//Function Number: 8
lib_A5DC::func_A30F(param_00)
{
	var_01 = "soundtables/sp_defaults.csv";
	var_02 = [];
	var_02 = lib_A5DC::func_A30E(var_01,param_00);
	return var_02;
}

//Function Number: 9
lib_A5DC::func_A30E(param_00,param_01)
{
	var_02 = [];
	var_03 = "";
	var_04 = "";
	var_05 = 12;
	var_06 = [];
	var_07 = [];
	var_08 = [];
	var_09 = 0;
	var_0A = 0;
	var_0B = function_028F(param_00,"whizby_preset_names","zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params");
	if(isdefined(var_0B))
	{
		var_0C = 1;
		if(var_0C < var_05)
		{
			var_03 = function_0290(param_00,0,"whizby_preset_names",var_0C,var_0B[0],var_0B[1]);
			var_04 = function_0290(param_00,0,param_01,var_0C,var_0B[0],var_0B[1]);
			if(!isdefined(var_04))
			{
				break;
			}

			if(var_04 != "" && var_04 != "comments")
			{
				var_0A++;
				switch(var_03)
				{
					case "radius_offset":
						break;

					case "near_radius":
						break;

					case "medium_radius":
						break;

					case "far_radius":
						break;

					case "near_spread":
						break;

					case "medium_spread":
						break;

					case "far_spread":
						break;

					case "near_prob":
						break;

					case "medium_prob":
						break;

					case "far_prob":
						break;
				}
			}
		}
	}
}