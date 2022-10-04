/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42352.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 61
 * Decompile Time: 29 ms
 * Timestamp: 4/20/2022 8:23:22 PM
*******************************************************************/

//Function Number: 1
lib_A570::func_8298()
{
	level.createfxexploders = [];
	foreach(var_01 in level.createfxent)
	{
		if(!isdefined(var_01))
		{
			continue;
		}

		if(var_01.v["type"] != "exploder")
		{
			continue;
		}

		if(!isdefined(var_01.v["exploder"]))
		{
			continue;
		}

		var_02 = var_01.v["exploder"];
		if(!isdefined(level.createfxexploders[var_02]))
		{
			level.createfxexploders[var_02] = [];
		}

		level.createfxexploders[var_02][level.createfxexploders[var_02].size] = var_01;
	}

	level.createfxbyfxid = [];
	foreach(var_01 in level.createfxent)
	{
		if(!isdefined(var_01))
		{
			continue;
		}

		if(!isdefined(var_01.v["fxid"]))
		{
			continue;
		}

		var_05 = var_01.v["fxid"];
		if(!isdefined(level.createfxbyfxid[var_05]))
		{
			level.createfxbyfxid[var_05] = [];
		}

		level.createfxbyfxid[var_05][level.createfxbyfxid[var_05].size] = var_01;
	}

	thread lib_A570::func_82E6();
	thread lib_A570::func_8103();
	level.var_3B96 = 0;
}

//Function Number: 2
lib_A570::func_3F86(param_00)
{
	param_00 = lib_A59A::func_8F4D(param_00);
	if(isdefined(level.createfxbyfxid))
	{
		return level.createfxbyfxid[param_00];
	}

	var_01 = [];
	foreach(var_03 in level.createfxent)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		if(var_03.v["fxid"] == param_00)
		{
			var_01[var_01.size] = var_03;
		}
	}

	return var_01;
}

//Function Number: 3
lib_A570::func_671E(param_00)
{
	var_01 = common_scripts\_exploder::getexploders(param_00);
	if(isdefined(var_01))
	{
		foreach(var_03 in var_01)
		{
			var_03 common_scripts\utility::pauseeffect();
		}
	}
}

//Function Number: 4
lib_A570::func_671F(param_00)
{
	var_01 = lib_A570::func_3F86(param_00);
	if(isdefined(var_01))
	{
		foreach(var_03 in var_01)
		{
			var_03 common_scripts\utility::pauseeffect();
		}
	}
}

//Function Number: 5
lib_A570::func_748C(param_00,param_01)
{
	var_02 = lib_A570::func_3F86(param_00);
	if(isdefined(var_02))
	{
		foreach(var_04 in var_02)
		{
			if(isdefined(param_01) && var_04.v["type"] == param_01)
			{
				continue;
			}

			var_04 lib_A59A::func_748A();
		}
	}
}

//Function Number: 6
lib_A570::func_59F1(param_00,param_01,param_02)
{
	var_03 = spawnstruct();
	var_03.var_205A[0] = vectornormalize(param_00);
	var_03.var_205A[1] = vectornormalize(param_01);
	var_03.var_205A[2] = vectornormalize(param_02);
}

//Function Number: 7
lib_A570::func_9C65(param_00,param_01)
{
	param_00 = vectornormalize(param_00);
	var_02 = vectordot(param_00,param_01.var_205A[0]);
	var_03 = vectordot(param_00,param_01.var_205A[0]);
	var_04 = vectordot(param_00,param_01.var_205A[0]);
	return (var_02,var_03,var_04);
}

//Function Number: 8
lib_A570::func_7925(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	var_04 = param_01 * 10;
	var_05 = param_02 * 10;
	if(var_05 > 0)
	{
		var_06 = param_00 / var_05;
	}
	else
	{
		var_06 = param_01;
	}

	var_07 = param_03 * 10;
	var_08 = var_04 - var_07;
	if(var_07 > 0)
	{
		var_09 = param_00 / var_07;
	}
	else
	{
		var_09 = param_01;
	}

	var_0A = 0.1;
	param_00 = 0;
	for(var_0B = 0;var_0B < var_04;var_0B++)
	{
		if(var_0B <= var_05)
		{
			param_00 = param_00 + var_06;
		}

		if(var_0B > var_08)
		{
			param_00 = param_00 - var_09;
		}

		earthquake(param_00,var_0A,level.var_31D.var_2E6,500);
		wait(var_0A);
	}
}

//Function Number: 9
lib_A570::func_3B26(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	if(level.createfx_enabled)
	{
		return 0;
	}

	var_08 = common_scripts\utility::spawn_tag_origin();
	var_09 = 1200;
	var_08.var_2E6 = level.var_31D getorigin();
	var_0A = bullettrace(level.var_31D.var_2E6 + (0,0,12),level.var_31D.var_2E6 + (0,0,1200),0,undefined);
	var_0B = distance(var_08.var_2E6,var_0A["position"]);
	var_0C = 0.125;
	var_0D = 2;
	var_0E = 0.3;
	var_0F = 0.5;
	if(isdefined(param_02))
	{
		var_0C = param_02;
	}

	if(isdefined(param_03))
	{
		var_0D = param_03;
	}

	if(isdefined(param_04))
	{
		var_0E = param_04;
	}

	if(isdefined(param_05))
	{
		var_0F = param_05;
	}

	if(isdefined(param_07) && param_07 == 1)
	{
		var_0B = 1;
	}

	if(var_0B < 300)
	{
		if(isdefined(param_01))
		{
			level.var_31D playrumbleonentity(param_01);
		}

		level thread lib_A570::func_7925(var_0C,var_0D,var_0E,var_0F);
		if(isdefined(param_06) && param_06 == 1)
		{
			level thread lib_A570::func_3B27(var_08.var_2E6,var_0D,var_0C);
		}

		if(isdefined(param_00))
		{
			for(var_10 = 0;var_10 < 6;var_10++)
			{
				wait(0.1);
				var_11 = vectornormalize(anglestoforward(level.var_31D getplayerangles()) + (randomfloatrange(-1,1),randomfloatrange(-1,1),0.5)) * 1000;
				var_12 = bullettrace(level.var_31D.var_2E6 + (0,0,12),level.var_31D.var_2E6 + (0,0,12) + var_11,0,undefined);
				var_13 = distance(level.var_31D.var_2E6,var_12["position"]);
				var_14 = vectordot((0,0,-1),vectornormalize(var_0A["normal"]));
				if(var_13 < 450 && var_14 > 0.75)
				{
					playfx(common_scripts\utility::getfx(param_00),var_12["position"]);
				}
			}
		}
	}

	var_08 delete();
}

//Function Number: 10
lib_A570::func_3B27(param_00,param_01,param_02)
{
	var_03 = 0;
	while(var_03 < param_01)
	{
		physicsradiusjitter(param_00,1000,250,0,param_02);
		var_03 = var_03 + 0.1;
		wait(0.1);
	}
}

//Function Number: 11
lib_A570::func_88EA(param_00,param_01,param_02)
{
	var_03 = common_scripts\utility::spawn_tag_origin();
	var_03.var_2E6 = param_00;
	var_03.var_41 = param_01;
	var_04 = playfxontag(common_scripts\utility::getfx(param_02),var_03,"tag_origin");
	var_05 = 500 + randomfloat(1500);
	var_06 = 10 + randomint(20);
	var_07 = 200;
	var_08 = vectornormalize(anglestoforward(param_01));
	var_09 = vectornormalize(common_scripts\utility::randomvector(2));
	var_03.var_2E6 = var_03.var_2E6 + var_07 * (var_09[0],var_09[1],0);
	var_0A = randomfloat(75);
	var_0B = min(1,max(0,var_0A / 90));
	var_0C = vectornormalize(var_08 * 1 - var_0B + (var_09[0],var_09[1],0) * var_0B);
	var_0D = var_0C * var_05 * 0.05;
	var_0E = (0,0,-3);
	for(var_0F = 0;var_0F < var_06;var_0F++)
	{
		var_03.var_2E6 = var_03.var_2E6 + var_0D;
		var_0D = var_0D + var_0E;
		wait 0.05;
	}

	stopfxontag(common_scripts\utility::getfx(param_02),var_03,"tag_origin");
	var_03 delete();
}

//Function Number: 12
lib_A570::func_895D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	var_0A = common_scripts\utility::spawn_tag_origin();
	var_0A.var_2E6 = param_00;
	var_0A.var_41 = param_01;
	var_0B = playfxontag(common_scripts\utility::getfx(param_02),var_0A,"tag_origin");
	var_0C = param_03 + randomfloat(param_04 - param_03);
	var_0D = param_05 + randomint(param_06 - param_05);
	var_0E = param_07;
	var_0F = vectornormalize(anglestoforward(param_01));
	var_10 = vectornormalize(common_scripts\utility::randomvector(2));
	var_0A.var_2E6 = var_0A.var_2E6 + var_0E * (var_10[0],var_10[1],0);
	var_11 = randomfloat(param_08);
	var_12 = min(1,max(0,var_11 / 90));
	var_13 = vectornormalize(var_0F * 1 - var_12 + (var_10[0],var_10[1],0) * var_12);
	var_14 = var_13 * var_0C * 0.05;
	var_15 = (0,0,param_09 * -1) * 0.05 * 0.05;
	for(var_16 = 0;var_16 < var_0D;var_16++)
	{
		var_0A.var_2E6 = var_0A.var_2E6 + var_14;
		var_14 = var_14 + var_15;
		wait 0.05;
	}

	stopfxontag(common_scripts\utility::getfx(param_02),var_0A,"tag_origin");
	var_0A delete();
}

//Function Number: 13
lib_A570::func_83B9(param_00,param_01)
{
	waittillframeend;
	waittillframeend;
	waittillframeend;
	for(;;)
	{
		level waittill("exploding_" + param_00);
		var_02 = common_scripts\_exploder::getexploders(param_00);
		if(isdefined(var_02))
		{
			foreach(var_04 in var_02)
			{
				for(var_05 = 0;var_05 < 6;var_05++)
				{
					thread lib_A570::func_88EA(var_04.v["origin"],var_04.v["angles"],param_01);
				}
			}
		}
	}
}

//Function Number: 14
lib_A570::func_83BA(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	waittillframeend;
	waittillframeend;
	waittillframeend;
	for(;;)
	{
		level waittill("exploding_" + param_00);
		var_0A = common_scripts\_exploder::getexploders(param_00);
		if(isdefined(var_0A))
		{
			foreach(var_0C in var_0A)
			{
				if(!isdefined(var_0C.v["origin"]))
				{
					continue;
				}

				for(var_0D = 0;var_0D < int(param_02);var_0D++)
				{
					thread lib_A570::func_895D(var_0C.v["origin"],var_0C.v["angles"],param_01,param_03,param_04,param_05,param_06,param_07,param_08,param_09);
				}
			}
		}
	}
}

//Function Number: 15
lib_A570::func_1CEF()
{
	if(level.var_31D buttonpresseddevonly("z") == 1)
	{
		return 1;
	}

	return 0;
}

//Function Number: 16
lib_A570::func_21A7()
{
}

//Function Number: 17
lib_A570::func_9E6F(param_00,param_01,param_02,param_03)
{
	waittillframeend;
	common_scripts\utility::flag_init(param_01);
	var_04 = spawnstruct();
	if(!isdefined(level.var_3BC9))
	{
		level.var_3BC9 = [];
		level.var_3BC8 = getdvar("vision_set_current");
		if(level.var_3BC8 == "")
		{
			level.var_3BC8 = "default";
		}

		level.var_3BC7 = level.var_3BC8;
		level.var_3BC6 = 1;
		if(!common_scripts\utility::flag_exist("start_vision_watcher_manager"))
		{
			common_scripts\utility::flag_init("vision_watcher_changed");
		}

		level thread lib_A570::func_9E6D();
	}

	if(param_03 == undefined)
	{
		param_03 = level.var_3BC7;
	}

	var_04.v["vision_set"] = param_00;
	var_04.v["vision_set_exit"] = param_03;
	var_04.v["blendtime"] = param_02;
	var_04.v["active"] = 0;
	var_04.v["prime"] = 0;
	var_04.v["flag"] = param_01;
	level.var_3BC9[level.var_3BC9.size] = var_04;
	for(;;)
	{
		common_scripts\utility::flag_wait(param_01);
		if(var_04.v["active"] == 0)
		{
			for(var_05 = 0;var_05 < level.var_3BC9.size;var_05++)
			{
				level.var_3BC9[var_05].v["prime"] = 0;
			}

			var_04.v["prime"] = 1;
		}

		var_04.v["active"] = 1;
		level.var_3BC6 = param_02;
		common_scripts\utility::flag_set("vision_watcher_changed");
		wait(param_02);
		common_scripts\utility::flag_waitopen(param_01);
		var_04.v["prime"] = 0;
		var_04.v["active"] = 0;
		level.var_3BC8 = var_04.v["vision_set_exit"];
		level.var_3BC6 = param_02;
		common_scripts\utility::flag_set("vision_watcher_changed");
		wait(param_02);
	}
}

//Function Number: 18
lib_A570::func_9E6E(param_00,param_01,param_02)
{
	common_scripts\utility::flag_init(param_01);
	var_03 = getdvar("vision_set_current");
	for(;;)
	{
		common_scripts\utility::flag_wait(param_01);
		visionsetnaked(param_00,param_02);
		wait(1);
		common_scripts\utility::flag_waitopen(param_01);
		visionsetnaked(var_03,param_02);
		wait(1);
	}
}

//Function Number: 19
lib_A570::func_9E6D()
{
	for(;;)
	{
		common_scripts\utility::flag_wait("vision_watcher_changed");
		var_00 = -1;
		var_01 = -1;
		var_02 = 0;
		for(var_03 = 0;var_03 < level.var_3BC9.size;var_03++)
		{
			if(level.var_3BC9[var_03].v["prime"] == 1)
			{
				var_04 = getdvar("vision_set_current");
				if(var_04 != level.var_3BC9[var_03].v["vision_set"])
				{
					lib_A59A::func_9E65(level.var_3BC9[var_03].v["vision_set"],level.var_3BC6);
				}

				var_00 = var_03;
			}

			if(level.var_3BC9[var_03].v["active"] == 1)
			{
				var_01 = 1;
			}
		}

		for(var_03 = 0;var_03 < level.var_3BC9.size;var_03++)
		{
			if(level.var_3BC9[var_03].v["active"] == 1 && var_00 == -1)
			{
				lib_A59A::func_9E65(level.var_3BC9[var_03].v["vision_set"],level.var_3BC9[var_03].v["blendtime"]);
				level.var_3BC9[var_03].v["prime"] = 1;
				var_00 = var_03;
				var_03 = 100000;
				common_scripts\utility::flag_clear("vision_watcher_changed");
				wait(level.var_3BC6);
				continue;
			}
		}

		if(var_01 != 1)
		{
			lib_A59A::func_9E65(level.var_3BC8,level.var_3BC6);
		}

		common_scripts\utility::flag_clear("vision_watcher_changed");
		wait(level.var_3BC6);
	}
}

//Function Number: 20
lib_A570::func_3B97(param_00,param_01,param_02,param_03)
{
	common_scripts\utility::flag_init(param_01);
	common_scripts\utility::flag_init("fx_zone_" + param_00 + "_active");
	if(isdefined(param_02))
	{
		common_scripts\utility::flag_init(param_02);
	}

	if(isdefined(param_03))
	{
		if(!common_scripts\utility::flag_exist(param_03))
		{
			common_scripts\utility::flag_init(param_03);
		}
	}

	wait 0.05;
	if(isdefined(param_03))
	{
		thread lib_A570::func_3B9B(param_00,param_03,param_01,param_02);
	}

	thread lib_A570::func_3B9A(param_00,param_01,param_02);
}

//Function Number: 21
lib_A570::func_3B99(param_00,param_01,param_02)
{
	common_scripts\utility::flag_init(param_01);
	common_scripts\utility::flag_init("fx_zone_" + param_00 + "_active");
	if(isdefined(param_02))
	{
		common_scripts\utility::flag_init(param_02);
	}

	wait 0.05;
	thread lib_A570::func_3B98(param_00,param_01,param_02);
}

//Function Number: 22
lib_A570::func_3856(param_00,param_01)
{
	while(common_scripts\utility::flag(param_00) || common_scripts\utility::flag(param_01))
	{
		level common_scripts\utility::waittill_either(param_00,param_01);
	}
}

//Function Number: 23
lib_A570::func_7C77(param_00)
{
	level notify("fx_zone_" + param_00 + "_activating");
	common_scripts\utility::flag_set("fx_zone_" + param_00 + "_active");
}

//Function Number: 24
lib_A570::func_7C7A(param_00)
{
	level notify("fx_zone_" + param_00 + "_deactivating");
	common_scripts\utility::flag_clear("fx_zone_" + param_00 + "_active");
}

//Function Number: 25
lib_A570::func_3B9A(param_00,param_01,param_02)
{
	for(;;)
	{
		if(!isdefined(param_02))
		{
			param_02 = param_01;
		}

		common_scripts\utility::flag_wait_either(param_01,param_02);
		lib_A570::func_7C77(param_00);
		common_scripts\_exploder::exploder(param_00);
		lib_A570::func_3856(param_01,param_02);
		lib_A570::func_7C7A(param_00);
		lib_A570::func_671E(param_00);
		wait(2);
	}
}

//Function Number: 26
lib_A570::func_3B9B(param_00,param_01,param_02,param_03)
{
	for(;;)
	{
		if(!isdefined(param_03))
		{
			param_03 = param_02;
		}

		common_scripts\utility::flag_wait(param_01);
		lib_A570::func_7C7A(param_00);
		lib_A570::func_671E(param_00);
		lib_A570::func_7C7A(param_00);
		common_scripts\utility::flag_waitopen(param_01);
		if(common_scripts\utility::flag(param_02) || common_scripts\utility::flag(param_03))
		{
			lib_A570::func_7C77(param_00);
			common_scripts\_exploder::exploder(param_00);
		}
	}
}

//Function Number: 27
lib_A570::func_3B98(param_00,param_01,param_02)
{
	for(;;)
	{
		if(!isdefined(param_02))
		{
			param_02 = param_01;
		}

		common_scripts\utility::flag_wait_all(param_01,param_02);
		lib_A570::func_7C77(param_00);
		common_scripts\_exploder::exploder(param_00);
		lib_A570::func_3856(param_01,param_02);
		lib_A570::func_7C7A(param_00);
		lib_A570::func_671E(param_00);
		wait(2);
	}
}

//Function Number: 28
lib_A570::func_3B9D(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		common_scripts\utility::flag_init(param_01);
	}

	common_scripts\utility::flag_init("fx_zone_" + param_00 + "_active");
	wait 0.05;
	for(;;)
	{
		wait(0.1);
		common_scripts\utility::flag_waitopen(param_01);
		lib_A570::func_7C77(param_00);
		common_scripts\_exploder::exploder(param_00);
		common_scripts\utility::flag_wait(param_01);
		lib_A570::func_7C7A(param_00);
		lib_A570::func_671E(param_00);
		wait(2);
	}
}

//Function Number: 29
lib_A570::func_671A(param_00)
{
	var_01 = lib_A570::func_3F86(param_00);
	if(isdefined(var_01))
	{
		foreach(var_03 in var_01)
		{
			if(var_03.v["type"] == "exploder")
			{
				continue;
			}

			var_03 common_scripts\utility::pauseeffect();
		}
	}
}

//Function Number: 30
lib_A570::func_532E(param_00)
{
	var_01 = lib_A570::func_3F86(param_00);
	if(isdefined(var_01))
	{
		foreach(var_03 in var_01)
		{
			if(var_03.v["type"] == "exploder")
			{
				continue;
			}

			if(isdefined(var_03.looper))
			{
				function_0155(var_03.looper,1);
			}

			wait 0.05;
		}

		foreach(var_03 in var_01)
		{
			if(var_03.v["type"] == "exploder")
			{
				continue;
			}

			var_03 common_scripts\utility::pauseeffect();
		}
	}
}

//Function Number: 31
lib_A570::func_3B9C(param_00,param_01)
{
	common_scripts\utility::flag_init("fx_zone_" + param_00 + "_active");
	for(;;)
	{
		common_scripts\utility::flag_wait(param_01);
		lib_A570::func_7C77(param_00);
		common_scripts\_exploder::exploder(param_00);
		common_scripts\utility::flag_waitopen(param_01);
		lib_A570::func_7C7A(param_00);
		var_02 = common_scripts\_exploder::getexploders(param_00);
		if(isdefined(var_02))
		{
			foreach(var_04 in var_02)
			{
				var_04 common_scripts\utility::pauseeffect();
			}
		}

		wait(2);
	}
}

//Function Number: 32
lib_A570::func_3D5F(param_00)
{
	var_01 = undefined;
	var_02 = common_scripts\_exploder::getexploders(param_00);
	if(isdefined(var_02))
	{
		foreach(var_04 in var_02)
		{
			var_01 = var_04;
		}
	}

	return var_01;
}

//Function Number: 33
lib_A570::func_3D60(param_00)
{
	var_01 = [];
	var_02 = common_scripts\_exploder::getexploders(param_00);
	if(isdefined(var_02))
	{
		var_01 = var_02;
	}

	return var_01;
}

//Function Number: 34
lib_A570::func_3B83(param_00)
{
	var_01 = level.var_31D getplayerangles();
	var_02 = vectornormalize(anglestoforward(var_01));
}

//Function Number: 35
lib_A570::func_3B82(param_00,param_01,param_02)
{
	if(!common_scripts\utility::flag_exist("fx_spot_flare_kill"))
	{
		common_scripts\utility::flag_init("fx_spot_flare_kill");
	}

	if(!isdefined(param_01))
	{
		param_01 = (-90,0,0);
	}

	if(!isdefined(param_02))
	{
		param_02 = 10000;
	}

	var_03 = common_scripts\utility::spawn_tag_origin();
	var_04 = level.var_31D.var_2E6;
	var_05 = level.var_31D getplayerangles();
	var_06 = vectornormalize(anglestoforward(param_01 * -1));
	var_07 = var_06 * -1 * param_02 + var_04;
	var_03.var_2E6 = var_07;
	var_08 = vectornormalize(anglestoforward(var_05));
	var_09 = min(1,max(0.001,vectordot(var_08,var_06 * -1)));
	var_09 = var_09 / var_09;
	var_0A = vectornormalize(var_08 * var_09 + var_06 * 2);
	var_0B = vectornormalize(var_0A - var_06) * var_09;
	var_0C = vectortoangles(vectornormalize(var_0A + var_0B));
	var_03.var_41 = var_0C;
	playfxontag(common_scripts\utility::getfx(param_00),var_03,"tag_origin");
	while(!common_scripts\utility::flag("fx_spot_flare_kill"))
	{
		var_04 = level.var_31D.var_2E6;
		var_05 = level.var_31D getplayerangles();
		var_06 = vectornormalize(anglestoforward(param_01));
		var_07 = var_06 * param_02 + var_04;
		var_03.var_2E6 = var_07;
		var_08 = vectornormalize(anglestoforward(var_05));
		var_09 = min(1,max(0.001,vectordot(var_08,var_06)));
		var_09 = var_09 * var_09 * var_09 * var_09;
		var_09 = 1 - var_09;
		var_0A = vectornormalize(var_08 * var_09 + var_06 * 2);
		var_0B = vectornormalize(var_0A - var_06) * var_09;
		var_0C = vectortoangles(vectornormalize(var_0A + var_0B * 2));
		var_03.var_41 = var_0C;
		wait 0.05;
	}

	stopfxontag(common_scripts\utility::getfx(param_00),var_03,"tag_origin");
	var_03 delete();
}

//Function Number: 36
lib_A570::func_3D61(param_00,param_01,param_02)
{
}

//Function Number: 37
lib_A570::func_23B1()
{
	return 0;
}

//Function Number: 38
lib_A570::func_3D82(param_00,param_01,param_02)
{
	var_03 = [];
	if(!isdefined(param_01))
	{
		param_01 = "default";
	}

	var_04 = spawnstruct();
	var_04.v["default"] = spawnstruct();
	var_04.v["default"].v["l_arm"] = ["j_shoulder_le","j_elbow_le","j_wrist_le"];
	var_04.v["default"].v["r_arm"] = ["j_shoulder_ri","j_elbow_ri","j_wrist_ri"];
	var_04.v["default"].v["l_leg"] = ["j_hip_le","j_knee_le","j_ankle_le"];
	var_04.v["default"].v["r_leg"] = ["j_hip_ri","j_knee_ri","j_ankle_ri"];
	var_04.v["default"].v["torso"] = ["j_mainroot","j_spine4","j_neck"];
	var_04.v["default"].v["head"] = ["j_neck","j_head"];
	if(isdefined(param_02))
	{
		var_05 = "override";
		if(isdefined(param_02.v["name"]))
		{
			var_05 = param_02.v["name"];
		}

		var_04.v[var_05] = param_02;
	}

	foreach(var_07 in var_04.v[param_01].v[param_00])
	{
		var_03[var_03.size] = var_07;
	}

	return var_03;
}

//Function Number: 39
lib_A570::func_8119(param_00)
{
	if(!isdefined(param_00.v["ent"]))
	{
		return 1;
	}

	if(isdefined(param_00.v["chain"]))
	{
		param_00.v["bones"] = lib_A570::func_3D82(param_00.v["chain"],param_00.v["chainset_name"],param_00.v["chainset_override"]);
	}
	else
	{
		return 1;
	}

	param_00.v["tags"] = [];
	param_00.v["tag_lens"] = [];
	for(var_01 = 0;var_01 < param_00.v["bones"].size - 1;var_01++)
	{
		var_02 = param_00.v["ent"] gettagorigin(param_00.v["bones"][var_01]);
		var_03 = param_00.v["ent"] gettagangles(param_00.v["bones"][var_01]);
		var_04 = param_00.v["ent"] gettagorigin(param_00.v["bones"][var_01 + 1]);
		if(isdefined(var_02) && isdefined(var_04))
		{
			var_05 = var_04 - var_02;
			var_06 = length(var_05);
			var_07 = common_scripts\utility::spawn_tag_origin();
			var_07.var_2E6 = var_02;
			var_07.var_41 = vectortoangles(var_05);
			var_07 linkto(param_00.v["ent"],param_00.v["bones"][var_01]);
			param_00.v["tags"][param_00.v["tags"].size] = var_07;
			param_00.v["tag_lens"][param_00.v["tag_lens"].size] = var_06;
		}
	}
}

//Function Number: 40
lib_A570::func_6951(param_00)
{
	level endon(param_00.v["kill_notify"]);
	for(;;)
	{
		for(var_01 = 0;var_01 < param_00.v["tags"].size;var_01++)
		{
			var_02 = param_00.v["tags"][var_01];
			var_03 = param_00.v["tag_lens"][var_01];
			var_04 = anglestoforward(var_02.var_41);
			var_05 = var_02.var_2E6 + var_04 * var_03 * randomfloat(1);
			playfx(param_00.v["fx"],var_05,var_04,anglestoup(var_02.var_41));
		}

		wait(param_00.v["looptime"]);
	}
}

//Function Number: 41
lib_A570::func_694F(param_00)
{
	level endon(param_00.v["kill_notify"]);
	var_01 = [];
	for(var_02 = 0;var_02 < 15;var_02++)
	{
		var_01[var_02] = common_scripts\utility::spawn_tag_origin();
	}

	var_03 = 0;
	for(;;)
	{
		for(var_04 = 0;var_04 < param_00.v["tags"].size;var_04++)
		{
			if(var_03 == 15)
			{
				var_03 = 0;
			}

			var_05 = param_00.v["tags"][var_04];
			var_06 = param_00.v["tag_lens"][var_04];
			var_07 = anglestoforward(var_05.var_41);
			var_08 = var_01[var_03];
			var_08 linkto(var_05,"tag_origin",var_07 * var_06 * randomfloat(1),(0,0,0));
			playfxontag(param_00.v["fx"],var_08,"tag_origin");
			var_03++;
		}

		wait(param_00.v["looptime"]);
	}
}

//Function Number: 42
lib_A570::func_530E(param_00)
{
	level waittill(param_00.v["kill_notify"]);
	for(var_01 = 0;var_01 < param_00.v["tags"].size;var_01++)
	{
		param_00.v["tags"][var_01] delete();
	}

	param_00.v["tags"] = [];
}

//Function Number: 43
lib_A570::func_530C(param_00)
{
	level waittill(param_00.v["kill_notify"]);
	for(var_01 = 0;var_01 < param_00.v["tags"].size;var_01++)
	{
		param_00.v["tags"][var_01] delete();
	}

	param_00.v["tags"] = [];
}

//Function Number: 44
lib_A570::func_6950(param_00)
{
	var_01 = param_00.v["ent"];
	var_02 = param_00.v["fx"];
	var_03 = param_00.v["chain"];
	var_04 = param_00.v["looptime"];
	var_05 = param_00.v["chainset_name"];
	var_06 = param_00.v["chainset_override"];
	if(!isdefined(var_01))
	{
		return undefined;
	}

	if(!isdefined(var_02))
	{
		return undefined;
	}

	if(!isdefined(var_03))
	{
		var_03 = "all";
	}

	if(!isdefined(var_04))
	{
		var_04 = 1;
	}

	if(!isdefined(var_05))
	{
		var_05 = "default";
	}

	if(!isdefined(var_06))
	{
		var_06 = undefined;
	}

	var_07 = [];
	if(var_03 == "all")
	{
		var_07[var_07.size] = "head";
		var_07[var_07.size] = "r_arm";
		var_07[var_07.size] = "l_arm";
		var_07[var_07.size] = "r_leg";
		var_07[var_07.size] = "l_leg";
		var_07[var_07.size] = "torso";
	}
	else
	{
		var_07[0] = var_03;
	}

	var_08 = var_01.model + "kill_fx_onactor";
	var_09 = [];
	foreach(var_0B in var_07)
	{
		var_0C = spawnstruct();
		var_0C.v["ent"] = var_01;
		var_0C.v["chain"] = var_0B;
		var_0C.v["fx"] = var_02;
		var_0C.v["looptime"] = var_04;
		var_0C.v["kill_notify"] = var_08;
		var_0C.v["chainset_name"] = var_05;
		var_0C.v["chainset_override"] = var_06;
		lib_A570::func_8119(var_0C);
		thread lib_A570::func_6951(var_0C);
		thread lib_A570::func_530E(var_0C);
		var_09[var_09.size] = var_0C;
	}

	return var_08;
}

//Function Number: 45
lib_A570::func_694E(param_00)
{
	var_01 = param_00.v["ent"];
	var_02 = param_00.v["fx"];
	var_03 = param_00.v["chain"];
	var_04 = param_00.v["looptime"];
	var_05 = param_00.v["chainset_name"];
	var_06 = param_00.v["chainset_override"];
	if(!isdefined(var_01))
	{
		return undefined;
	}

	if(!isdefined(var_02))
	{
		return undefined;
	}

	if(!isdefined(var_03))
	{
		var_03 = "all";
	}

	if(!isdefined(var_04))
	{
		var_04 = 1;
	}

	if(!isdefined(var_05))
	{
		var_05 = "default";
	}

	if(!isdefined(var_06))
	{
		var_06 = undefined;
	}

	var_07 = [];
	if(var_03 == "all")
	{
		var_07[var_07.size] = "head";
		var_07[var_07.size] = "r_arm";
		var_07[var_07.size] = "l_arm";
		var_07[var_07.size] = "r_leg";
		var_07[var_07.size] = "l_leg";
		var_07[var_07.size] = "torso";
	}
	else
	{
		var_07[0] = var_03;
	}

	var_08 = var_01.model + "kill_fx_onactor";
	var_09 = [];
	foreach(var_0B in var_07)
	{
		var_0C = spawnstruct();
		var_0C.v["ent"] = var_01;
		var_0C.v["chain"] = var_0B;
		var_0C.v["fx"] = var_02;
		var_0C.v["looptime"] = var_04;
		var_0C.v["kill_notify"] = var_08;
		var_0C.v["chainset_name"] = var_05;
		var_0C.v["chainset_override"] = var_06;
		lib_A570::func_8119(var_0C);
		thread lib_A570::func_694F(var_0C);
		thread lib_A570::func_530C(var_0C);
		var_09[var_09.size] = var_0C;
	}

	return var_08;
}

//Function Number: 46
lib_A570::func_82E6()
{
	var_00 = getentarray("wake_volume","targetname");
	foreach(var_02 in var_00)
	{
		lib_A594::func_9807(var_02);
	}
}

//Function Number: 47
lib_A570::func_8103()
{
	var_00 = getentarray("flipbook_model","script_noteworthy");
	common_scripts\utility::array_thread(var_00,::lib_A570::func_38E1);
	var_01 = getentarray("model_flicker","script_noteworthy");
	common_scripts\utility::array_thread(var_01,::lib_A570::func_5D36);
}

//Function Number: 48
lib_A570::func_38E1()
{
	var_00 = [];
	var_00[0] = self;
	var_01 = self;
	for(;;)
	{
		var_02 = getent(var_01.target,"targetname");
		if(var_02 == self)
		{
			break;
		}

		var_02 hide();
		if(isdefined(var_02.var_7A22))
		{
			if(var_02.var_7A22 == "1")
			{
				var_02.var_2E6 = var_02.var_2E6;
			}
			else
			{
				var_02.var_2E6 = self.var_2E6;
			}
		}
		else
		{
			var_02.var_2E6 = self.var_2E6;
		}

		var_01 = var_02;
	}

	var_01 = self;
	for(;;)
	{
		if(isdefined(var_01.script_delay))
		{
			if(var_01.script_delay == 0)
			{
				wait(randomfloatrange(0.05,0.35));
			}

			if(var_01.script_delay == 66)
			{
				wait(randomfloatrange(0.2,2.5));
			}
			else
			{
				wait(var_01.script_delay);
			}
		}
		else
		{
			wait(1);
		}

		var_02 = getent(var_01.target,"targetname");
		var_01 hide();
		var_02 show();
		var_01 = var_02;
	}
}

//Function Number: 49
lib_A570::func_5D36()
{
	self endon("death");
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		var_00 = randomfloatrange(2,4);
		var_01 = randomintrange(2,4);
		wait(var_00);
		for(var_02 = 0;var_02 < var_01;var_02++)
		{
			self hide();
			wait(randomfloatrange(0.1,0.3));
			self show();
			wait(randomfloatrange(0.05,0.06));
		}

		wait(0.05);
	}
}

//Function Number: 50
lib_A570::func_9DEA(param_00)
{
	thread lib_A570::func_3B3A(param_00,50000);
}

//Function Number: 51
lib_A570::func_3B3A(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 50000;
	}

	var_02 = common_scripts\utility::spawn_tag_origin();
	var_02.var_2E6 = level.var_31D.var_2E6 + lib_A570::func_3E7D() * param_01;
	playfxontag(common_scripts\utility::getfx(param_00),var_02,"tag_origin");
	var_03 = 0.1;
	for(;;)
	{
		var_02 moveto(level.var_31D.var_2E6 + lib_A570::func_3E7D() * param_01,var_03);
		wait(var_03);
	}
}

//Function Number: 52
lib_A570::func_7EC4(param_00)
{
	level.var_8FAF = param_00;
	wait(0.3);
	function_0102(param_00);
}

//Function Number: 53
lib_A570::func_3E7D()
{
	if(isdefined(level.var_8FAF))
	{
		return anglestoforward(level.var_8FAF);
	}

	return function_0047();
}

//Function Number: 54
lib_A570::func_3536(param_00)
{
}

//Function Number: 55
lib_A570::func_530D(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_01 * 20;var_02++)
	{
		wait(0.05);
	}

	param_00 delete();
}

//Function Number: 56
lib_A570::func_8BB2(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	var_09 = param_01;
	var_0A = 1;
	var_0B = 0.35;
	var_0C = 60;
	var_0D = [];
	var_0E = undefined;
	if(isdefined(param_02))
	{
		var_0A = param_02;
	}

	if(isdefined(param_03))
	{
		var_0B = clamp(param_03,0,var_0A);
	}

	if(!isdefined(param_05))
	{
		param_05 = 0;
	}

	if(param_05 == 1)
	{
		param_06 = undefined;
	}

	for(var_0F = 0;var_0F < param_01.size;var_0F++)
	{
		if(param_05 == 1)
		{
			var_0D[var_0D.size] = (randomfloatrange(-360,360),randomfloatrange(-360,360),randomfloatrange(-360,360));
			continue;
		}

		var_0D[var_0D.size] = (270,0,0);
	}

	if(isdefined(param_06))
	{
		var_0D = param_06;
	}

	if(isdefined(param_04))
	{
		var_10 = param_04;
	}

	if(isdefined(param_07))
	{
		var_0E = param_07;
	}

	if(isdefined(param_04))
	{
		level endon(param_04);
	}

	for(;;)
	{
		var_11 = clamp(randomfloatrange(-1 * var_0B,var_0B) + var_0A,0,var_0A + var_0B);
		wait(var_11);
		var_12 = level.var_31D getplayerangles();
		var_13 = vectornormalize(anglestoforward(var_12));
		var_14 = -1;
		var_15 = [];
		var_16 = [];
		for(var_0F = 0;var_0F < var_09.size;var_0F++)
		{
			var_17 = vectornormalize(var_09[var_0F] - level.var_31D.var_2E6);
			if(vectordot(var_13,var_17) > 0.45)
			{
				var_14 = 1;
				var_15[var_15.size] = var_09[var_0F];
				var_16[var_16.size] = var_0D[var_0F];
			}
		}

		if(var_14 > 0)
		{
			var_18 = randomint(var_15.size);
			if(isdefined(var_18))
			{
				var_19 = var_15[var_18];
				var_1A = var_16[var_18];
				var_1B = anglestoforward(var_1A);
				var_1C = anglestoup(var_1A);
				var_1D = "pre_delay_sound_" + lib_A5DE::func_8712();
				if(isstring(param_08))
				{
					var_1E = param_08 + "_" + lib_A5DE::func_8712();
					lib_A5DE::snd_message(var_0E,var_19,var_1E);
					thread lib_A570::func_8BB3(var_1E,var_1D);
					level waittill(var_1E);
				}
				else if(isdefined(var_0E))
				{
					lib_A5DE::snd_message(var_0E,var_19);
				}

				level notify(var_1D);
				playfx(common_scripts\utility::getfx(param_00),var_19,var_1B,var_1C);
			}

			wait(0.05);
		}
	}
}

//Function Number: 57
lib_A570::func_8BB3(param_00,param_01)
{
	level endon(param_01);
	var_02 = 2.5;
	wait(var_02);
	level notify(param_00);
}

//Function Number: 58
lib_A570::func_831A(param_00)
{
	level.var_3BB5 = [];
	var_01 = common_scripts\utility::getstructarray(param_00,"script_noteworthy");
	if(var_01.size > 0)
	{
		foreach(var_03 in var_01)
		{
			thread lib_A570::func_833E(var_03);
		}
	}
}

//Function Number: 59
lib_A570::func_833E(param_00)
{
	var_01 = param_00;
	var_02 = common_scripts\utility::getstruct(param_00.target,"targetname");
	var_03 = param_00.var_79AD;
	var_04 = param_00.var_79AC;
	var_05 = vectornormalize(var_02.var_2E6 - var_01.var_2E6);
	var_06 = vectortoangles(var_05) + (-90,0,0);
	var_07 = randomintrange(var_03,var_04);
	var_08 = length(var_02.var_2E6 - var_01.var_2E6);
	var_09 = [];
	for(var_0A = 0;var_0A < var_07;var_0A++)
	{
		var_0B = var_01.var_2E6 + randomfloat(var_08) * var_05;
		var_0C = spawnfx(common_scripts\utility::getfx(param_00.script_fxid),var_0B,anglestoforward(var_06),anglestoup(var_06));
		triggerfx(var_0C);
		var_0D = spawnstruct();
		var_0D.ent = var_0C;
		var_0D.var_3BB4 = var_0B;
		var_0D.var_3B9E = var_06;
		var_09[var_09.size] = var_0D;
		level.var_3B7A[param_00.targetname] = var_09;
	}
}

//Function Number: 60
lib_A570::func_900B(param_00,param_01,param_02,param_03)
{
	foreach(var_05 in level.var_3B7A[param_00])
	{
		var_06 = randomfloat(param_03);
		lib_A59A::delaythread(var_06,::lib_A570::func_67C6,var_05,param_01,param_02);
	}
}

//Function Number: 61
lib_A570::func_67C6(param_00,param_01,param_02)
{
	var_03 = param_00.var_3B9E + param_02;
	playfx(common_scripts\utility::getfx(param_01),param_00.var_3BB4,anglestoforward(var_03),anglestoup(var_03));
	param_00.ent delete();
}