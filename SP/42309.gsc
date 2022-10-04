/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42309.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 39
 * Decompile Time: 26 ms
 * Timestamp: 4/20/2022 8:23:18 PM
*******************************************************************/

//Function Number: 1
lib_A545::func_4D78()
{
	var_00 = getentarray("generic_flickering","targetname");
	var_01 = getentarray("generic_pulsing","targetname");
	var_02 = getentarray("generic_double_strobe","targetname");
	var_03 = getentarray("burning_trash_fire","targetname");
	var_04 = getentarray("scripted_light","targetname");
	common_scripts\utility::array_thread(var_00,::lib_A545::func_3C92);
	common_scripts\utility::array_thread(var_01,::lib_A545::func_3C9F);
	common_scripts\utility::array_thread(var_02,::lib_A545::func_3C8C);
	common_scripts\utility::array_thread(var_03,::lib_A545::func_1928);
	common_scripts\utility::array_thread(var_04,::lib_A545::func_4D52);
}

//Function Number: 2
lib_A545::func_5046(param_00)
{
	return param_00.classname == "light_spot" || param_00.classname == "light_omni" || param_00.classname == "light";
}

//Function Number: 3
lib_A545::func_38D6(param_00,param_01,param_02,param_03)
{
	self endon("kill_flicker");
	var_04 = param_00;
	var_05 = 0;
	lib_A59A::func_32DC("stop_flicker");
	for(;;)
	{
		if(lib_A59A::func_32D7("stop_flicker"))
		{
			wait(0.05);
			continue;
		}

		var_06 = var_04;
		var_04 = param_00 + param_01 - param_00 * randomfloat(1);
		if(param_02 != param_03)
		{
			var_05 = var_05 + randomfloatrange(param_02,param_03);
		}
		else
		{
			var_05 = var_05 + param_02;
		}

		if(var_05 == 0)
		{
			var_05 = var_05 + 1E-07;
		}

		var_07 = var_06 - var_04 * 1 / var_05;
		while(var_05 > 0 && !lib_A59A::func_32D7("stop_flicker"))
		{
			self method_8044(var_04 + var_07 * var_05);
			wait(0.05);
			var_05 = var_05 - 0.05;
		}
	}
}

//Function Number: 4
lib_A545::func_5309(param_00)
{
	var_01 = getentarray(param_00,"script_noteworthy");
	var_02 = undefined;
	var_03 = 1E+08;
	foreach(var_05 in var_01)
	{
		var_06 = distance(self.var_2E6,var_05.var_2E6);
		if(var_06 < var_03)
		{
			var_02 = var_05;
			var_03 = var_06;
		}
	}

	if(isdefined(var_02))
	{
		var_02 waittill("damage",var_08,var_09,var_0A,var_0B,var_0C,var_0D,var_0E);
		self notify("kill_flicker");
		wait(0.05);
		self method_8044((0,0,0));
	}
}

//Function Number: 5
lib_A545::func_3C9F()
{
	if(getdvar("r_reflectionProbeGenerate") == "1")
	{
		self setlightintensity(0);
		return;
	}

	var_00 = self getlightintensity();
	var_01 = 0.05;
	var_02 = var_00;
	var_03 = 0.3;
	var_04 = 0.6;
	var_05 = var_00 - var_01 / var_03 / 0.05;
	var_06 = var_00 - var_01 / var_04 / 0.05;
	for(;;)
	{
		var_07 = 0;
		while(var_07 < var_04)
		{
			var_02 = var_02 - var_06;
			var_02 = clamp(var_02,0,100);
			self setlightintensity(var_02);
			var_07 = var_07 + 0.05;
			wait(0.05);
		}

		wait(1);
		var_07 = 0;
		while(var_07 < var_03)
		{
			var_02 = var_02 + var_05;
			var_02 = clamp(var_02,0,100);
			self setlightintensity(var_02);
			var_07 = var_07 + 0.05;
			wait(0.05);
		}

		wait(0.5);
	}
}

//Function Number: 6
lib_A545::func_3C8C()
{
	if(getdvar("r_reflectionProbeGenerate") == "1")
	{
		self setlightintensity(0);
		return;
	}

	var_00 = self getlightintensity();
	var_01 = 0.05;
	var_02 = 0;
	var_03 = undefined;
	var_04 = undefined;
	var_05 = 0;
	var_06 = [];
	if(isdefined(self.var_39B))
	{
		var_07 = getentarray(self.var_39B,"targetname");
		for(var_08 = 0;var_08 < var_07.size;var_08++)
		{
			if(lib_A545::func_5046(var_07[var_08]))
			{
				var_05 = 1;
				var_06[var_06.size] = var_07[var_08];
			}

			if(var_07[var_08].classname == "script_model")
			{
				var_03 = var_07[var_08];
				var_04 = getent(var_03.target,"targetname");
				var_02 = 1;
			}
		}
	}

	for(;;)
	{
		self setlightintensity(var_01);
		if(var_02)
		{
			var_03 hide();
			var_04 show();
		}

		wait(0.8);
		self setlightintensity(var_00);
		if(var_02)
		{
			var_03 show();
			var_04 hide();
		}

		wait(0.1);
		self setlightintensity(var_01);
		if(var_02)
		{
			var_03 hide();
			var_04 show();
		}

		wait(0.12);
		self setlightintensity(var_00);
		if(var_02)
		{
			var_03 show();
			var_04 hide();
		}

		wait(0.1);
	}
}

//Function Number: 7
lib_A545::func_3F38(param_00)
{
	var_01 = getentarray("light_flicker_model","targetname");
	var_02 = [];
	var_03 = common_scripts\utility::getclosest(param_00,var_01);
	if(isdefined(var_03))
	{
		var_02[0] = var_03;
	}

	return var_02;
}

//Function Number: 8
lib_A545::func_3C92()
{
	if(getdvar("r_reflectionProbeGenerate") == "1")
	{
		self setlightintensity(0);
		return;
	}

	self endon("stop_dynamic_light_behavior");
	self endon("death");
	self.var_5789 = 0;
	self.var_57A3 = undefined;
	self.var_9A31 = undefined;
	self.var_5787 = 0;
	self.var_5786 = [];
	self.var_578B = undefined;
	self.var_578D = [];
	if(isdefined(self.script_linkto))
	{
		self.var_578B = common_scripts\utility::get_linked_ents();
		foreach(var_01 in self.var_578B)
		{
			if(isdefined(var_01.var_39B) && var_01.var_39B == "on")
			{
				if(!isdefined(self.var_57A3))
				{
					self.var_57A3[0] = var_01;
				}
				else
				{
					self.var_57A3[self.var_57A3.size] = var_01;
				}

				continue;
			}

			if(isdefined(var_01.var_39B) && var_01.var_39B == "off")
			{
				if(!isdefined(self.var_9A31))
				{
					self.var_9A31[0] = var_01;
				}
				else
				{
					self.var_9A31[self.var_9A31.size] = var_01;
				}

				self.var_9A30 = var_01;
				continue;
			}

			if(lib_A545::func_5046(var_01))
			{
				self.var_5787 = 1;
				self.var_5786[self.var_5786.size] = var_01;
			}
		}

		self.var_5789 = 1;
	}

	if(isdefined(self.var_39B))
	{
		self.var_578D = getentarray(self.var_39B,"targetname");
	}

	if(!self.var_578D.size && !isdefined(self.var_578B))
	{
		self.var_578D = lib_A545::func_3F38(self.var_2E6);
	}

	for(var_03 = 0;var_03 < self.var_578D.size;var_03++)
	{
		if(lib_A545::func_5046(self.var_578D[var_03]))
		{
			self.var_5787 = 1;
			self.var_5786[self.var_5786.size] = self.var_578D[var_03];
		}

		if(self.var_578D[var_03].classname == "script_model")
		{
			var_04 = self.var_578D[var_03];
			if(!isdefined(self.var_57A3))
			{
				self.var_57A3[0] = var_04;
			}
			else
			{
				self.var_57A3[self.var_57A3.size] = var_04;
			}

			if(!isdefined(self.var_9A31))
			{
				self.var_9A31[0] = getent(var_04.target,"targetname");
			}
			else
			{
				self.var_9A31[self.var_9A31.size] = getent(var_04.target,"targetname");
			}

			self.var_5789 = 1;
		}
	}

	if(isdefined(self.var_57A3))
	{
		foreach(var_04 in self.var_57A3)
		{
			if(isdefined(var_04) && isdefined(var_04.script_fxid))
			{
				var_04.effect = common_scripts\utility::createoneshoteffect(var_04.script_fxid);
				var_06 = (0,0,0);
				var_07 = (0,0,0);
				if(isdefined(var_04.script_parameters))
				{
					var_08 = strtok(var_04.script_parameters,", ");
					if(var_08.size < 3)
					{
					}
					else if(var_08.size == 6)
					{
						var_09 = float(var_08[0]);
						var_0A = float(var_08[1]);
						var_0B = float(var_08[2]);
						var_06 = (var_09,var_0A,var_0B);
						var_09 = float(var_08[3]);
						var_0A = float(var_08[4]);
						var_0B = float(var_08[5]);
						var_07 = (var_09,var_0A,var_0B);
					}
					else
					{
						var_09 = float(var_0B[0]);
						var_0A = float(var_0A[1]);
						var_0B = float(var_09[2]);
						var_06 = (var_09,var_0A,var_0B);
					}
				}

				var_04.effect.v["origin"] = var_04.var_2E6 + var_06;
				var_04.effect.v["angles"] = var_04.var_41 + var_07;
			}
		}
	}

	thread lib_A545::func_3C90();
	thread lib_A545::func_3C8F();
}

//Function Number: 9
lib_A545::func_3C90()
{
	lib_A59A::func_32DC("flicker_on");
	if(isdefined(self.var_7A1E) && self.var_7A1E != "nil")
	{
		for(;;)
		{
			level waittill(self.var_7A1E);
			lib_A59A::func_32DD("flicker_on");
			if(isdefined(self.var_7A1F) && self.var_7A1F != "nil")
			{
				level waittill(self.var_7A1F);
				lib_A59A::func_32D9("flicker_on");
			}
		}

		return;
	}

	lib_A59A::func_32DD("flicker_on");
}

//Function Number: 10
lib_A545::func_3C91()
{
	var_00 = self getlightintensity();
	if(!lib_A59A::func_32D7("flicker_on"))
	{
		if(self.var_5789)
		{
			if(isdefined(self.var_57A3))
			{
				foreach(var_02 in self.var_57A3)
				{
					var_02 hide();
					if(isdefined(var_02.effect))
					{
						var_02.effect common_scripts\utility::pauseeffect();
					}
				}
			}

			if(isdefined(self.var_9A31))
			{
				foreach(var_05 in self.var_9A31)
				{
					var_05 show();
				}
			}
		}

		self setlightintensity(0);
		if(self.var_5787)
		{
			for(var_07 = 0;var_07 < self.var_5786.size;var_07++)
			{
				self.var_5786[var_07] setlightintensity(0);
			}
		}

		lib_A59A::func_32DF("flicker_on");
		self setlightintensity(var_00);
		if(self.var_5787)
		{
			for(var_07 = 0;var_07 < self.var_5786.size;var_07++)
			{
				self.var_5786[var_07] setlightintensity(var_00);
			}
		}

		if(self.var_5789)
		{
			if(isdefined(self.var_57A3))
			{
				foreach(var_02 in self.var_57A3)
				{
					var_02 show();
					if(isdefined(var_02.effect))
					{
						var_02.effect lib_A59A::func_748A();
					}
				}
			}

			if(isdefined(self.var_9A31))
			{
				foreach(var_05 in self.var_9A31)
				{
					var_05 hide();
				}

				return;
			}
		}
	}
}

//Function Number: 11
lib_A545::func_3C8F()
{
	self endon("stop_dynamic_light_behavior");
	self endon("death");
	var_00 = 0.2;
	var_01 = 1.5;
	var_02 = self getlightintensity();
	var_03 = 0;
	var_04 = var_02;
	var_05 = 0;
	while(isdefined(self))
	{
		lib_A545::func_3C91();
		for(var_05 = randomintrange(1,10);var_05;var_05--)
		{
			lib_A545::func_3C91();
			wait(randomfloatrange(0.05,0.1));
			if(var_04 > 0.2)
			{
				var_04 = randomfloatrange(0,0.3);
				if(self.var_5789)
				{
					foreach(var_07 in self.var_57A3)
					{
						var_07 hide();
						if(isdefined(var_07.effect))
						{
							var_07.effect common_scripts\utility::pauseeffect();
						}
					}
				}

				if(isdefined(self.var_9A31))
				{
					foreach(var_0A in self.var_9A31)
					{
						var_0A show();
					}
				}
			}
			else
			{
				var_04 = var_02;
				if(self.var_5789)
				{
					if(isdefined(self.var_57A3))
					{
						foreach(var_07 in self.var_57A3)
						{
							var_07 show();
							if(isdefined(var_07.effect))
							{
								var_07.effect lib_A59A::func_748A();
							}
						}
					}

					if(isdefined(self.var_9A31))
					{
						foreach(var_0A in self.var_9A31)
						{
							var_0A hide();
							lib_A5D2::func_28A1("light_flicker_on",var_0A);
						}
					}
				}
			}

			self setlightintensity(var_04);
			if(self.var_5787)
			{
				for(var_10 = 0;var_10 < self.var_5786.size;var_10++)
				{
					self.var_5786[var_10] setlightintensity(var_04);
				}
			}
		}

		lib_A545::func_3C91();
		self setlightintensity(var_02);
		if(self.var_5787)
		{
			for(var_10 = 0;var_10 < self.var_5786.size;var_10++)
			{
				self.var_5786[var_10] setlightintensity(var_02);
			}
		}

		if(self.var_5789)
		{
			if(isdefined(self.var_57A3))
			{
				foreach(var_07 in self.var_57A3)
				{
					var_07 show();
					if(isdefined(var_07.effect))
					{
						var_07.effect lib_A59A::func_748A();
					}
				}
			}

			if(isdefined(self.var_9A31))
			{
				foreach(var_0A in self.var_9A31)
				{
					var_0A hide();
				}
			}
		}

		wait(randomfloatrange(var_00,var_01));
	}
}

//Function Number: 12
lib_A545::func_3CA1()
{
	wait 0.05;
}

//Function Number: 13
lib_A545::func_38D7(param_00,param_01)
{
	var_02 = self getlightintensity();
	var_03 = 0;
	var_04 = var_02;
	var_05 = 0;
	for(;;)
	{
		for(var_05 = randomintrange(1,10);var_05;var_05--)
		{
			wait(randomfloatrange(0.05,0.1));
			if(var_04 > 0.2)
			{
				var_04 = randomfloatrange(0,0.3);
			}
			else
			{
				var_04 = var_02;
			}

			self setlightintensity(var_04);
		}

		self setlightintensity(var_02);
		wait(randomfloatrange(param_00,param_01));
	}
}

//Function Number: 14
lib_A545::func_1928()
{
	if(getdvar("r_reflectionProbeGenerate") == "1")
	{
		self setlightintensity(0);
		return;
	}

	var_00 = self getlightintensity();
	var_01 = var_00;
	for(;;)
	{
		var_02 = randomfloatrange(var_00 * 0.7,var_00 * 1.2);
		var_03 = randomfloatrange(0.3,0.6);
		var_03 = var_03 * 20;
		for(var_04 = 0;var_04 < var_03;var_04++)
		{
			var_05 = var_02 * var_04 / var_03 + var_01 * var_03 - var_04 / var_03;
			self setlightintensity(var_05);
			wait(0.05);
		}

		var_01 = var_02;
	}
}

//Function Number: 15
lib_A545::func_8F59(param_00,param_01,param_02,param_03)
{
	var_04 = 360 / param_02;
	var_05 = 0;
	for(;;)
	{
		var_06 = sin(var_05 * var_04) * 0.5 + 0.5;
		self setlightintensity(param_00 + param_01 - param_00 * var_06);
		wait(0.05);
		var_05 = var_05 + 0.05;
		if(var_05 > param_02)
		{
			var_05 = var_05 - param_02;
		}

		if(isdefined(param_03))
		{
			if(common_scripts\utility::flag(param_03))
			{
				return;
			}
		}
	}
}

//Function Number: 16
lib_A545::func_1C80(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	thread lib_A545::func_1C81(param_00,param_01,param_02,param_03);
}

//Function Number: 17
lib_A545::func_1C81(param_00,param_01,param_02,param_03)
{
	var_04 = self method_8043();
	var_05 = 1 / param_01 * 2 - param_02 + param_03;
	var_06 = 0;
	if(var_06 < param_02)
	{
		var_07 = var_05 / param_02;
		while(var_06 < param_02)
		{
			var_08 = var_07 * var_06 * var_06;
			self method_8044(vectorlerp(var_04,param_00,var_08));
			wait(0.05);
			var_06 = var_06 + 0.05;
		}
	}

	while(var_06 < param_01 - param_03)
	{
		var_08 = var_05 * 2 * var_06 - param_02;
		self method_8044(vectorlerp(var_04,param_00,var_08));
		wait(0.05);
		var_06 = var_06 + 0.05;
	}

	var_06 = param_01 - var_06;
	if(var_06 > 0)
	{
		var_07 = var_05 / param_03;
		while(var_06 > 0)
		{
			var_08 = 1 - var_07 * var_06 * var_06;
			self method_8044(vectorlerp(var_04,param_00,var_08));
			wait(0.05);
			var_06 = var_06 - 0.05;
		}
	}

	self method_8044(param_00);
}

//Function Number: 18
lib_A545::func_9259()
{
	thread lib_A545::func_99C6();
	thread lib_A545::func_99C5();
}

//Function Number: 19
lib_A545::func_99C6()
{
	self endon("light_off");
	var_00 = self getlightintensity();
	var_01 = var_00;
	for(;;)
	{
		var_02 = randomfloatrange(var_00 * 0.7,var_00 * 1.2);
		var_03 = randomfloatrange(0.3,1.2);
		var_03 = var_03 * 20;
		for(var_04 = 0;var_04 < var_03;var_04++)
		{
			var_05 = var_02 * var_04 / var_03 + var_01 * var_03 - var_04 / var_03;
			self setlightintensity(var_05);
			wait(0.05);
		}

		var_01 = var_02;
	}
}

//Function Number: 20
lib_A545::func_99C5()
{
	self endon("light_off");
	var_00 = 0.5;
	var_01 = 0.5;
	var_02 = [];
	var_03 = [];
	for(var_04 = 0;var_04 < 3;var_04++)
	{
		var_02[var_04] = 0;
		var_03[var_04] = 0;
	}

	for(;;)
	{
		for(var_04 = 0;var_04 < var_02.size;var_04++)
		{
			var_03[var_04] = var_02[var_04];
			var_02[var_04] = randomfloat(var_00) + var_01;
		}

		var_05 = randomfloatrange(0.3,1.2);
		var_05 = var_05 * 20;
		for(var_04 = 0;var_04 < var_05;var_04++)
		{
			var_06 = [];
			for(var_07 = 0;var_07 < var_02.size;var_07++)
			{
				var_06[var_07] = var_02[var_07] * var_04 / var_05 + var_03[var_07] * var_05 - var_04 / var_05;
			}

			self method_8044((var_06[0],var_06[1],var_06[2]));
			wait(0.05);
		}
	}
}

//Function Number: 21
lib_A545::sun_shadow_trigger(param_00)
{
	var_01 = 1;
	if(isdefined(param_00.script_duration))
	{
		var_01 = param_00.script_duration;
	}

	for(;;)
	{
		param_00 waittill("trigger",var_02);
		param_00 lib_A545::set_sun_shadow_params(var_01);
		while(var_02 istouching(param_00))
		{
			wait(0.25);
		}
	}
}

//Function Number: 22
lib_A545::set_sun_shadow_params(param_00)
{
	var_01 = getdvarint("sm_sunenable",1);
	var_02 = getdvarfloat("sm_sunshadowscale",1);
	var_03 = getdvarint("sm_spotlimit",4);
	var_04 = getdvarfloat("sm_sunsamplesizenear",0.25);
	var_05 = getdvarfloat("sm_qualityspotshadow",1);
	if(isdefined(self.script_sunenable))
	{
		var_01 = self.script_sunenable;
	}

	if(isdefined(self.script_sunshadowscale))
	{
		var_02 = self.script_sunshadowscale;
	}

	if(isdefined(self.script_spotlimit))
	{
		var_03 = self.script_spotlimit;
	}

	if(isdefined(self.script_sunsamplesizenear))
	{
		var_04 = self.script_sunsamplesizenear;
	}

	var_04 = min(max(0.016,var_04),32);
	if(isdefined(self.script_qualityspotshadow))
	{
		var_05 = self.script_qualityspotshadow;
	}

	var_06 = getdvarint("sm_sunenable",1);
	var_07 = getdvarfloat("sm_sunshadowscale",1);
	var_08 = getdvarint("sm_spotlimit",4);
	var_09 = getdvarint("sm_qualityspotshadow",1);
	function_00D3("sm_sunenable",var_01);
	function_00D3("sm_sunshadowscale",var_02);
	function_00D3("sm_spotlimit",var_03);
	function_00D3("sm_qualityspotshadow",var_05);
	lib_A545::lerp_sunsamplesizenear_overtime(var_04,param_00);
}

//Function Number: 23
lib_A545::lerp_sunsamplesizenear_overtime(param_00,param_01)
{
	level notify("changing_sunsamplesizenear");
	level endon("changing_sunsamplesizenear");
	var_02 = getdvarfloat("sm_sunSampleSizeNear",0.25);
	if(param_00 == var_02)
	{
		return;
	}

	var_03 = param_00 - var_02;
	var_04 = param_01 / 0.05;
	if(var_04 > 0)
	{
		var_05 = var_03 / var_04;
		var_06 = var_02;
		for(var_07 = 0;var_07 < var_04;var_07++)
		{
			var_06 = var_06 + var_05;
			function_00D3("sm_sunSampleSizeNear",var_06);
			wait(0.05);
		}
	}

	function_00D3("sm_sunSampleSizeNear",param_00);
}

//Function Number: 24
lib_A545::func_4D52()
{
	lib_A545::func_4D08();
	lib_A545::func_4D05();
}

//Function Number: 25
lib_A545::func_4D08()
{
	self.var_57A3 = [];
	self.var_9A31 = [];
	self.var_5787 = [];
	if(isdefined(self.target))
	{
		var_00 = getentarray(self.target,"targetname");
		if(var_00.size == 0)
		{
			return;
		}

		foreach(var_02 in var_00)
		{
			if(lib_A545::func_5046(var_02))
			{
				self.var_5787[self.var_5787.size] = var_02;
				var_02 lib_A545::func_4D08();
				continue;
			}

			var_03 = 1;
			if(isdefined(var_02.var_39B))
			{
				if(var_02.var_39B == "on")
				{
					var_03 = 0;
					lib_A545::func_4D09(var_02);
				}
				else if(var_02.var_39B == "off")
				{
					var_03 = 0;
					self.var_9A31[self.var_9A31.size] = var_02;
				}
			}

			if(var_03)
			{
				lib_A545::func_4D09(var_02);
				var_04 = getentarray(var_02.target,"targetname");
				foreach(var_06 in var_04)
				{
					self.var_9A31[self.var_9A31.size] = var_06;
				}
			}
		}

		foreach(var_02 in self.var_57A3)
		{
			var_02.var_9E51 = 1;
		}

		foreach(var_02 in self.var_9A31)
		{
			var_02.var_9E51 = 0;
			var_02 hide();
		}
	}
}

//Function Number: 26
lib_A545::func_4D09(param_00)
{
	self.var_57A3[self.var_57A3.size] = param_00;
	var_01 = undefined;
	var_02 = undefined;
	var_03 = undefined;
	if(isdefined(param_00.script_fxid))
	{
		var_01 = self.script_fxid;
		var_02 = param_00.var_2E6;
		var_03 = param_00.var_41;
	}
	else if(isdefined(param_00.target))
	{
		var_04 = common_scripts\utility::getstruct(param_00.target,"targetname");
		if(isdefined(var_04) && isdefined(var_04.script_fxid))
		{
			var_01 = var_04.script_fxid;
			var_02 = var_04.var_2E6;
			var_03 = (0,0,0);
			if(isdefined(var_04.var_41))
			{
				var_03 = var_04.var_41;
			}
		}
	}

	if(isdefined(var_01))
	{
		param_00.effect = common_scripts\utility::createoneshoteffect(var_01);
		param_00.effect.v["origin"] = var_02;
		param_00.effect.v["angles"] = var_03;
	}
}

//Function Number: 27
lib_A545::func_704E()
{
	self endon("stop_scripted_light");
	self endon("death");
	for(;;)
	{
		lib_A59A::func_7B1A();
		var_00 = self.var_7A15;
		var_01 = self.var_7A15 + self.var_7A14 - self.var_7A15 * 0.4;
		var_02 = self.var_7A14 - self.var_7A14 - self.var_7A15 * 0.4;
		var_03 = self.var_7A14;
		var_04 = randomintrange(self.var_7979,self.var_7978);
		for(var_05 = 0;var_05 < var_04;var_05++)
		{
			var_06 = randomfloatrange(var_00,var_01);
			lib_A545::func_568A(var_06,lib_A545::func_3D2E());
			lib_A59A::script_delay();
			var_06 = randomfloatrange(var_02,var_03);
			lib_A545::func_568A(var_06,lib_A545::func_3D2E());
		}

		lib_A545::func_568A(self.var_7A14,lib_A545::func_3D2E());
	}
}

//Function Number: 28
lib_A545::func_568A(param_00,param_01)
{
	var_02 = int(param_01 * 20);
	var_03 = self getlightintensity();
	var_04 = param_00 - var_03 / var_02;
	for(var_05 = 0;var_05 < var_02;var_05++)
	{
		thread lib_A545::func_45B1(param_00);
		self setlightintensity(var_03 + var_05 * var_04);
		wait(0.05);
	}

	var_06[0] = self;
	if(isdefined(self.var_5787))
	{
		var_06 = common_scripts\utility::array_combine(var_06,self.var_5787);
	}

	foreach(var_08 in var_06)
	{
		var_08 thread lib_A545::func_45B1(param_00);
		var_08 setlightintensity(param_00);
	}
}

//Function Number: 29
lib_A545::func_45B1(param_00)
{
	var_01 = param_00 > self.script_threshold;
	foreach(var_03 in self.var_57A3)
	{
		if(var_01 && !var_03.var_9E51)
		{
			var_03.var_9E51 = var_01;
			var_03 show();
			if(isdefined(var_03.effect))
			{
				var_03.effect thread lib_A59A::func_748A();
			}

			continue;
		}

		if(!var_01 && var_03.var_9E51)
		{
			var_03.var_9E51 = var_01;
			var_03 hide();
			if(isdefined(var_03.effect))
			{
				var_03.effect thread common_scripts\utility::pauseeffect();
			}
		}
	}

	foreach(var_03 in self.var_9A31)
	{
		if(!var_01 && !var_03.var_9E51)
		{
			var_03.var_9E51 = 1;
			var_03 show();
			continue;
		}

		if(var_01 && var_03.var_9E51)
		{
			var_03.var_9E51 = 0;
			var_03 hide();
		}
	}
}

//Function Number: 30
lib_A545::func_3D2E()
{
	return randomfloatrange(self.script_delay_min,self.script_delay_max);
}

//Function Number: 31
lib_A545::func_4D05()
{
	var_00["pulse"] = ::lib_A545::func_2772;
	var_00["neon"] = ::lib_A545::func_276D;
	var_00["fire"] = ::lib_A545::func_276A;
	[[ var_00[self.var_7A1D] ]]();
}

//Function Number: 32
lib_A545::func_2772()
{
	lib_A545::func_7E08(0.1,0.2);
	lib_A545::func_7EFE(1,4);
	lib_A545::func_7DF3(3,6);
	lib_A545::func_7ED3(0.5);
	var_00 = self getlightintensity();
	lib_A545::func_7E5C(var_00 * 0.25,var_00);
	thread lib_A545::func_704E();
}

//Function Number: 33
lib_A545::func_276D()
{
	lib_A545::func_7E08(0.05,0.1);
	lib_A545::func_7EFE(2,5);
	lib_A545::func_7DF3(1,3);
	lib_A545::func_7ED3(0.5);
	var_00 = self getlightintensity();
	lib_A545::func_7E5C(var_00 * 0.1,var_00);
	thread lib_A545::func_704E();
}

//Function Number: 34
lib_A545::func_276A()
{
	lib_A545::func_7E08(0.05,0.1);
	lib_A545::func_7EFE(0.05,0.1);
	lib_A545::func_7DF3(1,2);
	lib_A545::func_7ED3(0.5);
	var_00 = self getlightintensity();
	lib_A545::func_7E5C(var_00 * 0.75,var_00);
	thread lib_A545::func_704E();
}

//Function Number: 35
lib_A545::func_7ED3(param_00)
{
	if(!isdefined(self.script_threshold))
	{
		self.script_threshold = param_00;
	}

	foreach(var_02 in self.var_5787)
	{
		if(!isdefined(var_02.script_threshold))
		{
			var_02.script_threshold = self.script_threshold;
		}
	}
}

//Function Number: 36
lib_A545::func_7E08(param_00,param_01)
{
	if(!isdefined(self.script_delay_min))
	{
		self.script_delay_min = param_00;
	}

	if(!isdefined(self.script_delay_max))
	{
		self.script_delay_max = param_01;
	}
}

//Function Number: 37
lib_A545::func_7EFE(param_00,param_01)
{
	if(!isdefined(self.var_7B1D))
	{
		self.var_7B1D = param_00;
	}

	if(!isdefined(self.var_7B1C))
	{
		self.var_7B1C = param_01;
	}
}

//Function Number: 38
lib_A545::func_7DF3(param_00,param_01)
{
	if(!isdefined(self.var_7979))
	{
		self.var_7979 = param_00;
	}

	if(!isdefined(self.var_7978))
	{
		self.var_7978 = param_01;
	}
}

//Function Number: 39
lib_A545::func_7E5C(param_00,param_01)
{
	if(!isdefined(self.var_7A15))
	{
		self.var_7A15 = param_00;
	}

	if(!isdefined(self.var_7A14))
	{
		self.var_7A14 = param_01;
	}
}