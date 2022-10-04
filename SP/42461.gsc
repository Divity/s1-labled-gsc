/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42461.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 50
 * Decompile Time: 12 ms
 * Timestamp: 4/20/2022 8:23:44 PM
*******************************************************************/

//Function Number: 1
lib_A5DD::func_1226()
{
	if(!isdefined(level.var_55B.var_A3E0))
	{
		level.var_55B.var_A3E0 = spawnstruct();
		level.var_55B.var_A3E0.var_2507 = "";
		level.var_55B.var_A3E0.zones = [];
		level.var_55B.var_A3E0.var_6628 = spawnstruct();
		level.var_55B.var_A3E0.var_6628.var_77DA = [];
		level.var_55B.var_A3E0.var_6628.var_25B2 = [];
		level.var_55B.var_A3E0.var_6628.var_5CE5 = [];
		level.var_55B.var_A3E0.var_6628.var_74E1 = [];
		level.var_55B.var_A3E0.var_6628.var_632B = [];
		lib_A5DD::func_1232(1);
		lib_A5DD::func_122B(1);
		lib_A5DD::func_122F(1);
		lib_A5DD::func_1234(1);
		lib_A5DD::func_122D(1);
		lib_A5DD::func_1231(1);
		lib_A5DD::func_122E(0);
		lib_A5DD::func_1233(0);
		lib_A5DD::func_122C(0);
		lib_A5DD::func_1230(0);
		level.var_55B.var_A3E0.var_9BDF = 0;
	}

	if(!isdefined(level.var_55B.var_9BD6))
	{
		level.var_55B.var_56B5 = undefined;
	}
}

//Function Number: 2
lib_A5DD::func_123D()
{
	level.var_55B.var_A3E0.var_9BDF = 1;
}

//Function Number: 3
lib_A5DD::func_123A(param_00,param_01,param_02)
{
	if(level.var_55B.var_A3E0.var_2507 == param_00)
	{
		return;
	}
	else if(level.var_55B.var_A3E0.var_2507 != "")
	{
		lib_A5DD::func_123B(level.var_55B.var_A3E0.var_2507,param_01);
	}

	level.var_55B.var_A3E0.var_2507 = param_00;
	if(isdefined(level.var_55B.var_A3E0.zones[param_00]) && isdefined(level.var_55B.var_A3E0.zones[param_00]["state"]) && level.var_55B.var_A3E0.zones[param_00]["state"] != "stopping")
	{
		lib_A5D2::func_102D("ZONEM_start_zone(\" + param_00 + "\") being called even though audio zone, \" + param_00 + "\", is already started.");
		return;
	}

	var_03 = 2;
	if(isdefined(param_01))
	{
		var_03 = param_01;
	}

	if(!isdefined(level.var_55B.var_A3E0.zones[param_00]))
	{
		var_04 = lib_A5DD::func_1245(param_00);
		if(!isdefined(var_04))
		{
			return;
		}

		level.var_55B.var_A3E0.zones[param_00] = var_04;
	}

	var_04 = level.var_55B.var_A3E0.zones[param_00];
	lib_A5D2::func_102E("ZONE START: " + param_00);
	level.var_55B.var_A3E0.zones[param_00]["state"] = "playing";
	var_05 = var_04["priority"];
	var_06 = var_04["interrupt_fade"];
	if(isdefined(var_04["streamed_ambience"]))
	{
		if(var_04["streamed_ambience"] != "none")
		{
			lib_A5D9::func_8650(var_04["streamed_ambience"],var_03,var_05,var_06);
		}
		else
		{
			lib_A5D9::func_8651(var_03);
		}
	}

	if(isdefined(var_04["dynamic_ambience"]))
	{
		if(var_04["dynamic_ambience"] != "none")
		{
			lib_A5D3::func_25C7(var_04["dynamic_ambience"],1);
		}
		else
		{
			lib_A5D3::func_25C4(1);
		}
	}

	if(isdefined(var_04["occlusion"]) && !lib_A5DD::func_1221())
	{
		if(var_04["occlusion"] != "none")
		{
			lib_A5ED::func_8751(var_04["occlusion"]);
		}
		else
		{
			lib_A5ED::func_8751(undefined);
		}
	}

	if(isdefined(var_04["filter"]) && !lib_A5DD::func_121D())
	{
		if(var_04["filter"] != "none")
		{
			lib_A5ED::func_874E(var_04["filter"],0);
			lib_A5ED::func_874F(1);
		}
	}

	if(isdefined(var_04["reverb"]) && !lib_A5DD::func_1224())
	{
		if(var_04["reverb"] != "none")
		{
			lib_A5D8::func_76F0(var_04["reverb"]);
		}
		else
		{
			lib_A5D8::func_76EB();
		}
	}

	if(isdefined(var_04["mix"]) && !lib_A5DD::func_121F())
	{
		if(var_04["mix"] != "none")
		{
			lib_A5D4::func_5CFE(var_04["mix"]);
			return;
		}

		lib_A5D4::func_5CF6(undefined,1);
	}
}

//Function Number: 4
lib_A5DD::func_1239(param_00,param_01,param_02)
{
	var_03 = lib_A5DD::func_124B(param_00,"streamed_ambience",param_01,::lib_A5DD::func_124A,param_02);
	if(!var_03)
	{
		if(!isdefined(param_01))
		{
			param_01 = "none";
		}

		level.var_55B.var_A3E0.var_6628.var_77DA[param_00] = param_01;
	}
}

//Function Number: 5
lib_A5DD::func_1235(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = "none";
	}

	lib_A5DD::func_124B(param_00,"dynamic_ambience",param_01,::lib_A5DD::func_1246,param_02);
	level.var_55B.var_A3E0.var_6628.var_25B2[param_00] = param_01;
}

//Function Number: 6
lib_A5DD::func_1238(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = "none";
	}

	lib_A5DD::func_124B(param_00,"reverb",param_01,::lib_A5DD::func_1249,param_02);
	level.var_55B.var_A3E0.var_6628.var_74E1[param_00] = param_01;
}

//Function Number: 7
lib_A5DD::func_1237(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = "none";
	}

	lib_A5DD::func_124B(param_00,"occlusion",param_01,::lib_A5DD::func_1248,param_02);
	level.var_55B.var_A3E0.var_6628.var_5CE5[param_01] = param_01;
}

//Function Number: 8
lib_A5DD::func_1236(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = "none";
	}

	lib_A5DD::func_124B(param_00,"mix",param_01,::lib_A5DD::func_1247,param_02);
	level.var_55B.var_A3E0.var_6628.var_5CE5[param_01] = param_01;
}

//Function Number: 9
lib_A5DD::func_123C(param_00)
{
	var_01 = 1;
	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	lib_A5D2::func_102E("ZONE STOP ALL");
	foreach(var_03 in level.var_55B.var_A3E0.zones)
	{
		lib_A5DD::func_123B(var_03["name"],var_01,0);
	}
}

//Function Number: 10
lib_A5DD::func_123B(param_00,param_01,param_02)
{
	if(isdefined(level.var_55B.var_A3E0.zones[param_00]) && isdefined(level.var_55B.var_A3E0.zones[param_00]["state"]) && level.var_55B.var_A3E0.zones[param_00]["state"] != "stopping")
	{
		var_03 = 1;
		if(isdefined(param_01))
		{
			var_03 = param_01;
		}

		var_04 = level.var_55B.var_A3E0.zones[param_00];
		var_05 = 0;
		if(isdefined(param_02))
		{
			var_05 = param_02;
		}

		if(var_05)
		{
			lib_A5D2::func_102E("ZONE STOP ZONE: " + param_00);
		}

		if(isdefined(var_04["streamed_ambience"]))
		{
			lib_A5D9::func_8652(var_04["streamed_ambience"],var_03);
		}

		if(isdefined(var_04["dynamic_ambience"]))
		{
			lib_A5D3::func_25C8(var_04["dynamic_ambience"],var_03);
		}

		if(isdefined(var_04["mix"]) && !lib_A5DD::func_121F())
		{
			lib_A5D4::func_5CF6(var_04["mix"],var_03);
		}

		level.var_55B.var_A3E0.zones[param_00]["state"] = "stopping";
		thread lib_A5DD::func_124C(param_00,var_03);
	}
}

//Function Number: 11
lib_A5DD::func_121B()
{
	return level.var_55B.var_A3E0.var_2507;
}

//Function Number: 12
lib_A5DD::func_122A(param_00)
{
	level.var_55B.var_A3E0.var_2507 = param_00;
}

//Function Number: 13
lib_A5DD::func_1227(param_00,param_01,param_02)
{
}

//Function Number: 14
lib_A5DD::func_1228(param_00)
{
}

//Function Number: 15
lib_A5DD::func_1229(param_00)
{
}

//Function Number: 16
lib_A5DD::func_1232(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_707D = param_00;
}

//Function Number: 17
lib_A5DD::func_1223()
{
	return level.var_55B.var_A3E0.var_6628.var_707D;
}

//Function Number: 18
lib_A5DD::func_122B(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_25B4 = param_00;
}

//Function Number: 19
lib_A5DD::func_121C()
{
	return level.var_55B.var_A3E0.var_6628.var_25B4;
}

//Function Number: 20
lib_A5DD::func_122F(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_5CE8 = param_00;
}

//Function Number: 21
lib_A5DD::func_1220()
{
	return level.var_55B.var_A3E0.var_6628.var_5CE8;
}

//Function Number: 22
lib_A5DD::func_1234(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_74ED = param_00;
}

//Function Number: 23
lib_A5DD::func_1225()
{
	return level.var_55B.var_A3E0.var_6628.var_74ED;
}

//Function Number: 24
lib_A5DD::func_122D(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_36C4 = param_00;
}

//Function Number: 25
lib_A5DD::func_121E()
{
	return level.var_55B.var_A3E0.var_6628.var_36C4;
}

//Function Number: 26
lib_A5DD::func_1231(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_632F = param_00;
}

//Function Number: 27
lib_A5DD::func_1222()
{
	return level.var_55B.var_A3E0.var_6628.var_632F;
}

//Function Number: 28
lib_A5DD::func_122E(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_5CE6 = param_00;
}

//Function Number: 29
lib_A5DD::func_121F()
{
	return level.var_55B.var_A3E0.var_6628.var_5CE6;
}

//Function Number: 30
lib_A5DD::func_1233(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_74EC = param_00;
}

//Function Number: 31
lib_A5DD::func_1224()
{
	return level.var_55B.var_A3E0.var_6628.var_74EC;
}

//Function Number: 32
lib_A5DD::func_122C(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_36C3 = param_00;
}

//Function Number: 33
lib_A5DD::func_121D()
{
	return (isdefined(level.var_6012) && level.var_6012) || level.var_55B.var_A3E0.var_6628.var_36C3;
}

//Function Number: 34
lib_A5DD::func_1230(param_00)
{
	level.var_55B.var_A3E0.var_6628.var_632E = param_00;
}

//Function Number: 35
lib_A5DD::func_1221()
{
	return level.var_55B.var_A3E0.var_6628.var_632E;
}

//Function Number: 36
lib_A5DD::func_1245(param_00)
{
	if(isdefined(level.var_55B.var_A3E0.zones[param_00]))
	{
		return;
	}

	if(!isdefined(level.var_55B.var_A3E0.var_6F1C))
	{
		level.var_55B.var_A3E0.var_6F1C = [];
	}

	var_01 = [];
	if(isdefined(level.var_55B.var_A3E0.var_6F1C[param_00]))
	{
		var_01 = level.var_55B.var_A3E0.var_6F1C[param_00];
	}
	else
	{
		var_01 = lib_A5DD::func_1240(param_00,1);
	}

	if(!isdefined(var_01) || var_01.size == 0)
	{
		return;
	}

	level.var_55B.var_A3E0.var_6F1C[param_00] = var_01;
	var_02 = 0;
	if(lib_A5DD::func_1223() && isdefined(level.var_55B.var_A3E0.var_6628.var_77DA[param_00]))
	{
		if(level.var_55B.var_A3E0.var_6628.var_77DA[param_00] == "none")
		{
			var_01["streamed_ambience"] = undefined;
		}
		else
		{
			var_01["streamed_ambience"] = level.var_55B.var_A3E0.var_6628.var_77DA[param_00];
		}

		var_02 = 1;
		level.var_55B.var_A3E0.var_6628.var_77DA[param_00] = undefined;
	}

	if(lib_A5DD::func_121C() && isdefined(level.var_55B.var_A3E0.var_6628.var_25B2[param_00]))
	{
		if(level.var_55B.var_A3E0.var_6628.var_25B2[param_00] == "none")
		{
			var_01["dynamic_ambience"] = undefined;
		}
		else
		{
			var_01["dynamic_ambience"] = level.var_55B.var_A3E0.var_6628.var_25B2[param_00];
		}

		var_02 = 1;
		level.var_55B.var_A3E0.var_6628.var_25B2[param_00] = undefined;
	}

	if(lib_A5DD::func_1225() && isdefined(level.var_55B.var_A3E0.var_6628.var_74E1[param_00]))
	{
		if(level.var_55B.var_A3E0.var_6628.var_74E1[param_00] == "none")
		{
			var_01["reverb"] = undefined;
		}
		else
		{
			var_01["reverb"] = level.var_55B.var_A3E0.var_6628.var_74E1[param_00];
		}

		var_02 = 1;
		level.var_55B.var_A3E0.var_6628.var_74E1[param_00] = undefined;
	}

	if(lib_A5DD::func_1222() && isdefined(level.var_55B.var_A3E0.var_6628.var_632B[param_00]))
	{
		if(level.var_55B.var_A3E0.var_6628.var_632B[param_00] == "none")
		{
			var_01["occlusion"] = undefined;
		}
		else
		{
			var_01["occlusion"] = level.var_55B.var_A3E0.var_6628.var_632B[param_00];
		}

		var_02 = 1;
		level.var_55B.var_A3E0.var_6628.var_632B[param_00] = undefined;
	}

	if(lib_A5DD::func_121E() && isdefined(level.var_55B.var_A3E0.var_6628.var_5CE5[param_00]))
	{
		if(level.var_55B.var_A3E0.var_6628.var_5CE5[param_00] == "none")
		{
			var_01["mix"] = undefined;
		}
		else
		{
			var_01["mix"] = level.var_55B.var_A3E0.var_6628.var_5CE5[param_00];
		}

		var_02 = 1;
		level.var_55B.var_A3E0.var_6628.var_5CE5[param_00] = undefined;
	}

	if(var_02)
	{
		level.var_55B.var_A3E0.var_6F1C[param_00] = var_01;
	}

	var_01["name"] = param_00;
	if(!isdefined(var_01["priority"]))
	{
		var_01["priority"] = 1;
	}

	if(!isdefined(var_01["interrupt_fade"]))
	{
		var_01["interrupt_fade"] = 0.1;
	}

	return var_01;
}

//Function Number: 37
lib_A5DD::func_1240(param_00,param_01)
{
	var_02 = "soundtables/sp_defaults.csv";
	var_03 = lib_A5D2::func_3ED5();
	var_04 = [];
	if(param_01)
	{
		var_04 = lib_A5DD::func_1241(var_03,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		var_04 = lib_A5DD::func_1241(var_02,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		return;
	}

	return var_04;
}

//Function Number: 38
lib_A5DD::func_1241(param_00,param_01)
{
	var_02 = [];
	var_03 = "";
	var_04 = "";
	var_05 = function_028F(param_00,"zone_names","zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params");
	if(isdefined(var_05))
	{
		var_06 = 8;
		var_07 = 1;
		if(var_07 < var_06)
		{
			if(var_03 != "comments" && var_04 != "")
			{
				var_02[var_03] = var_04;
			}

			var_03 = function_0290(param_00,0,"zone_names",var_07,var_05[0],var_05[1]);
			var_04 = function_0290(param_00,0,param_01,var_07,var_05[0],var_05[1]);
			if(var_03 != "comment" && var_03 != "comments" && var_04 != "")
			{
				switch(var_03)
				{
					case "streamed_ambience":
						break;

					case "dynamic_ambience":
						break;

					case "mix":
						break;

					case "reverb":
						break;

					case "filter":
						break;

					case "occlusion":
						break;

					default:
						break;
				}
			}
		}
	}
}

//Function Number: 39
lib_A5DD::func_124A(param_00,param_01)
{
	var_02 = level.var_55B.var_A3E0.zones[param_00]["streamed_ambience"];
	if(isdefined(var_02))
	{
		lib_A5D9::func_8650(var_02,param_01);
		return;
	}

	lib_A5D9::func_8651(param_01);
}

//Function Number: 40
lib_A5DD::func_1246(param_00,param_01)
{
	var_02 = 1;
	if(isdefined(param_01))
	{
		var_02 = param_01;
	}

	var_03 = level.var_55B.var_A3E0.zones[param_00]["dynamic_ambience"];
	if(isdefined(var_03))
	{
		lib_A5D3::func_25C7(var_03,var_02);
		return;
	}

	lib_A5D3::func_25C8(undefined,var_02);
}

//Function Number: 41
lib_A5DD::func_1249(param_00,param_01)
{
	var_02 = level.var_55B.var_A3E0.zones[param_00]["reverb"];
	if(isdefined(var_02) && !lib_A5DD::func_1224())
	{
		lib_A5D8::func_76F0(var_02);
	}
}

//Function Number: 42
lib_A5DD::func_1248(param_00,param_01)
{
	var_02 = level.var_55B.var_A3E0.zones[param_00]["occlusion"];
	if(isdefined(var_02) && !lib_A5DD::func_1221())
	{
		lib_A5ED::func_8751(var_02);
	}
}

//Function Number: 43
lib_A5DD::func_1247(param_00,param_01)
{
	var_02 = level.var_55B.var_A3E0.zones[param_00]["mix"];
	if(!lib_A5DD::func_121F())
	{
		if(isdefined(var_02))
		{
			lib_A5D4::func_5CFE(var_02);
			return;
		}

		lib_A5D4::func_5CF6(undefined,param_01);
	}
}

//Function Number: 44
lib_A5DD::func_124B(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(level.var_55B.var_A3E0.zones[param_00]))
	{
		if((isdefined(level.var_55B.var_A3E0.zones[param_00][param_01]) && level.var_55B.var_A3E0.zones[param_00][param_01] != param_02) || !isdefined(level.var_55B.var_A3E0.zones[param_00][param_01]) && param_02 != "none")
		{
			if(param_02 == "none")
			{
				level.var_55B.var_A3E0.zones[param_00][param_01] = undefined;
			}
			else
			{
				level.var_55B.var_A3E0.zones[param_00][param_01] = param_02;
			}

			if(param_00 == lib_A5DD::func_121B())
			{
				[[ param_03 ]](param_00,param_04);
			}
		}

		return 1;
	}

	return 0;
}

//Function Number: 45
lib_A5DD::func_124C(param_00,param_01)
{
	wait(param_01);
	wait(0.05);
	if(level.var_55B.var_A3E0.zones[param_00]["state"] == "stopping")
	{
	}
}

//Function Number: 46
lib_A5DD::func_123F(param_00,param_01)
{
	var_02 = spawnstruct();
	var_02.var_A3DB = param_00;
	var_02.var_A3E5 = param_01;
	var_02.var_77DB = undefined;
	var_02.var_77DC = undefined;
	var_02.var_25C9 = undefined;
	var_02.var_25CA = undefined;
	var_02.var_6330 = undefined;
	var_02.var_6331 = undefined;
	var_02.var_36C8 = undefined;
	var_02.var_36C9 = undefined;
	var_02.var_74F0 = undefined;
	var_02.var_74F1 = undefined;
	var_02.var_5CEB = undefined;
	var_02.var_5CED = undefined;
	if(!isdefined(level.var_55B.var_A3E0.zones[param_00]))
	{
		var_03 = lib_A5DD::func_1245(param_00);
		if(!isdefined(var_03))
		{
			lib_A5D2::func_102D("Couldn\'t find zone: " + param_00);
			return;
		}

		level.var_55B.var_A3E0.zones[param_00] = var_03;
	}

	var_04 = level.var_55B.var_A3E0.zones[param_00];
	if(!isdefined(level.var_55B.var_A3E0.zones[param_01]))
	{
		var_03 = lib_A5DD::func_1245(param_01);
		if(!isdefined(var_03))
		{
			lib_A5D2::func_102D("Couldn\'t find zone: " + param_01);
			return;
		}

		level.var_55B.var_A3E0.zones[param_01] = var_03;
	}

	var_05 = level.var_55B.var_A3E0.zones[param_01];
	var_02.var_6330 = var_04["occlusion"];
	var_02.var_6331 = var_05["occlusion"];
	var_02.var_36C8 = var_04["filter"];
	var_02.var_36C9 = var_05["filter"];
	var_02.var_74F0 = var_04["reverb"];
	var_02.var_74F1 = var_05["reverb"];
	var_02.var_5CEA = var_04["mix"];
	var_02.var_5CEC = var_05["mix"];
	var_02.var_77DB = var_04["streamed_ambience"];
	var_02.var_77DC = var_05["streamed_ambience"];
	var_06 = level.var_55B.var_25B2.var_32C["zone"].size;
	if(var_06 > 1)
	{
		lib_A5D3::func_25C1(1,"zone");
	}

	var_02.var_25C9 = var_04["dynamic_ambience"];
	var_02.var_25CA = var_05["dynamic_ambience"];
	return var_02;
}

//Function Number: 47
lib_A5DD::func_1243(param_00,param_01)
{
	var_02 = 0;
	if(isdefined(param_00) && isdefined(param_01) && param_00 != param_01)
	{
		var_02 = 1;
	}
	else if(isdefined(param_01) && !isdefined(param_00))
	{
		var_02 = 1;
	}
	else if(isdefined(param_00) && !isdefined(param_01))
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 48
lib_A5DD::func_1242(param_00,param_01)
{
	var_02 = 0;
	if(isdefined(param_00) && isdefined(param_01) && param_00 != param_01)
	{
		var_02 = 1;
	}
	else if(isdefined(param_01) && !isdefined(param_00))
	{
		var_02 = 1;
	}
	else if(isdefined(param_00) && !isdefined(param_01))
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 49
lib_A5DD::func_1244(param_00,param_01)
{
	var_02 = 0;
	if(isdefined(param_00) && isdefined(param_01) && param_00 != param_01)
	{
		var_02 = 1;
	}
	else if(isdefined(param_01) && !isdefined(param_00))
	{
		var_02 = 1;
	}

	return var_02;
}

//Function Number: 50
lib_A5DD::func_123E(param_00,param_01,param_02)
{
	if(lib_A5DD::func_1244(param_02.var_77DB,param_02.var_77DC))
	{
		var_03 = [];
		var_04 = 0;
		if(isdefined(param_02.var_77DB) && param_02.var_77DB != "")
		{
			var_05 = level.var_55B.var_A3E0.zones[param_02.var_A3DB];
			var_03[var_04] = spawnstruct();
			var_03[var_04].var_9D6 = param_02.var_77DB;
			var_03[var_04].var_9F2E = param_00;
			var_03[var_04].var_35D7 = var_05["interrupt_fade"];
			var_03[var_04].priority = var_05["priority"];
			var_04++;
		}

		if(isdefined(param_02.var_77DC) && param_02.var_77DC != "")
		{
			var_06 = level.var_55B.var_A3E0.zones[param_02.var_A3E5];
			var_03[var_04] = spawnstruct();
			var_03[var_04].var_9D6 = param_02.var_77DC;
			var_03[var_04].var_9F2E = param_01;
			var_03[var_04].var_35D7 = var_06["interrupt_fade"];
			var_03[var_04].priority = var_06["priority"];
		}

		if(var_03.size > 0)
		{
			lib_A5D9::func_864E(var_03);
		}
	}

	if(lib_A5DD::func_1242(param_02.var_25C9,param_02.var_25CA))
	{
		lib_A5D3::func_25BA(param_02.var_25C9,param_00,param_02.var_25CA,param_01);
	}

	if(lib_A5DD::func_1243(param_02.var_5CEA,param_02.var_5CEC) && !lib_A5DD::func_121F())
	{
		lib_A5D4::func_5CF1(param_02.var_5CEA,param_00,param_02.var_5CEC,param_01);
	}

	if(isdefined(param_02.var_36C8))
	{
		if(!lib_A5DD::func_121D())
		{
			lib_A5ED::func_874E(param_02.var_36C8,0,0);
		}
	}
	else if(!lib_A5DD::func_121D())
	{
		lib_A5ED::func_874E(undefined,0,0);
	}

	if(isdefined(param_02.var_36C9))
	{
		if(!lib_A5DD::func_121D())
		{
			lib_A5ED::func_874E(param_02.var_36C9,1,0);
		}
	}
	else if(!lib_A5DD::func_121D())
	{
		lib_A5ED::func_874E(undefined,1,0);
	}

	if(isdefined(param_02.var_36C8) || isdefined(param_02.var_36C9))
	{
		if(!lib_A5DD::func_121D())
		{
			lib_A5ED::func_874F(param_00);
		}
	}

	if(param_00 >= 0.75)
	{
		if(isdefined(param_02.var_74F0) && !lib_A5DD::func_1224())
		{
			if(param_02.var_74F0 == "none")
			{
				lib_A5D8::func_76F0(undefined);
			}
			else
			{
				lib_A5D8::func_76F0(param_02.var_74F0);
			}
		}

		if(isdefined(param_02.var_6330) && lib_A5DD::func_1221())
		{
			if(param_02.var_6330 == "none")
			{
				lib_A5ED::func_8751(undefined);
				return;
			}

			lib_A5ED::func_8751(param_02.var_6330);
			return;
		}

		return;
	}

	if(param_01 >= 0.75)
	{
		if(isdefined(param_02.var_74F1) && !lib_A5DD::func_1224())
		{
			if(param_02.var_74F1 == "none")
			{
				lib_A5D8::func_76F0(undefined);
			}
			else
			{
				lib_A5D8::func_76F0(param_02.var_74F1);
			}
		}

		if(isdefined(param_02.var_6331) && !lib_A5DD::func_1221())
		{
			if(param_02.var_6331 == "none")
			{
				lib_A5ED::func_8751(undefined);
				return;
			}

			lib_A5ED::func_8751(param_02.var_6331);
			return;
		}
	}
}