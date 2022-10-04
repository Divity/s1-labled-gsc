/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42450.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 123
 * Decompile Time: 31 ms
 * Timestamp: 4/20/2022 8:23:28 PM
*******************************************************************/

//Function Number: 1
lib_A5D2::func_0F91(param_00)
{
	if(isdefined(param_00))
	{
		lib_A5D2::func_108A(param_00);
	}

	lib_A5DE::func_86EE();
	if(!isdefined(level.var_E57))
	{
		level.var_E57 = spawnstruct();
	}

	if(!isdefined(level.script))
	{
		level.script = tolower(getdvar("mapname"));
	}

	if(!isdefined(level.var_55B))
	{
		level.var_55B = spawnstruct();
	}

	level.var_55B.var_9C20 = 0;
	level.var_55B.var_8F53 = [];
	level.var_55B.var_5BB5 = [];
	level.var_55B.var_7005 = [];
	level.var_55B.var_7000 = [];
	level.var_55B.var_9F04 = 0;
	level.var_55B.var_8E2C = undefined;
	level.var_55B.var_6C24 = spawnstruct();
	level.var_55B.var_6C24.var_57EE = "idle";
	level.var_55B.var_6C24.var_57EF = "idle";
	level.var_B3D = [];
	level.var_B47 = [];
	level.fxfireloopmod = 1;
	level.var_74EF = "";
	level.var_3337 = 0;
	level.var_3338 = 1;
	level.var_333B[level.var_3337] = "";
	level.var_333B[level.var_3338] = "";
	lib_A5D9::func_864D();
	lib_A5D3::func_25B5();
	lib_A5DD::func_1226();
	thread lib_A5D4::func_5CF7();
	lib_A5D8::func_76ED();
	lib_A5DC::func_A305();
	lib_A5DA::func_11A2();
	lib_A5D5::func_5FF1();
	thread lib_A5D2::func_0FB9();
	lib_A5D2::func_28A0(::lib_A5D2::func_2890);
}

//Function Number: 2
lib_A5D2::func_108A(param_00)
{
	if(!isdefined(level.var_55B))
	{
		level.var_55B = spawnstruct();
	}

	level.var_55B.var_56BE = param_00;
}

//Function Number: 3
lib_A5D2::func_0FB9()
{
	if(!isdefined(level.var_55B.var_56BE))
	{
		level.var_55B.var_56BE = 1;
	}

	wait(0.05);
	if(common_scripts\utility::flag_exist("chyron_video_done"))
	{
		common_scripts\utility::flag_wait("chyron_video_done");
	}

	function_007E(1,level.var_55B.var_56BE);
}

//Function Number: 4
lib_A5D2::func_0FAA()
{
	return isdefined(level.var_55B.var_8A40);
}

//Function Number: 5
lib_A5D2::func_1118()
{
	if(!isdefined(level.var_55B))
	{
		level.var_55B = spawnstruct();
	}

	level.var_55B.var_8A40 = 1;
}

//Function Number: 6
lib_A5D2::func_108E()
{
	thread lib_A5D2::func_1118();
}

//Function Number: 7
lib_A5D2::func_10A9(param_00)
{
	level notify(param_00 + "_line_emitter_stop");
}

//Function Number: 8
lib_A5D2::func_0FF4(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = 0.1;
	var_07 = 0.1;
	if(isdefined(param_04))
	{
		var_06 = max(param_04,0);
		var_07 = max(param_04,0);
	}

	if(isdefined(param_05))
	{
		var_07 = max(param_05,0);
	}

	var_08 = spawn("script_origin",(0,0,0));
	var_08.var_9D6 = param_01;
	var_08.is_playing = 0;
	var_08.var_6E1F = param_02;
	var_08.var_6E20 = param_03;
	var_08.var_35DA = var_06;
	var_08.label = param_00;
	var_08 thread lib_A5D2::func_1116();
	level waittill(param_00 + "_line_emitter_stop");
	var_08 scalevolume(0,var_07);
	wait(var_07);
	var_08 lib_A5F1::func_8772();
	wait(0.05);
	var_08 delete();
}

//Function Number: 9
lib_A5D2::func_1116()
{
	level endon(self.label + "_line_emitter_stop");
	var_00 = self.var_6E20 - self.var_6E1F;
	var_01 = vectornormalize(var_00);
	var_02 = distance(self.var_6E1F,self.var_6E20);
	var_03 = 0.1;
	for(;;)
	{
		var_04 = level.var_31D.var_2E6 - self.var_6E1F;
		var_05 = vectordot(var_04,var_01);
		var_05 = clamp(var_05,0,var_02);
		var_06 = self.var_6E1F + var_01 * var_05;
		if(!self.is_playing)
		{
			self.var_2E6 = var_06;
			lib_A5F1::func_8738(self.var_9D6);
			self scalevolume(0);
			wait(0.05);
			self scalevolume(1,self.var_35DA);
			self.is_playing = 1;
		}
		else
		{
			self moveto(var_06,var_03);
		}

		wait(var_03);
	}
}

//Function Number: 10
lib_A5D2::func_0FF7(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A5D2::func_0F30(1,param_02);
	var_05 = lib_A5D2::func_0F30(1,param_03);
	var_06 = spawn("script_origin",param_01);
	lib_A5D2::func_2896(var_06,param_00,var_04,var_05,1);
	return var_06;
}

//Function Number: 11
lib_A5D2::func_10AC(param_00,param_01)
{
	var_02 = lib_A5D2::func_0F30(1,param_01);
	lib_A5D2::func_0F1C(param_00,var_02);
}

//Function Number: 12
lib_A5D2::func_108D(param_00,param_01,param_02)
{
	param_01 = clamp(param_01,0,1);
	var_03 = lib_A5D2::func_0F30(1,param_02);
	param_00 scalevolume(param_01,var_03);
}

//Function Number: 13
lib_A5D2::func_108C(param_00,param_01)
{
	if(param_00 == 1)
	{
		lib_A5D4::func_5CF9("music");
		lib_A5D4::func_5CF3("music",param_01);
	}
	else
	{
		lib_A5D4::func_5CFB("music",param_00,param_01);
		lib_A5D4::func_5CF8("music");
	}

	level.var_55B.var_24D0 = param_00;
}

//Function Number: 14
lib_A5D2::func_1089(param_00,param_01)
{
	if(param_00 == 1)
	{
		lib_A5D4::func_5CF9("ambi");
		lib_A5D4::func_5CF3("ambi",param_01);
	}
	else
	{
		lib_A5D4::func_5CFB("ambi",param_00,param_01);
		lib_A5D4::func_5CF8("ambi");
	}

	level.var_55B.var_24CB = param_00;
}

//Function Number: 15
lib_A5D2::func_0F2F()
{
	var_00 = 1;
	if(isdefined(level.var_55B.var_24D0))
	{
		var_00 = level.var_55B.var_24D0;
	}

	return var_00;
}

//Function Number: 16
lib_A5D2::func_0F2D()
{
	var_00 = 1;
	if(isdefined(level.var_55B.var_24CB))
	{
		var_00 = level.var_55B.var_24CB;
	}

	return var_00;
}

//Function Number: 17
lib_A5D2::func_97B6(param_00)
{
	if(!isdefined(level.var_55B))
	{
		level.var_55B = spawnstruct();
	}

	if(!isdefined(level.var_55B.var_9799))
	{
		level.var_55B.var_9799 = [];
	}

	var_01 = undefined;
	if(isdefined(param_00) && param_00)
	{
		if(isdefined(self.var_3A))
		{
			var_01 = strtok(self.var_3A," ");
		}
	}
	else if(isdefined(self.var_794C))
	{
		var_01 = strtok(self.var_794C," ");
	}
	else if(isdefined(self.var_110E))
	{
		var_01 = strtok(self.var_110E," ");
	}

	if(isdefined(var_01) && var_01.size == 2)
	{
	}
	else if(isdefined(var_01) && var_01.size == 1)
	{
		for(;;)
		{
			self waittill("trigger",var_02);
			lib_A5DD::func_123A(var_01[0],self.script_duration);
		}
	}

	if(isdefined(self.var_7949))
	{
		if(!isdefined(level.var_55B.var_7000[self.var_7949]))
		{
			lib_A5D2::func_102B("Trying to set a progress_map_function without defining the envelope in the level.aud.envs array.");
			self.var_7949 = undefined;
		}
	}

	if(!isdefined(level.var_55B.var_9798))
	{
		level.var_55B.var_9798 = [];
	}

	if(isdefined(self.var_7943))
	{
		level.var_55B.var_9798[level.var_55B.var_9798.size] = self.var_7943;
	}

	if(isdefined(self.var_7945))
	{
		level.var_55B.var_9798[level.var_55B.var_9798.size] = self.var_7945;
	}

	if(isdefined(self.var_7948))
	{
		level.var_55B.var_9798[level.var_55B.var_9798.size] = self.var_7948;
	}

	if(isdefined(self.var_7947))
	{
		level.var_55B.var_9798[level.var_55B.var_9798.size] = self.var_7947;
	}

	if(!isdefined(self.var_7942))
	{
		self.var_7942 = "blend";
	}

	var_03 = undefined;
	var_04 = undefined;
	var_05 = undefined;
	if(isdefined(self.target))
	{
		if(!isdefined(common_scripts\utility::get_target_ent()))
		{
			lib_A5D2::func_102B("Audo Zone Trigger at " + self.var_2E6 + " has defined a target, " + self.target + ", but that target doesn\'t exist.");
			return;
		}

		if(isdefined(lib_A5D2::func_97AE()))
		{
			var_03 = lib_A5D2::func_97AD();
			if(!isdefined(lib_A5D2::func_97AF()))
			{
				lib_A5D2::func_102B("Audo Zone Trigger at " + self.var_2E6 + " has defined a target, " + lib_A5D2::func_97AE() + ", but that target doesn\'t exist.");
				return;
			}

			var_04 = lib_A5D2::func_97B0();
		}
		else
		{
			var_06 = common_scripts\utility::get_target_ent();
			var_07 = 2 * self.var_2E6 - var_06.var_2E6;
			var_08 = vectortoangles(var_07);
			var_03 = lib_A5D2::func_97AD();
			var_04 = var_03 + var_07;
			if(angleclamp180(var_08[0]) < 45)
			{
				var_03 = (var_03[0],var_03[1],0);
				var_04 = (var_04[0],var_04[1],0);
			}
		}

		var_05 = distance(var_03,var_04);
	}

	var_09 = 0;
	for(;;)
	{
		self waittill("trigger",var_02);
		if(lib_A5D2::func_0FAA() && var_02 != level.var_31D)
		{
			continue;
		}

		if(isdefined(var_03) && isdefined(var_04))
		{
			if(isdefined(var_01) && isdefined(var_01[0]) && isdefined(var_01[1]))
			{
				var_0A = lib_A5DD::func_121B();
				if(var_0A == var_01[0])
				{
					var_09 = 0;
				}
				else if(var_0A == var_01[1])
				{
					var_09 = 1;
				}
				else if(var_0A != "")
				{
					var_0B = lib_A5D2::func_97B3(var_03,var_04,var_05,var_02.var_2E6);
					if(var_0B < 0.5)
					{
						lib_A5DD::func_123A(var_01[0]);
						var_09 = 0;
					}
					else
					{
						lib_A5DD::func_123A(var_01[1]);
						var_09 = 1;
					}
				}
				else
				{
				}
			}
			else
			{
				var_0B = lib_A5D2::func_97B3(var_03,var_04,var_05,var_02.var_2E6);
				if(var_0B < 0.5)
				{
					var_09 = 0;
				}
				else
				{
					var_09 = 1;
				}
			}

			if(!var_09)
			{
				if(isdefined(var_01) && isdefined(var_01[0]))
				{
					if(isdefined(level._snd) && isdefined(var_01[1]))
					{
						var_0C = "enter_" + var_01[1];
						lib_A5DE::snd_message("snd_zone_handler",var_0C,var_01[0]);
					}
					else if(isdefined(self.var_7944))
					{
						lib_A5D2::func_28A1(self.var_7944,var_01[0]);
					}
				}
				else if(isdefined(self.var_7944))
				{
					lib_A5D2::func_28A1(self.var_7944,"front");
				}

				if(isdefined(self.var_7943))
				{
					if(isdefined(var_01) && isdefined(var_01[0]))
					{
						if(isdefined(level.var_55B.var_9799[self.var_7943]))
						{
							[[ level.var_55B.var_9799[self.var_7943] ]](var_01[0]);
						}
					}
					else if(isdefined(level.var_55B.var_9799[self.var_7943]))
					{
						[[ level.var_55B.var_9799[self.var_7943] ]]("front");
					}
				}
			}
			else
			{
				if(isdefined(var_01) && isdefined(var_01[1]))
				{
					if(isdefined(level._snd))
					{
						var_0C = "enter_" + var_01[1];
						lib_A5DE::snd_message("snd_zone_handler",var_0C,var_01[1]);
					}
					else if(isdefined(self.var_7944))
					{
						lib_A5D2::func_28A1(self.var_7944,var_01[1]);
					}
				}
				else if(isdefined(self.var_7944))
				{
					lib_A5D2::func_28A1(self.var_7944,"back");
				}

				if(isdefined(self.var_7943))
				{
					if(isdefined(var_01) && isdefined(var_01[1]))
					{
						if(isdefined(level.var_55B.var_9799[self.var_7943]))
						{
							[[ level.var_55B.var_9799[self.var_7943] ]](var_01[1]);
						}
					}
					else if(isdefined(level.var_55B.var_9799[self.var_7943]))
					{
						[[ level.var_55B.var_9799[self.var_7943] ]]("back");
					}
				}
			}
		}
		else
		{
			if(isdefined(self.var_7944))
			{
				lib_A5D2::func_28A1(self.var_7944);
			}

			if(isdefined(self.var_7943))
			{
				if(isdefined(level.var_55B.var_9799[self.var_7943]))
				{
					[[ level.var_55B.var_9799[self.var_7943] ]]();
				}
			}
		}

		var_0D = undefined;
		if(isdefined(lib_A5D2::func_97B1(var_01,var_09)) && isdefined(lib_A5D2::func_97B2(var_01,var_09)))
		{
			var_0D = lib_A5DD::func_123F(lib_A5D2::func_97B1(var_01,var_09),lib_A5D2::func_97B2(var_01,var_09));
			if(isdefined(var_0D))
			{
				var_0D.var_5D32 = self.var_7942;
			}
		}

		if(isdefined(var_0D))
		{
			if(isdefined(var_0D.var_36C8) || isdefined(var_0D.var_36C9))
			{
				if(!level.var_55B.var_A3E0.var_6628.var_36C3)
				{
					lib_A5ED::func_86BC(0);
					lib_A5ED::func_86BC(1);
				}
			}
		}

		var_0E = -1;
		var_0B = -1;
		while(var_02 istouching(self))
		{
			if(isdefined(self.var_7947))
			{
				var_0F = lib_A5D2::func_97B4(var_03,var_04,var_02.var_2E6);
				if(isdefined(level.var_55B.var_9799[self.var_7947]))
				{
					[[ level.var_55B.var_9799[self.var_7947] ]](var_0F);
				}
			}

			if(isdefined(var_03) && isdefined(var_04))
			{
				var_0B = lib_A5D2::func_97B3(var_03,var_04,var_05,var_02.var_2E6);
				if(isdefined(self.var_7949))
				{
					var_0B = lib_A5D2::deprecated_aud_map(var_0B,level.var_55B.var_7000[self.var_7949]);
				}

				if(var_0B != var_0E)
				{
					if(isdefined(lib_A5D2::func_97B1(var_01,var_09)) && isdefined(lib_A5D2::func_97B2(var_01,var_09)))
					{
						lib_A5DD::func_1227(lib_A5D2::func_97B1(var_01,var_09),lib_A5D2::func_97B2(var_01,var_09),var_0B);
					}

					if(isdefined(self.var_794A))
					{
						lib_A5D2::func_28A1(self.var_794A,var_0B);
					}

					if(isdefined(self.var_7948))
					{
						if(isdefined(level.var_55B.var_9799[self.var_7948]))
						{
							[[ level.var_55B.var_9799[self.var_7948] ]](var_0B);
						}
					}

					if(isdefined(var_0D))
					{
						lib_A5D2::func_97AC(var_0B,var_0D,var_09);
					}

					var_0E = var_0B;
					lib_A5DD::func_1229(var_0B);
				}
			}

			if(isdefined(self.var_794B))
			{
				wait(self.var_794B);
				continue;
			}

			wait(0.1);
		}

		if(isdefined(var_03) && isdefined(var_04))
		{
			if(var_0B > 0.5)
			{
				if(isdefined(var_01) && isdefined(var_01[1]))
				{
					lib_A5DD::func_122A(var_01[1]);
				}

				if(isdefined(var_01) && isdefined(var_01[1]))
				{
					if(isdefined(level._snd))
					{
						var_10 = "exit_" + var_01[1];
						lib_A5DE::snd_message("snd_zone_handler",var_10,var_01[1]);
					}
					else if(isdefined(self.var_7946))
					{
						lib_A5D2::func_28A1(self.var_7946,var_01[1]);
					}
				}
				else if(isdefined(self.var_7946))
				{
					lib_A5D2::func_28A1(self.var_7946,"back");
				}

				if(isdefined(self.var_7945))
				{
					if(isdefined(var_01) && isdefined(var_01[1]))
					{
						if(isdefined(level.var_55B.var_9799[self.var_7945]))
						{
							[[ level.var_55B.var_9799[self.var_7945] ]](var_01[1]);
						}
					}
					else if(isdefined(level.var_55B.var_9799[self.var_7945]))
					{
						[[ level.var_55B.var_9799[self.var_7945] ]]("back");
					}
				}

				var_0B = 1;
			}
			else
			{
				if(isdefined(var_01) && isdefined(var_01[0]))
				{
					lib_A5DD::func_122A(var_01[0]);
				}

				if(isdefined(var_01) && isdefined(var_01[0]))
				{
					if(isdefined(level._snd))
					{
						var_10 = "exit_" + var_01[1];
						lib_A5DE::snd_message("snd_zone_handler",var_10,var_01[0]);
					}
					else if(isdefined(self.var_7946))
					{
						lib_A5D2::func_28A1(self.var_7946,var_01[0]);
					}
				}
				else if(isdefined(self.var_7946))
				{
					lib_A5D2::func_28A1(self.var_7946,"front");
				}

				if(isdefined(self.var_7945))
				{
					if(isdefined(var_01) && isdefined(var_01[0]))
					{
						if(isdefined(level.var_55B.var_9799[self.var_7945]))
						{
							[[ level.var_55B.var_9799[self.var_7945] ]](var_01[0]);
						}
					}
					else if(isdefined(level.var_55B.var_9799[self.var_7945]))
					{
						[[ level.var_55B.var_9799[self.var_7945] ]]("front");
					}
				}

				var_0B = 0;
			}

			if(isdefined(var_0D))
			{
				lib_A5D2::func_97AC(var_0B,var_0D,var_09);
			}

			continue;
		}

		if(isdefined(self.var_7946))
		{
			lib_A5D2::func_28A1(self.var_7946);
		}

		if(isdefined(self.var_7945))
		{
			if(isdefined(level.var_55B.var_9799[self.var_7945]))
			{
				[[ level.var_55B.var_9799[self.var_7945] ]]();
			}
		}
	}
}

//Function Number: 18
lib_A5D2::func_97B3(param_00,param_01,param_02,param_03)
{
	var_04 = vectornormalize(param_01 - param_00);
	var_05 = param_03 - param_00;
	var_06 = vectordot(var_05,var_04);
	var_06 = var_06 / param_02;
	return clamp(var_06,0,1);
}

//Function Number: 19
lib_A5D2::func_97B4(param_00,param_01,param_02)
{
	var_03 = vectornormalize(param_01 - param_00);
	var_04 = param_02 - param_00;
	var_05 = vectordot(var_04,var_03);
	return var_03 * var_05 + param_00;
}

//Function Number: 20
lib_A5D2::func_97AC(param_00,param_01,param_02)
{
	param_00 = clamp(param_00,0,1);
	if(param_02)
	{
		param_00 = 1 - param_00;
	}

	var_03 = param_01.var_5D32;
	if(var_03 == "blend")
	{
		var_04 = 1 - param_00;
		var_05 = param_00;
		lib_A5DD::func_123E(var_04,var_05,param_01);
		return;
	}

	if(param_00 < 0.33)
	{
		lib_A5DD::func_123A(param_01.var_A3DB);
		return;
	}

	if(param_00 > 0.66)
	{
		lib_A5DD::func_123A(param_01.var_A3E5);
		return;
	}
}

//Function Number: 21
lib_A5D2::func_97B5(param_00)
{
	if(!isdefined(level.var_55B.var_9799))
	{
		level.var_55B.var_9799 = [];
	}

	for(var_01 = 0;var_01 < param_00.size;var_01++)
	{
		var_02 = param_00[var_01];
		var_03 = var_02[0];
		var_04 = var_02[1];
		level.var_55B.var_9799[var_03] = var_04;
	}

	if(isdefined(level.var_55B.var_9798))
	{
		foreach(var_03 in level.var_55B.var_9798)
		{
		}

		level.var_55B.var_9798 = undefined;
	}
}

//Function Number: 22
lib_A5D2::func_97AE()
{
	var_00 = common_scripts\utility::get_target_ent();
	return var_00.target;
}

//Function Number: 23
lib_A5D2::func_97AD()
{
	var_00 = common_scripts\utility::get_target_ent();
	return var_00.var_2E6;
}

//Function Number: 24
lib_A5D2::func_97AF()
{
	var_00 = common_scripts\utility::get_target_ent();
	return var_00 common_scripts\utility::get_target_ent();
}

//Function Number: 25
lib_A5D2::func_97B0()
{
	var_00 = lib_A5D2::func_97AF();
	return var_00.var_2E6;
}

//Function Number: 26
lib_A5D2::func_97B1(param_00,param_01)
{
	if(!isdefined(param_00) || !isdefined(param_01))
	{
		return undefined;
	}

	if(param_01)
	{
		return param_00[1];
	}

	return param_00[0];
}

//Function Number: 27
lib_A5D2::func_97B2(param_00,param_01)
{
	if(!isdefined(param_00) || !isdefined(param_01))
	{
		return undefined;
	}

	if(param_01)
	{
		return param_00[0];
	}

	return param_00[1];
}

//Function Number: 28
lib_A5D2::func_0FF0(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = spawn("script_origin",level.var_31D.var_2E6);
	var_07 = spawn("script_origin",param_00);
	if(!isdefined(param_03))
	{
		param_03 = distance(var_07.var_2E6,var_06.var_2E6);
	}

	if(!isdefined(param_04))
	{
		var_08 = 30;
		param_04 = 36 * var_08;
	}

	var_09 = lib_A5D2::func_1111(var_07.var_2E6,var_06.var_2E6,param_03,param_04);
	var_09[0] = (var_09[0][0],var_09[0][1],var_06.var_2E6[2]);
	var_09[1] = (var_09[1][0],var_09[1][1],var_06.var_2E6[2]);
	var_0A = distance(var_07.var_2E6,var_09[0]);
	if(!isdefined(param_05))
	{
		param_05 = 1800;
	}

	var_0B = var_0A / param_05;
	if(isdefined(var_09) && var_09.size == 2)
	{
		var_0C = spawn("script_origin",var_07.var_2E6);
		var_0D = spawn("script_origin",var_07.var_2E6);
		var_0C lib_A5F1::func_8724(param_01);
		var_0D lib_A5F1::func_8724(param_02);
		var_0C moveto(var_09[0],var_0B,0,0);
		var_0D moveto(var_09[1],var_0B,0,0);
	}
}

//Function Number: 29
lib_A5D2::func_1111(param_00,param_01,param_02,param_03)
{
	var_04 = param_01 - param_00;
	var_05 = lib_A5D2::func_0EC2(var_04);
	var_06 = lib_A5D2::func_0EC2(var_04);
	var_07 = lib_A5D2::func_10D4(var_05);
	var_08 = 0.5 * param_02 / var_07;
	var_05 = lib_A5D2::func_1073(var_05,var_08);
	var_06 = lib_A5D2::func_1073(var_06,var_08);
	var_05 = lib_A5D2::func_1046(var_05,90);
	var_06 = lib_A5D2::func_1046(var_06,-90);
	var_09 = lib_A5D2::func_10D4(var_04);
	var_0A = param_03 / var_09;
	var_0B = lib_A5D2::func_1073(var_04,var_0A);
	var_0B = var_0B + var_04;
	var_0B = var_0B + var_04;
	var_05 = var_05 + var_0B;
	var_06 = var_06 + var_0B;
	var_0C = [];
	var_0C[0] = var_05;
	var_0C[1] = var_06;
	return var_0C;
}

//Function Number: 30
lib_A5D2::func_0F30(param_00,param_01)
{
	var_02 = param_00;
	if(isdefined(param_01))
	{
		var_02 = param_01;
	}

	return var_02;
}

//Function Number: 31
lib_A5D2::func_1073(param_00,param_01)
{
	return (param_00[0] * param_01,param_00[1] * param_01,param_00[2]);
}

//Function Number: 32
lib_A5D2::func_1072(param_00,param_01)
{
	return (param_00[0] * param_01,param_00[1] * param_01,param_00[2] * param_01);
}

//Function Number: 33
lib_A5D2::func_1046(param_00,param_01)
{
	var_02 = param_00[0] * cos(param_01) - param_00[1] * sin(param_01);
	var_03 = param_00[0] * sin(param_01) + param_00[1] * cos(param_01);
	return (var_02,var_03,param_00[2]);
}

//Function Number: 34
lib_A5D2::func_0EC2(param_00)
{
	var_01 = (0,0,0);
	var_01 = var_01 + param_00;
	return var_01;
}

//Function Number: 35
lib_A5D2::func_10D4(param_00)
{
	return sqrt(param_00[0] * param_00[0] + param_00[1] * param_00[1]);
}

//Function Number: 36
lib_A5D2::func_102C(param_00)
{
	lib_A5D2::func_1028(param_00,"synch_frame");
}

//Function Number: 37
lib_A5D2::func_1028(param_00,param_01)
{
}

//Function Number: 38
lib_A5D2::func_102D(param_00)
{
	lib_A5D2::func_1028(param_00,"warning");
}

//Function Number: 39
lib_A5D2::func_102B(param_00)
{
	lib_A5D2::func_1028(param_00,"error");
}

//Function Number: 40
lib_A5D2::func_102A(param_00)
{
	lib_A5D2::func_1028(param_00);
}

//Function Number: 41
lib_A5D2::func_102E(param_00)
{
	lib_A5D2::func_1028(param_00,"zone");
}

//Function Number: 42
lib_A5D2::func_102F(param_00)
{
	lib_A5D2::func_1028(param_00,"zone_small");
}

//Function Number: 43
lib_A5D2::func_333D(param_00,param_01)
{
	if(isdefined(param_00) && isdefined(param_01))
	{
		return param_00 == param_01;
	}

	return !isdefined(param_00) && !isdefined(param_01);
}

//Function Number: 44
lib_A5D2::func_51DA(param_00)
{
	return !isdefined(param_00);
}

//Function Number: 45
lib_A5D2::func_0F1C(param_00,param_01)
{
	param_00 scalevolume(0,param_01);
	param_00 common_scripts\utility::delaycall(param_01 + 0.05,::stopsounds);
	param_00 common_scripts\utility::delaycall(param_01 + 0.1,::delete);
}

//Function Number: 46
lib_A5D2::func_0F19(param_00,param_01)
{
	param_00 scalevolume(0,param_01);
	wait(param_01 + 0.05);
	param_00 stoploopsound();
	wait(0.05);
	param_00 delete();
}

//Function Number: 47
lib_A5D2::func_0FD4(param_00,param_01)
{
	if(param_00 <= param_01)
	{
		return param_00;
	}

	return param_01;
}

//Function Number: 48
lib_A5D2::func_0FC1(param_00,param_01)
{
	if(param_00 >= param_01)
	{
		return param_00;
	}

	return param_01;
}

//Function Number: 49
lib_A5D2::func_0EB9(param_00,param_01,param_02)
{
	if(param_00 < param_01)
	{
		param_00 = param_01;
	}
	else if(param_00 > param_02)
	{
		param_00 = param_02;
	}

	return param_00;
}

//Function Number: 50
lib_A5D2::func_0F2E(param_00)
{
	if(isarray(param_00))
	{
		return [param_00[0][0],param_00[param_00.size - 1][0]];
	}

	return [param_00.var_3331[0][0],param_00.var_3331[param_00.var_3331.size - 1][0]];
}

//Function Number: 51
lib_A5D2::func_1071(param_00,param_01,param_02)
{
	param_01 = lib_A5D2::func_0F30(1,param_01);
	param_02 = lib_A5D2::func_0F30(1,param_02);
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		param_00[var_03][0] = param_00[var_03][0] * param_01;
		param_00[var_03][1] = param_00[var_03][1] * param_02;
	}

	return param_00;
}

//Function Number: 52
lib_A5D2::func_1095(param_00,param_01,param_02)
{
	return param_00 + param_02 * param_01 - param_00;
}

//Function Number: 53
lib_A5D2::func_0FA9(param_00)
{
	return param_00 == int(param_00 / 2) * 2;
}

//Function Number: 54
lib_A5D2::func_0F18(param_00)
{
	var_01 = 10;
	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	lib_A5D4::func_5CEF("mute_music",0.1);
	wait(0.05);
	lib_A5D4::func_5CF3("mute_music",var_01);
}

//Function Number: 55
lib_A5D2::func_0EB6()
{
	self endon("cleanup");
	if(!isdefined(self.var_88A4))
	{
		self.var_88A4 = 0;
	}

	self waittill("sounddone");
	if(isdefined(self))
	{
		self.var_88A4 = 1;
		self notify("cleanup");
	}
}

//Function Number: 56
lib_A5D2::func_0F7D(param_00)
{
	return lib_A5D2::func_333D(lib_A5DD::func_121B(),param_00);
}

//Function Number: 57
lib_A5D2::func_0F21(param_00)
{
	if(isdefined(level.createfxexploders))
	{
		var_01 = level.createfxexploders["" + param_00];
		if(isdefined(var_01))
		{
			return var_01[0];
		}
	}
	else
	{
		for(var_02 = 0;var_02 < level.createfxent.size;var_02++)
		{
			var_03 = level.createfxent[var_02];
			if(!isdefined(var_03))
			{
				continue;
			}

			if(var_03.v["type"] != "exploder")
			{
				continue;
			}

			if(!isdefined(var_03.v["exploder"]))
			{
				continue;
			}

			if(int(var_03.v["exploder"]) != param_00)
			{
				continue;
			}

			return var_03;
		}
	}

	return undefined;
}

//Function Number: 58
lib_A5D2::func_0EED(param_00,param_01,param_02,param_03)
{
	thread lib_A5D2::func_1112(param_00,param_01,param_02,param_03);
}

//Function Number: 59
lib_A5D2::func_1112(param_00,param_01,param_02,param_03)
{
	param_01 = clamp(param_01,0,10);
	var_04 = 1;
	if(isdefined(param_02))
	{
		var_04 = param_02;
	}

	var_05 = var_04;
	if(isdefined(param_03))
	{
		var_05 = param_03;
	}

	lib_A5D4::func_5CEF(param_00,var_04);
	wait(param_01);
	lib_A5D4::func_5CF3(param_00,var_05);
}

//Function Number: 60
lib_A5D2::func_0FE9(param_00)
{
	return randomintrange(1,100) <= param_00;
}

//Function Number: 61
lib_A5D2::func_10A2(param_00,param_01)
{
	level endon("aud_stop_slow_mo_gunshot");
	var_02 = function_00D6("axis");
	foreach(var_04 in var_02)
	{
		var_04 thread lib_A5D2::func_0F79(param_01);
	}

	var_06 = 0;
	var_07 = level.var_31D getcurrentweapon();
	for(;;)
	{
		if(level.var_31D attackbuttonpressed())
		{
			if(!var_06)
			{
				var_06 = 1;
				[[ param_00 ]](var_07);
			}
		}
		else
		{
			var_06 = 0;
		}

		wait(0.05);
	}
}

//Function Number: 62
lib_A5D2::func_0F79(param_00)
{
	level endon("aud_stop_slow_mo_gunshot");
	var_01 = level.var_31D getcurrentweapon();
	for(;;)
	{
		self waittill("damage",var_02,var_03,var_04,var_05,var_06);
		if(isdefined(var_05))
		{
			[[ param_00 ]](var_01,var_02,var_03,var_05,var_06);
		}
	}
}

//Function Number: 63
lib_A5D2::func_10AD()
{
	level notify("aud_stop_slow_mo_gunshot");
}

//Function Number: 64
lib_A5D2::func_10DC(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_02))
	{
		var_04 = 60;
		if(isdefined(param_03))
		{
			var_04 = param_03;
		}

		var_05 = floor(param_00);
		var_06 = param_00 - var_05 * 100;
		param_00 = var_05 + var_06 * 1 / var_04;
	}

	var_07 = param_00;
	if(isdefined(param_01) && param_01)
	{
		lib_A5D2::func_1094(var_07);
		return;
	}

	wait(var_07);
}

//Function Number: 65
lib_A5D2::func_1094(param_00)
{
	var_01 = spawn("script_origin",(0,0,0));
	var_01 thread lib_A5D2::func_1119(param_00);
	var_01 waittill("slo_mo_wait_done");
	var_01 delete();
}

//Function Number: 66
lib_A5D2::func_1119(param_00)
{
	var_01 = 0;
	while(var_01 < param_00)
	{
		var_02 = getdvarfloat("com_timescale");
		var_01 = var_01 + 0.05 / var_02;
		wait(0.05);
	}

	self notify("slo_mo_wait_done");
}

//Function Number: 67
lib_A5D2::aud_print_3d_on_ent(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(self))
	{
		var_05 = (1,1,1);
		var_06 = (1,0,0);
		var_07 = (0,1,0);
		var_08 = (0,1,1);
		var_09 = 5;
		var_0A = var_05;
		if(isdefined(param_01))
		{
			var_09 = param_01;
		}

		if(isdefined(param_02))
		{
			var_0A = param_02;
			switch(var_0A)
			{
				case "red":
					break;

				case "white":
					break;

				case "blue":
					break;

				case "green":
					break;

				default:
					break;
			}
		}
	}
}

//Function Number: 68
lib_A5D2::audx_print_3d_timer(param_00)
{
	self endon("death");
	wait(param_00);
	if(isdefined(self))
	{
		self notify("aud_stop_3D_print");
	}
}

//Function Number: 69
lib_A5D2::func_0E5D(param_00,param_01)
{
	level.var_55B.var_7000[param_00] = param_01;
}

//Function Number: 70
lib_A5D2::func_0F32(param_00)
{
	if(isdefined(level.var_55B.var_7000[param_00]))
	{
		return level.var_55B.var_7000[param_00];
	}
}

//Function Number: 71
lib_A5D2::func_5012()
{
	if(!isdefined(level.var_55B.var_2668))
	{
		return 1;
	}

	return level.var_55B.var_2668;
}

//Function Number: 72
lib_A5D2::func_0EF0()
{
	level.var_31D.var_2A83 = 0;
	level.var_55B.var_2668 = 1;
}

//Function Number: 73
lib_A5D2::func_0EDE()
{
	level.var_31D.var_2A83 = 1;
	level.var_55B.var_2668 = 0;
}

//Function Number: 74
lib_A5D2::func_7495()
{
	if(lib_A5D2::func_5012() || isdefined(level.var_55B.var_4BFF))
	{
		level.var_55B.var_4BFF = undefined;
		lib_A5D4::func_5CF3("deaths_door",2);
		lib_A5ED::func_86D6(2);
		lib_A5DD::func_122C(0);
		lib_A5DF::func_86C7("deathsdoor");
		level notify("kill_deaths_door_audio");
		level.var_31D method_8493(0);
		level.var_31D method_832F("snd_enveffectsprio_level",1);
		lib_A5DD::func_1233(0);
		lib_A5F1::func_8725("deaths_door_exit");
	}
}

//Function Number: 75
lib_A5D2::func_7E01()
{
	level.var_55B.var_4BFF = 1;
	if(!isdefined(level.var_55B.var_2667))
	{
		level.var_55B.var_2667 = spawnstruct();
	}

	level.var_55B.var_2667.var_74E9 = undefined;
	level.var_55B.var_2667.var_74E9 = level.var_55B.var_24F8;
	if(lib_A5D2::func_5012())
	{
		lib_A5DD::func_122C(1);
		lib_A5DD::func_1233(1);
		level.var_31D method_832E("snd_enveffectsprio_level","sewer",1,0.7,1);
		lib_A5D4::func_5CEF("deaths_door",0.05);
		lib_A5ED::func_86D5("deathsdoor",0.5);
		lib_A5DF::func_86CD("deathsdoor");
		lib_A5F1::func_8725("deaths_door_breaths","kill_deaths_door_audio",undefined,0.25);
		lib_A5F1::func_8739("deaths_door_loop","kill_deaths_door_audio",0.05,1);
		level.var_31D method_8493(1);
	}
}

//Function Number: 76
lib_A5D2::func_108B(param_00)
{
	level.var_55B.var_360C = param_00;
}

//Function Number: 77
lib_A5D2::func_10DD()
{
	wait(0.05);
	while(!common_scripts\utility::flag_exist("missionfailed"))
	{
		wait(0.05);
	}

	var_00 = "shg_mission_failed_stinger";
	common_scripts\utility::flag_wait("missionfailed");
	if(isdefined(level.var_55B.var_360C))
	{
		var_00 = level.var_55B.var_360C;
	}

	if(soundexists(var_00))
	{
		lib_A5D5::func_5FF4(var_00,2,4);
	}
}

//Function Number: 78
lib_A5D2::func_10D2()
{
	level.var_55B.var_9C20 = 1;
	lib_A5DD::func_123D();
	lib_A5D8::func_76F1();
	lib_A5D3::func_25C6();
	lib_A5DC::func_A30B();
	lib_A5DC::func_A307("default");
}

//Function Number: 79
lib_A5D2::func_7EC2(param_00)
{
	lib_A5DE::func_8753(param_00);
	lib_A5D2::func_10D2();
	level.var_55B.var_8F53["map"] = param_00;
}

//Function Number: 80
lib_A5D2::func_3E79()
{
	return lib_A5DE::func_86E6();
}

//Function Number: 81
lib_A5D2::func_7DFC(param_00)
{
	level.var_55B.var_8F53["damb"] = param_00;
}

//Function Number: 82
lib_A5D2::func_3D2A()
{
	if(!isdefined(level.var_55B.var_8F53["damb"]))
	{
		return "soundtables/" + level.script + ".csv";
	}

	return "soundtables/" + level.var_55B.var_8F53["damb"];
}

//Function Number: 83
lib_A5D2::func_7DFA(param_00)
{
	level.var_55B.var_8F53["damb_comp"] = param_00;
}

//Function Number: 84
lib_A5D2::func_3D28(param_00)
{
	if(!isdefined(level.var_55B.var_8F53["damb_comp"]))
	{
		return "soundtables/" + level.script + ".csv";
	}

	return "soundtables/" + level.var_55B.var_8F53["damb_comp"];
}

//Function Number: 85
lib_A5D2::func_7DFB(param_00)
{
	level.var_55B.var_8F53["damb_loops"] = param_00;
}

//Function Number: 86
lib_A5D2::func_3D29(param_00)
{
	if(!isdefined(level.var_55B.var_8F53["damb_loops"]))
	{
		return "soundtables/" + level.script + ".csv";
	}

	return "soundtables/" + level.var_55B.var_8F53["damb_loops"];
}

//Function Number: 87
lib_A5D2::func_7EA2(param_00)
{
	level.var_55B.var_8F53["reverb"] = param_00;
}

//Function Number: 88
lib_A5D2::func_3E51()
{
	if(!isdefined(level.var_55B.var_8F53["reverb"]))
	{
		return "soundtables/" + level.script + ".csv";
	}

	return "soundtables/" + level.var_55B.var_8F53["reverb"];
}

//Function Number: 89
lib_A5D2::func_7F0B(param_00)
{
	level.var_55B.var_8F53["zone"] = param_00;
}

//Function Number: 90
lib_A5D2::func_3ED5()
{
	if(!isdefined(level.var_55B.var_8F53["zone"]))
	{
		return "soundtables/" + level.script + ".csv";
	}

	return "soundtables/" + level.var_55B.var_8F53["zone"];
}

//Function Number: 91
lib_A5D2::func_0F31()
{
	return level.var_55B.var_6C24.var_57EE;
}

//Function Number: 92
lib_A5D2::func_0F34(param_00,param_01,param_02)
{
	var_03 = 0;
	var_04 = lib_A5D2::func_0F33();
	if(isdefined(var_04))
	{
		var_03 = var_04;
	}
	else
	{
		var_05 = 3;
		var_06 = 10;
		var_07 = 100;
		if(isdefined(param_00))
		{
			var_05 = param_00;
		}

		if(isdefined(param_02))
		{
			var_07 = param_02;
		}

		if(isdefined(param_02))
		{
			var_06 = param_01;
		}

		var_08 = 36 * var_07;
		var_09 = 36 * var_06;
		var_0A = function_00D6("bad_guys");
		var_0B = 0;
		var_0C = 0;
		foreach(var_0E in var_0A)
		{
			if(isdefined(var_0E.var_27) && var_0E.var_27 >= var_05)
			{
				var_0F = distance(level.var_31D.var_2E6,var_0E.var_2E6);
				if(var_0F < var_08)
				{
					var_0B++;
					if(var_0F < var_09)
					{
						var_10 = 1;
					}
					else
					{
						var_10 = 1 - var_10 - var_0A / var_09 - var_0A;
					}

					var_0C = var_0C + var_10;
				}
			}
		}

		if(var_0B > 0)
		{
			var_03 = var_0C / var_0B;
		}
		else
		{
			var_03 = 0;
		}
	}

	return var_03;
}

//Function Number: 93
lib_A5D2::func_0F33()
{
	return level.var_55B.var_8E2C;
}

//Function Number: 94
lib_A5D2::func_108F(param_00)
{
	level.var_55B.var_8E2C = param_00;
}

//Function Number: 95
lib_A5D2::func_0EBA()
{
	level.var_55B.var_8E2C = undefined;
}

//Function Number: 96
lib_A5D2::func_0FDB(param_00)
{
	var_01 = 0;
	var_02 = 3600;
	if(isdefined(param_00))
	{
		var_02 = 36 * param_00;
	}

	var_03 = function_00D6("bad_guys");
	foreach(var_05 in var_03)
	{
		if(isalive(var_05))
		{
			var_06 = distance(level.var_31D.var_2E6,var_05.var_2E6);
			if(var_06 < var_02)
			{
				var_01++;
			}
		}
	}

	return var_01;
}

//Function Number: 97
lib_A5D2::func_2896(param_00,param_01,param_02,param_03,param_04)
{
	param_02 = lib_A5D2::func_0EB9(param_02,0,1);
	param_03 = lib_A5D2::func_0FC1(0.05,param_03);
	var_05 = 0;
	if(isdefined(param_04))
	{
		var_05 = param_04;
	}

	if(var_05)
	{
		param_00 lib_A5F1::func_8738(param_01);
	}
	else
	{
		param_00 lib_A5F1::func_8724(param_01);
	}

	param_00 scalevolume(0);
	param_00 common_scripts\utility::delaycall(0.05,::scalevolume,param_02,param_03);
}

//Function Number: 98
lib_A5D2::func_289A(param_00,param_01)
{
	return function_0246(param_00,param_01);
}

//Function Number: 99
lib_A5D2::deprecated_aud_map(param_00,param_01)
{
	return function_0246(param_00,param_01);
}

//Function Number: 100
lib_A5D2::func_2899(param_00,param_01,param_02,param_03)
{
	var_04 = param_00 - param_01 / param_02 - param_01;
	var_04 = clamp(var_04,0,1);
	return function_0246(var_04,param_03);
}

//Function Number: 101
lib_A5D2::func_28A0(param_00)
{
	level.var_55B.var_5BB5[level.var_55B.var_5BB5.size] = param_00;
}

//Function Number: 102
lib_A5D2::func_28A4(param_00,param_01,param_02)
{
	thread lib_A5D2::func_28A5(param_00,param_01,param_02);
}

//Function Number: 103
lib_A5D2::func_28A1(param_00,param_01,param_02)
{
	lib_A5D2::func_28A4(param_00,param_01,param_02);
}

//Function Number: 104
lib_A5D2::func_28A5(param_00,param_01,param_02)
{
	var_03 = 0;
	var_04 = 0;
	foreach(var_06 in level.var_55B.var_5BB5)
	{
		var_04 = self [[ var_06 ]](param_00,param_01);
		if(!var_03 && isdefined(var_04) && var_04 == 1)
		{
			var_03 = var_04;
			continue;
		}

		if(!var_03 && !isdefined(var_04))
		{
			var_03 = 1;
		}
	}

	if(isdefined(param_02))
	{
		self notify(param_02);
	}

	if(!var_03)
	{
		lib_A5D2::func_102D("\tAUDIO MESSAGE NOT HANDLED: " + param_00);
	}
}

//Function Number: 105
lib_A5D2::func_0FF5(param_00,param_01,param_02)
{
	var_03 = 0;
	var_04 = 1;
	var_05 = self;
	if(isdefined(param_02))
	{
		lib_A5D2::func_2891(param_00,param_01,var_03,var_04);
		return;
	}

	lib_A5D2::func_2893(param_00,var_05,param_01,var_03,var_04);
}

//Function Number: 106
lib_A5D2::func_28A9(param_00)
{
	lib_A5F1::func_8724(param_00,"sounddone");
	self waittill("sounddone");
	wait(0.05);
	self delete();
}

//Function Number: 107
lib_A5D2::func_2892(param_00,param_01,param_02,param_03)
{
	lib_A5D2::func_10DC(param_01,param_02,param_03);
	var_04 = spawn("script_origin",level.var_31D.var_2E6);
	var_04 thread lib_A5D2::func_28A9(param_00);
	return var_04;
}

//Function Number: 108
lib_A5D2::func_289B(param_00)
{
	var_01 = spawn("script_origin",level.var_31D.var_2E6);
	var_01 thread lib_A5D2::func_28A9(param_00);
	return var_01;
}

//Function Number: 109
lib_A5D2::func_2891(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = thread lib_A5D2::func_2892(param_00,param_01,param_02,param_03);
	return var_05;
}

//Function Number: 110
lib_A5D2::func_2893(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	thread lib_A5D2::func_2894(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08);
}

//Function Number: 111
lib_A5D2::func_2894(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	lib_A5D2::func_10DC(param_02,param_03,param_04,param_05);
	thread lib_A5D2::func_289D(param_00,param_01,param_06,param_07,param_08,param_09);
}

//Function Number: 112
lib_A5D2::func_28A7(param_00,param_01,param_02,param_03,param_04)
{
	if(param_00 == "loop")
	{
		level endon(param_02 + "internal");
		lib_A5F1::func_8738(param_01);
		level waittill(param_02);
		if(isdefined(self))
		{
			if(isdefined(param_04))
			{
				self scalevolume(0,param_04);
				wait(param_04);
			}

			lib_A5F1::func_8772();
			wait(0.05);
			self delete();
			return;
		}

		return;
	}

	if(param_00 == "oneshot")
	{
		lib_A5F1::func_8724(param_01,"sounddone");
		if(isdefined(param_03))
		{
			self scalevolume(param_03,0);
		}

		self waittill("sounddone");
		if(isdefined(self))
		{
			self delete();
			return;
		}
	}
}

//Function Number: 113
lib_A5D2::func_28A6(param_00,param_01,param_02)
{
	level endon(param_01);
	while(isdefined(self))
	{
		wait(0.1);
	}

	level notify(param_01 + "internal");
	if(isdefined(param_00))
	{
		if(isdefined(param_02))
		{
			param_00 scalevolume(0,param_02);
			wait(param_02);
		}

		param_00 lib_A5F1::func_8772();
		wait(0.05);
		param_00 delete();
	}
}

//Function Number: 114
lib_A5D2::func_289D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = "oneshot";
	if(isdefined(param_02))
	{
		var_08 = param_02;
	}

	var_09 = param_01.var_2E6;
	if(isdefined(param_06))
	{
		var_09 = param_06;
	}

	var_0A = spawn("script_origin",var_09);
	if(isdefined(param_04))
	{
		var_0A linkto(param_01,"tag_origin",param_04,(0,0,0));
	}
	else
	{
		var_0A linkto(param_01);
	}

	if(var_08 == "loop")
	{
		param_01 thread lib_A5D2::func_28A6(var_0A,param_03,param_07);
	}

	var_0A thread lib_A5D2::func_28A7(var_08,param_00,param_03,param_05,param_07);
	return var_0A;
}

//Function Number: 115
lib_A5D2::func_289F(param_00,param_01,param_02)
{
	lib_A5F1::func_8724(param_00,"sounddone");
	if(isdefined(param_02))
	{
		wait(param_02);
		self stopsounds();
	}
	else
	{
		self waittill("sounddone");
	}

	wait(0.05);
	self delete();
}

//Function Number: 116
lib_A5D2::func_289E(param_00,param_01,param_02)
{
	var_03 = spawn("script_origin",param_01);
	var_03 thread lib_A5D2::func_289F(param_00,param_01,param_02);
	return var_03;
}

//Function Number: 117
lib_A5D2::func_28A3(param_00)
{
	lib_A5ED::func_8751(param_00);
}

//Function Number: 118
lib_A5D2::func_28A2(param_00,param_01,param_02,param_03)
{
	lib_A5ED::func_874E(param_00,param_01,param_03);
}

//Function Number: 119
lib_A5D2::func_2895()
{
	self waittill("sounddone");
	lib_A5D2::func_28A8();
}

//Function Number: 120
lib_A5D2::func_28A8()
{
	common_scripts\utility::delaycall(0.05,::delete);
}

//Function Number: 121
lib_A5D2::func_2890(param_00,param_01)
{
	var_02 = 1;
	switch(param_00)
	{
		case "level_fade_to_black":
			break;

		case "generic_building_bomb_shake":
			break;

		case "start_player_slide_trigger":
			break;

		case "end_player_slide_trigger":
			break;

		case "missile_fired":
			break;

		case "msg_audio_fx_ambientExp":
			break;

		case "DEPRECATED_aud_play_sound_at":
			break;

		case "aud_play_dynamic_explosion":
			break;

		case "DEPRECATED_aud_play_conversation":
			break;

		case "xm25_contact_explode":
			break;

		case "light_flicker_on":
			break;

		default:
			break;
	}
}

//Function Number: 122
lib_A5D2::func_2897(param_00)
{
	var_01 = 0;
	switch(param_00.model)
	{
		case "furniture_lamp_table1":
		case "com_cafe_light_part1_off":
		case "furniture_lamp_floor1_off":
			break;

		default:
			break;
	}
}

//Function Number: 123
lib_A5D2::func_289C(param_00,param_01)
{
	var_02 = param_01;
	var_03 = [];
	for(var_04 = 0;var_04 < var_02.size;var_04++)
	{
		var_03[var_04] = var_02[var_04].ent.var_132D;
		var_02[var_04].ent.var_132D = 0;
	}

	foreach(var_06 in var_02)
	{
		if(isdefined(var_06.delay))
		{
			wait(var_06.delay);
		}

		var_07 = spawn("script_origin",(0,0,0));
		var_07 linkto(var_06.ent,"",(0,0,0),(0,0,0));
		var_07 lib_A5F1::func_8724(var_06.sound,"sounddone");
		var_07 waittill("sounddone");
		wait(0.05);
		var_07 delete();
	}

	for(var_04 = 0;var_04 < var_02.size;var_04++)
	{
		var_02[var_04].ent.var_132D = var_03[var_04];
	}
}