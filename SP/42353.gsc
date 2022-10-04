/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42353.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 57
 * Decompile Time: 15 ms
 * Timestamp: 4/20/2022 8:23:22 PM
*******************************************************************/

//Function Number: 1
lib_A571::func_5F1E(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = level.var_8C30 + "_playerstart";
	}

	var_01 = common_scripts\utility::getstruct(param_00,"targetname");
	if(isdefined(var_01))
	{
		lib_A59A::func_9237(var_01);
	}
}

//Function Number: 2
lib_A571::func_88F6(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	var_04 = getentarray(param_01,"script_noteworthy");
	var_05 = [];
	var_06 = 0;
	var_07 = [];
	foreach(var_09 in var_04)
	{
		if(isspawner(var_09))
		{
			var_05[var_05.size] = var_09;
		}
	}

	var_0B = common_scripts\utility::getstruct(param_00,"targetname");
	var_0C = 0;
	foreach(var_0E in var_05)
	{
		var_0F = var_0E lib_A59A::func_88BD(1);
		if(param_02)
		{
			var_0F thread lib_A59A::func_73FF();
		}

		var_0F method_81C6(var_0B.var_2E6,var_0B.var_41);
		var_0F method_81A6(var_0F.var_2E6);
		var_07 = common_scripts\utility::array_add(var_07,var_0F);
		var_0C++;
		if(isdefined(param_03) && var_0C >= param_03)
		{
			return var_07;
		}
	}

	return var_07;
}

//Function Number: 3
lib_A571::func_825E(param_00,param_01)
{
	self method_8130(0);
	self disableweapons();
	self disableoffhandweapons();
	self method_8118(1);
	self method_8119(0);
	self method_811A(0);
	self allowsprint(0);
	function_00D3("ammoCounterHide",1);
	if(isdefined(param_00) && param_00)
	{
		var_02 = 0;
		if(isdefined(level.var_31D.exo))
		{
			var_02 = lib_A561::func_6B03("boost_dash");
			if(var_02)
			{
				lib_A561::func_6B0B("boost_dash");
			}
		}

		var_03 = 0;
		while(self getstance() != "stand")
		{
			self setstance("stand");
			wait 0.05;
			var_03 = var_03 + 0.05;
		}

		while(self method_812C() || self isswitchingweapon() || self getcurrentweapon(0) != "none")
		{
			wait 0.05;
			var_03 = var_03 + 0.05;
		}

		if(isdefined(param_01) && param_01 > var_03)
		{
			wait(param_01 - var_03);
		}

		if(var_02)
		{
			lib_A561::func_6AF8("boost_dash");
		}
	}
}

//Function Number: 4
lib_A571::func_825D()
{
	function_00D3("ammoCounterHide",0);
	self allowsprint(1);
	self method_811A(1);
	self method_8119(1);
	self method_8118(1);
	self enableoffhandweapons();
	self enableweapons();
	self method_8130(1);
}

//Function Number: 5
lib_A571::func_5EB9()
{
	foreach(var_01 in level.var_328)
	{
		if(!isdefined(var_01.var_87DC))
		{
			var_01.var_87DC = var_01 lib_A53C::func_23ED("default",1.75);
			var_01.var_87DC.horzalign = "center";
			var_01.var_87DC.vertalign = "top";
			var_01.var_87DC.alignx = "center";
			var_01.var_87DC.aligny = "top";
			var_01.var_87DC.x = 0;
			var_01.var_87DC.y = 20;
			var_01.var_87DC settext(&"VARIABLE_SCOPE_SNIPER_ZOOM");
			var_01.var_87DC.alpha = 0;
			var_01.var_87DC.fontscale = 0.5;
			var_01.var_87DC.foreground = 1;
		}

		var_01.var_3A01 = 1;
	}

	var_03 = 0;
	level.var_328[0].var_87CC = "cg_playerFovScale0";
	if(level.var_328.size == 2)
	{
		level.var_328[1].var_87CC = "cg_playerFovScale1";
	}

	foreach(var_01 in level.var_328)
	{
		var_01 thread lib_A571::func_5E7B();
		var_01 thread lib_A571::func_2B2B();
	}

	if(!isdefined(level.var_9C5C))
	{
		level.var_9C5C = [];
	}

	var_06 = undefined;
	var_07 = undefined;
	for(;;)
	{
		var_08 = 0;
		var_07 = var_06;
		var_06 = undefined;
		foreach(var_0A in level.var_9C5C)
		{
			foreach(var_01 in level.var_328)
			{
				if(var_01 getcurrentweapon() == var_0A && isalive(var_01))
				{
					var_08 = 1;
					var_06 = var_01;
					break;
				}
			}

			if(var_08)
			{
				break;
			}
		}

		if(var_08 && !var_06 isreloading() && !var_06 isswitchingweapon())
		{
			if(var_06 lib_A59A::func_50A6() && var_06 adsbuttonpressed())
			{
				var_06 lib_A571::func_9931(var_03);
				var_03 = 1;
				if(isdefined(level.var_9C5B))
				{
					var_0E = undefined;
					var_0F = undefined;
					var_10 = anglestoforward(var_06 getplayerangles());
					var_11 = var_06.var_2E6;
					foreach(var_13 in level.var_9C5B)
					{
						var_14 = anglestoforward(vectortoangles(var_13 - var_11));
						var_15 = vectordot(var_10,var_14);
						if(!isdefined(var_0E) || var_15 > var_0F)
						{
							var_0E = var_13;
							var_0F = var_15;
						}
					}

					if(isdefined(var_0E))
					{
						function_00D3("sm_sunShadowCenter",var_0E);
					}
				}
			}
			else if(var_03)
			{
				var_03 = 0;
				if(isdefined(var_06))
				{
					var_06 lib_A571::func_992B();
				}

				function_00D3("sm_sunShadowCenter","0 0 0");
			}
		}
		else if(var_03)
		{
			var_03 = 0;
			if(isdefined(var_07))
			{
				var_07 lib_A571::func_992B();
			}

			function_00D3("sm_sunShadowCenter","0 0 0");
		}

		wait(0.05);
	}
}

//Function Number: 6
lib_A571::func_9931(param_00)
{
	self disableoffhandweapons();
	function_00D3(self.var_87CC,self.var_3A01);
	self.var_87DC.alpha = 1;
	if(!param_00)
	{
		level notify("variable_sniper_hud_enter");
	}
}

//Function Number: 7
lib_A571::func_992B()
{
	level notify("variable_sniper_hud_exit");
	self enableoffhandweapons();
	function_00D3(self.var_87CC,1);
	self.var_87DC.alpha = 0;
}

//Function Number: 8
lib_A571::func_5E7B()
{
	function_000E("mag_cycle","+melee_zoom");
	function_000E("mag_cycle","+sprint_zoom");
	for(;;)
	{
		self waittill("mag_cycle");
		if(self.var_87DC.alpha)
		{
			if(self.var_3A01 == 0.5)
			{
				self.var_3A01 = 1;
				continue;
			}

			self.var_3A01 = 0.5;
		}
	}
}

//Function Number: 9
lib_A571::func_2B2B()
{
	self waittill("death");
	lib_A571::func_992B();
}

//Function Number: 10
lib_A571::func_2A37(param_00,param_01,param_02,param_03,param_04)
{
	level endon("stop_reminders");
	level endon("missionfailed");
	var_05 = undefined;
	if(!isdefined(param_03))
	{
		param_03 = 10;
	}

	if(!isdefined(param_04))
	{
		param_04 = 20;
	}

	while(!common_scripts\utility::flag(param_01))
	{
		var_06 = randomfloatrange(param_03,param_04);
		var_07 = common_scripts\utility::random(param_02);
		if(isdefined(var_05) && var_07 == var_05)
		{
			continue;
		}
		else
		{
			var_05 = var_07;
			wait(var_06);
			if(!common_scripts\utility::flag(param_01))
			{
				if(isstring(param_00) && param_00 == "radio")
				{
					lib_A571::func_219E();
					lib_A59A::func_70BA(var_07);
					lib_A571::func_219F();
					continue;
				}

				lib_A571::func_219E();
				param_00 lib_A59A::func_2A31(var_07);
				lib_A571::func_219F();
			}
		}
	}
}

//Function Number: 11
lib_A571::func_219E()
{
	if(!common_scripts\utility::flag_exist("flag_conversation_in_progress"))
	{
		common_scripts\utility::flag_init("flag_conversation_in_progress");
	}

	common_scripts\utility::flag_waitopen("flag_conversation_in_progress");
	common_scripts\utility::flag_set("flag_conversation_in_progress");
}

//Function Number: 12
lib_A571::func_219F()
{
	common_scripts\utility::flag_clear("flag_conversation_in_progress");
}

//Function Number: 13
lib_A571::func_0CE2(param_00,param_01)
{
	var_02 = [];
	foreach(var_04 in param_00)
	{
		if(!isdefined(common_scripts\utility::array_find(var_02,var_04)))
		{
			var_02[var_02.size] = var_04;
		}
	}

	foreach(var_04 in param_01)
	{
		if(!isdefined(common_scripts\utility::array_find(var_02,var_04)))
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 14
lib_A571::func_54DF(param_00)
{
	param_00 endon("remove_laser_targeting_device");
	param_00.var_5607 = undefined;
	param_00.var_54F2 = 0;
	param_00 setweaponhudiconoverride("actionslot4","dpad_laser_designator");
	param_00 thread lib_A571::func_1E8B();
	param_00 notifyonplayercommand("use_laser","+actionslot 4");
	param_00 notifyonplayercommand("fired_laser","+attack");
	param_00 notifyonplayercommand("fired_laser","+attack_akimbo_accessible");
	param_00.var_54EB = 1;
	param_00.var_54EC = 20;
	param_00 childthread lib_A571::func_5E75();
	for(;;)
	{
		param_00 waittill("use_laser");
		if(param_00.var_54F2 || !param_00.var_54EB || param_00 lib_A571::func_8494())
		{
			param_00 notify("cancel_laser");
			param_00 method_80B3();
			param_00.var_54F2 = 0;
			param_00 allowads(1);
			wait(0.2);
			param_00 method_8131(1);
			continue;
		}

		param_00 method_80B2();
		param_00 method_8131(0);
		param_00.var_54F2 = 1;
		param_00 allowads(0);
		param_00 thread lib_A571::func_54C4();
	}
}

//Function Number: 15
lib_A571::func_8494()
{
	var_00 = self getcurrentweapon();
	if(var_00 == "rpg")
	{
		return 1;
	}

	if(common_scripts\utility::string_starts_with(var_00,"gl"))
	{
		return 1;
	}

	if(isdefined(level.var_54C6) && isarray(level.var_54C6))
	{
		foreach(var_02 in level.var_54C6)
		{
			if(var_00 == var_02)
			{
				return 1;
			}
		}
	}

	if(self isreloading())
	{
		return 1;
	}

	if(self method_812C())
	{
		return 1;
	}

	return 0;
}

//Function Number: 16
lib_A571::func_1E8B()
{
	self waittill("remove_laser_targeting_device");
	self setweaponhudiconoverride("actionslot4","none");
	self notify("cancel_laser");
	self method_80B3();
	self.var_54F2 = undefined;
	self method_8131(1);
	self allowads(1);
}

//Function Number: 17
lib_A571::func_5E75()
{
	for(;;)
	{
		if(lib_A571::func_8494() && isdefined(self.var_54F2) && self.var_54F2)
		{
			self notify("use_laser");
			wait(2);
		}

		wait(0.05);
	}
}

//Function Number: 18
lib_A571::func_54C4()
{
	self endon("cancel_laser");
	for(;;)
	{
		self waittill("fired_laser");
		var_00 = lib_A571::func_3DAE();
		var_01 = var_00["position"];
		var_02 = var_00["entity"];
		level notify("laser_coordinates_received");
		var_03 = undefined;
		if(isdefined(level.var_54E0) && isdefined(var_02) && common_scripts\utility::array_contains(level.var_54E0,var_02))
		{
			var_03 = var_02;
			level.var_54E0 = common_scripts\utility::array_remove(level.var_54E0,var_02);
		}
		else
		{
			var_03 = lib_A571::func_4107(var_01);
		}

		if(isdefined(var_03))
		{
			thread lib_A571::func_54C0(var_03);
			level notify("laser_target_painted");
			wait(0.5);
			self notify("use_laser");
		}
	}
}

//Function Number: 19
lib_A571::func_4107(param_00)
{
	if(!isdefined(level.var_54E1) || level.var_54E1.size == 0)
	{
		return undefined;
	}

	foreach(var_02 in level.var_54E1)
	{
		var_03 = distance2d(param_00,var_02.var_2E6);
		var_04 = param_00[2] - var_02.var_2E6[2];
		if(!isdefined(var_02.radius))
		{
			continue;
		}

		if(!isdefined(var_02.height))
		{
			continue;
		}

		if(var_03 <= var_02.radius && var_04 <= var_02.height && var_04 >= 0)
		{
			level.var_54E1 = common_scripts\utility::array_remove(level.var_54E1,var_02);
			return getent(var_02.target,"script_noteworthy");
		}
	}

	return undefined;
}

//Function Number: 20
lib_A571::func_3DAE()
{
	var_00 = self geteye();
	var_01 = self getplayerangles();
	var_02 = anglestoforward(var_01);
	var_03 = var_00 + var_02 * 7000;
	var_04 = bullettrace(var_00,var_03,1,self);
	var_05 = var_04["entity"];
	if(isdefined(var_05))
	{
		var_04["position"] = var_05.var_2E6;
	}

	return var_04;
}

//Function Number: 21
lib_A571::func_54C0(param_00)
{
	level.var_31D endon("remove_laser_targeting_device");
	level.var_31D.var_54EB = 0;
	self setweaponhudiconoverride("actionslot4","dpad_killstreak_hellfire_missile_inactive");
	lib_A59A::func_38CA("allies");
	var_01 = level.var_31D;
	wait(2.5);
	if(!isdefined(param_00.script_index))
	{
		param_00.script_index = 99;
	}

	wait(1);
	if(isdefined(param_00.script_group))
	{
		var_02 = lib_A571::func_3D85("geo_before",param_00.script_group);
		if(var_02.size > 0)
		{
			common_scripts\utility::array_call(var_02,::hide);
		}

		var_03 = lib_A571::func_3D85("geo_after",param_00.script_group);
		if(var_03.size > 0)
		{
			common_scripts\utility::array_call(var_03,::show);
		}
	}

	wait(level.var_31D.var_54EC);
	level.var_31D.var_54EB = 1;
	self setweaponhudiconoverride("actionslot4","dpad_laser_designator");
}

//Function Number: 22
lib_A571::func_3D85(param_00,param_01)
{
	var_02 = getentarray(param_00,"targetname");
	var_03 = [];
	foreach(var_05 in var_02)
	{
		if(isdefined(var_05.script_group) && var_05.script_group == param_01)
		{
			var_03[var_03.size] = var_05;
		}
	}

	return var_03;
}

//Function Number: 23
lib_A571::func_5769(param_00,param_01,param_02,param_03,param_04)
{
	return param_03 + param_00 - param_01 * param_04 - param_03 / param_02 - param_01;
}

//Function Number: 24
lib_A571::func_576A(param_00,param_01,param_02,param_03,param_04)
{
	return clamp(lib_A571::func_5769(param_00,param_01,param_02,param_03,param_04),min(param_03,param_04),max(param_03,param_04));
}

//Function Number: 25
lib_A571::func_2A55()
{
	var_00 = gettime() * 0.001;
	if(!isdefined(self.var_2A5A))
	{
		self.var_2A5A = var_00;
		self.var_2A59 = self.var_2E6;
		self.var_2A5B = (0,0,0);
		self.var_2A58 = (0,0,0);
		self.var_2A57 = (0,0,0);
		self.var_2A56 = (0,0,0);
		self.var_2A5D = (0,0,0);
		self.var_2A5C = 0;
		return;
	}

	if(self.var_2A5A != var_00)
	{
		var_01 = var_00 - self.var_2A5A;
		self.var_2A5A = var_00;
		self.var_2A57 = self.var_2A56 - self.var_2A58 / var_01;
		self.var_2A58 = self.var_2A56;
		self.var_2A56 = self.var_2A5D - self.var_2A5B / var_01;
		self.var_2A5B = self.var_2A5D;
		self.var_2A5D = self.var_2E6 - self.var_2A59 / var_01;
		self.var_2A59 = self.var_2E6;
		self.var_2A5C = length(self.var_2A5D);
	}
}

//Function Number: 26
lib_A571::func_3D3B()
{
	lib_A571::func_2A55();
	return self.var_2A5C;
}

//Function Number: 27
lib_A571::func_3D3C()
{
	lib_A571::func_2A55();
	return self.var_2A5D;
}

//Function Number: 28
lib_A571::func_3D39()
{
	lib_A571::func_2A55();
	return self.var_2A56;
}

//Function Number: 29
lib_A571::func_3D3A()
{
	lib_A571::func_2A55();
	return self.var_2A57;
}

//Function Number: 30
lib_A571::func_84E3(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_00))
	{
		function_00D3("g_friendlyNameDist",param_00);
	}
	else
	{
		function_00D3("g_friendlyNameDist",15000);
	}

	if(isdefined(param_01))
	{
		function_00D3("compass",param_01);
	}
	else
	{
		function_00D3("compass","1");
	}

	if(isdefined(param_02))
	{
		function_00D3("ammoCounterHide",param_02);
	}
	else
	{
		function_00D3("ammoCounterHide","0");
	}

	if(isdefined(param_03))
	{
		function_00D3("actionSlotsHide",param_03);
	}
	else
	{
		function_00D3("actionSlotsHide","0");
	}

	if(isdefined(param_04))
	{
		function_00D3("hud_showStance",param_04);
		return;
	}

	function_00D3("hud_showStance","1");
}

//Function Number: 31
lib_A571::func_4860(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_00))
	{
		function_00D3("g_friendlyNameDist",param_00);
	}
	else
	{
		function_00D3("g_friendlyNameDist",0);
	}

	if(isdefined(param_01))
	{
		function_00D3("compass",param_01);
	}
	else
	{
		function_00D3("compass","0");
	}

	if(isdefined(param_02))
	{
		function_00D3("ammoCounterHide",param_02);
	}
	else
	{
		function_00D3("ammoCounterHide","1");
	}

	if(isdefined(param_03))
	{
		function_00D3("actionSlotsHide",param_03);
	}
	else
	{
		function_00D3("actionSlotsHide","1");
	}

	if(isdefined(param_04))
	{
		function_00D3("hud_showStance",param_04);
		return;
	}

	function_00D3("hud_showStance","0");
}

//Function Number: 32
lib_A571::func_2AA2(param_00)
{
	if(isdefined(param_00) && param_00 == 1)
	{
		level.var_31D thread lib_A561::func_6AFB();
		level.var_3450 = 1;
	}

	lib_A571::func_4860();
}

//Function Number: 33
lib_A571::func_30C0(param_00)
{
	if(!isdefined(param_00) && isdefined(level.var_3450))
	{
		param_00 = level.var_3450;
		level.var_3450 = undefined;
	}

	if(isdefined(param_00) && param_00 == 1)
	{
		level.var_31D thread lib_A561::func_6AF5();
	}

	lib_A571::func_84E3();
}

//Function Number: 34
lib_A571::func_45F8(param_00,param_01,param_02)
{
	level.var_31D endon("death");
	level endon("missionfailed");
	if(isdefined(param_02) && isstring(param_02))
	{
		level endon(param_02);
	}

	if(!isdefined(param_00) || !isstring(param_00))
	{
		return;
	}

	if(!isdefined(param_01) || !isstring(param_01) || !common_scripts\utility::flag_exist(param_00))
	{
		return;
	}

	var_03 = getent(param_01,"targetname");
	if(!isdefined(var_03))
	{
		var_03 = getent(param_01,"script_noteworthy");
	}

	if(!isdefined(var_03))
	{
		return;
	}

	var_03 method_8070(0);
	for(;;)
	{
		common_scripts\utility::flag_wait(param_00);
		var_03 method_8070(1);
		common_scripts\utility::flag_waitopen(param_00);
		var_03 method_8070(0);
		wait(0.05);
	}
}

//Function Number: 35
lib_A571::func_6E53(param_00,param_01)
{
	level.var_31D endon("death");
	level endon("missionfailed");
	if(!isdefined(param_00) || !isstring(param_00))
	{
		return;
	}

	if(!isdefined(param_01) || !isstring(param_01) || !common_scripts\utility::flag_exist(param_00))
	{
		return;
	}

	var_02 = getent(param_01,"targetname");
	if(!isdefined(var_02))
	{
		var_02 = getent(param_01,"script_noteworthy");
	}

	if(!isdefined(var_02))
	{
		return;
	}

	var_02 method_8070(0);
	common_scripts\utility::flag_wait(param_00);
	var_02 method_8070(1);
}

//Function Number: 36
lib_A571::func_6E52(param_00,param_01)
{
	level.var_31D endon("death");
	level endon("missionfailed");
	if(!isdefined(param_00) || !isstring(param_00))
	{
		return;
	}

	if(!isdefined(param_01) || !isstring(param_01) || !common_scripts\utility::flag_exist(param_00))
	{
		return;
	}

	var_02 = getent(param_01,"targetname");
	if(!isdefined(var_02))
	{
		var_02 = getent(param_01,"script_noteworthy");
	}

	if(!isdefined(var_02))
	{
		return;
	}

	common_scripts\utility::flag_wait(param_00);
	var_02 method_8070(0);
}

//Function Number: 37
lib_A571::func_591C()
{
	if(!isdefined(level.var_3077))
	{
		level.var_3077 = [];
	}

	level.var_3077 = common_scripts\utility::array_add(level.var_3077,self);
	self waittill("death");
	level.var_3077 = common_scripts\utility::array_remove(level.var_3077,self);
}

//Function Number: 38
lib_A571::func_6952(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	var_04.var_3B56 = common_scripts\utility::getfx(param_00);
	var_04.entity = param_01;
	var_04.tag = param_02;
	if(isdefined(param_03) && param_03)
	{
		var_04.var_471 = common_scripts\utility::spawn_tag_origin();
		var_04.var_471 linkto(param_01,var_04.tag,(0,0,0),(0,0,0));
		playfxontag(var_04.var_3B56,var_04.var_471,"tag_origin");
		lib_A571::func_5311(var_04);
	}
	else
	{
		playfxontag(var_04.var_3B56,var_04.entity,var_04.tag);
	}

	return var_04;
}

//Function Number: 39
lib_A571::func_5311(param_00)
{
	thread lib_A571::func_5312(param_00);
}

//Function Number: 40
lib_A571::func_5312(param_00)
{
	param_00.entity waittill("death");
	lib_A571::func_5310(param_00);
}

//Function Number: 41
lib_A571::func_5310(param_00)
{
	if(isdefined(param_00.var_471))
	{
		killfxontag(param_00.var_3B56,param_00.var_471,"tag_origin");
		param_00.var_471 common_scripts\utility::delaycall(0.05,::delete);
		param_00.var_471 = undefined;
		param_00.entity = undefined;
		return;
	}

	if(isdefined(param_00.entity))
	{
		killfxontag(param_00.var_3B56,param_00.entity,param_00.tag);
		param_00.entity = undefined;
	}
}

//Function Number: 42
lib_A571::func_48BF(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 200;
	}

	return lib_A571::func_48BB(param_00,self.var_2E6,undefined,param_01,undefined,self);
}

//Function Number: 43
lib_A571::func_48BE(param_00,param_01,param_02,param_03,param_04,param_05)
{
	return lib_A571::func_48B5(param_00,param_01,param_02,param_03,0,param_04,param_05);
}

//Function Number: 44
lib_A571::func_48BB(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = common_scripts\utility::spawn_tag_origin();
	if(!isdefined(param_01))
	{
		if(isdefined(param_05))
		{
			param_01 = param_05.var_2E6;
		}
		else
		{
			param_01 = self.var_2E6;
		}
	}

	var_06.var_2E6 = param_01;
	return var_06 lib_A571::func_48B5(param_00,"tag_origin",param_02,param_03,1,param_04,param_05);
}

//Function Number: 45
lib_A571::func_48B5(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = newclienthudelem(level.var_31D);
	var_07.alignx = "center";
	var_07.aligny = "middle";
	var_07.var_18C = 3;
	var_07.font = "buttonprompt";
	var_07.var_32F = 1;
	if(isdefined(self))
	{
		if(isdefined(param_01))
		{
			var_07 method_80CD(self,param_01);
		}
		else
		{
			var_07 method_80CD(self);
		}
	}

	var_08 = lib_A571::func_48BC(param_00);
	var_07 settext(var_08);
	var_07.hidewheninmenu = 1;
	var_07.fontscale = -1;
	var_07.alpha = 1;
	if(!isdefined(param_05) || !param_05)
	{
		var_07 thread lib_A571::func_782B(self,param_01,level.var_31D,param_02,param_03,param_06);
	}

	var_07.object = self;
	if(isdefined(param_04) && param_04)
	{
		var_07.var_2857 = 1;
	}

	return var_07;
}

//Function Number: 46
lib_A571::func_782B(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("death");
	param_00 endon("death");
	if(!isdefined(param_03))
	{
		param_03 = getdvarint("player_useradius");
	}

	if(!isdefined(param_04))
	{
		param_04 = 0;
	}

	var_06 = 0;
	self.var_18C = 2;
	self.font = "buttonprompt";
	for(;;)
	{
		if(isdefined(param_01))
		{
			var_06 = distance(param_00 gettagorigin(param_01),param_02 geteye());
		}
		else
		{
			var_06 = distance(param_00,param_02 geteye());
		}

		if(param_04 != 0 && var_06 > param_04)
		{
			self.alpha = 0;
		}
		else if(param_03 != 0 && var_06 > param_03)
		{
			if(param_04 - param_03 > 0)
			{
				self.alpha = 1 - var_06 - param_03 / param_04 - param_03 * 0.3;
			}
			else
			{
				self.alpha = 0.3;
			}
		}
		else if(isdefined(param_05) && isdefined(param_05.classname) && issubstr(param_05.classname,"trigger"))
		{
			var_07 = param_02 method_8521();
			if(isdefined(var_07) && var_07 == param_05)
			{
				self.alpha = 1;
			}
			else
			{
				self.alpha = 0.3;
			}
		}
		else
		{
			self.alpha = 1;
		}

		wait 0.05;
	}
}

//Function Number: 47
lib_A571::func_48BC(param_00)
{
	switch(param_00)
	{
		case "activate":
		case "usereload":
		case "use":
		case "x":
		case "reload":
			break;

		case "gostand":
		case "jump":
		case "a":
			break;

		case "weapnext":
		case "y":
			break;

		case "stance":
		case "b":
		case "crouch":
			break;

		case "rs":
		case "melee":
			break;

		case "breath":
		case "ls":
		case "sprint":
			break;

		case "r1":
		case "rt":
		case "attack":
			break;

		case "frag":
		case "r2":
		case "rb":
		case "grenade":
			break;

		case "ads":
		case "l1":
		case "lt":
			break;

		case "flash":
		case "smoke":
		case "l2":
		case "lb":
		case "flashbang":
			break;

		case "pause":
		case "start":
			break;

		case "up":
			break;

		case "down":
			break;

		case "left":
			break;

		case "right":
			break;

		default:
			break;
	}
}

//Function Number: 48
lib_A571::func_48B3()
{
	if(isdefined(self.var_2857) && self.var_2857)
	{
		self.object delete();
	}

	if(isdefined(self))
	{
		self destroy();
	}
}

//Function Number: 49
lib_A571::func_48B7(param_00,param_01)
{
	while(isdefined(self))
	{
		var_02 = self.alpha;
		self fadeovertime(param_00 / 3);
		self.alpha = param_01;
		wait(param_00);
		if(!isdefined(self))
		{
			return;
		}

		self fadeovertime(param_00 / 3);
		self.alpha = var_02;
		wait(param_00);
	}
}

//Function Number: 50
lib_A571::func_1950(param_00,param_01,param_02,param_03)
{
	self endon(param_02);
	level.var_31D endon(param_02);
	self endon("death");
	thread lib_A59A::func_48AD(param_00);
	var_04 = param_01 + "_button_mash_dynamic_hint";
	thread lib_A571::func_195E(param_02,var_04,param_01,param_03);
	level.var_31D notifyonplayercommand(var_04,param_01);
	if(isdefined(param_03))
	{
		level.var_31D notifyonplayercommand(var_04,param_03);
	}

	for(;;)
	{
		self waittill(var_04);
		level.var_4900.alpha = 0.2;
		level.var_4900 fadeovertime(0.3);
		level.var_4900.alpha = 1;
		wait 0.05;
	}
}

//Function Number: 51
lib_A571::func_195E(param_00,param_01,param_02,param_03)
{
	self endon("death");
	common_scripts\utility::waittill_any_ents(self,param_00,level.var_31D,param_00);
	thread lib_A59A::func_48C8();
	level.var_31D method_849C(param_01,param_02);
	if(isdefined(param_03))
	{
		level.var_31D method_849C(param_01,param_03);
	}
}

//Function Number: 52
lib_A571::func_48B6(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(param_03))
	{
		param_03 = (0,0,0);
	}

	self endon("death");
	var_07 = common_scripts\utility::spawn_tag_origin();
	var_07.var_2E6 = self gettagorigin(param_00);
	var_07.var_2E6 = var_07.var_2E6 + param_03;
	var_07 linkto(self,param_00);
	param_01 = var_07 lib_A571::func_48B5(param_01,"TAG_ORIGIN",param_04,param_05,1,1);
	if(isdefined(param_06))
	{
		param_01.var_18C = param_06;
	}

	param_01 thread lib_A571::func_48B7(0.15,0.1);
	common_scripts\utility::waittill_any_ents(self,param_02,level.var_31D,param_02);
	param_01 lib_A571::func_48B3();
}

//Function Number: 53
lib_A571::func_6A19(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	if(!isdefined(param_06))
	{
		param_06 = 1;
	}

	var_08 = undefined;
	if(isdefined(param_02) || isdefined(param_03) || isdefined(param_04) || isdefined(param_05))
	{
		var_08 = [];
		var_08["top"] = param_02;
		var_08["left"] = param_03;
		var_08["bottom"] = param_04;
		var_08["right"] = param_05;
	}

	var_09 = [];
	var_09["add"] = 0;
	var_09["blend"] = 1;
	var_09["blend_add"] = 2;
	var_09["screen_add"] = 3;
	var_09["multiply"] = 4;
	var_09["replace"] = 5;
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	var_0A = var_09[param_01];
	var_0B = getdvarint("cg_cinematicfullscreen");
	function_00D3("cg_cinematicfullscreen",0);
	var_0C = [];
	if(isdefined(var_08))
	{
		var_0C["top"] = getomnvar("ui_videolog_pos_top");
		var_0C["left"] = getomnvar("ui_videolog_pos_left");
		var_0C["bottom"] = getomnvar("ui_videolog_pos_bottom");
		var_0C["right"] = getomnvar("ui_videolog_pos_right");
		setomnvar("ui_videolog_pos_top",var_08["top"]);
		setomnvar("ui_videolog_pos_left",var_08["left"]);
		setomnvar("ui_videolog_pos_bottom",var_08["bottom"]);
		setomnvar("ui_videolog_pos_right",var_08["right"]);
	}

	setomnvar("ui_videolog",1);
	var_0D = getomnvar("ui_videolog_blendfunc");
	setomnvar("ui_videolog_blendfunc",var_0A);
	setomnvar("ui_videolog_blur_bkgrnd",param_06);
	if(!isdefined(param_07))
	{
		param_07 = level._snd.var_2790;
	}

	function_0057(param_00,0,param_07,1);
	while(!function_005B())
	{
		wait 0.05;
	}

	while(function_005B())
	{
		wait 0.05;
	}

	setomnvar("ui_videolog",0);
	setomnvar("ui_videolog_blendfunc",var_0D);
	function_00D3("cg_cinematicfullscreen",var_0B);
	if(isdefined(var_08))
	{
		setomnvar("ui_videolog_pos_top",var_0C["top"]);
		setomnvar("ui_videolog_pos_left",var_0C["left"]);
		setomnvar("ui_videolog_pos_bottom",var_0C["bottom"]);
		setomnvar("ui_videolog_pos_right",var_0C["right"]);
	}
}

//Function Number: 54
lib_A571::func_8ECD()
{
	if(function_005B())
	{
		function_005C();
	}
}

//Function Number: 55
lib_A571::func_68AA(param_00,param_01,param_02)
{
	common_scripts\utility::flag_init("chyron_video_done");
	var_03 = newclienthudelem(level.var_31D);
	var_03 setshader("black",1280,720);
	var_03.horzalign = "fullscreen";
	var_03.vertalign = "fullscreen";
	var_03.alpha = 1;
	var_03.foreground = 0;
	function_0057(param_00);
	var_04 = getdvarint("cg_cinematicCanPause",0);
	function_00D3("cg_cinematicCanPause",1);
	while(!function_005B())
	{
		wait 0.05;
	}

	while(function_005B())
	{
		wait 0.05;
	}

	common_scripts\utility::flag_set("chyron_video_done");
	if(isdefined(param_01))
	{
		wait(param_01);
	}

	if(isdefined(param_02))
	{
		var_03 fadeovertime(param_02);
		var_03.alpha = 0;
		wait(param_02);
	}

	function_00D3("cg_cinematicCanPause",var_04);
	var_03 destroy();
}

//Function Number: 56
lib_A571::func_6E17(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = level.var_31D;
	}

	return vectordot(vectornormalize(param_00 - param_02 geteye()),anglestoforward(param_02 getplayerangles())) > cos(param_01);
}

//Function Number: 57
lib_A571::func_3312(param_00,param_01,param_02,param_03)
{
	return lib_A571::func_6E17(param_00.var_2E6,atan(tan(0.5 * param_02) * param_03 / 320),param_01);
}