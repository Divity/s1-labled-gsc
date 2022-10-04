/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _javelin - 42834.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 15
 * Decompile Time: 547 ms
 * Timestamp: 4/20/2022 8:17:28 PM
*******************************************************************/

//Function Number: 1
func_8E50()
{
	thread func_8E4D();
	thread func_8E4B();
}

//Function Number: 2
func_8E4D()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("joined_team");
	self.var_8E48 = spawnstruct();
	self.var_8E48.var_580A = [];
	self.var_8E48.var_5811 = 0;
	var_00 = 0;
	for(;;)
	{
		var_01 = self getcurrentweapon();
		var_02 = 0;
		if(issubstr(var_01,"stingerm7"))
		{
			var_02 = 1;
		}
		else if(issubstr(var_01,"dlcgun11loot2"))
		{
			var_02 = 1;
		}

		if(var_02 && self playerads() > 0.99)
		{
			var_00 = 1;
			if(self.var_8E48.var_580A.size > 0)
			{
				func_7363();
			}

			self.var_8E48.var_580A = func_0CF8(common_scripts\utility::array_removeundefined(self.var_8E48.var_580A));
			if(isdefined(self.var_8E48.var_580F))
			{
				if(!func_5810(self.var_8E48.var_580F))
				{
					self.var_8E48.var_580F = undefined;
					self notify("stop_javelin_locking_feedback");
				}
			}

			if(isdefined(self.var_8E48.var_580F))
			{
				self.var_8E48.var_5811 = self.var_8E48.var_5811 + 0.05;
			}
			else
			{
				self.var_8E48.var_5811 = 0;
				if(self.var_8E48.var_580A.size < 4)
				{
					self.var_8E48.var_580F = func_3CD7();
					if(isdefined(self.var_8E48.var_580F))
					{
						thread func_580E();
					}
				}
			}

			if(self.var_8E48.var_5811 >= 1 && isdefined(self.var_8E48.var_580F) && self.var_8E48.var_580A.size < 4)
			{
				self notify("stop_javelin_locking_feedback");
				self.var_8E48.var_580A[self.var_8E48.var_580A.size] = self.var_8E48.var_580F;
				thread func_5807();
				self.var_8E48.var_580F = undefined;
			}

			if(self.var_8E48.var_580A.size > 0)
			{
				self weaponlockfinalize(self.var_8E48.var_580A[0]);
			}
			else
			{
				self weaponlockfree();
				self notify("stop_javelin_locked_feedback");
			}
		}
		else if(var_00 == 1)
		{
			var_00 = 0;
			self weaponlockfree();
			self notify("stop_javelin_locking_feedback");
			self notify("stop_javelin_locked_feedback");
			self.var_8E48.var_580A = [];
			if(isdefined(self.var_8E48.var_580F))
			{
				self.var_8E48.var_580F = undefined;
			}

			self.var_8E48.var_5811 = 0;
		}

		wait(0.05);
	}
}

//Function Number: 3
func_8E4B()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("joined_team");
	for(;;)
	{
		self waittill("missile_fire",var_00,var_01);
		if(issubstr(var_01,"stingerm7") || issubstr(var_01,"dlcgun11loot2"))
		{
			thread func_8E37(self,var_00,var_01);
		}
	}
}

//Function Number: 4
func_8E37(param_00,param_01,param_02)
{
	var_03 = (0,0,0);
	var_04 = (0,0,0);
	if(isdefined(param_01))
	{
		var_03 = param_01.var_2E6;
		var_04 = param_01.var_41;
		param_01 delete();
	}
	else
	{
		return;
	}

	param_00.var_8E48.var_580A = func_0CF8(common_scripts\utility::array_removeundefined(self.var_8E48.var_580A));
	var_05 = [];
	for(var_06 = 0;var_06 < 4;var_06++)
	{
		var_07 = var_04 + random_vector(20,20,20);
		var_08 = anglestoforward(var_07);
		var_09 = magicbullet(param_02,var_03,var_03 + var_08,param_00);
		var_09.owner = param_00;
		if(param_00.var_8E48.var_580A.size > 0)
		{
			var_0A = undefined;
			if(var_06 < param_00.var_8E48.var_580A.size)
			{
				var_0A = param_00.var_8E48.var_580A[var_06];
			}
			else
			{
				var_0A = param_00.var_8E48.var_580A[randomint(param_00.var_8E48.var_580A.size)];
			}

			var_09 missilesettargetent(var_0A,func_8E45(var_0A));
			var_09.lockedstingertarget = var_0A;
		}

		var_05[var_05.size] = var_09;
	}

	level notify("stinger_fired",param_00,var_05);
	param_00 setweaponammoclip(param_02,0);
}

//Function Number: 5
func_0C99(param_00,param_01)
{
	foreach(var_03 in param_00)
	{
		if(isdefined(var_03.lockedstingertarget) && var_03.lockedstingertarget == param_01)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 6
func_3CD7()
{
	var_00 = maps\mp\_utility::getotherteam(self.inliveplayerkillstreak);
	var_01 = [];
	foreach(var_03 in level.var_328)
	{
		if(level.teambased && var_03.inliveplayerkillstreak == self.inliveplayerkillstreak)
		{
			continue;
		}

		if(!maps\mp\_utility::isreallyalive(var_03))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	var_05 = veh_getarray();
	var_06 = [];
	foreach(var_08 in var_05)
	{
		if(!isdefined(var_08.owner))
		{
			continue;
		}

		if(var_08 maps\mp\killstreaks\_aerial_utility::vehicleiscloaked())
		{
			continue;
		}

		if(level.teambased && var_08.owner.inliveplayerkillstreak == self.inliveplayerkillstreak)
		{
			continue;
		}

		var_06[var_06.size] = var_08;
	}

	if(isdefined(level.var_511A) && level.var_511A)
	{
		foreach(var_0B in level.agentarray)
		{
			if(level.teambased && var_0B.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				continue;
			}

			if(!maps\mp\_utility::isreallyalive(var_0B))
			{
				continue;
			}

			var_01[var_01.size] = var_0B;
		}

		foreach(var_08 in var_05)
		{
			if(var_08 maps\mp\killstreaks\_aerial_utility::vehicleiscloaked())
			{
				continue;
			}

			if(level.teambased && var_08.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				continue;
			}

			var_06[var_06.size] = var_08;
		}
	}

	var_0F = maps\mp\killstreaks\_killstreaks::getaerialkillstreakarray(var_00);
	var_10 = common_scripts\utility::array_combine(var_01,var_06);
	var_10 = common_scripts\utility::array_combine(var_10,var_0F);
	if(isdefined(level.var_8E41))
	{
		var_10 = common_scripts\utility::array_combine(var_10,[[ level.var_8E41 ]](self));
	}

	var_11 = self geteye();
	var_12 = anglestoforward(self getplayerangles());
	var_13 = undefined;
	var_14 = cos(5);
	foreach(var_16 in var_10)
	{
		if(!common_scripts\utility::array_contains(self.var_8E48.var_580A,var_16))
		{
			var_17 = func_8E46(var_16);
			var_18 = vectordot(vectornormalize(var_17 - var_11),var_12);
			if(var_18 > var_14)
			{
				var_19 = undefined;
				var_1A = !1;
				if(!var_1A)
				{
					var_1B = bullettracepassed(var_11,var_17,0,var_16);
					if(var_1B)
					{
						var_1A = 1;
					}
				}

				if(var_1A)
				{
					var_13 = var_16;
					var_14 = var_18;
				}
			}
		}
	}

	return var_13;
}

//Function Number: 7
func_5810(param_00)
{
	var_01 = self geteye();
	var_02 = anglestoforward(self getplayerangles());
	var_03 = func_8E46(param_00);
	if((isplayer(param_00) || isbot(param_00) || isdefined(level.var_511A) && level.var_511A && isagent(param_00)) && !maps\mp\_utility::isreallyalive(param_00))
	{
		return 0;
	}

	if(vectordot(vectornormalize(var_03 - var_01),var_02) > cos(5))
	{
		if(!1 || bullettracepassed(var_01,var_03,0,param_00))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 8
func_7363()
{
	for(var_00 = 0;var_00 <= self.var_8E48.var_580A.size;var_00++)
	{
		if(isdefined(self.var_8E48.var_580A[var_00]) && isdefined(self.var_8E48.var_580A[var_00].var_2E6))
		{
			if(!isdefined(self.var_8E48.var_580A[var_00].var_855F))
			{
				self.var_8E48.var_580A[var_00].var_855F = -1;
			}

			var_01 = (0,0,0);
			if(isplayer(self.var_8E48.var_580A[var_00]) || isbot(self.var_8E48.var_580A[var_00]))
			{
				var_01 = (0,0,64);
			}

			if(self worldpointinreticle_rect(self.var_8E48.var_580A[var_00].var_2E6 + var_01,50,400,200))
			{
				if(bullettracepassed(self geteye(),self.var_8E48.var_580A[var_00].var_2E6 + var_01,0,self.var_8E48.var_580A[var_00]))
				{
					self.var_8E48.var_580A[var_00].var_855F = -1;
					continue;
				}
			}

			if(self.var_8E48.var_580A[var_00].var_855F == -1)
			{
				self.var_8E48.var_580A[var_00].var_855F = gettime();
				continue;
			}

			if(gettime() - self.var_8E48.var_580A[var_00].var_855F >= 500)
			{
				self.var_8E48.var_580A[var_00].var_855F = -1;
				self.var_8E48.var_580A[var_00] = undefined;
			}
		}
	}
}

//Function Number: 9
func_8E46(param_00)
{
	if(isdefined(param_00.getstingertargetposfunc))
	{
		return param_00 [[ param_00.getstingertargetposfunc ]]();
	}

	return param_00 getpointinbounds(0,0,0);
}

//Function Number: 10
func_8E45(param_00)
{
	return func_8E46(param_00) - param_00.var_2E6;
}

//Function Number: 11
func_580E()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("joined_team");
	self endon("stop_javelin_locking_feedback");
	for(;;)
	{
		if(isdefined(level.spawnedwarbirds))
		{
			foreach(var_01 in level.spawnedwarbirds)
			{
				if(isdefined(var_01.owner) && isdefined(var_01.var_31D) && isdefined(self.var_8E48.var_580F) && self.var_8E48.var_580F == var_01)
				{
					var_01.owner method_82F4("wpn_stingerm7_enemy_locked");
				}
			}
		}

		if(isdefined(level.orbitalsupport_player) && isdefined(self.var_8E48.var_580F) && self.var_8E48.var_580F == level.orbitalsupport_planemodel)
		{
			level.orbitalsupport_player method_82F4("wpn_stingerm7_enemy_locked");
		}

		self method_82F4("wpn_stingerm7_locking");
		self playrumbleonentity("heavygun_fire");
		wait(0.6);
	}
}

//Function Number: 12
func_5807()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self endon("joined_team");
	self endon("stop_javelin_locked_feedback");
	for(;;)
	{
		if(isdefined(level.spawnedwarbirds))
		{
			foreach(var_01 in level.spawnedwarbirds)
			{
				if(isdefined(var_01.owner) && isdefined(var_01.var_31D) && isdefined(self.var_8E48.var_580A) && isinarray(self.var_8E48.var_580A,var_01))
				{
					var_01.owner method_82F4("wpn_stingerm7_enemy_locked");
				}
			}
		}

		if(isdefined(level.orbitalsupport_player) && isdefined(self.var_8E48.var_580A) && isinarray(self.var_8E48.var_580A,level.orbitalsupport_planemodel))
		{
			level.orbitalsupport_player method_82F4("wpn_stingerm7_enemy_locked");
		}

		self method_82F4("wpn_stingerm7_locked");
		self playrumbleonentity("heavygun_fire");
		wait(0.25);
	}
}

//Function Number: 13
func_0CF8(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		if(!isalive(var_03))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 14
random_vector(param_00,param_01,param_02)
{
	return (randomfloat(param_00) - param_00 * 0.5,randomfloat(param_01) - param_01 * 0.5,randomfloat(param_02) - param_02 * 0.5);
}

//Function Number: 15
isinarray(param_00,param_01)
{
	if(isdefined(param_00))
	{
		foreach(var_03 in param_00)
		{
			if(var_03 == param_01)
			{
				return 1;
			}
		}
	}

	return 0;
}