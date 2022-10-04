/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42388.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 86
 * Decompile Time: 32 ms
 * Timestamp: 4/20/2022 8:23:25 PM
*******************************************************************/

//Function Number: 1
lib_A594::func_3DC8()
{
	var_00 = [];
	var_00["trigger_multiple_nobloodpool"] = ::lib_A594::func_97C3;
	var_00["trigger_multiple_flag_set"] = ::lib_A594::func_9787;
	var_00["trigger_multiple_flag_clear"] = ::lib_A594::func_9785;
	var_00["trigger_multiple_sun_off"] = ::lib_A594::func_97FA;
	var_00["trigger_multiple_sun_on"] = ::lib_A594::func_97FB;
	var_00["trigger_use_flag_set"] = ::lib_A594::func_9787;
	var_00["trigger_use_flag_clear"] = ::lib_A594::func_9785;
	var_00["trigger_multiple_flag_set_touching"] = ::lib_A594::func_978C;
	var_00["trigger_multiple_flag_lookat"] = ::lib_A594::func_97A9;
	var_00["trigger_multiple_flag_looking"] = ::lib_A594::func_97AB;
	var_00["trigger_multiple_no_prone"] = ::lib_A594::func_97C2;
	var_00["trigger_multiple_no_crouch_or_prone"] = ::lib_A594::func_97C1;
	var_00["trigger_multiple_compass"] = ::lib_A594::func_97B7;
	var_00["trigger_multiple_specialops_flag_set"] = ::lib_A594::func_978A;
	var_00["trigger_multiple_fx_volume"] = ::lib_A594::func_97BB;
	var_00["trigger_multiple_fx_fxzone"] = ::lib_A594::func_978C;
	var_00["trigger_multiple_light_sunshadow"] = ::lib_A545::sun_shadow_trigger;
	if(!lib_A59A::func_5053())
	{
		var_00["trigger_multiple_autosave"] = ::lib_A50A::func_9751;
		var_00["trigger_multiple_spawn"] = ::lib_A577::func_97F1;
		var_00["trigger_multiple_spawn_reinforcement"] = ::lib_A577::func_97F2;
	}

	var_00["trigger_multiple_slide"] = ::lib_A594::func_97EE;
	var_00["trigger_multiple_statscheckpoint"] = ::lib_A594::func_97F7;
	var_00["trigger_multiple_fog"] = ::lib_A594::func_9792;
	var_00["trigger_multiple_depthoffield"] = ::lib_A594::func_97B8;
	var_00["trigger_multiple_tessellationcutoff"] = ::lib_A594::func_97BE;
	var_00["trigger_damage_player_flag_set"] = ::lib_A594::func_9763;
	var_00["trigger_multiple_visionset"] = ::lib_A594::func_97BF;
	var_00["trigger_multiple_sunflare"] = ::lib_A594::func_97BD;
	var_00["trigger_multiple_glass_break"] = ::lib_A594::func_979A;
	var_00["trigger_radius_glass_break"] = ::lib_A594::func_979A;
	var_00["trigger_multiple_friendly_respawn"] = ::lib_A594::func_9795;
	var_00["trigger_multiple_enemy_respawn"] = ::lib_A594::func_976C;
	var_00["trigger_multiple_friendly_stop_respawn"] = ::lib_A594::func_9796;
	var_00["trigger_multiple_enemy_stop_respawn"] = ::lib_A594::func_976D;
	var_00["trigger_multiple_physics"] = ::lib_A594::func_97CA;
	var_00["trigger_multiple_fx_watersheeting"] = ::lib_A594::func_97BC;
	var_00["trigger_multiple_fx_wakevolume"] = ::lib_A594::func_9807;
	var_00["trigger_multiple_fx_fallingwatervolume"] = ::lib_A594::func_9784;
	return var_00;
}

//Function Number: 2
lib_A594::func_97BC(param_00)
{
	var_01 = 3;
	if(isdefined(param_00.script_duration))
	{
		var_01 = param_00.script_duration;
	}

	for(;;)
	{
		param_00 waittill("trigger",var_02);
		if(isplayer(var_02))
		{
			var_02 setwatersheeting(1,var_01);
			wait(var_01 * 0.2);
		}
	}
}

//Function Number: 3
lib_A594::func_3DC9()
{
	var_00 = [];
	var_00["friendly_wave"] = ::lib_A577::func_3A8C;
	var_00["friendly_wave_off"] = ::lib_A577::func_3A8C;
	var_00["friendly_mgTurret"] = ::lib_A577::func_3A6E;
	if(!lib_A59A::func_5053())
	{
		var_00["camper_spawner"] = ::lib_A577::func_1A42;
		var_00["flood_spawner"] = ::lib_A577::func_38F2;
		var_00["trigger_spawner"] = ::lib_A577::func_97F1;
		var_00["trigger_autosave"] = ::lib_A50A::func_9751;
		var_00["trigger_spawngroup"] = ::lib_A594::func_97F4;
		var_00["two_stage_spawner"] = ::lib_A577::func_99DD;
		var_00["trigger_vehicle_spline_spawn"] = ::lib_A594::func_9804;
		var_00["trigger_vehicle_spawn"] = ::lib_A594::func_9803;
		var_00["trigger_vehicle_getin_spawn"] = ::lib_A594::func_9802;
		var_00["random_spawn"] = ::lib_A577::func_7115;
	}

	var_00["autosave_now"] = ::lib_A50A::func_1150;
	var_00["trigger_autosave_tactical"] = ::lib_A50A::func_9754;
	var_00["trigger_autosave_stealth"] = ::lib_A50A::func_9753;
	var_00["trigger_unlock"] = ::lib_A594::func_9800;
	var_00["trigger_lookat"] = ::lib_A594::func_97A9;
	var_00["trigger_looking"] = ::lib_A594::func_97AB;
	var_00["trigger_cansee"] = ::lib_A594::func_975D;
	var_00["autosave_immediate"] = ::lib_A50A::func_9752;
	var_00["flag_set"] = ::lib_A594::func_9787;
	if(lib_A59A::func_5009())
	{
		var_00["flag_set_coop"] = ::lib_A594::func_9788;
	}

	var_00["flag_set_player"] = ::lib_A594::func_9789;
	var_00["flag_unset"] = ::lib_A594::func_9785;
	var_00["flag_clear"] = ::lib_A594::func_9785;
	var_00["objective_event"] = ::lib_A577::func_62EA;
	var_00["friendly_respawn_trigger"] = ::lib_A594::func_9795;
	var_00["enemy_respawn_trigger"] = ::lib_A594::func_976C;
	var_00["radio_trigger"] = ::lib_A594::func_97D0;
	var_00["trigger_ignore"] = ::lib_A594::func_97A3;
	var_00["trigger_pacifist"] = ::lib_A594::func_97C9;
	var_00["trigger_delete"] = ::lib_A594::func_97FF;
	var_00["trigger_delete_on_touch"] = ::lib_A594::func_9766;
	var_00["trigger_off"] = ::lib_A594::func_97FF;
	var_00["trigger_outdoor"] = ::lib_A577::func_65B9;
	var_00["trigger_indoor"] = ::lib_A577::func_4C42;
	var_00["trigger_hint"] = ::lib_A594::func_979F;
	var_00["trigger_grenade_at_player"] = ::lib_A594::func_97FC;
	var_00["flag_on_cleared"] = ::lib_A594::func_9786;
	var_00["flag_set_touching"] = ::lib_A594::func_978C;
	var_00["delete_link_chain"] = ::lib_A594::func_9765;
	var_00["trigger_fog"] = ::lib_A594::func_9792;
	var_00["trigger_slide"] = ::lib_A594::func_97EE;
	var_00["trigger_stats"] = ::lib_A594::func_97F7;
	var_00["trigger_dooropen"] = ::lib_A594::func_9769;
	var_00["no_crouch_or_prone"] = ::lib_A594::func_97C1;
	var_00["no_prone"] = ::lib_A594::func_97C2;
	return var_00;
}

//Function Number: 4
lib_A594::func_4D50()
{
	var_00 = lib_A594::func_3DC8();
	var_01 = lib_A594::func_3DC9();
	foreach(var_05, var_03 in var_00)
	{
		var_04 = getentarray(var_05,"classname");
		common_scripts\utility::array_levelthread(var_04,var_03);
	}

	var_06 = getentarray("trigger_multiple","classname");
	var_07 = getentarray("trigger_radius","classname");
	var_04 = lib_A59A::func_CF2(var_06,var_07);
	var_08 = getentarray("trigger_disk","classname");
	var_04 = lib_A59A::func_CF2(var_04,var_08);
	var_09 = getentarray("trigger_once","classname");
	var_04 = lib_A59A::func_CF2(var_04,var_09);
	if(!lib_A59A::func_5053())
	{
		for(var_0A = 0;var_0A < var_04.size;var_0A++)
		{
			if(var_04[var_0A].spawnflags & 32)
			{
				thread lib_A577::func_97F1(var_04[var_0A]);
			}
		}
	}

	var_0B = 0;
	if(var_0B < 7)
	{
		switch(var_0B)
		{
			case 0:
				break;

			case 1:
				break;

			case 2:
				break;

			case 3:
				break;

			case 4:
				break;

			case 5:
				break;

			default:
				break;
		}
	}
}

//Function Number: 5
lib_A594::func_9762(param_00)
{
	var_01 = 1;
	if(var_01)
	{
		param_00 delete();
	}
}

//Function Number: 6
lib_A594::func_23E3()
{
}

//Function Number: 7
lib_A594::func_9763(param_00)
{
	var_01 = param_00 lib_A59A::func_3EA1();
	if(!isdefined(level.flag[var_01]))
	{
		common_scripts\utility::flag_init(var_01);
	}

	for(;;)
	{
		param_00 waittill("trigger",var_02);
		if(!isalive(var_02))
		{
			continue;
		}

		if(!isplayer(var_02))
		{
			continue;
		}

		param_00 lib_A59A::script_delay();
		common_scripts\utility::flag_set(var_01,var_02);
	}
}

//Function Number: 8
lib_A594::func_9785(param_00)
{
	var_01 = param_00 lib_A59A::func_3EA1();
	if(!isdefined(level.flag[var_01]))
	{
		common_scripts\utility::flag_init(var_01);
	}

	for(;;)
	{
		param_00 waittill("trigger");
		param_00 lib_A59A::script_delay();
		common_scripts\utility::flag_clear(var_01);
	}
}

//Function Number: 9
lib_A594::func_9786(param_00)
{
	var_01 = param_00 lib_A59A::func_3EA1();
	if(!isdefined(level.flag[var_01]))
	{
		common_scripts\utility::flag_init(var_01);
	}

	for(;;)
	{
		param_00 waittill("trigger");
		wait(1);
		if(param_00 lib_A594::func_39F3())
		{
			continue;
		}

		break;
	}

	common_scripts\utility::flag_set(var_01);
}

//Function Number: 10
lib_A594::func_39F3()
{
	var_00 = function_00D6("bad_guys");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_02 = var_00[var_01];
		if(!isalive(var_02))
		{
			continue;
		}

		if(var_02 istouching(self))
		{
			return 1;
		}

		wait(0.1);
	}

	var_00 = function_00D6("bad_guys");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_02 = var_00[var_01];
		if(var_02 istouching(self))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 11
lib_A594::func_9787(param_00)
{
	var_01 = param_00 lib_A59A::func_3EA1();
	if(!isdefined(level.flag[var_01]))
	{
		common_scripts\utility::flag_init(var_01);
	}

	for(;;)
	{
		param_00 waittill("trigger",var_02);
		param_00 lib_A59A::script_delay();
		common_scripts\utility::flag_set(var_01,var_02);
	}
}

//Function Number: 12
lib_A594::func_9788(param_00)
{
	var_01 = param_00 lib_A59A::func_3EA1();
	if(!isdefined(level.flag[var_01]))
	{
		common_scripts\utility::flag_init(var_01);
	}

	var_02 = [];
	for(;;)
	{
		param_00 waittill("trigger",var_03);
		if(!isplayer(var_03))
		{
			continue;
		}

		var_04 = [];
		var_04[var_04.size] = var_03;
		var_02 = lib_A59A::func_CF2(var_02,var_04);
		if(var_02.size == level.var_328.size)
		{
			break;
		}
	}

	param_00 lib_A59A::script_delay();
	common_scripts\utility::flag_set(var_01);
}

//Function Number: 13
lib_A594::func_978A(param_00)
{
	var_01 = param_00 lib_A59A::func_3EA1();
	if(!isdefined(level.flag[var_01]))
	{
		common_scripts\utility::flag_init(var_01);
	}

	param_00.var_6C2F = level.var_328;
	param_00 thread lib_A594::func_978B(var_01);
	for(;;)
	{
		param_00 waittill("trigger",var_02);
		param_00.var_6C2F = common_scripts\utility::array_remove(param_00.var_6C2F,var_02);
		if(param_00.var_6C2F.size)
		{
			continue;
		}

		param_00 lib_A59A::script_delay();
		common_scripts\utility::flag_set(var_01,var_02);
	}
}

//Function Number: 14
lib_A594::func_978B(param_00)
{
	for(;;)
	{
		level waittill(param_00);
		if(common_scripts\utility::flag(param_00))
		{
			self.var_6C2F = [];
			continue;
		}

		self.var_6C2F = level.var_328;
	}
}

//Function Number: 15
lib_A594::func_9795(param_00)
{
	param_00 endon("death");
	var_01 = getent(param_00.target,"targetname");
	var_02 = undefined;
	if(isdefined(var_01))
	{
		var_02 = var_01.var_2E6;
		var_01 delete();
	}
	else
	{
		var_01 = common_scripts\utility::getstruct(param_00.target,"targetname");
		var_02 = var_01.var_2E6;
	}

	for(;;)
	{
		param_00 waittill("trigger");
		lib_A512::func_2053(var_02,"allies");
		common_scripts\utility::flag_set("respawn_friendlies");
		wait(0.5);
	}
}

//Function Number: 16
lib_A594::func_9796(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger");
		common_scripts\utility::flag_clear("respawn_friendlies");
	}
}

//Function Number: 17
lib_A594::func_976C(param_00)
{
	param_00 endon("death");
	var_01 = getent(param_00.target,"targetname");
	var_02 = undefined;
	if(isdefined(var_01))
	{
		var_02 = var_01.var_2E6;
		var_01 delete();
	}
	else
	{
		var_01 = common_scripts\utility::getstruct(param_00.target,"targetname");
		var_02 = var_01.var_2E6;
	}

	for(;;)
	{
		param_00 waittill("trigger");
		lib_A512::func_2053(var_02,"axis");
		common_scripts\utility::flag_set("respawn_enemies");
		wait(0.5);
	}
}

//Function Number: 18
lib_A594::func_976D(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger");
		common_scripts\utility::flag_clear("respawn_enemies");
	}
}

//Function Number: 19
lib_A594::func_978C(param_00)
{
	var_01 = param_00 lib_A59A::func_3EA1();
	if(!isdefined(level.flag[var_01]))
	{
		common_scripts\utility::flag_init(var_01);
	}

	for(;;)
	{
		param_00 waittill("trigger",var_02);
		param_00 lib_A59A::script_delay();
		if(isalive(var_02) && var_02 istouching(param_00) && isdefined(param_00))
		{
			common_scripts\utility::flag_set(var_01);
		}

		while(isalive(var_02) && var_02 istouching(param_00) && isdefined(param_00))
		{
			wait(0.25);
		}

		common_scripts\utility::flag_clear(var_01);
	}
}

//Function Number: 20
lib_A594::func_979B()
{
	thread lib_A594::func_979C();
	level endon("trigger_group_" + self.var_7AF5);
	self waittill("trigger");
	level notify("trigger_group_" + self.var_7AF5,self);
}

//Function Number: 21
lib_A594::func_979C()
{
	level waittill("trigger_group_" + self.var_7AF5,var_00);
	if(self != var_00)
	{
		self delete();
	}
}

//Function Number: 22
lib_A594::func_97C3(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(!isalive(var_01))
		{
			continue;
		}

		var_01.var_85B3 = 1;
		var_01 thread lib_A594::func_7EFD();
	}
}

//Function Number: 23
lib_A594::func_7EFD()
{
	self notify("notify_wait_then_clear_skipBloodPool");
	self endon("notify_wait_then_clear_skipBloodPool");
	self endon("death");
	wait(2);
	self.var_85B3 = undefined;
}

//Function Number: 24
lib_A594::func_97CA(param_00)
{
	var_01 = [];
	var_02 = common_scripts\utility::getstructarray(param_00.target,"targetname");
	var_03 = getentarray(param_00.target,"targetname");
	foreach(var_05 in var_03)
	{
		var_06 = spawnstruct();
		var_06.var_2E6 = var_05.var_2E6;
		var_06.script_parameters = var_05.script_parameters;
		var_06.script_damage = var_05.script_damage;
		var_06.radius = var_05.radius;
		var_02[var_02.size] = var_06;
		var_05 delete();
	}

	param_00.var_657E = var_02[0].var_2E6;
	param_00 waittill("trigger");
	param_00 lib_A59A::script_delay();
	foreach(var_06 in var_02)
	{
		var_09 = var_06.radius;
		var_0A = var_06.script_parameters;
		var_0B = var_06.script_damage;
		if(!isdefined(var_09))
		{
			var_09 = 350;
		}

		if(!isdefined(var_0A))
		{
			var_0A = 0.25;
		}

		setdvar("tempdvar",var_0A);
		var_0A = getdvarfloat("tempdvar");
		if(isdefined(var_0B))
		{
			radiusdamage(var_06.var_2E6,var_09,var_0B,var_0B * 0.5);
		}

		physicsexplosionsphere(var_06.var_2E6,var_09,var_09 * 0.5,var_0A);
	}
}

//Function Number: 25
lib_A594::func_97CB(param_00)
{
	var_01 = param_00.var_7AF6;
	param_00 waittill("trigger");
	var_02 = function_00D6();
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		if(!isalive(var_02[var_03]))
		{
			continue;
		}

		if(isdefined(var_02[var_03].var_7AF6) && var_02[var_03].var_7AF6 == var_01)
		{
			var_02[var_03].var_1C7 = 800;
			var_02[var_03] method_81A7(level.var_31D);
			level thread lib_A577::func_27DB(var_02[var_03]);
		}
	}
}

//Function Number: 26
lib_A594::func_97D7(param_00)
{
	var_01 = common_scripts\utility::create_flags_and_return_tokens(param_00.script_flag_false);
	param_00 lib_A594::func_07B2(var_01);
	param_00 common_scripts\utility::update_trigger_based_on_flags();
}

//Function Number: 27
lib_A594::func_97D8(param_00)
{
	var_01 = common_scripts\utility::create_flags_and_return_tokens(param_00.script_flag_true);
	param_00 lib_A594::func_07B2(var_01);
	param_00 common_scripts\utility::update_trigger_based_on_flags();
}

//Function Number: 28
lib_A594::func_07B2(param_00)
{
	for(var_01 = 0;var_01 < param_00.size;var_01++)
	{
		var_02 = param_00[var_01];
		if(!isdefined(level.trigger_flags[var_02]))
		{
			level.trigger_flags[var_02] = [];
		}

		level.trigger_flags[var_02][level.trigger_flags[var_02].size] = self;
	}
}

//Function Number: 29
lib_A594::func_97F4(param_00)
{
	waittillframeend;
	var_01 = param_00.var_7AC9;
	if(!isdefined(level.var_8901[var_01]))
	{
		return;
	}

	param_00 waittill("trigger");
	var_02 = common_scripts\utility::random(level.var_8901[var_01]);
	foreach(var_04 in var_02)
	{
		var_04 lib_A59A::func_88BD();
	}
}

//Function Number: 30
lib_A594::func_97FA(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(getdvarint("sm_sunenable") == 0)
		{
			continue;
		}

		function_00D3("sm_sunenable",0);
	}
}

//Function Number: 31
lib_A594::func_97FB(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(getdvarint("sm_sunenable") == 1)
		{
			continue;
		}

		function_00D3("sm_sunenable",1);
	}
}

//Function Number: 32
lib_A594::func_9802(param_00)
{
	var_01 = getentarray(param_00.target,"targetname");
	foreach(var_03 in var_01)
	{
		var_04 = getentarray(var_03.target,"targetname");
		foreach(var_06 in var_04)
		{
			if(!issubstr(var_06.code_classname,"actor"))
			{
				continue;
			}

			if(!var_06.spawnflags & 1)
			{
				continue;
			}

			var_06.var_2D1A = 1;
		}
	}

	param_00 waittill("trigger");
	var_01 = getentarray(param_00.target,"targetname");
	common_scripts\utility::array_thread(var_01,lib_A5A1::func_8970(undefined,0,1));
}

//Function Number: 33
lib_A594::func_9804(param_00)
{
	param_00 waittill("trigger");
	var_01 = getentarray(param_00.target,"targetname");
	foreach(var_03 in var_01)
	{
		var_03 thread lib_A5A1::func_8970(70);
		wait(0.05);
	}
}

//Function Number: 34
lib_A594::func_3EA3()
{
	var_00 = [];
	var_01 = undefined;
	if(isdefined(self.target))
	{
		var_02 = getentarray(self.target,"targetname");
		var_03 = [];
		foreach(var_05 in var_02)
		{
			if(var_05.classname == "script_origin")
			{
				var_03[var_03.size] = var_05;
			}

			if(issubstr(var_05.classname,"trigger"))
			{
				var_00[var_00.size] = var_05;
			}
		}

		var_02 = common_scripts\utility::getstructarray(self.target,"targetname");
		foreach(var_05 in var_02)
		{
			var_03[var_03.size] = var_05;
		}

		if(var_03.size == 1)
		{
			var_09 = var_03[0];
			var_01 = var_09.var_2E6;
			if(isdefined(var_09.code_classname))
			{
				var_09 delete();
			}
		}
	}

	var_0A = [];
	var_0A["triggers"] = var_00;
	var_0A["target_origin"] = var_01;
	return var_0A;
}

//Function Number: 35
lib_A594::func_97A9(param_00)
{
	lib_A594::func_97AA(param_00,1);
}

//Function Number: 36
lib_A594::func_97AB(param_00)
{
	lib_A594::func_97AA(param_00,0);
}

//Function Number: 37
lib_A594::func_97AA(param_00,param_01)
{
	var_02 = 0.78;
	if(isdefined(param_00.var_79A7))
	{
		var_02 = param_00.var_79A7;
	}

	var_03 = param_00 lib_A594::func_3EA3();
	var_04 = var_03["triggers"];
	var_05 = var_03["target_origin"];
	var_06 = isdefined(param_00.var_79CE) || isdefined(param_00.var_39B);
	var_07 = undefined;
	if(var_06)
	{
		var_07 = param_00 lib_A59A::func_3EA1();
		if(!isdefined(level.flag[var_07]))
		{
			common_scripts\utility::flag_init(var_07);
		}
	}
	else if(!var_04.size)
	{
	}

	if(param_01 && var_06)
	{
		level endon(var_07);
	}

	param_00 endon("death");
	var_08 = 0;
	if(isdefined(param_00.script_parameters))
	{
		var_08 = !issubstr("no_sight",param_00.script_parameters);
	}

	for(;;)
	{
		if(var_06)
		{
			common_scripts\utility::flag_clear(var_07);
		}

		param_00 waittill("trigger",var_09);
		var_0A = [];
		while(var_09 istouching(param_00))
		{
			if(var_08 && !sighttracepassed(var_09 geteye(),var_05,0,undefined))
			{
				if(var_06)
				{
					common_scripts\utility::flag_clear(var_07);
				}

				wait(0.5);
				continue;
			}

			var_0B = vectornormalize(var_05 - var_09.var_2E6);
			var_0C = var_09 getplayerangles();
			var_0D = anglestoforward(var_0C);
			var_0E = vectordot(var_0D,var_0B);
			if(var_0E >= var_02)
			{
				common_scripts\utility::array_thread(var_04,::lib_A59A::func_7C7C,"trigger");
				if(var_06)
				{
					common_scripts\utility::flag_set(var_07,var_09);
				}

				if(param_01)
				{
					return;
				}

				wait(2);
			}
			else if(var_06)
			{
				common_scripts\utility::flag_clear(var_07);
			}

			if(var_08)
			{
				wait(0.5);
				continue;
			}

			wait(0.05);
		}
	}
}

//Function Number: 38
lib_A594::func_975D(param_00)
{
	var_01 = [];
	var_02 = undefined;
	var_03 = param_00 lib_A594::func_3EA3();
	var_01 = var_03["triggers"];
	var_02 = var_03["target_origin"];
	var_04 = isdefined(param_00.var_79CE) || isdefined(param_00.var_39B);
	var_05 = undefined;
	if(var_04)
	{
		var_05 = param_00 lib_A59A::func_3EA1();
		if(!isdefined(level.flag[var_05]))
		{
			common_scripts\utility::flag_init(var_05);
		}
	}
	else if(!var_01.size)
	{
	}

	param_00 endon("death");
	var_06 = 12;
	var_07 = [];
	var_07[var_07.size] = (0,0,0);
	var_07[var_07.size] = (var_06,0,0);
	var_07[var_07.size] = (var_06 * -1,0,0);
	var_07[var_07.size] = (0,var_06,0);
	var_07[var_07.size] = (0,var_06 * -1,0);
	var_07[var_07.size] = (0,0,var_06);
	for(;;)
	{
		if(var_04)
		{
			common_scripts\utility::flag_clear(var_05);
		}

		param_00 waittill("trigger",var_08);
		while(level.var_31D istouching(param_00))
		{
			if(!var_08 lib_A594::func_1AF4(var_02,var_07))
			{
				if(var_04)
				{
					common_scripts\utility::flag_clear(var_05);
				}

				wait(0.1);
				continue;
			}

			if(var_04)
			{
				common_scripts\utility::flag_set(var_05);
			}

			common_scripts\utility::array_thread(var_01,::lib_A59A::func_7C7C,"trigger");
			wait(0.5);
		}
	}
}

//Function Number: 39
lib_A594::func_1AF4(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_01.size;var_02++)
	{
		if(sighttracepassed(self geteye(),param_00 + param_01[var_02],1,self))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 40
lib_A594::func_9800(param_00)
{
	var_01 = "not_set";
	if(isdefined(param_00.var_39B))
	{
		var_01 = param_00.var_39B;
	}

	var_02 = getentarray(param_00.target,"targetname");
	param_00 thread lib_A594::func_9801(param_00.target);
	for(;;)
	{
		common_scripts\utility::array_thread(var_02,::common_scripts\utility::trigger_off);
		param_00 waittill("trigger");
		common_scripts\utility::array_thread(var_02,::common_scripts\utility::trigger_on);
		lib_A594::func_9F7E(var_02,var_01);
		lib_A59A::func_CF4(var_02,"relock");
	}
}

//Function Number: 41
lib_A594::func_9801(param_00)
{
	self waittill("death");
	var_01 = getentarray(param_00,"targetname");
	common_scripts\utility::array_thread(var_01,::common_scripts\utility::trigger_off);
}

//Function Number: 42
lib_A594::func_9F7E(param_00,param_01)
{
	level endon("unlocked_trigger_hit" + param_01);
	var_02 = spawnstruct();
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		param_00[var_03] thread lib_A594::func_7401(var_02,param_01);
	}

	var_02 waittill("trigger");
	level notify("unlocked_trigger_hit" + param_01);
}

//Function Number: 43
lib_A594::func_7401(param_00,param_01)
{
	self endon("relock");
	level endon("unlocked_trigger_hit" + param_01);
	self waittill("trigger");
	param_00 notify("trigger");
}

//Function Number: 44
lib_A594::func_9755(param_00)
{
	var_01 = undefined;
	if(isdefined(param_00.target))
	{
		var_02 = getentarray(param_00.target,"targetname");
		if(issubstr(var_02[0].classname,"trigger"))
		{
			var_01 = var_02[0];
		}
	}

	if(isdefined(var_01))
	{
		var_01 waittill("trigger",var_03);
	}
	else
	{
		var_01 waittill("trigger",var_03);
	}

	var_04 = undefined;
	if(isdefined(var_01))
	{
		if(var_03.inliveplayerkillstreak != level.var_31D.inliveplayerkillstreak && level.var_31D istouching(param_00))
		{
			var_04 = level.var_31D animscripts\battlechatter::func_3F36("custom");
		}
		else if(var_03.inliveplayerkillstreak == level.var_31D.inliveplayerkillstreak)
		{
			var_05 = "axis";
			if(level.var_31D.inliveplayerkillstreak == "axis")
			{
				var_05 = "allies";
			}

			var_06 = animscripts\battlechatter::func_40DD("custom",var_05);
			var_06 = common_scripts\utility::get_array_of_farthest(level.var_31D.var_2E6,var_06);
			foreach(var_08 in var_06)
			{
				if(var_08 istouching(param_00))
				{
					var_04 = var_08;
					if(lib_A594::func_1331(var_08.var_2E6))
					{
						break;
					}
				}
			}
		}
	}
	else if(isplayer(var_03))
	{
		var_04 = var_03 animscripts\battlechatter::func_3F36("custom");
	}
	else
	{
		var_04 = var_03;
	}

	if(!isdefined(var_04))
	{
		return;
	}

	if(lib_A594::func_1331())
	{
		return;
	}

	var_0A = var_04 lib_A59A::func_2534(param_00.var_7959);
	if(!var_0A)
	{
		level lib_A59A::delaythread(0.25,::lib_A594::func_9755,param_00);
		return;
	}

	param_00 notify("custom_battlechatter_done");
}

//Function Number: 45
lib_A594::func_1331(param_00)
{
	return distancesquared(param_00,level.var_31D getorigin()) <= 262144;
}

//Function Number: 46
lib_A594::func_9803(param_00)
{
	param_00 waittill("trigger");
	var_01 = getentarray(param_00.target,"targetname");
	foreach(var_03 in var_01)
	{
		var_03 thread lib_A59E::func_8971();
		wait(0.05);
	}
}

//Function Number: 47
lib_A594::func_9769(param_00)
{
	param_00 waittill("trigger");
	var_01 = getentarray(param_00.target,"targetname");
	var_02 = [];
	var_02["left_door"] = -170;
	var_02["right_door"] = 170;
	foreach(var_04 in var_01)
	{
		var_05 = var_02[var_04.var_39B];
		var_04 connectpaths();
		var_04 rotateyaw(var_05,1,0,0.5);
	}
}

//Function Number: 48
lib_A594::func_979A(param_00)
{
	var_01 = getglassarray(param_00.target);
	if(!isdefined(var_01) || var_01.size == 0)
	{
		return;
	}

	for(;;)
	{
		level waittill("glass_break",var_02);
		if(var_02 istouching(param_00))
		{
			var_03 = var_02.var_2E6;
			wait(0.05);
			var_04 = var_02.var_2E6;
			var_05 = undefined;
			if(var_03 != var_04)
			{
				var_05 = var_04 - var_03;
			}

			if(isdefined(var_05))
			{
				foreach(var_07 in var_01)
				{
					destroyglass(var_07,var_05);
				}

				break;
			}
			else
			{
				foreach(var_07 in var_01)
				{
					destroyglass(var_07);
				}

				break;
			}
		}
	}

	param_00 delete();
}

//Function Number: 49
lib_A594::func_9765(param_00)
{
	param_00 waittill("trigger");
	var_01 = param_00 lib_A594::func_3E57();
	common_scripts\utility::array_thread(var_01,::lib_A594::func_2817);
}

//Function Number: 50
lib_A594::func_3E57()
{
	var_00 = [];
	if(!isdefined(self.script_linkto))
	{
		return var_00;
	}

	var_01 = strtok(self.script_linkto," ");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = var_01[var_02];
		var_04 = getent(var_03,"script_linkname");
		if(isdefined(var_04))
		{
			var_00[var_00.size] = var_04;
		}
	}

	return var_00;
}

//Function Number: 51
lib_A594::func_2817()
{
	var_00 = lib_A594::func_3E57();
	common_scripts\utility::array_thread(var_00,::lib_A594::func_2817);
	self delete();
}

//Function Number: 52
lib_A594::func_97FC(param_00)
{
	param_00 endon("death");
	param_00 waittill("trigger");
	lib_A59A::func_9334();
}

//Function Number: 53
lib_A594::func_979F(param_00)
{
	if(!isdefined(level.var_2B5E))
	{
		level.var_2B5E = [];
	}

	waittillframeend;
	var_01 = param_00.var_7A0A;
	param_00 waittill("trigger",var_02);
	if(isdefined(level.var_2B5E[var_01]))
	{
		return;
	}

	level.var_2B5E[var_01] = 1;
	var_02 lib_A59A::func_2B49(var_01);
}

//Function Number: 54
lib_A594::func_9766(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(isdefined(var_01))
		{
			var_01 delete();
		}
	}
}

//Function Number: 55
lib_A594::func_97FF(param_00)
{
	param_00 waittill("trigger");
	param_00 common_scripts\utility::trigger_off();
	if(!isdefined(param_00.script_linkto))
	{
		return;
	}

	var_01 = strtok(param_00.script_linkto," ");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		common_scripts\utility::array_thread(getentarray(var_01[var_02],"script_linkname"),::common_scripts\utility::trigger_off);
	}
}

//Function Number: 56
lib_A594::func_97A3(param_00)
{
	thread lib_A594::func_97D4(param_00,::lib_A59A::func_7E58,::lib_A59A::func_3DA3);
}

//Function Number: 57
lib_A594::func_97C9(param_00)
{
	thread lib_A594::func_97D4(param_00,::lib_A59A::func_7E8B,::lib_A59A::func_3E14);
}

//Function Number: 58
lib_A594::func_97D4(param_00,param_01,param_02)
{
	for(;;)
	{
		param_00 waittill("trigger",var_03);
		if(!isalive(var_03))
		{
			continue;
		}

		if(var_03 [[ param_02 ]]())
		{
			continue;
		}

		var_03 thread lib_A594::func_93FF(param_00,param_01);
	}
}

//Function Number: 59
lib_A594::func_93FF(param_00,param_01)
{
	self endon("death");
	self.ignoreme = 1;
	[[ param_01 ]](1);
	self.var_203 = 1;
	wait(1);
	self.var_203 = 0;
	while(self istouching(param_00))
	{
		wait(1);
	}

	[[ param_01 ]](0);
}

//Function Number: 60
lib_A594::func_97D0(param_00)
{
	param_00 waittill("trigger");
	lib_A59A::func_70BA(param_00.var_39B);
}

//Function Number: 61
lib_A594::func_9789(param_00)
{
	if(lib_A59A::func_5009())
	{
		thread lib_A594::func_9788(param_00);
		return;
	}

	var_01 = param_00 lib_A59A::func_3EA1();
	if(!isdefined(level.flag[var_01]))
	{
		common_scripts\utility::flag_init(var_01);
	}

	for(;;)
	{
		param_00 waittill("trigger",var_02);
		if(!isplayer(var_02))
		{
			continue;
		}

		param_00 lib_A59A::script_delay();
		common_scripts\utility::flag_set(var_01);
	}
}

//Function Number: 62
lib_A594::func_97BD(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		var_01 lib_A509::func_8FC7(param_00.script_visionset,param_00.script_delay);
		wait 0.05;
	}
}

//Function Number: 63
lib_A594::func_97BF(param_00)
{
	var_01 = 0;
	var_02 = undefined;
	var_03 = undefined;
	var_04 = undefined;
	if(isdefined(param_00.script_visionset_start) && isdefined(param_00.script_visionset_end))
	{
		var_01 = 1;
		var_03 = getent(param_00.target,"targetname");
		if(!isdefined(var_03))
		{
			var_03 = common_scripts\utility::getstruct(param_00.target,"targetname");
		}

		var_04 = getent(var_03.target,"targetname");
		if(!isdefined(var_04))
		{
			var_04 = common_scripts\utility::getstruct(var_03.target,"targetname");
		}

		var_03 = var_03.var_2E6;
		var_04 = var_04.var_2E6;
		var_02 = distance(var_03,var_04);
		param_00 lib_A594::func_4D72();
	}

	var_05 = -1;
	for(;;)
	{
		param_00 waittill("trigger",var_06);
		if(isplayer(var_06))
		{
			if(var_01)
			{
				var_07 = 0;
				while(var_06 istouching(param_00))
				{
					var_07 = lib_A59A::func_3E3B(var_03,var_04,var_06.var_2E6,var_02);
					var_07 = clamp(var_07,0,1);
					if(var_07 != var_05)
					{
						var_05 = var_07;
						var_06 lib_A594::func_9E66(param_00,var_07);
					}

					wait(0.05);
				}

				if(var_07 < 0.5)
				{
					var_06 lib_A59A::func_9E65(param_00.script_visionset_start,param_00.script_delay);
				}
				else
				{
					var_06 lib_A59A::func_9E65(param_00.script_visionset_end,param_00.script_delay);
				}

				continue;
			}

			var_06 lib_A59A::func_9E65(param_00.script_visionset,param_00.script_delay);
		}
	}
}

//Function Number: 64
lib_A594::func_4D72()
{
	if(!isdefined(self.script_delay))
	{
		self.script_delay = 2;
	}

	var_00 = lib_A59A::func_3EBD(self.script_visionset_start);
	var_01 = lib_A59A::func_3EBD(self.script_visionset_end);
	if(!isdefined(var_00) || !isdefined(var_01))
	{
		return;
	}

	var_02 = spawnstruct();
	var_02.startdist = var_01.startdist - var_00.startdist;
	var_02.halfwaydist = var_01.halfwaydist - var_00.halfwaydist;
	var_02.red = var_01.red - var_00.red;
	var_02.blue = var_01.blue - var_00.blue;
	var_02.green = var_01.green - var_00.green;
	var_02.hdrcolorintensity = var_01.hdrcolorintensity - var_00.hdrcolorintensity;
	var_02.maxopacity = var_01.maxopacity - var_00.maxopacity;
	var_02.sunfogenabled = isdefined(var_00.sunfogenabled) || isdefined(var_01.sunfogenabled);
	var_02.hdrsuncolorintensity = var_01.hdrsuncolorintensity - var_00.hdrsuncolorintensity;
	var_02.skyfogintensity = var_01.skyfogintensity - var_00.skyfogintensity;
	var_02.skyfogminangle = var_01.skyfogminangle - var_00.skyfogminangle;
	var_02.skyfogmaxangle = var_01.skyfogmaxangle - var_00.skyfogmaxangle;
	var_03 = 0;
	if(isdefined(var_00.sunred))
	{
		var_03 = var_00.sunred;
	}

	var_04 = 0;
	if(isdefined(var_01.sunred))
	{
		var_04 = var_01.sunred;
	}

	var_02.var_8FD4 = var_03;
	var_02.sunred = var_04 - var_03;
	var_05 = 0;
	if(isdefined(var_00.sungreen))
	{
		var_05 = var_00.sungreen;
	}

	var_06 = 0;
	if(isdefined(var_01.sungreen))
	{
		var_06 = var_01.sungreen;
	}

	var_02.var_8FCD = var_05;
	var_02.sungreen = var_06 - var_05;
	var_07 = 0;
	if(isdefined(var_00.sunblue))
	{
		var_07 = var_00.sunblue;
	}

	var_08 = 0;
	if(isdefined(var_01.sunblue))
	{
		var_08 = var_01.sunblue;
	}

	var_02.var_8FBA = var_07;
	var_02.sunblue = var_08 - var_07;
	var_09 = (0,0,0);
	if(isdefined(var_00.sundir))
	{
		var_09 = var_00.sundir;
	}

	var_0A = (0,0,0);
	if(isdefined(var_01.sundir))
	{
		var_0A = var_01.sundir;
	}

	var_02.var_8FC1 = var_09;
	var_02.sundir = var_0A - var_09;
	var_0B = 0;
	if(isdefined(var_00.sunbeginfadeangle))
	{
		var_0B = var_00.sunbeginfadeangle;
	}

	var_0C = 0;
	if(isdefined(var_01.sunbeginfadeangle))
	{
		var_0C = var_01.sunbeginfadeangle;
	}

	var_02.var_8FB8 = var_0B;
	var_02.sunbeginfadeangle = var_0C - var_0B;
	var_0D = 0;
	if(isdefined(var_00.sunendfadeangle))
	{
		var_0D = var_00.sunendfadeangle;
	}

	var_0E = 0;
	if(isdefined(var_01.sunendfadeangle))
	{
		var_0E = var_01.sunendfadeangle;
	}

	var_02.var_8FC4 = var_0D;
	var_02.sunendfadeangle = var_0E - var_0D;
	var_0F = 0;
	if(isdefined(var_00.normalfogscale))
	{
		var_0F = var_00.normalfogscale;
	}

	var_10 = 0;
	if(isdefined(var_01.normalfogscale))
	{
		var_10 = var_01.normalfogscale;
	}

	var_02.var_615C = var_0F;
	var_02.normalfogscale = var_10 - var_0F;
	self.var_9E72 = var_02;
}

//Function Number: 65
lib_A594::func_9E66(param_00,param_01)
{
	lib_A59A::func_4D54();
	if(param_01 < 0.5)
	{
		self.vision_set_transition_ent.vision_set = param_00.script_visionset_start;
	}
	else
	{
		self.vision_set_transition_ent.vision_set = param_00.script_visionset_end;
	}

	self.vision_set_transition_ent.time = 0;
	if(param_00.script_visionset_start == param_00.script_visionset_end)
	{
		return;
	}

	self method_80C4(param_00.script_visionset_start,param_00.script_visionset_end,param_01);
	var_02 = lib_A59A::func_3EBD(param_00.script_visionset_start);
	var_03 = lib_A59A::func_3EBD(param_00.script_visionset_end);
	var_04 = param_00.var_9E72;
	var_05 = spawnstruct();
	var_05.startdist = var_02.startdist + var_04.startdist * param_01;
	var_05.halfwaydist = var_02.halfwaydist + var_04.halfwaydist * param_01;
	var_05.halfwaydist = max(1,var_05.halfwaydist);
	var_05.red = var_02.red + var_04.red * param_01;
	var_05.green = var_02.green + var_04.green * param_01;
	var_05.blue = var_02.blue + var_04.blue * param_01;
	var_05.hdrcolorintensity = var_02.hdrcolorintensity + var_04.hdrcolorintensity * param_01;
	var_05.maxopacity = var_02.maxopacity + var_04.maxopacity * param_01;
	var_05.skyfogintensity = var_02.skyfogintensity + var_04.skyfogintensity * param_01;
	var_05.skyfogminangle = var_02.skyfogminangle + var_04.skyfogminangle * param_01;
	var_05.skyfogmaxangle = var_02.skyfogmaxangle + var_04.skyfogmaxangle * param_01;
	if(var_04.sunfogenabled)
	{
		var_05.sunfogenabled = 1;
		var_05.sunred = var_04.var_8FD4 + var_04.sunred * param_01;
		var_05.sungreen = var_04.var_8FCD + var_04.sungreen * param_01;
		var_05.sunblue = var_04.var_8FBA + var_04.sunblue * param_01;
		var_05.hdrsuncolorintensity = var_02.hdrsuncolorintensity + var_04.hdrsuncolorintensity * param_01;
		var_05.sundir = var_04.var_8FC1 + var_04.sundir * param_01;
		var_05.sunbeginfadeangle = var_04.var_8FB8 + var_04.sunbeginfadeangle * param_01;
		var_05.sunendfadeangle = var_04.var_8FC4 + var_04.sunendfadeangle * param_01;
		var_05.normalfogscale = var_04.var_615C + var_04.normalfogscale * param_01;
	}

	common_scripts\utility::set_fog_to_ent_values(var_05,0.05);
}

//Function Number: 66
lib_A594::func_9792(param_00)
{
	waittillframeend;
	var_01 = param_00.var_79DC;
	var_02 = param_00.var_79DB;
	param_00.var_8FCA = 0;
	if(isdefined(var_01) && isdefined(var_02))
	{
		var_03 = lib_A59A::get_fog(var_01);
		var_04 = lib_A59A::get_fog(var_02);
		param_00.var_8FCA = isdefined(var_03.sunred) || isdefined(var_04.sunred);
		param_00.var_8C0F = var_03.startdist;
		param_00.var_8B9C = var_03.halfwaydist;
		param_00.var_8B60 = (var_03.red,var_03.green,var_03.blue);
		param_00.var_8BCA = var_03.hdrcolorintensity;
		param_00.var_8C19 = var_03.maxopacity;
		param_00.var_8C8E = var_03.skyfogintensity;
		param_00.var_8C90 = var_03.skyfogminangle;
		param_00.var_8C8F = var_03.skyfogmaxangle;
		if(isdefined(var_03.sunred))
		{
			param_00.var_8CAC = (var_03.sunred,var_03.sungreen,var_03.sunblue);
			param_00.var_8BCB = var_03.hdrsuncolorintensity;
			param_00.var_8CAD = var_03.sundir;
			param_00.var_8CAB = var_03.sunbeginfadeangle;
			param_00.var_8CAE = var_03.sunendfadeangle;
			param_00.var_8CAF = var_03.normalfogscale;
		}
		else if(param_00.var_8FCA)
		{
			param_00.var_8CAC = param_00.var_8B60;
			param_00.var_8BCB = 1;
			param_00.var_8CAD = (0,0,0);
			param_00.var_8CAB = 0;
			param_00.var_8CAE = 90;
			param_00.var_8CAF = 1;
		}

		param_00.var_313A = var_04.startdist;
		param_00.var_312F = var_04.halfwaydist;
		param_00.var_3123 = (var_04.red,var_04.green,var_04.blue);
		param_00.var_3134 = var_04.hdrcolorintensity;
		param_00.var_313B = var_04.maxopacity;
		param_00.var_3143 = var_04.skyfogintensity;
		param_00.var_3145 = var_04.skyfogminangle;
		param_00.var_3144 = var_04.skyfogmaxangle;
		if(isdefined(var_04.sunred))
		{
			param_00.var_314B = (var_04.sunred,var_04.sungreen,var_04.sunblue);
			param_00.var_3135 = var_04.hdrsuncolorintensity;
			param_00.var_314C = var_04.sundir;
			param_00.var_314A = var_04.sunbeginfadeangle;
			param_00.var_314D = var_04.sunendfadeangle;
			param_00.var_314E = var_04.normalfogscale;
		}
		else if(param_00.var_8FCA)
		{
			param_00.var_314B = param_00.var_3123;
			param_00.var_3135 = 1;
			param_00.var_314C = (0,0,0);
			param_00.var_314A = 0;
			param_00.var_314D = 90;
			param_00.var_314E = 1;
		}
	}

	var_05 = getent(param_00.target,"targetname");
	var_06 = var_05.var_2E6;
	var_07 = undefined;
	if(isdefined(var_05.target))
	{
		var_08 = getent(var_05.target,"targetname");
		var_07 = var_08.var_2E6;
	}
	else
	{
		var_07 = var_06 + param_00.var_2E6 - var_06 * 2;
	}

	var_09 = distance(var_06,var_07);
	for(;;)
	{
		param_00 waittill("trigger",var_0A);
		var_0B = 0;
		while(var_0A istouching(param_00))
		{
			var_0B = lib_A59A::func_3E3B(var_06,var_07,var_0A.var_2E6,var_09);
			var_0B = clamp(var_0B,0,1);
			param_00 lib_A509::func_7E2F(var_0B);
			wait(0.05);
		}

		if(var_0B > 0.5)
		{
			var_0B = 1;
		}
		else
		{
			var_0B = 0;
		}

		param_00 lib_A509::func_7E2F(var_0B);
	}
}

//Function Number: 67
lib_A594::func_97B8(param_00)
{
	waittillframeend;
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		var_02 = param_00.var_79A2;
		var_03 = param_00.var_79A1;
		var_04 = param_00.var_79A0;
		var_05 = param_00.var_799F;
		var_06 = param_00.var_799E;
		var_07 = param_00.var_799D;
		var_08 = param_00.script_delay;
		if(var_02 != level.var_2C3C["base"]["goal"]["nearStart"] || var_03 != level.var_2C3C["base"]["goal"]["nearEnd"] || var_04 != level.var_2C3C["base"]["goal"]["nearBlur"] || var_05 != level.var_2C3C["base"]["goal"]["farStart"] || var_06 != level.var_2C3C["base"]["goal"]["farEnd"] || var_07 != level.var_2C3C["base"]["goal"]["farBlur"])
		{
			lib_A509::func_2C6B(var_02,var_03,var_04,var_05,var_06,var_07,var_08);
			wait(var_08);
			continue;
		}

		wait 0.05;
	}
}

//Function Number: 68
lib_A594::func_97BE(param_00)
{
	if(level.avatarinfo || level.ps3)
	{
		return;
	}

	waittillframeend;
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		var_02 = param_00.var_7AEA;
		var_03 = param_00.var_7AEB;
		var_04 = param_00.script_delay;
		if(var_02 != level.var_9293.var_256B || var_03 != level.var_9293.var_256D)
		{
			var_02 = max(0,var_02);
			var_02 = min(10000,var_02);
			var_03 = max(0,var_03);
			var_03 = min(10000,var_03);
			lib_A509::func_9295(var_02,var_03,var_04);
			continue;
		}

		wait 0.05;
	}
}

//Function Number: 69
lib_A594::func_97EE(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		var_01 thread lib_A594::func_8621(param_00);
	}
}

//Function Number: 70
lib_A594::func_8621(param_00)
{
	if(isdefined(self.vehicle))
	{
		return;
	}

	if(lib_A59A::func_51A7())
	{
		return;
	}

	if(isdefined(self.var_6C4D))
	{
		return;
	}

	self endon("death");
	if(soundexists("SCN_cliffhanger_player_hillslide"))
	{
		self playsoundasmaster("SCN_cliffhanger_player_hillslide");
	}

	var_01 = undefined;
	if(isdefined(param_00.script_accel))
	{
		var_01 = param_00.script_accel;
	}

	self endon("cancel_sliding");
	lib_A59A::func_139F(undefined,var_01);
	for(;;)
	{
		if(!self istouching(param_00))
		{
			break;
		}

		wait(0.05);
	}

	if(isdefined(level.var_3146))
	{
		wait(level.var_3146);
	}

	lib_A59A::func_31C6();
}

//Function Number: 71
lib_A594::func_97F7(param_00)
{
	param_00 waittill("trigger",var_01);
}

//Function Number: 72
lib_A594::func_97BB(param_00)
{
	var_01 = spawn("script_origin",(0,0,0));
	param_00.fx = [];
	foreach(var_03 in level.createfxent)
	{
		lib_A594::func_0D64(var_03,param_00,var_01);
	}

	var_01 delete();
	if(!isdefined(param_00.target))
	{
		return;
	}

	var_05 = getentarray(param_00.target,"targetname");
	param_00.var_3B74 = 1;
	var_06 = var_05;
	var_08 = getfirstarraykey(var_06);
	if(isdefined(var_08))
	{
		var_07 = var_06[var_08];
		switch(var_07.classname)
		{
			case "trigger_multiple_fx_volume_on":
				break;

			case "trigger_multiple_fx_volume_off":
				break;

			default:
				break;
		}
	}
}

//Function Number: 73
lib_A594::func_97BA(param_00)
{
	for(;;)
	{
		self waittill("trigger");
		if(!param_00.var_3B74)
		{
			common_scripts\utility::array_thread(param_00.fx,::lib_A59A::func_748A);
		}

		wait(1);
	}
}

//Function Number: 74
lib_A594::func_97B9(param_00)
{
	for(;;)
	{
		self waittill("trigger");
		if(param_00.var_3B74)
		{
			common_scripts\utility::array_thread(param_00.fx,::common_scripts\utility::pauseeffect);
		}

		wait(1);
	}
}

//Function Number: 75
lib_A594::func_0D64(param_00,param_01,param_02)
{
	if(isdefined(param_00.v["soundalias"]) && param_00.v["soundalias"] != "nil")
	{
		if(!isdefined(param_00.v["stopable"]) || !param_00.v["stopable"])
		{
			return;
		}
	}

	param_02.var_2E6 = param_00.v["origin"];
	if(param_02 istouching(param_01))
	{
		param_01.fx[param_01.fx.size] = param_00;
	}
}

//Function Number: 76
lib_A594::func_97B7(param_00)
{
	var_01 = param_00.script_parameters;
	if(!isdefined(level.var_5C70))
	{
		level.var_5C70 = "";
	}

	for(;;)
	{
		param_00 waittill("trigger");
		if(level.var_5C70 != var_01)
		{
			lib_A513::setupminimap(var_01);
		}
	}
}

//Function Number: 77
lib_A594::func_97C1(param_00)
{
	common_scripts\utility::array_thread(level.var_328,::lib_A594::func_60F4,param_00);
}

//Function Number: 78
lib_A594::func_60F4(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(!isdefined(var_01))
		{
			continue;
		}

		if(var_01 != self)
		{
			continue;
		}

		while(var_01 istouching(param_00))
		{
			var_01 method_811A(0);
			var_01 method_8119(0);
			wait(0.05);
		}

		var_01 method_811A(1);
		var_01 method_8119(1);
	}
}

//Function Number: 79
lib_A594::func_97C2(param_00)
{
	common_scripts\utility::array_thread(level.var_328,::lib_A594::func_6108,param_00);
}

//Function Number: 80
lib_A594::func_6108(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(!isdefined(var_01))
		{
			continue;
		}

		if(var_01 != self)
		{
			continue;
		}

		while(var_01 istouching(param_00))
		{
			var_01 method_811A(0);
			wait(0.05);
		}

		var_01 method_811A(1);
	}
}

//Function Number: 81
lib_A594::func_9807(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(!isdefined(var_01))
		{
			continue;
		}

		if(var_01 lib_A59A::func_32DB("in_wake_volume"))
		{
		}
		else
		{
			var_01 lib_A59A::func_32DC("in_wake_volume");
		}

		if(distancesquared(var_01.var_2E6,level.var_31D.var_2E6) < 9250000)
		{
			if(var_01 lib_A59A::func_32D7("in_wake_volume"))
			{
				continue;
			}

			var_01 thread lib_A594::func_9F37(param_00);
			var_01 lib_A59A::func_32DD("in_wake_volume");
		}
	}
}

//Function Number: 82
lib_A594::func_9F37(param_00)
{
	self endon("death");
	var_01 = 200;
	for(;;)
	{
		if(self istouching(param_00))
		{
			if(var_01 > 0)
			{
				wait(max(1 - var_01 / 120,0.1));
			}
			else
			{
				wait(0.15);
			}

			var_02 = param_00.script_fxid;
			var_03 = (0,0,0);
			if(isplayer(self))
			{
				var_03 = self getvelocity();
			}

			if(isai(self))
			{
				var_03 = self.var_4FF;
			}

			var_01 = distance(var_03,(0,0,0));
			if(var_01 < 5)
			{
				var_02 = "null";
			}

			if(var_02 != "null")
			{
				var_04 = vectornormalize((var_03[0],var_03[1],0));
				var_05 = anglestoforward(vectortoangles(var_04) + (270,180,0));
				var_06 = self.var_2E6 + (0,0,64);
				var_07 = self.var_2E6 - (0,0,150);
				var_08 = bullettrace(var_06,var_07,0,undefined);
				if(isdefined(param_00.var_7AE5))
				{
					if(var_08["surfacetype"] != param_00.var_7AE5)
					{
						continue;
					}
				}

				var_09 = common_scripts\utility::getfx(var_02);
				var_06 = var_08["position"] + var_01 / 4 * var_04;
				if(isdefined(param_00.var_7B05) && param_00.var_7B05 == 1)
				{
					var_0A = vectornormalize(vectorcross(var_08["normal"],vectorcross(var_04,var_08["normal"])));
					if(var_08["normal"] != (0,0,0) && var_0A != (0,0,0))
					{
						playfx(var_09,var_06,var_08["normal"],var_0A);
					}
				}
				else
				{
					playfx(var_09,var_06,var_05);
				}
			}

			continue;
		}

		lib_A59A::func_32D9("in_wake_volume");
	}
}

//Function Number: 83
lib_A594::func_9784(param_00)
{
	for(;;)
	{
		param_00 waittill("trigger",var_01);
		if(!isdefined(var_01))
		{
			continue;
		}

		if(var_01 lib_A59A::func_32DB("in_fallingwater_volume"))
		{
		}
		else
		{
			var_01 lib_A59A::func_32DC("in_fallingwater_volume");
		}

		if(distancesquared(var_01.var_2E6,level.var_31D.var_2E6) < 6250000)
		{
			if(var_01 lib_A59A::func_32D7("in_fallingwater_volume"))
			{
				continue;
			}

			var_01 thread lib_A594::func_9F35(param_00);
			var_01 lib_A59A::func_32DD("in_fallingwater_volume");
		}
	}
}

//Function Number: 84
lib_A594::func_9F35(param_00)
{
	self endon("death");
	var_01 = param_00 getpointinbounds(1,1,0);
	var_02 = param_00 getpointinbounds(-1,-1,0);
	var_03 = var_01[0] - var_02[0] * var_01[1] - var_02[1];
	var_04 = 3;
	if(isdefined(param_00.script_duration))
	{
		var_04 = param_00.script_duration;
	}

	var_05 = 1;
	if(isdefined(param_00.var_79DA))
	{
		var_05 = param_00.var_79DA;
	}

	var_06 = int(var_05 * var_03 / 50);
	var_07 = "null";
	if(isdefined(param_00.script_fxid))
	{
		var_07 = param_00.script_fxid;
	}

	var_08 = "null";
	if(isdefined(param_00.var_7AB8))
	{
		var_08 = param_00.var_7AB8;
	}

	var_09 = -1;
	for(;;)
	{
		if(self istouching(param_00))
		{
			if(isai(self))
			{
				wait(0.05);
				for(var_0A = 0;var_0A < var_06;var_0A++)
				{
					if(var_07 != "null")
					{
						var_0B = param_00 getpointinbounds(randomfloat(2) - 1,randomfloat(2) - 1,1);
						var_0C = (var_0B[0],var_0B[1],self.var_2E6[2]);
						if(distance2dsquared(var_0C,self.var_2E6) < 900)
						{
							var_0D = bullettrace(var_0B,var_0C,1,undefined,0,1);
							if(isdefined(var_0D["entity"]) && var_0D["entity"] == self)
							{
								var_0E = common_scripts\utility::getfx(var_07);
								var_0B = var_0D["position"];
								var_0F = vectortoangles(var_0D["normal"] + (90,0,0));
								var_10 = anglestoforward(var_0F);
								var_11 = anglestoup(var_0F);
								playfx(var_0E,var_0B,var_11,var_10);
							}
						}
					}
				}
			}

			if(isplayer(self))
			{
				wait(0.05);
				var_09 = var_09 + 0.05;
				if(var_09 > var_04 * 0.2 || var_09 < 0)
				{
					self setwatersheeting(1,var_04);
					var_09 = 0;
				}

				if(!isdefined(level.var_301E))
				{
					if(var_08 != "null")
					{
						lib_A594::func_89A2(var_08,(500,0,0),(180,0,0));
					}
				}
			}

			continue;
		}

		lib_A59A::func_32D9("in_fallingwater_volume");
		if(var_08 != "null")
		{
			lib_A594::func_8EDD(var_08);
		}
	}
}

//Function Number: 85
lib_A594::func_89A2(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = (0,0,0);
	}

	if(!isdefined(param_02))
	{
		param_02 = (0,0,0);
	}

	var_03 = common_scripts\utility::getfx(param_00);
	level.var_301E = common_scripts\utility::spawn_tag_origin();
	level.var_301E method_80A6(level.var_31D,"tag_origin",param_01,param_02,1);
	level.var_301D = playfxontag(var_03,level.var_301E,"tag_origin");
}

//Function Number: 86
lib_A594::func_8EDD(param_00,param_01)
{
	if(isdefined(level.var_301E))
	{
		if(isdefined(level.var_301D))
		{
			if(param_01)
			{
				killfxontag(common_scripts\utility::getfx(param_00),level.var_301E,"tag_origin");
			}
			else
			{
				stopfxontag(common_scripts\utility::getfx(param_00),level.var_301E,"tag_origin");
			}
		}

		level.var_301E delete();
	}
}