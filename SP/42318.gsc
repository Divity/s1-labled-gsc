/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42318.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 71
 * Decompile Time: 25 ms
 * Timestamp: 4/20/2022 8:23:19 PM
*******************************************************************/

//Function Number: 1
lib_A54E::func_4D14()
{
	level.var_5BD6["easy"]["convergenceTime"] = 2.5;
	level.var_5BD6["easy"]["suppressionTime"] = 3;
	level.var_5BD6["easy"]["accuracy"] = 0.38;
	level.var_5BD6["easy"]["aiSpread"] = 2;
	level.var_5BD6["easy"]["playerSpread"] = 0.5;
	level.var_5BD6["medium"]["convergenceTime"] = 1.5;
	level.var_5BD6["medium"]["suppressionTime"] = 3;
	level.var_5BD6["medium"]["accuracy"] = 0.38;
	level.var_5BD6["medium"]["aiSpread"] = 2;
	level.var_5BD6["medium"]["playerSpread"] = 0.5;
	level.var_5BD6["hard"]["convergenceTime"] = 0.8;
	level.var_5BD6["hard"]["suppressionTime"] = 3;
	level.var_5BD6["hard"]["accuracy"] = 0.38;
	level.var_5BD6["hard"]["aiSpread"] = 2;
	level.var_5BD6["hard"]["playerSpread"] = 0.5;
	level.var_5BD6["fu"]["convergenceTime"] = 0.4;
	level.var_5BD6["fu"]["suppressionTime"] = 3;
	level.var_5BD6["fu"]["accuracy"] = 0.38;
	level.var_5BD6["fu"]["aiSpread"] = 2;
	level.var_5BD6["fu"]["playerSpread"] = 0.5;
}

//Function Number: 2
lib_A54E::main()
{
	if(getdvar("mg42") == "")
	{
		setdvar("mgTurret","off");
	}

	level.var_58D6 = 24;
	var_00 = getentarray("turretInfo","targetname");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_00[var_01] delete();
	}
}

//Function Number: 3
lib_A54E::func_6E47()
{
	self detach("weapon_mg42_carry","tag_origin");
	self endon("death");
	self.var_1C7 = level.var_277F;
	if(isdefined(self.target))
	{
		var_00 = getnode(self.target,"targetname");
		if(isdefined(var_00))
		{
			if(isdefined(var_00.radius))
			{
				self.var_1C7 = var_00.radius;
			}

			self method_81A5(var_00);
		}
	}

	while(!isdefined(self.node))
	{
		wait(0.05);
	}

	var_01 = undefined;
	if(isdefined(self.target))
	{
		var_00 = getnode(self.target,"targetname");
		var_01 = var_00;
	}

	if(!isdefined(var_01))
	{
		var_01 = self.node;
	}

	if(!isdefined(var_01))
	{
		return;
	}

	if(var_01.type != "Turret")
	{
		return;
	}

	var_02 = lib_A54E::func_4102();
	var_02[self.node.var_2E6 + ""] = undefined;
	if(isdefined(var_02[var_01.var_2E6 + ""]))
	{
		return;
	}

	var_03 = var_01.turret;
	if(isdefined(var_03.var_377))
	{
		return;
	}

	lib_A54E::func_741B(var_03);
	if(var_03.var_519B)
	{
		lib_A54E::func_5662(var_03);
	}
	else
	{
		lib_A54E::func_76BB(var_03);
	}

	lib_A54D::func_4473(var_01.turret);
}

//Function Number: 4
lib_A54E::func_5BC9()
{
	self waittill("trigger");
	level notify(self.targetname);
	level.var_5BC9[self.targetname] = 1;
	self delete();
}

//Function Number: 5
lib_A54E::func_5BD3(param_00)
{
	param_00 waittill("trigger");
	var_01 = function_00D6("bad_guys");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(isdefined(var_01[var_02].var_7A30) && param_00.var_7A30 == var_01[var_02].var_7A30)
		{
			var_01[var_02] notify("auto_ai");
		}
	}

	var_03 = function_00D8();
	for(var_02 = 0;var_02 < var_03.size;var_02++)
	{
		if(isdefined(var_03[var_02].var_7A30) && param_00.var_7A30 == var_03[var_02].var_7A30)
		{
			var_03[var_02].var_905 = "auto_ai";
		}
	}

	lib_A577::func_533B(param_00);
}

//Function Number: 6
lib_A54E::func_5BC6(param_00)
{
	self endon("death");
	self endon("stop_suppressionFire");
	if(!isdefined(self.var_8FDD))
	{
		self.var_8FDD = 1;
	}

	for(;;)
	{
		while(self.var_8FDD)
		{
			self settargetentity(param_00[randomint(param_00.size)]);
			wait(2 + randomfloat(2));
		}

		self cleartargetentity();
		while(!self.var_8FDD)
		{
			wait(1);
		}
	}
}

//Function Number: 7
lib_A54E::func_5972(param_00)
{
	var_01 = self.var_2E6;
	self waittill("auto_ai");
	param_00 notify("stopfiring");
	param_00 setmode("auto_ai");
	param_00 settargetentity(level.var_31D);
}

//Function Number: 8
lib_A54E::func_192C(param_00)
{
	if(param_00 == "delay")
	{
		return 0.2;
	}

	if(param_00 == "delay_range")
	{
		return 0.5;
	}

	if(param_00 == "burst")
	{
		return 0.5;
	}

	return 1.5;
}

//Function Number: 9
lib_A54E::func_192D()
{
	self endon("death");
	self endon("stop_burst_fire_unmanned");
	if(isdefined(self.script_delay_min))
	{
		var_00 = self.script_delay_min;
	}
	else
	{
		var_00 = lib_A54E::func_192C("delay");
	}

	if(isdefined(self.script_delay_max))
	{
		var_01 = self.script_delay_max - var_00;
	}
	else
	{
		var_01 = lib_A54E::func_192C("delay_range");
	}

	if(isdefined(self.var_7964))
	{
		var_02 = self.var_7964;
	}
	else
	{
		var_02 = lib_A54E::func_192C("burst");
	}

	if(isdefined(self.var_7963))
	{
		var_03 = self.var_7963 - var_02;
	}
	else
	{
		var_03 = lib_A54E::func_192C("burst_range");
	}

	var_04 = gettime();
	var_05 = "start";
	if(isdefined(self.var_83B2))
	{
		thread lib_A54E::func_9985();
	}

	for(;;)
	{
		var_06 = var_04 - gettime() * 0.001;
		if(self isfiringturret() && var_06 <= 0)
		{
			if(var_05 != "fire")
			{
				var_05 = "fire";
				thread lib_A54E::func_2D78();
			}

			var_06 = var_02 + randomfloat(var_03);
			thread lib_A54E::func_99BB(var_06);
			self waittill("turretstatechange");
			var_06 = var_00 + randomfloat(var_01);
			var_04 = gettime() + int(var_06 * 1000);
			continue;
		}

		if(var_05 != "aim")
		{
			var_05 = "aim";
		}

		thread lib_A54E::func_99BB(var_06);
		self waittill("turretstatechange");
	}
}

//Function Number: 10
lib_A54E::func_2D78()
{
	self endon("death");
	self endon("turretstatechange");
	for(;;)
	{
		self shootturret();
		self notify("turret_fire");
		wait(0.1);
	}
}

//Function Number: 11
lib_A54E::func_9985()
{
	self endon("death");
	self endon("stop_burst_fire_unmanned");
	if(isdefined(self.var_83B3))
	{
		self.var_83B4 = 1;
	}

	for(;;)
	{
		self waittill("turret_fire");
		playfxontag(self.var_83B2,self,"tag_origin");
		if(isdefined(self.var_83B4) && self.var_83B4)
		{
			thread lib_A54E::func_9986();
		}
	}
}

//Function Number: 12
lib_A54E::func_9986()
{
	self endon("death");
	self.var_83B4 = 0;
	var_00 = self gettagorigin("tag_origin");
	var_01 = common_scripts\utility::drop_to_ground(var_00,-30);
	var_02 = var_00[2] - var_01[2];
	var_03 = var_02 / 300;
	wait(var_03);
	level thread common_scripts\utility::play_sound_in_space(self.var_83B3,var_01);
	wait(1);
	self.var_83B4 = 1;
}

//Function Number: 13
lib_A54E::func_99BB(param_00)
{
	if(param_00 <= 0)
	{
		return;
	}

	self endon("turretstatechange");
	wait(param_00);
	if(isdefined(self))
	{
		self notify("turretstatechange");
	}
}

//Function Number: 14
lib_A54E::func_7116(param_00)
{
	self endon("death");
	self notify("stop random_spread");
	self endon("stop random_spread");
	self endon("stopfiring");
	self settargetentity(param_00);
	for(;;)
	{
		if(isplayer(param_00))
		{
			param_00.var_2E6 = self.var_5971 getorigin();
		}
		else
		{
			param_00.var_2E6 = self.var_5971.var_2E6;
		}

		param_00.var_2E6 = param_00.var_2E6 + (20 - randomfloat(40),20 - randomfloat(40),20 - randomfloat(60));
		wait(0.2);
	}
}

//Function Number: 15
lib_A54E::func_5BC1(param_00)
{
	self notify("stop_using_built_in_burst_fire");
	self endon("stop_using_built_in_burst_fire");
	param_00 stopfiring();
	for(;;)
	{
		param_00 waittill("startfiring");
		thread lib_A54E::func_192B(param_00);
		param_00 startfiring();
		param_00 waittill("stopfiring");
		param_00 stopfiring();
	}
}

//Function Number: 16
lib_A54E::func_192B(param_00,param_01)
{
	param_00 endon("stopfiring");
	self endon("stop_using_built_in_burst_fire");
	if(isdefined(param_00.script_delay_min))
	{
		var_02 = param_00.script_delay_min;
	}
	else
	{
		var_02 = lib_A54E::func_192C("delay");
	}

	if(isdefined(param_00.script_delay_max))
	{
		var_03 = param_00.script_delay_max - var_02;
	}
	else
	{
		var_03 = lib_A54E::func_192C("delay_range");
	}

	if(isdefined(param_00.var_7964))
	{
		var_04 = param_00.var_7964;
	}
	else
	{
		var_04 = lib_A54E::func_192C("burst");
	}

	if(isdefined(param_00.var_7963))
	{
		var_05 = param_00.var_7963 - var_04;
	}
	else
	{
		var_05 = lib_A54E::func_192C("burst_range");
	}

	for(;;)
	{
		param_00 startfiring();
		if(isdefined(param_01))
		{
			param_00 thread lib_A54E::func_7116(param_01);
		}

		wait(var_04 + randomfloat(var_05));
		param_00 stopfiring();
		wait(var_02 + randomfloat(var_03));
	}
}

//Function Number: 17
lib_A54E::func_0663()
{
	if(!isdefined(self.var_3862))
	{
		self.var_3862 = 0;
	}

	if(!isdefined(self.targetname))
	{
		return;
	}

	var_00 = getnode(self.targetname,"target");
	if(!isdefined(var_00))
	{
		return;
	}

	if(!isdefined(var_00.var_7A2F))
	{
		return;
	}

	if(!isdefined(var_00.var_5BC0))
	{
		var_00.var_5BC0 = 1;
	}

	self.var_7A2F = var_00.var_7A2F;
	var_01 = 1;
	for(;;)
	{
		if(var_01)
		{
			var_01 = 0;
			if(isdefined(var_00.targetname) || self.var_3862)
			{
				self waittill("get new user");
			}
		}

		if(!var_00.var_5BC0)
		{
			var_00 waittill("enable mg42");
			var_00.var_5BC0 = 1;
		}

		var_02 = [];
		var_03 = function_00D6();
		for(var_04 = 0;var_04 < var_03.size;var_04++)
		{
			var_05 = 1;
			if(isdefined(var_03[var_04].var_7A2F) && var_03[var_04].var_7A2F == self.var_7A2F)
			{
				var_05 = 0;
			}

			if(isdefined(var_03[var_04].var_9BED))
			{
				var_05 = 1;
			}

			if(var_05)
			{
				var_02[var_02.size] = var_03[var_04];
			}
		}

		if(var_02.size)
		{
			var_03 = lib_A59A::func_3CED(var_00.var_2E6,undefined,var_02);
		}
		else
		{
			var_03 = lib_A59A::func_3CEC(var_00.var_2E6,undefined);
		}

		var_02 = undefined;
		if(isdefined(var_03))
		{
			var_03 notify("stop_going_to_node");
			var_03 thread lib_A577::func_423E(var_00);
			var_03 waittill("death");
			continue;
		}

		self waittill("get new user");
	}
}

//Function Number: 18
lib_A54E::func_5BC8()
{
	if(!isdefined(self.var_905))
	{
		self.var_905 = "manual_ai";
	}

	var_00 = getnode(self.target,"targetname");
	if(!isdefined(var_00))
	{
		return;
	}

	var_01 = getent(var_00.target,"targetname");
	var_01.var_657E = var_00.var_2E6;
	if(isdefined(var_01.target))
	{
		if(!isdefined(level.var_5BC9) || !isdefined(level.var_5BC9[var_01.target]))
		{
			level.var_5BC9[var_01.target] = 0;
			getent(var_01.target,"targetname") thread lib_A54E::func_5BC9();
		}

		var_02 = 1;
	}
	else
	{
		var_02 = 0;
	}

	for(;;)
	{
		if(self.count == 0)
		{
			return;
		}

		var_03 = undefined;
		while(!isdefined(var_03))
		{
			var_03 = self method_8093();
			wait(1);
		}

		var_03 thread lib_A54E::func_5BC3(var_01,var_02,self.var_905);
		var_03 thread lib_A54E::func_5BC1(var_01);
		var_03 waittill("death");
		if(isdefined(self.script_delay))
		{
			wait(self.script_delay);
			continue;
		}

		if(isdefined(self.script_delay_min) && isdefined(self.script_delay_max))
		{
			wait(self.script_delay_min + randomfloat(self.script_delay_max - self.script_delay_min));
			continue;
		}

		wait(1);
	}
}

//Function Number: 19
lib_A54E::func_5328(param_00,param_01,param_02,param_03)
{
	param_00 waittill(param_01);
	if(isdefined(param_02))
	{
		param_02 delete();
	}

	if(isdefined(param_03))
	{
		param_03 delete();
	}
}

//Function Number: 20
lib_A54E::func_5BC3(param_00,param_01,param_02)
{
	self endon("death");
	if(param_02 == "manual_ai")
	{
		for(;;)
		{
			thread lib_A54E::func_5BC2(param_00,param_01);
			self waittill("auto_ai");
			lib_A54E::func_5F3B(param_00,"auto_ai");
			self waittill("manual_ai");
		}

		return;
	}

	for(;;)
	{
		lib_A54E::func_5F3B(param_00,"auto_ai",level.var_31D);
		self waittill("manual_ai");
		thread lib_A54E::func_5BC2(param_00,param_01);
		self waittill("auto_ai");
	}
}

//Function Number: 21
lib_A54E::func_6BEF()
{
	if(!isdefined(level.var_6ABA))
	{
		return 0;
	}

	if(level.var_31D getstance() == "prone")
	{
		return 1;
	}

	if(level.var_6ABB == "cow" && level.var_31D getstance() == "crouch")
	{
		return 1;
	}

	return 0;
}

//Function Number: 22
lib_A54E::func_8AF3()
{
	if(level.var_31D getstance() == "prone")
	{
		return (0,0,5);
	}
	else if(level.var_31D getstance() == "crouch")
	{
		return (0,0,25);
	}

	return (0,0,50);
}

//Function Number: 23
lib_A54E::func_5BC2(param_00,param_01)
{
	self endon("death");
	self endon("auto_ai");
	self.var_2EA = 1;
	self method_81A6(param_00.var_657E);
	self.var_1C7 = level.var_58D6;
	self waittill("goal");
	if(param_01)
	{
		if(!level.var_5BC9[param_00.target])
		{
			level waittill(param_00.target);
		}
	}

	self.var_2EA = 0;
	param_00 setmode("auto_ai");
	param_00 cleartargetentity();
	var_02 = spawn("script_origin",(0,0,0));
	var_03 = spawn("script_model",(0,0,0));
	var_03.var_782A = 3;
	if(getdvar("mg42") != "off")
	{
		var_03 setmodel("temp");
	}

	var_03 thread lib_A54E::func_926D(param_00,var_02);
	level thread lib_A54E::func_5328(self,"death",var_02,var_03);
	level thread lib_A54E::func_5328(self,"auto_ai",var_02,var_03);
	param_00.var_6C2A = 0;
	var_04 = 0;
	var_05 = getentarray("mg42_target","targetname");
	if(var_05.size > 0)
	{
		var_06 = 1;
		var_07 = var_05[randomint(var_05.size)].var_2E6;
		thread lib_A54E::func_83D7(var_05);
		lib_A54E::func_5F3B(param_00);
		self.var_919B = var_02;
		param_00 setmode("manual_ai");
		param_00 settargetentity(var_02);
		param_00 notify("startfiring");
		var_08 = 15;
		var_09 = 0.08;
		var_0A = 0.05;
		var_02.var_2E6 = var_05[randomint(var_05.size)].var_2E6;
		var_0B = 0;
		while(!isdefined(level.var_6ABA))
		{
			var_07 = var_02.var_2E6;
			if(distance(var_07,var_05[self.var_4463].var_2E6) > var_08)
			{
				var_0C = vectornormalize(var_05[self.var_4463].var_2E6 - var_07);
				var_0C = var_0C * var_08;
				var_07 = var_07 + var_0C;
			}
			else
			{
				self notify("next_target");
			}

			var_02.var_2E6 = var_07;
			wait(0.1);
		}

		for(;;)
		{
			for(var_0D = 0;var_0D < 1;var_0D = var_0D + var_0A)
			{
				var_02.var_2E6 = var_07 * 1 - var_0D + level.var_31D getorigin() + lib_A54E::func_8AF3() * var_0D;
				if(lib_A54E::func_6BEF())
				{
					var_0D = 2;
				}

				wait(var_09);
			}

			var_0E = level.var_31D getorigin();
			while(!lib_A54E::func_6BEF())
			{
				var_02.var_2E6 = level.var_31D getorigin();
				var_0F = var_02.var_2E6 - var_0E;
				var_02.var_2E6 = var_02.var_2E6 + var_0F + lib_A54E::func_8AF3();
				var_0E = level.var_31D getorigin();
				wait(0.1);
			}

			if(lib_A54E::func_6BEF())
			{
				var_0B = gettime() + 1500 + randomfloat(4000);
				while(lib_A54E::func_6BEF() && isdefined(level.var_6ABA.target) && gettime() < var_0B)
				{
					var_10 = getentarray(level.var_6ABA.target,"targetname");
					var_10 = var_10[randomint(var_10.size)];
					var_02.var_2E6 = var_10.var_2E6 + (randomfloat(30) - 15,randomfloat(30) - 15,randomfloat(40) - 60);
					wait(0.1);
				}
			}

			self notify("next_target");
			while(lib_A54E::func_6BEF())
			{
				var_07 = var_02.var_2E6;
				if(distance(var_07,var_05[self.var_4463].var_2E6) > var_08)
				{
					var_0C = vectornormalize(var_05[self.var_4463].var_2E6 - var_07);
					var_0C = var_0C * var_08;
					var_07 = var_07 + var_0C;
				}
				else
				{
					self notify("next_target");
				}

				var_02.var_2E6 = var_07;
				wait(0.1);
			}
		}

		return;
	}

	for(;;)
	{
		lib_A54E::func_5F3B(param_00);
		while(!isdefined(level.var_6ABA))
		{
			if(!param_00.var_6C2A)
			{
				param_00 settargetentity(level.var_31D);
				param_00.var_6C2A = 1;
				var_03.var_9190 = level.var_31D;
			}

			wait(0.2);
		}

		param_00 setmode("manual_ai");
		lib_A54E::func_5F3B(param_00);
		param_00 notify("startfiring");
		var_0B = gettime() + 1500 + randomfloat(4000);
		while(var_0B > gettime())
		{
			if(isdefined(level.var_6ABA))
			{
				var_10 = getentarray(level.var_6ABA.target,"targetname");
				var_10 = var_10[randomint(var_10.size)];
				var_02.var_2E6 = var_10.var_2E6 + (randomfloat(30) - 15,randomfloat(30) - 15,randomfloat(40) - 60);
				param_00 settargetentity(var_02);
				var_03.var_9190 = var_02;
				wait(randomfloat(1));
				continue;
			}

			break;
		}

		param_00 notify("stopfiring");
		lib_A54E::func_5F3B(param_00);
		if(param_00.var_6C2A)
		{
			param_00 setmode("auto_ai");
			param_00 cleartargetentity();
			param_00.var_6C2A = 0;
			var_03.var_9190 = var_03;
			var_03.var_2E6 = (0,0,0);
		}

		while(isdefined(level.var_6ABA))
		{
			wait(0.2);
		}

		wait(0.75 + randomfloat(0.2));
	}
}

//Function Number: 24
lib_A54E::func_83D7(param_00)
{
	self endon("death");
	for(;;)
	{
		var_01 = [];
		for(var_02 = 0;var_02 < param_00.size;var_02++)
		{
			var_01[var_02] = 0;
		}

		for(var_02 = 0;var_02 < param_00.size;var_02++)
		{
			self.var_4463 = randomint(param_00.size);
			self waittill("next_target");
			while(var_01[self.var_4463])
			{
				self.var_4463++;
				if(self.var_4463 >= param_00.size)
				{
					self.var_4463 = 0;
				}
			}

			var_01[self.var_4463] = 1;
		}
	}
}

//Function Number: 25
lib_A54E::func_5F3B(param_00,param_01,param_02)
{
	self method_81A6(param_00.var_657E);
	self.var_1C7 = level.var_58D6;
	self waittill("goal");
	if(isdefined(param_01) && param_01 == "auto_ai")
	{
		param_00 setmode("auto_ai");
		if(isdefined(param_02))
		{
			param_00 settargetentity(param_02);
		}
		else
		{
			param_00 cleartargetentity();
		}
	}

	self method_818A(param_00);
}

//Function Number: 26
lib_A54E::func_926D(param_00,param_01)
{
	if(getdvar("mg42") == "off")
	{
		return;
	}

	self.var_9190 = self;
	for(;;)
	{
		self.var_2E6 = param_01.var_2E6;
		wait(0.1);
	}
}

//Function Number: 27
lib_A54E::func_9991(param_00)
{
	var_01 = getent(param_00.var_1125,"targetname");
	var_02 = 0.5;
	if(isdefined(var_01.var_7AFC))
	{
		var_02 = var_01.var_7AFC;
	}

	var_03 = 2;
	if(isdefined(var_01.var_7AFB))
	{
		var_02 = var_01.var_7AFB;
	}

	for(;;)
	{
		var_01 waittill("turret_deactivate");
		wait(var_02 + randomfloat(var_03 - var_02));
		while(!function_0097(var_01))
		{
			lib_A54E::func_9950(param_00,var_01);
			wait(1);
		}
	}
}

//Function Number: 28
lib_A54E::func_9950(param_00,param_01)
{
	var_02 = function_00D6();
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		if(var_02[var_03] method_815F(param_00.var_2E6) && var_02[var_03] method_818C(param_01))
		{
			var_04 = var_02[var_03].var_234;
			var_02[var_03].var_234 = 0;
			if(!var_02[var_03] method_81F0(param_00))
			{
				var_02[var_03].var_234 = var_04;
			}
		}
	}
}

//Function Number: 29
lib_A54E::func_7F4B()
{
	lib_A54E::func_4D14();
	var_00 = getentarray("misc_turret","code_classname");
	var_01 = lib_A59A::func_3F56();
	var_02 = 0;
	if(var_02 < var_00.size)
	{
		if(isdefined(var_00[var_02].var_7ABF))
		{
			switch(var_00[var_02].var_7ABF)
			{
				case "easy":
					break;

				case "medium":
					break;

				case "hard":
					break;

				case "fu":
					break;

				default:
					break;
			}
		}
	}
}

//Function Number: 30
lib_A54E::func_5BC5(param_00,param_01)
{
	param_00.var_D5 = level.var_5BD6[param_01]["convergenceTime"];
	param_00.suppressiontime = level.var_5BD6[param_01]["suppressionTime"];
	param_00.var_A = level.var_5BD6[param_01]["accuracy"];
	param_00.var_9A2 = level.var_5BD6[param_01]["aiSpread"];
	param_00.var_6D5C = level.var_5BD6[param_01]["playerSpread"];
}

//Function Number: 31
lib_A54E::func_5BC7(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 0.88;
	}

	self endon("death");
	self notify("stop_mg42_target_drones");
	self endon("stop_mg42_target_drones");
	self.var_2F07 = 0;
	if(!isdefined(self.var_79CB))
	{
		self.var_79CB = 0;
	}

	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	self setmode("manual_ai");
	var_03 = lib_A59A::func_3F56();
	if(!isdefined(level.var_2F19))
	{
		var_04 = 1;
	}
	else
	{
		var_04 = 0;
	}

	for(;;)
	{
		if(var_04)
		{
			if(isdefined(self.var_2F23))
			{
				self setmode(self.var_279A);
			}
			else if(param_00)
			{
				self setmode("auto_nonai");
			}
			else
			{
				self setmode("auto_ai");
			}

			level waittill("new_drone");
		}

		if(!isdefined(self.var_63C5))
		{
			self.var_63C5 = self.var_D5;
		}

		self.var_D5 = 2;
		if(!param_00)
		{
			var_05 = self getturretowner();
			if(!isalive(var_05) || isplayer(var_05))
			{
				wait(0.05);
				continue;
			}
			else
			{
				param_01 = var_05.inliveplayerkillstreak;
			}
		}
		else
		{
			var_05 = undefined;
		}

		if(param_01 == "allies")
		{
			var_06 = "axis";
		}
		else
		{
			var_06 = "allies";
		}

		while(level.var_2F19[var_06].var_55AB)
		{
			common_scripts\utility::lock("mg42_drones");
			if(!level.var_2F19[var_06].var_55AB)
			{
				common_scripts\utility::unlock("mg42_drones");
				break;
			}

			var_07 = lib_A54E::func_3CD9(var_06,param_02);
			common_scripts\utility::unlock("mg42_drones");
			if(!isdefined(self.var_79CB) || !self.var_79CB)
			{
				wait(0.05);
				break;
			}

			if(!isdefined(var_07))
			{
				wait(0.05);
				break;
			}

			if(isdefined(self.var_C47))
			{
				[[ self.var_C47 ]]();
			}

			if(param_00)
			{
				self setmode("manual");
			}
			else
			{
				self setmode("manual_ai");
			}

			self settargetentity(var_07,(0,0,32));
			lib_A54E::func_2ED6(var_07,1,param_02);
			self cleartargetentity();
			self stopfiring();
			if(!param_00 && !isdefined(self getturretowner()) && self getturretowner() == var_05)
			{
				break;
			}
		}

		self.var_D5 = self.var_63C5;
		self.var_63C5 = undefined;
		self cleartargetentity();
		self stopfiring();
		if(level.var_2F19[var_06].var_55AB)
		{
			var_04 = 0;
			continue;
		}

		var_04 = 1;
	}
}

//Function Number: 32
lib_A54E::func_2ED6(param_00,param_01,param_02)
{
	self endon("death");
	param_00 endon("death");
	var_03 = gettime() + param_01 * 1000;
	var_04 = 0;
	while(var_03 > gettime() || var_04)
	{
		common_scripts\utility::lock("mg42_drones_target_trace");
		var_05 = self getturrettarget(1);
		if(!bullettracepassed(self gettagorigin("tag_flash"),param_00.var_2E6 + (0,0,40),0,param_00))
		{
			common_scripts\utility::unlock("mg42_drones_target_trace");
			break;
		}
		else if(isdefined(var_05) && distance(var_05.var_2E6,self.var_2E6) < distance(self.var_2E6,param_00.var_2E6))
		{
			common_scripts\utility::unlock("mg42_drones_target_trace");
			break;
		}

		if(!var_04)
		{
			self startfiring();
			var_04 = 1;
		}

		common_scripts\utility::unlock_wait("mg42_drones_target_trace");
	}

	self stopfiring();
	lib_A59A::func_8F63(level.var_2F19[param_00.inliveplayerkillstreak],1);
}

//Function Number: 33
lib_A54E::func_3CD9(param_00,param_01)
{
	if(level.var_2F19[param_00].var_55AB < 1)
	{
		return;
	}

	var_02 = undefined;
	var_03 = anglestoforward(self.var_41);
	for(var_04 = 0;var_04 < level.var_2F19[param_00].var_55AB;var_04++)
	{
		if(!isdefined(level.var_2F19[param_00].var_CD8[var_04]))
		{
			continue;
		}

		var_05 = vectortoangles(level.var_2F19[param_00].var_CD8[var_04].var_2E6 - self.var_2E6);
		var_06 = anglestoforward(var_05);
		if(vectordot(var_03,var_06) < param_01)
		{
			continue;
		}

		var_02 = level.var_2F19[param_00].var_CD8[var_04];
		if(!bullettracepassed(self gettagorigin("tag_flash"),var_02 method_8096(),0,var_02))
		{
			var_02 = undefined;
			continue;
		}

		break;
	}

	var_07 = self getturrettarget(1);
	if(!isdefined(self.var_6EF3))
	{
		if(isdefined(var_02) && isdefined(var_07) && distancesquared(self.var_2E6,var_07.var_2E6) < distancesquared(self.var_2E6,var_02.var_2E6))
		{
			var_02 = undefined;
		}
	}

	return var_02;
}

//Function Number: 34
lib_A54E::func_781D(param_00)
{
	var_01 = getentarray("misc_turret","code_classname");
	var_02 = [];
	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		if(isdefined(var_01[var_03].targetname))
		{
			continue;
		}

		if(isdefined(var_01[var_03].var_51FC))
		{
			continue;
		}

		var_02[var_01[var_03].var_2E6 + ""] = var_01[var_03];
	}

	if(!var_02.size)
	{
		return;
	}

	for(var_04 = 0;var_04 < param_00.size;var_04++)
	{
		var_05 = param_00[var_04];
		if(var_05.type == "Path")
		{
			continue;
		}

		if(var_05.type == "Begin")
		{
			continue;
		}

		if(var_05.type == "End")
		{
			continue;
		}

		var_06 = anglestoforward((0,var_05.var_41[1],0));
		foreach(var_0B, var_08 in var_02)
		{
			if(distance(var_05.var_2E6,var_08.var_2E6) > 50)
			{
				continue;
			}

			var_09 = anglestoforward((0,var_08.var_41[1],0));
			var_0A = vectordot(var_06,var_09);
			if(var_0A < 0.9)
			{
				continue;
			}

			var_05.var_99AB = spawn("script_origin",var_08.var_2E6);
			var_05.var_99AB.var_41 = var_08.var_41;
			var_05.var_99AB.node = var_05;
			var_05.var_99AB.leftarc = 45;
			var_05.var_99AB.rightarc = 45;
			var_05.var_99AB.toparc = 15;
			var_05.var_99AB.bottomarc = 15;
			if(isdefined(var_08.leftarc))
			{
				var_05.var_99AB.leftarc = min(var_08.leftarc,45);
			}

			if(isdefined(var_08.rightarc))
			{
				var_05.var_99AB.rightarc = min(var_08.rightarc,45);
			}

			if(isdefined(var_08.toparc))
			{
				var_05.var_99AB.toparc = min(var_08.toparc,15);
			}

			if(isdefined(var_08.bottomarc))
			{
				var_05.var_99AB.bottomarc = min(var_08.bottomarc,15);
			}

			var_02[var_0B] = undefined;
			var_08 delete();
		}
	}
}

//Function Number: 35
lib_A54E::func_1126(param_00)
{
	var_01 = getentarray("misc_turret","code_classname");
	var_02 = [];
	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		if(!isdefined(var_01[var_03].targetname) || tolower(var_01[var_03].targetname) != "auto_mgturret")
		{
			continue;
		}

		if(!isdefined(var_01[var_03].var_3582))
		{
			continue;
		}

		if(!isdefined(var_01[var_03].var_79A3))
		{
			var_02[var_01[var_03].var_2E6 + ""] = var_01[var_03];
		}
	}

	if(!var_02.size)
	{
		return;
	}

	for(var_04 = 0;var_04 < param_00.size;var_04++)
	{
		var_05 = param_00[var_04];
		if(var_05.type == "Path")
		{
			continue;
		}

		if(var_05.type == "Begin")
		{
			continue;
		}

		if(var_05.type == "End")
		{
			continue;
		}

		var_06 = anglestoforward((0,var_05.var_41[1],0));
		var_07 = getarraykeys(var_02);
		for(var_03 = 0;var_03 < var_07.size;var_03++)
		{
			var_08 = var_02[var_07[var_03]];
			if(distance(var_05.var_2E6,var_08.var_2E6) > 70)
			{
				continue;
			}

			var_09 = anglestoforward((0,var_08.var_41[1],0));
			var_0A = vectordot(var_06,var_09);
			if(var_0A < 0.9)
			{
				continue;
			}

			var_05.turret = var_08;
			var_08.node = var_05;
			var_08.var_519B = 1;
			var_02[var_07[var_03]] = undefined;
		}
	}

	param_00 = undefined;
}

//Function Number: 36
lib_A54E::func_780A()
{
	self.var_83AE = [];
	self.var_83AE["connected"] = [];
	self.var_83AE["ambush"] = [];
	if(!isdefined(self.var_3582))
	{
		return;
	}

	level.var_83AD[self.var_3582] = self;
	if(isdefined(self.var_7AFD))
	{
		var_00 = strtok(self.var_7AFD," ");
		for(var_01 = 0;var_01 < var_00.size;var_01++)
		{
			self.var_83AE["connected"][var_00[var_01]] = 1;
		}
	}

	if(isdefined(self.var_7AFA))
	{
		var_00 = strtok(self.var_7AFA," ");
		for(var_01 = 0;var_01 < var_00.size;var_01++)
		{
			self.var_83AE["ambush"][var_00[var_01]] = 1;
		}
	}
}

//Function Number: 37
lib_A54E::func_74A5()
{
	self notify("gun_placed_again");
	self endon("gun_placed_again");
	self waittill("restore_default_drop_pitch");
	wait(1);
	self restoredefaultdroppitch();
}

//Function Number: 38
lib_A54E::func_2F95()
{
	thread lib_A54E::func_2F96();
}

//Function Number: 39
lib_A54E::func_2F96()
{
	var_00 = spawn("script_model",(0,0,0));
	var_00.var_2E6 = self gettagorigin(level.var_6E48);
	var_00.var_41 = self gettagangles(level.var_6E48);
	var_00 setmodel(self.var_99AD);
	var_01 = anglestoforward(self.var_41);
	var_01 = var_01 * 100;
	var_00 gravitymove(var_01,0.5);
	self detach(self.var_99AD,level.var_6E48);
	self.var_99AD = undefined;
	wait(0.7);
	var_00 delete();
}

//Function Number: 40
lib_A54E::func_99A3()
{
	self endon("kill_turret_detach_thread");
	self endon("dropped_gun");
	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}

	lib_A54E::func_2F95();
}

//Function Number: 41
lib_A54E::func_99A5()
{
	self endon("death");
	self endon("kill_turret_detach_thread");
	self waittill("dropped_gun");
	self detach(self.var_99AD,level.var_6E48);
}

//Function Number: 42
lib_A54E::func_74A6()
{
	self.var_76AC = undefined;
	common_scripts\utility::set_all_exceptions(::animscripts\init::func_139);
}

//Function Number: 43
lib_A54E::func_74AB()
{
	self waittill("turret_deactivate");
	self restoredefaultdroppitch();
}

//Function Number: 44
lib_A54E::func_9AB0(param_00)
{
	self endon("death");
	self endon("end_mg_behavior");
	self endon("stop_updating_enemy_target_pos");
	for(;;)
	{
		self waittill("saw_enemy");
		param_00.var_2E6 = self.var_5521;
	}
}

//Function Number: 45
lib_A54E::func_5F2D(param_00,param_01)
{
	self endon("death");
	self endon("end_mg_behavior");
	self endon("stop_updating_enemy_target_pos");
	var_02 = self.turret.var_2E6 + (0,0,16);
	var_03 = param_01.var_2E6 + (0,0,16);
	for(;;)
	{
		wait(0.05);
		if(sighttracepassed(param_00.var_2E6,var_03,0,undefined))
		{
			continue;
		}

		var_04 = vectortoangles(var_02 - param_00.var_2E6);
		var_05 = anglestoforward(var_04);
		var_05 = var_05 * 8;
		param_00.var_2E6 = param_00.var_2E6 + var_05;
	}
}

//Function Number: 46
lib_A54E::func_727E(param_00)
{
	self endon("death");
	self endon("end_mg_behavior");
	self endon("stop_updating_enemy_target_pos");
	param_00.var_17C9 = [];
	for(;;)
	{
		param_00.var_17C9[param_00.var_17C9.size] = self.var_2E6 + (0,0,50);
		wait(0.35);
	}
}

//Function Number: 47
lib_A54E::func_0971(param_00,param_01)
{
	if(!isalive(self.var_24DF) && self method_81BE(self.var_24DF))
	{
		param_01.var_2E6 = self.var_5521;
		return;
	}

	var_02 = anglestoforward(param_00.var_41);
	for(var_03 = param_01.var_17C9.size - 3;var_03 >= 0;var_03--)
	{
		var_04 = param_01.var_17C9[var_03];
		var_05 = vectornormalize(var_04 - param_00.var_2E6);
		var_06 = vectordot(var_02,var_05);
		if(var_06 < 0.75)
		{
			continue;
		}

		param_01.var_2E6 = var_04;
		if(sighttracepassed(param_00.var_2E6,var_04,0,undefined))
		{
			continue;
		}

		break;
	}
}

//Function Number: 48
lib_A54E::func_374F(param_00)
{
	var_01 = lib_A54E::func_3E34(param_00);
	var_02 = var_01["spot"];
	var_03 = var_01["type"];
	if(!isdefined(var_02))
	{
		return;
	}

	lib_A54E::func_741B(var_02);
	thread lib_A54E::func_9AB0(param_00);
	thread lib_A54E::func_5F2D(param_00,var_02);
	if(var_03 == "ambush")
	{
		thread lib_A54E::func_727E(param_00);
	}

	if(var_02.var_519B)
	{
		lib_A54E::func_5662(var_02);
	}
	else
	{
		lib_A54E::func_680D(var_02);
		lib_A54E::func_76BB(var_02);
	}

	self notify("stop_updating_enemy_target_pos");
	if(var_03 == "ambush")
	{
		lib_A54E::func_0971(var_02,param_00);
	}

	var_02 settargetentity(param_00);
}

//Function Number: 49
lib_A54E::func_86B6(param_00)
{
	param_00 setmode("manual");
	wait(0.5);
	param_00 setmode("manual_ai");
}

//Function Number: 50
lib_A54E::func_5662(param_00)
{
	self method_818B();
	animscripts\shared::func_6866(self.alias,"none");
	var_01 = lib_A54E::func_3EA7(param_00);
	var_02 = getstartorigin(param_00.var_2E6,param_00.var_41,var_01);
	self method_8160(var_02);
	self waittill("runto_arrived");
	lib_A54E::func_9BE0(param_00);
}

//Function Number: 51
lib_A54E::func_680D(param_00)
{
	self method_818B();
	self.turret lib_A54E::func_4863();
}

//Function Number: 52
lib_A54E::func_3EA7(param_00)
{
	var_01 = [];
	var_01["saw_bipod_stand"] = level.var_5BBC["bipod_stand_setup"];
	var_01["saw_bipod_crouch"] = level.var_5BBC["bipod_crouch_setup"];
	var_01["saw_bipod_prone"] = level.var_5BBC["bipod_prone_setup"];
	return var_01[param_00.energyturret];
}

//Function Number: 53
lib_A54E::func_76BB(param_00)
{
	var_01 = self.health;
	param_00 endon("turret_deactivate");
	self.var_5BBF = param_00;
	self endon("death");
	self endon("dropped_gun");
	var_02 = lib_A54E::func_3EA7(param_00);
	self.var_99AD = "weapon_mg42_carry";
	self notify("kill_get_gun_back_on_killanimscript_thread");
	animscripts\shared::func_6866(self.weapon,"none");
	if(self method_813D())
	{
		self.health = 1;
	}

	self.var_76AC = %saw_gunner_run_fast;
	self.var_2485 = %saw_gunner_run_fast;
	self attach(self.var_99AD,level.var_6E48);
	thread lib_A54E::func_99A3();
	var_03 = getstartorigin(param_00.var_2E6,param_00.var_41,var_02);
	self method_8160(var_03);
	wait(0.05);
	common_scripts\utility::set_all_exceptions(::animscripts\combat::func_33E4);
	common_scripts\utility::clear_exception("move");
	common_scripts\utility::set_exception("cover_crouch",::lib_A54E::func_493A);
	while(distance(self.var_2E6,var_03) > 16)
	{
		self method_8160(var_03);
		wait(0.05);
	}

	self notify("kill_turret_detach_thread");
	if(self method_813D())
	{
		self.health = var_01;
	}

	if(soundexists("weapon_setup"))
	{
		thread common_scripts\utility::play_sound_in_space("weapon_setup");
	}

	self method_813E("setup_done",param_00.var_2E6,param_00.var_41,var_02);
	lib_A54E::func_74A6();
	self waittillmatch("end","setup_done");
	param_00 notify("restore_default_drop_pitch");
	param_00 lib_A54E::func_84EE();
	animscripts\shared::func_6866(self.alias,"right");
	lib_A54E::func_9BE0(param_00);
	self detach(self.var_99AD,level.var_6E48);
	common_scripts\utility::set_all_exceptions(::animscripts\init::func_139);
	self notify("bcs_portable_turret_setup");
}

//Function Number: 54
lib_A54E::func_5F34()
{
	self method_8160(self.var_76E4);
}

//Function Number: 55
lib_A54E::func_493A()
{
	self endon("killanimscript");
	self waittill("death");
}

//Function Number: 56
lib_A54E::func_9C16()
{
	if(!isdefined(self.turret))
	{
		return 0;
	}

	return self.turret.owner == self;
}

//Function Number: 57
lib_A54E::func_9998()
{
	if(!lib_A54E::func_9C16())
	{
		common_scripts\utility::clear_exception("move");
		return;
	}

	var_00 = lib_A54E::func_375A("connected");
	var_01 = var_00["spots"];
	if(!var_01.size)
	{
		common_scripts\utility::clear_exception("move");
		return;
	}

	var_02 = self.node;
	if(!isdefined(var_02) || !lib_A59A::func_5038(var_01,var_02))
	{
		var_03 = lib_A54E::func_4102();
		for(var_04 = 0;var_04 < var_01.size;var_04++)
		{
			var_02 = common_scripts\utility::random(var_01);
			if(isdefined(var_03[var_02.var_2E6 + ""]))
			{
				return;
			}
		}
	}

	var_05 = var_02.turret;
	if(isdefined(var_05.var_377))
	{
		return;
	}

	lib_A54E::func_741B(var_05);
	if(var_05.var_519B)
	{
		lib_A54E::func_5662(var_05);
	}
	else
	{
		lib_A54E::func_76BB(var_05);
	}

	lib_A54D::func_4473(var_02.turret);
}

//Function Number: 58
lib_A54E::func_9BE0(param_00)
{
	var_01 = self method_818A(param_00);
	if(var_01)
	{
		common_scripts\utility::set_exception("move",::lib_A54E::func_9998);
		self.turret = param_00;
		thread lib_A54E::func_5BC1(param_00);
		param_00 setmode("manual_ai");
		param_00 thread lib_A54E::func_74AB();
		self.turret = param_00;
		param_00.owner = self;
		return 1;
	}

	param_00 restoredefaultdroppitch();
	return 0;
}

//Function Number: 59
lib_A54E::func_3E34(param_00)
{
	var_01 = [];
	var_01[var_01.size] = ::lib_A54E::func_3762;
	var_01[var_01.size] = ::lib_A54E::func_3764;
	var_01 = common_scripts\utility::array_randomize(var_01);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = [[ var_01[var_02] ]](param_00);
		if(!isdefined(var_03["spots"]))
		{
			continue;
		}

		var_03["spot"] = common_scripts\utility::random(var_03["spots"]);
		return var_03;
	}
}

//Function Number: 60
lib_A54E::func_4102()
{
	var_00 = [];
	var_01 = function_00D6();
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(!isdefined(var_01[var_02].node))
		{
			continue;
		}

		var_00[var_01[var_02].node.var_2E6 + ""] = 1;
	}

	return var_00;
}

//Function Number: 61
lib_A54E::func_375A(param_00)
{
	var_01 = level.var_83AD;
	var_02 = [];
	var_03 = getarraykeys(var_01);
	var_04 = lib_A54E::func_4102();
	var_04[self.node.var_2E6 + ""] = undefined;
	for(var_05 = 0;var_05 < var_03.size;var_05++)
	{
		var_06 = var_03[var_05];
		if(var_01[var_06] == self.turret)
		{
			continue;
		}

		var_07 = getarraykeys(self.turret.var_83AE[param_00]);
		for(var_08 = 0;var_08 < var_07.size;var_08++)
		{
			if(var_01[var_06].var_3582 + "" != var_07[var_08])
			{
				continue;
			}

			if(isdefined(var_01[var_06].var_377))
			{
				continue;
			}

			if(isdefined(var_04[var_01[var_06].node.var_2E6 + ""]))
			{
				continue;
			}

			if(distance(self.var_1C6,var_01[var_06].var_2E6) > self.var_1C7)
			{
				continue;
			}

			var_02[var_02.size] = var_01[var_06];
		}
	}

	var_09 = [];
	var_09["type"] = param_00;
	var_09["spots"] = var_02;
	return var_09;
}

//Function Number: 62
lib_A54E::func_3764(param_00)
{
	return lib_A54E::func_375A("ambush");
}

//Function Number: 63
lib_A54E::func_3762(param_00)
{
	var_01 = lib_A54E::func_375A("connected");
	var_02 = var_01["spots"];
	if(!var_02.size)
	{
		return;
	}

	var_03 = [];
	for(var_04 = 0;var_04 < var_02.size;var_04++)
	{
		if(!common_scripts\utility::within_fov(var_02[var_04].var_2E6,var_02[var_04].var_41,param_00.var_2E6,0.75))
		{
			continue;
		}

		if(!sighttracepassed(param_00.var_2E6,var_02[var_04].var_2E6 + (0,0,16),0,undefined))
		{
			continue;
		}

		var_03[var_03.size] = var_02[var_04];
	}

	var_01["spots"] = var_03;
	return var_01;
}

//Function Number: 64
lib_A54E::func_6E49()
{
	lib_A54E::func_780A();
	var_00 = 1;
	self.var_519B = 1;
	self.var_377 = undefined;
	if(isdefined(self.var_51FC))
	{
		return;
	}

	if(self.spawnflags & var_00)
	{
		return;
	}

	lib_A54E::func_4863();
}

//Function Number: 65
lib_A54E::func_4863()
{
	self notify("stop_checking_for_flanking");
	self.var_519B = 0;
	self hide();
	self.var_8868 = 0;
	self makeunusable();
	self setdefaultdroppitch(0);
	thread lib_A54E::func_74A5();
}

//Function Number: 66
lib_A54E::func_84EE()
{
	self show();
	self.var_8868 = 1;
	self makeusable();
	self.var_519B = 1;
	thread lib_A54E::func_8E9F();
}

//Function Number: 67
lib_A54E::func_8E9F()
{
	self endon("stop_checking_for_flanking");
	self waittill("turret_deactivate");
	if(isalive(self.owner))
	{
		self.owner notify("end_mg_behavior");
	}
}

//Function Number: 68
lib_A54E::func_9966(param_00)
{
	var_01 = param_00 getturretowner();
	if(!isdefined(var_01))
	{
		return 0;
	}

	return var_01 == self;
}

//Function Number: 69
lib_A54E::func_3152(param_00)
{
	lib_A54E::func_A0BC(param_00);
	param_00.var_377 = undefined;
}

//Function Number: 70
lib_A54E::func_A0BC(param_00)
{
	param_00 endon("turret_deactivate");
	self endon("death");
	self waittill("end_mg_behavior");
}

//Function Number: 71
lib_A54E::func_741B(param_00)
{
	param_00.var_377 = self;
	thread lib_A54E::func_3152(param_00);
}