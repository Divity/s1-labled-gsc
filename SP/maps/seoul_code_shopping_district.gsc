/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_code_shopping_district.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 233
 * Decompile Time: 8551 ms
 * Timestamp: 4/20/2022 8:21:41 PM
*******************************************************************/

//Function Number: 1
func_841C()
{
	func_4CEE();
	precacheitem("smoke_grenade_cheap");
	precacheitem("iw5_microdronelaunchersmartgrenade_sp");
	precacheturret("apache_turret");
	precacheshader("ugv_vignette_overlay");
	precachemodel("prop_cigarette");
	precachemodel("electronics_pda");
	precachemodel("lab_tablet_flat_on");
	precachemodel("com_cellphone_on");
	thread func_859A();
	thread func_8FA2();
	thread func_7B68();
	thread func_7B61();
	thread func_7B51();
	thread func_1A99();
	thread func_1A6D();
	thread func_1A79();
	thread func_1A84();
	thread func_1A7A();
	thread func_1A86();
	thread func_1A82();
	thread func_1A80();
	lib_A5FB::func_2185();
	lib_A550::init();
	thread func_6666();
	lib_A59A::func_764("throw_threat_hint",&"SEOUL_THROW_THREAT_HINT",::func_8458);
	lib_A59A::func_746("binoc_controls",&"SEOUL_BINOC_CONTROLS_HINT",::func_1474,&"SEOUL_BINOC_CONTROLS_HINT_PC",&"SEOUL_BINOC_CONTROLS_HINT_SP");
	func_7689();
	var_00 = getentarray("seo_canal_waterfall_model","targetname");
	foreach(var_02 in var_00)
	{
		var_02 setcontents(0);
	}
}

//Function Number: 2
func_7689()
{
	var_00 = [0.2,0.1,"wp_hatch_close"];
	lib_A506::func_807("weapon_platform","seo_finale_wp_hatch_close",::func_7CEC,"finale_plantbomb",var_00);
	var_00 = [2.25,1.5,"first_attempt_to_free"];
	lib_A506::func_807("will_irons","seo_finale_will_first_attempt_to_free",::func_7CED,"finale_pt02",var_00);
	var_00 = [2.25,1.75,"second_attempt_to_free"];
	lib_A506::func_807("will_irons","seo_finale_will_second_attempt",::func_7CED,"finale_pt02",var_00);
	var_00 = [0.1,0.5,"grabs player"];
	lib_A506::func_807("will_irons","seo_finale_will_grabs_player",::func_7CED,"finale_pt02");
	var_00 = [0.1,0.5,"will_pushes_player"];
	lib_A506::func_807("will_irons","seo_finale_will_pushes_player",::func_7CEC,"finale_pt02",var_00);
	lib_A506::func_807("player_rig","seo_finale_player_jump_onto_platform",::func_7CED,"finale_plantbomb");
	var_00 = [0.1,0.5,"player_grab_hatch"];
	lib_A506::func_807("player_rig","seo_finale_player_grab_hatch",::func_7CED,"finale_pt02",var_00);
	lib_A506::func_807("player_rig","seo_finale_player_lands",::func_7CEC,"finale_pt02",0.5);
	lib_A506::func_807("player_rig","seo_finale_player_bounces",::func_7CEC,"finale_pt03",1);
	var_00 = [0.3,1,"player_arm_slice"];
	lib_A506::func_807("player_rig","seo_finale_player_arm_slice",::func_7CEC,"finale_pt03",var_00);
	var_00 = [5,2,"_dragged_away"];
	lib_A506::func_807("player_rig","seo_finale_player_dragged_away",::func_7CED,"finale_pt03",var_00);
	var_00 = [1,1.5,"_dragged_away"];
	lib_A506::func_807("cormack","seo_finale_cormack_grab_metal",::func_7CEC,"finale_pt03");
	var_00 = [4,22,"wp_lift_off"];
	lib_A506::func_807("weapon_platform","seo_finale_wp_lift_off",::func_7CEC,"finale_pt02",var_00);
}

//Function Number: 3
func_4CEE()
{
	common_scripts\utility::flag_init("start_sinkhole_objectives");
	common_scripts\utility::flag_init("objective_sd_followed_cormack_through_sinkhole");
	common_scripts\utility::flag_init("objective_sd_smoke_ambush_defeated");
	common_scripts\utility::flag_init("objective_sd_followed_cormack_through_subway");
	common_scripts\utility::flag_init("objective_sd_gate_opened");
	common_scripts\utility::flag_init("objective_start_shopping_district");
	common_scripts\utility::flag_init("objective_sd_street_combat_complete");
	common_scripts\utility::flag_init("objective_canal_stairs_bottom_reached");
	common_scripts\utility::flag_init("objective_canal_stairs_top_reached");
	common_scripts\utility::flag_init("objective_sd_cormack_convo_complete");
	common_scripts\utility::flag_init("objective_sd_reached_bombsquad");
	common_scripts\utility::flag_init("objective_sd_pick_up_bombs");
	common_scripts\utility::flag_init("objective_sd_bomb_planted");
	common_scripts\utility::flag_init("end_rumble_listener");
	common_scripts\utility::flag_init("first_building_jump_complete");
	common_scripts\utility::flag_init("wakeup_drones");
	common_scripts\utility::flag_init("wakeup_ambush");
	common_scripts\utility::flag_init("swarm_flyby1_ready");
	common_scripts\utility::flag_init("subway_gate_triggered");
	common_scripts\utility::flag_init("swarm_flyby1_go");
	common_scripts\utility::flag_init("canal_strategy_scene_complete");
	common_scripts\utility::flag_init("sd_street_combat_complete");
	common_scripts\utility::flag_init("shut_down_panel");
	common_scripts\utility::flag_init("canal_jump_complete");
	common_scripts\utility::flag_init("bombs_reached");
	common_scripts\utility::flag_init("bombs_picked_up");
	common_scripts\utility::flag_init("drone_control_done");
	common_scripts\utility::flag_init("bomb_plant_start");
	common_scripts\utility::flag_init("threat_grenade_thrown");
	common_scripts\utility::flag_init("wakeup_patrol");
	common_scripts\utility::flag_init("sd_combat_start");
	common_scripts\utility::flag_init("canal_reached_window");
	common_scripts\utility::flag_init("wakeup_drone_guards");
	common_scripts\utility::flag_init("wakeup_canal_patrols");
	common_scripts\utility::flag_init("begin_fight_to_weapon_platform");
	common_scripts\utility::flag_init("start_truck_fall");
	common_scripts\utility::flag_init("demo_team_seen");
	common_scripts\utility::flag_init("drone_swarm_launched");
	common_scripts\utility::flag_init("canal_start_drone_travel");
	common_scripts\utility::flag_init("spawn_canal_razorback");
	common_scripts\utility::flag_init("canal_razorback_attacked");
	common_scripts\utility::flag_init("start_weapon_platform_firing");
	common_scripts\utility::flag_init("prep_will_for_finale");
	common_scripts\utility::flag_init("weapon_platform_firing");
	common_scripts\utility::flag_init("show_canal_weapon_platform");
	common_scripts\utility::flag_init("canal_razorback_fire_at_swarm");
	common_scripts\utility::flag_init("cleanup_finale_explosive");
	common_scripts\utility::flag_init("canal_swarm_attacking_player");
	common_scripts\utility::flag_init("middle_weapon_guards_dead");
	common_scripts\utility::flag_init("_stealth_spotted");
	common_scripts\utility::flag_init("drones_investigating");
	common_scripts\utility::flag_init("player_starting_sinkhole");
}

//Function Number: 4
func_26C0()
{
	thread maps\seoul_lighting::func_65BE();
	lib_A5DE::snd_message("start_seoul_sinkhole_start");
	func_2680();
	var_00 = common_scripts\utility::getstruct("struct_start_point_sinkhole_start","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_start_point_sinkhole_start_1","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D lib_A563::func_30C9();
	level.var_31D method_83C0("seoul_building_jump");
	level.var_31D method_8490("seoul",0);
	lib_A59A::func_9E65("seoul_building_jump",0);
	common_scripts\utility::flag_set("set_seoul_jump_lighting");
	level.var_A31B method_81C6(var_01[0].var_2E6,var_01[0].var_41);
	level.var_21DF method_81C6(var_01[1].var_2E6,var_01[1].var_41);
	level.var_520E method_81C6(var_01[2].var_2E6,var_01[2].var_41);
	var_02 = getnode("cover_sinkhole_window","targetname");
	var_03 = getnode("cover_sinkhole_jumpdown1","targetname");
	var_04 = getnode("cover_sinkhole_jumpdown2","targetname");
	level.var_A31B lib_A59A::func_7E48(15);
	level.var_A31B lib_A59A::func_7E45(var_02);
	level.var_21DF lib_A59A::func_7E48(15);
	level.var_21DF lib_A59A::func_7E45(var_03);
	level.var_520E lib_A59A::func_7E48(15);
	level.var_520E lib_A59A::func_7E45(var_04);
	var_05 = getent("trig_start_sinkhole_section","targetname");
	common_scripts\utility::flag_set("first_building_jump_complete");
	common_scripts\utility::flag_set("objective_start");
	common_scripts\utility::flag_set("start_sinkhole_objectives");
	common_scripts\utility::flag_set("objective_sd_street_combat_complete");
	var_05 notify("trigger");
}

//Function Number: 5
func_26C1()
{
	thread maps\seoul_lighting::func_65BE();
	lib_A5DE::snd_message("start_seoul_subway_start");
	thread maps\seoul_lighting::func_571A();
	var_00 = getent("so_player_start_subway1","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D lib_A563::func_30C9();
	func_2680();
	var_01 = common_scripts\utility::getstruct("struct_will_start_subway1","targetname");
	level.var_A31B method_81C6(var_01.var_2E6,var_01.var_41);
	var_02 = common_scripts\utility::getstruct("node_cormack_start_subway1","targetname");
	level.var_21DF method_81C6(var_02.var_2E6,var_02.var_41);
	var_03 = common_scripts\utility::getstruct("struct_other_guy_start_subway1","targetname");
	level.var_520E method_81C6(var_03.var_2E6,var_03.var_41);
	common_scripts\utility::flag_set("objective_start");
	common_scripts\utility::flag_set("start_sinkhole_objectives");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_sinkhole");
	common_scripts\utility::flag_set("objective_sd_smoke_ambush_defeated");
	common_scripts\utility::flag_set("set_seoul_subway_start_lighting");
	var_04 = getent("trig_start_subway_section","targetname");
	var_04 notify("trigger");
}

//Function Number: 6
func_26BF()
{
	if(level.currentgen)
	{
		level waittill("transients_subway_to_shopping_dist");
	}

	thread maps\seoul_lighting::func_65BE();
	lib_A5DE::snd_message("start_seoul_shopping_district_start");
	level.var_31D method_83C0("seoul_subway");
	level.var_31D method_8490("clut_seoul_shopping",0);
	lib_A59A::func_9E65("seoul_shopping",0);
	common_scripts\utility::flag_set("set_seoul_shopping_district_start_lighting");
	var_00 = getent("so_player_start_shopping_district1","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D lib_A563::func_30C9();
	func_2680();
	var_01 = common_scripts\utility::getstruct("struct_will_start_shopping_district1","targetname");
	level.var_A31B method_81C6(var_01.var_2E6,var_01.var_41);
	var_02 = common_scripts\utility::getstruct("struct_cormack_start_shopping_district1","targetname");
	level.var_21DF method_81C6(var_02.var_2E6,var_02.var_41);
	var_03 = common_scripts\utility::getstruct("struct_other_guy_start_shopping_district1","targetname");
	level.var_520E method_81C6(var_03.var_2E6,var_03.var_41);
	wait(1);
	common_scripts\utility::flag_set("objective_start");
	common_scripts\utility::flag_set("start_sinkhole_objectives");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_sinkhole");
	common_scripts\utility::flag_set("objective_sd_smoke_ambush_defeated");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_subway");
	common_scripts\utility::flag_set("objective_sd_gate_opened");
	common_scripts\utility::flag_set("objective_start_shopping_district");
}

//Function Number: 7
func_26BE()
{
	thread maps\seoul_lighting::func_65BE();
	lib_A5DE::snd_message("start_seoul_shopping_district_flee_swarm");
	common_scripts\utility::flag_set("set_seoul_shopping_district_start_lighting");
	thread lib_A59A::func_383E("sd_start_shopping_district",5);
	var_00 = getent("so_player_start_flee_swarm1","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D lib_A563::func_30C9();
	func_2680();
	var_01 = common_scripts\utility::getstruct("struct_will_start_flee_swarm1","targetname");
	level.var_A31B method_81C6(var_01.var_2E6,var_01.var_41);
	var_02 = common_scripts\utility::getstruct("struct_cormack_start_flee_swarm1","targetname");
	level.var_21DF method_81C6(var_02.var_2E6,var_02.var_41);
	var_03 = common_scripts\utility::getstruct("struct_other_guy_start_flee_swarm1","targetname");
	level.var_520E method_81C6(var_03.var_2E6,var_03.var_41);
	wait(1);
	common_scripts\utility::flag_set("objective_start");
	common_scripts\utility::flag_set("start_sinkhole_objectives");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_sinkhole");
	common_scripts\utility::flag_set("objective_sd_smoke_ambush_defeated");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_subway");
	common_scripts\utility::flag_set("objective_sd_gate_opened");
	common_scripts\utility::flag_set("objective_start_shopping_district");
	common_scripts\utility::flag_set("objective_sd_mid");
	common_scripts\utility::flag_set("objective_sd_intersection2");
	common_scripts\utility::flag_set("objective_sd_stairs");
	common_scripts\utility::flag_set("objective_sd_street_combat_complete");
	thread func_1AAA();
	common_scripts\utility::flag_set("start_weapon_platform_firing");
}

//Function Number: 8
func_26BC()
{
	lib_A5DE::snd_message("start_seoul_canal_intro");
	thread maps\seoul_lighting::func_65BE();
	level.var_31D lib_A563::func_30C9();
	level.var_31D method_83C0("seoul_canal");
	level.var_31D method_8490("clut_seoul_canal",0);
	lib_A59A::func_9E65("seoul_canal_entrance",0);
	common_scripts\utility::flag_set("set_seoul_canal_start_lighting");
	var_00 = getent("node_player_start_shopping_district2","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D lib_A563::func_30C9();
	func_2680();
	var_01 = common_scripts\utility::getstruct("struct_will_start_shopping_district2","targetname");
	level.var_A31B method_81C6(var_01.var_2E6,var_01.var_41);
	var_02 = getnode("canal_cover_left_door1","targetname");
	level.var_A31B lib_A59A::func_7E45(var_02);
	var_03 = common_scripts\utility::getstruct("struct_cormack_start_shopping_district2","targetname");
	level.var_21DF method_81C6(var_03.var_2E6,var_03.var_41);
	var_04 = getnode("canal_cover_right_door1","targetname");
	level.var_21DF lib_A59A::func_7E45(var_04);
	var_05 = common_scripts\utility::getstruct("struct_other_guy_start_shopping_district2","targetname");
	level.var_520E method_81C6(var_05.var_2E6,var_05.var_41);
	var_06 = getnode("canal_cover_crouch_door1","targetname");
	level.var_520E lib_A59A::func_7E45(var_06);
	common_scripts\utility::flag_set("sd_street_combat_complete");
	common_scripts\utility::flag_set("sd_escaped_swarm");
	common_scripts\utility::flag_set("show_canal_weapon_platform");
	common_scripts\utility::flag_set("objective_start");
	common_scripts\utility::flag_set("start_sinkhole_objectives");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_sinkhole");
	common_scripts\utility::flag_set("objective_sd_smoke_ambush_defeated");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_subway");
	common_scripts\utility::flag_set("objective_sd_gate_opened");
	common_scripts\utility::flag_set("objective_start_shopping_district");
	common_scripts\utility::flag_set("objective_sd_mid");
	common_scripts\utility::flag_set("objective_sd_intersection2");
	common_scripts\utility::flag_set("objective_sd_stairs");
	common_scripts\utility::flag_set("objective_sd_street_combat_complete");
	common_scripts\utility::flag_set("objective_canal_stairs_bottom_reached");
	common_scripts\utility::flag_set("objective_canal_stairs_top_reached");
	common_scripts\utility::flag_set("objective_sd_cormack_convo_complete");
	var_07 = getent("canal_trig_allies_cover1","targetname");
	var_07 notify("trigger");
	if(level.nextgen)
	{
		level.var_8696 = lib_A5FA::func_894A("sd_drone_queen1",undefined);
	}
	else
	{
		level.var_8696 = lib_A5FA::func_894A("sd_drone_queen1",undefined,8,5,undefined);
	}

	level.var_8696 thread func_1A75();
	thread func_1AAA();
	common_scripts\utility::flag_set("start_weapon_platform_firing");
}

//Function Number: 9
func_26BA()
{
	lib_A5DE::snd_message("start_seoul_canal_combat_start");
	thread maps\seoul_lighting::func_65BE();
	level.var_31D method_83C0("seoul_canal");
	level.var_31D method_8490("clut_seoul_canal",0);
	lib_A59A::func_9E65("seoul_canal_entrance",0);
	common_scripts\utility::flag_set("set_seoul_canal_start_lighting");
	var_00 = getent("node_player_start_shopping_district2","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D lib_A563::func_30C9();
	func_2680();
	var_01 = common_scripts\utility::getstruct("struct_will_start_shopping_district2","targetname");
	level.var_A31B method_81C6(var_01.var_2E6,var_01.var_41);
	var_02 = common_scripts\utility::getstruct("struct_cormack_start_shopping_district2","targetname");
	level.var_21DF method_81C6(var_02.var_2E6,var_02.var_41);
	var_03 = common_scripts\utility::getstruct("struct_other_guy_start_shopping_district2","targetname");
	level.var_520E method_81C6(var_03.var_2E6,var_03.var_41);
	common_scripts\utility::flag_set("sd_street_combat_complete");
	common_scripts\utility::flag_set("canal_strategy_scene_complete");
	common_scripts\utility::flag_set("enable_drone_control_pickup");
	common_scripts\utility::flag_set("shut_down_panel");
	common_scripts\utility::flag_set("show_canal_weapon_platform");
	common_scripts\utility::flag_set("objective_start");
	common_scripts\utility::flag_set("start_sinkhole_objectives");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_sinkhole");
	common_scripts\utility::flag_set("objective_sd_smoke_ambush_defeated");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_subway");
	common_scripts\utility::flag_set("objective_sd_gate_opened");
	common_scripts\utility::flag_set("objective_start_shopping_district");
	common_scripts\utility::flag_set("objective_sd_mid");
	common_scripts\utility::flag_set("objective_sd_intersection2");
	common_scripts\utility::flag_set("objective_sd_stairs");
	common_scripts\utility::flag_set("objective_sd_street_combat_complete");
	common_scripts\utility::flag_set("objective_canal_stairs_bottom_reached");
	common_scripts\utility::flag_set("objective_canal_stairs_top_reached");
	common_scripts\utility::flag_set("objective_sd_cormack_convo_complete");
	common_scripts\utility::flag_set("demo_team_seen");
	level.var_31D lib_A571::func_825E();
	lib_A561::func_6AFB();
	if(level.nextgen)
	{
		level.var_8696 = lib_A5FA::func_894A("sd_drone_queen1",undefined);
	}
	else
	{
		level.var_8696 = lib_A5FA::func_894A("sd_drone_queen1",undefined,8,6,undefined);
	}

	level.var_8696 thread func_1A75();
	thread func_1AAA();
	common_scripts\utility::flag_set("start_weapon_platform_firing");
	level.var_A31B.ignoreall = 0;
	level.var_21DF.ignoreall = 0;
	level.var_520E.ignoreall = 0;
}

//Function Number: 10
func_26BB()
{
	lib_A5DE::snd_message("start_seoul_canal_combat_start");
	thread maps\seoul_lighting::func_65BE();
	level.var_31D method_83C0("seoul_canal");
	level.var_31D method_8490("clut_seoul_canal",0);
	lib_A59A::func_9E65("seoul_canal_entrance",0);
	common_scripts\utility::flag_set("set_seoul_canal_start_lighting");
	var_00 = getent("node_player_start_canal_part2","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D lib_A563::func_30C9();
	func_2680();
	var_01 = common_scripts\utility::getstruct("struct_will_start_canal_part2","targetname");
	level.var_A31B method_81C6(var_01.var_2E6,var_01.var_41);
	var_02 = common_scripts\utility::getstruct("struct_cormack_start_shopping_district2","targetname");
	level.var_21DF method_81C6(var_02.var_2E6,var_02.var_41);
	var_03 = common_scripts\utility::getstruct("struct_other_guy_start_shopping_district2","targetname");
	level.var_520E method_81C6(var_03.var_2E6,var_03.var_41);
	thread func_1AA8();
	thread func_1AAA();
	common_scripts\utility::flag_set("canal_strategy_scene_complete");
	common_scripts\utility::flag_set("enable_drone_control_pickup");
	common_scripts\utility::flag_set("bombs_picked_up");
	common_scripts\utility::flag_set("show_canal_weapon_platform");
	common_scripts\utility::flag_set("objective_start");
	common_scripts\utility::flag_set("start_sinkhole_objectives");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_sinkhole");
	common_scripts\utility::flag_set("objective_sd_smoke_ambush_defeated");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_subway");
	common_scripts\utility::flag_set("objective_sd_gate_opened");
	common_scripts\utility::flag_set("objective_start_shopping_district");
	common_scripts\utility::flag_set("objective_sd_mid");
	common_scripts\utility::flag_set("objective_sd_intersection2");
	common_scripts\utility::flag_set("objective_sd_stairs");
	common_scripts\utility::flag_set("objective_sd_street_combat_complete");
	common_scripts\utility::flag_set("objective_canal_stairs_bottom_reached");
	common_scripts\utility::flag_set("objective_canal_stairs_top_reached");
	common_scripts\utility::flag_set("objective_sd_cormack_convo_complete");
	common_scripts\utility::flag_set("demo_team_seen");
	common_scripts\utility::flag_set("objective_sd_pick_up_bombs");
	level.var_31D lib_A571::func_825E(1);
	lib_A561::func_6AFB();
	if(level.nextgen)
	{
		level.var_8696 = lib_A5FA::func_894A("sd_drone_queen1",undefined);
	}
	else
	{
		level.var_8696 = lib_A5FA::func_894A("sd_drone_queen1",undefined,8,6,undefined);
	}

	level.var_8696 thread func_1A75();
	common_scripts\utility::flag_set("start_weapon_platform_firing");
}

//Function Number: 11
func_26BD()
{
	lib_A5DE::snd_message("start_seoul_finale_scene_start");
	thread maps\seoul_lighting::func_65BE();
	thread maps\seoul_lighting::func_1AAC();
	level.var_31D method_83C0("seoul_canal");
	level.var_31D method_8490("clut_seoul_canal",0);
	lib_A59A::func_9E65("seoul_canal_entrance",0);
	common_scripts\utility::flag_set("set_seoul_canal_start_lighting");
	var_00 = common_scripts\utility::getstruct("struct_start_finale_player","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D lib_A563::func_30C9();
	func_2680();
	var_01 = common_scripts\utility::getstruct("struct_start_finale_will","targetname");
	level.var_A31B method_81C6(var_01.var_2E6,var_01.var_41);
	var_02 = common_scripts\utility::getstruct("struct_start_canal2_cormack","targetname");
	level.var_21DF method_81C6(var_02.var_2E6,var_02.var_41);
	var_03 = common_scripts\utility::getstruct("struct_start_canal2_jackson","targetname");
	level.var_520E method_81C6(var_03.var_2E6,var_03.var_41);
	common_scripts\utility::flag_set("objective_sd_bomb_planted");
	common_scripts\utility::flag_set("prep_will_for_finale");
	common_scripts\utility::flag_set("show_canal_weapon_platform");
	var_04 = getent("trig_canal_near_platform","targetname");
	var_04 notify("trigger");
	level.var_A2C5 = getent("canal_weapon_platform","targetname");
	level.var_A2C5.animname = "weapon_platform";
	level.var_A2C5 lib_A506::func_7F23();
}

//Function Number: 12
func_2680()
{
	if(!isdefined(level.var_A31B))
	{
		var_00 = getent("hero_will_irons_spawner","targetname");
		level.var_A31B = var_00 lib_A56F::func_72C();
	}

	level.var_A31B notify("stop_going_to_node");
	level.var_A31B.target = undefined;
	level.var_A31B.var_7.var_2B1F = 1;
	level.var_A31B.var_98 = 1;
	if(!isdefined(level.var_A31B.var_58D4) || !level.var_A31B.var_58D4)
	{
		level.var_A31B thread lib_A59A::func_27F1();
	}

	level.var_A31B lib_A59A::func_7E32("o");
	level.var_A31B.animname = "will_irons";
	if(!isdefined(level.var_21DF))
	{
		var_01 = getent("hero_cormack_spawner","targetname");
		wait(0.05);
		level.var_21DF = var_01 lib_A56F::func_72C();
	}

	level.var_21DF notify("stop_going_to_node");
	level.var_21DF.target = undefined;
	level.var_21DF.var_7.var_2B1F = 1;
	if(!isdefined(level.var_21DF.var_58D4) || !level.var_21DF.var_58D4)
	{
		level.var_21DF thread lib_A59A::func_27F1();
	}

	level.var_21DF lib_A59A::func_7E32("r");
	level.var_21DF.animname = "cormack";
	level.var_21DF.var_98 = 1;
	if(!isdefined(level.var_520E))
	{
		var_00 = getent("hero_guy_spawner","targetname");
		level.var_520E = var_00 lib_A56F::func_72C();
	}

	level.var_520E notify("stop_going_to_node");
	level.var_520E.target = undefined;
	level.var_520E.var_7.var_2B1F = 1;
	if(!isdefined(level.var_520E.var_58D4) || !level.var_520E.var_58D4)
	{
		level.var_520E thread lib_A59A::func_27F1();
	}

	level.var_520E lib_A59A::func_7E32("y");
	level.var_520E sentient_setthreatbiasgroup("allies");
	level.var_520E.animname = "jackson";
	level.var_520E.var_98 = 1;
}

//Function Number: 13
func_841D()
{
	common_scripts\utility::flag_wait("start_sinkhole_objectives");
	objective_add(lib_A59A::func_62AE("objective_demo_team"),"current",&"SEOUL_OBJECTIVE_DEMO_TEAM");
	objective_onentity(lib_A59A::func_62AE("objective_demo_team"),level.var_21DF);
	common_scripts\utility::flag_wait("objective_sd_followed_cormack_through_sinkhole");
	var_00 = getent("objective_sd_origin_cormack","targetname");
	var_01 = getent("objective_sinkhole_ambush","targetname");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),var_01.var_2E6);
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
	function_00BF(lib_A59A::func_62AE("objective_bombs")," ");
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
	lib_A59A::func_62E9(lib_A59A::func_62AE("objective_follow_will"));
	function_00D3("objectiveAlphaEnabled",0);
	objective_add(lib_A59A::func_62AE("objective_plant_explosives"),"current",&"SEOUL_OBJECTIVE_USE_EXPLOSIVES");
	objective_position(lib_A59A::func_62AE("objective_plant_explosives"),var_0B.var_2E6);
	common_scripts\utility::flag_wait("objective_sd_bomb_planted");
	lib_A59A::func_62E9(lib_A59A::func_62AE("objective_plant_explosives"));
}

//Function Number: 14
func_859A()
{
	thread maps\seoul_code_gangnam::func_4642();
	thread func_858F();
	thread maps\seoul_code_gangnam::func_4609();
	thread func_460A();
	thread func_859F();
	thread func_85A5();
	thread func_859C();
	thread func_85A4();
	thread func_8596();
	thread func_8568();
	common_scripts\utility::flag_wait("first_building_jump_complete");
	common_scripts\utility::flag_set("start_sinkhole_objectives");
	if(!isdefined(level.var_21DF.var_79E1))
	{
		level.var_21DF lib_A59A::func_7E32("r");
	}

	if(!isdefined(level.var_A31B.var_79E1))
	{
		level.var_A31B lib_A59A::func_7E32("o");
	}

	if(!isdefined(level.var_520E.var_79E1))
	{
		level.var_520E lib_A59A::func_7E32("y");
	}

	level.var_A31B.var_98 = 1;
	level.var_21DF.var_98 = 1;
	level.var_520E.var_98 = 1;
	lib_A56F::func_A0B9("trig_sinkhole_ai_move_to_jump1");
	var_00 = common_scripts\utility::getstructarray("struct_start_point_sinkhole_start_1","targetname");
	func_A1AE();
	level.var_A31B.ignoreall = 1;
	level.var_520E.ignoreall = 1;
	level.var_21DF.ignoreall = 1;
	var_01 = getnode("cover_sinkhole_window","targetname");
	var_02 = getnode("cover_sinkhole_jumpdown1","targetname");
	var_03 = getnode("cover_sinkhole_jumpdown2","targetname");
	level.var_A31B lib_A59A::func_7E48(15);
	level.var_A31B lib_A59A::func_7E45(var_01);
	level.var_21DF lib_A59A::func_7E48(15);
	level.var_21DF lib_A59A::func_7E45(var_02);
	level.var_520E lib_A59A::func_7E48(15);
	level.var_520E lib_A59A::func_7E45(var_03);
	lib_A56F::func_A0B9("sinkhole_trig_allies_jump1");
	common_scripts\utility::flag_set("vo_sinkhole_view");
	lib_A59A::func_1143();
}

//Function Number: 15
func_85A5()
{
	lib_A56F::func_A0B9("trig_sinkhole_launcher_vo");
	common_scripts\utility::flag_set("vo_will_wep_nineoclock");
	level.var_21DF method_81A3(1);
	level.var_31D.var_84D9 = 0;
	common_scripts\utility::flag_wait("vo_havoc_launcher_done");
	wait(1);
	lib_A59A::func_70A("sinkhole_trig_allies_jump1");
	level.var_31D.var_84D9 = 1;
	wait(10);
	level.var_21DF method_81A3(0);
}

//Function Number: 16
func_460A()
{
	lib_A56F::func_A0B9("trig_sinkhole_1st_drop");
	common_scripts\utility::flag_set("video_log_playing");
	common_scripts\utility::flag_wait("vo_havoc_launcher_done");
	wait(1);
	common_scripts\utility::flag_set("dialogue_performing_arts_entrance_2");
	maps\seoul_code_gangnam::func_6F0A("seoul_videolog");
	maps\seoul_code_gangnam::func_69B3();
	wait(1);
	maps\seoul::func_4C68();
	lib_A59A::func_70A("trig_videolog_over_sinkhole");
}

//Function Number: 17
func_859F()
{
	lib_A56F::func_A0B9("trig_sinkhole_subway_car_vo");
	common_scripts\utility::flag_set("vo_subway_car_start");
}

//Function Number: 18
func_A1AE()
{
	if(!isdefined(level.var_21DF.var_1884))
	{
		level.var_21DF func_6F15();
		level.var_21DF func_924A("jump_cormack_moveto");
	}
	else
	{
		level.var_21DF thread func_8A52();
	}

	if(!isdefined(level.var_A31B.var_1884))
	{
		level.var_A31B func_6F15();
		level.var_A31B func_924A("jump_will_irons_moveto");
	}
	else
	{
		level.var_A31B thread func_8A52();
	}

	common_scripts\utility::flag_set("player_starting_sinkhole");
}

//Function Number: 19
func_8A52()
{
	lib_A59A::func_7E7B(1.75);
	while(!isdefined(self.var_1883))
	{
		wait 0.05;
	}

	lib_A59A::func_7E7B(1);
}

//Function Number: 20
func_924A(param_00)
{
	var_01 = common_scripts\utility::getstruct(param_00,"targetname");
	self method_81C6(var_01.var_2E6,var_01.var_41);
}

//Function Number: 21
func_6F15()
{
	self notify("goal");
	self notify("new_anim_reach");
	self notify("warping");
	lib_A56F::func_C3C();
}

//Function Number: 22
func_858F()
{
	lib_A56F::func_A0B9("trigger_sinkhole_enemy_setup");
	wait(randomfloat(1.5));
	var_00 = getentarray("sinkhole_drones_intro","script_noteworthy");
	lib_A59A::func_D0B(var_00,::func_7B4F);
	level.var_8590 = lib_A59A::func_D08(var_00);
	lib_A5DE::snd_message("sinkhole_drones_start",level.var_8590);
	common_scripts\utility::flag_set("vo_sinkhole_first_drones");
}

//Function Number: 23
func_8592()
{
	lib_A56F::func_A0B9("trigger_sinkhole_drones_01");
	var_00 = getentarray("sinkhole_drones_01","script_noteworthy");
	var_01 = lib_A59A::func_D0E("sinkhole_drones_01");
	lib_A59A::func_CFD(level.var_8590);
	level.var_8590 = lib_A59A::func_CF2(level.var_8590,var_01);
	foreach(var_03 in var_01)
	{
		var_03.health = 50;
		var_03.target = undefined;
		var_03 setcandamage(1);
		var_03 sentient_makeentitysentient(var_03.var_7AE9);
		var_03 thread lib_A5CE::func_2EC4(var_03);
	}

	wait(1);
	foreach(var_03 in var_01)
	{
		var_03 lib_A59A::func_9CAB();
		var_03 thread lib_A62B::func_3926();
	}
}

//Function Number: 24
func_8596()
{
	common_scripts\utility::flag_wait("sinkhole_jet_flyby");
	var_00 = getentarray("shrike_flyby_spawner","targetname");
	foreach(var_02 in var_00)
	{
		var_02 lib_A59E::func_8971();
	}

	wait(2.1);
	common_scripts\utility::flag_set("start_truck_fall");
}

//Function Number: 25
func_8591()
{
	createthreatbiasgroup("civ_victims");
	createthreatbiasgroup("drones_attacking_civs");
	lib_A56F::func_A0B9("trigger_sinkhole_drones_attack_civs");
	level.var_1D85 = [];
	var_00 = lib_A59A::func_8957("civ_sinkhole_victim1");
	var_01 = lib_A59A::func_8957("civ_sinkhole_victim2");
	var_00.inliveplayerkillstreak = "allies";
	var_01.inliveplayerkillstreak = "allies";
	level.var_1D85[level.var_1D85.size] = var_00;
	level.var_1D85[level.var_1D85.size] = var_01;
	wait(0.5);
	var_02 = lib_A59E::func_8972("civ_sinkhole_attack_drone1");
	var_03 = lib_A59E::func_8972("civ_sinkhole_attack_drone2");
	var_02.health = 50;
	var_03.health = 50;
	var_02 thread lib_A5CE::func_2EC4(var_02);
	var_03 thread lib_A5CE::func_2EC4(var_03);
	var_02 thread lib_A62B::func_3926();
	var_03 thread lib_A62B::func_3926();
	var_02.favoriteenemy = var_00;
	var_03.favoriteenemy = var_01;
	while(level.var_1D85.size > 0)
	{
		level.var_1D85 = lib_A59A::func_CFF(level.var_1D85);
		wait(0.05);
	}

	if(isalive(var_02))
	{
		var_02 thread func_7B4F();
	}

	if(isalive(var_03))
	{
		var_03 thread func_7B4F();
	}
}

//Function Number: 26
func_858D()
{
	self sentient_setthreatbiasgroup("civ_victims");
	self.inliveplayerkillstreak = "allies";
}

//Function Number: 27
func_859E()
{
}

//Function Number: 28
func_8593()
{
	lib_A56F::func_A0B9("trig_sinkhole_drones_group4");
	var_00 = getent("sinkhole_drones_group4","script_noteworthy");
	lib_A59A::func_D0B(var_00,::func_7B4F);
	lib_A59A::func_CFD(level.var_8590);
	level.var_8590 = lib_A59A::func_CF2(level.var_8590,var_00);
}

//Function Number: 29
func_8599(param_00,param_01,param_02,param_03)
{
	param_00 = param_00 * randomfloatrange(0.1,0.135);
	var_04 = undefined;
	if(isdefined(param_02) && isdefined(self.targetname) & !issubstr(self.targetname,param_03))
	{
		param_02 = sortbydistance(param_02,self.var_2E6);
		var_04 = param_02[0];
	}

	wait(param_00);
	var_05 = 6;
	var_06 = 100;
	var_07 = 100;
	var_08 = 1200;
	var_09 = self.var_2E6 - (0,0,var_08);
	var_0A = self.var_2E6[2];
	var_0B = vectortoangles((param_01.var_2E6[0],param_01.var_2E6[1],var_0A) - self.var_2E6);
	var_0C = self.var_2E6 + anglestoforward(var_0B) * 200;
	while(isdefined(level.var_31D.var_6C29) && distance(level.var_31D.var_6C29.var_2E6,self.var_2E6) < 200)
	{
		wait(0.05);
	}

	var_0D = gettime() * 0.001;
	if(isdefined(var_04))
	{
		var_04 thread lib_A59A::delaythread(0.1,::lib_A56F::func_2800);
	}

	while(gettime() * 0.001 <= var_0D + var_05)
	{
		var_0E = self.var_2E6 + lib_A56F::func_43CD(var_0D,var_09,var_07);
		var_0F = (0,vectortoangles(param_01.var_2E6 - var_0E)[1],0);
		var_10 = 3;
		var_11 = (var_10,var_0F[1],0);
		var_12 = transformmove(var_0E,var_11,var_0E,var_0F,var_0E,self.var_41);
		self.var_2E6 = var_12["origin"];
		self.var_41 = var_12["angles"];
		wait(0.05);
	}
}

//Function Number: 30
func_8595(param_00,param_01)
{
	param_00 = sortbydistance(param_00,param_01.var_2E6);
	foreach(var_04, var_03 in param_00)
	{
		var_03 thread func_8597(var_04,param_01);
	}
}

//Function Number: 31
func_8598(param_00,param_01)
{
	wait(param_00 * 0.005);
	var_02 = randomintrange(3,5);
	var_03 = param_00 + 1;
	if(common_scripts\utility::cointoss())
	{
		for(var_04 = 0;var_04 < var_02;var_04++)
		{
			if(distance(level.var_31D.var_6C29.var_2E6,self.var_2E6) < 300)
			{
				return;
			}

			var_05 = (0,vectortoangles(param_01.var_2E6 - self.var_2E6)[1],0);
			var_06 = 1;
			var_07 = (var_06,var_05[1],0);
			var_08 = transformmove(self.var_2E6,var_07,self.var_2E6,var_05,self.var_2E6,self.var_41);
			var_09 = max(64 - var_03 / 3,randomint(10)) * -1;
			var_0A = (var_08["origin"][0],var_08["origin"][1],var_08["origin"][2] + var_09);
			var_0B = randomfloatrange(-2,2);
			var_0C = randomfloatrange(-2,2);
			var_0D = randomfloatrange(-2,2);
			if(common_scripts\utility::cointoss())
			{
				var_0D = randomfloatrange(-8,8);
			}

			thread lib_A56F::func_56A8(var_0A,140);
			self.var_41 = var_08["angles"] + (var_0B,var_0C,var_0D);
			wait(0.05);
		}
	}
}

//Function Number: 32
func_8597(param_00,param_01)
{
	wait(param_00 * 0.01);
	var_02 = randomintrange(3,5);
	var_03 = param_00 + 1;
	if(common_scripts\utility::cointoss())
	{
		for(var_04 = 0;var_04 < var_02;var_04++)
		{
			if(distance(level.var_31D.var_2E6,self.var_2E6) < 20)
			{
				return;
			}

			var_05 = (0,vectortoangles(param_01.var_2E6 - self.var_2E6)[1],0);
			var_06 = 0.5;
			var_07 = (var_06,var_05[1],0);
			var_08 = transformmove(self.var_2E6,var_07,self.var_2E6,var_05,self.var_2E6,self.var_41);
			var_09 = (var_08["origin"][0],var_08["origin"][1],var_08["origin"][2]);
			var_0A = randomfloatrange(-0.75,0.75);
			var_0B = randomfloatrange(-0.75,0.75);
			var_0C = randomfloatrange(-0.75,0.75);
			if(common_scripts\utility::cointoss())
			{
				var_0C = randomfloatrange(-3,3);
			}

			thread lib_A56F::func_56A8(var_09,80);
			self.var_41 = var_08["angles"] + (var_0A,var_0B,var_0C);
			wait(0.05);
		}
	}
}

//Function Number: 33
func_85A3()
{
	var_00 = common_scripts\utility::getstruct(self.target,"targetname");
	var_01 = common_scripts\utility::getstruct(var_00.target,"targetname");
	var_02 = common_scripts\utility::getstruct("struct_sinkhole_center_2","targetname");
	var_03 = 600;
	lib_A56F::func_56A8(var_00.var_2E6,var_03);
	earthquake(0.2,1,level.var_31D.var_2E6,500);
	var_04 = 2;
	thread lib_A56F::func_43CB(self.var_2E6,var_01.var_2E6,var_04,900,900);
	thread func_858E();
	self waittill("item_landed");
	wait(0.05);
	self delete();
}

//Function Number: 34
func_858E()
{
	self endon("item_landed");
	var_00 = common_scripts\utility::getstruct(self.target,"targetname");
	var_01 = common_scripts\utility::getstruct(var_00.target,"targetname");
	self.var_41 = var_00.var_41;
	var_02 = (0,3,0);
	for(;;)
	{
		self addpitch(-5);
		wait(0.05);
	}
}

//Function Number: 35
func_85A4()
{
}

//Function Number: 36
func_859C()
{
	lib_A59A::func_9806("trig_sinkhole_spawn_smoke_grenades");
	level.var_A31B.ignoreall = 1;
	level.var_21DF.ignoreall = 1;
	level.var_520E.ignoreall = 1;
	lib_A59A::func_1143();
	thread func_859D();
	level.var_8677 = [];
	lib_A59A::func_D0C("sinkhole_smoke_ambush",::func_859B);
	lib_A59A::func_D0E("sinkhole_smoke_ambush");
	wait(2);
	common_scripts\utility::flag_set("vo_subway_threat_moment");
	thread func_85A0();
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_sinkhole");
	common_scripts\utility::flag_wait("wakeup_ambush");
	level.var_A31B.ignoreall = 0;
	level.var_21DF.ignoreall = 0;
	level.var_520E.ignoreall = 0;
	while(level.var_8677.size > 0)
	{
		level.var_8677 = lib_A59A::func_CFF(level.var_8677);
		wait 0.05;
	}

	common_scripts\utility::flag_set("vo_subway_threat_moment_clear");
	common_scripts\utility::flag_set("objective_sd_smoke_ambush_defeated");
	var_00 = getnode("subway_node_corner1","targetname");
	var_01 = getnode("subway_node_corner2","targetname");
	var_02 = getnode("subway_node_corner3","targetname");
	level.var_21DF lib_A59A::func_7E45(var_00);
	level.var_A31B lib_A59A::func_7E45(var_01);
	level.var_520E lib_A59A::func_7E45(var_02);
}

//Function Number: 37
func_859B()
{
	self endon("death");
	var_00 = getent("sinkhole_goal_smoke_ambush","targetname");
	self.ignoreall = 1;
	self method_81A9(var_00);
	level.var_8677[level.var_8677.size] = self;
	self.var_1D3 = 0;
	thread func_7B5E();
	self method_8041("gunshot");
	self method_8041("bulletwhizby");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"death");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"damage");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"ai_event");
	lib_A59A::func_75F(::common_scripts\utility::flag_set,"wakeup_ambush");
	thread lib_A59A::func_2BDC();
	thread lib_A59A::func_383E("wakeup_ambush",4);
	common_scripts\utility::flag_wait("wakeup_ambush");
	self.ignoreall = 0;
	self notify("stop_going_to_node");
}

//Function Number: 38
func_859D()
{
	var_00 = getent("sinkhole_origin_grenade_throw","targetname");
	var_01 = getentarray("sinkhole_origin_grenade_targets","script_noteworthy");
	for(var_02 = 0;var_02 < 2;var_02++)
	{
		if(!common_scripts\utility::flag("wakeup_ambush"))
		{
			foreach(var_04 in var_01)
			{
				function_0070("smoke_grenade_cheap",var_04.var_2E6,var_04.var_2E6 + (0,2,0),1);
				lib_A5DE::snd_message("seo_smoke_grenade_ambush",var_04.var_2E6 + (0,2,0),1);
			}

			wait(11);
		}
	}
}

//Function Number: 39
func_85A0()
{
	var_00 = level.var_31D getoffhandsecondaryclass();
	var_01 = level.var_31D getammocount(var_00);
	if(var_01 == 0)
	{
		return;
	}

	thread lib_A59A::func_2B4E("throw_threat_hint",6);
	while(!level.var_31D buttonpresseddevonly("BUTTON_LSHLDR"))
	{
		wait 0.05;
	}

	common_scripts\utility::flag_set("threat_grenade_thrown");
}

//Function Number: 40
func_8458()
{
	if(common_scripts\utility::flag("threat_grenade_thrown"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 41
func_8FA2()
{
	var_00 = getentarray("subway_ceiling_destroyed","targetname");
	foreach(var_02 in var_00)
	{
		var_02 hide();
	}

	var_04 = getentarray("subway_ceiling_stage1","targetname");
	foreach(var_02 in var_04)
	{
		var_02 hide();
	}

	var_07 = getent("seo_roof_chunk","targetname");
	var_07 hide();
	lib_A56F::func_A0B9("trig_start_subway_section");
	var_08 = getentarray("gate01","script_noteworthy");
	var_09 = getentarray("gate02","script_noteworthy");
	var_0A = getentarray("gate01_clip","targetname");
	var_0B = getentarray("gate02_clip","targetname");
	foreach(var_0D in var_0A)
	{
		var_0E = common_scripts\utility::getclosest(var_0D.var_2E6,var_08,20);
		var_0D linkto(var_0E);
		var_0D connectpaths();
	}

	foreach(var_0D in var_0B)
	{
		var_0E = common_scripts\utility::getclosest(var_0D.var_2E6,var_09,20);
		var_0D linkto(var_0E);
		var_0D connectpaths();
	}

	level.var_2D59 = getentarray("rotating_auto_doors","targetname");
	common_scripts\utility::array_thread(getentarray("rotating_auto_doors","targetname"),::func_8FA1);
	if(level.nextgen)
	{
		thread func_8FA3();
	}
	else
	{
		thread maps\seoul_transients_cg::func_8FA5();
	}

	lib_A56F::func_A0B9("trig_subway_round_corner");
	level notify("killSinkHolePerf");
	lib_A59A::func_1143();
	common_scripts\utility::flag_set("vo_subway_see_civilians");
	lib_A56F::func_A0B9("trig_subway_gate_arrival");
	common_scripts\utility::flag_set("objective_sd_followed_cormack_through_subway");
	if(!common_scripts\utility::flag("objective_sd_smoke_ambush_defeated"))
	{
		common_scripts\utility::flag_set("objective_sd_smoke_ambush_defeated");
	}

	thread func_8F96();
	common_scripts\utility::flag_wait("subway_gate_triggered");
	thread func_8F80();
}

//Function Number: 42
func_8F80()
{
	level.var_31D freezecontrols(1);
	thread maps\seoul_lighting::func_2C71();
	thread maps\seoul_lighting::func_5723();
	thread maps\seoul_lighting::func_1D6E();
	thread maps\seoul_lighting::func_1D73();
	level thread lib_A5CE::func_759C();
	var_00 = getent("hero_burke","targetname");
	var_01 = getent("atlas_squadmate1","targetname");
	var_02 = getent("atlas_squadmate2","targetname");
	var_03 = getent("atlas_squadmate3","targetname");
	var_04 = getent("civ_vip1","targetname");
	var_05 = getent("subway_origin_atlus_breach","targetname");
	var_06 = getent("subway_gate_atlas_meetup","targetname");
	var_07 = getent("subway_gate_atlas_meetup_clip","targetname");
	function_00D3("g_friendlynamedist",0);
	level.var_418F = var_00 lib_A56F::func_72C();
	level.var_D9B = var_01 lib_A56F::func_72C();
	level.var_D9C = var_02 lib_A56F::func_72C();
	level.var_418F.ignoreall = 1;
	level.var_D9B.ignoreall = 1;
	level.var_D9C.ignoreall = 1;
	level.var_9E4B = undefined;
	if(level.nextgen)
	{
		level.var_9E4B = var_04 lib_A56F::func_72C();
	}
	else
	{
		level.var_9E4B = maps\seoul_transients_cg::func_7D20();
	}

	if(level.nextgen)
	{
		level.var_9E4B.ignoreall = 1;
	}

	level.var_21DF.ignoreall = 1;
	level.var_520E.ignoreall = 1;
	level.var_A31B.ignoreall = 1;
	level.var_D9B.animname = "atlas_guy1";
	level.var_D9C.animname = "atlas_guy2";
	level.var_418F.animname = "gideon";
	level.var_21DF.animname = "cormack";
	level.var_520E.animname = "jackson";
	level.var_A31B.animname = "will_irons";
	level.var_D9B lib_A59A::func_445F();
	level.var_D9C lib_A59A::func_445F();
	level.var_418F lib_A59A::func_445F();
	level.var_D9B attach(getweaponmodel("iw5_hbra3_sp"),"TAG_WEAPON_RIGHT");
	level.var_D9C attach(getweaponmodel("iw5_hbra3_sp"),"TAG_WEAPON_RIGHT");
	level.var_418F attach(getweaponmodel("iw5_hbra3_sp"),"TAG_WEAPON_RIGHT");
	var_08 = lib_A59A::func_88CB("subway_gate");
	var_05 lib_A506::func_BC7(var_08,"seo_meet_atlas");
	var_06 linkto(var_08,"tag_origin_animated");
	var_09 = getent("seo_roof_chunk","targetname");
	var_09.animname = "roof_chunks";
	var_09 lib_A59A::func_D61();
	var_09 lib_A59A::func_D68();
	level.var_31D lib_A571::func_825E(1);
	level notify("atlas_scene_start");
	lib_A561::func_6AFB();
	var_0A = lib_A59A::func_88CB("player_rig",level.var_31D.var_2E6);
	lib_A59A::func_DEC(var_0A);
	level.var_9E4B.animname = "vip";
	var_0B = [level.var_21DF,level.var_A31B,level.var_418F,level.var_520E,level.var_D9B,level.var_D9C,level.var_9E4B,var_0A,var_08,var_09];
	var_09 common_scripts\utility::delaycall(0.5,::show);
	var_0A hide();
	var_0C = 0.5;
	level.var_31D playerlinktoblend(var_0A,"tag_player",var_0C,var_0C * 0.5);
	var_05 lib_A506::func_BC5([level.var_418F,level.var_D9B,level.var_D9C,level.var_9E4B,var_0A,var_08,var_09],"seo_meet_atlas");
	var_0A common_scripts\utility::delaycall(var_0C,::show);
	level.var_31D common_scripts\utility::delaycall(var_0C,::playerlinktodelta,var_0A,"tag_player",1,7,7,5,5,1);
	common_scripts\utility::flag_set("vo_begin_seo_meet_atlas");
	var_05 lib_A506::func_C18(var_0B,"seo_meet_atlas");
	var_07 connectpaths();
	level.var_31D unlink();
	var_0A delete();
	level.var_31D lib_A571::func_825D();
	level.var_31D freezecontrols(0);
	lib_A561::func_6AF5();
	level.var_31D method_8031(65,0.1);
	function_00D3("g_friendlynamedist",1024);
	var_06 unlink();
	var_0D = getent("subway_gate_atlas_meetup_closed","targetname");
	var_06 lib_A5DE::snd_message("subway_gate_atlas_meetup_close");
	var_06 moveto(var_0D.var_2E6,2,0.5);
	var_0E = getent("subway_origin_jackson_post_scene","targetname");
	level.var_520E lib_A59A::func_C3D();
	level.var_520E method_81C6(var_0E.var_2E6,var_0E.var_41);
	thread func_8F82();
	common_scripts\utility::flag_set("objective_start_shopping_district");
	function_00D3("g_friendlynamedist",1024);
	common_scripts\utility::flag_waitopen("vo_begin_seo_meet_atlas");
}

//Function Number: 43
func_8F99(param_00)
{
	var_01 = 50;
	level.var_31D method_8031(var_01,0.5);
}

//Function Number: 44
func_8F98(param_00)
{
	if(!isdefined(level.var_658E))
	{
		level.var_658E = 65;
	}

	level.var_31D method_8031(level.var_658E,0.5);
}

//Function Number: 45
func_8FA0(param_00)
{
	lib_A5DE::snd_message("seo_meet_atlas_slowmo_start");
	lib_A59A::func_8642();
	lib_A59A::func_8640(0.5);
	lib_A59A::func_863D(0.25);
	lib_A59A::func_863A();
	level notify("stop_subway_pa");
}

//Function Number: 46
func_8F9F()
{
	lib_A59A::func_863E(0.75);
	lib_A59A::func_863B();
	lib_A59A::func_8638();
	lib_A5DE::snd_message("seo_meet_atlas_slowmo_end");
}

//Function Number: 47
func_8F9A(param_00)
{
	var_01 = getentarray("subway_ceiling_intact","targetname");
	foreach(var_03 in var_01)
	{
		var_03 hide();
	}

	var_05 = getentarray("subway_ceiling_stage1","targetname");
	foreach(var_03 in var_05)
	{
		var_03 show();
	}

	if(level.nextgen)
	{
		wait(0.3);
	}

	var_08 = getentarray("subway_ceiling_destroyed","targetname");
	foreach(var_03 in var_08)
	{
		var_03 show();
	}

	foreach(var_03 in var_05)
	{
		var_03 hide();
	}

	wait(0.3);
	thread func_8FA0();
	wait(1);
	thread func_8F9F();
}

//Function Number: 48
func_8F82()
{
	var_00 = getent("subway_origin_atlas1","targetname");
	var_01 = getent("subway_origin_atlas2","targetname");
	var_02 = getent("subway_origin_atlas3","targetname");
	var_03 = getent("subway_origin_atlas4","targetname");
	var_04 = getnode("atlas_cover_1","targetname");
	var_05 = getnode("atlas_cover_2","targetname");
	var_06 = getnode("atlas_cover_3","targetname");
	var_07 = getent("atlas_cover_4","targetname");
	level.var_418F lib_A59A::func_C3D();
	level.var_D9B lib_A59A::func_C3D();
	level.var_D9C lib_A59A::func_C3D();
	level.var_9E4B lib_A59A::func_C3D();
	level.var_418F method_81C6(var_00.var_2E6,var_00.var_41);
	level.var_D9B method_81C6(var_01.var_2E6,var_01.var_41);
	level.var_D9C method_81C6(var_02.var_2E6,var_02.var_41);
	if(level.nextgen)
	{
		level.var_9E4B method_81C6(var_03.var_2E6,var_03.var_41);
		level.var_9E4B lib_A59A::func_7E48(15);
		level.var_9E4B method_81A7(var_07);
	}
	else
	{
		thread maps\seoul_transients_cg::func_7D14(var_03);
	}

	level.var_418F lib_A59A::func_7E48(15);
	level.var_418F lib_A59A::func_7E45(var_04);
	level.var_D9B lib_A59A::func_7E48(15);
	level.var_D9B lib_A59A::func_7E45(var_05);
	level.var_D9C lib_A59A::func_7E48(15);
	level.var_D9C lib_A59A::func_7E45(var_06);
	wait(15);
	func_8F81();
}

//Function Number: 49
func_8F81()
{
	level.var_418F delete();
	level.var_D9B delete();
	level.var_D9C delete();
	level.var_9E4B delete();
}

//Function Number: 50
func_8FA3()
{
	var_00 = getent("trigger_enter_subway_station_01","targetname");
	var_01 = getent("trigger_enter_subway_station_02","targetname");
	var_02 = getent("trigger_enter_subway_station_03","targetname");
	var_03 = getent("trigger_enter_subway_station_04","targetname");
	level.var_8F8B = [];
	thread func_8F8F(var_00,var_01);
	thread func_8F8F(var_03,var_02);
	thread func_8F92(var_01,var_00);
	thread func_8F92(var_02,var_03);
}

//Function Number: 51
func_4517()
{
	lib_A56F::func_A0B9("trig_subway_get_allies_to_execution_scene");
	thread lib_A56F::func_97FE("trig_subway_round_corner","allies_aware_of_execution");
	level.var_21DF.ignoreall = 1;
	level.var_A31B.ignoreall = 1;
	level.var_520E.ignoreall = 1;
	level common_scripts\utility::waittill_either("execution_scene_halted","allies_aware_of_execution");
	level.var_21DF.ignoreall = 0;
	level.var_A31B.ignoreall = 0;
	level.var_520E.ignoreall = 0;
}

//Function Number: 52
func_8F90(param_00,param_01)
{
	thread func_4517();
	param_00 waittill("trigger");
	param_01 waittill("trigger");
	var_02 = getent("spawner_execution_scene","targetname");
	var_03 = common_scripts\utility::getstructarray("struct_subway_execution_scene_soldier1","targetname");
	var_04 = var_03[0] common_scripts\utility::spawn_tag_origin();
	var_05 = [];
	foreach(var_07 in var_03)
	{
		var_08 = var_02 lib_A56F::func_72C(1);
		var_08 lib_A55C::func_399C("gundown");
		var_08 method_81A6(level.var_31D.var_2E6);
		var_05[var_05.size] = var_08;
		var_08 thread func_5D60();
		wait(2);
	}

	common_scripts\utility::array_thread(var_05,::func_5D60,var_05);
	level waittill("execution_scene_halted");
	lib_A59A::func_70A("trig_subway_round_corner");
}

//Function Number: 53
func_5D60(param_00)
{
	thread lib_A59A::func_61FA("alert",8);
	var_01 = common_scripts\utility::waittill_any_return("death","damage","alert");
	foreach(var_03 in param_00)
	{
		if(isdefined(var_03))
		{
			var_03 notify("alert");
		}
	}

	lib_A59A::func_1EBA();
	lib_A59A::func_1ED1();
	self method_81CA("stand","crouch","prone");
	self.var_2AF2 = 0;
	self.var_2B0D = 0;
	self method_8141();
	self notify("stop_animmode");
	self.var_7A73 = undefined;
	self.var_1C7 = level.var_277F;
}

//Function Number: 54
func_3600()
{
	self waittill("death",var_00,var_01,var_02);
	if(isdefined(var_00) && var_00 == level.var_31D)
	{
		setdvar("ui_deadquote",&"SEOUL_FAIL_CIVILIAN_KILLED");
		lib_A59A::func_5CDC();
	}
}

//Function Number: 55
func_532B()
{
	self waittill("damage");
	lib_A59A::func_C3D();
	self startragdoll();
	wait 0.05;
	self method_8052();
}

//Function Number: 56
func_74D2(param_00,param_01)
{
	self method_8041(param_00);
}

//Function Number: 57
func_5D97(param_00)
{
	self waittill("ai_alert");
	lib_A59A::func_C3D();
}

//Function Number: 58
func_5D98(param_00)
{
	thread func_74D2("grenade danger","ai_alert");
	thread func_74D2("bulletwhizby","ai_alert");
	common_scripts\utility::waittill_any("death","damage","ai_event","ai_alert");
	foreach(var_02 in param_00)
	{
		if(isdefined(var_02))
		{
			var_02 notify("ai_alert");
		}
	}

	if(isdefined(self))
	{
		lib_A59A::func_C3D();
	}
}

//Function Number: 59
func_4610(param_00,param_01,param_02)
{
	for(;;)
	{
		param_00 waittill("trigger");
		param_01 waittill("trigger");
		if(param_02 == "off")
		{
			thread lib_A575::func_2B26();
		}
		else
		{
			thread lib_A575::func_3118();
		}

		param_01 waittill("trigger");
		param_00 waittill("trigger");
		if(param_02 == "off")
		{
			thread lib_A575::func_3118();
			continue;
		}

		thread lib_A575::func_2B26();
	}
}

//Function Number: 60
func_8F8F(param_00,param_01)
{
	if(!isdefined(level.var_8F8B))
	{
		level.var_8F8B = [];
	}

	var_02 = getentarray("spawner_subway_civilian","targetname");
	var_03 = common_scripts\utility::getstructarray("struct_subway_civilian","targetname");
	for(;;)
	{
		param_00 waittill("trigger");
		param_01 waittill("trigger");
		level notify("player_entered_subway");
		foreach(var_05 in var_03)
		{
			var_06 = lib_A59A::func_2F29(common_scripts\utility::random(var_02));
			var_06 notsolid();
			if(!isdefined(var_06))
			{
				continue;
			}

			var_06.animname = "generic";
			var_05 thread lib_A506::func_BCE(var_06,var_05.animation);
			level.var_8F8B[level.var_8F8B.size] = var_06;
		}

		wait(0.1);
	}
}

//Function Number: 61
func_17D2()
{
	self endon("death");
	while(!func_50DE())
	{
		wait 0.05;
	}

	if(isdefined(self.tag))
	{
		thread lib_A56F::func_C3C(self.tag);
	}

	thread lib_A59A::func_C3D();
	thread lib_A56F::func_C3C();
}

//Function Number: 62
func_50DE()
{
	if(!isdefined(self.var_50DF))
	{
		return 0;
	}

	if(!self.var_50DF)
	{
		return 0;
	}

	return 1;
}

//Function Number: 63
func_8F92(param_00,param_01)
{
	for(;;)
	{
		param_00 waittill("trigger");
		param_01 waittill("trigger");
		level notify("player_leaving_subway");
		if(level.var_8F8B.size > 0)
		{
			foreach(var_03 in level.var_8F8B)
			{
				if(isdefined(var_03.tag))
				{
					var_03.tag delete();
				}

				if(isdefined(var_03))
				{
					var_03 delete();
				}
			}
		}

		wait(0.05);
	}
}

//Function Number: 64
func_88D8(param_00)
{
	param_00.count = 1;
	var_01 = param_00 lib_A56F::func_72C(1);
	var_01.animname = "generic";
	param_00 thread lib_A506::func_BCE(var_01,param_00.animation);
	var_01 func_8F88(param_00.animation);
	var_01 thread func_17D2();
	return var_01;
}

//Function Number: 65
func_8F86()
{
	var_00 = getentarray("spawner_subway_civilian","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_subway_civilian","targetname");
	foreach(var_03 in var_01)
	{
		var_04 = lib_A59A::func_2F28(common_scripts\utility::random(var_00));
		if(!isdefined(var_04))
		{
			continue;
		}

		var_04.animname = "generic";
		var_04.var_2E6 = var_03.var_2E6;
		var_04.var_41 = var_03.var_41;
		var_03 thread lib_A506::func_BCE(var_04,var_03.animation);
		level.var_8F8B[level.var_8F8B.size] = var_04;
	}
}

//Function Number: 66
func_8F8A()
{
	anim.var_1E13 = [];
	level.var_1E13["civilian_smoking_b"] = "prop_cigarette";
	level.var_1E13["parabolic_leaning_guy_smoking_idle"] = "prop_cigarette";
	level.var_1E13["civilian_texting_sitting"] = "electronics_pda";
	level.var_1E13["civilian_reader_1"] = "lab_tablet_flat_on";
	level.var_1E13["civilian_reader_2"] = "lab_tablet_flat_on";
	level.var_1E13["civilian_texting_standing"] = "electronics_pda";
	level.var_1E13["civilian_sitting_business_lunch_A_1"] = "com_cellphone_on";
}

//Function Number: 67
func_8F88(param_00)
{
	if(isdefined(self.var_4718))
	{
		return;
	}

	func_8F8A();
	var_01 = level.var_1E13[param_00];
	if(isdefined(var_01))
	{
		self.var_DF7 = var_01;
		self.var_DF8 = "tag_inhand";
		var_02 = self attach(self.var_DF7,self.var_DF8,1);
		self.var_4718 = 1;
		if(self.var_DF7 == "prop_cigarette")
		{
			playfxontag(common_scripts\utility::getfx("cigarette_smk"),self,"tag_inhand");
		}

		return var_01;
	}
}

//Function Number: 68
func_8F89()
{
	if(isdefined(self.var_4718) && isdefined(self.var_DF7))
	{
		if(self.var_DF7 == "prop_cigarette")
		{
			stopfxontag(common_scripts\utility::getfx("cigarette_smk"),self,"tag_inhand");
		}

		self detach(self.var_DF7,self.var_DF8);
		self.var_4718 = undefined;
		self.var_DF7 = undefined;
		self.var_DF8 = undefined;
	}
}

//Function Number: 69
func_8F96()
{
	var_00 = getent("subway_open_gate","targetname");
	var_00 usetriggerrequirelookat();
	var_00 sethintstring(&"SEOUL_OPEN_GATE_HINT");
	var_01 = var_00 lib_A571::func_48BF("x",300);
	common_scripts\utility::flag_set("vo_near_gate");
	var_02 = ["seo_crk_mitchellgetthatgate","seo_crk_getthegatemitchell"];
	thread lib_A571::func_2A37(level.var_21DF,"subway_gate_triggered",var_02);
	lib_A59A::func_9806("subway_open_gate");
	common_scripts\utility::flag_set("subway_gate_triggered");
	lib_A5DE::snd_message("subway_gate_triggered");
	var_01 lib_A571::func_48B3();
	var_00 sethintstring("");
	common_scripts\utility::flag_set("objective_sd_gate_opened");
	var_00 common_scripts\utility::trigger_off();
}

//Function Number: 70
func_8F97()
{
	for(;;)
	{
		if(isdefined(level.var_31D getcurrentweapon()) && level.var_31D getcurrentweapon() != "none")
		{
			var_00 = level.var_31D getcurrentweapon();
			var_01 = strtok(var_00,"_");
			var_02 = "none";
			if(var_01[1] == "himar")
			{
				var_03 = "npc_himar_base";
			}
			else
			{
				var_03 = "npc_" + var_02[1] + "_nocamo";
			}

			if(isdefined(var_01[3]))
			{
				var_02 = var_01[3];
			}

			wait 0.05;
		}

		wait(1);
	}
}

//Function Number: 71
func_8FA1()
{
	if(!isdefined(self.open_time))
	{
		self.open_time = 1;
	}

	var_00 = getentarray(self.target,"targetname");
	var_01 = [];
	foreach(var_03 in var_00)
	{
		if(var_03.classname == "script_origin")
		{
			var_01[var_01.size] = var_03;
			continue;
		}

		var_03 func_8F83(self.open_time);
	}

	var_00 = common_scripts\utility::array_remove_array(var_00,var_01);
	for(;;)
	{
		if(!isdefined(level.var_6A53))
		{
			level.var_6A53 = [];
			level.var_6A53[level.var_6A53.size] = level.var_31D;
			level.var_6A53[level.var_6A53.size] = level.var_21DF;
			level.var_6A53[level.var_6A53.size] = level.var_A31B;
			level.var_6A53[level.var_6A53.size] = level.var_520E;
		}

		var_05 = 0;
		foreach(var_07 in level.var_6A53)
		{
			if(var_07 istouching(self) && isdefined(var_07))
			{
				var_05++;
				break;
			}
		}

		if(var_05 > 0)
		{
			func_8F9C(var_00);
		}
		else
		{
			var_09 = 0.3;
			thread func_8F8C(var_00,var_09);
		}

		wait(0.05);
	}
}

//Function Number: 72
func_8F83(param_00)
{
	self.start_position = self.var_41;
	self.sliding_door_state = "closed";
	var_01 = getent(self.target,"targetname");
	self.open_position = var_01.var_41;
	self.open_velocity = distance(self.open_position,self.var_41) / param_00;
}

//Function Number: 73
func_8F9C(param_00)
{
	foreach(var_02 in param_00)
	{
		if(var_02.sliding_door_state == "open" || var_02.sliding_door_state == "opening")
		{
			continue;
		}

		var_02 thread func_8F9D();
	}
}

//Function Number: 74
func_8F9D()
{
	self.sliding_door_state = "opening";
	var_00 = 0.3;
	self rotateto(self.open_position,var_00);
	lib_A5DE::snd_message("subway_doors_opening");
	wait(var_00);
	self.sliding_door_state = "open";
}

//Function Number: 75
func_8F8C(param_00,param_01)
{
	foreach(var_03 in param_00)
	{
		if(var_03.sliding_door_state == "closed" || var_03.sliding_door_state == "opening")
		{
			continue;
		}

		var_03 rotateto(var_03.start_position,param_01);
		var_03 lib_A5DE::snd_message("subway_doors_closing");
		var_03.sliding_door_state = "closed";
	}
}

//Function Number: 76
func_7B58()
{
}

//Function Number: 77
func_7B68()
{
	common_scripts\utility::flag_wait("sd_start_shopping_district");
	lib_A59A::func_6159();
	level.var_A31B.ignoreall = 1;
	level.var_21DF.ignoreall = 1;
	level.var_520E.ignoreall = 1;
	level.var_6BDB = missilecreaterepulsorent(level.var_31D,10000,500);
	lib_A59A::func_1332("allies");
	lib_A59A::func_1143();
	thread func_7B4A();
	common_scripts\utility::flag_set("start_weapon_platform_firing");
	thread func_30D9();
	thread func_7B56();
	thread func_7B5D();
	thread func_7B69();
	thread func_7B5C();
	thread func_7B65();
	thread func_7B6B();
	thread func_7B66();
	thread func_7B67();
	thread func_7B63("trig_restaurant_spawn","enemy_sd_restaraunt1",undefined,undefined);
	thread func_7B63("trig_restaurant_spawn","enemy_sd_upstairs1_reinforce",3,undefined);
	thread func_7B63("trig_sd_reinforce1","enemy_sd_reinforce1",undefined,undefined);
	thread func_7B64();
	thread func_7B63("trig_sd_reinforce1","enemy_sd_intersection2",undefined);
	thread func_7B57();
	thread func_7B58();
	thread func_45B9();
	thread func_7B60();
	thread func_7B53();
	thread func_1AAA();
	lib_A56F::func_A0B9("trig_patrol1_spawn");
	common_scripts\utility::flag_set("vo_sd_attack_patrol");
	level.var_A31B lib_A59A::func_30AF();
	level.var_21DF lib_A59A::func_30AF();
	level.var_520E lib_A59A::func_30AF();
	lib_A56F::func_A0B9("sd_trig_engage_patrol");
	thread func_7B6C();
	lib_A56F::func_A0B9("trig_upstairs2_spawn");
	lib_A59A::func_1143();
	lib_A56F::func_A0B9("trig_sd_intersection2_reinforce");
	lib_A59A::func_1143();
	common_scripts\utility::flag_wait("sd_cleanup_upstairs");
	var_00 = getent("sd_goal_upstairs2","targetname");
	var_01 = lib_A59A::func_3D78("axis","p");
	var_02 = var_00 lib_A59A::func_3CB6("axis");
	var_01 = common_scripts\utility::array_combine(var_01,var_02);
	foreach(var_04 in var_01)
	{
		if(isalive(var_04))
		{
			var_04 func_14BC(0.3);
		}
	}

	common_scripts\utility::flag_wait("sd_trigger_final_combat");
	var_06 = lib_A59A::func_3D78("axis","g");
	foreach(var_04 in var_06)
	{
		if(isalive(var_04))
		{
			var_04.health = 1;
		}
	}

	common_scripts\utility::flag_wait("sd_street_combat_complete");
	common_scripts\utility::flag_set("objective_sd_street_combat_complete");
}

//Function Number: 78
func_30D9()
{
	common_scripts\utility::flag_wait("wakeup_patrol");
	level.var_A31B lib_A59A::func_30D8();
	common_scripts\utility::flag_wait("sd_street_combat_complete");
	level.var_A31B lib_A59A::func_2AC1();
}

//Function Number: 79
func_45B9()
{
	common_scripts\utility::flag_wait("sd_street_combat_complete");
	maps\seoul::func_30AE();
	common_scripts\utility::flag_wait("canal_reached_window");
	maps\seoul::func_2A8B();
}

//Function Number: 80
func_7B4A()
{
	common_scripts\utility::flag_wait("vo_begin_seo_meet_atlas");
	common_scripts\utility::flag_waitopen("vo_begin_seo_meet_atlas");
	if(!common_scripts\utility::flag("sd_combat_start"))
	{
		lib_A59A::func_1143();
	}
}

//Function Number: 81
func_7B64()
{
	lib_A56F::func_A0B9("trig_upstairs2_spawn");
	var_00 = lib_A59A::func_3D78("axis","p");
	var_00 = lib_A59A::func_CFF(var_00);
	while(var_00.size > 0)
	{
		var_00 = lib_A59A::func_CFF(var_00);
		wait 0.05;
	}

	if(!common_scripts\utility::flag("sd_cleanup_upstairs"))
	{
		thread func_7B63(undefined,"enemy_sd_upstairs2",undefined,"sd_goal_upstairs2",undefined,undefined,undefined,"trig_sd_cleanup_upstairs2");
	}
}

//Function Number: 82
func_7B6C()
{
	lib_A56F::func_A0B9("sd_trig_move_inside_restaurant");
	common_scripts\utility::flag_set("vo_inside_restaurant");
}

//Function Number: 83
func_7B69()
{
	lib_A56F::func_A0B9("sd_trig_move_inside_restaurant");
	var_00 = lib_A59A::func_3D78("axis","b");
	foreach(var_02 in var_00)
	{
		if(isdefined(var_02))
		{
			var_02 lib_A59A::func_7E32("p");
		}
	}
}

//Function Number: 84
func_7B66()
{
	level endon("player_hit_street_zipline_trigger");
	lib_A56F::func_A0B9("trig_sd_upstairs1_zipreinforce");
	level notify("player_hit_upperfloor_zipline_trigger");
	var_00 = getent("sd_int2_smoke_nade_source1","targetname");
	var_01 = getentarray("sd_upstairs_smoke_nade_source1","targetname");
	foreach(var_03 in var_01)
	{
		function_0070("smoke_grenade_cheap",var_03.var_2E6,var_03.var_2E6 + (0,2,0),0.5);
		lib_A5DE::snd_message("seo_smoke_grenade_ambush",var_03.var_2E6 + (0,2,0),0.5);
	}

	wait(2);
	var_05 = getglassarray("sd_glass_bar_windows");
	foreach(var_07 in var_05)
	{
		destroyglass(var_07);
	}

	var_09 = getent("sd_org_smoke_start","targetname");
	var_0A = getent("sd_org_smoke_target1","targetname");
	var_0B = getent("sd_org_smoke_target2","targetname");
	function_0070("smoke_grenade_cheap",var_09.var_2E6 + (0,200,-60),var_0A.var_2E6 + (0,20,20),1);
	lib_A5DE::snd_message("seo_smoke_grenade_ambush",var_0A.var_2E6 + (0,20,20),1);
	wait(0.5);
	function_0070("smoke_grenade_cheap",var_09.var_2E6 + (0,200,-60),var_0B.var_2E6 + (0,20,20),1);
	lib_A5DE::snd_message("seo_smoke_grenade_ambush",var_0B.var_2E6 + (0,20,20),1);
	var_0C = [];
	var_0C[var_0C.size] = thread animscripts\traverse\seoul_zipline::func_892A("enemy_sd_upstairs1_zipreinforce","sd_zipline_upstairs_across_start2");
	wait(0.5);
	var_0C[var_0C.size] = thread animscripts\traverse\seoul_zipline::func_892A("enemy_sd_upstairs1_zipreinforce","sd_zipline_upstairs_across_start1");
	wait(0.5);
	var_0C[var_0C.size] = thread animscripts\traverse\seoul_zipline::func_892A("enemy_sd_upstairs1_zipreinforce","sd_zipline_upstairs_across_start3");
	wait(0.5);
	var_0C[var_0C.size] = thread animscripts\traverse\seoul_zipline::func_892A("enemy_sd_upstairs1_zipreinforce","sd_zipline_upstairs_across_start4");
	func_7B6D(var_0C);
}

//Function Number: 85
func_7B67()
{
	level endon("player_hit_upperfloor_zipline_trigger");
	lib_A56F::func_A0B9("trig_sd_upstairs1_zipreinforce_02");
	level notify("player_hit_street_zipline_trigger");
	var_00 = getent("sd_int2_smoke_nade_source1","targetname");
	var_01 = getentarray("sd_upstairs_smoke_nade_source1","targetname");
	foreach(var_03 in var_01)
	{
		if(common_scripts\utility::cointoss())
		{
			function_0070("smoke_grenade_cheap",var_03.var_2E6,var_03.var_2E6 + (0,2,0),0.5);
		}
	}

	wait(2);
	var_05 = getglassarray("sd_glass_bar_windows");
	foreach(var_07 in var_05)
	{
		destroyglass(var_07);
	}

	var_09 = getent("sd_org_smoke_start","targetname");
	var_0A = getent("sd_org_smoke_target1","targetname");
	var_0B = getent("sd_org_smoke_target2","targetname");
	function_0070("smoke_grenade_cheap",var_09.var_2E6 + (0,200,-60),var_0A.var_2E6 + (0,20,20),1);
	wait(0.5);
	function_0070("smoke_grenade_cheap",var_09.var_2E6 + (0,200,-60),var_0B.var_2E6 + (0,20,20),1);
	var_0C = [];
	var_0C[var_0C.size] = thread animscripts\traverse\seoul_zipline::func_892A("enemy_sd_upstairs1_zipreinforce","sd_zipline_upstairs_across_start2");
	wait(0.5);
	var_0C[var_0C.size] = thread animscripts\traverse\seoul_zipline::func_892A("enemy_sd_upstairs1_zipreinforce","sd_zipline_upstairs_across_start1");
	func_7B6D(var_0C);
}

//Function Number: 86
func_45ED()
{
	self endon("death");
	lib_A56F::func_A0B9("trig_sd_cleanup_upstairs2");
	func_14BC();
}

//Function Number: 87
func_4626(param_00)
{
	self endon("death");
	self waittill("flashed");
	if(isdefined(param_00))
	{
		param_00 turretfiredisable();
		wait(6);
		param_00 turretfireenable();
	}
}

//Function Number: 88
func_7B65()
{
	lib_A59A::func_9806("trig_sd_turret_vehicle_spawn");
	wait(3);
	var_00 = lib_A59E::func_8973("sd_turret_vehicle1");
	if(level.currentgen)
	{
		thread maps\seoul_transients_cg::func_1C22(var_00,"pre_transients_canal_overlook_to_riverwalk");
	}

	var_00 lib_A5DE::snd_message("shopping_district_turret_truck");
	var_00.var_7A01 = 1;
	var_01 = var_00.mgturret[0];
	var_02 = getent("gaz_lighting_origin","targetname");
	var_00 method_847B(var_02.var_2E6);
	foreach(var_04 in var_00.var_7507)
	{
		if(level.currentgen)
		{
			var_04.var_6090 = 1;
		}

		if(var_04.var_9D13 == 3)
		{
			var_05 = var_04;
			var_05 thread func_4626(var_01);
			var_05 thread func_45ED();
		}
	}

	var_00 waittill("reached_end_node");
	var_00 lib_A59E::func_9D5F("all_but_gunner");
	common_scripts\utility::flag_wait("canal_jump_complete");
	if(isdefined(var_00))
	{
		var_00 delete();
	}
}

//Function Number: 89
func_7B6B()
{
	lib_A56F::func_A0B9("trig_patrol1_spawn");
	lib_A56F::func_A0B9("sd_trig_engage_patrol");
	common_scripts\utility::flag_wait("wakeup_patrol");
	common_scripts\utility::flag_set("vo_sd_first_reinforcements");
	if(level.currentgen && !issubstr(level.var_9704,"_shopping"))
	{
		level waittill("transients_subway_to_shopping_dist");
	}

	lib_A59A::func_D0C("enemy_sd_upstairs1",::func_7B47);
	var_00 = lib_A59A::func_D0E("enemy_sd_upstairs1",1);
	lib_A56F::func_A0B9("trig_sd_reinforce1");
	var_00 = lib_A59A::func_CFF(var_00);
	foreach(var_02 in var_00)
	{
		var_02 lib_A59A::func_7E32("p");
	}
}

//Function Number: 90
func_7B47()
{
	self.var_1D3 = 0;
	thread func_1C69();
	lib_A59A::func_7E48(15);
	lib_A59A::func_7E45(getnode(self.target,"targetname"));
}

//Function Number: 91
func_7B5C()
{
	lib_A56F::func_A0B9("trig_disable_restaraunt_events");
	lib_A59A::func_2AE7("trig_disable_restaraunt_events");
	var_00 = getent("trig_restaurant_spawn","targetname");
	if(isdefined(var_00))
	{
		lib_A59A::func_2AE7("trig_restaurant_spawn");
	}

	var_01 = getent("trig_sd_will_command_restaraunt1","targetname");
	if(isdefined(var_01))
	{
		lib_A59A::func_2AE7("trig_sd_will_command_restaraunt1");
	}

	var_02 = getent("trig_sd_upstairs1_reinforce","targetname");
	if(isdefined(var_02))
	{
		lib_A59A::func_2AE7("trig_sd_upstairs1_reinforce");
	}
}

//Function Number: 92
func_7B5D()
{
	lib_A56F::func_A0B9("trig_patrol1_spawn");
	while(level.currentgen && !function_021E("seoul_shopping_dist_tr"))
	{
		wait(0.05);
	}

	if(level.currentgen)
	{
		thread lib_A50E::func_1C32("sd_street_combat_complete",undefined,15,0);
	}

	common_scripts\utility::flag_clear("wakeup_patrol");
	thread lib_A59A::func_D0C("enemy_sd_patrol1",::func_7B52,"casualkiller",1);
	thread lib_A59A::func_D0E("enemy_sd_patrol1",1);
	common_scripts\utility::flag_wait("wakeup_patrol");
	common_scripts\utility::flag_set("sd_combat_start");
}

//Function Number: 93
func_7B52(param_00,param_01,param_02)
{
	self endon("death");
	self.ignoreall = 1;
	self.var_6716 = undefined;
	self.var_6715 = undefined;
	self.var_1D3 = 0;
	self.var_7968 = 1;
	thread lib_A555::func_66F9();
	lib_A59A::func_1EB8();
	thread func_7B5E();
	self method_8041("grenade danger");
	self method_8041("gunshot");
	self method_8041("bulletwhizby");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"death");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"damage");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"ai_event");
	lib_A59A::func_75F(::common_scripts\utility::flag_set,"wakeup_patrol");
	thread lib_A59A::func_2BDC();
	common_scripts\utility::flag_wait("wakeup_patrol");
	self.ignoreall = 0;
	lib_A59A::func_7E32("b");
	self.var_180 = 0;
	func_7375();
	self notify("stop_going_to_node");
	level.var_A31B.ignoreall = 0;
	level.var_21DF.ignoreall = 0;
	level.var_520E.ignoreall = 0;
	level.var_A31B lib_A59A::func_2A8C();
	level.var_21DF lib_A59A::func_2A8C();
	level.var_520E lib_A59A::func_2A8C();
	lib_A59A::func_1333("allies");
	thread func_1C69();
}

//Function Number: 94
func_7B5E()
{
	self endon("death");
	level endon("wakeup_patrol");
	level.var_31D endon("death");
	while(distancesquared(level.var_31D.var_2E6,self.var_2E6) > squared(450))
	{
		wait(0.25);
	}

	common_scripts\utility::flag_set("wakeup_patrol");
}

//Function Number: 95
func_7B56()
{
	var_00 = lib_A59E::func_8973("sd_intersection_chopper");
	var_00.ignoreall = 1;
	var_00 lib_A59E::func_4256();
	var_00 lib_A5DE::snd_message("sd_intersection_chopper");
	var_00.light = common_scripts\utility::spawn_tag_origin();
	var_00.light.var_2E6 = var_00 gettagorigin("tag_flash");
	var_00.light.var_41 = var_00 gettagorigin("tag_flash");
	var_00.light linkto(var_00,"tag_flash",(3,0,0),(90,0,0));
	playfxontag(common_scripts\utility::getfx("spotlight_chopper"),var_00.light,"tag_origin");
	var_00 thread lib_A56F::func_8EE3(common_scripts\utility::getfx("spotlight_chopper"),var_00.light,"tag_origin","death");
	lib_A56F::func_A0B9("trig_patrol1_spawn");
	common_scripts\utility::flag_set("sd_intersection_chopper_wait");
}

//Function Number: 96
func_7B57()
{
	lib_A56F::func_A0B9("trig_sd_intersection2_reinforce");
	var_00 = getent("sd_int2_smoke_nade_source1","targetname");
	var_01 = getentarray("sd_int2_smoke_nade_targets","script_noteworthy");
	wait(1.5);
	thread func_7B63(undefined,"enemy_sd_intersection2_upstairs",undefined,"sd_goal_intersection2_upstairs",undefined,undefined,undefined);
	var_02 = [];
	wait(0.5);
	wait(0.5);
	lib_A59A::func_1143();
	wait(1);
	var_00 = getent("sd_int2_smoke_nade_source2","targetname");
	var_03 = getentarray("sd_int2_smoke_nade_targets2","script_noteworthy");
	lib_A5DE::snd_music_message("mus_sd_firefight_ending");
}

//Function Number: 97
func_7B60()
{
	var_00 = getglass("sd_glass_sign1");
	var_01 = getent("sd_glass_sign1_1","targetname");
	while(isglassdestroyed(var_00) == 0 && isdefined(var_00))
	{
		wait 0.05;
	}

	var_01 delete();
}

//Function Number: 98
func_7B53()
{
	var_00 = getglassarray("glass_with_petals");
	var_01 = getentarray("petals_brush","script_noteworthy");
	foreach(var_03 in var_00)
	{
		var_04 = common_scripts\utility::getclosest(getglassorigin(var_03),var_01,400);
		thread func_7B54(var_04,var_03);
	}
}

//Function Number: 99
func_7B54(param_00,param_01)
{
	while(!isglassdestroyed(param_01))
	{
		wait 0.05;
	}

	if(isdefined(param_00))
	{
		param_00 delete();
	}
}

//Function Number: 100
func_7B61()
{
	common_scripts\utility::flag_wait("sd_spawn_drone_swarm_for_evade");
	common_scripts\utility::flag_set("vo_sd_demo_team_call");
	common_scripts\utility::flag_wait("sd_trigger_final_combat");
	thread func_4559();
	level waittill("smoke_thrown_sd");
	thread func_456E();
	level.var_A31B lib_A59A::func_30A9();
	level.var_21DF lib_A59A::func_30A9();
	level.var_520E lib_A59A::func_30A9();
	lib_A59A::func_1143();
}

//Function Number: 101
func_7B51()
{
	lib_A56F::func_A0B9("trig_drone_evade");
	common_scripts\utility::flag_set("vo_sd_demo_team_call");
	wait(0.5);
	var_00 = common_scripts\utility::getstructarray("sd_snake_swarm_enter","script_noteworthy");
	var_01 = common_scripts\utility::getstructarray("sd_snake_swarm_window_path1","script_noteworthy");
	var_02 = common_scripts\utility::getstructarray("sd_snake_swarm_attack_path2","script_noteworthy");
	var_03 = common_scripts\utility::getstructarray("sd_snake_swarm_attack_path3","script_noteworthy");
	foreach(var_05 in var_00)
	{
		var_05.speed = 18;
	}

	foreach(var_05 in var_02)
	{
		var_05.speed = 18;
	}

	foreach(var_05 in var_03)
	{
		var_05.speed = 20;
	}

	foreach(var_05 in var_01)
	{
		var_05.speed = 25;
	}

	var_0D = getent("sd_drone_queen1","targetname");
	var_0E = getent("sd_drone_queen2","targetname");
	var_0F = [var_0D,var_0E];
	if(level.nextgen)
	{
		var_10 = 24;
		var_11 = 10;
	}
	else
	{
		var_10 = 8;
		var_11 = 6;
	}

	level.var_8696 = lib_A5FA::func_894A("sd_drone_queen1",undefined,var_10,var_11);
	common_scripts\utility::flag_wait("sd_trigger_drone_evade");
	lib_A59A::func_1143();
	level.var_A31B.ignoreall = 1;
	level.var_21DF.ignoreall = 1;
	level.var_520E.ignoreall = 1;
	lib_A59A::func_1332("allies");
	foreach(var_15, var_13 in level.var_8696.var_86B4)
	{
		var_14 = var_13.var_38E4.var_1522;
		var_14.var_59F4 = 6400;
		var_14.var_58DE = 20;
	}

	var_16 = getent("queen_drone_cloud_evade","targetname");
	wait(2);
	common_scripts\utility::flag_wait("sd_snake_swarm_entered");
	thread lib_A56F::func_97FE("trig_updstairs_window_retreat");
	level.var_8696 thread lib_A5FA::func_8698("sd_snake_swarm_window_path1",undefined,3);
	foreach(var_13 in level.var_8696.var_86B4)
	{
		var_14 = var_13.var_38E4.var_1522;
		var_14.var_59F4 = 6400;
		var_14.var_58DE = 30;
	}

	level.var_8696 func_1A75();
}

//Function Number: 102
func_456E()
{
	var_00 = getnodearray("node_smoke_laser_ambush_sd","targetname");
	var_01 = getentarray("enemy_laser_smoke_ambush_sd","targetname");
	var_02 = [];
	foreach(var_06, var_04 in var_01)
	{
		var_05 = var_04 lib_A56F::func_72C(1);
		var_05 func_7E61(var_00[var_06]);
		var_02[var_02.size] = var_05;
	}

	while(var_02.size > 2)
	{
		var_02 = lib_A59A::func_CFF(var_02);
		wait 0.05;
	}

	lib_A59A::func_70A("trigger_allies_to_swarm_evade_stairs");
	wait(3);
	foreach(var_05 in var_02)
	{
		if(isdefined(var_05))
		{
			var_05 method_8052();
		}

		wait(randomfloat(3));
	}
}

//Function Number: 103
func_7E61(param_00)
{
	lib_A59A::func_30AF();
	self.var_1C7 = 196;
	self.var_1D3 = 0;
	thread lib_A59A::func_2AB0();
	if(common_scripts\utility::cointoss())
	{
		thread maps\seoul_code_gangnam::func_39BF();
	}

	if(isdefined(param_00))
	{
		self method_81A5(param_00);
	}
}

//Function Number: 104
func_4559()
{
	var_00 = func_3E63(1);
	var_01 = func_3E63(2);
	var_02 = func_3E63(3);
	var_03 = func_3E63(4);
	var_04 = func_3E63(5);
	function_0070("smoke_grenade_cheap",var_02[1].var_2E6,var_02[1].var_2E6 + (0,0,300),1,0);
	lib_A5DE::snd_message("seo_smoke_grenade_ambush",var_02[1].var_2E6 + (0,0,300),1);
	wait(0.5);
	level notify("smoke_thrown_sd");
	function_0070("smoke_grenade_cheap",var_01[1].var_2E6,var_01[1].var_2E6 + (0,0,300),1,0);
	lib_A5DE::snd_message("seo_smoke_grenade_ambush",var_01[1].var_2E6 + (0,0,300),1);
	wait(1);
}

//Function Number: 105
func_3E63(param_00)
{
	var_01 = "struct_drone_smoke_0" + param_00 + "a";
	var_02 = "struct_drone_smoke_0" + param_00 + "b";
	var_03 = [];
	var_03[0] = common_scripts\utility::getstruct(var_01,"targetname");
	var_03[1] = common_scripts\utility::getstruct(var_02,"targetname");
	return var_03;
}

//Function Number: 106
func_7B55()
{
	if(level.currentgen && !issubstr(level.var_9704,"_shopping"))
	{
		level waittill("transients_subway_to_shopping_dist");
	}

	var_00 = getentarray("brush_glass_smash_drone","targetname");
	var_01 = getentarray("brush_panel","targetname");
	common_scripts\utility::array_call(var_00,::hide);
	foreach(var_03 in var_01)
	{
		var_03.var_6668 = "still";
		var_03.var_6667 = getent(var_03.target,"targetname");
		var_03.var_6667 linkto(var_03);
		var_03.var_6667 hide();
		var_03.var_6667.state = "notsmashed";
	}

	for(;;)
	{
		level waittill("drone_kamikaze_crash",var_05);
		var_06 = randomint(3);
		var_00 = common_scripts\utility::array_removeundefined(var_00);
		var_00 = lib_A56F::func_888D(var_00,var_05);
		var_01 = lib_A56F::func_888D(var_01,var_05);
		var_07 = lib_A56F::func_888D(var_01,var_05);
		for(var_08 = 0;var_08 < var_06;var_08++)
		{
			if(isdefined(var_00[var_08]) && distance(var_00[var_08].var_2E6,var_05) < 100)
			{
				if(!isdefined(var_00[var_08].var_8673) || var_00[var_08].var_8673 != 1)
				{
					var_00[var_08] show();
					lib_A5DE::snd_message("shopping_district_glass_smashed",var_00[var_08].var_2E6);
					var_00[var_08].var_8673 = 1;
				}
				else
				{
					lib_A5DE::snd_message("shopping_district_glass_hit_after_smashed",var_00[var_08].var_2E6);
				}
			}

			if(distance(var_01[var_08].var_2E6,var_05) < 100)
			{
				var_01[var_08] thread func_7B5B();
			}
		}
	}
}

//Function Number: 107
func_7B5B()
{
	if(self.var_6668 == "still")
	{
		self.var_6668 = "moving";
		var_00 = 0.2;
		if(self.var_6667.state == "notsmashed")
		{
			lib_A5DE::snd_message("shopping_district_panel_smashed",self.var_2E6);
			self.var_6667.state = "smashed";
		}

		self.var_6667 show();
		lib_A5DE::snd_message("shopping_district_panel_swing",self.var_2E6);
		self.var_6598 = self.var_41;
		self rotateby((0,randomfloatrange(5,10),0),var_00,0,0.1);
		wait(var_00);
		self rotateby((0,-1 * randomfloatrange(5,10),0),var_00,0,0.1);
		wait(var_00);
		self rotateto(self.var_6598,var_00,0,0.1);
		wait(var_00);
		self.var_6668 = "still";
	}
}

//Function Number: 108
func_7B4E(param_00,param_01)
{
	level endon("end_kamikaze_newstyle");
	for(;;)
	{
		var_02 = lib_A56F::func_888D(level.var_38E5,level.var_31D.var_2E6);
		var_03 = randomint(2);
		for(var_04 = 0;var_04 < var_03;var_04++)
		{
			if(!isdefined(var_02[var_04]) || isdefined(var_02[var_04].var_E42))
			{
				continue;
			}

			var_02[var_04] thread lib_A5F8::func_2E7E(param_01,param_00);
			var_02[var_04].var_E42 = 1;
			if(level.var_31D istouching(param_00))
			{
				wait(randomfloatrange(0.1,0.2));
				continue;
			}

			wait(randomfloatrange(0.25,0.5));
		}

		wait(0.5);
	}
}

//Function Number: 109
func_7B62(param_00)
{
	level endon("end_crash_into_player");
	for(;;)
	{
		foreach(var_02 in level.var_86B4)
		{
			if(isdefined(var_02))
			{
				while(distance(var_02.var_2E6,level.var_31D geteye()) < 300)
				{
					lib_A5F8::func_3997(common_scripts\utility::random(param_00));
					wait(randomfloatrange(0.3,0.75));
				}
			}
		}

		wait 0.05;
	}
}

//Function Number: 110
func_1A99()
{
	thread func_1A87();
	thread func_1AAB();
	common_scripts\utility::flag_wait("sd_street_combat_complete");
	if(level.currentgen)
	{
		var_00 = ["enemy_canal_bridge1"];
		thread lib_A50E::func_1C32("dialogue_performing_arts_exit",var_00,15,0);
	}

	if(level.currentgen && !issubstr(level.var_9704,"_overlookbar"))
	{
		level waittill("transients_canal_overlook_to_riverwalk");
	}

	thread func_1A66();
	thread func_1AA8();
	level.var_A31B.ignoreall = 1;
	level.var_21DF.ignoreall = 1;
	level.var_520E.ignoreall = 1;
	lib_A59A::func_1332("allies");
	thread func_1A5A();
	thread func_7B63("trig_canal_bridge_reinforcements1","canal_bridge_reinforcements1",1);
	thread func_7B63("trig_canal_bridge_reinforcements2","canal_bridge_reinforcements2",1);
	thread func_1A98();
	var_01 = getent("enemy_sd_vehicle1","targetname");
	var_02 = getent("enemy_sd_vehicle3","targetname");
	var_03 = getentarray("zipline_cables","script_noteworthy");
	if(isdefined(var_03))
	{
		foreach(var_05 in var_03)
		{
			var_05 hide();
		}
	}

	var_07 = getentarray("color_ents_pt2","script_noteworthy");
	common_scripts\utility::array_thread(var_07,::common_scripts\utility::trigger_off);
}

//Function Number: 111
func_86D8()
{
	lib_A56F::func_A0B9("trig_canal_reach_waterfall");
	lib_A5DE::snd_music_message("mus_canal_combat_done");
}

//Function Number: 112
func_1A87()
{
	var_00 = getentarray("canal_door_shields","script_noteworthy");
	common_scripts\utility::array_thread(var_00,::lib_A59A::func_484A);
	lib_A56F::func_A0B9("trig_canal_dead_demo_team1");
	common_scripts\utility::array_thread(var_00,::lib_A59A::func_84C4);
	var_01 = getentarray("trig_door_shield","targetname");
	foreach(var_03 in var_01)
	{
		var_03 thread func_1A70();
	}
}

//Function Number: 113
func_1A70()
{
	var_00 = lib_A571::func_48BF("x");
	self waittill("trigger");
	if(isdefined(var_00))
	{
		var_00 lib_A571::func_48B3();
	}
}

//Function Number: 114
func_1A9F()
{
	if(level.currentgen && !issubstr(level.var_9704,"_riverwalk"))
	{
		level waittill("transients_canal_overlook_to_riverwalk");
	}

	var_00 = getentarray("canal_vehicle2_passengers","script_noteworthy");
	lib_A59A::func_D0C("canal_vehicle2_passengers",::func_1AA0);
	var_01 = getent("enemy_sd_vehicle2","targetname");
	level.var_2186[1] = lib_A59E::func_8973("enemy_sd_vehicle2");
	foreach(var_03 in level.var_2186[1].var_7507)
	{
		if(var_03.var_9D13 == 3)
		{
			var_04 = var_03;
		}
	}

	level.var_2186[1] waittill("reached_end_node");
	level.var_2186[1] lib_A59E::func_9D5F("all_but_gunner");
}

//Function Number: 115
func_1AA0()
{
	self.ignoreall = 1;
	self.var_1D3 = 0;
	if(!isdefined(level.var_17F7))
	{
		level.var_17F7 = [];
	}

	level.var_17F7[level.var_17F7.size] = self;
}

//Function Number: 116
func_1A6D()
{
	common_scripts\utility::flag_wait("sd_escaped_swarm");
	lib_A59A::func_1143();
	common_scripts\utility::flag_set("objective_canal_stairs_bottom_reached");
	level.var_31D.var_84D9 = 0;
	lib_A56F::func_A0B9("trig_canal_reach_upstairs");
	common_scripts\utility::flag_set("show_canal_weapon_platform");
	common_scripts\utility::flag_set("objective_canal_stairs_top_reached");
	level.var_A31B lib_A59A::func_30AF();
	level.var_21DF lib_A59A::func_30AF();
	level.var_520E lib_A59A::func_30AF();
	common_scripts\utility::flag_set("vo_canal_call_to_window");
	common_scripts\utility::flag_set("canal_window_check_on");
	var_00 = common_scripts\utility::getstruct("canal_objective_convo","targetname");
	var_01 = var_00 common_scripts\utility::spawn_tag_origin();
	var_02 = common_scripts\utility::getstruct("struct_canal_upstairs_convo_will","targetname");
	var_03 = common_scripts\utility::getstruct("struct_canal_upstairs_convo_jackson","targetname");
	var_01 thread func_1A6C();
	thread func_2AED();
	lib_A56F::func_A0B9("trig_updstairs_window_approach");
	common_scripts\utility::flag_set("canal_start_drone_travel");
	common_scripts\utility::flag_wait("canal_reached_window");
	common_scripts\utility::flag_set("objective_sd_cormack_convo_complete");
	common_scripts\utility::flag_set("no_land_assist_hint");
	level.var_31D lib_A571::func_825E(1);
	lib_A561::func_6AFB();
	var_04 = lib_A59A::func_88CB("player_arms",level.var_31D.var_2E6,level.var_31D.angle);
	var_05 = lib_A59A::func_88CB("binocs");
	var_06 = [var_04,var_05];
	var_01 lib_A506::func_BC5(var_06,"seo_canal_debrief_scanning_intro_vm");
	var_04 hide();
	lib_A5DE::snd_message("seo_binocs_equip");
	var_05 hide();
	var_07 = 0.3;
	level.var_31D playerlinktoblend(var_04,"tag_player",var_07);
	var_04 common_scripts\utility::delaycall(var_07,::show);
	var_05 common_scripts\utility::delaycall(var_07,::show);
	level.var_31D common_scripts\utility::delaycall(var_07,::playerlinktoabsolute,var_04,"tag_player");
	var_01 thread lib_A506::func_C18(var_06,"seo_canal_debrief_scanning_intro_vm");
	var_08 = lib_A59A::func_3EF4("seo_canal_debrief_scanning_intro_vm",var_04.animname);
	var_09 = function_0063(var_08);
	var_01 func_1A89(var_04,var_09);
	var_0A = common_scripts\utility::getstruct("struct_start_canal2_jackson","targetname");
	level.var_A31B method_81C6(var_0A.var_2E6,var_0A.var_41);
	level.var_A31B.ignoreall = 0;
	level.var_A31B.var_98 = 1;
	var_0B = getnode("canal_will_cover1","targetname");
	level.var_A31B lib_A59A::func_7E48(15);
	level.var_A31B lib_A59A::func_7E45(var_0B);
	level.var_31D unlink();
	level.var_31D method_8031(65,0);
	var_01 notify("stop_loop");
	var_01 lib_A59A::func_C3D();
	level.var_31D playerlinktoblend(var_04,"tag_player",0.3);
	var_01 lib_A506::func_C18(var_06,"seo_canal_debrief_scanning_outro_vm");
	common_scripts\utility::flag_wait("demo_team_seen");
	common_scripts\utility::flag_set("canal_strategy_scene_complete");
	common_scripts\utility::flag_clear("no_land_assist_hint");
	level.var_31D notify("canal_intro_scene_done");
	var_02 notify("convo_complete");
	var_03 notify("convo_complete");
	var_01 notify("stop_loop");
	level.var_21DF lib_A59A::func_C3D();
	level.var_21DF.var_5877 = [];
	level.var_21DF.var_588C = 0;
	level.var_21DF method_81A6(level.var_21DF.var_2E6);
	level.var_21DF.var_1C7 = 512;
	level.var_31D unlink();
	var_04 delete();
	var_05 delete();
	level.var_31D method_8031(65,0.5);
	lib_A59A::func_114E();
}

//Function Number: 117
func_2AED()
{
	level.var_31D endon("canal_intro_scene_done");
	for(;;)
	{
		lib_A56F::func_A0B9("trig_updstairs_window_approach");
		level.var_31D method_8130(0);
		level.var_31D disableweapons();
		level.var_31D disableoffhandweapons();
		lib_A56F::func_A0B9("trig_updstairs_window_retreat");
		level.var_31D method_8130(1);
		level.var_31D enableweapons();
		level.var_31D enableoffhandweapons();
	}
}

//Function Number: 118
func_1A6C()
{
	thread lib_A506::func_BFF(level.var_21DF,"seo_canal_debrief_intro_cormack",undefined,1);
	var_00 = level.var_21DF common_scripts\utility::waittill_any_return("anim_reach_complete","override_anim_reach_play_binoc_scene");
	var_01 = ["seo_crk_overheremitchell","seo_crk_mitchellmoveit"];
	thread lib_A571::func_2A37(level.var_21DF,"canal_reached_window",var_01);
	if(var_00 == "override_anim_reach_play_binoc_scene")
	{
		lib_A506::func_BC7(level.var_21DF,"seo_canal_debrief_intro_cormack");
	}

	lib_A506::func_C24(level.var_21DF,"seo_canal_debrief_intro_cormack");
	lib_A506::func_BE1(level.var_21DF,"seo_canal_debrief_kneeling_idle_cormack");
}

//Function Number: 119
func_1A89(param_00,param_01)
{
	wait(param_01 - 0.8);
	thread func_1A5C();
	thread maps\seoul_lighting::func_147A();
	thread maps\seoul_lighting::func_1479();
	thread maps\seoul_lighting::func_147B();
	wait(0.6);
	thread lib_A506::func_BE1(param_00,"seo_canal_debrief_scanning_start_loop_vm");
	level.var_21DF notify("override_anim_reach_play_binoc_scene");
	wait(1);
	common_scripts\utility::flag_set("vo_canal_strategy_scene");
	wait(0.5);
	self notify("stop_loop");
	param_00 lib_A59A::func_C3D();
	self method_8141();
	thread lib_A506::func_BE1(param_00,"seo_canal_debrief_scanning_platform_loop_vm");
	thread func_1A6B();
	common_scripts\utility::flag_wait("vo_havoc_launcher_line_done");
	self notify("stop_loop");
	param_00 lib_A59A::func_C3D();
	self method_8141();
	thread func_1A6A();
	lib_A506::func_C24(param_00,"seo_canal_debrief_scanning_platform_to_demoteam_vm");
	thread func_1A8A();
	wait(0.5);
	self notify("stop_loop");
	param_00 lib_A59A::func_C3D();
	self method_8141();
	thread lib_A506::func_BE1(param_00,"seo_canal_debrief_scanning_demoteam_loop_vm");
	common_scripts\utility::flag_wait("vo_demo_team_lines_done");
	level.var_31D method_8031(45,0.5);
	var_02 = level.var_31D common_scripts\utility::spawn_tag_origin();
	level.var_31D unlink();
	level.var_31D playerlinktodelta(param_00,"tag_player",1,25,60,30,25);
	thread func_1A59();
	thread func_1A5B();
	wait(1);
	common_scripts\utility::flag_wait("demo_team_seen");
	level notify("end_fovzoom");
	thread func_1A5D();
	wait(0.5);
}

//Function Number: 120
func_1A5C()
{
	var_00 = 0.5;
	var_01 = newhudelem();
	var_01.x = 0;
	var_01.y = 0;
	var_01.horzalign = "fullscreen";
	var_01.vertalign = "fullscreen";
	var_01 setshader("black",640,480);
	var_02 = newhudelem();
	var_02.x = 0;
	var_02.y = 0;
	var_02.horzalign = "fullscreen";
	var_02.vertalign = "fullscreen";
	var_02 setshader("white",640,480);
	level.var_1475[1] = newhudelem();
	level.var_1475[1].x = 0;
	level.var_1475[1].y = 0;
	level.var_1475[1].horzalign = "fullscreen";
	level.var_1475[1].vertalign = "fullscreen";
	level.var_1475[1] setshader("ugv_vignette_overlay",640,480);
	if(isdefined(var_00) && var_00 > 0)
	{
		level.var_1475[1].alpha = 0;
		var_02.alpha = 0;
		var_01.alpha = 0;
		var_01 fadeovertime(var_00);
		var_01.alpha = 1;
		wait(var_00);
		thread func_1A69();
		var_02.alpha = 0;
		var_02 fadeovertime(0.5);
		var_02.alpha = 1;
		wait(var_00);
		var_01.alpha = 0;
		level.var_1475[1].alpha = 1;
		var_02.alpha = 1;
		var_02 fadeovertime(var_00 + 0.5);
		var_02.alpha = 0;
		wait(var_00 + 0.5);
	}

	var_02 destroy();
	var_01 destroy();
}

//Function Number: 121
func_1A5D()
{
	var_00 = 0.5;
	var_01 = newhudelem();
	var_01.x = 0;
	var_01.y = 0;
	var_01.horzalign = "fullscreen";
	var_01.vertalign = "fullscreen";
	var_01 setshader("black",640,480);
	if(isdefined(var_00) && var_00 > 0)
	{
		var_01.alpha = 0;
		var_01 fadeovertime(var_00);
		var_01.alpha = 1;
		lib_A5DE::snd_message("binocs_put_away");
		wait(var_00);
		level.var_1475[1] destroy();
		var_01.alpha = 1;
		var_01 fadeovertime(var_00);
		var_01.alpha = 0;
		wait(var_00);
	}

	var_01 destroy();
}

//Function Number: 122
func_456F()
{
	level endon("end_fovzoom");
	var_00 = getentarray("ammo_cache","targetname");
	var_01 = getentarray("smart_grenade_launcher","targetname");
	var_00 = common_scripts\utility::array_combine(var_00,var_01);
	for(;;)
	{
		var_02 = function_00D6("axis");
		foreach(var_04 in var_02)
		{
			if(!isdefined(var_04.var_76D9))
			{
				var_04.var_76D9 = 1;
				var_04 thread func_459F();
				var_04 thread func_7360();
			}
		}

		foreach(var_07 in var_00)
		{
			if(!isdefined(var_07.var_76D9))
			{
				var_07.var_76D9 = 1;
				var_07 thread func_459F(6);
				var_07 thread func_7360();
			}
		}

		wait(0.1);
	}
}

//Function Number: 123
func_7360()
{
	level waittill("end_fovzoom");
	if(isdefined(self))
	{
		self hudoutlinedisable();
		self.var_76D9 = undefined;
	}
}

//Function Number: 124
func_459F(param_00)
{
	level endon("end_fovzoom");
	level.var_31D.var_24E7 = 65;
	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	for(;;)
	{
		if(lib_A571::func_3312(self,level.var_31D,level.var_31D.var_24E7,115))
		{
			self hudoutlineenable(param_00,1);
		}
		else
		{
			self hudoutlinedisable();
		}

		wait(0.1);
	}
}

//Function Number: 125
func_1A59()
{
	level endon("end_fovzoom");
	thread func_456F();
	var_00 = 65;
	var_01 = 5;
	var_02 = 10;
	var_03 = 3;
	var_04 = 0.05;
	var_05 = 0;
	while(!common_scripts\utility::flag("canal_strategy_scene_complete"))
	{
		wait 0.05;
		var_06 = level.var_31D getnormalizedmovement();
		if(var_06[0] > 0.2 && var_02 - var_03 > var_01)
		{
			var_02 = var_02 - var_03;
			var_04 = 0.05;
			if(var_05 != 1)
			{
				lib_A5DE::snd_message("canal_binocs_stop_zoom_out");
				lib_A5DE::snd_message("canal_binocs_zoom_in");
				var_05 = 1;
			}
		}
		else if(var_06[0] < -0.2 && var_02 + var_03 < var_00)
		{
			var_02 = var_02 + var_03;
			var_04 = 0.05;
			if(var_05 != -1)
			{
				lib_A5DE::snd_message("canal_binocs_stop_zoom_in");
				lib_A5DE::snd_message("canal_binocs_zoom_out");
				var_05 = -1;
			}
		}
		else if(var_06[0] == 0 && var_02 + var_03 < var_00)
		{
			wait 0.05;
		}
		else if(var_05 != 0)
		{
			lib_A5DE::snd_message("canal_binocs_stop_zoom_in");
			lib_A5DE::snd_message("canal_binocs_stop_zoom_out");
			var_05 = 0;
		}

		level.var_31D.var_24E7 = var_02;
		level.var_31D thread lib_A59A::func_5686(var_04,var_02);
	}
}

//Function Number: 126
func_1474()
{
	if(length(level.var_31D getnormalizedcameramovement()) > 0.1)
	{
		level.var_31D.var_1476 = 1;
	}

	if(length(level.var_31D getnormalizedmovement()) > 0.1)
	{
		level.var_31D.var_1477 = 1;
	}

	if(isdefined(level.var_31D.var_1477) && isdefined(level.var_31D.var_1476))
	{
		return 1;
	}

	return 0;
}

//Function Number: 127
func_1A5B()
{
	level endon("end_fovzoom");
	lib_A59A::func_48F6("binoc_controls",4);
}

//Function Number: 128
func_1A8A()
{
	foreach(var_01 in level.var_2633)
	{
		if(isdefined(var_01))
		{
			var_01 hudoutlineenable(4,1);
		}

		wait(0.1);
	}

	common_scripts\utility::flag_wait("demo_team_seen");
	foreach(var_01 in level.var_2633)
	{
		if(isdefined(var_01))
		{
			var_01 hudoutlinedisable();
		}
	}
}

//Function Number: 129
func_1A69(param_00)
{
	var_01 = 45;
	level.var_31D method_8031(45,0.5);
}

//Function Number: 130
func_1A6B(param_00)
{
	var_01 = 35;
	level.var_31D method_8031(45,0.5);
	wait(0.5);
	lib_A5DE::snd_message("canal_binocs_zoom_in");
	level.var_31D method_8031(20,0.5);
	wait(0.5);
	lib_A5DE::snd_message("canal_binocs_stop_zoom_in");
	level.var_31D method_8031(25,0.5);
	lib_A5DE::snd_message("canal_binocs_zoom_out");
	wait(0.5);
	lib_A5DE::snd_message("canal_binocs_stop_zoom_out");
}

//Function Number: 131
func_1A6A(param_00)
{
	var_01 = 25;
	lib_A5DE::snd_message("canal_binocs_zoom_out");
	level.var_31D method_8031(45,0.5);
	wait(0.5);
	lib_A5DE::snd_message("canal_binocs_stop_zoom_out");
	wait(0.5);
	lib_A5DE::snd_message("canal_binocs_zoom_in");
	level.var_31D method_8031(15,1);
	wait(1);
	lib_A5DE::snd_message("canal_binocs_stop_zoom_in");
	lib_A5DE::snd_message("canal_binocs_zoom_out");
	level.var_31D method_8031(20,0.5);
	wait(0.5);
	lib_A5DE::snd_message("canal_binocs_stop_zoom_out");
	wait(0.5);
	lib_A5DE::snd_message("canal_binocs_zoom_in");
	level.var_31D method_8031(10,1);
	wait(1);
	lib_A5DE::snd_message("canal_binocs_stop_zoom_in");
}

//Function Number: 132
func_1A68(param_00)
{
	if(!isdefined(level.var_658E))
	{
		level.var_658E = 65;
	}

	level.var_31D method_8031(level.var_658E,0.5);
}

//Function Number: 133
func_1AA3()
{
	for(var_00 = 0;!common_scripts\utility::flag("shut_down_panel");var_00 = 0)
	{
		func_6666();
		wait(randomfloatrange(1,3));
		while(var_00 < randomintrange(3,6))
		{
			func_6665();
			wait(randomfloatrange(0.05,0.1));
			func_6666();
			wait(randomfloatrange(0.5,1.5));
			var_00++;
		}
	}

	func_6665();
	wait(randomfloatrange(0.1,0.3));
	func_6666();
	wait(0.5);
	func_6665();
	wait(randomfloatrange(0.1,0.3));
	func_6666();
	wait(0.5);
	func_6665();
}

//Function Number: 134
func_6665()
{
	if(level.currentgen)
	{
		level waittill("transients_subway_to_shopping_dist");
	}

	var_00 = getent("canal_vista_panel_on","targetname");
	var_01 = getent("canal_vista_panel_off","targetname");
	var_01 show();
	var_00 hide();
}

//Function Number: 135
func_6666()
{
	if(level.currentgen)
	{
		level waittill("transients_subway_to_shopping_dist");
	}

	var_00 = getent("canal_vista_panel_on","targetname");
	var_01 = getent("canal_vista_panel_off","targetname");
	var_01 hide();
	var_00 show();
}

//Function Number: 136
func_1A66()
{
	while(level.currentgen && !function_021E("seoul_canal_overlook_bar_tr"))
	{
		wait(0.05);
	}

	level.var_17F7 = [];
	var_00 = 5;
	var_01 = getent("sd_goal_bridge1","targetname");
	var_02 = getent("sd_goal_bridge1_retreat","targetname");
	lib_A59A::func_D0C("enemy_canal_bridge1",::func_1A65);
	var_03 = lib_A59A::func_D0E("enemy_canal_bridge1",1);
	common_scripts\utility::flag_wait("wakeup_canal_patrols");
	level.var_17F7 = lib_A59A::func_CFF(level.var_17F7);
	foreach(var_05 in level.var_17F7)
	{
		var_05.ignoreall = 0;
		var_05 notify("end_patrol");
		var_05 notify("stop_going_to_node");
		if(isdefined(var_01))
		{
			var_05 method_81A9(var_01);
		}

		var_05.target = undefined;
		var_05 thread func_1C69();
		var_05 lib_A59A::func_749(::func_1A77);
	}

	while(level.var_17F7.size > var_00)
	{
		level.var_17F7 = lib_A59A::func_CFF(level.var_17F7);
		wait(0.05);
	}

	if(isdefined(var_02))
	{
		level.var_17F7 = lib_A59A::func_CFF(level.var_17F7);
		foreach(var_05 in level.var_17F7)
		{
			var_05 method_81A9(var_02);
		}
	}
}

//Function Number: 137
func_1A77(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(param_01 == level.var_31D)
	{
		self notify("notice_player");
	}

	if(!common_scripts\utility::flag("bombs_picked_up"))
	{
		if(param_01 == level.var_21DF || param_01 == level.var_520E)
		{
			if(self.health > 0)
			{
				self.health = self.health + int(param_00 * 0.5);
				return;
			}
		}
	}
}

//Function Number: 138
func_1A65()
{
	self.ignoreall = 1;
	self.var_6716 = undefined;
	self.var_6715 = undefined;
	self.var_1D3 = 0;
	level.var_17F7[level.var_17F7.size] = self;
	self.var_7ADB = 1;
	thread lib_A555::func_66F9();
}

//Function Number: 139
func_1AA8()
{
	createthreatbiasgroup("cormack_group");
	createthreatbiasgroup("weapon_platform_guards");
	createthreatbiasgroup("player_and_will");
	level.var_31D sentient_setthreatbiasgroup("player_and_will");
	level.var_A31B sentient_setthreatbiasgroup("player_and_will");
	var_00 = lib_A59A::func_D0E("enemy_canal_wall1L",1);
	var_01 = lib_A59A::func_D0E("enemy_canal_wall1R",1);
	var_02 = common_scripts\utility::array_combine(var_00,var_01);
	var_03 = getent("sd_goal_wallL","targetname");
	var_04 = getent("sd_goal_wallR","targetname");
	foreach(var_06 in var_02)
	{
		var_06.ignoreall = 1;
		var_06.var_6716 = undefined;
		var_06.var_6715 = undefined;
		var_06.var_1D3 = 0;
		var_06.var_7ADB = 1;
		var_06 thread lib_A555::func_66F9();
		var_06 thread func_1C69();
		var_06 lib_A59A::func_749(::func_1A77);
		wait(0.05);
	}

	common_scripts\utility::flag_wait("wakeup_canal_patrols");
	foreach(var_06 in var_02)
	{
		var_06.ignoreall = 0;
		var_06 notify("end_patrol");
		var_06 notify("stop_going_to_node");
		var_06.target = undefined;
		var_06.var_1D3 = 0;
		var_06 sentient_setthreatbiasgroup("weapon_platform_guards");
	}

	level.var_21DF sentient_setthreatbiasgroup("cormack_group");
	level.var_520E sentient_setthreatbiasgroup("cormack_group");
	setthreatbias("cormack_group","weapon_platform_guards",10000);
	setthreatbias("weapon_platform_guards","cormack_group",10000);
	foreach(var_06 in var_00)
	{
		var_06 method_81A9(var_03);
		var_06 thread func_1AA5();
	}

	foreach(var_06 in var_01)
	{
		var_06 method_81A9(var_04);
		var_06 thread func_1AA5();
	}

	common_scripts\utility::flag_wait("bombs_picked_up");
	lib_A56F::func_A0B9("trig_canal_reach_waterfall");
	var_0E = lib_A59A::func_CFF(var_02);
	foreach(var_06 in var_02)
	{
		if(isalive(var_06))
		{
			var_06 func_14BC();
			wait(randomfloatrange(0.3,0.5));
		}

		var_02 = lib_A59A::func_CFF(var_02);
	}
}

//Function Number: 140
func_1AA5()
{
	self endon("death");
	thread func_1AA4();
	self waittill("notice_player");
	self sentient_setthreatbiasgroup("axis");
	self getenemyinfo(level.var_31D);
	self.favoriteenemy = level.var_31D;
}

//Function Number: 141
func_1AA4()
{
	self endon("death");
	level endon("notice_player");
	level.var_31D endon("death");
	while(distancesquared(level.var_31D.var_2E6,self.var_2E6) > squared(450))
	{
		wait(0.25);
	}

	self notify("notice_player");
}

//Function Number: 142
func_1A71()
{
	level.var_3205 = [];
	var_00 = getent("enemy_canal_drone_controller","targetname");
	var_01 = getent("enemy_canal_guard1","targetname");
	var_00 = var_00 lib_A59A::func_88BD(1);
	var_01 = var_01 lib_A59A::func_88BD(1);
	level.var_3205[level.var_3205.size] = var_00;
	level.var_3205[level.var_3205.size] = var_01;
	var_02 = getnode("cover_prone_other_guy","targetname");
	var_03 = getnode("cover_prone_cormack","targetname");
	var_02 disconnectnode();
	var_03 disconnectnode();
	foreach(var_05 in level.var_3205)
	{
		var_05 thread func_1A72();
	}

	while(level.var_3205.size > 1)
	{
		level.var_3205 = lib_A59A::func_CFF(level.var_3205);
		wait(0.05);
	}

	wait(1);
	foreach(var_05 in level.var_3205)
	{
		var_05.ignoreall = 0;
		var_05 notify("wakeup");
		magicbullet(level.var_A31B.weapon,level.var_A31B gettagorigin("tag_flash"),var_05 geteye());
	}

	var_09 = common_scripts\utility::getstruct("sd_fake_shot_glass","targetname");
	magicbullet(level.var_520E.weapon,level.var_520E gettagorigin("tag_flash"),var_09.var_2E6);
	while(level.var_3205.size > 0)
	{
		level.var_3205 = lib_A59A::func_CFF(level.var_3205);
		wait(0.05);
	}

	var_02 connectnode();
	var_03 connectnode();
}

//Function Number: 143
func_1A72()
{
	self.ignoreall = 1;
	self.var_1D3 = 0;
	self.var_31 = 1;
	if(level.gameskill <= 1)
	{
		self.health = 1;
	}

	thread func_1A73();
	thread func_1A83();
	self method_8041("grenade danger");
	self method_8041("gunshot");
	self method_8041("bulletwhizby");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"death");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"damage");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"ai_event");
	lib_A59A::func_75F(::common_scripts\utility::flag_set,"wakeup_drone_guards");
	thread lib_A59A::func_2BDC();
	common_scripts\utility::flag_wait("wakeup_drone_guards");
	self.ignoreall = 0;
	self method_8141();
	func_7375();
	self getenemyinfo(level.var_31D);
	self notify("stop_going_to_node");
	var_00 = common_scripts\utility::getstruct(self.target,"targetname");
	var_00 notify("wakeup_drone_guards");
}

//Function Number: 144
func_1A83()
{
	self endon("death");
	level endon("wakeup_drone_guards");
	level.var_31D endon("death");
	while(distancesquared(level.var_31D.var_2E6,self.var_2E6) > squared(350))
	{
		wait(0.25);
	}

	common_scripts\utility::flag_set("wakeup_drone_guards");
}

//Function Number: 145
func_1A73()
{
	self endon("death");
	self endon("wakeup_drone_guards");
	var_00 = common_scripts\utility::getstruct(self.target,"targetname");
	var_00 lib_A506::func_BCE(self,var_00.animation,"wakeup_drone_guards");
}

//Function Number: 146
func_6035()
{
	var_00 = getent("trig_pick_up_charges","targetname");
	var_00 waittill("trigger");
	if(common_scripts\utility::flag("bombs_reached"))
	{
		return;
	}

	var_01 = ["seo_wil_getthecharges","seo_wil_grabthosecharges"];
	thread lib_A571::func_2A37(level,"bombs_reached",var_01);
}

//Function Number: 147
func_1A79()
{
	common_scripts\utility::flag_wait("canal_strategy_scene_complete");
	common_scripts\utility::flag_clear("flag_autofocus_binoc_on");
	thread func_7342();
	thread func_6035();
	level.var_A31B.ignoreall = 0;
	level.var_A31B.var_98 = 1;
	level.var_21DF.ignoreall = 0;
	level.var_520E.ignoreall = 0;
	level.var_21DF.var_202 = 1;
	level.var_520E.var_202 = 1;
	level.var_A31B lib_A59A::func_2A8C();
	level.var_21DF lib_A59A::func_2A8C();
	level.var_520E lib_A59A::func_2A8C();
	lib_A59A::func_1333("allies");
	var_00 = common_scripts\utility::getstruct("struct_canal_upstairs_convo_will","targetname");
	var_01 = common_scripts\utility::getstruct("struct_canal_upstairs_convo_cormack","targetname");
	var_02 = common_scripts\utility::getstruct("struct_canal_upstairs_convo_jackson","targetname");
	var_00 notify("convo_complete");
	var_01 notify("convo_complete");
	var_02 notify("convo_complete");
	var_03 = getent("canal_window_blocker","targetname");
	var_03 connectpaths();
	var_03 delete();
	level.var_31D.var_84D9 = 1;
	if(!isdefined(level.var_6BDB))
	{
		level.var_6BDB = missilecreaterepulsorent(level.var_31D,10000,500);
	}

	var_04 = getnode("canal_will_cover1","targetname");
	level.var_A31B lib_A59A::func_7E48(15);
	level.var_A31B lib_A59A::func_7E45(var_04);
	var_05 = getnode("cover_prone_cormack","targetname");
	var_06 = getnode("cover_prone_other_guy","targetname");
	level.var_21DF lib_A59A::func_7E48(15);
	level.var_520E lib_A59A::func_7E48(15);
	level.var_21DF lib_A59A::func_7E45(var_05);
	level.var_520E lib_A59A::func_7E45(var_06);
	wait(0.5);
	level.var_31D lib_A571::func_825D();
	lib_A561::func_6AF5();
	wait(3);
	common_scripts\utility::flag_set("wakeup_canal_patrols");
	common_scripts\utility::flag_wait("canal_jump_complete");
	wait(2.5);
	lib_A59A::func_1143();
	common_scripts\utility::flag_wait("bombs_reached");
	common_scripts\utility::flag_set("vo_canal_grab_explosives");
	var_07 = ["seo_wil_getthecharges","seo_wil_grabthosecharges"];
	thread lib_A571::func_2A37(level.var_A31B,"bombs_picked_up",var_07);
	common_scripts\utility::flag_wait("bombs_picked_up");
	common_scripts\utility::flag_set("objective_sd_pick_up_bombs");
	common_scripts\utility::flag_set("spawn_canal_razorback");
}

//Function Number: 148
func_7342()
{
	var_00 = getentarray("vol_dropped_gun_check_volume","targetname");
	for(;;)
	{
		foreach(var_02 in var_00)
		{
			var_03 = getweaponarray();
			foreach(var_05 in var_03)
			{
				if(var_05 istouching(var_02))
				{
					var_05 delete();
				}
			}
		}

		wait(0.25);
	}
}

//Function Number: 149
func_1A9E()
{
	var_00 = spawnstruct();
	var_00.var_2E6 = level.var_31D.var_2E6;
}

//Function Number: 150
func_1A8F()
{
	self method_80B2("lag_snipper_laser");
}

//Function Number: 151
func_1A5A()
{
	lib_A56F::func_A0B9("trig_canal_bridge_reinforcements1");
	var_00 = getent("canal_balcony_smoke_start","targetname");
	var_01 = getent("canal_balcony_smoke_target1","targetname");
	var_02 = getent("canal_balcony_smoke_target2","targetname");
	function_0070("smoke_grenade_cheap",var_00.var_2E6,var_00.var_2E6,0.5,0);
	function_0070("smoke_grenade_cheap",var_01.var_2E6,var_01.var_2E6,1,0);
	function_0070("smoke_grenade_cheap",var_02.var_2E6,var_02.var_2E6,1,0);
	wait(1.5);
	var_03 = getent("canal_zip_smoke_start2","targetname");
	var_04 = getent("canal_zip_smoke_target1","targetname");
	var_05 = getent("canal_zip_smoke_target2","targetname");
	wait(0.3);
	wait(1.5);
	var_06 = [];
	var_06[var_06.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_bridge_balcony_zipline1","canal_zipline_bridge2_start1");
	wait(0.5);
	var_06[var_06.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_bridge_balcony_zipline1","canal_zipline_bridge2_start2");
	wait(0.5);
	var_06[var_06.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_bridge_balcony_zipline1","canal_zipline_bridge2_start3");
	wait(0.5);
	thread func_7B6D(var_06);
	var_07 = getent("canal_bridge_balcony_rpg","script_noteworthy");
	for(var_08 = 0;var_08 < 1;var_08++)
	{
		var_09 = var_07 lib_A56F::func_72C(1);
		var_09.var_1D3 = 0;
		var_09 lib_A59A::func_749(::func_1A77);
	}
}

//Function Number: 152
func_1A98()
{
	var_00 = getent("trig_canal_dead_demo_team1","targetname");
	var_01 = getent("trig_canal_dead_demo_team2","targetname");
	var_02 = getent("trig_canal_dead_demo_team3","targetname");
	var_03 = getent("trig_canal_dead_demo_team4","targetname");
	level.var_2633 = [];
	thread func_1A9A(var_00,var_01);
	thread func_1A9A(var_03,var_02);
	thread func_1A6E(var_01,var_00);
	thread func_1A6E(var_02,var_03);
}

//Function Number: 153
func_1A88()
{
	var_00 = getent("canal_dead_demo_team1","targetname");
	var_01 = getent("canal_dead_demo_team2","targetname");
	var_02 = getent("canal_dead_demo_team3","targetname");
	var_03 = getent("canal_dead_demo_team4","targetname");
	var_04 = getent("canal_dead_demo_team5","targetname");
	var_05 = getent("canal_origin_dead_demo_team","targetname");
	if(level.nextgen)
	{
		var_06 = lib_A59A::func_2F29(var_00);
		var_07 = lib_A59A::func_2F29(var_01);
		var_08 = lib_A59A::func_2F29(var_02);
		var_09 = lib_A59A::func_2F29(var_03);
		var_0A = lib_A59A::func_2F29(var_04);
	}
	else
	{
		var_06 = lib_A59A::func_2F29(var_05);
		wait(0.05);
		var_07 = lib_A59A::func_2F29(var_05);
		wait(0.05);
		var_08 = lib_A59A::func_2F29(var_05);
		wait(0.05);
		var_09 = lib_A59A::func_2F29(var_05);
		wait(0.05);
		var_0A = lib_A59A::func_2F29(var_05);
	}

	var_06 setcontents(0);
	var_07 setcontents(0);
	var_08 setcontents(0);
	var_09 setcontents(0);
	var_0A setcontents(0);
	var_06 lib_A59A::func_445F();
	var_07 lib_A59A::func_445F();
	var_08 lib_A59A::func_445F();
	var_09 lib_A59A::func_445F();
	var_0A lib_A59A::func_445F();
	level.var_2633 = [var_06,var_07,var_08,var_09,var_0A];
	foreach(var_0C in level.var_2633)
	{
		var_0C.animname = "generic";
	}

	var_00 thread lib_A506::func_BC7(var_06,"dead_body_pose1");
	var_01 thread lib_A506::func_BC7(var_07,"dead_body_pose2");
	var_02 thread lib_A506::func_BC7(var_08,"dead_body_pose3");
	var_03 thread lib_A506::func_BC7(var_09,"dead_body_pose4");
	var_04 thread lib_A506::func_BC7(var_0A,"dead_body_pose5");
}

//Function Number: 154
func_1A9A(param_00,param_01)
{
	for(;;)
	{
		param_00 waittill("trigger");
		param_01 waittill("trigger");
		if(level.var_2633.size > 0)
		{
			foreach(var_03 in level.var_2633)
			{
				if(isdefined(var_03.tag))
				{
					var_03.tag delete();
				}

				if(isdefined(var_03))
				{
					var_03 delete();
				}
			}
		}

		func_1A88();
		wait(0.05);
	}
}

//Function Number: 155
func_1A6E(param_00,param_01)
{
	for(;;)
	{
		param_00 waittill("trigger");
		param_01 waittill("trigger");
		if(level.var_2633.size > 0)
		{
			foreach(var_03 in level.var_2633)
			{
				if(isdefined(var_03.tag))
				{
					var_03.tag delete();
				}

				if(isdefined(var_03))
				{
					var_03 delete();
				}
			}
		}

		wait(0.05);
	}
}

//Function Number: 156
func_45C8()
{
	var_00 = getent("smart_grenade_launcher","targetname");
	while(isdefined(var_00))
	{
		var_00 hudoutlinedisable(6,1);
		level notify("end_highlight_custom");
		while(isdefined(var_00) && distance(var_00.var_2E6,level.var_31D.var_2E6) > 300)
		{
			wait 0.05;
		}

		if(!isdefined(var_00))
		{
			break;
		}

		var_00 thread func_488D();
		while(isdefined(var_00) && distance(var_00.var_2E6,level.var_31D.var_2E6) <= 300)
		{
			wait 0.05;
		}

		wait 0.05;
	}

	level notify("end_highlight_custom");
	function_00D3("r_hudoutlinewidth",2);
}

//Function Number: 157
func_488D()
{
	level endon("end_highlight_custom");
	function_00D3("r_hudoutlinepostmode",2);
	self hudoutlineenable(6,1,0);
	while(isdefined(self) && level.gameskill <= 1)
	{
		for(var_00 = 1;var_00 < 4;var_00++)
		{
			function_00D3("r_hudoutlinewidth",var_00);
			function_00D3("r_hudoutlinepostmode",0);
			if(!isdefined(self))
			{
				return;
			}

			self hudoutlineenable(6,1,0);
			wait(0.1);
		}

		for(var_00 = 4;var_00 > 0;var_00--)
		{
			function_00D3("r_hudoutlinewidth",var_00);
			function_00D3("r_hudoutlinepostmode",0);
			if(!isdefined(self))
			{
				return;
			}

			self hudoutlineenable(6,1,0);
			wait(0.1);
		}
	}
}

//Function Number: 158
func_4567()
{
	var_00 = getent("smart_grenade_launcher","targetname");
	var_01 = common_scripts\utility::getstruct("struct_grenade_launcher_gun_swap","targetname");
	for(;;)
	{
		level.var_31D waittill("pickup",var_02,var_03);
		if(isdefined(var_03) && var_02 == var_00)
		{
			level.var_31D givemaxammo("iw5_microdronelaunchersmartgrenade_sp");
			wait(1);
			var_03.var_2E6 = var_01.var_2E6;
			var_03.var_41 = var_01.var_41;
			break;
		}
	}
}

//Function Number: 159
func_1A84()
{
	thread func_45C8();
	thread func_4567();
	if(level.currentgen && !issubstr(level.var_9704,"_overlookbar"))
	{
		level waittill("transients_canal_overlook_to_riverwalk");
	}

	var_00 = getent("trig_sd_pickup_bombs","targetname");
	var_00 sethintstring(&"SEOUL_PICKUP_EXPLOSIVES_HINT");
	var_01 = getent("objective_sd_origin_bombs","targetname");
	var_02 = var_00 lib_A571::func_48BB("x",var_01.var_2E6,undefined,500,undefined,var_00);
	lib_A59A::func_9806("trig_sd_pickup_bombs");
	common_scripts\utility::flag_set("bombs_picked_up");
	var_02 lib_A571::func_48B3();
	var_00 sethintstring("");
	var_00 common_scripts\utility::trigger_off();
	var_03 = getent("bomb_pickup","targetname");
	var_03 hide();
}

//Function Number: 160
func_41D3()
{
	var_00 = level.var_31D getcurrentweapon();
	level.var_31D takeweapon(var_00);
	level.var_31D giveweapon("iw5_microdronelaunchersmartgrenade_sp");
	level.var_31D switchtoweapon("iw5_microdronelaunchersmartgrenade_sp");
}

//Function Number: 161
func_1A8B()
{
	var_00 = common_scripts\utility::getstruct("canal_struct_door_kick","targetname");
	level.var_A31B.animname = "will_irons";
	common_scripts\utility::flag_wait("bombs_picked_up");
	lib_A59A::func_1E95("allies");
	var_00 lib_A506::func_BFF(level.var_A31B,"foyer_door_kick_a");
	var_01 = getnode("canal_cover_stairs","targetname");
	level.var_A31B lib_A59A::func_7E48(30);
	level.var_A31B lib_A59A::func_7E45(var_01);
	var_00 lib_A506::func_C24(level.var_A31B,"foyer_door_kick_a");
	level.var_A31B lib_A59A::func_309A();
	lib_A56F::func_A0B9("trig_canal_will_cover1");
}

//Function Number: 162
func_1A7A()
{
	common_scripts\utility::flag_wait("bombs_picked_up");
	thread func_1A9B();
	thread func_1A78();
	thread func_1A91();
	thread func_1AA6();
	thread func_1AA7();
	var_00 = getentarray("color_ents_pt1","script_noteworthy");
	foreach(var_02 in var_00)
	{
		if(var_02.classname == "trigger_multiple")
		{
			var_02 common_scripts\utility::trigger_off();
		}
	}

	var_04 = getentarray("color_ents_pt2","script_noteworthy");
	common_scripts\utility::array_thread(var_04,::common_scripts\utility::trigger_on);
	var_05 = getent("canal_goal_balcony","targetname");
	var_06 = function_00D6("axis");
	foreach(var_08 in var_06)
	{
		if(var_08 istouching(var_05) && isalive(var_08))
		{
			var_08 delete();
		}
	}

	lib_A59A::func_1143();
	common_scripts\utility::flag_set("vo_bomb_planting_instructions");
	common_scripts\utility::flag_waitopen("vo_bomb_planting_instructions");
	common_scripts\utility::flag_set("spawn_canal_razorback");
	lib_A56F::func_A0B9("trig_canal_reach_waterfall");
	var_0A = function_00D6("axis");
	var_0A = lib_A59A::func_CFF(var_0A);
	foreach(var_08 in var_0A)
	{
		var_08.health = 10;
	}

	common_scripts\utility::flag_wait("middle_weapon_guards_dead");
	common_scripts\utility::flag_set("prep_will_for_finale");
	lib_A5DE::snd_music_message("mus_canal_combat_done");
	common_scripts\utility::flag_wait("bomb_plant_start");
}

//Function Number: 163
func_4644()
{
	while(level.var_7C24.size > 1)
	{
		level.var_7C24 = common_scripts\utility::array_removeundefined(level.var_7C24);
		wait 0.05;
	}

	level notify("will_push_forward_01");
	while(level.var_7C24.size > 0)
	{
		level.var_7C24 = common_scripts\utility::array_removeundefined(level.var_7C24);
		wait 0.05;
	}

	if(!common_scripts\utility::flag("prep_will_for_finale"))
	{
		level.var_A31B.var_1C7 = 256;
	}

	var_00 = getent("trig_move_will_to_canal_pos2","targetname");
	var_00 notify("trigger",level.var_31D);
	var_00 = getent("trig_will_move_security_drones","targetname");
	var_00 notify("trigger",level.var_31D);
	level notify("will_push_forward_02");
	lib_A56F::func_A0B9("trig_move_to_final_color");
	lib_A59A::func_70A("trig_move_will_to_canal_pos3");
	level notify("will_push_forward_03");
}

//Function Number: 164
func_1AA7()
{
	thread func_8946();
	thread func_4644();
	func_A0AE();
	var_00 = getentarray("spawner_last_fight_01","targetname");
	var_01 = getnodearray("node_last_fight_cover","targetname");
	var_02 = [];
	foreach(var_04 in var_01)
	{
		if(!isdefined(var_04))
		{
			continue;
		}

		var_05 = common_scripts\utility::random(var_00) lib_A59A::func_88BD();
		if(!isdefined(var_05))
		{
			continue;
		}

		var_05 method_81A5(var_04);
		var_05.var_1C7 = 256;
		var_02[var_02.size] = var_05;
	}

	lib_A56F::func_A0B9("trig_canal_dead_demo_team3");
	foreach(var_05 in var_02)
	{
		if(isdefined(var_05))
		{
			if(common_scripts\utility::cointoss())
			{
				var_05.health = 1;
				continue;
			}

			var_05 func_14BC(randomfloat(1));
		}
	}
}

//Function Number: 165
func_5D6F()
{
	var_00 = common_scripts\utility::getstructarray("struct_security_attack_node","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_security_attack_node_pos1","targetname");
	var_02 = common_scripts\utility::getstructarray("struct_security_attack_node_pos2","targetname");
	var_03 = common_scripts\utility::getstructarray("struct_security_attack_node_pos3","targetname");
	var_04 = common_scripts\utility::getstructarray("struct_security_attack_node_posf1","targetname");
	var_05 = common_scripts\utility::getstructarray("struct_security_attack_node_posf2","targetname");
	var_06 = lib_A56F::func_CE0(var_00,var_01,var_02,var_03,var_04,var_05);
	var_07 = getent("vol_canals_security_drone_fight_pos1","targetname");
	var_08 = getent("vol_canals_security_drone_fight_pos2","targetname");
	var_09 = getent("vol_canals_security_drone_fight_pos3","targetname");
	var_0A = getent("vol_canals_security_drone_fight_posf1","targetname");
	var_0B = getent("vol_canals_security_drone_fight_posf2","targetname");
	for(;;)
	{
		if(level.var_31D istouching(var_07))
		{
			level.var_31D.var_2E26 = var_01;
			while(level.var_31D istouching(var_07))
			{
				wait 0.05;
			}
		}
		else if(level.var_31D istouching(var_08))
		{
			level.var_31D.var_2E26 = var_02;
			while(level.var_31D istouching(var_08))
			{
				wait 0.05;
			}
		}
		else if(level.var_31D istouching(var_09))
		{
			level.var_31D.var_2E26 = var_03;
			while(level.var_31D istouching(var_09))
			{
				wait 0.05;
			}
		}
		else if(level.var_31D istouching(var_0A))
		{
			level.var_31D.var_2E26 = var_04;
			while(level.var_31D istouching(var_0A))
			{
				wait 0.05;
			}
		}
		else if(level.var_31D istouching(var_0B))
		{
			level.var_31D.var_2E26 = var_05;
			while(level.var_31D istouching(var_0B))
			{
				wait 0.05;
			}
		}
		else
		{
			level.var_31D.var_2E26 = var_06;
		}

		wait 0.05;
	}
}

//Function Number: 166
func_4605()
{
	self endon("death");
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04);
		func_7C22(var_00,var_01,var_02,var_03,var_04);
	}
}

//Function Number: 167
func_7C22(param_00,param_01,param_02,param_03,param_04)
{
	self endon("death");
	if(issubstr(param_04,"BULLET"))
	{
		playfx(common_scripts\utility::getfx("sparks_burst_a_nolight"),param_03);
		self dodamage(param_00 * 3,param_01.var_2E6);
		wait(1);
		return;
	}

	self notify("flying_attack_drone_goal_update");
	self notify("drone_security_prepare_attack");
	self notify("drone_security_prepare_attack_relay");
	func_93E9(param_02,param_03,param_04);
	thread lib_A62F::func_3925();
	thread lib_A62F::func_2EAF(0);
}

//Function Number: 168
func_93E9(param_00,param_01,param_02)
{
	self endon("death");
	var_03 = vectornormalize(self.var_2E6 - param_01);
	var_04 = vectortoangles(var_03);
	var_05 = self.var_2E6 + var_04 * randomintrange(20,50);
	playfx(common_scripts\utility::getfx("sparks_burst_a_nolight"),self.var_2E6);
	var_06 = randomintrange(9,18);
	var_07 = self.var_2E6;
	var_08 = 0;
	self veh_clearlookatent();
	for(var_09 = 0;var_09 < var_06;var_09++)
	{
		self veh_setgoalyaw(var_09 * 60);
		self veh_setgoalpos(var_07 + lib_A56F::func_407D(5,3,2,0.5) * 20);
		self veh_setspeed(randomintrange(24,32),50,80);
		wait(0.2);
	}

	self veh_setspeed(randomintrange(24,32),12,20);
	if(!isdefined(self.var_88B5))
	{
		self.var_88B5 = 1;
		thread func_7C23();
		self veh_sethoverparams(30,30,20);
	}
}

//Function Number: 169
func_7C23()
{
	self endon("death");
	for(;;)
	{
		wait(randomfloatrange(0.75,1.5));
		if(common_scripts\utility::cointoss())
		{
			playfx(common_scripts\utility::getfx("sparks_burst_a_nolight"),self.var_2E6);
		}
		else
		{
			playfxontag(common_scripts\utility::getfx("sparks_burst_a_nolight"),self,"tag_main_camera");
		}

		playfxontag(common_scripts\utility::getfx("drone_smoke"),self,"tag_origin");
	}
}

//Function Number: 170
func_8946()
{
	if(!isdefined(level.var_31D.var_1FE0))
	{
		level.var_31D.var_1FE0 = level.var_31D;
	}

	if(!isdefined(level.var_716))
	{
		level.var_716 = [];
	}

	thread func_5D6F();
	level.var_2E7A = [level.var_31D.var_2E6,level.var_A31B.var_2E6];
	var_00 = [];
	var_01 = getentarray("spawner_big_security_drone_01","targetname");
	var_02 = getent("spawner_big_security_drone_00","targetname");
	var_01 = common_scripts\utility::array_add(var_01,var_02);
	foreach(var_06, var_04 in var_01)
	{
		if(var_06 == 2)
		{
			continue;
		}

		var_05 = var_04 lib_A59A::func_896F();
		var_00[var_00.size] = var_05;
		var_05 thread func_5924();
		var_05.var_89BF = var_04.targetname;
	}

	level.var_7C24 = var_00;
	level waittill("start_security_drone_fight");
	common_scripts\utility::flag_set("_stealth_spotted");
	common_scripts\utility::flag_set("drones_investigating");
	foreach(var_06, var_05 in var_00)
	{
		var_05 thread func_0701(var_06,0);
	}

	for(;;)
	{
		foreach(var_05 in var_00)
		{
			level.var_31D.var_1FE0 = var_05;
			while(isdefined(level.var_31D.var_1FE0))
			{
				wait 0.05;
			}
		}

		wait 0.05;
	}
}

//Function Number: 171
func_5924()
{
	level endon("start_security_drone_fight");
	for(;;)
	{
		self.var_275 = 21100;
		self.health = self.var_275;
		wait 0.05;
	}
}

//Function Number: 172
func_0701(param_00,param_01)
{
	self endon("death");
	if(param_01)
	{
		level waittill("security_drone_death");
		level waittill("security_drone_death");
	}

	var_02 = self;
	var_02 lib_A59E::func_4277();
	var_02 veh_setspeed(randomintrange(24,32),12,20);
	var_02.ignoreme = 1;
	var_02 thread func_3649();
	var_02 thread func_5DFB(param_00);
	common_scripts\utility::flag_wait("security_drones_arrived");
	var_02 thread lib_A62F::func_2E1C();
	var_02 lib_A62F::func_2EB7("attack");
	var_02 thread func_4605();
	var_02 thread func_7ECA(param_00);
	level.var_716[level.var_716.size] = var_02;
	var_02.ignoreme = 0;
	var_02.var_275 = 21200;
	var_02.health = var_02.var_275;
}

//Function Number: 173
func_3649()
{
	self endon("death");
	if(issubstr(self.var_89BF,"00"))
	{
		thread func_2EAA("drone_scan_seoul",1);
		return;
	}

	thread func_2EAA("drone_scan_seoul",0);
}

//Function Number: 174
func_2EAA(param_00,param_01)
{
	if(!param_01)
	{
		playfxontag(level._effect[param_00],self,"tag_main_camera");
	}

	while(!common_scripts\utility::flag("security_drones_arrived"))
	{
		if(!isdefined(self) || issubstr(self.classname,"corpse"))
		{
			break;
		}

		self veh_setlookatent(common_scripts\utility::random([level.var_31D,level.var_A31B]));
		if(param_01)
		{
			playfxontag(level._effect[param_00],self,"tag_main_camera");
		}

		wait(randomfloatrange(0.5,1));
	}
}

//Function Number: 175
func_5DFB(param_00)
{
	for(;;)
	{
		common_scripts\utility::flag_wait("security_drones_ok_to_damage");
		var_01 = common_scripts\utility::waittill_any_return("death","damage");
		if(var_01 == "death")
		{
			level notify("security_drone_death",param_00);
			common_scripts\utility::flag_set("security_drones_arrived");
			break;
		}
		else
		{
			common_scripts\utility::flag_set("security_drones_arrived");
		}
	}
}

//Function Number: 176
func_7ECA(param_00)
{
	self endon("death");
	while(!isdefined(self.var_2EDD))
	{
		wait 0.05;
	}

	var_01 = undefined;
	thread func_5330();
	for(;;)
	{
		if(param_00 == 0 || param_00 == 2)
		{
			var_01 = level.var_31D;
		}
		else if(param_00 == 1)
		{
			var_01 = level.var_A31B;
		}
		else
		{
			thread func_9197();
			break;
		}

		self.var_2EDD.var_9310 = var_01;
		while(isdefined(self.var_2EDD.var_9310) && self.var_2EDD.var_9310 == var_01)
		{
			wait 0.05;
		}
	}
}

//Function Number: 177
func_5330()
{
	self endon("death");
	lib_A56F::func_A0B9("trig_canal_dead_demo_team3");
	self.var_2EDD.var_9310 = level.var_31D;
}

//Function Number: 178
func_9197()
{
	self endon("death");
	for(;;)
	{
		self waittill("damage",var_00,var_01);
		self.var_2EDD.var_9310 = var_01;
		wait(3);
	}
}

//Function Number: 179
func_7C21()
{
	var_00 = self;
	var_00.var_19F = cos(60);
	var_00.var_19D = cos(60);
	var_00 notify("drone_investigate");
	var_00 notify("drone_corpse_monitor");
	var_00 notify("drone_alert_sight");
	var_00 notify("drone_wait_for_attack");
	var_00 thread lib_A62F::func_2EAF(1);
}

//Function Number: 180
func_A0AE()
{
	var_00 = getent("vol_canal_enemy_ai_check_01","targetname");
	while(!common_scripts\utility::flag("canal_reached_walls"))
	{
		var_01 = function_00D6("axis");
		var_01 = lib_A59A::func_CFF(var_01);
		var_02 = 0;
		foreach(var_04 in var_01)
		{
			if(isdefined(var_04) && var_04 istouching(var_00))
			{
				var_02++;
			}

			if(common_scripts\utility::cointoss())
			{
				wait 0.05;
			}
		}

		if(var_02 > 1)
		{
			break;
		}

		wait 0.05;
	}

	while(!common_scripts\utility::flag("canal_reached_walls"))
	{
		var_01 = function_00D6("axis");
		var_02 = 0;
		foreach(var_04 in var_01)
		{
			if(isdefined(var_04) && var_04 istouching(var_00))
			{
				var_02++;
			}

			if(common_scripts\utility::cointoss())
			{
				wait 0.05;
			}
		}

		if(var_02 == 0)
		{
			break;
		}

		wait 0.05;
	}

	level notify("start_security_drone_fight");
}

//Function Number: 181
func_1A78()
{
	var_00 = getent("enemy_sd_canal_grp1","script_noteworthy");
	var_01 = 6;
	var_02 = [];
	for(var_03 = 0;var_03 < var_01;var_03++)
	{
		var_04 = var_00 lib_A56F::func_72C(1);
		var_04.var_1D3 = 0;
		var_04 thread func_1C69();
		var_04 lib_A59A::func_749(::func_1A77);
		var_02[var_02.size] = var_04;
	}

	lib_A56F::func_A0B9("trig_canal_reach_waterfall");
	var_05 = lib_A59A::func_CFF(var_02);
	foreach(var_04 in var_02)
	{
		if(isalive(var_04))
		{
			var_04 func_14BC();
		}

		wait(randomfloatrange(0.3,0.5));
		var_05 = lib_A59A::func_CFF(var_05);
	}
}

//Function Number: 182
func_1A91()
{
	common_scripts\utility::flag_clear("canal_reached_walls");
	common_scripts\utility::flag_wait("canal_reached_walls");
	var_00 = getent("enemy_sd_guards2_1","targetname");
	var_01 = 3;
	var_02 = getent("sd_goal_weapon_guard1","targetname");
	var_03 = [];
	for(var_04 = 0;var_04 < var_01;var_04++)
	{
		var_05 = var_00 lib_A56F::func_72C(1);
		var_05.var_1D3 = 0;
		var_05 thread func_1C69();
		var_05 method_81A9(var_02);
		var_05 lib_A59A::func_749(::func_1A77);
		var_03[var_03.size] = var_05;
	}

	var_06 = getent("enemy_sd_guards2_2","targetname");
	var_07 = 4;
	var_02 = getent("sd_goal_weapon_guard1","targetname");
	for(var_04 = 0;var_04 < var_01;var_04++)
	{
		var_05 = var_00 lib_A56F::func_72C(1);
		var_05.var_1D3 = 0;
		var_05 thread func_1C69();
		var_05 method_81A9(var_02);
		var_05 lib_A59A::func_749(::func_1A77);
		var_03[var_03.size] = var_05;
	}

	while(var_03.size > 1)
	{
		var_03 = lib_A59A::func_CFF(var_03);
		wait 0.05;
	}

	foreach(var_05 in var_03)
	{
		if(isalive(var_05))
		{
			var_05 func_14BC();
		}

		var_03 = lib_A59A::func_CFF(var_03);
	}

	common_scripts\utility::flag_set("middle_weapon_guards_dead");
}

//Function Number: 183
func_1AA6()
{
	var_00 = getent("enemy_canal_wall_reinforcementsR","script_noteworthy");
	var_01 = 3;
	var_02 = getent("sd_goal_wallR","targetname");
	var_03 = [];
	for(var_04 = 0;var_04 < var_01;var_04++)
	{
		var_05 = var_00 lib_A56F::func_72C(1);
		var_05.var_1D3 = 0;
		var_05 thread func_1C69();
		var_05 method_81A9(var_02);
		var_05 sentient_setthreatbiasgroup("weapon_platform_guards");
		var_05 lib_A59A::func_749(::func_1A77);
		var_03[var_03.size] = var_05;
		var_05 thread func_1AA5();
	}

	var_06 = getent("enemy_canal_wall_reinforcementsL","script_noteworthy");
	var_07 = 2;
	var_02 = getent("sd_goal_wallL","targetname");
	for(var_04 = 0;var_04 < var_01;var_04++)
	{
		var_05 = var_06 lib_A56F::func_72C(1);
		var_05.var_1D3 = 0;
		var_05 thread func_1C69();
		var_05 method_81A9(var_02);
		var_05 sentient_setthreatbiasgroup("weapon_platform_guards");
		var_05 lib_A59A::func_749(::func_1A77);
		var_03[var_03.size] = var_05;
		var_05 thread func_1AA5();
	}

	lib_A56F::func_A0B9("trig_canal_reach_waterfall");
	var_03 = lib_A59A::func_CFF(var_03);
	foreach(var_05 in var_03)
	{
		if(isalive(var_05))
		{
			var_05 func_14BC();
		}

		wait(randomfloatrange(0.3,0.5));
		var_03 = lib_A59A::func_CFF(var_03);
	}
}

//Function Number: 184
func_1A8D()
{
	var_00 = getentarray("special_jet_flyby_spawner_canal1","targetname");
	foreach(var_02 in var_00)
	{
		var_02 lib_A59E::func_8971();
	}
}

//Function Number: 185
func_1A86()
{
	if(level.currentgen && !issubstr(level.var_9704,"_overlookbar"))
	{
		level waittill("transients_canal_overlook_to_riverwalk");
	}

	common_scripts\utility::flag_wait("canal_bomb_plant_trigger_on");
	var_00 = getent("trig_interact_with_will_finale","targetname");
	var_00 sethintstring(&"SEOUL_GIVE_EXPLOSIVES_HINT");
	var_00 thread func_1A85();
	common_scripts\utility::flag_wait("interacted_with_will_finale");
	var_00 sethintstring("");
	common_scripts\utility::flag_set("bomb_plant_start");
	var_00 common_scripts\utility::trigger_off();
}

//Function Number: 186
func_1A85()
{
	var_00 = lib_A571::func_48BF("x",250);
	common_scripts\utility::flag_wait("interacted_with_will_finale");
	var_00 lib_A571::func_48B3();
}

//Function Number: 187
func_1A9B()
{
	common_scripts\utility::flag_wait("spawn_canal_razorback");
	level.var_1A95 = lib_A59E::func_8973("vehicle_canal_razorback01");
	level.var_1A95 lib_A5DE::snd_message("seo_canal_razorback");
	level.var_1A95 lib_A59E::func_4256();
	var_00 = getentarray("ally_canal_razorback_grp1","script_noteworthy");
	var_01 = getent("canal_razorback_clip","targetname");
	var_01 linkto(level.var_1A95);
	thread func_1A97();
	wait(2);
	common_scripts\utility::flag_set("vo_canal_razorback_arrival");
	common_scripts\utility::flag_wait("canal_razorback_dropoff01");
	common_scripts\utility::flag_set("canal_razoback_move_again");
	wait(8);
	common_scripts\utility::flag_set("canal_razorback_attacked");
	var_02 = common_scripts\utility::getstruct("razorback_escape","targetname");
	level.var_1A95.var_DF6 = var_02;
	level.var_1A95 thread lib_A59E::func_9D0F();
	level.var_1A95 lib_A5DE::snd_message("seo_canal_heli_attacked");
	while(!isdefined(level.var_1A95.var_235D))
	{
		wait 0.05;
	}

	var_03 = level.var_1A95.var_2E6;
	level.var_1A95.var_231D = common_scripts\utility::getclosest(level.var_1A95.var_2E6,getentarray("helicopter_crash_location","targetname"),5000);
	while(distance(level.var_1A95.var_2E6,level.var_1A95.var_231D.var_2E6) > 200)
	{
		var_03 = level.var_1A95.var_2E6;
		wait 0.05;
	}

	playfx(common_scripts\utility::getfx("razorback_death_explosion"),var_03);
	var_01 unlink();
	var_01 delete();
	level.var_1A95 delete();
}

//Function Number: 188
func_1A97()
{
	level.var_1A95 lib_A635::func_2AA3();
	level.var_1A95 thread lib_A635::func_2AE2();
	level.var_1A95.var_37C1 = 0.2;
	level.var_1A95.var_4466 = level.var_1A95 gettagorigin("TAG_TURRET");
	wait(4);
	level.var_1A95 thread lib_A635::func_30FD();
	while(!common_scripts\utility::flag("canal_razorback_dropoff01"))
	{
		var_00 = randomfloatrange(10,30);
		var_01 = 0;
		level.var_1A95 lib_A5DE::snd_message("razorback_fire_start",level.var_1A95.var_4466);
		while(!common_scripts\utility::flag("canal_razorback_dropoff01") && var_01 < var_00)
		{
			var_02 = common_scripts\utility::getclosest(level.var_1A95.var_2E6,getentarray("canal_wall_targetpoints","script_noteworthy"),5000);
			var_02 = var_02.var_2E6 + common_scripts\utility::randomvectorrange(10,100);
			level.var_1A95 lib_A635::func_7E37(var_02);
			level.var_1A95.var_4466 = level.var_1A95 gettagorigin("TAG_TURRET");
			func_1A96();
			var_01++;
			wait(level.var_1A95.var_37C1);
		}

		level.var_1A95 lib_A5DE::snd_message("razorback_fire_stop",level.var_1A95.var_4466);
		wait(randomfloatrange(0.3,0.5));
	}

	level.var_1A95 thread lib_A635::func_2AE2();
	common_scripts\utility::flag_wait("canal_razorback_dropoff01");
	wait(1);
	wait(3);
	common_scripts\utility::flag_set("canal_razorback_fire_at_swarm");
	level.var_1A95 thread lib_A635::func_30FD();
	while(!common_scripts\utility::flag("canal_razorback_attacked"))
	{
		var_00 = randomfloatrange(4,8);
		var_01 = 0;
		level.var_1A95 lib_A5DE::snd_message("razorback_fire_start",level.var_1A95.var_4466);
		while(!common_scripts\utility::flag("canal_razorback_attacked") && var_01 < var_00)
		{
			var_02 = func_3E27();
			if(!isdefined(var_02))
			{
				var_02 = common_scripts\utility::getclosest(level.var_1A95.var_2E6,getentarray("canal_swarm_targetpoints","script_noteworthy"),5000);
			}

			var_02 = var_02.var_2E6 + common_scripts\utility::randomvectorrange(10,50);
			level.var_1A95 lib_A635::func_7E37(var_02);
			level.var_1A95.var_4466 = level.var_1A95 gettagorigin("TAG_TURRET");
			func_1A96();
			var_01++;
			wait(level.var_1A95.var_37C1);
		}

		level.var_1A95 lib_A5DE::snd_message("razorback_fire_stop",level.var_1A95.var_4466);
		wait(randomfloatrange(0.5,1.75));
	}

	level.var_1A95 thread lib_A635::func_2AE2();
}

//Function Number: 189
func_3E27()
{
	var_00 = level.var_31D geteye();
	var_01 = level.var_31D method_8036();
	var_02 = var_00 + anglestoforward(var_01) * 20;
	var_03 = var_00 + anglestoforward(var_01) * 200;
	var_04 = bullettrace(var_02,var_03,1,level.var_A31B,0,0,1);
	if(distance(level.var_31D.var_2E6,var_04["position"]) < 300)
	{
		return;
	}

	var_05 = function_00D6("axis");
	var_05 = lib_A56F::func_888D(var_05,var_04["position"]);
	if(isdefined(var_05[1]))
	{
		var_06 = var_05[1];
	}
	else
	{
		var_06 = var_06[0];
	}

	return var_06.var_2E6;
}

//Function Number: 190
func_1A96(param_00,param_01)
{
	level.var_1A95 veh_fireweapon();
}

//Function Number: 191
func_1A75()
{
	common_scripts\utility::flag_wait("canal_start_drone_travel");
	level notify("end_kamikaze_newstyle");
	var_00 = common_scripts\utility::getstructarray("canal_snake_swarm_travel1","script_noteworthy");
	foreach(var_02 in var_00)
	{
		var_02.speed = 40;
	}

	foreach(var_05 in self.var_86B4)
	{
		var_06 = var_05.var_38E4.var_1522;
		var_06.var_59F4 = 4000;
		var_06.var_58DE = 20;
	}

	thread lib_A5FA::func_8698("canal_snake_swarm_travel1",undefined,3);
	common_scripts\utility::flag_wait("canal_snake_reached_platform");
	var_08 = common_scripts\utility::getstructarray("sd_snake_swarm_wp_loop","script_noteworthy");
	var_09 = common_scripts\utility::getstructarray("canal_snake_swarm_initial_attack1","script_noteworthy");
	thread func_1A8E();
	foreach(var_02 in var_08)
	{
		var_02.speed = 40;
	}

	foreach(var_02 in var_09)
	{
		var_02.speed = 35;
	}

	foreach(var_05 in self.var_86B4)
	{
		var_06 = var_05.var_38E4.var_1522;
		var_06.var_59F4 = 6400;
		var_06.var_58DE = 30;
	}

	level notify("canal_swarm_spawned");
	thread lib_A5FA::func_8698("sd_snake_swarm_wp_loop",undefined,4.5);
	foreach(var_05 in self.var_86B4)
	{
		var_06 = var_05.var_38E4.var_1522;
		var_06.var_59F4 = 6400;
		var_06.var_58DE = 30;
	}

	common_scripts\utility::flag_wait("canal_razorback_fire_at_swarm");
	thread func_1A74();
	common_scripts\utility::flag_wait("canal_razorback_attacked");
	common_scripts\utility::flag_set("vo_canal_razorback_attacked");
	lib_A5DE::snd_music_message("mus_canal_swarm_chasing_off_razorback");
	wait(2);
	foreach(var_05 in self.var_86B4)
	{
		var_06 = var_05.var_38E4.var_1522;
		var_06.var_59F4 = 3200;
		var_06.var_58DE = 10;
	}

	thread lib_A5FA::func_8698("canal_snake_swarm_initial_attack1",undefined,4);
	common_scripts\utility::flag_wait("canal_snake_attack1_path_end");
	wait(8);
	thread lib_A5FA::func_1E80();
	lib_A5DE::snd_music_message("mus_canal_helo_attacked");
}

//Function Number: 192
func_1A74()
{
	var_00 = common_scripts\utility::getstructarray("canal_dead_drone_spawn2","script_noteworthy");
	while(!common_scripts\utility::flag("canal_razorback_attacked") && !common_scripts\utility::flag("canal_razoback_move_again"))
	{
		if(common_scripts\utility::flag("canal_razoback_move_again"))
		{
			var_00 = common_scripts\utility::getstructarray("canal_dead_drone_spawn3","script_noteworthy");
		}

		var_01 = var_00[randomintrange(0,var_00.size)];
		playfx(common_scripts\utility::getfx("drone_death_explode1"),var_01.var_2E6);
		wait(randomfloatrange(0.5,1));
	}

	wait(2);
	var_00 = common_scripts\utility::getstructarray("canal_dead_drone_spawn3","script_noteworthy");
	while(!common_scripts\utility::flag("canal_razorback_attacked"))
	{
		var_01 = var_00[randomintrange(0,var_00.size)];
		playfx(common_scripts\utility::getfx("drone_death_explode1"),var_01.var_2E6);
		wait(randomfloatrange(0.5,1));
	}
}

//Function Number: 193
func_1A8E()
{
	var_00 = getent("vol_canal_kamikaze_player_check","targetname");
	var_01 = getent("canal_drone_queen1","targetname");
	var_02 = common_scripts\utility::getstructarray("sd_snake_swarm_wp_loop","script_noteworthy");
	level endon("end_kamikaze_newstyle");
	while(!common_scripts\utility::flag("bombs_picked_up"))
	{
		while(level.var_31D istouching(var_00))
		{
			if(!common_scripts\utility::flag("canal_swarm_attacking_player"))
			{
				common_scripts\utility::flag_set("canal_swarm_attacking_player");
			}

			var_03 = lib_A56F::func_888D(level.var_38E5,level.var_31D.var_2E6);
			var_04 = randomint(2);
			for(var_05 = 0;var_05 < var_04;var_05++)
			{
				if(!isdefined(var_03[var_05]) || isdefined(var_03[var_05].var_E42))
				{
					continue;
				}

				var_03[var_05] thread lib_A5F8::func_2E7E(var_01);
				var_03[var_05].var_E42 = 1;
				wait(randomfloatrange(0.1,0.2));
			}

			foreach(var_07 in var_02)
			{
				var_07.speed = 40;
			}

			wait(0.5);
		}

		if(common_scripts\utility::flag("canal_swarm_attacking_player"))
		{
			common_scripts\utility::flag_clear("canal_swarm_attacking_player");
		}

		wait 0.05;
	}
}

//Function Number: 194
func_1A94()
{
	lib_A56F::func_A0B9("trig_canal_reinforcements2");
	var_00 = common_scripts\utility::getstruct("struct_smoke_start_left","targetname");
	var_01 = common_scripts\utility::getstruct("struct_smoke_end_left","targetname");
	var_02 = common_scripts\utility::getstruct("struct_smoke_start_right","targetname");
	var_03 = common_scripts\utility::getstruct("struct_smoke_end_right","targetname");
	function_0070("smoke_grenade_cheap",var_00.var_2E6,var_01.var_2E6 + (0,2,0),1);
	function_0070("smoke_grenade_cheap",var_02.var_2E6,var_03.var_2E6 + (0,2,0),1);
	wait(1);
	thread func_7B63(undefined,"enemy_sd_canal1",undefined,"sd_goal_canal1_fallback",2,undefined,"sd_goal_weapon_guard1");
	thread func_7B63(undefined,"enemy_canal_waterfall",undefined,"sd_goal_canal1_fallback",1,undefined,"sd_goal_weapon_guard1");
}

//Function Number: 195
func_1A9C()
{
	lib_A56F::func_A0B9("trig_canal_start_combat");
	var_00 = [];
	var_00[var_00.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_canal_zipline1","canal_zipline_canal1_start1");
	wait(0.5);
	var_00[var_00.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_canal_zipline1","canal_zipline_canal1_start2");
	wait(0.5);
	var_00[var_00.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_canal_zipline1","canal_zipline_canal1_start3");
	wait(0.5);
	var_00[var_00.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_canal_zipline1","canal_zipline_canal1_start4");
	func_7B6D(var_00,"sd_goal_canal1",2,undefined,"sd_goal_canal1_fallback");
}

//Function Number: 196
func_1A9D()
{
	lib_A56F::func_A0B9("trig_canal_start_combat");
	wait(0.5);
	var_00 = [];
	var_00[var_00.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_canal_zipline2","canal_zipline_canal2_start1");
	wait(0.5);
	var_00[var_00.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_canal_zipline2","canal_zipline_canal2_start2");
	wait(0.5);
	var_00[var_00.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_canal_zipline2","canal_zipline_canal2_start3");
	wait(0.5);
	var_00[var_00.size] = animscripts\traverse\seoul_zipline::func_892A("canal_enemy_canal_zipline2","canal_zipline_canal2_start4");
	func_7B6D(var_00,"sd_goal_canal1",2,undefined,"sd_goal_canal1_fallback");
}

//Function Number: 197
func_1AA1()
{
	var_00 = getentarray("canal_vehicle_weap_defense_passengers","script_noteworthy");
	lib_A59A::func_D0C("canal_vehicle2_passengers",::func_1AA0);
	var_01 = lib_A59E::func_8972("canal_vehicle_weap_defense");
	level.var_2186[level.var_2186.size] = var_01;
	foreach(var_03 in var_01.var_7507)
	{
		if(var_03.var_9D13 == 3)
		{
			var_04 = var_03;
		}
	}

	common_scripts\utility::flag_wait("bombs_picked_up");
	var_01 waittill("reached_end_node");
	var_01 lib_A59E::func_9D5F("all_but_gunner");
}

//Function Number: 198
func_1A76()
{
	lib_A56F::func_A0B9("trig_canal_emp");
	level notify("end_drone_swarm");
	var_00 = getent("canal_weapon_platform","targetname");
	var_01 = var_00.var_2E6;
	var_02 = 10000;
	var_03 = common_scripts\utility::array_add(level.var_2187,level.var_2180);
	var_03 = lib_A56F::func_888D(var_03,var_01);
	var_04 = var_01;
	var_05 = 25;
	var_06 = 0;
	foreach(var_08 in var_03)
	{
		if(!isdefined(var_08))
		{
			continue;
		}

		if(var_08 lib_A59E::func_51FA())
		{
			var_08 dodamage(var_08.health * 2,var_01);
			continue;
		}

		var_09 = distance(var_04,var_08.var_2E6);
		var_0A = var_09 / var_02 * 0.05;
		if(lib_A56F::func_67C3(25))
		{
			wait(var_0A);
		}

		if(var_06 > var_05)
		{
			wait(0.05);
			var_06 = 0;
		}

		if(!isdefined(var_08))
		{
			continue;
		}

		var_04 = var_08.var_2E6;
		var_0B = vectornormalize(var_08.var_2E6 - var_01);
		var_0B = vectornormalize(var_0B + (0,0,0.2));
		var_0C = spawn("script_model",var_08.var_2E6);
		var_0C setmodel("vehicle_mil_attack_drone_static");
		var_0C.var_41 = var_08.var_41;
		var_08 lib_A56F::func_2800();
		var_0D = var_0C.var_2E6 + (randomintrange(-10,10),randomintrange(-10,10),randomintrange(-10,10)) - var_01;
		var_0E = randomintrange(10,80);
		var_0C physicslaunchserver(var_0C.var_2E6 + (randomintrange(-15,15),randomintrange(-15,15),randomintrange(-15,15)),var_0D * var_0E);
		var_0C common_scripts\utility::delaycall(randomfloatrange(10,30),::delete);
		var_06++;
	}
}

//Function Number: 199
func_1AAA()
{
	if(!isdefined(level.var_A2C5))
	{
		level.var_A2C5 = getent("canal_weapon_platform","targetname");
	}

	if(level.currentgen && !issubstr(level.var_9704,"_overlookbar"))
	{
		level waittill("transients_canal_overlook_to_riverwalk");
	}

	thread maps\seoul_lighting::func_3732();
	level.var_A2C5.animname = "weapon_platform";
	level.var_A2C5 lib_A506::func_7F23();
	var_00 = getent("canal_org_finale","targetname");
	var_00 lib_A506::func_BC7(level.var_A2C5,"firing_loop");
	var_01 = getentarray("vehicle_canal_wp_missiles1","targetname");
	var_02 = getentarray("vehicle_canal_wp_missiles2","targetname");
	var_03 = getentarray("vehicle_canal_wp_missiles3","targetname");
	common_scripts\utility::flag_wait("start_weapon_platform_firing");
	while(common_scripts\utility::flag("start_weapon_platform_firing"))
	{
		var_00 thread func_1AA9();
		earthquake(0.2,1,level.var_A2C5.var_2E6,1500);
		var_04 = var_01[randomintrange(0,var_01.size)];
		var_05 = var_04 lib_A59E::func_8971();
		playfxontag(common_scripts\utility::getfx("weaponplf_trail_missile_runner"),var_05,"tag_origin");
		var_05 hide();
		var_05 notify("stop_engineeffects");
		stopfxontag(common_scripts\utility::getfx("contrail"),var_05,"tag_origin");
		var_05 lib_A5DE::snd_message("havoc_missile_launch");
		wait(randomfloatrange(0.2,0.4));
		var_06 = var_02[randomintrange(0,var_02.size)];
		var_07 = var_06 lib_A59E::func_8971();
		playfxontag(common_scripts\utility::getfx("weaponplf_trail_missile_runner"),var_07,"tag_origin");
		var_07 hide();
		var_07 notify("stop_engineeffects");
		stopfxontag(common_scripts\utility::getfx("contrail"),var_07,"tag_origin");
		var_07 lib_A5DE::snd_message("havoc_missile_launch");
		wait(randomfloatrange(0.2,0.4));
		var_08 = var_03[randomintrange(0,var_03.size)];
		var_09 = var_08 lib_A59E::func_8971();
		playfxontag(common_scripts\utility::getfx("weaponplf_trail_missile_runner"),var_09,"tag_origin");
		var_09 hide();
		var_09 notify("stop_engineeffects");
		stopfxontag(common_scripts\utility::getfx("contrail"),var_09,"tag_origin");
		var_09 lib_A5DE::snd_message("havoc_missile_launch");
		wait(randomfloatrange(5,8));
	}

	common_scripts\utility::flag_waitopen("weapon_platform_firing");
}

//Function Number: 200
func_1AAB()
{
	level.var_A2C5 = getent("canal_weapon_platform","targetname");
	level.var_A2C5 hide();
	common_scripts\utility::flag_wait("show_canal_weapon_platform");
	level.var_A2C5 show();
}

//Function Number: 201
func_1AA9()
{
	common_scripts\utility::flag_set("weapon_platform_firing");
	lib_A506::func_C24(level.var_A2C5,"firing_loop");
	common_scripts\utility::flag_clear("weapon_platform_firing");
}

//Function Number: 202
func_1A82()
{
	common_scripts\utility::flag_wait("prep_will_for_finale");
	common_scripts\utility::flag_waitopen("weapon_platform_firing");
	common_scripts\utility::flag_clear("start_weapon_platform_firing");
	level.var_A31B.animname = "will_irons";
	level.var_A2C5 lib_A59A::func_C3D();
	var_00 = getent("canal_org_finale","targetname");
	var_00 lib_A506::func_BC7(level.var_A2C5,"finale_pt01");
	level.var_A31B.ignoreall = 1;
	level.var_A31B.ignoreme = 1;
	thread maps\seoul_lighting::func_3732();
	thread maps\seoul_lighting::func_6E9A();
	var_00 = getent("canal_org_finale","targetname");
	var_01 = [level.var_A31B,level.var_A2C5];
	var_00 lib_A506::func_BFF(level.var_A31B,"finale_pt01");
	var_00 lib_A506::func_C18(var_01,"finale_pt01");
	common_scripts\utility::flag_set("canal_bomb_plant_trigger_on");
	common_scripts\utility::flag_set("vo_bomb_plant_reminder");
	var_02 = ["seo_wil_mitchellineedthe","seo_wil_comeonmitchell"];
	thread lib_A571::func_2A37(level.var_A31B,"bomb_plant_start",var_02,3,5);
	if(!common_scripts\utility::flag("bomb_plant_start"))
	{
		var_00 lib_A506::func_BE1(level.var_A31B,"finale_idle_will","bomb_plant_start");
	}
}

//Function Number: 203
func_1A80()
{
	if(level.currentgen && !issubstr(level.var_9704,"_overlookbar"))
	{
		level waittill("transients_canal_overlook_to_riverwalk");
	}

	level notify("aud_stop_canal_bombs");
	var_00 = getent("canal_org_finale","targetname");
	var_01 = lib_A59A::func_88CB("seo_finale_part2_lamp01");
	var_02 = lib_A59A::func_88CB("seo_finale_part2_lamp02");
	var_03 = lib_A59A::func_88CB("seo_finale_part2_lamp03");
	var_04 = lib_A59A::func_88CB("seo_finale_part2_lamp04");
	var_05 = lib_A59A::func_88CB("seo_finale_part2_lamp05");
	var_06 = lib_A59A::func_88CB("seo_finale_part2_lamp06");
	var_07 = lib_A59A::func_88CB("seo_finale_part2_lamp07");
	var_08 = lib_A59A::func_88CB("seo_finale_part2_lamp08");
	var_09 = [var_01,var_02,var_03,var_04,var_05,var_06,var_07,var_08];
	var_00 lib_A506::func_BC5(var_09,"finale_pt02");
	common_scripts\utility::flag_wait("bomb_plant_start");
	common_scripts\utility::flag_set("end_rumble_listener");
	level.var_31D lib_A59E::func_4256();
	lib_A5DE::snd_message("seo_finale_start");
	thread maps\seoul_lighting::func_937D();
	common_scripts\utility::flag_set("objective_sd_bomb_planted");
	level notify("panel_close_wait");
	thread func_1E69();
	level.var_31D lib_A571::func_825E(1);
	lib_A561::func_6AFB();
	var_0A = function_00D6("axis");
	lib_A59A::func_CE5(var_0A);
	var_0B = function_00D9();
	lib_A59A::func_CE5(var_0B);
	function_00D3("g_friendlynamedist",0);
	level.var_A2C5 = getent("canal_weapon_platform","targetname");
	level.var_A2C5.animname = "weapon_platform";
	level.var_A2C5 lib_A506::func_7F23();
	level.var_A31B.animname = "will_irons";
	level.var_21DF.animname = "cormack";
	var_0C = lib_A59A::func_88CB("player_rig",level.var_31D.var_2E6);
	var_0D = lib_A59A::func_88CB("seo_finale_plantbomb_bomb");
	thread maps\seoul_lighting::func_152C(var_0D);
	var_0E = [level.var_A31B,var_0C,level.var_A2C5,var_0D];
	var_00 lib_A506::func_BC5(var_0E,"finale_plantbomb");
	var_0C hide();
	var_0F = 0.5;
	level.var_31D playerlinktoblend(var_0C,"tag_player",var_0F);
	var_0C common_scripts\utility::delaycall(var_0F + 0.1,::show);
	level.var_31D common_scripts\utility::delaycall(var_0F,::playerlinktoabsolute,var_0C,"tag_player");
	common_scripts\utility::flag_set("vo_canal_finale_scene");
	common_scripts\utility::flag_set("vfx_msg_finale_sequence_start");
	var_00 lib_A506::func_C18(var_0E,"finale_plantbomb");
	common_scripts\utility::flag_set("cleanup_finale_explosive");
	var_0D hide();
	var_10 = [level.var_A31B,var_0C,level.var_A2C5,var_01,var_02,var_03,var_04,var_05,var_06,var_07,var_08];
	var_00 lib_A506::func_C18(var_10,"finale_pt02");
	level.var_A31B hide();
	var_11 = lib_A59A::func_88CB("seo_finale_phase2_rock_chunk01");
	var_12 = lib_A59A::func_88CB("seo_finale_phase2_rock_chunk02");
	var_13 = lib_A59A::func_88CB("seo_finale_phase2_sever_debris");
	var_14 = lib_A59A::func_88CB("seo_finale_phase2_sever_debris_02");
	var_15 = lib_A59A::func_88CB("seo_finale_phase2_silo_burke_debris");
	var_16 = lib_A59A::func_88CB("player_dismembered_arm");
	thread maps\seoul_lighting::func_3717(var_0C);
	var_17 = getent("canal_finale_warbird1","targetname") lib_A59A::func_896F();
	var_17.animname = "warbird_finale";
	var_17.ignoreall = 1;
	var_18 = getent("hero_cormack_spawner_outro","targetname");
	level.var_220D = var_18 lib_A56F::func_72C();
	level.var_220D.animname = "cormack";
	level.var_220D.ignoreall = 1;
	var_19 = [level.var_220D,var_0C,var_16,var_11,var_13,var_14,var_15,var_17];
	lib_A5DE::snd_music_message("mus_mitchels_arm");
	thread lib_A5CE::func_65CC(var_19);
	var_00 thread lib_A506::func_C18(var_19,"finale_pt03");
	var_1A = lib_A59A::func_3EF4("finale_pt03",var_0C.animname);
	maps\seoul_code_gangnam::func_6F0A("fusion_endlogo");
	var_1B = function_0063(var_1A);
	wait(var_1B - 2);
	var_1C = 2;
	thread func_316B(var_1C);
	wait(var_1C);
	lib_A59A::func_60D3();
}

//Function Number: 204
func_1E69()
{
	var_00 = function_00D6("axis");
	common_scripts\utility::array_call(var_00,::delete);
	if(isdefined(level.var_7C24))
	{
		foreach(var_02 in level.var_7C24)
		{
			if(isdefined(var_02))
			{
				var_02 method_8052();
			}
		}
	}
}

//Function Number: 205
func_316B(param_00)
{
	var_01 = newhudelem();
	var_01.x = 0;
	var_01.y = 0;
	var_01.horzalign = "fullscreen";
	var_01.vertalign = "fullscreen";
	var_01 setshader("black",640,480);
	if(isdefined(param_00) && param_00 > 0)
	{
		var_01.alpha = 0;
		var_01 fadeovertime(param_00);
		var_01.alpha = 1;
		wait(param_00);
	}
}

//Function Number: 206
func_4F90(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_02))
	{
		param_02 = 1.5;
	}

	var_04 = newhudelem();
	var_04.x = 0;
	var_04.y = 0;
	var_04.horzalign = "fullscreen";
	var_04.vertalign = "fullscreen";
	var_04.foreground = 1;
	var_04 setshader(param_00,640,480);
	if(isdefined(param_03) && param_03 > 0)
	{
		var_04.alpha = 0;
		var_04 fadeovertime(param_03);
		var_04.alpha = 1;
		wait(param_03);
	}

	wait(param_01);
	if(isdefined(param_02) && param_02 > 0)
	{
		var_04.alpha = 1;
		var_04 fadeovertime(param_02);
		var_04.alpha = 0;
	}

	var_04 destroy();
}

//Function Number: 207
func_1A7D(param_00)
{
	var_01 = 55;
	level.var_31D method_8031(var_01,0.5);
}

//Function Number: 208
func_1A7C(param_00)
{
	if(!isdefined(level.var_658E))
	{
		level.var_658E = 65;
	}

	level.var_31D method_8031(level.var_658E,0.5);
}

//Function Number: 209
func_1A81(param_00)
{
	var_01 = 4;
	level.var_31D shellshock("seo_canal_finale_blowback",var_01);
}

//Function Number: 210
func_1A7E(param_00)
{
	wait(10);
	level thread lib_A59A::func_61FA("manual_light_rumble_end",8);
	maps\seoul_code_gangnam::func_2BB7("manual_light_rumble_end","damage_light");
	wait(3);
	level.var_31D playrumbleonentity("damage_heavy");
}

//Function Number: 211
func_1A7F(param_00)
{
	level.var_31D playrumbleonentity("damage_light");
}

//Function Number: 212
func_694A(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = newclienthudelem(self);
	var_05.x = 0;
	var_05.y = 0;
	var_05 setshader(param_00,640,480);
	var_05.var_3E4 = 1;
	var_05.alignx = "left";
	var_05.aligny = "top";
	var_05.fontscale = 1;
	var_05.foreground = 0;
	var_05.horzalign = "fullscreen";
	var_05.vertalign = "fullscreen";
	var_05.alpha = 0;
	var_05.var_13C = 1;
	var_06 = 0;
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(!isdefined(param_03))
	{
		param_03 = 1;
	}

	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	var_07 = 0.05;
	if(param_02 > 0)
	{
		var_08 = 0;
		var_09 = param_04 / param_02 / var_07;
		while(var_08 < param_04)
		{
			var_05.alpha = var_08;
			var_08 = var_08 + var_09;
			wait(var_07);
		}
	}

	var_05.alpha = param_04;
	wait(param_01 - param_02 + param_03);
	if(param_03 > 0)
	{
		var_08 = param_04;
		var_0A = param_04 / param_03 / var_07;
		while(var_08 > 0)
		{
			var_05.alpha = var_08;
			var_08 = var_08 - var_0A;
			wait(var_07);
		}
	}

	var_05.alpha = 0;
	var_05 destroy();
}

//Function Number: 213
func_1A7B()
{
	var_00 = func_9BDC();
	var_01 = spawnstruct();
	var_01 thread func_6332(self);
	level.var_6333 = var_01;
	var_02 = 0;
	var_03 = 0;
	var_04 = 0;
	var_05 = 0;
	var_06 = 0;
	for(;;)
	{
		var_07 = func_9BDC();
		var_08 = 0;
		var_05 = 0;
		if(var_07 && !var_00)
		{
			if(!var_06)
			{
				var_06 = 1;
				level.var_31D playrumblelooponentity(self.var_7686);
			}

			if(randomint(100) > self.var_5C28)
			{
				level.var_31D playrumbleonentity("damage_heavy");
			}
			else if(randomint(100) > self.var_5C29)
			{
				level.var_31D playrumbleonentity("damage_light");
			}

			var_01.var_6F23[var_01.var_6F23.size] = gettime();
			var_04 = gettime();
			var_05 = sin(gettime() * 0.2) + 1 * 0.5;
			var_05 = var_05 * self.var_712E;
			var_05 = var_05 + self.rate;
			var_08 = 1;
		}

		if(var_06 && gettime() > var_04 + 300)
		{
			var_06 = 0;
			level.var_31D stoprumble(self.var_7686);
		}

		var_00 = var_07;
		var_09 = 0;
		var_03 = undefined;
		if(isdefined(self.var_7E9D))
		{
			level.var_7F1 = var_03;
		}

		if(isdefined(self.var_1127))
		{
			var_01.var_6334 = 1 - var_03;
			var_01.var_6334 = var_01.var_6334 * 7;
			var_01.var_6334 = clamp(var_01.var_6334,7,1);
		}

		var_0A = abs(var_02 - var_03);
		if(var_0A > 0.05)
		{
			func_60A3(var_03);
			var_02 = var_03;
		}

		if(var_09)
		{
			break;
		}

		wait(0.05);
	}
}

//Function Number: 214
func_9BDC()
{
	return level.var_31D usebuttonpressed();
}

//Function Number: 215
func_6332(param_00)
{
	self endon("stop");
	var_01 = 1500;
	self.var_6F23 = [];
	var_02 = 7;
	for(;;)
	{
		waittillframeend;
		for(var_03 = 0;var_03 < self.var_6F23.size;var_03++)
		{
			var_04 = self.var_6F23[var_03];
			if(var_04 < gettime() - var_01)
			{
				continue;
			}

			break;
		}

		var_05 = [];
		while(var_03 < self.var_6F23.size)
		{
			var_05[var_05.size] = self.var_6F23[var_03];
			var_03++;
		}

		self.var_6F23 = var_05;
		var_06 = self.var_6F23.size - param_00.var_6334 * 0.03;
		var_06 = var_06 * 10;
		var_06 = clamp(var_06,0,1);
		self.var_6335 = var_06;
		wait(0.05);
	}
}

//Function Number: 216
func_60A3(param_00)
{
	if(isdefined(self.var_660E))
	{
		param_00 = self.var_660E;
	}

	var_01 = param_00 + 0.37;
	var_01 = var_01 * 0.22;
	earthquake(var_01,5,level.var_31D.var_2E6,5000);
}

//Function Number: 217
func_427B(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 16;
	}

	lib_A59A::func_7E48(param_02);
	if(isstring(param_00))
	{
		var_03 = getnode(param_00,"script_noteworthy");
	}
	else
	{
		var_03 = param_01;
	}

	if(isdefined(var_03))
	{
		lib_A59A::func_7E45(var_03);
	}
	else
	{
		var_03 = common_scripts\utility::getstruct(param_00,"script_noteworthy");
		lib_A59A::func_7E47(var_03.var_2E6);
	}

	if(param_01)
	{
		self waittill("goal");
	}
}

//Function Number: 218
func_1E63(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 512;
	}

	var_02 = [];
	foreach(var_04 in getentarray(param_00,"script_noteworthy"))
	{
		if(isspawner(var_04))
		{
			var_04 delete();
			continue;
		}

		var_02[var_02.size] = var_04;
	}

	thread lib_A59A::func_8D6(var_02,param_01);
}

//Function Number: 219
func_7B63(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	if(isdefined(param_00))
	{
		lib_A59A::func_9806(param_00);
	}

	var_08 = [];
	if(isdefined(param_02))
	{
		var_09 = getent(param_01,"script_noteworthy");
		for(var_0A = 0;var_0A < param_02;var_0A++)
		{
			var_08[var_08.size] = var_09 lib_A56F::func_72C(1);
		}
	}
	else
	{
		var_08 = lib_A59A::func_D0E(param_01,1);
	}

	foreach(var_0C in var_08)
	{
		if(isdefined(param_03))
		{
			var_0D = getent(param_03,"targetname");
			var_0C method_81A9(var_0D);
		}

		var_0C.var_1D3 = 0;
		var_0C.var_7968 = 1;
		thread func_1C69();
		wait(0.05);
	}

	if(isdefined(param_04) || isdefined(param_05))
	{
		if(!isdefined(param_04))
		{
			common_scripts\utility::flag_wait(param_05);
		}
		else
		{
			var_08 = lib_A59A::func_CFF(var_08);
			while(var_08.size > param_04)
			{
				var_08 = lib_A59A::func_CFF(var_08);
				wait(0.05);
				if(isdefined(param_05) && common_scripts\utility::flag(param_05))
				{
					return;
				}
			}
		}
	}

	if(isdefined(param_06))
	{
		var_0F = getent(param_06,"targetname");
		var_08 = lib_A59A::func_CFD(var_08);
		foreach(var_0C in var_08)
		{
			var_0C method_81A9(var_0F);
		}
	}

	if(isdefined(param_07))
	{
		lib_A59A::func_9FB7(param_07);
		lib_A59A::func_8D6(var_08,40);
	}
}

//Function Number: 220
func_0DE1()
{
	if(!isdefined(self.var_4454) || !self.var_4454)
	{
		playfxontag(level._effect["flashlight"],self,"tag_flash");
		self.var_4454 = 1;
		self notify("flashlight_on_gun");
	}
}

//Function Number: 221
func_7375()
{
	self.var_6716 = undefined;
	self.var_6715 = undefined;
	self.script_animation = undefined;
	lib_A59A::func_1EBB();
	self.var_1C7 = 512;
	self method_81CA("stand","crouch","prone");
	self.var_2AF2 = 0;
	self.var_2B0D = 0;
	self.var_31 = 1;
	if(isdefined(self.var_63C3))
	{
		self.var_C8 = self.var_63C3;
	}

	lib_A59A::func_30AF();
}

//Function Number: 222
func_7B4F()
{
	self endon("death");
	level.var_21DF.ignoreall = 1;
	level.var_A31B.ignoreall = 1;
	level.var_520E.ignoreall = 1;
	lib_A59E::func_4277(self);
	self.ignoreall = 1;
	self.var_26 = "noncombat";
	self.health = 50;
	self setcandamage(1);
	self sentient_makeentitysentient(self.var_7AE9);
	thread lib_A5CE::func_2EAC();
	self method_8041("grenade danger");
	self method_8041("gunshot");
	self method_8041("bulletwhizby");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"death");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"damage");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"ai_event");
	lib_A59A::func_75F(::common_scripts\utility::flag_set,"wakeup_drones");
	thread lib_A59A::func_2BDC();
	common_scripts\utility::flag_wait("wakeup_drones");
	self.ignoreall = 0;
	self.target = undefined;
	lib_A59A::func_9CAB();
	thread lib_A62B::func_3926();
	wait(0.05);
	thread lib_A5CE::func_2EC4(self);
	level.var_21DF.ignoreall = 0;
	level.var_A31B.ignoreall = 0;
	level.var_520E.ignoreall = 0;
}

//Function Number: 223
func_1C69()
{
	self notify("started_color_node_quick");
	self endon("started_color_node_quick");
	self endon("death");
	for(;;)
	{
		self waittill("color_code_move_update",var_00);
		thread func_1C6A();
		var_01 = 0;
		if(var_01 == 0)
		{
			self.ignoreall = 1;
			self.var_1C7 = 20;
			common_scripts\utility::waittill_any("goal","damage","player_close");
			self.ignoreall = 0;
			self.var_1C7 = 500;
		}

		self waittill("goal");
		self.var_180 = 0;
		wait 0.05;
	}
}

//Function Number: 224
func_1C6A()
{
	self notify("started_color_node_quick_close_check");
	self endon("started_color_node_quick_close_check");
	self endon("death");
	self endon("damage");
	self endon("goal");
	while(distancesquared(level.var_31D.var_2E6,self.var_2E6) > squared(100))
	{
		wait(0.25);
	}

	self notify("player_close");
}

//Function Number: 225
func_7B49(param_00,param_01,param_02)
{
	lib_A506::func_BFF(param_00,"seo_canal_overlook_anim");
	thread lib_A506::func_BE1(param_00,"seo_canal_overlook_anim",param_02);
}

//Function Number: 226
func_7B48(param_00,param_01,param_02)
{
	param_00 endon("death");
	if(isdefined(param_02) && param_02)
	{
		lib_A506::func_BD0(param_00,param_01);
	}
	else
	{
		param_00 method_81A6(self.var_2E6);
		while(distance(param_00.var_2E6,self.var_2E6) > 32)
		{
			wait(0.05);
		}
	}

	param_00 notify("new_anim_reach");
	self notify("reach_notify");
	lib_A506::func_BC9(param_00,param_01);
	param_00 notify("anim_reached_and_played");
}

//Function Number: 227
func_8568()
{
	var_00 = getscriptablearray("destp_seo_shopping_district_sign_02","targetname");
	var_01 = getscriptablearray("destp_seo_shopping_district_sign_02","targetname");
	var_02 = getentarray("scriptable_destp_advertisement_inside_03","classname");
	var_03 = getentarray("scriptable_destp_advertisement_inside_04","classname");
	var_04 = getscriptablearray("destp_seo_shopping_district_sign_06","targetname");
	var_05 = getscriptablearray("destp_seo_shopping_district_sign_07","targetname");
	var_06 = getscriptablearray("destp_seo_electrical_box_02","targetname");
	level.var_38A1 = var_00;
	level.var_38A1 = common_scripts\utility::array_combine(level.var_38A1,var_01);
	level.var_38A1 = common_scripts\utility::array_combine(level.var_38A1,var_02);
	level.var_38A1 = common_scripts\utility::array_combine(level.var_38A1,var_03);
	level.var_38A1 = common_scripts\utility::array_combine(level.var_38A1,var_04);
	level.var_38A1 = common_scripts\utility::array_combine(level.var_38A1,var_05);
	level.var_38A1 = common_scripts\utility::array_combine(level.var_38A1,var_06);
	level.var_38A1 = common_scripts\utility::array_removeundefined(level.var_38A1);
	foreach(var_08 in level.var_38A1)
	{
		var_08 thread func_8569();
	}
}

//Function Number: 228
func_8569()
{
	self waittill("state_changed",var_00,var_01,var_02,var_03,var_04,var_05);
	var_06 = function_00D6();
	var_06 = lib_A59A::func_CFF(var_06);
	foreach(var_08 in var_06)
	{
		if(distance(var_08.var_2E6,self.var_2E6) < 200)
		{
			var_08 lib_A59A::func_38A9(randomfloatrange(1,1.5));
		}
	}

	level.var_38A1 = common_scripts\utility::array_remove(level.var_38A1,self);
}

//Function Number: 229
func_7B6D(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = param_00;
	foreach(var_08 in var_06)
	{
		if(isdefined(param_01))
		{
			var_09 = getent(param_01,"targetname");
			var_08 method_81A9(var_09);
		}

		var_08.var_1D3 = 0;
		var_08 thread func_1C69();
		wait(0.05);
	}

	if(isdefined(param_02) || isdefined(param_03))
	{
		if(!isdefined(param_02))
		{
			common_scripts\utility::flag_wait(param_03);
		}
		else
		{
			var_06 = lib_A59A::func_CFF(var_06);
			while(var_06.size > param_02)
			{
				var_06 = lib_A59A::func_CFF(var_06);
				wait(0.05);
				if(isdefined(param_03) && common_scripts\utility::flag(param_03))
				{
					return;
				}
			}
		}
	}

	if(isdefined(param_04))
	{
		var_0B = getent(param_04,"targetname");
		var_06 = lib_A59A::func_CFD(var_06);
		foreach(var_08 in var_06)
		{
			var_08 method_81A9(var_0B);
		}
	}

	if(isdefined(param_05))
	{
		lib_A59A::func_9FB7(param_05);
		lib_A59A::func_8D6(var_06,40);
	}
}

//Function Number: 230
func_14BC(param_00)
{
	self endon("death");
	if(!issentient(self) || !isalive(self))
	{
		return;
	}

	if(isdefined(self.var_14BC) && self.var_14BC)
	{
		return;
	}

	self.var_14BC = 1;
	if(isdefined(param_00))
	{
		wait(randomfloat(param_00));
	}

	var_01 = [];
	var_01[0] = "j_hip_le";
	var_01[1] = "j_hip_ri";
	var_01[2] = "j_head";
	var_01[3] = "j_spine4";
	var_01[4] = "j_elbow_le";
	var_01[5] = "j_elbow_ri";
	var_01[6] = "j_clavicle_le";
	var_01[7] = "j_clavicle_ri";
	for(var_02 = 0;var_02 < 3 + randomint(5);var_02++)
	{
		var_03 = randomintrange(0,var_01.size);
		thread func_14BE(var_01[var_03],undefined);
		wait(randomfloat(0.1));
	}

	self dodamage(self.health + 50,self.var_2E6);
}

//Function Number: 231
func_14BE(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = level._effect["flesh_hit"];
	}

	playfxontag(param_01,self,param_00);
}

//Function Number: 232
func_7CED(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		level.var_31D playrumbleonentity("damage_light");
		return;
	}

	if(isarray(param_01))
	{
		var_02 = param_01[0];
		var_03 = param_01[1];
		var_04 = param_01[2];
		wait(var_03);
	}
	else
	{
		var_02 = var_02;
	}

	var_05 = randomfloat(1000);
	var_06 = "rumble_heavy" + var_05;
	level thread lib_A59A::func_61FA(var_06,var_02);
	level endon(var_06);
	for(;;)
	{
		level.var_31D playrumbleonentity("damage_light");
		wait(0.1);
	}
}

//Function Number: 233
func_7CEC(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		level.var_31D playrumbleonentity("damage_heavy");
		return;
	}

	if(isarray(param_01))
	{
		var_02 = param_01[0];
		var_03 = param_01[1];
		var_04 = param_01[2];
		wait(var_03);
	}
	else
	{
		var_02 = var_02;
	}

	var_05 = randomfloat(1000);
	var_06 = "rumble_heavy" + var_05;
	level thread lib_A59A::func_61FA(var_06,var_02);
	level endon(var_06);
	for(;;)
	{
		level.var_31D playrumbleonentity("damage_light");
		wait(0.1);
	}
}