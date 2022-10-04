/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: door.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 411 ms
 * Timestamp: 4/20/2022 8:20:27 PM
*******************************************************************/

//Function Number: 1
func_2D61()
{
	self endon("killanimscript");
	if(isdefined(self.var_2B05))
	{
		return;
	}

	for(;;)
	{
		var_00 = self method_81A0();
		if(isdefined(var_00))
		{
			break;
		}

		wait(0.2);
	}

	var_01 = var_00.type == "Door Interior" || self method_81A1(var_00);
	if(var_01)
	{
		func_2D5E(var_00);
	}
	else
	{
		func_2D62(var_00);
	}

	for(;;)
	{
		var_02 = self method_81A0();
		if(!isdefined(var_02) || var_02 != var_00)
		{
			break;
		}

		wait(0.2);
	}

	thread func_2D61();
}

//Function Number: 2
func_91E9()
{
	self endon("killanimscript");
	self.var_91EA = 1;
	wait(5);
	self.var_91EA = undefined;
}

//Function Number: 3
func_2C30(param_00)
{
	thread func_91E9();
	if(self.var_1D6 == "flash_grenade")
	{
		self notify("flashbang_thrown");
	}

	self method_818F("face current");
	param_00.var_60C6 = gettime() + 5000;
	self.var_5C77 = gettime() + 100000;
	self notify("move_interrupt");
	self.var_9AC1 = undefined;
	self method_8142(%combatrun,0.2);
	self.var_7.var_5F58 = "stop";
	self waittill("done_grenade_throw");
	self method_818F("face default");
	self.var_5C77 = gettime() + 5000;
	self.var_1D6 = self.var_63CE;
	self.var_63CE = undefined;
	animscripts\run::func_315C();
	thread animscripts\move::func_66D6();
	thread animscripts\move::func_748D(1);
}

//Function Number: 4
func_2D60(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 0;
	var_06 = 3;
	var_07 = undefined;
	var_07 = %cqb_stand_grenade_throw;
	var_08 = anglestoforward(param_00.var_41);
	if(param_00.type == "Door Interior" && !self method_81A1(param_00))
	{
		var_08 = -1 * var_08;
	}

	var_09 = (param_00.var_2E6[0],param_00.var_2E6[1],param_00.var_2E6[2] + 64);
	var_0A = var_09;
	if(param_02)
	{
		var_0B = anglestoright(param_00.var_41);
		var_0C = param_00.var_2E6 - self.var_2E6;
		var_0D = vectordot(var_0B,var_0C);
		if(var_0D > 20)
		{
			var_0D = 20;
		}
		else if(var_0D < -20)
		{
			var_0D = -20;
		}

		var_0A = var_09 + var_0D * var_0B;
	}

	while(var_06 > 0)
	{
		if(isdefined(self.grenade) || !isdefined(self.enemy))
		{
			return;
		}

		if(func_64E2(param_00,var_08))
		{
			return;
		}

		if(!self method_81BF(self.enemy,0.2) && self.var_7.var_6E57 == "stand" && func_2B79(self.enemy.var_2E6 - param_00.var_2E6,360000,16384))
		{
			if(isdefined(param_00.var_60C6) && param_00.var_60C6 > gettime())
			{
				return;
			}

			if(self method_81BD())
			{
				return;
			}

			var_0C = param_00.var_2E6 - self.var_2E6;
			if(lengthsquared(var_0C) < param_03)
			{
				return;
			}

			if(vectordot(var_0C,var_08) < 0)
			{
				return;
			}

			self.var_63CE = self.var_1D6;
			self.var_1D6 = param_01;
			animscripts\combat_utility::func_7F0F(self.enemy);
			if(!var_05)
			{
				var_0E = var_09 + var_08 * 100;
				if(!self method_81CF(self.enemy,var_0E,128))
				{
					return;
				}
			}

			var_05 = 1;
			if(animscripts\combat_utility::func_9897(self.enemy,var_0A,var_07,animscripts\combat_utility::func_3FAF(var_07),1,0,1))
			{
				func_2C30(param_00);
				return;
			}
		}

		var_06--;
		wait(param_04);
		var_0F = self method_81A0();
		if(!isdefined(var_0F) || var_0F != param_00)
		{
			return;
		}
	}
}

//Function Number: 5
func_4C43()
{
	self endon("killanimscript");
	if(isdefined(self.var_2B05))
	{
		return;
	}

	self.var_5123 = 0;
	for(;;)
	{
		if(self method_813B() && !self.var_12F)
		{
			func_2D5F();
		}
		else if(!isdefined(self.var_5C77) || self.var_5C77 < gettime())
		{
			self.var_5C77 = undefined;
			func_2D63();
		}

		wait(0.2);
	}
}

//Function Number: 6
func_2D5F()
{
	if(!isdefined(self.var_6091) && !self.var_12F)
	{
		self.var_5123 = 1;
		if(!isdefined(self.var_22E0) || !self.var_22E0)
		{
			lib_A59A::func_30AF(1);
		}
	}
}

//Function Number: 7
func_2D63()
{
	if(!isdefined(self.var_22DD))
	{
		self.var_5123 = 0;
		if(isdefined(self.var_22E0) && self.var_22E0)
		{
			lib_A59A::func_2A8C();
		}
	}
}

//Function Number: 8
func_2B79(param_00,param_01,param_02)
{
	return param_00[0] * param_00[0] + param_00[1] * param_00[1] < param_01 && param_00[2] * param_00[2] < param_02;
}

//Function Number: 9
func_64E2(param_00,param_01)
{
	var_02 = param_00.var_2E6 - self.var_2E6;
	var_03 = param_00.var_2E6 - self.enemy.var_2E6;
	return vectordot(var_02,param_01) * vectordot(var_03,param_01) > 0;
}

//Function Number: 10
func_2D5E(param_00)
{
	for(;;)
	{
		if(isdefined(self.var_2D65) && self.var_2D65 == 0 || self.var_2D65 < randomfloat(1))
		{
			break;
		}

		if(func_2B79(self.var_2E6 - param_00.var_2E6,562500,25600))
		{
			func_2D60(param_00,"fraggrenade",0,302500,0.3);
			param_00 = self method_81A0();
			if(!isdefined(param_00))
			{
				return;
			}

			break;
		}

		wait(0.1);
	}

	for(;;)
	{
		if(func_2B79(self.var_2E6 - param_00.var_2E6,36864,6400))
		{
			func_2D5F();
			self.var_5C77 = gettime() + 6000;
			if(isdefined(self.var_2D64) && self.var_2D64 == 0 || self.var_2D64 < randomfloat(1))
			{
				return;
			}

			func_2D60(param_00,"flash_grenade",1,4096,0.2);
			return;
		}

		wait(0.1);
	}
}

//Function Number: 11
func_2D62(param_00)
{
	for(;;)
	{
		if(!self.var_5123 || distancesquared(self.var_2E6,param_00.var_2E6) < 1024)
		{
			return;
		}

		wait(0.1);
	}
}