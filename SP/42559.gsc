/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42559.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:23:50 PM
*******************************************************************/

//Function Number: 1
lib_A63F::func_5C96()
{
	self endon("death");
	self endon("stop_missle_handle_thread_grenade");
	self.var_91CC = [];
	for(;;)
	{
		level.var_31D waittill("threat_grenade_marking_started",var_00);
		var_01 = var_00.var_31C9;
		wait(3);
		lib_A63F::func_37BB(var_01);
	}
}

//Function Number: 2
lib_A63F::func_37BC(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	self endon("death");
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(!isdefined(param_04))
	{
		param_04 = 0;
	}

	if(isdefined(param_05))
	{
		if(!isdefined(level.var_9D06))
		{
			level.var_9D06 = [];
		}

		if(!isdefined(level.var_9D06[param_05]))
		{
			level.var_9D06[param_05] = 0;
		}
	}

	if(!isdefined(param_06))
	{
		param_06 = 2;
	}

	var_08 = 4;
	var_09 = 0;
	foreach(var_0B in param_00)
	{
		if(var_0B == level.var_31D)
		{
			var_09 = 1;
			break;
		}
	}

	var_0D = 0;
	var_0E = level.var_9D05[self.classname][0];
	for(;;)
	{
		if(isdefined(param_01))
		{
			self [[ param_01 ]]();
		}

		for(;;)
		{
			var_0F = 1;
			if(var_0F && param_03)
			{
				var_10 = getdvarint("cg_fov");
				if(!level.var_31D worldpointinreticle_circle(self.var_2E6,var_10,250))
				{
					var_0F = 0;
				}
			}

			if(var_0F && param_04 && var_09)
			{
				var_11 = self gettagorigin(self.var_5CC7[0]);
				var_12 = level.var_31D geteye() - var_11;
				var_12 = var_12 * 0.75;
				var_13 = bullettrace(var_11,var_11 + var_12,1,self,0,0,0);
				if(var_13["fraction"] < 1)
				{
					var_0F = 0;
				}
			}

			if(var_0F && param_02)
			{
				var_11 = self gettagorigin(self.var_5CC7[0]);
				var_12 = anglestoforward(self gettagangles(self.var_5CC7[0]));
				var_12 = var_12 * 100;
				var_13 = bullettrace(var_11,var_11 + var_12,1,self,0,0,0);
				if(var_13["fraction"] < 1)
				{
					var_0F = 0;
				}
			}

			if(var_0F)
			{
				if(isdefined(param_07) && !var_0D)
				{
					wait(param_07);
					var_0D = 1;
					var_0F = 0;
				}
			}

			if(var_0F && isdefined(param_05) && level.var_9D06[param_05] >= param_06)
			{
				var_0F = 0;
			}

			if(var_0F)
			{
				break;
			}

			wait(var_08 * 0.05);
			lib_A59A::func_CFD(param_00);
		}

		if(isdefined(param_05))
		{
			self.var_607C = 1;
			level.var_9D06[param_05]++;
			thread lib_A63F::func_2759(param_05,var_0E);
		}

		lib_A63F::func_37BB(param_00,self.var_5CC7.size / param_00.size,undefined,1);
		if(isdefined(var_0E) && isdefined(var_0E.var_77CF))
		{
			wait(randomfloatrange(var_0E.var_77CF,var_0E.var_77CE));
		}
		else
		{
			wait(randomfloatrange(0.5,1.5));
		}

		if(isdefined(param_05))
		{
			level.var_9D06[param_05]--;
			self.var_607C = 0;
			self notify("kill_decrement_firing_count_if_died_while_firing");
		}

		wait 0.05;
	}
}

//Function Number: 3
lib_A63F::func_2759(param_00,param_01)
{
	self notify("kill_decrement_firing_count_if_died_while_firing");
	self endon("kill_decrement_firing_count_if_died_while_firing");
	self waittill("death");
	if(isdefined(param_01) && isdefined(param_01.var_77CF))
	{
		wait(randomfloatrange(param_01.var_77CF,param_01.var_77CE));
	}
	else
	{
		wait(randomfloatrange(0.5,1.5));
	}

	level.var_9D06[param_00]--;
}

//Function Number: 4
lib_A63F::func_37BB(param_00,param_01,param_02,param_03)
{
	self endon("death");
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	var_04 = level.var_9D05[self.classname][param_02];
	var_05 = var_04.var_6EA0;
	var_06 = var_04.var_6E70;
	if(!param_03 && isdefined(var_05))
	{
		self [[ var_05 ]]();
	}

	if(isdefined(self.var_5CAA) && self.var_5CAA)
	{
		var_07 = getdvarint("cg_fov");
		var_08 = [];
		var_09 = [];
		foreach(var_0B in param_00)
		{
			if(!isdefined(var_0B))
			{
				continue;
			}

			if(!level.var_31D worldpointinreticle_circle(var_0B.var_2E6,var_07,500))
			{
				var_08[var_08.size] = var_0B;
				continue;
			}

			var_09[var_09.size] = var_0B;
		}

		foreach(var_0B in var_09)
		{
			lib_A63F::func_A11F(var_0B,param_01);
		}

		foreach(var_0B in var_08)
		{
			lib_A63F::func_A11F(var_0B,param_01);
		}
	}
	else
	{
		foreach(var_0B in param_01)
		{
			lib_A63F::func_A11F(var_0B,param_01);
		}
	}

	if(isdefined(var_06))
	{
		self [[ var_06 ]]();
	}

	if(isdefined(self.var_5C8A) && self.var_5C8A)
	{
		lib_A63F::func_7312();
	}
}

//Function Number: 5
lib_A63F::func_3D8D(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(isdefined(param_00) && param_02)
	{
		var_03 = common_scripts\utility::spawn_tag_origin();
		return var_03;
	}

	if(isdefined(param_01))
	{
		return param_01;
	}

	var_03 = common_scripts\utility::spawn_tag_origin();
	var_03.var_2E6 = param_01;
	return var_03;
}

//Function Number: 6
lib_A63F::func_9AAE(param_00,param_01,param_02)
{
	param_01 endon("death");
	param_02 endon("death");
	param_00 endon("death");
	if(!isdefined(param_02) || !isvalidmissile(param_00) || !isdefined(param_01))
	{
		return;
	}

	var_03 = 0;
	var_04 = 0;
	var_05 = undefined;
	if(isplayer(param_02))
	{
		var_03 = level.var_31D geteye()[2] - param_02.var_2E6[2];
	}

	if(randomfloat(100) > 50)
	{
		var_05 = randomfloatrange(30,40);
	}
	else
	{
		var_05 = -1 * randomfloatrange(30,40);
	}

	var_04 = randomfloatrange(-35,5);
	while(isvalidmissile(param_00))
	{
		var_06 = param_00 localtoworldcoords((0,var_05,0));
		var_07 = var_06 - param_00.var_2E6;
		var_08 = param_02.var_2E6 + (var_07[0],var_07[1],var_03 + var_04);
		if(isplayer(param_02))
		{
			param_01.var_2E6 = var_08;
			continue;
		}

		param_01 unlink();
		param_01.var_2E6 = var_08;
		param_01 linkto(param_02);
		wait 0.05;
	}
}

//Function Number: 7
lib_A63F::func_A11F(param_00,param_01,param_02)
{
	self endon("death");
	if(!isdefined(param_00))
	{
		return;
	}

	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	var_03 = level.var_9D05[self.classname][param_02];
	var_04 = param_00.var_2E6;
	var_05 = 0;
	if(!isdefined(param_01))
	{
		param_01 = randomintrange(2,4);
	}

	for(var_06 = 0;var_06 < param_01;var_06++)
	{
		if(self.var_5CC0 == 0)
		{
			continue;
		}

		var_07 = self.var_5CC7[self.var_5CC0 - 1];
		if(param_00 == level.var_31D && var_06 != 0)
		{
			var_05 = 1;
		}

		thread lib_A63F::func_A120(var_07,var_04,param_02,param_00,var_05);
		if(isdefined(var_03.var_4E9D))
		{
			wait(var_03.var_4E9D);
			continue;
		}

		wait(0.1);
	}
}

//Function Number: 8
lib_A63F::func_A120(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_04))
	{
		param_04 = 0;
	}

	if(self.classname == "script_vehicle_corpse")
	{
		self notify("death");
	}

	if(!isdefined(level.var_A121))
	{
		level.var_A121 = 1;
	}

	var_05 = 0;
	var_06 = 0;
	var_07 = lib_A63F::func_0604("forward",param_00,20 + var_06);
	var_08 = lib_A63F::func_0604("forward",param_00,200 + var_06);
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	var_09 = level.var_9D05[self.classname][param_02];
	var_0A = magicbullet(var_09.var_5C9E,var_07,var_08);
	if(isdefined(var_0A) && level.var_A121)
	{
		self detach(var_09.var_5C9D,param_00);
		self.var_5CCA[self.var_5CC0 - 1] = 0;
		self.var_5CC0--;
	}

	if(isdefined(var_09.var_4941) && isdefined(var_09.var_4940))
	{
		wait(randomfloatrange(var_09.var_4941,var_09.var_4940));
	}
	else
	{
		wait(randomfloatrange(0.5,0.85));
	}

	var_0B = lib_A63F::func_3D8D(param_03,param_01,param_04);
	if(!isdefined(param_03) || var_0B != param_03)
	{
		var_05 = 1;
	}

	var_0C = undefined;
	if(isvalidmissile(var_0A) && !lib_A63F::func_4FF8(var_09,self))
	{
		var_0C = missilecreateattractorent(var_0B,50000,2000,var_0A,1);
		if(param_04)
		{
			thread lib_A63F::func_9AAE(var_0A,var_0B,param_03);
		}

		if(isdefined(var_0A) && isvalidmissile(var_0A))
		{
			var_0A missilesettargetent(var_0B);
		}
	}

	while(isdefined(var_0A))
	{
		wait 0.05;
		if(isvalidmissile(var_0A) && lib_A63F::func_4FF8(var_09,self))
		{
			var_0A missilecleartarget();
		}
	}

	if(var_05)
	{
		var_0B delete();
	}

	if(isdefined(var_0C))
	{
		missiledeleteattractor(var_0C);
	}
}

//Function Number: 9
lib_A63F::func_4FF8(param_00,param_01)
{
	if(isdefined(param_00.var_5C88) && param_00.var_5C88 && !isdefined(param_01))
	{
		return 1;
	}

	return 0;
}

//Function Number: 10
lib_A63F::func_0604(param_00,param_01,param_02)
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

//Function Number: 11
lib_A63F::func_7312(param_00)
{
	if(isdefined(param_00))
	{
	}

	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	if(!isdefined(self.var_5CCA))
	{
		self.var_5CCA = [];
	}

	for(var_01 = 0;var_01 < self.var_5CC7.size;var_01++)
	{
		if(!isdefined(self.var_5CCA[var_01]) || self.var_5CCA[var_01] == 0)
		{
			self attach(level.var_9D05[self.classname][param_00].var_5C9D,self.var_5CC7[var_01],1);
			self.var_5CCA[var_01] = 1;
		}
	}

	self.var_5CC0 = self.var_5CC7.size;
}