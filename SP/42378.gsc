/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42378.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 17
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:23:25 PM
*******************************************************************/

//Function Number: 1
lib_A58A::func_8E0F()
{
	lib_A58A::func_3A64();
	thread lib_A58A::func_3A8B();
}

//Function Number: 2
lib_A58A::func_3A8B()
{
	self endon("death");
	self endon("pain_death");
	var_00 = self.var_669.var_5833.var_24FA;
	if(isplayer(self))
	{
		thread lib_A58A::func_6BA5();
	}

	for(;;)
	{
		lib_A59A::func_32DF("_stealth_enabled");
		self [[ var_00 ]]();
		self.var_279 = lib_A58A::func_3A4A();
		wait(0.05);
	}
}

//Function Number: 3
lib_A58A::func_3A5E()
{
	return length(self getvelocity());
}

//Function Number: 4
lib_A58A::func_3A5B()
{
	return lib_A59A::func_32DB("_stealth_in_shadow") && lib_A59A::func_32D7("_stealth_in_shadow");
}

//Function Number: 5
lib_A58A::func_6B29()
{
	var_00 = length(self getvelocity());
	var_01 = self.var_669.var_5833.stance;
	var_02 = [];
	var_02["stand"] = 30;
	var_02["crouch"] = 15;
	var_02["prone"] = 4;
	var_03 = [];
	var_03["stand"] = 40;
	var_03["crouch"] = 25;
	var_03["prone"] = 10;
	if(!var_00)
	{
		self.var_669.var_5833.var_6BB3 = 0;
	}
	else if(var_00 > self.var_669.var_5833.var_6BB3)
	{
		self.var_669.var_5833.var_6BB3 = self.var_669.var_5833.var_6BB3 + var_02[var_01];
		if(self.var_669.var_5833.var_6BB3 > var_00)
		{
			self.var_669.var_5833.var_6BB3 = var_00;
		}
	}
	else if(var_00 < self.var_669.var_5833.var_6BB3)
	{
		self.var_669.var_5833.var_6BB3 = self.var_669.var_5833.var_6BB3 - var_03[var_01];
		if(self.var_669.var_5833.var_6BB3 < 0)
		{
			self.var_669.var_5833.var_6BB3 = 0;
		}
	}

	return self.var_669.var_5833.var_6BB3;
}

//Function Number: 6
lib_A58A::func_3A58(param_00)
{
	if(!isdefined(param_00))
	{
		if(isdefined(self.var_669))
		{
			param_00 = self.var_669.var_5833.stance;
		}
		else
		{
			param_00 = self.var_7.stance;
		}
	}

	if(isdefined(param_00) && param_00 == "back")
	{
		param_00 = "prone";
	}

	if(isdefined(self.type) && self.type == "dog")
	{
		if(isdefined(self.var_8AA2) && self.var_8AA2)
		{
			param_00 = "crouch";
		}
		else
		{
			param_00 = "prone";
		}
	}

	return param_00;
}

//Function Number: 7
lib_A58A::func_3A4A(param_00)
{
	if(!isdefined(self.var_669))
	{
		return;
	}

	param_00 = lib_A58A::func_3A58(param_00);
	var_01 = level.var_669.var_5833.var_29A0;
	var_02 = level.var_669.var_5833.var_298D[var_01][param_00];
	if(self [[ self.var_669.var_5833.var_3FD6 ]]())
	{
		var_02 = var_02 * 0.5;
		if(var_02 < level.var_669.var_5833.var_298D["hidden"]["prone"])
		{
			var_02 = level.var_669.var_5833.var_298D["hidden"]["prone"];
		}
	}

	var_03 = self.var_669.var_5833.var_5F73[var_01][param_00];
	if(isdefined(self.var_66A) && var_03 > self.var_66A)
	{
		var_03 = self.var_66A;
	}

	return var_02 + var_03;
}

//Function Number: 8
lib_A58A::func_3A5C()
{
	return self.var_7.var_6E57;
}

//Function Number: 9
lib_A58A::func_3A59()
{
	return self.var_41;
}

//Function Number: 10
lib_A58A::func_3A4B()
{
	self.var_669.var_5833.stance = self [[ self.var_669.var_5833.var_40E4 ]]();
	self.var_669.var_5833.var_63E0 = self.var_669.var_5833.stance;
}

//Function Number: 11
lib_A58A::func_6BA5()
{
	self endon("death");
	self endon("pain_death");
	var_00 = self.var_669.var_5833.var_3EF2;
	var_01 = self.var_669.var_5833.var_4154;
	var_02 = self [[ var_00 ]]();
	for(;;)
	{
		lib_A59A::func_32DF("_stealth_enabled");
		var_03 = undefined;
		if(self [[ self.var_669.var_5833.var_3FD6 ]]())
		{
			var_03 = 0;
		}
		else
		{
			var_03 = self [[ var_01 ]]();
		}

		foreach(var_09, var_05 in self.var_669.var_5833.var_5F73)
		{
			foreach(var_08, var_07 in var_05)
			{
				var_07 = var_03 * self.var_669.var_5833.var_5F75[var_09][var_08];
			}
		}

		var_02 = self [[ var_00 ]]();
		wait(0.1);
	}
}

//Function Number: 12
lib_A58A::func_3A5D()
{
	return self getstance();
}

//Function Number: 13
lib_A58A::func_3A5A()
{
	return self getplayerangles();
}

//Function Number: 14
lib_A58A::func_3A4C()
{
	var_00 = self [[ self.var_669.var_5833.var_40E4 ]]();
	if(!self.var_669.var_5833.var_8AF0)
	{
		switch(var_00)
		{
			case "prone":
				break;

			case "crouch":
				break;
		}
	}
}

//Function Number: 15
lib_A58A::func_3A64()
{
	lib_A59A::func_32DC("_stealth_in_shadow");
	lib_A59A::func_32DC("_stealth_enabled");
	lib_A59A::func_32DD("_stealth_enabled");
	self.var_669 = spawnstruct();
	self.var_669.var_5833 = spawnstruct();
	if(isplayer(self))
	{
		self.var_669.var_5833.var_40E4 = ::lib_A58A::func_3A5D;
		self.var_669.var_5833.var_3EF2 = ::lib_A58A::func_3A5A;
		if(level.console)
		{
			self.var_669.var_5833.var_4154 = ::lib_A58A::func_3A5E;
		}
		else
		{
			self.var_669.var_5833.var_4154 = ::lib_A58A::func_6B29;
			self.var_669.var_5833.var_6BB3 = 0;
		}

		self.var_669.var_5833.var_24FA = ::lib_A58A::func_3A4C;
	}
	else
	{
		self.var_669.var_5833.var_40E4 = ::lib_A58A::func_3A5C;
		self.var_669.var_5833.var_3EF2 = ::lib_A58A::func_3A59;
		self.var_669.var_5833.var_4154 = ::lib_A58A::func_3A5E;
		self.var_669.var_5833.var_24FA = ::lib_A58A::func_3A4B;
	}

	self.var_669.var_5833.var_3FD6 = ::lib_A58A::func_3A5B;
	self.var_669.var_5833.var_8AF1 = 0.2;
	self.var_669.var_5833.var_8AF0 = 0;
	self.var_669.var_5833.var_63E0 = self [[ self.var_669.var_5833.var_40E4 ]]();
	self.var_669.var_5833.stance = self [[ self.var_669.var_5833.var_40E4 ]]();
	self.var_669.var_5833.var_8A8D = [];
	self.var_669.var_5833.var_5F73 = [];
	self.var_669.var_5833.var_5F75 = [];
	self.var_669.var_5833.var_5F73["hidden"] = [];
	self.var_669.var_5833.var_5F73["hidden"]["prone"] = 0;
	self.var_669.var_5833.var_5F73["hidden"]["crouch"] = 0;
	self.var_669.var_5833.var_5F73["hidden"]["stand"] = 0;
	self.var_669.var_5833.var_5F73["spotted"] = [];
	self.var_669.var_5833.var_5F73["spotted"]["prone"] = 0;
	self.var_669.var_5833.var_5F73["spotted"]["crouch"] = 0;
	self.var_669.var_5833.var_5F73["spotted"]["stand"] = 0;
	lib_A58A::func_3A52();
}

//Function Number: 16
lib_A58A::func_3A52()
{
	var_00 = [];
	var_00["prone"] = 3;
	var_00["crouch"] = 2;
	var_00["stand"] = 2;
	var_01 = [];
	var_01["prone"] = 2;
	var_01["crouch"] = 2;
	var_01["stand"] = 2;
	lib_A58A::func_3A7B(var_00,var_01);
}

//Function Number: 17
lib_A58A::func_3A7B(param_00,param_01)
{
	if(isdefined(param_00))
	{
		self.var_669.var_5833.var_5F75["hidden"]["prone"] = param_00["prone"];
		self.var_669.var_5833.var_5F75["hidden"]["crouch"] = param_00["crouch"];
		self.var_669.var_5833.var_5F75["hidden"]["stand"] = param_00["stand"];
	}

	if(isdefined(param_01))
	{
		self.var_669.var_5833.var_5F75["spotted"]["prone"] = param_01["prone"];
		self.var_669.var_5833.var_5F75["spotted"]["crouch"] = param_01["crouch"];
		self.var_669.var_5833.var_5F75["spotted"]["stand"] = param_01["stand"];
	}
}