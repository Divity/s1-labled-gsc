/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42301.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 18
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:17 PM
*******************************************************************/

//Function Number: 1
lib_A53D::func_239A()
{
	var_00 = [];
	var_00[var_00.size] = "phone";
	var_00[var_00.size] = "smoke";
	var_00[var_00.size] = "lean_smoke";
	var_00[var_00.size] = "coffee";
	var_00[var_00.size] = "sleep";
	var_00[var_00.size] = "sit_load_ak";
	var_00[var_00.size] = "smoke_balcony";
	if(isdefined(level.var_4B65))
	{
		var_00 = [[ level.var_4B65 ]](var_00);
	}

	return var_00;
}

//Function Number: 2
lib_A53D::func_4B6F()
{
	level.var_4221["_idle_call_idle_func"] = ::lib_A53D::func_4B60;
}

//Function Number: 3
lib_A53D::func_4B60()
{
	waittillframeend;
	if(!isalive(self))
	{
		return;
	}

	var_00 = undefined;
	if(!isdefined(self.target))
	{
		var_00 = self;
	}
	else
	{
		var_00 = getnode(self.target,"targetname");
		var_01 = getent(self.target,"targetname");
		var_02 = common_scripts\utility::getstruct(self.target,"targetname");
		var_03 = undefined;
		if(isdefined(var_00))
		{
			var_03 = ::lib_A53D::func_3DEB;
		}
		else if(isdefined(var_01))
		{
			var_03 = ::lib_A53D::func_3D4F;
		}
		else if(isdefined(var_02))
		{
			var_03 = ::common_scripts\utility::getstruct;
		}

		var_00 = [[ var_03 ]](self.target,"targetname");
		while(isdefined(var_00.target))
		{
			var_00 = [[ var_03 ]](var_00.target,"targetname");
		}
	}

	var_04 = var_00.script_animation;
	if(!isdefined(var_04))
	{
		var_04 = "random";
	}

	if(!lib_A53D::func_1CB0(var_04,var_00))
	{
		return;
	}

	if(var_04 == "random")
	{
		var_04 = lib_A53D::func_23D5();
		var_00.script_animation = var_04;
	}

	var_05 = var_04 + "_idle";
	var_06 = var_04 + "_into_idle";
	var_07 = var_04 + "_react";
	var_08 = var_04 + "_death";
	thread lib_A53D::func_4B72(var_00,var_06,var_05,var_07,var_08);
}

//Function Number: 4
lib_A53D::func_4B74(param_00,param_01)
{
	self endon("death");
	self endon("stop_idle_proc");
	if(isdefined(self.var_669))
	{
		level lib_A59A::func_7BE(::common_scripts\utility::flag_wait,lib_A588::func_8DD8());
		if(isdefined(self.var_669.var_6DF3.var_222C))
		{
			level lib_A59A::func_7BE(::common_scripts\utility::flag_wait,lib_A588::func_8DD7());
			lib_A59A::func_7BE(::lib_A59A::func_32DF,"_stealth_saw_corpse");
		}
	}
	else
	{
		lib_A59A::func_7BE(::lib_A59A::func_A090,"enemy");
	}

	lib_A59A::func_75F(::lib_A59A::func_7C7C,"stop_idle_proc");
	thread lib_A59A::func_2BDC();
	if(isdefined(self.var_7A96))
	{
		self waittill("_patrol_reached_path_end");
		return;
	}

	param_00 lib_A506::func_BD0(self,param_01);
}

//Function Number: 5
lib_A53D::func_2BC4(param_00)
{
	if(isdefined(param_00) && isdefined(level.var_78A9["generic"][param_00]))
	{
		var_01 = level.var_78A9["generic"][param_00];
		self.var_552 = "gravity";
		self.var_670 = self;
		self.var_551 = param_00;
		self.var_553 = "generic";
		self.var_578 = 0;
		self method_819A(::animscripts\animmode::main);
		var_02 = 0;
		if(isdefined(self.var_6715) && isdefined(level.var_78A9["generic"][self.var_6715]))
		{
			var_03 = self method_814F(level.var_78A9["generic"][self.var_6715]);
			if(var_03 > 0.6666667)
			{
				var_02 = 3 * var_03 - 0.6666667;
			}
			else if(var_03 > 0.3333333)
			{
				var_02 = 3 * var_03 - 0.3333333;
			}
			else
			{
				var_02 = 3 * var_03;
			}

			self method_8117(var_01,var_02);
		}

		var_04 = function_0063(var_01);
		var_05 = 1 - var_02 * var_04;
		wait(var_05);
	}
}

//Function Number: 6
lib_A53D::func_4B72(param_00,param_01,param_02,param_03,param_04)
{
	self.var_31 = 1;
	self endon("death");
	if(isdefined(self.var_7A0D))
	{
		self endon("stop_idle_proc");
		if(isdefined(param_01) && isdefined(level.var_78A9["generic"][param_01]))
		{
			lib_A53D::func_4B74(param_00,param_01);
		}
		else
		{
			lib_A53D::func_4B74(param_00,param_02);
		}
	}

	if(isdefined(self.var_7A0D))
	{
		self.script_animation = param_00.script_animation;
		param_00 = self;
	}

	if(param_00.script_animation == "sit_load_ak")
	{
		var_05 = lib_A59A::func_88CB("chair_ak");
		self.var_46E6 = 1;
		self.var_BEE = lib_A59A::func_590C(var_05);
		param_00 thread lib_A506::func_BC7(var_05,"sit_load_ak_react");
	}

	if(param_00.script_animation == "lean_smoke" || param_00.script_animation == "smoke_balcony")
	{
		thread lib_A569::func_DDC();
	}

	if(param_00.script_animation == "smoke_balcony")
	{
		thread lib_A53D::func_8A19(param_00,param_04);
	}

	if(param_00.script_animation == "sleep")
	{
		var_05 = lib_A59A::func_88CB("chair");
		self.var_46E6 = 1;
		self.var_BEE = lib_A59A::func_590C(var_05);
		param_00 thread lib_A506::func_BC7(var_05,"sleep_react");
		thread lib_A53D::func_7180();
	}

	if(isdefined(level.var_4B73))
	{
		self [[ level.var_4B73 ]](param_00,param_02,param_03,param_04);
	}

	param_00 lib_A59A::script_delay();
	self.var_2651 = level.var_78A9["generic"][param_04];
	if(isdefined(self.var_669))
	{
		self.var_669.var_2707 = "idling";
		var_06 = undefined;
		if(param_00.script_animation == "smoke_balcony")
		{
			var_06 = 1;
		}

		lib_A53D::func_2BC4(param_01);
		param_00 lib_A588::func_8D83(self,param_02,param_03,undefined,var_06);
		param_00 common_scripts\utility::waittill_either("stop_loop","stop_idle_proc");
		lib_A59A::func_1EAB();
		return;
	}

	lib_A53D::func_2BC4(param_02);
	var_07 = "stop_loop";
	param_01 thread lib_A506::func_BCE(self,param_03,var_07);
	thread lib_A53D::func_0C5A(param_01,param_04);
	thread lib_A53D::func_717F(param_01,var_07,param_04);
}

//Function Number: 7
lib_A53D::func_7180()
{
	self endon("death");
	self.ignoreall = 1;
	lib_A53D::func_7181();
	self.ignoreall = 0;
}

//Function Number: 8
lib_A53D::func_7181()
{
	self endon("death");
	if(isdefined(self.var_669))
	{
		thread lib_A588::func_8DC4();
		self endon("stealth_enemy_endon_alert");
	}

	var_00 = 70;
	common_scripts\utility::array_thread(level.var_328,::lib_A53D::func_7182,self,var_00);
	self waittill("_idle_reaction");
}

//Function Number: 9
lib_A53D::func_7182(param_00,param_01)
{
	param_00 endon("death");
	param_00 endon("_idle_reaction");
	self endon("death");
	param_00 endon("enemy");
	var_02 = param_01 * param_01;
	for(;;)
	{
		while(distancesquared(self.var_2E6,param_00.var_2E6) > var_02)
		{
			wait(0.1);
		}

		param_00.ignoreall = 0;
		while(distancesquared(self.var_2E6,param_00.var_2E6) <= var_02)
		{
			wait(0.1);
		}

		param_00.ignoreall = 1;
	}
}

//Function Number: 10
lib_A53D::func_717F(param_00,param_01,param_02,param_03)
{
	self endon("death");
	thread lib_A53D::func_7183("enemy");
	thread lib_A53D::func_7183("stop_idle_proc");
	thread lib_A53D::func_7183("react");
	thread lib_A53D::func_7183("doFlashBanged");
	thread lib_A53D::func_7183("explode");
	var_04 = undefined;
	self waittill("_idle_reaction",var_04);
	lib_A59A::func_1EAB();
	param_00 notify(param_01);
	if(isdefined(self.var_BEE))
	{
		self.var_BEF = 1;
		param_00 thread lib_A506::func_C18(self.var_BEE,param_02);
	}

	if(var_04 == "stop_idle_proc")
	{
		lib_A59A::func_C3D();
		return;
	}

	if(var_04 != "doFlashBanged")
	{
		if(isdefined(param_03) || isdefined(self.var_46E6))
		{
			param_00 lib_A506::func_BC9(self,param_02,param_03);
			return;
		}

		param_00 lib_A506::func_BCA(self,"gravity",param_02);
	}
}

//Function Number: 11
lib_A53D::func_7183(param_00)
{
	self waittill(param_00);
	self notify("_idle_reaction",param_00);
}

//Function Number: 12
lib_A53D::func_8A19(param_00,param_01)
{
	thread lib_A59A::func_27F1();
	thread lib_A53D::func_1EA2(param_00);
	self waittill("damage");
	if(isdefined(self.var_2651))
	{
		if(isdefined(self.var_669))
		{
			lib_A588::func_2AD5();
		}

		param_00 lib_A506::func_BC9(self,param_01);
		self delete();
	}
}

//Function Number: 13
lib_A53D::func_1EA2(param_00)
{
	self endon("death");
	if(!isdefined(self.var_669))
	{
		self waittill("_idle_reaction");
	}
	else
	{
		param_00 common_scripts\utility::waittill_either("stop_loop","stop_idle_proc");
	}

	lib_A59A::func_1EAB();
	if(isdefined(self.var_58D4) && self.var_58D4)
	{
		lib_A59A::func_8E9E();
	}
}

//Function Number: 14
lib_A53D::func_0C5A(param_00,param_01)
{
	if(!isdefined(self.var_BEE))
	{
		return;
	}

	var_02 = self.var_BEE;
	self waittill("death");
	if(isdefined(self.var_BEF))
	{
		return;
	}

	param_00 thread lib_A506::func_C18(var_02,param_01);
}

//Function Number: 15
lib_A53D::func_23D5()
{
	var_00 = lib_A53D::func_239A();
	return var_00[randomint(2)];
}

//Function Number: 16
lib_A53D::func_1CB0(param_00,param_01)
{
	var_02 = lib_A53D::func_239A();
	if(param_00 == "random")
	{
		var_03 = [];
		for(var_04 = 0;var_04 < var_02.size;var_04++)
		{
			if(!isdefined(level.var_78A9["generic"][var_02[var_04] + "_react"]))
			{
				var_03[var_03.size] = var_02[var_04];
			}
		}

		if(!var_03.size)
		{
			return 1;
		}

		for(var_04 = 0;var_04 < var_03.size;var_04++)
		{
		}

		return 0;
	}

	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		if(var_03[var_04] == param_01)
		{
			if(!isdefined(level.var_78A9["generic"][param_01 + "_react"]))
			{
				return 0;
			}

			return 1;
		}
	}

	var_05 = "";
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_05 = var_05 + var_03[var_04] + ", ";
	}

	var_05 = var_05 + "and random.";
	return 0;
}

//Function Number: 17
lib_A53D::func_3D4F(param_00,param_01)
{
	return getent(param_00,param_01);
}

//Function Number: 18
lib_A53D::func_3DEB(param_00,param_01)
{
	return getnode(param_00,param_01);
}