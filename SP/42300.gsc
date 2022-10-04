/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42300.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 42
 * Decompile Time: 12 ms
 * Timestamp: 4/20/2022 8:23:17 PM
*******************************************************************/

//Function Number: 1
lib_A53C::setparent(param_00)
{
	if(isdefined(self.parent) && self.parent == param_00)
	{
		return;
	}

	if(isdefined(self.parent))
	{
		self.parent lib_A53C::removechild(self);
	}

	self.parent = param_00;
	self.parent lib_A53C::addchild(self);
	if(isdefined(self.point))
	{
		lib_A53C::setpoint(self.point,self.relativepoint,self.xoffset,self.yoffset);
		return;
	}

	lib_A53C::setpoint("TOPLEFT");
}

//Function Number: 2
lib_A53C::getparent()
{
	return self.parent;
}

//Function Number: 3
lib_A53C::func_739A()
{
	if(isdefined(self.var_1D3C) && self.var_1D3C == gettime())
	{
		return;
	}

	self.var_1D3C = gettime();
	var_00 = [];
	foreach(var_02 in self.children)
	{
		if(!isdefined(var_02))
		{
			continue;
		}

		var_02.index = var_00.size;
		var_00[var_00.size] = var_02;
	}

	self.children = var_00;
}

//Function Number: 4
lib_A53C::addchild(param_00)
{
	param_00.index = self.children.size;
	self.children[self.children.size] = param_00;
	lib_A53C::func_739A();
}

//Function Number: 5
lib_A53C::removechild(param_00)
{
	param_00.parent = undefined;
	if(self.children[self.children.size - 1] != param_00)
	{
		self.children[param_00.index] = self.children[self.children.size - 1];
		self.children[param_00.index].index = param_00.index;
	}

	self.children[self.children.size - 1] = undefined;
	param_00.index = undefined;
}

//Function Number: 6
lib_A53C::setpoint(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_04))
	{
		param_04 = 0;
	}

	var_05 = lib_A53C::getparent();
	if(param_04)
	{
		self moveovertime(param_04);
	}

	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	self.xoffset = param_02;
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	self.yoffset = param_03;
	self.point = param_00;
	self.alignx = "center";
	self.aligny = "middle";
	if(issubstr(param_00,"TOP"))
	{
		self.aligny = "top";
	}

	if(issubstr(param_00,"BOTTOM"))
	{
		self.aligny = "bottom";
	}

	if(issubstr(param_00,"LEFT"))
	{
		self.alignx = "left";
	}

	if(issubstr(param_00,"RIGHT"))
	{
		self.alignx = "right";
	}

	if(!isdefined(param_01))
	{
		param_01 = param_00;
	}

	self.relativepoint = param_01;
	var_06 = "center";
	var_07 = "middle";
	if(issubstr(param_01,"TOP"))
	{
		var_07 = "top";
	}

	if(issubstr(param_01,"BOTTOM"))
	{
		var_07 = "bottom";
	}

	if(issubstr(param_01,"LEFT"))
	{
		var_06 = "left";
	}

	if(issubstr(param_01,"RIGHT"))
	{
		var_06 = "right";
	}

	if(var_05 == level.uiparent)
	{
		self.horzalign = var_06;
		self.vertalign = var_07;
	}
	else
	{
		self.horzalign = var_05.horzalign;
		self.vertalign = var_05.vertalign;
	}

	if(var_06 == var_05.alignx)
	{
		var_08 = 0;
		var_09 = 0;
	}
	else if(var_08 == "center" || var_07.alignx == "center")
	{
		var_08 = int(var_07.width / 2);
		if(var_07 == "left" || var_06.alignx == "right")
		{
			var_09 = -1;
		}
		else
		{
			var_09 = 1;
		}
	}
	else
	{
		var_08 = var_07.width;
		if(var_07 == "left")
		{
			var_09 = -1;
		}
		else
		{
			var_09 = 1;
		}
	}

	self.x = var_05.x + var_08 * var_09;
	if(var_07 == var_05.aligny)
	{
		var_0A = 0;
		var_0B = 0;
	}
	else if(var_09 == "middle" || var_07.aligny == "middle")
	{
		var_0A = int(var_07.height / 2);
		if(var_08 == "top" || var_06.aligny == "bottom")
		{
			var_0B = -1;
		}
		else
		{
			var_0B = 1;
		}
	}
	else
	{
		var_0A = var_07.height;
		if(var_08 == "top")
		{
			var_0B = -1;
		}
		else
		{
			var_0B = 1;
		}
	}

	self.y = var_05.y + var_0A * var_0B;
	self.x = self.x + self.xoffset;
	self.y = self.y + self.yoffset;
	switch(self.elemtype)
	{
		case "bar":
			break;
	}
}

//Function Number: 7
lib_A53C::setpointbar(param_00,param_01,param_02,param_03)
{
	self.bar.horzalign = self.horzalign;
	self.bar.vertalign = self.vertalign;
	self.bar.alignx = "left";
	self.bar.aligny = self.aligny;
	self.bar.y = self.y;
	if(self.alignx == "left")
	{
		self.bar.x = self.x + self.var_A39A;
	}
	else if(self.alignx == "right")
	{
		self.bar.x = self.x - self.width - self.var_A39A;
	}
	else
	{
		self.bar.x = self.x - int(self.width - self.var_A39A * 2 / 2);
	}

	lib_A53C::updatebar(self.bar.frac);
}

//Function Number: 8
lib_A53C::updatebar(param_00)
{
	var_01 = int(self.width - self.var_A39A * 2 * param_00);
	if(!var_01)
	{
		var_01 = 1;
	}

	self.bar.frac = param_00;
	self.bar setshader(self.bar.shader,var_01,self.height - self.var_A3B4 * 2);
}

//Function Number: 9
lib_A53C::func_486B(param_00)
{
	param_00 = common_scripts\utility::ter_op(isdefined(param_00),param_00,1);
	if(param_00 || !isdefined(self.var_6588) || !isdefined(self.bar.var_6588))
	{
		self.var_6588 = self.alpha;
		self.bar.var_6588 = self.bar.alpha;
	}

	self.alpha = common_scripts\utility::ter_op(param_00,0,self.var_6588);
	self.bar.alpha = common_scripts\utility::ter_op(param_00,0,self.bar.var_6588);
}

//Function Number: 10
lib_A53C::createfontstring(param_00,param_01)
{
	var_02 = newhudelem();
	var_02.elemtype = "font";
	var_02.font = param_00;
	var_02.var_18C = param_01;
	var_02.x = 0;
	var_02.y = 0;
	var_02.width = 0;
	var_02.height = int(level.fontheight * param_01);
	var_02.xoffset = 0;
	var_02.yoffset = 0;
	var_02.children = [];
	var_02 lib_A53C::setparent(level.uiparent);
	return var_02;
}

//Function Number: 11
lib_A53C::func_23ED(param_00,param_01)
{
	var_02 = newclienthudelem(self);
	var_02.elemtype = "font";
	var_02.font = param_00;
	var_02.var_18C = param_01;
	var_02.x = 0;
	var_02.y = 0;
	var_02.width = 0;
	var_02.height = int(level.fontheight * param_01);
	var_02.xoffset = 0;
	var_02.yoffset = 0;
	var_02.children = [];
	var_02 lib_A53C::setparent(level.uiparent);
	return var_02;
}

//Function Number: 12
lib_A53C::func_23F1(param_00,param_01)
{
	var_02 = newclienthudelem(self);
	var_02.elemtype = "timer";
	var_02.font = param_00;
	var_02.var_18C = param_01;
	var_02.x = 0;
	var_02.y = 0;
	var_02.width = 0;
	var_02.height = int(level.fontheight * param_01);
	var_02.xoffset = 0;
	var_02.yoffset = 0;
	var_02.children = [];
	var_02 lib_A53C::setparent(level.uiparent);
	return var_02;
}

//Function Number: 13
lib_A53C::createserverfontstring(param_00,param_01)
{
	var_02 = newhudelem();
	var_02.elemtype = "font";
	var_02.font = param_00;
	var_02.var_18C = param_01;
	var_02.x = 0;
	var_02.y = 0;
	var_02.width = 0;
	var_02.height = int(level.fontheight * param_01);
	var_02.xoffset = 0;
	var_02.yoffset = 0;
	var_02.children = [];
	var_02 lib_A53C::setparent(level.uiparent);
	return var_02;
}

//Function Number: 14
lib_A53C::createservertimer(param_00,param_01)
{
	var_02 = newhudelem();
	var_02.elemtype = "timer";
	var_02.font = param_00;
	var_02.var_18C = param_01;
	var_02.x = 0;
	var_02.y = 0;
	var_02.width = 0;
	var_02.height = int(level.fontheight * param_01);
	var_02.xoffset = 0;
	var_02.yoffset = 0;
	var_02.children = [];
	var_02 lib_A53C::setparent(level.uiparent);
	return var_02;
}

//Function Number: 15
lib_A53C::createicon(param_00,param_01,param_02)
{
	var_03 = newhudelem();
	return lib_A53C::func_2421(var_03,param_00,param_01,param_02);
}

//Function Number: 16
lib_A53C::func_23EF(param_00,param_01,param_02)
{
	var_03 = newclienthudelem(self);
	return lib_A53C::func_2421(var_03,param_00,param_01,param_02);
}

//Function Number: 17
lib_A53C::func_2421(param_00,param_01,param_02,param_03)
{
	param_00.elemtype = "icon";
	param_00.x = 0;
	param_00.y = 0;
	param_00.width = param_02;
	param_00.height = param_03;
	param_00.xoffset = 0;
	param_00.yoffset = 0;
	param_00.children = [];
	param_00 lib_A53C::setparent(level.uiparent);
	if(isdefined(param_01))
	{
		param_00 setshader(param_01,param_02,param_03);
	}

	return param_00;
}

//Function Number: 18
lib_A53C::createbar(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_00))
	{
		param_00 = "white";
	}

	if(!isdefined(param_01))
	{
		param_01 = "black";
	}

	if(!isdefined(param_02))
	{
		param_02 = 100;
	}

	if(!isdefined(param_03))
	{
		param_03 = 9;
	}

	var_05 = newhudelem();
	var_05.x = 2;
	var_05.y = 2;
	var_05.frac = 0.25;
	var_05.shader = param_00;
	var_05.fontscale = -1;
	var_05 setshader(param_00,param_02 - 2,param_03 - 2);
	if(isdefined(param_04))
	{
		var_05.flashfrac = param_04;
		var_05 thread lib_A53C::flashthread();
	}

	var_06 = newhudelem();
	var_06.elemtype = "bar";
	var_06.x = 0;
	var_06.y = 0;
	var_06.width = param_02;
	var_06.height = param_03;
	var_06.xoffset = 0;
	var_06.yoffset = 0;
	var_06.bar = var_05;
	var_06.children = [];
	var_06.var_6645 = 2;
	var_06.fontscale = -2;
	var_06.alpha = 0.5;
	var_06 lib_A53C::setparent(level.uiparent);
	var_06 setshader(param_01,param_02,param_03);
	return var_06;
}

//Function Number: 19
lib_A53C::func_23F0(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	param_00 = common_scripts\utility::ter_op(isdefined(param_00),param_00,level.var_31D);
	param_01 = common_scripts\utility::ter_op(isdefined(param_01),param_01,90);
	param_02 = common_scripts\utility::ter_op(isdefined(param_02),param_02,"white");
	param_03 = common_scripts\utility::ter_op(isdefined(param_03),param_03,"black");
	param_04 = common_scripts\utility::ter_op(isdefined(param_04),param_04,100);
	param_05 = common_scripts\utility::ter_op(isdefined(param_05),param_05,9);
	param_06 = common_scripts\utility::ter_op(isdefined(param_06),param_06,2);
	param_07 = common_scripts\utility::ter_op(isdefined(param_07),param_07,2);
	var_08 = param_00 lib_A53C::func_23EC(param_02,param_03,param_04,param_05,undefined,param_06,param_07);
	var_08 lib_A53C::setpoint("CENTER",undefined,0,param_01);
	return var_08;
}

//Function Number: 20
lib_A53C::func_23EC(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(param_05))
	{
		param_05 = 2;
	}

	if(!isdefined(param_06))
	{
		param_06 = 2;
	}

	var_07 = newclienthudelem(self);
	var_07.x = 0 - param_05;
	var_07.y = 0 - param_06;
	var_07.frac = 0.25;
	var_07.shader = param_00;
	var_07.fontscale = -1;
	var_07 setshader(param_00,param_02 - param_05 * 2,param_03 - param_06 * 2);
	if(isdefined(param_04))
	{
		var_07.flashfrac = param_04;
		var_07 thread lib_A53C::flashthread();
	}

	var_08 = newclienthudelem(self);
	var_08.elemtype = "bar";
	var_08.x = 0;
	var_08.y = 0;
	var_08.width = param_02;
	var_08.height = param_03;
	var_08.xoffset = -1 * param_05;
	var_08.yoffset = 0;
	var_08.bar = var_07;
	var_08.children = [];
	var_08.var_A39A = param_05;
	var_08.var_A3B4 = param_06;
	var_08.fontscale = -2;
	var_08.alpha = 0.5;
	var_08 lib_A53C::setparent(level.uiparent);
	var_08 setshader(param_01,param_02,param_03);
	return var_08;
}

//Function Number: 21
lib_A53C::setflashfrac(param_00)
{
	self.bar.flashfrac = param_00;
}

//Function Number: 22
lib_A53C::func_35E6(param_00,param_01)
{
	if(isdefined(param_01) && param_01 > 0)
	{
		self fadeovertime(param_01);
	}

	self.alpha = param_00;
	if(isdefined(param_01) && param_01 > 0)
	{
		wait(param_01);
	}
}

//Function Number: 23
lib_A53C::flashthread()
{
	self endon("death");
	self.alpha = 1;
	for(;;)
	{
		if(self.frac >= self.flashfrac)
		{
			self fadeovertime(0.3);
			self.alpha = 0.2;
			wait(0.35);
			self fadeovertime(0.3);
			self.alpha = 1;
			wait(0.7);
			continue;
		}

		self.alpha = 1;
		wait(0.05);
	}
}

//Function Number: 24
lib_A53C::destroyelem()
{
	if(isdefined(self.children) && self.children.size)
	{
		var_00 = [];
		for(var_01 = 0;var_01 < self.children.size;var_01++)
		{
			var_00[var_01] = self.children[var_01];
		}

		for(var_01 = 0;var_01 < var_00.size;var_01++)
		{
			var_00[var_01] lib_A53C::setparent(lib_A53C::getparent());
		}
	}

	if(isdefined(self.elemtype) && self.elemtype == "bar")
	{
		self.bar destroy();
	}

	self destroy();
}

//Function Number: 25
lib_A53C::seticonshader(param_00)
{
	self setshader(param_00,self.width,self.height);
}

//Function Number: 26
lib_A53C::setwidth(param_00)
{
	self.width = param_00;
}

//Function Number: 27
lib_A53C::setheight(param_00)
{
	self.height = param_00;
}

//Function Number: 28
lib_A53C::setsize(param_00,param_01)
{
	self.width = param_00;
	self.height = param_01;
}

//Function Number: 29
lib_A53C::updatechildren(param_00)
{
	for(var_01 = 0;var_01 < self.children.size;var_01++)
	{
		var_02 = self.children[var_01];
		var_02 lib_A53C::setpoint(var_02.point,var_02.relativepoint,var_02.xoffset,var_02.yoffset,param_00);
	}
}

//Function Number: 30
lib_A53C::func_8AEF(param_00)
{
	if(isdefined(param_00) && param_00 == 0)
	{
		lib_A53C::func_8AEE();
		return;
	}

	if(isdefined(level.var_8AED))
	{
		level.var_8AED destroy();
	}

	function_00D3("hud_showStance","0");
	level.var_8AED = newhudelem();
	level.var_8AED.x = -75;
	if(level.console)
	{
		level.var_8AED.y = -20;
	}
	else
	{
		level.var_8AED.y = -10;
	}

	level.var_8AED setshader("stance_carry",64,64);
	level.var_8AED.alignx = "right";
	level.var_8AED.aligny = "bottom";
	level.var_8AED.horzalign = "right";
	level.var_8AED.vertalign = "bottom";
	level.var_8AED.foreground = 1;
	level.var_8AED.alpha = 0;
	level.var_8AED fadeovertime(0.5);
	level.var_8AED.alpha = 1;
}

//Function Number: 31
lib_A53C::func_8AEE()
{
	if(isdefined(level.var_8AED))
	{
		level.var_8AED fadeovertime(0.5);
		level.var_8AED.alpha = 0;
		level.var_8AED destroy();
	}

	function_00D3("hud_showStance","1");
}

//Function Number: 32
lib_A53C::func_23CB()
{
	if(level.console)
	{
		var_00 = lib_A53C::createfontstring("default",1.8);
		var_00 lib_A53C::setpoint("CENTER",undefined,-23,115);
		var_00 settext(level.var_8F52["mantle"]);
		var_01 = lib_A53C::createicon("hint_mantle",40,40);
		var_01 lib_A53C::setpoint("CENTER",undefined,73,0);
		var_01 lib_A53C::setparent(var_00);
	}
	else
	{
		var_00 = lib_A53C::createfontstring("default",1.6);
		var_01 lib_A53C::setpoint("CENTER",undefined,0,115);
		var_01 settext(level.var_8F52["mantle"]);
		var_01 = lib_A53C::createicon("hint_mantle",40,40);
		var_01 lib_A53C::setpoint("CENTER",undefined,0,30);
		var_01 lib_A53C::setparent(var_00);
	}

	var_01.alpha = 0;
	var_00.alpha = 0;
	level.var_4AC5 = [];
	level.var_4AC5["text"] = var_00;
	level.var_4AC5["icon"] = var_01;
}

//Function Number: 33
lib_A53C::func_3D15(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	var_04 = undefined;
	if(!level.console)
	{
		var_04 = -250;
	}
	else if(!isdefined(param_00))
	{
		var_04 = -225;
	}
	else
	{
		var_04 = param_00;
	}

	if(param_03)
	{
		var_04 = param_00;
	}

	if(!isdefined(param_01))
	{
		var_05 = 100;
	}
	else
	{
		var_05 = param_02;
	}

	if(isdefined(param_02))
	{
		var_06 = newclienthudelem(param_02);
	}
	else
	{
		var_06 = newhudelem();
	}

	var_06.alignx = "left";
	var_06.aligny = "middle";
	var_06.horzalign = "right";
	var_06.vertalign = "top";
	var_06.x = var_04;
	var_06.y = var_05;
	var_06.var_18C = 1.6;
	var_06.color = (0.8,1,0.8);
	var_06.font = "objective";
	var_06.glowcolor = (0.3,0.6,0.3);
	var_06.glowalpha = 1;
	var_06.foreground = 1;
	var_06.hidewheninmenu = 1;
	var_06.var_1EC = 1;
	return var_06;
}

//Function Number: 34
lib_A53C::func_3D45(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	var_04 = undefined;
	if(!level.console)
	{
		var_04 = -250;
	}
	else if(!isdefined(param_00))
	{
		var_04 = -170;
	}
	else
	{
		var_04 = param_00;
	}

	if(param_03)
	{
		var_04 = param_00;
	}

	if(!isdefined(param_01))
	{
		var_05 = 100;
	}
	else
	{
		var_05 = param_02;
	}

	if(isdefined(param_02))
	{
		var_06 = newclienthudelem(param_02);
	}
	else
	{
		var_06 = newhudelem();
	}

	var_06.alignx = "right";
	var_06.aligny = "middle";
	var_06.horzalign = "right";
	var_06.vertalign = "top";
	var_06.x = var_04;
	var_06.y = var_05;
	var_06.var_18C = 1.6;
	var_06.color = (0.8,1,0.8);
	var_06.font = "objective";
	var_06.glowcolor = (0.3,0.6,0.3);
	var_06.glowalpha = 1;
	var_06.foreground = 1;
	var_06.hidewheninmenu = 1;
	var_06.var_1EC = 1;
	return var_06;
}

//Function Number: 35
lib_A53C::func_23A2(param_00,param_01,param_02)
{
	if(isdefined(param_02))
	{
		var_03 = newclienthudelem(param_02);
	}
	else
	{
		var_03 = newhudelem();
	}

	var_03.x = 0;
	var_03.y = 0;
	var_03 setshader(param_00,640,480);
	var_03.alignx = "left";
	var_03.aligny = "top";
	var_03.fontscale = 1;
	var_03.horzalign = "fullscreen";
	var_03.vertalign = "fullscreen";
	var_03.alpha = param_01;
	var_03.foreground = 1;
	return var_03;
}

//Function Number: 36
lib_A53C::func_23A3(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = lib_A59A::func_3E23();
	var_06 = newclienthudelem(var_05);
	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	var_06.x = param_02;
	var_06.y = param_03;
	var_06 setshader(param_00,int(640 * param_04),int(480 * param_04));
	var_06.alignx = "center";
	var_06.aligny = "middle";
	var_06.fontscale = 1;
	var_06.horzalign = "center";
	var_06.vertalign = "middle";
	var_06.alpha = param_01;
	var_06.foreground = 1;
	return var_06;
}

//Function Number: 37
lib_A53C::func_23A4(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = lib_A59A::func_3E23();
	var_06 = newclienthudelem(var_05);
	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	var_06.x = param_02;
	var_06.y = param_03;
	var_06 setshader(param_00,int(640 * param_04),int(480 * param_04));
	var_06.alignx = "center";
	var_06.aligny = "middle";
	var_06.fontscale = 1;
	var_06.horzalign = "fullscreen";
	var_06.vertalign = "fullscreen";
	var_06.alpha = param_01;
	var_06.foreground = 1;
	return var_06;
}

//Function Number: 38
lib_A53C::func_35DA(param_00,param_01)
{
	if(level.var_5CDB)
	{
		return;
	}

	if(!isdefined(param_00))
	{
		param_00 = 0.3;
	}

	var_02 = lib_A53C::func_3E01(param_01);
	var_02 fadeovertime(param_00);
	var_02.alpha = 0;
	wait(param_00);
}

//Function Number: 39
lib_A53C::func_3E01(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "black";
	}

	return lib_A53C::func_3E11(param_00);
}

//Function Number: 40
lib_A53C::func_35E1(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = 0.3;
	}

	var_02 = lib_A53C::func_3E01(param_01);
	if(param_00 > 0)
	{
		var_02 fadeovertime(param_00);
	}

	var_02.alpha = 1;
	wait(param_00);
}

//Function Number: 41
lib_A53C::func_8C1D(param_00)
{
	var_01 = lib_A53C::func_3E01(param_00);
	var_01.alpha = 1;
}

//Function Number: 42
lib_A53C::func_3E11(param_00)
{
	if(isplayer(self))
	{
		var_01 = self;
	}
	else
	{
		var_01 = level.var_31D;
	}

	if(!isdefined(var_01.juggernautoverlay))
	{
		var_01.juggernautoverlay = [];
	}

	if(!isdefined(var_01.juggernautoverlay[param_00]))
	{
		var_01.juggernautoverlay[param_00] = lib_A53C::func_23A2(param_00,0,var_01);
	}

	var_01.juggernautoverlay[param_00].fontscale = 0;
	var_01.juggernautoverlay[param_00].foreground = 1;
	return var_01.juggernautoverlay[param_00];
}