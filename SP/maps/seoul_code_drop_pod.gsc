/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_code_drop_pod.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 42
 * Decompile Time: 1596 ms
 * Timestamp: 4/20/2022 8:21:15 PM
*******************************************************************/

//Function Number: 1
func_2F83()
{
	common_scripts\utility::flag_init("turn_on_seo_advertisement");
}

//Function Number: 2
func_4F72()
{
	common_scripts\utility::flag_set("set_seoul_space_entry_lighting");
	thread func_824C();
}

//Function Number: 3
func_824C()
{
	thread func_826F();
	thread func_8223();
	thread func_45FD();
	level.var_31D waittill("y_pressed");
	lib_A56F::func_A302(5,2,1);
	wait(1);
	level.var_31D waittill("a_pressed");
	level notify("open_hatch");
	wait(1);
	level.var_31D waittill("a_pressed");
	level notify("start_deployment");
}

//Function Number: 4
func_45FD()
{
	var_00 = getentarray("reentry_fire_01","targetname");
	common_scripts\utility::array_call(var_00,::hide);
	var_01 = getentarray("reentry_fire_brush","targetname");
	foreach(var_03 in var_01)
	{
		var_03 linkto(level.var_1C14,"tag_origin");
	}

	common_scripts\utility::array_call(var_01,::hide);
	level waittill("entering_upper_atmosphere");
	thread func_7675();
	if(level.nextgen)
	{
		thread lib_A59A::func_9E65("seoul_space_orange",10);
	}

	earthquake(0.2,25,level.var_31D.var_2E6,500);
	wait(12);
	common_scripts\utility::array_call(var_01,::show);
	level notify("ok_to_teleport_player");
	thread func_592E();
	wait(2);
	if(level.nextgen)
	{
		thread lib_A59A::func_9E65("seoul_space_white",10);
	}

	earthquake(0.1,5,level.var_31D.var_2E6,500);
	level waittill("never_true");
	level waittill("should_telport_player");
	level waittill("should_telport_player");
	common_scripts\utility::array_call(var_01,::hide);
	if(level.nextgen)
	{
		thread lib_A59A::func_9E65("seoul",12);
	}

	wait(5);
	earthquake(0.2,25,level.var_31D.var_2E6,500);
	thread func_592E();
}

//Function Number: 5
func_592E()
{
	for(var_00 = 0;var_00 < 2;var_00++)
	{
		for(var_01 = 0;var_01 < 10;var_01++)
		{
			var_02 = randomfloatrange(0.1,0.5);
			var_03 = randomfloatrange(0.1,1);
			lib_A56F::func_A302(0.1,var_02,var_03);
			wait(randomfloatrange(0.1,1));
		}

		thread lib_A56F::func_A302(0.1,0.5,1);
		wait(0.1);
		level notify("should_telport_player");
	}
}

//Function Number: 6
func_7675()
{
}

//Function Number: 7
func_811C()
{
	var_00 = getentarray("galaxy_back_hatch","targetname");
	var_01 = getent("galaxy_back_hatch_org","targetname");
	var_02 = var_01 common_scripts\utility::spawn_tag_origin();
	foreach(var_04 in var_00)
	{
		var_04 linkto(var_02,"tag_origin");
	}

	level waittill("open_hatch");
	var_06 = (-90,var_02.var_41[1],var_02.var_41[2]);
	var_02 rotateto(var_06,8,3,1);
}

//Function Number: 8
func_8223()
{
	func_8261();
	func_5F39();
	level waittill("reentry_fx_off");
}

//Function Number: 9
func_5F39()
{
}

//Function Number: 10
func_826F()
{
	var_00 = getent("pod_center","targetname");
	var_01 = var_00 common_scripts\utility::spawn_tag_origin();
	level.var_1C14 = var_01;
	thread func_8260();
	thread func_82A4();
	level.var_31D waittill("x_pressed");
	level notify("begin_deorbit");
	earthquake(0.2,1,level.var_31D.var_2E6,64);
	thread func_451B();
	thread func_4611();
	thread func_456B();
	thread func_461A();
	thread func_75F3(var_01);
}

//Function Number: 11
func_461A()
{
	var_00 = getent("sunlight_location","targetname");
	var_01 = var_00 common_scripts\utility::spawn_tag_origin();
	var_01.var_41 = vectortoangles(level.var_1C14.var_2E6 - var_01.var_2E6);
	level waittill("begin_deorbit");
	playfxontag(common_scripts\utility::getfx("player_light"),var_01,"tag_origin");
	var_01 linkto(level.var_1C14,"tag_origin");
	level waittill("reentry");
	stopfxontag(common_scripts\utility::getfx("player_light"),var_01,"tag_origin");
}

//Function Number: 12
func_456B()
{
	var_00 = getent("earth_disc","targetname");
	var_00 thread func_5F07(level.var_1C14);
	level waittill("ok_to_teleport_player");
	var_00 delete();
}

//Function Number: 13
func_4611()
{
	var_00 = getentarray("space_brush","targetname");
	foreach(var_02 in var_00)
	{
		var_02 linkto(level.var_1C14,"tag_origin");
	}

	level waittill("dropped_from_pod");
	foreach(var_02 in var_00)
	{
		var_02 delete();
	}
}

//Function Number: 14
func_451B()
{
	var_00 = getentarray("reentry_gray_brush","targetname");
	level waittill("begin_deorbit");
	common_scripts\utility::array_call(var_00,::hide);
	common_scripts\utility::flag_wait("entering_atmosphere");
}

//Function Number: 15
func_4566()
{
	function_005C();
	level.var_6E10 showpart(level.var_6E10.var_90C7);
	level waittill("screen_intialize");
	function_00D3("cg_cinematicFullScreen","0");
	function_0059("drop_pod_glass_reboot");
	wait(3);
	func_2F5D();
	common_scripts\utility::flag_wait("turn_on_seo_advertisement");
	maps\seoul::func_4C68();
}

//Function Number: 16
func_2F4F(param_00)
{
	level.var_3323 delete();
}

//Function Number: 17
func_2F5D()
{
	level notify("pod_screen_on");
	if(level.var_6E10.var_9E04)
	{
		function_0059("drop_pod_glass_idle");
		level.var_6E10.var_9E04 = 0;
	}
}

//Function Number: 18
func_2F5B(param_00)
{
	level notify("pod_screen_off");
	function_0059("drop_pod_glass_evacuate");
	level notify("portal_vista_off");
}

//Function Number: 19
func_2F5C(param_00)
{
	function_0059("drop_pod_glass_damaged");
	level notify("pod_screen_off");
}

//Function Number: 20
func_2F59(param_00)
{
	if(level.var_6E10.var_9E02 < 2)
	{
		function_0059("drop_pod_glass_glitch");
		wait 0.05;
		level.var_6E10.var_9E02++;
	}
}

//Function Number: 21
func_2F58(param_00)
{
	function_0059("drop_pod_glass_reboot");
	level thread lib_A5CE::func_4F13(param_00);
}

//Function Number: 22
func_2F5E(param_00)
{
	function_0059("drop_pod_glass_warning");
	level notify("pod_screen_bootup");
}

//Function Number: 23
func_2F5A(param_00)
{
	if(level.var_6E10.var_9E05 == 1)
	{
		level notify("building_2_crash");
	}

	level.var_6E10.var_9E05++;
}

//Function Number: 24
func_45F6(param_00)
{
	for(;;)
	{
		level waittill("pod_screen_on");
		level.var_6E10 showpart(level.var_6E10.var_90C8);
		level.var_6E10 showpart(level.var_6E10.var_90C6);
		param_00 hidepart("TAG_ROOF");
		level.var_6E10 hidepart(level.var_6E10.var_90C7);
	}
}

//Function Number: 25
func_45F5(param_00)
{
	for(;;)
	{
		level waittill("pod_screen_off");
		level.var_6E10 showpart(level.var_6E10.var_90C7);
		param_00 showpart("TAG_ROOF");
	}
}

//Function Number: 26
func_45F4(param_00)
{
	for(;;)
	{
		level waittill("pod_screen_bootup");
		level.var_6E10 hidepart(level.var_6E10.var_90C7);
		param_00 hidepart("TAG_ROOF");
	}
}

//Function Number: 27
func_39FD(param_00)
{
	if(level.var_6E10.var_39FE == 0)
	{
		level.var_31D method_8031(85,3);
	}
	else
	{
		level.var_31D method_8031(85,0.3);
	}

	level.var_6E10.var_39FE++;
}

//Function Number: 28
func_39F6(param_00)
{
	level.var_31D method_8031(65,0.3);
}

//Function Number: 29
func_2F4B(param_00)
{
	var_01 = 8;
	var_02 = 1;
	var_03 = 8;
	function_00D3("r_chromaticAberrationTweaks",1);
	function_00D3("r_chromaticAberrationAlpha",0.85);
	for(var_04 = 0;var_04 < param_00;var_04++)
	{
		function_00D3("r_chromaticAberration",1);
		var_05 = function_00FE(gettime() * 0.001 * param_00,var_01,4,5,2);
		function_00D3("r_chromaticSeparationR",function_00FE(gettime() * 0.001 * param_00,var_01,4,5,2));
		function_00D3("r_chromaticSeparationG",function_00FE(gettime() * 0.001 * param_00,var_02,4,5,2));
		function_00D3("r_chromaticSeparationB",function_00FE(gettime() * 0.001 * param_00,var_03,4,5,2));
		wait 0.05;
		function_00D3("r_chromaticAberration",0);
	}
}

//Function Number: 30
func_45F2()
{
	level waittill("pod_crash_hide_floor1");
	if(level.currentgen)
	{
		level.var_31D method_83C0("space_entry_crash");
	}

	func_282D(getentarray("pod_crash_hide_floor1","targetname"));
	function_0059("drop_pod_glass_warning");
	if(level.currentgen)
	{
		wait(0.5);
		level.var_31D method_83C0("seoul_vista");
	}
}

//Function Number: 31
func_282D(param_00)
{
	lib_A59A::func_CE5(param_00);
}

//Function Number: 32
func_45F9(param_00)
{
	var_01 = getent(param_00,"targetname");
	level waittill("portal_vista_off");
	var_01 method_8070(0);
	level waittill("player_drop_pod_door_kick");
	var_01 method_8070(1);
}

//Function Number: 33
func_82A4()
{
	level waittill("begin_deorbit");
	wait(0.2);
	thread func_8278("pod_npc_org");
	thread func_8278("pod_npc_org2");
	thread func_8278("pod_npc_org3");
	thread func_8278("pod_npc_org4");
	thread func_8278("entry_pod_connector_org");
}

//Function Number: 34
func_8278(param_00,param_01)
{
	var_02 = getentarray(param_00,"targetname");
	foreach(var_04 in var_02)
	{
		var_05 = var_04 common_scripts\utility::spawn_tag_origin();
		var_05.var_6817 = getentarray(var_04.target,"targetname");
		foreach(var_07 in var_05.var_6817)
		{
			var_07 linkto(var_05,"tag_origin");
		}

		var_05 thread func_75F2();
	}
}

//Function Number: 35
func_75F2()
{
	level endon("reentry");
	var_00 = self;
	var_01 = distance(level.var_1C14.var_2E6,self.var_2E6);
	var_02 = 1 + var_01 / 100;
	var_03 = var_00.var_2E6;
	var_04 = 1;
	if(var_03[2] < level.var_1C14.var_2E6[2])
	{
		var_04 = -1;
	}

	var_05 = (randomfloatrange(-1,1),randomfloatrange(-1,1),randomfloatrange(-1,1));
	var_06 = (randomfloatrange(-1,1),randomfloatrange(-1,1),0);
	var_07 = 0;
	var_08 = undefined;
	for(;;)
	{
		if(distance(var_00.var_2E6,var_03) > 250)
		{
			var_00.var_41 = var_00.var_41 + var_05;
			var_09 = (var_06[0],var_06[1],var_02);
			if(!var_07)
			{
				var_07 = 1;
				level notify("begin_universe_twirl");
				var_08 = var_00 common_scripts\utility::spawn_tag_origin();
				var_08 linkto(level.var_1C14,"tag_origin");
			}

			var_00.var_2E6 = var_08.var_2E6 + (var_09[0],var_09[1],var_02 * var_04);
		}
		else
		{
			var_09 = (0,0,var_02 * var_04);
			var_00.var_2E6 = var_00.var_2E6 + var_09;
		}

		wait 0.05;
	}
}

//Function Number: 36
func_75F3(param_00)
{
	level endon("reentry");
	param_00.var_41 = (90,180,param_00.var_41[2]);
	level waittill("begin_universe_twirl");
	var_01 = (1,0.2,0);
	var_02 = 140;
	var_03 = 1;
	var_04 = var_01[0] / var_02;
	var_05 = var_01[1] / var_02;
	var_06 = 0;
	while(!common_scripts\utility::flag("entering_atmosphere"))
	{
		if(var_03)
		{
			for(var_07 = 0;var_07 < var_02;var_07++)
			{
				param_00.var_41 = param_00.var_41 + (var_04 * var_07,var_05 * var_07,var_06 * var_07);
				wait 0.05;
			}

			var_03 = 0;
			continue;
		}

		param_00.var_41 = param_00.var_41 + var_01;
		wait 0.05;
	}

	var_08 = 90;
	var_09 = 180;
	var_0A = 0;
	for(var_07 = 0;var_07 < var_02;var_07++)
	{
		param_00.var_41 = param_00.var_41 + (var_01[0] - var_04 * var_07,var_01[1] - var_05 * var_07,var_06 * var_07);
		wait 0.05;
	}
}

//Function Number: 37
func_8260()
{
	level.var_31D disableweapons();
	var_00 = getent("player_pod_seat","targetname");
	if(!isdefined(var_00))
	{
		var_01 = getentarray("player_pod_seat","targetname");
		var_00 = var_01[0];
	}

	var_02 = getentarray("pod_ally_orgs","targetname");
	var_03 = getent("entrypod_ally_spawner","targetname");
	if(!isdefined(var_00))
	{
		maps\seoul_code_gangnam::func_7D91();
		return;
	}

	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D.var_7BE2 = level.var_31D common_scripts\utility::spawn_tag_origin();
	level.var_31D playerlinktodelta(level.var_31D.var_7BE2,"tag_origin",1,60,60,60,60,1,1);
	level.var_31D method_8119(0);
	level.var_6E15 = [];
	foreach(var_05 in var_02)
	{
		var_06 = var_05 common_scripts\utility::spawn_tag_origin();
		var_03.count = 1;
		var_07 = var_03 lib_A59A::func_88BD(1);
		lib_A59A::func_88EB(var_07);
		var_07.tag = var_06;
		if(common_scripts\utility::cointoss())
		{
			var_06 thread lib_A56F::func_C16(var_07,var_05.animation);
		}
		else
		{
			var_06 thread lib_A506::func_BCC(var_07,var_05.animation + "_single");
		}

		level.var_6E15[level.var_6E15.size] = var_07;
		wait(0.1);
	}
}

//Function Number: 38
func_384B(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = param_00 * 1000;
	var_07 = gettime();
	var_08 = [param_01,param_02,param_03,param_04,param_05];
	for(;;)
	{
		foreach(var_0A in var_08)
		{
			if(common_scripts\utility::flag_exist(var_0A) && common_scripts\utility::flag(var_0A))
			{
				break;
			}
		}

		if(gettime() >= var_07 + var_06)
		{
			break;
		}

		wait 0.05;
	}
}

//Function Number: 39
func_8261()
{
	level waittill("never_true");
	level waittill("ok_to_teleport_player");
	var_00 = getentarray("pod_ally_orgs_b","targetname");
	var_01 = getentarray("ally_pod_spawner_b","targetname");
	var_02 = var_01[0];
	foreach(var_04 in var_00)
	{
		var_02.count = 1;
		var_05 = var_04 common_scripts\utility::spawn_tag_origin();
		var_06 = var_02 lib_A59A::func_88BD(1);
		var_06 lib_A59A::func_88EB();
		if(common_scripts\utility::cointoss())
		{
			var_05 thread lib_A56F::func_C16(var_06,var_04.animation);
		}
		else
		{
			var_05 thread lib_A506::func_BCC(var_06,var_04.animation + "_single");
		}

		wait 0.05;
	}

	level waittill("should_telport_player");
	level.var_31D unlink();
	level.var_31D.var_7BE2 delete();
	var_08 = getent("player_pod_seat_x","targetname");
	level.var_31D.var_7BE2 = level.var_31D common_scripts\utility::spawn_tag_origin();
	var_09 = level.var_31D getplayerangles();
	level.var_31D playerlinktodelta(level.var_31D.var_7BE2,"tag_origin",1,60,60,60,60,1,1);
	level.var_31D method_8118(0);
	level.var_31D setplayerangles(var_09);
	var_0A = getent("earth_disc_upper_atmosphere","targetname");
	var_0A notify("stop_earth_movement");
	var_0A delete();
	var_0B = getent("pod_center_b","targetname");
	level.var_1C14.var_2E6 = var_0B.var_2E6;
	common_scripts\utility::array_call(level.var_6E15,::delete);
	level waittill("should_telport_player");
	level waittill("should_telport_player");
	level notify("dropped_from_pod");
	level waittill("should_telport_player");
	level.var_31D unlink();
	level.var_31D.var_7BE2 delete();
	var_0C = getent("player_pod_seat_c","targetname");
	level.var_31D.var_7BE2 = var_0C common_scripts\utility::spawn_tag_origin();
	level.var_31D playerlinktodelta(level.var_31D.var_7BE2,"tag_origin",1,60,60,60,60,1,1);
	level.var_31D method_8118(0);
	wait(2);
	var_0D = getent("player_pod_door_01","targetname");
	var_0D rotateto(var_0D.var_41 + (0,0,-95),2,0.2,1);
	wait(3);
	var_0E = getent("player_pod_seat_c2","targetname");
	level.var_31D.var_7BE2 moveto(var_0E.var_2E6,3,0.2,0.5);
	level.var_31D.var_7BE2 rotateto(var_0E.var_41,1,0.2,0.5);
	wait(4);
	level.var_31D unlink();
	level.var_31D enableweapons();
	level.var_31D method_8118(1);
}

//Function Number: 40
func_5F07(param_00)
{
	level endon("ok_to_teleport_player");
	var_01 = 80;
	var_02 = common_scripts\utility::spawn_tag_origin();
	var_02 linkto(param_00,"tag_origin");
	var_03 = common_scripts\utility::spawn_tag_origin();
	thread func_5D80(self);
	level.var_300E = var_02;
	level.var_300E = var_02;
	var_04 = var_03.var_2E6;
	for(;;)
	{
		self.var_41 = var_02.var_41;
		var_05 = lib_A56F::func_3FFC(var_03.var_2E6,param_00.var_2E6,var_01,5);
		var_03.var_2E6 = vectorlerp(var_03.var_2E6,param_00.var_2E6,var_05);
		var_06 = distance(var_04,var_03.var_2E6);
		self.var_2E6 = var_02 lib_A56F::func_6379("up","tag_origin",var_06);
		level.var_300D = [self.var_2E6,self.var_41,var_06];
		wait 0.05;
	}
}

//Function Number: 41
func_5F08()
{
	var_00 = 80;
	var_01 = common_scripts\utility::spawn_tag_origin();
	var_02 = var_01.var_2E6;
	for(;;)
	{
		self.var_41 = level.var_300E.var_41;
		var_03 = lib_A56F::func_3FFC(var_01.var_2E6,level.var_1C14.var_2E6,var_00,5);
		var_01.var_2E6 = vectorlerp(var_01.var_2E6,level.var_1C14.var_2E6,var_03);
		var_04 = distance(var_02,var_01.var_2E6);
		self.var_2E6 = level.var_300E lib_A56F::func_6379("up","tag_origin",var_04);
		wait 0.05;
	}
}

//Function Number: 42
func_5D80(param_00)
{
	while(distance(param_00.var_2E6,level.var_1C14.var_2E6) > 1600)
	{
		wait 0.05;
	}

	common_scripts\utility::flag_set("entering_atmosphere");
	level notify("entering_upper_atmosphere");
}