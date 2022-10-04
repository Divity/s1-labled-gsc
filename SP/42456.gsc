/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42456.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 14
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:43 PM
*******************************************************************/

//Function Number: 1
lib_A5D8::func_76ED(param_00)
{
	if(!isdefined(level.var_55B))
	{
		level.var_55B = spawnstruct();
	}

	level.var_55B.var_74E9 = spawnstruct();
	level.var_55B.var_74E9.var_9BDF = 0;
	level.var_55B.var_74E9.var_24F8 = "";
}

//Function Number: 2
lib_A5D8::func_76F1()
{
	level.var_55B.var_74E9.var_9BDF = 1;
}

//Function Number: 3
lib_A5D8::func_76EE(param_00,param_01)
{
	param_01 = clamp(param_01,0,1);
	param_00.var_2FA2 = param_01;
}

//Function Number: 4
lib_A5D8::func_76EF(param_00,param_01)
{
	param_01 = clamp(param_01,0,1);
	param_00.var_A2F2 = param_01;
}

//Function Number: 5
lib_A5D8::func_76EA(param_00,param_01)
{
	if(!isdefined(level.var_55B.var_74E9.var_C9E) || level.var_55B.var_74E9.var_C9E != param_00)
	{
		level.var_55B.var_74E9.var_C9E = param_00;
		var_02 = undefined;
		if(isdefined(param_01))
		{
			var_02 = param_01;
		}
		else
		{
			var_02 = param_00.var_35F6;
		}

		level.var_31D method_832E(param_00.priority,param_00.var_75DB,param_00.var_2FA2,param_00.var_A2F2,var_02);
	}
}

//Function Number: 6
lib_A5D8::func_76F0(param_00,param_01)
{
	if(isdefined(level.var_31D.var_32D7) && isdefined(level.var_31D.var_32D7["player_has_red_flashing_overlay"]) && level.var_31D lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		if(isdefined(param_00) && param_00 != "none")
		{
			var_02 = lib_A5D8::func_76F5(param_00);
			if(!isdefined(var_02))
			{
				lib_A5D2::func_102D("Failed to load reverb preset: " + param_00);
				return;
			}

			if(param_00 != "deathsdoor")
			{
				lib_A5D8::func_76F7(param_00,var_02);
				level.var_55B.var_2667.var_74E9 = param_00;
			}
		}
		else
		{
			lib_A5D8::func_76F7("none",undefined);
			level.var_55B.var_2667.var_74E9 = "none";
		}

		return;
	}

	if(((isdefined(param_00) && param_00 == "none") || !isdefined(param_00)) && isdefined(level.var_55B.var_24F8))
	{
		level.var_31D method_832F("snd_enveffectsprio_level",1);
		level.var_55B.var_24F8 = undefined;
		level.var_55B.var_74E9.var_24F8 = "";
		return;
	}
	else if(!isdefined(param_00) || isdefined(param_00) && param_00 == "none")
	{
		return;
	}

	var_02 = lib_A5D8::func_76F5(param_00);
	if(!isdefined(var_02))
	{
		lib_A5D2::func_102D("Failed to load reverb preset: " + param_00);
		return;
	}

	level.var_55B.var_24F8 = param_00;
	if(param_00 != "deathsdoor")
	{
		lib_A5D8::func_76F7(param_00,var_02);
	}

	if(level.var_55B.var_74E9.var_24F8 != param_00)
	{
		level.var_55B.var_74E9.var_24F8 = param_00;
		lib_A5D8::func_76EA(var_02,param_01);
	}
}

//Function Number: 7
lib_A5D8::func_76F7(param_00,param_01)
{
	if(param_00 != "deathsdoor")
	{
		level.var_74EF = param_00;
		if(param_00 == "none" && !isdefined(level.var_B3D["none"]))
		{
			level.var_B3D["none"] = 1;
			return;
		}

		if(!isdefined(level.var_B3D[param_00]))
		{
			level.var_B3D[param_00] = [];
			level.var_B3D[param_00]["priority"] = "snd_enveffectsprio_level";
			level.var_B3D[param_00]["roomtype"] = param_01.var_75DB;
			level.var_B3D[param_00]["drylevel"] = param_01.var_2FA2;
			level.var_B3D[param_00]["wetlevel"] = param_01.var_A2F2;
			level.var_B3D[param_00]["fadetime"] = param_01.var_35F6;
			return;
		}
	}
}

//Function Number: 8
lib_A5D8::func_76EB()
{
	level.var_74EF = "";
	level.var_31D method_832F("snd_enveffectsprio_level",2);
	level.var_55B.var_24F8 = undefined;
	level.var_55B.var_74E9.var_24F8 = "";
}

//Function Number: 9
lib_A5D8::func_76EC()
{
	var_00 = undefined;
	if(isdefined(level.var_55B.var_74E9.var_C9E))
	{
		var_00 = level.var_55B.var_74E9.var_C9E;
	}

	return var_00;
}

//Function Number: 10
lib_A5D8::func_76F4(param_00,param_01)
{
	var_02 = lib_A5D2::func_3E51();
	var_03 = "soundtables/sp_defaults.csv";
	var_04 = [];
	if(param_01)
	{
		var_04 = lib_A5D8::func_76F6(var_02,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		var_04 = lib_A5D8::func_76F6(var_03,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		return;
	}

	return var_04;
}

//Function Number: 11
lib_A5D8::func_76F6(param_00,param_01)
{
	var_02 = [];
	var_03 = "";
	var_04 = "";
	var_05 = function_028F(param_00,"reverb_names","zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params");
	if(isdefined(var_05))
	{
		var_06 = 6;
		for(var_07 = 1;var_07 < var_06;var_07++)
		{
			var_03 = function_0290(param_00,0,"reverb_names",var_07,var_05[0],var_05[1]);
			var_04 = function_0290(param_00,0,param_01,var_07,var_05[0],var_05[1]);
			if(var_03 != "comments" && var_04 != "")
			{
				if(var_03 != "roomtype")
				{
					var_02[var_03] = float(var_04);
					continue;
				}

				var_02[var_03] = var_04;
			}
		}

		return var_02;
	}
}

//Function Number: 12
lib_A5D8::func_76F2()
{
	while(!isdefined(level.var_31D))
	{
		wait(0.5);
	}

	lib_A5D8::func_76EA(level.var_55B.var_74E9.var_2788);
}

//Function Number: 13
lib_A5D8::func_76F5(param_00)
{
	if(!isdefined(level.var_55B.var_74E9.var_6F1C))
	{
		level.var_55B.var_74E9.var_6F1C = [];
	}

	var_01 = lib_A5D8::func_76F3();
	var_02 = [];
	if(isdefined(level.var_55B.var_56B4))
	{
		var_02 = [[ level.var_55B.var_56B4 ]](param_00,var_02);
	}
	else if(isdefined(level.var_55B.var_74E9.var_6F1C[param_00]))
	{
		var_02 = level.var_55B.var_74E9.var_6F1C[param_00];
	}
	else if(level.var_55B.var_74E9.var_9BDF)
	{
		var_02 = lib_A5D8::func_76F4(param_00,1);
		if(!isdefined(var_02))
		{
			return;
		}

		level.var_55B.var_74E9.var_6F1C[param_00] = var_02;
	}
	else
	{
		var_02 = lib_A5D8::func_76F4(param_00,0);
		if(!isdefined(var_02))
		{
			return;
		}

		level.var_55B.var_74E9.var_6F1C[param_00] = var_02;
	}

	var_01.name = param_00;
	var_01.var_75DB = var_02["roomtype"];
	var_01.var_2FA2 = var_02["drylevel"];
	var_01.var_A2F2 = var_02["wetlevel"];
	var_01.var_35F6 = var_02["fadetime"];
	return var_01;
}

//Function Number: 14
lib_A5D8::func_76F3()
{
	var_00 = spawnstruct();
	var_00.var_75DB = "generic";
	var_00.var_2FA2 = 1;
	var_00.var_A2F2 = 0.5;
	var_00.var_35F6 = 0;
	var_00.priority = "snd_enveffectsprio_level";
	return var_00;
}