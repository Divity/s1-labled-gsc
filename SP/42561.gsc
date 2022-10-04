/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42561.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 20
 * Decompile Time: 5 ms
 * Timestamp: 4/20/2022 8:23:51 PM
*******************************************************************/

//Function Number: 1
lib_A641::func_9D56()
{
	self endon("death");
	self endon("vehicle_dismount");
	self endon("stop_vehicle_turret_ai");
	thread lib_A641::func_0967();
	thread lib_A641::func_9D4B();
	thread lib_A641::func_9A95();
	thread lib_A641::func_9CBD();
}

//Function Number: 2
lib_A641::func_9D2A(param_00)
{
	self.var_2AA3 = param_00;
}

//Function Number: 3
lib_A641::func_9D2D(param_00)
{
	self.var_2ADD = param_00;
	if(param_00)
	{
		self.var_929 = undefined;
		if(0)
		{
			self.var_92A = undefined;
			self.var_92C = undefined;
			self.var_92B = undefined;
		}

		self veh_clearturrettargetent();
	}
}

//Function Number: 4
lib_A641::func_9D2E(param_00)
{
	self endon("end_grenade_respose_function");
	self.var_7478 = param_00;
	if(!param_00)
	{
		self notify("end_grenade_respose_function");
		return;
	}

	while(param_00)
	{
		level.var_31D waittill("threat_grenade_marking_started",var_01);
		self.var_929 = undefined;
		self.var_92B = undefined;
		foreach(var_03 in self.mgturret)
		{
			self notify("mgturret_acquire_new_target");
		}

		wait 0.05;
	}
}

//Function Number: 5
lib_A641::func_9D5B(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(self.var_9C78))
	{
		self.var_9C78 = spawnstruct();
	}

	self.var_9C78.var_5C25 = param_00;
	self.var_9C78.var_5A04 = param_01;
	self.var_9C78.var_8435 = param_02;
	self.var_9C78.var_37A5 = param_03;
	self.var_9C78.var_11F3 = isdefined(param_04) && param_04;
}

//Function Number: 6
lib_A641::func_9D5C(param_00)
{
	if(!isdefined(self.var_9C78))
	{
		self.var_9C78 = spawnstruct();
	}

	self.var_9C78.var_9ADC = param_00;
}

//Function Number: 7
lib_A641::func_9D2B(param_00)
{
	if(lib_A641::func_509A(param_00) && function_02AE(param_00) || !function_02AE(param_00) && !param_00 lib_A5A0::func_500B())
	{
		self.var_92C = param_00;
		if(!isdefined(self.var_2ADD) || !self.var_2ADD)
		{
			if(lib_A641::func_509B(param_00))
			{
				self veh_setturrettargetvec(param_00);
				return;
			}

			self veh_setturrettargetent(param_00);
			return;
		}
	}
}

//Function Number: 8
lib_A641::func_0967()
{
	self endon("death");
	self endon("vehicle_dismount");
	self endon("stop_vehicle_turret_ai");
	for(;;)
	{
		self waittill("damage",var_00,var_01);
		if(isdefined(var_00) && var_00 > 0 && isdefined(var_01) && isai(var_01) && isalive(var_01) && !lib_A5A0::func_E29(var_01) && !lib_A5A0::func_E2A(var_01))
		{
			self.var_92B = var_01;
			waittillframeend;
			self notify("update_target");
			self.var_92B lib_A59A::func_9FAA("death",7);
		}
	}
}

//Function Number: 9
lib_A641::func_46EB(param_00,param_01)
{
	if(lib_A641::func_509B(param_00) && lib_A641::func_509B(param_01))
	{
		return param_00 != param_01;
	}

	if(lib_A641::func_509B(param_00) != lib_A641::func_509B(param_01))
	{
		return 1;
	}

	return self.var_929 != self.var_92A;
}

//Function Number: 10
lib_A641::func_9D4B()
{
	self endon("death");
	self endon("vehicle_dismount");
	self endon("stop_vehicle_turret_ai");
	for(;;)
	{
		if(isdefined(self.var_92C))
		{
			self.var_92A = self.var_92C;
		}
		else if(isdefined(self.var_92B))
		{
			self.var_92A = self.var_92B;
		}

		if(isdefined(self.var_2ADD) && self.var_2ADD)
		{
			wait 0.05;
			continue;
		}

		if(isdefined(self.var_92A))
		{
			if(!lib_A641::func_509A(self.var_92A))
			{
				self.var_92A = undefined;
			}
			else if(!isdefined(self.var_929) || lib_A641::func_46EB(self.var_92A,self.var_929))
			{
				if((isdefined(self.var_92C) && self.var_92A == self.var_92C) || isdefined(self.var_92B) && self.var_92A == self.var_92B && !isdefined(self.var_929))
				{
					if(isdefined(self.var_929) && !lib_A641::func_509B(self.var_929))
					{
						self.var_929.var_91AF = 0;
					}

					self.var_929 = self.var_92A;
					if(!lib_A641::func_509B(self.var_929))
					{
						self.var_929.var_91AF = -50;
					}

					self notify("main_barrel_acquire_new_target");
				}
			}
		}
		else
		{
			self.var_929 = undefined;
		}

		if(isdefined(self.var_929) && isdefined(self.var_7428) && self.var_7428 && !lib_A641::func_9940(self.var_929))
		{
			if(isdefined(self.var_92C) && self.var_929 == self.var_92C)
			{
				self.var_92C = undefined;
			}

			if(isdefined(self.var_92B) && self.var_929 == self.var_92B)
			{
				self.var_92B = undefined;
			}

			self.var_929 = undefined;
		}

		if(!lib_A641::func_509A(self.var_929))
		{
			self.var_929 = lib_A641::func_06E2();
			if(isdefined(self.var_929))
			{
				self.var_929.var_91AF = -50;
				self notify("main_barrel_acquire_new_target");
			}
		}

		var_00 = 1.5;
		if(isdefined(self.var_9C78) && isdefined(self.var_9C78.var_9ADC))
		{
			var_00 = self.var_9C78.var_9ADC;
		}

		lib_A59A::func_9FAA("update_target",var_00);
	}
}

//Function Number: 11
lib_A641::func_509B(param_00)
{
	return function_02AE(param_00);
}

//Function Number: 12
lib_A641::func_509A(param_00)
{
	if(lib_A641::func_509B(param_00))
	{
		return 1;
	}

	return isdefined(param_00) && !function_0294(param_00) && !isdefined(param_00.health) || isdefined(param_00.health) && param_00.health >= 0;
}

//Function Number: 13
lib_A641::func_5058(param_00)
{
	var_01 = undefined;
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(lib_A641::func_509B(param_00))
	{
		var_01 = param_00;
	}
	else
	{
		var_01 = param_00.var_2E6 + (0,0,50);
	}

	var_02 = var_01 - self gettagorigin("tag_flash");
	var_02 = vectornormalize(var_02);
	var_03 = self gettagangles("tag_flash");
	var_04 = anglestoforward(var_03);
	var_05 = vectordot(var_02,var_04);
	if(var_05 > 0.95)
	{
		return 1;
	}

	return 0;
}

//Function Number: 14
lib_A641::func_06E2()
{
	var_00 = undefined;
	if(self.var_7AE9 == "allies")
	{
		var_00 = "axis";
	}
	else if(self.var_7AE9 == "axis")
	{
		var_00 = "allies";
	}

	if(isdefined(var_00))
	{
		var_01 = function_00D6(var_00);
		if(isdefined(var_01) && var_01.size > 0)
		{
			var_02 = randomint(var_01.size);
			var_03 = undefined;
			var_04 = undefined;
			for(var_05 = 0;var_05 < var_01.size;var_05++)
			{
				var_06 = var_05 + var_02 % var_01.size;
				var_07 = var_01[var_06];
				if(isdefined(var_07) && isalive(var_07))
				{
					var_08 = lib_A641::func_3E8B(var_07);
					if(!isdefined(var_03) || var_08 > var_03)
					{
						var_03 = var_08;
						var_04 = var_07;
					}
				}
			}

			if(isdefined(var_03) && var_03 > 0)
			{
				return var_04;
			}
		}
	}

	return undefined;
}

//Function Number: 15
lib_A641::func_3E8B(param_00)
{
	var_01 = 0;
	var_02 = 16384;
	var_03 = 2250000;
	var_04 = self gettagorigin("tag_flash");
	var_05 = distancesquared(var_04,param_00.var_2E6);
	if(var_05 < var_02)
	{
		return 0;
	}

	if(var_05 > var_03)
	{
		return 0;
	}

	var_01 = 100 * 1 - var_05 - var_02 / var_03 - var_02;
	if(!lib_A641::func_9940(param_00))
	{
		return 0;
	}

	if(lib_A641::func_5058(param_00))
	{
		var_01 = var_01 + 50;
	}

	if(isdefined(param_00.var_91AF))
	{
		var_01 = var_01 + param_00.var_91AF;
	}

	if(isdefined(self.var_7478) && self.var_7478 && isdefined(param_00.var_11A) && isdefined(param_00.var_11A["grenade"]))
	{
		var_01 = var_01 + 500;
	}

	return var_01;
}

//Function Number: 16
lib_A641::func_9940(param_00)
{
	if(lib_A641::func_509B(param_00))
	{
		return 1;
	}

	var_01 = self gettagorigin("tag_flash");
	if(sighttracepassed(var_01,param_00.var_2E6 + (0,0,40),0,self,param_00))
	{
		return 1;
	}

	return 0;
}

//Function Number: 17
lib_A641::func_9A95()
{
	self endon("death");
	self endon("vehicle_dismount");
	self endon("stop_vehicle_turret_ai");
	for(;;)
	{
		var_00 = (randomintrange(-128,128),randomintrange(-128,128),randomintrange(-12,36));
		if(!lib_A641::func_509B(self.var_929))
		{
			var_00 = var_00 + (0,0,50);
		}

		thread lib_A641::func_9A94(var_00);
		lib_A59A::func_9FAA("main_barrel_acquire_new_target",1.5);
	}
}

//Function Number: 18
lib_A641::func_9A94(param_00)
{
	self notify("kill_update_aim_offset");
	self endon("kill_update_aim_offset");
	self endon("death");
	self endon("vehicle_dismount");
	self endon("stop_vehicle_turret_ai");
	self endon("main_barrel_acquire_new_target");
	var_01 = undefined;
	while(isdefined(self.var_929) && lib_A641::func_509A(self.var_929))
	{
		var_02 = param_00;
		if(lib_A641::func_509B(self.var_929))
		{
			self veh_setturrettargetvec(self.var_929 + var_02);
			var_01 = (0,0,0);
		}
		else
		{
			if(isdefined(self.var_929.var_7) && isdefined(self.var_929.var_7.var_6E57) && self.var_929.var_7.var_6E57 == "crouch")
			{
				var_02 = param_00 - (0,0,15);
			}

			self veh_setturrettargetent(self.var_929,var_02);
			var_01 = (0,0,50);
		}

		param_00 = param_00 - var_01;
		param_00 = param_00 * 0.2;
		param_00 = param_00 + var_01;
		wait(0.5);
	}
}

//Function Number: 19
lib_A641::func_9CBD()
{
	self endon("death");
	self endon("vehicle_dismount");
	self endon("stop_vehicle_turret_ai");
	var_00 = 1.5;
	if(isdefined(self.var_9C78) && isdefined(self.var_9C78.var_37A5))
	{
		var_00 = self.var_9C78.var_37A5;
	}

	for(;;)
	{
		if(isdefined(self.var_2AA3) && self.var_2AA3)
		{
			wait 0.05;
			continue;
		}

		if(isdefined(self.var_5525))
		{
			var_01 = gettime() - self.var_5525 + var_00 * 1000 / 1000;
			if(var_01 > 0)
			{
				wait(var_01);
			}

			self.var_5525 = undefined;
		}

		if(lib_A641::func_509A(self.var_929) && lib_A641::func_9940(self.var_929))
		{
			lib_A641::func_37A0();
		}

		lib_A59A::func_9FAA("main_barrel_acquire_new_target",var_00);
	}
}

//Function Number: 20
lib_A641::func_37A0()
{
	var_00 = 0;
	if(isdefined(self.var_9C78) && isdefined(self.var_9C78.var_5C25))
	{
		var_01 = self.var_9C78.var_5C25;
		var_02 = self.var_9C78.var_5A04;
		var_03 = self.var_9C78.var_8435;
	}
	else
	{
		var_01 = 1;
		var_02 = 3;
		var_03 = 1.5;
	}

	var_04 = randomintrange(var_01,var_02);
	while(lib_A641::func_509A(self.var_929) && !lib_A641::func_5058(self.var_929))
	{
		wait(0.5);
	}

	while(var_00 < var_04 && lib_A641::func_509A(self.var_929))
	{
		if(isdefined(self.var_9C78) && isdefined(self.var_9C78.var_11F3) && self.var_9C78.var_11F3)
		{
			var_05 = self gettagorigin("tag_flash");
			var_06 = var_05 + anglestoforward(self gettagangles("tag_flash")) * 10000;
			if(lib_A59A::func_8436(var_05,var_06))
			{
				break;
			}
		}

		self veh_fireweapon();
		lib_A5DE::snd_message("titan_walker_weapon_fire");
		self.var_5525 = gettime();
		var_00 = var_00 + var_03;
		wait(var_03);
	}
}