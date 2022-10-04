/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42304.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 22
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:17 PM
*******************************************************************/

//Function Number: 1
lib_A540::main()
{
	precachestring(&"SCRIPT_INTELLIGENCE_OF_FOURTYFIVE");
	precachestring(&"SCRIPT_RORKEFILE_PREV_FOUND");
	precachestring(&"SCRIPT_INTELLIGENCE_PICKUP");
	precachestring(&"SCRIPT_INTELLIGENCE_PERCENT");
	precachestring(&"SCRIPT_INTELLIGENCE_UPLOADING");
	precacheshader("torpedo_connection_bar");
	precacheshader("torpedo_connection_frame");
	level.var_4E94 = lib_A540::func_239B();
	setdvar("ui_level_cheatpoints",level.var_4E94.size);
	level.var_4E92 = 0;
	setdvar("ui_level_player_cheatpoints",level.var_4E92);
	level.var_90A3 = lib_A540::func_239C();
	lib_A540::func_4DD7();
	if(lib_A59A::func_5080())
	{
		lib_A540::func_732B();
		return;
	}

	lib_A540::func_4E98();
	wait(0.05);
}

//Function Number: 2
lib_A540::func_732B()
{
	foreach(var_01 in level.var_4E94)
	{
		if(!isdefined(var_01.var_7399))
		{
			var_01 lib_A540::func_7362();
		}
	}
}

//Function Number: 3
lib_A540::func_7362()
{
	self.var_7399 = 1;
	self.item hide();
	self.item notsolid();
	common_scripts\utility::trigger_off();
	level.var_4E92++;
	setdvar("ui_level_player_cheatpoints",level.var_4E92);
	self notify("end_trigger_thread");
}

//Function Number: 4
lib_A540::func_4DD7()
{
	foreach(var_01 in level.var_4E94)
	{
		var_02 = var_01.var_2E6;
		var_01.var_627A = lib_A540::func_3DF9(var_02);
	}
}

//Function Number: 5
lib_A540::func_4E98()
{
	foreach(var_01 in level.var_4E94)
	{
		if(var_01 lib_A540::func_1CCD())
		{
			var_01 lib_A540::func_7362();
			continue;
		}

		var_01 thread lib_A540::func_9FAC();
		var_01 thread lib_A540::func_6E2A();
	}
}

//Function Number: 6
lib_A540::func_6E2A()
{
	self endon("end_loop_thread");
	while(!lib_A540::func_1CCD())
	{
		wait(0.1);
	}

	lib_A540::func_7362();
}

//Function Number: 7
lib_A540::func_1CCD()
{
	foreach(var_01 in level.var_328)
	{
		if(!var_01 method_823D(self.var_627A))
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 8
lib_A540::func_239B()
{
	var_00 = getentarray("intelligence_item","targetname");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_00[var_01].item = getent(var_00[var_01].target,"targetname");
		var_00[var_01].var_39EF = 0;
	}

	return var_00;
}

//Function Number: 9
lib_A540::func_239C()
{
	var_00 = [];
	for(var_01 = 1;var_01 <= 64;var_01++)
	{
		var_02 = tablelookup("sp/_intel_items.csv",0,var_01,4);
		if(isdefined(var_02) && var_02 != "undefined")
		{
			var_03 = strtok(var_02,",");
			for(var_04 = 0;var_04 < var_03.size;var_04++)
			{
				var_03[var_04] = int(var_03[var_04]);
			}

			var_00[var_01] = (var_03[0],var_03[1],var_03[2]);
			continue;
		}

		var_00[var_01] = undefined;
	}

	return var_00;
}

//Function Number: 10
lib_A540::func_1204()
{
	lib_A540::func_7808();
	function_0004();
	waittillframeend;
	lib_A540::func_7362();
}

//Function Number: 11
lib_A540::func_9FAC()
{
	self endon("end_trigger_thread");
	if(self.classname == "trigger_use")
	{
		self sethintstring(&"SCRIPT_INTELLIGENCE_PICKUP");
		self usetriggerrequirelookat();
	}

	thread lib_A540::func_9BC1();
	self waittill("hold_complete");
	self notify("end_loop_thread");
	lib_A540::func_4E93(level.var_31D);
	lib_A540::func_1204();
}

//Function Number: 12
lib_A540::func_9BC1()
{
	level.var_31D.var_4937 = 0;
	while(level.var_31D.var_4937 < 30)
	{
		level.var_31D.var_4937 = 0;
		self waittill("trigger",var_00);
		setdvar("ui_securing","intel");
		setdvar("ui_securing_progress",0);
		thread lib_A540::func_6FFE();
		lib_A540::func_4938();
	}

	self notify("hold_complete");
	self stoploopsound("intelligence_pickup_loop");
	setdvar("ui_securing_progress",1);
	setdvar("ui_securing","");
	level.var_31D.var_4937 = 0;
}

//Function Number: 13
lib_A540::func_4938()
{
	self endon("stopped_pressing");
	for(;;)
	{
		if(level.var_31D usebuttonpressed() && distance(level.var_31D.var_2E6,self.var_2E6) < 128 && isalive(level.var_31D))
		{
			level.var_31D.var_4937++;
		}
		else
		{
			setdvar("ui_securing","");
			self stoploopsound("intelligence_pickup_loop");
			self notify("stopped_pressing");
		}

		if(level.var_31D.var_4937 >= 30)
		{
			setdvar("ui_securing","");
			self notify("stopped_pressing");
			self stoploopsound("intelligence_pickup_loop");
		}

		wait 0.05;
	}
}

//Function Number: 14
lib_A540::func_6FFE()
{
	self endon("stopped_pressing");
	var_00 = 30;
	var_01 = 8;
	for(var_02 = 0;var_02 < var_00;var_02++)
	{
		setdvar("ui_securing_progress",getdvarfloat("ui_securing_progress") + 1 / var_00);
		wait 0.05;
	}
}

//Function Number: 15
lib_A540::func_4E99(param_00,param_01)
{
	self endon("stopped_pressing");
	var_02 = 30;
	var_03 = 10;
	var_04 = 0;
	for(var_05 = 0;var_05 < var_02;var_05++)
	{
		if(var_04 > var_03)
		{
			var_04 = 0;
		}

		if(var_04 < var_03 / 2)
		{
			param_00 settext(&"SCRIPT_INTELLIGENCE_UPLOADING");
		}
		else
		{
			param_00 settext("");
		}

		param_01.label = int(var_05 / var_02 * 100);
		param_01 settext(&"SCRIPT_INTELLIGENCE_PERCENT");
		var_04++;
		wait 0.05;
	}

	param_00 settext(&"SCRIPT_INTELLIGENCE_UPLOADING");
	param_01.label = "100";
	param_01 settext(&"SCRIPT_INTELLIGENCE_PERCENT");
}

//Function Number: 16
lib_A540::func_7808()
{
	foreach(var_01 in level.var_328)
	{
		if(var_01 method_823D(self.var_627A))
		{
			continue;
		}

		var_01 method_823E(self.var_627A);
		var_01 lib_A565::func_8D45("intel",1);
	}

	function_0196("found intel item " + self.var_627A);
	lib_A526::func_9B6B();
}

//Function Number: 17
lib_A540::func_41D5()
{
	var_00 = self getplayerprofiledata("cheatPoints");
	self setplayerprofiledata("cheatPoints",var_00 + 1);
	lib_A540::func_1CCB(self);
}

//Function Number: 18
lib_A540::func_1CCB(param_00)
{
	var_01 = param_00 getplayerprofiledata("cheatPoints");
	if(var_01 >= 45)
	{
		lib_A59A::func_41DA("INTEL_ALL");
	}

	if(var_01 >= 23)
	{
		lib_A59A::func_41DA("INTEL_HALF");
	}
}

//Function Number: 19
lib_A540::func_4E93(param_00)
{
	self.item hide();
	self.item notsolid();
	level thread common_scripts\utility::play_sound_in_space("intelligence_pickup",self.item.var_2E6);
	var_01 = 3000;
	var_02 = 700;
	var_03 = var_01 + var_02 / 1000;
	foreach(var_05 in level.var_328)
	{
		if(param_00 != var_05 && var_05 method_823D(self.var_627A))
		{
			continue;
		}

		var_06 = var_05 lib_A53C::func_23ED("objective",1.5);
		var_06.glowcolor = (0.7,0.7,0.3);
		var_06.glowalpha = 1;
		var_06 lib_A540::func_8145();
		var_06.y = -50;
		var_07 = getdvarint("loc_language",0);
		if(var_07 == 16)
		{
			var_06 lib_A59A::delaythread(var_01 / 1000,::lib_A53C::func_35E6,0,var_02 / 1000);
		}
		else
		{
			var_06 setpulsefx(60,var_01,var_02);
		}

		var_08 = 0;
		if(param_00 == var_05 && var_05 method_823D(self.var_627A))
		{
			var_06.label = &"SCRIPT_RORKEFILE_PREV_FOUND";
		}
		else
		{
			var_06.label = &"SCRIPT_INTELLIGENCE_OF_FOURTYFIVE";
			var_05 lib_A540::func_41D5();
			var_08 = var_05 getplayerprofiledata("cheatPoints");
			var_06 setvalue(var_08);
		}

		if(var_08 == 18)
		{
			var_05 lib_A59A::func_6B2A("EXT_1");
		}

		var_06 common_scripts\utility::delaycall(var_03,::destroy);
	}
}

//Function Number: 20
lib_A540::func_8145()
{
	self.color = (1,1,1);
	self.alpha = 1;
	self.x = 0;
	self.alignx = "center";
	self.aligny = "middle";
	self.horzalign = "center";
	self.vertalign = "middle";
	self.foreground = 1;
}

//Function Number: 21
lib_A540::func_0D5A()
{
	var_00 = [];
	for(var_01 = 1;var_01 < 65;var_01++)
	{
		var_02 = tablelookup("sp/_intel_items.csv",0,var_01,4);
		var_03 = strtok(var_02,",");
		for(var_01 = 0;var_01 < var_03.size;var_01++)
		{
			var_03[var_01] = int(var_03[var_01]);
		}

		var_00[var_01] = (var_03[0],var_03[1],var_03[2]);
	}

	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		if(!isdefined(var_00[var_01]))
		{
			continue;
		}

		if(var_00[var_01] == "undefined")
		{
			continue;
		}

		for(var_04 = 0;var_04 < var_00.size;var_04++)
		{
			if(!isdefined(var_00[var_04]))
			{
			}
			else if(var_00[var_04] == "undefined")
			{
			}
			else if(var_01 == var_04)
			{
			}
			else if(var_00[var_01] == var_00[var_04])
			{
			}
		}
	}
}

//Function Number: 22
lib_A540::func_3DF9(param_00)
{
	foreach(var_03, var_02 in level.var_90A3)
	{
		if(!isdefined(var_02))
		{
			continue;
		}

		if(distancesquared(param_00,var_02) < squared(75))
		{
			return var_03;
		}
	}
}