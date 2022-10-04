/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42246.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 154
 * Decompile Time: 71 ms
 * Timestamp: 4/20/2022 8:22:02 PM
*******************************************************************/

//Function Number: 1
lib_A506::init()
{
	if(!isdefined(level.var_78B3))
	{
		level.var_78B3 = [];
	}

	if(!isdefined(level.var_78AF))
	{
		level.var_78AF = [];
	}

	if(!isdefined(level.var_78B1))
	{
		level.var_78B1 = [];
	}

	if(!isdefined(level.var_78AD))
	{
		level.var_78AD = [];
	}

	if(!isdefined(level.scr_sound))
	{
		level.scr_sound = [];
	}

	if(!isdefined(level.var_78B6))
	{
		level.var_78B6 = [];
	}

	if(!isdefined(level.var_78B9))
	{
		level.var_78B9 = [];
	}

	if(!isdefined(level.var_78A9))
	{
		level.var_78A9[0][0] = 0;
	}

	if(!isdefined(level.var_78B6))
	{
		level.var_78B6 = [];
	}

	if(!isdefined(level.var_78B0))
	{
		level.var_78B0 = [];
	}

	common_scripts\utility::create_lock("moreThanThreeHack",3);
	if(lib_A59A::is_gen4())
	{
		common_scripts\utility::create_lock("trace_part_for_efx",12);
	}
	else
	{
		common_scripts\utility::create_lock("trace_part_for_efx");
	}
}

//Function Number: 2
lib_A506::func_31B9(param_00,param_01)
{
	self waittill(param_00);
	foreach(var_03 in param_01)
	{
		var_04 = var_03["guy"];
		if(!isdefined(var_04))
		{
			continue;
		}

		var_04.var_550--;
		var_04.var_5DB = gettime();
	}
}

//Function Number: 3
lib_A506::func_0BC5(param_00,param_01,param_02)
{
	var_03 = lib_A506::func_3CC8(param_02);
	var_04 = var_03["origin"];
	var_05 = var_03["angles"];
	common_scripts\utility::array_levelthread(param_00,::lib_A506::func_0BC6,param_01,var_04,var_05);
}

//Function Number: 4
lib_A506::func_0BCC(param_00,param_01,param_02)
{
	var_03 = lib_A506::func_3CC8(param_02);
	var_04 = var_03["origin"];
	var_05 = var_03["angles"];
	thread lib_A506::func_0BC6(param_00,param_01,var_04,var_05,"generic");
}

//Function Number: 5
lib_A506::func_0BC9(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	lib_A506::func_0C18(var_03,param_01,param_02,0,"generic");
}

//Function Number: 6
lib_A506::func_0BCD(param_00,param_01,param_02)
{
	var_03 = param_00.var_34;
	param_00 lib_A59A::func_2AC1();
	lib_A506::func_0BCA(param_00,"gravity",param_01,param_02);
	if(var_03)
	{
		param_00 lib_A59A::func_30D8();
	}
}

//Function Number: 7
lib_A506::func_0BD2(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	lib_A506::func_0C18(var_03,param_01,param_02,0.25,"generic");
}

//Function Number: 8
lib_A506::func_0BD0(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	lib_A506::func_0BF2(var_03,param_01,param_02,"generic");
}

//Function Number: 9
lib_A506::func_0BD1(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	lib_A506::func_0C03(var_03,param_01,param_02,"generic",::lib_A506::func_716C,::lib_A506::func_7170);
}

//Function Number: 10
lib_A506::func_0BF8(param_00,param_01,param_02)
{
	lib_A506::func_0C03(param_00,param_01,param_02,undefined,::lib_A506::func_716D,::lib_A506::func_7170);
}

//Function Number: 11
lib_A506::func_0BF9(param_00,param_01,param_02)
{
	lib_A506::func_0C03(param_00,param_01,param_02,undefined,::lib_A506::func_716E,::lib_A506::func_7170);
}

//Function Number: 12
lib_A506::func_0BCE(param_00,param_01,param_02,param_03)
{
	var_04 = [];
	var_04["guy"] = param_00;
	var_04["entity"] = self;
	var_04["tag"] = param_03;
	var_05[0] = var_04;
	lib_A506::func_0BDF(var_05,param_01,param_02,"generic");
}

//Function Number: 13
lib_A506::func_0BB1(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A506::func_3CC8(param_03);
	var_05 = var_04["origin"];
	var_06 = var_04["angles"];
	var_07 = undefined;
	foreach(var_09 in param_00)
	{
		var_07 = var_09;
		thread lib_A506::func_0BB4(var_09,param_01,param_02,var_05,var_06,var_09.animname,0);
	}

	var_07 lib_A506::func_9FEF(param_02);
	self notify(param_02);
}

//Function Number: 14
lib_A506::func_0BB2(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A506::func_3CC8(param_03);
	var_05 = var_04["origin"];
	var_06 = var_04["angles"];
	foreach(var_08 in param_00)
	{
		thread lib_A506::func_0BB4(var_08,param_01,param_02,var_05,var_06,var_08.animname,1);
	}

	param_00[0] lib_A506::func_9FEF(param_02);
	self notify(param_02);
}

//Function Number: 15
lib_A506::func_9FEF(param_00)
{
	self endon("finished_custom_animmode" + param_00);
	self waittill("death");
}

//Function Number: 16
lib_A506::func_0BCA(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A506::func_3CC8(param_03);
	var_07 = var_06["origin"];
	var_08 = var_06["angles"];
	thread lib_A506::func_0BB4(param_00,param_01,param_02,var_07,var_08,"generic",0,param_04,param_05);
	param_00 lib_A506::func_9FEF(param_02);
	self notify(param_02);
}

//Function Number: 17
lib_A506::func_0BCB(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A506::func_3CC8(param_03);
	var_07 = var_06["origin"];
	var_08 = var_06["angles"];
	thread lib_A506::func_0BB4(param_00,param_01,param_02,var_07,var_08,"generic",1,param_04,param_05);
	param_00 lib_A506::func_9FEF(param_02);
	self notify(param_02);
}

//Function Number: 18
lib_A506::func_0BB5(param_00,param_01,param_02,param_03)
{
	var_04 = [];
	var_04[0] = param_00;
	lib_A506::func_0BB1(var_04,param_01,param_02,param_03);
}

//Function Number: 19
lib_A506::func_0BB3(param_00,param_01,param_02,param_03)
{
	var_04 = [];
	var_04[0] = param_00;
	lib_A506::func_0BB2(var_04,param_01,param_02,param_03);
}

//Function Number: 20
lib_A506::func_0BC7(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A506::func_3CC8(param_02);
	var_05 = var_04["origin"];
	var_06 = var_04["angles"];
	thread lib_A506::func_0BC6(param_00,param_01,var_05,var_06,param_03);
}

//Function Number: 21
lib_A506::func_0BDB(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	lib_A506::func_0BC5(var_03,param_01,param_02);
	lib_A506::func_0C15(var_03,param_01,1);
}

//Function Number: 22
lib_A506::func_0D56(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = self.animname;
	}

	var_02 = 0;
	if(isdefined(level.var_78A9[param_01]))
	{
		var_02 = 1;
		if(isdefined(level.var_78A9[param_01][param_00]))
		{
			return;
		}
	}

	var_03 = 0;
	if(isdefined(level.scr_sound[param_01]))
	{
		var_03 = 1;
		if(isdefined(level.scr_sound[param_01][param_00]))
		{
			return;
		}
	}

	if(var_02 || var_03)
	{
		if(var_02)
		{
			var_04 = getarraykeys(level.var_78A9[param_01]);
			foreach(var_06 in var_04)
			{
			}
		}

		if(var_03)
		{
			var_04 = getarraykeys(level.scr_sound[param_01]);
			foreach(var_06 in var_04)
			{
			}
		}

		return;
	}

	var_0A = getarraykeys(level.var_78A9);
	var_0A = common_scripts\utility::array_combine(var_0A,getarraykeys(level.scr_sound));
	foreach(var_0C in var_0A)
	{
	}
}

//Function Number: 23
lib_A506::func_0BC6(param_00,param_01,param_02,param_03,param_04)
{
	param_00.var_380D = gettime();
	if(isdefined(param_04))
	{
		var_05 = param_04;
	}
	else
	{
		var_05 = param_01.animname;
	}

	param_00 lib_A506::func_7EBD(param_01,param_02,param_03,var_05);
	if(isai(param_00))
	{
		param_00.var_5AD = param_01;
		param_00.var_553 = var_05;
		param_00 method_819A(::animscripts\first_frame::main);
		return;
	}

	param_00 method_8141();
	param_00 method_8143(level.var_78A9[var_05][param_01],1,0,0);
	param_00 method_8117(level.var_78A9[var_05][param_01],0);
}

//Function Number: 24
lib_A506::func_0BB4(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	if(isai(param_00) && param_00 lib_A59A::func_2CE6())
	{
		return;
	}

	var_09 = undefined;
	if(isdefined(param_05))
	{
		var_09 = param_05;
	}
	else
	{
		var_09 = param_00.animname;
	}

	if(!isdefined(param_08) || !param_08)
	{
		param_00 lib_A506::func_7EBD(param_02,param_03,param_04,param_05,param_06);
	}

	param_00.var_552 = param_01;
	param_00.var_577 = param_02;
	param_00.var_670 = self;
	param_00.var_551 = param_02;
	param_00.var_553 = var_09;
	param_00.var_578 = param_06;
	param_00.var_579 = param_07;
	param_00 method_819A(::animscripts\animmode::main);
}

//Function Number: 25
lib_A506::func_0BDD(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = [];
	foreach(var_07 in param_00)
	{
		var_08 = [];
		var_08["guy"] = var_07;
		var_08["entity"] = self;
		var_08["tag"] = param_03;
		var_08["origin_offset"] = param_04;
		var_05[var_05.size] = var_08;
	}

	lib_A506::func_0BDF(var_05,param_01,param_02);
}

//Function Number: 26
lib_A506::func_0BE0(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	lib_A506::func_0BDF(var_03,param_01,param_02);
}

//Function Number: 27
lib_A506::func_0BDF(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_00))
	{
		return;
	}

	if(param_00.size <= 0)
	{
		return;
	}

	foreach(var_05 in param_00)
	{
		var_06 = var_05["guy"];
		if(!isdefined(var_06))
		{
			continue;
		}

		if(!isdefined(var_06.var_550))
		{
			var_06.var_550 = 0;
		}

		var_06 endon("death");
		var_06.var_550++;
	}

	var_08 = param_00[0]["guy"];
	if(!isdefined(param_02))
	{
		param_02 = "stop_loop";
	}

	thread lib_A506::func_31B9(param_02,param_00);
	self endon(param_02);
	var_09 = "looping anim";
	var_0A = undefined;
	if(isdefined(param_03))
	{
		var_0A = param_03;
	}
	else
	{
		var_0A = var_08.animname;
	}

	if(!lib_A506::func_0D58(param_01,var_0A))
	{
		return;
	}

	var_0B = 0;
	var_0C = 0;
	for(;;)
	{
		for(var_0B = lib_A506::func_0C48(var_0A,param_01);var_0B == var_0C && var_0B != 0;var_0B = lib_A506::func_0C48(var_0A,param_01))
		{
		}

		var_0C = var_0B;
		var_0D = undefined;
		var_0E = 999999;
		var_0F = undefined;
		var_06 = undefined;
		foreach(var_22, var_05 in param_00)
		{
			var_11 = var_05["entity"];
			var_06 = var_05["guy"];
			var_12 = var_11 lib_A506::func_3CC8(var_05["tag"]);
			var_13 = var_12["origin"];
			var_14 = var_12["angles"];
			if(isdefined(var_05["origin_offset"]))
			{
				var_15 = var_05["origin_offset"];
				var_16 = anglestoforward(var_14);
				var_17 = anglestoright(var_14);
				var_18 = anglestoup(var_14);
				var_13 = var_13 + var_16 * var_15[0];
				var_13 = var_13 + var_17 * var_15[1];
				var_13 = var_13 + var_18 * var_15[2];
			}

			if(isdefined(var_06.var_734B))
			{
				var_06.var_734B = undefined;
				param_00[var_22] = undefined;
				continue;
			}

			var_19 = 0;
			var_1A = 0;
			var_1B = 0;
			var_1C = 0;
			var_1D = undefined;
			var_1E = undefined;
			var_1F = undefined;
			if(isdefined(param_03))
			{
				var_1F = param_03;
			}
			else
			{
				var_1F = var_06.animname;
			}

			if(isdefined(level.var_78AF[var_1F]) && isdefined(level.var_78AF[var_1F][param_01]) && isdefined(level.var_78AF[var_1F][param_01][var_0B]))
			{
				var_19 = 1;
				var_1D = level.var_78AF[var_1F][param_01][var_0B];
			}

			if(isdefined(level.scr_sound[var_1F]) && isdefined(level.scr_sound[var_1F][param_01]) && isdefined(level.scr_sound[var_1F][param_01][var_0B]))
			{
				var_1A = 1;
				var_1E = level.scr_sound[var_1F][param_01][var_0B];
			}

			if(isdefined(level.var_78AD[var_1F]) && isdefined(level.var_78AD[var_1F][var_0B + param_01]))
			{
				var_06 playsoundasmaster(level.var_78AD[var_1F][var_0B + param_01]);
			}

			if(isdefined(level.var_78A9[var_1F]) && isdefined(level.var_78A9[var_1F][param_01]) && !isai(var_06) || !var_06 lib_A59A::func_2CE6())
			{
				var_1B = 1;
			}

			if(var_1B)
			{
				if(isdefined(level.var_78B0[var_1F]) && isdefined(level.var_78B0[var_1F][param_01]))
				{
					var_20 = level.var_78B0[var_1F][param_01];
				}
				else
				{
					var_20 = 0.2;
				}

				var_06 lib_A506::func_5506(param_01,var_1F);
				var_06 method_813E(var_09,var_13,var_14,level.var_78A9[var_1F][param_01][var_0B],undefined,undefined,var_20);
				var_21 = function_0063(level.var_78A9[var_1F][param_01][var_0B]);
				if(var_21 < var_0E)
				{
					var_0E = var_21;
					var_0D = var_22;
				}

				thread lib_A506::func_8C11(var_06,var_09,param_01,var_1F,level.var_78A9[var_1F][param_01][var_0B]);
				thread lib_A506::func_0C7E(var_06,var_09,param_01);
			}

			if(var_19 || var_1A)
			{
				if(isai(var_06))
				{
					if(var_1B)
					{
						var_06 animscripts\face::func_7825(var_1D,var_1E,1);
					}
					else
					{
						var_06 animscripts\face::func_7825(var_1D,var_1E,1,var_09);
					}
				}
				else
				{
					var_06 lib_A59A::play_sound_on_entity(var_1E);
				}

				var_0F = var_22;
			}
		}

		if(!isdefined(var_06))
		{
			break;
		}

		if(isdefined(var_0D))
		{
			param_00[var_0D]["guy"] waittillmatch("end",var_09);
			waittillframeend;
			continue;
		}

		if(isdefined(var_0F))
		{
			param_00[var_0F]["guy"] waittill(var_09);
			continue;
		}
	}
}

//Function Number: 28
lib_A506::func_8C11(param_00,param_01,param_02,param_03,param_04)
{
	param_00 notify("stop_sequencing_notetracks");
	thread lib_A506::func_61BA(param_00,param_01,self,param_02,param_03,param_04);
}

//Function Number: 29
lib_A506::func_0C1C(param_00,param_01)
{
}

//Function Number: 30
lib_A506::func_0C1B(param_00,param_01)
{
	foreach(var_03 in param_00)
	{
		var_03 thread lib_A506::func_0C1C(self,param_01);
	}
}

//Function Number: 31
lib_A506::func_0C18(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	lib_A506::func_0C1D(param_00,param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 32
lib_A506::func_0C22(param_00,param_01,param_02,param_03)
{
	lib_A506::func_0C1D(param_00,param_01,param_02,0.25,param_03);
}

//Function Number: 33
lib_A506::func_0C1D(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = self;
	foreach(var_08 in param_00)
	{
		if(!isdefined(var_08))
		{
			continue;
		}

		if(!isdefined(var_08.var_550))
		{
			var_08.var_550 = 0;
		}

		var_08.var_550++;
	}

	var_0A = lib_A506::func_3CC8(param_02);
	var_0B = var_0A["origin"];
	var_0C = var_0A["angles"];
	if(!isdefined(param_05))
	{
		param_05 = 0;
	}

	var_0D = undefined;
	var_0E = 999999;
	if(param_05)
	{
		var_0E = 0;
	}

	var_0F = undefined;
	var_10 = undefined;
	var_11 = undefined;
	var_12 = "single anim";
	foreach(var_1F, var_08 in param_00)
	{
		var_14 = 0;
		var_15 = 0;
		var_16 = 0;
		var_17 = 0;
		var_18 = undefined;
		var_19 = undefined;
		var_1A = undefined;
		if(isdefined(param_04))
		{
			var_1A = param_04;
		}
		else
		{
			var_1A = var_08.animname;
		}

		if(isdefined(level.var_78AF[var_1A]) && isdefined(level.var_78AF[var_1A][param_01]))
		{
			var_14 = 1;
			var_19 = level.var_78AF[var_1A][param_01];
			var_11 = var_19;
		}

		if(isdefined(level.scr_sound[var_1A]) && isdefined(level.scr_sound[var_1A][param_01]))
		{
			var_15 = 1;
			var_18 = level.scr_sound[var_1A][param_01];
		}

		if(isdefined(level.var_78A9[var_1A]) && isdefined(level.var_78A9[var_1A][param_01]) && !isai(var_08) || !var_08 lib_A59A::func_2CE6())
		{
			var_16 = 1;
		}

		if(isdefined(level.var_78AD[var_1A]) && isdefined(level.var_78AD[var_1A][param_01]))
		{
			var_08 playsoundasmaster(level.var_78AD[var_1A][param_01]);
		}

		if(var_16)
		{
			if(isdefined(level.var_78B0[var_1A]) && isdefined(level.var_78B0[var_1A][param_01]))
			{
				var_1B = level.var_78B0[var_1A][param_01];
			}
			else
			{
				var_1B = 0.2;
			}

			var_08 lib_A506::func_5506(param_01,var_1A);
			if(isplayer(var_08))
			{
				var_1C = level.var_78A9[var_1A]["root"];
				var_08 method_814B(var_1C,0,var_1B);
				var_1D = level.var_78A9[var_1A][param_01];
				var_08 method_8111(var_12,var_1D,1,var_1B);
			}
			else if(var_08.code_classname == "misc_turret")
			{
				var_1D = level.var_78A9[var_1A][param_01];
				var_08 method_8111(var_12,var_1D,1,var_1B);
			}
			else
			{
				var_08 method_813E(var_12,var_0B,var_0C,level.var_78A9[var_1A][param_01],undefined,undefined,var_1B);
			}

			var_1E = function_0063(level.var_78A9[var_1A][param_01]);
			if((var_1E < var_0E && !param_05) || var_1E > var_0E && param_05)
			{
				var_0E = var_1E;
				var_0D = var_1F;
			}

			thread lib_A506::func_8C11(var_08,var_12,param_01,var_1A,level.var_78A9[var_1A][param_01]);
			thread lib_A506::func_0C7E(var_08,var_12,param_01);
		}

		if(var_14 || var_15)
		{
			if(var_14)
			{
				if(var_15)
				{
					var_08 thread lib_A506::func_27DE(param_01,var_14,var_18,level.var_78AF[var_1A][param_01]);
				}

				thread lib_A506::func_0BC2(var_08,param_01,level.var_78AF[var_1A][param_01]);
				var_10 = var_1F;
			}
			else if(isai(var_08))
			{
				if(var_16)
				{
					var_08 animscripts\face::func_7825(var_19,var_18,1);
				}
				else
				{
					if(!isdefined(var_08.var_2B0F) || !var_08.var_2B0F)
					{
						var_08 thread lib_A506::func_0BC4("single dialogue");
					}

					var_08 animscripts\face::func_7825(var_19,var_18,1,"single dialogue");
				}
			}
			else
			{
				var_08 thread lib_A59A::play_sound_on_entity(var_18,"single dialogue");
				if(var_08 method_852B())
				{
					var_08 thread lib_A506::func_0BC4("single dialogue");
				}
			}

			var_0F = var_1F;
		}
	}

	if(isdefined(var_0D))
	{
		var_20 = spawnstruct();
		var_20 thread lib_A506::func_0BB6(param_00[var_0D],param_01);
		var_20 thread lib_A506::func_0BA9(param_00[var_0D],param_01,var_0E,param_03);
		var_20 waittill(param_01);
	}
	else if(isdefined(var_10))
	{
		var_20 = spawnstruct();
		var_20 thread lib_A506::func_0BB6(param_00[var_10],param_01);
		var_20 thread lib_A506::func_0BC3(param_00[var_10],param_01,var_11);
		var_20 waittill(param_01);
	}
	else if(isdefined(var_0F))
	{
		var_20 = spawnstruct();
		var_20 thread lib_A506::func_0BB6(param_00[var_0F],param_01);
		var_20 thread lib_A506::func_0BB8(param_00[var_0F],param_01);
		var_20 waittill(param_01);
	}

	foreach(var_08 in param_00)
	{
		if(!isdefined(var_08))
		{
			continue;
		}

		if(isplayer(var_08))
		{
			var_1A = undefined;
			if(isdefined(param_04))
			{
				var_1A = param_04;
			}
			else
			{
				var_1A = var_08.animname;
			}

			if(isdefined(level.var_78A9[var_1A][param_01]))
			{
				var_1C = level.var_78A9[var_1A]["root"];
				var_08 method_814B(var_1C,1,0.2);
				var_1D = level.var_78A9[var_1A][param_01];
				var_08 method_8142(var_1D,0.2);
			}
		}

		var_08.var_550--;
		var_08.var_5DB = gettime();
	}

	self notify(param_01);
}

//Function Number: 34
lib_A506::func_0BB6(param_00,param_01)
{
	self endon(param_01);
	param_00 waittill("death");
	if(isdefined(param_00.var_BD9) && param_00.var_BD9)
	{
		return;
	}

	self notify(param_01);
}

//Function Number: 35
lib_A506::func_0BC3(param_00,param_01,param_02)
{
	self endon(param_01);
	var_03 = function_0063(param_02);
	wait(var_03);
	self notify(param_01);
}

//Function Number: 36
lib_A506::func_0BB8(param_00,param_01)
{
	self endon(param_01);
	param_00 waittill("single dialogue");
	self notify(param_01);
}

//Function Number: 37
lib_A506::func_0BA9(param_00,param_01,param_02,param_03)
{
	self endon(param_01);
	param_00 endon("death");
	param_02 = param_02 - param_03;
	if(param_03 > 0 && param_02 > 0)
	{
		param_00 lib_A59A::func_A08F("single anim","end",param_02);
		param_00 method_8141();
	}
	else
	{
		param_00 waittillmatch("end","single anim");
	}

	self notify(param_01);
}

//Function Number: 38
lib_A506::func_0C7E(param_00,param_01,param_02)
{
	if(isdefined(param_00.var_2D30) && param_00.var_2D30)
	{
		return;
	}

	param_00 endon("stop_sequencing_notetracks");
	param_00 endon("death");
	param_00 animscripts\shared::func_2D05(param_01,undefined,undefined,1);
}

//Function Number: 39
lib_A506::func_0733(param_00)
{
	for(var_01 = 0;var_01 < level.var_C85;var_01++)
	{
		if(isdefined(self.var_C8A[var_01]))
		{
			continue;
		}

		self.var_C8A[var_01] = param_00;
		return;
	}

	var_02 = getarraykeys(self.var_C8A);
	var_03 = var_02[0];
	var_04 = self.var_C8A[var_03].var_3151;
	for(var_01 = 1;var_01 < var_02.size;var_01++)
	{
		var_05 = var_02[var_01];
		if(self.var_C8A[var_05].var_3151 < var_04)
		{
			var_04 = self.var_C8A[var_05].var_3151;
			var_03 = var_05;
		}
	}

	self.var_C8A[var_03] = param_00;
}

//Function Number: 40
lib_A506::func_0C83(param_00,param_01)
{
	param_01 = tolower(param_01);
	var_02 = getarraykeys(self.var_C8A);
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_04 = var_02[var_03];
		if(self.var_C8A[var_04].var_C6C != param_00)
		{
			continue;
		}

		if(self.var_C8A[var_04].var_6174 != param_01)
		{
			continue;
		}

		self.var_C8A[var_04].var_3151 = gettime() + 60000;
		return 1;
	}

	return 0;
}

//Function Number: 41
lib_A506::func_0C89(param_00,param_01,param_02)
{
	param_01 = tolower(param_01);
	lib_A506::func_07A4();
	if(param_01 == "end")
	{
		return;
	}

	if(lib_A506::func_0C83(param_00,param_01))
	{
		return;
	}

	var_03 = spawnstruct();
	var_03.var_C6C = param_00;
	var_03.var_6174 = param_01;
	var_03.animname = param_02;
	var_03.var_3151 = gettime() + 60000;
	lib_A506::func_0733(var_03);
}

//Function Number: 42
lib_A506::func_0C86(param_00,param_01)
{
	lib_A506::func_07A4();
	var_02 = spawnstruct();
	var_02.var_C6C = param_00;
	var_02.var_6174 = "#" + param_00;
	var_02.animname = param_01;
	var_02.var_3151 = gettime() + 60000;
	if(lib_A506::func_0C83(param_00,var_02.var_6174))
	{
		return;
	}

	lib_A506::func_0733(var_02);
}

//Function Number: 43
lib_A506::func_0C87(param_00,param_01,param_02)
{
	lib_A506::func_07A4();
	param_00 = param_01 + param_00;
	var_03 = spawnstruct();
	var_03.var_C6C = param_00;
	var_03.var_6174 = "#" + param_00;
	var_03.animname = param_02;
	var_03.var_3151 = gettime() + 60000;
	if(lib_A506::func_0C83(param_00,var_03.var_6174))
	{
		return;
	}

	lib_A506::func_0733(var_03);
}

//Function Number: 44
lib_A506::func_61BA(param_00,param_01,param_02,param_03,param_04,param_05)
{
	param_00 endon("stop_sequencing_notetracks");
	param_00 endon("death");
	if(isdefined(param_02))
	{
		var_06 = param_02;
	}
	else
	{
		var_06 = self;
	}

	var_07 = undefined;
	if(isdefined(param_04))
	{
		var_07 = param_04;
	}
	else
	{
		var_07 = param_00.animname;
	}

	var_08 = spawnstruct();
	var_08.var_29E6 = [];
	var_09 = [];
	if(isdefined(var_07) && isdefined(level.var_78B3[var_07]))
	{
		if(isdefined(level.var_78B3[var_07][param_03]))
		{
			var_09[param_03] = level.var_78B3[var_07][param_03];
		}

		if(isdefined(level.var_78B3[var_07]["any"]))
		{
			var_09["any"] = level.var_78B3[var_07]["any"];
		}
	}

	foreach(var_12, var_0B in var_09)
	{
		foreach(var_0D in level.var_78B3[var_07][var_12])
		{
			foreach(var_0F in var_0D)
			{
				if(isdefined(var_0F["dialog"]))
				{
					var_08.var_29E6[var_0F["dialog"]] = 1;
				}
			}
		}
	}

	var_16 = 0;
	var_17 = 0;
	var_08.var_2A48 = 0;
	var_14 = undefined;
	if(!var_16 && isdefined(var_07) && isdefined(param_03))
	{
		var_16 = 1;
		var_18 = undefined;
		var_17 = isdefined(level.var_78B3[var_07]) && isdefined(level.var_78B3[var_07][param_03]) && isdefined(level.var_78B3[var_07][param_03]["start"]);
		if(!var_17)
		{
			continue;
		}

		var_14 = "start";
	}
	else
	{
		param_00 waittill(param_01,var_14);
	}

	if(var_14 == "end")
	{
		return;
	}

	foreach(var_12, var_0B in var_09)
	{
		if(isdefined(level.var_78B3[var_07][var_12][var_14]))
		{
			foreach(var_0F in level.var_78B3[var_07][var_12][var_14])
			{
				lib_A506::func_0BD6(var_0F,param_00,var_08,var_06);
			}
		}
	}

	var_1C = getsubstr(var_14,0,3);
	if(var_1C == "ps_")
	{
		var_1D = getsubstr(var_14,3);
		if(isdefined(param_00.var_BE8))
		{
			param_00 thread [[ param_00.var_BE8 ]](var_1D,"j_head",1);
		}
		else
		{
			param_00 thread lib_A59A::play_sound_on_tag(var_1D,undefined,1);
		}

		continue;
	}

	if(var_1C == "vo_")
	{
		var_1D = getsubstr(var_14,3);
		if(isdefined(param_00.var_BE8))
		{
			param_00 thread [[ param_00.var_BE8 ]](var_1D,"j_head",1);
		}
		else
		{
			param_00 thread lib_A59A::play_sound_on_tag(var_1D,"j_head",1);
		}

		continue;
	}

	if(var_1C == "sd_")
	{
		var_1D = getsubstr(var_14,3);
		param_00 thread lib_A59A::func_8657(var_1D);
		continue;
	}

	if(var_1C == "fx_")
	{
		var_1E = strtok(tolower(getsubstr(var_14,3)),",() ");
		if(var_1E.size == 2)
		{
			if(var_1E[0] == "exploder")
			{
				common_scripts\_exploder::exploder(var_1E[1]);
				continue;
			}
			else if(var_1E[0] == "stop_exploder")
			{
				lib_A59A::stop_exploder(var_1E[1]);
				continue;
			}
			else
			{
				playfxontag(level._effect[var_1E[0]],param_00,var_1E[1]);
				continue;
			}
		}
		else if(var_1E.size == 3)
		{
			if(var_1E[0] == "playfxontag")
			{
				playfxontag(level._effect[var_1E[1]],param_00,var_1E[2]);
				continue;
			}
			else if(var_1E[0] == "stopfxontag")
			{
				stopfxontag(level._effect[var_1E[1]],param_00,var_1E[2]);
				continue;
			}
			else if(var_1E[0] == "killfxontag")
			{
				killfxontag(level._effect[var_1E[1]],param_00,var_1E[2]);
				continue;
			}
		}
		else if(var_1E.size == 11)
		{
			var_1F = (float(var_1E[2]),float(var_1E[3]),float(var_1E[4]));
			var_20 = (float(var_1E[5]),float(var_1E[6]),float(var_1E[7]));
			var_21 = (float(var_1E[8]),float(var_1E[9]),float(var_1E[10]));
			playfx(level._effect[var_1E[1]],var_1F,var_20,var_21);
		}
	}

	var_1C = getsubstr(var_14,0,4);
	if(var_1C == "psr_")
	{
		var_1D = getsubstr(var_14,4);
		lib_A59A::func_70BA(var_1D);
		continue;
	}

	switch(var_14)
	{
		case "ignoreall true":
			break;

		case "ignoreall false":
			break;

		case "ignoreme true":
			break;

		case "ignoreme false":
			break;

		case "allowdeath true":
			break;

		case "allowdeath false":
			break;
	}
}

//Function Number: 45
lib_A506::func_0BD6(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_00["function"]))
	{
		if(!isdefined(param_00["function_args"]))
		{
			self thread [[ param_00["function"] ]](param_01);
		}
		else
		{
			self thread [[ param_00["function"] ]](param_01,param_00["function_args"]);
		}
	}

	if(isdefined(param_00["flag"]))
	{
		common_scripts\utility::flag_set(param_00["flag"]);
	}

	if(isdefined(param_00["flag_clear"]))
	{
		common_scripts\utility::flag_clear(param_00["flag_clear"]);
	}

	if(isdefined(param_00["notify"]))
	{
		level notify(param_00["notify"]);
	}

	if(isdefined(param_00["attach gun left"]))
	{
		param_01 lib_A506::func_445C();
		return;
	}

	if(isdefined(param_00["attach gun right"]))
	{
		param_01 lib_A506::func_445D();
		return;
	}

	if(isdefined(param_00["detach gun"]))
	{
		param_01 lib_A506::func_4458(param_00);
		return;
	}

	if(isdefined(param_00["attach model"]))
	{
		if(isdefined(param_00["selftag"]))
		{
			param_01 attach(param_00["attach model"],param_00["selftag"]);
		}
		else
		{
			param_03 attach(param_00["attach model"],param_00["tag"]);
		}

		return;
	}

	if(isdefined(param_00["detach model"]))
	{
		waittillframeend;
		if(isdefined(param_00["selftag"]))
		{
			param_01 detach(param_00["detach model"],param_00["selftag"]);
		}
		else
		{
			param_03 detach(param_00["detach model"],param_00["tag"]);
		}
	}

	if(isdefined(param_00["sound"]))
	{
		var_04 = undefined;
		if(!isdefined(param_00["sound_stays_death"]))
		{
			var_04 = 1;
		}

		var_05 = undefined;
		if(isdefined(param_00["sound_on_tag"]))
		{
			var_05 = param_00["sound_on_tag"];
		}

		param_01 thread lib_A59A::play_sound_on_tag(param_00["sound"],var_05,var_04);
	}

	if(isdefined(param_00["playersound"]))
	{
		level.var_31D playsoundasmaster(param_00["playersound"]);
	}

	if(!param_02.var_2A48)
	{
		if(isdefined(param_00["dialog"]) && isdefined(param_02.var_29E6[param_00["dialog"]]))
		{
			param_01 animscripts\face::func_7825(undefined,param_00["dialog"],1);
			param_02.var_29E6[param_00["dialog"]] = undefined;
			param_02.var_2A48 = 1;
		}
	}

	if(isdefined(param_00["create model"]))
	{
		lib_A506::func_0BA8(param_01,param_00);
	}
	else if(isdefined(param_00["delete model"]))
	{
		lib_A506::func_0C05(param_01,param_00);
	}

	if(isdefined(param_00["selftag"]))
	{
		if(isdefined(param_00["effect"]))
		{
			var_06 = isdefined(param_00["moreThanThreeHack"]);
			if(var_06)
			{
				common_scripts\utility::lock("moreThanThreeHack");
			}

			playfxontag(level._effect[param_00["effect"]],param_01,param_00["selftag"]);
			if(var_06)
			{
				common_scripts\utility::unlock("moreThanThreeHack");
			}
		}

		if(isdefined(param_00["stop_effect"]))
		{
			stopfxontag(level._effect[param_00["stop_effect"]],param_01,param_00["selftag"]);
		}

		if(isdefined(param_00["swap_part_to_efx"]))
		{
			playfxontag(level._effect[param_00["swap_part_to_efx"]],param_01,param_00["selftag"]);
			param_01 hidepart(param_00["selftag"]);
		}

		if(isdefined(param_00["trace_part_for_efx"]))
		{
			var_07 = undefined;
			var_08 = common_scripts\utility::getfx(param_00["trace_part_for_efx"]);
			if(isdefined(param_00["trace_part_for_efx_water"]))
			{
				var_07 = common_scripts\utility::getfx(param_00["trace_part_for_efx_water"]);
			}

			var_09 = 0;
			if(isdefined(param_00["trace_part_for_efx_delete_depth"]))
			{
				var_09 = param_00["trace_part_for_efx_delete_depth"];
			}

			param_01 thread lib_A506::func_948B(param_00["selftag"],var_08,var_07,var_09);
		}

		if(isdefined(param_00["trace_part_for_efx_canceling"]))
		{
			param_01 thread lib_A506::func_948C(param_00["selftag"]);
		}
	}

	if(isdefined(param_00["tag"]) && isdefined(param_00["effect"]))
	{
		playfxontag(level._effect[param_00["effect"]],param_03,param_00["tag"]);
	}

	if(isdefined(param_00["selftag"]) && isdefined(param_00["effect_looped"]))
	{
		playfxontag(level._effect[param_00["effect_looped"]],param_01,param_00["selftag"]);
	}

	if(isdefined(param_00["lui_notify"]))
	{
		function_023F(param_00["lui_notify"],0);
	}

	if(isdefined(param_00["omnvar"]))
	{
		setomnvar(param_00["omnvar"],param_00["value"]);
	}
}

//Function Number: 46
lib_A506::func_948C(param_00)
{
	self notify("cancel_trace_for_part_" + param_00);
}

//Function Number: 47
lib_A506::func_948B(param_00,param_01,param_02,param_03)
{
	var_04 = "trace_part_for_efx";
	self endon("cancel_trace_for_part_" + param_00);
	var_05 = self gettagorigin(param_00);
	var_06 = 0;
	var_07 = spawnstruct();
	var_07.var_5547 = self gettagorigin(param_00);
	var_07.var_491C = 0;
	var_07.var_6696 = param_00;
	var_07.var_491E = 0;
	var_07.effect = param_01;
	var_07.var_8D6F = 0;
	var_07.var_5540 = gettime();
	while(isdefined(self) && !var_07.var_491C)
	{
		common_scripts\utility::lock(var_04);
		lib_A506::func_92A6(var_07);
		common_scripts\utility::unlock_wait(var_04);
		if(var_07.var_8D6F == 1 && gettime() - var_07.var_5540 > 3000)
		{
			return;
		}
	}

	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(param_02) && var_07.var_491E)
	{
		param_01 = param_02;
	}

	playfx(param_01,var_07.var_5547);
	if(param_03 == 0)
	{
		self hidepart(param_00);
		return;
	}

	thread lib_A506::func_487A(var_07.var_5547[2] - param_03,param_00);
}

//Function Number: 48
lib_A506::func_487A(param_00,param_01)
{
	self endon("entitydeleted");
	while(self gettagorigin(param_01)[2] > param_00)
	{
		wait(0.05);
	}

	self hidepart(param_01);
}

//Function Number: 49
lib_A506::func_92A6(param_00)
{
	var_01 = undefined;
	if(!isdefined(self))
	{
		return;
	}

	param_00.var_24F5 = self gettagorigin(param_00.var_6696);
	if(param_00.var_24F5 != param_00.var_5547)
	{
		param_00.var_5540 = gettime();
		param_00.var_8D6F = 0;
		if(!bullettracepassed(param_00.var_5547,param_00.var_24F5,0,self))
		{
			var_02 = bullettrace(param_00.var_5547,param_00.var_24F5,0,self);
			if(var_02["fraction"] < 1)
			{
				param_00.var_5547 = var_02["position"];
				param_00.var_491E = var_02["surfacetype"] == "water";
				param_00.var_491C = 1;
				return;
			}
			else
			{
			}
		}
	}
	else
	{
		param_00.var_8D6F = 1;
	}

	param_00.var_5547 = param_00.var_24F5;
}

//Function Number: 50
lib_A506::func_0BA8(param_00,param_01)
{
	if(!isdefined(param_00.var_7B3C))
	{
		param_00.var_7B3C = [];
	}

	var_02 = param_00.var_7B3C.size;
	param_00.var_7B3C[var_02] = spawn("script_model",(0,0,0));
	param_00.var_7B3C[var_02] setmodel(param_01["create model"]);
	param_00.var_7B3C[var_02].var_2E6 = param_00 gettagorigin(param_01["selftag"]);
	param_00.var_7B3C[var_02].var_41 = param_00 gettagangles(param_01["selftag"]);
}

//Function Number: 51
lib_A506::func_0C05(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_00.var_7B3C.size;var_02++)
	{
		if(isdefined(param_01["explosion"]))
		{
			var_03 = anglestoforward(param_00.var_7B3C[var_02].var_41);
			var_03 = var_03 * 120;
			var_03 = var_03 + param_00.var_7B3C[var_02].var_2E6;
			playfx(level._effect[param_01["explosion"]],param_00.var_7B3C[var_02].var_2E6);
			radiusdamage(param_00.var_7B3C[var_02].var_2E6,350,700,50);
		}

		param_00.var_7B3C[var_02] delete();
	}
}

//Function Number: 52
lib_A506::func_445C()
{
	if(!isdefined(self.var_445B))
	{
		return;
	}

	self.var_445B delete();
	self.var_136 = 1;
	animscripts\shared::func_6866(self.weapon,"left");
}

//Function Number: 53
lib_A506::func_445D()
{
	if(!isdefined(self.var_445B))
	{
		return;
	}

	self.var_445B delete();
	self.var_136 = 1;
	animscripts\shared::func_6866(self.weapon,"right");
}

//Function Number: 54
lib_A506::func_4458(param_00)
{
	if(isdefined(self.var_445B))
	{
		return;
	}

	var_01 = self gettagorigin(param_00["tag"]);
	var_02 = self gettagangles(param_00["tag"]);
	var_03 = 0;
	if(isdefined(param_00["suspend"]))
	{
		var_03 = param_00["suspend"];
	}

	var_04 = spawn("weapon_" + self.weapon,var_01,var_03);
	var_04.var_41 = var_02;
	self.var_445B = var_04;
	animscripts\shared::func_6866(self.weapon,"none");
	self.var_136 = 0;
}

//Function Number: 55
lib_A506::func_0D58(param_00,param_01)
{
	if(!isdefined(level.var_78A9[param_01][param_00]))
	{
		return 0;
	}

	if(!isarray(level.var_78A9[param_01][param_00]))
	{
		return 0;
	}

	return 1;
}

//Function Number: 56
lib_A506::func_0C48(param_00,param_01)
{
	var_02 = level.var_78A9[param_00][param_01].size;
	var_03 = randomint(var_02);
	if(var_02 > 1)
	{
		var_04 = 0;
		var_05 = 0;
		for(var_06 = 0;var_06 < var_02;var_06++)
		{
			if(isdefined(level.var_78A9[param_00][param_01 + "weight"]))
			{
				if(isdefined(level.var_78A9[param_00][param_01 + "weight"][var_06]))
				{
					var_04++;
					var_05 = var_05 + level.var_78A9[param_00][param_01 + "weight"][var_06];
				}
			}
		}

		if(var_04 == var_02)
		{
			var_07 = randomfloat(var_05);
			var_05 = 0;
			for(var_06 = 0;var_06 < var_02;var_06++)
			{
				var_05 = var_05 + level.var_78A9[param_00][param_01 + "weight"][var_06];
				if(var_07 < var_05)
				{
					var_03 = var_06;
					break;
				}
			}
		}
	}

	return var_03;
}

//Function Number: 57
lib_A506::func_0BF6(param_00,param_01,param_02,param_03,param_04)
{
	thread lib_A506::func_0BF2(param_00,param_01,param_04);
	var_05 = spawnstruct();
	var_05.var_7172 = 0;
	foreach(var_07 in param_00)
	{
		var_05.var_7172++;
		thread lib_A506::func_4B70(var_07,param_02,param_03,param_04,var_05);
	}

	for(;;)
	{
		var_05 waittill("reached_position");
		if(var_05.var_7172 <= 0)
		{
			return;
		}
	}
}

//Function Number: 58
lib_A506::func_9F9C()
{
	self endon("death");
	self waittill("anim_reach_complete");
}

//Function Number: 59
lib_A506::func_4B70(param_00,param_01,param_02,param_03,param_04)
{
	param_00 lib_A506::func_9F9C();
	param_04.var_7172--;
	param_04 notify("reached_position");
	if(isalive(param_00))
	{
		lib_A506::func_0BE1(param_00,param_01,param_02,param_03);
	}
}

//Function Number: 60
lib_A506::func_3CC8(param_00)
{
	var_01 = undefined;
	var_02 = undefined;
	if(isdefined(param_00))
	{
		var_01 = self gettagorigin(param_00);
		var_02 = self gettagangles(param_00);
	}
	else
	{
		var_01 = self.var_2E6;
		var_02 = self.var_41;
		if(!isdefined(var_02))
		{
			var_02 = (0,0,0);
		}
	}

	var_03 = [];
	var_03["angles"] = var_02;
	var_03["origin"] = var_01;
	return var_03;
}

//Function Number: 61
lib_A506::func_0C01(param_00,param_01,param_02,param_03)
{
	thread lib_A506::func_5D49(param_00);
	lib_A506::func_0C03(param_00,param_01,param_02,param_03,::lib_A506::func_716F,::lib_A506::func_7170);
}

//Function Number: 62
lib_A506::func_5D49(param_00)
{
	var_01 = 0.3;
	waittillframeend;
	for(;;)
	{
		param_00 = lib_A59A::func_733C(param_00);
		var_02 = [];
		var_03 = 0;
		foreach(var_08, var_05 in param_00)
		{
			var_06 = var_05.var_1C6;
			if(isdefined(var_05.var_716B))
			{
				var_06 = var_05.var_716B;
			}

			var_07 = distance(var_05.var_2E6,var_06);
			var_02[var_05.unique_id] = var_07;
			if(var_07 <= 4)
			{
				param_00[var_08] = undefined;
				continue;
			}

			var_03 = var_03 + var_07;
		}

		if(param_00.size <= 1)
		{
			break;
		}

		var_03 = var_03 / param_00.size;
		foreach(var_05 in param_00)
		{
			var_0A = var_02[var_05.unique_id] - var_03;
			var_0B = var_0A * 0.003;
			if(var_0B > var_01)
			{
				var_0B = var_01;
			}
			else if(var_0B < var_01 * -1)
			{
				var_0B = var_01 * -1;
			}

			var_05.var_5F62 = 1 + var_0B;
		}

		wait(0.05);
	}

	foreach(var_05 in param_00)
	{
		if(isalive(var_05))
		{
			var_05.var_5F62 = 1;
		}
	}
}

//Function Number: 63
lib_A506::func_0BFC(param_00,param_01)
{
	if(isarray(param_00))
	{
		foreach(var_03 in param_00)
		{
			thread lib_A506::func_0BFC(var_03,param_01);
		}

		return;
	}

	var_03 = var_03;
	var_04 endon("new_anim_reach");
	wait(var_03);
	var_04 notify("goal");
}

//Function Number: 64
lib_A506::func_0BF2(param_00,param_01,param_02,param_03,param_04)
{
	return lib_A506::func_0C03(param_00,param_01,param_02,param_03,::lib_A506::func_716F,::lib_A506::func_7170,undefined,param_04);
}

//Function Number: 65
lib_A506::func_0C03(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = lib_A506::func_3CC8(param_02);
	var_09 = var_08["origin"];
	var_0A = var_08["angles"];
	if(isdefined(param_06))
	{
		self.type = param_06;
		self.var_D27 = "stand";
	}

	var_0B = spawnstruct();
	var_0C = 0;
	var_0D = 0;
	foreach(var_0F in param_00)
	{
		if(isdefined(param_06))
		{
			var_0F.var_3AA = self;
		}

		if(isdefined(param_03))
		{
			var_10 = param_03;
		}
		else
		{
			var_10 = var_0F.animname;
		}

		if(isdefined(level.var_78A9[var_10][param_01]))
		{
			if(isarray(level.var_78A9[var_10][param_01]))
			{
				var_11 = getstartorigin(var_09,var_0A,level.var_78A9[var_10][param_01][0]);
			}
			else
			{
				var_11 = getstartorigin(var_09,var_0A,level.var_78A9[var_10][param_01]);
			}
		}
		else
		{
			var_11 = var_09;
		}

		var_0D++;
		var_0F thread lib_A506::func_136D(var_0B,var_11,param_04,param_05,param_01,param_07);
	}

	var_13 = 1;
	var_0B thread lib_A506::func_5DF3(thisthread,param_00,self,param_06);
	while(var_0D)
	{
		var_0B waittill("reach_notify",var_0F,var_14);
		if(isdefined(var_0F))
		{
			var_0F.var_C00 = var_14;
		}

		if(!var_14)
		{
			var_13 = 0;
		}

		var_0D--;
	}

	lib_A506::func_0BFA(param_00,self,param_06);
	var_0B notify("end_reach_thread_monitor");
	return var_13;
}

//Function Number: 66
lib_A506::func_0BFA(param_00,param_01,param_02)
{
	foreach(var_04 in param_00)
	{
		if(isalive(var_04) && var_04.var_C00)
		{
			var_04.var_1C7 = var_04.var_63C9;
			var_04.var_3AA = undefined;
			var_04.var_412 = 0;
		}

		if(isdefined(var_04))
		{
			var_04.var_C00 = undefined;
		}
	}

	if(isdefined(param_02))
	{
		param_01.type = undefined;
	}
}

//Function Number: 67
lib_A506::func_5DF3(param_00,param_01,param_02,param_03)
{
	self endon("end_reach_thread_monitor");
	while(isdefined(param_00))
	{
		wait 0.05;
	}

	foreach(var_05 in param_01)
	{
		if(isdefined(var_05))
		{
			var_05.var_C00 = 1;
			var_05.var_7169 = 1;
			var_05 notify("goal");
			if(isdefined(var_05.name))
			{
			}
			else
			{
			}

			continue;
		}
	}

	lib_A506::func_0BFA(param_01,param_02,param_03);
}

//Function Number: 68
lib_A506::func_0BFB(param_00)
{
	if(!isalive(param_00))
	{
		return;
	}

	if(isdefined(param_00.var_63C9))
	{
		param_00.var_1C7 = param_00.var_63C9;
	}

	param_00.var_3AA = undefined;
	param_00.var_412 = 0;
}

//Function Number: 69
lib_A506::func_0C42(param_00,param_01,param_02)
{
	var_03 = lib_A506::func_3CC8(param_02);
	var_04 = var_03["origin"];
	var_05 = var_03["angles"];
	foreach(var_07 in param_00)
	{
		var_08 = getstartorigin(var_04,var_05,level.var_78A9[var_07.animname][param_01]);
		var_09 = getstartangles(var_04,var_05,level.var_78A9[var_07.animname][param_01]);
		if(isai(var_07))
		{
			var_07 method_81C5(var_08);
			continue;
		}

		var_07.var_2E6 = var_08;
		var_07.var_41 = var_09;
	}
}

//Function Number: 70
lib_A506::func_0BE4(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A506::func_3CC8(param_02);
	var_07 = var_06["origin"];
	var_08 = var_06["angles"];
	foreach(var_0A in param_00)
	{
		var_0B = getstartorigin(var_07,var_08,level.var_78A9[var_0A.animname][param_01]);
		var_0C = getstartangles(var_07,var_08,level.var_78A9[var_0A.animname][param_01]);
		if(isai(var_0A))
		{
			continue;
		}

		var_0A moveto(var_0B,param_03,param_04,param_05);
		var_0A rotateto(var_0C,param_03,param_04,param_05);
	}
}

//Function Number: 71
lib_A506::func_0BD3(param_00,param_01,param_02)
{
	var_03 = lib_A506::func_3CC8(param_02);
	var_04 = var_03["origin"];
	var_05 = var_03["angles"];
	var_06 = getstartorigin(var_04,var_05,level.var_78A9["generic"][param_01]);
	var_07 = getstartangles(var_04,var_05,level.var_78A9["generic"][param_01]);
	if(isai(param_00))
	{
		param_00 method_81C5(var_06);
		return;
	}

	param_00.var_2E6 = var_06;
	param_00.var_41 = var_07;
}

//Function Number: 72
lib_A506::func_0C33(param_00,param_01,param_02)
{
	return lib_A506::func_0C34(param_00,"generic",param_01,param_02);
}

//Function Number: 73
lib_A506::func_0C34(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A506::func_3CC8(param_03);
	var_05 = var_04["origin"];
	var_06 = var_04["angles"];
	var_07 = getstartorigin(var_05,var_06,level.var_78A9[param_01][param_02]);
	var_08 = getstartorigin(var_05,var_06,level.var_78A9[param_01][param_02]);
	var_09 = spawn("script_model",var_07);
	var_09 setmodel(param_00);
	var_09.var_41 = var_08;
	return var_09;
}

//Function Number: 74
lib_A506::func_0C35(param_00,param_01)
{
	self attach(param_00,param_01);
}

//Function Number: 75
lib_A506::func_0BDC(param_00,param_01)
{
	var_02 = self gettagorigin(param_01);
	var_03 = spawn("script_model",var_02);
	var_03 setmodel(param_00);
	var_03 linkto(self,param_01,(0,0,0),(0,0,0));
	return var_03;
}

//Function Number: 76
lib_A506::func_0C36(param_00,param_01,param_02)
{
	var_03 = lib_A506::func_3CC8(param_02);
	var_04 = var_03["origin"];
	var_05 = var_03["angles"];
	var_06 = spawnstruct();
	foreach(var_08 in param_00)
	{
		var_09 = getstartorigin(var_04,var_05,level.var_78A9[var_08.animname][param_01]);
		var_08.var_2E6 = var_09;
	}
}

//Function Number: 77
lib_A506::func_716A(param_00,param_01)
{
	common_scripts\utility::waittill_either("death","goal");
	var_02 = isalive(self) && distancesquared(self.var_2E6,param_01) <= 2500;
	param_00 notify("reach_notify",self,var_02);
}

//Function Number: 78
lib_A506::func_136D(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("death");
	self endon("new_anim_reach");
	param_01 = [[ param_02 ]](param_01);
	thread lib_A506::func_716A(param_00,param_01);
	lib_A59A::func_7E47(param_01);
	self.var_716B = param_01;
	self.var_1C7 = 0;
	self waittill("goal");
	if(isdefined(self.var_7169))
	{
		self.var_7169 = undefined;
	}

	self notify("anim_reach_complete");
	[[ param_03 ]]();
	self notify("new_anim_reach");
}

//Function Number: 79
lib_A506::func_716F(param_00)
{
	if(isdefined(self.var_251A))
	{
	}

	self.var_63C9 = self.var_1C7;
	self.var_63DA = self.var_2FB;
	self.var_63DB = self.var_2FC;
	self.var_2FB = 128;
	self.var_2FC = 128;
	self.var_63DF = isdefined(self.var_79E1);
	if(!isdefined(self.var_67C8))
	{
		lib_A59A::func_2A73();
	}

	lib_A506::func_0BB0(1);
	self.var_382A = self.var_180;
	self.var_180 = 0;
	if(!isdefined(self.var_3AA))
	{
		self.var_639A = self.var_2AF2;
		self.var_2AF2 = 1;
	}

	self.var_716B = undefined;
	self.var_251A = 1;
	return param_00;
}

//Function Number: 80
lib_A506::func_7170()
{
	lib_A506::func_0BB0(0);
	self.var_180 = self.var_382A;
	self.var_382A = undefined;
	self.var_2FB = self.var_63DA;
	self.var_2FC = self.var_63DB;
	self.var_2AF2 = self.var_639A;
	if(self.var_63DF)
	{
		if(!isdefined(self.var_67C8))
		{
			lib_A59A::func_309A();
		}

		self.var_63DF = undefined;
	}

	self.var_251A = undefined;
}

//Function Number: 81
lib_A506::func_0BB0(param_00)
{
	if(isdefined(self.var_2D2C))
	{
		return;
	}

	self method_81A3(param_00);
}

//Function Number: 82
lib_A506::func_716C(param_00)
{
	param_00 = lib_A506::func_716F(param_00);
	self.var_2AF2 = 0;
	return param_00;
}

//Function Number: 83
lib_A506::func_716D(param_00)
{
	var_01 = self method_813C(param_00);
	param_00 = var_01;
	param_00 = lib_A506::func_716F(param_00);
	self.var_2AF2 = 1;
	return param_00;
}

//Function Number: 84
lib_A506::func_716E(param_00)
{
	var_01 = self method_813C(param_00);
	param_00 = var_01;
	param_00 = lib_A506::func_716F(param_00);
	self.var_2AF2 = 0;
	return param_00;
}

//Function Number: 85
lib_A506::func_7F23()
{
	self method_8115(level.var_78AE[self.animname]);
}

//Function Number: 86
lib_A506::func_0C24(param_00,param_01,param_02,param_03,param_04)
{
	self endon("death");
	var_05[0] = param_00;
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	lib_A506::func_0C18(var_05,param_01,param_02,param_03,param_04);
}

//Function Number: 87
lib_A506::func_0C29(param_00,param_01,param_02)
{
	self endon("death");
	var_03[0] = param_00;
	lib_A506::func_0C18(var_03,param_01,param_02,0.25);
}

//Function Number: 88
lib_A506::func_0C23(param_00,param_01,param_02,param_03)
{
	self endon("death");
	var_04[0] = param_00;
	lib_A506::func_0C18(var_04,param_01,param_02,0.25);
}

//Function Number: 89
lib_A506::func_0BF7(param_00,param_01,param_02,param_03,param_04)
{
	self endon("death");
	var_05[0] = param_00;
	lib_A506::func_0BF6(var_05,param_01,param_02,param_03,param_04);
}

//Function Number: 90
lib_A506::func_0BFF(param_00,param_01,param_02,param_03)
{
	self endon("death");
	var_04[0] = param_00;
	return lib_A506::func_0BF2(var_04,param_01,param_02,undefined,param_03);
}

//Function Number: 91
lib_A506::func_0BF5(param_00,param_01,param_02,param_03)
{
	self endon("death");
	var_04[0] = param_00;
	lib_A506::func_0BF3(var_04,param_01,param_02,param_03);
}

//Function Number: 92
lib_A506::func_0BF4(param_00,param_01,param_02,param_03,param_04)
{
	self endon("death");
	var_05[0] = param_00;
	var_06 = lib_A506::func_3CC8(param_02);
	var_07 = var_06["origin"];
	var_08 = var_06["angles"];
	var_09 = param_00.animname;
	if(isdefined(level.var_78A9[var_09][param_01]))
	{
		if(isarray(level.var_78A9[var_09][param_01]))
		{
			var_0A = level.var_78A9[var_09][param_01][0];
		}
		else
		{
			var_0A = level.var_78A9[var_0A][param_02];
		}

		var_07 = getstartorigin(var_07,var_08,var_0A);
		var_08 = getstartorigin(var_07,var_08,var_0A);
	}

	var_0B = spawn("script_origin",var_07);
	var_0B.var_41 = var_08;
	if(isdefined(param_03))
	{
		var_0B.type = param_03;
	}
	else
	{
		var_0B.type = self.type;
	}

	if(isdefined(param_04))
	{
		var_0B.var_D27 = param_04;
	}
	else
	{
		var_0B.var_D27 = self gethighestnodestance();
	}

	param_00.var_3AA = var_0B;
	lib_A506::func_0BF3(var_05,param_01,param_02);
	param_00.var_3AA = undefined;
	var_0B delete();
	while(param_00.var_7.var_5F58 != "stop")
	{
		wait(0.05);
	}
}

//Function Number: 93
lib_A506::func_0BF3(param_00,param_01,param_02,param_03)
{
	self endon("death");
	lib_A506::func_0C03(param_00,param_01,param_02,undefined,::lib_A506::func_716C,::lib_A506::func_7170,param_03);
}

//Function Number: 94
lib_A506::func_0BE1(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("death");
	param_00 endon("death");
	var_06 = [];
	var_06["guy"] = param_00;
	var_06["entity"] = self;
	var_06["tag"] = param_03;
	var_06["origin_offset"] = param_05;
	var_07[0] = var_06;
	lib_A506::func_0BDF(var_07,param_01,param_02,param_04);
}

//Function Number: 95
lib_A506::func_0C43(param_00,param_01,param_02)
{
	self endon("death");
	var_03[0] = param_00;
	lib_A506::func_0C42(var_03,param_01,param_02);
}

//Function Number: 96
lib_A506::func_0732(param_00,param_01)
{
	if(!isdefined(level.var_20D3))
	{
		level.var_20D3[param_00][0] = param_01;
		return;
	}

	if(!isdefined(level.var_20D3[param_00]))
	{
		level.var_20D3[param_00][0] = param_01;
		return;
	}

	for(var_02 = 0;var_02 < level.var_20D3[param_00].size;var_02++)
	{
		if(level.var_20D3[param_00][var_02] == param_01)
		{
			return;
		}
	}

	level.var_20D3[param_00][level.var_20D3[param_00].size] = param_01;
}

//Function Number: 97
lib_A506::func_0C21(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(isdefined(param_00.var_5549))
	{
		lib_A59A::func_9F83(param_00.var_5549,0.5);
	}

	lib_A59A::func_3AF0(::lib_A506::func_0C24,param_00,param_01,param_02,param_03);
	if(isalive(param_00))
	{
		param_00.var_5549 = gettime();
	}
}

//Function Number: 98
lib_A506::func_0BCF(param_00,param_01,param_02,param_03,param_04)
{
	param_00 endon("death");
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(isdefined(param_00.var_5549))
	{
		lib_A59A::func_9F83(param_00.var_5549,0.5);
	}

	if(isdefined(param_04))
	{
		lib_A59A::func_3AF6(param_04,::lib_A506::func_0C24,param_00,param_01,param_02,param_03,"generic");
	}
	else
	{
		lib_A59A::func_3AF0(::lib_A506::func_0C24,param_00,param_01,param_02,param_03,"generic");
	}

	if(isalive(param_00))
	{
		param_00.var_5549 = gettime();
	}
}

//Function Number: 99
lib_A506::func_0BBA(param_00)
{
	foreach(var_02 in param_00)
	{
		var_02 method_81A3(0);
	}
}

//Function Number: 100
lib_A506::func_0BF0(param_00)
{
	foreach(var_02 in param_00)
	{
		var_02 method_81A3(1);
	}
}

//Function Number: 101
lib_A506::func_73B9(param_00,param_01,param_02,param_03,param_04)
{
	param_01 = tolower(param_01);
	var_05 = level.var_78B3[param_00][param_02][param_01];
	param_02 = lib_A506::func_3D84(param_02);
	var_06 = -1;
	if(!isdefined(var_05) || !isarray(var_05) || var_05.size < 1)
	{
		return;
	}

	for(var_07 = 0;var_07 < var_05.size;var_07++)
	{
		if(isdefined(var_05[var_07][param_03]))
		{
			if(!isdefined(param_04) || var_05[var_07][param_03] == param_04)
			{
				var_06 = var_07;
				break;
			}
		}
	}

	if(var_06 < 0)
	{
		return;
	}

	if(var_05.size == 1)
	{
		var_05 = [];
	}
	else
	{
		var_05 = lib_A59A::func_CFA(var_05,var_06);
	}

	level.var_78B3[param_00][param_02][param_01] = var_05;
}

//Function Number: 102
lib_A506::func_080B(param_00,param_01,param_02,param_03)
{
	param_01 = tolower(param_01);
	param_02 = lib_A506::func_3D84(param_02);
	var_04 = lib_A506::func_077D(param_00,param_01,param_02);
	level.var_78B3[param_00][param_02][param_01][var_04] = [];
	level.var_78B3[param_00][param_02][param_01][var_04]["dialog"] = param_03;
}

//Function Number: 103
lib_A506::func_077D(param_00,param_01,param_02)
{
	param_01 = tolower(param_01);
	lib_A506::func_077E(param_00,param_01,param_02);
	return level.var_78B3[param_00][param_02][param_01].size;
}

//Function Number: 104
lib_A506::func_077E(param_00,param_01,param_02)
{
	param_01 = tolower(param_01);
	if(!isdefined(level.var_78B3))
	{
		level.var_78B3 = [];
	}

	if(!isdefined(level.var_78B3[param_00]))
	{
		level.var_78B3[param_00] = [];
	}

	if(!isdefined(level.var_78B3[param_00][param_02]))
	{
		level.var_78B3[param_00][param_02] = [];
	}

	if(!isdefined(level.var_78B3[param_00][param_02][param_01]))
	{
		level.var_78B3[param_00][param_02][param_01] = [];
	}
}

//Function Number: 105
lib_A506::func_0812(param_00,param_01,param_02,param_03,param_04,param_05)
{
	param_01 = tolower(param_01);
	param_02 = lib_A506::func_3D84(param_02);
	var_06 = lib_A506::func_077D(param_00,param_01,param_02);
	level.var_78B3[param_00][param_02][param_01][var_06] = [];
	level.var_78B3[param_00][param_02][param_01][var_06]["sound"] = param_03;
	if(isdefined(param_04))
	{
		level.var_78B3[param_00][param_02][param_01][var_06]["sound_stays_death"] = 1;
	}

	if(isdefined(param_05))
	{
		level.var_78B3[param_00][param_02][param_01][var_06]["sound_on_tag"] = param_05;
	}
}

//Function Number: 106
lib_A506::func_616E(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A506::func_3D2B();
	lib_A506::func_0812(var_04.animname,param_00,var_04.var_C10,param_01,param_02,param_03);
}

//Function Number: 107
lib_A506::func_0810(param_00,param_01,param_02,param_03)
{
	param_01 = tolower(param_01);
	param_02 = lib_A506::func_3D84(param_02);
	var_04 = lib_A506::func_077D(param_00,param_01,param_02);
	level.var_78B3[param_00][param_02][param_01][var_04] = [];
	level.var_78B3[param_00][param_02][param_01][var_04]["playersound"] = param_03;
}

//Function Number: 108
lib_A506::func_3D84(param_00)
{
	if(!isdefined(param_00))
	{
		return "any";
	}

	return param_00;
}

//Function Number: 109
lib_A506::func_0818(param_00,param_01,param_02)
{
	if(!isdefined(level.var_78AD[param_00]))
	{
		level.var_78AD[param_00] = [];
	}

	level.var_78AD[param_00][param_01] = param_02;
}

//Function Number: 110
lib_A506::func_0805(param_00,param_01,param_02,param_03)
{
	param_02 = tolower(param_02);
	param_01 = lib_A506::func_3D84(param_01);
	var_04 = lib_A506::func_077D(param_00,param_02,param_01);
	var_05 = [];
	var_05["sound"] = param_03;
	var_05["created_by_animSound"] = 1;
	level.var_78B3[param_00][param_01][param_02][var_04] = var_05;
}

//Function Number: 111
lib_A506::func_0806(param_00,param_01,param_02,param_03,param_04)
{
	param_01 = tolower(param_01);
	param_04 = lib_A506::func_3D84(param_04);
	var_05 = lib_A506::func_077D(param_00,param_01,param_04);
	var_06 = [];
	var_06["attach model"] = param_02;
	var_06["selftag"] = param_03;
	level.var_78B3[param_00][param_04][param_01][var_05] = var_06;
}

//Function Number: 112
lib_A506::func_0808(param_00,param_01,param_02,param_03,param_04)
{
	param_01 = tolower(param_01);
	param_04 = lib_A506::func_3D84(param_04);
	var_05 = lib_A506::func_077D(param_00,param_01,param_04);
	var_06 = [];
	var_06["detach model"] = param_02;
	var_06["selftag"] = param_03;
	level.var_78B3[param_00][param_04][param_01][var_05] = var_06;
}

//Function Number: 113
lib_A506::func_0809(param_00,param_01,param_02,param_03)
{
	param_01 = tolower(param_01);
	param_02 = lib_A506::func_3D84(param_02);
	var_04 = lib_A506::func_077D(param_00,param_01,param_02);
	var_05 = [];
	var_05["detach gun"] = 1;
	var_05["tag"] = "tag_weapon_right";
	if(isdefined(param_03))
	{
		var_05["suspend"] = param_03;
	}

	level.var_78B3[param_00][param_02][param_01][var_04] = var_05;
}

//Function Number: 114
lib_A506::func_0807(param_00,param_01,param_02,param_03,param_04)
{
	param_01 = tolower(param_01);
	param_03 = lib_A506::func_3D84(param_03);
	var_05 = lib_A506::func_077D(param_00,param_01,param_03);
	var_06 = [];
	var_06["function"] = param_02;
	var_06["function_args"] = param_04;
	level.var_78B3[param_00][param_03][param_01][var_05] = var_06;
}

//Function Number: 115
lib_A506::func_0813(param_00,param_01,param_02,param_03,param_04,param_05)
{
	common_scripts\utility::getfx(param_03);
	param_01 = tolower(param_01);
	param_02 = lib_A506::func_3D84(param_02);
	var_06 = lib_A506::func_077D(param_00,param_01,param_02);
	var_07 = [];
	var_07["effect"] = param_03;
	var_07["selftag"] = param_04;
	if(isdefined(param_05))
	{
		var_07["moreThanThreeHack"] = param_05;
	}

	level.var_78B3[param_00][param_02][param_01][var_06] = var_07;
}

//Function Number: 116
lib_A506::func_0814(param_00,param_01,param_02,param_03,param_04)
{
	common_scripts\utility::getfx(param_03);
	param_01 = tolower(param_01);
	param_02 = lib_A506::func_3D84(param_02);
	var_05 = lib_A506::func_077D(param_00,param_01,param_02);
	var_06 = [];
	var_06["stop_effect"] = param_03;
	var_06["selftag"] = param_04;
	level.var_78B3[param_00][param_02][param_01][var_05] = var_06;
}

//Function Number: 117
lib_A506::func_6170(param_00,param_01,param_02)
{
	var_03 = lib_A506::func_3D2B();
	common_scripts\utility::add_fx(param_01,param_01);
	lib_A506::func_0815(var_03.animname,param_00,var_03.var_C7F,param_01,param_02);
}

//Function Number: 118
lib_A506::func_616F(param_00,param_01,param_02)
{
	var_03 = lib_A506::func_3D2B();
	common_scripts\utility::add_fx(param_01,param_01);
	lib_A506::func_0814(var_03.animname,param_00,var_03.var_C7F,param_01,param_02);
}

//Function Number: 119
lib_A506::func_0815(param_00,param_01,param_02,param_03,param_04)
{
	common_scripts\utility::getfx(param_03);
	param_01 = tolower(param_01);
	param_02 = lib_A506::func_3D84(param_02);
	var_05 = lib_A506::func_077D(param_00,param_01,param_02);
	var_06 = [];
	var_06["swap_part_to_efx"] = param_03;
	var_06["selftag"] = param_04;
	level.var_78B3[param_00][param_02][param_01][var_05] = var_06;
}

//Function Number: 120
lib_A506::func_6171(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A506::func_3D2B();
	if(param_00 != "start" && !animhasnotetrack(var_06 lib_A59A::func_3EF3(var_06.var_C10),param_00))
	{
		return;
	}

	common_scripts\utility::add_fx(param_03,param_03);
	if(isdefined(param_04))
	{
		common_scripts\utility::add_fx(param_04,param_04);
	}

	lib_A506::func_0816(var_06.animname,param_00,param_01,var_06.var_C10,param_02,param_03,param_04,param_05);
}

//Function Number: 121
lib_A506::func_616D(param_00,param_01,param_02)
{
	var_03 = lib_A506::func_3D2B();
	if(param_00 != "start" && !animhasnotetrack(var_03 lib_A59A::func_3EF3(var_03.var_C10),param_00))
	{
		return;
	}

	common_scripts\utility::add_fx(param_02,param_02);
	lib_A506::func_0813(var_03.animname,param_00,var_03.var_C10,param_02,param_01,1);
}

//Function Number: 122
lib_A506::func_3D2B()
{
	var_00 = level.var_24D7;
	return var_00;
}

//Function Number: 123
lib_A506::func_0816(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	common_scripts\utility::getfx(param_05);
	param_01 = tolower(param_01);
	param_03 = lib_A506::func_3D84(param_03);
	var_08 = lib_A506::func_077D(param_00,param_01,param_03);
	var_09 = [];
	var_09["trace_part_for_efx"] = param_05;
	var_09["trace_part_for_efx_water"] = param_06;
	var_09["trace_part_for_efx_cancel"] = param_02;
	var_09["trace_part_for_efx_delete_depth"] = param_07;
	var_09["selftag"] = param_04;
	level.var_78B3[param_00][param_03][param_01][var_08] = var_09;
	if(isdefined(param_02))
	{
		var_09 = [];
		var_09["trace_part_for_efx_canceling"] = param_02;
		var_09["selftag"] = param_04;
		var_08 = lib_A506::func_077D(param_00,param_02,param_03);
		level.var_78B3[param_00][param_03][param_02][var_08] = var_09;
	}
}

//Function Number: 124
lib_A506::func_080C(param_00,param_01,param_02,param_03)
{
	param_01 = tolower(param_01);
	param_03 = lib_A506::func_3D84(param_03);
	var_04 = lib_A506::func_077D(param_00,param_01,param_03);
	var_05 = [];
	var_05["flag"] = param_02;
	level.var_78B3[param_00][param_03][param_01][var_04] = var_05;
	if(!isdefined(level.flag) || !isdefined(level.flag[param_02]))
	{
		common_scripts\utility::flag_init(param_02);
	}
}

//Function Number: 125
lib_A506::func_080D(param_00,param_01,param_02,param_03)
{
	param_01 = tolower(param_01);
	param_03 = lib_A506::func_3D84(param_03);
	var_04 = lib_A506::func_077D(param_00,param_01,param_03);
	var_05 = [];
	var_05["flag_clear"] = param_02;
	level.var_78B3[param_00][param_03][param_01][var_04] = var_05;
	if(!isdefined(level.flag) || !isdefined(level.flag[param_02]))
	{
		common_scripts\utility::flag_init(param_02);
	}
}

//Function Number: 126
lib_A506::func_080F(param_00,param_01,param_02,param_03)
{
	param_01 = tolower(param_01);
	param_03 = lib_A506::func_3D84(param_03);
	var_04 = lib_A506::func_077D(param_00,param_01,param_03);
	var_05 = [];
	var_05["notify"] = param_02;
	level.var_78B3[param_00][param_03][param_01][var_04] = var_05;
}

//Function Number: 127
lib_A506::func_080E(param_00,param_01,param_02,param_03)
{
	param_01 = tolower(param_01);
	param_03 = lib_A506::func_3D84(param_03);
	var_04 = lib_A506::func_077D(param_00,param_01,param_03);
	var_05 = [];
	var_05["lui_notify"] = param_02;
	level.var_78B3[param_00][param_03][param_01][var_04] = var_05;
}

//Function Number: 128
lib_A506::func_0811(param_00,param_01,param_02,param_03,param_04)
{
	param_01 = tolower(param_01);
	param_04 = lib_A506::func_3D84(param_04);
	var_05 = lib_A506::func_077D(param_00,param_01,param_04);
	var_06 = [];
	var_06["omnvar"] = param_02;
	var_06["value"] = param_03;
	level.var_78B3[param_00][param_04][param_01][var_05] = var_06;
}

//Function Number: 129
lib_A506::func_2B03(param_00)
{
	if(!isdefined(param_00) || param_00)
	{
		self.var_1359 = 1;
		self method_8142(%head,0.2);
		self.var_35C5 = undefined;
		return;
	}

	self.var_1359 = undefined;
}

//Function Number: 130
lib_A506::func_0BC2(param_00,param_01,param_02)
{
	param_00 endon("death");
	self endon(param_01);
	var_03 = 0.05;
	param_00 notify("newLookTarget");
	waittillframeend;
	lib_A506::func_2B03();
	param_00 method_814B(%scripted_talking,5,0.2);
	param_00 method_810D("face_done_" + param_01,param_02,1,0,1);
	thread lib_A506::func_3994(param_00,param_01,param_02);
	thread lib_A506::func_1EEB(param_00,"face_done_" + param_01,param_01);
}

//Function Number: 131
lib_A506::func_3994(param_00,param_01,param_02)
{
	param_00 endon("death");
	param_00 endon("stop_loop");
	self endon(param_01);
	for(;;)
	{
		lib_A506::func_2B03();
		param_00 method_814B(%scripted_talking,5,0.4);
		param_00 method_8153("face_done_" + param_01,param_02,1,0,1);
		wait(0.05);
	}
}

//Function Number: 132
lib_A506::func_0BC4(param_00,param_01)
{
	self endon("death");
	if(isai(self) && !isalive(self))
	{
		return;
	}

	var_02 = 0.05;
	self notify("newLookTarget");
	self endon("newLookTarget");
	waittillframeend;
	if(!isdefined(param_01) && isdefined(self.var_261))
	{
		param_01 = self.var_261;
	}

	if(self method_84F3())
	{
		var_03 = %generic_talker_blend;
	}
	else
	{
		var_04 = self method_8442("jnt_lips_L");
		if(var_04 != -1)
		{
			var_03 = %generic_talker_bs;
		}
		else if(self method_813D())
		{
			var_03 = %generic_talker_axis;
		}
		else
		{
			var_03 = %generic_talker_allies;
		}
	}

	self method_8146(var_03,1,0,1);
	self method_814B(%scripted_talking,5,0.4);
	lib_A506::func_2B03();
	lib_A506::func_7EC8(param_00,var_03);
	var_02 = 0.3;
	self method_8142(%scripted_talking,0.2);
	lib_A506::func_2B03(0);
}

//Function Number: 133
lib_A506::func_7EC8(param_00,param_01)
{
	self endon(param_00);
	for(;;)
	{
		wait(0.2);
		self method_8144(param_01,1,0,1);
		self method_814B(%scripted_talking,5,0.4);
		lib_A506::func_2B03();
	}
}

//Function Number: 134
lib_A506::func_912B(param_00)
{
	self endon("death");
	var_01 = %generic_talker_allies;
	if(self method_813D())
	{
		var_01 = %generic_talker_axis;
	}

	self method_8146(var_01,1,0,1);
	self method_814B(%scripted_talking,5,0.4);
	lib_A506::func_2B03();
	wait(param_00);
	var_02 = 0.3;
	self method_8142(%scripted_talking,0.2);
	lib_A506::func_2B03(0);
}

//Function Number: 135
lib_A506::func_4170(param_00,param_01)
{
	var_02 = param_00[1] - param_01[1];
	var_02 = angleclamp180(var_02);
	return var_02;
}

//Function Number: 136
lib_A506::func_585E(param_00,param_01)
{
	self notify("lookline");
	self endon("lookline");
	self endon(param_01);
	self endon("death");
	wait(0.05);
}

//Function Number: 137
lib_A506::func_0BFE(param_00,param_01,param_02)
{
	var_03 = spawnstruct();
	var_03.count = param_00.size;
	foreach(var_05 in param_00)
	{
		thread lib_A506::func_7173(var_05,param_01,param_02,var_03);
	}

	while(var_03.count)
	{
		var_03 waittill("reached_goal");
	}

	self notify("stopReachIdle");
}

//Function Number: 138
lib_A506::func_7173(param_00,param_01,param_02,param_03)
{
	lib_A506::func_0BFF(param_00,param_01);
	param_03.count--;
	param_03 notify("reached_goal");
	if(param_03.count > 0)
	{
		lib_A506::func_0BE1(param_00,param_02,"stopReachIdle");
	}
}

//Function Number: 139
lib_A506::func_27DE(param_00,param_01,param_02,param_03)
{
	if(animhasnotetrack(param_03,"dialog"))
	{
		self waittillmatch("dialog","face_done_" + param_00);
	}

	if(param_01)
	{
		animscripts\face::func_7825(undefined,param_02,1);
		return;
	}

	animscripts\face::func_7825(undefined,param_02,1,"single dialogue");
}

//Function Number: 140
lib_A506::func_1EEB(param_00,param_01,param_02)
{
	param_00 endon("death");
	param_00 waittillmatch("end",param_01);
	var_03 = 0.3;
	param_00 method_8142(%scripted_talking,0.2);
	lib_A506::func_2B03(0);
}

//Function Number: 141
lib_A506::func_0C39(param_00,param_01,param_02)
{
	var_03 = lib_A506::func_3CC8(param_02);
	var_04 = var_03["origin"];
	var_05 = var_03["angles"];
	common_scripts\utility::array_thread(param_00,::lib_A506::func_7EBD,param_01,var_04,var_05);
}

//Function Number: 142
lib_A506::func_0C3A(param_00,param_01,param_02)
{
	var_03[0] = param_00;
	lib_A506::func_0C39(var_03,param_01,param_02);
}

//Function Number: 143
lib_A506::func_7EBD(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = undefined;
	if(isdefined(param_03))
	{
		var_05 = param_03;
	}
	else
	{
		var_05 = self.animname;
	}

	if(isdefined(param_04) && param_04)
	{
		var_06 = level.var_78A9[var_05][param_00][0];
	}
	else if(isarray(level.var_78A9[var_06][param_01]))
	{
		var_06 = common_scripts\utility::random(level.var_78A9[var_06][param_01]);
	}
	else
	{
		var_06 = level.var_78A9[var_06][param_01];
	}

	if(isai(self))
	{
		var_07 = getstartorigin(param_01,param_02,var_06);
		var_08 = getstartangles(param_01,param_02,var_06);
		if(isdefined(self.var_C38))
		{
			var_07 = lib_A59A::func_4414(var_07);
		}

		self method_81C6(var_07,var_08);
		return;
	}

	if(self.code_classname == "script_vehicle")
	{
		self veh_teleport(getstartorigin(param_01,param_02,var_06),getstartangles(param_01,param_02,var_06));
		return;
	}

	self.var_2E6 = getstartorigin(param_01,param_02,var_06);
	self.var_41 = getstartangles(param_01,param_02,var_06);
}

//Function Number: 144
lib_A506::func_0BAC(param_00,param_01)
{
	var_02 = [];
	var_02["guy"] = self;
	var_02["entity"] = self;
	return var_02;
}

//Function Number: 145
lib_A506::func_0BAB(param_00,param_01)
{
	var_02 = [];
	var_02["guy"] = self;
	var_02["entity"] = param_00;
	var_02["tag"] = param_01;
	return var_02;
}

//Function Number: 146
lib_A506::func_07A4()
{
	if(!isdefined(self.var_C8A))
	{
		self.var_C8A = [];
	}

	var_00 = 0;
	for(var_01 = 0;var_01 < level.var_C8A.size;var_01++)
	{
		if(self == level.var_C8A[var_01])
		{
			var_00 = 1;
			break;
		}
	}

	if(!var_00)
	{
		level.var_C8A[level.var_C8A.size] = self;
	}
}

//Function Number: 147
lib_A506::func_0C13(param_00,param_01,param_02)
{
	param_00 thread lib_A506::func_0C12(param_01,param_02);
}

//Function Number: 148
lib_A506::func_0C11(param_00,param_01,param_02)
{
	common_scripts\utility::array_thread(param_00,::lib_A506::func_0C12,param_01,param_02);
}

//Function Number: 149
lib_A506::func_0C12(param_00,param_01,param_02)
{
	var_03 = undefined;
	if(isdefined(param_02))
	{
		var_03 = param_02;
	}
	else
	{
		var_03 = self.animname;
	}

	var_04 = lib_A59A::func_3EF4(param_00,var_03);
	if(isarray(var_04))
	{
		var_04 = var_04[0];
	}

	self method_8111("single anim",var_04,1,0,param_01);
}

//Function Number: 150
lib_A506::func_0C15(param_00,param_01,param_02)
{
	common_scripts\utility::array_thread(param_00,::lib_A506::func_0C0F,param_01,param_02);
}

//Function Number: 151
lib_A506::func_0C0F(param_00,param_01)
{
	var_02 = lib_A59A::func_3EF3(param_00);
	self method_8117(var_02,param_01);
}

//Function Number: 152
lib_A506::func_5506(param_00,param_01)
{
	if(!isdefined(self.var_5505))
	{
		self.var_5505 = gettime();
		return;
	}

	var_02 = gettime();
	if(self.var_5505 == var_02)
	{
		self endon("death");
		wait(0.05);
	}

	self.var_5505 = var_02;
}

//Function Number: 153
lib_A506::func_7DF7(param_00,param_01)
{
	param_00.var_2563 = ::animscripts\cover_arrival::func_2564;
	param_00.var_8D29 = level.var_78A9[param_00.animname][param_01];
}

//Function Number: 154
lib_A506::func_2399(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_03))
	{
		param_03 = "generic";
	}
	else
	{
		level.var_78AE[param_03] = param_00;
	}

	var_05 = spawnstruct();
	var_05.var_C8E = param_00;
	var_05.model = param_04;
	if(isdefined(param_04))
	{
		level.var_78B2[param_03] = param_04;
	}

	if(isdefined(param_02))
	{
		level.var_78A9[param_03][param_01] = param_02;
	}

	var_05.animname = param_03;
	var_05.var_C10 = param_01;
	level.var_24D7 = var_05;
}