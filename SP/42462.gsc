/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42462.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 23
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:44 PM
*******************************************************************/

//Function Number: 1
lib_A5DE::func_86EE()
{
	if(!isdefined(level._snd))
	{
		level._snd = spawnstruct();
		level._snd.assistedsuicide = 0;
		level._snd.var_2790 = 1;
		thread lib_A5DE::func_86F2();
		lib_A5DE::func_86C0();
		lib_A5EF::func_86EC();
		lib_A5DE::func_8753(level.script);
		lib_A5ED::func_86FE();
		lib_A5ED::func_86D7();
		lib_A5F2::func_8776();
		lib_A5EE::func_86DA();
		lib_A5DE::snd_message_init();
		lib_A5DF::func_86BE();
	}
}

//Function Number: 2
lib_A5DE::func_86F2()
{
	level._snd.var_5026 = 1;
	waittillframeend;
	level._snd.var_5026 = 0;
}

//Function Number: 3
lib_A5DE::func_86FA()
{
	return level._snd.var_5026;
}

//Function Number: 4
lib_A5DE::snd_message_init()
{
	level._snd.messages = [];
}

//Function Number: 5
lib_A5DE::snd_register_message(param_00,param_01)
{
	level._snd.messages[param_00] = param_01;
}

//Function Number: 6
lib_A5DE::snd_music_message(param_00,param_01,param_02)
{
	level notify("stop_other_music");
	level endon("stop_other_music");
	if(isdefined(param_02))
	{
		childthread lib_A5DE::snd_message("snd_music_handler",param_00,param_01,param_02);
		return;
	}

	if(isdefined(param_01))
	{
		childthread lib_A5DE::snd_message("snd_music_handler",param_00,param_01);
		return;
	}

	childthread lib_A5DE::snd_message("snd_music_handler",param_00);
}

//Function Number: 7
lib_A5DE::snd_message(param_00,param_01,param_02,param_03)
{
	if(isdefined(level._snd.messages[param_00]))
	{
		if(isdefined(param_03))
		{
			thread [[ level._snd.messages[param_00] ]](param_01,param_02,param_03);
			return;
		}

		if(isdefined(param_02))
		{
			thread [[ level._snd.messages[param_00] ]](param_01,param_02);
			return;
		}

		if(isdefined(param_01))
		{
			thread [[ level._snd.messages[param_00] ]](param_01);
			return;
		}

		thread [[ level._snd.messages[param_00] ]]();
		return;
	}
}

//Function Number: 8
lib_A5DE::func_8745(param_00)
{
}

//Function Number: 9
lib_A5DE::func_8746(param_00)
{
}

//Function Number: 10
lib_A5DE::func_86E7(param_00,param_01)
{
	var_02 = undefined;
	if(isarray(param_01))
	{
		var_02 = param_01[param_00];
	}

	return var_02;
}

//Function Number: 11
lib_A5DE::func_86E5()
{
	return gettime() * 0.001;
}

//Function Number: 12
lib_A5DE::func_8712()
{
	level._snd.assistedsuicide++;
	return level._snd.assistedsuicide;
}

//Function Number: 13
lib_A5DE::func_8702(param_00,param_01)
{
	return function_0246(param_00,param_01);
}

//Function Number: 14
lib_A5DE::func_86D9()
{
	var_00 = newhudelem();
	var_00.x = 0;
	var_00.y = 0;
	var_00 setshader("white",640,480);
	var_00.alignx = "left";
	var_00.aligny = "top";
	var_00.fontscale = 1;
	var_00.horzalign = "fullscreen";
	var_00.vertalign = "fullscreen";
	var_00.alpha = 1;
	var_00.foreground = 1;
	wait(0.05);
	var_00 destroy();
}

//Function Number: 15
lib_A5DE::func_875A(param_00)
{
}

//Function Number: 16
lib_A5DE::func_8774()
{
	if(self.count >= self.var_59F7)
	{
		wait(0.05);
	}
	else
	{
		self.count++;
	}

	if(!self.var_7434)
	{
		thread lib_A5DE::func_8775();
	}
}

//Function Number: 17
lib_A5DE::func_8775()
{
	self.var_7434 = 1;
	waittillframeend;
	self.var_7434 = 0;
	self.count = 0;
}

//Function Number: 18
lib_A5DE::func_86E8(param_00)
{
	var_01 = spawnstruct();
	var_01.name = "throttle_waiter";
	var_01.count = 0;
	var_01.var_7434 = 0;
	var_02 = 10;
	if(isdefined(param_00))
	{
		var_02 = max(param_00,1);
	}

	var_01.var_59F7 = var_02;
	return var_01;
}

//Function Number: 19
lib_A5DE::func_8753(param_00)
{
	level._snd.var_88AA = param_00;
}

//Function Number: 20
lib_A5DE::func_86E6()
{
	return level._snd.var_88AA;
}

//Function Number: 21
lib_A5DE::func_8714(param_00,param_01,param_02)
{
	var_03 = [];
	for(var_04 = 0;var_04 < param_02;var_04++)
	{
		var_05 = tablelookupbyrow(param_00,param_01,var_04);
		var_03[var_05] = var_04;
	}

	return var_03;
}

//Function Number: 22
lib_A5DE::func_8715(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = [];
	for(var_06 = 0;var_06 < param_01.size;var_06++)
	{
		var_07 = param_01[var_06];
		var_08 = 0;
		var_09 = undefined;
		var_0A = 0;
		var_0B = 0;
		var_0C = undefined;
		var_0D = "";
		var_0E = function_028F(var_07,param_03,param_04);
		if(isdefined(var_0E))
		{
			while(var_0A < 10 && var_08 + var_0E[0] < var_0E[1])
			{
				var_0F = tablelookupbyrow(var_07,var_08 + var_0E[0],var_0B);
				if(var_0F != "")
				{
					var_0A = 0;
					if(!isdefined(var_09))
					{
						var_09 = lib_A5DE::func_8714(var_07,var_08 + var_0E[0],param_02);
						var_0B = var_09[param_03];
					}
					else
					{
						var_10 = 0;
						if(!isdefined(var_0C))
						{
							var_10 = 1;
						}
						else if(var_0F != var_0D)
						{
							var_05[var_0D] = var_0C;
							var_10 = 1;
						}

						if(var_10)
						{
							var_0C = spawnstruct();
							var_0C.name = var_0F;
							var_0C.var_802E = [];
							var_0D = var_0F;
						}

						var_11 = [];
						foreach(var_15, var_13 in var_09)
						{
							var_14 = tablelookupbyrow(var_07,var_08 + var_0E[0],var_13);
							if(var_15 == param_03)
							{
								if(var_14 != var_0D)
								{
									break;
								}

								continue;
							}

							if(lib_A59A::func_5083(var_14))
							{
								var_11[var_15] = float(var_14);
								continue;
							}

							var_11[var_15] = var_14;
						}

						var_0C.var_802E[var_0C.var_802E.size] = var_11;
					}

					continue;
				}

				if(isdefined(var_0C))
				{
					var_05[var_0D] = var_0C;
					var_0C = undefined;
				}

				var_0A++;
				var_08++;
			}

			if(isdefined(var_0C))
			{
				var_05[var_0D] = var_0C;
				var_0C = undefined;
			}
		}
	}

	return var_05;
}

//Function Number: 23
lib_A5DE::func_86C0()
{
}