/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42374.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 5 ms
 * Timestamp: 4/20/2022 8:23:24 PM
*******************************************************************/

//Function Number: 1
lib_A586::func_8E03()
{
	lib_A586::func_3A64();
	thread lib_A586::func_3A7F();
}

//Function Number: 2
lib_A586::func_3A7F()
{
	self endon("death");
	self endon("pain_death");
	self.var_639C = self.var_180;
	self.var_639D = self.var_181;
	for(;;)
	{
		lib_A59A::func_32DF("_stealth_stance_handler");
		common_scripts\utility::flag_waitopen("_stealth_spotted");
		self.var_180 = 1;
		self.var_181 = 10;
		while(lib_A59A::func_32D7("_stealth_stance_handler") && !common_scripts\utility::flag("_stealth_spotted"))
		{
			lib_A586::func_3A85();
			var_00 = [];
			var_00 = lib_A586::func_3A82(var_00);
			if(var_00[self.var_669.var_5833.stance])
			{
				thread lib_A586::func_3A80();
				continue;
			}

			if(lib_A59A::func_32D7("_stealth_stay_still"))
			{
				thread lib_A586::func_3A83();
				continue;
			}

			if(!var_00[self.var_669.var_13A2.var_8AF4] && self.var_669.var_13A2.var_8AF4 != self.var_669.var_5833.stance)
			{
				thread lib_A586::func_3A81();
				continue;
			}

			if(lib_A59A::func_32D7("_stealth_stance_change"))
			{
				self notify("_stealth_stance_dont_change");
			}

			wait(0.05);
		}

		self.var_180 = self.var_639C;
		self.var_181 = self.var_639D;
		self.var_5F62 = 1;
		self method_81CA("stand","crouch","prone");
		if(lib_A59A::func_32D7("_stealth_stay_still"))
		{
			thread lib_A586::func_3A83(0);
		}
	}
}

//Function Number: 3
lib_A586::func_3A85()
{
	switch(self.var_669.var_5833.stance)
	{
		case "prone":
			break;

		case "crouch":
			break;

		case "stand":
			break;
	}
}

//Function Number: 4
lib_A586::func_3A82(param_00)
{
	var_01 = function_00D7("bad_guys","all");
	param_00[self.var_669.var_5833.stance] = 0;
	param_00[self.var_669.var_13A2.var_8AF4] = 0;
	foreach(var_03 in var_01)
	{
		var_04 = lib_A586::func_3A84(var_03,self.var_669.var_5833.stance);
		var_05 = lib_A586::func_3A84(var_03,self.var_669.var_13A2.var_8AF4);
		var_06 = lib_A58A::func_3A4A() + var_04;
		var_07 = lib_A58A::func_3A4A(self.var_669.var_13A2.var_8AF4) + var_05;
		var_08 = distance(var_03.var_2E6,self.var_2E6);
		if(var_08 < var_06)
		{
			param_00[self.var_669.var_5833.stance] = var_06;
			break;
		}

		if(var_08 < var_07)
		{
			param_00[self.var_669.var_13A2.var_8AF4] = var_07;
		}
	}

	return param_00;
}

//Function Number: 5
lib_A586::func_3A84(param_00,param_01)
{
	var_02 = anglestoforward(param_00.var_41);
	var_03 = vectornormalize(self.var_2E6 - param_00.var_2E6);
	var_04 = vectordot(var_02,var_03);
	if(var_04 > 0.3)
	{
		return self.var_669.var_13A2.var_8AF2["looking_towards"][param_01];
	}

	if(var_04 < -0.7)
	{
		return self.var_669.var_13A2.var_8AF2["looking_away"][param_01];
	}

	return self.var_669.var_13A2.var_8AF2["neutral"][param_01];
}

//Function Number: 6
lib_A586::func_3A80()
{
	self.var_5F62 = 1;
	self notify("_stealth_stance_down");
	switch(self.var_669.var_5833.stance)
	{
		case "stand":
			break;

		case "crouch":
			break;

		case "prone":
			break;
	}
}

//Function Number: 7
lib_A586::func_3A81()
{
	self endon("_stealth_stance_down");
	self endon("_stealth_stance_dont_change");
	self endon("_stealth_stance_handler");
	if(lib_A59A::func_32D7("_stealth_stance_change"))
	{
		return;
	}

	var_00 = 4;
	lib_A59A::func_32DD("_stealth_stance_change");
	lib_A59A::func_7BE(::lib_A59A::func_694,var_00);
	lib_A59A::func_7BE(::lib_A59A::func_A090,"_stealth_stance_down");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"_stealth_stance_dont_change");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"_stealth_stance_handler");
	lib_A59A::func_75F(::lib_A59A::func_32D9,"_stealth_stance_change");
	thread lib_A59A::func_2BDC();
	wait(var_00);
	self.var_5F62 = 1;
	switch(self.var_669.var_5833.stance)
	{
		case "prone":
			break;

		case "crouch":
			break;

		case "stand":
			break;
	}
}

//Function Number: 8
lib_A586::func_3A86()
{
	self notify("friendly_stance_handler_stay_still");
	if(lib_A59A::func_32D7("_stealth_stay_still"))
	{
		return;
	}

	lib_A59A::func_32DD("_stealth_stay_still");
	badplace_cylinder("_stealth_" + self.unique_id + "_prone",0,self.var_2E6,30,90,"bad_guys");
	self.var_181 = 5000;
}

//Function Number: 9
lib_A586::func_3A83(param_00)
{
	self endon("friendly_stance_handler_stay_still");
	if(!isdefined(param_00))
	{
		param_00 = self.var_669.var_13A2.var_9FD6;
	}

	wait(param_00);
	if(!lib_A59A::func_32D7("_stealth_stay_still"))
	{
		return;
	}

	lib_A59A::func_32D9("_stealth_stay_still");
	badplace_delete("_stealth_" + self.unique_id + "_prone");
	self.var_181 = 10;
}

//Function Number: 10
lib_A586::func_3A64()
{
	lib_A59A::func_32DC("_stealth_stance_handler");
	lib_A59A::func_32DC("_stealth_stay_still");
	lib_A59A::func_32DC("_stealth_stance_change");
	self.var_669.var_13A2.var_8AF4 = undefined;
	self.var_669.var_13A2.var_8AF2 = [];
	lib_A586::func_3A53();
	self.var_669.var_13A2.var_6107 = 0;
	self.var_669.var_13A2.var_9FD6 = 2;
	self.var_669.var_6DF3.var_866B = 1;
}

//Function Number: 11
lib_A586::func_3A53()
{
	var_00 = [];
	var_00["stand"] = 500;
	var_00["crouch"] = -400;
	var_00["prone"] = 0;
	var_01 = [];
	var_01["stand"] = 500;
	var_01["crouch"] = 200;
	var_01["prone"] = 50;
	var_02 = [];
	var_02["stand"] = 800;
	var_02["crouch"] = 400;
	var_02["prone"] = 100;
	lib_A586::func_3A7C(var_00,var_01,var_02);
}

//Function Number: 12
lib_A586::func_3A7C(param_00,param_01,param_02)
{
	if(isdefined(param_00))
	{
		foreach(var_05, var_04 in param_00)
		{
			self.var_669.var_13A2.var_8AF2["looking_away"][var_05] = var_04;
		}
	}

	if(isdefined(param_01))
	{
		foreach(var_05, var_04 in param_01)
		{
			self.var_669.var_13A2.var_8AF2["neutral"][var_05] = var_04;
		}
	}

	if(isdefined(param_02))
	{
		foreach(var_05, var_04 in param_02)
		{
			self.var_669.var_13A2.var_8AF2["looking_towards"][var_05] = var_04;
		}
	}
}