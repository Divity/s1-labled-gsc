/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42451.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 54
 * Decompile Time: 14835 ms
 * Timestamp: 4/20/2022 8:23:43 PM
*******************************************************************/

//Function Number: 1
lib_A5D3::func_25B5()
{
	if(!isdefined(level.var_55B))
	{
		level.var_55B = spawnstruct();
	}

	if(!isdefined(level.var_55B.var_25B2))
	{
		level.var_55B.var_25B2 = spawnstruct();
		level.var_55B.var_25B2.var_5872 = 0;
		level.var_55B.var_25B2.var_8585 = 0;
		level.var_55B.var_25B2.var_6496 = 0;
		level.var_55B.var_25B2.var_7D97 = 1;
		level.var_55B.var_25B2.var_32C = [];
		level.var_55B.var_25B2.var_32C["zone"] = [];
		level.var_55B.var_25B2.var_32C["free"] = [];
		level.var_55B.var_25B2.var_20D6 = [];
		level.var_55B.var_25B2.var_1A04 = [];
		level.var_55B.var_25B2.var_6F1C = [];
		level.var_55B.var_25B2.var_20D5 = [];
		level.var_55B.var_25B2.var_5866 = [];
		level.var_55B.var_25B2.var_9BDF = 0;
		level.var_55B.var_25B2.var_3315 = 0;
		level.var_55B.var_25B2.var_586A = 0;
		level.var_55B.var_25B2.var_5A01 = 15;
	}
}

//Function Number: 2
lib_A5D3::func_25BB(param_00)
{
	level.var_55B.var_25B2.var_5A01 = param_00;
}

//Function Number: 3
lib_A5D3::func_25C6()
{
	level.var_55B.var_25B2.var_9BDF = 1;
}

//Function Number: 4
lib_A5D3::func_25C7(param_00,param_01)
{
	lib_A5D3::func_25E6("zone",param_00,undefined,param_01);
}

//Function Number: 5
lib_A5D3::func_25BE(param_00,param_01,param_02,param_03)
{
	lib_A5D3::func_25E6("free",param_00,param_01,param_02,undefined,undefined,undefined,param_03);
}

//Function Number: 6
lib_A5D3::func_25BF(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(isdefined(param_03))
	{
		thread lib_A5D3::func_25DC(param_00,param_01,param_02,param_03,param_04,param_05);
		return;
	}

	lib_A5D3::func_25E6("free",param_00,param_02,undefined,param_01,undefined,undefined,param_05);
}

//Function Number: 7
lib_A5D3::func_25C3(param_00,param_01,param_02)
{
	if(isstring(param_01))
	{
		var_03 = param_01;
	}
	else
	{
		var_03 = param_01;
	}

	level notify(var_03 + "dist_monitor_stop");
	lib_A5D3::func_25C2(var_03,param_02);
}

//Function Number: 8
lib_A5D3::func_25B7(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = spawnstruct();
	var_05.name = param_00;
	var_05.point = param_01;
	var_05.label = param_02;
	var_05.var_5C1F = param_03;
	var_05.var_59F9 = param_04;
	return var_05;
}

//Function Number: 9
lib_A5D3::func_25DC(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(isstring(param_02))
	{
		level endon(param_02 + "dist_monitor_stop");
	}
	else
	{
		level endon(param_00 + "dist_monitor_stop");
	}

	var_06 = 1;
	if(isdefined(param_04))
	{
		var_06 = param_04;
	}

	var_07 = 1;
	for(;;)
	{
		var_08 = distance(level.var_31D.var_2E6,param_01);
		if(var_08 < param_03)
		{
			if(var_07)
			{
				var_07 = 0;
				lib_A5D3::func_25E6("free",param_00,param_02,undefined,param_01,undefined,undefined,param_05);
			}
		}
		else if(!var_07)
		{
			var_07 = 1;
			if(isdefined(param_02))
			{
				lib_A5D3::func_25E7("free",param_02,var_06);
			}
			else
			{
				lib_A5D3::func_25E7("free",param_00,var_06);
			}
		}

		wait(1);
	}
}

//Function Number: 10
lib_A5D3::func_25C0(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = "attach";
	if(isdefined(param_03))
	{
		var_05 = param_03;
	}

	lib_A5D3::func_25E6("free",param_00,param_02,param_04,undefined,param_01,var_05);
}

//Function Number: 11
lib_A5D3::func_25C1(param_00,param_01)
{
	var_02 = 2;
	if(isdefined(param_00))
	{
		var_02 = param_00;
	}

	var_03 = "all";
	if(isdefined(param_01))
	{
		var_03 = param_01;
	}

	if(var_03 == "free" || var_03 == "all")
	{
		foreach(var_06, var_05 in level.var_55B.var_25B2.var_32C["free"])
		{
			lib_A5D3::func_25C2(var_06,var_02);
		}
	}

	if(var_03 == "zone" || var_03 == "all")
	{
		foreach(var_06, var_05 in level.var_55B.var_25B2.var_32C["zone"])
		{
			lib_A5D3::func_25C8(var_06,var_02);
		}
	}
}

//Function Number: 12
lib_A5D3::func_25C4(param_00)
{
	lib_A5D3::func_25E7("zone",undefined,param_00);
}

//Function Number: 13
lib_A5D3::func_25C8(param_00,param_01)
{
	lib_A5D3::func_25E7("zone",param_00,param_01);
}

//Function Number: 14
lib_A5D3::func_25C2(param_00,param_01)
{
	lib_A5D3::func_25E7("free",param_00,param_01);
}

//Function Number: 15
lib_A5D3::func_25BA(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_00) && param_00 != "none")
	{
		if(param_01 == 0)
		{
			lib_A5D3::func_25C8(param_00,2);
		}
		else
		{
			lib_A5D3::func_25C7(param_00,param_01);
		}
	}

	if(isdefined(param_02) && param_02 != "none")
	{
		if(param_03 == 0)
		{
			lib_A5D3::func_25C8(param_02,2);
			return;
		}

		lib_A5D3::func_25C7(param_02,param_03);
	}
}

//Function Number: 16
lib_A5D3::func_25BC(param_00,param_01)
{
	if(!isdefined(level.var_55B.var_25B2.var_19EB))
	{
		level.var_55B.var_25B2.var_19EB = [];
	}

	level.var_55B.var_25B2.var_19EB[param_00] = param_01;
}

//Function Number: 17
lib_A5D3::func_25BD(param_00,param_01)
{
	var_02 = [];
	if(isdefined(level.var_55B.var_25B2.var_6F1C[param_00]))
	{
		var_02 = level.var_55B.var_25B2.var_6F1C[param_00];
	}
	else if(level.var_55B.var_25B2.var_9BDF)
	{
		var_02 = lib_A5D3::func_25D8(param_00,1);
		level.var_55B.var_25B2.var_6F1C[param_00] = var_02;
	}
	else
	{
		var_02 = lib_A5D3::func_25D8(param_00,0);
		level.var_55B.var_25B2.var_6F1C[param_00] = var_02;
	}

	foreach(var_04 in var_02["components"])
	{
		lib_A5D3::func_25BC(var_04,param_01);
	}
}

//Function Number: 18
lib_A5D3::func_25B9(param_00,param_01)
{
	var_02 = "free";
	if(isdefined(param_01))
	{
		var_02 = param_01;
	}

	if(isdefined(level.var_55B.var_25B2.var_32C[var_02][param_00]))
	{
		level.var_55B.var_25B2.var_32C[var_02][param_00]["paused"] = 1;
	}
}

//Function Number: 19
lib_A5D3::func_25C5(param_00,param_01)
{
	var_02 = "free";
	if(isdefined(param_01))
	{
		var_02 = param_01;
	}

	if(isdefined(level.var_55B.var_25B2.var_32C[var_02][param_00]))
	{
		level.var_55B.var_25B2.var_32C[var_02][param_00]["paused"] = 0;
		level notify(var_02 + "_" + param_00 + "_event");
	}
}

//Function Number: 20
lib_A5D3::func_25B8(param_00,param_01)
{
	var_02 = "free";
	if(isdefined(param_01))
	{
		var_02 = param_01;
	}

	if(isdefined(level.var_55B.var_25B2.var_32C[var_02][param_00]))
	{
		level notify(var_02 + "_" + param_00 + "_event");
	}
}

//Function Number: 21
lib_A5D3::func_25B6(param_00,param_01,param_02,param_03)
{
	var_04 = "free";
	if(isdefined(level.var_55B.var_25B2.var_32C[var_04][param_00]) && isdefined(level.var_55B.var_25B2.var_32C[var_04][param_01]))
	{
		param_02 = min(param_02,param_03);
		param_03 = max(param_02,param_03);
		if(!isdefined(level.var_55B.var_25B2.var_32C[var_04][param_00]["linked_dambs"]))
		{
			level.var_55B.var_25B2.var_32C[var_04][param_00]["linked_dambs"] = [];
		}

		var_05 = level.var_55B.var_25B2.var_32C[var_04][param_00]["linked_dambs"].size;
		level.var_55B.var_25B2.var_32C[var_04][param_00]["linked_dambs"][var_05] = spawnstruct();
		level.var_55B.var_25B2.var_32C[var_04][param_00]["linked_dambs"][var_05].name = param_01;
		level.var_55B.var_25B2.var_32C[var_04][param_00]["linked_dambs"][var_05].var_5C1F = max(param_02,0);
		level.var_55B.var_25B2.var_32C[var_04][param_00]["linked_dambs"][var_05].var_59F9 = max(param_03,0);
	}
}

//Function Number: 22
lib_A5D3::func_25E6(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = 1;
	if(isdefined(param_03))
	{
		var_08 = param_03;
	}

	var_09 = param_01;
	if(isstring(param_02))
	{
		var_09 = param_02;
	}

	if(!isdefined(level.var_55B.var_25B2.var_32C[param_00][var_09]))
	{
		var_0A = lib_A5D3::func_25D3(param_01);
		if(!isdefined(var_0A))
		{
			return;
		}

		level.var_55B.var_25B2.var_32C[param_00][var_09] = var_0A;
		level.var_55B.var_25B2.var_32C[param_00][var_09]["prob_scale"] = var_08;
		level.var_55B.var_25B2.var_32C[param_00][var_09]["paused"] = 0;
		if(isdefined(param_07))
		{
			lib_A5D3::func_25E5(var_09,param_07);
		}

		if(isdefined(param_05))
		{
			level.var_55B.var_25B2.var_32C[param_00][var_09]["entity"] = param_05;
			level.var_55B.var_25B2.var_32C[param_00][var_09]["mode"] = param_06;
		}

		thread lib_A5D3::func_25E3(param_00,var_09,param_04);
		return;
	}

	if(level.var_55B.var_25B2.var_32C[param_00][var_09]["prob_scale"] != var_08)
	{
		level.var_55B.var_25B2.var_32C[param_00][var_09]["prob_scale"] = var_08;
	}
}

//Function Number: 23
lib_A5D3::func_25E5(param_00,param_01)
{
	if(isarray(param_01))
	{
		foreach(var_03 in param_01)
		{
			lib_A5D3::func_25E6("free",var_03.name,var_03.label,undefined,var_03.point);
			lib_A5D3::func_25B9(var_03.label);
			lib_A5D3::func_25B6(param_00,var_03.label,var_03.var_5C1F,var_03.var_59F9);
		}

		return;
	}

	lib_A5D3::func_25E6("free",param_01.name,param_01.label,undefined,param_01.point);
	lib_A5D3::func_25B9(param_01.label);
	lib_A5D3::func_25B6(param_00,param_01.label,param_01.var_5C1F,param_01.var_59F9);
}

//Function Number: 24
lib_A5D3::func_25E7(param_00,param_01,param_02)
{
	var_03 = 2;
	if(isdefined(param_02))
	{
		var_03 = param_02;
	}

	if(param_00 == "zone" && !isdefined(param_01))
	{
		if(isdefined(level.var_55B.var_25B2.var_32C[param_00]))
		{
			foreach(param_01, var_05 in level.var_55B.var_25B2.var_32C[param_00])
			{
				level.var_55B.var_25B2.var_32C[param_00][param_01]["fade"] = var_03;
				level notify(param_00 + "_" + param_01 + "_stop");
			}

			return;
		}

		return;
	}

	if(isdefined(level.var_55B.var_25B2.var_32C[param_02][var_03]))
	{
		level.var_55B.var_25B2.var_32C[param_02][var_03]["fade"] = var_05;
		level notify(param_02 + "_" + var_03 + "_stop");
	}
}

//Function Number: 25
lib_A5D3::func_25EA(param_00,param_01,param_02)
{
	level endon(param_00 + "_" + param_01 + "_stop");
	var_03 = level.var_55B.var_25B2.var_32C[param_00][param_01]["event_time"];
	var_04 = min(var_03[0],var_03[1]);
	var_05 = max(var_03[0],var_03[1]);
	var_06 = undefined;
	var_07 = undefined;
	if(isdefined(level.var_55B.var_25B2.var_32C[param_00][param_01]["first_event"]))
	{
		var_03 = level.var_55B.var_25B2.var_32C[param_00][param_01]["first_event"];
		var_06 = min(var_03[0],var_03[1]);
		var_07 = max(var_03[0],var_03[1]);
	}

	var_08 = undefined;
	if(isdefined(var_06))
	{
		var_08 = randomfloatrange(var_06,var_07);
	}
	else
	{
		var_08 = randomfloatrange(var_04,var_05);
	}

	for(;;)
	{
		if(!level.var_55B.var_25B2.var_32C[param_00][param_01]["paused"])
		{
			wait(var_08);
		}

		if(level.var_55B.var_25B2.var_32C[param_00][param_01]["paused"])
		{
			level waittill(param_00 + "_" + param_01 + "_event");
		}

		var_09 = lib_A5D3::func_25E2(param_00,param_01);
		if(!isdefined(var_09))
		{
			continue;
		}

		var_0A = lib_A5D3::func_25CF(param_00,param_01,var_09,param_01);
		if(var_0A.var_9C1B)
		{
			if(var_0A.var_9C18 && !isdefined(var_0A.ent))
			{
				level notify(param_00 + "_" + param_01 + "_stop");
				break;
			}

			var_0B = lib_A5D3::func_25CC(var_0A,param_01,var_09);
			if(var_0B.var_8FA6)
			{
				if(level.var_55B.var_25B2.var_7D97)
				{
					lib_A5D3::func_25E0(param_00,param_01,var_0B);
				}
				else
				{
					thread lib_A5D3::func_25E0(param_00,param_01,var_0B);
				}
			}
		}
		else
		{
			lib_A5D2::func_102D("Dynamic ambience is playing back serially and using components which do not define oneshots or loops");
		}

		var_08 = randomfloatrange(var_04,var_05);
	}
}

//Function Number: 26
lib_A5D3::func_25E4(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_02["single_loops"]))
	{
		foreach(var_06 in param_02["single_loops"])
		{
			var_07 = undefined;
			if(isdefined(param_04))
			{
				var_07 = spawn("script_origin",param_04.var_2E6);
			}
			else if(isdefined(param_03))
			{
				var_07 = spawn("script_origin",param_03);
			}
			else
			{
				var_07 = spawn("script_origin",level.var_31D.var_2E6);
			}

			level.var_55B.var_25B2.var_586A++;
			var_07 playloopsound(var_06);
			if(isdefined(param_04))
			{
				var_07 linkto(param_04);
			}

			var_08 = level.var_55B.var_25B2.var_8585;
			level.var_55B.var_25B2.var_32C[param_00][param_01]["single_loops"][var_08] = var_07;
			level.var_55B.var_25B2.var_8585++;
		}
	}
}

//Function Number: 27
//Function Number: 28
lib_A5D3::func_25DD(param_00,param_01,param_02)
{
	for(;;)
	{
		if(!isdefined(param_02))
		{
			level notify(param_00 + "_" + param_01 + "_stop");
		}

		wait(1);
	}
}

//Function Number: 29
lib_A5D3::func_25CC(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	if(randomfloat(1) < param_00.var_6FD7)
	{
		var_04.var_8FA6 = 1;
		if(isdefined(level.var_55B.var_25B2.var_1A04[param_01]))
		{
			thread [[ level.var_55B.var_25B2.var_19EB[param_01] ]]();
		}
		else
		{
			var_04.var_9D6 = lib_A5D3::func_25E1(param_02);
			var_04.point = param_03;
			var_04.ent = param_00.ent;
			var_04.var_5D32 = param_00.var_5D32;
			var_05 = randomfloatrange(param_00.var_5C2F,param_00.var_5A0F);
			var_06 = undefined;
			if(isdefined(param_00.var_5C36))
			{
				var_06 = randomfloatrange(param_00.var_5C36,param_00.var_5A16);
			}
			else
			{
				var_06 = randomfloatrange(0,360);
			}

			var_07 = var_05 * cos(var_06);
			var_08 = var_05 * sin(var_06);
			var_04.start_position = (var_07,var_08,0);
			if(isdefined(param_00.var_5C37))
			{
				var_04.var_9721 = randomfloatrange(param_00.var_5C37,param_00.var_5A17);
				if(isdefined(param_00.var_5C20))
				{
					var_05 = randomfloatrange(param_00.var_5C20,param_00.var_59FA);
					var_06 = randomfloatrange(0,360);
					var_07 = var_05 * cos(var_06);
					var_08 = var_05 * sin(var_06);
					var_04.var_313E = var_04.start_position + (var_07,var_08,0);
				}
				else
				{
					var_09 = randomfloatrange(param_00.var_5C21,param_00.var_59FB);
					var_09 = var_09 * 0.5;
					var_0A = level.var_31D.var_2E6;
					if(isdefined(param_03))
					{
						var_0A = param_03;
					}

					var_0B = var_04.start_position - var_0A;
					var_07 = var_0B[0] * cos(var_09) - var_0B[1] * sin(var_09);
					var_08 = var_0B[0] * sin(var_09) + var_0B[1] * cos(var_09);
					var_04.var_313E = var_04.start_position + (var_07,var_08,0);
				}
			}

			if(isdefined(param_00.var_5C2B))
			{
				var_04.var_8C27 = randomfloatrange(param_00.var_5C2B,param_00.var_5A09);
			}

			if(isdefined(param_00.var_5C2D))
			{
				var_04.var_313C = randomfloatrange(param_00.var_5C2B,param_00.var_5A09);
				var_04.var_6854 = randomfloatrange(param_00.var_5C2D,param_00.var_5A0B);
			}
		}
	}
	else
	{
		var_04.var_8FA6 = 0;
	}

	return var_04;
}

//Function Number: 30
lib_A5D3::func_25E8(param_00,param_01)
{
	wait(param_01);
	lib_A5D3::func_25B8(param_00);
}

//Function Number: 31
lib_A5D3::func_25DB(param_00)
{
	var_01 = undefined;
	if(isdefined(param_00.var_3808))
	{
		var_01 = randomfloatrange(param_00.var_380A,param_00.var_3809);
	}
	else
	{
		var_01 = randomfloatrange(param_00.var_284,param_00.var_273);
	}

	return var_01;
}

//Function Number: 32
lib_A5D3::func_25E9(param_00,param_01,param_02,param_03)
{
	level endon(param_00 + "_" + param_01 + "_stop");
	var_04 = lib_A5D3::func_25CF(param_00,param_01,param_02,param_01);
	if(var_04.var_8586)
	{
		lib_A5D3::func_25E4(param_00,param_01,param_02,param_03,var_04.ent);
		if(var_04.var_9C18 && !var_04.var_9C1B)
		{
			thread lib_A5D3::func_25DD(param_00,param_01,var_04.ent);
		}
	}

	if(var_04.var_9C1B)
	{
		var_05 = lib_A5D3::func_25DB(var_04);
		for(;;)
		{
			if(!level.var_55B.var_25B2.var_32C[param_00][param_01]["paused"])
			{
				wait(var_05);
			}

			if(level.var_55B.var_25B2.var_32C[param_00][param_01]["paused"])
			{
				level waittill(param_00 + "_" + param_01 + "_event");
			}

			if(var_04.var_9C18 && !isdefined(var_04.ent))
			{
				level notify(param_00 + "_" + param_01 + "_stop");
				break;
			}

			if(isdefined(level.var_55B.var_25B2.var_32C[param_00][param_01]["linked_dambs"]))
			{
				foreach(var_07 in level.var_55B.var_25B2.var_32C[param_00][param_01]["linked_dambs"])
				{
					var_08 = randomfloatrange(var_07.var_5C1F,var_07.var_59F9);
					thread lib_A5D3::func_25E8(var_07.name,var_08);
				}
			}

			var_04.var_6FD7 = level.var_55B.var_25B2.var_32C[param_00][param_01]["prob_scale"];
			var_0A = lib_A5D3::func_25CC(var_04,param_01,param_02,param_03);
			if(var_0A.var_8FA6)
			{
				thread lib_A5D3::func_25E0(param_00,param_01,var_0A);
			}

			var_05 = randomfloatrange(var_04.var_284,var_04.var_273);
		}
	}
}

//Function Number: 33
lib_A5D3::func_25EB(param_00,param_01,param_02,param_03)
{
	level endon(param_00 + "_" + param_01 + "_stop");
	param_03 waittill("sounddone");
	if(isdefined(level.var_55B.var_25B2.var_32C[param_00][param_01]["oneshots"][param_02]))
	{
		param_03 delete();
		lib_A5D3::func_275C();
		level.var_55B.var_25B2.var_32C[param_00][param_01]["oneshots"][param_02] = undefined;
	}
}

//Function Number: 34
lib_A5D3::func_25E0(param_00,param_01,param_02)
{
	level endon(param_00 + "_" + param_01 + "_stop");
	if(param_02.var_9D6["type"] == "loop")
	{
		lib_A5D3::func_25DE(param_00,param_01,param_02);
		return;
	}

	lib_A5D3::func_25DF(param_00,param_01,param_02);
}

//Function Number: 35
lib_A5D3::func_25DF(param_00,param_01,param_02)
{
	level endon(param_00 + "_" + param_01 + "_stop");
	var_03 = level.var_31D.var_2E6;
	if(isdefined(param_02.ent))
	{
		var_03 = param_02.ent.var_2E6;
	}
	else if(isdefined(param_02.point))
	{
		var_03 = param_02.point;
	}

	if(level.var_55B.var_25B2.var_3315 < level.var_55B.var_25B2.var_5A01)
	{
		var_04 = spawn("script_origin",var_03 + param_02.start_position);
		if(isdefined(param_02.ent) && param_02.var_5D32 == "attach")
		{
			var_04 linkto(param_02.ent);
		}

		var_04 playsoundasmaster(param_02.var_9D6["name"],"sounddone");
		var_04 thread lib_A5D2::func_EB6();
		if(!var_04.var_88A4)
		{
			var_05 = level.var_55B.var_25B2.var_6496;
			level.var_55B.var_25B2.var_32C[param_00][param_01]["oneshots"][var_05] = var_04;
			level.var_55B.var_25B2.var_6496++;
			lib_A5D3::func_4C37();
			if(isdefined(param_02.var_313E) && !isdefined(param_02.entity))
			{
				var_06 = 0.1 * param_02.var_9721;
				var_04 moveto(var_03 + param_02.var_313E,param_02.var_9721,var_06,var_06);
			}

			if(isdefined(param_02.var_8C27))
			{
				var_04 scalepitch(param_02.var_8C27);
			}

			if(isdefined(param_02.var_6854))
			{
				wait(0.05);
				if(isdefined(var_04) && !var_04.var_88A4)
				{
					var_04 scalepitch(param_02.var_313C,param_02.var_6854);
				}
			}

			thread lib_A5D3::func_25EB(param_00,param_01,var_05,var_04);
			var_04 waittill("sounddone");
			return;
		}

		var_04 delete();
		return;
	}

	lib_A5D2::func_102D("TRYING TO PLAY ONESHOT WITH DAMB REF COUNT AT MAXIMUM!");
}

//Function Number: 36
lib_A5D3::func_25DE(param_00,param_01,param_02)
{
	level endon(param_00 + "_" + param_01 + "_stop");
	if(level.var_55B.var_25B2.var_3315 < level.var_55B.var_25B2.var_5A01)
	{
		var_03 = level.var_31D.var_2E6;
		if(isdefined(param_02.ent))
		{
			var_03 = param_02.ent.var_2E6;
		}
		else if(isdefined(param_02.point))
		{
			var_03 = param_02.point;
		}

		var_04 = param_02.var_9D6["name"];
		var_05 = lib_A5D3::func_25D7(var_04);
		if(!isdefined(var_05))
		{
			return;
		}

		var_06 = min(var_05["duration"][0],var_05["duration"][1]);
		var_07 = max(var_05["duration"][0],var_05["duration"][1]);
		var_08 = randomfloatrange(var_06,var_07);
		var_09 = var_05["loop_alias"];
		var_0A = var_05["fade_in"];
		var_0B = var_05["fade_out"];
		var_0C = undefined;
		if(isdefined(var_05["end_alias"]))
		{
			var_0C = var_05["end_alias"];
		}

		var_0D = spawn("script_origin",var_03 + param_02.start_position);
		if(isdefined(param_02.ent) && param_02.var_5D32 == "attach")
		{
			var_0D linkto(param_02.ent);
		}

		var_0D playloopsound(var_09);
		if(isdefined(var_0A))
		{
			var_0D scalevolume(0);
			wait(0.05);
			var_0D scalevolume(1,var_0A);
		}

		var_0D thread lib_A5D2::func_EB6();
		if(!var_0D.var_88A4)
		{
			var_0E = level.var_55B.var_25B2.var_5872;
			level.var_55B.var_25B2.var_32C[param_00][param_01]["loops"][var_0E] = var_0D;
			lib_A5D3::func_4C37();
			level.var_55B.var_25B2.var_5872++;
			var_0F = 0;
			if(isdefined(param_02.var_5D32) && param_02.var_5D32 == "free" && isdefined(param_02.var_313E))
			{
				var_0F = 1;
			}
			else if(!isdefined(param_02.var_5D32) && isdefined(param_02.var_313E))
			{
				var_0F = 1;
			}

			if(var_0F)
			{
				var_10 = 0.1 * param_02.var_9721;
				var_0D moveto(var_03 + param_02.var_313E,param_02.var_9721,var_10,var_10);
			}

			if(isdefined(param_02.var_8C27))
			{
				var_0D setpitch(param_02.var_8C27);
			}

			if(isdefined(param_02.var_6854))
			{
				wait(0.05);
				if(isdefined(var_0D) && !var_0D.var_88A4)
				{
					var_0D setpitch(param_02.var_313C,param_02.var_6854);
				}
			}

			wait(var_08);
			if(!var_0D.var_88A4)
			{
				if(isdefined(level.var_55B.var_25B2.var_32C[param_00][param_01]["loops"][var_0E]))
				{
					if(isdefined(var_0C))
					{
						var_11 = spawn("script_origin",var_0D.var_2E6);
						var_11 playsoundasmaster(var_0C,"sounddone");
						var_12 = level.var_55B.var_25B2.var_6496;
						level.var_55B.var_25B2.var_6496++;
						level.var_55B.var_25B2.var_32C[param_00][param_01]["oneshots"][var_12] = var_11;
						lib_A5D3::func_4C37();
						thread lib_A5D3::func_25EB(param_00,param_01,var_12,var_11);
					}

					if(isdefined(var_0B))
					{
						thread lib_A5D2::func_F19(var_0D,var_0B);
					}
					else
					{
						var_0D stoploopsound();
						wait(0.05);
						var_0D delete();
					}

					lib_A5D3::func_275C();
					level.var_55B.var_25B2.var_32C[param_00][param_01]["loops"][var_0E] = undefined;
					return;
				}

				return;
			}

			var_0D stoploopsound();
			var_0D delete();
			lib_A5D3::func_275C();
			level.var_55B.var_25B2.var_32C[param_00][param_01]["loops"][var_0E] = undefined;
			return;
		}

		var_0D delete();
		return;
	}

	lib_A5D2::func_102D("TRYING TO PLAY LOOP WITH DAMB REF COUNT AT MAXIMUM!");
}

//Function Number: 37
lib_A5D3::func_25E2(param_00,param_01)
{
	var_02 = 0;
	foreach(var_04 in level.var_55B.var_25B2.var_32C[param_00][param_01]["components"])
	{
		var_05 = var_04[1];
		var_02 = var_02 + var_05;
	}

	var_07 = randomfloat(var_02);
	var_08 = 0;
	var_09 = undefined;
	foreach(var_04 in level.var_55B.var_25B2.var_32C[param_00][param_01]["components"])
	{
		var_0B = var_08 + var_04[1];
		if(var_07 >= var_08 && var_07 < var_0B)
		{
			var_09 = var_04[0];
			break;
		}

		var_08 = var_0B;
	}

	var_0D = lib_A5D3::func_25D2(var_09);
	if(!isdefined(var_0D))
	{
		return;
	}

	var_0D["name"] = var_09;
	return var_0D;
}

//Function Number: 38
lib_A5D3::func_25E1(param_00)
{
	var_01 = param_00["loops"];
	var_02 = param_00["oneshots"];
	var_03 = undefined;
	if(!isdefined(level.var_55B.var_25B2.var_20D6[param_00["name"]]))
	{
		var_03 = 0;
		if(isdefined(var_01))
		{
			if(isstring(var_01[0]))
			{
				var_03 = var_03 + var_01[1];
			}
			else
			{
				foreach(var_05 in var_01)
				{
					var_03 = var_03 + var_05[1];
				}
			}
		}

		if(isdefined(var_02))
		{
			if(isstring(var_02[0]))
			{
				var_03 = var_03 + var_02[1];
			}
			else
			{
				foreach(var_05 in var_02)
				{
					var_03 = var_03 + var_05[1];
				}
			}
		}

		level.var_55B.var_25B2.var_20D6[param_00["name"]] = var_03;
	}
	else
	{
		var_03 = level.var_55B.var_25B2.var_20D6[param_00["name"]];
	}

	var_09 = randomfloatrange(0,var_03);
	var_0A = undefined;
	var_0B = undefined;
	var_0C = 0;
	if(isdefined(var_01))
	{
		if(isstring(var_01[0]))
		{
			var_0D = var_0C + var_01[1];
			if(var_09 >= var_0C && var_09 < var_0D)
			{
				var_0A = var_01[0];
				var_0B = "loop";
			}
			else
			{
				var_0C = var_0D;
			}
		}
		else
		{
			foreach(var_05 in var_02)
			{
				var_0D = var_0C + var_05[1];
				if(var_09 >= var_0C && var_09 < var_0D)
				{
					var_0A = var_05[0];
					var_0B = "loop";
					break;
				}
				else
				{
					var_0C = var_0D;
				}
			}
		}
	}

	if(!isdefined(var_0A) && isdefined(var_02))
	{
		if(isarray(var_02))
		{
			foreach(var_05 in var_02)
			{
				var_0D = var_0C + var_05[1];
				if(var_09 >= var_0C && var_09 < var_0D)
				{
					var_0A = var_05[0];
					var_0B = "oneshot";
					break;
				}
				else
				{
					var_0C = var_0D;
				}
			}
		}
		else
		{
			var_0D = var_0D + var_03[1];
			if(var_09 >= var_0C && var_09 < var_0D)
			{
				var_0A = var_02[0];
				var_0B = "oneshot";
			}
			else
			{
				var_0C = var_0D;
			}
		}
	}

	var_12 = [];
	var_12["name"] = var_0A;
	var_12["type"] = var_0B;
	return var_12;
}

//Function Number: 39
lib_A5D3::func_25D7(param_00)
{
	var_01 = [];
	if(isdefined(level.var_55B.var_25B2.var_5866[param_00]))
	{
		var_01 = level.var_55B.var_25B2.var_5866[param_00];
	}
	else
	{
		var_01 = lib_A5D3::func_25D5(param_00,1);
	}

	if(!isdefined(var_01) || var_01.size == 0)
	{
		return;
	}

	level.var_55B.var_25B2.var_5866[param_00] = var_01;
	return var_01;
}

//Function Number: 40
lib_A5D3::func_25D2(param_00)
{
	if(!isdefined(level.var_55B.var_25B2.var_20D5))
	{
		level.var_55B.var_25B2.var_20D5 = [];
	}

	var_01 = [];
	if(isdefined(level.var_55B.var_25B2.var_20D5[param_00]))
	{
		var_01 = level.var_55B.var_25B2.var_20D5[param_00];
	}

	var_01 = lib_A5D3::func_25D0(param_00,1);
	if(!isdefined(var_01) || var_01.size == 0)
	{
		return;
	}

	level.var_55B.var_25B2.var_20D5[param_00] = var_01;
	return var_01;
}

//Function Number: 41
lib_A5D3::func_25E3(param_00,param_01,param_02)
{
	level.var_55B.var_25B2.var_32C[param_00][param_01]["loops"] = [];
	level.var_55B.var_25B2.var_32C[param_00][param_01]["single_loops"] = [];
	level.var_55B.var_25B2.var_32C[param_00][param_01]["oneshots"] = [];
	if(!isdefined(level.var_55B.var_25B2.var_32C[param_00][param_01]["event_time"]))
	{
		foreach(var_04 in level.var_55B.var_25B2.var_32C[param_00][param_01]["components"])
		{
			var_05 = lib_A5D3::func_25D2(var_04);
			if(!isdefined(var_05))
			{
				return;
			}

			var_05["name"] = var_04;
			thread lib_A5D3::func_25E9(param_00,param_01,var_05,param_02);
		}
	}
	else
	{
		thread lib_A5D3::func_25EA(param_00,param_01,param_02);
	}

	level waittill(param_00 + "_" + param_01 + "_stop");
	wait(0.1);
	foreach(var_08 in level.var_55B.var_25B2.var_32C[param_00][param_01]["loops"])
	{
		thread lib_A5D3::func_25CD(var_08,level.var_55B.var_25B2.var_32C[param_00][param_01]["fade"],0);
	}

	foreach(var_08 in level.var_55B.var_25B2.var_32C[param_00][param_01]["single_loops"])
	{
		thread lib_A5D3::func_25CD(var_08,level.var_55B.var_25B2.var_32C[param_00][param_01]["fade"],1);
	}

	foreach(var_08 in level.var_55B.var_25B2.var_32C[param_00][param_01]["oneshots"])
	{
		thread lib_A5D3::func_25CE(var_08,level.var_55B.var_25B2.var_32C[param_00][param_01]["fade"]);
	}

	level.var_55B.var_25B2.var_32C[param_00][param_01] = undefined;
}

//Function Number: 42
lib_A5D3::func_25CE(param_00,param_01)
{
	if(isdefined(param_00))
	{
		param_00 scalevolume(0,param_01);
		wait(param_01);
		param_00 stopsounds();
		wait(0.05);
		param_00 delete();
		lib_A5D3::func_275C();
	}
}

//Function Number: 43
lib_A5D3::func_25CD(param_00,param_01,param_02)
{
	param_00 scalevolume(0,param_01);
	wait(param_01);
	if(isdefined(param_00))
	{
		param_00 stoploopsound();
		wait(0.05);
		param_00 delete();
	}

	if(param_02)
	{
		level.var_55B.var_25B2.var_586A--;
		return;
	}

	lib_A5D3::func_275C();
}

//Function Number: 44
lib_A5D3::func_25D4(param_00,param_01,param_02,param_03)
{
	var_04 = 0;
	if(isdefined(param_03))
	{
		var_04 = param_03;
	}

	var_05 = [];
	var_06 = 0;
	var_07 = strtok(param_00,"+");
	var_08 = 0;
	for(var_09 = 0;var_09 < var_07.size;var_09++)
	{
		var_0A = strtok(var_07[var_09]," ");
		if(var_0A.size == 1 && var_0A[0] != "")
		{
			var_05[var_05.size] = var_0A[0];
			continue;
		}

		var_0B = var_05.size;
		var_05[var_0B] = [];
		var_05[var_0B][0] = var_0A[0];
		var_05[var_0B][1] = float(var_0A[1]);
	}

	if(!var_06 && var_04)
	{
		var_0C = [];
		for(var_09 = 0;var_09 < var_05.size;var_09++)
		{
			var_0D = var_0C.size;
			var_0C[var_0D] = [];
			var_0C[var_0D][0] = var_05[var_09];
			var_0C[var_0D][1] = 1;
		}

		var_05 = var_0C;
	}

	return var_05;
}

//Function Number: 45
lib_A5D3::func_25D5(param_00,param_01)
{
	var_02 = "soundtables/sp_defaults.csv";
	var_03 = lib_A5D2::func_3D29();
	var_04 = [];
	if(param_01)
	{
		var_04 = lib_A5D3::func_25D6(var_03,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		var_04 = lib_A5D3::func_25D6(var_02,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		return;
	}

	return var_04;
}

//Function Number: 46
lib_A5D3::func_25D6(param_00,param_01)
{
	var_02 = [];
	var_03 = 8;
	var_04 = undefined;
	var_05 = undefined;
	var_06 = undefined;
	var_07 = undefined;
	var_08 = [];
	var_09 = function_028F(param_00,"loop_defs","zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params");
	if(isdefined(var_09))
	{
		var_0A = 0;
		if(var_0A < var_03)
		{
			var_0B = function_0290(param_00,0,"loop_defs",var_0A,var_09[0],var_09[1]);
			if(!isdefined(var_0B) || var_0B == "")
			{
				return;
			}

			var_0C = function_0290(param_00,0,param_01,var_0A,var_09[0],var_09[1]);
			if(var_0C != "" && var_0B != "comments")
			{
				switch(var_0B)
				{
					case "loop_alias":
						break;

					case "fade_in":
						break;

					case "fade_out":
						break;

					case "end_alias":
						break;

					case "duration_min":
						break;

					case "duration_max":
						break;

					default:
						break;
				}
			}
		}
	}
}

//Function Number: 47
lib_A5D3::func_25DA(param_00)
{
	var_01 = [];
	var_01[0] = float(param_00[0]);
	var_01[1] = float(param_00[1]);
	return var_01;
}

//Function Number: 48
lib_A5D3::func_25D1(param_00,param_01)
{
	var_02 = [];
	var_03 = 21;
	var_04 = 8;
	var_05 = [];
	var_06 = [];
	var_07 = [];
	var_08 = [];
	var_09 = [];
	var_0A = [];
	var_0B = [];
	var_0C = [];
	var_0D = [];
	var_0E = [];
	var_0F = [];
	var_10 = 0;
	var_11 = function_028F(param_00,"components","zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params");
	if(isdefined(var_11))
	{
		var_12 = 1;
		if(var_12 < var_03)
		{
			var_13 = function_0290(param_00,0,"components",var_12,var_11[0],var_11[1]);
			if(!isdefined(var_13))
			{
				return;
			}

			var_14 = function_0290(param_00,0,param_01,var_12,var_11[0],var_11[1]);
			if(var_14 != "" && var_13 != "comments")
			{
				var_10++;
				switch(var_13)
				{
					case "oneshots":
						break;

					case "loops":
						break;

					case "single_loops":
						break;

					case "first_event_min":
						break;

					case "first_event_max":
						break;

					case "event_time_min":
						break;

					case "event_time_max":
						break;

					case "dist_min":
						break;

					case "dist_max":
						break;

					case "cone_min":
						break;

					case "cone_max":
						break;

					case "travel_min":
						break;

					case "travel_max":
						break;

					case "travel_time_min":
						break;

					case "travel_time_max":
						break;

					case "pitch_min":
						break;

					case "pitch_max":
						break;

					case "pitch_time_min":
						break;

					case "pitch_time_max":
						break;

					default:
						break;
				}
			}
		}
	}
}

//Function Number: 49
lib_A5D3::func_25D0(param_00,param_01)
{
	var_02 = lib_A5D2::func_3D28();
	var_03 = "soundtables/sp_defaults.csv";
	var_04 = [];
	if(param_01)
	{
		var_04 = lib_A5D3::func_25D1(var_02,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		var_04 = lib_A5D3::func_25D1(var_03,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		return;
	}

	return var_04;
}

//Function Number: 50
lib_A5D3::func_25D9(param_00,param_01)
{
	var_02 = 7;
	var_03 = [];
	var_04 = [];
	var_05 = [];
	var_06 = [];
	var_07 = function_028F(param_00,"dynamic_ambience_names","zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params");
	if(isdefined(var_07))
	{
		var_08 = 1;
		if(var_08 < var_02)
		{
			var_09 = function_0290(param_00,0,"dynamic_ambience_names",var_08,var_07[0],var_07[1]);
			var_0A = function_0290(param_00,0,param_01,var_08,var_07[0],var_07[1]);
			var_0B = 0;
			if(var_0A != "" && var_09 != "comments")
			{
				switch(var_09)
				{
					case "components":
						break;

					case "first_event_min":
						break;

					case "first_event_max":
						break;

					case "event_time_min":
						break;

					case "event_time_max":
						break;

					case "comment":
						break;

					default:
						break;
				}
			}
		}
	}
}

//Function Number: 51
lib_A5D3::func_25D8(param_00,param_01)
{
	var_02 = lib_A5D2::func_3D2A();
	var_03 = "soundtables/sp_defaults.csv";
	var_04 = [];
	if(param_01)
	{
		var_04 = lib_A5D3::func_25D9(var_02,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		var_04 = lib_A5D3::func_25D9(var_03,param_00);
	}

	if(!isdefined(var_04) || var_04.size == 0)
	{
		return;
	}

	return var_04;
}

//Function Number: 52
lib_A5D3::func_25D3(param_00)
{
	var_01 = [];
	if(isdefined(level.var_55B.var_25B2.var_6F1C[param_00]))
	{
		var_01 = level.var_55B.var_25B2.var_6F1C[param_00];
	}
	else
	{
		var_01 = lib_A5D3::func_25D8(param_00,1);
	}

	if(!isdefined(var_01) || var_01.size == 0)
	{
		return;
	}

	level.var_55B.var_25B2.var_6F1C[param_00] = var_01;
	var_01["name"] = param_00;
	return var_01;
}

//Function Number: 53
lib_A5D3::func_4C37()
{
	level.var_55B.var_25B2.var_3315++;
}

//Function Number: 54
lib_A5D3::func_275C()
{
	level.var_55B.var_25B2.var_3315--;
}