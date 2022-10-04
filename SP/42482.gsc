/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42482.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:45 PM
*******************************************************************/

//Function Number: 1
lib_A5F2::func_8776()
{
	lib_A5F2::func_8701();
	lib_A5F2::func_874D("");
}

//Function Number: 2
lib_A5F2::func_874D(param_00)
{
	level._snd.var_9376.var_24F6 = param_00;
}

//Function Number: 3
lib_A5F2::func_86DF()
{
	return level._snd.var_9376.var_24F6;
}

//Function Number: 4
lib_A5F2::func_8701()
{
	level._snd.var_9376 = spawnstruct();
	var_00 = [];
	var_00[var_00.size] = "soundtables/sp_defaults.csv";
	var_00[var_00.size] = "soundtables/" + level.script + ".csv";
	level._snd.var_9376.var_6F1F = lib_A5DE::func_8715("Timescale",var_00,3,"timescale_names","zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params");
}

//Function Number: 5
lib_A5F2::func_8754(param_00)
{
	var_01 = lib_A5F2::func_86E9(param_00);
	if(!isdefined(var_01))
	{
		return;
	}

	if(lib_A5F2::func_86DF() != param_00)
	{
		thread lib_A5F2::func_8759(var_01);
	}
}

//Function Number: 6
lib_A5F2::func_86E9(param_00)
{
	if(isdefined(level._snd.var_9376.var_6F1F) && isdefined(level._snd.var_9376.var_6F1F[param_00]))
	{
		return level._snd.var_9376.var_6F1F[param_00];
	}

	return undefined;
}

//Function Number: 7
lib_A5F2::func_8759(param_00)
{
	var_01 = lib_A5DE::func_86E8();
	foreach(var_03 in param_00.var_802E)
	{
		var_04 = var_03["dsp_bus_name"];
		if(var_04 == "all")
		{
			var_05 = lib_A5ED::func_86E0();
			foreach(var_07 in var_05)
			{
				function_007C(var_07,var_03["scalefactor"]);
				var_01 lib_A5DE::func_8774();
			}

			continue;
		}

		function_007C(var_04,var_03["scalefactor"]);
	}
}

//Function Number: 8
lib_A5F2::func_8755(param_00)
{
	thread lib_A5F2::func_8756(param_00);
}

//Function Number: 9
lib_A5F2::func_8756(param_00)
{
	var_01 = lib_A5DE::func_86E8();
	var_02 = lib_A5ED::func_86E0();
	foreach(var_04 in var_02)
	{
		function_007C(var_04,param_00);
		var_01 lib_A5DE::func_8774();
	}
}

//Function Number: 10
lib_A5F2::func_8757(param_00,param_01)
{
	thread lib_A5F2::func_8758(param_00,param_01);
}

//Function Number: 11
lib_A5F2::func_8758(param_00,param_01)
{
	var_02 = lib_A5DE::func_86E8();
	foreach(var_04 in param_00)
	{
		function_007C(var_04,param_01);
		var_02 lib_A5DE::func_8774();
	}
}