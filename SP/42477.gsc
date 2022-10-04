/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42477.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 35
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:44 PM
*******************************************************************/

//Function Number: 1
lib_A5ED::func_86D7()
{
	lib_A5ED::func_86F0();
	lib_A5ED::func_86F1();
	lib_A5ED::func_86FF();
	lib_A5ED::func_8700();
}

//Function Number: 2
lib_A5ED::func_874F(param_00)
{
	level._snd.var_24E4.var_5682 = param_00;
	level.var_31D method_812A(param_00,0);
}

//Function Number: 3
lib_A5ED::func_86DC()
{
	return level._snd.var_24E4.var_5682;
}

//Function Number: 4
lib_A5ED::func_86F0()
{
	var_00 = spawnstruct();
	var_00.var_6045 = [];
	var_00.var_6045[0] = "";
	var_00.var_6045[1] = "";
	var_00.var_5682 = 0;
	level._snd.var_24E4 = var_00;
}

//Function Number: 5
lib_A5ED::func_86DD(param_00)
{
	return level._snd.var_24E4.var_6045[param_00];
}

//Function Number: 6
lib_A5ED::func_874B(param_00,param_01)
{
	level._snd.var_24E4.var_6045[param_00] = param_01;
}

//Function Number: 7
lib_A5ED::func_86F1()
{
	var_00 = spawnstruct();
	var_00.name = "";
	level._snd.var_24F2 = var_00;
	lib_A5ED::func_874C("");
}

//Function Number: 8
lib_A5ED::func_86DE()
{
	return level._snd.var_24F2.name;
}

//Function Number: 9
lib_A5ED::func_874C(param_00)
{
	level._snd.var_24F2.name = param_00;
}

//Function Number: 10
lib_A5ED::func_86FE()
{
	var_00 = lib_A5DE::func_8715("DSP bus",["sounddata/dspbuses.csv"],2,"name","name");
	if(isdefined(var_00))
	{
		level._snd.var_2FAD = var_00;
		return;
	}

	level._snd.var_2FAD = [];
}

//Function Number: 11
lib_A5ED::func_86E0()
{
	var_00 = [];
	foreach(var_02 in level._snd.var_2FAD)
	{
		var_00[var_00.size] = var_02.name;
	}

	return var_00;
}

//Function Number: 12
lib_A5ED::func_86F9(param_00)
{
	return isdefined(level._snd.var_2FAD[param_00]);
}

//Function Number: 13
lib_A5ED::func_86E1()
{
	return "sounddata/dspbuses.csv";
}

//Function Number: 14
lib_A5ED::func_86FF()
{
	level._snd.var_36CB = spawnstruct();
	var_00 = [];
	var_00[var_00.size] = "soundtables/sp_defaults.csv";
	var_00[var_00.size] = "soundtables/" + level.script + ".csv";
	level._snd.var_36CB.var_6F1F = lib_A5DE::func_8715("Filter",var_00,6,"filter_names","zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params");
}

//Function Number: 15
lib_A5ED::func_874E(param_00,param_01,param_02)
{
	if(isdefined(level.var_31D.var_32D7) && isdefined(level.var_31D.var_32D7["player_has_red_flashing_overlay"]) && level.var_31D lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		return;
	}

	var_03 = 0;
	if(isdefined(param_01))
	{
		var_03 = param_01;
	}

	if(!isdefined(param_00) || isdefined(param_00) && param_00 == "" || param_00 == "none")
	{
		lib_A5ED::func_874B(var_03,"");
		level.var_31D method_8129(var_03);
		return;
	}

	var_04 = lib_A5ED::func_86E2(param_00);
	if(!isdefined(var_04))
	{
		return;
	}

	if(lib_A5ED::func_86DD(var_03) != param_00)
	{
		lib_A5ED::func_874B(var_03,param_00);
		thread lib_A5ED::func_8750(var_03,var_04);
	}
}

//Function Number: 16
lib_A5ED::func_8793(param_00)
{
	self endon("fade_begin");
	var_01 = 0;
	var_02 = 0.05 / param_00;
	while(var_01 < 1)
	{
		lib_A5ED::func_874F(var_01);
		var_01 = var_01 + var_02;
		wait(0.05);
	}

	lib_A5ED::func_874F(1);
}

//Function Number: 17
lib_A5ED::func_86D5(param_00,param_01)
{
	self notify("fade_begin");
	lib_A5ED::func_874F(0);
	lib_A5ED::func_86BC(0);
	lib_A5ED::func_86BC(1);
	lib_A5ED::func_874E(param_00);
	thread lib_A5ED::func_8793(param_01);
}

//Function Number: 18
lib_A5ED::func_8794(param_00)
{
	self endon("fade_begin");
	var_01 = lib_A5ED::func_86DC();
	var_02 = var_01 * 0.05 / param_00;
	while(var_01 > 0)
	{
		lib_A5ED::func_874F(var_01);
		var_01 = var_01 - var_02;
		wait(0.05);
	}

	lib_A5ED::func_874F(0);
}

//Function Number: 19
lib_A5ED::func_86D6(param_00)
{
	self notify("fade_begin");
	thread lib_A5ED::func_8794(param_00);
}

//Function Number: 20
lib_A5ED::func_86E2(param_00)
{
	if(isdefined(level._snd.var_36CB.var_6F1F[param_00]))
	{
		return level._snd.var_36CB.var_6F1F[param_00];
	}

	return undefined;
}

//Function Number: 21
lib_A5ED::func_8795(param_00,param_01,param_02)
{
	var_03 = spawnstruct();
	var_03.var_2FAC = param_01;
	var_03.index = param_00;
	var_03.type = param_02["type"];
	var_03.var_3BCF = param_02["gain"];
	var_03.var_3A34 = param_02["freq"];
	var_03.var_706F = param_02["q"];
	return var_03;
}

//Function Number: 22
lib_A5ED::func_8750(param_00,param_01)
{
	var_02 = lib_A5DE::func_86E8();
	var_03 = [];
	foreach(var_05 in param_01.var_802E)
	{
		var_06 = var_05["dsp_bus_name"];
		if(var_06 == "all" || var_06 == "set_all")
		{
			var_07 = lib_A5ED::func_86E0();
			foreach(var_09 in var_07)
			{
				var_03[var_09] = lib_A5ED::func_8795(param_00,var_09,var_05);
			}

			continue;
		}

		if(lib_A5ED::func_86F9(var_06))
		{
			var_03[var_06] = lib_A5ED::func_8795(param_00,var_06,var_05);
			continue;
		}
	}

	foreach(var_0D in var_03)
	{
		level.var_31D method_8127(var_0D.var_2FAC,var_0D.index,var_0D.type,var_0D.var_3BCF,var_0D.var_3A34,var_0D.var_706F);
		var_02 lib_A5DE::func_8774();
	}
}

//Function Number: 23
lib_A5ED::func_86BC(param_00)
{
	var_01 = 0;
	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	lib_A5ED::func_874E(undefined,var_01);
}

//Function Number: 24
lib_A5ED::func_8700()
{
	level._snd.var_632D = spawnstruct();
	var_00 = [];
	var_00[var_00.size] = "soundtables/sp_defaults.csv";
	var_00[var_00.size] = "soundtables/" + level.script + ".csv";
	level._snd.var_632D.var_6F1F = lib_A5DE::func_8715("Filter",var_00,6,"occlusion_names","zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params");
}

//Function Number: 25
lib_A5ED::func_8751(param_00)
{
	if(isdefined(level.var_31D.var_32D7) && isdefined(level.var_31D.var_32D7["player_has_red_flashing_overlay"]) && level.var_31D lib_A59A::func_32D7("player_has_red_flashing_overlay"))
	{
		return;
	}

	if(!isdefined(param_00))
	{
		lib_A5ED::func_874C("");
		thread lib_A5ED::func_86C6();
		return;
	}

	var_01 = lib_A5ED::func_86E4(param_00);
	if(!isdefined(var_01))
	{
		return;
	}

	if(lib_A5ED::func_86DE() != param_00)
	{
		lib_A5ED::func_874C(param_00);
		thread lib_A5ED::func_8752(var_01.var_802E);
	}
}

//Function Number: 26
lib_A5ED::func_86E4(param_00)
{
	if(isdefined(level._snd.var_632D.var_6F1F[param_00]))
	{
		return level._snd.var_632D.var_6F1F[param_00];
	}

	return undefined;
}

//Function Number: 27
lib_A5ED::func_8752(param_00)
{
	var_01 = lib_A5DE::func_86E8();
	foreach(var_03 in param_00)
	{
		var_04 = var_03["dsp_bus_name"];
		if(var_04 == "all")
		{
			var_05 = lib_A5ED::func_86E0();
			foreach(var_07 in var_05)
			{
				level.var_31D method_811D(var_07,var_03["freq"],var_03["type"],var_03["gain"],var_03["q"]);
				var_01 lib_A5DE::func_8774();
			}

			break;
		}
		else
		{
			if(lib_A5ED::func_86F9(var_04))
			{
				level.var_31D method_811D(var_04,var_03["freq"],var_03["type"],var_03["gain"],var_03["q"]);
			}
			else
			{
			}

			var_01 lib_A5DE::func_8774();
		}
	}
}

//Function Number: 28
lib_A5ED::func_86CC()
{
	level._snd.var_632D.var_501B = 1;
}

//Function Number: 29
lib_A5ED::func_86C6()
{
	var_00 = lib_A5DE::func_86E8();
	var_01 = lib_A5ED::func_86E0();
	foreach(var_03 in var_01)
	{
		level.var_31D method_811F(var_03);
		var_00 lib_A5DE::func_8774();
	}
}

//Function Number: 30
lib_A5ED::func_86C5()
{
	level._snd.var_632D.var_501B = 0;
	thread lib_A5ED::func_86C6();
}

//Function Number: 31
lib_A5ED::func_86C9()
{
	level._snd.var_A3D8 = undefined;
}

//Function Number: 32
lib_A5ED::func_86CE()
{
	level._snd.var_A3D8 = 1;
}

//Function Number: 33
lib_A5ED::func_86EA()
{
	return isdefined(level._snd.var_A3D8);
}

//Function Number: 34
lib_A5ED::func_86CA()
{
	lib_A5ED::func_874E(undefined,0);
	lib_A5ED::func_874E(undefined,1);
	lib_A5ED::func_86C5();
	lib_A5ED::func_86C9();
}

//Function Number: 35
lib_A5ED::func_86CF()
{
	var_00 = undefined;
	var_01 = "default";
	if(isdefined(level.var_55B.var_A3E0.var_2507) && isdefined(level.var_55B.var_A3E0.zones[level.var_55B.var_A3E0.var_2507]))
	{
		var_02 = lib_A5DD::func_121B();
		var_03 = level.var_55B.var_A3E0.zones[var_02];
		if(isdefined(var_03["occlusion"]) && var_03["occlusion"] != "none")
		{
			var_01 = var_03["occlusion"];
		}

		if(isdefined(var_03["filter"]) && var_03["filter"] != "none")
		{
			var_00 = var_03["filter"];
		}
	}

	if(lib_A5ED::func_86DE() != var_01)
	{
		var_01 = lib_A5ED::func_86DE();
	}

	lib_A5ED::func_86CE();
	lib_A5ED::func_874E(var_00,0);
	lib_A5ED::func_874E(undefined,1);
	lib_A5ED::func_8751(var_01);
}