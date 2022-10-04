/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 30
 * Decompile Time: 1052 ms
 * Timestamp: 4/20/2022 8:21:01 PM
*******************************************************************/

//Function Number: 1
main()
{
	lib_A59A::func_79C("seoul_intro",::maps\seoul_code_gangnam::func_7D91);
	lib_A59A::func_79C("seoul_first_land_assist",::maps\seoul_code_gangnam::func_7D8E);
	lib_A59A::func_79C("seoul_enemy_encounter_01",::maps\seoul_code_gangnam::func_7D89);
	lib_A59A::func_79C("seoul_missile_evade_sequence",::maps\seoul_code_gangnam::func_7D90);
	lib_A59A::func_79C("seoul_forward_operating_base",::maps\seoul_code_gangnam::func_7D8B);
	lib_A59A::func_79C("seoul_drone_swarm_intro",::maps\seoul_code_gangnam::func_7D88);
	lib_A59A::func_79C("seoul_truck_push",::maps\seoul_code_gangnam::func_7D93);
	lib_A59A::func_79C("seoul_hotel_entrance",::maps\seoul_code_gangnam::func_7D8D);
	lib_A59A::func_79C("seoul_building_jump_sequence",::maps\seoul_code_gangnam::func_7D84);
	lib_A59A::func_79C("seoul_sinkhole_start",::maps\seoul_code_shopping_district::func_26C0);
	lib_A59A::func_79C("seoul_subway_start",::maps\seoul_code_shopping_district::func_26C1);
	lib_A59A::func_79C("seoul_shopping_district_start",::maps\seoul_code_shopping_district::func_26BF);
	lib_A59A::func_79C("seoul_shopping_district_flee_swarm",::maps\seoul_code_shopping_district::func_26BE);
	lib_A59A::func_79C("seoul_canal_intro",::maps\seoul_code_shopping_district::func_26BC);
	lib_A59A::func_79C("seoul_canal_combat_start",::maps\seoul_code_shopping_district::func_26BA);
	lib_A59A::func_79C("seoul_canal_combat_pt2",::maps\seoul_code_shopping_district::func_26BB);
	lib_A59A::func_79C("seoul_finale_scene_start",::maps\seoul_code_shopping_district::func_26BD);
	if(level.currentgen)
	{
		maps\seoul_transients_cg::func_82AD();
		lib_A59A::func_92D0();
	}

	lib_A59A::func_9274("seoul");
	lib_A6FB::main();
	lib_A5CE::main();
	lib_A5CF::main();
	lib_A546::main();
	thread lib_A561::main("assault");
	maps\seoul_anim::func_C7A();
	maps\seoul_lighting::func_5904();
	maps\seoul_aud::main();
	lib_A55C::main();
	lib_A578::main();
	lib_A59D::func_41D4();
	lib_A59D::func_7EF3("tracking_grenade_var","paint_grenade_var");
	maps\seoul_vo::main();
	lib_A5FA::func_E14();
	lib_A5F8::func_2ECB();
	lib_A631::main();
	animscripts\traverse\seoul_zipline::func_57CD();
	lib_A5A3::func_7E95(::func_88DC);
	if(level.currentgen)
	{
		maps\seoul_transients_cg::func_8167();
		maps\seoul_transients_cg::func_7D85();
	}

	precacheturret("heli_spotlight_so_castle");
	precachemodel("weapon_binocular");
	precachemodel("npc_stingerm7_base_black");
	precacheitem("iw5_stingerm7_sp");
	precacheitem("iw5_maaws_sp");
	precacheshellshock("seo_canal_finale_blowback");
	precacheshader("waypoint_ammo");
	precachemodel("npc_titan45_nocamo");
	maps\seoul_code_gangnam::func_3C05();
	maps\seoul_code_drop_pod::func_2F83();
	thread func_45DC();
	thread func_62FF();
	thread func_463F();
	thread func_45FA();
	level.var_31D notifyonplayercommand("dpad_down","+actionslot 2");
	level.var_31D notifyonplayercommand("dpad_left","+actionslot 3");
	level.var_31D notifyonplayercommand("dpad_right","+actionslot 4");
	level.var_31D notifyonplayercommand("dpad_up","+actionslot 1");
	level.var_31D notifyonplayercommand("a_pressed","+gostand");
	level.var_31D notifyonplayercommand("b_pressed","+stance");
	level.var_31D notifyonplayercommand("y_pressed","weapnext");
	level.var_31D notifyonplayercommand("x_pressed","+usereload");
	level.var_31D notifyonplayercommand("attack_pressed","+attack");
	level.var_31D notifyonplayercommand("ads_pressed","+speed_throw");
	level.var_31D notifyonplayercommand("ads_pressed","+toggleads_throw");
	level.var_31D notifyonplayercommand("r3_pressed","+melee");
	level.var_31D notifyonplayercommand("r3_pressed","+melee_zoom");
	level.var_31D notifyonplayercommand("l3_pressed","+sprint");
	level.var_31D notifyonplayercommand("l3_pressed","+sprint_zoom");
	level.var_31D notifyonplayercommand("rb_pressed","+frag");
	thread func_80CD();
	thread func_80CE();
	lib_A59A::func_764("hint_dont_leave_mission",&"SEOUL_DONT_LEAVE_WARNING",::func_844C);
	func_3BF9();
	func_4C68();
	thread func_1E62();
	function_00D3("r_fastModelPrimaryLightLink","1");
	if(level.currentgen)
	{
		function_00D3("r_gunSightColorEntityScale","7");
		function_00D3("r_gunSightColorNoneScale","0.8");
	}

	thread func_7EB3();
}

//Function Number: 2
func_7EB3()
{
	wait(3);
	function_00D3("bg_fallDamageMinHeight",490);
	function_00D3("bg_fallDamageMaxHeight",640);
}

//Function Number: 3
func_30AE()
{
	level.var_21DF lib_A59A::func_30AF();
	level.var_A31B lib_A59A::func_30AF();
	level.var_520E lib_A59A::func_30AF();
	level.var_31D lib_A59A::func_6C1D(80);
}

//Function Number: 4
func_2A8B()
{
	level.var_21DF lib_A59A::func_2A8C();
	level.var_A31B lib_A59A::func_2A8C();
	level.var_520E lib_A59A::func_2A8C();
	level.var_31D func_42F2(80,100,3);
}

//Function Number: 5
func_1E62()
{
	var_00 = getentarray("ai_cleanup_volume_for_jerk_testers","targetname");
	common_scripts\utility::array_thread(var_00,::func_1E61);
}

//Function Number: 6
func_1E61()
{
	var_00 = getent(self.target,"targetname");
	var_00 waittill("trigger");
	var_01 = function_00D6("axis");
	foreach(var_03 in var_01)
	{
		if(isdefined(var_03))
		{
			if(var_03 istouching(self))
			{
				var_03 lib_A56F::func_2800();
			}
		}
	}
}

//Function Number: 7
func_42F2(param_00,param_01,param_02)
{
	var_03 = param_02 * 2;
	var_04 = param_01 - param_00 / var_03;
	for(var_05 = 0;var_05 < var_03;var_05++)
	{
		wait(0.5);
		level.var_31D lib_A59A::func_6C1D(param_00 + var_05 * var_04);
	}

	level.var_31D lib_A59A::func_6C1D(param_01);
}

//Function Number: 8
func_62FF()
{
	common_scripts\utility::flag_wait("objective_start");
	objective_add(lib_A59A::func_62AE("objective_demo_team"),"current",&"SEOUL_OBJECTIVE_DEMO_TEAM");
	objective_onentity(lib_A59A::func_62AE("objective_demo_team"),level.var_21DF,(0,0,0));
	while(!isdefined(level.var_21DF))
	{
		wait(0.05);
	}

	thread maps\seoul_code_gangnam::func_62E4();
	thread maps\seoul_code_gangnam::func_62E3();
	thread maps\seoul_code_gangnam::func_62E5();
	thread maps\seoul_code_gangnam::func_62E6();
	common_scripts\utility::flag_wait("start_sinkhole_objectives");
	objective_onentity(lib_A59A::func_62AE("objective_demo_team"),level.var_21DF);
	common_scripts\utility::flag_wait("objective_sd_followed_cormack_through_sinkhole");
	var_00 = getent("objective_sd_origin_cormack","targetname");
	var_01 = getent("objective_sinkhole_ambush","targetname");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_01.var_2E6);
	function_00BF(lib_A59A::func_62AE("objective_demo_team"),"");
	common_scripts\utility::flag_wait("objective_sd_smoke_ambush_defeated");
	objective_onentity(lib_A59A::func_62AE("objective_demo_team"),level.var_21DF);
	common_scripts\utility::flag_wait("objective_sd_followed_cormack_through_subway");
	var_02 = getent("subway_open_gate","targetname");
	function_00BF(lib_A59A::func_62AE("objective_demo_team"),&"SEOUL_OBJECTIVE_GATE_INT");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_02.var_2E6);
	common_scripts\utility::flag_wait("objective_sd_gate_opened");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),(0,0,0));
	function_00BF(lib_A59A::func_62AE("objective_demo_team"),"");
	common_scripts\utility::flag_wait("objective_start_shopping_district");
	var_03 = getent("objective_sd_origin_intersection1","targetname");
	var_04 = getent("objective_sd_origin_mid","targetname");
	var_05 = getent("objective_sd_origin_intersection2","targetname");
	var_06 = getent("objective_sd_origin_stairs","targetname");
	var_00 = getent("objective_sd_origin_cormack","targetname");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_03.var_2E6);
	common_scripts\utility::flag_wait("objective_sd_mid");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_04.var_2E6);
	common_scripts\utility::flag_wait("objective_sd_intersection2");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_05.var_2E6);
	common_scripts\utility::flag_wait("objective_sd_stairs");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_06.var_2E6);
	common_scripts\utility::flag_wait("objective_sd_street_combat_complete");
	var_07 = getent("objective_sd_origin_cormack","targetname");
	var_08 = getent("objective_sd_origin_stairs_bottom","targetname");
	var_09 = getent("objective_sd_origin_stairs_top","targetname");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_08.var_2E6);
	common_scripts\utility::flag_wait("objective_canal_stairs_bottom_reached");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_09.var_2E6);
	common_scripts\utility::flag_wait("objective_canal_stairs_top_reached");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_07.var_2E6);
	common_scripts\utility::flag_wait("objective_sd_cormack_convo_complete");
	lib_A59A::func_62E9(lib_A59A::func_62AE("objective_demo_team"));
	common_scripts\utility::flag_wait("demo_team_seen");
	var_0A = getent("objective_sd_origin_bombs","targetname");
	objective_add(lib_A59A::func_62AE("objective_bombs"),"current",&"SEOUL_OBJECTIVE_EXPLOSIVES");
	objective_position(lib_A59A::func_62AE("objective_bombs"),var_0A.var_2E6);
	function_00BF(lib_A59A::func_62AE("objective_bombs"),&"SEOUL_OBJECTIVE_EXPLOSIVES_INT");
	common_scripts\utility::flag_wait("bombs_reached");
	function_00BF(lib_A59A::func_62AE("objective_bombs"),&"SEOUL_OBJECTIVE_EXPLOSIVES_INT");
	common_scripts\utility::flag_wait("objective_sd_pick_up_bombs");
	lib_A59A::func_62E9(lib_A59A::func_62AE("objective_bombs"));
	var_0B = getent("objective_sd_origin_bomb","targetname");
	var_0C = getent("objective_sd_origin_bomb_a","targetname");
	function_00D3("objectiveAlphaEnabled",1);
	objective_add(lib_A59A::func_62AE("objective_follow_will"),"current",&"SEOUL_OBJECTIVE_HELP_WILL");
	objective_onentity(lib_A59A::func_62AE("objective_follow_will"),level.var_A31B);
	common_scripts\utility::flag_wait("canal_bomb_plant_trigger_on");
	common_scripts\utility::flag_wait("weapon_platform_reached");
	function_00D3("objectiveAlphaEnabled",0);
	objective_position(lib_A59A::func_62AE("objective_follow_will"),var_0B.var_2E6);
	common_scripts\utility::flag_wait("objective_sd_bomb_planted");
	lib_A59A::func_62E9(lib_A59A::func_62AE("objective_follow_will"));
}

//Function Number: 9
func_88DC()
{
	return lib_A59A::func_88CB("player_rig");
}

//Function Number: 10
func_3BF9()
{
	thread maps\seoul_code_gangnam::func_7D92();
	thread maps\seoul_code_shopping_district::func_841C();
}

//Function Number: 11
func_4C68()
{
	function_00D3("cg_cinematicFullScreen","0");
	function_0059("seo_advertisement_01",1,1);
}

//Function Number: 12
func_80CF()
{
	common_scripts\utility::flag_wait("player_left_squad");
	level notify("mission failed");
	setdvar("ui_deadquote",&"SEOUL_FAIL_LEAVING_SQUAD");
	lib_A59A::func_5CDC();
}

//Function Number: 13
func_844D()
{
	if(common_scripts\utility::flag("player_returning_to_map"))
	{
		return 1;
	}

	if(common_scripts\utility::flag("player_left_squad"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 14
func_80D0()
{
	for(;;)
	{
		common_scripts\utility::flag_wait("player_leaving_squad");
		lib_A59A::func_2B4E("hint_dont_leave_squad",5);
		wait(5);
	}
}

//Function Number: 15
func_80CD()
{
	common_scripts\utility::flag_wait("player_left_map");
	level notify("mission failed");
	setdvar("ui_deadquote",&"SEOUL_DONT_LEAVE_FAIL");
	lib_A59A::func_5CDC();
}

//Function Number: 16
func_80CE()
{
	for(;;)
	{
		common_scripts\utility::flag_wait("player_leaving_map");
		lib_A59A::func_2B4E("hint_dont_leave_mission",5);
		wait(5);
	}
}

//Function Number: 17
func_844C()
{
	if(common_scripts\utility::flag("player_returning_to_map"))
	{
		return 1;
	}

	if(common_scripts\utility::flag("player_left_map"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 18
func_45DC()
{
	level.var_31D lib_A563::func_30C9();
	for(;;)
	{
		var_00 = level.var_31D common_scripts\utility::waittill_any_return("enable_player_boost_jump","disable_player_boost_jump","death");
		if(var_00 == "enable_player_boost_jump")
		{
			level.var_31D lib_A563::func_30C9();
			continue;
		}

		if(var_00 == "disable_player_boost_jump")
		{
			level.var_31D lib_A563::func_2AAB();
		}
	}
}

//Function Number: 19
func_463F()
{
	var_00 = getentarray("generic_clip_pickup","targetname");
	var_01 = getentarray("smart_grenade_pickup","targetname");
	var_02 = getentarray("threat_grenade_pickup","targetname");
	common_scripts\utility::array_thread(var_00,::func_808F);
	common_scripts\utility::array_thread(var_01,::func_829E);
	common_scripts\utility::array_thread(var_02,::func_82BB);
}

//Function Number: 20
func_808F()
{
	level.var_31D endon("death");
	level endon("missionfailed");
	self endon("clip_picked_up");
	for(;;)
	{
		while(issubstr(level.var_31D getcurrentweapon(),"door"))
		{
			wait 0.05;
		}

		if(distance(self.var_2E6,level.var_31D.var_2E6) < 42)
		{
			var_00 = level.var_31D getcurrentweapon();
			var_01 = level.var_31D getcurrentweaponclipammo("right");
			var_02 = level.var_31D getammocount(var_00);
			var_03 = weaponmaxammo(var_00);
			var_04 = weaponclipsize(var_00);
			if(var_03 - var_02 > var_04)
			{
				level.var_31D setweaponammostock(var_00,var_02 + var_04);
			}
			else if(var_03 - var_02 < var_04)
			{
				level.var_31D setweaponammostock(var_00,var_03);
			}
			else
			{
				wait 0.05;
				continue;
			}

			self delete();
			self notify("clip_picked_up");
		}

		wait 0.05;
	}
}

//Function Number: 21
func_829E()
{
	level.var_31D endon("death");
	level endon("missionfailed");
	self endon("nade_picked_up");
	for(;;)
	{
		if(distance(self.var_2E6,level.var_31D.var_2E6) < 42)
		{
			var_00 = level.var_31D getoffhandprimaryclass();
			var_01 = weaponmaxammo(var_00);
			var_02 = level.var_31D getammocount(var_00);
			if(var_02 < var_01)
			{
				level.var_31D setweaponammostock(var_00,var_02 + 1);
				self delete();
				self notify("nade_picked_up");
			}
		}

		wait 0.05;
	}
}

//Function Number: 22
func_82BB()
{
	level.var_31D endon("death");
	level endon("missionfailed");
	self endon("nade_picked_up");
	for(;;)
	{
		if(distance(self.var_2E6,level.var_31D.var_2E6) < 42)
		{
			var_00 = level.var_31D getoffhandsecondaryclass();
			var_01 = weaponmaxammo(var_00);
			var_02 = level.var_31D getammocount(var_00);
			if(var_02 < var_01)
			{
				level.var_31D setweaponammostock(var_00,var_02 + 1);
				self delete();
				self notify("nade_picked_up");
			}
		}

		wait 0.05;
	}
}

//Function Number: 23
func_7D87()
{
	var_00 = getent("gi_art_spawner_gideon","targetname");
	var_01 = getent("gi_art_spawner_mech","targetname");
	var_02 = common_scripts\utility::getstruct("gi_art_struct_anim","targetname");
	var_03 = var_02 common_scripts\utility::spawn_tag_origin();
	var_04 = spawn("script_model",var_03.var_2E6);
	var_04 setmodel("vehicle_walker_tank");
	var_04.animname = "walker_tank";
	var_04 lib_A506::func_7F23();
	var_03 thread lib_A506::func_BC7(var_04,"gi_pose");
	var_05 = var_00 lib_A56F::func_72C(1);
	var_06 = var_01 lib_A56F::func_72C(1);
	var_03 thread lib_A506::func_BCC(var_05,"gi_pose_gideon");
	var_03 thread lib_A506::func_BCC(var_06,"gi_pose_mech");
	var_07 = level.var_31D maps\seoul_code_gangnam::func_3C93(var_03,"gi_pose");
	lib_A59A::func_5686(0.1,50);
	var_08 = level.var_31D common_scripts\utility::waittill_any_return("x_pressed","b_pressed","a_pressed");
	switch(var_08)
	{
		case "x_pressed":
			break;

		case "b_pressed":
			break;

		case "a_pressed":
			break;
	}
}

//Function Number: 24
func_93C9(param_00)
{
	if(!isdefined(param_00.var_93C8))
	{
		param_00.var_93C8 = 1;
		param_00 hide();
		return;
	}

	if(param_00.var_93C8)
	{
		param_00.var_93C8 = 0;
		param_00 show();
		return;
	}

	param_00.var_93C8 = 1;
	param_00 hide();
}

//Function Number: 25
func_93C5(param_00)
{
}

//Function Number: 26
func_45FA()
{
	var_00 = getentarray("vol_no_prone","targetname");
	common_scripts\utility::array_thread(var_00,::func_6109);
}

//Function Number: 27
func_6109()
{
	for(;;)
	{
		while(!level.var_31D istouching(self))
		{
			wait 0.05;
		}

		level.var_31D method_811A(0);
		while(level.var_31D istouching(self))
		{
			wait 0.05;
		}

		level.var_31D method_811A(1);
		wait 0.05;
	}
}

//Function Number: 28
func_1CAD(param_00,param_01,param_02,param_03)
{
	playfx(common_scripts\utility::getfx(param_00),param_01,param_02 - param_01);
}

//Function Number: 29
func_92C5(param_00)
{
	var_01 = "";
	switch(param_00)
	{
		case "east_view":
			break;

		case "intro_building_descend":
			break;

		case "drone_swarm_one":
			break;

		case "fob":
			break;

		case "truck_push_trans":
			break;

		case "mall_offices":
			break;

		case "sinkhole_subway":
			break;

		case "subway_trans":
			break;

		case "shopping_dist":
			break;
	}
}

//Function Number: 30
func_92C3(param_00)
{
	var_01 = func_92C5(param_00);
	if(var_01 == "")
	{
		return;
	}

	level waittill(var_01);
	if(!isdefined(self))
	{
		return;
	}

	if(function_0294(self))
	{
		return;
	}

	if(lib_A59E::func_51FA())
	{
		lib_A5A0::func_5B0();
	}

	self delete();
}