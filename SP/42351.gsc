/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42351.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 54
 * Decompile Time: 8 ms
 * Timestamp: 4/20/2022 8:23:22 PM
*******************************************************************/

//Function Number: 1
lib_A56F::func_0C16(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return;
	}

	if(isarray(param_00))
	{
		foreach(var_03 in param_00)
		{
			param_01 = var_03.animation;
			var_03 thread lib_A56F::func_4B52(param_01,self);
		}

		return;
	}

	if(!isdefined(param_01))
	{
		param_01 = param_00.animation;
	}

	param_00 lib_A56F::func_4B52(param_01,self);
}

//Function Number: 2
lib_A56F::func_4B52(param_00,param_01)
{
	self endon("death");
	if(!isdefined(self))
	{
		return;
	}

	if(lib_A56F::func_50B6(param_00))
	{
		if(isalive(self) && self.var_567D == "generic")
		{
			param_01 lib_A506::func_BCE(self,param_00,"stop_loop");
		}
		else if(isalive(self))
		{
			param_01 lib_A506::func_BE1(self,param_00,"stop_loop");
		}
	}
	else if(isalive(self) && isdefined(self.animname) && self.animname != "generic")
	{
		param_01 lib_A506::func_C24(self,param_00);
	}
	else if(isalive(self))
	{
		param_01 lib_A506::func_BC9(self,param_00);
	}

	self notify("anim_simple_done",param_00);
}

//Function Number: 3
lib_A56F::func_50B6(param_00)
{
	if(lib_A56F::func_50B7(param_00,"generic"))
	{
		return 1;
	}
	else if(isdefined(self.animname) && lib_A56F::func_50B7(param_00,self.animname))
	{
		return 1;
	}

	return 0;
}

//Function Number: 4
lib_A56F::func_50B7(param_00,param_01)
{
	if(isarray(level.var_78A9[param_01]))
	{
		if(isarray(level.var_78A9[param_01][param_00]))
		{
			if(isdefined(level.var_78A9[param_01][param_00][0]))
			{
				self.var_567D = param_01;
				return 1;
			}
		}
	}

	return 0;
}

//Function Number: 5
lib_A56F::func_6212(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		level notify(param_01);
		return;
	}

	if(isarray(param_00))
	{
		while(isdefined(param_00) && param_00.size > 0)
		{
			param_00 = lib_A59A::func_CFF(param_00);
			param_00 = common_scripts\utility::array_removeundefined(param_00);
			wait 0.05;
		}
	}
	else
	{
		param_00 waittill("death");
	}

	level notify(param_01);
}

//Function Number: 6
lib_A56F::func_43CC(param_00,param_01,param_02)
{
	var_03 = gettime() * 0.001;
	while(self.var_2E6[2] > param_01[2])
	{
		var_04 = param_02 * 0.5;
		var_05 = 1 * var_04 / 2;
		var_06 = gettime() * 0.001 - var_03;
		self.var_2E6 = self.var_2E6 + (0,0,var_05 * var_06 - 0.5 * var_04 * squared(var_06));
		wait 0.05;
	}
}

//Function Number: 7
lib_A56F::func_43CD(param_00,param_01,param_02)
{
	var_03 = param_02 * 0.5;
	var_04 = 1;
	var_05 = gettime() * 0.001 - param_00;
	var_06 = var_04 * var_05 - 0.5 * var_03 * squared(var_05);
	return (0,0,var_06);
}

//Function Number: 8
lib_A56F::func_43CB(param_00,param_01,param_02,param_03,param_04)
{
	self endon("death");
	var_05 = gettime() * 0.001;
	if(isdefined(self) && !isdefined(self.var_C9C))
	{
		self.var_C9C = 0;
	}

	while(isdefined(self) && gettime() * 0.001 <= var_05 + param_02)
	{
		self.var_556D = self.var_2E6[2];
		self.var_2E6 = lib_A56F::func_0CC1(var_05,param_00,param_01,param_02,param_03,param_04);
		if(self.var_2E6[2] < self.var_556D)
		{
			self.var_C9C = 1;
		}

		wait(0.05);
	}

	self notify("item_landed");
}

//Function Number: 9
lib_A56F::func_0CC1(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(param_04))
	{
		param_04 = 386;
	}

	if(!isdefined(param_05))
	{
		param_05 = 386;
	}

	var_07 = param_04;
	if(self.var_C9C)
	{
		var_07 = param_05;
	}

	var_08 = var_07 * 0.5;
	param_06 = param_03 * var_08 / 2;
	var_09 = gettime() * 0.001 - param_00;
	var_0A = param_06 * var_09 - 0.5 * var_08 * squared(var_09);
	var_0B = lib_A59A::func_5768(var_09 / param_03,param_01,param_02) + (0,0,var_0A);
	return var_0B;
}

//Function Number: 10
lib_A56F::func_0C3C(param_00,param_01,param_02)
{
	if(isdefined(param_00))
	{
		param_00 lib_A59A::func_C3D();
	}

	lib_A59A::func_C3D();
	if(isdefined(param_00))
	{
		param_00 notify("stop_first_frame");
	}

	self notify("stop_first_frame");
	if(isdefined(param_02) && param_02 && isdefined(param_00))
	{
		param_00 delete();
	}
}

//Function Number: 11
lib_A56F::func_311E(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = [self];
	}

	foreach(var_02 in param_00)
	{
		if(isdefined(var_02.var_588C) && var_02.var_588C > 0)
		{
			var_02.var_588C = 0;
		}

		if(isdefined(var_02.var_5877) && var_02.var_5877.size > 0)
		{
			var_02.var_5877 = [];
		}
	}
}

//Function Number: 12
lib_A56F::func_735C()
{
	if(isdefined(level.var_24EC))
	{
		level.var_24EC destroy();
	}
}

//Function Number: 13
lib_A56F::func_4849()
{
	if(isdefined(level.var_24EC))
	{
		level.var_24EC.alpha = 0;
	}
}

//Function Number: 14
lib_A56F::func_0C17(param_00,param_01,param_02)
{
	level waittill(param_02);
	if(isdefined(param_00.animname) && param_00.animname != "generic")
	{
		param_00 lib_A506::func_7F23();
	}

	lib_A56F::func_0C16(param_00,param_01);
}

//Function Number: 15
lib_A56F::func_51FB(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(param_00.health < 1)
	{
		return 0;
	}

	return 1;
}

//Function Number: 16
lib_A56F::func_A302(param_00,param_01,param_02)
{
	var_03 = self;
	if(!isplayer(var_03))
	{
		var_03 = level.var_31D;
	}

	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	var_04 = newclienthudelem(var_03);
	var_04 setshader("white",1280,720);
	var_04.horzalign = "fullscreen";
	var_04.vertalign = "fullscreen";
	var_04.alpha = param_02;
	wait(param_00);
	var_04 fadeovertime(param_01);
	var_04.alpha = 0;
}

//Function Number: 17
lib_A56F::func_35E8(param_00,param_01,param_02,param_03)
{
	var_04 = self;
	if(!isplayer(var_04))
	{
		var_04 = level.var_31D;
	}

	var_04.var_1171 = newclienthudelem(var_04);
	var_04.var_1171 setshader("black",1280,720);
	var_04.var_1171.horzalign = "fullscreen";
	var_04.var_1171.vertalign = "fullscreen";
	var_04.var_1171.alpha = param_02;
	wait(param_00);
	var_04.var_1171 fadeovertime(param_01);
	var_04.var_1171.alpha = param_03;
}

//Function Number: 18
lib_A56F::func_23D4(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(issplitscreen())
	{
		param_00 = param_00 + 2;
	}

	var_07 = undefined;
	if(isdefined(param_03))
	{
		var_07 = lib_A56F::func_3E3E(-60,undefined,param_03,1,param_04,param_05);
	}
	else
	{
		var_07 = lib_A56F::func_3E3E(-60,undefined,undefined,1,param_04,param_05);
	}

	var_08 = var_07 lib_A56F::func_4ADB(param_00,param_01);
	var_08.label = param_02;
	return var_08;
}

//Function Number: 19
lib_A56F::func_3E3E(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	var_06 = undefined;
	if(!level.console)
	{
		var_06 = -250;
	}
	else if(!isdefined(param_00))
	{
		var_06 = -225;
	}
	else
	{
		var_06 = param_00;
	}

	if(param_03)
	{
		var_06 = param_00;
	}

	if(!isdefined(param_01))
	{
		var_07 = 100;
	}
	else
	{
		var_07 = param_02;
	}

	if(isdefined(param_02))
	{
		var_08 = newclienthudelem(param_02);
	}
	else
	{
		var_08 = newhudelem();
	}

	if(!isdefined(param_04))
	{
		param_04 = (0.8,1,0.8);
	}

	if(!isdefined(param_05))
	{
		param_05 = (0.3,0.6,0.3);
	}

	var_08.alignx = "left";
	var_08.aligny = "middle";
	var_08.horzalign = "right";
	var_08.vertalign = "top";
	var_08.x = var_06;
	var_08.y = var_07;
	var_08.var_18C = 1.6;
	var_08.color = param_04;
	var_08.font = "objective";
	var_08.glowcolor = param_05;
	var_08.glowalpha = 1;
	var_08.foreground = 1;
	var_08.hidewheninmenu = 0;
	var_08.var_1EC = 1;
	return var_08;
}

//Function Number: 20
lib_A56F::func_4ADB(param_00,param_01)
{
	self.alignx = "center";
	self.aligny = "top";
	self.horzalign = "center";
	self.vertalign = "middle";
	self.x = param_01;
	self.y = -160 + 15 * param_00;
	self.font = "objective";
	self.foreground = 1;
	self.hidewheninmenu = 1;
	self.var_1EC = 1;
	self.fontscale = 2;
	self.var_18C = 1.15;
	return self;
}

//Function Number: 21
lib_A56F::func_8954(param_00)
{
	if(!isdefined(level.var_5E4E))
	{
		level.var_5E4E = [];
	}

	var_01 = common_scripts\utility::spawn_tag_origin();
	var_01 lib_A56F::func_0B9A(self);
	if(isdefined(param_00))
	{
		var_01.var_90B8 = param_00;
	}

	level.var_5E4E[level.var_5E4E.size] = var_01;
	level.var_5E4E = common_scripts\utility::array_removeundefined(level.var_5E4E);
	iprintln(level.var_5E4E.size);
	return var_01;
}

//Function Number: 22
lib_A56F::func_7368(param_00)
{
	if(isdefined(level.var_5E4E))
	{
		var_01 = 0;
		foreach(var_03 in level.var_5E4E)
		{
			if(isdefined(var_03.var_90B8) && var_03.var_90B8 == param_00)
			{
				var_03 delete();
				var_01++;
			}
		}

		iprintln(var_01);
	}
}

//Function Number: 23
lib_A56F::func_0B9A(param_00)
{
	if(isdefined(param_00.var_2E6))
	{
		self.var_2E6 = param_00.var_2E6;
	}

	if(isdefined(param_00.var_41))
	{
		self.var_41 = param_00.var_41;
	}
}

//Function Number: 24
lib_A56F::func_0CE0(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	var_09 = common_scripts\utility::array_combine(param_00,param_01);
	if(isdefined(param_02))
	{
		var_09 = common_scripts\utility::array_combine(var_09,param_02);
	}

	if(isdefined(param_03))
	{
		var_09 = common_scripts\utility::array_combine(var_09,param_03);
	}

	if(isdefined(param_04))
	{
		var_09 = common_scripts\utility::array_combine(var_09,param_04);
	}

	if(isdefined(param_05))
	{
		var_09 = common_scripts\utility::array_combine(var_09,param_05);
	}

	if(isdefined(param_06))
	{
		var_09 = common_scripts\utility::array_combine(var_09,param_06);
	}

	if(isdefined(param_07))
	{
		var_09 = common_scripts\utility::array_combine(var_09,param_07);
	}

	if(isdefined(param_08))
	{
		var_09 = common_scripts\utility::array_combine(var_09,param_08);
	}

	return var_09;
}

//Function Number: 25
lib_A56F::func_56A8(param_00,param_01,param_02,param_03)
{
	self endon("death");
	var_04 = distance(param_00,self.var_2E6);
	var_05 = 0;
	var_06 = self.var_2E6;
	while(var_05 < var_04)
	{
		var_07 = lib_A56F::func_3FFC(self.var_2E6,param_00,param_01,param_02);
		if(var_07 == 0)
		{
			break;
		}

		self.var_2E6 = vectorlerp(self.var_2E6,param_00,var_07);
		if(isdefined(param_03))
		{
			self.var_41 = self.var_41 + param_03;
		}

		var_05 = distance(self.var_2E6,var_06);
		wait 0.05;
	}

	self notify("lerp_complete");
}

//Function Number: 26
lib_A56F::func_3FFC(param_00,param_01,param_02,param_03)
{
	var_04 = distance(param_00,param_01);
	if(param_02 == 0 || var_04 == 0)
	{
		return 0;
	}

	var_05 = param_02 / var_04 * 0.05;
	if(var_05 > 0)
	{
		return var_05;
	}

	return 0;
}

//Function Number: 27
lib_A56F::func_407D(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_03))
	{
		param_03 = 1;
	}

	if(!isdefined(param_04))
	{
		var_05 = 10;
		var_06 = 20;
		var_07 = 30;
	}
	else
	{
		var_05 = var_07;
		var_06 = var_06 + 10;
		var_07 = var_05 + 20;
	}

	var_08 = (function_00FE(gettime() * 0.001 * 0.05,var_05,param_00,param_01,param_02) * param_03,function_00FE(gettime() * 0.001 * 0.05,var_06,param_00,param_01,param_02) * param_03,function_00FE(gettime() * 0.001 * 0.05,var_07,param_00,param_01,param_02) * param_03);
	return var_08;
}

//Function Number: 28
lib_A56F::func_0B9D(param_00)
{
	if(isdefined(param_00.var_2E6))
	{
		self.var_2E6 = param_00.var_2E6;
	}

	if(isdefined(param_00.var_41))
	{
		self.var_41 = param_00.var_41;
	}
}

//Function Number: 29
lib_A56F::func_27FB()
{
	self waittill("goal");
	self delete();
}

//Function Number: 30
lib_A56F::func_2800()
{
	if(!isdefined(self))
	{
		return;
	}

	self delete();
}

//Function Number: 31
lib_A56F::func_67C3(param_00)
{
	if(randomint(100) <= param_00)
	{
		return 1;
	}

	return 0;
}

//Function Number: 32
lib_A56F::func_072C(param_00)
{
	if(!isdefined(self.count) || self.count < 1)
	{
		self.count = 1;
	}

	var_01 = lib_A59A::func_88BD(1);
	lib_A59A::func_88EB(var_01);
	if(isdefined(param_00))
	{
		while(!isdefined(var_01))
		{
			self.count = 1;
			var_01 = lib_A59A::func_88BD(1);
			lib_A59A::func_88EB(var_01);
			wait 0.05;
		}
	}

	return var_01;
}

//Function Number: 33
lib_A56F::func_88E6(param_00,param_01,param_02)
{
	if(isarray(param_01))
	{
		var_03 = param_01;
	}
	else
	{
		param_00[0] = param_02;
	}

	var_04 = [];
	for(var_05 = 0;var_05 < param_00;var_05++)
	{
		var_06 = common_scripts\utility::random(var_03);
		var_07 = var_06 lib_A56F::func_072C();
		if(!isdefined(var_07))
		{
			continue;
		}

		if(isdefined(param_02))
		{
			var_07 method_81A9(param_02);
		}

		var_04[var_04.size] = var_07;
		wait(0.1);
	}

	return var_04;
}

//Function Number: 34
lib_A56F::func_97FE(param_00,param_01)
{
	lib_A56F::func_A0B9(param_00);
	if(!isdefined(param_01))
	{
		param_01 = param_00;
	}

	level notify(param_01);
}

//Function Number: 35
lib_A56F::func_8EE3(param_00,param_01,param_02,param_03)
{
	self waittill(param_03);
	if(isdefined(param_01))
	{
		stopfxontag(param_00,param_01,param_02);
	}
}

//Function Number: 36
lib_A56F::func_8EE5(param_00,param_01,param_02,param_03)
{
	wait(param_03);
	if(isdefined(param_01))
	{
		stopfxontag(param_00,param_01,param_02);
	}
}

//Function Number: 37
lib_A56F::func_A0B9(param_00)
{
	var_01 = getent(param_00,"targetname");
	if(!isdefined(var_01))
	{
		var_01 = getent(param_00,"script_noteworthy");
	}

	if(!isdefined(var_01))
	{
		return;
	}

	var_01 waittill("trigger");
}

//Function Number: 38
lib_A56F::func_4BFB(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = 300;
	}

	var_04 = [];
	foreach(var_06 in param_00)
	{
		if(distance(var_06.var_2E6,param_02) < param_01)
		{
			var_04[var_04.size] = var_06;
		}
	}

	if(var_04.size <= 0)
	{
		return;
	}

	var_04 = sortbydistance(var_04,param_02);
	var_08 = param_02;
	foreach(var_06 in var_04)
	{
		if(!isdefined(var_06))
		{
			continue;
		}

		if(var_06 lib_A59E::func_51FA())
		{
			var_06 dodamage(var_06.health * 2,param_02);
			continue;
		}

		var_0A = distance(var_08,var_06.var_2E6);
		var_0B = var_0A / param_03 * 0.05;
		wait(var_0B);
		var_08 = var_06.var_2E6;
		var_0C = vectornormalize(var_06 gettagorigin("tag_eye") - param_02);
		var_0C = vectornormalize(var_0C + (0,0,0.2));
		var_06 method_8024("torso_lower",var_0C * 7000);
		var_06 thread common_scripts\utility::delaycall(2,::method_8052);
	}
}

//Function Number: 39
lib_A56F::func_888D(param_00,param_01)
{
	return sortbydistance(param_00,param_01,0,1);
}

//Function Number: 40
lib_A56F::func_7E14(param_00)
{
	if(!lib_A59A::func_32DB(param_00))
	{
		lib_A59A::func_32DC(param_00);
	}

	self waittill(param_00);
	lib_A59A::func_32D7(param_00);
}

//Function Number: 41
lib_A56F::func_97FD(param_00,param_01)
{
	if(!common_scripts\utility::flag_exist(param_01))
	{
		common_scripts\utility::flag_init(param_01);
	}

	var_02 = getentarray(param_00,"targetname");
	var_02[0] waittill("trigger");
	common_scripts\utility::flag_set(param_01);
}

//Function Number: 42
lib_A56F::func_3852(param_00,param_01)
{
	var_02 = randomfloat(1000);
	var_03 = "flag_or_timeout" + var_02;
	level endon(var_03);
	level thread lib_A59A::func_61FA(var_03,param_01);
	common_scripts\utility::flag_wait(param_00);
}

//Function Number: 43
lib_A56F::func_536E()
{
	self endon("death");
	self waittill("bad_path");
	if(!isdefined(self.var_27F1) || !self.var_27F1)
	{
		self method_8052();
	}
}

//Function Number: 44
lib_A56F::func_6379(param_00,param_01,param_02)
{
	var_03 = self gettagangles(param_01);
	var_04 = self gettagorigin(param_01);
	if(param_00 == "up")
	{
		return var_04 + anglestoup(var_03) * param_02;
	}

	if(param_00 == "down")
	{
		return var_04 + anglestoup(var_03) * param_02 * -1;
	}

	if(param_00 == "right")
	{
		return var_04 + anglestoright(var_03) * param_02;
	}

	if(param_00 == "left")
	{
		return var_04 + anglestoright(var_03) * param_02 * -1;
	}

	if(param_00 == "forward")
	{
		return var_04 + anglestoforward(var_03) * param_02;
	}

	if(param_00 == "backward")
	{
		return var_04 + anglestoforward(var_03) * param_02 * -1;
	}

	if(param_00 == "backwardright")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02;
		return var_04 + anglestoforward(var_03) * param_02 * -1;
	}

	if(param_00 == "backwardleft")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02 * -1;
		return var_04 + anglestoforward(var_03) * param_02 * -1;
	}

	if(param_00 == "forwardright")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02 * 1;
		return var_04 + anglestoforward(var_03) * param_02;
	}

	if(param_00 == "forwardleft")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02 * -1;
		return var_04 + anglestoforward(var_03) * param_02;
	}
}

//Function Number: 45
lib_A56F::func_3F33(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 500000;
	}

	var_03 = undefined;
	foreach(var_05 in param_01)
	{
		if(!isdefined(var_05))
		{
			continue;
		}

		var_06 = distance(var_05.var_2E6,param_00);
		if(var_06 >= param_02)
		{
			continue;
		}

		param_02 = var_06;
		var_03 = var_05;
	}

	return var_03;
}

//Function Number: 46
lib_A56F::func_4120(param_00,param_01)
{
	var_02 = getent(param_00,param_01);
	if(isdefined(var_02))
	{
		return var_02;
	}

	var_02 = common_scripts\utility::getstruct(param_00,param_01);
	if(isdefined(var_02))
	{
		return var_02;
	}

	var_02 = getnode(param_00,param_01);
	if(isdefined(var_02))
	{
		return var_02;
	}

	var_02 = vehpath_getnode(param_00,param_01);
	if(isdefined(var_02))
	{
		return var_02;
	}
}

//Function Number: 47
lib_A56F::func_4121(param_00,param_01)
{
	var_02 = getentarray(param_00,param_01);
	if(var_02.size > 0)
	{
		return var_02;
	}

	var_02 = common_scripts\utility::getstructarray(param_00,param_01);
	if(var_02.size > 0)
	{
		return var_02;
	}

	var_02 = getnodearray(param_00,param_01);
	if(var_02.size > 0)
	{
		return var_02;
	}

	var_02 = vehpath_getnodearray(param_00,param_01);
	if(var_02.size > 0)
	{
		return var_02;
	}
}

//Function Number: 48
lib_A56F::func_5913(param_00)
{
	var_01 = lib_A577::func_89BB(param_00);
	var_01.animname = "generic";
	var_01 lib_A59A::func_445F();
	return var_01;
}

//Function Number: 49
lib_A56F::func_4FAC(param_00,param_01)
{
	if(!isdefined(level.var_31D.var_8F7F))
	{
		level.var_31D.var_8F7F = [];
		level.var_8F7E = 0;
	}

	var_02 = newclienthudelem(level.var_31D);
	var_02.x = 320;
	var_02.y = 325;
	var_02.alignx = "center";
	var_02.aligny = "middle";
	var_02.var_18C = 1.5;
	var_02 settext(param_00);
	var_02.alpha = 0;
	var_02.color = (1,1,1);
	var_02.glowcolor = (0.6,0.6,0.9);
	var_02.glowalpha = 0.4;
	var_02.fontscale = -10;
	var_02.font = "objective";
	level.var_31D.var_8F7F[level.var_31D.var_8F7F.size] = var_02;
	level notify("new_subtitle_created");
	level.var_31D thread lib_A56F::func_2837(10,var_02,level.var_8F7E);
	level.var_31D thread lib_A56F::func_84EC(var_02,level.var_8F7E);
	level.var_8F7E = level.var_8F7E + 1 % 10;
	if(isdefined(param_01))
	{
		wait(param_01);
	}
}

//Function Number: 50
lib_A56F::func_84EC(param_00,param_01)
{
	var_02 = "delete_subtitle_hud" + param_01;
	var_03 = 0;
	var_04 = 19;
	param_00 fadeovertime(0.5);
	param_00.alpha = 1;
	level endon(var_02);
	while(isdefined(param_00))
	{
		level waittill("new_subtitle_created");
		var_03++;
		if(!isdefined(param_00))
		{
			break;
		}

		param_00 moveovertime(0.35);
		param_00.y = 325 + var_03 * var_04;
		param_00.color = (1,1,1);
		param_00.glowalpha = 0;
		param_00.alpha = 0.9 - var_03 / 5;
		wait 0.05;
	}
}

//Function Number: 51
lib_A56F::func_2837(param_00,param_01,param_02)
{
	var_03 = "delete_subtitle_hud" + param_02;
	level thread lib_A59A::func_61FA(var_03,param_00);
	level waittill(var_03);
	self.var_8F7F = common_scripts\utility::array_remove(self.var_8F7F,param_01);
	param_01 destroy();
}

//Function Number: 52
lib_A56F::func_21A0(param_00)
{
	return param_00 / 255;
}

//Function Number: 53
lib_A56F::func_3E6D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	var_0A = param_00;
	var_0B = param_05 * param_02 + param_01;
	if(!isdefined(param_06))
	{
		param_06 = (0.8,1,0.8);
	}

	if(!isdefined(param_07))
	{
		param_07 = (param_06[0] / 2,param_06[1] / 2,param_06[2] / 2);
	}

	if(!isdefined(param_03))
	{
		param_03 = "center";
	}

	if(!isdefined(param_04))
	{
		param_04 = "middle";
	}

	if(!isdefined(param_08))
	{
		param_08 = "center";
	}

	if(!isdefined(param_09))
	{
		param_09 = "middle";
	}

	var_0C = newclienthudelem(level.var_31D);
	var_0C.alignx = param_03;
	var_0C.aligny = param_04;
	var_0C.horzalign = param_08;
	var_0C.vertalign = param_09;
	var_0C.x = var_0A;
	var_0C.y = var_0B;
	var_0C.var_18C = 1.6;
	var_0C.color = param_06;
	var_0C.font = "objective";
	var_0C.glowcolor = param_07;
	var_0C.glowalpha = 1;
	var_0C.foreground = 1;
	var_0C.hidewheninmenu = 1;
	var_0C.var_1EC = 1;
	return var_0C;
}

//Function Number: 54
lib_A56F::func_621B(param_00,param_01,param_02,param_03)
{
	param_00 waittill(param_01);
	param_02 notify(param_03);
}