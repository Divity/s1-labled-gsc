/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42370.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 21
 * Decompile Time: 4 ms
 * Timestamp: 4/20/2022 8:23:24 PM
*******************************************************************/

//Function Number: 1
lib_A582::main()
{
	thread lib_A582::main_thread();
}

//Function Number: 2
lib_A582::main_thread()
{
}

//Function Number: 3
lib_A582::func_73EC()
{
	var_00 = function_00D6("allies");
	foreach(var_02 in var_00)
	{
		var_02 lib_A582::func_73ED();
	}

	level.var_31D lib_A582::func_73ED();
	var_04 = function_00D6("bad_guys");
	foreach(var_02 in var_04)
	{
		var_02 lib_A582::func_73F1();
	}
}

//Function Number: 4
lib_A582::func_73F1()
{
	if(!isdefined(self.var_669))
	{
		return;
	}

	var_00 = self.var_41;
	var_01 = self geteye() + (0,0,-70);
	var_02 = acos(self.var_19D);
	lib_A582::func_73F0(var_01,var_00,var_02,(0,1,0));
}

//Function Number: 5
lib_A582::func_73F0(param_00,param_01,param_02,param_03)
{
	var_04 = anglestoforward(param_01 + (0,param_02,0));
	var_05 = anglestoforward(param_01 + (0,param_02 * -1,0));
}

//Function Number: 6
lib_A582::func_73ED()
{
	if(!isdefined(self.var_669))
	{
		return;
	}

	var_00 = lib_A58A::func_3A58();
	var_01 = level.var_669.var_5833.var_29A0;
	foreach(var_05, var_03 in level.var_669.var_5833.var_298D[var_01])
	{
		if(self [[ self.var_669.var_5833.var_3FD6 ]]())
		{
			var_03 = var_03 * 0.5;
		}

		var_04 = lib_A582::func_3D2D(var_05);
		lib_A59A::draw_circle_for_time(self.var_2E6,var_03,var_04[0],var_04[1],var_04[2],0.05);
		if(var_05 == var_00)
		{
			lib_A59A::draw_circle_for_time(self.var_2E6,var_03 - 2,0.6,0.6,0,0.05);
			lib_A59A::draw_circle_for_time(self.var_2E6,var_03 + 2,0.6,0.6,0,0.05);
		}

		lib_A582::func_9AA6(var_05,var_03);
	}
}

//Function Number: 7
lib_A582::func_73EF()
{
	var_00 = function_00D9();
	foreach(var_02 in var_00)
	{
		var_02 lib_A582::func_73EE();
	}
}

//Function Number: 8
lib_A582::func_73EE()
{
	if(!isdefined(level.var_669))
	{
		return;
	}

	var_00 = sqrt(level.var_669.var_5833.var_222C.var_39F1);
	var_01 = lib_A582::func_3D2D("corpse_found");
	lib_A582::func_9AA6("corpse_found",var_00);
	lib_A59A::draw_circle_for_time(self.var_2E6,var_00,var_01[0],var_01[1],var_01[2],0.05);
	var_00 = sqrt(level.var_669.var_5833.var_222C.var_39F2);
	var_01 = lib_A582::func_3D2D("corpse_dog_found");
	lib_A582::func_9AA6("corpse_dog_found",var_00);
	lib_A59A::draw_circle_for_time(self.var_2E6,var_00,var_01[0],var_01[1],var_01[2],0.05);
	var_00 = sqrt(level.var_669.var_5833.var_222C.var_855D);
	var_01 = lib_A582::func_3D2D("corpse_sight");
	lib_A582::func_9AA6("corpse_sight",var_00);
	lib_A59A::draw_circle_for_time(self.var_2E6,var_00,var_01[0],var_01[1],var_01[2],0.05);
	var_00 = sqrt(level.var_669.var_5833.var_222C.var_2989);
	var_01 = lib_A582::func_3D2D("corpse_detect");
	lib_A582::func_9AA6("corpse_detect",var_00);
	lib_A59A::draw_circle_for_time(self.var_2E6,var_00,var_01[0],var_01[1],var_01[2],0.05);
}

//Function Number: 9
lib_A582::func_727F(param_00,param_01)
{
	if(!isdefined(level.var_669.var_2673.var_551F))
	{
		level.var_669.var_2673.var_551F = spawnstruct();
	}

	level.var_669.var_2673.var_551F.var_8A91 = param_00;
	level.var_669.var_2673.var_551F.var_8A94 = param_00 geteye() + (0,0,-70);
	level.var_669.var_2673.var_551F.var_8A92 = param_00.var_41;
	level.var_669.var_2673.var_551F.var_8A93 = acos(param_00.var_19D);
	level.var_669.var_2673.var_551F.var_8A8F = param_01 lib_A58A::func_3A58();
	level.var_669.var_2673.var_551F.var_8A8E = param_01.var_2E6;
	level.var_669.var_2673.var_551F.var_8A90 = param_01.var_279;
}

//Function Number: 10
lib_A582::func_1E94()
{
	level.var_669.var_2673.var_551F = undefined;
	level.var_669.var_2673.var_9D1 = undefined;
}

//Function Number: 11
lib_A582::func_73EB()
{
	if(!isdefined(level.var_669.var_2673.var_551F))
	{
		return;
	}

	var_00 = level.var_669.var_2673.var_551F;
	var_01 = (0.9,0,0.2);
	var_02 = "Spotter";
	if(isdefined(level.var_669.var_2673.var_9D1))
	{
		var_02 = var_02 + " ai_event: " + level.var_669.var_2673.var_9D1.eventtype;
	}

	if(isdefined(var_00.var_8A8F))
	{
	}

	lib_A582::func_73F0(var_00.var_8A94,var_00.var_8A92,var_00.var_8A93,(0,1,0));
	if(isdefined(var_00.var_8A91))
	{
	}

	if(isdefined(level.var_669.var_2673.var_9D1) && isdefined(level.var_669.var_5833.var_1E[level.var_669.var_2673.var_9D1.eventtype]))
	{
		lib_A59A::draw_circle_for_time(var_00.var_8A8E,level.var_669.var_5833.var_1E[level.var_669.var_2673.var_9D1.eventtype]["hidden"],var_01[0],var_01[1],var_01[2],0.05);
		return;
	}

	lib_A59A::draw_circle_for_time(var_00.var_8A8E,var_00.var_8A90,var_01[0],var_01[1],var_01[2],0.05);
}

//Function Number: 12
lib_A582::func_7285(param_00,param_01)
{
	if(!isdefined(level.var_669.var_2673.var_9D1))
	{
		level.var_669.var_2673.var_9D1 = spawnstruct();
	}

	level.var_669.var_2673.var_9D1.var_9D0 = param_00;
	level.var_669.var_2673.var_9D1.eventtype = param_01;
}

//Function Number: 13
lib_A582::func_0752(param_00,param_01,param_02)
{
	if(!isdefined(level.var_669.var_2673))
	{
		level.var_669.var_2673 = spawnstruct();
		level.var_669.var_2673.var_2692 = [];
	}

	var_03 = spawnstruct();
	var_03.text = param_01;
	var_03.color = param_02;
	var_03.var_25F5 = -1;
	level.var_669.var_2673.var_2692[param_00] = var_03;
}

//Function Number: 14
lib_A582::func_9AA6(param_00,param_01)
{
	if(!isdefined(level.var_669.var_2673))
	{
		return;
	}

	level.var_669.var_2673.var_2692[param_00].var_25F5 = param_01;
}

//Function Number: 15
lib_A582::func_3D2D(param_00)
{
	if(!isdefined(level.var_669.var_2673))
	{
		return (0,0,0);
	}

	return level.var_669.var_2673.var_2692[param_00].color;
}

//Function Number: 16
lib_A582::func_2AD4()
{
	if(!isdefined(level.var_669.var_2673.hud))
	{
		return;
	}

	foreach(var_01 in level.var_669.var_2673.hud)
	{
		var_01 destroy();
	}

	level.var_669.var_2673.hud = undefined;
}

//Function Number: 17
lib_A582::func_4DD9()
{
	if(isdefined(level.var_669.var_2673.hud))
	{
		return;
	}

	level.var_669.var_2673.hud = [];
	for(var_00 = 0;var_00 < level.var_669.var_2673.var_2692.size;var_00++)
	{
		level.var_669.var_2673.hud[var_00] = newhudelem();
		level.var_669.var_2673.hud[var_00].x = 0;
		level.var_669.var_2673.hud[var_00].y = 20 + var_00 * 12;
		level.var_669.var_2673.hud[var_00].alignx = "left";
		level.var_669.var_2673.hud[var_00].aligny = "top";
	}
}

//Function Number: 18
lib_A582::func_9AD6()
{
	lib_A582::func_4DD9();
	if(!isdefined(level.var_669.var_2673.var_2692))
	{
		return;
	}

	var_00 = 0;
	foreach(var_02 in level.var_669.var_2673.var_2692)
	{
		level.var_669.var_2673.hud[var_00] settext(var_02.text + var_02.var_25F5);
		level.var_669.var_2673.hud[var_00].color = var_02.color;
		var_00++;
	}
}

//Function Number: 19
lib_A582::func_5539()
{
	self notify("last_known_position_monitor");
	self endon("last_known_position_monitor");
	self endon("death");
	var_00 = 0.1;
	var_01 = (0.9,0,0.2);
	var_02 = 24;
	for(;;)
	{
		if(isdefined(self.var_669) && isdefined(self.enemy))
		{
			self.var_669.var_5833.var_5536 = self sentient_lastknownpos(self.enemy);
			self.var_669.var_5833.var_5537 = self method_8441(self.enemy);
		}

		if(isdefined(self.var_669) && isdefined(self.var_669.var_5833.var_5536))
		{
			lib_A59A::draw_circle_for_time(self.var_669.var_5833.var_5536,var_02,var_01[0],var_01[1],var_01[2],var_00);
			if(isdefined(self.var_669.var_5833.var_5537))
			{
			}
		}

		wait(var_00);
	}
}

//Function Number: 20
lib_A582::func_8DC3()
{
	self notify("stealth_enemy_debug_monitor");
	self endon("stealth_enemy_debug_monitor");
	self endon("death");
	for(;;)
	{
		if(isdefined(self.var_26))
		{
			var_00 = "Alert level: " + self.var_26;
		}

		if(isdefined(self.var_669.var_5833.var_9318))
		{
			var_00 = "Threat level: " + self.var_669.var_5833.var_9318;
		}

		wait(0.05);
	}
}

//Function Number: 21
lib_A582::func_8DC5()
{
	self notify("stealth_enemy_minimal_debug_monitor");
	self endon("stealth_enemy_minimal_debug_monitor");
	self endon("death");
	for(;;)
	{
		var_00 = ".";
		if(isdefined(self.var_26))
		{
			if(self.var_26 == "noncombat")
			{
			}
			else if(self.var_26 == "alert")
			{
			}
			else if(self.var_26 == "combat")
			{
			}
		}

		wait(0.05);
	}
}