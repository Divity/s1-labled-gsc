/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42325.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 23
 * Decompile Time: 11 ms
 * Timestamp: 4/20/2022 8:23:19 PM
*******************************************************************/

//Function Number: 1
lib_A555::func_66F9(param_00)
{
	if(isdefined(self.enemy))
	{
		return;
	}

	self endon("enemy");
	self endon("death");
	self endon("damage");
	self endon("end_patrol");
	self endon("dog_attacks_ai");
	waittillframeend;
	if(isdefined(self.var_7ADE))
	{
		[[ level.var_4221["_patrol_endon_spotted_flag"] ]]();
	}

	thread lib_A555::func_A06F();
	thread lib_A555::func_A07A();
	self.var_1C7 = 32;
	self method_81CA("stand");
	self.var_2AF2 = 1;
	self.var_2B0D = 1;
	self.var_31 = 1;
	self.var_7A96 = 1;
	lib_A59A::func_2A8C();
	if(isdefined(self.var_7A3B))
	{
		self.var_63D7 = self.var_5F62;
		self.var_5F62 = self.var_7A3B;
	}

	lib_A555::func_5794();
	lib_A555::func_7E8E();
	var_01["ent"][1] = ::lib_A555::func_3E88;
	var_01["ent"][0] = ::common_scripts\utility::get_linked_ents;
	var_01["node"][1] = ::lib_A555::func_3E8A;
	var_01["node"][0] = ::lib_A555::func_3DBC;
	var_01["struct"][1] = ::lib_A555::func_3E8C;
	var_01["struct"][0] = ::lib_A59A::func_3DBE;
	var_02["ent"] = ::lib_A59A::func_7E41;
	var_02["node"] = ::lib_A59A::func_7E45;
	var_02["struct"] = ::lib_A59A::func_7E41;
	if(isdefined(param_00))
	{
		self.target = param_00;
	}

	if(isdefined(self.target))
	{
		var_03 = 1;
		var_04 = lib_A555::func_3E88();
		var_05 = lib_A555::func_3E8A();
		var_06 = lib_A555::func_3E8C();
		if(var_04.size)
		{
			var_07 = common_scripts\utility::random(var_04);
			var_08 = "ent";
		}
		else if(var_07.size)
		{
			var_07 = common_scripts\utility::random(var_07);
			var_08 = "node";
		}
		else
		{
			var_07 = common_scripts\utility::random(var_08);
			var_08 = "struct";
		}
	}
	else
	{
		var_03 = 0;
		var_04 = common_scripts\utility::get_linked_ents();
		var_05 = lib_A555::func_3DBC();
		var_06 = lib_A59A::func_3DBE();
		if(var_06.size)
		{
			var_07 = common_scripts\utility::random(var_06);
			var_08 = "ent";
		}
		else if(var_07.size)
		{
			var_07 = common_scripts\utility::random(var_07);
			var_08 = "node";
		}
		else
		{
			var_07 = common_scripts\utility::random(var_08);
			var_08 = "struct";
		}
	}

	var_09 = [];
	var_09["pause"] = "patrol_idle_";
	var_09["turn180"] = common_scripts\utility::ter_op(isdefined(self.var_6702),self.var_6702,"patrol_turn180");
	var_09["smoke"] = "patrol_idle_smoke";
	var_09["stretch"] = "patrol_idle_stretch";
	var_09["checkphone"] = "patrol_idle_checkphone";
	var_09["phone"] = "patrol_idle_phone";
	var_0A = var_07;
	if(isdefined(self.var_669))
	{
		self.var_669.var_2707 = "Wait 4 nextgoal";
	}

	while(isdefined(var_0A.var_6704))
	{
		wait(0.05);
	}

	var_07.var_6704 = undefined;
	var_07 = var_0A;
	self notify("release_node");
	var_07.var_6704 = 1;
	self.var_5542 = var_07;
	[[ var_02[var_08] ]](var_07);
	if(isdefined(var_07.radius) && var_07.radius > 0)
	{
		self.var_1C7 = var_07.radius;
	}
	else
	{
		self.var_1C7 = 32;
	}

	if(isdefined(self.var_669))
	{
		self.var_669.var_2707 = "Patrolling";
	}

	self waittill("goal");
	var_07 notify("trigger",self);
	if(isdefined(var_07.var_79D3))
	{
		common_scripts\utility::flag_set(var_07.var_79D3);
	}

	if(isdefined(var_07.var_79B7))
	{
		lib_A59A::func_32DD(var_07.var_79B7);
	}

	if(isdefined(var_07.var_79CF))
	{
		common_scripts\utility::flag_clear(var_07.var_79CF);
	}

	if(isdefined(var_07.var_798D) && var_07.var_798D)
	{
		lib_A59A::func_8D6([self],1024);
	}

	var_0B = var_07 [[ var_01[var_08][var_03] ]]();
	if(!var_0B.size)
	{
		if(isdefined(self.var_669))
		{
			self.var_669.var_2707 = "@EndOfPath";
		}

		self notify("reached_path_end");
		self notify("_patrol_reached_path_end");
		if(isalive(self.var_670D))
		{
			self.var_670D notify("master_reached_patrol_end");
		}
	}

	var_0C = ::animscripts\reactions::func_7187;
	var_0D = var_07.script_animation;
	var_0E = 1;
	var_0F = 0;
	if(isdefined(var_07.script_parameters))
	{
		var_10 = strtok(var_07.script_parameters," ");
		var_11 = 0;
		if(var_11 < var_10.size)
		{
			switch(var_10[var_11])
			{
				case "keep_running":
					break;

				case "use_node":
					break;

				case "animset":
					break;
			}
		}
	}
}

//Function Number: 2
lib_A555::func_6707(param_00,param_01,param_02)
{
	var_03 = self;
	var_04 = 0;
	if(isdefined(param_02.var_79BE))
	{
		var_03 = param_02;
		self.var_6172 = 1;
		var_04 = 1;
	}

	if(isdefined(self.var_6714) && isdefined(self.var_6714[param_00]))
	{
		var_03 lib_A506::func_BCA(self,"gravity",self.var_6714[param_00],undefined,param_01,var_04);
		return;
	}

	if(isdefined(self.script_animation) && isdefined(level.var_78A9["generic"]["patrol_stop_" + self.script_animation]))
	{
		lib_A506::func_BCA(self,"gravity","patrol_stop_" + self.script_animation,undefined,param_01);
		return;
	}

	var_03 lib_A506::func_BCA(self,"gravity","patrol_stop",undefined,param_01,var_04);
}

//Function Number: 3
lib_A555::func_6706(param_00,param_01)
{
	if(isdefined(self.var_6713) && isdefined(self.var_6713[param_00]))
	{
		lib_A506::func_BCA(self,"gravity",self.var_6713[param_00],undefined,param_01);
		return;
	}

	if(isdefined(self.script_animation) && isdefined(level.var_78A9["generic"]["patrol_start_" + self.script_animation]))
	{
		lib_A506::func_BCA(self,"gravity","patrol_start_" + self.script_animation,undefined,param_01);
		return;
	}

	lib_A506::func_BCA(self,"gravity","patrol_start",undefined,param_01);
}

//Function Number: 4
lib_A555::func_8AF9()
{
	if(self.var_7.var_6E57 == "crouch" && isdefined(self.var_7.var_CD8))
	{
		var_00 = self.var_7.var_CD8["stance_change"];
		if(isdefined(var_00))
		{
			self method_8110("stand_up",var_00,%root,1);
			animscripts\shared::func_2D05("stand_up");
		}
	}
}

//Function Number: 5
lib_A555::func_670F()
{
	self endon("enemy");
	self method_818E("zonly_physics",0);
	self method_818F("face current");
	lib_A555::func_8AF9();
	var_00 = level.var_78A9["generic"]["patrol_radio_in_clear"];
	self method_8110("radio",var_00,%root,1);
	animscripts\shared::func_2D05("radio");
	lib_A555::func_9902();
}

//Function Number: 6
lib_A555::func_9902()
{
	if(!isdefined(self.var_2FD))
	{
		return;
	}

	var_00 = self.var_2FD;
	var_01 = var_00 - self.var_2E6;
	var_01 = (var_01[0],var_01[1],0);
	var_02 = lengthsquared(var_01);
	if(var_02 < 1)
	{
		return;
	}

	var_01 = var_01 / sqrt(var_02);
	var_03 = anglestoforward(self.var_41);
	if(vectordot(var_03,var_01) < -0.5)
	{
		self method_818E("zonly_physics",0);
		self method_818F("face current");
		lib_A555::func_8AF9();
		if(isdefined(self.script_animation) && isdefined(level.var_78A9["generic"]["patrol_turn180_" + self.script_animation]))
		{
			var_04 = level.var_78A9["generic"]["patrol_turn180_" + self.script_animation];
		}
		else
		{
			var_04 = level.var_78A9["generic"]["patrol_turn180"];
		}

		self method_8110("move",var_04,%root,1);
		if(animhasnotetrack(var_04,"code_move"))
		{
			animscripts\shared::func_2D05("move");
			self method_818F("face motion");
			self method_818E("none",0);
		}

		animscripts\shared::func_2D05("move");
	}

	if(isdefined(self.var_30C2))
	{
		self [[ self.var_30C2 ]]("flashlight");
	}
}

//Function Number: 7
lib_A555::func_7E8E()
{
	if(isdefined(self.script_animation))
	{
		if(isdefined(level.var_78A9["generic"]["patrol_walk_" + self.script_animation]))
		{
			self.var_6715 = "patrol_walk_" + self.script_animation;
		}

		if(isdefined(level.var_78A9["generic"]["patrol_walk_weights_" + self.script_animation]))
		{
			self.var_6716 = "patrol_walk_weights_" + self.script_animation;
		}

		if(isdefined(level.var_78A9["generic"]["patrol_idle_" + self.script_animation]))
		{
			self.var_670A = "patrol_idle_" + self.script_animation;
		}
	}

	var_00 = "patrol_walk";
	if(isdefined(self.var_6715))
	{
		var_00 = self.var_6715;
	}

	var_01 = undefined;
	if(isdefined(self.var_6716))
	{
		var_01 = self.var_6716;
	}

	if(isdefined(self.script_animation))
	{
		if(isdefined(level.var_78A9["generic"]["patrol_idle_" + self.script_animation]))
		{
			lib_A59A::func_7E3E("patrol_idle_" + self.script_animation);
		}

		if(isdefined(level.var_78A9["generic"]["patrol_turn180_" + self.script_animation]))
		{
			self.var_6702 = "patrol_turn180_" + self.script_animation;
		}
	}

	lib_A59A::func_7E40(var_00,var_01);
}

//Function Number: 8
lib_A555::func_A070()
{
	self endon("end_patrol");
	if(isdefined(self.var_670B))
	{
		self.var_670B endon("death");
	}

	self waittill("enemy");
}

//Function Number: 9
lib_A555::func_A07A()
{
	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}

	self notify("release_node");
	if(!isdefined(self.var_5542))
	{
		return;
	}

	self.var_5542.var_6704 = undefined;
}

//Function Number: 10
lib_A555::func_A06F()
{
	self endon("death");
	lib_A555::func_A070();
	var_00 = lib_A59A::func_32DB("_stealth_enabled") && lib_A59A::func_32D7("_stealth_enabled");
	self.var_7A96 = 0;
	if(!var_00 && !isdefined(self.var_5A77) || !self.var_5A77)
	{
		lib_A59A::func_1EBA();
		lib_A59A::func_1ED1();
		self method_81CA("stand","crouch","prone");
		self.var_2AF2 = 0;
		self.var_2B0D = 0;
		self method_8141();
		self notify("stop_animmode");
		self.var_7A73 = undefined;
		self.var_1C7 = level.var_277F;
	}

	if(isdefined(self.var_63A6))
	{
		self.interval = self.var_63A6;
	}

	self.var_5F62 = 1;
	if(!isdefined(self))
	{
		return;
	}

	self notify("release_node");
	if(!isdefined(self.var_5542))
	{
		return;
	}

	self.var_5542.var_6704 = undefined;
}

//Function Number: 11
lib_A555::func_3E88()
{
	var_00 = [];
	if(isdefined(self.target))
	{
		var_00 = getentarray(self.target,"targetname");
	}

	return var_00;
}

//Function Number: 12
lib_A555::func_3E8A()
{
	var_00 = [];
	if(isdefined(self.target))
	{
		var_00 = getnodearray(self.target,"targetname");
	}

	return var_00;
}

//Function Number: 13
lib_A555::func_3E8C()
{
	var_00 = [];
	if(isdefined(self.target))
	{
		var_00 = common_scripts\utility::getstructarray(self.target,"targetname");
	}

	return var_00;
}

//Function Number: 14
lib_A555::func_3DBC()
{
	var_00 = [];
	if(isdefined(self.script_linkto))
	{
		var_01 = strtok(self.script_linkto," ");
		for(var_02 = 0;var_02 < var_01.size;var_02++)
		{
			var_03 = getnode(var_01[var_02],"script_linkname");
			if(isdefined(var_03))
			{
				var_00[var_00.size] = var_03;
			}
		}
	}

	return var_00;
}

//Function Number: 15
lib_A555::func_84FC(param_00)
{
	self endon("release_node");
}

//Function Number: 16
lib_A555::func_5794()
{
	if(isdefined(self.var_670D))
	{
		self.var_670D thread lib_A555::func_67E4();
		return;
	}

	if(!isdefined(self.var_7A99))
	{
		return;
	}

	waittillframeend;
	var_00 = function_00D7(self.inliveplayerkillstreak,"dog");
	var_01 = undefined;
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		if(!isdefined(var_00[var_02].var_7A99))
		{
			continue;
		}

		if(var_00[var_02].var_7A99 != self.var_7A99)
		{
			continue;
		}

		var_01 = var_00[var_02];
		self.var_670D = var_01;
		var_01.var_670B = self;
		break;
	}

	if(!isdefined(var_01))
	{
		return;
	}

	var_01 thread lib_A555::func_67E4();
}

//Function Number: 17
lib_A555::func_67E4()
{
	lib_A59A::func_88EB(self);
	if(isdefined(self.enemy))
	{
		return;
	}

	self endon("enemy");
	self endon("death");
	self endon("end_patrol");
	if(isdefined(self.var_7ADE))
	{
		[[ level.var_4221["_patrol_endon_spotted_flag"] ]]();
	}

	self.var_670B endon("death");
	thread lib_A555::func_A06F();
	self.var_1C7 = 4;
	self.var_31 = 1;
	var_00 = lib_A555::func_67E5();
	var_01 = vectornormalize(self.var_2E6 - self.var_670B.var_2E6);
	var_02 = anglestoright(self.var_670B.var_41);
	var_03 = "left";
	if(vectordot(var_01,var_02) > 0)
	{
		var_03 = "right";
	}

	wait(1);
	thread lib_A555::func_67E7();
	thread lib_A555::func_67E8();
	self.var_63A6 = self.interval;
	self.interval = 70;
	for(;;)
	{
		if(isdefined(self.var_670B) && !isdefined(self.var_670B.var_6710))
		{
			var_00 = lib_A555::func_67E9(var_00);
			if(var_03 == "null")
			{
				var_03 = "back";
			}

			var_03 = lib_A555::func_67E6(var_00,var_03);
			self.var_6709 = var_00[var_03].var_2E6;
		}
		else
		{
			self.var_6709 = self.var_2E6;
		}

		self method_81A6(self.var_6709);
		wait(0.05);
	}
}

//Function Number: 18
lib_A555::func_67E5()
{
	var_00 = [];
	var_01 = spawnstruct();
	var_01.options = [];
	var_01.options[var_01.options.size] = "right";
	var_01.options[var_01.options.size] = "back_right";
	var_02 = spawnstruct();
	var_02.options = [];
	var_02.options[var_02.options.size] = "right";
	var_02.options[var_02.options.size] = "back_right";
	var_02.options[var_02.options.size] = "back";
	var_03 = spawnstruct();
	var_03.options = [];
	var_03.options[var_03.options.size] = "back_right";
	var_03.options[var_03.options.size] = "back_left";
	var_03.options[var_03.options.size] = "back";
	var_04 = spawnstruct();
	var_04.options = [];
	var_04.options[var_04.options.size] = "left";
	var_04.options[var_04.options.size] = "back_left";
	var_04.options[var_04.options.size] = "back";
	var_05 = spawnstruct();
	var_05.options = [];
	var_05.options[var_05.options.size] = "left";
	var_05.options[var_05.options.size] = "back_left";
	var_06 = spawnstruct();
	var_00["right"] = var_01;
	var_00["left"] = var_05;
	var_00["back_right"] = var_02;
	var_00["back_left"] = var_04;
	var_00["back"] = var_03;
	var_00["null"] = var_06;
	return var_00;
}

//Function Number: 19
lib_A555::func_67E9(param_00)
{
	var_01 = vectortoangles(self.var_670B.var_5542.var_2E6 - self.var_670B.var_2E6);
	var_02 = self.var_670B.var_2E6;
	var_03 = anglestoright(var_01);
	var_04 = anglestoforward(var_01);
	param_00["right"].var_2E6 = var_02 + var_03 * 40 + var_04 * 30;
	param_00["left"].var_2E6 = var_02 + var_03 * -40 + var_04 * 30;
	param_00["back_right"].var_2E6 = var_02 + var_03 * 32 + var_04 * -16;
	param_00["back_left"].var_2E6 = var_02 + var_03 * -32 + var_04 * -16;
	param_00["back"].var_2E6 = var_02 + var_04 * -48;
	param_00["null"].var_2E6 = self.var_2E6;
	var_05 = getarraykeys(param_00);
	for(var_06 = 0;var_06 < var_05.size;var_06++)
	{
		var_07 = var_05[var_06];
		param_00[var_07].checked = 0;
		param_00[var_07].var_7295 = 0;
	}

	return param_00;
}

//Function Number: 20
lib_A555::func_67E3(param_00)
{
	var_01 = getarraykeys(param_00);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = var_01[var_02];
		if(var_03 == "null")
		{
			continue;
		}
	}
}

//Function Number: 21
lib_A555::func_67E6(param_00,param_01)
{
	param_00[param_01].var_7295 = 1;
	for(var_02 = 0;var_02 < param_00[param_01].options.size;var_02++)
	{
		var_03 = param_00[param_01].options[var_02];
		if(param_00[var_03].checked)
		{
			continue;
		}

		if(self method_81C3(param_00[var_03].var_2E6))
		{
			return var_03;
		}

		param_00[var_03].checked = 1;
	}

	for(var_02 = 0;var_02 < param_00[param_01].options.size;var_02++)
	{
		var_03 = param_00[param_01].options[var_02];
		if(param_00[var_03].var_7295)
		{
			continue;
		}

		var_03 = lib_A555::func_67E6(param_00,var_03);
		return var_03;
	}

	return "null";
}

//Function Number: 22
lib_A555::func_67E7(param_00)
{
	if(isdefined(self.enemy))
	{
		return;
	}

	self endon("enemy");
	self endon("death");
	self endon("end_patrol");
	self.var_670B endon("death");
	if(isdefined(self.var_670B.var_39B) && self.var_670B.var_39B == "cqb_patrol")
	{
		lib_A59A::func_7E0F();
		return;
	}

	if(!isdefined(param_00))
	{
		param_00 = 200;
	}

	lib_A59A::func_7E0F();
	for(;;)
	{
		wait(0.1);
		var_01 = self.var_6709;
		var_02 = distancesquared(self.var_2E6,self.var_6709);
		if(var_02 > squared(param_00))
		{
			if(self.var_7.var_5F58 == "run")
			{
				continue;
			}

			lib_A506::func_BCA(self,"gravity","patrol_dog_start");
			lib_A59A::func_1ED1();
			self.var_7A73 = 1;
			continue;
		}

		if(self.var_7.var_5F58 != "walk")
		{
			self notify("stopped_while_patrolling");
			lib_A506::func_BCA(self,"gravity","patrol_dog_stop");
			lib_A59A::func_7E0F();
		}
	}
}

//Function Number: 23
lib_A555::func_67E8(param_00,param_01)
{
	if(isdefined(self.enemy))
	{
		return;
	}

	self endon("enemy");
	self endon("death");
	self endon("end_patrol");
	self.var_670B endon("death");
	if(isdefined(self.var_670B.var_39B) && self.var_670B.var_39B == "cqb_patrol")
	{
		for(;;)
		{
			wait(0.05);
			var_02 = self.var_6709;
			var_03 = distancesquared(self.var_2E6,self.var_6709);
			if(var_03 < squared(16))
			{
				if(self.var_5F62 > 0.4)
				{
					self.var_5F62 = self.var_5F62 - 0.05;
				}

				continue;
			}

			if(var_03 > squared(48))
			{
				if(self.var_5F62 < 1.8)
				{
					self.var_5F62 = self.var_5F62 + 0.05;
				}

				continue;
			}

			self.var_5F62 = 1;
		}
	}

	if(!isdefined(param_00))
	{
		param_00 = 16;
	}

	if(!isdefined(param_01))
	{
		param_01 = 48;
	}

	var_04 = param_00 * param_00;
	var_05 = param_01 * param_01;
	for(;;)
	{
		wait(0.05);
		var_02 = self.var_6709;
		var_03 = distancesquared(self.var_2E6,self.var_6709);
		if(self.var_7.var_5F58 != "walk")
		{
			self.var_5F62 = 1;
			continue;
		}

		if(var_03 < var_04)
		{
			if(self.var_5F62 > 0.4)
			{
				self.var_5F62 = self.var_5F62 - 0.05;
			}

			continue;
		}

		if(var_03 > var_05)
		{
			if(self.var_5F62 < 0.75)
			{
				self.var_5F62 = self.var_5F62 + 0.05;
			}

			continue;
		}

		self.var_5F62 = 0.5;
	}
}