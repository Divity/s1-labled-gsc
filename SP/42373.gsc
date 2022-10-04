/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42373.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 64
 * Decompile Time: 15 ms
 * Timestamp: 4/20/2022 8:23:24 PM
*******************************************************************/

//Function Number: 1
lib_A585::func_0904(param_00,param_01)
{
	self endon("death");
	param_01 = param_01 + "spotted";
	self notify(param_01);
	self endon(param_01);
	switch(self.inliveplayerkillstreak)
	{
		case "allies":
			break;

		case "team3":
		case "axis":
			break;
	}
}

//Function Number: 2
lib_A585::func_0903(param_00,param_01)
{
	self endon("death");
	param_01 = param_01 + "hidden";
	self notify(param_01);
	self endon(param_01);
	switch(self.inliveplayerkillstreak)
	{
		case "allies":
			break;

		case "team3":
		case "axis":
			break;
	}
}

//Function Number: 3
lib_A585::func_08D2(param_00,param_01,param_02)
{
	self.var_669.var_13A2.var_8E6[param_00][param_01] = param_02;
}

//Function Number: 4
lib_A585::func_08E9(param_00,param_01)
{
	return self.var_669.var_13A2.var_8E6[param_00][param_01];
}

//Function Number: 5
lib_A585::func_0911(param_00)
{
	self.var_669.var_13A2.var_4253 = param_00;
}

//Function Number: 6
lib_A585::func_8DCE(param_00)
{
	if(param_00 == "heard_scream" || param_00 == "doFlashBanged" || param_00 == "explode")
	{
		return 1;
	}

	return 0;
}

//Function Number: 7
lib_A585::func_8DAE(param_00)
{
}

//Function Number: 8
lib_A585::func_322A(param_00)
{
	setdvarifuninitialized("stealth_debug_prints","0");
	if(!isdefined(getdvar("stealth_debug_prints")))
	{
		setdvar("stealth_debug_prints","0");
	}

	if(getdvarint("stealth_debug_prints") != 1)
	{
	}
}

//Function Number: 9
lib_A585::func_8DD1(param_00)
{
}

//Function Number: 10
lib_A585::func_441F(param_00)
{
	if(isdefined(self.var_7ADE))
	{
		self.var_7ADE = lib_A59A::func_8F4D(self.var_7ADE);
	}
	else
	{
		self.var_7ADE = "default";
	}

	var_01 = lib_A585::func_4423(param_00);
	if(!common_scripts\utility::flag_exist(var_01))
	{
		common_scripts\utility::flag_init(var_01);
		if(!isdefined(level.var_669.var_4417.flags[param_00]))
		{
			level.var_669.var_4417.flags[param_00] = [];
		}

		var_02 = level.var_669.var_4417.flags[param_00].size;
		level.var_669.var_4417.flags[param_00][var_02] = var_01;
	}
}

//Function Number: 11
lib_A585::func_4418()
{
	if(!isdefined(level.var_669.var_4417.var_443B[self.var_7ADE]))
	{
		level.var_669.var_4417.var_443B[self.var_7ADE] = [];
		level.var_669.var_4417 notify(self.var_7ADE);
	}

	var_00 = level.var_669.var_4417.var_443B[self.var_7ADE].size;
	level.var_669.var_4417.var_443B[self.var_7ADE][var_00] = self;
}

//Function Number: 12
lib_A585::func_4423(param_00)
{
	return lib_A585::func_4424(param_00,self.var_7ADE);
}

//Function Number: 13
lib_A585::func_4424(param_00,param_01)
{
	var_02 = param_00 + "-Group:" + param_01;
	return var_02;
}

//Function Number: 14
lib_A585::func_4420(param_00)
{
	var_01 = lib_A585::func_4423(param_00);
	common_scripts\utility::flag_set(var_01);
	common_scripts\utility::flag_set(param_00);
}

//Function Number: 15
lib_A585::func_442F(param_00)
{
	var_01 = [];
	var_02 = level.var_669.var_4417.var_443B;
	foreach(var_06, var_04 in var_02)
	{
		var_05 = lib_A585::func_4424(param_00,var_06);
		if(common_scripts\utility::flag(var_05))
		{
			var_01[var_01.size] = var_06;
		}
	}

	return var_01;
}

//Function Number: 16
lib_A585::func_442E(param_00)
{
	var_01 = [];
	var_02 = level.var_669.var_4417.var_443B;
	foreach(var_07, var_04 in var_02)
	{
		var_05 = lib_A585::func_4424(param_00,var_07);
		if(common_scripts\utility::flag(var_05))
		{
			var_06 = lib_A585::func_4422(var_07);
			var_01 = lib_A59A::func_CF2(var_01,var_06);
		}
	}

	return var_01;
}

//Function Number: 17
lib_A585::func_441E(param_00,param_01)
{
	var_02 = lib_A585::func_4424(param_00,param_01);
	common_scripts\utility::flag_clear(var_02);
	var_03 = level.var_669.var_4417.flags[param_00];
	var_04 = 1;
	foreach(var_06 in var_03)
	{
		if(common_scripts\utility::flag(var_06))
		{
			return;
		}
	}

	common_scripts\utility::flag_clear(param_00);
}

//Function Number: 18
lib_A585::func_4422(param_00)
{
	level.var_669.var_4417.var_443B[param_00] = lib_A59A::func_CFD(level.var_669.var_4417.var_443B[param_00]);
	return level.var_669.var_4417.var_443B[param_00];
}

//Function Number: 19
lib_A585::func_4436(param_00)
{
	if(!isdefined(level.var_669.var_4417.var_443B[param_00]))
	{
		level.var_669.var_4417 waittill(param_00);
	}
}

//Function Number: 20
lib_A585::func_0923()
{
	self endon("death");
	self endon("pain_death");
	lib_A59A::func_32E3("_stealth_enabled");
	var_00 = self.var_669.var_13A2.var_8E6["state"]["spotted"];
	switch(self.inliveplayerkillstreak)
	{
		case "allies":
			break;

		case "team3":
		case "axis":
			break;
	}
}

//Function Number: 21
lib_A585::func_3249()
{
	self notify("going_back");
	self endon("death");
	self notify("stop_loop");
	self.var_669.var_2707 = "Going Back";
	if(isdefined(self.var_669.var_13A2.var_4253))
	{
		self [[ self.var_669.var_13A2.var_4253 ]]();
	}

	var_00 = self.var_669.var_13A2.var_555A;
	if(isdefined(var_00) && self.type != "dog" && !isdefined(self.var_2563) && !isdefined(self.var_5A77))
	{
		self.var_2563 = ::lib_A555::func_670F;
	}

	if(isdefined(self.var_2563) && isdefined(self.var_2FD))
	{
		self method_81A6(self.var_2E6);
		wait(0.05);
	}

	if(isdefined(self.var_7A96))
	{
		if(isdefined(self.var_5542))
		{
			self.target = self.var_5542.targetname;
		}

		if(isdefined(self.var_8DD0))
		{
			self.target = self.var_8DD0.targetname;
			self.var_8DD0 = undefined;
		}

		thread lib_A555::func_66F9();
	}
	else if(isalive(self.var_670B))
	{
		thread lib_A555::func_67E4();
		lib_A59A::func_7E0F();
		self.var_7A06 = undefined;
	}
	else if(isdefined(var_00))
	{
		if(self.type != "dog")
		{
			lib_A585::func_8E00("_stealth_patrol_walk",1);
		}
		else
		{
			lib_A59A::func_7E0F();
			self.var_7A06 = undefined;
		}

		self.var_2AF2 = 1;
		self.var_2B0D = 1;
		self method_81A6(var_00);
		self.var_1C7 = 40;
	}

	waittillframeend;
	lib_A59A::func_32D9("_stealth_override_goalpos");
	if(isdefined(var_00))
	{
		thread lib_A585::func_324A(var_00);
	}
}

//Function Number: 22
lib_A585::func_324A(param_00)
{
	self endon("death");
	self endon("_stealth_enemy_alert_level_change");
	lib_A59A::func_A0BB(param_00);
	self.var_669.var_13A2.var_555A = undefined;
}

//Function Number: 23
lib_A585::func_3248(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(isdefined(level.var_669.var_6125.var_6137) && distancesquared(param_00,level.var_669.var_6125.var_2E6) < 4096 && param_01 == level.var_669.var_6125.radius && param_02 == level.var_669.var_6125.var_5C2F)
	{
		return level.var_669.var_6125.var_6137;
	}

	level.var_669.var_6125.var_2E6 = param_00;
	level.var_669.var_6125.radius = param_01;
	level.var_669.var_6125.var_5C2F = param_02;
	level.var_669.var_6125.var_6137 = getnodesinradius(param_00,param_01,param_02,512,"Path");
	return level.var_669.var_6125.var_6137;
}

//Function Number: 24
lib_A585::func_3264()
{
	self.var_19D = 0.01;
	self.ignoreall = 0;
	self.var_120 = 0;
	lib_A59A::func_1ED1();
	self.var_180 = 0;
}

//Function Number: 25
lib_A585::func_31DA(param_00,param_01)
{
	self endon("death");
	param_00 endon("death");
	if(!isdefined(param_01))
	{
		param_01 = 60;
	}

	wait(param_01);
	if(isdefined(param_00.var_669) && isdefined(param_00.var_669.var_5833.var_8A8D[self.unique_id]) && param_00.var_669.var_5833.var_8A8D[self.unique_id] > 0)
	{
		param_00.var_669.var_5833.var_8A8D[self.unique_id]--;
	}
}

//Function Number: 26
lib_A585::func_327D()
{
	if(!lib_A59A::func_32D7("_stealth_behavior_reaction_anim"))
	{
		lib_A59A::func_C3D();
		self notify("stop_animmode");
		self notify("stop_loop");
	}

	if(isdefined(self.var_7A96))
	{
		if(isdefined(self.var_5542))
		{
			self.var_5542.var_6704 = undefined;
		}

		self notify("release_node");
		self notify("end_patrol");
	}

	self notify("stop_first_frame");
	lib_A59A::func_1ED1();
	lib_A59A::func_1EBA();
}

//Function Number: 27
lib_A585::func_3242()
{
	if(isdefined(self.var_669.var_13A2.var_555A))
	{
		return;
	}

	if(isdefined(self.var_5555))
	{
		self.var_669.var_13A2.var_555A = self.var_5555.var_2E6;
		return;
	}

	if(isdefined(self.var_5554))
	{
		self.var_669.var_13A2.var_555A = self.var_5554.var_2E6;
		return;
	}

	if(isdefined(self.var_5556))
	{
		self.var_669.var_13A2.var_555A = self.var_5556;
		return;
	}

	self.var_669.var_13A2.var_555A = self.var_2E6;
}

//Function Number: 28
lib_A585::func_3272(param_00)
{
	self.var_669.var_13A2.var_555A = param_00;
}

//Function Number: 29
lib_A585::func_3263(param_00,param_01)
{
	self notify("enemy_react_and_displace_to");
	self endon("enemy_react_and_displace_to");
	self endon("death");
	self endon("_stealth_enemy_alert_level_change");
	if(self.type == "dog")
	{
		return;
	}

	if(isdefined(param_00))
	{
		var_02 = param_00.var_2E6;
	}
	else
	{
		var_02 = var_02;
	}

	var_03 = anglestoforward(self.var_41);
	var_04 = vectornormalize(var_03);
	var_05 = vectortoangles(var_04);
	var_06 = vectortoangles(var_02 - self.var_2E6);
	var_07 = var_05[1] - var_06[1];
	var_07 = var_07 + 360;
	var_07 = int(var_07) % 360;
	if(var_07 > 315 || var_07 < 45)
	{
		var_08 = "8";
	}
	else if(var_08 < 135)
	{
		var_08 = "6";
	}
	else if(var_08 < 225)
	{
		var_08 = "2";
	}
	else
	{
		var_08 = "4";
	}

	if(isdefined(self.var_5A77))
	{
		lib_A585::func_8D8D(self,"gravity","mech_stealth_idle_to_run_" + var_08);
		return;
	}

	lib_A585::func_8D8D(self,"gravity","_stealth_idle_to_run_" + var_08);
}

//Function Number: 30
lib_A585::func_326E(param_00,param_01)
{
	self notify("enemy_runto_and_lookaround");
	self endon("enemy_runto_and_lookaround");
	self endon("death");
	self endon("_stealth_enemy_alert_level_change");
	if(self.type != "dog")
	{
		self endon("_stealth_saw_corpse");
	}

	var_02 = lib_A585::func_4423("_stealth_spotted");
	level endon(var_02);
	self notify("stop_loop");
	lib_A59A::func_32DD("_stealth_override_goalpos");
	if(isdefined(param_00))
	{
		self method_81A5(param_00);
	}
	else
	{
		self method_81A6(param_01);
	}

	self.var_1C7 = 64;
	self waittill("goal");
	if(self.type != "dog")
	{
		lib_A585::func_8DFF("_stealth_look_around");
	}
}

//Function Number: 31
lib_A585::func_3265(param_00)
{
	self notify("enemy_reactto_and_lookaround");
	self endon("enemy_reactto_and_lookaround");
	self endon("death");
	self endon("_stealth_enemy_alert_level_change");
	if(self.type != "dog")
	{
		self endon("_stealth_saw_corpse");
	}

	var_01 = lib_A585::func_4423("_stealth_spotted");
	level endon(var_01);
	self notify("stop_loop");
	self method_818F("face angle",vectortoyaw(param_00 - self.var_2E6));
	if(self.type != "dog")
	{
		lib_A506::func_BCA(self,"gravity","_stealth_look_around");
	}
}

//Function Number: 32
lib_A585::func_3241(param_00,param_01,param_02)
{
	var_03 = lib_A585::func_3248(param_00,param_01,param_02);
	if(!isdefined(var_03) || var_03.size == 0)
	{
		return;
	}

	var_04 = var_03[randomint(var_03.size)];
	for(var_03 = common_scripts\utility::array_remove(var_03,var_04);isdefined(var_04.owner);var_03 = common_scripts\utility::array_remove(var_03,var_04))
	{
		if(var_03.size == 0)
		{
			return;
		}

		var_04 = var_03[randomint(var_03.size)];
	}

	level.var_669.var_6125.var_6137 = var_03;
	return var_04;
}

//Function Number: 33
lib_A585::func_3240(param_00,param_01,param_02)
{
	var_03 = lib_A585::func_3248(param_00,param_01,param_02);
	if(!isdefined(var_03) || var_03.size == 0)
	{
		return;
	}

	var_03 = sortbydistance(var_03,param_00);
	var_04 = var_03[0];
	for(var_03 = common_scripts\utility::array_remove(var_03,var_04);isdefined(var_04.owner);var_03 = common_scripts\utility::array_remove(var_03,var_04))
	{
		if(var_03.size == 0)
		{
			return;
		}

		var_04 = var_03[0];
	}

	level.var_669.var_6125.var_6137 = var_03;
	return var_04;
}

//Function Number: 34
lib_A585::func_31FC()
{
	if(self.type == "dog")
	{
		return;
	}

	if(!lib_A585::func_31F7("wtf"))
	{
		return;
	}

	var_00 = lib_A585::func_3D16();
	if(isstring(var_00) && isstring(self.var_624F))
	{
		var_01 = var_00 + self.var_624F + "_anexplosion";
		lib_A5F1::snd_play_linked(var_01,"stop_sound");
	}
}

//Function Number: 35
lib_A585::func_31F6()
{
	if(self.type == "dog")
	{
		return;
	}

	if(common_scripts\utility::flag("_stealth_spotted"))
	{
		return;
	}

	if(!lib_A585::func_31F7("huh"))
	{
		return;
	}

	var_00 = lib_A585::func_3D16();
	if(isstring(var_00) && isstring(self.var_624F))
	{
		var_01 = var_00 + self.var_624F + "_huh";
		lib_A5F1::snd_play_linked(var_01,"stop_sound");
	}
}

//Function Number: 36
lib_A585::func_31F5()
{
	if(self.type == "dog")
	{
		return;
	}

	if(common_scripts\utility::flag("_stealth_spotted"))
	{
		return;
	}

	if(!lib_A585::func_31F7("hmph"))
	{
		return;
	}

	var_00 = lib_A585::func_3D16();
	if(isstring(var_00) && isstring(self.var_624F))
	{
		var_01 = var_00 + self.var_624F + "_hmph";
		lib_A5F1::snd_play_linked(var_01,"stop_sound");
	}
}

//Function Number: 37
lib_A585::func_31F3()
{
	self endon("death");
	self endon("pain_death");
	if(self.type == "dog")
	{
		return;
	}

	if(!lib_A585::func_31F7("spotted"))
	{
		return;
	}

	var_00 = lib_A585::func_3D16();
	if(isstring(var_00) && isstring(self.var_624F))
	{
		var_01 = var_00 + self.var_624F + "_stealth_alert";
		lib_A5F1::snd_play_linked(var_01,"stop_sound");
	}
}

//Function Number: 38
lib_A585::func_31F9(param_00)
{
	self endon("death");
	self endon("pain_death");
	lib_A588::func_8DE3();
	if(self.type == "dog")
	{
		return;
	}

	if(lib_A585::func_31F7("spotted"))
	{
		thread lib_A585::func_31FB(param_00);
		var_01 = lib_A585::func_3D16();
		var_02 = var_01 + self.var_624F + "_stealth_alert";
		lib_A5F1::snd_play_linked(var_02,"stop_sound");
	}

	if(lib_A585::func_31F7("acknowledge"))
	{
		thread lib_A585::func_31FA(self.var_2E6,lib_A585::func_3D16());
	}
}

//Function Number: 39
lib_A585::func_31FA(param_00,param_01)
{
	wait(1.5);
	if(isdefined(self.var_624F))
	{
		var_02 = self.var_624F;
	}
	else
	{
		var_02 = randomint(3);
	}

	var_03 = param_01 + var_02 + "_stealth_alert_r";
	common_scripts\utility::play_sound_in_space(var_03,param_00);
}

//Function Number: 40
lib_A585::func_31FB(param_00)
{
	var_01 = lib_A585::func_4422(self.var_7ADE);
	foreach(var_03 in var_01)
	{
		if(var_03 == self)
		{
			continue;
		}

		if(isdefined(var_03.enemy) || isdefined(var_03.favoriteenemy))
		{
			continue;
		}

		var_03 notify("heard_scream",param_00);
	}
}

//Function Number: 41
lib_A585::func_31F4()
{
	self endon("death");
	if(isdefined(self.var_39F0))
	{
		wait(self.var_39F0);
	}

	if(!lib_A585::func_31F7("corpse"))
	{
		return;
	}

	if(self.type == "dog")
	{
		lib_A59A::func_32E3("_stealth_behavior_reaction_anim_in_progress");
		self notify("event_awareness","howl");
		return;
	}

	var_00 = "stealth_" + self.var_624F + "_deadbody";
	lib_A5F1::snd_play_linked(var_00,"stop_sound");
}

//Function Number: 42
lib_A585::func_31F7(param_00)
{
	if(param_00 == "spotted")
	{
		if(level.var_669.var_13A2.sound[param_00][self.var_7ADE])
		{
			return 0;
		}

		level.var_669.var_13A2.sound[param_00][self.var_7ADE] = 1;
	}
	else
	{
		if(level.var_669.var_13A2.sound[param_00])
		{
			return 0;
		}

		level.var_669.var_13A2.sound[param_00] = 1;
		thread lib_A585::func_31F8(param_00);
	}

	return 1;
}

//Function Number: 43
lib_A585::func_31F8(param_00)
{
	wait(level.var_669.var_13A2.var_889F);
	level.var_669.var_13A2.sound[param_00] = 0;
}

//Function Number: 44
lib_A585::func_31F1(param_00)
{
	self endon("death");
	self endon("pain_death");
	if(lib_A585::func_31EE(param_00))
	{
		return;
	}

	lib_A585::func_31E8(param_00);
	lib_A585::func_31ED(param_00);
}

//Function Number: 45
lib_A585::func_31E8(param_00)
{
	if(isdefined(self.var_669.var_13A2.var_33BE.var_2532))
	{
		lib_A585::func_31E7(param_00);
		return;
	}

	var_01 = self.var_669.var_13A2.var_8E6["animation"][param_00];
	self [[ var_01 ]](param_00);
}

//Function Number: 46
lib_A585::func_31E7(param_00)
{
	var_01 = self.var_669.var_13A2.var_33BE.var_2532.node;
	var_02 = self.var_669.var_13A2.var_33BE.var_2532.var_C6C;
	var_03 = self.var_669.var_13A2.var_33BE.var_2532.tag;
	var_04 = self.var_669.var_13A2.var_33BE.var_2532.var_315A;
	lib_A59A::func_32DD("_stealth_behavior_reaction_anim");
	self.var_31 = 1;
	var_01 notify(var_04);
	if(isdefined(self.var_BEE))
	{
		self.var_BEF = 1;
		var_01 thread lib_A506::func_C18(self.var_BEE,var_02);
	}

	if(param_00 != "doFlashBanged")
	{
		if(isdefined(var_03) || isdefined(self.var_46E6))
		{
			var_01 lib_A585::func_8D8C(self,var_02,var_03);
		}
		else
		{
			var_01 lib_A585::func_8D8D(self,"gravity",var_02);
		}
	}

	lib_A585::func_08C6();
}

//Function Number: 47
lib_A585::func_31EE(param_00)
{
	self notify("enemy_awareness_reaction",param_00);
	if(lib_A59A::func_32D7("_stealth_behavior_first_reaction") || lib_A59A::func_32D7("_stealth_behavior_reaction_anim_in_progress"))
	{
		return 1;
	}

	lib_A585::func_327D();
	if(issubstr(param_00,"warning"))
	{
		param_00 = "warning";
	}

	switch(param_00)
	{
		case "found_corpse":
		case "saw_corpse":
		case "heard_corpse":
		case "explode":
			break;

		case "reset":
		case "warning":
			break;

		default:
			break;
	}
}

//Function Number: 48
lib_A585::func_31EF()
{
	var_00 = lib_A585::func_4423("_stealth_spotted");
	self endon("death");
	common_scripts\utility::flag_wait_or_timeout(var_00,3);
	if(common_scripts\utility::flag(var_00))
	{
		lib_A59A::func_32DD("_stealth_behavior_first_reaction");
	}
}

//Function Number: 49
lib_A585::func_31ED(param_00)
{
	switch(param_00)
	{
		default:
			break;
	}
}

//Function Number: 50
lib_A585::func_08C6()
{
	self.var_669.var_13A2.var_33BE.var_2532 = undefined;
	self.var_2B1 = squared(512);
}

//Function Number: 51
lib_A585::func_08C7(param_00)
{
	if(!isdefined(self.var_669.var_13A2.var_33BE.var_2532))
	{
		return;
	}

	self.var_669.var_13A2.var_33BE.var_2532.node notify("stop_loop");
	if(!isdefined(param_00) || param_00 == 0)
	{
		self method_8141();
	}

	lib_A585::func_08C6();
}

//Function Number: 52
lib_A585::func_0910(param_00,param_01,param_02,param_03)
{
	self.var_669.var_13A2.var_33BE.var_2532 = spawnstruct();
	self.var_669.var_13A2.var_33BE.var_2532.node = param_00;
	self.var_669.var_13A2.var_33BE.var_2532.var_C6C = param_01;
	self.var_669.var_13A2.var_33BE.var_2532.tag = param_02;
	self.var_669.var_13A2.var_33BE.var_2532.var_315A = param_03;
	thread lib_A585::func_08B9(param_00,param_01,param_02,param_03);
	self.var_2B1 = 0;
}

//Function Number: 53
lib_A585::func_08B9(param_00,param_01,param_02,param_03)
{
	wait(0.1);
	if(!isdefined(self.var_BEE))
	{
		return;
	}

	var_04 = self.var_BEE;
	self waittill("death");
	if(isdefined(self.var_BEF))
	{
		return;
	}

	param_00 thread lib_A506::func_C18(var_04,param_01);
}

//Function Number: 54
lib_A585::func_33C4(param_00,param_01)
{
	level notify("event_awareness_handler");
	level endon("event_awareness_handler");
	level endon("default_event_awareness_enders");
	lib_A585::func_33C3(param_01);
	lib_A59A::func_7BE(::lib_A59A::func_A090,"event_awareness_handler");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"default_event_awareness_enders");
	lib_A59A::func_75F(::common_scripts\utility::flag_clear,"_stealth_event");
	thread lib_A59A::func_2BDC();
	for(;;)
	{
		common_scripts\utility::flag_wait("_stealth_enabled");
		common_scripts\utility::flag_wait("_stealth_event");
		if(!common_scripts\utility::flag("_stealth_enabled"))
		{
			continue;
		}

		wait(2);
		lib_A585::func_33C2(param_00);
		common_scripts\utility::flag_waitopen("_stealth_event");
	}
}

//Function Number: 55
lib_A585::func_33C2(param_00)
{
	wait(randomfloatrange(0.5,1));
	if(!isdefined(param_00))
	{
		return;
	}

	var_01 = common_scripts\utility::random(param_00);
	level thread lib_A59A::func_3AF0(::lib_A59A::func_70BA,var_01);
}

//Function Number: 56
lib_A585::func_33C3(param_00)
{
	level endon("default_event_awareness_enders");
	level endon("event_awareness_handler");
	if(isdefined(param_00))
	{
		foreach(var_02 in param_00)
		{
			if(common_scripts\utility::flag_exist(var_02) && common_scripts\utility::flag(var_02))
			{
				level notify("default_event_awareness_enders");
			}
		}

		foreach(var_02 in param_00)
		{
			lib_A59A::func_7BE(::lib_A59A::func_A090,var_02);
		}
	}

	lib_A59A::func_7BE(::common_scripts\utility::flag_wait,"_stealth_spotted");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"end_event_awareness_handler");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"event_awareness_handler");
	lib_A59A::func_75F(::lib_A59A::func_7C7C,"default_event_awareness_enders");
	thread lib_A59A::func_2BDC();
}

//Function Number: 57
lib_A585::func_055F()
{
	if(!lib_A588::func_8DE8())
	{
		return 0;
	}

	if(common_scripts\utility::flag("_stealth_player_nade"))
	{
		return 0;
	}

	if(common_scripts\utility::flag_exist("_radiation_poisoning"))
	{
		if(common_scripts\utility::flag("_radiation_poisoning"))
		{
			return 0;
		}
	}

	var_00 = getentarray("destructible","classname");
	foreach(var_02 in var_00)
	{
		if(isdefined(var_02.healthdrain))
		{
			return 0;
		}
	}

	var_04 = getentarray("grenade","classname");
	if(var_04.size > 0)
	{
		return 0;
	}

	return 1;
}

//Function Number: 58
lib_A585::func_0608()
{
	var_00 = lib_A588::func_8DD8();
	var_01 = lib_A588::func_8DD7();
	lib_A59A::func_7BE(::common_scripts\utility::flag_wait,var_00);
	lib_A59A::func_7BE(::common_scripts\utility::flag_wait,var_01);
	lib_A59A::func_72E(::lib_A59A::func_A090,"death");
	lib_A59A::func_75F(::lib_A59A::func_7C7C,"end_patrol");
	thread lib_A59A::func_2BDC();
}

//Function Number: 59
lib_A585::func_0664()
{
	thread lib_A588::func_8DAF();
}

//Function Number: 60
lib_A585::func_8E00(param_00,param_01)
{
	if(isdefined(self.script_animation) && isdefined(level.var_78A9["generic"][param_00 + "_" + self.script_animation]))
	{
		lib_A59A::func_7E3F(param_00 + "_" + self.script_animation,param_01);
		return;
	}

	lib_A59A::func_7E3F(param_00,param_01);
}

//Function Number: 61
lib_A585::func_8DFF(param_00)
{
	if(isdefined(self.script_animation) && isdefined(level.var_78A9["generic"][param_00 + "_" + self.script_animation]))
	{
		lib_A59A::func_7E3E(param_00 + "_" + self.script_animation);
		return;
	}

	lib_A59A::func_7E3E(param_00);
}

//Function Number: 62
lib_A585::func_8D8D(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_00.script_animation) && isdefined(level.var_78A9["generic"][param_02 + "_" + param_00.script_animation]))
	{
		lib_A506::func_BB5(param_00,param_01,param_02 + "_" + param_00.script_animation,param_03);
		return;
	}

	lib_A506::func_BCA(param_00,param_01,param_02,param_03);
}

//Function Number: 63
lib_A585::func_8D8C(param_00,param_01,param_02)
{
	if(isdefined(param_00.script_animation) && isdefined(level.var_78A9["generic"][param_01 + "_" + param_00.script_animation]))
	{
		lib_A506::func_C24(param_00,param_01 + "_" + param_00.script_animation,param_02);
		return;
	}

	lib_A506::func_BC9(param_00,param_01,param_02);
}

//Function Number: 64
lib_A585::func_3D16()
{
	var_00 = self.voice;
	switch(var_00)
	{
		case "african":
			break;

		case "atlas":
			break;

		case "american":
			break;

		case "arab":
			break;

		case "british":
			break;

		case "czech":
			break;

		case "delta":
			break;

		case "french":
			break;

		case "kva":
			break;

		case "pmc":
			break;

		case "portugese":
			break;

		case "russian":
			break;

		case "seal":
			break;

		case "secretservice":
			break;

		case "shadowcompany":
			break;

		case "taskforce":
			break;

		default:
			break;
	}
}