/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42402.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 8
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:27 PM
*******************************************************************/

//Function Number: 1
lib_A5A2::main()
{
	if(getdvar("cobrapilot_surface_to_air_missiles_enabled") == "")
	{
		setdvar("cobrapilot_surface_to_air_missiles_enabled","1");
	}

	lib_A5A2::func_989B();
	thread lib_A5A2::firemissile();
	thread lib_A5A2::func_9991();
	thread lib_A5A2::func_297D();
}

//Function Number: 2
lib_A5A2::func_297D()
{
	self waittill("death");
	self detachall();
}

//Function Number: 3
lib_A5A2::func_9991()
{
	self endon("death");
	if(!isdefined(self.var_7AF9))
	{
		return;
	}

	if(self.var_7AF9 == 0)
	{
		return;
	}

	self.var_E48 = 30000;
	if(isdefined(self.radius))
	{
		self.var_E48 = self.radius;
	}

	while(!isdefined(level.var_1FFE))
	{
		wait(0.05);
	}

	var_00 = 1;
	if(level.var_1FFE == "easy")
	{
		var_00 = 0.5;
	}
	else if(level.var_1FFE == "medium")
	{
		var_00 = 1.7;
	}
	else if(level.var_1FFE == "hard")
	{
		var_00 = 1;
	}
	else if(level.var_1FFE == "insane")
	{
		var_00 = 1.5;
	}

	self.var_E48 = self.var_E48 * var_00;
	if(getdvar("cobrapilot_debug") == "1")
	{
		iprintln("surface-to-air missile range difficultyScaler = " + var_00);
	}

	for(;;)
	{
		wait(2 + randomfloat(1));
		var_01 = undefined;
		var_01 = lib_A535::func_3F7D(self.var_E48,undefined,0,1);
		if(!isdefined(var_01))
		{
			continue;
		}

		var_02 = var_01.var_2E6;
		if(isdefined(var_01.var_7AE7))
		{
			var_02 = var_02 + (0,0,var_01.var_7AE7);
		}

		self veh_setturrettargetvec(var_02);
		level thread lib_A5A2::func_997C(self,5);
		self waittill("turret_rotate_stopped");
		self veh_clearturrettargetent();
		if(distance(self.var_2E6,var_01.var_2E6) > self.var_E48)
		{
			continue;
		}

		var_03 = 0;
		var_03 = sighttracepassed(self.var_2E6,var_01.var_2E6 + (0,0,150),0,self);
		if(!var_03)
		{
			continue;
		}

		if(getdvar("cobrapilot_surface_to_air_missiles_enabled") == "1")
		{
			self notify("shoot_target",var_01);
			self waittill("missile_fired",var_04);
			if(isdefined(var_04))
			{
				if(level.var_1FFE == "hard")
				{
					wait(1 + randomfloat(2));
					continue;
				}
				else if(level.var_1FFE == "insane")
				{
					continue;
				}
				else
				{
					var_04 waittill("death");
				}
			}

			continue;
		}
	}
}

//Function Number: 4
lib_A5A2::func_997C(param_00,param_01)
{
	param_00 endon("death");
	param_00 endon("turret_rotate_stopped");
	wait(param_01);
	param_00 notify("turret_rotate_stopped");
}

//Function Number: 5
lib_A5A2::func_A33D(param_00)
{
	var_01 = distance((self.var_2E6[0],self.var_2E6[1],0),(param_00.var_2E6[0],param_00.var_2E6[1],0));
	var_02 = param_00.var_2E6[2] - self.var_2E6[2];
	if(var_02 <= 750)
	{
		return 0;
	}

	var_03 = var_02 * 2.5;
	if(var_01 <= self.var_E48 + var_03)
	{
		return 1;
	}

	return 0;
}

//Function Number: 6
lib_A5A2::firemissile()
{
	self endon("death");
	for(;;)
	{
		self waittill("shoot_target",var_00);
		var_01 = undefined;
		if(!isdefined(var_00.var_7AE7))
		{
			var_00.var_7AE7 = 0;
		}

		var_02 = (0,0,var_00.var_7AE7);
		var_01 = self veh_fireweapon(self.var_5CC7[self.var_5CBA],var_00,var_02);
		if(getdvar("cobrapilot_debug") == "1")
		{
			level thread lib_A5A2::func_2DBF(var_01,var_00,var_02);
		}

		if(!isdefined(var_00.var_4C2A))
		{
			var_00.var_4C2A = [];
		}

		var_00.var_4C2A = common_scripts\utility::array_add(var_00.var_4C2A,var_01);
		thread lib_A535::func_5C8C(var_01,var_00);
		self detach(self.var_5CBC,self.var_5CC7[self.var_5CBA]);
		self.var_5CBA++;
		self.var_5CB0--;
		var_00 notify("incomming_missile",var_01);
		lib_A5A2::func_989B();
		wait(0.05);
		self notify("missile_fired",var_01);
	}
}

//Function Number: 7
lib_A5A2::func_2DBF(param_00,param_01,param_02)
{
	param_00 endon("death");
	wait(0.05);
}

//Function Number: 8
lib_A5A2::func_989B()
{
	if(!isdefined(self.var_5CB0))
	{
		self.var_5CB0 = 0;
	}

	if(!isdefined(self.var_5CBA))
	{
		self.var_5CBA = 0;
	}

	if(self.var_5CB0 > 0)
	{
		return;
	}

	for(var_00 = 0;var_00 < self.var_5CC7.size;var_00++)
	{
		self attach(self.var_5CBC,self.var_5CC7[var_00]);
	}

	self.var_5CB0 = self.var_5CC7.size;
	self.var_5CBA = 0;
}