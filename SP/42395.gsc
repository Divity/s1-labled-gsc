/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42395.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 93
 * Decompile Time: 41 ms
 * Timestamp: 4/20/2022 8:23:26 PM
*******************************************************************/

//Function Number: 1
lib_A59B::func_5775(param_00,param_01,param_02,param_03)
{
	for(var_04 = 0;var_04 < param_03 * 20;var_04++)
	{
		wait(0.05);
	}
}

//Function Number: 2
lib_A59B::func_8F64(param_00,param_01)
{
	var_02 = param_00.var_8F5B;
	var_03 = param_01.var_8F5B;
	self.var_CD8[var_03] = param_00;
	self.var_CD8[var_02] = param_01;
	self.var_CD8[var_02].var_8F5B = var_02;
	self.var_CD8[var_03].var_8F5B = var_03;
}

//Function Number: 3
lib_A59B::func_A055(param_00,param_01)
{
	waittillframeend;
	var_02 = [];
	if(level.var_9FD8 == 1)
	{
		var_02[0] = randomfloatrange(param_00,param_01);
		level.var_9FD7 = var_02;
		level.var_71C = undefined;
		return;
	}

	var_02[0] = param_00;
	var_02[var_02.size] = param_01;
	for(var_03 = 1;var_03 < level.var_9FD8 - 1;var_03++)
	{
		var_02 = lib_A59B::func_A056(var_02);
	}

	level.var_9FD7 = common_scripts\utility::array_randomize(var_02);
	level.var_71C = undefined;
}

//Function Number: 4
lib_A59B::func_A056(param_00)
{
	var_01 = -1;
	var_02 = 0;
	for(var_03 = 0;var_03 < param_00.size - 1;var_03++)
	{
		var_04 = param_00[var_03 + 1] - param_00[var_03];
		if(var_04 <= var_02)
		{
			continue;
		}

		var_02 = var_04;
		var_01 = var_03;
	}

	var_05 = [];
	for(var_06 = 0;var_06 < param_00.size;var_06++)
	{
		if(var_01 == var_06 - 1)
		{
			var_05[var_05.size] = randomfloatrange(param_00[var_01],param_00[var_01 + 1]);
		}

		var_05[var_05.size] = param_00[var_06];
	}

	return var_05;
}

//Function Number: 5
lib_A59B::func_A09D(param_00)
{
	while(level.var_266A[self.var_7981] > 0)
	{
		level waittill("spawner_expired" + self.var_7981);
	}

	if(param_00)
	{
		self waittill("trigger");
	}

	var_01 = lib_A59A::func_3EA1();
	common_scripts\utility::flag_set(var_01);
}

//Function Number: 6
lib_A59B::func_9FF1()
{
	self endon("death");
	self endon("removed from battleChatter");
	while(self.var_51B0)
	{
		wait(0.05);
	}
}

//Function Number: 7
lib_A59B::func_9FC1(param_00)
{
	self endon("death");
	param_00 endon("trigger");
	self waittill("trigger");
	param_00 notify("trigger");
}

//Function Number: 8
lib_A59B::func_9FBA(param_00,param_01)
{
	var_02 = getentarray(param_00,param_01);
	var_03 = spawnstruct();
	common_scripts\utility::array_thread(var_02,::lib_A59B::func_9FC1,var_03);
	var_03 waittill("trigger");
}

//Function Number: 9
lib_A59B::func_32ED(param_00)
{
	self endon("done");
	param_00 waittill("trigger");
	self notify("done");
}

//Function Number: 10
lib_A59B::func_9AA8()
{
	self notify("debug_color_update");
	self endon("debug_color_update");
	var_00 = self.unique_id;
	self waittill("death");
	level.var_2684[var_00] = undefined;
	level notify("updated_color_friendlies");
}

//Function Number: 11
lib_A59B::func_9AA7(param_00)
{
	thread lib_A59B::func_9AA8();
	if(isdefined(self.var_79E1))
	{
		level.var_2684[param_00] = self.var_79E1;
	}
	else
	{
		level.var_2684[param_00] = undefined;
	}

	level notify("updated_color_friendlies");
}

//Function Number: 12
lib_A59B::func_70C7(param_00)
{
	var_01 = gettime();
	for(;;)
	{
		if(!isdefined(self.var_61C))
		{
			break;
		}

		self waittill("finished_radio");
		if(gettime() > var_01 + 7500)
		{
			return;
		}
	}

	self.var_61C = 1;
	lib_A59A::func_9F83(level.var_553E,0.5);
	level.var_31D lib_A59A::play_sound_on_entity(level.var_78B6[param_00]);
	self.var_61C = undefined;
	level.var_553E = gettime();
	self notify("finished_radio");
}

//Function Number: 13
lib_A59B::func_32EC(param_00,param_01)
{
	self endon(param_00);
	wait(param_01);
}

//Function Number: 14
lib_A59B::func_A081(param_00,param_01,param_02)
{
	param_00 endon("done");
	[[ param_01 ]](param_02);
	param_00 notify("done");
}

//Function Number: 15
lib_A59B::func_490B(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		wait(param_00);
		return;
	}

	var_02 = param_00 * 20;
	for(var_03 = 0;var_03 < var_02;var_03++)
	{
		if([[ param_01 ]]())
		{
			break;
		}

		wait(0.05);
	}
}

//Function Number: 16
lib_A59B::func_48E7(param_00)
{
	wait(param_00);
	self.var_935A = 1;
}

//Function Number: 17
lib_A59B::func_48DF(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	return param_00 + lib_A59B::func_05CC(param_01,param_02,param_03,param_04,param_05,param_06);
}

//Function Number: 18
lib_A59B::func_05CC(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = function_0094();
	if(level.var_31D common_scripts\utility::is_player_gamepad_enabled())
	{
		if((isdefined(level.ps3) && level.ps3) || isdefined(level.ps4) && level.ps4)
		{
			if(issubstr(var_06,"southpaw") || param_05 && issubstr(var_06,"legacy"))
			{
				return param_04;
			}

			return param_03;
		}

		if(issubstr(var_06,"southpaw") || param_05 && issubstr(var_06,"legacy"))
		{
			return param_02;
		}

		return param_01;
	}

	return param_00;
}

//Function Number: 19
lib_A59B::func_05CE(param_00,param_01)
{
	var_02 = param_01 + param_00;
	var_03 = level.var_97A0[var_02];
	level.var_48B1 = var_03;
}

//Function Number: 20
lib_A59B::func_05CD(param_00,param_01)
{
	var_02 = param_01 + param_00;
	var_03 = level.var_97A1[var_02];
	level.var_24EC settext(var_03);
}

//Function Number: 21
lib_A59B::func_48E0(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	level notify("hint_change_config");
	level endon("hint_change_config");
	var_07 = lib_A59B::func_05CC(param_01,param_02,param_03,param_04,param_05,param_06);
	lib_A59B::func_05CE(var_07,param_00);
	lib_A59B::func_05CD(var_07,param_00);
	while(isdefined(level.var_24EC))
	{
		var_08 = lib_A59B::func_05CC(param_01,param_02,param_03,param_04,param_05,param_06);
		if(var_08 != var_07)
		{
			var_07 = var_08;
			lib_A59B::func_05CE(var_07,param_00);
			lib_A59B::func_05CD(var_07,param_00);
		}

		wait 0.05;
	}
}

//Function Number: 22
lib_A59B::func_490A(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = gettime();
	if(!isdefined(param_06))
	{
		param_06 = 0;
	}

	if(!isalive(self))
	{
		return;
	}

	if(!isdefined(param_07))
	{
		param_07 = 0;
	}

	var_09 = 1;
	var_0A = 0.75;
	var_0B = 0.95;
	var_0C = 0.4;
	var_0D = 2;
	if(isdefined(level.var_48CA))
	{
		var_0D = level.var_48CA;
	}

	if(isdefined(self.var_24E9))
	{
		if(self.var_24E9 == param_00)
		{
			return;
		}
	}

	lib_A59A::func_32E3("global_hint_in_use");
	if(isdefined(self.var_24E9))
	{
		if(self.var_24E9 == param_00)
		{
			return;
		}
	}

	lib_A59A::func_32DD("global_hint_in_use");
	self.var_24E9 = param_00;
	var_0E = lib_A53C::func_23ED("default",var_0D);
	level.var_24EC = var_0E;
	level.var_48B1 = param_01;
	thread lib_A59B::func_28C3(var_0E);
	level endon("friendlyfire_mission_fail");
	var_0E.alpha = 0.9;
	var_0E.x = 0;
	var_0E.y = -68 + param_07;
	var_0E.alignx = "center";
	var_0E.aligny = "middle";
	var_0E.horzalign = "center";
	var_0E.vertalign = "middle";
	var_0E.foreground = 0;
	var_0E.var_1EC = 1;
	var_0E.hidewheninmenu = 1;
	var_0E settext(param_00);
	if((isdefined(level.var_48D6) && level.var_48D6) || isdefined(level.var_8631.var_8A50) && level.var_8631.var_8A50 < 0.1)
	{
		var_0E.alpha = var_0B;
		lib_A59B::func_490B(0,level.var_48B1);
	}
	else
	{
		var_0E.alpha = 0;
		var_0E fadeovertime(var_09);
		var_0E.alpha = var_0B;
		lib_A59B::func_490B(var_09,level.var_48B1);
	}

	var_0F = 0;
	if(isdefined(param_04))
	{
		var_0F = 3;
	}
	else if(isdefined(param_03))
	{
		var_0F = 2;
	}
	else if(isdefined(param_02))
	{
		var_0F = 1;
	}

	var_10 = spawnstruct();
	var_10.var_935A = 0;
	if(isdefined(param_05))
	{
		var_10 thread lib_A59B::func_48E7(param_05);
	}

	if(isdefined(level.var_48B1))
	{
		for(;;)
		{
			var_0E fadeovertime(var_0A);
			var_0E.alpha = var_0C;
			lib_A59B::func_490B(var_0A,level.var_48B1);
			if(var_0F == 3)
			{
				if([[ level.var_48B1 ]](param_02,param_03,param_04))
				{
					break;
				}
			}
			else if(var_0F == 2)
			{
				if([[ level.var_48B1 ]](param_02,param_03))
				{
					break;
				}
			}
			else if(var_0F == 1)
			{
				if([[ level.var_48B1 ]](param_02))
				{
					break;
				}
			}
			else if([[ level.var_48B1 ]]())
			{
				break;
			}

			var_0E fadeovertime(var_0A);
			var_0E.alpha = var_0B;
			lib_A59B::func_490B(var_0A,level.var_48B1);
			if(var_10.var_935A)
			{
				break;
			}

			if(var_0F == 3)
			{
				if([[ level.var_48B1 ]](param_02,param_03,param_04))
				{
					break;
				}

				continue;
			}

			if(var_0F == 2)
			{
				if([[ level.var_48B1 ]](param_02,param_03))
				{
					break;
				}

				continue;
			}

			if(var_0F == 1)
			{
				if([[ level.var_48B1 ]](param_02))
				{
					break;
				}

				continue;
			}

			if([[ level.var_48B1 ]]())
			{
				break;
			}
		}
	}
	else
	{
		for(var_11 = 0;var_11 < 1;var_11++)
		{
			var_0E fadeovertime(var_0A);
			var_0E.alpha = var_0C;
			lib_A59B::func_490B(var_0A,level.var_48B1);
			var_0E fadeovertime(var_0A);
			var_0E.alpha = var_0B;
			lib_A59B::func_490B(var_0A,level.var_48B1);
		}
	}

	lib_A59A::func_9F83(var_08,param_06);
	var_0E notify("destroying");
	self.var_24E9 = undefined;
	var_0E destroy();
	level.var_24EC = undefined;
	lib_A59A::func_32D9("global_hint_in_use");
}

//Function Number: 23
lib_A59B::func_48F8(param_00)
{
	level.var_31D notify("HintDisplayHandlerEnd");
	level.var_31D endon("HintDisplayHandlerEnd");
	level.var_31D lib_A59A::func_32E3("global_hint_in_use");
	level.var_31D lib_A59A::func_32DF("global_hint_in_use");
	while(level.var_31D lib_A59A::func_32D7("global_hint_in_use"))
	{
		if(!level.var_31D common_scripts\utility::is_player_gamepad_enabled() && isdefined(level.var_48CF[param_00]["pc"]))
		{
			level.var_24EC settext(level.var_48CF[param_00]["pc"]);
			continue;
		}

		var_01 = function_0094();
		if(issubstr(var_01,"southpaw") && isdefined(level.var_48CF[param_00]["southpaw"]))
		{
			level.var_24EC settext(level.var_48CF[param_00]["southpaw"]);
		}
		else
		{
			level.var_24EC settext(level.var_48CF[param_00]["gamepad"]);
		}

		wait(0.05);
	}
}

//Function Number: 24
lib_A59B::func_48F7(param_00)
{
	if(!level.var_31D common_scripts\utility::is_player_gamepad_enabled() && isdefined(level.var_48CF[param_00]["pc"]))
	{
		level.var_97A1[param_00] = level.var_48CF[param_00]["pc"];
	}
	else
	{
		var_01 = function_0094();
		if(issubstr(var_01,"southpaw") && isdefined(level.var_48CF[param_00]["southpaw"]))
		{
			level.var_97A1[param_00] = level.var_48CF[param_00]["southpaw"];
		}
		else
		{
			level.var_97A1[param_00] = level.var_48CF[param_00]["gamepad"];
		}
	}

	if((isdefined(level.var_48CF[param_00]["pc"]) || isdefined(level.var_48CF[param_00]["southpaw"])) && ![[ level.var_97A0[param_00] ]]())
	{
		thread lib_A59B::func_48F8(param_00);
		return;
	}

	level.var_31D notify("HintDisplayHandlerEnd");
}

//Function Number: 25
lib_A59B::func_28C3(param_00)
{
	param_00 endon("destroying");
	level waittill("friendlyfire_mission_fail");
	if(!isdefined(param_00))
	{
		return;
	}

	self.var_24E9 = undefined;
	param_00 destroy();
	lib_A59A::func_32D9("global_hint_in_use");
}

//Function Number: 26
lib_A59B::func_850E(param_00)
{
	param_00.var_935A = 0;
	if(!isalive(self))
	{
		return;
	}

	var_01 = 1;
	var_02 = 0.75;
	var_03 = 0.95;
	var_04 = 0.4;
	lib_A59A::func_32E3("global_hint_in_use");
	lib_A59A::func_32DD("global_hint_in_use");
	if(param_00.var_935A)
	{
		return;
	}

	if(isdefined(param_00.timeout))
	{
		param_00 thread lib_A59B::func_48E7(param_00.timeout);
	}

	var_05 = lib_A53C::func_23ED("objective",2);
	var_05.alpha = 0.9;
	var_05.x = 0;
	var_05.y = -38;
	var_05.alignx = "center";
	var_05.aligny = "middle";
	var_05.horzalign = "center";
	var_05.vertalign = "middle";
	var_05.foreground = 0;
	var_05.var_1EC = 1;
	var_05 settext(param_00.var_8F4D);
	var_05.alpha = 0;
	var_05 fadeovertime(var_01);
	var_05.alpha = var_03;
	lib_A59B::func_490B(var_01);
	for(;;)
	{
		var_05 fadeovertime(var_02);
		var_05.alpha = var_04;
		lib_A59B::func_490B(var_02);
		if(param_00.var_935A)
		{
			break;
		}

		var_05 fadeovertime(var_02);
		var_05.alpha = var_03;
		lib_A59B::func_490B(var_02);
		if(param_00.var_935A)
		{
			break;
		}
	}

	var_05 destroy();
	lib_A59A::func_32D9("global_hint_in_use");
}

//Function Number: 27
lib_A59B::func_5695(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	if(isdefined(self.var_380D) && self.var_380D == gettime())
	{
		wait(0.1);
	}

	var_09 = self gettagorigin(param_01);
	var_0A = self gettagangles(param_01);
	param_00 lib_A59A::func_5690(var_09,var_0A,param_02,param_03,param_04,param_05,param_06,param_07,param_08);
	if(param_08)
	{
		return;
	}

	param_00 playerlinkto(self,param_01,param_03,param_04,param_05,param_06,param_07,0);
}

//Function Number: 28
lib_A59B::func_5697(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	if(isdefined(self.var_380D) && self.var_380D == gettime())
	{
		wait(0.1);
	}

	var_09 = self gettagorigin(param_01);
	var_0A = self gettagangles(param_01);
	param_00 lib_A59A::func_5692(var_09,var_0A,param_02,param_03,param_04,param_05,param_06,param_07,1);
	if(param_08)
	{
		return;
	}

	param_00 playerlinktodelta(self,param_01,param_03,param_04,param_05,param_06,param_07,0);
}

//Function Number: 29
lib_A59B::func_3AF7(param_00)
{
	self endon("death");
	param_00 common_scripts\utility::waittill_either("function_done","death");
}

//Function Number: 30
lib_A59B::func_3AF8(param_00)
{
	lib_A59B::func_3AF7(param_00);
	if(!isdefined(self))
	{
		return 0;
	}

	if(!issentient(self))
	{
		return 1;
	}

	if(isalive(self))
	{
		return 1;
	}

	return 0;
}

//Function Number: 31
lib_A59B::func_3AF4(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	self endon("death");
	if(!isdefined(param_00.var_3AF0))
	{
		param_00.var_3AF0 = [];
	}

	param_00.var_3AF0[param_00.var_3AF0.size] = self;
	thread lib_A59B::func_3AF5(param_00);
	self.var_667F = param_02;
	lib_A59B::func_3AF1(param_00);
	if(isdefined(param_00) && isdefined(param_00.var_3AF0))
	{
		self.var_3AF3 = 1;
		self notify("function_stack_func_begun");
		var_07 = gettime();
		if(isdefined(param_06))
		{
			param_00 [[ param_01 ]](param_02,param_03,param_04,param_05,param_06);
		}
		else if(isdefined(param_05))
		{
			param_00 [[ param_01 ]](param_02,param_03,param_04,param_05);
		}
		else if(isdefined(param_04))
		{
			param_00 [[ param_01 ]](param_02,param_03,param_04);
		}
		else if(isdefined(param_03))
		{
			param_00 [[ param_01 ]](param_02,param_03);
		}
		else if(isdefined(param_02))
		{
			param_00 [[ param_01 ]](param_02);
		}
		else
		{
			param_00 [[ param_01 ]]();
		}

		if(gettime() == var_07)
		{
			waittillframeend;
		}

		if(isdefined(param_00) && isdefined(param_00.var_3AF0))
		{
			param_00.var_3AF0 = common_scripts\utility::array_remove(param_00.var_3AF0,self);
			param_00 notify("level_function_stack_ready");
		}
	}

	if(isdefined(self))
	{
		self.var_3AF3 = 0;
		self notify("function_done");
	}
}

//Function Number: 32
lib_A59B::func_3AF5(param_00)
{
	self endon("function_done");
	self waittill("death");
	if(isdefined(param_00))
	{
		param_00.var_3AF0 = common_scripts\utility::array_remove(param_00.var_3AF0,self);
		param_00 notify("level_function_stack_ready");
	}
}

//Function Number: 33
lib_A59B::func_3AF1(param_00)
{
	param_00 endon("death");
	self endon("death");
	param_00 endon("clear_function_stack");
	while(isdefined(param_00.var_3AF0) && param_00.var_3AF0[0] != self)
	{
		param_00 waittill("level_function_stack_ready");
	}
}

//Function Number: 34
lib_A59B::func_9A1D(param_00)
{
	level endon("player_flashed");
	wait(param_00);
	common_scripts\utility::flag_clear("player_flashed");
}

//Function Number: 35
lib_A59B::func_9FB4(param_00)
{
	self endon("death");
	param_00 waittill("sounddone");
	return 1;
}

//Function Number: 36
lib_A59B::func_4D71(param_00)
{
	level.var_58B9 = param_00;
	if(!isdefined(level.var_9E53))
	{
		level.var_9E53 = 0;
	}

	return level.var_9E53;
}

//Function Number: 37
lib_A59B::func_0D19(param_00,param_01,param_02)
{
	lib_A59B::func_0D1A(param_00,param_01,param_02);
	self.var_558 = 0;
	self notify("_array_wait");
}

//Function Number: 38
lib_A59B::func_0D1A(param_00,param_01,param_02)
{
	param_00 endon(param_01);
	param_00 endon("death");
	if(isdefined(param_02))
	{
		wait(param_02);
		return;
	}

	param_00 waittill(param_01);
}

//Function Number: 39
lib_A59B::func_33E8(param_00)
{
	if(param_00.var_6692.size == 0)
	{
		param_00.var_1A08 [[ param_00.func ]]();
	}
	else if(param_00.var_6692.size == 1)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0]);
	}
	else if(param_00.var_6692.size == 2)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1]);
	}
	else if(param_00.var_6692.size == 3)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1],param_00.var_6692[2]);
	}

	if(param_00.var_6692.size == 4)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1],param_00.var_6692[2],param_00.var_6692[3]);
	}

	if(param_00.var_6692.size == 5)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1],param_00.var_6692[2],param_00.var_6692[3],param_00.var_6692[4]);
	}
}

//Function Number: 40
lib_A59B::func_33E9(param_00)
{
	if(param_00.var_6692.size == 0)
	{
		[[ param_00.func ]]();
	}
	else if(param_00.var_6692.size == 1)
	{
		[[ param_00.func ]](param_00.var_6692[0]);
	}
	else if(param_00.var_6692.size == 2)
	{
		[[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1]);
	}
	else if(param_00.var_6692.size == 3)
	{
		[[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1],param_00.var_6692[2]);
	}

	if(param_00.var_6692.size == 4)
	{
		[[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1],param_00.var_6692[2],param_00.var_6692[3]);
	}

	if(param_00.var_6692.size == 5)
	{
		[[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1],param_00.var_6692[2],param_00.var_6692[3],param_00.var_6692[4]);
	}
}

//Function Number: 41
lib_A59B::func_33EA(param_00,param_01)
{
	if(!isdefined(param_00.var_1A08))
	{
		return;
	}

	for(var_02 = 0;var_02 < param_01.size;var_02++)
	{
		param_01[var_02].var_1A08 endon(param_01[var_02].var_315A);
	}

	if(param_00.var_6692.size == 0)
	{
		param_00.var_1A08 [[ param_00.func ]]();
	}
	else if(param_00.var_6692.size == 1)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0]);
	}
	else if(param_00.var_6692.size == 2)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1]);
	}
	else if(param_00.var_6692.size == 3)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1],param_00.var_6692[2]);
	}

	if(param_00.var_6692.size == 4)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1],param_00.var_6692[2],param_00.var_6692[3]);
	}

	if(param_00.var_6692.size == 5)
	{
		param_00.var_1A08 [[ param_00.func ]](param_00.var_6692[0],param_00.var_6692[1],param_00.var_6692[2],param_00.var_6692[3],param_00.var_6692[4]);
	}
}

//Function Number: 42
lib_A59B::func_A088(param_00,param_01)
{
	self endon("all_funcs_ended");
	self endon("any_funcs_aborted");
	lib_A59B::func_33EA(param_00,param_01);
	self.count--;
	self notify("func_ended");
}

//Function Number: 43
lib_A59B::func_A05B(param_00,param_01)
{
	self endon("all_funcs_ended");
	self endon("any_funcs_aborted");
	lib_A59B::func_33EA(param_00,param_01);
	self.var_6BB--;
	self notify("abort_func_ended");
}

//Function Number: 44
lib_A59B::func_2BB4(param_00)
{
	self endon("all_funcs_ended");
	if(!param_00.size)
	{
		return;
	}

	var_01 = 0;
	self.var_6BB = param_00.size;
	var_02 = [];
	common_scripts\utility::array_levelthread(param_00,::lib_A59B::func_A05B,var_02);
	for(;;)
	{
		if(self.var_6BB <= var_01)
		{
			break;
		}

		self waittill("abort_func_ended");
	}

	self notify("any_funcs_aborted");
}

//Function Number: 45
lib_A59B::func_971D(param_00)
{
	if(isdefined(self.forward))
	{
		var_01 = anglestoforward(param_00.var_41);
		param_00.var_2E6 = param_00.var_2E6 + var_01 * self.forward;
	}

	if(isdefined(self.var_37E))
	{
		var_02 = anglestoright(param_00.var_41);
		param_00.var_2E6 = param_00.var_2E6 + var_02 * self.var_37E;
	}

	if(isdefined(self.var_4DF))
	{
		var_03 = anglestoup(param_00.var_41);
		param_00.var_2E6 = param_00.var_2E6 + var_03 * self.var_4DF;
	}

	if(isdefined(self.yaw))
	{
		param_00 addyaw(self.yaw);
	}

	if(isdefined(self.pitch))
	{
		param_00 addpitch(self.pitch);
	}

	if(isdefined(self.var_7598))
	{
		param_00 addroll(self.var_7598);
	}
}

//Function Number: 46
lib_A59B::func_2FE3(param_00,param_01,param_02,param_03,param_04)
{
	self notify("start_dynamic_run_speed");
	self endon("death");
	self endon("stop_dynamic_run_speed");
	self endon("start_dynamic_run_speed");
	level endon("_stealth_spotted");
	if(lib_A59A::func_32DB("_stealth_custom_anim"))
	{
		lib_A59A::func_32E3("_stealth_custom_anim");
	}

	if(!lib_A59A::func_32DB("dynamic_run_speed_stopped"))
	{
		lib_A59A::func_32DC("dynamic_run_speed_stopped");
		lib_A59A::func_32DC("dynamic_run_speed_stopping");
	}
	else
	{
		lib_A59A::func_32D9("dynamic_run_speed_stopping");
		lib_A59A::func_32D9("dynamic_run_speed_stopped");
	}

	self.var_76B5 = "";
	self.var_63AC = self.var_5F62;
	thread lib_A59B::func_8E72();
	var_05 = param_00 * param_00;
	var_06 = param_01 * param_01;
	var_07 = param_02 * param_02;
	var_08 = param_03 * param_03;
	for(;;)
	{
		wait(0.05);
		var_09 = level.var_328[0];
		foreach(var_0B in level.var_328)
		{
			if(distancesquared(var_09.var_2E6,self.var_2E6) > distancesquared(var_0B.var_2E6,self.var_2E6))
			{
				var_09 = var_0B;
			}
		}

		var_0D = anglestoforward(self.var_41);
		var_0E = vectornormalize(var_09.var_2E6 - self.var_2E6);
		var_0F = vectordot(var_0D,var_0E);
		var_10 = distancesquared(self.var_2E6,var_09.var_2E6);
		var_11 = var_10;
		if(isdefined(param_04))
		{
			var_12 = common_scripts\utility::getclosest(var_09.var_2E6,param_04);
			var_11 = distancesquared(var_12.var_2E6,var_09.var_2E6);
		}

		var_13 = 0;
		if(isdefined(self.var_5554))
		{
			var_13 = [[ level.var_2F9E ]](self.var_5554,param_01);
		}
		else if(isdefined(self.var_5555))
		{
			var_13 = [[ level.var_2F9E ]](self.var_5555,param_01);
		}

		if(isdefined(self.var_22E0) && self.var_22E0 && !self.var_2D2B)
		{
			self.var_5F62 = 1;
		}

		if(var_10 < var_06 || var_0F > -0.25 || var_13)
		{
			lib_A59B::func_2FE1("sprint");
			wait(0.5);
			continue;
		}
		else if(var_10 < var_05 || var_0F > -0.25)
		{
			lib_A59B::func_2FE1("run");
			wait(0.5);
			continue;
		}
		else if(var_11 > var_07)
		{
			if(self.var_7.var_5F58 != "stop")
			{
				lib_A59B::func_2FE1("stop");
				wait(0.5);
			}

			continue;
		}
		else if(var_10 > var_08)
		{
			lib_A59B::func_2FE1("jog");
			wait(0.5);
			continue;
		}
	}
}

//Function Number: 47
lib_A59B::func_8E72()
{
	self endon("start_dynamic_run_speed");
	self endon("death");
	lib_A59B::func_8E73();
	if(!self.var_2D2B)
	{
		self.var_5F62 = self.var_63AC;
	}

	if(isdefined(level.var_78A9["generic"]["DRS_run"]))
	{
		if(isarray(level.var_78A9["generic"]["DRS_run"]))
		{
			lib_A59A::func_7E40("DRS_run");
		}
		else
		{
			lib_A59A::func_7E3F("DRS_run");
		}
	}
	else
	{
		lib_A59A::func_1ED1();
	}

	self notify("stop_loop");
	lib_A59A::func_32D9("dynamic_run_speed_stopping");
	lib_A59A::func_32D9("dynamic_run_speed_stopped");
}

//Function Number: 48
lib_A59B::func_8E73()
{
	level endon("_stealth_spotted");
	self waittill("stop_dynamic_run_speed");
}

//Function Number: 49
lib_A59B::func_2FE0(param_00,param_01)
{
	if(!isdefined(param_00.classname))
	{
		if(!isdefined(param_00.type))
		{
			var_02 = ::lib_A577::func_3E8C;
		}
		else
		{
			var_02 = ::lib_A577::func_3E8A;
		}
	}
	else
	{
		var_02 = ::lib_A577::func_3E88;
	}

	return lib_A577::func_4244(param_00,var_02,param_01);
}

//Function Number: 50
lib_A59B::func_2FE1(param_00)
{
	if(self.var_76B5 == param_00)
	{
		return;
	}

	self.var_76B5 = param_00;
	switch(param_00)
	{
		case "sprint":
			break;

		case "run":
			break;

		case "stop":
			break;

		case "jog":
			break;

		case "crouch":
			break;
	}
}

//Function Number: 51
lib_A59B::func_2FE4()
{
	self endon("death");
	if(lib_A59A::func_32D7("dynamic_run_speed_stopped"))
	{
		return;
	}

	if(lib_A59A::func_32D7("dynamic_run_speed_stopping"))
	{
		return;
	}

	self endon("stop_dynamic_run_speed");
	lib_A59A::func_32DD("dynamic_run_speed_stopping");
	lib_A59A::func_32DD("dynamic_run_speed_stopped");
	self endon("dynamic_run_speed_stopped");
	var_00 = "DRS_run_2_stop";
	lib_A506::func_BCA(self,"gravity",var_00);
	lib_A59A::func_32D9("dynamic_run_speed_stopping");
	while(lib_A59A::func_32D7("dynamic_run_speed_stopped"))
	{
		var_01 = "DRS_stop_idle";
		thread lib_A506::func_BCE(self,var_01);
		if(isdefined(level.var_78A9["generic"]["signal_go"]))
		{
			lib_A59A::func_4694("go");
		}

		wait(randomfloatrange(12,20));
		if(lib_A59A::func_32DB("_stealth_stance_handler"))
		{
			lib_A59A::func_32E3("_stealth_stance_handler");
		}

		self notify("stop_loop");
		if(!lib_A59A::func_32D7("dynamic_run_speed_stopped"))
		{
			return;
		}

		if(isdefined(level.var_2FE2))
		{
			var_02 = common_scripts\utility::random(level.var_2FE2);
			level thread lib_A59A::func_70C1(var_02);
		}

		if(isdefined(level.var_78A9["generic"]["signal_go"]))
		{
			lib_A59A::func_4694("go");
		}
	}
}

//Function Number: 52
lib_A59B::func_3BC3()
{
	return int(getdvar("g_speed"));
}

//Function Number: 53
lib_A59B::func_3BC4(param_00)
{
	function_00D3("g_speed",int(param_00));
}

//Function Number: 54
lib_A59B::func_3BBF()
{
	return level.var_31D method_83F4();
}

//Function Number: 55
lib_A59B::func_3BC0(param_00)
{
	level.var_31D method_83F5(param_00);
}

//Function Number: 56
lib_A59B::func_5F72()
{
	return self.var_5F77;
}

//Function Number: 57
lib_A59B::func_5F76(param_00)
{
	self.var_5F77 = param_00;
	self setmovespeedscale(param_00);
}

//Function Number: 58
lib_A59B::func_5F74(param_00,param_01,param_02,param_03,param_04)
{
	param_00 notify("movespeed_ramp_over_time");
	param_00 endon("movespeed_ramp_over_time");
	var_05 = param_01;
	var_06 = param_02 - param_01 * 0.05 / param_03;
	var_07 = 0;
	while(var_07 < param_03)
	{
		var_05 = var_05 + var_06;
		if(isai(param_00))
		{
			param_00 lib_A59A::func_7E7B(var_05,undefined,param_04);
		}
		else
		{
			param_00 setmovespeedscale(var_05);
		}

		wait 0.05;
		var_07 = var_07 + 0.05;
	}

	if(isai(param_00))
	{
		param_00 lib_A59A::func_7E7B(param_02,undefined,param_04);
		return;
	}

	param_00 setmovespeedscale(param_02);
}

//Function Number: 59
lib_A59B::func_115D()
{
	if(common_scripts\utility::flag_exist("autosave_tactical_player_nade"))
	{
		return;
	}

	common_scripts\utility::flag_init("autosave_tactical_player_nade");
	level.var_115B = 0;
	function_000E("autosave_player_nade","+frag");
	function_000E("autosave_player_nade","-smoke");
	function_000E("autosave_player_nade","+smoke");
	common_scripts\utility::array_thread(level.var_328,::lib_A59B::func_1159);
}

//Function Number: 60
lib_A59B::func_1159()
{
	for(;;)
	{
		self waittill("autosave_player_nade");
		common_scripts\utility::flag_set("autosave_tactical_player_nade");
		self waittill("grenade_fire",var_00);
		thread lib_A59B::func_115A(var_00);
	}
}

//Function Number: 61
lib_A59B::func_115A(param_00)
{
	level.var_115B++;
	param_00 common_scripts\utility::waittill_notify_or_timeout("death",10);
	level.var_115B--;
	waittillframeend;
	if(!level.var_115B)
	{
		common_scripts\utility::flag_clear("autosave_tactical_player_nade");
	}
}

//Function Number: 62
lib_A59B::func_115C()
{
	level notify("autosave_tactical_proc");
	level endon("autosave_tactical_proc");
	level thread lib_A59A::func_61FA("kill_save",5);
	level endon("kill_save");
	level endon("autosave_tactical_player_nade");
	if(common_scripts\utility::flag("autosave_tactical_player_nade"))
	{
		common_scripts\utility::flag_waitopen_or_timeout("autosave_tactical_player_nade",4);
		if(common_scripts\utility::flag("autosave_tactical_player_nade"))
		{
			return;
		}
	}

	var_00 = function_00D6("axis");
	foreach(var_02 in var_00)
	{
		if(isdefined(var_02.enemy) && isplayer(var_02.enemy))
		{
			return;
		}
	}

	waittillframeend;
	lib_A59A::func_1143();
}

//Function Number: 63
lib_A59B::func_6001(param_00,param_01,param_02,param_03)
{
	lib_A59A::func_6002(param_01);
	level endon("stop_music");
	wait(param_01);
	thread lib_A59A::func_6000(param_00,undefined,param_02,param_03);
}

//Function Number: 64
lib_A59B::func_5FFD(param_00,param_01,param_02,param_03,param_04,param_05)
{
	lib_A59A::func_6002(param_02);
	level endon("stop_music");
	wait(param_02);
	thread lib_A59B::func_5FFC(param_00,param_01,undefined,param_03,param_04,param_05);
}

//Function Number: 65
lib_A59B::func_5FFC(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(isdefined(param_02) && param_02 > 0)
	{
		thread lib_A59B::func_5FFD(param_00,param_01,param_02,param_03,param_04,param_05);
		return;
	}

	lib_A59A::func_6002();
	level endon("stop_music");
	lib_A59A::func_6005(param_00,param_03,param_04);
	if(isdefined(param_05) && param_05 == 1 && common_scripts\utility::flag_exist("_stealth_spotted"))
	{
		level endon("_stealth_spotted");
		thread lib_A59B::func_5FFF(param_00,param_01,param_02);
	}

	var_06 = lib_A59A::func_6004(param_00);
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	if(param_01 <= 10)
	{
		var_06 = var_06 + param_01;
	}

	wait(var_06);
	lib_A59A::func_5FFB(param_00,param_01,param_02,param_03,param_04);
}

//Function Number: 66
lib_A59B::func_5FFF(param_00,param_01,param_02)
{
	level endon("stop_music");
	common_scripts\utility::flag_wait("_stealth_spotted");
	function_0074(0.5);
	while(common_scripts\utility::flag("_stealth_spotted"))
	{
		common_scripts\utility::flag_waitopen("_stealth_spotted");
		wait(1);
	}

	thread lib_A59A::func_5FFB(param_00,param_01,param_02);
}

//Function Number: 67
lib_A59B::func_2D7A(param_00,param_01,param_02)
{
	self endon("death");
	self endon("stop_sliding");
	var_03 = self;
	var_04 = undefined;
	for(;;)
	{
		var_05 = var_03 getnormalizedmovement();
		var_06 = anglestoforward(var_03.var_41);
		var_07 = anglestoright(var_03.var_41);
		var_05 = (var_05[1] * var_07[0] + var_05[0] * var_06[0],var_05[1] * var_07[1] + var_05[0] * var_06[1],0);
		param_00.var_3CC = param_00.var_3CC + var_05 * param_01;
		wait(0.05);
		param_00.var_3CC = param_00.var_3CC * 1 - param_02;
	}
}

//Function Number: 68
lib_A59B::func_5304(param_00,param_01)
{
	self endon("death");
	if(isdefined(param_00))
	{
		wait(randomfloat(param_00));
	}

	if(isdefined(param_01) && param_01 && lib_A59A::func_6A95(self))
	{
		return;
	}

	playfxontag(common_scripts\utility::getfx("flesh_hit"),self,"tag_eye");
	self method_8052(level.var_31D.var_2E6);
}

//Function Number: 69
lib_A59B::func_9AD0(param_00,param_01)
{
	self endon("death");
	var_02 = 0;
	for(;;)
	{
		if(self.intensity > 0.0001 && gettime() > 300)
		{
			if(!var_02)
			{
				self playrumblelooponentity(param_01);
				var_02 = 1;
			}
		}
		else if(var_02)
		{
			self stoprumble(param_01);
			var_02 = 0;
		}

		var_03 = 1 - self.intensity;
		var_03 = var_03 * 1000;
		if(isdefined(self.var_7673))
		{
			self.var_2E6 = self.var_7673.var_2E6 + (0,0,var_03);
		}
		else
		{
			self.var_2E6 = param_00 geteye() + (0,0,var_03);
		}

		wait(0.05);
	}
}

//Function Number: 70
lib_A59B::func_8BB8(param_00)
{
	var_01 = spawn("script_model",self.var_2E6);
	self.var_4234 = var_01;
	var_01.var_41 = self.var_41;
	var_01 setmodel(param_00);
	var_01 endon("death");
	self waittill("death");
	var_01 delete();
}

//Function Number: 71
lib_A59B::func_6FDC(param_00,param_01,param_02,param_03,param_04)
{
	waittillframeend;
	if(!isdefined(self.var_8B1A))
	{
		self.var_8B1A = 0;
	}

	if(!isdefined(self.var_311B))
	{
		self.var_311B = 1;
	}

	if(!isdefined(self.var_12F0))
	{
		self.var_12F0 = 0;
	}

	var_05 = self.time * 20;
	var_06 = self.var_311B - self.var_8B1A;
	self.var_8E66 = 0;
	if(isdefined(param_04))
	{
		for(var_07 = 0;var_07 <= var_05 && !self.var_8E66;var_07++)
		{
			var_08 = self.var_12F0 + var_07 * var_06 / var_05;
			param_01 thread [[ param_00 ]](var_08,param_02,param_03,param_04);
			wait(0.05);
		}

		return;
	}

	if(isdefined(var_05))
	{
		for(var_07 = 0;var_07 <= var_05 && !self.var_8E66;var_07++)
		{
			var_08 = self.var_12F0 + var_07 * var_06 / var_05;
			param_01 thread [[ param_00 ]](var_08,param_02,param_03);
			wait(0.05);
		}

		return;
	}

	if(isdefined(param_04))
	{
		for(var_07 = 0;var_07 <= var_05 && !self.var_8E66;var_07++)
		{
			var_08 = self.var_12F0 + var_07 * var_06 / var_05;
			param_01 thread [[ param_00 ]](var_08,param_02);
			wait(0.05);
		}

		return;
	}

	for(var_07 = 0;var_07 <= var_05 && !self.var_8E66;var_07++)
	{
		var_08 = self.var_12F0 + var_07 * var_06 / var_05;
		param_01 thread [[ param_00 ]](var_08);
		wait(0.05);
	}
}

//Function Number: 72
lib_A59B::func_07B4(param_00)
{
	waittillframeend;
	if(!isdefined(level.var_948A))
	{
		level.var_948A = [];
	}

	if(!isdefined(level.var_948A))
	{
		level.var_948A[param_00] = [];
	}

	if(isdefined(self.fx))
	{
		level.var_948A[param_00][self.var_8FEA]["fx"] = self.fx;
	}

	if(isdefined(self.var_3B22))
	{
		level.var_948A[param_00][self.var_8FEA]["fx_array"] = self.var_3B22;
	}

	if(isdefined(self.sound))
	{
		level.var_948A[param_00][self.var_8FEA]["sound"] = self.sound;
	}

	if(isdefined(self.var_7672))
	{
		level.var_948A[param_00][self.var_8FEA]["rumble"] = self.var_7672;
	}

	if(!isdefined(level.var_948A[param_00]["default"]))
	{
		level.var_948A[param_00]["default"] = level.var_948A[param_00][self.var_8FEA];
	}
}

//Function Number: 73
lib_A59B::func_7061(param_00)
{
	var_01 = spawnstruct();
	precachemodel(param_00.model);
	var_01.var_9485 = param_00.model;
	var_01.var_2E6 = param_00.var_2E6;
	var_01.var_41 = param_00.var_41;
	var_01.var_39B = param_00.var_39B;
	var_01.script_linkto = param_00.script_linkto;
	var_01.targetname = param_00.targetname;
	var_01.target = param_00.target;
	var_01.destructible_type = param_00.destructible_type;
	var_01.script_noflip = param_00.script_noflip;
	param_00 lib_A59A::func_6EB7(param_00.destructible_type);
	self.destructibles[self.destructibles.size] = var_01;
	param_00 notify("masking_destructible");
	param_00 delete();
}

//Function Number: 74
lib_A59B::delaythread_proc(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	self endon("death");
	self endon("stop_delay_thread");
	wait(param_01);
	if(isdefined(param_07))
	{
		thread [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07);
		return;
	}

	if(isdefined(param_06))
	{
		thread [[ param_00 ]](param_02,param_03,param_04,param_05,param_06);
		return;
	}

	if(isdefined(param_05))
	{
		thread [[ param_00 ]](param_02,param_03,param_04,param_05);
		return;
	}

	if(isdefined(param_04))
	{
		thread [[ param_00 ]](param_02,param_03,param_04);
		return;
	}

	if(isdefined(param_03))
	{
		thread [[ param_00 ]](param_02,param_03);
		return;
	}

	if(isdefined(param_02))
	{
		thread [[ param_00 ]](param_02);
		return;
	}

	thread [[ param_00 ]]();
}

//Function Number: 75
lib_A59B::func_27CF(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	self endon("death");
	self endon("stop_delay_thread");
	wait(param_01);
	if(isdefined(param_07))
	{
		childthread [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07);
		return;
	}

	if(isdefined(param_06))
	{
		childthread [[ param_00 ]](param_02,param_03,param_04,param_05,param_06);
		return;
	}

	if(isdefined(param_05))
	{
		childthread [[ param_00 ]](param_02,param_03,param_04,param_05);
		return;
	}

	if(isdefined(param_04))
	{
		childthread [[ param_00 ]](param_02,param_03,param_04);
		return;
	}

	if(isdefined(param_03))
	{
		childthread [[ param_00 ]](param_02,param_03);
		return;
	}

	if(isdefined(param_02))
	{
		childthread [[ param_00 ]](param_02);
		return;
	}

	childthread [[ param_00 ]]();
}

//Function Number: 76
lib_A59B::func_386E(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	self endon("death");
	self endon(lib_A59A::func_8F4D(param_01[0] + "_stop_flagWaitThread"));
	common_scripts\utility::flag_wait(param_01[0]);
	lib_A59B::delaythread_proc(param_00,param_01[1],param_02,param_03,param_04,param_05,param_06,param_07);
}

//Function Number: 77
lib_A59B::func_A0ED(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	self endon("death");
	self endon(lib_A59A::func_8F4D(param_01[0] + "_stop_waittillThread"));
	self waittill(param_01[0]);
	lib_A59B::delaythread_proc(param_00,param_01[1],param_02,param_03,param_04,param_05,param_06,param_07);
}

//Function Number: 78
lib_A59B::func_07BF()
{
	level notify("kill_add_wait_asserter");
	level endon("kill_add_wait_asserter");
	for(var_00 = 0;var_00 < 20;var_00++)
	{
		waittillframeend;
	}
}

//Function Number: 79
lib_A59B::func_9A99()
{
}

//Function Number: 80
lib_A59B::func_20CB(param_00,param_01,param_02,param_03)
{
	if(!param_01.size)
	{
		return undefined;
	}

	if(isdefined(param_02))
	{
		var_04 = undefined;
		var_05 = getarraykeys(param_01);
		for(var_06 = 0;var_06 < var_05.size;var_06++)
		{
			var_07 = distance(param_01[var_05[var_06]].v["origin"],param_00);
			if([[ param_03 ]](var_07,param_02))
			{
				continue;
			}

			param_02 = var_07;
			var_04 = param_01[var_05[var_06]];
		}

		return var_04;
	}

	var_05 = getarraykeys(var_05);
	var_04 = var_04[var_07[0]];
	var_04 = distance(var_07.v["origin"],param_02);
	for(var_06 = 1;var_06 < var_04.size;var_06++)
	{
		var_07 = distance(param_01[var_04[var_06]].v["origin"],param_00);
		if([[ param_03 ]](var_07,param_02))
		{
			continue;
		}

		param_02 = var_07;
		var_05 = param_01[var_04[var_06]];
	}

	return var_05;
}

//Function Number: 81
lib_A59B::func_A0BA()
{
	for(;;)
	{
		self waittill("trigger",var_00);
		waittillframeend;
		if(var_00.var_251D == self)
		{
			return var_00;
		}
	}
}

//Function Number: 82
lib_A59B::func_07B5()
{
	self.var_9799 = [];
	self waittill("trigger",var_00);
	var_01 = self.var_9799;
	self.var_9799 = undefined;
	foreach(var_03 in var_01)
	{
		thread [[ var_03 ]](var_00);
	}
}

//Function Number: 83
lib_A59B::func_07AF(param_00)
{
	if(!isdefined(level.var_78B6[param_00]))
	{
		level.var_78B6[param_00] = param_00;
	}
}

//Function Number: 84
lib_A59B::func_07A9(param_00)
{
	if(!isdefined(level.var_78A9[self.animname]))
	{
		level.var_78A9[self.animname] = [];
	}

	if(!isdefined(level.scr_sound[self.animname]))
	{
		level.scr_sound[self.animname] = [];
	}

	if(!isdefined(level.scr_sound[self.animname][param_00]))
	{
		level.scr_sound[self.animname][param_00] = param_00;
	}
}

//Function Number: 85
lib_A59B::func_07AA(param_00)
{
	if(!isdefined(level.scr_sound["generic"]))
	{
		level.scr_sound["generic"] = [];
	}

	if(!isdefined(level.scr_sound["generic"][param_00]))
	{
		level.scr_sound["generic"][param_00] = param_00;
	}
}

//Function Number: 86
lib_A59B::func_62F1(param_00)
{
	if(!lib_A59A::func_5013())
	{
		return;
	}

	var_01 = lib_A59B::func_3DB6();
	var_02 = var_01;
	if(isdefined(level.var_726D))
	{
		var_02 = var_01 - level.var_726D;
	}

	level.var_726D = var_01;
	function_0100("script_objective: objective %d, leveltime %d, deltatime %d",param_00,var_01,var_02);
}

//Function Number: 87
lib_A59B::func_5CD4(param_00)
{
	if(lib_A59A::func_5013())
	{
		if(!isdefined(param_00))
		{
			param_00 = 1;
		}

		var_01 = lib_A59B::func_3DB6();
		var_02 = var_01;
		function_0100("script_level: leveltime %d, deltatime %d, success %d",var_02,var_01,param_00);
	}
}

//Function Number: 88
lib_A59B::func_3DB6()
{
	return function_00FD() * 0.05;
}

//Function Number: 89
lib_A59B::func_05AE(param_00,param_01)
{
	self endon("death");
	for(;;)
	{
		self waittill("trigger",var_02);
		common_scripts\utility::flag_set(param_00);
		if(!param_01)
		{
			return;
		}

		while(var_02 istouching(self))
		{
			wait(0.05);
		}

		common_scripts\utility::flag_clear(param_00);
	}
}

//Function Number: 90
lib_A59B::func_090F(param_00,param_01,param_02)
{
	if(isdefined(param_00))
	{
		self.var_5CF[param_01] = param_00;
	}
	else
	{
		self.var_5CF[param_01] = "none";
	}

	return param_02;
}

//Function Number: 91
lib_A59B::func_090D(param_00,param_01)
{
	if(isdefined(self.var_5CF))
	{
		if(isstring(self.var_5CF[param_00]) && self.var_5CF[param_00] == "none")
		{
			return param_01;
		}
		else
		{
			return self.var_5CF[param_00];
		}
	}

	return param_01;
}

//Function Number: 92
lib_A59B::func_0674()
{
	var_00 = getentarray("tff_sync_trigger","targetname");
	if(!isdefined(var_00))
	{
		return;
	}

	foreach(var_02 in var_00)
	{
		var_02 thread lib_A59B::func_0673();
	}
}

//Function Number: 93
lib_A59B::func_0673()
{
	self waittill("trigger");
	lib_A59A::func_92CE();
}