/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_lighting.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 189
 * Decompile Time: 6945 ms
 * Timestamp: 4/20/2022 8:21:49 PM
*******************************************************************/

//Function Number: 1
func_5904()
{
	thread func_82B1();
	thread func_8165();
	thread func_8101();
	thread func_8100();
	thread func_80C0();
	thread func_8138();
	thread func_4D02();
	thread func_8290();
	thread func_828F();
	thread func_8293();
	thread func_828C();
	thread func_828B();
	thread func_828D();
	thread func_8289();
	thread func_97DA();
	thread func_97D9();
	thread func_8292();
	thread func_8294();
	thread func_8291();
	thread func_828A();
	thread func_821F();
	thread func_8175();
	thread func_828E();
	thread func_2E81();
	thread func_9775();
	thread func_9777();
	thread func_97DB();
	thread func_97A2();
	thread func_9780();
	thread func_977E();
	thread func_977C();
	thread func_97DE();
	thread func_976E();
	thread func_97DC();
	thread func_97DF();
	thread func_97E0();
	thread func_97E1();
	thread func_97DD();
	thread func_97EA();
	thread func_97E8();
	thread func_97E9();
	thread func_97E4();
	thread func_97E5();
	thread func_97E6();
	thread func_97E7();
	thread func_9776();
	thread func_9783();
	thread func_977D();
	thread func_9778();
	thread func_9779();
	thread func_97A6();
	thread func_97A8();
	thread func_97D5();
	thread func_9794();
	thread func_9793();
	thread func_977A();
	thread func_977B();
	thread func_97C0();
	thread func_9791();
	thread func_9790();
	thread func_978F();
	thread func_2D40();
	thread func_5494();
	thread func_977C();
	thread func_4845();
	thread func_6027();
	thread func_3733();
	precacheshader("ac130_overlay_pip_vignette");
	precacheshader("ac130_overlay_pip_bottom_vignette");
}

//Function Number: 2
func_8165()
{
	level.var_31D method_83C0("seoul");
	thread func_30DB();
	thread func_65BD();
	if(level.nextgen)
	{
		function_00D3("r_dynamicOpl",1);
	}
}

//Function Number: 3
func_82B1()
{
}

//Function Number: 4
func_8101()
{
	lib_A544::create_flickerlight_preset("generic_fire",(0.972549,0.62451,0.345098),(0.2,0.1462746,0.0878432),0.005,0.2,8);
	lib_A544::create_flickerlight_preset("generic_fire_blimp",(1,0.42451,0.145098),(0.4,0.1462746,0.0878432),0.07,0.9,8);
	lib_A544::create_flickerlight_preset("seoul_fire",(1,0.2246,0),(0.46,0.16,0.06),0.005,0.2,8);
	lib_A544::create_flickerlight_preset("pulse_alarm",(0,0,0),(0.46,0.16,0.06),100,500,8);
	lib_A544::create_flickerlight_preset("pulse",(0,0,0),(255,107,107),0.2,1,8);
	lib_A544::create_flickerlight_preset("fluorescent",(0.972549,0.62451,0.345098),(0.2,0.1462746,0.0878432),0.005,0.2,7);
}

//Function Number: 5
func_8100()
{
	lib_A544::func_23B3("firelight_motion_small",(1,0.2246,0),6000,2,0.05,0.2);
	lib_A544::func_23B3("firelight_motion_medium",(1,0.2246,0),100000,3,0.05,0.2);
	lib_A544::func_23B3("firelight_motion_medium_bright2",(1,0.2246,0),200000,4,0.05,0.2);
	lib_A544::func_23B3("firelight_motion_large",(1,0.3,0),900000,7,0.05,0.2);
	lib_A544::func_23B3("firelight_motion_large_sub_cine",(1,0.545,0.274),500000,7,0.05,0.2);
	lib_A544::func_23B3("firelight_motion_medium_dim2",(1,0.2246,0),20000,4,0.05,0.2);
	lib_A544::func_23B3("firelight_motion_medium_dim",(1,0.2246,0),500,3,0.05,0.2);
	lib_A544::func_23B3("firelight_motion_medium_bright",(1,0.2246,0),1000000,3,0.05,0.2);
	lib_A544::func_23B3("firelight_motion_canal_fire_light",(1,0.2246,0),4000000,3,0.05,0.2);
	lib_A544::func_23B3("firelight_motion_weaplat_rim",(1,0.2246,0),15000000,3,0.15,0.9);
	lib_A544::func_23B3("firelight_motion_weaplat_rim_dim",(1,0.2246,0),8000000,3,0.15,0.9);
	lib_A544::func_23B3("firelight_motion_weaplat_rim_body",(1,0.346,0.0467),320000,3,0.15,0.9);
	lib_A544::func_23B3("firelight_motion_weaplat_rim_cormack",(1,0.346,0.0467),20000,3,0.15,0.9);
	lib_A544::func_23B3("firelight_motion_weaplat_rim_corm_hi",(1,0.346,0.0467),80000,3,0.15,0.9);
	lib_A544::func_23B3("firelight_motion_weaplat_flyup",(1,0.2246,0),3200000,3,0.15,0.9);
}

//Function Number: 6
func_80C0()
{
	lib_A544::func_23AB("seoul_standard",0,20,5,1000,35000,0.75,0.5);
}

//Function Number: 7
func_4D02()
{
	common_scripts\utility::flag_init("set_seoul_space_entry_lighting");
	common_scripts\utility::flag_init("set_seoul_intro_lighting");
	common_scripts\utility::flag_init("set_pre_seoul_intro_lighting");
	common_scripts\utility::flag_init("set_seoul_hotel_lighting");
	common_scripts\utility::flag_init("set_seoul_hotel_lighting_lrg");
	common_scripts\utility::flag_init("set_seoul_fob_lighting");
	common_scripts\utility::flag_init("set_seoul_drone_swarm_intro_lighting");
	common_scripts\utility::flag_init("set_seoul_hotel_entrance_lighting");
	common_scripts\utility::flag_init("set_seoul_building_jump_sequence_lighting");
	common_scripts\utility::flag_init("set_seoul_sinkhole_start_lighting");
	common_scripts\utility::flag_init("set_seoul_subway_start_lighting");
	common_scripts\utility::flag_init("set_seoul_shopping_district_start_lighting");
	common_scripts\utility::flag_init("set_seoul_canal_start_lighting");
	common_scripts\utility::flag_init("door_pop");
	common_scripts\utility::flag_init("door_shut");
	common_scripts\utility::flag_init("set_seoul_jump_lighting");
	common_scripts\utility::flag_init("vfx_camera_blur_on");
	common_scripts\utility::flag_init("dof_fob");
	common_scripts\utility::flag_init("missle_hit");
	common_scripts\utility::flag_init("flag_autofocus_on");
	common_scripts\utility::flag_init("flag_autofocus_binoc_on");
	common_scripts\utility::flag_init("enable_fob_lighting_trigger");
}

//Function Number: 8
func_8293()
{
	common_scripts\utility::flag_wait("set_seoul_space_entry_lighting");
	level.var_31D method_83C0("space_entry");
	level.var_31D method_8490("clut_seoul_pod_v3",0);
}

//Function Number: 9
func_828F()
{
	common_scripts\utility::flag_wait("set_seoul_intro_lighting");
	thread func_5EEB();
	thread func_2C58();
	level waittill("pod_land_apartment");
	level waittill("player_drop_pod_door_kick");
	wait(2.8);
	lib_A544::func_6947("firelight_motion_medium_dim","seoul_intro_ceiling_fire_02");
	lib_A59A::func_9E65("seoul_vista",0.5);
	level.var_31D method_83C0("seoul_vista");
	level.var_31D method_8490("clut_seoul_vista",0);
	lib_A544::func_6947("firelight_motion_large","fire_vista_01");
	lib_A544::func_6947("firelight_motion_large","fire_vista_03");
	lib_A544::func_6947("firelight_motion_large","fire_vista_04");
	lib_A544::func_6947("firelight_motion_large","fire_vista_06");
	lib_A544::func_6947("firelight_motion_large","firelight_intro_vista_01");
	lib_A544::func_6947("firelight_motion_large","firelight_intro_vista_02");
	if(level.nextgen)
	{
		lib_A544::func_6947("firelight_motion_medium_bright2","seoul_intro_ceiling_fire");
	}

	lib_A544::func_6947("firelight_motion_large","seoul_intro_ceiling_fire_04");
	lib_A544::func_6947("firelight_motion_large","seoul_intro_ceiling_fire_05");
	lib_A544::func_6947("firelight_motion_small","fire_rim_intro");
	lib_A544::func_6947("firelight_motion_small","fire_rim_intro_02");
	lib_A544::func_6947("firelight_motion_small","fire_rim_intro_03");
	common_scripts\utility::flag_wait("set_seoul_fob_lighting");
}

//Function Number: 10
func_4F6B()
{
}

//Function Number: 11
func_828E()
{
	common_scripts\utility::flag_wait("set_seoul_hotel_lighting");
	level.var_31D method_83C0("seoul_hotel_top");
	level.var_31D method_8490("clut_seoul_hotel_atrium",0);
	if(level.nextgen)
	{
		lib_A59A::func_9E65("seoul_hotel_interior",0);
	}
	else
	{
		lib_A59A::func_9E65("seoul_hotel_interior",0.2);
	}

	lib_A544::func_6947("firelight_motion_medium_dim2","firelight_hotel_small_11");
	lib_A544::func_6947("firelight_motion_small","firelight_hotel_small_12");
	lib_A544::func_6947("firelight_motion_small","firelight_hotel_small_10");
	lib_A544::func_6947("firelight_motion_small","firelight_hotel_small_09");
	lib_A544::func_6947("firelight_motion_medium","firelight_hotel_medium_02");
	lib_A544::func_6947("firelight_motion_medium","firelight_hotel_medium_04");
	lib_A544::func_6947("firelight_motion_medium","firelight_hotel_medium_10");
	lib_A544::func_6947("firelight_motion_medium","firelight_hotel_medium_09");
}

//Function Number: 12
func_828C()
{
	common_scripts\utility::flag_wait("set_seoul_fob_lighting");
	level.var_31D method_83C0("seoul_streets");
	level.var_31D method_8490("clut_seoul_fob",0);
	wait(0.05);
	lib_A59A::func_9E65("seoul_streets",0.5);
	level.var_31D method_83C0("seoul_streets");
	common_scripts\utility::flag_wait("enable_fob_lighting_trigger");
	if(level.nextgen)
	{
	}
}

//Function Number: 13
func_394C()
{
	thread func_8255();
	common_scripts\utility::flag_set("flag_autofocus_on");
	thread func_30DE();
	thread func_30DD();
	thread func_2A93();
}

//Function Number: 14
func_394F()
{
	lib_A544::play_flickerlight_preset("seoul_fire","fire_under_mech_02",20000000);
	lib_A544::play_flickerlight_preset("seoul_fire","firelight_move_01",150000);
	lib_A544::func_6947("firelight_motion_small","hotel_lobby_small_07");
	lib_A544::func_6947("firelight_motion_small","hotel_lobby_small_08");
	lib_A544::func_6947("firelight_motion_medium","firelight_fob_bldg_medium_1");
	lib_A544::func_6947("firelight_motion_medium","firelight_fob_bldg_medium_2");
	lib_A544::func_6947("firelight_motion_large","firelight_fob_bldg_large_1");
	lib_A544::func_6947("firelight_motion_large","firelight_fob_bldg_large_2");
	lib_A544::func_6947("firelight_motion_large","firelight_fob_bldg_large_3");
	lib_A544::func_6947("firelight_motion_large","firelight_fob_bldg_large_4");
	lib_A544::func_6947("firelight_motion_large","firelight_fob_bldg_large_5");
	lib_A544::func_6947("firelight_motion_large","firelight_fob_bldg_large_6");
	lib_A544::func_6947("firelight_motion_small","firelight_fob_street_small_2");
	lib_A544::func_6947("firelight_motion_medium","firelight_fob_street_medium_1");
	lib_A544::func_6947("firelight_motion_medium","firelight_fob_street_medium_2");
	lib_A544::func_6947("firelight_motion_medium","firelight_fob_street_medium_3");
	lib_A544::func_6947("firelight_motion_medium_bright2","firelight_fob_street_medium_4");
	lib_A544::func_6947("firelight_motion_large","firelight_fob_street_large_1");
	lib_A544::func_6947("firelight_motion_large","alleyway_fire_01");
	lib_A544::func_6947("firelight_motion_medium","firelight_fob_truck_push");
}

//Function Number: 15
func_828B()
{
	common_scripts\utility::flag_wait("set_seoul_drone_swarm_intro_lighting");
	level.var_31D method_83C0("seoul_streets");
	lib_A59A::func_9E65("seoul_streets",0.5);
}

//Function Number: 16
func_828D()
{
	common_scripts\utility::flag_wait("set_seoul_hotel_entrance_lighting");
	level.var_31D method_83C0("seoul_streets");
	if(level.nextgen)
	{
		lib_A59A::func_9E65("seoul_streets_dimfog",0.5);
	}
	else
	{
		lib_A59A::func_9E65("seoul_convention_center",0.5);
	}

	lib_A544::func_6947("firelight_motion_large","alleyway_fire_01");
}

//Function Number: 17
func_8289()
{
	common_scripts\utility::flag_wait("set_seoul_building_jump_sequence_lighting");
	if(level.nextgen)
	{
		lib_A59A::func_9E65("seoul",0.5);
		level.var_31D method_83C0("seoul");
		return;
	}

	lib_A59A::func_9E65("seoul_building_jump",0.5);
	level.var_31D method_83C0("seoul_building_jump");
}

//Function Number: 18
func_8292()
{
	common_scripts\utility::flag_wait("set_seoul_sinkhole_start_lighting");
	if(level.nextgen)
	{
		level.var_31D method_83C0("seoul");
	}
	else
	{
		level.var_31D method_83C0("seoul_sinkhole");
	}

	level.var_31D method_8490("clut_seoul_fire_sinkhole",1);
	lib_A59A::func_9E65("seoul_sinkhole",0.5);
}

//Function Number: 19
func_8294()
{
	common_scripts\utility::flag_wait("set_seoul_subway_start_lighting");
	if(level.nextgen)
	{
		level.var_31D method_83C0("seoul");
		level.var_31D method_8490("seoul_subway",1);
	}
	else
	{
		level.var_31D method_83C0("seoul_subway");
	}

	lib_A59A::func_9E65("seoul_subway_interior",0.5);
	level.var_31D method_83C0("seoul_subway");
}

//Function Number: 20
func_8291()
{
	common_scripts\utility::flag_wait("set_seoul_shopping_district_start_lighting");
	level.var_31D method_83C0("seoul_shopping_district");
	level.var_31D method_8490("clut_seoul_shopping",1);
	lib_A59A::func_9E65("seoul_shopping",1.5);
	lib_A544::play_flickerlight_preset("seoul_fire","seoul_light_flicker_sign",1300000);
	if(level.nextgen)
	{
		var_00 = getent("seoul_flicker_streetlight_1","targetname");
		var_00 setlightintensity(400000);
		var_01 = getent("seoul_flicker_streetlight_2","targetname");
		var_01 setlightintensity(360000);
		var_02 = getent("seoul_flicker_streetlight_3","targetname");
		var_02 setlightintensity(600000);
		var_03 = getent("seoul_flicker_streetlight_4","targetname");
		var_03 setlightintensity(920000);
		var_04 = getent("seoul_flicker_streetlight_5","targetname");
		var_04 setlightintensity(300000);
		var_05 = getent("seoul_flicker_streetlight_6","targetname");
		var_05 setlightintensity(300000);
		var_06 = getentarray("seoul_shopping_streetlight_on","targetname");
		var_07 = getentarray("seoul_shopping_streetlight_off","targetname");
		for(var_08 = 0;var_08 < var_07.size;var_08++)
		{
			var_07[var_08] hide();
		}

		for(var_09 = 900;var_09 > 0;var_09--)
		{
			common_scripts\_exploder::exploder(6425);
			wait(randomfloatrange(0,0.5));
			for(var_08 = 0;var_08 < var_06.size;var_08++)
			{
				var_06[var_08] hide();
			}

			for(var_08 = 0;var_08 < var_07.size;var_08++)
			{
				var_07[var_08] show();
			}

			var_00 setlightintensity(0);
			var_01 setlightintensity(0);
			var_02 setlightintensity(0);
			var_03 setlightintensity(0);
			var_04 setlightintensity(0);
			var_05 setlightintensity(0);
			common_scripts\_exploder::kill_exploder(6425);
			wait(randomfloatrange(0.1,1));
			for(var_08 = 0;var_08 < var_06.size;var_08++)
			{
				var_06[var_08] show();
			}

			for(var_08 = 0;var_08 < var_07.size;var_08++)
			{
				var_07[var_08] hide();
			}

			var_00 setlightintensity(100000);
			var_01 setlightintensity(160000);
			var_02 setlightintensity(150000);
			var_03 setlightintensity(320000);
			var_04 setlightintensity(200000);
			var_05 setlightintensity(200000);
		}
	}
}

//Function Number: 21
func_828A()
{
	common_scripts\utility::flag_wait("set_seoul_canal_start_lighting");
	level.var_31D method_83C0("seoul_canal");
	level.var_31D method_8490("clut_seoul_canal",1);
	lib_A59A::func_9E65("seoul_canal_entrance",0.5);
	lib_A570::func_7EC4((-10,-80,0));
	thread func_30E1();
	function_00D3("r_dof_physical_hipFstop",2);
	common_scripts\_exploder::kill_exploder(6425);
	if(level.nextgen)
	{
		function_00D3("r_mbEnable","2");
		function_00D3("r_mbvelocityscalar",".25");
	}

	if(level.nextgen)
	{
		function_00D3("r_mdaoOccluderCullDistance","1000");
	}

	lib_A544::func_6947("firelight_motion_small","fire_light_canal_small1");
	lib_A544::func_6947("firelight_motion_medium","fire_light_canal_medium6");
	lib_A544::func_6947("firelight_motion_large","fire_light_canal_large1");
	lib_A544::func_6947("firelight_motion_large","fire_light_canal_large2");
	lib_A544::func_6947("firelight_motion_large","fire_light_canal_large4");
	lib_A544::func_6947("firelight_motion_weaplat_rim","light_weaplat_rim");
	lib_A544::func_6947("firelight_motion_canal_fire_light","canal_fire_light");
	if(level.nextgen)
	{
		var_00 = getent("light_weaplat_rim","targetname");
		var_01 = getent("light_left_big_key","targetname");
		var_02 = getent("canal_fire_light","targetname");
		var_00 method_8498("force_on");
		var_01 method_8498("force_on");
		var_02 method_8498("force_on");
	}

	lib_A544::play_flickerlight_preset("generic_fire_blimp","fire_light_canal_large3",10000000);
}

//Function Number: 22
func_147A()
{
	lib_A544::stop_flickerlight("firelight_motion_weaplat_rim","light_weaplat_rim",0);
	lib_A544::func_6947("firelight_motion_weaplat_rim","light_weaplat_rim");
}

//Function Number: 23
func_1479()
{
	level.var_31D method_84A9();
	common_scripts\utility::flag_set("flag_autofocus_binoc_on");
	lib_A59A::func_9E65("seoul_binoculars",0.5);
	func_30DC();
	common_scripts\utility::flag_wait("demo_team_seen");
}

//Function Number: 24
func_147B()
{
	lib_A59A::func_9E65("seoul_binoculars",0.5);
	common_scripts\utility::flag_wait("demo_team_seen");
	lib_A59A::func_9E65("seoul_shopping",0.5);
}

//Function Number: 25
func_97DC()
{
	common_scripts\utility::run_thread_on_targetname("trigger_mwp_lightgrid_tweak_01",::func_7D8A);
}

//Function Number: 26
func_7D8A()
{
	self waittill("trigger");
	level.var_31D method_83C0("seoul_finale_run");
	if(level.nextgen)
	{
		lib_A59A::func_5699("r_mdaoCapsulestrength",1,1);
	}

	level.var_31D method_8490("clut_seoul_ending_v3",1);
	wait(2);
	level.var_31D method_83C0("seoul_finale");
}

//Function Number: 27
func_821F()
{
	var_00 = getentarray("lighting_weapons_platform_area_volume","targetname");
	foreach(var_02 in var_00)
	{
		var_02 thread func_8220();
	}
}

//Function Number: 28
func_8220()
{
	for(;;)
	{
		self waittill("trigger");
		if(level.nextgen)
		{
			var_00 = getent("canal_fire_light","targetname");
			var_00 method_8498("normal");
			function_00D3("r_mbvelocityscalar","1");
		}
	}
}

//Function Number: 29
func_8175()
{
	var_00 = getentarray("lighting_canal_volume","targetname");
	foreach(var_02 in var_00)
	{
		var_02 thread func_8176();
	}
}

//Function Number: 30
func_8176()
{
	for(;;)
	{
		self waittill("trigger");
		if(level.nextgen)
		{
			var_00 = getent("canal_fire_light","targetname");
			var_00 method_8498("force_on");
		}

		if(level.nextgen)
		{
			function_00D3("r_mbvelocityscalar",".25");
		}
	}
}

//Function Number: 31
func_30D4()
{
	if(level.nextgen)
	{
		function_00D3("r_mbEnable","2");
	}
}

//Function Number: 32
func_30D6()
{
	if(level.nextgen)
	{
		function_00D3("r_mbEnable","2");
		function_00D3("r_mbCameraRotationInfluence","1");
	}
}

//Function Number: 33
func_2ABC()
{
	if(level.nextgen)
	{
		function_00D3("r_mbEnable","0");
	}
}

//Function Number: 34
func_30DB()
{
}

//Function Number: 35
func_30DF()
{
	function_00D3("r_dof_physical_hipEnable",1);
	function_00D3("r_dof_physical_hipFstop",0.125);
	function_00D3("r_dof_physical_hipSharpCocDiameter",0.1);
}

//Function Number: 36
func_30E0()
{
	function_00D3("r_dof_physical_bokehEnable",1);
	function_00D3("r_dof_physical_hipEnable",1);
	function_00D3("r_dof_physical_hipFstop",2);
	function_00D3("r_dof_physical_hipSharpCocDiameter",0.03);
}

//Function Number: 37
func_8255()
{
	level.var_31D method_84A9();
}

//Function Number: 38
func_30DE()
{
	if(level.nextgen)
	{
		level.var_31D method_84BC(18,20);
		while(common_scripts\utility::flag("flag_autofocus_on") == 1)
		{
			wait 0.05;
			var_00 = func_9488();
			level.var_31D method_84AB(3.5,var_00,5);
		}

		level.var_31D method_84AA();
	}
}

//Function Number: 39
func_30DC()
{
	level.var_31D method_84BC(18,20);
	while(common_scripts\utility::flag("flag_autofocus_binoc_on") == 1)
	{
		wait 0.05;
		var_00 = func_9488();
		if(level.nextgen)
		{
			level.var_31D method_84AB(0.2,var_00,5);
			continue;
		}

		level.var_31D method_84AB(1,var_00,5);
	}

	level.var_31D method_84AA();
}

//Function Number: 40
func_9488()
{
	var_00 = 4096;
	var_01 = level.var_31D geteye();
	var_02 = level.var_31D getplayerangles();
	if(isdefined(level.var_31D.var_2C68))
	{
		var_03 = combineangles(level.var_31D.var_2C68.var_41,var_02);
	}
	else
	{
		var_03 = var_03;
	}

	var_04 = vectornormalize(anglestoforward(var_03));
	var_05 = bullettrace(var_01,var_01 + var_04 * var_00,1,level.var_31D,1,1,0,0,0);
	return distance(var_01,var_05["position"]);
}

//Function Number: 41
func_9791()
{
	common_scripts\utility::run_thread_on_targetname("dof_fob_moment_start",::func_2C53);
}

//Function Number: 42
func_2C53()
{
	if(level.nextgen)
	{
		for(;;)
		{
			self waittill("trigger");
			common_scripts\utility::flag_clear("flag_autofocus_on");
			level.var_31D method_84A9();
			level.var_31D method_84AB(2,45,8);
			while(level.var_31D istouching(self))
			{
				wait(0.1);
			}
		}
	}
}

//Function Number: 43
func_9790()
{
	if(level.nextgen)
	{
		common_scripts\utility::run_thread_on_targetname("dof_fob_autofocus_enable",::func_2C52);
	}
}

//Function Number: 44
func_2C52()
{
	for(;;)
	{
		self waittill("trigger");
		common_scripts\utility::flag_set("flag_autofocus_on");
		level.var_31D method_84A9();
		func_30DE();
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 45
func_978F()
{
	if(level.nextgen)
	{
		common_scripts\utility::run_thread_on_targetname("dof_fob_autofocus_disable",::func_2C51);
	}
}

//Function Number: 46
func_2C51()
{
	for(;;)
	{
		self waittill("trigger");
		common_scripts\utility::flag_clear("flag_autofocus_on");
		level.var_31D method_84AA();
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 47
func_30DD()
{
	level waittill("player_owns_cardoor_shield");
	common_scripts\utility::flag_clear("flag_autofocus_on");
	level.var_31D method_84A9();
	level.var_31D method_84AB(22,50000,8,8);
	level.var_31D method_84BC(4,20);
}

//Function Number: 48
func_2A93()
{
	level.var_31D waittill("car_door_thrown");
	common_scripts\utility::flag_clear("flag_autofocus_on");
	level.var_31D method_84AA();
}

//Function Number: 49
func_30E1()
{
	common_scripts\utility::flag_clear("flag_autofocus_on");
	level.var_31D method_84AA();
}

//Function Number: 50
func_65BD()
{
	wait(0.05);
	function_00D3("r_useLightGridDefaultFXLightingLookup",1);
	function_00D3("r_useLightGridDefaultModelLightingLookup",1);
	if(common_scripts\utility::flag("set_pre_seoul_intro_lighting") == 1)
	{
		function_00D3("r_lightGridDefaultFXLightingLookup",(36118.5,1519.77,1799.09));
		function_00D3("r_lightGridDefaultModelLightingLookup",(36118.5,1519.77,1799.09));
		common_scripts\utility::flag_waitopen("set_pre_seoul_intro_lighting");
	}

	function_00D3("r_lightGridDefaultFXLightingLookup",(36327.9,1157.88,1847.92));
	function_00D3("r_lightGridDefaultModelLightingLookup",(36135.9,1365.73,1845.13));
	common_scripts\utility::flag_wait("set_seoul_intro_lighting");
	function_00D3("r_useLightGridDefaultFXLightingLookup",1);
	function_00D3("r_useLightGridDefaultModelLightingLookup",1);
	function_00D3("r_lightGridDefaultFXLightingLookup",(36327.9,1157.88,1847.92));
	function_00D3("r_lightGridDefaultModelLightingLookup",(35894,587,1830));
	common_scripts\utility::flag_waitopen("set_seoul_intro_lighting");
	function_00D3("r_useLightGridDefaultFXLightingLookup",1);
	function_00D3("r_useLightGridDefaultModelLightingLookup",1);
	function_00D3("r_lightGridDefaultFXLightingLookup",(36327.9,1157.88,1847.92));
	function_00D3("r_lightGridDefaultModelLightingLookup",(36135.9,1365.73,1845.13));
}

//Function Number: 51
func_65BC()
{
	function_00D3("r_useLightGridDefaultFXLightingLookup",1);
	function_00D3("r_useLightGridDefaultModelLightingLookup",1);
	function_00D3("r_lightGridDefaultFXLightingLookup",(36327.9,1157.88,1847.92));
	function_00D3("r_lightGridDefaultModelLightingLookup",(35894,587,1830));
	common_scripts\utility::flag_waitopen("set_seoul_intro_lighting");
	function_00D3("r_useLightGridDefaultFXLightingLookup",1);
	function_00D3("r_useLightGridDefaultModelLightingLookup",1);
	function_00D3("r_lightGridDefaultFXLightingLookup",(36327.9,1157.88,1847.92));
	function_00D3("r_lightGridDefaultModelLightingLookup",(36135.9,1365.73,1845.13));
}

//Function Number: 52
func_65BE()
{
	function_00D3("r_useLightGridDefaultFXLightingLookup",1);
	function_00D3("r_useLightGridDefaultModelLightingLookup",1);
	function_00D3("r_lightGridDefaultFXLightingLookup",(36327.9,1157.88,1847.92));
	function_00D3("r_lightGridDefaultModelLightingLookup",(36135.9,1365.73,1845.13));
}

//Function Number: 53
func_5EEB()
{
	func_30D6();
	level waittill("droppod_empty");
	func_2ABC();
}

//Function Number: 54
func_2C59()
{
	wait(0.05);
	level.var_31D method_84A9();
	if(level.nextgen)
	{
		function_00D3("r_dof_physical_bokehEnable",1);
		thread func_6E01();
		level.var_31D method_84AB(7,15,20,20);
		lib_A59A::func_9E65("seoul_pre_space_entry_nofog",1);
		level.var_31D method_84AB(2,25,20,20);
		wait(10);
		lib_A59A::func_9E65("seoul_pre_space_entry",2);
		wait(11.5);
		level.var_31D method_84AB(2.5,13.5,20,20);
		wait(3);
		level.var_31D method_84AB(22,100000,20,20);
		wait(5);
		lib_A59A::func_9E65("seoul_pre_space_entry_fog",0.5);
		function_00D3("r_eyeRedness",0.7);
		function_00D3("r_eyepupil",0.18);
		return;
	}

	thread func_6E01();
	level.var_31D method_84AB(8,15,20,20);
	wait(11.5);
	lib_A59A::func_9E65("seoul_pre_space_entry",1);
	level.var_31D method_84AB(3,25,20,20);
	wait(19.2);
	level.var_31D method_84AB(3.5,13.5,20,20);
	wait(3);
	level.var_31D method_84AB(23,100000,20,20);
	lib_A59A::func_9E65("seoul_pre_space_entry_fog",0.5);
}

//Function Number: 55
func_2C58()
{
	common_scripts\utility::flag_wait("vfx_start_drop_pod_intro_phase_2b");
	if(level.nextgen)
	{
		level.var_31D method_84AB(22,100000,20,20);
		wait(2);
		level.var_31D method_84AB(4.5,14.21,20,20);
		function_00D3("r_dof_physical_bokehEnable",1);
		wait(2.5);
		level.var_31D method_84AB(22,100000,20,20);
		function_00D3("r_dof_physical_bokehEnable",0);
		wait(0.5);
		lib_A59A::func_9E65("seoul_space_entry",2);
		wait(4);
		level.var_31D method_84AB(3,25,20,20);
		wait(3.1);
		level.var_31D method_84AB(22,100000,20,20);
		wait(3.9);
		level.var_31D method_84AB(3,25,20,20);
		common_scripts\utility::flag_wait("door_shut");
		level.var_31D method_84AB(3,25,20,20);
		wait(5);
		level.var_31D method_84AB(22,100000,20,20);
		wait(2);
		level.var_31D method_84AB(3,25,20,20);
		wait(2);
		level.var_31D method_84AB(22,100000,20,20);
		level waittill("pod_land_apartment");
		thread func_4EF4();
		level.var_31D method_84AB(5,25,20,20);
		level waittill("player_drop_pod_door_kick");
		wait(2.8);
		level.var_31D method_84AB(6,8600,20,20);
		wait(8.25);
		level.var_31D method_84AB(2,35,2,2);
		wait(2.95);
		level.var_31D method_84AB(1.5,235,4,4);
		wait(5);
		wait(1.6);
		level.var_31D method_84AB(3,20,25,25);
		wait(1);
		level.var_31D method_84AB(1.5,75,2,2);
		function_00D3("r_eyeRedness",0.2);
		function_00D3("r_eyepupil",0.225);
		level waittill("droppod_empty");
		level.var_31D method_84AB(10,7500,1,1);
		wait(3);
		function_00D3("r_mbEnable","0");
		level.var_31D method_84AA();
		function_00D3("r_dof_physical_bokehEnable",0);
		return;
	}

	level.var_31D method_84AB(23,100000,20,20);
	wait(2);
	level.var_31D method_84AB(5.5,14.21,20,20);
	wait(2.5);
	level.var_31D method_84AB(23,100000,20,20);
	wait(0.5);
	lib_A59A::func_9E65("seoul_space_entry",2);
	wait(4);
	level.var_31D method_84AB(4,25,20,20);
	wait(3.1);
	level.var_31D method_84AB(23,100000,20,20);
	wait(3.9);
	level.var_31D method_84AB(4,25,20,20);
	common_scripts\utility::flag_wait("door_shut");
	level.var_31D method_84AB(4,25,20,20);
	wait(5);
	level.var_31D method_84AB(23,100000,20,20);
	wait(2);
	level.var_31D method_84AB(4,25,20,20);
	wait(2);
	level.var_31D method_84AB(23,100000,20,20);
	level waittill("pod_land_apartment");
	thread func_4EF4();
	level.var_31D method_84AB(6,25,20,20);
	level waittill("player_drop_pod_door_kick");
	level.var_31D method_84AB(7,8600,20,20);
	wait(10);
	level.var_31D method_84AB(3,35,2,2);
	wait(3.1);
	level.var_31D method_84AB(2.5,235,4,4);
	wait(5);
	wait(1);
	level.var_31D method_84AB(4,20,25,25);
	wait(1.1);
	level.var_31D method_84AB(2.5,75,2,2);
	level waittill("droppod_empty");
	level.var_31D method_84AB(11,7500,1,1);
	wait(3);
	level.var_31D method_84AA();
}

//Function Number: 56
func_2D40()
{
	level waittill("exo_breach_impact");
	func_30D4();
	wait(20);
	func_2ABC();
}

//Function Number: 57
func_5EED()
{
	common_scripts\utility::flag_wait("sinkhole_player_uses_zipline");
	func_30D4();
	wait(5);
	func_2ABC();
}

//Function Number: 58
func_5494()
{
	var_00 = level.var_31D common_scripts\utility::waittill_any_return("full_fall","land_after_full_fall");
	if(isdefined(var_00))
	{
		switch(var_00)
		{
			case "full_fall":
				break;

			case "land_after_full_fall":
				break;
		}
	}
}

//Function Number: 59
func_568E(param_00,param_01,param_02)
{
	param_00 notify("stop lerp");
	param_00 endon("stop lerp");
	param_00 endon("death");
	var_03 = param_00.var_2E6;
	var_04 = 0;
	while(var_04 < param_01)
	{
		param_00.var_2E6 = vectorlerp(var_03,param_02,var_04 / param_01);
		var_04 = var_04 + 0.05;
		wait(0.05);
	}

	param_00.var_2E6 = param_02;
}

//Function Number: 60
func_5683(param_00,param_01,param_02)
{
	param_00 notify("stop lerp");
	param_00 endon("stop lerp");
	param_00 endon("death");
	var_03 = param_00.var_41;
	var_04 = 0;
	while(var_04 < param_01)
	{
		param_00.var_41 = vectorlerp(var_03,param_02,var_04 / param_01);
		var_04 = var_04 + 0.05;
		wait(0.05);
	}

	param_00.var_41 = param_02;
}

//Function Number: 61
func_2C70()
{
	func_30D6();
	level.var_31D method_84A9();
	if(level.nextgen)
	{
		function_00D3("r_dof_physical_bokehEnable",1);
	}

	level.var_31D method_84AB(8,13);
	wait(1.7);
	level.var_31D method_84AB(1,169,4,4);
	wait(5.3);
	level.var_31D method_84AB(3.5,23,10,10);
	wait(1.5);
	level.var_31D method_84AB(2,140,2,4);
	wait(2);
	level.var_31D method_84AB(1,110,1,2);
	wait(10.2);
	level.var_31D method_84AB(4,30,1,2);
	wait(2.5);
	level.var_31D method_84AB(12,100,1,2);
	if(level.nextgen)
	{
		function_00D3("r_dof_physical_bokehEnable",0);
	}

	level.var_31D method_84AA();
	func_2ABC();
}

//Function Number: 62
func_2C71()
{
	func_30D6();
	level.var_31D method_84A9();
	if(level.nextgen)
	{
		function_00D3("r_dof_physical_bokehEnable",1);
	}

	level.var_31D method_84AB(8,13,20,20);
	wait(1.7);
	level.var_31D method_84AB(4,169,20,20);
	wait(2.4);
	level.var_31D method_84AB(0.25,9,40,40);
	wait(0.3);
	level.var_31D method_84AB(4,169,10,10);
	wait(3);
	level.var_31D method_84AB(4.5,23,10,10);
	wait(1.5);
	level.var_31D method_84AB(2,140,4,4);
	wait(2);
	level.var_31D method_84AB(2,110,1,2);
	wait(10.2);
	level.var_31D method_84AB(8,30,4,4);
	wait(2.5);
	level.var_31D method_84AB(12,100,1,2);
	if(level.nextgen)
	{
		function_00D3("r_dof_physical_bokehEnable",0);
	}

	level.var_31D method_84AA();
	func_2ABC();
}

//Function Number: 63
func_5723()
{
	wait(4);
	level.var_31D method_83C0("seoul_subway_breachflash");
	wait(0.5);
	level.var_31D method_83C0("seoul_subway");
}

//Function Number: 64
func_1D71()
{
	level.var_31D thread lib_A544::func_7916(22,"ac130_overlay_pip_bottom_vignette",5,2,1,0,0);
	wait(3);
	lib_A59A::func_9E65("seoul_subway_cinematic",5);
	wait(16);
	lib_A59A::func_9E65("seoul_subway_interior",3);
}

//Function Number: 65
func_1D73()
{
	common_scripts\_exploder::kill_exploder("lensflare_subway_int");
	if(level.nextgen)
	{
		var_00 = getent("cine_left_light_all","targetname");
		var_00 method_8498("force_on");
		var_01 = var_00.var_2E6;
		var_02 = var_00.var_41;
		var_03 = common_scripts\utility::getstruct("script_struct_sub_key_will","targetname");
		var_04 = common_scripts\utility::getstruct("script_struct_sub_key_all","targetname");
		lib_A544::lerp_spot_intensity("cine_left_light_all",0.05,10000);
		func_568E(var_00,3,var_03.var_2E6);
		func_5683(var_00,3,var_03.var_41);
		wait(2);
		lib_A544::lerp_spot_intensity("cine_left_light_all",2.5,0);
		func_568E(var_00,0.05,var_04.var_2E6);
		func_5683(var_00,0.05,var_04.var_41);
		lib_A544::lerp_spot_intensity("cine_left_light_all",1.5,160000);
		wait(9);
		lib_A544::lerp_spot_intensity("cine_left_light_all",3,0);
	}
}

//Function Number: 66
func_1D6E()
{
	wait(4);
	lib_A544::func_7EB7("cine_holelight",(1,0.545,0.274));
	lib_A544::lerp_spot_intensity("cine_holelight",1,160000);
	common_scripts\_exploder::exploder("exp_sub_drop_light");
	lib_A544::func_6947("firelight_motion_large_sub_cine","cine_holelight");
	if(level.nextgen)
	{
		lib_A544::lerp_spot_intensity("cine_holelight",2,160000);
	}
}

//Function Number: 67
func_1D6F()
{
	if(level.nextgen)
	{
		var_00 = getent("cine_left_light_all","targetname");
		wait(8);
		var_00 lib_A544::func_568B(90,30,50,30,0.1);
		thread lib_A544::lerp_spot_intensity("cine_left_light_all",2,256000);
	}
}

//Function Number: 68
func_1D70()
{
	if(level.nextgen)
	{
		lib_A544::func_7EB7("cine_sub_fire_rim",(1,0.4187,0.082));
		wait(8.5);
		lib_A544::lerp_spot_intensity("cine_sub_fire_rim",4,400000);
		wait(7);
		lib_A544::lerp_spot_intensity("cine_sub_fire_rim",4,1);
	}
}

//Function Number: 69
func_1D72()
{
	if(level.nextgen)
	{
		var_00 = getent("cine_right_light_irons","targetname");
		lib_A544::lerp_spot_intensity("cine_right_light_irons",2,20000);
		wait(16);
		lib_A544::lerp_spot_intensity("cine_right_light_irons",5,400);
	}
}

//Function Number: 70
func_977E()
{
	common_scripts\utility::run_thread_on_targetname("seoul_subway_interior",::func_9E60);
}

//Function Number: 71
func_9E60()
{
	for(;;)
	{
		self waittill("trigger");
		level.var_31D method_83C0("seoul_subway");
		if(level.currentgen)
		{
			level.var_31D method_83C0("seoul_subway");
		}

		lib_A59A::func_9E65("seoul_subway_interior",3);
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 72
func_97D9()
{
	common_scripts\utility::run_thread_on_targetname("seoul_art_center_atrium",::func_9E56);
}

//Function Number: 73
func_9E56()
{
	for(;;)
	{
		self waittill("trigger");
		if(level.nextgen)
		{
			lib_A59A::func_9E65("seoul",3);
		}
		else
		{
			lib_A59A::func_9E65("seoul_convention_center",3);
			level.var_31D method_83C0("seoul_convention_center");
		}

		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 74
func_97DA()
{
	common_scripts\utility::run_thread_on_targetname("seoul_building_jump",::func_9E57);
}

//Function Number: 75
func_9E57()
{
	self waittill("trigger");
	level.var_31D method_83C0("seoul_building_jump");
	lib_A59A::func_9E65("seoul_building_jump",3);
	if(level.currentgen)
	{
	}

	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb1_grp1",512000);
	if(level.nextgen)
	{
		lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb1_grp2a",256000);
	}

	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb1_grp2b",256000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb2_grp2a",3000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb2_grp2b",128000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb2_grp2c",128000);
	for(;;)
	{
		self waittill("trigger");
		lib_A59A::func_9E65("seoul_building_jump",3);
		level.var_31D method_8490("clut_seoul_fire_sinkhole",1);
		level.var_31D method_83C0("seoul_building_jump");
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 76
func_8290()
{
	common_scripts\utility::flag_wait("set_seoul_jump_lighting");
	if(level.nextgen)
	{
		level.var_31D method_83C0("seoul");
	}
	else
	{
		level.var_31D method_83C0("seoul_building_jump");
	}

	level.var_31D method_8490("seoul",1);
	lib_A59A::func_9E65("seoul_building_jump",3);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb1_grp1",512000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb1_grp2a",256000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb1_grp2b",256000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb2_grp2a",3000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb2_grp2b",128000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb2_grp2c",128000);
}

//Function Number: 77
func_977C()
{
	common_scripts\utility::run_thread_on_targetname("seoul_sinkhole",::func_9E5D);
}

//Function Number: 78
func_9E5D()
{
	self waittill("trigger");
	lib_A59A::func_9E65("seoul_sinkhole",2);
	level.var_31D method_83C0("seoul_sinkhole");
	if(level.currentgen)
	{
		level.var_31D method_83C0("seoul_sinkhole");
	}

	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb2_grp2b",128000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_cb2_grp2c",128000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_upper1",200000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_upper2",200000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_upper3",200000);
	if(level.nextgen)
	{
		lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_mid1",10000);
		lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_mid2",200000);
	}
	else
	{
		lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_mid1",1000);
		lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_mid2",500);
	}

	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_mid1_b",4000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_lower1",40000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_lower3",200000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_lower4",200000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_lower5",200000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_crater1",100000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_crater2",10000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_crater3",100000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_crater4",100000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_crater5",100000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_crater6",100000);
	lib_A544::play_flickerlight_preset("seoul_fire","flicker_fire_sinkhole_crater7",100000);
	for(;;)
	{
		self waittill("trigger");
		lib_A59A::func_9E65("seoul_sinkhole",2);
		level.var_31D method_83C0("seoul_sinkhole");
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 79
func_97C0()
{
	common_scripts\utility::run_thread_on_targetname("seoul_weapons_platform_trigger",::func_697E);
}

//Function Number: 80
func_697E()
{
	self waittill("trigger");
	var_00 = getent("spot_mwp_sinkhole","targetname");
	var_00 method_8498("force_on");
	lib_A544::lerp_spot_intensity("spot_mwp_sinkhole",3,1600000);
	wait(1);
	lib_A544::lerp_spot_intensity("spot_mwp_sinkhole",6,1);
	wait(1);
	var_00 method_8498("normal");
}

//Function Number: 81
func_977B()
{
	common_scripts\utility::run_thread_on_targetname("trig_lensflare_subway_int_on",::func_6970);
}

//Function Number: 82
func_6970()
{
	for(;;)
	{
		self waittill("trigger");
		common_scripts\_exploder::exploder("lensflare_subway_int");
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 83
func_977A()
{
	common_scripts\utility::run_thread_on_targetname("trig_lensflare_subway_int_off",::func_696F);
}

//Function Number: 84
func_696F()
{
	for(;;)
	{
		self waittill("trigger");
		common_scripts\_exploder::kill_exploder("lensflare_subway_int");
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 85
func_571A()
{
	common_scripts\_exploder::exploder("lensflare_subway_int");
}

//Function Number: 86
func_9778()
{
	common_scripts\utility::run_thread_on_targetname("trig_jb1_s_flicker",::func_69B0);
}

//Function Number: 87
func_69B0()
{
	self waittill("trigger");
	thread lib_A544::model_flicker_preset("s_flicker_fluo_jump1",0,0,640000,9911,9911,0.01,0.6,0.03,0.7,"kill_jb_s_flicker");
	thread lib_A544::model_flicker_preset("s_flicker_alarm_jump1",0,0,8000,9912,9912,0.3,0.301,1.2,1.201,"kill_jb_s_flicker");
	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 88
func_9779()
{
	common_scripts\utility::run_thread_on_targetname("trig_jb2_s_flicker",::func_69B1);
}

//Function Number: 89
func_69B1()
{
	self waittill("trigger");
	thread lib_A544::model_flicker_preset("s_flicker_fluo2_jump2",0,0,40000,9922,9922,0.1,1.5,0.03,0.7,"kill_jb_s_flicker");
	if(level.nextgen)
	{
		thread lib_A544::model_flicker_preset("s_flicker_can_jump2",0,0,4000,9921,9921,0.01,0.3,0.03,0.7,"kill_jb_s_flicker");
		thread lib_A544::model_flicker_preset("s_flicker_fluo_jump2",0,0,100000,9922,9922,0.01,0.3,0.03,0.7,"kill_jb_s_flicker");
	}
	else
	{
		thread lib_A544::model_flicker_preset("s_flicker_fluo_jump2",0,0,70000,9922,9922,0.01,0.3,0.03,0.7,"kill_jb_s_flicker");
	}

	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 90
func_977D()
{
	common_scripts\utility::run_thread_on_targetname("trig_sh_s_flicker",::func_69B2);
}

//Function Number: 91
func_69B2()
{
	self waittill("trigger");
	thread lib_A544::model_flicker_preset("s_flicker_fluo_ground",0,0,2000000,9931,9931,0.01,0.3,0.03,0.7,"kill_sh_s_flicker");
	thread lib_A544::model_flicker_preset("s_flicker_fluo_sh_edge",0,0,160000,9941,9941,0.01,0.3,0.03,0.7,"kill_sh_s_flicker");
	thread lib_A544::model_flicker_preset("s_flicker_fluo_ceil_mid",0,0,40000,undefined,undefined,0.01,0.3,0.03,0.7,"kill_sh_s_flicker");
	thread lib_A544::model_flicker_preset("s_flicker_fluo_ceil_side",0,0,10000,undefined,undefined,0.01,0.3,0.03,0.7,"kill_sh_s_flicker");
	thread lib_A544::model_flicker_preset("s_flicker_fluo_ceil_back",0,0,10000,undefined,undefined,0.01,0.3,0.03,0.7,"kill_sh_s_flicker");
	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 92
func_97A6()
{
	common_scripts\utility::run_thread_on_targetname("trig_jb_kill_s_flicker",::func_5334);
}

//Function Number: 93
func_5334()
{
	self waittill("trigger");
	level notify("kill_jb_s_flicker");
	var_00 = getent("targ_s_flicker_fluo_jump2","targetname");
	var_00 method_8498("normal");
	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 94
func_97A8()
{
	common_scripts\utility::run_thread_on_targetname("trig_sh_kill_s_flicker",::func_5335);
}

//Function Number: 95
func_5335()
{
	self waittill("trigger");
	level notify("kill_sh_s_flicker");
	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 96
func_97D5()
{
	common_scripts\utility::run_thread_on_targetname("trig_s_flicker_fluo_jump2_shadow_on",::func_69AF);
}

//Function Number: 97
func_69AF()
{
	self waittill("trigger");
	var_00 = getent("targ_s_flicker_fluo_jump2","targetname");
	var_00 method_8498("force_on");
	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 98
func_9794()
{
	if(level.nextgen)
	{
		common_scripts\utility::run_thread_on_targetname("trig_train_force_shadows_on",::func_39A3);
	}
}

//Function Number: 99
func_39A3()
{
	self waittill("trigger");
	var_00 = getent("flicker_fire_sinkhole_lower4","targetname");
	var_00 method_8498("force_on");
	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 100
func_9793()
{
	if(level.nextgen)
	{
		common_scripts\utility::run_thread_on_targetname("trig_train_force_shadows_off",::func_39A2);
	}
}

//Function Number: 101
func_39A2()
{
	self waittill("trigger");
	var_00 = getent("flicker_fire_sinkhole_lower4","targetname");
	var_00 method_8498("normal");
	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 102
func_976E()
{
	common_scripts\utility::run_thread_on_targetname("seoul_canal_entrance",::func_9E55);
}

//Function Number: 103
func_9E55()
{
	for(;;)
	{
		self waittill("trigger");
		lib_A59A::func_9E65("seoul_canal_entrance",2);
		while(level.var_31D istouching(self))
		{
			wait(0.05);
		}
	}
}

//Function Number: 104
func_9775()
{
	common_scripts\utility::run_thread_on_targetname("seoul_hotel_interior",::func_9E5A);
}

//Function Number: 105
func_9E5A()
{
	for(;;)
	{
		self waittill("trigger");
		common_scripts\utility::flag_set("set_seoul_hotel_lighting");
		lib_A59A::func_9E65("seoul_hotel_interior",1);
		level.var_31D method_83C0("seoul_hotel_top");
		level.var_31D method_8490("clut_seoul_hotel_atrium",1);
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 106
func_9777()
{
	common_scripts\utility::run_thread_on_targetname("seoul_hotel_interior_lrg",::func_9E5B);
}

//Function Number: 107
func_9E5B()
{
	for(;;)
	{
		self waittill("trigger");
		common_scripts\utility::flag_set("set_seoul_hotel_lighting_lrg");
		lib_A59A::func_9E65("seoul_hotel_interior_lrg",1);
		if(level.nextgen)
		{
			level.var_31D method_83C0("seoul_hotel_lrg");
			lib_A59A::func_9E65("seoul_hotel_interior_lrg",1);
		}
		else
		{
			level.var_31D method_83C0("seoul_convention_center");
			lib_A59A::func_9E65("seoul_convention_center",1);
		}

		level.var_31D method_8490("clut_seoul_hotel_02",1);
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 108
func_97DB()
{
	common_scripts\utility::run_thread_on_targetname("seoul_exterior",::func_9E58);
}

//Function Number: 109
func_9E58()
{
	for(;;)
	{
		self waittill("trigger");
		lib_A59A::func_9E65("seoul",1);
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 110
func_97E1()
{
	common_scripts\utility::run_thread_on_targetname("seoul_vista",::func_9E61);
}

//Function Number: 111
func_9E61()
{
	for(;;)
	{
		self waittill("trigger");
		lib_A59A::func_9E65("seoul_vista",1);
		level.var_31D method_83C0("seoul_vista");
		level.var_31D method_8490("clut_seoul_vista",0);
		while(level.var_31D istouching(self))
		{
			wait(0.05);
		}
	}
}

//Function Number: 112
func_97DD()
{
	common_scripts\utility::run_thread_on_targetname("seoul_hotel_hallway",::func_9E59);
}

//Function Number: 113
func_9E59()
{
	for(;;)
	{
		self waittill("trigger");
		lib_A59A::func_9E65("seoul_hotel_hallway",1);
		level.var_31D method_83C0("seoul_vista");
		while(level.var_31D istouching(self))
		{
			wait(0.05);
		}
	}
}

//Function Number: 114
func_97DF()
{
	common_scripts\utility::run_thread_on_targetname("seoul_streets_02",::func_9E5E);
}

//Function Number: 115
func_9E5E()
{
	for(;;)
	{
		self waittill("trigger");
		if(level.nextgen)
		{
			lib_A59A::func_9E65("seoul_streets_dimfog",1);
		}

		level.var_31D method_83C0("seoul_streets");
		func_2ABC();
		while(level.var_31D istouching(self))
		{
			wait(0.05);
		}
	}
}

//Function Number: 116
func_97E0()
{
	common_scripts\utility::run_thread_on_targetname("seoul_streets_02_xx",::func_9E5F);
}

//Function Number: 117
func_9E5F()
{
	for(;;)
	{
		self waittill("trigger");
		if(level.nextgen)
		{
			lib_A59A::func_9E65("seoul_streets_dimfog",1);
		}

		level.var_31D method_83C0("seoul_streets");
		while(level.var_31D istouching(self))
		{
			wait(0.05);
		}
	}
}

//Function Number: 118
func_97A2()
{
	common_scripts\utility::run_thread_on_targetname("seoul_hotel_fall",::func_5EEA);
}

//Function Number: 119
func_5EEA()
{
	for(;;)
	{
		self waittill("trigger");
		func_30D6();
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 120
func_9780()
{
	common_scripts\utility::run_thread_on_targetname("exit_hotel_to_fob",::func_342B);
}

//Function Number: 121
func_342B()
{
	for(;;)
	{
		self waittill("trigger");
		common_scripts\utility::flag_set("enable_fob_lighting_trigger");
		if(level.nextgen)
		{
			lib_A59A::func_9E65("seoul_streets",3);
		}

		level.var_31D method_83C0("seoul_streets");
		level.var_31D method_8490("clut_seoul_fob",1);
		thread func_394C();
		thread func_394F();
		if(level.nextgen)
		{
		}

		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 122
func_9783()
{
	common_scripts\utility::run_thread_on_targetname("fall_to_hotel_lobby",::func_32F2);
}

//Function Number: 123
func_9776()
{
	common_scripts\utility::run_thread_on_targetname("enter_hotel_lobby",::func_32F2);
}

//Function Number: 124
func_32F2()
{
	for(;;)
	{
		self waittill("trigger");
		thread func_4A43();
		level.var_31D method_84AA();
		thread func_2ABC();
		lib_A59A::func_9E65("seoul_hotel_lobby",1);
		level.var_31D method_83C0("seoul_hotel_lobby");
		level.var_31D method_8490("clut_seoul_hotel_atrium",1);
		while(level.var_31D istouching(self))
		{
			wait(0.1);
		}
	}
}

//Function Number: 125
func_4A43()
{
	lib_A544::func_6947("firelight_motion_medium","firelight_hotel_lobby_medium_01");
	lib_A544::func_6947("firelight_motion_medium","firelight_hotel_lobby_medium_02");
	lib_A544::func_6947("firelight_motion_small","firelight_hotel_lobby_small_01");
	lib_A544::func_6947("firelight_motion_large","firelight_hotel_lobby_laseoulrge_01");
	lib_A544::func_6947("firelight_motion_large","firelight_hotel_lobby_large_02");
}

//Function Number: 126
func_97DE()
{
	common_scripts\utility::run_thread_on_targetname("seoul_shopping",::func_9E5C);
	common_scripts\utility::run_thread_on_targetname("seoul_shopping_district",::func_5759);
	common_scripts\_exploder::exploder(6425);
	common_scripts\utility::flag_set("set_seoul_shopping_district_start_lighting");
}

//Function Number: 127
func_9E5C()
{
	for(;;)
	{
		self waittill("trigger");
		lib_A59A::func_9E65("seoul_shopping",1);
	}

	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 128
func_6E0D(param_00)
{
	wait(12.05);
}

//Function Number: 129
func_97E6()
{
	common_scripts\utility::run_thread_on_targetname("trigger_shopping_restaraunt_bar_enter",::func_395D);
}

//Function Number: 130
func_395D()
{
	for(;;)
	{
		self waittill("trigger");
		lib_A59A::func_9E65("seoul_shopping_district_interiors",2);
		level.var_31D method_83C0("seoul_shopping_int");
	}
}

//Function Number: 131
func_97E7()
{
	common_scripts\utility::run_thread_on_targetname("trigger_shopping_restaraunt_bar_exit",::func_395E);
}

//Function Number: 132
func_395E()
{
	for(;;)
	{
		self waittill("trigger");
		lib_A59A::func_9E65("seoul_shopping",2);
		level.var_31D method_83C0("seoul_shopping_district");
	}
}

//Function Number: 133
func_97EA()
{
	common_scripts\utility::run_thread_on_targetname("trigger_shopping_walkway_pre_enter",::func_8398);
}

//Function Number: 134
func_8398()
{
	for(;;)
	{
		self waittill("trigger");
		var_00 = getent("prim_spot_walkway_skyfill1","targetname");
		var_00 method_8498("normal");
		var_01 = getent("prim_spot_walkway_skyfill2","targetname");
		var_01 method_8498("normal");
		lib_A59A::func_9E65("seoul_shopping",2);
		level.var_31D method_83C0("seoul_shopping_district");
	}
}

//Function Number: 135
func_97E8()
{
	common_scripts\utility::run_thread_on_targetname("trigger_shopping_walkway_enter",::func_8396);
}

//Function Number: 136
func_8396()
{
	for(;;)
	{
		self waittill("trigger");
		var_00 = getent("prim_spot_walkway_skyfill1","targetname");
		var_00 method_8498("force_on");
		var_01 = getent("prim_spot_walkway_skyfill2","targetname");
		var_01 method_8498("force_on");
		lib_A59A::func_9E65("seoul_shopping_district_interiors",2);
		level.var_31D method_83C0("seoul_shopping_int");
	}
}

//Function Number: 137
func_97E9()
{
	common_scripts\utility::run_thread_on_targetname("trigger_shopping_walkway_exit",::func_8397);
}

//Function Number: 138
func_8397()
{
	if(level.nextgen)
	{
		for(;;)
		{
			self waittill("trigger");
			var_00 = getent("prim_spot_walkway_skyfill1","targetname");
			var_00 method_8498("normal");
			var_01 = getent("prim_spot_walkway_skyfill2","targetname");
			var_01 method_8498("normal");
			var_02 = getent("prim_spot_bar_skyfill1","targetname");
			var_02 method_8498("normal");
		}
	}
}

//Function Number: 139
func_97E4()
{
	common_scripts\utility::run_thread_on_targetname("trigger_bar2_enter",::func_838F);
}

//Function Number: 140
func_838F()
{
	for(;;)
	{
		self waittill("trigger");
		if(level.nextgen)
		{
			var_00 = getent("prim_spot_bar_skyfill1","targetname");
			var_00 method_8498("force_on");
		}

		lib_A59A::func_9E65("seoul_shopping_district_interiors",2);
		level.var_31D method_83C0("seoul_shopping_int");
	}
}

//Function Number: 141
func_97E5()
{
	common_scripts\utility::run_thread_on_targetname("trigger_bar2_exit",::func_8390);
}

//Function Number: 142
func_8390()
{
	if(level.nextgen)
	{
		for(;;)
		{
			self waittill("trigger");
			if(level.nextgen)
			{
				var_00 = getent("prim_spot_bar_skyfill1","targetname");
				var_00 method_8498("normal");
			}

			lib_A59A::func_9E65("seoul_shopping",2);
			level.var_31D method_83C0("seoul_shopping_district");
		}
	}
}

//Function Number: 143
func_2C74()
{
	level.var_31D method_84A9();
	level.var_6AD8 = 2.5;
	common_scripts\utility::run_thread_on_targetname("dof_enable_interior",::func_2C49);
	common_scripts\utility::run_thread_on_targetname("dof_enable_exterior",::func_2C48);
	common_scripts\utility::run_thread_on_targetname("dof_enable_start",::func_2C4B);
}

//Function Number: 144
func_2C49()
{
	self waittill("trigger");
	level.var_31D method_84AB(3.5,100);
	level.var_6AD8 = 2.8;
}

//Function Number: 145
func_2C48()
{
	self waittill("trigger");
	level.var_31D method_84AB(11,100);
	level.var_6AD8 = 8;
}

//Function Number: 146
func_2C4B()
{
	self waittill("trigger");
	level.var_31D method_84AB(2.8,30);
	level.var_6AD8 = 4;
}

//Function Number: 147
func_152D()
{
	func_30D6();
	level.var_31D method_84A9();
	level.var_31D method_84AB(1.5,57);
	wait(2);
	level.var_31D method_84AB(15,14,5,2);
	wait(1);
	level.var_31D method_84AB(6,52,2,10);
	wait(4.3);
	level.var_31D method_84AB(2.5,36,10,2);
	wait(2.3);
	level.var_31D method_84AB(3.5,13.7,10,5);
	wait(0.45);
	level.var_31D method_84AB(4.5,19,20,10);
	wait(4.1);
	level.var_31D method_84AB(3.5,11.2,10,5);
	wait(0.55);
	level.var_31D method_84AB(3.5,24,5,2);
	wait(2.8);
	level.var_31D method_84AB(2.5,14.5,10,5);
	wait(0.4);
	level.var_31D method_84AB(4.5,21,5,2);
	wait(3);
	level.var_31D method_84AB(4.5,16,5,2);
	wait(0.6);
	level.var_31D method_84AB(4.5,9,10,5);
	wait(0.5);
	level.var_31D method_84AB(2.5,20,5,2);
	wait(2.5);
	level.var_31D method_84AB(4.5,11,10,5);
	wait(0.5);
	level.var_31D method_84AB(6,20,5,2);
	wait(1);
	level.var_31D method_84AB(6,300,5,2);
	wait(0.8);
	level.var_31D method_84AB(22,20,2);
	wait(1.7);
	level.var_31D method_84AB(4,300,20,2);
	wait(0.5);
	level.var_31D method_84AB(3,20,2);
	wait(2);
	level.var_31D method_84AB(5,9.7,10,2);
	wait(0.4);
	level.var_31D method_84AB(3,24,10,2);
	wait(1.8);
	level.var_31D method_84AB(1.5,17.8,10,2);
	wait(0.4);
	level.var_31D method_84AB(2,24,10,2);
	wait(0.7);
	level.var_31D method_84AB(3,14.7,20,2);
	wait(3.2);
	level.var_31D method_84AB(12,14,50,2);
	wait(2);
	level.var_31D method_84AB(2.5,300,5,2);
	wait(10);
	level.var_31D method_84AB(3,250,20,2);
	wait(2.5);
	level.var_31D method_84AB(2.5,20,5,2);
	wait(7);
	level.var_31D method_84AB(2.5,220,1,2);
	wait(6.5);
	level.var_31D method_84AB(4,21,1,2);
	wait(2);
	level.var_31D method_84AB(4,14.8,5,2);
	wait(2);
	level.var_31D method_84AB(6,9,5,2);
	wait(2);
	level.var_31D method_84AB(2.5,35,5,2);
	wait(3);
	level.var_31D method_84AB(4,13,2,10);
	wait(1.5);
	level.var_31D method_84AB(4,11.4,5,10);
	wait(1);
	level.var_31D method_84AB(4,13,10,10);
	wait(1.5);
	level.var_31D method_84AB(4,19.5,10,10);
	wait(2.2);
	level.var_31D method_84AB(4,13,10,10);
	wait(7.3);
	level.var_31D method_84AB(2.5,37,10,10);
	wait(3);
	level.var_31D method_84AB(2.5,90,1,2);
}

//Function Number: 148
func_152E()
{
	func_30D6();
	if(level.nextgen)
	{
		function_00D3("r_dof_physical_bokehEnable",1);
	}

	level.var_31D method_84A9();
	level.var_31D method_84AB(1.5,57);
	wait(2);
	level.var_31D method_84AB(13,14,5,2);
	wait(1);
	level.var_31D method_84AB(2,52,5,10);
	wait(4.3);
	level.var_31D method_84AB(1.5,36,10,2);
	wait(2.2);
	level.var_31D method_84AB(2.5,13.7,3,5);
	wait(0.55);
	level.var_31D method_84AB(3.5,19,20,10);
	wait(4.2);
	level.var_31D method_84AB(4,11.2,8,5);
	wait(0.45);
	level.var_31D method_84AB(2.5,24,12,2);
	wait(2.8);
	level.var_31D method_84AB(1.5,14.5,10,5);
	wait(0.4);
	level.var_31D method_84AB(5,21,10,2);
	wait(2.2);
	level.var_31D method_84AB(3.5,17.6,10,2);
	wait(0.4);
	level.var_31D method_84AB(3.5,21,5,2);
	wait(0.4);
	level.var_31D method_84AB(3.5,16,5,2);
	wait(0.6);
	level.var_31D method_84AB(5,9,5,5);
	wait(0.5);
	level.var_31D method_84AB(1.5,20,20,2);
	wait(2.5);
	level.var_31D method_84AB(8,11,5,10);
	wait(0.5);
	level.var_31D method_84AB(4,20,5,2);
	wait(1);
	level.var_31D method_84AB(4,300,5,2);
	wait(0.8);
	level.var_31D method_84AB(22,20,20,2);
	wait(1.7);
	level.var_31D method_84AB(4,300,20,2);
	wait(0.5);
	level.var_31D method_84AB(2,20,2);
	wait(2);
	level.var_31D method_84AB(4,9.7,10,2);
	wait(0.4);
	level.var_31D method_84AB(2,24,10,2);
	wait(1.8);
	level.var_31D method_84AB(1.5,17.8,10,2);
	wait(0.4);
	level.var_31D method_84AB(1,24,10,2);
	wait(0.6);
	level.var_31D method_84AB(2,14.7,10,2);
	wait(3.3);
	level.var_31D method_84AB(6,14,50,2);
	wait(1.3);
	level.var_31D method_84AB(0.5,24,2,1);
	wait(0.8);
	level.var_31D method_84AB(100,1,20,10);
	wait(1.2);
	level.var_31D method_84AB(12,1,40,20);
	wait(0.5);
	level.var_31D method_84AB(100,1,20,10);
	wait(1.5);
	level.var_31D method_84AB(7,1,20,10);
	wait(0.5);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.5);
	level.var_31D method_84AB(5,1,20,10);
	wait(0.1);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(15,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(12,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(11,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(9,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(12,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(8,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(10,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(8,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.05);
	level.var_31D method_84AB(7,1,20,10);
	wait(0.3);
	level.var_31D method_84AB(100,1,20,10);
	wait(0.5);
	level.var_31D method_84AB(6,1,20,10);
	wait(2);
	level.var_31D method_84AB(100,1,2,1);
	wait(2);
	level.var_31D method_84AB(2,250,20,2);
	wait(2.5);
	level.var_31D method_84AB(0.5,20,5,2);
	wait(7);
	level.var_31D method_84AB(1.5,220,1,2);
	wait(6.5);
	level.var_31D method_84AB(3,21,1,2);
	wait(2);
	level.var_31D method_84AB(3,14.8,5,2);
	wait(2);
	level.var_31D method_84AB(4,9,5,2);
	wait(2);
	level.var_31D method_84AB(1.5,35,5,2);
	wait(3);
	level.var_31D method_84AB(3,13,2,10);
	wait(1.5);
	level.var_31D method_84AB(3,11.4,5,10);
	wait(1);
	level.var_31D method_84AB(3,13,10,10);
	wait(1.5);
	level.var_31D method_84AB(3,19.5,10,10);
	wait(2.2);
	level.var_31D method_84AB(3,13,10,10);
	wait(2.4);
	level.var_31D method_84AB(3,10.9,10,10);
	wait(1.5);
	level.var_31D method_84AB(3,12.5,5,10);
	wait(3);
	level.var_31D method_84AB(1.5,37,10,10);
	wait(3);
	level.var_31D method_84AB(1.5,90,1,2);
}

//Function Number: 149
func_5759()
{
	self waittill("trigger");
	level.var_31D method_83C0("seoul_shopping_district");
	level.var_31D method_8490("clut_seoul_shopping",1);
	level.var_6AD8 = 3;
	while(level.var_31D istouching(self))
	{
		wait(0.1);
	}
}

//Function Number: 150
func_5951()
{
	wait(0.05);
	common_scripts\utility::flag_init("force_light_01");
	var_00 = getent("shadowlight_01","targetname");
	for(;;)
	{
		common_scripts\utility::flag_wait("force_light_01");
		var_00 method_8498("force_on");
		common_scripts\utility::flag_waitopen("force_light_01");
		var_00 method_8498("force_off");
	}
}

//Function Number: 151
func_9297()
{
	wait(0.05);
	common_scripts\utility::flag_wait("door_pop");
	common_scripts\utility::flag_wait("door_shut");
}

//Function Number: 152
func_4EF4()
{
	function_0072(9,1);
	wait(3);
	function_0072(0,1);
}

//Function Number: 153
func_61AD(param_00)
{
}

//Function Number: 154
func_3729()
{
	var_00 = level.var_21DF;
	var_01 = level.var_A31B;
	if(level.nextgen)
	{
		var_00 method_846C("mtl_cormack_eye_shader_l","mc/mtl_cormack_eye_shader_seoulpod_l");
		var_00 method_846C("mtl_cormack_eye_shader_r","mc/mtl_cormack_eye_shader_seoulpod_r");
		return;
	}

	var_00 method_846C("mtl_cormack_eye_shader_l","mqc/mtl_cormack_eye_shader_seoulpod_l");
	var_00 method_846C("mtl_cormack_eye_shader_r","mqc/mtl_cormack_eye_shader_seoulpod_r");
}

//Function Number: 155
func_3732()
{
	var_00 = level.var_A2C5;
	var_01 = var_00.var_2E6;
	var_02 = getent("lighting_centroid_mwp","targetname");
	var_00 method_847B(var_02.var_2E6);
}

//Function Number: 156
func_602E()
{
	var_00 = level.var_A2C5;
	wait(35);
	var_00 method_847C();
}

//Function Number: 157
func_6026()
{
	var_00 = level.var_A2C5;
	wait(39);
	var_01 = getent("mwp_reflection","targetname");
}

//Function Number: 158
func_602D()
{
	wait(40.7);
	level.var_31D method_83C0("seoul_finexp_brightest");
	wait(0.1);
	level.var_31D method_83C0("seoul_finexp_dark");
	wait(0.3);
	level.var_31D method_83C0("seoul_finale");
	wait(1.6);
	level.var_31D method_83C0("seoul_finexp_brightest");
	wait(0.1);
	level.var_31D method_83C0("seoul_finexp_dark");
	wait(0.3);
	level.var_31D method_83C0("seoul_finale");
	wait(0.6);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.1);
	level.var_31D method_83C0("seoul_finale");
	wait(0.05);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.05);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.05);
	level.var_31D method_83C0("seoul_finale");
	wait(0.05);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.05);
	level.var_31D method_83C0("seoul_finale");
	wait(0.05);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.05);
	level.var_31D method_83C0("seoul_finale");
	wait(0.05);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.05);
	level.var_31D method_83C0("seoul_finale");
	wait(0.05);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.05);
	level.var_31D method_83C0("seoul_finale");
	wait(0.05);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.05);
	level.var_31D method_83C0("seoul_finale");
	wait(0.05);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.05);
	level.var_31D method_83C0("seoul_finale");
	wait(0.05);
	level.var_31D method_83C0("seoul_finexp_bright");
	wait(0.3);
	level.var_31D method_83C0("seoul_finexp_dark");
	wait(0.5);
	level.var_31D method_83C0("seoul_finexp_brightest");
	wait(0.5);
	level.var_31D method_83C0("seoul_finexp_dark");
	wait(0.5);
	level.var_31D method_83C0("seoul_finale");
}

//Function Number: 159
func_1AAC()
{
	thread lib_A544::func_7EB8("light_left_big_key",24000000);
}

//Function Number: 160
func_6E9A()
{
	var_00 = level.var_A2C5;
	thread func_3729();
	var_01 = -1;
	thread func_602C();
	if(level.nextgen)
	{
		function_00D3("r_mbvelocityscalar","1");
	}

	if(level.nextgen)
	{
		lib_A544::func_7EB7("light_cine_key_rad",(0.101,0.2,0.515));
		function_00D3("r_mdaoCapsulestrength","1");
	}

	if(level.nextgen)
	{
		var_02 = getent("light_cine_key_rad","targetname");
		var_02 method_8020(60,20);
		thread lib_A544::lerp_spot_intensity("light_cine_key_rad",1,80000);
	}

	wait(3.75);
}

//Function Number: 161
func_937D()
{
	wait(0.62);
	thread func_152F();
	thread func_602B();
	thread func_152E();
	thread func_602D();
	thread func_6029();
	thread func_602A();
	thread func_602E();
	thread func_6026();
}

//Function Number: 162
func_152F()
{
	var_00 = level.var_A2C5;
	lib_A59A::func_9E65("seoul_finale",1);
	var_01 = undefined;
	if(level.nextgen)
	{
		var_01 = getent("light_cine_key_rad","targetname");
	}

	level.var_31D method_83C0("seoul_finale");
	if(level.nextgen)
	{
		lib_A59A::func_5699("r_mdaoCapsulestrength",0.25,1);
	}

	wait(1);
	wait(6.7);
	if(level.nextgen)
	{
		var_01 lib_A544::func_568B(60,20,20,5,1);
	}
}

//Function Number: 163
func_1D6D()
{
	wait(48);
	lib_A544::func_6947("firelight_motion_medium_dim2","prim_debris_cine_fire");
	wait(30);
}

//Function Number: 164
func_602C()
{
	if(level.nextgen)
	{
		wait(1);
		lib_A544::pause_flickerlight("firelight_motion_weaplat_rim","light_weaplat_rim");
		lib_A544::lerp_spot_intensity("light_weaplat_rim",2,0);
		wait(0.3);
		level.var_859 = lib_A544::func_8286("light_weaplat_rim",1,(0,0,0),(0,0,0),0,(1,0.6549,0.5922),1,90,level.var_A2C5,"tag_left_pre_key",200);
		lib_A544::func_7B26(level.var_859,0,(0,0,0),(0,0,0),100000,undefined,1,90,200,0.25);
		lib_A544::func_33F1(level.var_859);
	}
}

//Function Number: 165
func_602B()
{
	if(level.nextgen)
	{
		var_00 = getent("light_weaplat_rim","targetname");
		wait(2);
		lib_A544::func_8EB8(level.var_859);
		var_01 = lib_A544::func_8286("light_weaplat_rim",2,(0,0,0),(0,0,0),100000,(1,0.6549,0.5922),1,90,level.var_A2C5,"tag_left_in_key");
		lib_A544::func_33F1(var_01);
		wait(30);
		lib_A544::func_8EB8(var_01);
		wait(0.05);
		var_02 = lib_A544::func_8286("light_weaplat_rim",3,(0,0,0),(0,0,0),1,(1,0.6549,0.5922),1,90,level.var_A2C5,"tag_left_in_key");
		lib_A544::func_7B26(var_02,0,(30,-15,-7),(-10,65,0),11266,undefined,12,49,28,1.5);
		lib_A544::func_33F1(var_02);
		wait(11);
		lib_A544::func_8EB8(var_02);
		var_00 method_8046(300);
	}
}

//Function Number: 166
func_6029()
{
	if(level.nextgen)
	{
		var_00 = getent("light_left_big_key","targetname");
		var_00 method_8498("force_on");
		var_01 = var_00.var_2E6;
		var_02 = var_00.var_41;
		var_03 = common_scripts\utility::getstruct("script_struct_light_left_cormack_run","targetname");
		var_04 = common_scripts\utility::getstruct("script_struct_light_a","targetname");
		var_05 = common_scripts\utility::getstruct("script_struct_light_c_pt1","targetname");
		var_06 = common_scripts\utility::getstruct("script_struct_light_c_pt2","targetname");
		var_07 = common_scripts\utility::getstruct("script_struct_light_c","targetname");
		var_08 = common_scripts\utility::getstruct("script_struct_light_d","targetname");
		lib_A544::func_7EB7("light_left_big_key",(1,0.608,0.459));
		wait(10);
		wait(0.5);
		wait(24);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_flyup","light_weaplat_rim",0);
		thread lib_A544::lerp_spot_intensity("light_cine_key_rad",0.05,0);
		wait(1.85);
		var_00 lib_A544::func_568B(90,70,55,40,0.05);
		thread lib_A544::lerp_spot_intensity("light_left_big_key",0.05,4000000);
		func_568E(var_00,3,var_03.var_2E6);
		func_5683(var_00,3,var_03.var_41);
		wait(2.65);
		lib_A544::func_6947("firelight_motion_weaplat_flyup","light_weaplat_rim");
		wait(19.5);
		thread lib_A544::lerp_spot_intensity("light_left_big_key",0.75,0.05);
		wait(0.75);
		var_00 lib_A544::func_568B(90,70,20,10,0.05);
		func_568E(var_00,0.05,var_04.var_2E6);
		func_5683(var_00,0.05,var_04.var_41);
		wait(0.05);
		thread lib_A544::lerp_spot_intensity("light_left_big_key",1.5,1500000);
		level.var_31D method_8490("clut_seoul_ending_v2",10);
		wait(5);
		thread lib_A544::lerp_spot_intensity("light_left_big_key",0.05,10000);
		var_00 lib_A544::func_568B(30,10,35,5,0.05);
		func_568E(var_00,0.2,var_07.var_2E6);
		func_5683(var_00,0.2,var_05.var_41);
		thread lib_A544::lerp_spot_intensity("light_left_big_key",3,320000);
		wait(1);
		var_00 lib_A544::func_568B(30,10,40,20,1);
		func_5683(var_00,2,var_06.var_41);
		var_09 = getent("light_weaplat_rim","targetname");
		var_09 method_8498("force_off");
		wait(6.35);
		var_00 lib_A544::func_568B(40,20,40,30,0.05);
		func_568E(var_00,0.1,var_08.var_2E6);
		func_5683(var_00,0.1,var_08.var_41);
		wait(4.1);
		func_568E(var_00,0.1,var_04.var_2E6);
		func_5683(var_00,0.1,var_04.var_41);
	}
}

//Function Number: 167
func_602A()
{
	if(level.nextgen)
	{
		var_00 = getent("light_weaplat_rim","targetname");
		var_00 method_8498("force_on");
		var_01 = var_00.var_2E6;
		var_02 = var_00.var_41;
		var_03 = common_scripts\utility::getstruct("script_struct_light_cine_fire_body","targetname");
		var_04 = common_scripts\utility::getstruct("script_struct_light_cine_fire_cormack","targetname");
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim","light_weaplat_rim",0);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim_dim","light_weaplat_rim",0);
		wait(47);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim","light_weaplat_rim",0);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim_dim","light_weaplat_rim",0);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim_cormack","light_weaplat_rim",0);
		var_00 lib_A544::func_568B(120,80,90,30,0.05);
		func_568E(var_00,0.05,var_03.var_2E6);
		func_5683(var_00,0.05,var_03.var_41);
		lib_A544::func_6947("firelight_motion_weaplat_rim_body","light_weaplat_rim");
		wait(15);
		var_00 lib_A544::func_568B(90,30,30,10,2);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim","light_weaplat_rim",0);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim_dim","light_weaplat_rim",0);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim_cormack","light_weaplat_rim",0);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim_body","light_weaplat_rim",0);
		func_568E(var_00,0.05,var_04.var_2E6);
		func_5683(var_00,0.05,var_04.var_41);
		lib_A544::func_7EB7("light_weaplat_rim",(0.3791,0.5788,1));
		thread lib_A544::lerp_spot_intensity("light_weaplat_rim",0.05,8000);
		var_00 lib_A544::func_568B(10,1,90,30,3);
		wait(8);
		thread lib_A544::lerp_spot_intensity("light_weaplat_rim",0.05,2000);
		wait(10.5);
		thread lib_A544::func_7EB8("light_weaplat_rim",320000);
		lib_A544::func_7EB7("light_weaplat_rim",(1,0.346,0.0467));
		var_00 method_8498("force_on");
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim_body","light_weaplat_rim",0);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim_cormack","light_weaplat_rim",0);
		var_00 lib_A544::func_568B(120,80,90,30,0.05);
		func_568E(var_00,0.05,var_03.var_2E6);
		func_5683(var_00,0.05,var_03.var_41);
		lib_A544::func_6947("firelight_motion_weaplat_rim_body","light_weaplat_rim");
	}
}

//Function Number: 168
func_6028()
{
	if(level.nextgen)
	{
		lib_A544::func_7EB7("light_cine_finale_left_key_a",(1,0.508,0.332));
		lib_A544::func_7EB7("light_cine_finale_left_key_d",(1,0.508,0.332));
		thread lib_A544::lerp_spot_intensity("light_cine_finale_left_key_a",3,1);
		thread lib_A544::lerp_spot_intensity("light_cine_finale_left_key_d",1,1);
		wait(10);
		thread lib_A544::lerp_spot_intensity("light_weaplat_rim",1,1);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_rim_dim","light_weaplat_rim",0);
		wait(0.5);
		lib_A544::func_6947("firelight_motion_weaplat_flyup","light_weaplat_rim");
		wait(24);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_flyup","light_weaplat_rim",0);
		wait(4.5);
		lib_A544::func_6947("firelight_motion_weaplat_flyup","light_weaplat_rim");
		wait(3);
		thread lib_A544::lerp_spot_intensity("light_left_big_key",1,1);
		var_00 = getent("light_left_big_key","targetname");
		var_00 method_8498("force_off");
		wait(2);
		level.var_31D method_8490("clut_seoul_ending_v2",10);
		thread lib_A544::lerp_spot_intensity("light_cine_finale_left_key_a",1,1280000);
		wait(15);
		var_01 = getent("light_cine_finale_left_key_a","targetname");
		var_01 lib_A544::func_568B(80,10,15,1,1);
		wait(7);
		lib_A544::stop_flickerlight("firelight_motion_weaplat_flyup","light_weaplat_rim",0);
		var_02 = getent("light_weaplat_rim","targetname");
		var_02 method_8498("force_off");
		wait(1.5);
		wait(1.5);
		wait(0.7);
		thread lib_A544::lerp_spot_intensity("light_cine_finale_left_key_a",0.5,1280000);
		var_01 = getent("light_cine_finale_left_key_a","targetname");
		var_01 lib_A544::func_568B(15,1,70,10,0.1);
		wait(0.3);
		var_03 = getent("light_cine_finale_left_key_a","targetname");
		var_04 = common_scripts\utility::getstruct("script_struct_light_c","targetname");
		func_568E(var_03,0.6,var_04.var_2E6);
		wait(1.5);
		thread lib_A544::lerp_spot_intensity("light_cine_finale_left_key_a",2,320000);
		var_01 lib_A544::func_568B(70,10,60,5,2);
		var_01 = getent("light_cine_finale_left_key_d","targetname");
		var_01 lib_A544::func_568B(90,1,50,1,0.2);
		wait(6.5);
		thread lib_A544::lerp_spot_intensity("light_cine_finale_left_key_d",2,800000);
		var_05 = getent("light_cine_finale_left_key_d","targetname");
		var_05 method_8498("force_on");
		wait(2);
		thread lib_A544::lerp_spot_intensity("light_cine_finale_left_key_a",1,1);
		wait(2);
		var_05 = getent("light_cine_finale_left_key_d","targetname");
		thread lib_A544::lerp_spot_intensity("light_cine_finale_left_key_a",1,40000);
	}
}

//Function Number: 169
func_6027()
{
	level waittill("panel_close_wait");
	var_00 = level.var_A2C5;
	var_01 = common_scripts\utility::spawn_tag_origin();
	var_01 linkto(level.var_A31B,"J_head",(5,-5,-8),(0,0,0),0);
	var_02 = common_scripts\utility::spawn_tag_origin();
	var_02 linkto(level.var_A31B,"J_head",(4,-4,9),(0,0,0),0);
	if(level.nextgen)
	{
		lib_A59A::func_5699("r_mdaoCapsulestrength",0.25,2);
	}

	wait(4.65);
	wait(0.05);
	playfxontag(common_scripts\utility::getfx("light_left_shut_blink"),var_00,"tag_left_key");
	wait(14.8);
	var_03 = common_scripts\utility::spawn_tag_origin();
	var_03 linkto(level.var_A31B,"J_head",(0,-6,7),(0,0,0),0);
	wait(3.5);
	wait(1.8);
	var_04 = common_scripts\utility::spawn_tag_origin();
	var_04 linkto(level.var_A31B,"J_head",(0,5,-4),(0,0,0),0);
	if(level.nextgen)
	{
		var_05 = getent("light_cine_key_rad","targetname");
		var_05 method_8498("force_off");
	}

	wait(2);
	if(level.nextgen)
	{
		lib_A59A::func_5699("r_mdaoCapsulestrength",0.15,1);
	}

	wait(3.95);
	level.var_31D method_83C0("seoul_mad");
	wait(2);
	killfxontag(common_scripts\utility::getfx("light_left_shut_spot"),var_00,"tag_left_key");
	wait(0.05);
	if(level.nextgen)
	{
		thread lib_A544::lerp_spot_intensity("light_cine_key_rad",0,1);
	}

	wait(2);
	wait(1.5);
	killfxontag(common_scripts\utility::getfx("light_left_shut_blink"),var_00,"tag_left_key");
	level.var_31D thread lib_A544::func_7916(200,"ac130_overlay_pip_vignette",0,0,0.1,0,0);
	wait(0.1);
	if(level.nextgen)
	{
		lib_A59A::func_5699("r_mdaoCapsulestrength",0.4,1);
	}

	wait(2.3);
	wait(2);
	wait(2);
	if(level.nextgen)
	{
		function_00D3("r_eyepupil",".1");
	}

	wait(2.5);
	level.var_31D method_83C0("seoul_fin_cormack");
	wait(3.35);
	level.var_31D thread lib_A544::func_7916(200,"ac130_overlay_pip_vignette",0,0,0.2,0,0);
	wait(6.65);
	var_06 = common_scripts\utility::spawn_tag_origin();
	var_06 linkto(level.var_21DF,"J_head",(3,8,0),(0,0,0),0);
	wait(4);
	var_07 = common_scripts\utility::spawn_tag_origin();
	var_07 linkto(level.var_21DF,"J_head",(4,-4,9),(0,0,0),0);
	wait(7.5);
	level.var_31D thread lib_A544::func_7916(40,"ac130_overlay_pip_vignette",3,0,0.7,0,0);
	wait(2.5);
	wait(2.9);
	wait(12);
	wait(0.1);
	killfxontag(common_scripts\utility::getfx("light_face_cormack_r"),var_07,"tag_origin");
}

//Function Number: 170
func_56FB()
{
	common_scripts\_exploder::exploder("exp_light_cine_fire_cormack");
}

//Function Number: 171
func_4845()
{
	var_00 = getentarray("hide_screens","targetname");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_00[var_01] hide();
	}
}

//Function Number: 172
func_3733(param_00)
{
}

//Function Number: 173
func_3717(param_00)
{
	var_01 = getent("lighting_centroid_viewmodel","targetname");
	param_00 method_847B(param_00.var_2E6);
	var_02 = level.var_21DF;
	var_03 = getent("lighting_centroid_cormac","targetname");
	var_03 linkto(var_02,"J_Head");
	var_02 method_847B(var_03.var_2E6);
}

//Function Number: 174
func_3959()
{
	common_scripts\utility::flag_wait("dof_fob");
	level.var_31D method_84A9();
	if(level.nextgen)
	{
		level.var_31D method_84AB(2,200,20,20);
	}
	else
	{
		level.var_31D method_84AB(20,10000,20,20);
	}

	common_scripts\utility::flag_waitopen("dof_fob");
	thread func_30DF();
}

//Function Number: 175
func_6876()
{
	thread lib_A544::lerp_spot_intensity("plane_lights_01",0.05,400000);
	wait(0.05);
	thread lib_A544::lerp_spot_intensity("plane_lights_02",0.05,400000);
	wait(0.1);
	thread lib_A544::lerp_spot_intensity("plane_lights_01",0.5,3000);
	wait(0.1);
	thread lib_A544::lerp_spot_intensity("plane_lights_02",0.5,3000);
	wait(1.5);
	thread lib_A544::lerp_spot_intensity("plane_lights_01",0.05,3000000);
	wait(0.05);
	thread lib_A544::lerp_spot_intensity("plane_lights_02",0.05,3000000);
	wait(0.5);
	thread lib_A544::lerp_spot_intensity("plane_lights_01",1,3000);
	wait(0.1);
	thread lib_A544::lerp_spot_intensity("plane_lights_02",1,3000);
}

//Function Number: 176
func_152C(param_00)
{
	param_00.light = common_scripts\utility::spawn_tag_origin();
	var_01 = param_00.light;
	var_01 linkto(param_00,"tag_origin",(0,0,0),(0,0,0),0);
	wait(3.75);
	playfxontag(common_scripts\utility::getfx("light_blink_red"),var_01,"tag_origin");
	common_scripts\utility::flag_wait("cleanup_finale_explosive");
	stopfxontag(common_scripts\utility::getfx("light_blink_red"),var_01,"tag_origin");
}

//Function Number: 177
func_72B0(param_00,param_01,param_02,param_03)
{
	wait 0.05;
	var_04 = getent("pod_orange_reflection","targetname");
	var_05 = getent("pod_reflection","targetname");
	var_06 = getent("main_street_reflection","targetname");
	if(level.nextgen)
	{
		var_07 = getent("pod_reflection_lighter","targetname");
		var_08 = getent("fly_in_reflection","targetname");
	}
	else
	{
		var_07 = getent("main_street_reflection","targetname");
		var_08 = getent("main_street_reflection","targetname");
	}

	foreach(var_0A in param_00)
	{
		var_0A method_83AB(param_01.var_2E6);
	}
}

//Function Number: 178
func_72B1(param_00,param_01,param_02,param_03)
{
	function_00D3("r_lightGridDefaultFXLightingLookup",(36131,1697.47,1819.99));
	function_00D3("r_lightGridDefaultModelLightingLookup",(36131,1697.47,1819.99));
	var_04 = getent("red_reflection_01","targetname");
	foreach(var_06 in param_00)
	{
		var_06 method_83AB(var_04.var_2E6);
	}
}

//Function Number: 179
func_72B2(param_00,param_01,param_02,param_03)
{
	wait(2.8);
	foreach(var_05 in param_00)
	{
		var_05 method_83AC();
	}

	wait(25);
	thread func_39A1();
}

//Function Number: 180
func_39A1()
{
	if(level.nextgen)
	{
		var_00 = getent("firelight_hotel_small_11","targetname");
		var_00 method_8498("force_on");
		level waittill("hotel_fall");
		var_00 method_8498("force_off");
	}
}

//Function Number: 181
func_4F73()
{
	level.var_31D thread lib_A544::func_7916(0,"ac130_overlay_pip_vignette",0,0,1,0,0);
	var_00 = getent("pre_pod_key","targetname");
	if(level.nextgen)
	{
		var_01 = lib_A544::func_8286("pre_pod_fill",1,(17.64,25.16,39.2),(4.24,-101,0),400,(1,0.26,0.1),60,120,level.var_21F6,"tag_origin",250);
		lib_A544::func_33F1(var_01);
		var_02 = undefined;
		var_03 = common_scripts\utility::getstruct("pod_fill_cormac","targetname");
		var_04 = common_scripts\utility::getstruct("pod_key_cormac","targetname");
		lib_A544::func_7EB7("pre_pod_key",(0.35,0.75,1));
		thread lib_A544::lerp_spot_intensity("pre_pod_key",0,600);
		wait(1);
		var_00 method_8046(250);
		wait(7);
		wait(5);
		thread lib_A544::lerp_spot_intensity("pre_pod_key",4,1550);
		wait(8);
		lib_A544::func_8EB8(var_01);
		wait(0.05);
		var_05 = lib_A544::func_8286("pre_pod_fill",1,(0,-26.7,32.6),(4.24,-101.02,0),500,(0.63,0.73,1),60,120,level.var_21F6,"tag_origin",100);
		lib_A544::func_33F1(var_05);
		wait(15);
		lib_A544::func_8EB8(var_05);
		var_00 method_8046(250);
		wait(0.05);
		return;
	}

	lib_A544::func_7EB7("pre_pod_key",(0.35,1,0.757));
	thread lib_A544::lerp_spot_intensity("pre_pod_key",0,60);
	wait(1);
	var_00 method_8046(250);
	wait(38.1);
	var_00 method_8046(250);
	wait(0.05);
}

//Function Number: 182
func_6E01()
{
	var_00 = level.var_21F6;
	var_01 = level.var_A31C;
	if(level.nextgen)
	{
		var_00 method_846C("mtl_cormack_eye_shader_l","mc/mtl_cormack_eye_shader_seoulpod_l");
		var_00 method_846C("mtl_cormack_eye_shader_r","mc/mtl_cormack_eye_shader_seoulpod_r");
		var_01 method_846C("mtl_burke_eye_shader_l","mc/mtl_burke_eye_shader_seoulpod_l");
		var_01 method_846C("mtl_burke_eye_shader_r","mc/mtl_burke_eye_shader_seoulpod_r");
		return;
	}

	var_00 method_846C("mtl_cormack_eye_shader_l","mqc/mtl_cormack_eye_shader_seoulpod_l");
	var_00 method_846C("mtl_cormack_eye_shader_r","mqc/mtl_cormack_eye_shader_seoulpod_r");
	var_01 method_846C("mtl_burke_eye_shader_l","mqc/mtl_burke_eye_shader_seoulpod_l");
	var_01 method_846C("mtl_burke_eye_shader_r","mqc/mtl_burke_eye_shader_seoulpod_r");
}

//Function Number: 183
func_6E00()
{
	var_00 = level.var_21DF;
	var_01 = level.var_A31B;
	if(level.nextgen)
	{
		var_00 method_846C("mtl_cormack_eye_shader_l","mc/mtl_cormack_eye_shader_seoulpod_l");
		var_00 method_846C("mtl_cormack_eye_shader_r","mc/mtl_cormack_eye_shader_seoulpod_r");
		var_01 method_846C("mtl_burke_eye_shader_l","mc/mtl_burke_eye_shader_seoulpod_l");
		var_01 method_846C("mtl_burke_eye_shader_r","mc/mtl_burke_eye_shader_seoulpod_r");
	}
	else
	{
		var_00 method_846C("mtl_cormack_eye_shader_l","mqc/mtl_cormack_eye_shader_seoulpod_l");
		var_00 method_846C("mtl_cormack_eye_shader_r","mqc/mtl_cormack_eye_shader_seoulpod_r");
		var_01 method_846C("mtl_burke_eye_shader_l","mqc/mtl_burke_eye_shader_seoulpod_l");
		var_01 method_846C("mtl_burke_eye_shader_r","mqc/mtl_burke_eye_shader_seoulpod_r");
	}

	level waittill("player_drop_pod_door_kick");
	wait(2.8);
	var_00 method_846D();
	var_01 method_846D();
}

//Function Number: 184
func_14AA(param_00)
{
	if(level.nextgen)
	{
		var_01 = lib_A544::func_8286("pre_pod_key",0,(-5.57,-23.27,40.18),(-2,-78,0),40000,(0.63,0.73,1),80,120,param_00,"tag_origin");
		lib_A544::func_33F1(var_01);
		level waittill("pod_lights_on");
		lib_A544::func_8EB8(var_01);
		return;
	}

	var_01 = lib_A544::func_8286("pre_pod_key",0,(-5.57,-23.27,40.18),(-2,-78,0),40000,(0.63,0.73,1),80,120,var_01,"tag_origin");
	lib_A544::func_33F1(var_01);
	level waittill("pod_lights_on");
	lib_A544::func_8EB8(var_01);
}

//Function Number: 185
func_6E11(param_00)
{
	var_01 = getent("main_street_reflection","targetname");
	var_02 = anglestoforward((30,30,0));
	var_03 = anglestoforward((0,-20,0));
	param_00.var_2D4C = common_scripts\utility::spawn_tag_origin();
	var_04 = param_00.var_2D4C;
	var_04 linkto(param_00,"body_animate_joint",(-20,60,20),(0,-20,0),0);
	var_05 = undefined;
	var_06 = undefined;
	if(level.nextgen)
	{
		var_05 = lib_A544::func_8286("pre_pod_key",0,(-5.57,-23.27,40.18),(-2,-78,0),350,(0.63,0.73,1),60,100,level.var_21F6,"tag_origin");
		var_06 = lib_A544::func_8286("pre_pod_fill",1,(-29.84,-47.8,58.47),(18.98,26.71,0),50,(1,0.25,0),60,100,level.var_21F6,"tag_origin");
	}
	else
	{
		var_05 = lib_A544::func_8286("pre_pod_key",0,(-5.57,-23.27,40.18),(-2,-78,0),60,(0.63,0.73,1),60,100,level.var_21F6,"tag_origin");
		var_06 = lib_A544::func_8286("pre_pod_fill",1,(-29.84,-47.8,58.47),(18.98,26.71,0),200,(1,0.25,0),60,100,level.var_21F6,"tag_origin");
	}

	wait(0.05);
	level.var_31D method_83C0("seoul_intro_outside");
	if(level.nextgen)
	{
		lib_A544::func_33F1(var_05);
		lib_A544::func_33F1(var_06);
	}
	else
	{
		lib_A544::func_33F1(var_05);
	}

	wait(3);
	wait(5.1);
	level.var_31D method_83C0("seoul_intro");
	if(level.nextgen)
	{
		lib_A544::func_8EB8(var_05);
		lib_A544::func_8EB8(var_06);
	}
	else
	{
		lib_A544::func_8EB8(var_05);
	}

	wait(0.05);
	level.var_31D method_83C0("seoul_intro");
	var_07 = undefined;
	var_08 = undefined;
	if(level.nextgen)
	{
		var_07 = lib_A544::func_8286("pre_pod_key",0,(-12.8,-35.31,58.13),(8,68,0),500,(0.63,0.73,1),60,100,level.var_21F6,"tag_origin",80);
		var_08 = lib_A544::func_8286("pre_pod_fill",1,(24.8,12.42,47.52),(2.93,-149.42,0),80,(1,0.25,0.1),60,100,level.var_21F6,"tag_origin",80);
		lib_A544::func_33F1(var_07);
		lib_A544::func_33F1(var_08);
	}
	else
	{
		var_07 = lib_A544::func_8286("pre_pod_key",0,(-12.8,-35.31,58.13),(8,68,0),500,(0.63,0.73,1),60,100,level.var_21F6,"tag_origin",80);
		lib_A544::func_33F1(var_07);
	}

	wait(3);
	level.var_31D method_83C0("seoul_intro_outside");
	wait(4);
	level.var_31D method_83C0("seoul_intro_missle_hit");
	if(level.nextgen)
	{
		lib_A544::func_8EB8(var_07);
		lib_A544::func_8EB8(var_08);
	}
	else
	{
		lib_A544::func_8EB8(var_07);
	}

	wait(0.05);
	var_09 = undefined;
	var_0A = undefined;
	if(level.nextgen)
	{
		var_09 = lib_A544::func_8286("pre_pod_key",0,(-5.5,-37.37,51.89),(3.7,58,0),130,(0.63,0.73,1),60,100,level.var_21F6,"tag_origin",200);
		var_0A = lib_A544::func_8286("pre_pod_fill",1,(-25.43,-15.49,45.5),(-1.4,-27,0),800,(1,1,1),60,100,level.var_21F6,"tag_origin",200);
		lib_A544::func_33F1(var_09);
		lib_A544::func_33F1(var_0A);
	}
	else
	{
		var_09 = lib_A544::func_8286("pre_pod_key",0,(-5.5,-37.37,51.89),(3.7,58,0),130,(0.63,0.73,1),60,100,level.var_21F6,"tag_origin",200);
		lib_A544::func_33F1(var_09);
	}

	wait(1.5);
	playfxontag(common_scripts\utility::getfx("pod_godray"),var_04,"tag_origin");
	common_scripts\utility::flag_wait("door_pop");
	wait(0.5);
	level.var_31D method_83C0("seoul_intro_bright");
	lib_A59A::func_9E65("seoul_space_entry_bright",0.5);
	killfxontag(common_scripts\utility::getfx("pod_godray"),var_04,"tag_origin");
	if(level.nextgen)
	{
		lib_A544::func_8EB8(var_09);
		lib_A544::func_8EB8(var_0A);
	}
	else
	{
		lib_A544::func_8EB8(var_09);
	}

	wait(0.05);
	var_0B = undefined;
	var_0C = undefined;
	if(level.nextgen)
	{
		var_0B = lib_A544::func_8286("pre_pod_key",0,(-5.5,-37.37,51.89),(3.7,58,0),2000,(0.3,0.6,1),60,100,level.var_21F6,"tag_origin",200);
		var_0C = lib_A544::func_8286("pre_pod_fill",1,(41.79,-7.24,18.23),(-3,135.7,0),35,(0.3,0.6,1),60,100,level.var_21F6,"tag_origin",200);
		lib_A544::func_33F1(var_0B);
		lib_A544::func_33F1(var_0C);
	}
	else
	{
		var_0B = lib_A544::func_8286("pre_pod_key",0,(-5.5,-37.37,51.89),(3.7,58,0),2000,(0.3,0.6,1),60,100,level.var_21F6,"tag_origin",200);
		lib_A544::func_33F1(var_0C);
	}

	wait(0.75);
	playfxontag(common_scripts\utility::getfx("pod_light_spot_blue"),var_04,"tag_origin");
	wait(0.75);
	level.var_31D method_83C0("seoul_intro");
	lib_A59A::func_9E65("seoul_space_entry",2);
	common_scripts\utility::flag_wait("door_shut");
	killfxontag(common_scripts\utility::getfx("pod_light_spot_blue"),var_04,"tag_origin");
	if(level.nextgen)
	{
		lib_A544::func_8EB8(var_0B);
		lib_A544::func_8EB8(var_0C);
	}
	else
	{
		lib_A544::func_8EB8(var_0B);
	}

	wait(0.05);
	var_0D = undefined;
	var_0E = undefined;
	if(level.nextgen)
	{
		var_0D = lib_A544::func_8286("pre_pod_key",0,(5.4,-27.36,107),(84,130,0),12000,(1,0.02,0),30,119,level.var_21F6,"tag_origin",250);
		var_0E = lib_A544::func_8286("pre_pod_fill",1,(-5.16,-45.15,77.9),(84,130,0),4200,(1,0.15,0.18),60,119,level.var_21F6,"tag_origin",250);
		lib_A544::func_33F1(var_0D);
		lib_A544::func_33F1(var_0E);
	}
	else
	{
		var_0D = lib_A544::func_8286("pre_pod_key",0,(5.4,-27.36,107),(84,130,0),12000,(1,0.02,0),30,119,level.var_21F6,"tag_origin",250);
		lib_A544::func_33F1(var_0D);
	}

	wait(8);
	if(level.nextgen)
	{
		lib_A544::func_8EB8(var_0D);
		lib_A544::func_8EB8(var_0E);
	}
	else
	{
		lib_A544::func_8EB8(var_0D);
	}

	wait(0.05);
	var_0F = undefined;
	var_10 = undefined;
	if(level.nextgen)
	{
		var_0F = lib_A544::func_8286("pre_pod_key",0,(5.4,-27.36,107),(84,130,0),12000,(0.125,0.43,0),30,119,level.var_21F6,"tag_origin",250);
		var_10 = lib_A544::func_8286("pre_pod_fill",1,(-5.16,-45.15,77.9),(84,130,0),4200,(0,0.86,0.5),60,119,level.var_21F6,"tag_origin",250);
		lib_A544::func_33F1(var_0F);
		lib_A544::func_33F1(var_10);
	}
	else
	{
		var_0F = lib_A544::func_8286("pre_pod_key",0,(5.4,-27.36,107),(84,130,0),12000,(0.125,0.43,0),30,119,level.var_21F6,"tag_origin",250);
		lib_A544::func_33F1(var_0F);
	}

	wait(3);
	if(level.nextgen)
	{
		level.var_31D method_83C0("seoul_intro_outside_dim");
	}

	if(level.nextgen)
	{
		lib_A544::func_8EB8(var_0F);
		lib_A544::func_8EB8(var_10);
	}
	else
	{
		lib_A544::func_8EB8(var_0F);
	}

	wait(3.7);
	if(level.nextgen)
	{
		level.var_31D method_83C0("seoul_intro_outside_hit");
	}

	wait(0.4);
	level.var_31D method_83C0("seoul_intro_outside_dim");
}

//Function Number: 186
func_6E0C(param_00)
{
	var_01 = level.var_A31C;
	param_00.var_567F = common_scripts\utility::spawn_tag_origin();
	var_02 = param_00.var_567F;
	param_00.var_5680 = common_scripts\utility::spawn_tag_origin();
	var_03 = param_00.var_5680;
	param_00.var_729D = common_scripts\utility::spawn_tag_origin();
	var_04 = param_00.var_729D;
	var_03 linkto(param_00,"body_animate_joint",(-30,68,31),(0,-90,90),0);
	var_04 linkto(var_01,"J_Head",(0,0,0),(0,0,0),0);
	wait(9);
	playfxontag(common_scripts\utility::getfx("seo_lens_pod"),var_03,"tag_origin");
	wait(16);
	wait(4);
	killfxontag(common_scripts\utility::getfx("seo_lens_pod"),var_03,"tag_origin");
	if(level.nextgen)
	{
		level.var_31D method_83C0("seoul_intro_outside_light");
	}

	wait(10);
	level.var_31D method_83C0("seoul_intro_outside");
}

//Function Number: 187
func_6E0B(param_00)
{
	if(level.currentgen)
	{
		lib_A59A::func_9E65("seoul_pre_space_entry",0.1);
	}

	common_scripts\utility::flag_wait("dialogue_droppod_intro_phase_2b");
	var_01 = level.var_21F6;
	function_00D3("r_lightgridintensity",0);
	param_00.var_4EBB = common_scripts\utility::spawn_tag_origin();
	var_02 = param_00.var_4EBB;
	param_00.var_4EB4 = common_scripts\utility::spawn_tag_origin();
	var_03 = param_00.var_4EB4;
	param_00.var_4EB5 = common_scripts\utility::spawn_tag_origin();
	var_04 = param_00.var_4EB5;
	param_00.var_729D = common_scripts\utility::spawn_tag_origin();
	var_05 = param_00.var_729D;
	wait(0.05);
	param_00.var_4EB3 = common_scripts\utility::spawn_tag_origin();
	var_06 = param_00.var_4EB3;
	param_00.var_2D4C = common_scripts\utility::spawn_tag_origin();
	var_07 = param_00.var_2D4C;
	param_00.var_567F = common_scripts\utility::spawn_tag_origin();
	var_08 = param_00.var_567F;
	param_00.var_5680 = common_scripts\utility::spawn_tag_origin();
	var_09 = param_00.var_5680;
	wait(0.05);
	param_00.var_2D4D = common_scripts\utility::spawn_tag_origin();
	var_0A = param_00.var_2D4D;
	param_00.var_2D4E = common_scripts\utility::spawn_tag_origin();
	var_0B = param_00.var_2D4E;
	var_01.var_7914 = common_scripts\utility::spawn_tag_origin();
	var_0C = var_01.var_7914;
	param_00.var_36C0 = common_scripts\utility::spawn_tag_origin();
	var_0D = param_00.var_36C0;
	param_00.var_237 = common_scripts\utility::spawn_tag_origin();
	var_0E = param_00.var_237;
	wait(0.05);
	param_00.var_729E = common_scripts\utility::spawn_tag_origin();
	var_0F = param_00.var_729E;
	var_06 linkto(param_00,"body_animate_joint",(25,-20,80),(0,0,0),0);
	var_03 linkto(param_00,"body_animate_joint",(-20,-30,53),(30,30,0),0);
	var_04 linkto(param_00,"body_animate_joint",(-20,-30,30),(10,30,0),0);
	var_02 linkto(param_00,"body_animate_joint",(0,0,120),(90,0,0),0);
	var_07 linkto(param_00,"body_animate_joint",(-20,60,20),(0,-20,0),0);
	wait(0.05);
	var_0A linkto(param_00,"body_animate_joint",(30,-5,0),(0,0,0),0);
	var_0B linkto(param_00,"body_animate_joint",(30,12,10),(0,0,0),0);
	var_0D linkto(param_00,"body_animate_joint",(16,-20,30),(0,125,0),0);
	var_0E linkto(param_00,"body_animate_joint",(5,15,20),(0,-90,10),0);
	var_05 linkto(param_00,"body_animate_joint",(-5,-30,25),(30,30,0),0);
	wait(0.05);
	var_0F linkto(param_00,"body_animate_joint",(-25,0,10),(30,30,0),0);
	level notify("pod_lights_on");
	if(level.nextgen)
	{
		thread func_6E11(param_00);
	}
	else
	{
		playfxontag(common_scripts\utility::getfx("light_yellow_spot2"),var_0E,"tag_origin");
		wait(0.5);
		playfxontag(common_scripts\utility::getfx("light_red_point_intro"),var_05,"tag_origin");
		wait(3);
		level.var_31D method_83C0("seoul_intro_outside");
		killfxontag(common_scripts\utility::getfx("light_yellow_spot2"),var_0E,"tag_origin");
		killfxontag(common_scripts\utility::getfx("light_red_point_intro"),var_05,"tag_origin");
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("light_pod_screen"),var_02,"tag_origin");
		wait(4.25);
		killfxontag(common_scripts\utility::getfx("light_pod_screen"),var_02,"tag_origin");
		wait(0.25);
		level.var_31D method_83C0("seoul_intro");
		playfxontag(common_scripts\utility::getfx("light_yellow_spot"),var_03,"tag_origin");
		playfxontag(common_scripts\utility::getfx("pod_emissive_yellow"),var_0D,"tag_origin");
		wait(3);
		killfxontag(common_scripts\utility::getfx("light_yellow_spot"),var_03,"tag_origin");
		killfxontag(common_scripts\utility::getfx("pod_emissive_yellow"),var_0D,"tag_origin");
		level.var_31D method_83C0("seoul_intro_outside");
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("light_pod_screen"),var_02,"tag_origin");
		level waittill("missle_hit");
		level.var_31D method_83C0("seoul_intro");
		wait(0.05);
		killfxontag(common_scripts\utility::getfx("light_pod_screen"),var_02,"tag_origin");
		wait(0.05);
		wait(1.5);
		playfxontag(common_scripts\utility::getfx("pod_blue_bounce_dim"),var_0A,"tag_origin");
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("pod_light_spot_blue_dimmer"),var_07,"tag_origin");
		playfxontag(common_scripts\utility::getfx("pod_godray"),var_07,"tag_origin");
		common_scripts\utility::flag_wait("door_pop");
		lib_A59A::func_9E65("seoul_space_entry_bright",0.5);
		killfxontag(common_scripts\utility::getfx("pod_blue_bounce_dim"),var_0A,"tag_origin");
		killfxontag(common_scripts\utility::getfx("pod_light_spot_blue_dimmer"),var_07,"tag_origin");
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("pod_light_spot_blue"),var_07,"tag_origin");
		wait(0.5);
		killfxontag(common_scripts\utility::getfx("pod_godray"),var_07,"tag_origin");
		playfxontag(common_scripts\utility::getfx("pod_blue_bounce"),var_0B,"tag_origin");
		wait(0.05);
		level.var_31D method_83C0("seoul_intro_bright");
		lib_A59A::func_9E65("seoul_space_entry_bright",0.5);
		wait(1);
		lib_A59A::func_9E65("seoul_space_entry",2);
		level.var_31D method_83C0("seoul_intro");
		wait(3);
		common_scripts\utility::flag_wait("door_shut");
		wait(0.05);
		killfxontag(common_scripts\utility::getfx("pod_blue_bounce"),var_0B,"tag_origin");
		killfxontag(common_scripts\utility::getfx("pod_light_spot_blue"),var_07,"tag_origin");
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("light_red_spot"),var_03,"tag_origin");
		playfxontag(common_scripts\utility::getfx("red_fill"),var_0A,"tag_origin");
		wait(8);
		killfxontag(common_scripts\utility::getfx("light_red_spot"),var_03,"tag_origin");
		killfxontag(common_scripts\utility::getfx("red_fill"),var_0A,"tag_origin");
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("light_green_spot"),var_03,"tag_origin");
		playfxontag(common_scripts\utility::getfx("green_fill"),var_0A,"tag_origin");
		wait(3);
		killfxontag(common_scripts\utility::getfx("light_green_spot"),var_03,"tag_origin");
		killfxontag(common_scripts\utility::getfx("green_fill"),var_0A,"tag_origin");
		level.var_31D method_83C0("seoul_vista");
		wait(3.75);
		level.var_31D method_83C0("seoul_intro_outside_hit");
		function_00D3("r_lightGridDefaultFXLightingLookup",(36129.9,910.88,1819.92));
		function_00D3("r_lightGridDefaultModelLightingLookup",(36129.9,910.88,1819.92));
		wait(0.3);
		level.var_31D method_83C0("seoul_vista");
		level waittill("hit_exit");
		function_00D3("r_lightGridDefaultFXLightingLookup",(36327.9,1157.88,1847.92));
		function_00D3("r_lightGridDefaultModelLightingLookup",(35894,587,1830));
	}

	level waittill("pod_land_apartment");
	thread func_6E00();
	level.var_31D method_83C0("seoul_intro_dark");
	wait(5.5);
	level.var_31D method_83C0("seoul_landing");
	wait(0.25);
	if(level.nextgen)
	{
		lib_A544::func_7EB8("seoul_intro_ceiling_fire_03",12000);
		wait(0.5);
		lib_A544::func_7EB8("seoul_intro_ceiling_fire_02",8000);
	}

	lib_A59A::func_9E65("seoul_space_landing_fog",0.5);
	level waittill("player_drop_pod_door_kick");
	wait(2.8);
	level notify("end_screen_effect");
	killfxontag(common_scripts\utility::getfx("red_fill"),var_0A,"tag_origin");
	wait(0.05);
	common_scripts\_exploder::exploder(7695);
	function_00D3("r_lightgridintensity",1);
	common_scripts\utility::flag_clear("set_seoul_intro_lighting");
	if(level.nextgen)
	{
		lib_A544::func_7EB8("seoul_intro_ceiling_fire_03",0);
		wait(0.5);
		lib_A544::func_7EB8("seoul_intro_ceiling_fire_02",0);
	}

	wait(0.5);
	level.var_31D method_83C0("seoul_vista_01");
	lib_A544::func_6947("firelight_motion_medium","seoul_intro_ceiling_fire_01");
	wait(15);
	level.var_31D method_83C0("seoul_vista");
	level.var_31D method_8490("clut_seoul_vista",0);
	common_scripts\_exploder::kill_exploder(7695);
	wait(9);
}

//Function Number: 188
func_2E81()
{
	level waittill("forever");
	common_scripts\utility::flag_wait("player_in_x4walker");
	var_00 = getent("main_street_reflection","targetname");
	var_01 = getent("main_street_reflection_02","targetname");
	var_02 = getent("drone_reflection_05","targetname");
	foreach(var_04 in level.var_38E5)
	{
		if(isdefined(var_04))
		{
			var_04 method_83AB(var_00.var_2E6);
		}
	}

	foreach(var_04 in level.var_38E5)
	{
		if(isdefined(var_04))
		{
			var_04 method_83AC();
		}
	}
}

//Function Number: 189
func_8138()
{
	if(level.nextgen)
	{
		function_00D3("r_hemiAoEnable",1);
	}
}