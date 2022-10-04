/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42258.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 73
 * Decompile Time: 39 ms
 * Timestamp: 4/20/2022 8:22:03 PM
*******************************************************************/

//Function Number: 1
lib_A512::func_4CC7(param_00)
{
	level.var_204D = [];
	level.var_204D[level.var_204D.size] = "r";
	level.var_204D[level.var_204D.size] = "b";
	level.var_204D[level.var_204D.size] = "y";
	level.var_204D[level.var_204D.size] = "c";
	level.var_204D[level.var_204D.size] = "g";
	level.var_204D[level.var_204D.size] = "p";
	level.var_204D[level.var_204D.size] = "o";
	level.var_D20 = [];
	level.var_D20["axis"] = [];
	level.var_D20["allies"] = [];
	level.var_D21 = [];
	level.var_D21["axis"] = [];
	level.var_D21["allies"] = [];
	level.var_2042 = [];
	level.var_2042["allies"] = "allies";
	level.var_2042["axis"] = "axis";
	level.var_2042["team3"] = "axis";
	level.var_2042["neutral"] = "neutral";
	var_01 = [];
	var_01 = common_scripts\utility::array_combine(var_01,getentarray("trigger_multiple","code_classname"));
	var_01 = common_scripts\utility::array_combine(var_01,getentarray("trigger_radius","code_classname"));
	var_01 = common_scripts\utility::array_combine(var_01,getentarray("trigger_once","code_classname"));
	var_02 = getentarray("info_volume","code_classname");
	foreach(var_04 in param_00)
	{
		if(isdefined(var_04.var_7971))
		{
			var_04 lib_A512::func_077A(var_04.var_7971,"allies");
		}

		if(isdefined(var_04.var_7972))
		{
			var_04 lib_A512::func_077A(var_04.var_7972,"axis");
		}
	}

	foreach(var_07 in var_02)
	{
		if(isdefined(var_07.var_7971))
		{
			var_07 lib_A512::func_07BD(var_07.var_7971,"allies");
		}

		if(isdefined(var_07.var_7972))
		{
			var_07 lib_A512::func_07BD(var_07.var_7972,"axis");
		}
	}

	foreach(var_0A in var_01)
	{
		if(isdefined(var_0A.var_7971))
		{
			var_0A thread lib_A512::func_97A5(var_0A.var_7971,"allies");
		}

		if(isdefined(var_0A.var_7972))
		{
			var_0A thread lib_A512::func_97A5(var_0A.var_7972,"axis");
		}
	}

	level.var_203D = [];
	lib_A512::func_0748("BAD NODE");
	lib_A512::func_0748("Cover Stand");
	lib_A512::func_0748("Cover Crouch");
	lib_A512::func_0748("Cover Prone");
	lib_A512::func_0748("Cover Crouch Window");
	lib_A512::func_0748("Cover Right");
	lib_A512::func_0748("Cover Left");
	lib_A512::func_0748("Cover Wide Left");
	lib_A512::func_0748("Cover Wide Right");
	lib_A512::func_0748("Cover Multi");
	lib_A512::func_0748("Conceal Stand");
	lib_A512::func_0748("Conceal Crouch");
	lib_A512::func_0748("Conceal Prone");
	lib_A512::func_0748("Reacquire");
	lib_A512::func_0748("Balcony");
	lib_A512::func_0748("Scripted");
	lib_A512::func_0748("Begin");
	lib_A512::func_0748("End");
	lib_A512::func_0748("Turret");
	lib_A512::func_0784("Ambush");
	lib_A512::func_0784("Guard");
	lib_A512::func_0784("Path");
	lib_A512::func_0784("Exposed");
	lib_A512::func_0784("Scripted");
	level.var_2048["red"] = "r";
	level.var_2048["r"] = "r";
	level.var_2048["blue"] = "b";
	level.var_2048["b"] = "b";
	level.var_2048["yellow"] = "y";
	level.var_2048["y"] = "y";
	level.var_2048["cyan"] = "c";
	level.var_2048["c"] = "c";
	level.var_2048["green"] = "g";
	level.var_2048["g"] = "g";
	level.var_2048["purple"] = "p";
	level.var_2048["p"] = "p";
	level.var_2048["orange"] = "o";
	level.var_2048["o"] = "o";
	level.var_250D = [];
	level.var_250D["allies"] = [];
	level.var_250D["axis"] = [];
	level.var_5587 = [];
	level.var_5587["allies"] = [];
	level.var_5587["axis"] = [];
	foreach(var_0D in level.var_204D)
	{
		level.var_D22["allies"][var_0D] = [];
		level.var_D22["axis"][var_0D] = [];
		level.var_250D["allies"][var_0D] = undefined;
		level.var_250D["axis"][var_0D] = undefined;
	}

	if(isdefined(level.var_2059))
	{
		thread lib_A512::func_6AB6();
	}

	common_scripts\utility::flag_init("respawn_friendlies");
	common_scripts\utility::flag_init("respawn_enemies");
	common_scripts\utility::flag_init("friendly_spawner_locked");
	common_scripts\utility::flag_init("enemy_spawner_locked");
	common_scripts\utility::flag_init("player_looks_away_from_friendly_spawner");
	common_scripts\utility::flag_init("player_looks_away_from_enemy_spawner");
	level.var_746D = 1;
	level.var_746C = 1;
	level.var_7472 = [];
	level.var_D1F = [];
	level.var_D1F["allies"] = [];
	level.var_D1F["axis"] = [];
	var_0F = function_00DA("allies");
	var_10 = function_00DA("team3");
	var_10 = common_scripts\utility::array_combine(function_00DA("axis"),var_10);
	foreach(var_12 in var_0F)
	{
		if(isdefined(var_12.var_39B) && var_12.var_39B == "color_spawner")
		{
			var_12 lib_A512::func_079B("allies");
		}

		if(isdefined(var_12.script_parameters) && var_12.script_parameters == "color_replace")
		{
			var_12 thread lib_A512::func_078B();
		}
	}

	foreach(var_12 in var_10)
	{
		if(isdefined(var_12.var_39B) && var_12.var_39B == "color_spawner")
		{
			var_12 lib_A512::func_079B("axis");
		}

		if(isdefined(var_12.script_parameters) && var_12.script_parameters == "color_replace")
		{
			var_12 thread lib_A512::func_078B();
		}
	}
}

//Function Number: 2
lib_A512::func_077A(param_00,param_01)
{
	self.var_2043 = undefined;
	var_02 = strtok(param_00," ");
	var_02 = common_scripts\utility::array_remove_duplicates(var_02);
	foreach(var_04 in var_02)
	{
		if(isdefined(level.var_D20[param_01]) && isdefined(level.var_D20[param_01][var_04]))
		{
			level.var_D20[param_01][var_04] = common_scripts\utility::array_add(level.var_D20[param_01][var_04],self);
			continue;
		}

		level.var_D20[param_01][var_04][0] = self;
	}
}

//Function Number: 3
lib_A512::func_07BD(param_00,param_01)
{
	var_02 = strtok(param_00," ");
	var_02 = common_scripts\utility::array_remove_duplicates(var_02);
	foreach(var_04 in var_02)
	{
		level.var_D21[param_01][var_04] = self;
	}
}

//Function Number: 4
lib_A512::func_0748(param_00)
{
	level.var_203D[param_00][1]["allies"] = ::lib_A512::func_6FE4;
	level.var_203D[param_00][1]["axis"] = ::lib_A512::func_6FE5;
	level.var_203D[param_00][0]["allies"] = ::lib_A512::func_6FE3;
	level.var_203D[param_00][0]["axis"] = ::lib_A512::func_6FE3;
}

//Function Number: 5
lib_A512::func_0784(param_00)
{
	level.var_203D[param_00][1]["allies"] = ::lib_A512::func_6FEC;
	level.var_203D[param_00][1]["axis"] = ::lib_A512::func_6FEC;
	level.var_203D[param_00][0]["allies"] = ::lib_A512::func_6FEC;
	level.var_203D[param_00][0]["axis"] = ::lib_A512::func_6FEC;
}

//Function Number: 6
lib_A512::func_079B(param_00)
{
	if(!isdefined(level.var_D1F[param_00][self.classname]))
	{
		level.var_D1F[param_00][self.classname] = [];
	}

	level.var_D1F[param_00][self.classname] = common_scripts\utility::array_add(level.var_D1F[param_00][self.classname],self);
}

//Function Number: 7
lib_A512::func_078B()
{
	self endon("death");
	level waittill("load_finished");
	lib_A59A::func_798(::lib_A512::func_2050);
}

//Function Number: 8
lib_A512::func_97A5(param_00,param_01)
{
	var_02 = lib_A512::func_3D10(param_00,param_01);
	var_03 = var_02["colorCodes"];
	var_04 = var_02["colorCodesByColorIndex"];
	var_05 = var_02["colors"];
	self endon("death");
	for(;;)
	{
		self waittill("trigger");
		lib_A512::func_06F6(var_03,var_05,param_01,var_04);
		if(isdefined(self.var_7A8A) && self.var_7A8A)
		{
			thread lib_A512::func_9767();
		}
	}
}

//Function Number: 9
lib_A512::func_06F6(param_00,param_01,param_02,param_03)
{
	var_04 = [];
	foreach(var_06 in param_01)
	{
		var_07 = param_03[var_06];
		if(lib_A512::func_77DD(param_02,var_06,var_07))
		{
			continue;
		}

		level.var_D22[param_02][var_06] = lib_A59A::func_CFD(level.var_D22[param_02][var_06]);
		var_04[var_06] = lib_A512::func_51BD(var_07,var_06,param_02);
	}

	foreach(var_06 in param_01)
	{
		var_07 = param_03[var_06];
		if(lib_A512::func_77DD(param_02,var_06,var_07))
		{
			continue;
		}

		level.var_5587[param_02][var_06] = level.var_250D[param_02][var_06];
		level.var_250D[param_02][var_06] = var_07;
		if(!isdefined(var_04[var_06]))
		{
			continue;
		}

		lib_A512::func_51BA(var_07,var_06,param_02,var_04[var_06]);
	}
}

//Function Number: 10
lib_A512::func_77DD(param_00,param_01,param_02)
{
	if(!isdefined(level.var_250D[param_00][param_01]))
	{
		return 0;
	}

	return param_02 == level.var_250D[param_00][param_01];
}

//Function Number: 11
lib_A512::func_51BD(param_00,param_01,param_02)
{
	var_03 = [];
	var_04 = level.var_D22[param_02][param_01];
	foreach(var_06 in var_04)
	{
		if(isdefined(var_06.var_250C) && var_06.var_250C == param_00)
		{
			continue;
		}

		if(isdefined(var_06.var_398E))
		{
			continue;
		}

		var_03[var_03.size] = var_06;
	}

	if(!var_03.size)
	{
		return;
	}

	common_scripts\utility::array_thread(var_03,::lib_A512::func_5671);
	return var_03;
}

//Function Number: 12
lib_A512::func_5671()
{
	if(!isdefined(self.var_2039))
	{
		return;
	}

	if(isdefined(self.var_2039.var_2043) && self.var_2039.var_2043 == self)
	{
		self.var_2039.var_2043 = undefined;
	}

	self.var_2039 = undefined;
}

//Function Number: 13
lib_A512::func_51BA(param_00,param_01,param_02,param_03)
{
	var_04 = [];
	if(isdefined(level.var_D20[param_02][param_00]))
	{
		lib_A512::func_6FB9(param_02,param_00,param_01);
		var_04 = lib_A512::func_3D0E(param_02,param_00);
	}
	else
	{
		var_05 = lib_A512::func_3D0F(param_02,param_00);
		common_scripts\utility::array_thread(param_03,::lib_A512::func_7C78,var_05,param_00);
		return;
	}

	var_06 = 0;
	var_07 = undefined;
	while(var_04.size > 0)
	{
		var_05 = lib_A512::func_736D(var_05);
		var_08 = lib_A512::func_3CD2(var_05,var_04);
		if(!isdefined(var_08))
		{
			break;
		}

		var_04 = common_scripts\utility::array_remove(var_04,var_08["guy"]);
		var_07 = var_08["node"];
		var_05 = common_scripts\utility::array_remove(var_05,var_08["node"]);
		var_08["guy"] lib_A512::func_9105(var_08["node"],param_01,self,var_06);
		var_06++;
	}

	if(isdefined(level.var_2059) && isdefined(var_07))
	{
		return;
	}

	if(isdefined(var_07))
	{
		return;
	}
}

//Function Number: 14
lib_A512::func_736D(param_00)
{
	for(var_01 = param_00.size - 1;var_01 >= 0;var_01--)
	{
		if(isdefined(param_00[var_01].var_2043) && isalive(param_00[var_01].var_2043))
		{
			param_00 = common_scripts\utility::array_remove(param_00,param_00[var_01]);
		}
	}

	return param_00;
}

//Function Number: 15
lib_A512::func_3CD2(param_00,param_01)
{
	var_02 = undefined;
	var_03 = undefined;
	var_04 = 999999999;
	if(!isdefined(param_00) || param_00.size <= 0)
	{
		return undefined;
	}

	var_05 = param_00[0].var_203F;
	for(var_06 = 0;var_06 < param_00.size;var_06++)
	{
		var_07 = param_00[var_06];
		if(var_07.var_203F > var_05)
		{
			break;
		}

		var_08 = common_scripts\utility::getclosest(var_07.var_2E6,param_01);
		var_09 = distance(var_08.var_2E6,var_07.var_2E6);
		if(var_09 < var_04)
		{
			var_02 = var_07;
			var_03 = var_08;
			var_04 = var_09;
		}
	}

	if(isdefined(var_02))
	{
		var_0A = [];
		var_0A["guy"] = var_03;
		var_0A["node"] = var_02;
		return var_0A;
	}

	return undefined;
}

//Function Number: 16
lib_A512::func_9105(param_00,param_01,param_02,param_03)
{
	self notify("stop_color_move");
	self notify("color_code_move_update",param_00);
	self.var_250C = param_01;
	thread lib_A512::func_6FE2(param_00,param_02,param_03);
}

//Function Number: 17
lib_A512::func_6FE2(param_00,param_01,param_02)
{
	thread lib_A512::func_9106(param_00);
	self endon("stop_color_move");
	self endon("death");
	if(isdefined(param_01) && issubstr(param_01.classname,"trigger"))
	{
		param_01 lib_A59A::script_delay();
	}

	if(!lib_A512::func_602F())
	{
		if(isdefined(param_02))
		{
			wait(param_02 * randomfloatrange(0.2,0.35));
		}
	}

	lib_A512::func_0912(param_00);
	self.var_203E = param_00;
	for(;;)
	{
		self waittill("node_taken",var_03);
		if(isplayer(var_03))
		{
			if(!isdefined(level.var_2059))
			{
				continue;
			}

			wait(0.05);
		}

		if(!isalive(var_03))
		{
			continue;
		}

		if(var_03 != self.var_2039.var_2043)
		{
			self.var_2039.var_2043 = undefined;
		}

		self.var_2039 = undefined;
		param_00 = lib_A512::func_3CD3();
		if(isdefined(param_00))
		{
			if(isdefined(self.var_2039))
			{
				if(isalive(self.var_2039.var_2043) && self.var_2039.var_2043 == self)
				{
					self.var_2039.var_2043 = undefined;
				}
			}

			self.var_2039 = param_00;
			param_00.var_2043 = self;
			lib_A512::func_0912(param_00);
			continue;
		}
	}
}

//Function Number: 18
lib_A512::func_0912(param_00)
{
	self notify("stop_going_to_node");
	self.var_180 = 1;
	lib_A512::func_7DE9(param_00);
	if(isdefined(self.var_7968) && self.var_7968 == 1)
	{
		var_01 = level.var_D21[lib_A512::func_3E8D()][self.var_250C];
		if(isdefined(var_01))
		{
			self method_81AC(var_01);
		}
		else
		{
			self method_815E();
		}

		thread lib_A512::func_1B8A(param_00,var_01);
		return;
	}

	self method_815E();
}

//Function Number: 19
lib_A512::func_7DE9(param_00)
{
	if(isdefined(self.var_204F))
	{
		self thread [[ self.var_204F ]](param_00);
	}

	if(isdefined(self.var_574))
	{
		thread lib_A506::func_C21(self,self.var_574);
		self.var_574 = undefined;
	}

	if(isdefined(self.var_2054))
	{
		self thread [[ self.var_2054 ]](param_00);
	}
	else if(param_00.type == "Scripted")
	{
		thread lib_A512::func_203A(param_00);
		return;
	}
	else
	{
		self method_81A5(param_00);
		thread lib_A512::func_203C(param_00);
	}

	if(isdefined(param_00.var_181))
	{
		self.var_181 = param_00.var_181;
	}
	else if(isdefined(level.var_3829))
	{
		self.var_181 = level.var_3829;
	}
	else
	{
		self.var_181 = 64;
	}

	if(isdefined(param_00.radius) && param_00.radius > 0)
	{
		self.var_1C7 = param_00.radius;
	}
}

//Function Number: 20
lib_A512::func_203A(param_00)
{
	self endon("death");
	self endon("start_being_careful");
	self endon("stop_color_move");
	self.var_180 = 0;
	self.var_1C7 = level.var_277F;
	thread lib_A512::func_203C(param_00);
	if(isdefined(param_00.var_79E4))
	{
		self.var_398E = 1;
	}

	self.var_67C8 = 1;
	param_00 lib_A506::func_BFF(self,param_00.script_animation);
	thread lib_A512::func_203B(param_00);
}

//Function Number: 21
lib_A512::func_203B(param_00)
{
	self endon("death");
	param_00 lib_A506::func_C24(self,param_00.script_animation);
	self.var_67C8 = undefined;
	self.var_398E = undefined;
	if(self.var_250C != level.var_250D[lib_A512::func_3E8D()][self.var_79E1])
	{
		self.var_250C = level.var_250D[lib_A512::func_3E8D()][self.var_79E1];
		thread lib_A512::func_4279();
	}
}

//Function Number: 22
lib_A512::func_203C(param_00)
{
	self endon("stop_color_move");
	for(;;)
	{
		self waittill("goal");
		if(!isdefined(self.var_13A8) || !self.var_13A8)
		{
			if(isdefined(param_00.var_79D3))
			{
				common_scripts\utility::flag_set(param_00.var_79D3);
			}

			if(isdefined(param_00.var_79B7))
			{
				lib_A59A::func_32DD(param_00.var_79B7);
			}

			if(isdefined(param_00.var_79CF))
			{
				common_scripts\utility::flag_clear(param_00.var_79CF);
			}

			if(isdefined(param_00.var_39B))
			{
				self notify(param_00.var_39B);
			}

			return;
		}
	}
}

//Function Number: 23
lib_A512::func_9106(param_00)
{
	self endon("stop_color_move");
	param_00.var_2043 = self;
	self.var_2039 = param_00;
	self waittill("death");
	self.var_2039.var_2043 = undefined;
}

//Function Number: 24
lib_A512::func_7C78(param_00,param_01)
{
	self notify("stop_color_move");
	self.var_250C = param_01;
	if(isdefined(param_00.target))
	{
		var_02 = getnode(param_00.target,"targetname");
		if(isdefined(var_02))
		{
			self method_81A5(var_02);
		}
	}

	self.var_180 = 0;
	self method_81A9(param_00);
}

//Function Number: 25
lib_A512::func_1EA6(param_00,param_01)
{
	var_02 = undefined;
	foreach(var_02 in level.var_204D)
	{
		if(issubstr(param_00,var_02))
		{
			break;
		}

		var_02 = undefined;
	}

	level.var_250D[param_01][var_02] = undefined;
	level.var_5587[param_01][var_02] = undefined;
	var_05 = level.var_D22[param_01][var_02];
	foreach(var_07 in var_05)
	{
		var_07.var_250C = undefined;
	}
}

//Function Number: 26
lib_A512::func_6AB6()
{
	for(;;)
	{
		var_00 = undefined;
		if(!isdefined(level.var_31D.node))
		{
			wait(0.05);
			continue;
		}

		var_01 = level.var_31D.node.var_2043;
		if(!isdefined(var_01.var_67C8))
		{
			if(isdefined(var_01))
			{
				var_01 notify("node_taken",level.var_31D);
			}

			var_00 = level.var_31D.node;
			var_00.var_2043 = level.var_31D;
			for(;;)
			{
				if(!isdefined(level.var_31D.node))
				{
					break;
				}

				if(level.var_31D.node != var_00)
				{
					break;
				}

				wait(0.05);
			}

			var_00.var_2043 = undefined;
			continue;
		}

		wait(0.05);
	}
}

//Function Number: 27
lib_A512::func_1B8A(param_00,param_01)
{
	self endon("death");
	self endon("stop_being_careful");
	self endon("stop_going_to_node");
	thread lib_A512::func_728C(param_00);
	for(;;)
	{
		lib_A512::func_9FEE(param_00,param_01);
		self.var_13A8 = 1;
		self.var_67C8 = undefined;
		self notify("start_being_careful");
		lib_A512::func_9BCA(param_00,param_01);
		self.var_13A8 = 0;
		self.var_180 = 1;
		lib_A512::func_7DE9(param_00);
	}
}

//Function Number: 28
lib_A512::func_728C(param_00)
{
	self endon("death");
	self endon("stop_going_to_node");
	self waittill("stop_being_careful");
	self.var_13A8 = 0;
	self.var_180 = 1;
	lib_A512::func_7DE9(param_00);
}

//Function Number: 29
lib_A512::func_9FEE(param_00,param_01)
{
	for(;;)
	{
		if(self method_816E(param_00.var_2E6,self.var_181))
		{
			return;
		}

		if(isdefined(param_01) && self method_816F(param_01))
		{
			return;
		}

		wait(1);
	}
}

//Function Number: 30
lib_A512::func_9BCA(param_00,param_01)
{
	self method_81A6(self.var_2E6);
	if(isdefined(level.var_277F))
	{
		self.var_1C7 = level.var_277F;
	}
	else
	{
		self.var_1C7 = 1024;
	}

	self.var_180 = 0;
	for(;;)
	{
		wait(1);
		if(self method_816E(param_00.var_2E6,self.var_181))
		{
			continue;
		}

		if(isdefined(param_01) && self method_816F(param_01))
		{
			continue;
		}
	}
}

//Function Number: 31
lib_A512::func_6FE4(param_00,param_01)
{
	if(issubstr(param_00.var_7971,param_01))
	{
		param_00.var_203F = 2;
		self.var_2298[self.var_2298.size] = param_00;
		return;
	}

	param_00.var_203F = 1;
	self.var_2297[self.var_2297.size] = param_00;
}

//Function Number: 32
lib_A512::func_6FE5(param_00,param_01)
{
	if(issubstr(param_00.var_7972,param_01))
	{
		param_00.var_203F = 2;
		self.var_2298[self.var_2298.size] = param_00;
		return;
	}

	param_00.var_203F = 1;
	self.var_2297[self.var_2297.size] = param_00;
}

//Function Number: 33
lib_A512::func_6FE3(param_00,param_01)
{
	param_00.var_203F = 1;
	self.var_2297[self.var_2297.size] = param_00;
}

//Function Number: 34
lib_A512::func_6FEC(param_00,param_01)
{
	param_00.var_203F = 3;
	self.var_66C9[self.var_66C9.size] = param_00;
}

//Function Number: 35
lib_A512::func_6FB9(param_00,param_01,param_02)
{
	var_03 = level.var_D20[param_00][param_01];
	var_04 = spawnstruct();
	var_04.var_66C9 = [];
	var_04.var_2297 = [];
	var_04.var_2298 = [];
	var_05 = isdefined(level.var_5587[param_00][param_02]);
	for(var_06 = 0;var_06 < var_03.size;var_06++)
	{
		var_07 = var_03[var_06];
		var_04 [[ level.var_203D[var_07.type][var_05][param_00] ]](var_07,level.var_5587[param_00][param_02]);
	}

	var_04.var_2297 = common_scripts\utility::array_randomize(var_04.var_2297);
	var_08 = [];
	var_03 = [];
	foreach(var_07 in var_04.var_2297)
	{
		if(isdefined(var_07.var_7974))
		{
			var_07.var_203F = 4;
			var_08[var_08.size] = var_07;
			continue;
		}

		var_03[var_03.size] = var_07;
	}

	var_03 = common_scripts\utility::array_combine(var_03,var_04.var_2298);
	var_03 = common_scripts\utility::array_combine(var_03,var_04.var_66C9);
	var_03 = common_scripts\utility::array_combine(var_03,var_08);
	level.var_D20[param_00][param_01] = var_03;
}

//Function Number: 36
lib_A512::func_3CD3()
{
	var_00 = level.var_250D[lib_A512::func_3E8D()][self.var_79E1];
	var_01 = lib_A512::func_3D0E(lib_A512::func_3E8D(),var_00);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(!isalive(var_01[var_02].var_2043))
		{
			return var_01[var_02];
		}
	}
}

//Function Number: 37
lib_A512::func_3D10(param_00,param_01)
{
	var_02 = strtok(param_00," ");
	var_02 = common_scripts\utility::array_remove_duplicates(var_02);
	var_03 = [];
	var_04 = [];
	var_05 = [];
	foreach(var_07 in var_02)
	{
		var_08 = undefined;
		foreach(var_08 in level.var_204D)
		{
			if(issubstr(var_07,var_08))
			{
				break;
			}

			var_08 = undefined;
		}

		if(!lib_A512::func_2049(param_01,var_07))
		{
			continue;
		}

		var_04[var_08] = var_07;
		var_03[var_03.size] = var_08;
		var_05[var_05.size] = var_07;
	}

	var_0C = [];
	var_0C["colorCodes"] = var_05;
	var_0C["colorCodesByColorIndex"] = var_04;
	var_0C["colors"] = var_03;
	return var_0C;
}

//Function Number: 38
lib_A512::func_2049(param_00,param_01)
{
	if(isdefined(level.var_D20[param_00][param_01]))
	{
		return 1;
	}

	return isdefined(level.var_D21[param_00][param_01]);
}

//Function Number: 39
lib_A512::func_9767()
{
	var_00 = [];
	var_01 = self;
	while(isdefined(var_01))
	{
		var_00[var_00.size] = var_01;
		if(!isdefined(var_01.targetname))
		{
			break;
		}

		var_02 = getentarray(var_01.targetname,"target");
		var_01 = undefined;
		foreach(var_04 in var_02)
		{
			if(!isdefined(var_04.var_7971) && !isdefined(var_04.var_7972))
			{
				continue;
			}

			var_01 = var_04;
		}
	}

	lib_A59A::func_CE5(var_00);
}

//Function Number: 40
lib_A512::func_204C(param_00)
{
	for(var_01 = 0;var_01 < level.var_204D.size;var_01++)
	{
		if(param_00 == level.var_204D[var_01])
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 41
lib_A512::func_3E8D(param_00)
{
	if(isdefined(self.inliveplayerkillstreak) && !isdefined(param_00))
	{
		param_00 = self.inliveplayerkillstreak;
	}

	return level.var_2042[param_00];
}

//Function Number: 42
lib_A512::func_3D0E(param_00,param_01)
{
	return level.var_D20[param_00][param_01];
}

//Function Number: 43
lib_A512::func_3D0F(param_00,param_01)
{
	return level.var_D21[param_00][param_01];
}

//Function Number: 44
lib_A512::func_8433(param_00)
{
	return level.var_2048[tolower(param_00)];
}

//Function Number: 45
lib_A512::func_602F()
{
	if(!isdefined(self.node))
	{
		return 0;
	}

	if(isdefined(self.var_7973))
	{
		wait(self.var_7973);
		return 1;
	}

	return self.node lib_A59A::script_delay();
}

//Function Number: 46
lib_A512::func_0730(param_00,param_01)
{
	self notify("new_color_being_set");
	self endon("new_color_being_set");
	self endon("death");
	self.var_6099 = 1;
	var_02 = lib_A512::func_8433(param_00);
	if(!isai(self))
	{
		lib_A512::func_7E33(var_02);
		return;
	}

	if(self.inliveplayerkillstreak == "allies")
	{
		self.var_2FB = 0;
		self.var_2FC = 0;
	}

	self.var_7972 = undefined;
	self.var_7971 = undefined;
	self.var_639E = undefined;
	var_03 = lib_A512::func_3E8D();
	if(isdefined(self.var_79E1))
	{
		level.var_D22[var_03][self.var_79E1] = common_scripts\utility::array_remove(level.var_D22[var_03][self.var_79E1],self);
	}

	self.var_79E1 = var_02;
	level.var_D22[var_03][self.var_79E1] = common_scripts\utility::array_add(level.var_D22[var_03][self.var_79E1],self);
	self.var_250C = level.var_250D[lib_A512::func_3E8D()][self.var_79E1];
	if(isdefined(self.var_2D2D))
	{
		self.var_2D2D = undefined;
	}
	else if(isdefined(param_01))
	{
		thread lib_A512::func_08EA(param_01);
	}
	else
	{
		thread lib_A512::func_4279();
	}

	self.var_6099 = undefined;
	self notify("done_setting_new_color");
}

//Function Number: 47
lib_A512::func_08EA(param_00)
{
	self endon("death");
	var_01 = self.var_1C7;
	self.var_1C7 = 128;
	self method_81A6(param_00);
	self waittill("goal");
	self.var_1C7 = var_01;
	thread lib_A512::func_4279();
}

//Function Number: 48
lib_A512::func_7328()
{
	level.var_D22[lib_A512::func_3E8D()][self.var_79E1] = common_scripts\utility::array_remove(level.var_D22[lib_A512::func_3E8D()][self.var_79E1],self);
	lib_A512::func_5671();
	self notify("stop_color_move");
	self.var_79E1 = undefined;
	self.var_250C = undefined;
	self.var_180 = 0;
	self.var_67C8 = undefined;
	self.var_398E = undefined;
}

//Function Number: 49
lib_A512::func_7E33(param_00)
{
	self.var_79E1 = param_00;
	self.var_639E = undefined;
}

//Function Number: 50
lib_A512::func_4279()
{
	if(!isdefined(self.var_250C))
	{
		return;
	}

	if(!isdefined(self.finished_spawning))
	{
		common_scripts\utility::waittill_either("finished spawning","death");
	}

	if(!isalive(self))
	{
		return;
	}

	lib_A512::func_5671();
	var_00[0] = self;
	lib_A512::func_51BA(self.var_250C,self.var_79E1,self.inliveplayerkillstreak,var_00);
}

//Function Number: 51
lib_A512::func_51BC(param_00,param_01)
{
	var_02 = lib_A512::func_3D10(param_00,param_01);
	var_03 = var_02["colorCodes"];
	var_04 = var_02["colorCodesByColorIndex"];
	var_05 = var_02["colors"];
	lib_A512::func_06F6(var_03,var_05,param_01,var_04);
}

//Function Number: 52
lib_A512::func_3D0D()
{
	var_00 = lib_A512::func_3D07();
	var_01 = var_00["team"];
	foreach(var_03 in var_00["codes"])
	{
		var_04 = level.var_D21[var_01][var_03];
		if(isdefined(var_04))
		{
			return var_04;
		}
	}

	return undefined;
}

//Function Number: 53
lib_A512::func_3D09()
{
	var_00 = lib_A512::func_3D07();
	var_01 = var_00["team"];
	foreach(var_03 in var_00["codes"])
	{
		var_04 = level.var_D20[var_01][var_03];
		if(isdefined(var_04))
		{
			return var_04;
		}
	}

	return undefined;
}

//Function Number: 54
lib_A512::func_3D07()
{
	var_00 = "allies";
	if(isdefined(self.var_7972))
	{
		var_00 = "axis";
	}

	var_01 = [];
	if(var_00 == "allies")
	{
		var_02 = lib_A512::func_3D10(self.var_7971,"allies");
		var_01 = var_02["colorCodes"];
	}
	else
	{
		var_02 = lib_A512::func_3D10(self.var_7972,"axis");
		var_01 = var_02["colorCodes"];
	}

	var_03 = [];
	var_03["team"] = var_00;
	var_03["codes"] = var_01;
	return var_03;
}

//Function Number: 55
lib_A512::func_204E()
{
	level.var_24DC = [];
}

//Function Number: 56
lib_A512::func_2052(param_00,param_01)
{
	if(!isdefined(level.var_24DC))
	{
		level.var_24DC = [];
	}

	param_00 = lib_A512::func_8433(param_00);
	param_01 = lib_A512::func_8433(param_01);
	level.var_24DC[param_00] = param_01;
	if(!isdefined(level.var_24DC[param_01]))
	{
		lib_A512::func_2051(param_01);
	}
}

//Function Number: 57
lib_A512::func_2051(param_00)
{
	if(!isdefined(level.var_24DC))
	{
		level.var_24DC = [];
	}

	level.var_24DC[param_00] = "none";
}

//Function Number: 58
lib_A512::func_3D0B(param_00)
{
	if(!isdefined(param_00))
	{
		return "none";
	}

	if(!isdefined(level.var_24DC))
	{
		return "none";
	}

	if(!isdefined(level.var_24DC[param_00]))
	{
		return "none";
	}

	return level.var_24DC[param_00];
}

//Function Number: 59
lib_A512::func_3D06(param_00,param_01)
{
	if(isdefined(level.var_D22[param_00][param_01]))
	{
		level.var_D22[param_00][param_01] = lib_A59A::func_CFD(level.var_D22[param_00][param_01]);
		return level.var_D22[param_00][param_01];
	}

	return undefined;
}

//Function Number: 60
lib_A512::func_2053(param_00,param_01)
{
	if(param_01 == "allies" || param_01 == "axis")
	{
		level.var_7472[param_01] = param_00;
		return;
	}

	level.var_7472["allies"] = param_00;
	level.var_7472["axis"] = param_00;
}

//Function Number: 61
lib_A512::func_2055(param_00,param_01,param_02,param_03,param_04)
{
	level endon("kill_color_replacements");
	level endon("kill_hidden_reinforcement_waiting");
	var_05 = lib_A512::func_8905(param_00,param_01,param_02,param_04);
	if(!isdefined(var_05))
	{
		var_06 = 0;
		if(param_00 == "allies" && common_scripts\utility::flag("respawn_friendlies"))
		{
			var_06 = 1;
		}
		else if(param_00 == "axis" && common_scripts\utility::flag("respawn_enemies"))
		{
			var_06 = 1;
		}

		if(var_06)
		{
		}

		return;
	}

	if(var_06.inliveplayerkillstreak == "allies" && isdefined(level.var_3A87))
	{
		var_06 thread [[ level.var_3A87 ]]();
	}
	else if(var_06.inliveplayerkillstreak == "axis" && isdefined(level.var_327A))
	{
		var_06 thread [[ level.var_327A ]]();
	}

	if(isdefined(param_04) && param_04 == 1)
	{
		var_06 thread lib_A512::func_2050();
	}
}

//Function Number: 62
lib_A512::func_8905(param_00,param_01,param_02,param_03)
{
	level endon("kill_color_replacements");
	level endon("kill_hidden_reinforcement_waiting");
	var_04 = undefined;
	if(param_00 == "allies" && !common_scripts\utility::flag("respawn_friendlies"))
	{
		return undefined;
	}

	if(param_00 == "axis" && !common_scripts\utility::flag("respawn_enemies"))
	{
		return undefined;
	}

	for(;;)
	{
		if(!lib_A512::func_7470(param_00))
		{
			if(!isdefined(level.var_3A7A))
			{
				thread lib_A512::func_89C4("allies");
			}

			if(!isdefined(level.var_3269))
			{
				thread lib_A512::func_89C4("axis");
			}

			for(;;)
			{
				lib_A512::func_9FF9(param_00);
				if(lib_A512::func_7470(param_00,1))
				{
					break;
				}

				wait(0.05);
			}
		}

		thread lib_A512::func_5802(param_00);
		var_05 = lib_A512::func_3D0A(param_00,param_01);
		var_05.count = 1;
		var_06 = var_05.var_2E6;
		var_05.var_2E6 = level.var_7472[param_00];
		var_07 = undefined;
		if(isdefined(var_05.var_79E1))
		{
			var_07 = var_05.var_79E1;
			var_05.var_79E1 = undefined;
		}

		var_04 = var_05 method_8094();
		var_05.var_79E1 = var_07;
		var_05.var_2E6 = var_06;
		if(lib_A59A::func_88EB(var_04))
		{
			thread lib_A512::func_5802(param_00);
			wait(1);
			continue;
		}

		level notify("reinforcement_spawned",var_04);
		break;
	}

	var_04 lib_A512::func_0730(param_02,param_03);
	return var_04;
}

//Function Number: 63
lib_A512::func_7470(param_00,param_01)
{
	if(!isdefined(param_01) || param_01 == 0)
	{
		if(param_00 == "allies" && isdefined(level.var_746D))
		{
			return 0;
		}
		else if(param_00 == "axis" && isdefined(level.var_746C))
		{
			return 0;
		}
	}

	if(param_00 == "allies")
	{
		return common_scripts\utility::flag("respawn_friendlies") && !common_scripts\utility::flag("friendly_spawner_locked");
	}

	if(param_00 == "axis")
	{
		return common_scripts\utility::flag("respawn_enemies") && !common_scripts\utility::flag("enemy_spawner_locked");
	}
}

//Function Number: 64
lib_A512::func_9FF9(param_00)
{
	if(param_00 == "allies")
	{
		if(common_scripts\utility::flag("player_looks_away_from_friendly_spawner"))
		{
			return;
		}

		level endon("player_looks_away_from_friendly_spawner");
	}
	else
	{
		if(common_scripts\utility::flag("player_looks_away_from_enemy_spawner"))
		{
			return;
		}

		level endon("player_looks_away_from_enemy_spawner");
	}

	for(;;)
	{
		if(lib_A512::func_7470(param_00))
		{
			return;
		}

		wait(0.05);
	}
}

//Function Number: 65
lib_A512::func_89C4(param_00)
{
	if(param_00 == "allies")
	{
		level.var_3A7A = 1;
	}
	else
	{
		level.var_3269 = 1;
	}

	var_01 = 0;
	for(;;)
	{
		wait(1);
		if(!isdefined(level.var_7472[param_00]))
		{
			var_01 = 0;
			continue;
		}

		var_02 = level.var_7472[param_00] - level.var_31D.var_2E6;
		if(length(var_02) < 200)
		{
			lib_A512::func_6BFD(param_00);
			var_01 = 0;
			continue;
		}

		var_03 = anglestoforward((0,level.var_31D getplayerangles()[1],0));
		var_04 = vectornormalize(var_02);
		var_05 = vectordot(var_03,var_04);
		if(var_05 > 0.2)
		{
			var_06 = !sighttracepassed(level.var_31D geteye(),level.var_7472[param_00],0,level.var_31D);
			if(var_06)
			{
				var_06 = !sighttracepassed(level.var_31D geteye(),level.var_7472[param_00] + (0,0,96),0,level.var_31D);
			}

			if(!var_06)
			{
				lib_A512::func_6BFD(param_00);
				var_01 = 0;
				continue;
			}
		}

		var_01++;
		if(var_01 < 3)
		{
			continue;
		}

		lib_A512::func_6AD7(param_00);
	}
}

//Function Number: 66
lib_A512::func_6BFD(param_00)
{
	if(param_00 == "allies")
	{
		common_scripts\utility::flag_clear("player_looks_away_from_friendly_spawner");
		return;
	}

	common_scripts\utility::flag_clear("player_looks_away_from_enemy_spawner");
}

//Function Number: 67
lib_A512::func_6AD7(param_00)
{
	if(param_00 == "allies")
	{
		common_scripts\utility::flag_set("player_looks_away_from_friendly_spawner");
		return;
	}

	common_scripts\utility::flag_set("player_looks_away_from_enemy_spawner");
}

//Function Number: 68
lib_A512::func_3D0A(param_00,param_01)
{
	if(isdefined(param_01) && isdefined(level.var_D1F[param_00][param_01]))
	{
		return common_scripts\utility::random(level.var_D1F[param_00][param_01]);
	}

	var_02 = getarraykeys(level.var_D1F[param_00]);
	var_03 = [];
	foreach(var_05 in var_02)
	{
		var_03 = common_scripts\utility::array_add(var_03,level.var_D1F[var_05]);
	}

	return common_scripts\utility::random(var_03);
}

//Function Number: 69
lib_A512::func_5802(param_00)
{
	level notify("stop_lock_spawner_for_team_" + param_00);
	level endon("stop_lock_spawner_for_team_" + param_00);
	if(param_00 == "allies")
	{
		common_scripts\utility::flag_set("friendly_spawner_locked");
	}
	else
	{
		common_scripts\utility::flag_set("enemy_spawner_locked");
	}

	if(param_00 == "allies" && isdefined(level.var_3A79))
	{
		[[ level.var_3A79 ]]();
	}
	else if(param_00 == "axis" && isdefined(level.var_3268))
	{
		[[ level.var_3268 ]]();
	}
	else
	{
		wait(2);
	}

	if(param_00 == "allies")
	{
		common_scripts\utility::flag_clear("friendly_spawner_locked");
		return;
	}

	common_scripts\utility::flag_clear("enemy_spawner_locked");
}

//Function Number: 70
lib_A512::func_2050()
{
	level endon("kill_color_replacements");
	self endon("_disable_reinforcement");
	if(isdefined(self.var_73FF))
	{
		return;
	}

	self.var_73FF = 1;
	waittillframeend;
	if(isalive(self))
	{
		self waittill("death");
	}

	if(function_0294(self))
	{
		return;
	}

	var_00 = self.classname;
	var_01 = self.var_79E1;
	var_02 = self.inliveplayerkillstreak;
	var_03 = self.var_2E6;
	if(!isdefined(var_01))
	{
		return;
	}

	var_04 = lib_A512::func_3D0B(var_01);
	if(var_04 != "none")
	{
		for(;;)
		{
			var_05 = lib_A512::func_3D06(var_02,var_04);
			if(!isdefined(var_05))
			{
				break;
			}

			if(!isdefined(level.var_2036))
			{
				var_05 = lib_A59A::func_735B(var_05);
			}

			if(!isdefined(level.var_2035))
			{
				var_05 = lib_A59A::func_738C(var_05,var_00);
			}

			if(var_05.size <= 0)
			{
				break;
			}

			var_06 = common_scripts\utility::getclosest(var_03,var_05);
			if(!isalive(var_06))
			{
				continue;
			}

			var_07 = var_06.classname;
			var_04 = var_06.var_79E1;
			var_06 lib_A512::func_0730(var_01,var_03);
			if(var_02 == "allies" && isdefined(level.var_3A78))
			{
				var_06 [[ level.var_3A78 ]](var_01);
			}

			if(var_02 == "axis" && isdefined(level.var_3262))
			{
				var_06 [[ level.var_3262 ]](var_01);
			}

			var_00 = var_07;
			var_01 = var_04;
			var_03 = var_06.var_2E6;
			break;
		}
	}

	thread lib_A512::func_2055(var_02,var_00,var_01,1,var_03);
}

//Function Number: 71
lib_A512::func_2056(param_00,param_01)
{
	if(isdefined(param_01) && !lib_A512::func_204C(param_01))
	{
	}

	foreach(var_03 in level.var_204D)
	{
		if(isdefined(param_01) && var_03 != param_01)
		{
			continue;
		}

		if((isdefined(param_00) && param_00 == "axis") || param_00 == "allies")
		{
			foreach(var_05 in level.var_D22[param_00][var_03])
			{
				if(isalive(var_05))
				{
					var_05 notify("_disable_reinforcement");
				}
			}

			continue;
		}

		foreach(var_05 in level.var_D22["axis"][var_03])
		{
			if(isalive(var_05))
			{
				var_05 notify("_disable_reinforcement");
			}
		}

		foreach(var_05 in level.var_D22["allies"][var_03])
		{
			if(isalive(var_05))
			{
				var_05 notify("_disable_reinforcement");
			}
		}
	}
}

//Function Number: 72
lib_A512::func_52FD()
{
	common_scripts\utility::flag_clear("friendly_spawner_locked");
	common_scripts\utility::flag_clear("enemy_spawner_locked");
	level notify("kill_color_replacements");
	var_00 = function_00D6();
	common_scripts\utility::array_thread(var_00,::lib_A512::func_7378);
}

//Function Number: 73
lib_A512::func_7378()
{
	self.var_73FF = undefined;
}