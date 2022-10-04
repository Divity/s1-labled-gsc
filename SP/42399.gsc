/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42399.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 111
 * Decompile Time: 39 ms
 * Timestamp: 4/20/2022 8:23:26 PM
*******************************************************************/

//Function Number: 1
lib_A59F::func_448F(param_00,param_01)
{
	if(!isdefined(self))
	{
		return;
	}

	if(!isdefined(self.vehicletype))
	{
		return;
	}

	var_02 = self.classname;
	var_03 = level.var_9C7A[var_02];
	var_04 = level.var_9C7A[var_02].size;
	self.var_DF4[self.var_DF4.size] = param_00;
	var_05 = lib_A59F::func_7E99(param_00,var_04);
	if(!isdefined(var_05))
	{
		return;
	}

	if(var_05 == 0)
	{
		param_00.var_2E17 = 1;
	}

	var_06 = lib_A59F::func_0BE9(self,var_05);
	self.var_9BF5[var_05] = 1;
	param_00.var_9D13 = var_05;
	param_00.var_9CDF = 0;
	if(isdefined(var_06.delay))
	{
		param_00.delay = var_06.delay;
		if(isdefined(var_06.var_27E7))
		{
			self.var_27E5 = param_00.delay;
		}
	}

	if(isdefined(var_06.var_27E7))
	{
		self.var_27E5 = self.var_27E5 + var_06.var_27E7;
		param_00.delay = self.var_27E5;
	}

	param_00.var_750B = self;
	param_00.var_6584 = param_00.health;
	param_00.var_9CDC = var_06.var_4B60;
	param_00.var_9D40 = var_06.var_8AFF;
	param_00.var_2651 = var_06.var_109;
	param_00.var_2641 = var_06.var_2641;
	param_00.var_5C38 = var_06.var_5C38;
	param_00.var_2652 = var_06.var_2666;
	param_00.var_8B03 = 0;
	if(isdefined(var_06.var_4066))
	{
		param_00.var_3E08 = function_0063(var_06.var_4066);
		param_00.var_3E06 = var_06.var_4066;
	}

	param_00.var_31 = 0;
	if(isdefined(param_00.var_2651) && !isdefined(param_00.var_58D4) && lib_A59F::func_9C7E())
	{
		if(param_00.var_9D13 != 0 || lib_A59F::func_9C7D())
		{
			param_00.var_31 = !isdefined(param_00.var_7931) || param_00.var_7931;
			if(isdefined(var_06.var_2645))
			{
				param_00.var_6156 = var_06.var_2645;
			}
		}
	}

	if(param_00.classname == "script_model")
	{
		if(isdefined(var_06.var_109) && param_00.var_31 && !isdefined(param_00.var_7931) || param_00.var_7931)
		{
			thread lib_A59F::func_4484(param_00,var_06);
		}
	}

	if(!isdefined(param_00.var_9CDC))
	{
		param_00.var_31 = 1;
	}

	self.var_7507[self.var_7507.size] = param_00;
	if(param_00.classname != "script_model" && lib_A59A::func_88EB(param_00))
	{
		return;
	}

	var_07 = lib_A59F::func_9C82(var_06);
	var_08 = lib_A59F::func_9C81(var_06);
	lib_A59F::func_577E(param_00,var_06.var_85A8,var_06.var_85A9,var_06.var_579A,var_06.var_85AA,var_06.mgturret);
	if(isai(param_00))
	{
		param_00 method_81C5(var_07,var_08);
		param_00.var_7.var_2B18 = param_00.var_7.var_2B17;
		param_00.var_7.var_2B17 = 1;
		if(isdefined(var_06.var_1433) && !var_06.var_1433)
		{
			param_00 lib_A59A::func_445F();
		}

		if(lib_A59F::func_44AC(var_06))
		{
			thread lib_A59F::func_44A1(param_00,var_05,param_01);
		}
	}
	else
	{
		if(isdefined(var_06.var_1433) && !var_06.var_1433)
		{
			lib_A59F::func_2979(param_00,"weapon_");
		}

		param_00.var_2E6 = var_07;
		param_00.var_41 = var_08;
	}

	if(var_05 == 0 && isdefined(var_03[0].var_109))
	{
		thread lib_A59F::func_2E06(param_00);
	}

	self notify("guy_entered",param_00,var_05);
	thread lib_A59F::func_4497(param_00,var_05);
	if(isdefined(var_06.var_7505))
	{
		param_00 [[ var_06.var_7505 ]]();
		return;
	}

	if(isdefined(self.var_667C))
	{
		param_00.var_667C = 1;
	}

	if(isdefined(var_06.var_3FD2))
	{
		thread [[ var_06.var_3FD2 ]](param_00,var_05);
		return;
	}

	thread lib_A59F::func_4498(param_00,var_05);
}

//Function Number: 2
lib_A59F::func_9C82(param_00)
{
	var_01 = self;
	if(isdefined(param_00.var_85AA) && param_00.var_85AA)
	{
		var_01 = self.mgturret[param_00.mgturret];
	}

	return var_01 gettagorigin(param_00.var_85A8);
}

//Function Number: 3
lib_A59F::func_9C81(param_00)
{
	var_01 = self;
	if(isdefined(param_00.var_85AA) && param_00.var_85AA)
	{
		var_01 = self.mgturret[param_00.mgturret];
	}

	return var_01 gettagangles(param_00.var_85A8);
}

//Function Number: 4
lib_A59F::func_9C7D()
{
	if(!isdefined(self.var_792E))
	{
		return 0;
	}

	return self.var_792E;
}

//Function Number: 5
lib_A59F::func_9C7E()
{
	if(!isdefined(self.var_7930))
	{
		return 1;
	}

	return self.var_7930;
}

//Function Number: 6
lib_A59F::func_44AC(param_00)
{
	if(!isdefined(param_00.mgturret))
	{
		return 0;
	}

	if(!isdefined(self.var_7A7B))
	{
		return 1;
	}

	return !self.var_7A7B;
}

//Function Number: 7
lib_A59F::func_451C()
{
	var_00 = self.classname;
	self.var_DF4 = [];
	if(!isdefined(level.var_9C7A) && isdefined(level.var_9C7A[var_00]))
	{
		return;
	}

	var_01 = level.var_9C7A[var_00].size;
	if(isdefined(self.var_39B) && self.var_39B == "ai_wait_go")
	{
		thread lib_A59F::func_0935();
	}

	self.var_76E1 = [];
	self.var_9BF5 = [];
	self.var_3FD5 = [];
	self.var_27E5 = 0;
	var_02 = level.var_9C7A[var_00];
	for(var_03 = 0;var_03 < var_01;var_03++)
	{
		self.var_9BF5[var_03] = 0;
		if(isdefined(self.var_7A7B) && self.var_7A7B && isdefined(var_02[var_03].var_1484) && var_02[var_03].var_1484)
		{
			self.var_9BF5[1] = 1;
		}
	}
}

//Function Number: 8
lib_A59F::func_57BD(param_00)
{
	lib_A59F::func_57BC(param_00,1);
}

//Function Number: 9
lib_A59F::func_4484(param_00,param_01)
{
	waittillframeend;
	param_00 setcandamage(1);
	param_00 endon("death");
	param_00.var_31 = 0;
	param_00.health = 10150;
	if(isdefined(param_00.var_7AD5))
	{
		param_00.health = param_00.health + param_00.var_7AD5;
	}

	param_00 endon("jumping_out");
	if(isdefined(param_00.var_58D4) && param_00.var_58D4)
	{
		while(isdefined(param_00.var_58D4) && param_00.var_58D4)
		{
			wait(0.05);
		}
	}

	while(param_00.health > 10000)
	{
		param_00 waittill("damage");
	}

	thread lib_A59F::func_4487(param_00,param_01);
}

//Function Number: 10
lib_A59F::func_4487(param_00,param_01)
{
	var_02 = gettime() + function_0063(param_01.var_109) * 1000;
	var_03 = param_00.var_41;
	var_04 = param_00.var_2E6;
	param_00 = lib_A59F::func_21A2(param_00);
	[[ level.var_422B ]]("MOD_RIFLE_BULLET","torso_upper",var_04);
	lib_A59F::func_2979(param_00,"weapon_");
	param_00 linkto(self);
	param_00 notsolid();
	param_00 method_814B(param_01.var_109);
	if(isai(param_00))
	{
		param_00 animscripts\shared::func_2F6B();
	}
	else
	{
		lib_A59F::func_2979(param_00,"weapon_");
	}

	if(isdefined(param_01.var_263F))
	{
		param_00 unlink();
		param_00 startragdoll();
		wait(param_01.var_263F);
		param_00 delete();
	}
}

//Function Number: 11
lib_A59F::func_57BC(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(!isdefined(param_00))
	{
		param_00 = lib_A59F::func_9CC4();
	}

	lib_A59A::func_32D9("unloaded");
	lib_A59A::func_32D9("loaded");
	common_scripts\utility::array_levelthread(param_00,::lib_A59F::func_3DA6,param_01,param_02);
}

//Function Number: 12
lib_A59F::func_5074(param_00)
{
	for(var_01 = 0;var_01 < self.var_7507.size;var_01++)
	{
		if(self.var_7507[var_01] == param_00)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 13
lib_A59F::func_9CC4()
{
	var_00 = [];
	var_01 = function_00D6(self.var_7AE9);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = var_01[var_02];
		if(!isdefined(var_03.var_7B13))
		{
			continue;
		}

		if(var_03.var_7B13 != self.var_7B13)
		{
			continue;
		}

		var_00[var_00.size] = var_03;
	}

	return var_00;
}

//Function Number: 14
lib_A59F::func_3DDF()
{
	var_00 = [];
	var_01 = getentarray("script_vehicle","code_classname");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = var_01[var_02];
		if(!isdefined(var_03.var_7B13))
		{
			continue;
		}

		if(var_03.var_7B13 != self.var_7B13)
		{
			continue;
		}

		var_00[var_00.size] = var_03;
	}

	return var_00[0];
}

//Function Number: 15
lib_A59F::func_3DA6(param_00,param_01,param_02)
{
	if(lib_A59F::func_5074(param_00))
	{
		return;
	}

	if(!lib_A59F::func_4548())
	{
		return;
	}

	lib_A59F::func_44A9(param_00,self,param_01,param_02);
}

//Function Number: 16
lib_A59F::func_4548()
{
	if(lib_A59F::func_9CD7())
	{
		return 1;
	}
}

//Function Number: 17
lib_A59F::func_9CD7()
{
	if(level.var_9C7A[self.classname].size - self.var_76E1.size)
	{
		return 1;
	}

	return 0;
}

//Function Number: 18
lib_A59F::func_44AB(param_00,param_01)
{
	param_01 endon("death");
	param_01 endon("stop_loading");
	var_02 = param_00 common_scripts\utility::waittill_any_return("long_death","death","enteredvehicle");
	if(var_02 != "enteredvehicle" && isdefined(param_00.var_39B5))
	{
		param_01.var_9BF5[param_00.var_39B5] = 0;
	}

	param_01.var_76E1 = common_scripts\utility::array_remove(param_01.var_76E1,param_00);
	lib_A59F::func_9CFF(param_01);
}

//Function Number: 19
lib_A59F::func_9CFF(param_00)
{
	if(isdefined(param_00.vehicletype) && isdefined(param_00.var_9D00))
	{
		if(param_00.var_7507.size == param_00.var_9D00)
		{
			param_00 lib_A59A::func_32DD("loaded");
			return;
		}

		return;
	}

	if(!param_00.var_76E1.size && param_00.var_7507.size)
	{
		if(param_00.var_9BF5[0])
		{
			param_00 lib_A59A::func_32DD("loaded");
			return;
		}

		param_00 thread lib_A59F::func_9D15();
		return;
	}
}

//Function Number: 20
lib_A59F::func_9D15()
{
	var_00 = self.var_7507;
	lib_A59E::func_9D5F();
	lib_A59A::func_32DF("unloaded");
	var_00 = lib_A59A::func_CFD(var_00);
	thread lib_A59E::func_9CFD(var_00);
}

//Function Number: 21
lib_A59F::func_7367(param_00)
{
	common_scripts\utility::waittill_any("unload","death");
	param_00 lib_A59A::func_8E9E();
}

//Function Number: 22
lib_A59F::func_44A9(param_00,param_01,param_02,param_03)
{
	param_01 endon("stop_loading");
	var_04 = 1;
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	var_05 = level.var_9C7A[param_01.classname];
	if(isdefined(param_01.var_76E7))
	{
		param_01 thread [[ param_01.var_76E7 ]](param_00);
		return;
	}

	param_01 endon("death");
	param_00 endon("death");
	param_01.var_76E1[param_01.var_76E1.size] = param_00;
	thread lib_A59F::func_44AB(param_00,param_01);
	var_06 = [];
	var_07 = undefined;
	var_08 = 0;
	var_09 = 0;
	for(var_0A = 0;var_0A < var_05.size;var_0A++)
	{
		if(isdefined(var_05[var_0A].var_3FD0))
		{
			var_09 = 1;
		}
	}

	if(!var_09)
	{
		param_00 notify("enteredvehicle");
		param_01 lib_A59F::func_448F(param_00,var_04);
		return;
	}

	if(!isdefined(param_00.var_3DA5))
	{
		while(param_01 veh_getspeed() > 1)
		{
			wait(0.05);
		}
	}

	var_0B = param_01 lib_A59F::func_3CCD(param_03);
	if(isdefined(param_00.var_7AD6))
	{
		var_07 = param_01 lib_A59F::func_9CCC(param_00.var_7AD6);
	}
	else if(!param_01.var_9BF5[0])
	{
		var_07 = param_01 lib_A59F::func_9CCC(0);
		if(param_02)
		{
			param_00 thread lib_A59A::func_58D4();
			thread lib_A59F::func_7367(param_00);
		}
	}
	else if(var_0B.var_1174.size)
	{
		var_07 = common_scripts\utility::getclosest(param_00.var_2E6,var_0B.var_1174);
	}
	else
	{
		var_07 = undefined;
	}

	if(!var_0B.var_1174.size && var_0B.var_614E.size)
	{
		param_00 notify("enteredvehicle");
		param_01 lib_A59F::func_448F(param_00,var_04);
		return;
	}
	else if(!isdefined(var_07))
	{
		return;
	}

	var_08 = var_07.var_2E6;
	var_0C = var_07.var_41;
	param_00.var_39B5 = var_07.var_9D13;
	param_01.var_9BF5[var_07.var_9D13] = 1;
	param_00.var_7A3A = 1;
	param_00 notify("stop_going_to_node");
	param_00 lib_A59A::func_7E39();
	param_00 lib_A59A::func_2A79();
	param_00.var_1C7 = 16;
	param_00 method_81A6(var_08);
	param_00 waittill("goal");
	param_00 lib_A59A::func_30A0();
	param_00 lib_A59A::func_9A59();
	param_00 notify("boarding_vehicle");
	var_0D = lib_A59F::func_0BE9(param_01,var_07.var_9D13);
	if(isdefined(var_0D.delay))
	{
		param_00.delay = var_0D.delay;
		if(isdefined(var_0D.var_27E7))
		{
			self.var_27E5 = param_00.delay;
		}
	}

	if(isdefined(var_0D.var_27E7))
	{
		self.var_27E5 = self.var_27E5 + var_0D.var_27E7;
		param_00.delay = self.var_27E5;
	}

	param_01 lib_A59F::func_577E(param_00,var_0D.var_85A8,var_0D.var_85A9,var_0D.var_579A);
	param_00.var_31 = 0;
	var_0D = var_05[var_07.var_9D13];
	if(isdefined(var_07))
	{
		if(isdefined(var_0D.var_9CC8))
		{
			if(isdefined(var_0D.var_9CCD))
			{
				var_0E = isdefined(param_00.var_6111);
				if(!var_0E)
				{
					param_01 method_8142(var_0D.var_9CCD,0);
				}
			}

			param_01 = param_01 lib_A59F::func_3EF8();
			param_01 thread lib_A59F::func_7F1C(var_0D.var_9CC8,var_0D.var_9CC9);
			level thread lib_A506::func_8C11(param_01,"vehicle_anim_flag");
		}

		if(isdefined(var_0D.var_9CCB))
		{
			var_08 = param_01 gettagorigin(var_0D.var_9CCB);
		}
		else
		{
			var_08 = param_01.var_2E6;
		}

		if(isdefined(var_0D.var_9CCA))
		{
			thread common_scripts\utility::play_sound_in_space(var_0D.var_9CCA,var_08);
		}

		var_0F = undefined;
		var_10 = undefined;
		if(isdefined(var_0D.var_3FD1))
		{
			var_0F = [];
			var_0F[0] = var_0D.var_3FD1;
			var_10 = [];
			var_10[0] = ::lib_A59F::func_3305;
			param_01 lib_A59F::func_577E(param_00,var_0D.var_85A8,var_0D.var_85A9,var_0D.var_579A);
		}

		param_01 lib_A59F::func_0C74(param_00,var_0D.var_85A8,var_0D.var_3FD0,var_0F,var_10);
	}

	param_00 notify("enteredvehicle");
	param_01 lib_A59F::func_448F(param_00,var_04);
}

//Function Number: 23
lib_A59F::func_3305()
{
	self notify("enteredvehicle");
}

//Function Number: 24
lib_A59F::func_2E06(param_00)
{
	if(lib_A59E::func_5115())
	{
		return;
	}

	self.var_2E03 = param_00;
	self endon("death");
	param_00 endon("jumping_out");
	param_00 waittill("death");
	if(isdefined(self.var_9CE5))
	{
		return;
	}

	self notify("driver dead");
	self.var_2638 = 1;
	if(isdefined(self.var_4743) && self.var_4743)
	{
		self veh_setwaitspeed(0);
		self veh_setspeed(0,10);
		self waittill("reached_wait_speed");
	}

	lib_A59E::func_9D5F();
}

//Function Number: 25
lib_A59F::func_21D5()
{
	var_00 = spawn("script_model",self.var_2E6);
	var_00 setmodel(self.model);
	var_01 = self getattachsize();
	for(var_02 = 0;var_02 < var_01;var_02++)
	{
		var_00 attach(self getattachmodelname(var_02));
	}

	return var_00;
}

//Function Number: 26
lib_A59F::func_447F(param_00,param_01)
{
	if(isai(param_00))
	{
		return param_00;
	}

	if(param_00.var_2E3E == 1)
	{
		param_00 delete();
		return;
	}

	param_00 = lib_A59A::func_9001(param_00);
	var_02 = self.classname;
	var_03 = level.var_9C7A[var_02].size;
	var_04 = lib_A59F::func_0BE9(self,param_01);
	lib_A59F::func_577E(param_00,var_04.var_85A8,var_04.var_85A9,var_04.var_579A);
	param_00.var_9CDC = var_04.var_4B60;
	thread lib_A59F::func_4498(param_00,param_01);
	return param_00;
}

//Function Number: 27
lib_A59F::func_577E(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = self;
	if(isdefined(param_04) && param_04)
	{
		var_06 = self.mgturret[param_05];
	}

	if(!isdefined(param_02))
	{
		param_02 = (0,0,0);
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(param_03 && !isdefined(param_00.var_79A8))
	{
		param_00 linktoblendtotag(var_06,param_01,0);
		return;
	}

	param_00 linkto(var_06,param_01,param_02,(0,0,0));
}

//Function Number: 28
lib_A59F::func_0BE9(param_00,param_01)
{
	return level.var_9C7A[param_00.classname][param_01];
}

//Function Number: 29
lib_A59F::func_4486(param_00,param_01)
{
	param_00 waittill("death");
	if(!isdefined(self))
	{
		return;
	}

	self.var_7507 = common_scripts\utility::array_remove(self.var_7507,param_00);
	self.var_9BF5[param_01] = 0;
}

//Function Number: 30
lib_A59F::func_803F()
{
	if(!isdefined(level.var_9C7B))
	{
		level.var_9C7B = [];
	}

	if(!isdefined(level.var_9C79))
	{
		level.var_9C79 = [];
	}

	level.var_9C7B["idle"] = ::lib_A59F::func_4498;
	level.var_9C7B["duck"] = ::lib_A59F::func_448A;
	level.var_9C7B["duck_once"] = ::lib_A59F::func_448C;
	level.var_9C79["duck_once"] = ::lib_A59F::func_448D;
	level.var_9C7B["weave"] = ::lib_A59F::func_44C2;
	level.var_9C79["weave"] = ::lib_A59F::func_44C3;
	level.var_9C7B["turn_right"] = ::lib_A59F::func_44B6;
	level.var_9C79["turn_right"] = ::lib_A59F::func_44B7;
	level.var_9C7B["turn_left"] = ::lib_A59F::func_44B4;
	level.var_9C79["turn_left"] = ::lib_A59F::func_44B7;
	level.var_9C7B["turn_hardright"] = ::lib_A59F::func_44B3;
	level.var_9C7B["turn_hardleft"] = ::lib_A59F::func_44B2;
	level.var_9C7B["turret_fire"] = ::lib_A59F::func_44B8;
	level.var_9C7B["turret_turnleft"] = ::lib_A59F::func_44B9;
	level.var_9C7B["turret_turnright"] = ::lib_A59F::func_44BA;
	level.var_9C7B["unload"] = ::lib_A59F::func_44BC;
	level.var_9C7B["pre_unload"] = ::lib_A59F::func_44A5;
	level.var_9C79["pre_unload"] = ::lib_A59F::func_44A6;
	level.var_9C7B["idle_alert"] = ::lib_A59F::func_4499;
	level.var_9C79["idle_alert"] = ::lib_A59F::func_449A;
	level.var_9C7B["idle_alert_to_casual"] = ::lib_A59F::func_449B;
	level.var_9C79["idle_alert_to_casual"] = ::lib_A59F::func_449C;
	level.var_9C7B["reaction"] = ::lib_A59F::func_44BA;
}

//Function Number: 31
lib_A59F::func_4497(param_00,param_01)
{
	param_00.var_9CDF = 1;
	thread lib_A59F::func_4486(param_00,param_01);
}

//Function Number: 32
lib_A59F::func_44AE(param_00,param_01)
{
	var_02 = lib_A59F::func_0BE9(self,param_01);
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	param_00.var_8B03 = 1;
	var_03 = 0;
	for(;;)
	{
		var_04 = gettime() + 2000;
		while(gettime() < var_04 && isdefined(param_00.enemy))
		{
			lib_A59F::func_0C74(param_00,var_02.var_85A8,param_00.var_9D40,undefined,undefined,"firing");
		}

		var_05 = randomint(5) + 10;
		for(var_06 = 0;var_06 < var_05;var_06++)
		{
			lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_8B01);
		}
	}
}

//Function Number: 33
lib_A59F::func_44AF(param_00,param_01)
{
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(!isdefined(var_02.var_8B00))
	{
		thread lib_A59F::func_44AE(param_00,param_01);
		return;
	}

	lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_8B00);
	param_00.var_8B03 = 0;
	thread lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 34
lib_A59F::func_2E04(param_00,param_01)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_02 = lib_A59F::func_0BE9(self,param_01);
	for(;;)
	{
		if(self veh_getspeed() == 0)
		{
			param_00.var_9CDC = var_02.var_4B67;
		}
		else
		{
			param_00.var_9CDC = var_02.var_4B63;
		}

		wait(0.25);
	}
}

//Function Number: 35
lib_A59F::func_44A7(param_00,param_01)
{
	var_02 = lib_A59F::func_0BE9(self,param_01);
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	if(isdefined(var_02.var_7179))
	{
		lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_7179);
	}

	thread lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 36
lib_A59F::func_44B9(param_00,param_01)
{
	var_02 = lib_A59F::func_0BE9(self,param_01);
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	lib_A59F::func_0C74(param_00,var_02.var_85A8,param_00.var_9995);
}

//Function Number: 37
lib_A59F::func_44BA(param_00,param_01)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_02 = lib_A59F::func_0BE9(self,param_01);
	lib_A59F::func_0C74(param_00,var_02.var_85A8,param_00.var_9995);
}

//Function Number: 38
lib_A59F::func_44B8(param_00,param_01)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(var_02.var_9D57))
	{
		lib_A5A0::func_5B3() method_814D(var_02.var_9D57);
	}

	if(isdefined(var_02.var_4CD))
	{
		if(isdefined(var_02.var_9951))
		{
			lib_A59F::func_0C74(param_00,var_02.var_9951,var_02.var_4CD);
		}
		else
		{
			lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_4CD);
		}
	}

	thread lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 39
lib_A59F::func_4498(param_00,param_01,param_02)
{
	param_00 endon("newanim");
	if(!isdefined(param_02))
	{
		self endon("death");
	}

	param_00 endon("death");
	param_00.var_9CDF = 1;
	param_00 notify("gotime");
	if(!isdefined(param_00.var_9CDC))
	{
		return;
	}

	var_03 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(var_03.mgturret))
	{
		return;
	}

	if(isdefined(var_03.var_4876) && var_03.var_4876)
	{
		param_00 hide();
	}

	if(isdefined(var_03.var_4B67) && isdefined(var_03.var_4B63))
	{
		thread lib_A59F::func_2E04(param_00,param_01);
	}

	for(;;)
	{
		param_00 notify("idle");
		lib_A59F::func_6981(param_00,var_03);
	}
}

//Function Number: 40
lib_A59F::func_6981(param_00,param_01)
{
	if(isdefined(param_00.var_9CDD))
	{
		lib_A59F::func_0C74(param_00,param_01.var_85A8,param_00.var_9CDD);
		return;
	}

	if(isdefined(param_01.var_4B7B))
	{
		var_02 = lib_A59F::func_7127(param_00,param_01.var_4B7B);
		lib_A59F::func_0C74(param_00,param_01.var_85A8,param_00.var_9CDC[var_02]);
		return;
	}

	if(isdefined(param_01.var_6D20) && isdefined(var_02.var_6B4F))
	{
		lib_A59F::func_0C74(param_01,var_02.var_85A8,var_02.var_6B4F);
		return;
	}

	if(isdefined(var_02.var_9CDC))
	{
		thread lib_A59F::func_7F1C(var_02.var_9CDC);
	}

	lib_A59F::func_0C74(param_01,var_02.var_85A8,param_01.var_9CDC);
}

//Function Number: 41
lib_A59F::func_7127(param_00,param_01)
{
	var_02 = [];
	var_03 = 0;
	for(var_04 = 0;var_04 < param_01.size;var_04++)
	{
		var_03 = var_03 + param_01[var_04];
		var_02[var_04] = var_03;
	}

	var_05 = randomint(var_03);
	for(var_04 = 0;var_04 < param_01.size;var_04++)
	{
		if(var_05 < var_02[var_04])
		{
			return var_04;
		}
	}
}

//Function Number: 42
lib_A59F::func_448D(param_00,param_01)
{
	return isdefined(lib_A59F::func_0BE9(self,param_01).var_2FB5);
}

//Function Number: 43
lib_A59F::func_448C(param_00,param_01)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(var_02.var_2FB5))
	{
		if(isdefined(var_02.var_9CB6))
		{
			thread lib_A59F::func_7F1C(var_02.var_9CB6);
		}

		lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_2FB5);
	}

	thread lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 44
lib_A59F::func_44C3(param_00,param_01)
{
	return isdefined(lib_A59F::func_0BE9(self,param_01).var_A2EE);
}

//Function Number: 45
lib_A59F::func_44C2(param_00,param_01)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(var_02.var_A2EE))
	{
		if(isdefined(var_02.var_9D64))
		{
			thread lib_A59F::func_7F1C(var_02.var_9D64);
		}

		lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_A2EE);
	}

	thread lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 46
lib_A59F::func_448A(param_00,param_01)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(var_02.var_2FBC))
	{
		lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_2FBC);
	}

	thread lib_A59F::func_448B(param_00,param_01);
}

//Function Number: 47
lib_A59F::func_448B(param_00,param_01)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_02 = lib_A59F::func_0BE9(self,param_01);
	var_03 = lib_A59F::func_7127(param_00,var_02.var_2FBB);
	lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_2FBA[var_03]);
}

//Function Number: 48
lib_A59F::func_448E(param_00,param_01)
{
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(var_02.var_2FBD) && param_00.var_2FBD)
	{
		lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_2FBE);
		param_00.var_2FBD = 0;
	}

	thread lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 49
lib_A59F::func_44BE(param_00)
{
	self endon("death");
	self.var_9A3C = common_scripts\utility::array_add(self.var_9A3C,param_00);
	param_00 common_scripts\utility::waittill_any("death","jumpedout");
	self.var_9A3C = common_scripts\utility::array_remove(self.var_9A3C,param_00);
	if(!self.var_9A3C.size)
	{
		lib_A59A::func_32DD("unloaded");
		self.var_9A34 = "default";
	}
}

//Function Number: 50
lib_A59F::func_7509(param_00)
{
	if(!self.var_7507.size)
	{
		return 0;
	}

	for(var_01 = 0;var_01 < self.var_7507.size;var_01++)
	{
		if(!isalive(self.var_7507[var_01]))
		{
			continue;
		}

		if(lib_A59F::func_1CEC(self.var_7507[var_01].var_9D13,param_00))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 51
lib_A59F::func_3EAC()
{
	var_00 = [];
	var_01 = [];
	var_02 = "default";
	if(isdefined(self.var_9A34))
	{
		var_02 = self.var_9A34;
	}

	var_01 = level.var_9D61[self.classname][var_02];
	if(!isdefined(var_01))
	{
		var_01 = level.var_9D61[self.classname]["default"];
	}

	if(isdefined(var_01))
	{
		foreach(var_04 in var_01)
		{
			var_00[var_04] = var_04;
		}
	}

	return var_00;
}

//Function Number: 52
lib_A59F::func_1CEC(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = self.var_9A34;
	}

	var_02 = self.classname;
	if(!isdefined(level.var_9D61[var_02]))
	{
		return 1;
	}

	if(!isdefined(level.var_9D61[var_02][param_01]))
	{
		return 1;
	}

	var_03 = level.var_9D61[var_02][param_01];
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		if(param_00 == var_03[var_04])
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 53
lib_A59F::func_4072(param_00,param_01,param_02)
{
	self endon("unloading");
	lib_A59F::func_0C74(param_00,param_01,param_02);
}

//Function Number: 54
lib_A59F::func_4071(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = self.classname;
	if(param_04)
	{
		thread lib_A59F::func_4072(param_01,param_02,level.var_9C85[var_05][param_00.var_367E].var_4B76);
		self waittill("unloading");
	}

	self.var_9A3C = common_scripts\utility::array_add(self.var_9A3C,param_01);
	thread lib_A59F::func_406E(param_01,param_02,param_03);
	if(!isdefined(self.var_235D))
	{
		lib_A59F::func_0C74(param_01,param_02,param_03);
	}

	param_01 unlink();
	if(!isdefined(self))
	{
		param_01 delete();
		return;
	}

	self.var_9A3C = common_scripts\utility::array_remove(self.var_9A3C,param_01);
	if(!self.var_9A3C.size)
	{
		self notify("unloaded");
	}

	self.var_367E[param_00.var_367E] = undefined;
	wait(10);
	param_01 delete();
}

//Function Number: 55
lib_A59F::func_4070()
{
	wait(0.05);
	while(isalive(self) && self.var_9A3C.size > 2)
	{
		wait(0.05);
	}

	if(!isalive(self) || isdefined(self.var_235D) && self.var_235D)
	{
		return;
	}

	self notify("getoutrig_disable_abort");
}

//Function Number: 56
lib_A59F::func_406F()
{
	self endon("end_getoutrig_abort_while_deploying");
	while(!isdefined(self.var_235D))
	{
		wait(0.05);
	}

	var_00 = [];
	foreach(var_02 in self.var_7507)
	{
		if(isalive(var_02))
		{
			common_scripts\utility::add_to_array(var_00,var_02);
		}
	}

	common_scripts\utility::array_levelthread(var_00,::lib_A59A::func_284D);
	self notify("crashed_while_deploying");
	var_00 = undefined;
}

//Function Number: 57
lib_A59F::func_406E(param_00,param_01,param_02)
{
	var_03 = function_0063(param_02);
	var_04 = var_03 - 1;
	if(self.vehicletype == "mi17")
	{
		var_04 = var_03 - 0.5;
	}

	var_05 = 2.5;
	self endon("getoutrig_disable_abort");
	thread lib_A59F::func_4070();
	thread lib_A59F::func_406F();
	common_scripts\utility::waittill_notify_or_timeout("crashed_while_deploying",var_05);
	self notify("end_getoutrig_abort_while_deploying");
	while(!isdefined(self.var_235D))
	{
		wait(0.05);
	}

	thread lib_A59F::func_0C74(param_00,param_01,param_02);
	waittillframeend;
	param_00 method_8117(param_02,var_04 / var_03);
	var_06 = self;
	if(isdefined(self.var_6E0))
	{
		var_06 = self.var_6E0;
	}

	for(var_07 = 0;var_07 < self.var_7507.size;var_07++)
	{
		if(!isdefined(self.var_7507[var_07]))
		{
			continue;
		}

		if(!isdefined(self.var_7507[var_07].var_70D8))
		{
			continue;
		}

		if(self.var_7507[var_07].var_70D8 != 1)
		{
			continue;
		}

		if(!isdefined(self.var_7507[var_07].var_750B))
		{
			continue;
		}

		self.var_7507[var_07].var_39BD = 1;
		if(isalive(self.var_7507[var_07]))
		{
			thread lib_A59F::func_0C76(self.var_7507[var_07],self,var_06);
		}
	}
}

//Function Number: 58
lib_A59F::func_7F1C(param_00,param_01)
{
	self endon("death");
	self endon("dont_clear_anim");
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	var_02 = function_0063(param_00);
	var_03 = lib_A5A0::func_5B3();
	var_03 endon("death");
	var_03 method_8113("vehicle_anim_flag",param_00,1,0,1);
	wait(var_02);
	if(param_01 && !isdefined(self.var_2D1C) || !self.var_2D1C)
	{
		var_03 method_8142(param_00,0);
	}
}

//Function Number: 59
lib_A59F::func_4069(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	var_03 = self.classname;
	var_04 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(self.var_DE8) && isdefined(self.var_DE8[var_04.var_367E]))
	{
		var_05 = 1;
	}
	else
	{
		var_05 = 0;
	}

	if(!isdefined(var_04.var_367E) || isdefined(self.var_367E[var_04.var_367E]) || var_05)
	{
		return;
	}

	var_06 = param_00 gettagorigin(level.var_9C85[var_03][var_04.var_367E].tag);
	var_07 = param_00 gettagangles(level.var_9C85[var_03][var_04.var_367E].tag);
	self.var_367F[var_04.var_367E] = 1;
	var_08 = spawn("script_model",var_06);
	var_08.var_41 = var_07;
	var_08.var_2E6 = var_06;
	var_08 setmodel(level.var_9C85[var_03][var_04.var_367E].model);
	self.var_367E[var_04.var_367E] = var_08;
	var_08 method_8115(#animtree);
	var_08 linkto(param_00,level.var_9C85[var_03][var_04.var_367E].tag,(0,0,0),(0,0,0));
	thread lib_A59F::func_4071(var_04,var_08,level.var_9C85[var_03][var_04.var_367E].tag,level.var_9C85[var_03][var_04.var_367E].var_2F6C,param_02);
	return var_08;
}

//Function Number: 60
lib_A59F::func_1CE6(param_00)
{
	if(!isdefined(self.var_88A2))
	{
		self.var_88A2 = [];
	}

	var_01 = 0;
	if(!isdefined(self.var_88A2[param_00]))
	{
		self.var_88A2[param_00] = 1;
	}
	else
	{
		var_01 = 1;
	}

	thread lib_A59F::func_1CE7(param_00);
	return var_01;
}

//Function Number: 61
lib_A59F::func_1CE7(param_00)
{
	wait(0.05);
	if(!isdefined(self))
	{
		return;
	}

	self.var_88A2[param_00] = 0;
	var_01 = getarraykeys(self.var_88A2);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(self.var_88A2[var_01[var_02]])
		{
			return;
		}
	}

	self.var_88A2 = undefined;
}

//Function Number: 62
lib_A59F::func_44BD(param_00,param_01)
{
	if(!lib_A59F::func_1CEC(param_01))
	{
		thread lib_A59F::func_4498(param_00,param_01);
		return;
	}

	self.var_9A3C = common_scripts\utility::array_add(self.var_9A3C,param_00);
	var_02 = param_00 [[ param_00.var_2568 ]](self,param_01);
	if(!var_02)
	{
		thread lib_A59F::func_4498(param_00,param_01);
	}
	else
	{
		lib_A59F::func_4488(param_00,param_01);
	}

	self.var_9A3C = common_scripts\utility::array_remove(self.var_9A3C,param_00);
	waittillframeend;
	if(!self.var_9A3C.size)
	{
		lib_A59A::func_32DD("unloaded");
		self.var_9A34 = "default";
	}
}

//Function Number: 63
lib_A59F::func_44BC(param_00,param_01)
{
	if(isdefined(param_00.var_2568))
	{
		lib_A59F::func_44BD(param_00,param_01);
		return;
	}

	var_02 = lib_A59F::func_0BE9(self,param_01);
	var_03 = self.vehicletype;
	if(!lib_A59F::func_1CEC(param_01))
	{
		thread lib_A59F::func_4498(param_00,param_01);
		return;
	}

	if(!isdefined(var_02.var_4066) && !isdefined(var_02.var_14CB))
	{
		thread lib_A59F::func_4498(param_00,param_01);
		return;
	}

	if(isdefined(var_02.var_4876) && var_02.var_4876)
	{
		param_00 show();
	}

	thread lib_A59F::func_44BE(param_00);
	self endon("death");
	if(isai(param_00) && isalive(param_00))
	{
		param_00 endon("death");
	}

	if(isdefined(param_00.var_405D))
	{
		if(isdefined(var_02.delay))
		{
			wait(var_02.delay);
			var_02.delay = undefined;
			param_00.delay = undefined;
		}

		param_00 [[ param_00.var_405D ]]();
	}

	if(isdefined(param_00.var_64E0))
	{
		param_00.var_64E0 = undefined;
		if(isdefined(param_00.var_405D))
		{
			param_00 [[ param_00.var_405D ]]();
		}
	}

	var_04 = lib_A59F::func_3EF8();
	if(isdefined(var_02.var_9CCD))
	{
		var_04 thread lib_A59F::func_7F1C(var_02.var_9CCD,var_02.var_9CCE);
		var_05 = 0;
		if(isdefined(var_02.var_9CD0))
		{
			var_05 = lib_A59F::func_1CE6(var_02.var_9CD0);
			var_06 = var_04 gettagorigin(var_02.var_9CD0);
		}
		else
		{
			var_06 = var_05.var_2E6;
		}

		if(isdefined(var_02.var_9CCF) && !var_05)
		{
			thread common_scripts\utility::play_sound_in_space(var_02.var_9CCF,var_06);
		}

		var_05 = undefined;
	}

	var_07 = 0;
	if(isdefined(var_02.var_406C))
	{
		var_07 = var_07 + function_0063(var_02.var_406C);
	}

	if(isdefined(var_02.delay))
	{
		var_07 = var_07 + var_02.delay;
	}

	if(isdefined(param_00.delay))
	{
		var_07 = var_07 + param_00.delay;
	}

	if(var_07 > 0)
	{
		thread lib_A59F::func_4498(param_00,param_01);
		wait(var_07);
	}

	var_08 = isdefined(var_02.var_4067);
	if(!var_08 && param_00.var_8B03)
	{
		lib_A59F::func_44AF(param_00,param_01);
	}
	else if(!var_08 && !param_00.var_9CDF && isdefined(param_00.var_9CDC))
	{
		param_00 waittill("idle");
	}

	param_00.var_2651 = undefined;
	param_00.var_2652 = undefined;
	param_00 notify("newanim");
	if(isdefined(var_02.var_1433) && !var_02.var_1433)
	{
		if(!isdefined(param_00.var_2AA9))
		{
			param_00 lib_A59A::func_445E();
		}
	}

	if(isai(param_00))
	{
		param_00 method_81A3(1);
	}

	var_09 = 0;
	if(isdefined(var_02.var_14CB))
	{
		var_09 = 1;
	}
	else if(!isdefined(var_02.var_4066) || !isdefined(self.var_7B02) && isdefined(var_02.var_1484) && var_02.var_1484 || isdefined(self.var_7A16) && param_01 == 0)
	{
		thread lib_A59F::func_4498(param_00,param_01);
		return;
	}

	if(param_00 lib_A59F::func_8465())
	{
		param_00.health = param_00.var_6584;
	}

	param_00.var_6584 = undefined;
	if(isai(param_00) && isalive(param_00))
	{
		param_00 endon("death");
	}

	param_00.var_31 = 0;
	if(isdefined(var_02.var_344C))
	{
		var_0A = var_02.var_344C;
	}
	else
	{
		var_0A = var_03.var_85A8;
	}

	if(var_08 && param_00.var_8B03)
	{
		var_0B = var_02.var_4067;
	}
	else if(isdefined(param_01.var_3E07))
	{
		var_0B = param_01.var_3E07;
	}
	else if(isdefined(param_01.var_6D20) && isdefined(var_03.var_6B24))
	{
		var_0B = var_03.var_6B24;
	}
	else
	{
		var_0B = var_03.var_4066;
	}

	if(!var_09)
	{
		if(!isdefined(param_00.var_667C))
		{
			thread lib_A59F::func_44BB(param_00);
		}

		if(isdefined(var_02.var_367E))
		{
			if(!isdefined(self.var_367E[var_02.var_367E]))
			{
				thread lib_A59F::func_4498(param_00,param_01);
				var_0C = lib_A59F::func_4069(var_04,param_00.var_9D13,0);
			}
		}

		if(isdefined(var_02.var_4073))
		{
			param_00 thread lib_A59A::play_sound_on_tag(var_02.var_4073,"J_Wrist_RI",1);
		}

		if(isdefined(param_00.var_6D20) && isdefined(var_02.var_6B25))
		{
			param_00 thread lib_A59A::play_sound_on_entity(var_02.var_6B25);
		}

		if(isdefined(var_02.var_406D))
		{
			param_00 thread lib_A59A::func_6973(var_02.var_406D);
		}

		if(isdefined(param_00.var_6D20) && isdefined(var_02.var_6B27))
		{
			level.var_31D thread common_scripts\utility::play_loop_sound_on_entity(var_02.var_6B27);
		}

		param_00 notify("newanim");
		param_00 notify("jumping_out");
		var_0D = 0;
		if(!isai(param_00))
		{
			var_0D = 1;
		}

		if(!isdefined(param_00.var_7ADA))
		{
			param_00 = lib_A59F::func_447F(param_00,param_01);
		}

		if(!isalive(param_00))
		{
			return;
		}

		param_00.var_70D8 = 1;
		if(isdefined(var_02.var_713C))
		{
			param_00 lib_A59A::func_3096();
		}

		if(isdefined(var_02.var_70D8))
		{
			param_00.var_70D8 = 1;
			if(isdefined(var_02.var_70D7))
			{
				param_00.var_70D7 = var_02.var_70D7;
			}
		}

		if(var_0D)
		{
			self.var_7507 = common_scripts\utility::array_add(self.var_7507,param_00);
			thread lib_A59F::func_4486(param_00,param_01);
			thread lib_A59F::func_44BE(param_00);
			param_00.var_750B = self;
		}

		if(isai(param_00))
		{
			param_00 endon("death");
		}

		param_00 notify("newanim");
		param_00 notify("jumping_out");
		if(isdefined(var_02.var_57B4) && var_02.var_57B4)
		{
			thread lib_A59F::func_8ADC(param_00);
		}

		if(isdefined(var_02.var_406A))
		{
			lib_A59F::func_0C74(param_00,var_0A,var_0B);
			var_0E = var_0A;
			if(isdefined(var_02.var_406B))
			{
				var_0E = var_02.var_406B;
			}

			lib_A59F::func_0C74(param_00,var_0E,var_02.var_406A);
		}
		else if(isdefined(var_02.var_667C))
		{
			if(!isdefined(self.var_B96))
			{
				self.var_B96 = 0;
				self.origin_offset = (0,0,0);
				self.var_9A33 = 0.5;
			}
			else
			{
				self.var_9A33 = self.var_9A33 + randomfloatrange(0.5,1);
				wait(self.var_9A33);
			}

			if(!isdefined(self))
			{
				return;
			}

			var_0F = spawn("script_model",self gettagorigin(var_0A));
			var_0F.var_41 = (0,self.var_41[1] + self.var_B96,0);
			self.var_B96 = self.var_B96 + 5;
			var_0F setmodel("tag_origin");
			var_10 = lib_A59A::func_4414(self.var_2E6) + (0,0,self.var_9A32);
			var_0F.var_2E6 = var_10 + (randomintrange(10,20),randomintrange(10,20),0);
			var_11 = spawn("script_model",var_0F.var_2E6);
			var_11.var_41 = var_0F.var_41;
			var_11 setmodel(self.var_9A38);
			var_11.animname = "parachute";
			var_11 method_8115(level.var_78AE["parachute"]);
			var_11 hide();
			var_11 lib_A59A::func_32DC("parachute_open");
			if(isdefined(var_02.var_6679))
			{
				var_0F lib_A59F::func_667C(param_00,var_11,self.var_9A39,var_0B,var_02.var_6679);
			}
			else
			{
				var_0F lib_A59F::func_667C(param_00,var_11,self.var_9A39,var_0B);
			}

			var_0F delete();
		}
		else
		{
			param_00.var_BBC = 1;
			lib_A59F::func_0C74(param_00,var_0A,var_0B);
		}

		if(isdefined(param_00.var_6D20) && isdefined(var_02.var_6B27))
		{
			level.var_31D thread common_scripts\utility::stop_loop_sound_on_entity(var_02.var_6B27);
		}

		if(isdefined(var_02.var_406D))
		{
			param_00 thread common_scripts\utility::stop_loop_sound_on_entity(var_02.var_406D);
		}

		if(isdefined(param_00.var_6D20) && isdefined(var_02.var_6B26))
		{
			level.var_31D thread lib_A59A::play_sound_on_entity(var_02.var_6B26);
		}
	}
	else if(!isai(param_00))
	{
		if(param_00.var_2E3E == 1)
		{
			param_00 delete();
			return;
		}

		param_00 = lib_A59A::func_9001(param_00);
	}

	self.var_7507 = common_scripts\utility::array_remove(self.var_7507,param_00);
	self.var_9BF5[param_01] = 0;
	param_00.var_750B = undefined;
	param_00.var_2E17 = undefined;
	if(!isalive(self) && !isdefined(var_02.var_9A3B))
	{
		param_00 delete();
		return;
	}

	param_00 unlink();
	if(!isdefined(param_00.var_58D4))
	{
		if(isdefined(param_00.var_6156))
		{
			param_00.var_6156 = undefined;
		}
	}

	if(isalive(param_00))
	{
		if(isai(param_00))
		{
			if(isdefined(param_00.var_7.var_2B18))
			{
				param_00.var_7.var_2B17 = param_00.var_7.var_2B18;
			}
			else
			{
				param_00.var_7.var_2B17 = !param_00 method_813D();
			}
		}

		param_00.var_39B5 = undefined;
		param_00 notify("jumpedout");
		param_00 lib_A59A::func_2A71();
		if(isai(param_00))
		{
			if(isdefined(var_02.var_4074))
			{
				param_00.var_28B3 = var_02.var_4074;
				param_00 method_81CA("crouch");
				param_00 thread animscripts\utility::func_9AED();
				param_00 method_81CA("stand","crouch","prone");
			}

			param_00 method_81A3(0);
			if(lib_A59F::func_44A8(param_00))
			{
				param_00.var_1C7 = 600;
				param_00 method_81A6(param_00.var_2E6);
			}
		}
	}

	if(isdefined(var_02.var_4068) && var_02.var_4068)
	{
		param_00 delete();
		return;
	}

	param_00 lib_A59F::func_4483();
}

//Function Number: 64
lib_A59F::func_667C(param_00,param_01,param_02,param_03,param_04)
{
	param_00 unlink();
	var_05 = param_01 gettagorigin("tag_driver");
	var_06 = param_01 gettagangles("tag_driver");
	param_00 method_81C6(var_05,var_06);
	param_00 linkto(param_01,"tag_driver");
	param_01 method_813E("parachute_unload",self.var_2E6,self.var_41,param_02);
	if(isdefined(param_04))
	{
		param_01 thread lib_A59F::func_667B("parachute_unload","show_parachute",param_04);
	}
	else
	{
		param_01 thread lib_A59F::func_667B("parachute_unload","show_parachute");
	}

	param_00 method_813E("parachute_unload",param_00.var_2E6,param_00.var_41,param_03);
	level thread lib_A59F::func_6678(param_00,param_01);
	param_01 waittillmatch("end","parachute_unload");
	param_01 notify("parachute_landed");
	if(isalive(param_00))
	{
		param_00 unlink();
	}
}

//Function Number: 65
lib_A59F::func_667A(param_00)
{
	var_01 = anglestoforward(param_00.var_41);
	var_02 = vectornormalize(common_scripts\utility::flat_angle(var_01));
	var_03 = self.var_2E6 + var_02 * 10000;
	thread lib_A59A::func_2DB8(self,var_03,1,0,0,10);
	self moveto(var_03,1);
}

//Function Number: 66
lib_A59F::func_6678(param_00,param_01)
{
	param_01 endon("parachute_landed");
	if(isdefined(param_00.var_58D4) && param_00.var_58D4)
	{
		return;
	}

	if(!isai(param_00))
	{
		param_00 setcandamage(1);
	}

	var_02 = undefined;
	var_03 = undefined;
	for(;;)
	{
		param_00 waittill("damage",var_02,var_03);
		if(!isdefined(var_02))
		{
			continue;
		}

		if(var_02 < 1)
		{
			continue;
		}

		if(!isdefined(var_03))
		{
			continue;
		}

		if(isplayer(var_03))
		{
			break;
		}
	}

	if(!param_01 lib_A59A::func_32D7("parachute_open"))
	{
		param_01 notify("rider_dead");
		thread lib_A59F::func_0C76(param_00,undefined,var_03);
		wait(2);
		param_01 delete();
		return;
	}

	iprintln("parachute death anim here!");
}

//Function Number: 67
lib_A59F::func_667B(param_00,param_01,param_02)
{
	self endon("rider_dead");
	self waittillmatch(param_01,param_00);
	if(isdefined(param_02))
	{
		self thread [[ param_02 ]]();
	}

	lib_A59A::func_32DD("parachute_open");
}

//Function Number: 68
lib_A59F::func_44A8(param_00)
{
	if(isdefined(param_00.var_798C))
	{
		return 0;
	}

	if(param_00 lib_A59A::func_46E5())
	{
		return 0;
	}

	if(isdefined(param_00.var_7071))
	{
		return 0;
	}

	if(!isdefined(param_00.target))
	{
		return 1;
	}

	var_01 = getnodearray(param_00.target,"targetname");
	if(var_01.size > 1)
	{
		return 0;
	}

	var_02 = getent(param_00.target,"targetname");
	if(isdefined(var_02) && var_02.classname == "info_volume")
	{
		param_00 method_81A9(var_02);
		return 0;
	}

	return 1;
}

//Function Number: 69
lib_A59F::func_0C74(param_00,param_01,param_02,param_03,param_04,param_05)
{
	param_00 notify("animontag_thread");
	param_00 endon("animontag_thread");
	if(!isdefined(param_05))
	{
		param_05 = "animontagdone";
	}

	if(isdefined(self.modeldummy))
	{
		var_06 = self.modeldummy;
	}
	else
	{
		var_06 = self;
	}

	if(!isdefined(param_01))
	{
		var_07 = param_00.var_2E6;
		var_08 = param_00.var_41;
	}
	else
	{
		var_07 = var_08 gettagorigin(param_03);
		var_08 = var_07 gettagangles(param_02);
	}

	if(isdefined(param_00.var_70D8) && !isdefined(param_00.var_6112))
	{
		level thread lib_A59F::func_0C75(param_00,self);
	}

	param_00 method_813E(param_05,var_07,var_08,param_02);
	if(isai(param_00))
	{
		thread lib_A59F::func_2D05(param_00,var_06,param_05);
	}

	if(isdefined(param_00.var_BBC))
	{
		param_00.var_BBC = undefined;
		var_09 = function_0063(param_02) - 0.25;
		if(var_09 > 0)
		{
			wait(var_09);
		}

		param_00 method_8141();
		param_00.interval = 0;
		param_00 thread lib_A59F::func_728D();
	}
	else
	{
		if(isdefined(param_03))
		{
			for(var_0A = 0;var_0A < param_03.size;var_0A++)
			{
				param_00 waittillmatch(param_03[var_0A],param_05);
				param_00 thread [[ param_04[var_0A] ]]();
			}
		}

		param_00 waittillmatch("end",param_05);
	}

	param_00 notify("anim_on_tag_done");
	param_00.var_70D8 = undefined;
}

//Function Number: 70
lib_A59F::func_728D()
{
	self endon("death");
	wait(2);
	if(self.interval == 0)
	{
		self.interval = 80;
	}
}

//Function Number: 71
lib_A59F::func_0C75(param_00,param_01)
{
	if(isdefined(param_00.var_58D4) && param_00.var_58D4)
	{
		return;
	}

	if(!isai(param_00))
	{
		param_00 setcandamage(1);
	}

	param_00 endon("anim_on_tag_done");
	if(!isdefined(param_00.var_1AF1) || !param_00.var_1AF1)
	{
		thread lib_A59F::func_0C77(param_00,param_01);
	}

	var_02 = undefined;
	var_03 = undefined;
	var_04 = param_01.health <= 0;
	for(;;)
	{
		if(!var_04 && !isdefined(param_01) && param_01.health > 0)
		{
			break;
		}

		param_00 waittill("damage",var_02,var_03);
		if(isdefined(param_00.var_39BD))
		{
			break;
		}

		if(!isdefined(var_02))
		{
			continue;
		}

		if(var_02 < 1)
		{
			continue;
		}

		if(!isdefined(var_03))
		{
			continue;
		}

		if(isplayer(var_03))
		{
			break;
		}
	}

	if(!isalive(param_00))
	{
		return;
	}

	thread lib_A59F::func_0C76(param_00,param_01,var_03);
}

//Function Number: 72
lib_A59F::func_0C76(param_00,param_01,param_02)
{
	param_00.var_2651 = undefined;
	param_00.var_265F = undefined;
	param_00.var_BB9 = 1;
	if(isdefined(param_00.var_70D7))
	{
		var_03 = getmovedelta(param_00.var_70D7,0,1);
		var_04 = physicstrace(param_00.var_2E6 + (0,0,16),param_00.var_2E6 - (0,0,10000));
		var_05 = distance(param_00.var_2E6 + (0,0,16),var_04);
		if(abs(var_03[2] + 16) <= abs(var_05))
		{
			param_00 thread lib_A59A::play_sound_on_entity("generic_death_falling");
			param_00 method_813E("fastrope_fall",param_00.var_2E6,param_00.var_41,param_00.var_70D7);
			param_00 waittillmatch("start_ragdoll","fastrope_fall");
		}
	}

	if(!isdefined(param_00))
	{
		return;
	}

	param_00.var_2651 = undefined;
	param_00.var_265F = undefined;
	param_00.var_BB9 = 1;
	param_00 notify("rope_death",param_02);
	lib_A577::func_263B(param_02);
	param_00 method_8052(param_02.var_2E6,param_02);
	if(isdefined(param_00.var_7ADA))
	{
		param_00 notsolid();
		var_06 = getweaponmodel(param_00.weapon);
		var_07 = param_00.weapon;
		if(isdefined(var_06))
		{
			param_00 detach(var_06,"tag_weapon_right");
			var_08 = param_00 gettagorigin("tag_weapon_right");
			var_09 = param_00 gettagangles("tag_weapon_right");
			level.var_4451 = spawn("weapon_" + var_07,(0,0,0));
			level.var_4451.var_41 = var_09;
			level.var_4451.var_2E6 = var_08;
		}
	}
	else
	{
		param_00 animscripts\shared::func_2F6B();
	}

	if(isdefined(param_00.var_2641))
	{
		if(isdefined(param_00.var_3E08))
		{
			var_0A = 0.33;
			if(isdefined(param_00.var_5C38))
			{
				var_0A = param_00.var_5C38;
			}

			var_0B = param_00 method_814F(param_00.var_3E06);
			if(var_0B < var_0A)
			{
				wait(param_00.var_3E08 * var_0A - var_0B);
			}

			if(function_0294(param_00))
			{
				return;
			}
		}

		var_0C = length(param_00.var_2641);
		var_0D = vectornormalize(param_01 localtoworldcoords(param_00.var_2641) - param_00.var_2E6) * var_0C;
		param_00 method_8024("torso_lower",var_0D);
		return;
	}

	param_00 startragdoll();
}

//Function Number: 73
lib_A59F::func_0C77(param_00,param_01)
{
	param_00 endon("anim_on_tag_done");
	param_00 endon("death");
	param_01 waittill("death",var_02,var_03,var_04);
	var_05 = 0;
	if(isdefined(param_00.var_5C38))
	{
		var_06 = param_00 method_814F(param_00.var_3E06);
		if(var_06 < param_00.var_5C38)
		{
			var_05 = 1;
		}
	}

	if(!function_0294(param_00))
	{
		if(var_05)
		{
			param_00 notify("killanimscript");
			waittillframeend;
			param_00 thread lib_A59F::func_27D9();
		}

		if(isdefined(var_02))
		{
			param_00 method_8052(param_00.var_2E6,var_02);
			return;
		}

		param_00 method_8052();
	}
}

//Function Number: 74
lib_A59F::func_27D9()
{
	wait 0.05;
	if(!function_0294(self))
	{
		self delete();
	}
}

//Function Number: 75
lib_A59F::func_2D05(param_00,param_01,param_02)
{
	param_00 endon("newanim");
	param_01 endon("death");
	param_00 endon("death");
	param_00 animscripts\shared::func_2D05(param_02);
}

//Function Number: 76
lib_A59F::func_0C65(param_00,param_01,param_02,param_03)
{
	param_00 method_813E("movetospot",param_01,param_02,param_03);
	param_00 waittillmatch("end","movetospot");
}

//Function Number: 77
lib_A59F::func_44C1(param_00,param_01,param_02)
{
	if(!isalive(param_00))
	{
		return;
	}

	if(isdefined(self.var_610A))
	{
		return;
	}

	var_03 = lib_A59F::func_0BE9(self,param_00.var_9D13);
	param_00.var_9C86 = param_01;
	if(isdefined(var_03.var_353E))
	{
		return lib_A59F::func_4480(param_00);
	}

	if(isdefined(level.var_9D1C) && isdefined(level.var_9D1C[self.classname]))
	{
		self [[ level.var_9D1C[self.classname] ]]();
		return;
	}

	if(isdefined(var_03.var_9A3B) && isdefined(self))
	{
		if(isdefined(self.var_2D3B) && self.var_2D3B)
		{
			return;
		}

		thread lib_A59F::func_4498(param_00,param_00.var_9D13,1);
		wait(var_03.var_9A3B);
		if(isdefined(param_00) && isdefined(self))
		{
			self.var_4439 = param_00.var_9D13;
			lib_A59E::func_9C77("unload");
		}

		return;
	}

	if(isdefined(param_00))
	{
		if(isdefined(param_00.var_70D8) && param_02 != "bm21_troops")
		{
			return;
		}

		[[ level.var_422B ]]("MOD_RIFLE_BULLET","torso_upper",param_00.var_2E6);
		if(param_02 == "bm21_troops")
		{
			param_00.var_31 = 1;
			param_00 method_8052();
			return;
		}

		param_00 delete();
	}
}

//Function Number: 78
lib_A59F::func_44B7(param_00,param_01)
{
	return isdefined(lib_A59F::func_0BE9(self,param_01).var_991D);
}

//Function Number: 79
lib_A59F::func_44B6(param_00,param_01)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(var_02.var_9D55))
	{
		thread lib_A59F::func_7F1C(var_02.var_9D55);
	}

	lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_991D);
	thread lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 80
lib_A59F::func_44B4(param_00,param_01)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(var_02.var_9D54))
	{
		thread lib_A59F::func_7F1C(var_02.var_9D54);
	}

	lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_9903);
	thread lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 81
lib_A59F::func_44B5(param_00,param_01)
{
	return isdefined(lib_A59F::func_0BE9(self,param_01).var_9903);
}

//Function Number: 82
lib_A59F::func_44B3(param_00,param_01)
{
	var_02 = level.var_9C7A[self.classname][param_01];
	if(isdefined(var_02.var_4B6A))
	{
		param_00.var_9CDD = var_02.var_4B6A;
	}
}

//Function Number: 83
lib_A59F::func_44B2(param_00,param_01)
{
	var_02 = level.var_9C7A[self.classname][param_01];
	if(isdefined(var_02.var_4B69))
	{
		param_00.var_9CDD = var_02.var_4B69;
	}
}

//Function Number: 84
lib_A59F::func_0935()
{
	self endon("death");
	self waittill("loaded");
	lib_A59E::func_4277(self);
}

//Function Number: 85
lib_A59F::func_7E99(param_00,param_01)
{
	var_02 = param_00.var_7AD6;
	if(isdefined(param_00.var_39B5))
	{
		var_02 = param_00.var_39B5;
	}

	if(isdefined(var_02))
	{
		return var_02;
	}

	if(!isdefined(self.var_9BF5))
	{
		return;
	}

	for(var_03 = 0;var_03 < self.var_9BF5.size;var_03++)
	{
		if(self.var_9BF5[var_03])
		{
			continue;
		}

		return var_03;
	}

	if(isdefined(param_00.var_7B13))
	{
	}
}

//Function Number: 86
lib_A59F::func_44A1(param_00,param_01,param_02)
{
	var_03 = lib_A59F::func_0BE9(self,param_01);
	var_04 = self.mgturret[var_03.mgturret];
	if(!isalive(param_00))
	{
		return;
	}

	var_04 endon("death");
	param_00 endon("death");
	if(isdefined(param_02) && param_02 && isdefined(var_03.var_66B1))
	{
		[[ var_03.var_66B1 ]](self,param_00,param_01,var_04);
	}

	lib_A5A0::func_7EDD(var_04);
	var_04 setdefaultdroppitch(0);
	wait(0.1);
	param_00 endon("guy_man_turret_stop");
	level thread lib_A54E::func_5BC5(var_04,lib_A59A::func_3F56());
	var_04 method_8067(1);
	if(isdefined(var_03.var_85AA) && var_03.var_85AA)
	{
		var_04 thread lib_A54F::main(param_00,var_03);
		return;
	}

	for(;;)
	{
		if(!isdefined(param_00 method_8194()))
		{
			param_00 method_818A(var_04);
		}

		wait(1);
	}
}

//Function Number: 87
lib_A59F::func_44BB(param_00)
{
	param_00 endon("jumpedout");
	param_00 waittill("death");
	if(isdefined(param_00))
	{
		param_00 unlink();
	}
}

//Function Number: 88
lib_A59F::func_4480(param_00)
{
	if(!isdefined(param_00.var_9D13))
	{
		return;
	}

	var_01 = param_00.var_9D13;
	var_02 = lib_A59F::func_0BE9(self,var_01);
	if(!isdefined(var_02.var_353E))
	{
		return;
	}

	[[ level.var_422B ]]("MOD_RIFLE_BULLET","torso_upper",param_00.var_2E6);
	param_00.var_2651 = var_02.var_353E;
	var_03 = self.var_41;
	var_04 = param_00.var_2E6;
	if(isdefined(var_02.var_353F))
	{
		var_04 = var_04 + anglestoforward(var_03) * var_02.var_353F[0];
		var_04 = var_04 + anglestoright(var_03) * var_02.var_353F[1];
		var_04 = var_04 + anglestoup(var_03) * var_02.var_353F[2];
	}

	param_00 = lib_A59F::func_21A2(param_00);
	lib_A59F::func_2979(param_00,"weapon_");
	param_00 notsolid();
	param_00.var_2E6 = var_04;
	param_00.var_41 = var_03;
	param_00 method_813E("deathanim",var_04,var_03,var_02.var_353E);
	var_05 = 0.3;
	if(isdefined(var_02.var_3540))
	{
		var_05 = var_02.var_3540;
	}

	var_06 = function_0063(var_02.var_353E);
	var_07 = gettime() + var_06 * 1000;
	wait(var_06 * var_05);
	var_08 = (0,0,1);
	var_09 = param_00.var_2E6;
	if(getdvar("ragdoll_enable") == "0")
	{
		param_00 delete();
		return;
	}

	if(isai(param_00))
	{
		param_00 animscripts\shared::func_2F6B();
	}
	else
	{
		lib_A59F::func_2979(param_00,"weapon_");
	}

	while(!param_00 isragdoll() && gettime() < var_07)
	{
		var_09 = param_00.var_2E6;
		wait(0.05);
		var_08 = param_00.var_2E6 - var_09;
		param_00 startragdoll();
	}

	wait(0.05);
	var_08 = var_08 * 20000;
	for(var_0A = 0;var_0A < 3;var_0A++)
	{
		if(isdefined(param_00))
		{
			var_09 = param_00.var_2E6;
		}

		wait(0.05);
	}

	if(!param_00 isragdoll())
	{
		param_00 delete();
	}
}

//Function Number: 89
lib_A59F::func_21A2(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	var_03 = spawn("script_model",param_00.var_2E6);
	var_03.var_41 = param_00.var_41;
	var_03 setmodel(param_00.model);
	var_04 = param_00 getattachsize();
	for(var_05 = 0;var_05 < var_04 && param_02 || var_05 < 1;var_05++)
	{
		var_03 attach(param_00 getattachmodelname(var_05),param_00 getattachtagname(var_05));
	}

	var_03 method_8115(#animtree);
	if(isdefined(param_00.inliveplayerkillstreak))
	{
		var_03.inliveplayerkillstreak = param_00.inliveplayerkillstreak;
	}

	if(!param_01)
	{
		param_00 delete();
	}

	var_03 method_803C();
	return var_03;
}

//Function Number: 90
lib_A59F::func_9C80(param_00,param_01)
{
	self method_8115(param_01);
	self method_814B(param_00);
}

//Function Number: 91
lib_A59F::func_9CCC(param_00)
{
	var_01 = lib_A59F::func_0BE9(self,param_00);
	return lib_A59F::func_9CC6(var_01.var_3FD0,var_01.var_85A8,param_00);
}

//Function Number: 92
lib_A59F::func_9CC6(param_00,param_01,param_02)
{
	var_03 = spawnstruct();
	var_04 = undefined;
	var_05 = undefined;
	var_06 = self gettagorigin(param_01);
	var_07 = self gettagangles(param_01);
	var_04 = getstartorigin(var_06,var_07,param_00);
	var_05 = getstartangles(var_06,var_07,param_00);
	var_03.var_2E6 = var_04;
	var_03.var_41 = var_05;
	var_03.var_9D13 = param_02;
	return var_03;
}

//Function Number: 93
lib_A59F::func_506B(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		return 1;
	}

	var_03 = param_00.classname;
	var_04 = level.var_9D61[var_03][param_02];
	foreach(var_06 in var_04)
	{
		if(var_06 == param_01)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 94
lib_A59F::func_3CCD(param_00)
{
	var_01 = level.var_9C7A[self.classname];
	var_02 = [];
	var_03 = [];
	for(var_04 = 0;var_04 < self.var_9BF5.size;var_04++)
	{
		if(self.var_9BF5[var_04])
		{
			continue;
		}

		if(isdefined(var_01[var_04].var_3FD0) && lib_A59F::func_506B(self,var_04,param_00))
		{
			var_02[var_02.size] = lib_A59F::func_9CCC(var_04);
			continue;
		}

		var_03[var_03.size] = var_04;
	}

	var_05 = spawnstruct();
	var_05.var_1174 = var_02;
	var_05.var_614E = var_03;
	return var_05;
}

//Function Number: 95
lib_A59F::func_3EF8()
{
	if(isdefined(self.modeldummy))
	{
		return self.modeldummy;
	}

	return self;
}

//Function Number: 96
lib_A59F::func_2979(param_00,param_01)
{
	var_02 = param_00 getattachsize();
	var_03 = [];
	var_04 = [];
	var_05 = 0;
	for(var_06 = 0;var_06 < var_02;var_06++)
	{
		var_07 = param_00 getattachmodelname(var_06);
		var_08 = param_00 getattachtagname(var_06);
		if(issubstr(var_07,param_01))
		{
			var_03[var_05] = var_07;
			var_04[var_05] = var_08;
			var_05++;
		}
	}

	for(var_06 = 0;var_06 < var_03.size;var_06++)
	{
		param_00 detach(var_03[var_06],var_04[var_06]);
	}
}

//Function Number: 97
lib_A59F::func_8465()
{
	if(!isai(self))
	{
		return 0;
	}

	if(!isdefined(self.var_6584))
	{
		return 0;
	}

	return !isdefined(self.var_58D4);
}

//Function Number: 98
lib_A59F::func_44A6(param_00,param_01)
{
	return isdefined(lib_A59F::func_0BE9(self,param_01).var_6EAC);
}

//Function Number: 99
lib_A59F::func_44A5(param_00,param_01)
{
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(!isdefined(var_02.var_6EAC))
	{
		return;
	}

	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_6EAC);
	lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_6EAD);
}

//Function Number: 100
lib_A59F::func_4499(param_00,param_01)
{
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(!isdefined(var_02.var_4B61))
	{
		return;
	}

	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_4B61);
}

//Function Number: 101
lib_A59F::func_449A(param_00,param_01)
{
	return isdefined(lib_A59F::func_0BE9(self,param_01).var_4B61);
}

//Function Number: 102
lib_A59F::func_449B(param_00,param_01)
{
	var_02 = lib_A59F::func_0BE9(self,param_01);
	if(!isdefined(var_02.var_4B61))
	{
		return;
	}

	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	lib_A59F::func_0C74(param_00,var_02.var_85A8,var_02.var_4B62);
	thread lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 103
lib_A59F::func_449C(param_00,param_01)
{
	return isdefined(lib_A59F::func_0BE9(self,param_01).var_4B62);
}

//Function Number: 104
lib_A59F::func_8ADC(param_00)
{
	self waittill("stable_for_unlink");
	if(isalive(param_00))
	{
		param_00 unlink();
	}
}

//Function Number: 105
lib_A59F::func_949D()
{
}

//Function Number: 106
lib_A59F::func_0C57(param_00)
{
	var_01 = [];
	foreach(var_03 in self.var_7507)
	{
		if(!isalive(var_03))
		{
			continue;
		}

		if(isdefined(level.var_9C79[param_00]) && ![[ level.var_9C79[param_00] ]](var_03,var_03.var_9D13))
		{
			continue;
		}

		if(isdefined(level.var_9C7B[param_00]))
		{
			var_03 notify("newanim");
			var_03.var_7096 = [];
			thread [[ level.var_9C7B[param_00] ]](var_03,var_03.var_9D13);
			var_01[var_01.size] = var_03;
			continue;
		}

		var_03 notify("newanim");
		var_03.var_7096 = [];
		thread lib_A59F::func_44C0(var_03,var_03.var_9D13,param_00);
		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 107
lib_A59F::func_44C0(param_00,param_01,param_02)
{
	param_00 endon("newanim");
	self endon("death");
	param_00 endon("death");
	var_03 = lib_A59F::func_0BE9(self,param_01);
	if(isdefined(var_03.var_940[param_02]))
	{
		thread lib_A59F::func_7F1C(var_03.var_940[param_02]);
	}

	lib_A59F::func_0C74(param_00,var_03.var_85A8,var_03.var_93F[param_02]);
	lib_A59F::func_4498(param_00,param_01);
}

//Function Number: 108
lib_A59F::func_4483()
{
	self.var_9CDF = undefined;
	self.var_8B03 = undefined;
	self.var_9D13 = undefined;
	self.delay = undefined;
}

//Function Number: 109
lib_A59F::func_2806()
{
	var_00 = self method_8096();
	var_01 = self getpointinbounds(1,0,0);
	var_02 = distance(var_01,var_00);
	var_03 = function_00D9();
	foreach(var_05 in var_03)
	{
		if(distance(var_05.var_2E6,var_00) < var_02)
		{
			var_05 delete();
		}
	}
}

//Function Number: 110
lib_A59F::func_2B2E()
{
	if(isdefined(self.var_750B))
	{
		self.var_750B lib_A59F::func_4488(self,self.var_9D13);
	}
}

//Function Number: 111
lib_A59F::func_4488(param_00,param_01)
{
	param_00 notify("jumpedout");
	self.var_7507 = common_scripts\utility::array_remove(self.var_7507,param_00);
	self.var_9BF5[param_01] = 0;
	param_00.var_750B = undefined;
	param_00.var_2E17 = undefined;
	param_00 lib_A59F::func_4483();
}