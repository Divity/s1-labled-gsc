/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42545.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 36
 * Decompile Time: 10 ms
 * Timestamp: 4/20/2022 8:23:49 PM
*******************************************************************/

//Function Number: 1
lib_A631::main()
{
	level.var_6C2C = lib_A631::func_3E29();
	level.var_2EDA = common_scripts\utility::getstructarray("drone_test_point","targetname");
	level.var_2E1D = getentarray("drone_air_space","script_noteworthy");
	var_00 = spawnstruct();
	var_00.enabled = 1;
	var_00.var_90A9 = (0,0,0);
	var_00.var_9191 = undefined;
	var_00.var_2ED9 = undefined;
	var_00.var_33A2 = 300;
	var_00.var_33A1 = 600;
	var_00.var_33A3 = 100;
	var_00.var_9348 = 1;
	var_00.var_6283 = 0;
	var_00.var_85AF = 0;
	level.var_2ED5 = var_00;
	common_scripts\utility::create_dvar("AI_Drone_Tactical_Debug",0);
	lib_A631::func_185E();
	thread lib_A631::func_9ADA();
	thread lib_A631::func_9AB4();
	thread lib_A631::func_9AAC();
	thread lib_A631::func_9AAB();
	thread lib_A631::func_9AB9();
}

//Function Number: 2
lib_A631::func_3E29()
{
	var_00 = common_scripts\utility::getstructarray("player_test_point","targetname");
	var_01 = [];
	foreach(var_03 in var_00)
	{
		if(!isdefined(var_03.target) || !isdefined(getent(var_03.target,"targetname")))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 3
lib_A631::func_185E()
{
	foreach(var_01 in level.var_2E1D)
	{
		if(isdefined(var_01.var_90A9))
		{
			continue;
		}

		var_01.var_90A9 = var_01 getpointinbounds(0,0,0);
		var_02 = transformmove((0,0,0),(0,0,0),var_01.var_2E6,var_01.var_41,var_01 getpointinbounds(1,1,1),(0,0,0));
		var_01.var_1758 = var_02["origin"];
		if(!isdefined(var_01.target))
		{
			continue;
		}

		var_03 = common_scripts\utility::getstructarray(var_01.target,"targetname");
		if(!isdefined(var_03) || var_03.size == 0)
		{
			continue;
		}

		var_04 = var_03[0];
		if(!isdefined(var_04.var_39B) || var_04.var_39B != "drone_forward_point")
		{
			continue;
		}

		var_01.var_39EC = vectornormalize(var_04.var_2E6 - var_01.var_2E6 * (1,1,0));
	}
}

//Function Number: 4
lib_A631::func_9C3E()
{
	if(level.var_2EDA.size == 0)
	{
		return;
	}

	foreach(var_01 in level.var_2EDA)
	{
		var_02 = getent(var_01.target,"targetname");
		if(!isdefined(var_02))
		{
		}

		if(!ispointinvolume(var_01.var_2E6,var_02))
		{
		}
	}
}

//Function Number: 5
lib_A631::func_376B(param_00)
{
	if(!isdefined(level.var_6C2C))
	{
		return 0;
	}

	var_01 = [];
	foreach(var_03 in level.var_6C2C)
	{
		var_04 = lengthsquared(var_03.var_2E6 - level.var_31D.var_2E6);
		if(var_04 > squared(var_03.radius))
		{
			continue;
		}

		var_05 = getent(var_03.target,"targetname");
		var_01[var_01.size] = var_05;
	}

	if(var_01.size == 0)
	{
		return 0;
	}

	var_07 = 0;
	var_08 = -1;
	var_09 = var_01.size + 1;
	if(isdefined(var_01))
	{
		var_09 = var_09 + var_01.size;
	}

	foreach(var_05 in var_01)
	{
		if(!isdefined(var_05.var_90A9))
		{
			continue;
		}

		wait(0.05);
		var_0B = lib_A631::func_19D4(var_05.var_90A9,var_05);
		if(var_0B >= 0 && var_0B > var_08)
		{
			if(var_01.size > 1 && var_05 != level.var_2ED5.var_9191 && isdefined(var_05.var_5543) && function_00FD() * 0.05 - var_05.var_5543 < 3)
			{
				continue;
			}

			var_05.var_5543 = function_00FD() * 0.05;
			level.var_2ED5.var_9191 = var_05;
			level.var_2ED5.var_90A9 = var_05.var_90A9;
			level.var_2ED5.var_2ED9 = undefined;
			var_08 = var_0B;
			var_07 = 1;
		}
	}

	return var_07;
}

//Function Number: 6
lib_A631::func_33A8(param_00,param_01,param_02,param_03)
{
	param_02 = max(0.001,param_02);
	param_03 = max(0.001,param_03);
	var_04 = length2d(param_00 - param_01 geteye());
	if(var_04 < param_02)
	{
		return squared(min(var_04 / param_02,1));
	}

	if(var_04 < param_03)
	{
		return 1;
	}

	return 1 - squared(min(var_04 - param_02 / param_03,1));
}

//Function Number: 7
lib_A631::func_33A7(param_00,param_01)
{
	if(lib_A632::func_948D(param_00,param_01,undefined))
	{
		return 1;
	}

	return 0.5;
}

//Function Number: 8
lib_A631::func_33A9(param_00,param_01,param_02)
{
	var_03 = length2d(param_00 - param_01 geteye());
	if(var_03 >= param_02)
	{
		return 1;
	}

	return squared(param_02 - var_03 / param_02);
}

//Function Number: 9
lib_A631::func_33A5(param_00,param_01)
{
	var_02 = param_00 - param_01 geteye() * (1,1,0);
	var_02 = vectornormalize(var_02);
	var_03 = anglestoforward(param_01.var_41 * (1,1,0));
	var_04 = vectordot(var_03,var_02) + 1 / 2;
	return var_04;
}

//Function Number: 10
lib_A631::func_33A4(param_00,param_01)
{
	var_02 = param_00[2] - param_01.var_2E6[2];
	var_03 = 0.5;
	if(var_02 < 0)
	{
		return var_03;
	}

	var_04 = 80;
	if(var_02 > var_04)
	{
		return 1;
	}

	return lib_A59A::func_5768(clamp(var_02 / var_04,0,1),var_03,1);
}

//Function Number: 11
lib_A631::func_33A6(param_00,param_01)
{
	if(!isdefined(param_00) || !isdefined(param_00.var_39EC))
	{
		return 1;
	}

	var_02 = param_01.var_2E6 - param_00.var_2E6 * (1,1,0);
	var_02 = vectornormalize(var_02);
	var_03 = vectordot(var_02,param_00.var_39EC);
	if(var_03 > 0)
	{
		return 1;
	}

	return 0.1;
}

//Function Number: 12
lib_A631::func_19D4(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return -1;
	}

	var_02 = level.var_31D;
	if(!isdefined(var_02))
	{
		return -1;
	}

	var_03 = lib_A631::func_33A8(param_00,var_02,level.var_2ED5.var_33A2,level.var_2ED5.var_33A1);
	var_03 = var_03 + lib_A631::func_33A9(param_00,var_02,level.var_2ED5.var_33A3);
	var_03 = var_03 + lib_A631::func_33A5(param_00,var_02);
	var_03 = var_03 + lib_A631::func_33A4(param_00,var_02);
	var_03 = var_03 * lib_A631::func_33A7(param_00,var_02);
	var_03 = var_03 * lib_A631::func_33A6(param_01,var_02);
	return var_03 / 4;
}

//Function Number: 13
lib_A631::func_7ED4(param_00)
{
	level.var_2ED5.var_9348 = param_00;
}

//Function Number: 14
lib_A631::func_93D7(param_00)
{
	level.var_2ED5.enabled = param_00;
}

//Function Number: 15
lib_A631::func_9ADA()
{
	level notify("pdrone_update_tactical_picker");
	level endon("pdrone_update_tactical_picker");
	level.var_2ED5.var_9191 = level.var_2E1D[randomint(level.var_2E1D.size)];
	level.var_2ED5.var_90A9 = level.var_2ED5.var_9191.var_90A9;
	for(;;)
	{
		wait(0.05);
		if(!level.var_2ED5.enabled)
		{
			continue;
		}

		if(!isdefined(level.flying_attack_drones))
		{
			continue;
		}

		level.flying_attack_drones = common_scripts\utility::array_removeundefined(level.flying_attack_drones);
		if(level.flying_attack_drones.size == 0)
		{
			continue;
		}

		if(lib_A631::func_376B())
		{
			continue;
		}

		lib_A631::func_9AD9();
	}
}

//Function Number: 16
lib_A631::func_9AD9()
{
	level notify("pdrone_update_tactical");
	level endon("pdrone_update_tactical");
	var_00 = lib_A631::func_19D4(level.var_2ED5.var_90A9,level.var_2ED5.var_9191);
	var_01 = level.var_2E1D.size + 1;
	if(isdefined(level.var_2EDA))
	{
		var_01 = var_01 + level.var_2EDA.size;
	}

	foreach(var_03 in level.var_2E1D)
	{
		if(!isdefined(var_03.var_90A9))
		{
			continue;
		}

		if(isdefined(var_03.var_7A10) && var_03.var_7A10)
		{
			continue;
		}

		var_04 = 0.01;
		if(length2dsquared(var_03.var_2E6 - level.var_31D.var_2E6) < squared(2000))
		{
			wait(0.05);
			var_04 = lib_A631::func_19D4(var_03.var_90A9,var_03);
		}

		if(var_04 >= 0 && var_04 > var_00)
		{
			if(var_03 != level.var_2ED5.var_9191 && isdefined(var_03.var_5543) && function_00FD() * 0.05 - var_03.var_5543 < 3)
			{
				continue;
			}

			var_03.var_5543 = function_00FD() * 0.05;
			level.var_2ED5.var_9191 = var_03;
			level.var_2ED5.var_90A9 = var_03.var_90A9;
			level.var_2ED5.var_2ED9 = undefined;
			var_00 = var_04;
		}
	}

	if(!isdefined(level.var_2EDA))
	{
		return;
	}

	foreach(var_07 in level.var_2EDA)
	{
		if(isdefined(var_07.var_7A10) && var_07.var_7A10)
		{
			continue;
		}

		var_04 = 0;
		if(length2dsquared(var_07.var_2E6 - level.var_31D.var_2E6) < squared(2000))
		{
			wait(0.05);
			var_04 = lib_A631::func_19D4(var_07.var_2E6);
		}

		if(var_04 >= 0 && var_04 > var_00)
		{
			level.var_2ED5.var_9191 = getent(var_07.target,"targetname");
			level.var_2ED5.var_90A9 = var_07.var_2E6;
			level.var_2ED5.var_2ED9 = var_07;
			var_00 = var_04;
		}
	}
}

//Function Number: 17
lib_A631::func_9AB4()
{
	level notify("pdrone_update_flock");
	level endon("pdrone_update_flock");
	for(;;)
	{
		wait(0.05);
		if(!level.var_2ED5.enabled)
		{
			continue;
		}

		lib_A631::func_9AB5();
	}
}

//Function Number: 18
lib_A631::func_7123()
{
	foreach(var_01 in level.flying_attack_drones)
	{
		if(!isdefined(var_01) || !isalive(var_01))
		{
			continue;
		}

		if(!isdefined(var_01.var_38E7) || !ispointinvolume(var_01.var_38E7,level.var_2ED5.var_9191))
		{
			var_01.var_38E7 = var_01 lib_A631::func_3E46(level.var_2ED5.var_9191,1);
			var_01.var_24EB = var_01.var_38E7;
			var_01.var_24EA = (0,0,0);
		}
	}
}

//Function Number: 19
lib_A631::func_9AB5()
{
	level notify("pdrone_update_flock_position");
	level endon("pdrone_update_flock_position");
	if(!isdefined(level.flying_attack_drones) || level.flying_attack_drones.size == 0)
	{
		return;
	}

	if(!isdefined(level.var_2ED5.var_9191))
	{
		return;
	}

	lib_A631::func_7123();
	lib_A631::func_19CC();
}

//Function Number: 20
lib_A631::func_19CC()
{
	level notify("pdrone_calculate_flock_position");
	level endon("pdrone_calculate_flock_position");
	foreach(var_01 in level.flying_attack_drones)
	{
		if(!isdefined(var_01) || !isalive(var_01))
		{
			continue;
		}

		var_02 = 0;
		var_03 = 0;
		var_04 = (0,0,0);
		var_05 = 0;
		var_06 = (0,0,0);
		var_07 = (0,0,0);
		foreach(var_09 in level.flying_attack_drones)
		{
			if(!isdefined(var_09) || !isalive(var_09))
			{
				continue;
			}

			if(var_01 == var_09)
			{
				continue;
			}

			var_02++;
			var_0A = var_09.var_38E7 - var_01.var_38E7;
			var_0B = length(var_0A);
			if(var_0B <= 0)
			{
				var_0B = 1;
			}

			if(var_0B < 90)
			{
				var_03++;
				var_04 = var_04 - 0.5 * 90 - var_0B * var_0A / var_0B;
				continue;
			}

			if(var_0B > 150)
			{
				var_05++;
				var_06 = var_06 + 0.5 * var_0B - 150 * var_0A / var_0B;
			}
		}

		if(var_02 > 0)
		{
			if(var_03 > 0)
			{
				var_07 = var_07 + var_04 / var_03;
			}

			if(var_05 > 0)
			{
				var_07 = var_07 + var_06 / var_05;
			}

			var_01.var_38E6 = var_07;
		}
	}
}

//Function Number: 21
lib_A631::func_7E9E()
{
	self.var_38E7 = lib_A631::func_3E47(level.var_2ED5.var_9191,randomintrange(30,150));
	self.var_38E6 = (0,0,0);
}

//Function Number: 22
lib_A631::func_3DEF(param_00,param_01)
{
	var_02 = transformmove((0,0,0),(0,0,0),param_01.var_2E6,param_01.var_41,param_00,(0,0,0));
	var_03 = (clamp(var_02["origin"][0] / param_01.var_1758[0],-1,1),clamp(var_02["origin"][1] / param_01.var_1758[1],-1,1),clamp(var_02["origin"][2] / param_01.var_1758[2],-1,1));
	return var_03;
}

//Function Number: 23
lib_A631::func_3E44(param_00,param_01)
{
	var_02 = clamp(param_00[0] + randomfloatrange(-1 * param_01,param_01),-1,1);
	var_03 = clamp(param_00[1] + randomfloatrange(-1 * param_01,param_01),-1,1);
	var_04 = clamp(param_00[2] + randomfloatrange(-1 * param_01,param_01),-1,1);
	var_05 = level.var_2ED5.var_9191 getpointinbounds(var_02,var_03,var_04);
	return var_05;
}

//Function Number: 24
lib_A631::func_3E46(param_00,param_01)
{
	if(!isdefined(level.var_2ED5.var_2ED9))
	{
		return lib_A631::func_3E45(param_00);
	}

	var_02 = lib_A631::func_3DEF(level.var_2ED5.var_90A9,param_00);
	var_03 = lib_A631::func_3E44(var_02,0.3);
	return var_03;
}

//Function Number: 25
lib_A631::func_3E47(param_00,param_01)
{
	var_02 = common_scripts\utility::randomvector(1);
	var_02 = vectornormalize(var_02);
	var_03 = self.var_2E6 + var_02 * param_01;
	if(!ispointinvolume(var_03,param_00))
	{
		var_02 = var_02 * -1;
		var_03 = self.var_2E6 + var_02 * param_01;
		if(!ispointinvolume(var_03,param_00))
		{
			var_03 = lib_A631::func_3E45(param_00);
		}
	}

	return var_03;
}

//Function Number: 26
lib_A631::func_3E45(param_00)
{
	return param_00 getpointinbounds(randomfloatrange(-1,1),randomfloatrange(-1,1),randomfloatrange(-1,1));
}

//Function Number: 27
lib_A631::func_9AAC()
{
	level notify("pdrone_update_move");
	level endon("pdrone_update_move");
	for(;;)
	{
		wait(0.05);
		if(!level.var_2ED5.enabled)
		{
			continue;
		}

		lib_A631::func_888B();
	}
}

//Function Number: 28
lib_A631::func_888B()
{
	level notify("pdrone_sort_drone_moves");
	level endon("pdrone_sort_drone_moves");
	if(!isdefined(level.flying_attack_drones) || level.flying_attack_drones.size == 0)
	{
		return;
	}

	var_00 = lib_A56C::func_77FE();
	foreach(var_02 in level.flying_attack_drones)
	{
		if(!isdefined(var_02) || !isalive(var_02))
		{
			continue;
		}

		if(!isdefined(var_02.var_9347))
		{
			var_02.var_9347 = 0;
		}

		var_02.var_9347 = var_02.var_9347 - 0.05;
		if(isdefined(var_02.var_24D5) && var_02.var_24D5 != level.var_2ED5.var_9191)
		{
			continue;
		}

		var_00 lib_A56C::func_77FB(var_02);
	}

	if(var_00.var_CD8.size == 0)
	{
		return;
	}

	lib_A56C::func_77FD(var_00,lib_A56C::func_77F7(::lib_A631::func_20C7));
	var_04 = var_00.var_CD8[0];
	if(var_04.var_9347 > 0)
	{
		return;
	}

	var_04.var_9347 = 1;
	var_05 = 0;
	if(level.flying_attack_drones.size == 1)
	{
		var_05 = randomfloatrange(3,5);
	}
	else
	{
		if(level.var_2ED5.var_6283 <= 0)
		{
			level.var_2ED5.var_6283 = randomint(level.flying_attack_drones.size);
			level.var_2ED5.var_85AF = !level.var_2ED5.var_85AF;
		}

		if(level.var_2ED5.var_85AF)
		{
			var_05 = randomfloatrange(0,3);
		}

		level.var_2ED5.var_6283--;
	}

	var_04.var_24EB = var_04.var_38E7;
	var_04.var_24EA = var_04.var_38E6;
	var_04.var_38E7 = var_04 lib_A631::func_3E46(level.var_2ED5.var_9191);
	foreach(var_02 in level.flying_attack_drones)
	{
		if(!isdefined(var_02) || !isalive(var_02))
		{
			continue;
		}

		var_02.var_9347 = var_02.var_9347 + var_05;
	}
}

//Function Number: 29
lib_A631::func_20C7(param_00,param_01)
{
	return param_00.var_9347 < param_01.var_9347;
}

//Function Number: 30
lib_A631::func_9AAB()
{
	level notify("pdrone_update_attacks");
	level endon("pdrone_update_attacks");
	for(;;)
	{
		wait(0.05);
		if(!level.var_2ED5.enabled)
		{
			continue;
		}

		lib_A631::func_888A();
	}
}

//Function Number: 31
lib_A631::func_888A()
{
	level notify("pdrone_sort_drone_attacks");
	level endon("pdrone_sort_drone_attacks");
	if(!isdefined(level.flying_attack_drones) || level.flying_attack_drones.size == 0)
	{
		return;
	}

	var_00 = lib_A56C::func_77FE();
	foreach(var_02 in level.flying_attack_drones)
	{
		if(!isdefined(var_02) || !isalive(var_02))
		{
			continue;
		}

		if(!isdefined(var_02.var_9346))
		{
			var_02.var_9346 = 0;
		}

		var_02.var_9346 = var_02.var_9346 - 0.05;
		var_00 lib_A56C::func_77FB(var_02);
	}

	if(var_00.var_CD8.size == 0)
	{
		return;
	}

	lib_A56C::func_77FD(var_00,lib_A56C::func_77F7(::lib_A631::func_20C6));
	var_02 = var_00.var_CD8[0];
	if(var_02.var_9346 > 0)
	{
		return;
	}

	var_04 = level.var_2ED5.var_9348;
	if(isdefined(var_02.var_E11))
	{
		var_04 = var_02.var_E11;
	}

	var_02.var_9346 = var_04;
	var_02.var_E0E = 1;
	if(isdefined(var_02.var_2EDD.var_9310) && var_02.var_2EDD.var_9310 != level.var_31D)
	{
		return;
	}

	var_05 = randomfloatrange(0,var_04);
	foreach(var_02 in level.flying_attack_drones)
	{
		if(!isdefined(var_02) || !isalive(var_02))
		{
			continue;
		}

		var_02.var_9346 = var_02.var_9346 + var_05;
	}
}

//Function Number: 32
lib_A631::func_20C6(param_00,param_01)
{
	return param_00.var_9346 < param_01.var_9346;
}

//Function Number: 33
lib_A631::func_9AB9()
{
	level notify("pdrone_update_grenade_dodger");
	level endon("pdrone_update_grenade_dodger");
	for(;;)
	{
		level.var_31D waittill("grenade_fire",var_00);
		if(!isdefined(level.flying_attack_drones) || level.flying_attack_drones.size == 0)
		{
			return;
		}

		var_01 = anglestoforward(level.var_31D method_8036());
		lib_A631::func_19CB(var_00,var_01);
		wait(0.5);
		lib_A631::func_1EAF();
	}
}

//Function Number: 34
lib_A631::func_19CB(param_00,param_01)
{
	var_02 = (0,0,0);
	foreach(var_04 in level.flying_attack_drones)
	{
		var_02 = var_02 + var_04.var_2E6;
	}

	var_02 = var_02 / level.flying_attack_drones.size;
	for(;;)
	{
		wait(0.05);
		if(!isdefined(param_00))
		{
			return;
		}

		var_06 = length(param_00.var_2E6 - var_02);
		if(var_06 < 200)
		{
			break;
		}
	}

	foreach(var_04 in level.flying_attack_drones)
	{
		wait(0.05);
		if(!isdefined(var_04) || !isalive(var_04))
		{
			continue;
		}

		lib_A631::func_19CA(var_04,param_00,param_01);
	}

	level notify("pdrone_wait_in_current_air_space");
}

//Function Number: 35
lib_A631::func_19CA(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		return;
	}

	var_03 = param_00.var_2E6 - param_01.var_2E6;
	param_02 = param_02 * (1,1,0);
	param_02 = vectornormalize(param_02);
	var_04 = vectordot(var_03,param_02);
	var_05 = param_01.var_2E6 + param_02 * var_04;
	var_06 = param_00.var_2E6 - var_05;
	var_06 = var_06 * (1,1,0);
	var_06 = vectornormalize(var_06);
	var_07 = param_00.var_2E6 + var_06 * randomfloatrange(200,300);
	var_08 = physicstrace(param_00.var_2E6,var_07);
	if(var_08 != var_07)
	{
		var_09 = length(var_07 - param_00.var_2E6);
		if(var_09 < 60)
		{
			return;
		}

		var_07 = var_08 - var_06 * 60;
	}

	param_00.var_2C28 = var_07;
	param_00.var_9346 = randomfloatrange(2,3);
	param_00.var_9347 = randomfloatrange(1,3);
}

//Function Number: 36
lib_A631::func_1EAF()
{
	foreach(var_01 in level.flying_attack_drones)
	{
		if(!isdefined(var_01) || !isalive(var_01))
		{
			continue;
		}

		var_01.var_2C28 = undefined;
	}
}