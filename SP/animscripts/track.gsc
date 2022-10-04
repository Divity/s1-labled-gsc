/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: track.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 297 ms
 * Timestamp: 4/20/2022 8:20:53 PM
*******************************************************************/

//Function Number: 1
func_950B()
{
	self endon("killanimscript");
	self endon("stop tracking");
	self endon("melee");
	func_94FB(%aim_2,%aim_4,%aim_6,%aim_8);
}

//Function Number: 2
func_94FB(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 0;
	var_06 = 0;
	var_07 = (0,0,0);
	var_08 = 1;
	var_09 = 0;
	var_0A = 0;
	var_0B = 10;
	var_0C = (0,0,0);
	var_0D = 0;
	var_0E = 0;
	var_0F = 0;
	var_10 = 0;
	var_11 = 0.1;
	var_12 = 0;
	if(self.type == "dog")
	{
		var_13 = 0;
		self.var_83F0 = self.enemy;
	}
	else
	{
		var_13 = 1;
		var_14 = 0;
		var_15 = 0;
		if(isdefined(self.var_22A0))
		{
			var_14 = level.var_22A1;
		}

		var_16 = self.script;
		if(var_16 == "cover_multi")
		{
			if(self.var_DA.state == "right")
			{
				var_16 = "cover_right";
			}
			else if(self.var_DA.state == "left")
			{
				var_16 = "cover_left";
			}
		}

		if((var_16 == "cover_left" || var_16 == "cover_right") && isdefined(self.var_7.var_2227) && self.var_7.var_2227 == "lean")
		{
			var_15 = self.var_22BA.var_41[1] - self.var_41[1];
		}

		var_0C = (var_14,var_15,0);
	}

	for(;;)
	{
		func_4C2D();
		if(self method_8442("tag_flash") == -1)
		{
			wait(0.05);
			continue;
		}

		var_17 = animscripts\shared::func_40C6();
		var_18 = self.var_8409;
		if(isdefined(self.var_83F0))
		{
			if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
			{
				var_18 = animscripts\combat_utility::func_3DB0(self.var_83F0);
			}
			else
			{
				var_18 = self.var_83F0 method_8097();
			}
		}

		if(!isdefined(var_18) && animscripts\utility::func_8485())
		{
			var_18 = func_94FE(var_17);
		}

		var_19 = isdefined(self.var_64E4) || isdefined(self.var_644D);
		var_1A = isdefined(var_18);
		var_1B = (0,0,0);
		if(var_1A)
		{
			var_1B = var_18;
		}

		var_1C = 0;
		var_1D = isdefined(self.var_8E24);
		if(var_1D)
		{
			var_1C = self.var_8E24;
		}

		var_07 = self method_81BB(var_17,var_1B,var_1A,var_0C,var_1C,var_1D,var_19);
		var_1E = var_07[0];
		var_1F = var_07[1];
		var_07 = undefined;
		if(animscripts\utility::func_51AD())
		{
			var_20 = self.var_41[2] * -1;
			var_21 = var_1E * cos(var_20) - var_1F * sin(var_20);
			var_22 = var_1E * sin(var_20) + var_1F * cos(var_20);
			var_1E = var_21;
			var_1F = var_22;
			var_1E = clamp(var_1E,self.var_134,self.var_4E0);
			var_1F = clamp(var_1F,self.var_251,self.var_37F);
		}

		if(var_0A > 0)
		{
			var_0A = var_0A - 1;
			var_0B = max(10,var_0B - 5);
		}
		else if(self.var_363 && self.var_363 != var_09)
		{
			var_0A = 2;
			var_0B = 30;
		}
		else
		{
			var_0B = 10;
		}

		var_23 = squared(var_0B);
		var_09 = self.var_363;
		var_24 = self.movemode != "stop" || !var_08;
		if(var_24)
		{
			var_25 = var_1F - var_05;
			if(squared(var_25) > var_23)
			{
				var_1F = var_05 + clamp(var_25,-1 * var_0B,var_0B);
				var_1F = clamp(var_1F,self.var_251,self.var_37F);
			}

			var_26 = var_1E - var_06;
			if(squared(var_26) > var_23)
			{
				var_1E = var_06 + clamp(var_26,-1 * var_0B,var_0B);
				var_1E = clamp(var_1E,self.var_134,self.var_4E0);
			}
		}

		var_08 = 0;
		var_05 = var_1F;
		var_06 = var_1E;
		func_9500(param_00,param_01,param_02,param_03,param_04,var_1E,var_1F);
		wait(0.05);
	}
}

//Function Number: 3
func_94FE(param_00)
{
	var_01 = undefined;
	var_02 = anglestoforward(self.var_41);
	if(isdefined(self.var_22D8))
	{
		if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
		{
			var_01 = animscripts\combat_utility::func_3DB0(self.var_22D8);
		}
		else
		{
			var_01 = self.var_22D8 method_8097();
		}

		if(isdefined(self.var_22DC))
		{
			if(vectordot(vectornormalize(var_01 - param_00),var_02) < 0.177)
			{
				var_01 = undefined;
			}
		}
		else if(vectordot(vectornormalize(var_01 - param_00),var_02) < 0.643)
		{
			var_01 = undefined;
		}
	}

	if(!isdefined(var_01) && isdefined(self.var_22D6))
	{
		var_01 = self.var_22D6;
		if(isdefined(self.var_22DB))
		{
			if(vectordot(vectornormalize(var_01 - param_00),var_02) < 0.177)
			{
				var_01 = undefined;
			}
		}
		else if(vectordot(vectornormalize(var_01 - param_00),var_02) < 0.643)
		{
			var_01 = undefined;
		}
	}

	return var_01;
}

//Function Number: 4
func_94FC(param_00,param_01)
{
	if(animscripts\utility::func_725F())
	{
		var_02 = self.enemy method_8097() - self.enemy.var_2E6;
		var_03 = self sentient_lastknownpos(self.enemy) + var_02;
		return func_94FF(var_03 - param_00,param_01);
	}

	var_04 = 0;
	var_05 = 0;
	if(isdefined(self.node) && isdefined(level.var_50E1[self.node.type]) && distancesquared(self.var_2E6,self.node.var_2E6) < 16)
	{
		var_05 = angleclamp180(self.var_41[1] - self.node.var_41[1]);
	}
	else
	{
		var_06 = self method_8192();
		if(isdefined(var_06))
		{
			var_05 = angleclamp180(self.var_41[1] - var_06[1]);
			var_04 = angleclamp180(360 - var_06[0]);
		}
	}

	return (var_04,var_05,0);
}

//Function Number: 5
func_94FF(param_00,param_01)
{
	var_02 = vectortoangles(param_00);
	var_03 = 0;
	var_04 = 0;
	if(self.var_3F2 == "up")
	{
		if(!isdefined(self.var_5A77) || isdefined(self.var_5A77) && !self.var_5A77)
		{
			var_03 = -40;
		}
	}
	else if(self.var_3F2 == "down")
	{
		if(!isdefined(self.var_5A77) || isdefined(self.var_5A77) && !self.var_5A77)
		{
			var_03 = 40;
			var_04 = 12;
		}
	}

	var_05 = 360 - var_02[0];
	var_05 = angleclamp180(var_05 + param_01[0] + var_03);
	if(isdefined(self.var_8E24))
	{
		var_06 = self.var_8E24 - var_02[1];
	}
	else
	{
		var_07 = angleclamp180(self.var_117 - self.var_41[1]) * 0.5;
		var_06 = var_07 + self.var_41[1] - var_02[1];
	}

	var_06 = angleclamp180(var_06 + param_01[1] + var_04);
	return (var_05,var_06,0);
}

//Function Number: 6
func_94FD(param_00,param_01,param_02)
{
	if(isdefined(self.var_64E4) || isdefined(self.var_644D))
	{
		if(param_01 > self.var_37F || param_01 < self.var_251)
		{
			param_01 = 0;
		}

		if(param_00 > self.var_4E0 || param_00 < self.var_134)
		{
			param_00 = 0;
		}
	}
	else if(param_02 && abs(param_01) > level.var_5A23 || abs(param_00) > level.var_5A22)
	{
		param_01 = 0;
		param_00 = 0;
	}
	else
	{
		if(self.var_1DB)
		{
			param_01 = clamp(param_01,-10,10);
		}
		else
		{
			param_01 = clamp(param_01,self.var_251,self.var_37F);
		}

		param_00 = clamp(param_00,self.var_134,self.var_4E0);
	}

	return (param_00,param_01,0);
}

//Function Number: 7
func_9500(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = 0;
	var_08 = 0;
	var_09 = 0;
	var_0A = 0;
	var_0B = 0;
	var_0C = 0.1;
	if(isdefined(self.var_974))
	{
		var_0C = self.var_974;
	}

	if(param_06 > 0)
	{
		var_0A = param_06 / self.var_37F * self.var_7.var_97E;
		var_09 = 1;
	}
	else if(param_06 < 0)
	{
		var_08 = param_06 / self.var_251 * self.var_7.var_97E;
		var_09 = 1;
	}

	if(param_05 > 0)
	{
		var_0B = param_05 / self.var_4E0 * self.var_7.var_97E;
		var_09 = 1;
	}
	else if(param_05 < 0)
	{
		var_07 = param_05 / self.var_134 * self.var_7.var_97E;
		var_09 = 1;
	}

	self method_814C(param_00,var_07,var_0C,1,1);
	self method_814C(param_01,var_08,var_0C,1,1);
	self method_814C(param_02,var_0A,var_0C,1,1);
	self method_814C(param_03,var_0B,var_0C,1,1);
	if(isdefined(param_04))
	{
		self method_814C(param_04,var_09,var_0C,1,1);
	}
}

//Function Number: 8
func_7F1B(param_00,param_01)
{
	if(!isdefined(param_01) || param_01 <= 0)
	{
		self.var_7.var_97E = param_00;
		self.var_7.var_980 = param_00;
		self.var_7.var_97F = param_00;
		self.var_7.var_982 = 0;
	}
	else
	{
		if(!isdefined(self.var_7.var_97E))
		{
			self.var_7.var_97E = 0;
		}

		self.var_7.var_980 = self.var_7.var_97E;
		self.var_7.var_97F = param_00;
		self.var_7.var_982 = int(param_01 * 20);
	}

	self.var_7.var_981 = 0;
}

//Function Number: 9
func_4C2D()
{
	if(self.var_7.var_981 < self.var_7.var_982)
	{
		self.var_7.var_981++;
		var_00 = 1 * self.var_7.var_981 / self.var_7.var_982;
		self.var_7.var_97E = self.var_7.var_980 * 1 - var_00 + self.var_7.var_97F * var_00;
	}
}