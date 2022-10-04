/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42268.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 110
 * Decompile Time: 29 ms
 * Timestamp: 4/20/2022 8:22:04 PM
*******************************************************************/

//Function Number: 1
lib_A51C::func_271D()
{
	var_00 = getallnodes();
	var_01 = 0;
	var_02 = [];
	for(var_03 = 0;var_03 < var_00.size;var_03++)
	{
		if(!var_00[var_03].spawnflags & 2 && (isdefined(var_00[var_03].target) && getnodearray(var_00[var_03].target,"targetname").size > 0) || isdefined(var_00[var_03].targetname) && getnodearray(var_00[var_03].targetname,"target").size > 0)
		{
			var_02[var_01] = var_00[var_03];
			var_01++;
		}
	}

	var_04 = 0;
	for(;;)
	{
		if(getdvar("chain") == "1")
		{
			for(var_03 = 0;var_03 < var_02.size;var_03++)
			{
				if(distance(level.var_31D getorigin(),var_02[var_03].var_2E6) < 1500)
				{
				}
			}

			var_05 = function_00D6("allies");
			for(var_03 = 0;var_03 < var_05.size;var_03++)
			{
				var_06 = var_05[var_03] animscripts\utility::func_3F2D();
				if(isdefined(var_06))
				{
				}
			}
		}

		wait 0.05;
	}
}

//Function Number: 2
lib_A51C::func_2694(param_00)
{
	var_01 = function_00D6();
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(var_01[var_02] getentitynumber() != param_00)
		{
			continue;
		}

		var_01[var_02] thread lib_A51C::func_2695();
		break;
	}
}

//Function Number: 3
lib_A51C::func_270A(param_00)
{
	var_01 = function_00D6();
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(var_01[var_02] getentitynumber() != param_00)
		{
			continue;
		}

		var_01[var_02] notify("stop_drawing_enemy_pos");
		break;
	}
}

//Function Number: 4
lib_A51C::func_2695()
{
	self endon("death");
	self endon("stop_drawing_enemy_pos");
	for(;;)
	{
		wait(0.05);
		if(isalive(self.enemy))
		{
		}

		if(!animscripts\utility::func_4729())
		{
			continue;
		}

		var_00 = animscripts\utility::func_3F7C();
	}
}

//Function Number: 5
lib_A51C::func_2696()
{
	var_00 = function_00D6();
	var_01 = undefined;
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		var_01 = var_00[var_02];
		if(!isalive(var_01))
		{
			continue;
		}

		if(isdefined(var_01.var_24B))
		{
		}

		if(isdefined(var_01.var_4276))
		{
			if(var_01 method_813D())
			{
				var_03 = (1,0,0);
			}
			else
			{
				var_03 = (0,0,1);
			}

			var_04 = var_01.var_2E6 + (0,0,54);
			if(isdefined(var_01.node))
			{
				if(var_01.node.type == "Cover Left")
				{
					var_05 = 1;
					var_04 = anglestoright(var_01.node.var_41);
					var_04 = var_04 * -32;
					var_04 = (var_04[0],var_04[1],64);
					var_04 = var_01.node.var_2E6 + var_04;
				}
				else if(var_01.node.type == "Cover Right")
				{
					var_05 = 1;
					var_04 = anglestoright(var_01.node.var_41);
					var_04 = var_04 * 32;
					var_04 = (var_04[0],var_04[1],64);
					var_04 = var_01.node.var_2E6 + var_04;
				}
			}

			common_scripts\utility::draw_arrow(var_04,var_01.var_4276,var_03);
		}
	}

	if(1)
	{
		return;
	}

	if(!isalive(var_01))
	{
		return;
	}

	if(isalive(var_01.enemy))
	{
	}

	if(isdefined(var_01.var_24B))
	{
	}

	if(isalive(var_01.var_4275))
	{
	}

	if(!var_01 animscripts\utility::func_4729())
	{
		return;
	}

	var_06 = var_01 animscripts\utility::func_3F7C();
	if(isdefined(var_01.var_4276))
	{
	}
}

//Function Number: 6
lib_A51C::func_2DD4(param_00)
{
}

//Function Number: 7
lib_A51C::func_2DE6(param_00,param_01,param_02)
{
	var_03 = self gettagorigin(param_00);
	var_04 = self gettagangles(param_00);
	lib_A51C::func_2DCF(var_03,var_04,param_01,param_02);
}

//Function Number: 8
lib_A51C::func_2DDD(param_00)
{
	var_01 = undefined;
	var_02 = undefined;
	for(;;)
	{
		if(isdefined(self))
		{
			var_01 = self.var_2E6;
			var_02 = self.var_41;
		}

		lib_A51C::func_2DCF(var_01,var_02,param_00);
		wait(0.05);
	}
}

//Function Number: 9
lib_A51C::func_2DD0(param_00,param_01)
{
	for(;;)
	{
		lib_A51C::func_2DCF(param_00,param_01);
		wait(0.05);
	}
}

//Function Number: 10
lib_A51C::func_2DDE()
{
	while(isdefined(self))
	{
		lib_A51C::func_2DCF(self.var_2E6,self.var_41);
		wait(0.05);
	}
}

//Function Number: 11
lib_A51C::func_2DCF(param_00,param_01,param_02,param_03)
{
	var_04 = 10;
	var_05 = anglestoforward(param_01);
	var_06 = var_05 * var_04;
	var_07 = var_05 * var_04 * 0.8;
	var_08 = anglestoright(param_01);
	var_09 = var_08 * var_04 * -0.2;
	var_0A = var_08 * var_04 * 0.2;
	var_0B = anglestoup(param_01);
	var_08 = var_08 * var_04;
	var_0B = var_0B * var_04;
	var_0C = (0.9,0.2,0.2);
	var_0D = (0.2,0.9,0.2);
	var_0E = (0.2,0.2,0.9);
	if(isdefined(param_02))
	{
		var_0C = param_02;
		var_0D = param_02;
		var_0E = param_02;
	}

	if(!isdefined(param_03))
	{
		param_03 = 1;
	}
}

//Function Number: 12
lib_A51C::func_2DD5(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = 100;
	}

	if(!isdefined(param_01))
	{
		param_01 = (0,1,0);
	}

	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		var_02 = anglestoforward(self.var_41);
		wait(0.05);
	}
}

//Function Number: 13
lib_A51C::func_2DE0()
{
	for(;;)
	{
		lib_A51C::func_2DCF(level.var_31D.var_2E6,level.var_31D getplayerangles(),(1,1,1));
		wait(0.05);
	}
}

//Function Number: 14
lib_A51C::func_2DE7(param_00,param_01)
{
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		lib_A51C::func_2DE6(param_00,param_01);
		wait(0.05);
	}
}

//Function Number: 15
lib_A51C::func_2DE8(param_00,param_01)
{
	for(;;)
	{
		if(!isdefined(self.var_2E6))
		{
			break;
		}

		lib_A51C::func_2DE6(param_00,param_01,1000);
		wait(0.05);
	}
}

//Function Number: 16
lib_A51C::func_2D9D(param_00,param_01)
{
	self endon("death");
	for(;;)
	{
		if(!isdefined(self))
		{
			break;
		}

		if(!isdefined(self.var_2E6))
		{
			break;
		}

		lib_A51C::func_2DE6(param_00,param_01);
		wait(0.05);
	}
}

//Function Number: 17
lib_A51C::func_9E17(param_00,param_01)
{
	if(param_00 == "ai")
	{
		var_02 = function_00D6();
		for(var_03 = 0;var_03 < var_02.size;var_03++)
		{
			var_02[var_03] lib_A51C::func_2DE6(param_01);
		}
	}
}

//Function Number: 18
lib_A51C::func_2688()
{
	level.var_31D.ignoreme = 1;
	var_00 = getallnodes();
	var_01 = [];
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		if(var_00[var_02].type == "Cover Left")
		{
			var_01[var_01.size] = var_00[var_02];
		}

		if(var_00[var_02].type == "Cover Right")
		{
			var_01[var_01.size] = var_00[var_02];
		}
	}

	var_03 = function_00D6();
	for(var_02 = 0;var_02 < var_03.size;var_02++)
	{
		var_03[var_02] delete();
	}

	level.var_2734 = function_00D8();
	level.var_721 = [];
	level.var_20D4 = [];
	for(var_02 = 0;var_02 < level.var_2734.size;var_02++)
	{
		level.var_2734[var_02].targetname = "blah";
	}

	var_04 = 0;
	for(var_02 = 0;var_02 < 30;var_02++)
	{
		if(var_02 >= var_01.size)
		{
			break;
		}

		var_01[var_02] thread lib_A51C::func_22C6();
		var_04++;
	}

	if(var_01.size <= 30)
	{
		return;
	}

	for(;;)
	{
		level waittill("debug_next_corner");
		if(var_04 >= var_01.size)
		{
			var_04 = 0;
		}

		var_01[var_04] thread lib_A51C::func_22C6();
		var_04++;
	}
}

//Function Number: 19
lib_A51C::func_22C6()
{
	lib_A51C::func_22C2();
}

//Function Number: 20
lib_A51C::func_22C2()
{
	var_00 = undefined;
	var_01 = undefined;
	for(;;)
	{
		for(var_02 = 0;var_02 < level.var_2734.size;var_02++)
		{
			wait(0.05);
			var_01 = level.var_2734[var_02];
			var_03 = 0;
			for(var_04 = 0;var_04 < level.var_721.size;var_04++)
			{
				if(distance(level.var_721[var_04].var_2E6,self.var_2E6) > 250)
				{
					continue;
				}

				var_03 = 1;
				break;
			}

			if(var_03)
			{
				continue;
			}

			var_05 = 0;
			for(var_04 = 0;var_04 < level.var_20D4.size;var_04++)
			{
				if(level.var_20D4[var_04] != self)
				{
					continue;
				}

				var_05 = 1;
				break;
			}

			if(var_05)
			{
				continue;
			}

			level.var_721[level.var_721.size] = self;
			var_01.var_2E6 = self.var_2E6;
			var_01.var_41 = self.var_41;
			var_01.count = 1;
			var_00 = var_01 method_8094();
			if(lib_A59A::func_88EB(var_00))
			{
				lib_A51C::func_7390(self);
				continue;
			}

			break;
		}

		if(isalive(var_00))
		{
			break;
		}
	}

	wait(1);
	if(isalive(var_00))
	{
		var_00.ignoreme = 1;
		var_00.inliveplayerkillstreak = "neutral";
		var_00 method_81A6(var_00.var_2E6);
		thread lib_A51C::func_2426(self.var_2E6);
		var_00 thread lib_A59A::func_272B();
		thread lib_A51C::func_2427(var_00);
		var_00 waittill("death");
	}

	lib_A51C::func_7390(self);
	level.var_20D4[level.var_20D4.size] = self;
}

//Function Number: 21
lib_A51C::func_7390(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < level.var_721.size;var_02++)
	{
		if(level.var_721[var_02] == param_00)
		{
			continue;
		}

		var_01[var_01.size] = level.var_721[var_02];
	}

	level.var_721 = var_01;
}

//Function Number: 22
lib_A51C::func_2426(param_00)
{
	wait(0.05);
}

//Function Number: 23
lib_A51C::func_2427(param_00)
{
	var_01 = undefined;
	while(isalive(param_00))
	{
		var_01 = param_00.var_2E6;
		wait(0.05);
	}

	wait(0.05);
}

//Function Number: 24
lib_A51C::func_2729()
{
	self notify("stopdebugmisstime");
	self endon("stopdebugmisstime");
	self endon("death");
	for(;;)
	{
		if(self.var_7.var_5CE0 <= 0)
		{
		}
		else
		{
		}

		wait(0.05);
	}
}

//Function Number: 25
lib_A51C::func_272A()
{
	self notify("stopdebugmisstime");
}

//Function Number: 26
lib_A51C::func_7F5B(param_00,param_01)
{
}

//Function Number: 27
lib_A51C::func_2726(param_00)
{
}

//Function Number: 28
lib_A51C::func_598B(param_00,param_01,param_02,param_03,param_04)
{
	return param_03 + param_00 - param_01 * param_04 - param_03 / param_02 - param_01;
}

//Function Number: 29
lib_A51C::func_5F5B()
{
}

//Function Number: 30
lib_A51C::func_5F59()
{
}

//Function Number: 31
lib_A51C::func_8AE7()
{
}

//Function Number: 32
lib_A51C::func_3D3D()
{
	var_00 = anglestoforward(self.var_41);
	var_01 = lib_A571::func_3D3C();
	if(!isdefined(var_01) || !isdefined(var_00))
	{
		return "none";
	}

	if(length(var_01) == 0)
	{
		var_01 = self.var_4FF;
	}

	var_02 = vectordot(vectornormalize(var_00),vectornormalize(var_01));
	var_02 = clamp(var_02,-1,1);
	var_03 = acos(var_02);
	if(var_03 > 135)
	{
		return "back";
	}

	if(var_03 < 45)
	{
		return "forward";
	}

	if(var_03 > 45 && var_03 < 135)
	{
		return "left";
	}

	return "right";
}

//Function Number: 33
lib_A51C::func_4D5E()
{
	var_00 = [];
	var_00[0] = "Invalid";
	var_00[1] = "Exposed";
	var_00[2] = "Turret";
	var_00[3] = "Grenade_Response";
	var_00[4] = "Badplace";
	var_00[5] = "Cover_Arrival";
	var_00[6] = "Death";
	var_00[7] = "Pain";
	var_00[8] = "Flashed";
	var_00[9] = "Scripted_Anim";
	var_00[10] = "Custom_Anim";
	var_00[11] = "Negotiation";
	return var_00;
}

//Function Number: 34
lib_A51C::func_8D5A(param_00)
{
	if(!isdefined(param_00))
	{
		return 99;
	}

	switch(param_00)
	{
		case "death":
			break;

		case "scripted":
			break;

		case "traverse":
			break;

		case "combat":
			break;

		case "patrol":
			break;

		case "stealth":
			break;

		case "cover_arrival":
			break;

		case "cover":
			break;

		case "flashed":
			break;

		case "reaction":
			break;

		case "pain":
			break;

		case "init":
			break;

		case "move":
			break;

		case "stop":
			break;

		case "grenade_cower":
			break;

		case "grenade_return_throw":
			break;

		case "<custom>":
		case "cover_prone":
		case "cover_swim_right":
		case "cover_swim_left":
		case "cover_swim_up":
		case "cover_left":
		case "cover_multi":
		case "cover_right":
		case "cover_stand":
		case "cover_crouch":
			break;

		default:
			break;
	}
}

//Function Number: 35
lib_A51C::func_7AD9(param_00,param_01)
{
	return lib_A51C::func_8D5A(param_00) < lib_A51C::func_8D5A(param_01);
}

//Function Number: 36
lib_A51C::func_7AF1(param_00)
{
	var_01 = [];
	if(!isai(param_00))
	{
		var_01 = common_scripts\utility::array_add(var_01,"Undefined");
		return var_01;
	}

	if(!isdefined(param_00.script))
	{
		var_01 = common_scripts\utility::array_add(var_01,"Undefined");
		return var_01;
	}

	if(isdefined(self.var_7A96) && self.var_7A96 == 1)
	{
		var_01 = common_scripts\utility::array_add(var_01,"patrol");
	}

	if(isdefined(self.var_51D7) && self.var_51D7)
	{
		var_01 = common_scripts\utility::array_add(var_01,"traverse");
	}

	if(isdefined(self.var_56F) && self.var_56F != "default_stealth_state")
	{
		var_01 = common_scripts\utility::array_add(var_01,"stealth");
	}

	switch(param_00.script)
	{
		case "<custom>":
		case "grenade_return_throw":
		case "grenade_cower":
		case "cover_arrival":
		case "reaction":
		case "scripted":
		case "init":
		case "pain":
		case "combat":
		case "death":
		case "flashed":
		case "move":
		case "stop":
			break;

		case "cover_prone":
		case "cover_swim_right":
		case "cover_swim_left":
		case "cover_swim_up":
		case "cover_left":
		case "cover_multi":
		case "cover_right":
		case "cover_stand":
		case "cover_crouch":
			break;

		default:
			break;
	}
}

//Function Number: 37
lib_A51C::func_9706(param_00)
{
	var_01 = " -> ";
	var_02 = common_scripts\utility::string_find(param_00,var_01);
	var_03 = getsubstr(param_00,0,var_02);
	var_04 = getsubstr(param_00,var_02 + var_01.size,param_00.size);
	var_05 = var_04 + var_01 + var_03;
	if(isdefined(common_scripts\utility::array_find(level.var_9712,var_05)))
	{
		var_06 = [];
		var_06["reversed"] = var_05;
		var_06["new"] = var_03 + " -- " + var_04;
		return var_06;
	}

	return undefined;
}

//Function Number: 38
lib_A51C::func_65C5(param_00)
{
}

//Function Number: 39
lib_A51C::func_8D57()
{
}

//Function Number: 40
lib_A51C::func_2721()
{
}

//Function Number: 41
lib_A51C::func_7377()
{
}

//Function Number: 42
lib_A51C::func_23D7()
{
}

//Function Number: 43
lib_A51C::func_23D6()
{
}

//Function Number: 44
lib_A51C::func_26B7()
{
}

//Function Number: 45
lib_A51C::func_26B8()
{
}

//Function Number: 46
lib_A51C::func_7357()
{
}

//Function Number: 47
lib_A51C::func_23BA()
{
}

//Function Number: 48
lib_A51C::func_6953()
{
}

//Function Number: 49
lib_A51C::func_269E()
{
}

//Function Number: 50
lib_A51C::func_2691()
{
}

//Function Number: 51
lib_A51C::func_269F()
{
}

//Function Number: 52
lib_A51C::func_8501()
{
	var_00 = undefined;
	var_01 = undefined;
	var_00 = (15.1859,-12.2822,4.071);
	var_01 = (947.2,-10918,64.9514);
	for(;;)
	{
		wait(0.05);
		var_02 = var_00;
		var_03 = var_01;
		if(!isdefined(var_00))
		{
			var_02 = level.var_9495;
		}

		if(!isdefined(var_01))
		{
			var_03 = level.var_31D geteye();
		}

		var_04 = bullettrace(var_02,var_03,0,undefined);
	}
}

//Function Number: 53
lib_A51C::func_267F()
{
	var_00 = newhudelem();
	var_00.alignx = "left";
	var_00.aligny = "middle";
	var_00.x = 10;
	var_00.y = 100;
	var_00.label = &"DEBUG_DRONES";
	var_00.alpha = 0;
	var_01 = newhudelem();
	var_01.alignx = "left";
	var_01.aligny = "middle";
	var_01.x = 10;
	var_01.y = 115;
	var_01.label = &"DEBUG_ALLIES";
	var_01.alpha = 0;
	var_02 = newhudelem();
	var_02.alignx = "left";
	var_02.aligny = "middle";
	var_02.x = 10;
	var_02.y = 130;
	var_02.label = &"DEBUG_AXIS";
	var_02.alpha = 0;
	var_03 = newhudelem();
	var_03.alignx = "left";
	var_03.aligny = "middle";
	var_03.x = 10;
	var_03.y = 145;
	var_03.label = &"DEBUG_VEHICLES";
	var_03.alpha = 0;
	var_04 = newhudelem();
	var_04.alignx = "left";
	var_04.aligny = "middle";
	var_04.x = 10;
	var_04.y = 160;
	var_04.label = &"DEBUG_TOTAL";
	var_04.alpha = 0;
	var_05 = "off";
	for(;;)
	{
		var_06 = getdvar("debug_character_count");
		if(var_06 == "off")
		{
			if(var_06 != var_05)
			{
				var_00.alpha = 0;
				var_01.alpha = 0;
				var_02.alpha = 0;
				var_03.alpha = 0;
				var_04.alpha = 0;
				var_05 = var_06;
			}

			wait(0.25);
			continue;
		}
		else if(var_06 != var_05)
		{
			var_00.alpha = 1;
			var_01.alpha = 1;
			var_02.alpha = 1;
			var_03.alpha = 1;
			var_04.alpha = 1;
			var_05 = var_06;
		}

		var_07 = getentarray("drone","targetname").size;
		var_00 setvalue(var_07);
		var_08 = function_00D6("allies").size;
		var_01 setvalue(var_08);
		var_09 = function_00D6("bad_guys").size;
		var_02 setvalue(var_09);
		var_03 setvalue(getentarray("script_vehicle","classname").size);
		var_04 setvalue(var_07 + var_08 + var_09);
		wait(0.25);
	}
}

//Function Number: 54
lib_A51C::func_6262()
{
	if(!self.var_101)
	{
		self method_8052((0,0,-500),level.var_31D,level.var_31D);
	}
}

//Function Number: 55
lib_A51C::func_26B0()
{
}

//Function Number: 56
lib_A51C::camera()
{
	wait(0.05);
	var_00 = getentarray("camera","targetname");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_02 = getent(var_00[var_01].target,"targetname");
		var_00[var_01].var_6596 = var_02.var_2E6;
		var_00[var_01].var_41 = vectortoangles(var_02.var_2E6 - var_00[var_01].var_2E6);
	}

	for(;;)
	{
		var_03 = function_00D6("axis");
		if(!var_03.size)
		{
			lib_A51C::func_3A27();
			wait(0.5);
			continue;
		}

		var_04 = [];
		for(var_01 = 0;var_01 < var_00.size;var_01++)
		{
			for(var_05 = 0;var_05 < var_03.size;var_05++)
			{
				if(distance(var_00[var_01].var_2E6,var_03[var_05].var_2E6) > 256)
				{
					continue;
				}

				var_04[var_04.size] = var_00[var_01];
				break;
			}
		}

		if(!var_04.size)
		{
			lib_A51C::func_3A27();
			wait(0.5);
			continue;
		}

		var_06 = [];
		for(var_01 = 0;var_01 < var_04.size;var_01++)
		{
			var_07 = var_04[var_01];
			var_08 = var_07.var_6596;
			var_09 = var_07.var_2E6;
			var_0A = vectortoangles((var_09[0],var_09[1],var_09[2]) - (var_08[0],var_08[1],var_08[2]));
			var_0B = (0,var_0A[1],0);
			var_0C = anglestoforward(var_0B);
			var_0A = vectornormalize(var_09 - level.var_31D.var_2E6);
			var_0D = vectordot(var_0C,var_0A);
			if(var_0D < 0.85)
			{
				continue;
			}

			var_06[var_06.size] = var_07;
		}

		if(!var_06.size)
		{
			lib_A51C::func_3A27();
			wait(0.5);
			continue;
		}

		var_0E = distance(level.var_31D.var_2E6,var_06[0].var_2E6);
		var_0F = var_06[0];
		for(var_01 = 1;var_01 < var_06.size;var_01++)
		{
			var_10 = distance(level.var_31D.var_2E6,var_06[var_01].var_2E6);
			if(var_10 > var_0E)
			{
				continue;
			}

			var_0F = var_06[var_01];
			var_0E = var_10;
		}

		lib_A51C::func_7FE7(var_0F);
		wait(3);
	}
}

//Function Number: 57
lib_A51C::func_3A27()
{
	setdvar("cl_freemove","0");
}

//Function Number: 58
lib_A51C::func_7FE7(param_00)
{
	setdvar("cl_freemove","2");
}

//Function Number: 59
lib_A51C::func_0B9E()
{
	for(;;)
	{
		if(getdvar("angles","0") == "1")
		{
			setdvar("angles","0");
		}

		wait(1);
	}
}

//Function Number: 60
lib_A51C::func_266C()
{
	waittillframeend;
	for(var_00 = 0;var_00 < 50;var_00++)
	{
		if(!isdefined(level.var_266B[var_00]))
		{
			continue;
		}

		var_01 = level.var_266B[var_00];
		for(var_02 = 0;var_02 < var_01.size;var_02++)
		{
			var_03 = var_01[var_02];
			if(isdefined(var_03.var_987F))
			{
				continue;
			}
		}
	}
}

//Function Number: 61
lib_A51C::func_55D8()
{
}

//Function Number: 62
lib_A51C::func_A235()
{
	precacheitem("defaultweapon");
	for(;;)
	{
		lib_A51C::func_9B2F();
		wait(0.25);
	}
}

//Function Number: 63
lib_A51C::func_9B2F()
{
	var_00 = getdvarfloat("scr_requiredMapAspectRatio",1);
	if(!isdefined(level.var_5C71))
	{
		setdvar("scr_minimap_corner_targetname","minimap_corner");
		level.var_5C71 = "minimap_corner";
	}

	if(!isdefined(level.var_5C72))
	{
		setdvar("scr_minimap_height","0");
		level.var_5C72 = 0;
	}

	var_01 = getdvarfloat("scr_minimap_height");
	var_02 = getdvar("scr_minimap_corner_targetname");
	if(var_01 != level.var_5C72 || var_02 != level.var_5C71)
	{
		if(isdefined(level.var_5C74))
		{
			level.var_5C75 unlink();
			level.var_5C74 delete();
			level notify("end_draw_map_bounds");
		}

		if(var_01 > 0)
		{
			level.var_5C72 = var_01;
			level.var_5C71 = var_02;
			var_03 = level.var_31D;
			var_04 = getentarray(var_02,"targetname");
			if(var_04.size == 2)
			{
				var_05 = var_04[0].var_2E6 + var_04[1].var_2E6;
				var_05 = (var_05[0] * 0.5,var_05[1] * 0.5,var_05[2] * 0.5);
				var_06 = (var_04[0].var_2E6[0],var_04[0].var_2E6[1],var_05[2]);
				var_07 = (var_04[0].var_2E6[0],var_04[0].var_2E6[1],var_05[2]);
				if(var_04[1].var_2E6[0] > var_04[0].var_2E6[0])
				{
					var_06 = (var_04[1].var_2E6[0],var_06[1],var_06[2]);
				}
				else
				{
					var_07 = (var_04[1].var_2E6[0],var_07[1],var_07[2]);
				}

				if(var_04[1].var_2E6[1] > var_04[0].var_2E6[1])
				{
					var_06 = (var_06[0],var_04[1].var_2E6[1],var_06[2]);
				}
				else
				{
					var_07 = (var_07[0],var_04[1].var_2E6[1],var_07[2]);
				}

				var_08 = var_06 - var_05;
				var_05 = (var_05[0],var_05[1],var_05[2] + var_01);
				var_09 = spawn("script_origin",var_03.var_2E6);
				var_0A = (cos(getnorthyaw()),sin(getnorthyaw()),0);
				var_0B = (var_0A[1],0 - var_0A[0],0);
				var_0C = vectordot(var_0A,var_08);
				if(var_0C < 0)
				{
					var_0C = 0 - var_0C;
				}

				var_0D = vectordot(var_0B,var_08);
				if(var_0D < 0)
				{
					var_0D = 0 - var_0D;
				}

				if(var_00 > 0)
				{
					var_0E = var_0D / var_0C;
					if(var_0E < var_00)
					{
						var_0F = var_00 / var_0E;
						var_0D = var_0D * var_0F;
						var_10 = lib_A51C::vecscale(var_0B,vectordot(var_0B,var_06 - var_05) * var_0F - 1);
						var_07 = var_07 - var_10;
						var_06 = var_06 + var_10;
					}
					else
					{
						var_0F = var_10 / var_02;
						var_0D = var_0D * var_10;
						var_10 = lib_A51C::vecscale(var_0B,vectordot(var_0B,var_07 - var_06) * var_10 - 1);
						var_07 = var_07 - var_10;
						var_06 = var_06 + var_10;
					}
				}

				if(level.console)
				{
					var_11 = 1.777778;
					var_12 = 2 * atan(var_0D * 0.8 / var_01);
					var_13 = 2 * atan(var_0C * var_11 * 0.8 / var_01);
				}
				else
				{
					var_11 = 1.333333;
					var_12 = 2 * atan(var_12 * 1.05 / var_03);
					var_13 = 2 * atan(var_0D * var_12 * 1.05 / var_02);
				}

				if(var_12 > var_13)
				{
					var_14 = var_12;
				}
				else
				{
					var_14 = var_14;
				}

				var_15 = var_01 - 1000;
				if(var_15 < 16)
				{
					var_15 = 16;
				}

				if(var_15 > 10000)
				{
					var_15 = 10000;
				}

				var_03 playerlinktoabsolute(var_09);
				var_09.var_2E6 = var_05 + (0,0,-62);
				var_09.var_41 = (90,getnorthyaw(),0);
				var_03 giveweapon("defaultweapon");
				function_00D3("cg_fov",var_14);
				level.var_5C75 = var_03;
				level.var_5C74 = var_09;
				thread lib_A51C::func_2DD9(var_05,var_07,var_06);
				return;
			}

			return;
		}
	}
}

//Function Number: 64
lib_A51C::func_3F28()
{
	var_00 = [];
	var_00 = getentarray("minimap_line","script_noteworthy");
	var_01 = [];
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		var_01[var_02] = var_00[var_02] lib_A51C::func_3F27();
	}

	return var_01;
}

//Function Number: 65
lib_A51C::func_3F27()
{
	var_00 = [];
	var_01 = self;
	while(isdefined(var_01))
	{
		var_00[var_00.size] = var_01;
		if(!isdefined(var_01) || !isdefined(var_01.target))
		{
			break;
		}

		var_01 = getent(var_01.target,"targetname");
		if(isdefined(var_01) && var_01 == var_00[0])
		{
			var_00[var_00.size] = var_01;
			break;
		}
	}

	var_02 = [];
	for(var_03 = 0;var_03 < var_00.size;var_03++)
	{
		var_02[var_03] = var_00[var_03].var_2E6;
	}

	return var_02;
}

//Function Number: 66
lib_A51C::vecscale(param_00,param_01)
{
	return (param_00[0] * param_01,param_00[1] * param_01,param_00[2] * param_01);
}

//Function Number: 67
lib_A51C::func_2DD9(param_00,param_01,param_02)
{
	level notify("end_draw_map_bounds");
	level endon("end_draw_map_bounds");
	var_03 = param_00[2] - param_02[2];
	var_04 = length(param_01 - param_02);
	var_05 = param_01 - param_00;
	var_05 = vectornormalize((var_05[0],var_05[1],0));
	param_01 = param_01 + lib_A51C::vecscale(var_05,var_04 * 1 / 800 * 0);
	var_06 = param_02 - param_00;
	var_06 = vectornormalize((var_06[0],var_06[1],0));
	param_02 = param_02 + lib_A51C::vecscale(var_06,var_04 * 1 / 800 * 0);
	var_07 = (cos(getnorthyaw()),sin(getnorthyaw()),0);
	var_08 = param_02 - param_01;
	var_09 = lib_A51C::vecscale(var_07,vectordot(var_08,var_07));
	var_0A = lib_A51C::vecscale(var_07,abs(vectordot(var_08,var_07)));
	var_0B = param_01;
	var_0C = param_01 + var_09;
	var_0D = param_02;
	var_0E = param_02 - var_09;
	var_0F = lib_A51C::vecscale(param_01 + param_02,0.5) + lib_A51C::vecscale(var_0A,0.51);
	var_10 = var_04 * 0.003;
	var_11 = lib_A51C::func_3F28();
	for(;;)
	{
		common_scripts\utility::array_levelthread(var_11,::common_scripts\utility::plot_points);
		wait(0.05);
	}
}

//Function Number: 68
lib_A51C::func_5149(param_00)
{
	var_01 = vectornormalize(param_00 - self method_8097());
	var_02 = vectornormalize(param_00 - (0,0,24) - self method_8097());
	var_03 = vectordot(var_01,var_02);
	var_04 = anglestoforward(self getplayerangles());
	var_05 = vectordot(var_04,var_01);
	if(var_05 > var_03)
	{
		return 1;
	}

	return 0;
}

//Function Number: 69
lib_A51C::func_2686()
{
	wait(0.05);
	var_00 = function_00D6();
	var_01 = [];
	var_01["axis"] = [];
	var_01["allies"] = [];
	var_01["neutral"] = [];
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		var_03 = var_00[var_02];
		if(!isdefined(var_03.var_250C))
		{
			continue;
		}

		var_01[var_03.inliveplayerkillstreak][var_03.var_250C] = 1;
		var_04 = (1,1,1);
		if(isdefined(var_03.var_79E1))
		{
			var_04 = level.var_2034[var_03.var_79E1];
		}

		var_05 = var_03.var_250C;
		if(isdefined(var_03.var_13A8) && var_03.var_13A8 == 1)
		{
			var_05 = var_05 + " (c)";
		}

		var_03 lib_A51C::func_9889();
	}

	lib_A51C::func_2DA9(var_01,"allies");
	lib_A51C::func_2DA9(var_01,"axis");
}

//Function Number: 70
lib_A51C::func_2DA9(param_00,param_01)
{
	var_02 = getarraykeys(param_00[param_01]);
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_04 = (1,1,1);
		var_04 = level.var_2034[getsubstr(var_02[var_03],0,1)];
		if(isdefined(level.var_2057[param_01][var_02[var_03]]))
		{
			var_05 = level.var_2057[param_01][var_02[var_03]];
			for(var_06 = 0;var_06 < var_05.size;var_06++)
			{
				var_07 = "";
				if(isdefined(var_05[var_06].classname) && var_05[var_06].classname == "info_volume")
				{
					var_07 = "V-" + var_02[var_03];
				}
				else
				{
					var_07 = "N-" + var_02[var_03];
				}

				if(isdefined(var_05[var_06].var_2043) && var_05[var_06].var_2043 == level.var_31D)
				{
					var_07 = var_07 + " (p)";
				}
			}
		}
	}
}

//Function Number: 71
lib_A51C::func_3E8F()
{
	if(self.inliveplayerkillstreak == "allies")
	{
		if(isdefined(self.node) && isdefined(self.node.var_7971))
		{
			return self.node.var_7971;
		}

		var_00 = self method_81AA();
		if(isdefined(var_00) && isdefined(var_00.var_7971))
		{
			return var_00.var_7971;
		}
	}

	if(self.inliveplayerkillstreak == "axis")
	{
		if(isdefined(self.node) && isdefined(self.node.var_7972))
		{
			return self.node.var_7972;
		}

		var_00 = self method_81AA();
		if(isdefined(var_00) && isdefined(var_00.var_7972))
		{
			return var_00.var_7972;
		}
	}
}

//Function Number: 72
lib_A51C::func_9889()
{
	var_00 = (0,0,0);
	if(isdefined(self.node))
	{
		var_00 = self.node.var_2E6;
	}
	else if(isdefined(self method_81AA()))
	{
		var_01 = self method_81AA();
		var_00 = var_01.var_2E6;
	}
	else
	{
		return;
	}

	if(!isdefined(self.var_79E1))
	{
		return;
	}

	var_02 = lib_A51C::func_3E8F();
	if(!isdefined(var_02))
	{
		return;
	}

	if(!issubstr(var_02,self.var_79E1))
	{
	}
}

//Function Number: 73
lib_A51C::func_3960()
{
	if(getdvar("depth_close") == "")
	{
		setdvar("depth_close","0");
	}

	if(getdvar("depth_far") == "")
	{
		setdvar("depth_far","1500");
	}

	var_00 = getdvarint("depth_close");
	var_01 = getdvarint("depth_far");
	setexponentialfog(var_00,var_01,1,1,1,1,0);
}

//Function Number: 74
lib_A51C::func_2737()
{
	level.var_5560 = gettime();
	thread lib_A51C::func_2738();
}

//Function Number: 75
lib_A51C::func_2738()
{
}

//Function Number: 76
lib_A51C::func_2B6A(param_00,param_01)
{
	if(self.inliveplayerkillstreak == param_00.inliveplayerkillstreak)
	{
		return;
	}

	var_02 = 0;
	var_02 = var_02 + self.var_4B2;
	var_03 = 0;
	var_03 = var_03 + param_00.var_4B2;
	var_04 = undefined;
	if(isdefined(param_01))
	{
		var_04 = self sentient_getthreatbiasgroup();
		if(isdefined(var_04))
		{
			var_03 = var_03 + getthreatbias(param_01,var_04);
			var_02 = var_02 + getthreatbias(var_04,param_01);
		}
	}

	if(param_00.ignoreme || var_03 < -900000)
	{
		var_03 = "Ignore";
	}

	if(self.ignoreme || var_02 < -900000)
	{
		var_02 = "Ignore";
	}

	var_05 = 20;
	var_06 = (1,0.5,0.2);
	var_07 = (0.2,0.5,1);
	var_08 = !isplayer(self) && self.var_2EA;
	for(var_09 = 0;var_09 <= var_05;var_09++)
	{
		if(isdefined(param_01))
		{
		}

		if(isdefined(var_04))
		{
		}

		if(var_08)
		{
		}

		wait(0.05);
	}
}

//Function Number: 77
lib_A51C::func_271F()
{
	level.var_2684 = [];
	level.var_2685 = [];
	for(;;)
	{
		level waittill("updated_color_friendlies");
		lib_A51C::func_2DA7();
	}
}

//Function Number: 78
lib_A51C::func_2DA7()
{
	level endon("updated_color_friendlies");
	var_00 = getarraykeys(level.var_2684);
	var_01 = [];
	var_02 = [];
	var_02[var_02.size] = "r";
	var_02[var_02.size] = "o";
	var_02[var_02.size] = "y";
	var_02[var_02.size] = "g";
	var_02[var_02.size] = "c";
	var_02[var_02.size] = "b";
	var_02[var_02.size] = "p";
	var_03 = lib_A59A::func_3E58();
	for(var_04 = 0;var_04 < var_02.size;var_04++)
	{
		var_01[var_02[var_04]] = 0;
	}

	for(var_04 = 0;var_04 < var_00.size;var_04++)
	{
		var_05 = level.var_2684[var_00[var_04]];
		var_01[var_05]++;
	}

	for(var_04 = 0;var_04 < level.var_2685.size;var_04++)
	{
		level.var_2685[var_04] destroy();
	}

	level.var_2685 = [];
	var_06 = 15;
	var_07 = 365;
	var_08 = 25;
	var_09 = 25;
	for(var_04 = 0;var_04 < var_02.size;var_04++)
	{
		if(var_01[var_02[var_04]] <= 0)
		{
			continue;
		}

		for(var_0A = 0;var_0A < var_01[var_02[var_04]];var_0A++)
		{
			var_0B = newhudelem();
			var_0B.x = var_06 + 25 * var_0A;
			var_0B.y = var_07;
			var_0B setshader("white",16,16);
			var_0B.alignx = "left";
			var_0B.aligny = "bottom";
			var_0B.alpha = 1;
			var_0B.color = var_03[var_02[var_04]];
			level.var_2685[level.var_2685.size] = var_0B;
		}

		var_07 = var_07 + var_09;
	}
}

//Function Number: 79
lib_A51C::func_6D1D()
{
	for(;;)
	{
		if(isdefined(level.var_31D.node))
		{
		}

		wait(0.05);
	}
}

//Function Number: 80
lib_A51C::func_2DE9()
{
	if(isalive(self.var_2043))
	{
	}
}

//Function Number: 81
lib_A51C::func_2723()
{
	for(;;)
	{
		var_00 = function_00D6();
		common_scripts\utility::array_thread(var_00,::lib_A51C::func_9E08);
		wait(0.05);
	}
}

//Function Number: 82
lib_A51C::func_9E08()
{
	if(!isdefined(self.var_1C6))
	{
	}
}

//Function Number: 83
lib_A51C::func_204A()
{
	wait(0.5);
	var_00 = [];
	var_00[var_00.size] = "r";
	var_00[var_00.size] = "g";
	var_00[var_00.size] = "b";
	var_00[var_00.size] = "y";
	var_00[var_00.size] = "o";
	var_00[var_00.size] = "p";
	var_00[var_00.size] = "c";
	for(;;)
	{
		for(var_01 = 0;var_01 < var_00.size;var_01++)
		{
			var_02 = level.var_250D["allies"][var_00[var_01]];
			if(isdefined(var_02))
			{
				lib_A51C::func_2DA8(var_02);
			}
		}

		wait(0.05);
	}
}

//Function Number: 84
lib_A51C::func_2DA8(param_00)
{
	var_01 = level.var_D20["allies"][param_00];
	common_scripts\utility::array_thread(var_01,::lib_A51C::func_2DE9);
}

//Function Number: 85
lib_A51C::func_0766(param_00,param_01,param_02)
{
	var_03 = newhudelem();
	var_03.alignx = "left";
	var_03.aligny = "middle";
	var_03.x = param_00;
	var_03.y = param_01;
	var_03.alpha = 1;
	var_03.var_18C = 1;
	var_03.label = param_02;
	level.var_C84[level.var_C84.size] = var_03;
	return var_03;
}

//Function Number: 86
lib_A51C::func_3CB9(param_00)
{
	if(!isdefined(level.var_C82[param_00.animname]))
	{
		return;
	}

	if(!isdefined(level.var_C82[param_00.animname][param_00.var_C6C]))
	{
		return;
	}

	if(!isdefined(level.var_C82[param_00.animname][param_00.var_C6C][param_00.var_6174]))
	{
		return;
	}

	return level.var_C82[param_00.animname][param_00.var_C6C][param_00.var_6174]["soundalias"];
}

//Function Number: 87
lib_A51C::func_502B(param_00,param_01,param_02)
{
	return isdefined(level.var_C82[param_00][param_01][param_02]["created_by_animSound"]);
}

//Function Number: 88
lib_A51C::func_2B40()
{
	if(distance(level.var_31D.var_2E6,self.var_2E6) > 1500)
	{
		return;
	}

	level.var_C8B[level.var_C8B.size] = self;
}

//Function Number: 89
lib_A51C::func_2677(param_00)
{
}

//Function Number: 90
lib_A51C::func_2678()
{
}

//Function Number: 91
lib_A51C::func_90CB(param_00,param_01)
{
	if(!isdefined(level.var_C88))
	{
		return;
	}

	if(!isdefined(level.var_C88.var_C8A[param_01]))
	{
		return;
	}

	var_02 = level.var_C88.var_C8A[param_01];
	var_03 = lib_A51C::func_3CB9(var_02);
	if(!isdefined(var_03) || lib_A51C::func_502B(var_02.animname,var_02.var_C6C,var_02.var_6174))
	{
		level.var_C82[var_02.animname][var_02.var_C6C][var_02.var_6174]["soundalias"] = param_00;
		level.var_C82[var_02.animname][var_02.var_C6C][var_02.var_6174]["created_by_animSound"] = 1;
	}
}

//Function Number: 92
lib_A51C::func_93EA(param_00)
{
	var_01 = "\";
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		if(param_00[var_02] == "\")
		{
			var_01 = var_01 + "\\";
			var_01 = var_01 + "\";
			continue;
		}

		var_01 = var_01 + param_00[var_02];
	}

	var_01 = var_01 + "\";
	return var_01;
}

//Function Number: 93
lib_A51C::func_576D(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_02))
	{
		param_02 = (1,1,1);
	}

	if(isdefined(param_05))
	{
		param_05 = param_05 * 20;
		for(var_06 = 0;var_06 < param_05;var_06++)
		{
			wait(0.05);
		}

		return;
	}

	wait(0.05);
}

//Function Number: 94
lib_A51C::func_6FA0(param_00,param_01,param_02,param_03,param_04)
{
	self endon("stop_print3ddraw");
	if(!isdefined(param_03))
	{
		param_03 = 1;
	}

	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	wait(0.05);
}

//Function Number: 95
lib_A51C::func_20D1()
{
	if(getdvar("credits_active") == "1")
	{
		wait(7);
		setdvar("credits_active","0");
		lib_A526::func_2452();
		return;
	}

	wait(7);
	lib_A59A::func_60D3();
}

//Function Number: 96
lib_A51C::func_3766(param_00)
{
}

//Function Number: 97
lib_A51C::func_1CA3(param_00)
{
	if(!isdefined(level.var_1C98))
	{
		level.var_1C98 = -1;
	}

	if(level.var_1C98 == param_00)
	{
		return;
	}

	lib_A51C::func_3766(param_00);
	if(!isdefined(level.var_1C99))
	{
		return;
	}

	level.var_1C98 = param_00;
	if(!isdefined(level.var_1C97))
	{
		level.var_1C97 = level.var_1C99 common_scripts\utility::spawn_tag_origin();
	}

	thread lib_A51C::func_1CA4(level.var_1C99);
}

//Function Number: 98
lib_A51C::func_1CA4(param_00)
{
	level notify("new_chasecam");
	level endon("new_chasecam");
	param_00 endon("death");
	level.var_31D unlink();
	level.var_31D playerlinktoblend(level.var_1C97,"tag_origin",2,0.5,0.5);
	wait(2);
	level.var_31D playerlinktodelta(level.var_1C97,"tag_origin",1,180,180,180,180);
	for(;;)
	{
		wait(0.2);
		if(!isdefined(level.var_1C99))
		{
			return;
		}

		var_01 = level.var_1C99.var_2E6;
		var_02 = level.var_1C99.var_41;
		var_03 = anglestoforward(var_02);
		var_03 = var_03 * 200;
		var_01 = var_01 + var_03;
		var_02 = level.var_31D getplayerangles();
		var_03 = anglestoforward(var_02);
		var_03 = var_03 * -200;
		level.var_1C97 moveto(var_01 + var_03,0.2);
	}
}

//Function Number: 99
lib_A51C::func_9E0D()
{
	foreach(var_01 in level.createfxent)
	{
		if(isdefined(var_01.looper))
		{
		}
	}
}

//Function Number: 100
lib_A51C::func_076C(param_00,param_01)
{
}

//Function Number: 101
lib_A51C::func_6F9C(param_00)
{
	if(!isdefined(level.var_9EFB))
	{
		level.var_9EFB = 9500;
	}

	level.var_9EFB++;
	var_01 = "bridge_helpers";
	lib_A51C::func_076C("origin",self.var_2E6[0] + " " + self.var_2E6[1] + " " + self.var_2E6[2]);
	lib_A51C::func_076C("angles",self.var_41[0] + " " + self.var_41[1] + " " + self.var_41[2]);
	lib_A51C::func_076C("targetname","helper_model");
	lib_A51C::func_076C("model",self.model);
	lib_A51C::func_076C("classname","script_model");
	lib_A51C::func_076C("spawnflags","4");
	lib_A51C::func_076C("_color","0.443137 0.443137 1.000000");
	if(isdefined(param_00))
	{
		lib_A51C::func_076C("script_noteworthy",param_00);
	}
}

//Function Number: 102
lib_A51C::func_2DB0(param_00)
{
}

//Function Number: 103
lib_A51C::func_2DB1()
{
	var_00 = level.var_31D getplayerangles();
	var_01 = anglestoforward(var_00);
	var_02 = level.var_31D geteye();
	var_03 = self geteye();
	var_04 = vectortoangles(var_03 - var_02);
	var_05 = anglestoforward(var_04);
	var_06 = vectordot(var_05,var_01);
}

//Function Number: 104
lib_A51C::func_4EA3()
{
	var_00 = getentarray("explodable_barrel","targetname");
	var_00 = common_scripts\utility::array_combine(var_00,getentarray("explodable_barrel","script_noteworthy"));
	if(!var_00.size)
	{
		return;
	}

	foreach(var_02 in var_00)
	{
		var_02.destructible_type = "explodable_barrel";
		var_03 = var_02.model + "2";
		precachemodel(var_03);
		var_02 setmodel(var_03);
		if(isdefined(var_02.target))
		{
			var_04 = getent(var_02.target,"targetname");
			if(isdefined(var_04))
			{
				var_04.script_destruct_collision = "pre";
			}

			var_02.targetname = "destructible_toy";
		}
	}

	iprintlnbold("Old Interactive_Objects being converted, rebuild map to avoid this warning ");
}

//Function Number: 105
lib_A51C::func_40DE(param_00)
{
	common_scripts\utility::draw_entity_bounds(param_00,1);
}

//Function Number: 106
lib_A51C::func_9503(param_00)
{
	var_01 = lib_A51C::func_40DE(param_00);
}

//Function Number: 107
lib_A51C::func_268C(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
}

//Function Number: 108
lib_A51C::func_2DA5(param_00,param_01,param_02,param_03)
{
}

//Function Number: 109
lib_A51C::func_9498(param_00)
{
}

//Function Number: 110
lib_A51C::func_269A()
{
}