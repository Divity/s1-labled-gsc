/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42359.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 203
 * Decompile Time: 90 ms
 * Timestamp: 4/20/2022 8:23:22 PM
*******************************************************************/

//Function Number: 1
lib_A577::main()
{
	precachemodel("drop_pouch");
	createthreatbiasgroup("allies");
	createthreatbiasgroup("axis");
	createthreatbiasgroup("team3");
	createthreatbiasgroup("civilian");
	lib_A506::func_807("generic","rappel_pushoff_initial_npc",::lib_A59A::func_3097);
	lib_A506::func_807("generic","ps_rappel_pushoff_initial_npc",::lib_A59A::func_3097);
	lib_A506::func_807("generic","feet_on_ground",::lib_A59A::func_2A72);
	lib_A506::func_807("generic","ps_rappel_clipout_npc",::lib_A59A::func_2A72);
	foreach(var_01 in level.var_328)
	{
		var_01 sentient_setthreatbiasgroup("allies");
	}

	level.var_5FE = 0;
	level.var_54A = [];
	level.var_5358 = 0;
	level.var_36A0 = 0;
	level.var_5CDB = 0;
	level.var_3C5B = [];
	level.var_867D = [];
	if(!isdefined(level.var_265A))
	{
		level.var_265A = [];
	}

	level.var_89C0 = 0;
	level.var_423F = [];
	if(!isdefined(level.var_8F7D))
	{
		level.var_8F7D = [];
	}

	level.var_8F7D["regular"] = ::lib_A577::func_8F7B;
	level.var_8F7D["elite"] = ::lib_A577::func_8F78;
	level.var_91DF = [];
	level.var_91DF["axis"] = ::lib_A577::func_895A;
	level.var_91DF["allies"] = ::lib_A577::func_8959;
	level.var_91DF["team3"] = ::lib_A577::func_895C;
	level.var_91DF["neutral"] = ::lib_A577::func_895B;
	level.var_60B9 = 0;
	level.var_44CD = randomintrange(1,4);
	if(!isdefined(level.var_277F))
	{
		level.var_277F = 2048;
	}

	if(!isdefined(level.var_277E))
	{
		level.var_277E = 512;
	}

	level.var_6E48 = "J_Shoulder_RI";
	level.var_5BC4 = 1024;
	if(!isdefined(level.var_5A37))
	{
		level.var_5A37 = 11;
	}

	level.var_5E9 = 0;
	var_03 = function_00D7();
	common_scripts\utility::array_thread(var_03,::lib_A577::func_57B7);
	level.var_8C4 = [];
	level.var_2E9D = [];
	var_04 = function_00D8();
	for(var_05 = 0;var_05 < var_04.size;var_05++)
	{
		var_04[var_05] thread lib_A577::func_893C();
	}

	level.var_2E9D = undefined;
	thread lib_A577::func_6FE6();
	common_scripts\utility::array_thread(var_03,::lib_A577::func_895F);
	level.var_8C5 = getarraykeys(level.var_8C4);
	for(var_05 = 0;var_05 < level.var_8C5.size;var_05++)
	{
		if(!issubstr(tolower(level.var_8C5[var_05]),"rpg"))
		{
			continue;
		}

		precacheitem("rpg_player");
		precacheitem("iw5_mahemplayer_sp");
		break;
	}

	level.var_8C5 = undefined;
}

//Function Number: 2
lib_A577::func_09A8()
{
}

//Function Number: 3
lib_A577::func_1CE4(param_00)
{
	if(param_00.size <= 16)
	{
		return;
	}

	var_01 = 0;
	var_02 = 0;
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		if(!param_00[var_03].inliveplayerkillstreak != "axis")
		{
			continue;
		}

		var_01++;
		if(!param_00[var_03] lib_A577::func_46E2())
		{
			continue;
		}

		var_02++;
	}
}

//Function Number: 4
lib_A577::func_46E2()
{
	if(isdefined(self.script_char_group))
	{
		return 1;
	}

	return isdefined(self.script_char_index);
}

//Function Number: 5
lib_A577::func_6FE6()
{
	foreach(var_02, var_01 in level.var_265A)
	{
		if(!isdefined(level.flag[var_02]))
		{
			common_scripts\utility::flag_init(var_02);
		}
	}
}

//Function Number: 6
lib_A577::func_8904()
{
	self endon("death");
	for(;;)
	{
		if(self.count > 0)
		{
			self waittill("spawned");
		}

		waittillframeend;
		if(!self.count)
		{
			return;
		}
	}
}

//Function Number: 7
lib_A577::func_08D4()
{
	level.var_265A[self.var_7982]["ai"][self.unique_id] = self;
	var_00 = self.unique_id;
	var_01 = self.var_7982;
	if(isdefined(self.var_7983))
	{
		lib_A577::func_A0CD();
	}
	else
	{
		self waittill("death");
	}

	level.var_265A[var_01]["ai"][var_00] = undefined;
	lib_A577::func_9AA5(var_01);
}

//Function Number: 8
lib_A577::func_9CA5()
{
	var_00 = self.unique_id;
	var_01 = self.var_7982;
	if(!isdefined(level.var_265A) || !isdefined(level.var_265A[self.var_7982]))
	{
		waittillframeend;
		if(!isdefined(self))
		{
			return;
		}
	}

	level.var_265A[var_01]["vehicles"][var_00] = self;
	self waittill("death");
	level.var_265A[var_01]["vehicles"][var_00] = undefined;
	lib_A577::func_9AA5(var_01);
}

//Function Number: 9
lib_A577::func_89BA()
{
	level.var_265A[self.var_7982] = [];
	waittillframeend;
	if(!isdefined(self) || self.count == 0)
	{
		return;
	}

	self.var_89C0 = level.var_89C0;
	level.var_89C0++;
	level.var_265A[self.var_7982]["spawners"][self.var_89C0] = self;
	var_00 = self.var_7982;
	var_01 = self.var_89C0;
	lib_A577::func_8904();
	level.var_265A[var_00]["spawners"][var_01] = undefined;
	lib_A577::func_9AA5(var_00);
}

//Function Number: 10
lib_A577::func_9D3E()
{
	level.var_265A[self.var_7982] = [];
	waittillframeend;
	if(!isdefined(self))
	{
		return;
	}

	self.var_89C0 = level.var_89C0;
	level.var_89C0++;
	level.var_265A[self.var_7982]["vehicle_spawners"][self.var_89C0] = self;
	var_00 = self.var_7982;
	var_01 = self.var_89C0;
	lib_A577::func_8904();
	level.var_265A[var_00]["vehicle_spawners"][var_01] = undefined;
	lib_A577::func_9AA5(var_00);
}

//Function Number: 11
lib_A577::func_9AA5(param_00)
{
	level notify("updating_deathflag_" + param_00);
	level endon("updating_deathflag_" + param_00);
	waittillframeend;
	foreach(var_02 in level.var_265A[param_00])
	{
		if(getarraykeys(var_02).size > 0)
		{
			return;
		}
	}

	common_scripts\utility::flag_set(param_00);
}

//Function Number: 12
lib_A577::func_65B9(param_00)
{
	param_00 endon("death");
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(!isai(var_01))
		{
			continue;
		}

		var_01 thread lib_A59A::func_4BA9(0.15);
		var_01 lib_A59A::func_2A8C();
		var_01.var_A14B = 0;
	}
}

//Function Number: 13
lib_A577::func_4C42(param_00)
{
	param_00 endon("death");
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(!isai(var_01))
		{
			continue;
		}

		var_01 thread lib_A59A::func_4BA9(0.15);
		var_01 lib_A59A::func_30AF();
		var_01.var_A14B = 1;
	}
}

//Function Number: 14
lib_A577::func_2BE3(param_00)
{
	param_00 endon("death");
	self endon("death");
	for(;;)
	{
		self waittill("trigger");
		if(!param_00.count)
		{
			return;
		}

		if(self.target != param_00.targetname)
		{
			return;
		}

		if(isdefined(param_00.var_9816))
		{
			return;
		}

		var_01 = param_00 lib_A59A::func_88BD();
		if(lib_A59A::func_88EB(var_01))
		{
			param_00 notify("spawn_failed");
		}

		if(isdefined(self.var_50C) && self.var_50C > 0)
		{
			wait(self.var_50C);
		}
	}
}

//Function Number: 15
lib_A577::func_97F1(param_00)
{
	var_01 = param_00.var_7113;
	var_02 = param_00.target;
	param_00 waittill("trigger");
	param_00 lib_A59A::script_delay();
	if(isdefined(var_01))
	{
		waittillframeend;
	}

	var_03 = getentarray(var_02,"targetname");
	foreach(var_05 in var_03)
	{
		if(var_05.code_classname == "script_vehicle")
		{
			if((isdefined(var_05.var_7A3A) && var_05.var_7A3A == 1) || !isdefined(var_05.target))
			{
				thread lib_A59E::func_9D39(var_05);
			}
			else
			{
				var_05 thread lib_A59E::func_8971();
			}

			continue;
		}

		var_05 thread lib_A577::func_97F3();
		if(level.currentgen)
		{
			wait(0.1);
		}
	}

	if(isdefined(level.var_8938))
	{
		lib_A577::func_97CC(var_02);
	}
}

//Function Number: 16
lib_A577::func_97CC(param_00)
{
	var_01 = common_scripts\utility::getstructarray(param_00,"targetname");
	if(getentarray(param_00,"target").size <= 1)
	{
		lib_A59A::func_286E(var_01);
	}

	var_02 = lib_A577::func_3E33(var_01);
	common_scripts\utility::array_thread(var_02,::lib_A577::func_97F3);
}

//Function Number: 17
lib_A577::func_3E33(param_00)
{
	var_01 = [];
	var_02 = [];
	foreach(var_04 in param_00)
	{
		if(!isdefined(var_04.var_7AC8))
		{
			continue;
		}

		if(!isdefined(var_02[var_04.var_7AC8]))
		{
			var_02[var_04.var_7AC8] = [];
		}

		var_02[var_04.var_7AC8][var_02[var_04.var_7AC8].size] = var_04;
	}

	foreach(var_07 in var_02)
	{
		foreach(var_04 in var_07)
		{
			var_09 = lib_A577::func_3E66(var_04,var_07.size);
			var_01[var_01.size] = var_09;
		}
	}

	return var_01;
}

//Function Number: 18
lib_A577::func_3E66(param_00,param_01)
{
	if(!isdefined(level.var_89C1))
	{
		level.var_89C1 = [];
	}

	if(!isdefined(level.var_89C1[param_00.var_7AC8]))
	{
		level.var_89C1[param_00.var_7AC8] = lib_A577::func_23CE(param_00.var_7AC8);
	}

	var_02 = level.var_89C1[param_00.var_7AC8];
	var_03 = var_02.var_6E2C[var_02.var_6E3A];
	var_02.var_6E3A++;
	var_02.var_6E3A = var_02.var_6E3A % var_02.var_6E2C.size;
	var_03.var_2E6 = param_00.var_2E6;
	if(isdefined(param_00.var_41))
	{
		var_03.var_41 = param_00.var_41;
	}
	else if(isdefined(param_00.target))
	{
		var_04 = getnode(param_00.target,"targetname");
		if(isdefined(var_04))
		{
			var_03.var_41 = vectortoangles(var_04.var_2E6 - var_03.var_2E6);
		}
	}

	if(isdefined(level.var_8937))
	{
		var_03 [[ level.var_8937 ]](param_00);
	}

	if(isdefined(param_00.target))
	{
		var_03.target = param_00.target;
	}

	var_03.count = 1;
	return var_03;
}

//Function Number: 19
lib_A577::func_23CE(param_00)
{
	var_01 = function_00D8();
	var_02 = spawnstruct();
	var_03 = [];
	foreach(var_05 in var_01)
	{
		if(!isdefined(var_05.var_7AC8))
		{
			continue;
		}

		if(var_05.var_7AC8 != param_00)
		{
			continue;
		}

		var_03[var_03.size] = var_05;
	}

	var_02.var_6E3A = 0;
	var_02.var_6E2C = var_03;
	return var_02;
}

//Function Number: 20
lib_A577::func_97F3()
{
	self endon("death");
	lib_A59A::script_delay();
	if(!isdefined(self))
	{
		return undefined;
	}

	if(isdefined(self.var_79A8))
	{
		var_00 = lib_A59A::func_2F28(self);
		return undefined;
	}
	else if(!issubstr(self.classname,"actor"))
	{
		return undefined;
	}

	var_01 = isdefined(self.var_7ADB) && common_scripts\utility::flag("_stealth_enabled") && !common_scripts\utility::flag("_stealth_spotted");
	if(isdefined(self.var_79E6))
	{
		var_00 = self method_8094(var_01);
	}
	else
	{
		var_00 = self method_8093(var_01);
	}

	if(!lib_A59A::func_88EB(var_01))
	{
		if(isdefined(self.var_7975))
		{
			if(self.var_7975 == "heat")
			{
				var_01 lib_A59A::func_30C8();
			}

			if(self.var_7975 == "cqb")
			{
				var_01 lib_A59A::func_30AF();
			}
		}
	}

	return var_01;
}

//Function Number: 21
lib_A577::func_97F2(param_00)
{
	var_01 = param_00.target;
	var_02 = 0;
	var_03 = getentarray(var_01,"targetname");
	foreach(var_05 in var_03)
	{
		if(!isdefined(var_05.target))
		{
			continue;
		}

		var_06 = getent(var_05.target,"targetname");
		if(!isdefined(var_06))
		{
			if(!isdefined(var_05.script_linkto))
			{
				continue;
			}

			var_06 = var_05 common_scripts\utility::get_linked_ent();
			if(!isdefined(var_06))
			{
				continue;
			}

			if(!isspawner(var_06))
			{
				continue;
			}
		}

		var_02 = 1;
		break;
	}

	param_00 waittill("trigger");
	param_00 lib_A59A::script_delay();
	var_03 = getentarray(var_01,"targetname");
	foreach(var_05 in var_03)
	{
		var_05 thread lib_A577::func_97D2();
	}
}

//Function Number: 22
lib_A577::func_97D2()
{
	var_00 = lib_A577::func_97D1();
	var_01 = lib_A577::func_97F3();
	if(!isdefined(var_01))
	{
		self delete();
		if(isdefined(var_00))
		{
			var_01 = var_00 lib_A577::func_97F3();
			var_00 delete();
			if(!isdefined(var_01))
			{
				return;
			}
		}
		else
		{
			return;
		}
	}

	if(!isdefined(var_00))
	{
		return;
	}

	var_01 waittill("death");
	if(!isdefined(var_00))
	{
		return;
	}

	if(!isdefined(var_00.count))
	{
		var_00.count = 1;
	}

	for(;;)
	{
		if(!isdefined(var_00))
		{
			break;
		}

		var_02 = var_00 thread lib_A577::func_97F3();
		if(!isdefined(var_02))
		{
			var_00 delete();
			break;
		}

		var_02 thread lib_A577::func_72FF(var_00);
		var_02 waittill("death",var_03);
		if(!lib_A577::func_6BF0(var_02,var_03))
		{
			if(!isdefined(var_00))
			{
				break;
			}

			var_00.count++;
		}

		if(!isdefined(var_02))
		{
			continue;
		}

		if(!isdefined(var_00))
		{
			break;
		}

		if(!isdefined(var_00.count))
		{
			break;
		}

		if(var_00.count <= 0)
		{
			break;
		}

		if(!lib_A59A::func_7B1A())
		{
			wait(randomfloatrange(1,3));
		}
	}

	if(isdefined(var_00))
	{
		var_00 delete();
	}
}

//Function Number: 23
lib_A577::func_97D1()
{
	if(isdefined(self.target))
	{
		var_00 = getent(self.target,"targetname");
		if(isdefined(var_00) && isspawner(var_00))
		{
			return var_00;
		}
	}

	if(isdefined(self.script_linkto))
	{
		var_00 = common_scripts\utility::get_linked_ent();
		if(isdefined(var_00) && isspawner(var_00))
		{
			return var_00;
		}
	}

	return undefined;
}

//Function Number: 24
lib_A577::func_38EF(param_00)
{
	common_scripts\utility::array_thread(param_00,::lib_A577::func_38EE);
	common_scripts\utility::array_thread(param_00,::lib_A577::func_38F1);
}

//Function Number: 25
lib_A577::func_72FF(param_00)
{
	param_00 endon("death");
	if(isdefined(self.var_79E0))
	{
		if(self.var_79E0)
		{
			return;
		}
	}

	self waittill("death");
	if(!isdefined(self))
	{
		param_00.count++;
	}
}

//Function Number: 26
lib_A577::func_2836(param_00)
{
	var_01 = 0;
	if(var_01 < 2)
	{
		switch(var_01)
		{
			case 0:
				break;

			default:
				break;
		}
	}
}

//Function Number: 27
lib_A577::func_533B(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	if(isdefined(param_00.targetname) && param_00.targetname != "flood_spawner")
	{
		return;
	}

	param_00 delete();
}

//Function Number: 28
lib_A577::func_7113(param_00)
{
	param_00 endon("death");
	var_01 = param_00.var_7AAD;
	waittillframeend;
	if(!isdefined(level.var_5379[var_01]))
	{
		return;
	}

	param_00 waittill("trigger");
	lib_A577::func_24B6(var_01);
}

//Function Number: 29
lib_A577::func_24B6(param_00)
{
	if(!isdefined(level.var_5379[param_00]))
	{
		return;
	}

	var_01 = level.var_5379[param_00];
	var_02 = getarraykeys(var_01);
	if(var_02.size <= 1)
	{
		return;
	}

	var_03 = common_scripts\utility::random(var_02);
	var_01[var_03] = undefined;
	foreach(var_09, var_05 in var_01)
	{
		foreach(var_07 in var_05)
		{
			if(isdefined(var_07))
			{
				var_07 delete();
			}
		}

		level.var_5379[param_00][var_09] = undefined;
	}
}

//Function Number: 30
lib_A577::func_537A(param_00)
{
	var_01 = function_00D8();
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(isdefined(var_01[var_02].var_7A18) && param_00 == var_01[var_02].var_7A18)
		{
			var_01[var_02] delete();
		}
	}
}

//Function Number: 31
lib_A577::func_5336(param_00)
{
	var_01 = param_00.var_7A18;
	param_00 waittill("trigger");
	waittillframeend;
	waittillframeend;
	lib_A577::func_537A(var_01);
	lib_A577::func_533B(param_00);
}

//Function Number: 32
lib_A577::func_3094(param_00)
{
	var_01 = param_00.var_79B1;
	param_00 waittill("trigger");
	var_02 = function_00D8();
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		if(!isdefined(var_02[var_03].var_79B1))
		{
			continue;
		}

		if(var_01 != var_02[var_03].var_79B1)
		{
			continue;
		}

		if(isdefined(var_02[var_03].var_79D8))
		{
			level notify("stop_flanker_behavior" + var_02[var_03].var_79D8);
		}

		var_02[var_03] lib_A59A::func_7DF2(0);
		var_02[var_03] notify("emptied spawner");
	}

	param_00 notify("deleted spawners");
}

//Function Number: 33
lib_A577::func_5337(param_00)
{
	var_01 = function_00D8();
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(!isdefined(var_01[var_02].var_7A18))
		{
			continue;
		}

		if(param_00 != var_01[var_02].var_7A18)
		{
			continue;
		}

		var_01[var_02] delete();
	}
}

//Function Number: 34
lib_A577::func_97EF(param_00)
{
}

//Function Number: 35
lib_A577::spawn_grenade(param_00,param_01)
{
	if(!isdefined(level.var_43DF) || !isdefined(level.var_43DF[param_01]))
	{
		level.var_43E0[param_01] = 0;
		level.var_43DF[param_01] = [];
	}

	var_02 = level.var_43E0[param_01];
	var_03 = level.var_43DF[param_01][var_02];
	if(isdefined(var_03))
	{
		var_03 delete();
	}

	var_04 = "weapon_fraggrenade";
	if(isdefined(level.var_31D) && isdefined(level.var_31D.var_9C57))
	{
		if(common_scripts\utility::cointoss())
		{
			var_04 = "weapon_frag_grenade_var";
		}
		else
		{
			var_04 = "weapon_flash_grenade_var";
		}
	}

	var_03 = spawn(var_04,param_00);
	level.var_43DF[param_01][var_02] = var_03;
	level.var_43E0[param_01] = var_02 + 1 % 16;
	return var_03;
}

//Function Number: 36
lib_A577::func_A0CD()
{
	self endon("death");
	self waittill("pain_death");
}

//Function Number: 37
lib_A577::func_2F41()
{
	var_00 = self.inliveplayerkillstreak;
	lib_A577::func_A0CD();
	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(self.var_613C))
	{
		return;
	}

	self.var_1FF = 1;
	if(self.var_1D3 <= 0)
	{
		return;
	}

	level.var_60C8--;
	if(level.var_60C8 > 0)
	{
		return;
	}

	level.var_60C8 = 3 + randomint(2);
	var_01 = 25;
	var_02 = 12;
	var_03 = self.var_2E6 + (randomint(var_01) - var_02,randomint(var_01) - var_02,2) + (0,0,42);
	var_04 = (0,randomint(360),90);
	thread lib_A577::func_88FF(var_03,var_04,self.inliveplayerkillstreak);
}

//Function Number: 38
lib_A577::func_88FF(param_00,param_01,param_02)
{
	var_03 = lib_A577::spawn_grenade(param_00,param_02);
	var_03 setmodel("drop_pouch");
	var_03.var_41 = param_01;
	var_03 hide();
	wait(0.7);
	if(!isdefined(var_03))
	{
		return;
	}

	var_03 show();
}

//Function Number: 39
lib_A577::func_2F2A()
{
	lib_A523::func_2E61();
}

//Function Number: 40
lib_A577::func_0139()
{
}

//Function Number: 41
lib_A577::func_893C()
{
	level.var_8C4[self.classname] = 1;
	if(isdefined(self.var_7999))
	{
		switch(self.var_7999)
		{
			case "easy":
				break;

			case "hard":
				break;
		}
	}
}

//Function Number: 42
lib_A577::func_895F(param_00)
{
	level.var_8C4[self.classname] = 1;
	lib_A577::func_8960(param_00);
	self endon("death");
	if(lib_A577::func_849A())
	{
		self delete();
	}

	thread lib_A577::func_76B3();
	self.finished_spawning = 1;
	self notify("finished spawning");
	if(self.inliveplayerkillstreak == "allies" && !isdefined(self.var_7A79))
	{
		thread lib_A577::func_3A96();
	}
}

//Function Number: 43
lib_A577::func_849A()
{
	if(!isdefined(self.var_7999))
	{
		return 0;
	}

	var_00 = 0;
	switch(self.var_7999)
	{
		case "easy":
			break;

		case "hard":
			break;
	}
}

//Function Number: 44
lib_A577::func_76B3()
{
	if(!isdefined(self.var_88F8))
	{
		self.spawner = undefined;
		return;
	}

	for(var_00 = 0;var_00 < self.var_88F8.size;var_00++)
	{
		var_01 = self.var_88F8[var_00];
		if(isdefined(var_01["param5"]))
		{
			thread [[ var_01["function"] ]](var_01["param1"],var_01["param2"],var_01["param3"],var_01["param4"],var_01["param5"]);
			continue;
		}

		if(isdefined(var_01["param4"]))
		{
			thread [[ var_01["function"] ]](var_01["param1"],var_01["param2"],var_01["param3"],var_01["param4"]);
			continue;
		}

		if(isdefined(var_01["param3"]))
		{
			thread [[ var_01["function"] ]](var_01["param1"],var_01["param2"],var_01["param3"]);
			continue;
		}

		if(isdefined(var_01["param2"]))
		{
			thread [[ var_01["function"] ]](var_01["param1"],var_01["param2"]);
			continue;
		}

		if(isdefined(var_01["param1"]))
		{
			thread [[ var_01["function"] ]](var_01["param1"]);
			continue;
		}

		thread [[ var_01["function"] ]]();
	}

	var_02 = common_scripts\utility::ter_op(isdefined(level.var_9D3A) && level.var_9D3A && self.code_classname == "script_vehicle",self.var_7AE9,self.inliveplayerkillstreak);
	if(isdefined(var_02))
	{
		for(var_00 = 0;var_00 < level.var_88F8[var_02].size;var_00++)
		{
			var_01 = level.var_88F8[var_02][var_00];
			if(isdefined(var_01["param5"]))
			{
				thread [[ var_01["function"] ]](var_01["param1"],var_01["param2"],var_01["param3"],var_01["param4"],var_01["param5"]);
				continue;
			}

			if(isdefined(var_01["param4"]))
			{
				thread [[ var_01["function"] ]](var_01["param1"],var_01["param2"],var_01["param3"],var_01["param4"]);
				continue;
			}

			if(isdefined(var_01["param3"]))
			{
				thread [[ var_01["function"] ]](var_01["param1"],var_01["param2"],var_01["param3"]);
				continue;
			}

			if(isdefined(var_01["param2"]))
			{
				thread [[ var_01["function"] ]](var_01["param1"],var_01["param2"]);
				continue;
			}

			if(isdefined(var_01["param1"]))
			{
				thread [[ var_01["function"] ]](var_01["param1"]);
				continue;
			}

			thread [[ var_01["function"] ]]();
		}
	}

	self.var_88F8 = undefined;
	self.spawner = undefined;
}

//Function Number: 45
lib_A577::func_8A43()
{
	if(!lib_A59A::func_5080())
	{
		return;
	}

	lib_A59A::func_749(::lib_A577::func_8A41);
	thread lib_A577::func_5FE1();
}

//Function Number: 46
lib_A577::func_5FE1()
{
	self waittill("death",var_00,var_01,var_02);
	if(!isdefined(self))
	{
		return;
	}

	if(!self method_813D())
	{
		return;
	}

	if(!isdefined(var_00))
	{
		return;
	}

	if(!isplayer(var_00))
	{
		return;
	}

	if(!isdefined(var_02))
	{
		var_00.var_5FE0 = undefined;
		return;
	}

	if(!isdefined(var_00.var_5FE0))
	{
		var_00.var_5FE0 = 1;
	}
	else
	{
		var_00.var_5FE0++;
	}

	if(lib_A59A::func_5084() && var_00.var_5FE0 >= 4)
	{
		var_00 notify("sur_ch_quadkill");
	}

	waittillframeend;
	var_00.var_5FE0 = undefined;
}

//Function Number: 47
lib_A577::func_8A41(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(param_01) && isplayer(param_01))
	{
		self.var_5517 = param_01;
		self.var_5518 = param_04;
	}
}

//Function Number: 48
lib_A577::func_2660()
{
	self waittill("death",var_00,var_01,var_02);
	level notify("ai_killed",self);
	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(var_00))
	{
		if(self.inliveplayerkillstreak == "axis" || self.inliveplayerkillstreak == "team3")
		{
			var_03 = undefined;
			if(isdefined(var_00.attacker))
			{
				if(isdefined(var_00.var_519A) && var_00.var_519A)
				{
					var_03 = "sentry";
				}

				if(isdefined(var_00.destructible_type))
				{
					var_03 = "destructible";
				}

				var_00 = var_00.attacker;
			}
			else if(isdefined(var_00.owner))
			{
				if(isai(var_00) && isplayer(var_00.owner))
				{
					var_03 = "friendly";
				}

				var_00 = var_00.owner;
			}
			else if(isdefined(var_00.damageowner))
			{
				if(isdefined(var_00.destructible_type))
				{
					var_03 = "destructible";
				}

				var_00 = var_00.damageowner;
			}

			if(isplayer(var_00) && getdvar("mapname") == "sanfran_b" && var_01 == "MOD_MELEE_ALT" || var_01 == "MOD_MELEE")
			{
				thread lib_A59A::func_1CD4();
			}

			if(isplayer(var_00) && isdefined(var_02) && var_02 == "tracking_grenade_var")
			{
				lib_A59A::func_5DA6(var_00,var_01,var_02);
			}

			if(isplayer(var_00) && isdefined(self.var_512A))
			{
				var_04 = var_00 getplayerprofiledata("ach_loudEnoughForYou") + 1;
				var_00 setplayerprofiledata("ach_loudEnoughForYou",var_04);
				if(var_04 == 10)
				{
					lib_A59A::func_41DA("SONIC_KILL");
				}
			}

			if(isplayer(var_00) && isdefined(var_00.var_578E))
			{
				var_05 = var_00 getplayerprofiledata("ach_riotControl") + 1;
				var_00 setplayerprofiledata("ach_riotControl",var_05);
				if(var_05 == 20)
				{
					lib_A59A::func_41DA("COVER_DRONE_KILL");
				}
			}

			if(isplayer(var_00) && var_00 lib_A59A::func_32DB("overdrive_on") && var_00 lib_A59A::func_32D7("overdrive_on"))
			{
				var_06 = var_00 getplayerprofiledata("ach_maximumOverdrive") + 1;
				var_00 setplayerprofiledata("ach_maximumOverdrive",var_06);
				if(var_06 == 50)
				{
					lib_A59A::func_41DA("OVERDRIVE_KILL");
				}
			}

			if(isplayer(var_00) && isdefined(var_00.var_608F) && isdefined(var_02) && var_02 == "boost_slam_sp")
			{
				lib_A59A::func_41DA("BOOST_DASH_STOMP");
			}

			var_07 = 0;
			if(isplayer(var_00))
			{
				var_07 = 1;
			}

			if(isdefined(level.var_6DFF) && level.var_6DFF)
			{
				var_07 = 1;
			}

			if(isdefined(var_01) && var_01 == "MOD_CRUSH")
			{
				if(isdefined(level.var_4A8E) || isdefined(level.var_31D.var_2E18))
				{
					level.var_31D lib_A596::func_41CC(1);
				}
			}

			if(var_07)
			{
				var_00 lib_A565::func_72DC(self,var_01,var_02,var_03);
			}
		}
	}

	var_08 = 0;
	if(var_08 < self.var_265E.size)
	{
		var_09 = self.var_265E[var_08];
		switch(var_09["params"])
		{
			case 0:
				break;

			case 1:
				break;

			case 2:
				break;

			case 3:
				break;
		}
	}
}

//Function Number: 49
lib_A577::func_08D3()
{
	self.var_257D = [];
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04,var_05,var_06);
		if(isdefined(var_01) && isplayer(var_01))
		{
			var_07 = var_01 getcurrentweapon();
			if(isdefined(var_07) && lib_A59A::isprimaryweapon(var_07) && isdefined(var_04) && var_04 == "MOD_PISTOL_BULLET" || var_04 == "MOD_RIFLE_BULLET")
			{
				var_01 thread lib_A565::func_72E4();
			}
		}

		foreach(var_09 in self.var_257D)
		{
			thread [[ var_09 ]](var_00,var_01,var_02,var_03,var_04,var_05,var_06);
		}

		if(!isalive(self) || self.var_113)
		{
			break;
		}
	}
}

//Function Number: 50
lib_A577::func_57B7()
{
	if(isdefined(self.var_7982))
	{
		level.var_265A[self.var_7982] = 1;
	}

	if(isdefined(self.target))
	{
		lib_A577::func_238C();
	}
}

//Function Number: 51
lib_A577::func_238C()
{
	var_00 = lib_A577::func_3DED();
	if(isdefined(var_00))
	{
		var_01 = var_00["destination"];
		var_02 = var_00["get_target_func"];
		for(var_03 = 0;var_03 < var_01.size;var_03++)
		{
			lib_A577::func_238B(var_01[var_03],var_02);
		}
	}
}

//Function Number: 52
lib_A577::func_8959()
{
	self.var_4E6 = 0;
}

//Function Number: 53
lib_A577::func_895A()
{
	if(isdefined(level.var_A398) && level.var_A398 && isdefined(level.var_A397))
	{
		self thread [[ level.var_A397 ]]();
	}

	if(self.type == "human" && !isdefined(level.var_2B12))
	{
		thread lib_A577::func_2F41();
	}

	lib_A59A::func_749(::lib_A52D::func_111E);
	if(isdefined(self.var_7976))
	{
		self.var_C8 = self.var_7976;
	}
}

//Function Number: 54
lib_A577::func_895C()
{
	lib_A577::func_895A();
}

//Function Number: 55
lib_A577::func_895B()
{
}

//Function Number: 56
lib_A577::func_8F78()
{
	self endon("death");
	self.var_305D = 1;
	self.var_2D64 = 0.5;
	if(!isdefined(self.var_7929))
	{
		self.var_1300 = 2;
	}

	self.var_8A8 = 1;
	self.var_285 = 100;
	lib_A59A::func_749(::animscripts\pain::func_7F0);
	lib_A59A::func_749(::lib_A577::func_6648);
	self.var_254A = ::lib_A577::func_89BD;
	if(isdefined(self.weapon) && weaponclass(self.weapon) != "rocketlauncher")
	{
		self method_80B2();
	}
}

//Function Number: 57
lib_A577::func_89BD()
{
	var_00 = undefined;
	if(isdefined(self.weapon))
	{
		var_00 = self.weapon;
	}
	else
	{
		return;
	}

	if(isdefined(var_00) && weaponclass(var_00) != "rocketlauncher")
	{
		self method_80B2();
	}
}

//Function Number: 58
lib_A577::func_8F7B()
{
	if(!isdefined(self.var_7929))
	{
		self.var_1300 = 1.05;
	}
}

//Function Number: 59
lib_A577::func_6648(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	self endon("death");
	if(self.health <= 0)
	{
		return;
	}

	if(param_00 >= self.var_285)
	{
		var_07 = self.var_285;
		self.var_285 = var_07 * 3;
		wait(5);
		self.var_285 = var_07;
	}
}

//Function Number: 60
lib_A577::func_18A8(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(self) || self.health <= 0)
	{
		return;
	}

	if(isdefined(self.var_58D4) && self.var_58D4)
	{
		return;
	}

	if(!issubstr(param_04,"BULLET"))
	{
		return;
	}

	var_07 = self.var_18A8;
	if(param_00 < self.var_18A8)
	{
		var_07 = param_00;
	}

	self.health = self.health + var_07;
}

//Function Number: 61
lib_A577::func_8961()
{
	lib_A52D::func_2779();
	lib_A52D::func_1D4();
}

//Function Number: 62
lib_A577::func_08F2()
{
	if(!isalive(self))
	{
		return;
	}

	if(self.health <= 1)
	{
		return;
	}

	self method_80B2();
	self waittill("death");
	if(!isdefined(self))
	{
		return;
	}

	self method_80B3();
}

//Function Number: 63
lib_A577::func_8962()
{
	if(isdefined(self.var_79A5))
	{
		self.var_2D3A = 1;
	}

	if(isdefined(self.var_7982))
	{
		thread lib_A577::func_08D4();
	}

	if(isdefined(self.var_793E))
	{
		self.var_56 = self.var_793E;
	}

	if(isdefined(self.var_7AD8))
	{
		thread lib_A577::func_8C12();
	}

	if(isdefined(self.var_7985))
	{
		thread lib_A577::deathtime();
	}

	if(isdefined(self.var_7A7D))
	{
		lib_A59A::func_2AD9();
	}

	if(isdefined(self.var_7A74))
	{
		self.var_85B3 = 1;
	}

	if(isdefined(self.var_7A1C))
	{
		thread lib_A577::func_08F2();
	}

	if(isdefined(self.var_797D))
	{
		var_00 = self.var_797D;
		if(var_00 == 1)
		{
			var_00 = 8;
		}

		lib_A59A::func_30B3(var_00);
	}

	if(isdefined(self.var_79BF))
	{
		self.var_274 = self.var_79BF;
	}
	else
	{
		self.var_274 = 512;
	}

	if(isdefined(self.var_79E1))
	{
		lib_A59A::func_7E32(self.var_79E1);
	}

	if(isdefined(self.var_2D32))
	{
		self.var_136 = 0;
	}

	if(isdefined(self.var_79CC))
	{
		self.var_180 = self.var_79CC == 1;
	}
	else
	{
		self.var_180 = self.inliveplayerkillstreak == "allies";
	}

	self.var_34B = self.inliveplayerkillstreak == "allies" && self.var_180;
	if(isdefined(self.var_39B) && self.var_39B == "mgpair")
	{
		thread lib_A54D::func_23CC();
	}

	if(isdefined(self.var_79FE) && !(isdefined(self.var_7A3A) && self.var_7A3A == 1) || isdefined(self.var_7ADB))
	{
		thread lib_A577::func_7E49();
	}

	if(isdefined(self.var_7AED))
	{
		self sentient_setthreatbiasgroup(self.var_7AED);
	}
	else if(self.inliveplayerkillstreak == "neutral")
	{
		self sentient_setthreatbiasgroup("civilian");
	}
	else
	{
		self sentient_setthreatbiasgroup(self.inliveplayerkillstreak);
	}

	if(isdefined(self.var_7958))
	{
		lib_A59A::func_7DD9(self.var_7958);
	}

	if(isdefined(self.var_7929))
	{
		self.var_1300 = self.var_7929;
	}

	if(isdefined(self.var_7A10))
	{
		self.ignoreme = 1;
	}

	if(isdefined(self.var_7A0E))
	{
		self.var_202 = 1;
	}

	if(isdefined(self.var_7A0F))
	{
		self.ignoreall = 1;
		self method_8166();
	}

	if(isdefined(self.var_7ABE))
	{
		self.var_277 = self.var_7ABE;
	}

	if(isdefined(self.var_79C4))
	{
		if(self.var_79C4 == "player")
		{
			self.favoriteenemy = level.var_31D;
			level.var_31D.targetname = "player";
		}
	}

	if(isdefined(self.var_79C5))
	{
		self.var_2FB = self.var_79C5;
	}

	if(isdefined(self.var_7A2C))
	{
		self.var_2FC = self.var_7A2C;
	}

	if(isdefined(self.var_7A23))
	{
		self.var_7.var_2B17 = 1;
	}

	if(isdefined(self.var_7998))
	{
		self.var_120 = 1;
	}

	if(isdefined(self.var_79D9))
	{
		self.var_1D6 = "flash_grenade";
		self.var_1D3 = self.var_79D9;
	}

	if(isdefined(self.var_7A8F))
	{
		self.var_2EA = 1;
	}

	if(isdefined(self.var_7AD5))
	{
		self.health = self.var_7AD5;
	}

	if(isdefined(self.var_7A77))
	{
		self.var_613C = self.var_7A77;
	}
}

//Function Number: 64
lib_A577::func_8960(param_00)
{
	thread lib_A577::func_08D3();
	thread lib_A577::func_918C();
	thread lib_A577::func_263A();
	thread lib_A577::func_8A43();
	if(!isdefined(level.var_8DD))
	{
		self method_8029();
	}

	self.var_89C0 = undefined;
	if(!isdefined(self.unique_id))
	{
		lib_A59A::func_7DAF();
	}

	if(!isdefined(self.var_265E))
	{
		self.var_265E = [];
	}

	thread lib_A577::func_2660();
	level thread lib_A52C::func_3A57(self);
	self.var_50E = 16;
	lib_A577::func_4D34();
	lib_A577::func_8961();
	lib_A577::func_8962();
	[[ level.var_91DF[self.inliveplayerkillstreak] ]]();
	thread [[ level.var_8F7D[self.var_8F77] ]]();
	thread lib_A51A::monitordamage();
	common_scripts\_dynamic_world::ai_init();
	lib_A577::func_7E44();
	if(isdefined(self.var_7A9F))
	{
		self method_81A7(level.var_31D);
		return;
	}

	if(isdefined(self.var_7ADB))
	{
		if(isdefined(self.var_7ADD))
		{
			var_01 = level.var_8DB0[self.var_7ADD];
			self thread [[ var_01 ]]();
		}
		else
		{
			self thread [[ level.var_4221["_spawner_stealth_default"] ]]();
		}
	}

	if(isdefined(self.var_7A0C))
	{
		self thread [[ level.var_4221["_idle_call_idle_func"] ]]();
		return;
	}

	if(isdefined(self.var_7A0D) && !isdefined(self.var_7A3A))
	{
		self thread [[ level.var_4221["_idle_call_idle_func"] ]]();
	}

	if(isdefined(self.var_7A96) && !isdefined(self.var_7A3A))
	{
		thread lib_A555::func_66F9();
		return;
	}

	if(isdefined(self.var_7AAF) && self.var_7AAF == 1)
	{
		lib_A59A::func_30EA();
	}

	if(isdefined(self.var_798C))
	{
		if(!isdefined(self.script_radius))
		{
			self.var_1C7 = 800;
		}

		self method_81A7(level.var_31D);
		level thread lib_A577::func_27DB(self);
		return;
	}

	if(isdefined(self.var_9BED))
	{
		return;
	}

	if(isdefined(self.var_7A3A) && self.var_7A3A == 1)
	{
		lib_A577::func_7E43();
		self method_81A6(self.var_2E6);
		return;
	}

	if(!isdefined(self.var_7ADB))
	{
	}

	lib_A577::func_7E43();
	if(isdefined(self.target))
	{
		thread lib_A577::func_423E();
	}
}

//Function Number: 65
lib_A577::func_4D34()
{
	lib_A59A::func_7E05();
	if(isdefined(self.var_7A02))
	{
		self.var_1D3 = self.var_7A02;
	}
	else
	{
		self.var_1D3 = 3;
	}

	if(isdefined(self.alias))
	{
		self.var_2BD = animscripts\combat_utility::issniper();
	}

	if(!lib_A59A::func_5080())
	{
		self.var_6094 = 1;
	}
}

//Function Number: 66
lib_A577::func_7B42()
{
	if(self.inliveplayerkillstreak == "neutral")
	{
		self sentient_setthreatbiasgroup("civilian");
	}
	else
	{
		self sentient_setthreatbiasgroup(self.inliveplayerkillstreak);
	}

	lib_A577::func_4D34();
	self.var_1300 = 1;
	lib_A52D::func_1D4();
	lib_A59A::func_1EB8();
	self.interval = 96;
	self.var_2AF2 = undefined;
	self.ignoreme = 0;
	self.var_4B2 = 0;
	self.var_2EA = 0;
	self.var_2EB = 20;
	self.var_201 = 0;
	self.var_34F = 1;
	self.var_39F = 1;
	self.var_31 = 0;
	self.var_40 = 540;
	self.var_6B = 0.75;
	self.var_131 = 0;
	self.var_135 = 1;
	self.var_136 = 1;
	self.var_1C7 = level.var_277F;
	self.var_1C5 = level.var_277E;
	self.var_202 = 0;
	self method_81A3(0);
	if(isdefined(self.var_58D4) && self.var_58D4)
	{
		lib_A59A::func_8E9E();
	}

	lib_A59A::func_2ACB();
	self.var_277 = 67108864;
	self.var_79E5 = 0;
	self.var_50E = 16;
	lib_A59A::func_9A43();
	self.var_34F = 1;
	self.var_39F = 1;
	animscripts\init::func_7DB8();
	self.var_180 = self.inliveplayerkillstreak == "allies";
}

//Function Number: 67
lib_A577::func_27DB(param_00)
{
	param_00 endon("death");
	while(isalive(param_00))
	{
		if(param_00.var_1C7 > 200)
		{
			param_00.var_1C7 = param_00.var_1C7 - 200;
		}

		wait(6);
	}
}

//Function Number: 68
lib_A577::func_3847(param_00)
{
	self endon("death");
	if(!self.var_3862)
	{
		param_00.var_9BED = 1;
		self.var_3862 = 1;
		param_00 waittill("death");
		self.var_3862 = 0;
		self notify("get new user");
	}
}

//Function Number: 69
lib_A577::func_7E49()
{
	self endon("death");
	waittillframeend;
	if(isdefined(self.inliveplayerkillstreak) && self.inliveplayerkillstreak == "allies")
	{
		self.var_180 = 0;
	}

	var_00 = level.var_4252[self.var_79FE];
	if(!isdefined(var_00))
	{
		return;
	}

	if(isdefined(var_00.target))
	{
		var_01 = getnode(var_00.target,"targetname");
		var_02 = getent(var_00.target,"targetname");
		var_03 = common_scripts\utility::getstruct(var_00.target,"targetname");
		var_04 = undefined;
		if(isdefined(var_01))
		{
			var_04 = var_01;
			self method_81A5(var_04);
		}
		else if(isdefined(var_02))
		{
			var_04 = var_02;
			self method_81A6(var_04.var_2E6);
		}
		else if(isdefined(var_03))
		{
			var_04 = var_03;
			self method_81A6(var_04.var_2E6);
		}

		if(isdefined(var_04.radius) && var_04.radius != 0)
		{
			self.var_1C7 = var_04.radius;
		}

		if(isdefined(var_04.var_1C5) && var_04.var_1C5 != 0)
		{
			self.var_1C5 = var_04.var_1C5;
		}
	}

	if(isdefined(self.target))
	{
		self method_81A8(var_00);
		return;
	}

	self method_81A9(var_00);
}

//Function Number: 70
lib_A577::func_3E88(param_00)
{
	return getentarray(param_00,"targetname");
}

//Function Number: 71
lib_A577::func_3E8A(param_00)
{
	return getnodearray(param_00,"targetname");
}

//Function Number: 72
lib_A577::func_3E8C(param_00)
{
	return common_scripts\utility::getstructarray(param_00,"targetname");
}

//Function Number: 73
lib_A577::func_6120(param_00)
{
	return isdefined(param_00.radius) && param_00.radius != 0;
}

//Function Number: 74
lib_A577::func_4245(param_00,param_01)
{
	lib_A577::func_423E(param_00,"origin",param_01);
}

//Function Number: 75
lib_A577::func_4246(param_00,param_01)
{
	lib_A577::func_423E(param_00,"struct",param_01);
}

//Function Number: 76
lib_A577::func_423E(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(self.var_9BED))
	{
		return;
	}

	var_05 = lib_A577::func_3DED(param_00,param_01);
	if(!isdefined(var_05))
	{
		self notify("reached_path_end");
		return;
	}

	lib_A577::func_4243(var_05["destination"],var_05["get_target_func"],var_05["set_goal_func_quits"],param_02,param_03,param_04);
}

//Function Number: 77
lib_A577::func_3DB3(param_00)
{
	if(param_00.size == 1)
	{
		return param_00[0];
	}

	var_01 = param_00[0].targetname;
	if(!isdefined(level.var_423F[var_01]))
	{
		level.var_423F[var_01] = param_00;
	}

	param_00 = level.var_423F[var_01];
	var_02 = param_00[0];
	var_03 = [];
	for(var_04 = 0;var_04 < param_00.size - 1;var_04++)
	{
		var_03[var_04] = param_00[var_04 + 1];
	}

	var_03[param_00.size - 1] = param_00[0];
	level.var_423F[var_01] = var_03;
	return var_02;
}

//Function Number: 78
lib_A577::func_4243(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self notify("stop_going_to_node");
	self endon("stop_going_to_node");
	self endon("death");
	for(;;)
	{
		param_00 = lib_A577::func_3DB3(param_00);
		var_06 = param_04;
		if(isdefined(param_00.var_7AB1))
		{
			if(param_00.var_7AB1 > 1)
			{
				var_06 = param_00.var_7AB1;
			}

			param_00.var_7AB1 = 0;
		}

		if(lib_A577::func_6120(param_00))
		{
			self.var_1C7 = param_00.radius;
		}
		else
		{
			self.var_1C7 = level.var_277F;
		}

		if(isdefined(param_00.height))
		{
			self.var_1C5 = param_00.height;
		}
		else
		{
			self.var_1C5 = level.var_277E;
		}

		[[ param_02 ]](param_00);
		if(lib_A59A::func_32DB("_stealth_override_goalpos"))
		{
			for(;;)
			{
				self waittill("goal");
				if(!lib_A59A::func_32D7("_stealth_override_goalpos"))
				{
					break;
				}

				lib_A59A::func_32E3("_stealth_override_goalpos");
			}
		}
		else
		{
			self waittill("goal");
		}

		param_00 notify("trigger",self);
		if(isdefined(param_03))
		{
			[[ param_03 ]](param_00);
		}

		if(isdefined(param_00.var_79D3))
		{
			common_scripts\utility::flag_set(param_00.var_79D3);
		}

		if(isdefined(param_00.var_79B7))
		{
			lib_A59A::func_32DD(param_00.var_79B7);
		}

		if(isdefined(param_00.var_79CF))
		{
			common_scripts\utility::flag_clear(param_00.var_79CF);
		}

		if(isdefined(param_00.var_39B))
		{
			self notify(param_00.var_39B);
		}

		if(lib_A577::func_91D3(param_00))
		{
			return 1;
		}

		param_00 lib_A59A::script_delay();
		if(isdefined(param_00.var_79D5))
		{
			common_scripts\utility::flag_wait(param_00.var_79D5);
		}

		param_00 lib_A59A::func_7B1A();
		if(isdefined(param_00.script_delay_post))
		{
			wait(param_00.script_delay_post);
		}

		while(isdefined(param_00.var_7AB1))
		{
			param_00.var_7AB1 = 0;
			if(lib_A577::func_4244(param_00,param_01,var_06))
			{
				param_00.var_7AB1 = 1;
				param_00 notify("script_requires_player");
				break;
			}

			wait(0.1);
		}

		if(isdefined(param_05))
		{
			[[ param_05 ]](param_00);
		}

		if(!isdefined(param_00.target))
		{
			break;
		}

		var_07 = [[ param_01 ]](param_00.target);
		if(!var_07.size)
		{
			break;
		}

		param_00 = var_07;
	}

	self notify("reached_path_end");
	if(isdefined(self.var_79E4))
	{
		return;
	}

	if(isdefined(self method_81AA()))
	{
		self method_81A9(self method_81AA());
		return;
	}

	self.var_1C7 = level.var_277F;
}

//Function Number: 79
lib_A577::func_4244(param_00,param_01,param_02)
{
	foreach(var_04 in level.var_328)
	{
		if(distancesquared(var_04.var_2E6,param_00.var_2E6) < distancesquared(self.var_2E6,param_00.var_2E6))
		{
			return 1;
		}
	}

	var_06 = anglestoforward(self.var_41);
	if(isdefined(param_00.target))
	{
		var_07 = [[ param_01 ]](param_00.target);
		if(var_07.size == 1)
		{
			var_06 = vectornormalize(var_07[0].var_2E6 - param_00.var_2E6);
		}
		else if(isdefined(param_00.var_41))
		{
			var_06 = anglestoforward(param_00.var_41);
		}
	}
	else if(isdefined(param_00.var_41))
	{
		var_06 = anglestoforward(param_00.var_41);
	}

	var_08 = [];
	foreach(var_04 in level.var_328)
	{
		var_08[var_08.size] = vectornormalize(var_04.var_2E6 - self.var_2E6);
	}

	foreach(var_0C in var_08)
	{
		if(vectordot(var_06,var_0C) > 0)
		{
			return 1;
		}
	}

	var_0E = param_02 * param_02;
	foreach(var_04 in level.var_328)
	{
		if(distancesquared(var_04.var_2E6,self.var_2E6) < var_0E)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 80
lib_A577::func_4240(param_00)
{
	if(param_00.classname == "info_volume")
	{
		self method_81A9(param_00);
		self notify("go_to_node_new_goal");
		return;
	}

	lib_A577::func_4242(param_00);
}

//Function Number: 81
lib_A577::func_4242(param_00)
{
	lib_A59A::func_7E41(param_00);
	self notify("go_to_node_new_goal");
}

//Function Number: 82
lib_A577::func_4241(param_00)
{
	lib_A59A::func_7E45(param_00);
	self notify("go_to_node_new_goal");
}

//Function Number: 83
lib_A577::func_91D3(param_00)
{
	if(!isdefined(param_00.target))
	{
		return 0;
	}

	var_01 = getentarray(param_00.target,"targetname");
	if(!var_01.size)
	{
		return 0;
	}

	var_02 = var_01[0];
	if(var_02.classname != "misc_turret")
	{
		return 0;
	}

	thread lib_A577::func_9BC8(var_02);
	return 1;
}

//Function Number: 84
lib_A577::func_7338(param_00)
{
	waittillframeend;
	if(isdefined(param_00))
	{
		param_00.var_238D = undefined;
	}
}

//Function Number: 85
lib_A577::func_238B(param_00,param_01)
{
	var_02 = 0;
	var_03 = [];
	var_04 = 0;
	for(;;)
	{
		if(!isdefined(param_00.var_238D))
		{
			param_00.var_238D = 1;
			level thread lib_A577::func_7338(param_00);
			if(isdefined(param_00.var_79D3))
			{
				if(!isdefined(level.flag[param_00.var_79D3]))
				{
					common_scripts\utility::flag_init(param_00.var_79D3);
				}
			}

			if(isdefined(param_00.var_79D5))
			{
				if(!isdefined(level.flag[param_00.var_79D5]))
				{
					common_scripts\utility::flag_init(param_00.var_79D5);
				}
			}

			if(isdefined(param_00.var_79CF))
			{
				if(!isdefined(level.flag[param_00.var_79CF]))
				{
					common_scripts\utility::flag_init(param_00.var_79CF);
				}
			}

			if(isdefined(param_00.target))
			{
				var_05 = [[ param_01 ]](param_00.target);
				var_03 = common_scripts\utility::add_to_array(var_03,var_05);
			}
		}

		var_04++;
		if(var_04 >= var_03.size)
		{
			break;
		}

		param_00 = var_03[var_04];
	}
}

//Function Number: 86
lib_A577::func_3DED(param_00,param_01)
{
	var_02["entity"] = ::lib_A577::func_3E88;
	var_02["node"] = ::lib_A577::func_3E8A;
	var_02["struct"] = ::lib_A577::func_3E8C;
	var_03["entity"] = ::lib_A577::func_4240;
	var_03["struct"] = ::lib_A577::func_4242;
	var_03["node"] = ::lib_A577::func_4241;
	if(!isdefined(param_01))
	{
		param_01 = "node";
	}

	var_04 = [];
	if(isdefined(param_00))
	{
		var_04["destination"][0] = param_00;
	}
	else
	{
		param_00 = getentarray(self.target,"targetname");
		if(param_00.size > 0)
		{
			param_01 = "entity";
		}

		if(param_01 == "node")
		{
			param_00 = getnodearray(self.target,"targetname");
			if(!param_00.size)
			{
				param_00 = common_scripts\utility::getstructarray(self.target,"targetname");
				if(!param_00.size)
				{
					return;
				}

				param_01 = "struct";
			}
		}

		var_04["destination"] = param_00;
	}

	var_04["get_target_func"] = var_02[param_01];
	var_04["set_goal_func_quits"] = var_03[param_01];
	return var_04;
}

//Function Number: 87
lib_A577::func_7E44()
{
	if(isdefined(self.var_79FC))
	{
		self.var_1C5 = self.var_79FC;
		return;
	}

	self.var_1C5 = level.var_277E;
}

//Function Number: 88
lib_A577::func_7E43(param_00)
{
	if(isdefined(self.script_radius))
	{
		self.var_1C7 = self.script_radius;
		return;
	}

	if(isdefined(self.var_79E4))
	{
		if(isdefined(param_00) && isdefined(param_00.radius))
		{
			self.var_1C7 = param_00.radius;
			return;
		}
	}

	if(!isdefined(self method_81AA()))
	{
		if(self.type == "civilian")
		{
			self.var_1C7 = 128;
			return;
		}

		self.var_1C7 = level.var_277F;
	}
}

//Function Number: 89
lib_A577::func_1170(param_00)
{
	for(;;)
	{
		var_01 = self getturretowner();
		if(!isalive(var_01))
		{
			wait(1.5);
			continue;
		}

		if(!isdefined(var_01.enemy))
		{
			self settargetentity(common_scripts\utility::random(param_00));
			self notify("startfiring");
			self startfiring();
		}

		wait(2 + randomfloat(1));
	}
}

//Function Number: 90
lib_A577::func_597A(param_00)
{
	for(;;)
	{
		self settargetentity(common_scripts\utility::random(param_00));
		self notify("startfiring");
		self startfiring();
		wait(2 + randomfloat(1));
	}
}

//Function Number: 91
lib_A577::func_9BC8(param_00)
{
	if(self method_813D() && self.health == 150)
	{
		self.health = 100;
		self.var_7.var_2B17 = 1;
	}

	self method_818A(param_00);
	if(isdefined(param_00.target) && param_00.target != param_00.targetname)
	{
		var_01 = getentarray(param_00.target,"targetname");
		var_02 = [];
		for(var_03 = 0;var_03 < var_01.size;var_03++)
		{
			if(var_01[var_03].classname == "script_origin")
			{
				var_02[var_02.size] = var_01[var_03];
			}
		}

		if(isdefined(param_00.var_794F))
		{
			param_00 thread lib_A577::func_1170(var_02);
		}
		else if(isdefined(param_00.var_7A25))
		{
			param_00 setmode("manual_ai");
			param_00 thread lib_A577::func_597A(var_02);
		}
		else if(var_02.size > 0)
		{
			if(var_02.size == 1)
			{
				param_00.var_5971 = var_02[0];
				param_00 settargetentity(var_02[0]);
				thread lib_A54E::func_5972(param_00);
			}
			else
			{
				param_00 thread lib_A54E::func_5BC6(var_02);
			}
		}
	}

	thread lib_A54E::func_5BC1(param_00);
	param_00 notify("startfiring");
}

//Function Number: 92
lib_A577::func_365F(param_00,param_01)
{
	self endon("death");
	level.var_24E3[param_00] = level.var_24E3[param_00] + self.count;
	var_02 = 1;
	while(self.count > 0)
	{
		self waittill("spawned",var_03);
		if(var_02)
		{
			if(getdvar("fallback","0") == "1")
			{
			}

			level notify("fallback_firstspawn" + param_00);
			var_02 = 0;
		}

		wait(0.05);
		if(lib_A59A::func_88EB(var_03))
		{
			level notify("fallbacker_died" + param_00);
			level.var_24E3[param_00]--;
			continue;
		}

		var_03 thread lib_A577::func_3658(param_00,param_01,"is spawner");
	}
}

//Function Number: 93
lib_A577::func_3659(param_00,param_01)
{
	param_00 waittill("death");
	level.var_24E3[param_01]--;
	level notify("fallbacker_died" + param_01);
}

//Function Number: 94
lib_A577::func_3658(param_00,param_01,param_02)
{
	if(!isdefined(self.var_3656) || !isdefined(self.var_3656[param_00]))
	{
		self.var_3656[param_00] = 1;
	}
	else
	{
		return;
	}

	self.var_79C1 = param_00;
	if(!isdefined(param_02))
	{
		level.var_24E3[param_00]++;
	}

	if(isdefined(param_01) && level.var_365D[param_00])
	{
		thread lib_A577::func_3657(param_00,param_01);
	}

	level thread lib_A577::func_3659(self,param_00);
}

//Function Number: 95
lib_A577::func_365B(param_00,param_01)
{
	param_00 waittill("death");
	level notify("fallback_reached_goal" + param_01);
}

//Function Number: 96
lib_A577::func_365C()
{
	self waittill("goal");
	self.var_202 = 0;
	self notify("fallback_notify");
	self notify("stop_coverprint");
}

//Function Number: 97
lib_A577::func_3657(param_00,param_01)
{
	self notify("stop_going_to_node");
	self method_818B();
	self.var_202 = 1;
	self method_81A5(param_01);
	if(lib_A577::func_6120(param_01))
	{
		self.var_1C7 = param_01.radius;
	}

	self endon("death");
	level thread lib_A577::func_365B(self,param_00);
	thread lib_A577::func_365C();
	if(getdvar("fallback","0") == "1")
	{
		thread lib_A577::func_22BD(param_01.var_2E6);
	}

	self waittill("fallback_notify");
	level notify("fallback_reached_goal" + param_00);
}

//Function Number: 98
lib_A577::func_22BD(param_00)
{
	self endon("fallback_notify");
	self endon("stop_coverprint");
	wait(0.05);
}

//Function Number: 99
lib_A577::func_60AA(param_00,param_01)
{
	var_02 = undefined;
	foreach(var_04 in getallnodes())
	{
		if(isdefined(var_04.var_79C1) && var_04.var_79C1 == param_00)
		{
			var_02 = common_scripts\utility::add_to_array(var_02,var_04);
		}
	}

	if(!isdefined(var_02))
	{
		return;
	}

	level.var_24E3[param_00] = 0;
	level.var_89BC[param_00] = 0;
	level.var_365D[param_00] = 0;
	var_06 = function_00D8();
	for(var_07 = 0;var_07 < var_06.size;var_07++)
	{
		if(isdefined(var_06[var_07].var_79C1) && var_06[var_07].var_79C1 == param_00)
		{
			if(var_06[var_07].count > 0)
			{
				var_06[var_07] thread lib_A577::func_365F(param_00,var_02[randomint(var_02.size)]);
				level.var_89BC[param_00]++;
			}
		}
	}

	var_08 = function_00D6();
	for(var_07 = 0;var_07 < var_08.size;var_07++)
	{
		if(isdefined(var_08[var_07].var_79C1) && var_08[var_07].var_79C1 == param_00)
		{
			var_08[var_07] thread lib_A577::func_3658(param_00);
		}
	}

	if(!level.var_24E3[param_00] && !level.var_89BC[param_00])
	{
		return;
	}

	var_06 = undefined;
	var_08 = undefined;
	thread lib_A577::func_3661(param_00,param_01);
	level waittill("fallbacker_trigger" + param_00);
	if(getdvar("fallback","0") == "1")
	{
	}

	level.var_365D[param_00] = 1;
	var_09 = undefined;
	var_08 = function_00D6();
	for(var_07 = 0;var_07 < var_08.size;var_07++)
	{
		if((isdefined(var_08[var_07].var_79C1) && var_08[var_07].var_79C1 == param_00) || isdefined(var_08[var_07].var_79C2) && isdefined(param_01) && var_08[var_07].var_79C2 == param_01)
		{
			var_09 = common_scripts\utility::add_to_array(var_09,var_08[var_07]);
		}
	}

	var_08 = undefined;
	if(!isdefined(var_09))
	{
		return;
	}

	var_0A = var_09.size * 0.4;
	var_0A = int(var_0A);
	level notify("fallback initiated " + param_00);
	for(var_07 = 0;var_07 < var_0A;var_07++)
	{
		var_09[var_07] thread lib_A577::func_3657(param_00,var_02[randomint(var_02.size)]);
	}

	for(var_07 = 0;var_07 < var_0A;var_07++)
	{
		level waittill("fallback_reached_goal" + param_00);
	}

	for(var_07 = var_0A;var_07 < var_09.size;var_07++)
	{
		if(isalive(var_09[var_07]))
		{
			var_09[var_07] thread lib_A577::func_3657(param_00,var_02[randomint(var_02.size)]);
		}
	}
}

//Function Number: 100
lib_A577::func_3661(param_00,param_01)
{
	level endon("fallbacker_trigger" + param_00);
	if(getdvar("fallback","0") == "1")
	{
	}

	for(var_02 = 0;var_02 < level.var_89BC[param_00];var_02++)
	{
		if(getdvar("fallback","0") == "1")
		{
		}

		level waittill("fallback_firstspawn" + param_00);
	}

	if(getdvar("fallback","0") == "1")
	{
	}

	var_03 = function_00D6();
	for(var_02 = 0;var_02 < var_03.size;var_02++)
	{
		if((isdefined(var_03[var_02].var_79C1) && var_03[var_02].var_79C1 == param_00) || isdefined(var_03[var_02].var_79C2) && isdefined(param_01) && var_03[var_02].var_79C2 == param_01)
		{
			var_03[var_02] thread lib_A577::func_3658(param_00);
		}
	}

	var_03 = undefined;
	var_04 = level.var_24E3[param_00];
	for(var_05 = 0;level.var_24E3[param_00] > var_04 * 0.5;var_05++)
	{
		if(getdvar("fallback","0") == "1")
		{
		}

		level waittill("fallbacker_died" + param_00);
	}

	level notify("fallbacker_trigger" + param_00);
}

//Function Number: 101
lib_A577::func_3660(param_00)
{
	if(!isdefined(level.var_3656) || !isdefined(level.var_3656[param_00.var_79C1]))
	{
		level thread lib_A577::func_60AA(param_00.var_79C1,param_00.var_79C2);
	}

	param_00 waittill("trigger");
	level notify("fallbacker_trigger" + param_00.var_79C1);
	lib_A577::func_533B(param_00);
}

//Function Number: 102
lib_A577::func_0D2A(param_00)
{
	self waittill("goal");
	if(lib_A577::func_6120(param_00))
	{
		self.var_1C7 = param_00.radius;
		return;
	}

	self.var_1C7 = level.var_277F;
}

//Function Number: 103
lib_A577::func_365A()
{
	self endon("fallback");
	self endon("fallback_clear_goal");
	self endon("fallback_clear_death");
	for(;;)
	{
		if(isdefined(self.var_22BB))
		{
		}

		wait(0.05);
	}
}

//Function Number: 104
lib_A577::func_365E()
{
	self endon("fallback_clear_goal");
	self endon("fallback_clear_death");
	for(;;)
	{
		if(isdefined(self.var_22BB))
		{
		}

		wait(0.05);
	}
}

//Function Number: 105
lib_A577::func_3656()
{
	var_00 = getnode(self.target,"targetname");
	self.var_22BB = var_00;
	self method_81A5(var_00);
	if(isdefined(self.var_7AB9))
	{
		thread lib_A577::func_0D2A(var_00);
	}
	else if(lib_A577::func_6120(var_00))
	{
		self.var_1C7 = var_00.radius;
	}
	else
	{
		self.var_1C7 = level.var_277F;
	}

	for(;;)
	{
		self waittill("fallback");
		self.interval = 20;
		level thread lib_A577::func_365B(self);
		if(getdvar("fallback","0") == "1")
		{
			thread lib_A577::func_365E();
		}

		if(isdefined(var_00.target))
		{
			var_00 = getnode(var_00.target,"targetname");
			self.var_22BB = var_00;
			self method_81A5(var_00);
			thread lib_A577::func_365C();
			if(lib_A577::func_6120(var_00))
			{
				self.var_1C7 = var_00.radius;
			}

			continue;
		}

		level notify("fallback_arrived" + self.var_79C1);
	}
}

//Function Number: 106
lib_A577::func_2818()
{
	wait(0.05);
	self delete();
}

//Function Number: 107
lib_A577::func_9EA4(param_00,param_01)
{
	var_02 = param_00[0] - param_01[0];
	var_03 = param_00[1] - param_01[1];
	var_04 = param_00[2] - param_01[2];
	var_02 = var_02 * var_02;
	var_03 = var_03 * var_03;
	var_04 = var_04 * var_04;
	var_05 = var_02 + var_03 + var_04;
	return var_05;
}

//Function Number: 108
lib_A577::func_8A22(param_00)
{
	wait(0.05);
}

//Function Number: 109
lib_A577::func_3A8C(param_00)
{
	if(!isdefined(level.var_3A8D))
	{
		thread lib_A577::func_3A8E();
	}

	for(;;)
	{
		param_00 waittill("trigger");
		level notify("friendly_died");
		if(param_00.targetname == "friendly_wave")
		{
			level.var_3A8F = param_00;
		}
		else
		{
			level.var_3A8F = undefined;
		}

		wait(1);
	}
}

//Function Number: 110
lib_A577::func_7EB6(param_00)
{
	if(!isdefined(self.target))
	{
		return;
	}

	var_01 = getentarray(self.target,"targetname");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_01[var_02] lib_A59A::func_7DF2(param_00);
	}
}

//Function Number: 111
lib_A577::func_3A96()
{
	if(!isdefined(level.var_93F2))
	{
		level.var_93F2 = 0;
	}

	level.var_93F2++;
	self waittill("death");
	level notify("friendly_died");
	level.var_93F2--;
}

//Function Number: 112
lib_A577::func_3A8E()
{
	level.var_3A8D = 1;
	var_00 = getentarray("friendly_wave","targetname");
	common_scripts\utility::array_thread(var_00,::lib_A577::func_7EB6,0);
	if(!isdefined(level.var_5A37))
	{
		level.var_5A37 = 7;
	}

	var_01 = 1;
	for(;;)
	{
		if(isdefined(level.var_3A8F) && isdefined(level.var_3A8F.target))
		{
			var_02 = level.var_3A8F;
			var_03 = getentarray(level.var_3A8F.target,"targetname");
			if(!var_03.size)
			{
				level waittill("friendly_died");
				continue;
			}

			var_04 = 0;
			var_05 = isdefined(level.var_3A8F.script_delay);
			while(isdefined(level.var_3A8F) && level.var_93F2 < level.var_5A37)
			{
				if(var_02 != level.var_3A8F)
				{
					var_05 = isdefined(level.var_3A8F.script_delay);
					var_02 = level.var_3A8F;
					var_03 = getentarray(level.var_3A8F.target,"targetname");
				}
				else if(!var_05)
				{
					var_04 = randomint(var_03.size);
				}
				else if(var_04 == var_03.size)
				{
					var_04 = 0;
				}

				var_03[var_04] lib_A59A::func_7DF2(1);
				var_06 = isdefined(var_03[var_04].var_7ADB) && common_scripts\utility::flag("_stealth_enabled") && !common_scripts\utility::flag("_stealth_spotted");
				if(isdefined(var_03[var_04].var_79E6))
				{
					var_07 = var_03[var_04] method_8094(var_06);
				}
				else
				{
					var_07 = var_03[var_04] method_8093(var_06);
				}

				var_03[var_04] lib_A59A::func_7DF2(0);
				if(lib_A59A::func_88EB(var_07))
				{
					wait(0.2);
					continue;
				}

				if(isdefined(var_03[var_04].var_7975))
				{
					if(var_03[var_04].var_20A7 == "heat")
					{
						var_07 lib_A59A::func_30C8();
					}

					if(var_03[var_04].var_20A7 == "cqb")
					{
						var_07 lib_A59A::func_30AF();
					}
				}

				if(isdefined(level.var_3ABD))
				{
					level thread [[ level.var_3ABD ]](var_07);
				}
				else
				{
					var_07 method_81A7(level.var_31D);
				}

				if(var_05)
				{
					if(level.var_3A8F.script_delay == 0)
					{
						waittillframeend;
					}
					else
					{
						wait(level.var_3A8F.script_delay);
					}

					var_04++;
					continue;
				}

				wait(randomfloat(5));
			}
		}

		level waittill("friendly_died");
	}
}

//Function Number: 113
lib_A577::func_3A6E(param_00)
{
	var_01 = getnode(param_00.target,"targetname");
	var_02 = getent(var_01.target,"targetname");
	var_02 setmode("auto_ai");
	var_02 cleartargetentity();
	var_03 = 0;
	for(;;)
	{
		param_00 waittill("trigger",var_04);
		if(!isai(var_04))
		{
			continue;
		}

		if(!isdefined(var_04.inliveplayerkillstreak))
		{
			continue;
		}

		if(var_04.inliveplayerkillstreak != "allies")
		{
			continue;
		}

		if(isdefined(var_04.var_7B04) && var_04.var_7B04 == 0)
		{
			continue;
		}

		if(var_04 thread lib_A577::func_3A6C(var_02,var_01))
		{
			var_04 thread lib_A577::func_3A6B(var_02,var_01);
			var_02 waittill("friendly_finished_using_mg42");
			if(isalive(var_04))
			{
				var_04.var_9997 = gettime() + 10000;
			}
		}

		wait(1);
	}
}

//Function Number: 114
lib_A577::func_3A67(param_00,param_01)
{
	param_01 endon("friendly_finished_using_mg42");
	param_00 waittill("death");
	param_01 notify("friendly_finished_using_mg42");
}

//Function Number: 115
lib_A577::func_3A6D(param_00)
{
	param_00 endon("friendly_finished_using_mg42");
	self.var_4E5 = 1;
	self setcursorhint("HINT_NOICON");
	self sethintstring(&"PLATFORM_USEAIONMG42");
	self waittill("trigger");
	self.var_4E5 = 0;
	self sethintstring("");
	self method_818B();
	self notify("stopped_use_turret");
	param_00 notify("friendly_finished_using_mg42");
}

//Function Number: 116
lib_A577::func_3A6C(param_00,param_01)
{
	if(self.var_4E5)
	{
		return 0;
	}

	if(isdefined(self.var_9997) && gettime() < self.var_9997)
	{
		return 0;
	}

	if(distance(level.var_31D.var_2E6,param_01.var_2E6) < 100)
	{
		return 0;
	}

	return 1;
}

//Function Number: 117
lib_A577::func_3A69(param_00,param_01)
{
	param_00 endon("friendly_finished_using_mg42");
	self waittill("trigger");
	param_00 notify("friendly_finished_using_mg42");
}

//Function Number: 118
lib_A577::func_3A6A()
{
	if(!isdefined(self.var_3A65))
	{
		return;
	}

	self.var_3A65 notify("friendly_finished_using_mg42");
}

//Function Number: 119
lib_A577::func_6141()
{
	self endon("death");
	self waittill("goal");
	self.var_1C7 = self.oldradius;
	if(self.var_1C7 < 32)
	{
		self.var_1C7 = 400;
	}
}

//Function Number: 120
lib_A577::func_3A6B(param_00,param_01)
{
	self endon("death");
	param_00 endon("friendly_finished_using_mg42");
	level thread lib_A577::func_3A67(self,param_00);
	self.oldradius = self.var_1C7;
	self.var_1C7 = 28;
	thread lib_A577::func_6141();
	self method_81A5(param_01);
	self.var_202 = 1;
	self waittill("goal");
	self.var_1C7 = self.oldradius;
	if(self.var_1C7 < 32)
	{
		self.var_1C7 = 400;
	}

	self.var_202 = 0;
	self.var_1C7 = self.oldradius;
	if(distance(level.var_31D.var_2E6,param_01.var_2E6) < 32)
	{
		param_00 notify("friendly_finished_using_mg42");
		return;
	}

	self.var_3A65 = param_00;
	thread lib_A577::func_3A6D(param_00);
	thread lib_A577::func_3A66(param_00);
	self method_818A(param_00);
	if(isdefined(param_00.target))
	{
		var_02 = getent(param_00.target,"targetname");
		if(isdefined(var_02))
		{
			var_02 thread lib_A577::func_3A69(param_00,self);
		}
	}

	for(;;)
	{
		if(distance(self.var_2E6,param_01.var_2E6) < 32)
		{
			self method_818A(param_00);
		}
		else
		{
			break;
		}

		wait(1);
	}

	param_00 notify("friendly_finished_using_mg42");
}

//Function Number: 121
lib_A577::func_3A66(param_00)
{
	self endon("death");
	param_00 waittill("friendly_finished_using_mg42");
	lib_A577::func_3A68();
}

//Function Number: 122
lib_A577::func_3A68()
{
	self endon("death");
	var_00 = self.var_3A65;
	self.var_3A65 = undefined;
	self method_818B();
	self notify("stopped_use_turret");
	self.var_4E5 = 0;
	self.var_1C7 = self.oldradius;
	if(!isdefined(var_00))
	{
		return;
	}

	if(!isdefined(var_00.target))
	{
		return;
	}

	var_01 = getnode(var_00.target,"targetname");
	var_02 = self.var_1C7;
	self.var_1C7 = 8;
	self method_81A5(var_01);
	wait(2);
	self.var_1C7 = 384;
	self waittill("goal");
	if(isdefined(self.target))
	{
		var_01 = getnode(self.target,"targetname");
		if(isdefined(var_01.target))
		{
			var_01 = getnode(var_01.target,"targetname");
		}

		if(isdefined(var_01))
		{
			self method_81A5(var_01);
		}
	}

	self.var_1C7 = var_02;
}

//Function Number: 123
lib_A577::func_918C()
{
	if(isdefined(level.var_6168))
	{
		return;
	}

	if(isdefined(level.var_56DF) && !level.var_56DF)
	{
		return;
	}

	lib_A59A::func_749(::lib_A577::func_918D);
}

//Function Number: 124
lib_A577::func_918D(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(self))
	{
		return;
	}

	if(isalive(self))
	{
		return;
	}

	if(!isalive(param_01))
	{
		return;
	}

	if(!isdefined(param_01.vehicletype))
	{
		return;
	}

	if(param_01 lib_A59E::func_5115())
	{
		return;
	}

	if(!isdefined(self.var_6156))
	{
		self startragdoll();
	}

	if(!isdefined(self))
	{
		return;
	}

	lib_A59A::func_7339(::lib_A577::func_918D);
}

//Function Number: 125
lib_A577::func_6677(param_00,param_01,param_02,param_03,param_04)
{
	param_00 endon("death");
	param_00.var_6675 = param_01;
	if(isdefined(param_01.script_delay))
	{
		param_00.var_6672 = param_01.script_delay;
	}

	if(isdefined(param_03) && isdefined(param_04))
	{
		param_00.var_6673 = param_03;
		param_00.var_6674 = param_04;
	}
	else
	{
		param_00.var_6676 = param_02;
	}

	param_00 method_81A6(param_00.var_2E6);
	param_00 method_81A5(param_01);
	param_00.var_1C7 = 12;
	param_00 waittill("goal");
	param_00.var_1C7 = 28;
	param_00 waittill("shot_at_target");
	param_00.var_6673 = undefined;
	param_00.var_6676 = undefined;
	param_00.var_6672 = undefined;
}

//Function Number: 126
lib_A577::func_8527(param_00,param_01,param_02)
{
	var_03 = getstartorigin(param_00,param_01,param_02);
	wait(0.05);
}

//Function Number: 127
lib_A577::func_8A11()
{
	lib_A59A::func_7DF2(1);
	if(isdefined(self.var_79E6))
	{
		var_00 = self method_8094();
	}
	else
	{
		var_00 = self method_8093();
	}

	if(lib_A59A::func_88EB(var_00))
	{
		return;
	}

	if(isdefined(self.var_7975))
	{
		if(self.var_7975 == "heat")
		{
			var_00 lib_A59A::func_30C8();
		}

		if(self.var_7975 == "cqb")
		{
			var_00 lib_A59A::func_30AF();
		}
	}

	var_00.var_3ABE = 1;
}

//Function Number: 128
lib_A577::func_A0CC()
{
	self endon("death");
	self waittill("leaveSquad");
}

//Function Number: 129
lib_A577::func_3ABA()
{
	common_scripts\utility::array_thread(getentarray(self.target,"targetname"),::lib_A577::func_3ABB,self);
	for(;;)
	{
		self waittill("trigger",var_02);
		if(lib_A577::func_071E() && lib_A577::func_3FA4() == self)
		{
			lib_A577::func_9A6D();
		}

		self waittill("friendly_wave_start",var_03);
		lib_A577::func_7F73(var_03,self);
		if(!isdefined(var_03.target))
		{
			continue;
		}

		var_04 = getent(var_03.target,"targetname");
		var_04 thread lib_A577::func_8A10(self);
	}
}

//Function Number: 130
lib_A577::func_38E8(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	if(isdefined(self.var_39B) && self.var_39B == "instant_respawn")
	{
		param_00 = 1;
	}

	level.var_89C8 = [];
	var_01 = getentarray(self.target,"targetname");
	common_scripts\utility::array_thread(var_01,::lib_A577::func_38EB,param_00);
	var_02 = 0;
	var_03 = 0;
	for(;;)
	{
		self waittill("trigger",var_04);
		if(!lib_A577::func_62FC())
		{
			continue;
		}

		if(!var_03)
		{
			var_03 = 1;
			lib_A59A::script_delay();
		}

		if(self istouching(level.var_31D))
		{
			var_02 = 1;
		}
		else
		{
			if(!isalive(var_04))
			{
				continue;
			}

			if(isplayer(var_04))
			{
				var_02 = 1;
			}
			else if(!isdefined(var_04.var_51B3) || !var_04.var_51B3)
			{
				continue;
			}
		}

		var_01 = getentarray(self.target,"targetname");
		if(isdefined(var_01[0]))
		{
			if(isdefined(var_01[0].var_7AAE))
			{
				lib_A577::func_24B6(var_01[0].var_7AAE);
			}
		}

		var_01 = getentarray(self.target,"targetname");
		for(var_05 = 0;var_05 < var_01.size;var_05++)
		{
			var_01[var_05].var_6D70 = var_02;
			var_01[var_05] notify("flood_begin");
		}

		if(var_02)
		{
			wait(5);
			continue;
		}

		wait(0.1);
	}
}

//Function Number: 131
lib_A577::func_24B7(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		var_01[param_00[var_02].var_7AAE] = 1;
	}

	var_03 = getarraykeys(var_01);
	var_04 = common_scripts\utility::random(var_03);
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		if(param_00[var_02].var_7AAE != var_04)
		{
			param_00[var_02] delete();
		}
	}
}

//Function Number: 132
lib_A577::func_38EB(param_00)
{
	if(isdefined(self.var_7C01))
	{
		return;
	}

	self.var_7C01 = 1;
	self.var_9816 = 1;
	var_01 = self.target;
	var_02 = self.targetname;
	if(!isdefined(var_01) && !isdefined(self.var_7A3A))
	{
		waittillframeend;
	}

	var_03 = [];
	if(isdefined(var_01))
	{
		var_04 = getentarray(var_01,"targetname");
		for(var_05 = 0;var_05 < var_04.size;var_05++)
		{
			if(!issubstr(var_04[var_05].classname,"actor"))
			{
				continue;
			}

			var_03[var_03.size] = var_04[var_05];
		}
	}

	var_06 = spawnstruct();
	var_07 = self.var_2E6;
	lib_A577::func_38EC(var_06,var_03.size > 0,param_00);
	if(isalive(var_06.var_8B4))
	{
		var_06.var_8B4 waittill("death");
	}

	if(!isdefined(var_01))
	{
		return;
	}

	var_04 = getentarray(var_01,"targetname");
	if(!var_04.size)
	{
		return;
	}

	for(var_05 = 0;var_05 < var_04.size;var_05++)
	{
		if(!issubstr(var_04[var_05].classname,"actor"))
		{
			continue;
		}

		var_04[var_05].targetname = var_02;
		var_08 = var_01;
		if(isdefined(var_04[var_05].target))
		{
			var_09 = getent(var_04[var_05].target,"targetname");
			if(!isdefined(var_09) || !issubstr(var_09.classname,"actor"))
			{
				var_08 = var_04[var_05].target;
			}
		}

		var_04[var_05].target = var_08;
		var_04[var_05] thread lib_A577::func_38EB(param_00);
		var_04[var_05].var_6D70 = 1;
		var_04[var_05] notify("flood_begin");
	}
}

//Function Number: 133
lib_A577::func_38EC(param_00,param_01,param_02)
{
	self endon("death");
	var_03 = self.count;
	if(!param_01)
	{
		param_01 = isdefined(self.var_39B) && self.var_39B == "delete";
	}

	lib_A59A::func_7DF2(2);
	if(isdefined(self.script_delay))
	{
		var_04 = self.script_delay;
	}
	else
	{
		var_04 = 0;
	}

	for(;;)
	{
		self waittill("flood_begin");
		if(self.var_6D70)
		{
			break;
		}

		if(var_04)
		{
			continue;
		}

		break;
	}

	var_05 = distance(level.var_31D.var_2E6,self.var_2E6);
	while(var_03)
	{
		self.var_987F = var_03;
		lib_A59A::func_7DF2(2);
		wait(var_04);
		var_06 = isdefined(self.var_7ADB) && common_scripts\utility::flag("_stealth_enabled") && !common_scripts\utility::flag("_stealth_spotted");
		if(isdefined(self.var_79E6))
		{
			var_07 = self method_8094(var_06);
		}
		else
		{
			var_07 = self method_8093(var_06);
		}

		if(lib_A59A::func_88EB(var_07))
		{
			var_08 = 0;
			if(var_04 < 2)
			{
				wait(2);
			}

			continue;
		}
		else
		{
			if(isdefined(self.var_7975))
			{
				if(self.var_7975 == "heat")
				{
					var_07 lib_A59A::func_30C8();
				}

				if(self.var_7975 == "cqb")
				{
					var_07 lib_A59A::func_30AF();
				}
			}

			thread lib_A577::func_0856(var_07);
			var_07 thread lib_A577::func_38E9(self);
			if(isdefined(self.var_7929))
			{
				var_07.var_1300 = self.var_7929;
			}

			param_00.var_8B4 = var_07;
			param_00 notify("got_ai");
			self waittill("spawn_died",var_09,var_08);
			if(var_04 > 2)
			{
				var_04 = randomint(4) + 2;
			}
			else
			{
				var_04 = 0.5 + randomfloat(0.5);
			}
		}

		if(var_09)
		{
			lib_A577::func_A0E8(var_05);
			continue;
		}

		if(lib_A577::func_6D87(var_08 || param_01,param_00.var_8B4))
		{
			var_03--;
		}

		if(!param_02)
		{
			lib_A577::func_A0F8();
		}
	}

	self delete();
}

//Function Number: 134
lib_A577::func_A0CE(param_00)
{
	self endon("death");
	param_00 waittill("death");
}

//Function Number: 135
lib_A577::func_0856(param_00)
{
	var_01 = self.targetname;
	if(!isdefined(level.var_89C8[var_01]))
	{
		level.var_89C8[var_01] = spawnstruct();
		level.var_89C8[var_01] lib_A59A::func_7DF2(0);
		level.var_89C8[var_01].var_93EC = 0;
	}

	if(!isdefined(self.var_7E1))
	{
		self.var_7E1 = 1;
		level.var_89C8[var_01].var_93EC++;
	}

	level.var_89C8[var_01].count++;
	lib_A577::func_A0CE(param_00);
	level.var_89C8[var_01].count--;
	if(!isdefined(self))
	{
		level.var_89C8[var_01].var_93EC--;
	}

	if(level.var_89C8[var_01].var_93EC)
	{
		if(level.var_89C8[var_01].count / level.var_89C8[var_01].var_93EC < 0.32)
		{
			level.var_89C8[var_01] notify("waveReady");
		}
	}
}

//Function Number: 136
lib_A577::func_273B(param_00)
{
	self endon("debug_stop");
	self endon("death");
	wait(0.05);
}

//Function Number: 137
lib_A577::func_A0F8()
{
	var_00 = self.targetname;
	if(level.var_89C8[var_00].count)
	{
		level.var_89C8[var_00] waittill("waveReady");
	}
}

//Function Number: 138
lib_A577::func_6D87(param_00,param_01)
{
	if(param_00)
	{
		return 1;
	}

	if(isdefined(param_01) && isdefined(param_01.var_2E6))
	{
		var_02 = param_01.var_2E6;
	}
	else
	{
		var_02 = self.var_2E6;
	}

	if(distance(level.var_31D.var_2E6,var_02) < 700)
	{
		return 1;
	}

	return bullettracepassed(level.var_31D geteye(),param_01 geteye(),0,undefined);
}

//Function Number: 139
lib_A577::func_A0E8(param_00)
{
	self endon("flood_begin");
	param_00 = param_00 * 0.75;
	while(distance(level.var_31D.var_2E6,self.var_2E6) > param_00)
	{
		wait(1);
	}
}

//Function Number: 140
lib_A577::func_38E9(param_00)
{
	thread lib_A577::func_38EA();
	self waittill("death",var_01);
	var_02 = isalive(var_01) && isplayer(var_01);
	if(!var_02 && isdefined(var_01) && var_01.classname == "worldspawn")
	{
		var_02 = 1;
	}

	var_03 = !isdefined(self);
	param_00 notify("spawn_died",var_03,var_02);
}

//Function Number: 141
lib_A577::func_38EA()
{
	if(isdefined(self.var_7A3A))
	{
		return;
	}

	self endon("death");
	var_00 = getnode(self.target,"targetname");
	if(isdefined(var_00))
	{
		self method_81A5(var_00);
	}
	else
	{
		var_00 = getent(self.target,"targetname");
		if(isdefined(var_00))
		{
			self method_81A6(var_00.var_2E6);
		}
	}

	if(isdefined(level.var_36AA))
	{
		self.var_2FB = level.var_36AA;
		self.var_2FC = level.var_5A2D;
	}

	if(isdefined(var_00.radius) && var_00.radius >= 0)
	{
		self.var_1C7 = var_00.radius;
	}
	else
	{
		self.var_1C7 = 256;
	}

	self waittill("goal");
	while(isdefined(var_00.target))
	{
		var_01 = getnode(var_00.target,"targetname");
		if(isdefined(var_01))
		{
			var_00 = var_01;
		}
		else
		{
			break;
		}

		self method_81A5(var_00);
		if(lib_A577::func_6120(var_00))
		{
			self.var_1C7 = var_00.radius;
		}
		else
		{
			self.var_1C7 = 256;
		}

		self waittill("goal");
	}

	if(isdefined(self.var_39B))
	{
		if(self.var_39B == "delete")
		{
			self method_8052();
			return;
		}
	}

	if(isdefined(var_00.target))
	{
		var_02 = getent(var_00.target,"targetname");
		if(isdefined(var_02) && var_02.code_classname == "misc_mgturret" || var_02.code_classname == "misc_turret")
		{
			self method_81A5(var_00);
			self.var_1C7 = 4;
			self waittill("goal");
			if(!isdefined(self.var_79E4))
			{
				self.var_1C7 = level.var_277F;
			}

			lib_A577::func_9BC8(var_02);
		}
	}

	if(isdefined(self.var_39B))
	{
		if(isdefined(self.var_7A7E))
		{
			if(self.var_7A7E == "furniture_push")
			{
				thread lib_A577::func_3B0D();
			}
		}

		if(self.var_39B == "hide")
		{
			thread lib_A59A::func_7DD9(0);
			return;
		}
	}

	if(!isdefined(self.var_79E4) && !isdefined(self method_81AA()))
	{
		self.var_1C7 = level.var_277F;
	}
}

//Function Number: 142
lib_A577::func_3B0D()
{
	var_00 = getent(self.target,"targetname").var_2E6;
	common_scripts\utility::play_sound_in_space("furniture_slide",var_00);
	wait(0.9);
	if(isdefined(level.var_A2FA))
	{
		common_scripts\utility::play_sound_in_space(common_scripts\utility::random(level.var_A2FA),var_00);
	}
}

//Function Number: 143
lib_A577::func_3A91()
{
	waittillframeend;
	var_00 = getentarray(self.target,"targetname");
	if(!var_00.size)
	{
		var_01 = getnode(self.target,"targetname");
		for(;;)
		{
			self waittill("trigger");
			if(isdefined(level.var_55A0) && level.var_55A0 == self)
			{
				wait(0.5);
				continue;
			}

			if(!lib_A577::func_62FC())
			{
				wait(0.5);
				continue;
			}

			level notify("new_friendly_trigger");
			level.var_55A0 = self;
			var_02 = !isdefined(self.var_7955) || self.var_7955 == 0;
			lib_A577::func_7FB6(var_01,var_02);
		}
	}

	for(;;)
	{
		self waittill("trigger");
		while(level.var_31D istouching(self))
		{
			wait(0.05);
		}

		if(!lib_A577::func_62FC())
		{
			wait(0.05);
			continue;
		}

		if(isdefined(level.var_55A0) && level.var_55A0 == self)
		{
			continue;
		}

		level notify("new_friendly_trigger");
		level.var_55A0 = self;
		common_scripts\utility::array_thread(var_00,::lib_A577::func_3ABC);
		wait(0.5);
	}
}

//Function Number: 144
lib_A577::func_62FC()
{
	var_00 = 1;
	if(isdefined(self.var_7A84))
	{
		var_00 = 0;
		for(var_01 = 0;var_01 < level.var_71A.size;var_01++)
		{
			if(!issubstr(self.var_7A84,level.var_71A[var_01]))
			{
				continue;
			}

			var_00 = 1;
			break;
		}

		if(!var_00)
		{
			return 0;
		}
	}

	if(!isdefined(self.var_7A85))
	{
		return var_00;
	}

	var_02 = 0;
	for(var_01 = 0;var_01 < level.var_4C0F.size;var_01++)
	{
		if(!issubstr(self.var_7A85,level.var_4C0F[var_01]))
		{
			continue;
		}

		var_02++;
	}

	var_03 = strtok(self.var_7A85," ");
	return var_02 == var_03.size;
}

//Function Number: 145
lib_A577::func_3ABC(param_00)
{
	level endon("new_friendly_trigger");
	self waittill("trigger");
	param_00 = getnode(self.target,"targetname");
	var_01 = !isdefined(self.var_7955) || self.var_7955 == 0;
	lib_A577::func_7FB6(param_00,var_01);
}

//Function Number: 146
lib_A577::func_A0CB()
{
	self endon("death");
	var_00 = self.var_7981;
	while(self.count)
	{
		self waittill("spawned",var_01);
		var_01 thread lib_A577::func_2654(var_00);
	}
}

//Function Number: 147
lib_A577::func_2654(param_00)
{
	level.var_266A[param_00]++;
	self waittill("death");
	level.var_266A[param_00]--;
	level notify("spawner_expired" + param_00);
}

//Function Number: 148
lib_A577::func_2655()
{
	var_00 = self.var_7981;
	level.var_266A[var_00]++;
	var_01 = self.var_2E6;
	lib_A577::func_A0CB();
	level notify("spawner dot" + var_01);
	level.var_266A[var_00]--;
	level notify("spawner_expired" + var_00);
}

//Function Number: 149
lib_A577::func_3A92()
{
	var_00 = getentarray("friendly_chain_on_death","targetname");
	var_01 = function_00D8();
	level.var_266A = [];
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(!isdefined(var_01[var_02].var_7981))
		{
			continue;
		}

		var_03 = var_01[var_02].var_7981;
		if(!isdefined(level.var_266A[var_03]))
		{
			level.var_266A[var_03] = 0;
		}

		var_01[var_02] thread lib_A577::func_2655();
	}

	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		if(!isdefined(var_00[var_02].var_7981))
		{
			return;
		}

		var_00[var_02] thread lib_A577::func_3A93();
	}
}

//Function Number: 150
lib_A577::func_3A93()
{
	while(level.var_266A[self.var_7981] > 0)
	{
		level waittill("spawner_expired" + self.var_7981);
	}

	level endon("start_chain");
	var_00 = getnode(self.target,"targetname");
	for(;;)
	{
		self waittill("trigger");
		lib_A577::func_7FB6(var_00,1);
		iprintlnbold("Area secured, move up!");
		wait(5);
	}
}

//Function Number: 151
lib_A577::func_7FB6(param_00,param_01)
{
	level notify("new_escort_trigger");
	level notify("new_escort_debug");
	level notify("start_chain",param_01);
}

//Function Number: 152
lib_A577::func_3A94()
{
	level.var_3AB8 = [];
	level.var_3AB9 = [];
	common_scripts\utility::array_thread(getentarray("friendlychain","targetname"),::lib_A577::func_3A91);
}

//Function Number: 153
lib_A577::func_9A6D()
{
	var_00 = [];
	var_01 = [];
	for(var_02 = 0;var_02 < level.var_3AB8.size;var_02++)
	{
		var_00[var_00.size] = level.var_3AB8[var_02];
		var_01[var_01.size] = level.var_3AB9[var_02];
	}

	level.var_3AB8 = var_00;
	level.var_3AB9 = var_01;
	if(lib_A577::func_071E())
	{
		return;
	}

	common_scripts\utility::flag_clear("spawning_friendlies");
}

//Function Number: 154
lib_A577::func_3FA3()
{
	return level.var_3AB8[level.var_3AB8.size - 1];
}

//Function Number: 155
lib_A577::func_071E()
{
	return level.var_3AB8.size > 0;
}

//Function Number: 156
lib_A577::func_3FA4()
{
	return level.var_3AB9[level.var_3AB9.size - 1];
}

//Function Number: 157
lib_A577::func_7F73(param_00,param_01)
{
	level.var_3AB8[level.var_3AB8.size] = param_00.var_2E6;
	level.var_3AB9[level.var_3AB9.size] = param_01;
	common_scripts\utility::flag_set("spawning_friendlies");
}

//Function Number: 158
lib_A577::func_27E4()
{
	self endon("death");
	self endon("leaveSquad");
	wait(0.5);
	self method_81A7(level.var_31D);
}

//Function Number: 159
lib_A577::func_8A10(param_00)
{
	self notify("stopTrigger");
	self endon("stopTrigger");
	self waittill("trigger");
	if(lib_A577::func_3FA4() != param_00)
	{
		return;
	}

	lib_A577::func_9A6D();
}

//Function Number: 160
lib_A577::func_3ABB(param_00)
{
	var_01 = getent(self.target,"targetname");
	for(;;)
	{
		self waittill("trigger");
		param_00 notify("friendly_wave_start",var_01);
		if(!isdefined(var_01.target))
		{
			continue;
		}
	}
}

//Function Number: 161
lib_A577::func_4252()
{
	var_00 = getentarray("info_volume","classname");
	level.var_2653 = [];
	level.var_4252 = [];
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_02 = var_00[var_01];
		if(isdefined(var_02.var_7981))
		{
			level.var_2653[var_02.var_7981] = var_02;
		}

		if(isdefined(var_02.var_79FE))
		{
			level.var_4252[var_02.var_79FE] = var_02;
		}
	}
}

//Function Number: 162
lib_A577::debugprint(param_00,param_01,param_02)
{
	if(1)
	{
		return;
	}

	var_03 = self getorigin();
	var_04 = 40 * sin(var_03[0] + var_03[1]) - 40;
	var_03 = (var_03[0],var_03[1],var_03[2] + var_04);
	level endon(param_01);
	self endon("new_color");
	if(!isdefined(param_02))
	{
		param_02 = (0,0.8,0.6);
	}

	var_05 = 0;
	for(;;)
	{
		var_05 = var_05 + 12;
		var_06 = sin(var_05) * 0.4;
		if(var_06 < 0)
		{
			var_06 = var_06 * -1;
		}

		var_06 = var_06 + 1;
		wait(0.05);
	}
}

//Function Number: 163
lib_A577::func_0956(param_00)
{
	level.var_54A[param_00] = spawnstruct();
	level.var_54A[param_00].var_949 = 0;
	level.var_54A[param_00].var_89C6 = 0;
	level.var_54A[param_00].var_8B4 = [];
	level.var_54A[param_00].var_89C7 = [];
}

//Function Number: 164
lib_A577::func_095A(param_00)
{
	self endon("death");
	self.var_275F = 0;
	param_00.var_89C6++;
	thread lib_A577::func_0958(param_00);
	thread lib_A577::func_0959(param_00);
	while(self.count)
	{
		self waittill("spawned",var_01);
		if(lib_A59A::func_88EB(var_01))
		{
			continue;
		}

		var_01 thread lib_A577::func_0957(param_00);
	}

	waittillframeend;
	if(self.var_275F)
	{
		return;
	}

	self.var_275F = 1;
	param_00.var_89C6--;
}

//Function Number: 165
lib_A577::func_0958(param_00)
{
	self waittill("death");
	if(self.var_275F)
	{
		return;
	}

	param_00.var_89C6--;
}

//Function Number: 166
lib_A577::func_0959(param_00)
{
	self endon("death");
	self waittill("emptied spawner");
	waittillframeend;
	if(self.var_275F)
	{
		return;
	}

	self.var_275F = 1;
	param_00.var_89C6--;
}

//Function Number: 167
lib_A577::func_0957(param_00)
{
	param_00.var_949++;
	param_00.var_8B4[param_00.var_8B4.size] = self;
	if(isdefined(self.var_7983))
	{
		lib_A577::func_A0CD();
	}
	else
	{
		self waittill("death");
	}

	param_00.var_949--;
}

//Function Number: 168
lib_A577::func_1A42(param_00)
{
	var_01 = strtok(param_00.script_linkto," ");
	var_02 = [];
	var_03 = [];
	for(var_04 = 0;var_04 < var_01.size;var_04++)
	{
		var_05 = var_01[var_04];
		var_06 = getent(var_05,"script_linkname");
		if(isdefined(var_06))
		{
			var_02 = common_scripts\utility::add_to_array(var_02,var_06);
			continue;
		}

		var_07 = getnode(var_05,"script_linkname");
		if(!isdefined(var_07))
		{
			continue;
		}

		var_03 = common_scripts\utility::add_to_array(var_03,var_07);
	}

	param_00 waittill("trigger");
	var_03 = common_scripts\utility::array_randomize(var_03);
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_03[var_04].claimed = 0;
	}

	var_08 = 0;
	for(var_04 = 0;var_04 < var_02.size;var_04++)
	{
		var_09 = var_02[var_04];
		if(!isdefined(var_09))
		{
			continue;
		}

		if(isdefined(var_09.var_7AC6))
		{
			continue;
		}

		while(isdefined(var_03[var_08].var_39B) && var_03[var_08].var_39B == "dont_spawn")
		{
			var_08++;
		}

		var_09.var_2E6 = var_03[var_08].var_2E6;
		var_09.var_41 = var_03[var_08].var_41;
		var_09 lib_A59A::func_798(::lib_A577::func_1E1C,var_03[var_08]);
		var_08++;
	}

	common_scripts\utility::array_thread(var_02,::lib_A59A::func_798,::lib_A577::func_1A40);
	common_scripts\utility::array_thread(var_02,::lib_A59A::func_798,::lib_A577::func_5F3E,var_03);
	common_scripts\utility::array_thread(var_02,::lib_A59A::func_88BD);
}

//Function Number: 169
lib_A577::func_1A40()
{
	self.var_1C7 = 8;
	self.var_180 = 1;
}

//Function Number: 170
lib_A577::func_5F3E(param_00)
{
	self endon("death");
	var_01 = 0;
	for(;;)
	{
		if(!isalive(self.enemy))
		{
			self waittill("enemy");
			var_01 = 0;
			continue;
		}

		if(isplayer(self.enemy))
		{
			if(self.enemy lib_A59A::func_32D7("player_has_red_flashing_overlay") || common_scripts\utility::flag("player_flashed"))
			{
				self.var_180 = 0;
				for(;;)
				{
					self.var_1C7 = 180;
					self method_81A6(level.var_31D.var_2E6);
					wait(1);
				}

				return;
			}
		}

		if(var_01)
		{
			if(self method_81BE(self.enemy))
			{
				wait(0.05);
				continue;
			}

			var_01 = 0;
		}
		else
		{
			if(self method_81BE(self.enemy))
			{
				var_01 = 1;
			}

			wait(0.05);
			continue;
		}

		if(randomint(3) > 0)
		{
			var_02 = lib_A577::func_376E(param_00);
			if(isdefined(var_02))
			{
				lib_A577::func_1E1C(var_02,self.var_1E1F);
				self waittill("goal");
			}
		}
	}
}

//Function Number: 171
lib_A577::func_1E1C(param_00,param_01)
{
	self method_81A5(param_00);
	self.var_1E1F = param_00;
	param_00.claimed = 1;
	if(isdefined(param_01))
	{
		param_01.claimed = 0;
	}
}

//Function Number: 172
lib_A577::func_376E(param_00)
{
	for(var_01 = 0;var_01 < param_00.size;var_01++)
	{
		if(param_00[var_01].claimed)
		{
			continue;
		}
		else
		{
			return param_00[var_01];
		}
	}

	return undefined;
}

//Function Number: 173
lib_A577::func_38F2(param_00)
{
	var_01 = getentarray(param_00.target,"targetname");
	common_scripts\utility::array_thread(var_01,::lib_A577::func_38EE);
	param_00 waittill("trigger");
	var_01 = getentarray(param_00.target,"targetname");
	common_scripts\utility::array_thread(var_01,::lib_A577::func_38F1,param_00);
}

//Function Number: 174
lib_A577::func_38EE(param_00)
{
}

//Function Number: 175
lib_A577::func_97D3(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	return isdefined(param_00.var_7AB1);
}

//Function Number: 176
lib_A577::func_99DD(param_00)
{
	var_01 = getent(param_00.target,"targetname");
	waittillframeend;
	var_02 = getentarray(var_01.target,"targetname");
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_02[var_03].var_7A3A = 1;
		var_02[var_03] lib_A59A::func_798(::lib_A577::func_9FE9,var_01);
	}

	param_00 waittill("trigger");
	var_02 = getentarray(var_01.target,"targetname");
	common_scripts\utility::array_thread(var_02,::lib_A59A::func_88BD);
}

//Function Number: 177
lib_A577::func_9FE9(param_00)
{
	param_00 endon("death");
	self endon("death");
	self.var_1C7 = 8;
	param_00 waittill("trigger");
	thread lib_A577::func_423E();
}

//Function Number: 178
lib_A577::func_38F1(param_00)
{
	if(!isdefined(level.var_8938) || isspawner(self))
	{
		self endon("death");
	}

	self notify("stop current floodspawner");
	self endon("stop current floodspawner");
	if(lib_A577::func_506F())
	{
		lib_A577::func_706D(param_00);
		return;
	}

	var_01 = lib_A577::func_97D3(param_00);
	lib_A59A::script_delay();
	if(isdefined(level.var_8938))
	{
		if(!isspawner(self))
		{
			self.count = 1;
		}
	}

	while(self.count > 0)
	{
		while(var_01 && !level.var_31D istouching(param_00))
		{
			wait(0.5);
		}

		var_02 = isdefined(self.var_7ADB) && common_scripts\utility::flag("_stealth_enabled") && !common_scripts\utility::flag("_stealth_spotted");
		var_03 = self;
		if(isdefined(level.var_8938))
		{
			if(!isspawner(self))
			{
				var_03 = lib_A577::func_3E66(self,1);
			}
		}

		if(isdefined(self.var_79E6))
		{
			var_04 = var_03 method_8094(var_02);
		}
		else
		{
			var_04 = var_03 method_8093(var_02);
		}

		if(lib_A59A::func_88EB(var_04))
		{
			wait(2);
			continue;
		}

		if(isdefined(self.var_7975))
		{
			if(self.var_7975 == "heat")
			{
				var_04 lib_A59A::func_30C8();
			}

			if(self.var_7975 == "cqb")
			{
				var_04 lib_A59A::func_30AF();
			}
		}

		var_04 thread lib_A577::func_72FF(self);
		var_04 thread lib_A577::func_3515(param_00);
		if(isdefined(var_04) && !isdefined(var_04.targetname))
		{
			if(isdefined(self.targetname))
			{
				var_04.targetname = self.targetname + "_AI";
			}
		}

		var_04 waittill("death",var_05);
		if(!lib_A577::func_6BF0(var_04,var_05))
		{
			self.count++;
		}
		else if(isdefined(level.var_6CF))
		{
			if(isdefined(level.var_6D0) && var_05 == level.var_6D0)
			{
				if(randomint(2) == 0)
				{
					self.count++;
				}
			}
		}

		if(!isdefined(var_04))
		{
			continue;
		}

		if(!lib_A59A::func_7B1A())
		{
			wait(randomfloatrange(5,9));
		}
	}
}

//Function Number: 179
lib_A577::func_38F0()
{
	self notify("stop current floodspawner");
}

//Function Number: 180
lib_A577::func_6BF0(param_00,param_01)
{
	if(isdefined(self.var_79E0))
	{
		if(self.var_79E0)
		{
			return 1;
		}
	}

	if(!isdefined(param_00))
	{
		return 0;
	}

	if(isalive(param_01))
	{
		if(isplayer(param_01))
		{
			return 1;
		}

		if(distance(param_01.var_2E6,level.var_31D.var_2E6) < 200)
		{
			return 1;
		}
	}
	else if(isdefined(param_01))
	{
		if(param_01.classname == "worldspawn")
		{
			return 0;
		}

		if(distance(param_01.var_2E6,level.var_31D.var_2E6) < 200)
		{
			return 1;
		}
	}

	if(distance(param_00.var_2E6,level.var_31D.var_2E6) < 200)
	{
		return 1;
	}

	return bullettracepassed(level.var_31D geteye(),param_00 geteye(),0,undefined);
}

//Function Number: 181
lib_A577::func_506F()
{
	if(!isdefined(self.target))
	{
		return 0;
	}

	var_00 = getentarray(self.target,"targetname");
	if(!var_00.size)
	{
		return 0;
	}

	return issubstr(var_00[0].classname,"actor");
}

//Function Number: 182
lib_A577::func_706C(param_00)
{
	param_00.var_88B7 waittill("death");
	self notify("death_report");
}

//Function Number: 183
lib_A577::func_706D(param_00)
{
	self endon("death");
	var_01 = lib_A577::func_97D3(param_00);
	lib_A59A::script_delay();
	if(var_01)
	{
		while(!level.var_31D istouching(param_00))
		{
			wait(0.05);
		}
	}

	var_02 = getentarray(self.target,"targetname");
	self.var_89C7 = 0;
	common_scripts\utility::array_thread(var_02,::lib_A577::func_706E,self);
	var_04 = common_scripts\utility::array_randomize(var_02);
	while(var_04.size > 0)
	{
		if(self.count <= 0)
		{
			return;
		}

		var_05 = common_scripts\utility::array_first(var_04);
		var_05 lib_A59A::func_7DF2(1);
		var_06 = var_05 lib_A59A::func_88BD();
		if(lib_A59A::func_88EB(var_06))
		{
			wait(0.05);
			continue;
		}

		var_04 = common_scripts\utility::array_remove(var_04,var_05);
		self.count--;
		var_05.var_88B7 = var_06;
		var_06 thread lib_A577::func_72FF(self);
		var_06 thread lib_A577::func_3515(param_00);
		thread lib_A577::func_706C(var_05);
	}

	while(self.count > 0)
	{
		self waittill("death_report");
		lib_A59A::func_7B1A();
		var_04 = common_scripts\utility::array_randomize(var_02);
		while(var_04.size > 0)
		{
			wait(0.05);
			if(!var_02.size)
			{
				if(isdefined(self))
				{
					self delete();
				}

				return;
			}

			var_04 = common_scripts\utility::array_removeundefined(var_04);
			if(var_04.size == 0)
			{
				continue;
			}

			var_05 = common_scripts\utility::array_first(var_04);
			if(isalive(var_05.var_88B7))
			{
				var_04 = common_scripts\utility::array_remove(var_04,var_05);
				continue;
			}

			if(isdefined(var_05.target))
			{
				self.target = var_05.target;
			}
			else
			{
				self.target = undefined;
			}

			var_06 = lib_A59A::func_88BD();
			if(lib_A59A::func_88EB(var_06))
			{
				continue;
			}

			var_04 = common_scripts\utility::array_remove(var_04,var_05);
			var_06 thread lib_A577::func_72FF(self);
			var_06 thread lib_A577::func_3515(param_00);
			var_05.var_88B7 = var_06;
			thread lib_A577::func_706C(var_05);
			if(self.count <= 0)
			{
				return;
			}
		}
	}
}

//Function Number: 184
lib_A577::func_706E(param_00)
{
	param_00 endon("death");
	param_00.var_89C7++;
	self waittill("death");
	param_00.var_89C7--;
	if(!param_00.var_89C7)
	{
		param_00 delete();
	}
}

//Function Number: 185
lib_A577::func_3515(param_00)
{
	if(isdefined(self.var_79E4))
	{
		return;
	}

	var_01 = level.var_277F;
	if(isdefined(param_00))
	{
		if(isdefined(param_00.script_radius))
		{
			if(param_00.script_radius == -1)
			{
				return;
			}

			var_01 = param_00.script_radius;
		}
	}

	if(isdefined(self.var_79E4))
	{
		return;
	}

	self endon("death");
	self waittill("goal");
	self.var_1C7 = var_01;
}

//Function Number: 186
lib_A577::func_2F42()
{
	self endon("death");
	wait(95);
	self notify("timeout");
}

//Function Number: 187
lib_A577::func_2F43()
{
	self endon("timeout");
	thread lib_A577::func_2F42();
	self waittill("trigger");
	lib_A59A::func_1C72(1);
}

//Function Number: 188
lib_A577::func_9494(param_00)
{
	wait(0.05);
}

//Function Number: 189
lib_A577::func_84BB()
{
}

//Function Number: 190
lib_A577::func_7115(param_00)
{
	param_00 waittill("trigger");
	var_01 = getentarray(param_00.target,"targetname");
	if(!var_01.size)
	{
		return;
	}

	var_02 = common_scripts\utility::random(var_01);
	var_01 = [];
	var_01[var_01.size] = var_02;
	if(isdefined(var_02.script_linkto))
	{
		var_03 = strtok(var_02.script_linkto," ");
		for(var_04 = 0;var_04 < var_03.size;var_04++)
		{
			var_01[var_01.size] = getent(var_03[var_04],"script_linkname");
		}
	}

	waittillframeend;
	common_scripts\utility::array_thread(var_01,::lib_A59A::func_798,::lib_A577::func_14C1);
	common_scripts\utility::array_thread(var_01,::lib_A59A::func_88BD);
}

//Function Number: 191
lib_A577::func_14C1()
{
	if(isdefined(self.var_79E4))
	{
		return;
	}

	self endon("death");
	self waittill("reached_path_end");
	if(!isdefined(self method_81AA()))
	{
		self.var_1C7 = level.var_277F;
	}
}

//Function Number: 192
lib_A577::func_62EA(param_00)
{
	var_01 = param_00 lib_A59A::func_3EA1();
	common_scripts\utility::flag_init(var_01);
	while(level.var_266A[param_00.var_7981] > 0)
	{
		level waittill("spawner_expired" + param_00.var_7981);
	}

	common_scripts\utility::flag_set(var_01);
}

//Function Number: 193
lib_A577::func_803D()
{
	self endon("death");
	waittillframeend;
	self.var_5087 = isplayer(self);
	self.var_3339 = [];
	self.var_333A = [];
	for(var_00 = 0;var_00 < level.var_333C;var_00++)
	{
		self.var_3339[var_00] = 0;
	}
}

//Function Number: 194
lib_A577::func_08BA()
{
	level.var_8BA[level.unique_id] = self;
	self waittill("death");
	waittillframeend;
	level.var_8BA[level.unique_id] = undefined;
}

//Function Number: 195
lib_A577::func_89BB(param_00)
{
	var_01 = param_00 method_803D();
	var_01 method_8115(#animtree);
	if(var_01.weapon != "none")
	{
		var_02 = getweaponmodel(var_01.weapon);
		var_01 attach(var_02,"tag_weapon_right");
		var_01 lib_A59A::func_9AE6(var_01.weapon);
	}

	var_01.spawner = param_00;
	var_01.var_2E3E = isdefined(param_00.var_39B) && param_00.var_39B == "drone_delete_on_unload";
	param_00 notify("drone_spawned",var_01);
	return var_01;
}

//Function Number: 196
lib_A577::func_89C3(param_00)
{
	if(!isdefined(param_00.spawner))
	{
	}

	param_00.spawner.count = param_00.spawner.count + 1;
	var_01 = param_00.spawner;
	var_01.count++;
	var_02 = var_01.var_2E6;
	var_03 = var_01.var_41;
	var_01.var_2E6 = param_00.var_2E6;
	var_01.var_41 = param_00.var_41;
	var_04 = var_01 method_8094();
	var_05 = lib_A59A::func_88EB(var_04);
	if(var_05)
	{
		wait(0.05);
		var_04 = var_01 method_8094();
	}

	var_04.spawner = var_01;
	var_04 setmodel(param_00.model);
	var_04 codescripts\character::setheadmodel(param_00.headmodel);
	var_04.var_9CDF = param_00.var_9CDF;
	var_04.var_9D13 = param_00.var_9D13;
	var_04.var_8B03 = param_00.var_8B03;
	var_04.var_39AE = param_00.var_39AE;
	var_04 method_83BF(param_00);
	var_01.var_2E6 = var_02;
	var_01.var_41 = var_03;
	param_00 delete();
	var_06 = var_04.var_2FD;
	return var_04;
}

//Function Number: 197
lib_A577::func_89C2(param_00)
{
	var_01 = param_00.spawner;
	var_02 = var_01.var_2E6;
	var_03 = var_01.var_41;
	var_01.var_2E6 = param_00.var_2E6;
	var_01.var_41 = param_00.var_41;
	var_04 = var_01 lib_A59A::func_2F28();
	if(!isdefined(var_04))
	{
	}

	var_04 setmodel(param_00.model);
	var_04 codescripts\character::setheadmodel(param_00.headmodel);
	var_04.var_9CDF = param_00.var_9CDF;
	var_04.var_9D13 = param_00.var_9D13;
	var_04.var_8B03 = param_00.var_8B03;
	var_04.var_39AE = param_00.var_39AE;
	var_04 method_83BF(param_00);
	var_01.var_2E6 = var_02;
	var_01.var_41 = var_03;
	param_00 delete();
	var_04 notify("drone_stop");
	return var_04;
}

//Function Number: 198
lib_A577::func_263A()
{
	self waittill("death",var_00,var_01,var_02);
	if(!isdefined(self))
	{
		return;
	}

	if(!self method_813D())
	{
		return;
	}

	if(!isdefined(var_00))
	{
		return;
	}

	if(!isplayer(var_00))
	{
		return;
	}

	if(isdefined(self.var_5518))
	{
		var_01 = self.var_5518;
	}
}

//Function Number: 199
lib_A577::func_263B(param_00)
{
}

//Function Number: 200
lib_A577::func_0789()
{
	var_00 = self.var_7AAD;
	var_01 = self.var_7AAE;
	if(!isdefined(level.var_5379[var_00]))
	{
		level.var_5379[var_00] = [];
	}

	if(!isdefined(level.var_5379[var_00][var_01]))
	{
		level.var_5379[var_00][var_01] = [];
	}

	level.var_5379[var_00][var_01][self.var_3582] = self;
}

//Function Number: 201
lib_A577::func_07B0()
{
	var_00 = self.var_7AC9;
	var_01 = self.var_7ACA;
	if(!isdefined(level.var_8901[var_00]))
	{
		level.var_8901[var_00] = [];
	}

	if(!isdefined(level.var_8901[var_00][var_01]))
	{
		level.var_8901[var_00][var_01] = [];
	}

	level.var_8901[var_00][var_01][self.var_3582] = self;
}

//Function Number: 202
lib_A577::func_8C12()
{
	self endon("death");
	self.var_2B0D = 1;
	wait(3);
	self.var_2B0D = 0;
}

//Function Number: 203
lib_A577::deathtime()
{
	self endon("death");
	wait(self.var_7985);
	wait(randomfloat(10));
	self method_8052();
}