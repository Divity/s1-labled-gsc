/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42488.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 42
 * Decompile Time: 33 ms
 * Timestamp: 4/20/2022 8:23:45 PM
*******************************************************************/

//Function Number: 1
lib_A5F8::func_2ECB()
{
	if(level.nextgen)
	{
		level.var_E1D = 24;
		level.var_E1E = 6;
		level.var_E1C = 125;
	}
	else
	{
		level.var_E1D = 5;
		level.var_E1E = 3;
		level.var_E1C = 125;
	}

	level.var_901C = 0;
	level.var_2EE7 = 0;
	level.var_5344 = 0;
	level.var_143D = 0;
	common_scripts\utility::flag_init("cloud_in_formation");
	if(!isdefined(level.var_38E5))
	{
		level.var_38E5 = [];
	}

	if(!isdefined(level.var_86B4))
	{
		level.var_86B4 = [];
	}

	level.var_3519 = level.var_E1E * level.var_E1D;
	level.var_2F24 = 0;
	level.var_60F6 = undefined;
	level.var_8659 = 0;
	level.var_2EDB = common_scripts\utility::spawn_tag_origin();
	precacheitem("iw5_attackdronemagicbullet");
	precacheitem("remote_missile_drone_light");
	precachemodel("vehicle_mil_attack_drone_static");
	precachemodel("vehicle_mil_attack_drone_destroy");
	precachemodel("vehicle_mil_attack_drone_ai");
	precachemodel("vehicle_atlas_assault_drone_physics");
	lib_A5FA::func_2E53();
	if(!isdefined(level.var_1523))
	{
		level.var_1523 = [];
	}

	level.var_1523["default_snake"] = spawnstruct();
	level.var_1523["default_snake"].var_708A = 0;
	level.var_1523["default_snake"].var_7085 = 0.5;
	level.var_1523["default_snake"].var_608C = 110;
	level.var_1523["default_snake"].var_7D96 = 12000;
	level.var_1523["default_snake"].var_9DB = 0.002;
	level.var_1523["default_snake"].var_2002 = 0.00015;
	level.var_1523["default_snake"].var_58DE = 10;
	level.var_1523["default_snake"].var_7111 = 250;
	level.var_1523["default_snake"].var_59F4 = 3200;
	level.var_1523["default_snake"].var_2D94 = 0.05;
	level.var_1523["default_snake"].var_710F = 0.2;
	level.var_1523["default_snake"].var_7090 = 1;
	level.var_1523["default_snake"].var_2C27 = 1;
	level.var_1523["default_snake"].var_3071 = 0;
	level.var_1523["frozen_snake"] = spawnstruct();
	level.var_1523["frozen_snake"].var_708A = 0;
	level.var_1523["frozen_snake"].var_7085 = 0;
	level.var_1523["frozen_snake"].var_608C = 110;
	level.var_1523["frozen_snake"].var_7D96 = 48000;
	level.var_1523["frozen_snake"].var_9DB = -0.002;
	level.var_1523["frozen_snake"].var_2002 = 0;
	level.var_1523["frozen_snake"].var_58DE = 2.5;
	level.var_1523["frozen_snake"].var_7111 = 100;
	level.var_1523["frozen_snake"].var_59F4 = 3200;
	level.var_1523["frozen_snake"].var_2D94 = 0.15;
	level.var_1523["frozen_snake"].var_710F = 0;
	level.var_1523["frozen_snake"].var_7090 = 0;
	level.var_1523["frozen_snake"].var_5C34 = 0;
	level.var_1523["frozen_snake"].var_5A15 = 352;
	level.var_1523["frozen_snake"].var_2C27 = 1;
	level.var_1523["frozen_snake"].var_3071 = 0;
	level.var_1523["emp_snake"] = spawnstruct();
	level.var_1523["emp_snake"].var_708A = 0;
	level.var_1523["emp_snake"].var_7085 = 0;
	level.var_1523["emp_snake"].var_608C = 110;
	level.var_1523["emp_snake"].var_7D96 = 48000;
	level.var_1523["emp_snake"].var_9DB = 0;
	level.var_1523["emp_snake"].var_2002 = 0;
	level.var_1523["emp_snake"].var_58DE = 0.000386;
	level.var_1523["emp_snake"].var_7111 = 150;
	level.var_1523["emp_snake"].var_59F4 = 800;
	level.var_1523["emp_snake"].var_2D94 = 0.01;
	level.var_1523["emp_snake"].var_710F = 0;
	level.var_1523["emp_snake"].var_7090 = 0;
	level.var_1523["emp_snake"].var_5C34 = 0;
	level.var_1523["emp_snake"].var_5A15 = 880;
	level.var_1523["emp_snake"].var_2C27 = 0;
	level.var_1523["emp_snake"].var_3071 = 1;
}

//Function Number: 2
lib_A5F8::func_893D(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		var_03 = param_01 lib_A59A::func_896F();
	}
	else
	{
		var_03 = lib_A59E::func_8973(param_01);
	}

	var_03 lib_A5FA::func_826D();
	return var_03;
}

//Function Number: 3
lib_A5F8::func_5D88()
{
	self endon("death");
	foreach(var_01 in self.var_2F19)
	{
		while(isdefined(var_01))
		{
			wait(0.05);
		}
	}

	self notify("drones_gone");
}

//Function Number: 4
lib_A5F8::func_3927()
{
	self endon("death");
	self.var_24D5 = common_scripts\utility::getclosest(self.var_2E6,level.var_2E1D);
	lib_A5F8::func_9AB6();
	self waittill("near_goal");
	wait(2);
	for(;;)
	{
		var_00 = lib_A59A::func_3CFD(self.var_2E6);
		self veh_setlookatent(var_00);
		var_01 = var_00.var_2E6;
		var_02 = common_scripts\utility::getclosest(var_01,level.var_6C2C);
		var_03 = getent(var_02.target,"targetname");
		if(var_03 != self.var_24D5)
		{
			var_04 = lib_A5F8::func_3DE8(self.var_24D5,var_03,level.var_2E1D);
			if(isdefined(var_04))
			{
				self.var_24D5 = var_04;
			}
		}

		lib_A5F8::func_9AB6();
		self waittill("near_goal");
		if(var_03 == self.var_24D5)
		{
			wait(randomfloatrange(0.5,1.5));
		}
	}
}

//Function Number: 5
lib_A5F8::func_9AB6()
{
	var_00 = self.var_2E6;
	var_01 = spawn("script_origin",(0,0,0));
	var_01.var_2E6 = var_00;
	if(!var_01 istouching(self.var_24D5))
	{
		var_00 = lib_A5F8::func_3E43(self.var_24D5);
	}
	else
	{
		var_02 = 0;
		var_03 = 0;
		var_04 = (0,0,0);
		var_05 = 0;
		var_06 = (0,0,0);
		foreach(var_08 in level.flying_attack_drones)
		{
			if(self != var_08 && isdefined(self.var_24D5) && isdefined(var_08.var_24D5))
			{
				if(self.var_24D5 == var_08.var_24D5)
				{
					var_02++;
					var_09 = var_08.var_2E6 - self.var_2E6;
					var_0A = length(var_09);
					if(var_0A < 90)
					{
						var_03++;
						var_04 = var_04 - 0.5 * 90 - var_0A * var_09 / var_0A;
					}
					else if(var_0A > 150)
					{
						var_05++;
						var_06 = var_06 + 0.5 * var_0A - 150 * var_09 / var_0A;
					}
				}
			}
		}

		if(var_02 > 0)
		{
			if(var_03 > 0)
			{
				var_00 = var_00 + var_04 / var_03;
			}

			if(var_05 > 0)
			{
				var_00 = var_00 + var_06 / var_05;
			}
		}
		else
		{
			var_00 = lib_A5F8::func_3E43(self.var_24D5);
		}
	}

	self veh_setgoalpos(var_00,1);
	var_01 delete();
}

//Function Number: 6
lib_A5F8::func_3E43(param_00)
{
	var_01 = spawn("script_origin",(0,0,0));
	var_01.var_2E6 = param_00 getpointinbounds(randomfloatrange(-1,1),randomfloatrange(-1,1),randomfloatrange(-1,1));
	while(!var_01 istouching(param_00))
	{
		var_01.var_2E6 = param_00 getpointinbounds(randomfloatrange(-1,1),randomfloatrange(-1,1),randomfloatrange(-1,1));
	}

	var_02 = var_01.var_2E6;
	var_01 delete();
	return var_02;
}

//Function Number: 7
lib_A5F8::func_3922()
{
	self endon("death");
	self.damagetaken = 0;
	self.var_51C5 = 0;
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04);
		if(!isdefined(var_01) || !isplayer(var_01))
		{
			continue;
		}

		self notify("flying_attack_drone_damaged_by_player");
		thread lib_A5F8::func_3923();
	}
}

//Function Number: 8
lib_A5F8::func_3923()
{
	self notify("taking damage");
	self endon("taking damage");
	self endon("death");
	self.var_51C5 = 1;
	wait(1);
	self.var_51C5 = 0;
}

//Function Number: 9
lib_A5F8::func_3924()
{
	level.flying_attack_drones = common_scripts\utility::array_add(level.flying_attack_drones,self);
	self waittill("death");
	level.flying_attack_drones = common_scripts\utility::array_remove(level.flying_attack_drones,self);
	level notify("flying_attack_drone_destroyed");
}

//Function Number: 10
lib_A5F8::func_3DB9(param_00,param_01)
{
	var_02 = [];
	var_03 = [];
	if(isdefined(param_00.script_linkto))
	{
		var_03 = strtok(param_00.script_linkto," ");
	}

	for(var_04 = 0;var_04 < param_01.size;var_04++)
	{
		var_05 = 0;
		if(isdefined(param_01[var_04].script_linkname))
		{
			for(var_06 = 0;var_06 < var_03.size;var_06++)
			{
				if(param_01[var_04].script_linkname == var_03[var_06])
				{
					var_02[var_02.size] = param_01[var_04];
					var_05 = 1;
					break;
				}
			}
		}

		if(!var_05 && isdefined(param_01[var_04].script_linkto) && isdefined(param_00.script_linkname))
		{
			var_07 = strtok(param_01[var_04].script_linkto," ");
			for(var_06 = 0;var_06 < var_07.size;var_06++)
			{
				if(param_00.script_linkname == var_07[var_06])
				{
					var_02[var_02.size] = param_01[var_04];
					break;
				}
			}
		}
	}

	return var_02;
}

//Function Number: 11
lib_A5F8::func_3DE8(param_00,param_01,param_02)
{
	var_03 = [];
	var_03[0] = param_00;
	var_04 = [];
	foreach(var_06 in param_02)
	{
		var_06.var_3BC1 = 0;
	}

	param_00.var_35B2 = param_00.var_3BC1 + distance(param_00.var_2E6,param_01.var_2E6);
	while(var_03.size > 0)
	{
		var_08 = undefined;
		var_09 = 500000;
		foreach(var_0B in var_03)
		{
			if(var_0B.var_35B2 < var_09)
			{
				var_08 = var_0B;
				var_09 = var_0B.var_35B2;
			}
		}

		if(var_08 == param_01)
		{
			var_0D = param_01;
			while(var_0D.var_1A12 != param_00)
			{
				var_0D = var_0D.var_1A12;
			}

			return var_0D;
		}

		var_04 = common_scripts\utility::array_remove(var_04,var_09);
		var_05[var_05.size] = var_09;
		var_0F = lib_A5F8::func_3DB9(var_09,var_03);
		foreach(var_0C in var_0F)
		{
			var_11 = var_09.var_3BC1 + distance(var_09.var_2E6,var_0C.var_2E6);
			if(common_scripts\utility::array_contains(var_05,var_0C) && var_11 >= var_0C.var_3BC1)
			{
				continue;
			}

			var_12 = common_scripts\utility::array_contains(var_04,var_0C);
			if(!var_12 || var_11 < var_0C.var_3BC1)
			{
				var_0C.var_1A12 = var_09;
				var_0C.var_3BC1 = var_11;
				var_0C.var_35B2 = var_0C.var_3BC1 + distance(var_0C.var_2E6,param_02.var_2E6);
				if(!var_12)
				{
					var_04[var_04.size] = var_0C;
				}
			}
		}
	}

	return undefined;
}

//Function Number: 12
lib_A5F8::func_888D(param_00,param_01)
{
	return sortbydistance(param_00,param_01,0,1);
}

//Function Number: 13
lib_A5F8::func_52CE(param_00,param_01)
{
	level endon("end_kamikaze_newstyle");
	level endon("delete_drone_cloud");
	for(;;)
	{
		var_02 = lib_A5F8::func_888D(level.var_38E5,level.var_31D.var_2E6);
		var_03 = randomint(5);
		for(var_04 = 0;var_04 < var_03;var_04++)
		{
			if(!isdefined(var_02[var_04]) || isdefined(var_02[var_04].var_E42))
			{
				continue;
			}

			var_02[var_04] thread lib_A5F8::func_2E7E(param_01,param_00);
			var_02[var_04].var_E42 = 1;
			wait(randomfloatrange(0.1,0.25));
		}

		wait(0.5);
	}
}

//Function Number: 14
lib_A5F8::func_4565(param_00)
{
	if(!level.var_2F24)
	{
		return;
	}

	level notify("kill_drone_vs_carshiel_process");
	level endon("kill_drone_vs_carshiel_process");
	level endon("end_drone_kamikaze_player");
	level endon("delete_drone_cloud");
	for(;;)
	{
		while(level.var_38E5.size <= 0)
		{
			wait(0.05);
		}

		var_01 = anglestoforward(level.var_31D getplayerangles());
		var_02 = level.var_31D geteye() + var_01 * 200;
		var_03 = lib_A5F8::func_888D(level.var_38E5,var_02);
		if(var_03.size > 0)
		{
			var_04 = distance(var_03[0].var_2E6,level.var_31D.var_2E6);
			if(var_04 <= 1000)
			{
				var_03[0] thread lib_A5F8::func_2E7E(param_00);
				var_03[0] setmodel("vehicle_mil_attack_drone_static");
				wait(randomfloatrange(1.5,2.5));
			}
			else
			{
				wait(0.25);
			}

			continue;
		}

		wait(0.25);
	}
}

//Function Number: 15
lib_A5F8::func_3997(param_00,param_01)
{
	level endon("delete_drone_cloud");
	var_02 = lib_A5F8::func_3DB5();
	if(!isdefined(var_02))
	{
		return;
	}

	while(isdefined(param_00.var_9D3C))
	{
		wait(0.1);
	}

	var_02 thread lib_A5F8::func_2E7E(param_00,undefined,param_01);
}

//Function Number: 16
lib_A5F8::func_3DB5()
{
	level endon("delete_drone_cloud");
	var_00 = undefined;
	for(;;)
	{
		var_01 = anglestoforward(level.var_31D getplayerangles());
		var_02 = level.var_31D geteye() + var_01 * 200;
		var_03 = lib_A5F8::func_888D(level.var_38E5,var_02);
		foreach(var_00 in var_03)
		{
			var_05 = distance(var_00.var_2E6,var_02);
			if(var_05 > 100)
			{
				continue;
			}
			else
			{
				return var_00;
			}
		}

		wait 0.05;
	}
}

//Function Number: 17
lib_A5F8::func_2E7E(param_00,param_01,param_02)
{
	level endon("delete_drone_cloud");
	level endon("stop_kamikaze_player");
	if(isdefined(param_00.var_9D3C))
	{
		return;
	}

	if(!isdefined(level.var_899D))
	{
		level.var_899D = [];
	}

	var_03 = param_00 lib_A59A::func_896F();
	level.var_899D[level.var_899D.size] = var_03;
	if(!isdefined(var_03) || !var_03 lib_A59E::func_51FA())
	{
		return;
	}

	var_03 notify("nodeath_thread");
	var_03.health = 1;
	if(isdefined(self))
	{
		var_03 veh_teleport(self.var_2E6,self.var_41);
		var_04 = vectortoangles(level.var_31D.var_2E6 - var_03.var_2E6);
		var_03 veh_teleport(self.var_2E6,var_04);
	}
	else
	{
		return;
	}

	if(level.var_5344)
	{
		level.var_38E5 = common_scripts\utility::array_add(level.var_38E5,var_03);
		var_03.var_52CB = 1;
	}

	var_05 = var_03.var_2E6;
	for(;;)
	{
		if(!isdefined(var_03) || !var_03 lib_A59E::func_51FA())
		{
			return;
		}

		var_06 = anglestoforward(level.var_31D getplayerangles());
		var_07 = level.var_31D geteye() + var_06 * 30;
		var_03 veh_setspeed(20,20,20);
		var_03 lib_A5F8::func_8349(var_07);
		var_08 = level.var_31D.var_2E6 - var_03.var_2E6;
		var_08 = vectortoyaw(var_08);
		var_03 veh_setgoalyaw(var_08);
		if(!isdefined(param_01))
		{
			if(distance(var_03.var_2E6,level.var_31D geteye()) < 60)
			{
				var_09 = 30;
				level.var_31D notify("car_door_shield_damaged",var_09,var_03.var_2E6,var_03.var_41,"drones");
				if(!lib_A5F8::func_500D(level.var_31D getcurrentweapon()))
				{
					lib_A5DE::snd_message("drone_kamikaze_hit_player");
				}

				var_03 thread lib_A5F8::func_2E41();
				level.var_31D notify("kamikaze_hit_player");
				earthquake(randomfloatrange(0.25,1),0.5,level.var_31D.var_2E6,32);
			}
		}
		else if((isdefined(param_01) && var_03 lib_A5F8::func_5167(param_01)) || distance(var_03.var_2E6,level.var_31D geteye()) < 60)
		{
			if(distance(var_03.var_2E6,level.var_31D geteye()) < 60)
			{
				lib_A5DE::snd_message("drone_kamikaze_hit_player");
			}

			var_03 thread lib_A5F8::func_2E41();
			earthquake(randomfloatrange(0.25,1),0.5,level.var_31D.var_2E6,32);
		}
		else if(!bullettracepassed(var_05,var_03.var_2E6,0,var_03))
		{
			var_03 thread lib_A5F8::func_2E41();
		}

		if(isdefined(var_03))
		{
			var_05 = var_03.var_2E6;
		}

		wait(0.05);
	}
}

//Function Number: 18
lib_A5F8::func_500D(param_00)
{
	return param_00 == "weapon_suv_door_shield_fr" || param_00 == "weapon_suv_door_shield_fl" || param_00 == "weapon_suv_door_shield_kl" || param_00 == "weapon_suv_door_shield_kr";
}

//Function Number: 19
lib_A5F8::func_2E7F(param_00,param_01)
{
	var_02 = param_00.model;
	var_03 = spawn("script_model",self.var_2E6);
	var_03.var_41 = self.var_41;
	var_03 setmodel(var_02);
	var_04 = 352;
	var_05 = 1920;
	var_06 = 0.15;
	var_07 = 0.3;
	var_08 = (0,0,0);
	var_09 = 0;
	var_0A = 60;
	var_0B = self method_84E7();
	var_0C = undefined;
	var_0D = vectornormalize(var_0B);
	var_0E = var_0D;
	for(;;)
	{
		var_0C = lib_A5F8::func_52CD();
		var_0F = var_0C - var_03.var_2E6;
		var_0D = vectornormalize(var_0F);
		var_10 = var_0D - var_0E * 20 + var_08 + common_scripts\utility::randomvector(var_09);
		var_0E = var_0D;
		var_11 = length(var_0B);
		var_12 = vectornormalize(var_0B);
		if(var_11 < var_04)
		{
			var_13 = min(var_11 + var_05 * 0.05,var_04);
		}
		else
		{
			var_13 = max(var_11 - var_05 * 0.05,var_04);
		}

		if(vectordot(var_0B,var_0C - var_03.var_2E6) < 0)
		{
			var_10 = var_10 * -1;
		}

		var_14 = function_0284(var_10 * var_07,var_06);
		var_15 = vectornormalize(var_12 + var_14);
		var_0B = var_15 * var_13;
		var_16 = var_03.var_2E6 + var_0B * 0.05;
		if(!bullettracepassed(self.var_2E6,var_16,0,var_03))
		{
			break;
		}

		var_03.var_2E6 = var_16;
		var_03.var_41 = vectortoangles(var_0B);
		if(distance(var_16,var_0C) < var_0A)
		{
			break;
		}

		if(isdefined(param_01) && var_03 istouching(param_01))
		{
			break;
		}

		wait 0.05;
	}

	var_17 = 30;
	level.var_31D notify("car_door_shield_damaged",var_17,var_03.var_2E6,var_03.var_41,"drones");
	var_03 lib_A5F8::func_2E41(var_0B);
	earthquake(randomfloatrange(0.25,1),0.5,level.var_31D.var_2E6,32);
}

//Function Number: 20
lib_A5F8::func_52CD()
{
	var_00 = anglestoforward(level.var_31D getplayerangles());
	var_01 = level.var_31D geteye() + var_00 * 30;
	return var_01;
}

//Function Number: 21
lib_A5F8::func_5167(param_00)
{
	var_01 = common_scripts\utility::spawn_tag_origin();
	if(var_01 istouching(param_00))
	{
		var_01 delete();
		return 1;
	}
	else
	{
		var_01 delete();
	}

	return 0;
}

//Function Number: 22
lib_A5F8::func_8349(param_00)
{
	if(!isdefined(self))
	{
		return;
	}

	if(!lib_A59E::func_51FA())
	{
		return;
	}

	self veh_setgoalpos(param_00);
}

//Function Number: 23
lib_A5F8::func_2E41(param_00,param_01)
{
	var_02 = self.var_2E6;
	var_03 = self.var_41;
	if(!isdefined(level.var_33DE))
	{
		level.var_33DE = 0;
	}

	if(level.var_33DE > 1)
	{
		level.var_33DE = 0;
	}

	if(randomint(100) < 5)
	{
		playfx(common_scripts\utility::getfx("drone_sparks"),var_02);
	}

	if(isdefined(param_00))
	{
		if(level.gameskill > 1 && level.var_33DE < 1)
		{
			magicbullet("iw5_attackdronemagicbullet",var_02,var_02 + param_00);
			level.var_33DE++;
		}
		else
		{
			magicbullet("iw5_attackdronemagicbullet",var_02,var_02 + param_00);
		}
	}
	else if(level.gameskill > 1 && level.var_33DE < 1)
	{
		magicbullet("iw5_attackdronemagicbullet",var_02,level.var_31D geteye());
		level.var_33DE++;
	}
	else
	{
		magicbullet("iw5_attackdronemagicbullet",var_02,level.var_31D geteye());
	}

	level notify("heavy_rumble");
	var_04 = spawn("script_model",var_02);
	var_04 setmodel("vehicle_mil_attack_drone_destroy");
	var_04.var_41 = var_03;
	level notify("drone_kamikaze_crash",self.var_2E6);
	if(!isdefined(param_01) || !param_01)
	{
		self delete();
	}

	var_05 = var_04.var_2E6 + (randomintrange(-10,10),randomintrange(-10,10),randomintrange(-10,10)) - level.var_31D geteye();
	var_06 = randomintrange(50,80);
	var_04 physicslaunchserver(var_04.var_2E6 + (randomintrange(-15,15),randomintrange(-15,15),randomintrange(-15,15)),var_05 * var_06);
	if(randomint(100) < 15)
	{
		playfxontag(common_scripts\utility::getfx("drone_smoke"),var_04,"tag_origin");
	}

	playfxontag(common_scripts\utility::getfx("drone_sparks"),var_04,"tag_origin");
	if(level.var_143D)
	{
		playfxontag(common_scripts\utility::getfx("drone_death_explode1"),var_04,"tag_origin");
	}

	wait(15);
	var_04 delete();
}

//Function Number: 24
lib_A5F8::func_88E1(param_00,param_01)
{
	var_02 = self.var_2E6;
	var_03 = self.var_41;
	var_04 = spawn("script_model",var_02);
	var_04 setmodel("vehicle_mil_attack_drone_destroy");
	var_04.var_41 = var_03;
	var_05 = var_04.var_2E6 + (randomintrange(-10,10),randomintrange(-10,10),randomintrange(-10,10)) - level.var_31D geteye();
	var_04 physicslaunchserver(var_04.var_2E6 + (randomintrange(-15,15),randomintrange(-15,15),randomintrange(-15,15)),var_05);
	if(randomint(100) < 5)
	{
		playfxontag(common_scripts\utility::getfx("drone_smoke"),var_04,"tag_origin");
	}

	wait(randomfloat(5));
	playfx(common_scripts\utility::getfx("drone_sparks"),var_04.var_2E6);
	var_04 delete();
}

//Function Number: 25
lib_A5F8::func_1EB1()
{
	level waittill("delete_drone_cloud");
	common_scripts\utility::array_thread(level.var_38E5,::lib_A5F8::func_2809);
}

//Function Number: 26
lib_A5F8::func_2809()
{
	if(!isdefined(self))
	{
		return;
	}

	self delete();
}

//Function Number: 27
lib_A5F8::func_4555(param_00,param_01)
{
	self notify("kill_cloud_vehicle_attack_process");
	self endon("kill_cloud_vehicle_attack_process");
	if(!common_scripts\utility::flag("cloud_in_formation"))
	{
		common_scripts\utility::flag_set("cloud_in_formation");
	}

	if(isdefined(param_00))
	{
		thread lib_A5F8::func_2E30(param_00,param_01);
	}

	while(lib_A5FA::func_50F4(param_00))
	{
		wait(0.05);
	}

	common_scripts\utility::flag_clear("cloud_in_formation");
	level notify("drone_cloud_formation_end");
}

//Function Number: 28
lib_A5F8::func_2E30(param_00,param_01)
{
	self notify("kill_drone_cloud_formation_circle_process");
	self endon("kill_drone_cloud_formation_circle_process");
	var_02 = (0,0,0);
	param_00 endon("death");
	param_00.var_3964 = 200;
	level.var_1FE3.var_70B6 = 600;
	level.var_1FE3.accel = 35;
	level.var_1FE3.var_273C = 45;
	if(!isdefined(param_01))
	{
		param_01 = 100;
	}

	while(lib_A5FA::func_50F4(param_00))
	{
		level.var_1FE3.var_28B5 = level.var_1FE3 veh_getspeed() + 8;
		level.var_2EDB.var_2E6 = param_00.var_2E6;
		level.var_2EDB.var_41 = param_00.var_41;
		var_03 = level.var_2EDB lib_A5FA::func_6378("backward","tag_origin",param_00.var_3964);
		var_03 = var_03 + (0,0,param_01);
		if(var_03 == var_02 && distance(var_03,level.var_1FE3.var_2E6) < 20)
		{
			level.var_1FE3 veh_setspeed(0,30,40);
		}
		else
		{
			var_04 = param_00 veh_getspeed() * 1.25;
			if(var_04 <= 0)
			{
				var_04 = 18;
			}

			level.var_1FE3 veh_setspeed(var_04,var_04,var_04 * 1.25);
			level.var_1FE3 veh_setgoalpos(var_03);
		}

		var_02 = var_03;
		wait(0.05);
	}

	level.var_1FE3 veh_setspeed(10,5,5);
}

//Function Number: 29
lib_A5F8::func_2E31(param_00,param_01,param_02)
{
	self notify("kill_drone_cloud_formation_circle_process");
	self endon("kill_cdrone_cloud_formation_circle_process");
	level endon("end_cherry_picker");
	level endon("end_drone_cloud");
	self endon("death");
	foreach(var_05, var_04 in level.var_2ED3)
	{
		if(var_04 != self)
		{
			var_04 thread lib_A5F8::func_708C(self,var_05);
		}
	}

	self hide();
	var_06 = (0,0,0);
	param_00 endon("death");
	level.var_31D endon("death");
	param_00.var_3964 = 200;
	self.var_70B6 = 600;
	self.accel = 35;
	self.var_273C = 45;
	self.var_74C3 = 0;
	var_07 = param_00.var_2E6 + (0,0,90);
	var_08 = var_07[2] + 50;
	var_09 = var_07[2] + 250;
	if(!isdefined(param_01))
	{
		param_01 = 50;
	}

	while(isdefined(self))
	{
		while(common_scripts\utility::flag("cloud_queen_retreat_path"))
		{
			self.var_74C3 = 1;
			wait(0.05);
		}

		self.var_74C3 = 0;
		wait(randomfloatrange(0.5,0.9));
		var_0A = lib_A5F8::func_3827(250,70);
		var_0B = param_00 gettagorigin("tag_flash");
		var_0C = param_00 gettagangles("tag_flash");
		var_0B = var_0B + anglestoforward(var_0C) * param_01;
		var_0B = var_0B + var_0A;
		if(var_0B[2] > var_09)
		{
			var_0B = (var_0B[0],var_0B[1],var_08);
		}
		else if(var_0B[2] < var_08)
		{
			var_0B = (var_0B[0],var_0B[1],var_09);
		}

		var_0D = vectortoangles(var_07 - self.var_2E6);
		self veh_teleport(var_0B,var_0D);
		self veh_setspeed(0,5,5);
		wait(0.25);
	}
}

//Function Number: 30
lib_A5F8::func_708C(param_00,param_01)
{
	level endon("delete_drone_cloud");
	level endon("end_drone_cloud");
	self endon("death");
	self notify("kill_queen_drone_fly_process");
	self endon("kill_queen_drone_fly_process");
	self.var_74C3 = 0;
	self.var_70B6 = 250;
	self.accel = 5;
	self.var_273C = 15;
	var_02 = (0,0,0);
	self.var_28B5 = 15;
	self.var_60A2 = param_00.var_2E6;
	var_03 = level.var_31D.var_1D38;
	self.var_5908 = undefined;
	thread lib_A5F8::func_5909(200,-100,150,level.var_1FE3);
	while(lib_A5FA::func_5071())
	{
		while(!isdefined(self.var_5908) || self.var_74C3)
		{
			wait(0.05);
		}

		if(level.var_1FE3 veh_getspeed() < 18)
		{
			var_04 = 18;
		}
		else
		{
			var_04 = level.var_1FE3 veh_getspeed();
		}

		self veh_setspeed(var_04,var_04,var_04);
		self veh_setgoalpos(self.var_5908);
		wait(0.5);
	}
}

//Function Number: 31
lib_A5F8::func_5909(param_00,param_01,param_02,param_03)
{
	level endon("end_drone_cloud");
	var_04 = level.var_31D.var_1D38;
	var_05 = param_03.var_2E6;
	var_06 = var_05;
	while(isdefined(self))
	{
		var_07 = distance(var_05,param_03.var_2E6);
		var_08 = lib_A5F8::func_3827(param_00);
		var_09 = param_03.var_2E6 + var_08;
		var_06 = param_03.var_2E6;
		if(!isdefined(level.var_60F6) || isdefined(level.var_60F6) && distance(level.var_60F6,var_09) > level.var_E1C)
		{
			self.var_5908 = var_09;
			continue;
		}

		wait(0.05);
		continue;
		wait(0.1);
	}
}

//Function Number: 32
lib_A5F8::func_708B(param_00,param_01)
{
	level endon("delete_drone_cloud");
	self endon("death");
	self notify("kill_queen_drone_fly_process");
	self endon("kill_queen_drone_fly_process");
	self.var_70B6 = param_01;
	self.accel = 5;
	self.var_273C = 15;
	var_02 = (0,0,0);
	self.var_28B5 = 15;
	self notify("queen_set_fly_logic");
	while(lib_A5FA::func_5071())
	{
		var_03 = (function_00FE(gettime() * 0.001 * 0.05,10,4,5,2),function_00FE(gettime() * 0.001 * 0.05,20,4,5,2),function_00FE(gettime() * 0.001 * 0.05,30,4,5,2));
		var_04 = lib_A5F8::func_6E5C(param_00.var_2E6,self.var_70B6);
		var_02 = var_04;
		var_05 = param_00 veh_getspeed();
		if(var_05 <= 5)
		{
			var_06 = 1;
			var_05 = 18;
			self veh_setspeed(var_05 * 1.25,var_05 * 2,var_05 * 2.25);
		}
		else
		{
			var_06 = 0;
			self veh_setspeed(var_05 * 1.25,var_05,var_05 * 1.25);
		}

		self veh_setgoalpos(var_03 + var_04);
		if(var_06)
		{
			if(self.location + 1 <= self.var_627E)
			{
				self.location++;
			}
			else
			{
				self.location = 0;
			}

			wait(0.05);
			continue;
		}

		wait(0.25);
	}
}

//Function Number: 33
lib_A5F8::func_6E5C(param_00,param_01)
{
	var_02 = param_01;
	var_03 = 1;
	var_04 = self.var_627E;
	var_05 = 360 / var_04;
	var_06 = [];
	var_07 = [];
	for(var_08 = 0;var_08 < var_04;var_08++)
	{
		var_03 = var_05 * var_08;
		var_09 = 0;
		var_06[var_06.size] = param_00 + anglestoforward((var_09,var_03,0)) * var_02;
	}

	if(isdefined(var_06[self.location]))
	{
		return var_06[self.location];
	}

	return var_06[0];
}

//Function Number: 34
lib_A5F8::func_6E5D(param_00,param_01,param_02)
{
	return param_02.var_2E6;
}

//Function Number: 35
lib_A5F8::func_590D(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = level.var_E1D;
	}

	if(!isdefined(param_02))
	{
		param_02 = 50;
	}

	var_03 = spawnstruct();
	var_03.var_7082 = self;
	var_03.var_7082.var_38E4 = var_03;
	var_03.var_1525 = [];
	if(isdefined(param_00))
	{
		var_03.var_1522 = param_00;
	}
	else
	{
		var_03.var_1522 = spawnstruct();
	}

	function_00D3("r_lightCacheLessFrequentPeriod",20);
	function_00D3("r_lightCacheLessFrequentMaxDistance",9999);
	for(var_04 = 0;var_04 < param_01;var_04++)
	{
		var_05 = spawn("script_model",self.var_2E6);
		if(level.nextgen)
		{
			var_05 setmodel(self.model);
		}
		else if(randomint(100) < param_02)
		{
			var_05 setmodel("vehicle_mil_attack_drone_static_multi_cg");
			var_05 thread lib_A5F8::func_5FDC();
		}
		else
		{
			var_05 setmodel(self.model);
		}

		var_05.old_contents = var_05 setcontents(0);
		var_05 method_805D();
		var_03.var_1525[var_03.var_1525.size] = var_05;
		var_05 thread lib_A5FA::func_5D86();
	}

	self.var_1520 = 1;
	var_03 thread lib_A5FA::func_1521();
	return var_03;
}

//Function Number: 36
lib_A5F8::func_590E(param_00,param_01)
{
	var_02 = spawnstruct();
	var_02.var_7082 = self;
	var_02.var_7082.var_38E4 = var_02;
	var_02.var_1525 = param_01;
	if(isdefined(param_00))
	{
		var_02.var_1522 = param_00;
	}
	else
	{
		var_02.var_1522 = spawnstruct();
	}

	function_00D3("r_lightCacheLessFrequentPeriod",20);
	function_00D3("r_lightCacheLessFrequentMaxDistance",9999);
	foreach(var_04 in param_01)
	{
		var_04.old_contents = var_04 setcontents(0);
		var_04 method_805D();
		var_04 thread lib_A5FA::func_5D86();
	}

	self.var_1520 = 1;
	var_02 thread lib_A5FA::func_1521();
	return var_02;
}

//Function Number: 37
lib_A5F8::func_5D8F()
{
	if(common_scripts\utility::cointoss())
	{
		return;
	}

	var_00 = getentarray("vol_drone_swarm_boundary","targetname");
	while(isdefined(self))
	{
		if(!lib_A5F8::func_5001(var_00))
		{
			wait(0.1);
		}

		wait(0.05);
	}
}

//Function Number: 38
lib_A5F8::func_5001(param_00)
{
	foreach(var_02 in param_00)
	{
		if(self istouching(var_02))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 39
lib_A5F8::func_3828(param_00)
{
	var_01 = param_00 * param_00;
	for(var_02 = common_scripts\utility::randomvector(param_00);lengthsquared(var_02) > var_01;var_02 = common_scripts\utility::randomvector(param_00))
	{
	}

	return (var_02[0],var_02[1],var_02[2] * 0.65);
}

//Function Number: 40
lib_A5F8::func_3827(param_00,param_01)
{
	var_02 = lib_A5F8::func_3828(1);
	var_03 = vectornormalize(var_02) * param_00;
	while(isdefined(param_01))
	{
		if(var_03[2] < param_01)
		{
			var_02 = lib_A5F8::func_3828(1);
			var_03 = vectornormalize(var_02) * param_00;
			continue;
		}

		break;
	}

	return var_03;
}

//Function Number: 41
lib_A5F8::func_151E(param_00,param_01)
{
	param_00 notify("stop_friendlyfire_shield");
	level endon("end_drone_cloud");
	param_00 endon("death");
	if(!isdefined(param_01))
	{
		param_01 = 300;
	}

	while(lib_A5FA::func_50F4(param_00))
	{
		var_02 = lib_A5F8::func_888D(level.var_38E5,param_00.var_2E6);
		for(var_03 = 0;var_03 < 5;var_03++)
		{
			if(isdefined(var_02[var_03]))
			{
				var_02[var_03] thread lib_A5FA::func_1524(param_00,param_01);
				wait(0.1);
			}
		}

		wait(2);
	}
}

//Function Number: 42
lib_A5F8::func_5FDC()
{
	self endon("death");
	level endon("end_drone_cloud");
	level endon("delete_drone_cloud");
	self method_8115(#animtree);
	if(randomfloat(1) >= 0.5)
	{
		var_00 = %mil_attack_drone_multi_cg_spin_cw;
	}
	else
	{
		var_00 = %mil_attack_drone_multi_cg_spin_ccw;
	}

	var_01 = function_0063(var_00);
	wait(randomfloat(1));
	for(;;)
	{
		self method_8145(var_00);
		wait(var_01);
	}
}