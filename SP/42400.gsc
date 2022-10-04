/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42400.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 209
 * Decompile Time: 83 ms
 * Timestamp: 4/20/2022 8:23:27 PM
*******************************************************************/

//Function Number: 1
lib_A5A0::func_8285(param_00)
{
	var_01 = [];
	if(isdefined(param_00.var_79F7))
	{
		return level.var_9CC0[param_00.var_79F7];
	}

	return var_01;
}

//Function Number: 2
lib_A5A0::func_82DD()
{
	var_00 = lib_A5A0::func_05BE();
	foreach(var_02 in var_00)
	{
		var_02 thread lib_A5A0::func_9D3B();
	}
}

//Function Number: 3
lib_A5A0::func_9D3B()
{
	self endon("entitydeleted");
	if(isdefined(self.var_7A17))
	{
		var_00 = self.var_7A17;
		if(!isdefined(level.var_9CEC[var_00]))
		{
			level.var_9CEC[var_00] = [];
		}

		level.var_9CEC[var_00][level.var_9CEC[var_00].size] = self;
	}

	if(isdefined(self.var_7982))
	{
		thread lib_A577::func_9D3E();
	}

	thread lib_A5A0::func_9CFC();
	self.count = 1;
	self.var_88FA = [];
	for(;;)
	{
		var_01 = undefined;
		self waittill("spawned",var_01);
		self.count--;
		if(!isdefined(var_01))
		{
			continue;
		}

		var_01.var_88F8 = self.var_88FA;
		var_01.spawner = self;
		var_01 thread lib_A577::func_76B3();
	}
}

//Function Number: 4
lib_A5A0::func_9CFC()
{
	if(!isdefined(self.var_7B0C))
	{
		return;
	}

	if(!isdefined(self.script_linkto))
	{
		return;
	}

	var_00 = getentarray(self.script_linkto,"script_linkname");
	if(var_00.size == 0)
	{
		return;
	}

	var_01 = var_00[0].targetname;
	var_00 = getentarray(var_01,"targetname");
	var_02 = undefined;
	foreach(var_04 in var_00)
	{
		if(var_04.classname == "script_origin")
		{
			var_02 = var_04;
		}

		var_04 hide();
	}

	foreach(var_04 in var_00)
	{
		if(var_04 != var_02)
		{
			var_04 linkto(var_02);
		}
	}

	self waittill("spawned",var_08);
	foreach(var_04 in var_00)
	{
		var_04 show();
		if(var_04 != var_02)
		{
			var_04 linkto(var_08);
		}
	}

	var_08 waittill("death");
	common_scripts\utility::array_call(var_00,::delete);
}

//Function Number: 5
lib_A5A0::func_508E()
{
	if(!isdefined(self.classname))
	{
		return 0;
	}

	if(self.classname == "trigger_multiple")
	{
		return 1;
	}

	if(self.classname == "trigger_radius")
	{
		return 1;
	}

	if(self.classname == "trigger_lookat")
	{
		return 1;
	}

	return self.classname == "trigger_disk";
}

//Function Number: 6
lib_A5A0::func_97CD(param_00)
{
	var_01 = param_00 lib_A5A0::func_508E();
	param_00.var_6FF6 = undefined;
	if(isdefined(param_00.var_39B) && param_00.var_39B == "trigger_multiple")
	{
		var_01 = 0;
	}

	var_02 = lib_A5A0::func_8285(param_00);
	var_03 = isdefined(param_00.var_7B14);
	var_04 = isdefined(param_00.var_7B0D) && lib_A5A0::func_5054(param_00) || lib_A5A0::func_5055(param_00);
	var_05 = isdefined(param_00.var_29B5) && !lib_A5A0::func_5054(param_00) || lib_A5A0::func_5055(param_00);
	var_06 = 1;
	while(var_06)
	{
		param_00 waittill("trigger",var_07);
		if(isdefined(param_00.var_7B16))
		{
			if(!isdefined(var_07.var_7B16))
			{
				continue;
			}

			if(var_07.var_7B16 != param_00.var_7B16)
			{
				continue;
			}
		}

		if(isdefined(param_00.enabled) && !param_00.enabled)
		{
			param_00 waittill("enable");
		}

		if(isdefined(param_00.var_79D3))
		{
			common_scripts\utility::flag_set(param_00.var_79D3);
		}

		if(isdefined(param_00.var_79CF))
		{
			common_scripts\utility::flag_clear(param_00.var_79CF);
		}

		if(var_04)
		{
			var_07 thread lib_A5A0::func_66C0(param_00);
		}
		else if(var_05 && isdefined(var_07))
		{
			var_07 thread lib_A5A0::func_66BE(param_00);
		}

		param_00 lib_A59A::script_delay();
		if(var_01)
		{
			var_06 = 0;
		}

		if(isdefined(param_00.var_7B11))
		{
			if(!isdefined(level.var_9CAA[param_00.var_7B11]))
			{
				level.var_9CAA[param_00.var_7B11] = [];
			}

			common_scripts\utility::array_levelthread(level.var_9CAA[param_00.var_7B11],::lib_A59A::func_284D);
		}

		if(var_03)
		{
			lib_A5A0::func_062F(param_00.var_7B14);
		}

		if(var_02.size > 0 && var_01)
		{
			common_scripts\utility::array_levelthread(var_02,::lib_A5A0::func_66C1);
		}

		if(isdefined(param_00.var_7B15))
		{
			if(!isdefined(level.var_9D41[param_00.var_7B15]))
			{
				return;
			}

			common_scripts\utility::array_levelthread(level.var_9D41[param_00.var_7B15],::lib_A5A0::func_05C6);
		}
	}
}

//Function Number: 7
lib_A5A0::func_97CE(param_00,param_01)
{
	var_02 = param_00 lib_A5A0::func_508E();
	param_00.var_6FF6 = undefined;
	if(isdefined(param_00.var_39B) && param_00.var_39B == "trigger_multiple")
	{
		var_02 = 0;
	}

	var_03 = lib_A5A0::func_8285(param_00);
	var_04 = isdefined(param_00.var_7B14);
	var_05 = isdefined(param_00.var_7B0D) && lib_A5A0::func_5054(param_00) || lib_A5A0::func_5055(param_00);
	var_06 = isdefined(param_00.var_29B5) && !lib_A5A0::func_5054(param_00) || lib_A5A0::func_5055(param_00);
	var_07 = 1;
	if(isdefined(param_00.var_7B16))
	{
		if(!isdefined(param_01.var_7B16))
		{
			return;
		}

		if(param_01.var_7B16 != param_00.var_7B16)
		{
			return;
		}
	}

	if(isdefined(param_00.enabled) && !param_00.enabled)
	{
		param_00 waittill("enable");
	}

	if(isdefined(param_00.var_79D3))
	{
		common_scripts\utility::flag_set(param_00.var_79D3);
	}

	if(isdefined(param_00.var_79CF))
	{
		common_scripts\utility::flag_clear(param_00.var_79CF);
	}

	if(var_05)
	{
		param_01 thread lib_A5A0::func_66C0(param_00);
	}
	else if(var_06 && isdefined(param_01))
	{
		param_01 thread lib_A5A0::func_66BE(param_00);
	}

	param_00 lib_A59A::script_delay();
	if(var_02)
	{
		var_07 = 0;
	}

	if(isdefined(param_00.var_7B11))
	{
		if(!isdefined(level.var_9CAA[param_00.var_7B11]))
		{
			level.var_9CAA[param_00.var_7B11] = [];
		}

		common_scripts\utility::array_levelthread(level.var_9CAA[param_00.var_7B11],::lib_A59A::func_284D);
	}

	if(var_04)
	{
		lib_A5A0::func_062F(param_00.var_7B14);
	}

	if(var_03.size > 0 && var_02)
	{
		common_scripts\utility::array_levelthread(var_03,::lib_A5A0::func_66C1);
	}

	if(isdefined(param_00.var_7B15))
	{
		if(!isdefined(level.var_9D41[param_00.var_7B15]))
		{
			return;
		}

		common_scripts\utility::array_levelthread(level.var_9D41[param_00.var_7B15],::lib_A5A0::func_05C6);
	}
}

//Function Number: 8
lib_A5A0::func_66BF(param_00)
{
	var_01 = undefined;
	foreach(var_03 in level.var_9CAD[param_00.var_7B0D])
	{
		if(var_03 != param_00)
		{
			if(!lib_A5A0::func_513C(var_03))
			{
				var_01 = var_03;
			}
		}
	}

	return var_01;
}

//Function Number: 9
lib_A5A0::func_66C0(param_00)
{
	var_01 = lib_A5A0::func_66BF(param_00);
	if(isdefined(var_01))
	{
		thread lib_A5A0::func_0689(var_01);
	}
}

//Function Number: 10
lib_A5A0::func_22FE(param_00)
{
	return (isdefined(self.var_2638) || self.health < self.var_4783 || param_00.var_797A == "forced") && !isdefined(param_00.var_28AD) || param_00.var_797A == "plane";
}

//Function Number: 11
lib_A5A0::func_22FD(param_00)
{
	return isdefined(param_00.var_28AD) && param_00.var_28AD;
}

//Function Number: 12
lib_A5A0::func_66BE(param_00)
{
	var_01 = vehpath_getnode(param_00.target,"targetname");
	var_02 = lib_A5A0::func_66BF(var_01);
	if(!isdefined(var_02))
	{
		return;
	}

	if(param_00.var_29B5 && !isdefined(var_02.var_7B0E))
	{
		return;
	}

	if(isdefined(var_02.var_797A))
	{
		if(!lib_A5A0::func_22FE(var_02))
		{
			return;
		}

		self notify("crashpath",var_02);
		var_02.var_28AD = 1;
		self notify("newpath");
		lib_A5A0::func_063F(param_00,var_02);
		return;
	}

	if(lib_A5A0::func_22FD(var_02))
	{
		return;
	}

	if(isdefined(var_02.var_7B0E))
	{
		if(!isdefined(self.var_7B0E))
		{
			return;
		}

		if(var_02.var_7B0E != self.var_7B0E)
		{
			return;
		}
	}

	self notify("newpath");
	lib_A5A0::func_063F(var_01,var_02);
	thread lib_A5A0::func_29B4(var_02);
	if(!lib_A5A0::func_513C(var_01) && !isdefined(param_00.var_7B2E) && param_00.var_7B2E)
	{
		param_00.var_29B5 = 1;
	}

	self.var_DF6 = var_02;
	thread lib_A5A0::func_0689();
	if(self veh_isphysveh() && isdefined(var_01.var_7AF4))
	{
		thread lib_A5A0::func_74F4(var_01);
	}
}

//Function Number: 13
lib_A5A0::func_74F4(param_00)
{
	self endon("death");
	param_00 waittillmatch(self,"trigger");
	self.var_4FB = param_00.var_7AF4;
	if(self.var_4FB == "forward")
	{
		lib_A5A0::func_A2F6(1);
		return;
	}

	lib_A5A0::func_A2F6(0);
}

//Function Number: 14
lib_A5A0::func_063F(param_00,param_01)
{
	self veh_setswitchnode(param_00,param_01);
}

//Function Number: 15
lib_A5A0::func_29B4(param_00)
{
	self endon("death");
	self.var_29B6 = param_00;
	param_00 waittillmatch(self,"trigger");
	self.var_29B6 = undefined;
}

//Function Number: 16
lib_A5A0::func_9CF0(param_00,param_01)
{
	if(isdefined(param_00.script_linkname))
	{
		level.var_9CFB = lib_A5A0::func_0CD9(level.var_9CFB,param_00.script_linkname,param_00);
	}

	if(isdefined(param_00.var_7B15))
	{
		level.var_9D41 = lib_A5A0::func_0CD9(level.var_9D41,param_00.var_7B15,param_00);
	}

	if(isdefined(param_00.var_7B11))
	{
		level.var_9CAA = lib_A5A0::func_0CD9(level.var_9CAA,param_00.var_7B11,param_00);
	}
}

//Function Number: 17
lib_A5A0::func_88CC(param_00)
{
	var_01 = [];
	var_02 = lib_A59A::func_32DB("no_riders_until_unload");
	foreach(var_04 in param_00)
	{
		var_04.count = 1;
		var_05 = 0;
		if(isdefined(var_04.var_79A8))
		{
			var_05 = 1;
			var_06 = lib_A59A::func_2F29(var_04);
			var_06 lib_A523::func_2E57();
		}
		else
		{
			var_07 = isdefined(var_04.var_7ADB) && common_scripts\utility::flag("_stealth_enabled") && !common_scripts\utility::flag("_stealth_spotted");
			var_08 = var_04;
			if(isdefined(var_04.var_7AC8))
			{
				var_08 = lib_A577::func_3E66(var_04,1);
			}

			if(isdefined(var_04.var_79E6) || var_02)
			{
				var_06 = var_08 method_8094(var_07);
			}
			else
			{
				var_06 = var_08 method_8093(var_07);
			}

			if(isdefined(var_04.var_7AC8))
			{
				if(isdefined(var_04.var_7AD6))
				{
					var_06.var_7AD6 = var_04.var_7AD6;
				}
			}
		}

		if(!var_05 && !isalive(var_06))
		{
			continue;
		}

		var_01[var_01.size] = var_06;
	}

	var_01 = lib_A5A0::func_736E(var_01);
	return var_01;
}

//Function Number: 18
lib_A5A0::func_736E(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		if(!lib_A5A0::func_0916(var_03))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 19
lib_A5A0::func_0916(param_00)
{
	if(isalive(param_00))
	{
		return 1;
	}

	if(!isdefined(param_00))
	{
		return 0;
	}

	if(!isdefined(param_00.classname))
	{
		return 0;
	}

	return param_00.classname == "script_model";
}

//Function Number: 20
lib_A5A0::func_8900()
{
	if(lib_A59A::func_32DB("no_riders_until_unload") && !lib_A59A::func_32D7("no_riders_until_unload"))
	{
		return [];
	}

	var_00 = lib_A5A0::func_3EB2();
	if(!var_00.size)
	{
		return [];
	}

	var_01 = [];
	var_02 = lib_A5A0::func_88CC(var_00);
	var_02 = common_scripts\utility::array_combine(var_02,lib_A5A0::func_3EB1());
	var_02 = lib_A5A0::func_8888(var_02);
	foreach(var_04 in var_02)
	{
		thread lib_A59F::func_448F(var_04);
	}

	return var_02;
}

//Function Number: 21
lib_A5A0::func_896D(param_00)
{
	if(!isdefined(param_00))
	{
		return lib_A5A0::func_8900();
	}

	var_01 = lib_A5A0::func_3EB2();
	if(!var_01.size)
	{
		return [];
	}

	var_02 = [];
	var_03 = self.classname;
	if(isdefined(level.var_9D61[var_03]) && isdefined(level.var_9D61[var_03][param_00]))
	{
		var_04 = level.var_9D61[var_03][param_00];
		foreach(var_06 in var_04)
		{
			var_02[var_02.size] = var_01[var_06];
		}

		var_08 = lib_A5A0::func_88CC(var_02);
		for(var_09 = 0;var_09 < var_04.size;var_09++)
		{
			var_08[var_09].var_7AD6 = var_04[var_09];
		}

		var_08 = common_scripts\utility::array_combine(var_08,lib_A5A0::func_3EB1());
		var_08 = lib_A5A0::func_8888(var_08);
		foreach(var_0B in var_08)
		{
			thread lib_A59F::func_448F(var_0B);
		}

		return var_08;
	}

	return lib_A5A0::func_8900();
}

//Function Number: 22
lib_A5A0::func_8888(param_00)
{
	var_01 = [];
	var_02 = [];
	foreach(var_04 in param_00)
	{
		if(isdefined(var_04.var_7AD6))
		{
			var_01[var_01.size] = var_04;
			continue;
		}

		var_02[var_02.size] = var_04;
	}

	return common_scripts\utility::array_combine(var_01,var_02);
}

//Function Number: 23
lib_A5A0::func_812C(param_00)
{
	var_01 = vehpath_getnode(param_00.targetname,"target");
	if(!isdefined(var_01))
	{
		return;
	}

	var_01.var_29B5 = 0;
	lib_A5A0::func_0788(var_01);
}

//Function Number: 24
lib_A5A0::func_9924()
{
	var_00 = lib_A59F::func_3EAC();
	foreach(var_03, var_02 in self.var_7507)
	{
		if(!isalive(var_02))
		{
			continue;
		}

		if(isdefined(var_00[var_02.var_9D13]))
		{
			self.var_7507[var_03] = lib_A59F::func_447F(var_02,var_02.var_9D13);
		}
	}
}

//Function Number: 25
lib_A5A0::func_0788(param_00)
{
	if(isdefined(param_00.var_6FF6))
	{
		return;
	}

	level.var_9D14[level.var_9D14.size] = param_00;
	param_00.var_6FF6 = 1;
}

//Function Number: 26
lib_A5A0::func_513C(param_00)
{
	if(!isdefined(param_00.target))
	{
		return 1;
	}

	if(!isdefined(vehpath_getnode(param_00.target,"targetname")) && !isdefined(lib_A5A0::func_3EB8(param_00.target)))
	{
		return 1;
	}

	return 0;
}

//Function Number: 27
lib_A5A0::func_3E17(param_00)
{
	var_01 = ::lib_A5A0::func_3D80;
	if(lib_A5A0::func_05D8() && isdefined(param_00.target))
	{
		if(isdefined(lib_A5A0::func_3D7C(param_00.target)))
		{
			var_01 = ::lib_A5A0::func_3D7C;
		}

		if(isdefined(lib_A5A0::func_3D7E(param_00.target)))
		{
			var_01 = ::lib_A5A0::func_3D7E;
		}
	}

	return var_01;
}

//Function Number: 28
lib_A5A0::func_6127(param_00,param_01,param_02)
{
	if(self.var_DF6 == param_00)
	{
		self notify("node_wait_terminated");
		waittillframeend;
		return;
	}

	if(isdefined(self.unique_id))
	{
		var_03 = "node_wait_triggered" + self.unique_id;
	}
	else
	{
		var_03 = "node_wait_triggered";
	}

	if(!isdefined(param_00.var_9809) || param_00.var_9809 != gettime())
	{
		var_04 = spawnstruct();
		lib_A5A0::func_9FDB(var_04,var_03,param_00,param_02);
		var_04 waittill(var_03);
	}

	param_00.var_9809 = undefined;
}

//Function Number: 29
lib_A5A0::func_9FDB(param_00,param_01,param_02,param_03)
{
	var_04 = 0;
	var_05 = param_02;
	while(isdefined(param_02) && var_04 < 3)
	{
		var_04++;
		thread lib_A5A0::func_6128(param_00,param_01,param_02);
		if(!isdefined(param_02.target))
		{
			return;
		}

		param_02 = [[ param_03 ]](param_02.target);
	}
}

//Function Number: 30
lib_A5A0::func_6128(param_00,param_01,param_02)
{
	self endon("newpath");
	self endon("death");
	param_00 endon(param_01);
	param_02 waittill("trigger");
	param_02.var_9809 = gettime();
	waittillframeend;
	param_00 notify(param_01);
}

//Function Number: 31
lib_A5A0::func_9D11(param_00)
{
	self notify("newpath");
	if(isdefined(param_00))
	{
		self.var_DF6 = param_00;
	}

	var_01 = self.var_DF6;
	self.var_251D = self.var_DF6;
	if(!isdefined(var_01))
	{
		return;
	}

	self endon("newpath");
	self endon("death");
	var_02 = var_01;
	var_03 = undefined;
	var_04 = var_01;
	var_05 = lib_A5A0::func_3E17(var_01);
	while(isdefined(var_04))
	{
		lib_A5A0::func_6127(var_04,var_03,var_05);
		if(!isdefined(self))
		{
			return;
		}

		if(isdefined(var_04.var_6541))
		{
			level thread lib_A5A0::func_97CE(var_04,self);
		}

		self.var_251D = var_04;
		if(isdefined(var_04.var_3C59) && !var_04.var_3C59)
		{
			thread lib_A5A0::func_66C2(var_04);
		}

		if(isdefined(var_04.var_39B))
		{
			self notify(var_04.var_39B);
			self notify("noteworthy",var_04.var_39B);
		}

		waittillframeend;
		if(!isdefined(self))
		{
			return;
		}

		if(isdefined(var_04.script_prefab_exploder))
		{
			var_04.script_exploder = var_04.script_prefab_exploder;
			var_04.script_prefab_exploder = undefined;
		}

		if(isdefined(var_04.script_exploder))
		{
			var_06 = var_04.var_79BB;
			if(isdefined(var_06))
			{
				level lib_A59A::delaythread(var_06,::common_scripts\_exploder::exploder,var_04.script_exploder);
			}
			else
			{
				level common_scripts\_exploder::exploder(var_04.script_exploder);
			}
		}

		if(isdefined(var_04.var_79D3))
		{
			common_scripts\utility::flag_set(var_04.var_79D3);
		}

		if(isdefined(var_04.var_79B7))
		{
			lib_A59A::func_32DD(var_04.var_79B7);
		}

		if(isdefined(var_04.var_79B6))
		{
			lib_A59A::func_32D9(var_04.var_79B6);
		}

		if(isdefined(var_04.var_79CF))
		{
			common_scripts\utility::flag_clear(var_04.var_79CF);
		}

		if(isdefined(var_04.var_39B))
		{
			if(var_04.var_39B == "kill")
			{
				lib_A5A0::func_05AF();
			}

			if(var_04.var_39B == "godon")
			{
				self.godmode = 1;
			}

			if(var_04.var_39B == "godoff")
			{
				self.godmode = 0;
			}

			if(var_04.var_39B == "deleteme")
			{
				level thread lib_A59A::func_284D(self);
				return;
			}

			if(var_04.var_39B == "engineoff")
			{
				self veh_turnengineoff();
			}
		}

		if(isdefined(var_04.var_797B))
		{
			self.var_797B = var_04.var_797B;
		}

		if(isdefined(var_04.var_7953))
		{
			self.var_7953 = var_04.var_7953;
		}

		if(isdefined(var_04.var_7AFE))
		{
			if(var_04.var_7AFE)
			{
				lib_A5A0::func_05F0();
			}
			else
			{
				lib_A5A0::func_05EF();
			}
		}

		if(isdefined(var_04.var_7AE9))
		{
			self.var_7AE9 = var_04.var_7AE9;
		}

		if(isdefined(var_04.var_7AF8))
		{
			self notify("turning",var_04.var_7AF8);
		}

		if(isdefined(var_04.var_7984))
		{
			if(var_04.var_7984 == 0)
			{
				thread lib_A5A0::func_2664();
			}
			else
			{
				thread lib_A5A0::func_2665();
			}
		}

		if(isdefined(var_04.var_7B0B))
		{
			if(isdefined(var_04.script_parameters) && var_04.script_parameters == "queue")
			{
				self.var_7094 = 1;
			}
		}

		if(isdefined(var_04.var_7B1E))
		{
			lib_A5A0::func_A2F6(var_04.var_7B1E);
		}

		if(lib_A5A0::func_9D34(::lib_A5A0::func_6127,var_04))
		{
			thread lib_A5A0::func_9A3A(var_04);
		}

		if(isdefined(var_04.var_7AF4))
		{
			self.var_4FB = var_04.var_7AF4;
			if(self.var_4FB == "forward")
			{
				lib_A5A0::func_A2F6(1);
			}
			else
			{
				lib_A5A0::func_A2F6(0);
			}
		}

		if(isdefined(var_04.var_795E))
		{
			self.var_4EE = var_04.var_795E;
		}

		if(isdefined(var_04.var_7A95))
		{
			self.var_4F6 = var_04.var_7A95;
		}

		if(isdefined(var_04.var_79B8))
		{
			var_07 = 35;
			if(isdefined(var_04.var_7986))
			{
				var_07 = var_04.var_7986;
			}

			self veh_setspeed(0,var_07);
			lib_A59A::func_32DF(var_04.var_79B8);
			if(!isdefined(self))
			{
				return;
			}

			var_08 = 60;
			if(isdefined(var_04.script_accel))
			{
				var_08 = var_04.script_accel;
			}

			self veh_resumespeed(var_08);
		}

		if(isdefined(var_04.script_delay))
		{
			var_07 = 35;
			if(isdefined(var_04.var_7986))
			{
				var_07 = var_04.var_7986;
			}

			self veh_setspeed(0,var_07);
			if(isdefined(var_04.target))
			{
				thread lib_A5A0::func_662A([[ var_05 ]](var_04.target));
			}

			var_04 lib_A59A::script_delay();
			self notify("delay_passed");
			var_08 = 60;
			if(isdefined(var_04.script_accel))
			{
				var_08 = var_04.script_accel;
			}

			self veh_resumespeed(var_08);
		}

		if(isdefined(var_04.var_79D5))
		{
			var_09 = 0;
			if(!common_scripts\utility::flag(var_04.var_79D5) || isdefined(var_04.script_delay_post))
			{
				var_09 = 1;
				var_08 = 5;
				var_07 = 35;
				if(isdefined(var_04.script_accel))
				{
					var_08 = var_04.script_accel;
				}

				if(isdefined(var_04.var_7986))
				{
					var_07 = var_04.var_7986;
				}

				lib_A5A0::func_068C("script_flag_wait_" + var_04.var_79D5,var_08,var_07);
				thread lib_A5A0::func_662A([[ var_05 ]](var_04.target));
			}

			common_scripts\utility::flag_wait(var_04.var_79D5);
			if(!isdefined(self))
			{
				return;
			}

			if(isdefined(var_04.script_delay_post))
			{
				wait(var_04.script_delay_post);
				if(!isdefined(self))
				{
					return;
				}
			}

			var_08 = 10;
			if(isdefined(var_04.script_accel))
			{
				var_08 = var_04.script_accel;
			}

			if(var_09)
			{
				lib_A5A0::func_068A("script_flag_wait_" + var_04.var_79D5);
			}

			self notify("delay_passed");
		}

		if(isdefined(self.var_7E68))
		{
			self.var_7E68 = undefined;
			self veh_clearlookatent();
		}

		if(isdefined(var_04.var_7B06))
		{
			thread lib_A5A0::func_5743(var_04.var_7B06);
		}

		if(isdefined(var_04.var_7B07))
		{
			thread lib_A5A0::func_5745(var_04.var_7B07);
		}

		if(isdefined(var_04.var_79E1))
		{
			thread lib_A5A0::func_9D27(var_04.var_79E1);
		}

		var_03 = var_04;
		if(!isdefined(var_04.target))
		{
			break;
		}

		var_04 = [[ var_05 ]](var_04.target);
		if(!isdefined(var_04))
		{
			var_04 = var_03;
			break;
		}
		else if(lib_A5A0::func_513C(var_04) || isdefined(var_04.var_7B00))
		{
			var_0A = max(0.01,length(self veh_getvelocity()));
			var_0B = distance(self.var_2E6,var_04.var_2E6);
			var_0C = max(0.01,var_0B / var_0A);
			self notify("about_to_stop",var_0C);
		}
	}

	if(isdefined(var_04.var_7A1A))
	{
		thread lib_A5A0::func_0688();
	}

	self notify("reached_dynamic_path_end");
	if(isdefined(self.var_7B0A))
	{
		self notify("delete");
		self delete();
	}
}

//Function Number: 32
lib_A5A0::func_9D10(param_00,param_01,param_02)
{
	self notify("newpath");
	self endon("newpath");
	self endon("death");
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(isdefined(param_00))
	{
		self.var_DF6 = param_00;
	}

	var_03 = self.var_DF6;
	self.var_251D = self.var_DF6;
	if(!isdefined(var_03))
	{
		return;
	}

	var_04 = var_03;
	if(param_01)
	{
		self waittill("start_dynamicpath");
	}

	if(isdefined(param_02))
	{
		var_05 = spawnstruct();
		var_05.var_2E6 = lib_A59A::func_7C2(self.var_2E6,param_02);
		lib_A5A0::func_47FE(var_05,undefined);
	}

	var_06 = undefined;
	var_07 = var_03;
	var_08 = lib_A5A0::func_3E17(var_03);
	while(isdefined(var_07))
	{
		if(isdefined(var_07.script_linkto))
		{
			lib_A5A0::func_7E67(var_07);
		}

		lib_A5A0::func_47FE(var_07,var_06,param_02);
		if(!isdefined(self))
		{
			return;
		}

		self.var_251D = var_07;
		if(isdefined(var_07.var_3C59) && !var_07.var_3C59)
		{
			thread lib_A5A0::func_66C2(var_07);
		}

		var_07 notify("trigger",self);
		if(isdefined(var_07.var_7A08))
		{
			self veh_setyawspeedbyname(var_07.var_7A08);
			if(var_07.var_7A08 == "faster")
			{
				self veh_setmaxpitchroll(25,50);
			}
		}

		if(isdefined(var_07.var_39B))
		{
			self notify(var_07.var_39B);
			self notify("noteworthy",var_07.var_39B);
		}

		waittillframeend;
		if(!isdefined(self))
		{
			return;
		}

		if(isdefined(var_07.script_prefab_exploder))
		{
			var_07.script_exploder = var_07.script_prefab_exploder;
			var_07.script_prefab_exploder = undefined;
		}

		if(isdefined(var_07.script_exploder))
		{
			var_09 = var_07.var_79BB;
			if(isdefined(var_09))
			{
				level lib_A59A::delaythread(var_09,::common_scripts\_exploder::exploder,var_07.script_exploder);
			}
			else
			{
				level common_scripts\_exploder::exploder(var_07.script_exploder);
			}
		}

		if(isdefined(var_07.var_79D3))
		{
			common_scripts\utility::flag_set(var_07.var_79D3);
		}

		if(isdefined(var_07.var_79B7))
		{
			lib_A59A::func_32DD(var_07.var_79B7);
		}

		if(isdefined(var_07.var_79B6))
		{
			lib_A59A::func_32D9(var_07.var_79B6);
		}

		if(isdefined(var_07.var_79CF))
		{
			common_scripts\utility::flag_clear(var_07.var_79CF);
		}

		if(isdefined(var_07.var_39B))
		{
			if(var_07.var_39B == "kill")
			{
				lib_A5A0::func_05AF();
			}

			if(var_07.var_39B == "godon")
			{
				self.godmode = 1;
			}

			if(var_07.var_39B == "godoff")
			{
				self.godmode = 0;
			}

			if(var_07.var_39B == "deleteme")
			{
				level thread lib_A59A::func_284D(self);
				return;
			}

			if(var_07.var_39B == "engineoff")
			{
				self veh_turnengineoff();
			}
		}

		if(isdefined(var_07.var_797B))
		{
			self.var_797B = var_07.var_797B;
		}

		if(isdefined(var_07.var_7953))
		{
			self.var_7953 = var_07.var_7953;
		}

		if(isdefined(var_07.var_7AFE))
		{
			if(var_07.var_7AFE)
			{
				lib_A5A0::func_05F0();
			}
			else
			{
				lib_A5A0::func_05EF();
			}
		}

		if(isdefined(var_07.var_7AE9))
		{
			self.var_7AE9 = var_07.var_7AE9;
		}

		if(isdefined(var_07.var_7AF8))
		{
			self notify("turning",var_07.var_7AF8);
		}

		if(isdefined(var_07.var_7984))
		{
			if(var_07.var_7984 == 0)
			{
				thread lib_A5A0::func_2664();
			}
			else
			{
				thread lib_A5A0::func_2665();
			}
		}

		if(isdefined(var_07.var_7B0B))
		{
			if(isdefined(var_07.script_parameters) && var_07.script_parameters == "queue")
			{
				self.var_7094 = 1;
			}
		}

		if(isdefined(var_07.var_7B1E))
		{
			lib_A5A0::func_A2F6(var_07.var_7B1E);
		}

		if(lib_A5A0::func_9D34(::lib_A5A0::func_47FE,var_07))
		{
			thread lib_A5A0::func_9A3A(var_07);
		}

		if(self veh_isphysveh())
		{
			if(isdefined(var_07.var_7AF4))
			{
				self.var_4FB = var_07.var_7AF4;
				if(self.var_4FB == "forward")
				{
					lib_A5A0::func_A2F6(1);
				}
				else
				{
					lib_A5A0::func_A2F6(0);
				}
			}

			if(isdefined(var_07.var_7A95))
			{
				self.var_4F6 = var_07.var_7A95;
			}
		}

		if(isdefined(var_07.var_79D5))
		{
			common_scripts\utility::flag_wait(var_07.var_79D5);
			if(isdefined(var_07.script_delay_post))
			{
				wait(var_07.script_delay_post);
			}

			self notify("delay_passed");
		}

		if(isdefined(self.var_7E68))
		{
			self.var_7E68 = undefined;
			self veh_clearlookatent();
		}

		if(isdefined(var_07.var_7B06))
		{
			thread lib_A5A0::func_5743(var_07.var_7B06);
		}

		if(isdefined(var_07.var_7B07))
		{
			thread lib_A5A0::func_5745(var_07.var_7B07);
		}

		if(isdefined(var_07.var_79E1))
		{
			thread lib_A5A0::func_9D27(var_07.var_79E1);
		}

		var_06 = var_07;
		if(!isdefined(var_07.target))
		{
			break;
		}

		var_07 = [[ var_08 ]](var_07.target);
		if(!isdefined(var_07))
		{
			var_07 = var_06;
			break;
		}
	}

	if(isdefined(var_07.var_7A1A))
	{
		thread lib_A5A0::func_0688();
	}

	self notify("reached_dynamic_path_end");
	if(isdefined(self.var_7B0A))
	{
		self delete();
	}
}

//Function Number: 33
lib_A5A0::func_9D34(param_00,param_01)
{
	if(isdefined(param_01.var_7B00))
	{
		return 1;
	}

	if(param_00 != ::lib_A5A0::func_6127)
	{
		return 0;
	}

	if(!lib_A5A0::func_513C(param_01))
	{
		return 0;
	}

	if(isdefined(self.var_2D3C))
	{
		return 0;
	}

	if(self.vehicletype == "empty")
	{
		return 0;
	}

	return !lib_A5A0::func_5078();
}

//Function Number: 34
lib_A5A0::func_662A(param_00)
{
}

//Function Number: 35
lib_A5A0::func_5078()
{
	if(!isdefined(self.var_7B0A))
	{
		return 0;
	}

	return self.var_7B0A;
}

//Function Number: 36
lib_A5A0::func_47FE(param_00,param_01,param_02)
{
	self endon("newpath");
	if(isdefined(param_00.var_7B00) && isdefined(self.var_367D))
	{
		self notify("about_to_unload");
		param_00.radius = 2;
		if(isdefined(param_00.var_440E))
		{
			param_00.var_2E6 = param_00.var_440E + (0,0,self.var_367D);
		}
		else
		{
			var_03 = lib_A59A::func_4414(param_00.var_2E6) + (0,0,self.var_367D);
			if(var_03[2] > param_00.var_2E6[2] - 2000)
			{
				param_00.var_2E6 = lib_A59A::func_4414(param_00.var_2E6) + (0,0,self.var_367D);
			}
		}

		self veh_sethoverparams(0,0,0);
	}

	if(isdefined(param_00.var_7B00) && isdefined(self.var_667C))
	{
		param_00.radius = 100;
		if(isdefined(param_00.var_440E))
		{
			param_00.var_2E6 = param_00.var_440E + (0,0,self.var_2F71);
		}
		else
		{
			param_00.var_2E6 = lib_A59A::func_4414(param_00.var_2E6) + (0,0,self.var_2F71);
		}
	}

	if(isdefined(param_01))
	{
		var_04 = param_01.var_792C;
		var_05 = param_01.speed;
		var_06 = param_01.script_accel;
		var_07 = param_01.var_7986;
		var_08 = param_01.var_7952;
	}
	else
	{
		var_04 = undefined;
		var_05 = undefined;
		var_06 = undefined;
		var_07 = undefined;
		var_08 = undefined;
	}

	var_09 = isdefined(param_00.var_7ADF) && param_00.var_7ADF;
	var_0A = isdefined(param_00.var_7B00);
	var_0B = isdefined(param_00.var_79D5) && !common_scripts\utility::flag(param_00.var_79D5);
	var_0C = !isdefined(param_00.target);
	var_0D = isdefined(param_00.script_delay);
	if(isdefined(param_00.var_41))
	{
		var_0E = param_00.var_41[1];
	}
	else
	{
		var_0E = 0;
	}

	if(self.health <= 0)
	{
		return;
	}

	var_0F = param_00.var_2E6;
	if(isdefined(param_02))
	{
		var_0F = lib_A59A::func_7C2(var_0F,param_02);
	}

	if(isdefined(self.var_4811))
	{
		var_0F = (var_0F[0],var_0F[1],self.var_4811);
	}

	self veh_helisetgoal(var_0F,var_05,var_06,var_07,param_00.var_79FF,param_00.var_7938,var_0E,var_04,var_0D,var_09,var_0A,var_0B,var_0C,var_08);
	if(isdefined(param_00.radius))
	{
		self veh_neargoalnotifydist(param_00.radius);
		common_scripts\utility::waittill_any("near_goal","goal");
	}
	else
	{
		self waittill("goal");
	}

	if(isdefined(self.var_6541))
	{
		level thread lib_A5A0::func_97CE(param_00,self);
	}

	if(isdefined(param_00.var_79CA))
	{
		if(!isdefined(level.var_4809))
		{
		}

		thread [[ level.var_4809 ]](param_00);
	}

	param_00 lib_A59A::script_delay();
	if(isdefined(self.var_66C3))
	{
		lib_A59A::func_286C(param_00);
	}
}

//Function Number: 37
lib_A5A0::func_66C1(param_00)
{
	param_00.var_3C59 = 1;
	param_00 notify("gate opened");
}

//Function Number: 38
lib_A5A0::func_66C2(param_00)
{
	self endon("death");
	self.var_A03E = 1;
	lib_A5A0::func_068C("path_gate_wait_till_open",5,15);
	param_00 waittill("gate opened");
	self.var_A03E = 0;
	if(self.health > 0)
	{
		self endon("death");
		if(isdefined(self.var_A03E) && self.var_A03E)
		{
			return;
		}

		lib_A5A0::func_068A("path_gate_wait_till_open");
	}
}

//Function Number: 39
lib_A5A0::func_7389()
{
	wait(0.05);
	self.var_9D3C = undefined;
}

//Function Number: 40
lib_A5A0::func_9CE2(param_00)
{
	var_01 = param_00.classname;
	if(isdefined(level.var_9CDB[var_01]))
	{
		foreach(var_03 in level.var_9CDB[var_01])
		{
			param_00 hidepart(var_03);
		}
	}

	if(param_00.vehicletype == "empty")
	{
		param_00 thread lib_A5A0::func_4060();
		return;
	}

	param_00 lib_A59A::func_7DAF();
	if(!isdefined(param_00.modeldummyon))
	{
		param_00.modeldummyon = 0;
	}

	var_05 = param_00.vehicletype;
	param_00 lib_A5A0::func_9CF1();
	param_00 lib_A5A0::func_9D2F();
	if(!isdefined(level.var_9D6E[param_00.vehicletype][param_00.classname]))
	{
	}

	param_00 thread [[ level.var_9D6E[param_00.vehicletype][param_00.classname] ]]();
	param_00 thread lib_A5A0::func_5905();
	param_00 thread lib_A5A0::func_6DDF();
	if(!isdefined(param_00.var_7950))
	{
		param_00.var_7950 = 0;
	}

	if(isdefined(level.var_9CAF))
	{
		if(level.var_9CAF)
		{
			param_00 method_8029();
		}
	}

	param_00 lib_A59A::func_32DC("unloaded");
	param_00 lib_A59A::func_32DC("loaded");
	param_00.var_7507 = [];
	param_00.var_9A3C = [];
	param_00.var_9A34 = "default";
	param_00.var_367E = [];
	if(isdefined(level.var_9C85) && isdefined(level.var_9C85[var_01]))
	{
		var_06 = level.var_9C85[var_01];
		var_07 = getarraykeys(var_06);
		foreach(var_09 in var_07)
		{
			param_00.var_367E[var_09] = undefined;
			param_00.var_367F[var_09] = 0;
		}
	}

	param_00 thread lib_A5A0::func_9C87();
	if(isdefined(param_00.var_7B07))
	{
		param_00 thread lib_A5A0::func_5745(param_00.var_7B07);
	}

	if(isdefined(param_00.var_7A01))
	{
		param_00.godmode = 1;
	}

	param_00.var_257D = [];
	if(!param_00 lib_A5A0::func_50DC() || param_00 lib_A5A0::func_50DD())
	{
		param_00 thread lib_A5A0::func_3A9D();
	}

	param_00 thread lib_A59F::func_451C();
	if(isdefined(param_00.var_79E9))
	{
		param_00 veh_setvehiclelookattext(param_00.var_79E9,&"");
	}

	if(!param_00 lib_A5A0::func_50DC())
	{
		param_00 thread lib_A5A0::func_9CD5();
	}

	if(isdefined(param_00.var_79A6))
	{
		param_00.var_2D3C = 1;
	}

	if(!param_00 lib_A5A0::func_50DC())
	{
		param_00 thread lib_A5A0::func_9D31();
	}

	param_00 thread lib_A5A0::func_9D24();
	if(isdefined(param_00.var_7A9B) && param_00.var_7A9B)
	{
		param_00 thread lib_A59A::func_67FF();
	}

	param_00 thread lib_A5A0::func_9D52();
	param_00 thread lib_A5A0::func_4B66();
	param_00 thread lib_A5A0::func_0C55();
	if(isdefined(param_00.var_7982))
	{
		param_00 thread lib_A577::func_9CA5();
	}

	if(!param_00 lib_A5A0::func_50DC())
	{
		param_00 thread lib_A5A0::func_5BCD();
	}

	if(isdefined(level.var_9D74))
	{
		level thread [[ level.var_9D74 ]](param_00);
	}

	lib_A5A0::func_9CF0(param_00);
	if(isdefined(param_00.var_7AE9))
	{
		param_00 veh_setvehicleteam(param_00.var_7AE9);
	}

	if(!param_00 lib_A5A0::func_50DC())
	{
		param_00 thread lib_A5A0::func_2B34();
	}

	param_00 thread lib_A5A0::func_4060();
	if(isdefined(level.var_4BB9))
	{
		var_0B = level.var_4BB9;
	}
	else
	{
		var_0B = 0;
	}

	if(param_00 lib_A5A0::func_472C() && !var_0B)
	{
		param_00 thread lib_A5A0::func_0995();
	}

	if(param_00 veh_isphysveh())
	{
		if(isdefined(param_00.var_7A95))
		{
			param_00.var_4F6 = param_00.var_7A95;
		}
	}

	param_00 lib_A5A0::func_8900();
	param_00 thread lib_A5A0::func_9CE6();
	param_00 lib_A5A0::func_0CA8();
}

//Function Number: 41
lib_A5A0::func_50DD()
{
	return isdefined(level.var_1CAC) && level.var_1CAC;
}

//Function Number: 42
lib_A5A0::func_5300(param_00)
{
	if(!isdefined(level.var_9CA2) || !isdefined(level.var_9CA2[param_00]))
	{
		return;
	}

	if(isdefined(self.var_2657))
	{
		var_01 = self.var_2657;
	}
	else
	{
		var_01 = level.var_9CA2[var_01].maxdamage;
	}

	if(isdefined(self.var_2658))
	{
		var_02 = self.var_2658;
	}
	else
	{
		var_02 = level.var_9CA2[var_01].mindamage;
	}

	if(isdefined(level.var_9CA2[param_00].delay))
	{
		wait(level.var_9CA2[param_00].delay);
	}

	if(!isdefined(self))
	{
		return;
	}

	if(level.var_9CA2[param_00].var_1488)
	{
		level.var_31D method_8132(0);
	}

	self entityradiusdamage(self.var_2E6 + level.var_9CA2[param_00].var_6376,level.var_9CA2[param_00].var_712E,var_01,var_02,self);
	if(level.var_9CA2[param_00].var_1488)
	{
		level.var_31D method_8132(1);
	}
}

//Function Number: 43
lib_A5A0::func_9CE8(param_00,param_01)
{
	var_02 = self.vehicletype;
	var_03 = self.classname;
	var_04 = self.model;
	var_05 = self.targetname;
	thread lib_A5A0::func_5300(var_03);
	thread lib_A5A0::func_52F8(var_03);
	thread lib_A5A0::func_531C(var_03);
	lib_A59F::func_2806();
	if(isdefined(level.var_9CA6[var_03]))
	{
		thread lib_A5A0::func_7DFF(level.var_9CA6[var_03],level.var_9CA7[var_03]);
	}
	else if(isdefined(level.var_9CA6[var_04]))
	{
		thread lib_A5A0::func_7DFF(level.var_9CA6[var_04],level.var_9CA7[var_04]);
	}

	var_06 = lib_A5A0::func_9D32(var_04,param_00,param_01);
	thread lib_A5A0::func_5301(var_03);
	thread lib_A5A0::func_05DA(var_04,var_06);
	if(self.code_classname == "script_vehicle")
	{
		thread lib_A5A0::func_5318(var_03);
	}

	return var_06;
}

//Function Number: 44
lib_A5A0::func_9CE6()
{
	self endon("nodeath_thread");
	var_00 = self.vehicletype;
	var_01 = self.classname;
	var_02 = self.model;
	var_03 = self.targetname;
	var_04 = undefined;
	var_05 = undefined;
	var_06 = undefined;
	var_07 = 0;
	for(;;)
	{
		if(isdefined(self))
		{
			self waittill("death",var_04,var_05,var_06);
		}

		if(isdefined(self.var_253C))
		{
			self thread [[ self.var_253C ]]();
		}

		if(!var_07)
		{
			var_07 = 1;
			if(isdefined(var_04) && isdefined(var_05))
			{
				var_04 lib_A565::func_72DC(self,var_05,var_06);
				if(isdefined(self.damage_type))
				{
					self.damage_type = undefined;
				}
			}

			if(lib_A59A::func_5080() && !lib_A59A::func_5084() && isdefined(var_04) && isplayer(var_04))
			{
				if(var_04.inliveplayerkillstreak != self.var_7AE9)
				{
					var_04 thread lib_A59A::func_420D("kill",500);
				}

				if(isdefined(self.var_7507))
				{
					foreach(var_09 in self.var_7507)
					{
						if(isalive(var_09) && isai(var_09))
						{
							var_04 thread lib_A59A::func_420D("kill");
						}
					}
				}
			}
		}

		self notify("clear_c4");
		if(isdefined(self.var_769F))
		{
			self.var_769F delete();
		}

		if(isdefined(self.mgturret))
		{
			common_scripts\utility::array_levelthread(self.mgturret,::lib_A5A0::func_994D);
			self.mgturret = undefined;
		}

		if(isdefined(self.var_7AE9))
		{
			level.var_9D72[self.var_7AE9] = common_scripts\utility::array_remove(level.var_9D72[self.var_7AE9],self);
		}

		if(isdefined(self.script_linkname))
		{
			level.var_9CFB[self.script_linkname] = common_scripts\utility::array_remove(level.var_9CFB[self.script_linkname],self);
		}

		if(isdefined(self.var_7B15))
		{
			level.var_9D41[self.var_7B15] = common_scripts\utility::array_remove(level.var_9D41[self.var_7B15],self);
		}

		if(isdefined(self.var_7B11))
		{
			level.var_9CAA[self.var_7B11] = common_scripts\utility::array_remove(level.var_9CAA[self.var_7B11],self);
		}

		if(!isdefined(self) || lib_A5A0::func_500B())
		{
			if(isdefined(self.var_7507))
			{
				foreach(var_09 in self.var_7507)
				{
					if(isdefined(var_09))
					{
						var_09 delete();
					}
				}
			}

			if(lib_A5A0::func_500B())
			{
				self.var_7507 = [];
				continue;
			}

			self notify("delete_destructible");
			return;
		}

		var_0D = undefined;
		if(isdefined(self.var_9D26))
		{
			var_0D = self.var_9D26;
		}
		else if(isdefined(level.var_9D25) && isdefined(level.var_9D25[var_01]))
		{
			var_0D = level.var_9D25;
		}
		else if(isdefined(level.var_9D24[var_01]))
		{
			var_0D = level.var_9D24[var_01];
		}

		if(isdefined(var_0D))
		{
			self stoprumble(var_0D.var_7672);
		}

		if(isdefined(level.var_9CA3) && isdefined(var_00) && isdefined(level.var_9CA3[var_00]))
		{
			thread [[ level.var_9CA3[var_00] ]]();
		}

		if(isdefined(var_00) && isdefined(::lib_A59F::func_44C1))
		{
			common_scripts\utility::array_levelthread(self.var_7507,::lib_A59F::func_44C1,var_04,var_00);
		}

		var_0E = lib_A5A0::func_9CE8(var_04,var_05);
		if(isdefined(self.delete_on_death))
		{
			wait(0.05);
			if(!isdefined(self.var_2D2F) && !self veh_isphysveh())
			{
				self disconnectpaths();
			}

			lib_A5A0::func_05B0();
			wait(0.05);
			lib_A5A0::func_9CBB(var_02);
			self delete();
			continue;
		}

		if(isdefined(self.var_3A13))
		{
			self notify("newpath");
			if(!isdefined(self.var_2D2F))
			{
				self disconnectpaths();
			}

			lib_A5A0::func_9CE7();
			lib_A5A0::func_05B0();
			return;
		}

		lib_A5A0::func_9CAE(var_02,var_04,var_05,var_0E);
		if(!isdefined(self))
		{
			return;
		}

		if(isdefined(level.var_9C9E[var_01]))
		{
			earthquake(level.var_9C9E[var_01].var_782A,level.var_9C9E[var_01].duration,self.var_2E6,level.var_9C9E[var_01].radius);
		}

		wait(0.5);
		if(lib_A5A0::func_500B())
		{
			continue;
		}

		if(isdefined(self))
		{
			while(isdefined(self.var_2D34) && isdefined(self))
			{
				wait(0.05);
			}

			if(!isdefined(self))
			{
				continue;
			}

			if(self veh_isphysveh())
			{
				while(isdefined(self) && self.var_4F8 != 0)
				{
					wait(1);
				}

				if(!isdefined(self))
				{
					return;
				}

				self disconnectpaths();
				self notify("kill_badplace_forever");
				self method_8052();
				self notify("newpath");
				self veh_turnengineoff();
				return;
			}
			else
			{
				lib_A5A0::func_05B0();
			}

			if(self.modeldummyon)
			{
				self hide();
			}
		}

		if(lib_A5A0::func_0687())
		{
			self delete();
			continue;
		}
	}
}

//Function Number: 45
lib_A5A0::func_05B0()
{
	self notify("newpath");
	self veh_freevehicle();
	lib_A59A::delaythread(0.05,::lib_A5A0::func_35A0);
}

//Function Number: 46
lib_A5A0::func_35A0()
{
	self.var_A = undefined;
	self.var_DF4 = undefined;
	self.var_E27 = undefined;
	self.var_126B = undefined;
	self.var_126C = undefined;
	self.var_2516 = undefined;
	self.var_251D = undefined;
	self.var_257D = undefined;
	self.var_27E5 = undefined;
	self.var_367E = undefined;
	self.var_3FD5 = undefined;
	self.var_4743 = undefined;
	self.var_4783 = undefined;
	self.var_637F = undefined;
	self.var_6380 = undefined;
	self.var_756B = undefined;
	self.var_7674 = undefined;
	self.var_7676 = undefined;
	self.var_768A = undefined;
	self.var_793D = undefined;
	self.var_7950 = undefined;
	self.var_793D = undefined;
	self.var_7950 = undefined;
	self.script_bulletshield = undefined;
	self.script_disconnectpaths = undefined;
	self.script_linkname = undefined;
	self.var_7A70 = undefined;
	self.var_7AE9 = undefined;
	self.var_7AF9 = undefined;
	self.var_7AFE = undefined;
	self.var_7B13 = undefined;
	self.var_7B14 = undefined;
	self.var_7B15 = undefined;
	self.var_8438 = undefined;
	self.var_8444 = undefined;
	self.var_88F8 = undefined;
	self.var_88FA = undefined;
	self.var_9168 = undefined;
	self.target = undefined;
	self.var_91A8 = undefined;
	self.var_981E = undefined;
	self.var_981E = undefined;
	self.var_981F = undefined;
	self.var_9947 = undefined;
	self.var_9948 = undefined;
	self.var_9949 = undefined;
	self.var_1268 = undefined;
	self.var_DF6 = undefined;
	self.var_1268 = undefined;
	self.var_768E = undefined;
	self.var_7691 = undefined;
	self.var_7698 = undefined;
	self.var_769F = undefined;
	self.var_76E1 = undefined;
	self.var_7A7B = undefined;
	self.var_7AD5 = undefined;
	self.var_9254 = undefined;
	self.var_9949 = undefined;
	self.var_999F = undefined;
	self.var_99A0 = undefined;
	self.var_99A9 = undefined;
	self.var_99AE = undefined;
	self.var_99AF = undefined;
	self.unique_id = undefined;
	self.var_9A34 = undefined;
	self.var_9A3C = undefined;
	self.var_9BF5 = undefined;
	self.var_9D3D = undefined;
	self.var_A03E = undefined;
	self.var_A27D = undefined;
	self.var_A27F = undefined;
	self.var_6382 = undefined;
	self.var_7929 = undefined;
	self.var_A27F = undefined;
	self.var_A2F5 = undefined;
	self.var_2D3C = undefined;
	self.var_2D2F = undefined;
	self.var_7A01 = undefined;
	self.var_32D7 = undefined;
	self.var_3582 = undefined;
	self.godmode = undefined;
	self.vehicletype = undefined;
	self.var_9D44 = undefined;
	self.var_30EB = undefined;
	self.var_9401 = undefined;
	self.var_278E = undefined;
	self.var_7953 = undefined;
	self.var_A27E = undefined;
}

//Function Number: 47
lib_A5A0::func_0687()
{
	return isdefined(self.var_235D) && self.var_235D == 1;
}

//Function Number: 48
lib_A5A0::func_9CBB(param_00)
{
	if(isdefined(self.var_2D1F) && self.var_2D1F)
	{
		return;
	}

	self notify("death_finished");
	if(!isdefined(self))
	{
		return;
	}

	self method_8115(#animtree);
	if(isdefined(level.var_9CB0[param_00]))
	{
		self method_8142(level.var_9CB0[param_00],0);
	}

	if(isdefined(level.var_9CB3[param_00]))
	{
		self method_8142(level.var_9CB3[param_00],0);
	}
}

//Function Number: 49
lib_A5A0::func_9D32(param_00,param_01,param_02)
{
	if(!isdefined(self.var_B0C) || self.var_B0C == 0)
	{
		if(isdefined(self.var_3117) && self.var_3117 == 0)
		{
			return 0;
		}

		if(!isdefined(param_02))
		{
			return 0;
		}

		if(!param_02 == "MOD_PROJECTILE" || param_02 == "MOD_PROJECTILE_SPLASH")
		{
			return 0;
		}
	}

	if(isdefined(self.var_4FFD) && self.var_4FFD)
	{
		return 1;
	}

	return lib_A5A0::func_9CD6(param_00);
}

//Function Number: 50
lib_A5A0::func_9CD6(param_00)
{
	return isdefined(level.var_9C9F["rocket_death" + self.classname]) && isdefined(self.var_3117) && self.var_3117 == 1;
}

//Function Number: 51
lib_A5A0::func_9CAE(param_00,param_01,param_02,param_03)
{
	var_04 = "tank";
	if(isdefined(self.var_797B))
	{
		var_04 = self.var_797B;
	}
	else if(self veh_isphysveh())
	{
		var_04 = "physics";
	}
	else if(lib_A5A0::func_05D8())
	{
		var_04 = "helicopter";
	}
	else if(isdefined(self.var_251D) && lib_A5A0::func_2325(self.var_251D))
	{
		var_04 = "none";
	}

	switch(var_04)
	{
		case "helicopter":
			break;

		case "tank":
			break;

		case "diveboat":
			break;

		case "physics":
			break;
	}
}

//Function Number: 52
lib_A5A0::func_500B()
{
	var_00 = 0;
	if(isdefined(self) && self.classname == "script_vehicle_corpse")
	{
		var_00 = 1;
	}

	return var_00;
}

//Function Number: 53
lib_A5A0::func_7DFF(param_00,param_01)
{
	if(isdefined(self.var_85B7) && self.var_85B7)
	{
		return;
	}

	if(isdefined(param_01) && param_01 > 0)
	{
		wait(param_01);
	}

	if(!isdefined(self))
	{
		return;
	}

	var_02 = lib_A5A0::func_05B3();
	if(isdefined(self.var_1E9A))
	{
		var_02 method_8142(%root,0);
	}

	if(isdefined(self))
	{
		var_02 setmodel(param_00);
	}
}

//Function Number: 54
lib_A5A0::func_4800(param_00,param_01,param_02)
{
	if(isdefined(param_00) && isplayer(param_00))
	{
		self.var_6E0 = param_00;
	}

	self.var_235D = 1;
	if(!isdefined(self))
	{
		return;
	}

	lib_A5A0::func_2976();
	if(!param_02)
	{
		thread lib_A5A0::func_4804(param_00,param_01);
	}
}

//Function Number: 55
lib_A5A0::func_5333(param_00)
{
	foreach(var_02 in param_00)
	{
		if(!isalive(var_02))
		{
			continue;
		}

		if(!isdefined(var_02.var_750B) && !isdefined(var_02.var_2E17))
		{
			continue;
		}

		if(isdefined(var_02.var_58D4))
		{
			var_02 lib_A59A::func_8E9E();
		}

		var_02 method_8052();
	}
}

//Function Number: 56
lib_A5A0::func_9D1B(param_00,param_01)
{
	if(isdefined(self.var_9D13) && self.var_9D13 != 0)
	{
		return;
	}

	self.health = 1;
	param_00 endon("death");
	self.var_1300 = 0.15;
	self waittill("death");
	param_00 notify("driver_died");
	lib_A5A0::func_5333(param_01);
}

//Function Number: 57
lib_A5A0::func_9C88()
{
	self endon("death");
	self endon("enable_spline_path");
	self endon("enable_free_path");
	waittillframeend;
	self.var_7507 = lib_A59A::func_733C(self.var_7507);
	if(self.var_46F8 && self.var_7507.size)
	{
		common_scripts\utility::array_thread(self.var_7507,::lib_A5A0::func_9D1B,self,self.var_7507);
		common_scripts\utility::waittill_either("veh_collision","driver_died");
		lib_A5A0::func_5333(self.var_7507);
		wait(0.25);
	}
	else
	{
		self waittill("veh_collision");
		wait(0.25);
	}

	self notify("script_crash_vehicle");
	self vehphys_crash();
}

//Function Number: 58
lib_A5A0::func_0688(param_00,param_01)
{
	self notify("newpath");
	if(!isdefined(param_00))
	{
		param_00 = 2;
	}

	self veh_neargoalnotifydist(param_00);
	self veh_sethoverparams(0,0,0);
	self veh_cleargoalyaw();
	self veh_settargetyaw(common_scripts\utility::flat_angle(self.var_41)[1]);
	lib_A5A0::func_0646(lib_A59A::func_4414(self.var_2E6),1);
	self waittill("goal");
}

//Function Number: 59
lib_A5A0::func_5745(param_00,param_01)
{
	var_02 = strtok(param_00," ");
	common_scripts\utility::array_levelthread(var_02,::lib_A5A0::func_5748,param_01);
}

//Function Number: 60
lib_A5A0::func_4427(param_00,param_01,param_02)
{
	if(!isdefined(level.var_9CF7))
	{
		level.var_9CF7 = [];
	}

	if(!isdefined(level.var_9CF7[param_00]))
	{
		level.var_9CF7[param_00] = [];
	}

	if(!isdefined(level.var_9CF7[param_00][param_02]))
	{
		level.var_9CF7[param_00][param_02] = [];
	}

	foreach(var_04 in level.var_9CF7[param_00][param_02])
	{
		if(param_01 == var_04)
		{
			return;
		}
	}

	level.var_9CF7[param_00][param_02][level.var_9CF7[param_00][param_02].size] = param_01;
}

//Function Number: 61
lib_A5A0::func_5742()
{
	level notify("new_lights_delayfxforframe");
	level endon("new_lights_delayfxforframe");
	if(!isdefined(level.var_3BA1))
	{
		level.var_3BA1 = 0;
	}

	level.var_3BA1 = level.var_3BA1 + randomfloatrange(0.2,0.4);
	if(level.var_3BA1 > 2)
	{
		level.var_3BA1 = 0;
	}

	wait(0.05);
	level.var_3BA1 = undefined;
}

//Function Number: 62
lib_A5A0::func_531C(param_00)
{
	lib_A5A0::func_5744("all",param_00);
}

//Function Number: 63
lib_A5A0::func_9C7C(param_00)
{
	self endon("death");
	var_01 = anglestoforward(self.var_41 + (0,param_00,0));
	var_01 = var_01 * 10000;
	var_01 = var_01 + (0,0,70);
	self veh_setturrettargetvec(var_01);
}

//Function Number: 64
lib_A5A0::func_9CEF(param_00,param_01)
{
	return lib_A5A0::func_0688(param_00,param_01);
}

//Function Number: 65
lib_A5A0::func_05FC(param_00,param_01)
{
	self endon("death");
	self endon("long_death");
	if(lib_A59A::func_2CE6())
	{
		return;
	}

	var_02 = [];
	var_02[0] = "snowmobile_driver";
	var_02[1] = "snowmobile_passenger";
	var_03 = [];
	var_03["snowmobile_driver"] = "tag_driver";
	var_03["snowmobile_passenger"] = "tag_passenger";
	var_04 = var_02[param_01];
	var_05 = var_03[var_04];
	var_06 = param_00 gettagorigin(var_05);
	var_07 = param_00 gettagangles(var_05);
	var_08 = undefined;
	var_09 = undefined;
	var_0A = 9999999;
	foreach(var_10, var_0C in level.var_8840[var_04])
	{
		var_0D = lib_A59A::func_3EF5(var_10);
		var_0E = getstartorigin(var_06,var_07,var_0D);
		var_0F = distance(self.var_2E6,var_0E);
		if(var_0F < var_0A)
		{
			var_0A = var_0F;
			var_09 = var_0E;
			var_08 = var_10;
		}
	}

	var_09 = common_scripts\utility::drop_to_ground(var_09);
	self.var_1C7 = 8;
	self.var_2AF2 = 1;
	self method_81A6(var_09);
	self waittill("goal");
	param_00 lib_A506::func_BC9(self,var_08,var_05);
	param_00 thread lib_A59F::func_448F(self);
	self.var_2AF2 = 0;
}

//Function Number: 66
lib_A5A0::func_A0AF(param_00)
{
	var_01 = 12;
	var_02 = 400;
	var_03 = gettime() + var_02;
	if(isdefined(self.var_2F71))
	{
		var_04 = lib_A59A::func_4414(param_00.var_2E6) + (0,0,self.var_2F71);
		self veh_settargetyaw(param_00.var_41[1]);
		self veh_setgoalpos(var_04,1);
		self waittill("goal");
	}

	while(isdefined(self))
	{
		if(abs(self.var_41[0]) > var_01 || abs(self.var_41[2]) > var_01)
		{
			var_03 = gettime() + var_02;
		}

		if(gettime() > var_03)
		{
			break;
		}

		wait(0.05);
	}
}

//Function Number: 67
lib_A5A0::func_0684()
{
	if(!isdefined(self.var_7953))
	{
		return;
	}

	self endon("kill_badplace_forever");
	if(!self veh_isphysveh())
	{
		self endon("death");
	}

	self endon("delete");
	if(isdefined(level.var_2553))
	{
		self thread [[ level.var_2553 ]]();
		return;
	}

	var_00 = isdefined(level.var_9CD8[self.model]) && level.var_9CD8[self.model];
	var_01 = 0.5;
	var_02 = 17;
	var_03 = 17;
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		if(!isdefined(self.var_7953) || !self.var_7953)
		{
			while(isdefined(self) && !isdefined(self.var_7953) || !self.var_7953)
			{
				wait(0.5);
			}

			if(!isdefined(self))
			{
				return;
			}
		}

		var_04 = self veh_getspeed();
		if(var_04 <= 0)
		{
			wait(var_01);
			continue;
		}

		if(var_04 < 5)
		{
			var_05 = 200;
		}
		else if(var_04 > 5 && var_04 < 8)
		{
			var_05 = 350;
		}
		else
		{
			var_05 = 500;
		}

		if(isdefined(self.var_1268))
		{
			var_05 = var_05 * self.var_1268;
		}

		if(var_00)
		{
			var_06 = anglestoforward(self gettagangles("tag_turret"));
		}
		else
		{
			var_06 = anglestoforward(self.var_41);
		}

		badplace_arc(self.unique_id + "arc",var_01,self.var_2E6,var_05 * 1.9,300,var_06,var_02,var_03,"axis","team3","allies");
		badplace_cylinder(self.unique_id + "cyl",var_01,self.var_2E6,200,300,"axis","team3","allies");
		wait(var_01 + 0.05);
	}
}

//Function Number: 68
lib_A5A0::func_068D(param_00)
{
	self notify("unloading");
	var_01 = [];
	if(lib_A59A::func_32DB("no_riders_until_unload"))
	{
		lib_A59A::func_32DD("no_riders_until_unload");
		var_01 = lib_A5A0::func_896D(param_00);
		foreach(var_03 in var_01)
		{
			lib_A59A::func_88EB(var_03);
		}
	}

	if(isdefined(param_00))
	{
		self.var_9A34 = param_00;
	}

	foreach(var_06 in self.var_7507)
	{
		if(isalive(var_06))
		{
			var_06 notify("unload");
		}
	}

	var_01 = lib_A59F::func_C57("unload");
	var_08 = level.var_9D61[self.classname];
	if(isdefined(var_08))
	{
		var_01 = [];
		var_09 = lib_A59F::func_3EAC();
		foreach(var_0B in self.var_7507)
		{
			if(isdefined(var_0B) && isdefined(var_0B.var_9D13) && isdefined(var_09[var_0B.var_9D13]))
			{
				var_01[var_01.size] = var_0B;
			}
		}
	}

	return var_01;
}

//Function Number: 69
lib_A5A0::func_5744(param_00,param_01,param_02)
{
	if(isdefined(param_02))
	{
		param_01 = param_02;
	}
	else if(!isdefined(param_01))
	{
		param_01 = self.classname;
	}

	if(!isdefined(param_00))
	{
		param_00 = "all";
	}

	if(!isdefined(self.var_5741))
	{
		return;
	}

	if(!isdefined(level.var_9CF7[param_01][param_00]))
	{
		return;
	}

	var_03 = level.var_9CF7[param_01][param_00];
	var_04 = 0;
	var_05 = 2;
	if(isdefined(self.var_5A3C))
	{
		var_05 = self.var_5A3C;
	}

	foreach(var_07 in var_03)
	{
		var_08 = level.var_9CF6[param_01][var_07];
		if(lib_A59A::hastag(self.model,var_08.tag))
		{
			stopfxontag(var_08.effect,self,var_08.tag);
		}

		var_04++;
		if(var_04 >= var_05)
		{
			var_04 = 0;
			wait(0.05);
		}

		if(!isdefined(self))
		{
			return;
		}

		self.var_5741[var_07] = undefined;
	}
}

//Function Number: 70
lib_A5A0::func_5748(param_00,param_01)
{
	level.var_55B8 = gettime();
	if(!isdefined(param_00))
	{
		param_00 = "all";
	}

	if(!isdefined(param_01))
	{
		param_01 = self.classname;
	}

	if(!isdefined(level.var_9CF7))
	{
		return;
	}

	if(!isdefined(level.var_9CF7[param_01]) || !isdefined(level.var_9CF7[param_01][param_00]))
	{
		return;
	}

	thread lib_A5A0::func_5742();
	if(!isdefined(self.var_5741))
	{
		self.var_5741 = [];
	}

	var_02 = level.var_9CF7[param_01][param_00];
	var_03 = 0;
	var_04 = [];
	foreach(var_06 in var_02)
	{
		if(isdefined(self.var_5741[var_06]))
		{
			continue;
		}

		var_07 = level.var_9CF6[param_01][var_06];
		if(isdefined(var_07.delay))
		{
			var_08 = var_07.delay;
		}
		else
		{
			var_08 = 0;
		}

		var_08 = var_08 + level.var_3BA1;
		while(isdefined(var_04["" + var_08]))
		{
			var_08 = var_08 + 0.05;
		}

		var_04["" + var_08] = 1;
		self endon("death");
		childthread common_scripts\utility::noself_delaycall_proc(::playfxontag,var_08,var_07.effect,self,var_07.tag);
		self.var_5741[var_06] = 1;
		if(!isdefined(self))
		{
			break;
		}
	}

	level.var_3BA1 = 0;
}

//Function Number: 71
lib_A5A0::func_0646(param_00,param_01)
{
	if(self.health <= 0)
	{
		return;
	}

	if(isdefined(self.var_65A4))
	{
		param_00 = param_00 + (0,0,self.var_65A4);
	}

	self veh_setgoalpos(param_00,param_01);
}

//Function Number: 72
lib_A5A0::func_4804(param_00,param_01)
{
	self endon("in_air_explosion");
	if(isdefined(self.var_67C7))
	{
		var_02 = self.var_67C7;
	}
	else
	{
		var_03 = lib_A5A0::func_3EAD();
		var_02 = common_scripts\utility::getclosest(self.var_2E6,var_03);
	}

	var_02.claimed = 1;
	self notify("newpath");
	self notify("deathspin");
	var_04 = 0;
	var_05 = 0;
	if(isdefined(var_02.script_parameters) && var_02.script_parameters == "direct")
	{
		var_05 = 1;
	}

	if(isdefined(self.var_47A9))
	{
		var_05 = 0;
		var_04 = self.var_47A9;
	}

	if(var_05)
	{
		var_06 = 60;
		self veh_setspeed(var_06,15,10);
		self veh_neargoalnotifydist(var_02.radius);
		self veh_setgoalpos(var_02.var_2E6,0);
		thread lib_A5A0::func_4802(var_02.var_2E6,var_06);
		common_scripts\utility::waittill_any("goal","near_goal");
		lib_A5A0::func_4805(var_02);
	}
	else
	{
		var_07 = (var_02.var_2E6[0],var_02.var_2E6[1],self.var_2E6[2] + var_04);
		if(isdefined(self.var_47AA))
		{
			var_07 = self.var_2E6 + self.var_47AA * self veh_getvelocity();
			var_07 = (var_07[0],var_07[1],var_07[2] + var_04);
		}

		self veh_setspeed(40,10,10);
		self veh_neargoalnotifydist(300);
		self veh_setgoalpos(var_07,1);
		thread lib_A5A0::func_4802(var_07,40);
		var_08 = "blank";
		while(var_08 != "death")
		{
			var_08 = common_scripts\utility::waittill_any("goal","near_goal","death");
			if(!isdefined(var_08) && !isdefined(self))
			{
				var_02.claimed = undefined;
				self notify("crash_done");
				return;
			}
			else
			{
				var_08 = "death";
			}
		}

		self veh_setgoalpos(var_02.var_2E6,0);
		self waittill("goal");
		lib_A5A0::func_4805(var_02);
	}

	var_02.claimed = undefined;
	self notify("stop_crash_loop_sound");
	self notify("crash_done");
}

//Function Number: 73
lib_A5A0::func_4805(param_00)
{
	self endon("death");
	while(isdefined(param_00.target))
	{
		param_00 = common_scripts\utility::getstruct(param_00.target,"targetname");
		var_01 = 56;
		if(isdefined(param_00.radius))
		{
			var_01 = param_00.radius;
		}

		self veh_neargoalnotifydist(var_01);
		self veh_setgoalpos(param_00.var_2E6,0);
		common_scripts\utility::waittill_any("goal","near_goal");
	}
}

//Function Number: 74
lib_A5A0::func_4802(param_00,param_01)
{
	self endon("crash_done");
	self veh_clearlookatent();
	var_02 = 0;
	if(isdefined(self.var_6EEF))
	{
		var_02 = self.var_6EEF;
		if(self.var_6EEF < 0)
		{
			var_03 = [1,2,2];
			var_04 = 5;
			var_05 = randomint(var_04);
			var_06 = 0;
			foreach(var_09, var_08 in var_03)
			{
				var_06 = var_06 + var_08;
				if(var_05 < var_06)
				{
					var_02 = var_09;
					break;
				}
			}
		}
	}

	switch(var_02)
	{
		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 0:
		default:
			break;
	}
}

//Function Number: 75
lib_A5A0::func_480B()
{
	self notify("in_air_explosion");
	wait(0.05);
	self notify("crash_done");
}

//Function Number: 76
lib_A5A0::func_4801(param_00,param_01)
{
	self endon("crash_done");
	self veh_clearlookatent();
	self veh_setmaxpitchroll(randomintrange(20,90),randomintrange(5,90));
	self veh_setyawspeed(400,100,100);
	var_02 = 90 * randomintrange(-2,3);
	for(;;)
	{
		var_03 = param_00 - self.var_2E6;
		var_04 = vectortoyaw(var_03);
		var_04 = var_04 + var_02;
		self veh_settargetyaw(var_04);
		wait(0.1);
	}
}

//Function Number: 77
lib_A5A0::func_4807()
{
	self endon("crash_done");
	self veh_clearlookatent();
	self veh_setyawspeed(400,100,100);
	var_00 = randomint(2);
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		var_01 = randomintrange(20,120);
		if(var_00)
		{
			self veh_settargetyaw(self.var_41[1] + var_01);
		}
		else
		{
			self veh_settargetyaw(self.var_41[1] - var_01);
		}

		var_00 = 1 - var_00;
		var_02 = randomfloatrange(0.5,1);
		wait(var_02);
	}
}

//Function Number: 78
lib_A5A0::func_4806()
{
	self endon("crash_done");
	self veh_clearlookatent();
	self veh_setyawspeed(400,100,100);
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		var_00 = randomintrange(90,120);
		self veh_settargetyaw(self.var_41[1] + var_00);
		wait(0.5);
	}
}

//Function Number: 79
lib_A5A0::func_3EAD()
{
	var_00 = [];
	level.var_4803 = common_scripts\utility::array_removeundefined(level.var_4803);
	foreach(var_02 in level.var_4803)
	{
		if(isdefined(var_02.claimed))
		{
			continue;
		}

		var_00[var_00.size] = var_02;
	}

	return var_00;
}

//Function Number: 80
lib_A5A0::func_2976()
{
	if(!isdefined(self.var_367E))
	{
		return;
	}

	if(!self.var_367E.size)
	{
		return;
	}

	var_00 = getarraykeys(self.var_367E);
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		self.var_367E[var_00[var_01]] unlink();
	}
}

//Function Number: 81
lib_A5A0::func_05B3()
{
	if(isdefined(self.modeldummyon) && self.modeldummyon)
	{
		var_00 = self.modeldummy;
	}
	else
	{
		var_00 = self;
	}

	return var_00;
}

//Function Number: 82
lib_A5A0::func_2325(param_00)
{
	var_01 = param_00;
	var_02 = [];
	while(isdefined(var_01))
	{
		if(isdefined(var_01.var_29B5) && var_01.var_29B5 == 0)
		{
			var_03 = lib_A5A0::func_66BF(vehpath_getnode(var_01.target,"targetname"));
			if(isdefined(var_03) && isdefined(var_03.var_797A))
			{
				return 1;
			}
		}

		var_02[var_02.size] = var_01;
		if(isdefined(var_01.target))
		{
			var_01 = vehpath_getnode(var_01.target,"targetname");
			continue;
		}

		var_01 = undefined;
		if(isdefined(var_01) && common_scripts\utility::array_contains(var_02,var_01))
		{
			break;
		}
	}

	return 0;
}

//Function Number: 83
lib_A5A0::func_9CE7()
{
	self notify("kill_badplace_forever");
}

//Function Number: 84
lib_A5A0::func_5318(param_00)
{
	if(isdefined(level.var_9CA1[param_00]))
	{
		self.var_2D34 = 1;
		wait(level.var_9CA1[param_00].delay);
	}

	if(!isdefined(self))
	{
		return;
	}

	self veh_joltbody(self.var_2E6 + (23,33,64),3);
	wait(2);
	if(!isdefined(self))
	{
		return;
	}

	self.var_2D34 = undefined;
}

//Function Number: 85
lib_A5A0::func_05DA(param_00,param_01)
{
	if(common_scripts\utility::isdestructible() || isdefined(self.var_4FFD) && self.var_4FFD)
	{
		return;
	}

	level notify("vehicle_explosion",self.var_2E6);
	self notify("explode",self.var_2E6);
	if(isdefined(self.var_4B9E) && self.var_4B9E)
	{
		return;
	}

	var_02 = self.vehicletype;
	var_03 = self.classname;
	if(param_01)
	{
		var_03 = "rocket_death" + var_03;
	}

	foreach(var_05 in level.var_9C9F[var_03])
	{
		thread lib_A5A0::func_530F(param_00,var_05,var_02);
	}
}

//Function Number: 86
lib_A5A0::func_530F(param_00,param_01,param_02)
{
	if(isdefined(param_01.var_A004))
	{
		if(param_01.var_A004 >= 0)
		{
			wait(param_01.var_A004);
		}
		else
		{
			self waittill("death_finished");
		}
	}

	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(param_01.notifystring))
	{
		self notify(param_01.notifystring);
	}

	var_03 = lib_A5A0::func_05B3();
	if(isdefined(param_01.var_7C71))
	{
		common_scripts\utility::delaycall(param_01.var_7C71,::delete);
	}

	if(isdefined(param_01.effect))
	{
		if(param_01.var_136B && !isdefined(self.delete_on_death))
		{
			if(isdefined(param_01.tag))
			{
				if(isdefined(param_01.var_8D7B) && param_01.var_8D7B == 1)
				{
					thread lib_A5A0::func_586D(param_01.effect,param_01.delay,param_01.tag);
				}
				else
				{
					thread lib_A5A0::func_6DBF(param_01.effect,param_01.delay,param_01.tag);
				}
			}
			else
			{
				var_04 = var_03.var_2E6 + (0,0,100) - var_03.var_2E6;
				playfx(param_01.effect,var_03.var_2E6,var_04);
			}
		}
		else if(isdefined(param_01.tag))
		{
			playfxontag(param_01.effect,lib_A5A0::func_2661(),param_01.tag);
			if(isdefined(param_01.var_733D))
			{
				lib_A5A0::func_2661() common_scripts\utility::delaycall(param_01.var_733D,::delete);
			}
		}
		else
		{
			var_04 = var_03.var_2E6 + (0,0,100) - var_03.var_2E6;
			playfx(param_01.effect,var_03.var_2E6,var_04);
		}
	}

	if(isdefined(param_01.sound) && !isdefined(self.delete_on_death))
	{
		if(param_01.var_182E)
		{
			thread lib_A5A0::func_2640(param_01.sound);
			return;
		}

		common_scripts\utility::play_sound_in_space(param_01.sound);
	}
}

//Function Number: 87
lib_A5A0::func_586D(param_00,param_01,param_02)
{
	self endon("stop_looping_death_fx");
	while(isdefined(self))
	{
		playfxontag(param_00,lib_A5A0::func_2661(),param_02);
		wait(param_01);
	}
}

//Function Number: 88
lib_A5A0::func_2640(param_00)
{
	thread lib_A59A::func_6973(param_00,undefined,0,1);
	common_scripts\utility::waittill_any("fire_extinguish","stop_crash_loop_sound");
	if(!isdefined(self))
	{
		iprintln("^1DEBUG: Infinite looping sound for a vehicle could be happening right now...");
		return;
	}

	self notify("stop sound" + param_00);
}

//Function Number: 89
lib_A5A0::func_2661()
{
	if(isdefined(self.var_2642) && self.var_2642)
	{
		return self;
	}

	if(!isdefined(self.var_2661))
	{
		var_00 = spawn("script_model",(0,0,0));
		var_01 = lib_A5A0::func_05B3();
		var_00 setmodel(self.model);
		var_00.var_2E6 = var_01.var_2E6;
		var_00.var_41 = var_01.var_41;
		var_00 notsolid();
		var_00 hide();
		var_00 linkto(var_01);
		self.var_2661 = var_00;
	}
	else
	{
		self.var_2661 setmodel(self.model);
	}

	return self.var_2661;
}

//Function Number: 90
lib_A5A0::func_6DBF(param_00,param_01,param_02)
{
	var_03 = lib_A5A0::func_05B3();
	var_04 = spawn("script_origin",var_03.var_2E6);
	self endon("fire_extinguish");
	thread lib_A5A0::func_6DC0(param_02,var_04);
	for(;;)
	{
		playfx(param_00,var_04.var_2E6,var_04.var_9BC5);
		wait(param_01);
	}
}

//Function Number: 91
lib_A5A0::func_6DC0(param_00,param_01)
{
	param_01.var_41 = self gettagangles(param_00);
	param_01.var_2E6 = self gettagorigin(param_00);
	param_01.var_39EE = anglestoforward(param_01.var_41);
	param_01.var_9BC5 = anglestoup(param_01.var_41);
	while(isdefined(self) && self.code_classname == "script_vehicle" && self veh_getspeed() > 0)
	{
		var_02 = lib_A5A0::func_05B3();
		param_01.var_41 = var_02 gettagangles(param_00);
		param_01.var_2E6 = var_02 gettagorigin(param_00);
		param_01.var_39EE = anglestoforward(param_01.var_41);
		param_01.var_9BC5 = anglestoup(param_01.var_41);
		wait(0.05);
	}
}

//Function Number: 92
lib_A5A0::func_52F8(param_00)
{
	if(!isdefined(level.var_9C9D[param_00]))
	{
		return;
	}

	var_01 = level.var_9C9D[param_00];
	if(isdefined(var_01.delay))
	{
		wait(var_01.delay);
	}

	if(!isdefined(self))
	{
		return;
	}

	badplace_cylinder("vehicle_kill_badplace",var_01.duration,self.var_2E6,var_01.radius,var_01.height,var_01.var_91E0,var_01.var_91E1);
}

//Function Number: 93
lib_A5A0::func_994D(param_00)
{
	if(isdefined(self))
	{
		if(isdefined(param_00.var_284A))
		{
			wait(param_00.var_284A);
		}
	}

	if(isdefined(param_00))
	{
		param_00 delete();
	}
}

//Function Number: 94
lib_A5A0::func_0CA8()
{
	if(!isdefined(self.var_987A))
	{
		return;
	}

	var_00 = self.var_987A;
	self.var_987A = [];
	foreach(var_02 in var_00)
	{
		if(isdefined(var_02.spawner))
		{
			var_03 = common_scripts\utility::spawn_tag_origin();
			var_03.spawner = var_02.spawner;
		}
		else
		{
			var_03 = spawn("script_model",self.var_2E6);
			var_03 setmodel(var_02.model);
		}

		var_04 = "tag_body";
		if(isdefined(var_02.var_79F8))
		{
			var_03.var_79F8 = var_02.var_79F8;
			var_03.var_12FD = var_02.var_2E6;
			var_03.var_12F2 = var_02.var_41;
			var_04 = var_02.var_79F8;
		}

		if(isdefined(var_02.var_28E7))
		{
			var_02 thread lib_A5A0::func_987B(var_03);
		}

		if(isdefined(var_02.var_39B))
		{
			var_03.var_39B = var_02.var_39B;
		}

		if(isdefined(var_02.script_parameters))
		{
			var_03.script_parameters = var_02.script_parameters;
		}

		var_03 linkto(self,var_04,var_02.var_2E6,var_02.var_41);
		if(isdefined(var_02.destructible_type))
		{
			var_03.destructible_type = var_02.destructible_type;
			var_03 common_scripts\_destructible::setup_destructibles(1);
		}

		self.var_987A[self.var_987A.size] = var_03;
	}
}

//Function Number: 95
lib_A5A0::func_987B(param_00)
{
	param_00 endon("death");
	param_00 setcandamage(1);
	param_00.health = 8000;
	param_00 waittill("damage");
	param_00 hide();
	var_01 = common_scripts\utility::spawn_tag_origin();
	var_01.var_2E6 = param_00.var_2E6;
	var_01.var_41 = param_00.var_41;
	var_01 linkto(param_00);
	playfxontag(self.var_28E7,var_01,"tag_origin");
}

//Function Number: 96
lib_A5A0::func_987A()
{
	var_00 = getent(self.target,"targetname");
	var_01 = lib_A5A0::func_4187(var_00);
	if(isspawner(self))
	{
		var_01.spawner = self;
	}

	if(isdefined(self.targetname))
	{
		var_02 = getent(self.targetname,"target");
		if(isspawner(var_02))
		{
			var_01.spawner = var_02;
		}
	}

	if(isdefined(self.var_39B))
	{
		var_01.var_39B = self.var_39B;
	}

	if(isdefined(self.script_parameters))
	{
		var_01.script_parameters = self.script_parameters;
	}

	if(isdefined(self.script_fxid))
	{
		var_01.var_28E7 = common_scripts\utility::getfx(self.script_fxid);
	}

	if(!isdefined(var_00.var_987A))
	{
		var_00.var_987A = [];
	}

	if(isdefined(self.var_7AD6))
	{
		var_01.var_7AD6 = self.var_7AD6;
	}

	if(isdefined(self.destructible_type))
	{
		lib_A59A::func_6EB7(self.destructible_type);
		var_01.destructible_type = self.destructible_type;
	}

	var_00.var_987A[var_00.var_987A.size] = var_01;
	if(!isdefined(self.classname))
	{
		return;
	}

	if(isspawner(self))
	{
		return;
	}

	self delete();
}

//Function Number: 97
lib_A5A0::func_4187(param_00)
{
	var_01 = spawnstruct();
	var_02 = "tag_body";
	if(isdefined(self.var_79F8))
	{
		var_02 = self.var_79F8;
		var_01.var_79F8 = self.var_79F8;
	}

	var_01.var_2E6 = self.var_2E6 - param_00 gettagorigin(var_02);
	if(!isdefined(self.var_41))
	{
		var_03 = (0,0,0);
	}
	else
	{
		var_03 = self.var_41;
	}

	var_01.var_41 = var_03 - param_00 gettagangles(var_02);
	var_01.model = self.model;
	if(isdefined(self.script_modelname))
	{
		precachemodel(self.script_modelname);
		var_01.model = self.script_modelname;
	}

	if(isdefined(var_01.targetname))
	{
		level.struct_class_names["targetname"][var_01.targetname] = undefined;
	}

	if(isdefined(var_01.target))
	{
		level.struct_class_names["target"][var_01.target] = undefined;
	}

	return var_01;
}

//Function Number: 98
lib_A5A0::func_05BE(param_00)
{
	var_01 = getentarray("script_vehicle","code_classname");
	if(isdefined(param_00))
	{
		var_02 = [];
		foreach(var_04 in var_01)
		{
			if(!isdefined(var_04.targetname))
			{
				continue;
			}

			if(var_04.targetname == param_00)
			{
				var_02 = common_scripts\utility::array_add(var_02,var_04);
			}
		}

		var_01 = var_02;
	}

	var_06 = [];
	foreach(var_04 in var_01)
	{
		if(isspawner(var_04))
		{
			var_06[var_06.size] = var_04;
		}
	}

	return var_06;
}

//Function Number: 99
lib_A5A0::func_05BF(param_00)
{
	var_01 = lib_A5A0::func_05BE();
	var_02 = [];
	foreach(var_04 in var_01)
	{
		if(isdefined(var_04.var_7B14) && var_04.var_7B14 == param_00)
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 100
lib_A5A0::func_5970(param_00,param_01)
{
	for(;;)
	{
		if(!isdefined(self))
		{
			break;
		}

		if(!isdefined(param_00))
		{
			break;
		}

		var_02 = param_00 gettagorigin(param_01);
		var_03 = param_00 gettagangles(param_01);
		self.var_2E6 = var_02;
		self.var_41 = var_03;
		wait(0.05);
	}
}

//Function Number: 101
lib_A5A0::func_4B01(param_00)
{
	self method_8115(#animtree);
	lib_A5A0::func_4B02(param_00);
	if(!isdefined(self))
	{
		return;
	}

	self method_8142(param_00["idle"],0);
	self method_8142(param_00["rot_l"],0);
	self method_8142(param_00["rot_r"],0);
}

//Function Number: 102
lib_A5A0::func_4B02(param_00)
{
	self endon("death");
	for(;;)
	{
		var_01 = self.var_4F8 / 18;
		if(var_01 <= 0.0001)
		{
			var_01 = 0.0001;
		}

		var_02 = randomfloatrange(0.3,0.7);
		self method_814B(param_00["idle"],var_01,0,var_02);
		var_02 = randomfloatrange(0.1,0.8);
		self method_814B(param_00["rot_l"],1,0,var_02);
		var_02 = randomfloatrange(0.1,0.8);
		self method_814B(param_00["rot_r"],1,0,var_02);
		wait(0.5);
	}
}

//Function Number: 103
lib_A5A0::func_9D27(param_00)
{
	foreach(var_02 in self.var_7507)
	{
		if(isai(var_02))
		{
			var_02 lib_A59A::func_7E32(param_00);
			continue;
		}

		if(isdefined(var_02.spawner))
		{
			var_02.spawner.var_79E1 = param_00;
			continue;
		}
	}
}

//Function Number: 104
lib_A5A0::func_9AD7(param_00)
{
	if(param_00.var_9ADF == gettime())
	{
		return param_00.var_8E1B;
	}

	param_00.var_9ADF = gettime();
	if(param_00.var_8E1C)
	{
		var_01 = clamp(0 - param_00.var_41[2],0 - param_00.var_8E1F,param_00.var_8E1F) / param_00.var_8E1F;
		if(isdefined(param_00.var_565C) && param_00.var_565C)
		{
			var_02 = param_00 veh_getsteering();
			var_02 = var_02 * -1;
			var_01 = var_01 + var_02;
			if(var_01 != 0)
			{
				var_03 = 1 / abs(var_01);
				if(var_03 < 1)
				{
					var_01 = var_01 * var_03;
				}
			}
		}

		var_04 = var_01 - param_00.var_8E1B;
		if(var_04 != 0)
		{
			var_05 = param_00.var_8E1E / abs(var_04);
			if(var_05 < 1)
			{
				var_04 = var_04 * var_05;
			}

			param_00.var_8E1B = param_00.var_8E1B + var_04;
		}
	}
	else
	{
		param_00.var_8E1B = 0;
	}

	return param_00.var_8E1B;
}

//Function Number: 105
lib_A5A0::func_3D7E(param_00)
{
	return common_scripts\utility::getstruct(param_00,"targetname");
}

//Function Number: 106
lib_A5A0::func_3D7C(param_00)
{
	var_01 = getentarray(param_00,"targetname");
	if(isdefined(var_01) && var_01.size > 0)
	{
		return var_01[randomint(var_01.size)];
	}

	return undefined;
}

//Function Number: 107
lib_A5A0::func_3D7F(param_00)
{
	return common_scripts\utility::getstruct(param_00,"target");
}

//Function Number: 108
lib_A5A0::func_3D7D(param_00)
{
	return getent(param_00,"target");
}

//Function Number: 109
lib_A5A0::func_3D80(param_00)
{
	return vehpath_getnode(param_00,"targetname");
}

//Function Number: 110
lib_A5A0::func_7E67(param_00)
{
	var_01 = getent(param_00.script_linkto,"script_linkname");
	if(!isdefined(var_01))
	{
		return;
	}

	self veh_setlookatent(var_01);
	self.var_7E68 = 1;
}

//Function Number: 111
lib_A5A0::func_257F()
{
	level.var_CD1 = 0;
	self.var_2B62 = 0;
	thread lib_A5A0::func_2581();
	if(isdefined(self))
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04);
		if(!isplayer(var_01))
		{
			continue;
		}

		if(isdefined(self.var_46FA))
		{
			continue;
		}

		var_04 = tolower(var_04);
		switch(var_04)
		{
			case "mod_rifle_bullet":
			case "mod_pistol_bullet":
			case "bullet":
				break;
		}
	}
}

//Function Number: 112
lib_A5A0::func_2580()
{
	level.var_CD1 = 0;
	self.var_2B62 = 0;
	thread lib_A5A0::func_2581();
	if(isdefined(self))
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04);
		if(!isplayer(var_01))
		{
			continue;
		}

		if(isdefined(self.var_46FA))
		{
			continue;
		}

		var_04 = tolower(var_04);
		switch(var_04)
		{
			case "mod_rifle_bullet":
			case "mod_pistol_bullet":
			case "bullet":
			case "mod_grenade_splash":
			case "mod_grenade":
				break;
		}
	}
}

//Function Number: 113
lib_A5A0::func_2581()
{
	self waittill("death");
	if(self.var_2B62)
	{
		level.var_CD1 = 0;
	}
}

//Function Number: 114
lib_A5A0::func_21D3(param_00)
{
	var_01 = self getattachsize();
	var_02 = [];
	for(var_03 = 0;var_03 < var_01;var_03++)
	{
		var_02[var_03] = tolower(self getattachmodelname(var_03));
	}

	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		param_00 attach(var_02[var_03],tolower(self getattachtagname(var_03)));
	}
}

//Function Number: 115
lib_A5A0::func_5743(param_00,param_01,param_02)
{
	var_03 = strtok(param_00," ",param_01);
	common_scripts\utility::array_levelthread(var_03,::lib_A5A0::func_5744,param_01,param_02);
}

//Function Number: 116
lib_A5A0::func_0995(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		self notify("stop_kicking_up_dust");
		if(isdefined(level.var_686) && isdefined(level.var_686[self.classname]) && isdefined(level.var_686[self.classname].var_90FF))
		{
			foreach(var_03 in level.var_686[self.classname].var_90FF)
			{
				thread lib_A5A0::func_0995(param_00,var_03);
			}

			return;
		}
	}
	else
	{
		self notify("stop_kicking_up_dust" + var_04);
		self endon("stop_kicking_up_dust" + var_04);
	}

	self endon("death");
	self endon("death_finished");
	self endon("stop_kicking_up_dust");
	var_05 = 350;
	var_06 = 2000;
	if(isdefined(level.var_9743))
	{
		var_06 = level.var_9743;
	}

	var_07 = 100 / var_06;
	var_08 = 0.15;
	var_09 = 0.05;
	var_0A = 0.5;
	var_0B = 3;
	var_0C = var_0B;
	var_0D = lib_A5A0::func_05D7();
	if(var_0D)
	{
		var_0A = 0.15;
	}

	var_0E = undefined;
	var_0F = undefined;
	var_10 = self;
	if(isdefined(var_03))
	{
		var_10 = var_03;
	}

	var_11 = 30;
	for(;;)
	{
		wait(var_0A);
		if(isdefined(var_04))
		{
			var_12 = var_10 gettagorigin(var_04);
			var_13 = var_10 gettagangles(var_04);
			var_13 = combineangles(var_13,(-90,0,0));
		}
		else
		{
			var_12 = var_10.var_2E6;
			var_13 = var_10.var_41;
		}

		var_14 = anglestoup(var_13) * -1;
		var_0C++;
		if(var_0C > var_0B)
		{
			var_0C = var_0B;
			var_0E = bullettrace(var_12,var_12 + var_14 * var_06,0,var_10);
		}

		if(var_0E["fraction"] == 1 || var_0E["fraction"] < var_07)
		{
			continue;
		}

		var_15 = distance(var_12,var_0E["position"]);
		var_16 = lib_A5A0::func_3EC1(self,var_0E,var_14,var_15,var_04);
		if(!isdefined(var_16))
		{
			continue;
		}

		if(!isdefined(var_0E))
		{
			continue;
		}

		if(!isdefined(var_0E["position"]))
		{
			continue;
		}

		var_0A = var_15 - var_05 / var_06 - var_05 * var_08 - var_09 + var_09;
		var_0A = max(var_0A,var_09);
		var_17 = var_0E["position"];
		var_18 = var_0E["normal"];
		var_15 = vectordot(var_17 - var_12,var_18);
		var_19 = var_12 + (0,0,var_15);
		var_1A = var_17 - var_19;
		if(var_18[2] < -0.99)
		{
			continue;
		}

		var_1B = vectortoangles(var_18);
		if(angleclamp180(var_1B[0]) > -90 + var_11)
		{
			var_18 = anglestoforward((-90 + var_11,var_1B[1],0));
		}

		if(length(var_1A) < 1)
		{
			var_1A = anglestoforward(var_13 + (0,180,0));
		}

		if(abs(vectordot(vectornormalize(var_1A),var_18)) > 0.999)
		{
			continue;
		}

		playfx(var_16,var_17,var_18,var_1A);
	}
}

//Function Number: 117
lib_A5A0::func_268D(param_00,param_01,param_02)
{
}

//Function Number: 118
lib_A5A0::func_3EC1(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = param_01["surfacetype"];
	var_06 = undefined;
	var_07 = vectordot((0,0,-1),param_02);
	if(var_07 >= 0.97)
	{
		var_06 = undefined;
	}
	else if(var_07 >= 0.92)
	{
		var_06 = "_bank";
	}
	else
	{
		var_06 = "_bank_lg";
	}

	if(isdefined(level.var_686) && isdefined(level.var_686[param_00.classname]) && isdefined(level.var_686[param_00.classname].var_3E7F))
	{
		var_05 = param_00 [[ level.var_686[param_00.classname].var_3E7F ]](var_05,param_04);
	}

	return lib_A5A0::func_3EC0(param_00.classname,var_05,var_06);
}

//Function Number: 119
lib_A5A0::func_3EC0(param_00,param_01,param_02)
{
	if(isdefined(param_02))
	{
		var_03 = param_01 + param_02;
		if(!isdefined(level.var_685[param_00][var_03]))
		{
			return lib_A5A0::func_3EB5(param_00,param_01);
		}
		else
		{
			return level.var_685[param_00][var_03];
		}
	}

	return lib_A5A0::func_3EB5(param_00,param_01);
}

//Function Number: 120
lib_A5A0::func_3EB5(param_00,param_01)
{
	if(!isdefined(level.var_685[param_00]))
	{
		return undefined;
	}

	if(!isdefined(level.var_685[param_00][param_01]) && param_01 != "default" && param_01 != "default_script_model")
	{
		return lib_A5A0::func_3EB5(param_00,"default");
	}
	else
	{
		return level.var_685[param_00][param_01];
	}

	return undefined;
}

//Function Number: 121
lib_A5A0::func_6110()
{
	return lib_A5A0::func_05D8() || lib_A5A0::func_05D7();
}

//Function Number: 122
lib_A5A0::func_9D52()
{
	var_00 = self.classname;
	if(!isdefined(level.var_685[var_00]))
	{
		return;
	}

	if(lib_A5A0::func_6110())
	{
		return;
	}

	if(isdefined(level.var_973C))
	{
		self thread [[ level.var_973C ]]("tag_origin","back_left",(160,0,0));
		return;
	}

	if(isdefined(level.var_9D38) && isdefined(level.var_9D38[self.vehicletype]))
	{
		thread lib_A5A0::func_2BD8();
		return;
	}

	thread lib_A5A0::func_2BC5();
}

//Function Number: 123
lib_A5A0::func_2BC5()
{
	self endon("death");
	self endon("kill_treads_forever");
	for(;;)
	{
		var_00 = lib_A5A0::func_973D();
		if(var_00 == -1)
		{
			wait(0.1);
			continue;
		}

		var_01 = lib_A5A0::func_05B3();
		lib_A5A0::func_973B(var_01,var_00,"tag_wheel_back_left","back_left",0);
		wait(0.05);
		lib_A5A0::func_973B(var_01,var_00,"tag_wheel_back_right","back_right",0);
		wait(0.05);
	}
}

//Function Number: 124
lib_A5A0::func_973D()
{
	var_00 = self veh_getspeed();
	if(!var_00)
	{
		return -1;
	}

	var_00 = var_00 * 17.6;
	var_01 = 1 / var_00;
	var_01 = clamp(var_01 * 35,0.1,0.3);
	if(isdefined(self.var_9742))
	{
		var_01 = var_01 * self.var_9742;
	}

	wait(var_01);
	return var_01;
}

//Function Number: 125
lib_A5A0::func_973B(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A5A0::func_3EA0(self,param_03);
	if(!isdefined(var_06))
	{
		return;
	}

	var_07 = param_00 gettagangles(param_02);
	var_08 = anglestoforward(var_07);
	var_09 = self gettagorigin(param_02);
	if(param_04)
	{
		var_0A = self gettagorigin(param_05);
		var_09 = var_09 + var_0A / 2;
	}

	playfx(var_06,var_09,anglestoup(var_07),var_08 * param_01);
}

//Function Number: 126
lib_A5A0::func_3EA0(param_00,param_01)
{
	var_02 = self veh_getwheelsurface(param_01);
	if(!isdefined(param_00.vehicletype))
	{
		var_03 = -1;
		return var_03;
	}

	var_04 = param_01.classname;
	return lib_A5A0::func_3EB5(var_04,var_03);
}

//Function Number: 127
lib_A5A0::func_2BD8()
{
	self endon("death");
	self endon("kill_treads_forever");
	for(;;)
	{
		var_00 = lib_A5A0::func_973D();
		if(var_00 == -1)
		{
			wait(0.1);
			continue;
		}

		var_01 = lib_A5A0::func_05B3();
		var_01 lib_A5A0::func_973B(var_01,var_00,"tag_wheel_back_left","back_left",1,"tag_wheel_back_right");
	}
}

//Function Number: 128
lib_A5A0::func_05D8()
{
	return isdefined(level.var_480D[self.vehicletype]);
}

//Function Number: 129
lib_A5A0::func_05D7()
{
	return isdefined(level.var_997[self.vehicletype]);
}

//Function Number: 130
lib_A5A0::func_50DC()
{
	if(!isdefined(self.var_796E))
	{
		return 0;
	}

	if(!self.var_796E)
	{
		return 0;
	}

	return 1;
}

//Function Number: 131
lib_A5A0::func_472C()
{
	if(!lib_A5A0::func_05D8() && !lib_A5A0::func_05D7())
	{
		return 0;
	}

	if(lib_A5A0::func_50DC())
	{
		return 0;
	}

	return 1;
}

//Function Number: 132
lib_A5A0::func_472D()
{
	if(!isdefined(self.vehicletype))
	{
		return 0;
	}

	if(lib_A5A0::func_50DC())
	{
		return 0;
	}

	if(self.vehicletype == "cobra")
	{
		return 1;
	}

	if(self.vehicletype == "cobra_player")
	{
		return 1;
	}

	if(self.vehicletype == "viper")
	{
		return 1;
	}

	return 0;
}

//Function Number: 133
lib_A5A0::func_2B34()
{
	self endon("death");
	var_00 = 0;
	if(isdefined(self.script_disconnectpaths) && !self.script_disconnectpaths)
	{
		var_00 = 1;
	}

	if(var_00)
	{
		self.var_2D2F = 1;
		return;
	}

	wait(randomfloat(1));
	while(isdefined(self))
	{
		if(self veh_getspeed() < 1)
		{
			if(!isdefined(self.var_2D2F))
			{
				self disconnectpaths();
			}
			else
			{
			}

			self notify("speed_zero_path_disconnect");
			while(self veh_getspeed() < 1)
			{
				wait(0.05);
			}
		}

		self connectpaths();
		wait(1);
	}
}

//Function Number: 134
lib_A5A0::func_5BCD()
{
	var_00 = self.classname;
	if(isdefined(self.var_7A7B) && self.var_7A7B > 0)
	{
		return;
	}

	if(!isdefined(level.var_9D04[var_00]))
	{
		return;
	}

	var_01 = 0;
	if(isdefined(self.var_7A2E))
	{
		var_01 = self.var_7A2E;
	}

	var_02 = level.var_9D04[var_00];
	if(!isdefined(var_02))
	{
		return;
	}

	var_03 = isdefined(self.var_39B) && self.var_39B == "onemg";
	foreach(var_07, var_05 in var_02)
	{
		var_06 = spawnturret("misc_turret",(0,0,0),var_05.var_4C59);
		if(isdefined(var_05.var_637A))
		{
			var_06 linkto(self,var_05.tag,var_05.var_637A,(0,-1 * var_01,0));
		}
		else
		{
			var_06 linkto(self,var_05.tag,(0,0,0),(0,-1 * var_01,0));
		}

		var_06 setmodel(var_05.model);
		var_06.var_41 = self.var_41;
		var_06.var_51FC = 1;
		var_06.var_6639 = self;
		var_06.var_7AE9 = self.var_7AE9;
		var_06 thread lib_A54E::func_192D();
		var_06 makeunusable();
		lib_A5A0::func_7EDD(var_06);
		level thread lib_A54E::func_5BC5(var_06,lib_A59A::func_3F56());
		if(isdefined(self.var_79CB))
		{
			var_06.var_79CB = self.var_79CB;
		}

		if(isdefined(var_05.var_284A))
		{
			var_06.var_284A = var_05.var_284A;
		}

		if(isdefined(var_05.var_276))
		{
			var_06.var_276 = var_05.var_276;
		}

		if(isdefined(var_05.var_2793))
		{
			var_06 setdefaultdroppitch(var_05.var_2793);
		}

		self.mgturret[var_07] = var_06;
		if(var_03)
		{
			break;
		}
	}

	foreach(var_0A, var_06 in self.mgturret)
	{
		var_09 = level.var_9D04[var_00][var_0A].var_279A;
		if(isdefined(var_09))
		{
			var_06 lib_A5A0::func_997D(var_09);
		}
	}

	if(!isdefined(self.var_7AFE))
	{
		self.var_7AFE = 1;
	}

	if(self.var_7AFE == 0)
	{
		thread lib_A5A0::func_05EF();
		return;
	}

	self.var_7AFE = 1;
	thread lib_A5A0::func_05F0();
}

//Function Number: 135
lib_A5A0::func_997D(param_00)
{
	self.var_279A = param_00;
}

//Function Number: 136
lib_A5A0::func_7EDD(param_00)
{
	switch(self.var_7AE9)
	{
		case "allies":
		case "friendly":
			break;

		case "axis":
		case "enemy":
			break;

		case "team3":
			break;

		default:
			break;
	}
}

//Function Number: 137
lib_A5A0::func_0C55()
{
	self endon("suspend_drive_anims");
	if(!isdefined(self.var_A2F5))
	{
		self.var_A2F5 = 1;
	}

	var_00 = self.model;
	var_01 = -1;
	var_02 = undefined;
	self method_8115(#animtree);
	if(!isdefined(level.var_9CB0[var_00]))
	{
		return;
	}

	if(!isdefined(level.var_9CB3[var_00]))
	{
		level.var_9CB3[var_00] = level.var_9CB0[var_00];
	}

	self endon("death");
	var_03 = level.var_9CB2[var_00];
	var_04 = 1;
	if(isdefined(level.var_9CB1) && isdefined(level.var_9CB1[var_00]))
	{
		var_04 = level.var_9CB1[var_00];
	}

	var_05 = self.var_A2F5;
	var_06 = self;
	var_07 = level.var_9CB0[var_00];
	for(;;)
	{
		if(isdefined(level.var_C56))
		{
			var_06 = lib_A5A0::func_05B3();
		}

		if(!var_03)
		{
			if(isdefined(self.var_8FF8))
			{
				wait(0.05);
				continue;
			}

			var_06 method_814B(level.var_9CB0[var_00],1,0.2,var_04);
			return;
		}

		var_08 = self veh_getspeed();
		if(self.modeldummyon && isdefined(self.var_2FC3))
		{
			var_08 = self.var_2FC3;
		}

		if(var_05 != self.var_A2F5)
		{
			var_09 = 0;
			if(self.var_A2F5)
			{
				var_07 = level.var_9CB0[var_00];
				var_09 = 1 - var_06 lib_A5A0::func_4050(level.var_9CB3[var_00]);
				var_06 method_8142(level.var_9CB3[var_00],0);
			}
			else
			{
				var_07 = level.var_9CB3[var_00];
				var_09 = 1 - var_06 lib_A5A0::func_4050(level.var_9CB0[var_00]);
				var_06 method_8142(level.var_9CB0[var_00],0);
			}

			var_02 = 0.01;
			if(var_02 >= 1 || var_02 == 0)
			{
				var_02 = 0.01;
			}

			var_05 = self.var_A2F5;
		}

		var_0A = var_08 / var_03;
		if(var_0A != var_01)
		{
			var_06 method_814B(var_07,1,0.05,var_0A);
			var_01 = var_0A;
		}

		if(isdefined(var_02))
		{
			var_06 method_8117(var_07,var_02);
			var_02 = undefined;
		}

		wait(0.05);
	}
}

//Function Number: 138
lib_A5A0::func_80DA(param_00,param_01)
{
	var_02 = [[ param_01 ]](param_00.targetname);
	var_02.var_29B5 = 0;
}

//Function Number: 139
lib_A5A0::func_803C()
{
	foreach(var_01 in function_00D6())
	{
		if(isdefined(var_01.var_7B13))
		{
			level.var_9D1A = lib_A5A0::func_0CD9(level.var_9D1A,var_01.var_7B13,var_01);
		}
	}

	foreach(var_01 in function_00D8())
	{
		if(isdefined(var_01.var_7B13))
		{
			level.var_9D1D = lib_A5A0::func_0CD9(level.var_9D1D,var_01.var_7B13,var_01);
		}
	}

	if(isdefined(level.var_8938))
	{
		foreach(var_06 in level.struct)
		{
			if(isdefined(var_06.var_7B13) && isdefined(var_06.var_7AC8))
			{
				level.var_9D1D = lib_A5A0::func_0CD9(level.var_9D1D,var_06.var_7B13,var_06);
			}
		}
	}
}

//Function Number: 140
lib_A5A0::func_0CD9(param_00,param_01,param_02)
{
	if(!isdefined(param_00[param_01]))
	{
		param_00[param_01] = [];
	}

	param_00[param_01][param_00[param_01].size] = param_02;
	return param_00;
}

//Function Number: 141
lib_A5A0::func_5054(param_00)
{
	return isdefined(param_00.classname) && param_00.classname == "script_origin";
}

//Function Number: 142
lib_A5A0::func_6126()
{
	var_00 = 0;
	if(isdefined(self.spawnflags) && self.spawnflags & 1)
	{
		if(isdefined(self.var_797A))
		{
			level.var_9C94[level.var_9C94.size] = self;
		}

		level.var_9D42[level.var_9D42.size] = self;
	}

	if(isdefined(self.var_7B0D) && isdefined(self.targetname))
	{
		var_01 = undefined;
		if(isdefined(lib_A5A0::func_3D7C(self.targetname)))
		{
			var_01 = ::lib_A5A0::func_3D7D;
		}

		if(isdefined(lib_A5A0::func_3D7E(self.targetname)))
		{
			var_01 = ::lib_A5A0::func_3D7F;
		}

		if(isdefined(var_01))
		{
			lib_A5A0::func_80DA(self,var_01);
			var_00 = 1;
		}
		else
		{
			lib_A5A0::func_812C(self);
		}

		level.var_9CAD = lib_A5A0::func_0CD9(level.var_9CAD,self.var_7B0D,self);
		if(level.var_9CAD[self.var_7B0D].size > 2)
		{
		}
	}

	if(isdefined(self.var_79F7))
	{
		level.var_9CC0 = lib_A5A0::func_0CD9(level.var_9CC0,self.var_79F7,self);
		self.var_3C59 = 0;
	}

	if(isdefined(self.var_79D3))
	{
		if(!isdefined(level.flag[self.var_79D3]))
		{
			common_scripts\utility::flag_init(self.var_79D3);
		}
	}

	if(isdefined(self.var_79CF))
	{
		if(!isdefined(level.flag[self.var_79CF]))
		{
			common_scripts\utility::flag_init(self.var_79CF);
		}
	}

	if(isdefined(self.var_79D5))
	{
		if(!isdefined(level.flag[self.var_79D5]))
		{
			common_scripts\utility::flag_init(self.var_79D5);
		}
	}

	if(isdefined(self.var_7B14) || isdefined(self.var_7B15) || isdefined(self.var_79F7) || isdefined(self.var_7B11))
	{
		var_00 = 1;
	}

	if(var_00)
	{
		lib_A5A0::func_0788(self);
	}
}

//Function Number: 143
lib_A5A0::func_82D6()
{
	level.var_9D14 = [];
	var_00 = [];
	var_00 = common_scripts\utility::array_combine(vehpath_getallnodes(),getentarray("script_origin","code_classname"));
	var_00 = common_scripts\utility::array_combine(var_00,level.struct);
	var_00 = common_scripts\utility::array_combine(var_00,getentarray("trigger_radius","code_classname"));
	var_00 = common_scripts\utility::array_combine(var_00,getentarray("trigger_disk","code_classname"));
	var_00 = common_scripts\utility::array_combine(var_00,getentarray("trigger_multiple","code_classname"));
	var_00 = common_scripts\utility::array_combine(var_00,getentarray("trigger_lookat","code_classname"));
	common_scripts\utility::array_thread(var_00,::lib_A5A0::func_6126);
}

//Function Number: 144
lib_A5A0::func_5055(param_00)
{
	if(!isdefined(param_00.targetname))
	{
		return 0;
	}

	return isdefined(common_scripts\utility::getstruct(param_00.targetname,"targetname"));
}

//Function Number: 145
lib_A5A0::func_82DE(param_00)
{
	var_01 = [];
	level.var_360D = [];
	foreach(var_03 in param_00)
	{
		if(var_03 lib_A5A0::func_1CE8())
		{
			continue;
		}
		else
		{
			var_01[var_01.size] = var_03;
		}
	}

	lib_A5A0::func_1CBA();
	foreach(var_06 in var_01)
	{
		thread lib_A5A0::func_9CE2(var_06);
	}
}

//Function Number: 146
lib_A5A0::func_1CBA()
{
	if(!level.var_360D.size)
	{
		level.var_360D = undefined;
		return;
	}

	foreach(var_01 in level.var_360D)
	{
	}
}

//Function Number: 147
lib_A5A0::func_1CE8()
{
	if(isdefined(self.var_7B14) && !isspawner(self))
	{
		level.var_360D[level.var_360D.size] = self;
		return 1;
	}

	return isspawner(self);
}

//Function Number: 148
lib_A5A0::func_9CF1()
{
	var_00 = self.classname;
	if(!isdefined(level.var_9CF1) || !isdefined(level.var_9CF1[var_00]))
	{
		wait(2);
	}

	if(isdefined(self.var_7AD5))
	{
		self.health = self.var_7AD5;
	}
	else if(level.var_9CF1[var_00] == -1)
	{
		return;
	}
	else if(isdefined(level.var_9CF3[var_00]) && isdefined(level.var_9CF2[var_00]))
	{
		self.health = randomint(level.var_9CF2[var_00] - level.var_9CF3[var_00]) + level.var_9CF3[var_00];
	}
	else
	{
		self.health = level.var_9CF1[var_00];
	}

	if(isdefined(level.var_2921[self.model]))
	{
		self.health = 2000;
		self.destructible_type = level.var_2921[self.model];
		common_scripts\_destructible::setup_destructibles(1);
	}
}

//Function Number: 149
lib_A5A0::func_8031(param_00)
{
	if(isdefined(self.mgturret) && self.mgturret.size)
	{
		foreach(var_02 in self.mgturret)
		{
			var_02.var_79CB = param_00;
		}
	}
}

//Function Number: 150
lib_A5A0::func_4050(param_00)
{
	var_01 = self method_814F(param_00);
	var_02 = function_0063(param_00);
	if(var_01 == 0)
	{
		return 0;
	}

	return self method_814F(param_00) / function_0063(param_00);
}

//Function Number: 151
lib_A5A0::func_760E()
{
	var_00 = function_0063(lib_A59A::func_3EF3("rotors"));
	for(;;)
	{
		self method_814B(lib_A59A::func_3EF3("rotors"),1,0,1);
		wait(var_00);
	}
}

//Function Number: 152
lib_A5A0::func_8FF7()
{
	self notify("suspend_drive_anims");
	var_00 = self.model;
	self method_8142(level.var_9CB0[var_00],0);
	self method_8142(level.var_9CB3[var_00],0);
}

//Function Number: 153
lib_A5A0::func_4B66()
{
	self method_8115(#animtree);
	if(!isdefined(level.var_9CDE[self.model]))
	{
		return;
	}

	foreach(var_01 in level.var_9CDE[self.model])
	{
		self method_814B(var_01);
	}
}

//Function Number: 154
lib_A5A0::func_9D24()
{
	self endon("kill_rumble_forever");
	var_00 = self.classname;
	var_01 = undefined;
	if(isdefined(self.var_9D26))
	{
		var_01 = self.var_9D26;
	}
	else if(isdefined(level.var_9D25) && isdefined(level.var_9D25[var_00]))
	{
		var_01 = level.var_9D25;
	}
	else if(isdefined(level.var_9D24[var_00]))
	{
		var_01 = level.var_9D24[var_00];
	}

	if(!isdefined(var_01))
	{
		return;
	}

	var_02 = var_01.radius * 2;
	var_03 = -1 * var_01.radius;
	var_04 = spawn("trigger_radius",self.var_2E6 + (0,0,var_03),0,var_01.radius,var_02);
	var_04 enablelinkto();
	var_04 linkto(self);
	self.var_769F = var_04;
	self endon("death");
	if(!isdefined(self.var_7698))
	{
		self.var_7698 = 1;
	}

	if(isdefined(var_01.var_782A))
	{
		self.var_7691 = var_01.var_782A;
	}
	else
	{
		self.var_7691 = 0.15;
	}

	if(isdefined(var_01.duration))
	{
		self.var_7676 = var_01.duration;
	}
	else
	{
		self.var_7676 = 4.5;
	}

	if(isdefined(var_01.radius))
	{
		self.var_768A = var_01.radius;
	}
	else
	{
		self.var_768A = 600;
	}

	if(isdefined(var_01.var_1318))
	{
		self.var_7674 = var_01.var_1318;
	}
	else
	{
		self.var_7674 = 1;
	}

	if(isdefined(var_01.var_711A))
	{
		self.var_768E = var_01.var_711A;
	}
	else
	{
		self.var_768E = 1;
	}

	var_04.radius = self.var_768A;
	for(;;)
	{
		var_04 waittill("trigger");
		if(self veh_getspeed() == 0 || !self.var_7698)
		{
			wait(0.1);
			continue;
		}

		self playrumblelooponentity(var_01.var_7672);
		while(level.var_31D istouching(var_04) && self.var_7698 && self veh_getspeed() > 0)
		{
			earthquake(self.var_7691,self.var_7676,self.var_2E6,self.var_768A);
			wait(self.var_7674 + randomfloat(self.var_768E));
		}

		self stoprumble(var_01.var_7672);
	}
}

//Function Number: 155
lib_A5A0::func_9CEA()
{
	self notify("kill_treads_forever");
}

//Function Number: 156
lib_A5A0::func_51B6()
{
	var_00 = self.vehicletype;
	if(isdefined(level.var_9CE4[var_00]) && level.var_9CE4[var_00])
	{
		return 1;
	}

	return 0;
}

//Function Number: 157
lib_A5A0::func_9D31()
{
	if(!isdefined(level.var_9D31[self.classname]))
	{
		return;
	}

	if(getdvar("disable_tank_shock_minspec") == "1")
	{
		return;
	}

	self endon("death");
	self endon("stop_vehicle_shoot_shock");
	for(;;)
	{
		self waittill("weapon_fired");
		if(isdefined(self.var_83C9))
		{
			var_00 = self.var_83C9;
		}
		else
		{
			var_00 = 400;
		}

		var_01 = distance(self.var_2E6,level.var_31D.var_2E6);
		if(var_01 > var_00)
		{
			continue;
		}

		if(isdefined(level.var_31D.flashendtime) && level.var_31D.flashendtime - gettime() > 200)
		{
			continue;
		}

		if(isdefined(self.var_83B5) && self.var_83B5)
		{
			continue;
		}

		if(isdefined(self.var_83B6))
		{
			var_02 = self.var_83B6;
		}
		else
		{
			var_03 = var_01 / var_00;
			var_02 = 4 - 3 * var_03;
		}

		level.var_31D shellshock(level.var_9D31[self.classname],var_02);
	}
}

//Function Number: 158
lib_A5A0::func_9D2F()
{
	var_00 = self.classname;
	if(!isdefined(self.var_7AE9) && isdefined(level.var_9D4D[var_00]))
	{
		self.var_7AE9 = level.var_9D4D[var_00];
	}

	level.var_9D72[self.var_7AE9] = common_scripts\utility::array_add(level.var_9D72[self.var_7AE9],self);
}

//Function Number: 159
lib_A5A0::func_9CD5()
{
	self endon("death");
	var_00 = self.vehicletype;
	if(!lib_A59A::func_32DB("unloaded"))
	{
		lib_A59A::func_32DC("unloaded");
	}
}

//Function Number: 160
lib_A5A0::func_3EB8(param_00)
{
	var_01 = vehpath_getnode(param_00,"targetname");
	if(!isdefined(var_01))
	{
		var_01 = getent(param_00,"targetname");
	}
	else if(lib_A5A0::func_05D8())
	{
	}

	if(!isdefined(var_01))
	{
		var_02 = common_scripts\utility::getstructarray(param_00,"targetname");
		var_03 = [];
		if(isdefined(var_02))
		{
			foreach(var_05 in var_02)
			{
				if(isdefined(var_05.var_7B03))
				{
					continue;
				}

				var_03[var_03.size] = var_05;
			}
		}

		if(var_03.size == 1)
		{
			var_01 = var_03[0];
		}
		else
		{
			var_01 = undefined;
		}
	}

	return var_01;
}

//Function Number: 161
lib_A5A0::func_9D18()
{
	if(!lib_A5A0::func_05D8())
	{
		self veh_resumespeed(35);
		return;
	}

	var_00 = undefined;
	if(isdefined(self.var_251D.target))
	{
		var_00 = lib_A5A0::func_3EB8(self.var_251D.target);
	}

	if(!isdefined(var_00))
	{
		return;
	}

	lib_A5A0::func_0689(var_00);
}

//Function Number: 162
lib_A5A0::func_46EC()
{
	return isdefined(level.var_9CBF[self.vehicletype]);
}

//Function Number: 163
lib_A5A0::func_4405(param_00)
{
	if(!isdefined(self.var_7A03))
	{
		return 0;
	}

	param_00 = tolower(param_00);
	if(!isdefined(param_00) || !issubstr(param_00,"grenade"))
	{
		return 0;
	}

	if(self.var_7A03)
	{
		return 1;
	}

	return 0;
}

//Function Number: 164
lib_A5A0::func_18AF(param_00)
{
	if(!isdefined(self.script_bulletshield))
	{
		return 0;
	}

	param_00 = tolower(param_00);
	if(!isdefined(param_00) || !issubstr(param_00,"bullet") || issubstr(param_00,"explosive"))
	{
		return 0;
	}

	if(self.script_bulletshield)
	{
		return 1;
	}

	return 0;
}

//Function Number: 165
lib_A5A0::func_354C(param_00)
{
	if(!isdefined(self.var_79BD))
	{
		return 0;
	}

	param_00 = tolower(param_00);
	if(!isdefined(param_00) || !issubstr(param_00,"explosive"))
	{
		return 0;
	}

	if(self.var_79BD)
	{
		return 1;
	}

	return 0;
}

//Function Number: 166
lib_A5A0::func_9D33(param_00,param_01)
{
	return (!isdefined(param_00) && self.var_7AE9 != "neutral") || lib_A5A0::func_0E29(param_00) || lib_A5A0::func_0E2A(param_00) || common_scripts\utility::isdestructible() || lib_A5A0::func_5040(param_00) || lib_A5A0::func_18AF(param_01) || lib_A5A0::func_354C(param_01) || lib_A5A0::func_4405(param_01) || param_01 == "MOD_MELEE" || param_01 == "MOD_MELEE_ALT";
}

//Function Number: 167
lib_A5A0::func_3A9D()
{
	self endon("death");
	if(!isdefined(level.var_9A8E))
	{
		self endon("stop_friendlyfire_shield");
	}

	var_00 = self.classname;
	if(isdefined(level.var_9C8A[var_00]) && !isdefined(self.script_bulletshield))
	{
		self.script_bulletshield = level.var_9C8A[var_00];
	}

	if(isdefined(level.var_9CD3[var_00]) && !isdefined(self.var_7A03))
	{
		self.var_7A03 = level.var_9CD3[var_00];
	}

	if(isdefined(self.var_7A70))
	{
		self.var_7A70 = 1;
		self.var_1892 = 5000;
		self.health = 350;
	}
	else
	{
		self.var_7A70 = 0;
	}

	self.var_4783 = 20000;
	self.health = self.health + self.var_4783;
	self.var_2516 = self.health;
	var_01 = undefined;
	var_02 = undefined;
	for(var_03 = undefined;self.health > 0;var_03 = undefined)
	{
		self waittill("damage",var_04,var_01,var_05,var_06,var_02,var_07,var_08,var_09,var_0A,var_03);
		foreach(var_0C in self.var_257D)
		{
			thread [[ var_0C ]](var_04,var_01,var_05,var_06,var_02,var_07,var_08);
		}

		if(isdefined(var_01))
		{
			var_01 lib_A565::func_72E4();
		}

		if(lib_A5A0::func_9D33(var_01,var_02) || lib_A5A0::func_05D6())
		{
			self.health = self.var_2516;
		}
		else if(lib_A5A0::func_46EC())
		{
			lib_A5A0::func_72CE(var_01,var_04);
			self.var_2516 = self.health;
		}
		else if(lib_A5A0::func_4917(var_02))
		{
			self.health = self.var_2516;
			self.var_1892 = self.var_1892 - var_04;
		}
		else
		{
			self.var_2516 = self.health;
		}

		if(common_scripts\_destructible::getdamagetype(var_02) == "splash")
		{
			self.var_756B = 1;
		}
		else
		{
			self.var_756B = undefined;
		}

		if(self.health < self.var_4783 && !isdefined(self.var_9D43))
		{
			break;
		}

		var_04 = undefined;
		var_01 = undefined;
		var_05 = undefined;
		var_06 = undefined;
		var_02 = undefined;
		var_07 = undefined;
		var_08 = undefined;
		var_09 = undefined;
		var_0A = undefined;
	}

	self notify("death",var_01,var_02,var_03);
}

//Function Number: 168
lib_A5A0::func_4917(param_00)
{
	if(!self.var_7A70)
	{
		return 0;
	}

	if(self.var_1892 <= 0)
	{
		return 0;
	}

	if(!isdefined(param_00))
	{
		return 0;
	}

	if(!issubstr(param_00,"BULLET"))
	{
		return 0;
	}

	return 1;
}

//Function Number: 169
lib_A5A0::func_72CE(param_00,param_01)
{
	var_02 = anglestoforward(self.var_41);
	var_03 = vectornormalize(param_00.var_2E6 - self.var_2E6);
	if(vectordot(var_02,var_03) > 0.86)
	{
		self.health = self.health + int(param_01 * level.var_9CBF[self.vehicletype]);
	}
}

//Function Number: 170
lib_A5A0::func_05D6()
{
	if(isdefined(self.godmode) && self.godmode)
	{
		return 1;
	}

	return 0;
}

//Function Number: 171
lib_A5A0::func_5040(param_00)
{
	if(!isdefined(self.var_792A))
	{
		return 0;
	}

	if(isdefined(param_00) && isai(param_00) && self.var_792A == 1)
	{
		return 1;
	}

	return 0;
}

//Function Number: 172
lib_A5A0::func_0E2A(param_00)
{
	if(isdefined(self.var_7AE9) && self.var_7AE9 == "allies" && isdefined(param_00) && isplayer(param_00))
	{
		return 1;
	}

	if(isai(param_00) && param_00.inliveplayerkillstreak == self.var_7AE9)
	{
		return 1;
	}

	return 0;
}

//Function Number: 173
lib_A5A0::func_0E29(param_00)
{
	if(isdefined(param_00) && isdefined(param_00.var_7AE9) && isdefined(self.var_7AE9) && param_00.var_7AE9 == self.var_7AE9)
	{
		return 1;
	}

	return 0;
}

//Function Number: 174
lib_A5A0::func_9C87()
{
	return lib_A5A0::func_0684();
}

//Function Number: 175
lib_A5A0::func_A2F6(param_00)
{
	self.var_A2F5 = common_scripts\utility::ter_op(param_00 <= 0,0,1);
}

//Function Number: 176
lib_A5A0::func_5905()
{
	if(isdefined(level.var_5906))
	{
		thread [[ level.var_5906 ]]();
		return;
	}

	var_00 = self.model;
	if(!isdefined(level.var_9CA9[var_00]))
	{
		return;
	}

	self endon("death");
	for(;;)
	{
		self waittill("weapon_fired");
		playfxontag(level.var_9CA9[var_00],self,"tag_engine_exhaust");
		var_01 = self gettagorigin("tag_flash");
		var_02 = physicstrace(var_01,var_01 + (0,0,-128));
		physicsexplosionsphere(var_02,192,100,1);
	}
}

//Function Number: 177
lib_A5A0::func_6DDF()
{
	self endon("death");
	var_00 = self.model;
	if(!isdefined(level.var_9CB9[var_00]))
	{
		return;
	}

	var_01 = 0.1;
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		if(!isalive(self))
		{
			return;
		}

		playfxontag(level.var_9CB9[var_00],lib_A5A0::func_05B3(),"tag_engine_exhaust");
		wait(var_01);
	}
}

//Function Number: 178
lib_A5A0::func_4060(param_00)
{
	var_01 = undefined;
	var_02 = self.vehicletype;
	if(isdefined(self.var_9D3D))
	{
		if(isdefined(self.var_9D3D.var_2D35) && self.var_2D35)
		{
			return;
		}
	}

	if(isdefined(self.target))
	{
		var_01 = vehpath_getnode(self.target,"targetname");
		if(!isdefined(var_01))
		{
			var_03 = getentarray(self.target,"targetname");
			foreach(var_05 in var_03)
			{
				if(var_05.code_classname == "script_origin")
				{
					var_01 = var_05;
					break;
				}
			}
		}

		if(!isdefined(var_01))
		{
			var_01 = common_scripts\utility::getstruct(self.target,"targetname");
		}
	}

	if(!isdefined(var_01))
	{
		if(lib_A5A0::func_05D8())
		{
			if(isdefined(self.var_9CDA))
			{
				self [[ self.var_9CDA ]]();
			}
			else
			{
				self veh_setspeed(60,20,10);
			}
		}

		return;
	}

	self.var_DF6 = var_01;
	if(!lib_A5A0::func_05D8())
	{
		self.var_2E6 = var_01.var_2E6;
		if(!isdefined(param_00))
		{
			self veh_attachpath(var_01);
		}
	}
	else if(isdefined(self.speed))
	{
		self veh_setspeedimmediate(self.speed,20);
	}
	else if(isdefined(var_01.speed))
	{
		if(isdefined(self.var_9CDA))
		{
			self [[ self.var_9CDA ]](var_01.speed,var_01.script_accel,var_01.var_7986);
		}
		else
		{
			var_07 = 20;
			var_08 = 10;
			if(isdefined(var_01.script_accel))
			{
				var_07 = var_01.script_accel;
			}

			if(isdefined(var_01.var_7986))
			{
				var_07 = var_01.var_7986;
			}

			self veh_setspeedimmediate(var_01.speed,var_07,var_08);
		}
	}
	else if(isdefined(self.var_9CDA))
	{
		self [[ self.var_9CDA ]]();
	}
	else
	{
		self veh_setspeed(60,20,10);
	}

	thread lib_A5A0::func_0689(undefined,lib_A5A0::func_05D8());
}

//Function Number: 179
lib_A5A0::func_068A(param_00)
{
	var_01 = self.var_9D44[param_00];
	self.var_9D44[param_00] = undefined;
	if(self.var_9D44.size)
	{
		return;
	}

	self veh_resumespeed(var_01);
}

//Function Number: 180
lib_A5A0::func_068C(param_00,param_01,param_02)
{
	if(!isdefined(self.var_9D44))
	{
		self.var_9D44 = [];
	}

	self veh_setspeed(0,param_01,param_02);
	self.var_9D44[param_00] = param_01;
}

//Function Number: 181
lib_A5A0::func_9A3A(param_00)
{
	self endon("death");
	if(isdefined(self.var_32D7["prep_unload"]) && lib_A59A::func_32D7("prep_unload"))
	{
		return;
	}

	if(issubstr(self.classname,"snowmobile"))
	{
		while(self.var_4F8 > 15)
		{
			wait(0.05);
		}
	}

	if(!isdefined(param_00.var_79D5) && !isdefined(param_00.script_delay))
	{
		self notify("newpath");
	}

	var_01 = getnode(param_00.targetname,"target");
	if(isdefined(var_01) && self.var_7507.size)
	{
		foreach(var_03 in self.var_7507)
		{
			if(isai(var_03))
			{
				var_03 thread lib_A577::func_423E(var_01);
			}
		}
	}

	if(lib_A5A0::func_05D8())
	{
		if(isdefined(self.var_667C))
		{
			self veh_setmaxpitchroll(0,0);
			lib_A5A0::func_A07D();
			common_scripts\utility::delaycall(5,::veh_setmaxpitchroll,15,15);
		}
		else
		{
			self veh_sethoverparams(0);
			lib_A5A0::func_A0AF(param_00);
		}
	}
	else if(!isdefined(self.var_5FA1) || !self.var_5FA1)
	{
		self veh_setspeed(0,35);
	}

	if(isdefined(param_00.var_39B))
	{
		if(param_00.var_39B == "wait_for_flag")
		{
			common_scripts\utility::flag_wait(param_00.var_79CE);
		}
	}

	lib_A5A0::func_068D(param_00.var_7B00);
	if(lib_A59F::func_7509(param_00.var_7B00))
	{
		if(isdefined(self.var_667C))
		{
			if(isdefined(param_00.var_39B))
			{
				if(param_00.var_39B == "para_unload_stop")
				{
					self waittill("unloaded");
				}
			}
		}
		else
		{
			self waittill("unloaded");
		}
	}

	if(isdefined(param_00.var_79D5) || isdefined(param_00.script_delay))
	{
		return;
	}

	if(isdefined(self))
	{
		thread lib_A5A0::func_9D18();
	}
}

//Function Number: 182
lib_A5A0::func_5F38(param_00)
{
	var_01 = self.classname;
	if(!isdefined(self.mgturret))
	{
		return;
	}

	if(self.mgturret.size == 0)
	{
		return;
	}

	foreach(var_04, var_03 in self.mgturret)
	{
		var_03 unlink();
		var_03 linkto(param_00,level.var_9D04[var_01][var_04].tag,(0,0,0),(0,0,0));
	}
}

//Function Number: 183
lib_A5A0::func_9D0E()
{
	self.var_DF6 = undefined;
	self notify("newpath");
	self veh_setgoalyaw(common_scripts\utility::flat_angle(self.var_41)[1]);
	self veh_setgoalpos(self.var_2E6 + (0,0,4),1);
}

//Function Number: 184
lib_A5A0::func_A07D()
{
	var_00 = 4;
	var_01 = 400;
	var_02 = gettime() + var_01;
	while(isdefined(self))
	{
		var_03 = self.var_2E6[2] - self.var_251D.var_2E6[2];
		if(abs(var_03) <= var_00)
		{
			return;
		}
		else
		{
			var_02 = gettime() + var_01;
		}

		if(gettime() > var_02)
		{
			iprintln("Chopper parachute unload: waittill_dropoff_height timed out!");
			break;
		}

		wait(0.05);
	}
}

//Function Number: 185
lib_A5A0::func_2665()
{
	if(self.health > 0)
	{
		self.var_759B = 1;
	}
}

//Function Number: 186
lib_A5A0::func_2664()
{
	self.var_759B = undefined;
	self notify("deathrolloff");
}

//Function Number: 187
lib_A5A0::func_05EF()
{
	self.var_7AFE = 0;
	if(lib_A5A0::func_05D8() && lib_A5A0::func_472D())
	{
		if(isdefined(level.var_1D5F))
		{
			self thread [[ level.var_1D60 ]]();
			return;
		}
	}

	if(!isdefined(self.mgturret))
	{
		return;
	}

	foreach(var_01 in self.mgturret)
	{
		if(isdefined(var_01.var_79CB))
		{
			var_01.var_79CB = 0;
		}

		var_01 setmode("manual");
	}
}

//Function Number: 188
lib_A5A0::func_05F0()
{
	self.var_7AFE = 1;
	if(lib_A5A0::func_05D8() && lib_A5A0::func_472D())
	{
		self thread [[ level.var_1D61 ]]();
		return;
	}

	if(!isdefined(self.mgturret))
	{
		return;
	}

	foreach(var_01 in self.mgturret)
	{
		var_01 show();
		if(isdefined(var_01.var_79CB))
		{
			var_01.var_79CB = 1;
		}

		if(isdefined(var_01.var_279A))
		{
			if(var_01.var_279A != "sentry")
			{
				var_01 setmode(var_01.var_279A);
			}
		}
		else
		{
			var_01 setmode("auto_nonai");
		}

		lib_A5A0::func_7EDD(var_01);
	}
}

//Function Number: 189
lib_A5A0::func_05AF()
{
	if(common_scripts\utility::isdestructible())
	{
		common_scripts\_destructible::force_explosion();
		return;
	}

	self method_8052();
	self setcandamage(0);
}

//Function Number: 190
lib_A5A0::func_3EB1()
{
	if(!isdefined(self.var_7B13))
	{
		return [];
	}

	if(!isdefined(level.var_9D1A[self.var_7B13]))
	{
		return [];
	}

	return level.var_9D1A[self.var_7B13];
}

//Function Number: 191
lib_A5A0::func_3EB2()
{
	var_00 = [];
	if(isdefined(self.target))
	{
		var_01 = getentarray(self.target,"targetname");
		foreach(var_03 in var_01)
		{
			if(!issubstr(var_03.code_classname,"actor"))
			{
				continue;
			}

			if(!var_03.spawnflags & 1)
			{
				continue;
			}

			if(isdefined(var_03.var_2D1A))
			{
				continue;
			}

			var_00[var_00.size] = var_03;
		}

		if(isdefined(level.var_8938))
		{
			var_01 = common_scripts\utility::getstructarray(self.target,"targetname");
			foreach(var_03 in var_01)
			{
				if(isdefined(var_03.var_7AC8))
				{
					var_00[var_00.size] = var_03;
				}
			}
		}
	}

	if(!isdefined(self.var_7B13))
	{
		return var_00;
	}

	if(isdefined(level.var_9D1D[self.var_7B13]))
	{
		var_00 = common_scripts\utility::array_combine(var_00,level.var_9D1D[self.var_7B13]);
	}

	return var_00;
}

//Function Number: 192
lib_A5A0::func_0689(param_00,param_01,param_02)
{
	if(lib_A5A0::func_05D8())
	{
		lib_A5A0::func_9D10(param_00,param_01,param_02);
		return;
	}

	lib_A5A0::func_9D11(param_00);
}

//Function Number: 193
lib_A5A0::func_05C6(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = self;
	}

	if(isdefined(param_00.var_7B15))
	{
		level.var_9D41[param_00.var_7B15] = common_scripts\utility::array_remove(level.var_9D41[param_00.var_7B15],param_00);
	}

	param_00 endon("death");
	if(isdefined(param_00.var_4743))
	{
		return;
	}
	else
	{
		param_00.var_4743 = 1;
	}

	param_00 lib_A59A::script_delay();
	param_00 notify("start_vehiclepath");
	if(param_00 lib_A5A0::func_05D8())
	{
		param_00 notify("start_dynamicpath");
		return;
	}

	var_01 = vehpath_getnode(param_00.target,"targetname");
	if(isdefined(var_01))
	{
		param_00 thread lib_A5A0::func_0689(var_01);
	}

	param_00 veh_startpath();
}

//Function Number: 194
lib_A5A0::func_062F(param_00)
{
	var_01 = lib_A5A0::func_05BF(param_00);
	var_02 = [];
	foreach(var_04 in var_01)
	{
		var_02[var_02.size] = lib_A5A0::func_068B(var_04);
	}

	return var_02;
}

//Function Number: 195
lib_A5A0::func_068B(param_00)
{
	if(!isspawner(param_00))
	{
		return;
	}

	var_01 = param_00 veh_dospawn();
	if(!isdefined(param_00.var_899C))
	{
		param_00.var_899C = 0;
	}

	param_00.var_899C++;
	param_00.var_9D3C = var_01;
	param_00.var_5559 = var_01;
	param_00 thread lib_A5A0::func_7389();
	var_01.var_9D3D = param_00;
	if(isdefined(param_00.var_987A))
	{
		var_01.var_987A = param_00.var_987A;
	}

	thread lib_A5A0::func_9CE2(var_01);
	param_00 notify("spawned",var_01);
	return var_01;
}

//Function Number: 196
lib_A5A0::func_533D(param_00)
{
	param_00 waittill("trigger");
	lib_A59A::func_CE5(level.var_9CEC[param_00.var_7A17]);
	level.var_9CEC[param_00.var_7A17] = [];
}

//Function Number: 197
lib_A5A0::func_6ECC()
{
	var_00 = [];
	var_01 = getentarray("script_vehicle","code_classname");
	level.var_607F = [];
	var_02 = [];
	var_00 = [];
	if(!isdefined(level.var_9D6E))
	{
		level.var_9D6E = [];
	}

	foreach(var_04 in var_01)
	{
		var_04.vehicletype = tolower(var_04.vehicletype);
		if(var_04.vehicletype == "empty")
		{
			continue;
		}

		if(isdefined(var_04.spawnflags) && var_04.spawnflags & 1)
		{
			var_02[var_02.size] = var_04;
		}

		var_00[var_00.size] = var_04;
		if(!isdefined(level.var_9D6E[var_04.vehicletype]))
		{
			level.var_9D6E[var_04.vehicletype] = [];
		}

		var_05 = "classname: " + var_04.classname;
		lib_A5A0::func_6EE4(var_05,var_04);
	}

	if(level.var_607F.size > 0)
	{
		foreach(var_08 in level.var_607F)
		{
		}

		level waittill("never");
	}

	return var_00;
}

//Function Number: 198
lib_A5A0::func_6EE4(param_00,param_01)
{
	if(isdefined(level.var_9D6E[param_01.vehicletype][param_01.classname]))
	{
		return;
	}

	if(param_01.classname == "script_vehicle")
	{
		return;
	}

	var_02 = 0;
	foreach(var_04 in level.var_607F)
	{
		if(var_04 == param_00)
		{
			var_02 = 1;
		}
	}

	if(!var_02)
	{
		level.var_607F[level.var_607F.size] = param_00;
	}
}

//Function Number: 199
lib_A5A0::func_8168()
{
	if(isdefined(level.var_9D30))
	{
		return;
	}

	level.var_9D30 = 1;
	level.var_9CAA = [];
	level.var_9D41 = [];
	level.var_9D1A = [];
	level.var_9CA8 = [];
	level.var_9D1D = [];
	level.var_9CC0 = [];
	level.var_9C94 = [];
	level.var_9CFB = [];
	level.var_9CAD = [];
	level.var_9D42 = [];
	level.var_9CEC = [];
	level.var_4803 = getentarray("helicopter_crash_location","targetname");
	level.var_4803 = common_scripts\utility::array_combine(level.var_4803,lib_A59A::func_40FC("helicopter_crash_location","targetname"));
	level.var_9D72 = [];
	level.var_9D72["allies"] = [];
	level.var_9D72["axis"] = [];
	level.var_9D72["neutral"] = [];
	level.var_9D72["team3"] = [];
	if(!isdefined(level.var_9D4D))
	{
		level.var_9D4D = [];
	}

	if(!isdefined(level.var_9CA6))
	{
		level.var_9CA6 = [];
	}

	if(!isdefined(level.var_9CA3))
	{
		level.var_9CA3 = [];
	}

	if(!isdefined(level.var_9CB0))
	{
		level.var_9CB0 = [];
	}

	if(!isdefined(level.var_9CB3))
	{
		level.var_9CB3 = [];
	}

	if(!isdefined(level.var_E24))
	{
		level.var_E24 = [];
	}

	if(!isdefined(level.var_9D6A))
	{
		level.var_9D6A = [];
	}

	if(!isdefined(level.var_9D6B))
	{
		level.var_9D6B = [];
	}

	if(!isdefined(level.var_9CD9))
	{
		level.var_9CD9 = [];
	}

	if(!isdefined(level.var_9D58))
	{
		level.var_9D58 = [];
	}

	if(!isdefined(level.var_9D24))
	{
		level.var_9D24 = [];
	}

	if(!isdefined(level.var_9D25))
	{
		level.var_9D25 = [];
	}

	if(!isdefined(level.var_9D04))
	{
		level.var_9D04 = [];
	}

	if(!isdefined(level.var_9CE4))
	{
		level.var_9CE4 = [];
	}

	if(!isdefined(level.var_9C9E))
	{
		level.var_9C9E = [];
	}

	if(!isdefined(level.var_685))
	{
		level.var_685 = [];
	}

	if(!isdefined(level.var_9D61))
	{
		level.var_9D61 = [];
	}

	if(!isdefined(level.var_9C7A))
	{
		level.var_9C7A = [];
	}

	if(!isdefined(level.var_9D62))
	{
		level.var_9D62 = [];
	}

	if(!isdefined(level.var_9CB9))
	{
		level.var_9CB9 = [];
	}

	if(!isdefined(level.var_9CA9))
	{
		level.var_9CA9 = [];
	}

	if(!isdefined(level.var_9D31))
	{
		level.var_9D31 = [];
	}

	if(!isdefined(level.var_9CDB))
	{
		level.var_9CDB = [];
	}

	if(!isdefined(level.var_9CBF))
	{
		level.var_9CBF = [];
	}

	if(!isdefined(level.var_2921))
	{
		level.var_2921 = [];
	}

	if(!isdefined(level.var_9D5D))
	{
		level.var_9D5D = [];
	}

	if(!isdefined(level.var_9CD3))
	{
		level.var_9CD3 = [];
	}

	if(!isdefined(level.var_9C8A))
	{
		level.var_9C8A = [];
	}

	if(!isdefined(level.var_9CA1))
	{
		level.var_9CA1 = [];
	}

	if(!isdefined(level.var_9C9D))
	{
		level.var_9C9D = [];
	}

	if(!isdefined(level.var_9CDE))
	{
		level.var_9CDE = [];
	}

	if(!isdefined(level.var_480D))
	{
		level.var_480D = [];
	}

	if(!isdefined(level.var_997))
	{
		level.var_997 = [];
	}

	if(!isdefined(level.var_9D38))
	{
		level.var_9D38 = [];
	}

	if(!isdefined(level.var_9C9C))
	{
		level.var_9C9C = [];
	}

	lib_A59F::func_803F();
}

//Function Number: 200
lib_A5A0::func_8348(param_00,param_01)
{
	return lib_A5A0::func_0646(param_00,param_01);
}

//Function Number: 201
lib_A5A0::func_9CF5(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 512;
	}

	var_01 = self.var_2E6 + (0,0,param_00);
	self veh_neargoalnotifydist(10);
	lib_A5A0::func_8348(var_01,1);
	self waittill("goal");
}

//Function Number: 202
lib_A5A0::func_5F09(param_00)
{
	var_01 = lib_A5A0::func_2661();
	var_01 unlink();
	var_01 linkto(param_00);
}

//Function Number: 203
lib_A5A0::func_5D35()
{
	var_00 = self.modeldummy;
	var_00 endon("death");
	var_00 endon("stop_model_dummy_death");
	while(isdefined(self))
	{
		self waittill("death");
		waittillframeend;
	}

	var_00 delete();
}

//Function Number: 204
lib_A5A0::func_5F15(param_00,param_01)
{
	param_00 lib_A5A0::func_5748("all",self.classname);
	wait(0.3);
	thread lib_A5A0::func_5743("all",self.classname);
}

//Function Number: 205
lib_A5A0::func_8978(param_00)
{
	var_01 = [];
	var_02 = getentarray(param_00,"targetname");
	var_03 = [];
	foreach(var_05 in var_02)
	{
		if(!isdefined(var_05.code_classname) || var_05.code_classname != "script_vehicle")
		{
			continue;
		}

		if(isspawner(var_05))
		{
			var_01[var_01.size] = lib_A5A0::func_068B(var_05);
		}
	}

	return var_01;
}

//Function Number: 206
lib_A5A0::func_5301(param_00)
{
	if(!isdefined(level.var_9C9C[param_00]))
	{
		return;
	}

	if(isdefined(self.var_85B2) && self.var_85B2)
	{
		return;
	}

	if(isarray(level.var_9C9C[param_00]))
	{
		if(isdefined(self.var_6EF0))
		{
			var_01 = self.var_6EF0;
		}
		else
		{
			var_01 = common_scripts\utility::random(level.var_9C9C[var_01]);
		}

		return lib_A5A0::func_5302(var_01);
	}

	return lib_A5A0::func_5302(level.var_9C9C[var_01]);
}

//Function Number: 207
lib_A5A0::func_5302(param_00)
{
	self.var_5355 = 1;
	var_01 = common_scripts\utility::spawn_tag_origin();
	self method_828D(var_01.var_2E6,var_01.var_41,0,0);
	self veh_turnengineoff();
	self notify("kill_death_anim",param_00);
	if(isstring(param_00))
	{
		self setcandamage(0);
		var_01 lib_A506::func_C24(self,param_00);
	}
	else
	{
		self method_8115(#animtree);
		self method_813E("vehicle_death_anim",var_01.var_2E6,var_01.var_41,param_00);
		self veh_neargoalnotifydist(30);
		self veh_setgoalpos(var_01.var_2E6,1);
		self veh_setgoalyaw(var_01.var_41[1]);
		self waittillmatch("end","vehicle_death_anim");
	}

	var_01 delete();
	thread lib_A5A0::func_27D6(7);
}

//Function Number: 208
lib_A5A0::func_27D6(param_00)
{
	wait(7);
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 209
lib_A5A0::func_9A4C()
{
	if(!isdefined(self.var_4703))
	{
		return;
	}

	while(isdefined(self.var_5741) && self.var_5741.size)
	{
		wait(0.05);
	}
}