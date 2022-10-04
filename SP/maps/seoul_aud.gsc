/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_aud.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 301
 * Decompile Time: 11263 ms
 * Timestamp: 4/20/2022 8:21:13 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_2110();
	func_4D58();
	func_4CF1();
	func_5622();
	func_5615();
	func_23C4();
	func_6EC8();
	func_72E5();
}

//Function Number: 2
func_72E5()
{
	lib_A5DE::snd_register_message("snd_zone_handler",::func_A3DD);
	lib_A5DE::snd_register_message("snd_music_handler",::func_5FFA);
	lib_A5DE::snd_register_message("start_seoul_intro",::func_8C7F);
	lib_A5DE::snd_register_message("start_seoul_first_land_assist",::func_8C7C);
	lib_A5DE::snd_register_message("start_seoul_enemy_encounter_01",::func_8C7A);
	lib_A5DE::snd_register_message("start_seoul_missle_evade_sequence",::func_8C80);
	lib_A5DE::snd_register_message("start_seoul_forward_operating_base",::func_8C7D);
	lib_A5DE::snd_register_message("start_seoul_drone_swarm_intro",::func_8C78);
	lib_A5DE::snd_register_message("start_seoul_truck_push",::func_8C85);
	lib_A5DE::snd_register_message("start_seoul_hotel_entrance",::func_8C7E);
	lib_A5DE::snd_register_message("start_seoul_building_jump_sequence",::func_8C73);
	lib_A5DE::snd_register_message("start_seoul_sinkhole_start",::func_8C83);
	lib_A5DE::snd_register_message("start_seoul_subway_start",::func_8C84);
	lib_A5DE::snd_register_message("start_seoul_shopping_district_start",::func_8C82);
	lib_A5DE::snd_register_message("start_seoul_shopping_district_flee_swarm",::func_8C81);
	lib_A5DE::snd_register_message("start_seoul_canal_intro",::func_8C76);
	lib_A5DE::snd_register_message("start_seoul_canal_combat_start",::func_8C75);
	lib_A5DE::snd_register_message("start_seoul_canal_combat_pt2",::func_8C74);
	lib_A5DE::snd_register_message("start_seoul_finale_scene_start",::func_8C7B);
	lib_A5DE::snd_register_message("start_seoul_e3_presentation",::func_8C79);
	lib_A5DE::snd_register_message("start_seoul_cover_art",::func_8C77);
	lib_A5DE::snd_register_message("dialogue_droppod_intro_prelaunch",::func_2A02);
	lib_A5DE::snd_register_message("pod_phase1a_start",::func_6E0E);
	lib_A5DE::snd_register_message("droppod_intro_radio_duck",::func_2F81);
	lib_A5DE::snd_register_message("droppod_intro_blimp_missile",::func_2F7F);
	lib_A5DE::snd_register_message("droppod_intro_blimp_explode",::func_2F7E);
	lib_A5DE::snd_register_message("droppod_main_pod_jets",::func_2F84);
	lib_A5DE::snd_register_message("droppod_phase_2b_begin",::func_2F85);
	lib_A5DE::snd_register_message("droppod_first_building_impact",::func_2F79);
	lib_A5DE::snd_register_message("droppod_final_impact",::func_2F78);
	lib_A5DE::snd_register_message("droppod_harness_left_1",::func_2F7A);
	lib_A5DE::snd_register_message("droppod_harness_left_2",::func_2F7B);
	lib_A5DE::snd_register_message("droppod_harness_right_1",::func_2F7C);
	lib_A5DE::snd_register_message("droppod_harness_right_2",::func_2F7D);
	lib_A5DE::snd_register_message("seo_vista_amb_explos",::func_7D79);
	lib_A5DE::snd_register_message("midair_exp_audio",::func_5C07);
	lib_A5DE::snd_register_message("midair_exp_glass",::func_5C08);
	lib_A5DE::snd_register_message("vista_rockets",::func_9E8B);
	lib_A5DE::snd_register_message("vista_rockets_first_impact",::func_9E8C);
	lib_A5DE::snd_register_message("vista_rockets_pod_door_view_01",::func_9E8D);
	lib_A5DE::snd_register_message("vista_rockets_pod_door_view_02",::func_9E8E);
	lib_A5DE::snd_register_message("seo_dirt_explosions",::func_7CD0);
	lib_A5DE::snd_register_message("seo_fireball_explosions",::func_7D06);
	lib_A5DE::snd_register_message("seo_ambient_ground_explosions",::func_7CC7);
	lib_A5DE::snd_register_message("aud_handle_vista_jets",::func_0F5B);
	lib_A5DE::snd_register_message("seo_vista_bombing_run",::func_7D7A);
	lib_A5DE::snd_register_message("hotel_razorback_fly_by",::func_4A45);
	lib_A5DE::snd_register_message("seo_intro_patrol_drones",::func_7D17);
	lib_A5DE::snd_register_message("missiles_strike_building",::func_5CC1);
	lib_A5DE::snd_register_message("missiles_strike_explo",::func_5CC2);
	lib_A5DE::snd_register_message("shockwave_begin",::func_83CD);
	lib_A5DE::snd_register_message("hotel_windows_explode",::func_4A47);
	lib_A5DE::snd_register_message("seo_fob_tank_procedural",::func_7D13);
	lib_A5DE::snd_register_message("seo_fob_tank_01",::func_7D10);
	lib_A5DE::snd_register_message("seo_fob_tank_02",::func_7D11);
	lib_A5DE::snd_register_message("seo_fob_tank_03",::func_7D12);
	lib_A5DE::snd_register_message("seo_fob_initial_razorback",::func_7D08);
	lib_A5DE::snd_register_message("seo_fob_fake_jet_flyby",::func_7D07);
	lib_A5DE::snd_register_message("seo_fob_razorback_01",::func_7D0E);
	lib_A5DE::snd_register_message("seo_fob_razorback_02",::func_7D0F);
	lib_A5DE::snd_register_message("sidewinder_missile",::func_855B);
	lib_A5DE::snd_register_message("aud_handle_gangam_jets",::func_0F54);
	lib_A5DE::snd_register_message("fob_meetup_vo",::func_3952);
	lib_A5DE::snd_register_message("walker_step_over",::func_A116);
	lib_A5DE::snd_register_message("titan_walker_weapon_fire",::func_9395);
	lib_A5DE::snd_register_message("titan_walker_explo",::func_9393);
	lib_A5DE::snd_register_message("seo_big_car_explo",::func_7CCB);
	lib_A5DE::snd_register_message("seo_truck_explo",::func_7D77);
	lib_A5DE::snd_register_message("start_drone_barrage_submix",::func_8B86);
	lib_A5DE::snd_register_message("seo_single_drones_flyby",::func_7D6F);
	lib_A5DE::snd_register_message("seo_drone_missile",::func_7CD1);
	lib_A5DE::snd_register_message("seo_drone_missile_impact",::func_7CD2);
	lib_A5DE::snd_register_message("seo_will_car_door_explo",::func_7D7B);
	lib_A5DE::snd_register_message("seo_start_drone_submix",::func_7D72);
	lib_A5DE::snd_register_message("drone_kamikaze_hit_player",::func_2E7D);
	lib_A5DE::snd_register_message("car_door_broken",::func_1B6A);
	lib_A5DE::snd_register_message("player_enter_walker_anim",::func_6AEA);
	lib_A5DE::snd_register_message("cherry_picker_target_add",::func_1D35);
	lib_A5DE::snd_register_message("cherry_picker_target_remove",::func_1D36);
	lib_A5DE::snd_register_message("player_exit_walker_anim",::func_6AF3);
	lib_A5DE::snd_register_message("seo_swarm_emp_wave",::func_7D76);
	lib_A5DE::snd_register_message("seo_swarm_die",::func_7D75);
	lib_A5DE::snd_register_message("seo_video_log_start",::func_7D78);
	lib_A5DE::snd_register_message("seo_hotel_ent_wp_takeoff",::func_7D16);
	lib_A5DE::snd_register_message("seo_zipline_harpoon_fire",::func_7D7F);
	lib_A5DE::snd_register_message("seo_zipline_harpoon_impact",::func_7D80);
	lib_A5DE::snd_register_message("seo_zipline_rappel_begin",::func_7D81);
	lib_A5DE::snd_register_message("seo_zipline_rappel_land",::func_7D82);
	lib_A5DE::snd_register_message("seo_zipline_retract_rope",::func_7D83);
	lib_A5DE::snd_register_message("seo_per_arts_jump_explo_3",::func_7D34);
	lib_A5DE::snd_register_message("sinkhole_drones_start",::func_8594);
	lib_A5DE::snd_register_message("seo_sinkhole_wp_flyby",::func_7D70);
	lib_A5DE::snd_register_message("sinkhole_truck_fall",::func_85A2);
	lib_A5DE::snd_register_message("sinkhole_truck_explode",::func_85A1);
	lib_A5DE::snd_register_message("subway_bomb_shake",::func_8F84);
	lib_A5DE::snd_register_message("subway_doors_opening",::func_8F8E);
	lib_A5DE::snd_register_message("subway_doors_closing",::func_8F8D);
	lib_A5DE::snd_register_message("subway_gate_triggered",::func_8F95);
	lib_A5DE::snd_register_message("seo_meet_atlas_slowmo_start",::func_7D22);
	lib_A5DE::snd_register_message("seo_meet_atlas_slowmo_end",::func_7D21);
	lib_A5DE::snd_register_message("subway_gate_atlas_meetup_close",::func_8F94);
	lib_A5DE::snd_register_message("sd_intersection_chopper",::func_7B56);
	lib_A5DE::snd_register_message("shopping_district_turret_truck",::func_8420);
	lib_A5DE::snd_register_message("vo_sd_demo_team_call",::func_9F18);
	lib_A5DE::snd_register_message("seo_smoke_grenade_ambush",::func_7D71);
	lib_A5DE::snd_register_message("shopping_district_glass_smashed",::func_841B);
	lib_A5DE::snd_register_message("shopping_district_glass_hit_after_smashed",::func_841A);
	lib_A5DE::snd_register_message("shopping_district_panel_smashed",::func_841E);
	lib_A5DE::snd_register_message("shopping_district_panel_swing",::func_841F);
	lib_A5DE::snd_register_message("seo_binocs_equip",::func_7CCC);
	lib_A5DE::snd_register_message("canal_binocs_zoom_in",::func_1A60);
	lib_A5DE::snd_register_message("canal_binocs_zoom_out",::func_1A61);
	lib_A5DE::snd_register_message("canal_binocs_stop_zoom_in",::func_1A5E);
	lib_A5DE::snd_register_message("canal_binocs_stop_zoom_out",::func_1A5F);
	lib_A5DE::snd_register_message("binocs_put_away",::func_1478);
	lib_A5DE::snd_register_message("canal_jet_flyover",::func_1A8C);
	lib_A5DE::snd_register_message("seo_canal_razorback",::func_7CCF);
	lib_A5DE::snd_register_message("razorback_fire_start",::func_7154);
	lib_A5DE::snd_register_message("razorback_fire_stop",::func_7155);
	lib_A5DE::snd_register_message("havoc_missile_launch",::func_4760);
	lib_A5DE::snd_register_message("seo_canal_heli_attacked",::func_7CCE);
	lib_A5DE::snd_register_message("timed_charges_vo",::func_9359);
	lib_A5DE::snd_register_message("seo_finale_start",::func_7CEE);
	lib_A5DE::snd_register_message("seo_finale_wp_init_explo",::func_7D00);
	lib_A5DE::snd_register_message("seo_finale_wp_wing_explo",::func_7D05);
	lib_A5DE::snd_register_message("seo_finale_wp_belly_explo",::func_7CFD);
	lib_A5DE::snd_register_message("seo_finale_wp_big_explo",::func_7CFE);
	lib_A5DE::snd_register_message("e3_demo_fade_out",::func_2FF7);
	lib_A5DE::snd_register_message("e3_demo_fade_in",::func_2FF6);
	lib_A5DE::snd_register_message("e3_end_logo",::func_2FF9);
}

//Function Number: 3
func_2110()
{
	lib_A5D2::func_7EC2("shg");
	lib_A5ED::func_8751("med_occlusion");
	lib_A5D4::func_5CEF("seoul_global_mix");
}

//Function Number: 4
func_4D58()
{
	common_scripts\utility::flag_init("start_subway_pa_message");
}

//Function Number: 5
func_4CF1()
{
	level.var_E57.var_47A0 = 0;
	level.var_E57.var_475F = 0;
	level.var_E57.var_4C0C = 0;
}

//Function Number: 6
func_5622()
{
	if(lib_A5D2::func_FAA())
	{
		return;
	}

	thread func_80D9();
	thread func_8266();
	thread func_8162();
	thread func_80EE();
	thread func_8141();
	thread func_3956();
	thread func_80D3();
	thread func_8227();
	thread func_8F9E();
	thread func_80F7();
	thread func_7D8C();
}

//Function Number: 7
func_5615()
{
	thread func_5610();
	lib_A5F1::func_873A("emt_seo_fire_small",(32238,6710,1338),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(31873,6752,1414),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(31873,6752,1414),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(32068,7084,1460),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(31807,7054,1383),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(31634,7290,1420),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(31420,7689,1520),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(31418,7998,1742),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(31418,7998,1742),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(31418,7998,1742),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(30905,7540,1353),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(30921,8161,1430),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(30808,7442,1338),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(30828,7187,1386),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(30612,7216,1340),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(29861,7601,1315),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(29132,7638,1331),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(28990,7701,1331),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(28998,7240,1329),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(28449,6820,1330),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(28398,6540,1331),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(28334,6422,1373),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(28726,6594,1366),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(28258,6904,1296),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(27979,6930,1328),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(28186,7205,1296),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(28784,7511,1324),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(28327,7558,1325),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(28210,7758,1329),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(28116,7669,1324),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(28020,7693,1325),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(27862,7733,1327),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(27913,7439,1317),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(28270,8013,1430),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(28270,8013,1430),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(30844,7203,1392),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(29183,7679,1343),"stop_fire_emitters");
	thread func_5623();
	thread func_5616();
	lib_A5F1::func_873A("emt_seo_fire_small",(27090,9374,1367),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(26840,9404,1452),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(25151,13047,1561),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(25119,13093,1554),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(25419,13932,1768),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(25173,13935,1894),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(25410,14107,1606),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(25177,14136,1586),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(24827,15336,1772),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(24603,15340,1103),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(24908,14815,1146),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(24462,13943,1091),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(24426,13850,1103),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(24136,14095,1093),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(23342,13696,1309),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(22859,13905,1332),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(23273,13938,832),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(22982,15887,928),"stop_fire_emitters");
	thread func_5621();
	lib_A5F1::func_873A("emt_seo_fire_small",(32238,6710,1338),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(32068,7084,1460),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(31873,6752,1414),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(31873,6752,1414),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(28186,7205,1296),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(14625,19881,1319),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(13295,20327,1319),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(14447,19465,1327),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(14735,19251,1319),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(14500,19031,1319),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(13367,17818,1319),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(13312,20757,1315),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(13587,20890,1327),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(13514,20914,1349),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(13514,20914,1349),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(13731,20562,1227),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(14102,21629,1296),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(14102,21629,1296),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(13875,21989,1309),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(13875,21989,1309),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(14302,21252,1201),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(14879,19029,1360),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(14021,21051,1255),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(13841,21951,1255),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(14324,20269,1215),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(14345,19858,1215),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(13776,19377,1215),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(14318,18955,1215),"stop_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(13720,18688,1215),"stop_fire_emitters");
	thread func_561C();
}

//Function Number: 8
func_5610()
{
	if(level.currentgen && !function_021E("seoul_intro_building_descend_tr") || !function_021E("seoul_fob_tr"))
	{
		level common_scripts\utility::waittill_any("transients_intro","transients_intro_to_fob");
	}

	lib_A5F1::func_873A("emt_seo_fire_medium_intro",(36063,10603,4356),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(36003,10603,4368),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(36128,10167,4384),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(35950,10251,4508),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(36033,10271,4508),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large_intro",(36003,10510,4512),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(35350,9559,4388),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger_intro",(35695,10575,4381),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(35353,9560,4388),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(35014,9674,4384),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger_intro",(34950,9604,4406),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium_intro",(34950,9604,4406),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(34860,9096,3812),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(34858,9323,4184),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(34893,9243,4150),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(34794,3993,3976),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(34860,9088,3821),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(34738,9053,3810),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(34692,8995,3832),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(34738,9053,3810),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(35575,8609,3635),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(35575,8609,3635),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(35276,8668,3603),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(35278,8473,3626),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(35229,8631,3468),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(35664,8568,3468),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(35563,8693,3416),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small",(35539,8427,3434),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger_intro",(35323,8508,3228),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium_intro",(35323,8508,3228),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger",(35349,8632,3083),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large_intro",(35785,8692,3068),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium",(35785,8692,3068),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger_intro",(35353,8617,3068),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger_intro",(35602,9027,1447),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_medium_intro",(35602,9027,1447),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large",(35376,9090,1361),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_larger_intro",(34794,8918,1425),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(34960,8434,1379),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(34575,8477,1375),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(35689,9150,1409),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(35507,9218,1399),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_small_intro",(35522,8782,1438),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_fire_large_intro",(35369,9071,1368),"stop_intro_fire_emitters");
	lib_A5F1::func_873A("emt_seo_int_wind",(36312,10538,4400),"stop_wind_emitters");
	lib_A5F1::func_873A("emt_seo_int_wind",(35377,9209,4553),"stop_wind_emitters");
	lib_A5F1::func_873A("emt_seo_int_wind",(35377,9209,4553),"stop_wind_emitters");
	lib_A5F1::func_873A("emt_seo_int_wind",(35378,9133,2313),"stop_wind_emitters");
	lib_A5F1::func_873A("emt_seo_int_combat_high_01",(36182,10530,4330),"stop_combat_emitters");
	lib_A5F1::func_873A("emt_seo_int_combat_high_02",(36182,10530,4330),"stop_combat_emitters");
	lib_A5F1::func_873A("emt_seo_int_combat_high_03",(36182,10530,4330),"stop_combat_emitters");
	lib_A5F1::func_873A("emt_seo_int_combat_jets_bombs",(36182,10530,4330),"stop_combat_emitters");
	if(level.currentgen)
	{
		level waittill("pre_transients_drone_seq_one_to_trusk_push");
		level notify("stop_intro_fire_emitters");
		level notify("stop_wind_emitters");
		level notify("stop_combat_emitters");
	}
}

//Function Number: 9
func_5623()
{
	if(level.currentgen && !function_021E("seoul_truck_push_trans_tr"))
	{
		level waittill("transients_drone_seq_one_to_truck_push");
	}

	lib_A5F1::func_873A("emt_seo_smartglass_glitchy",(25201,11941,1833),"stop_mall_electronic_emitters");
	if(level.currentgen)
	{
		level waittill("pre_transients_mall_office_to_sinkhole_subway");
		level notify("stop_mall_electronic_emitters");
	}
}

//Function Number: 10
func_5616()
{
	if(level.currentgen && !function_021E("seoul_mall_offices_tr"))
	{
		level waittill("transients_truck_push_to_mall_office");
	}

	lib_A5F1::func_873A("emt_seo_steam",(25231,14575,1764),"stop_steam_emitters");
	if(level.currentgen)
	{
		level waittill("pre_transients_sinkhole_subway_to_subway");
		level notify("stop_steam_emitters");
	}
}

//Function Number: 11
func_5621()
{
	if(level.currentgen && !function_021E("seoul_sinkhole_subway_tr"))
	{
		level waittill("transients_mall_office_to_sinkhole_subway");
	}

	lib_A5F1::func_873A("emt_seo_smartglass_glitchy",(22118,15809,920),"stop_subway_electronic_emitters");
	lib_A5F1::func_873A("emt_seo_smartglass_glitchy",(22449,16358,1161),"stop_subway_electronic_emitters");
	lib_A5F1::func_873A("emt_seo_smartglass_glitchy",(22446,16602,1161),"stop_subway_electronic_emitters");
	lib_A5F1::func_873A("emt_seo_smartglass_glitchy",(22173,17055,1208),"stop_subway_electronic_emitters");
	lib_A5F1::func_873A("emt_seo_smartglass_glitchy",(21729,16646,1125),"stop_subway_electronic_emitters");
	lib_A5F1::func_873A("emt_seo_smartglass_glitchy",(20744,16357,1161),"stop_subway_electronic_emitters");
	lib_A5F1::func_873A("emt_seo_smartglass_glitchy",(21029,16972,1120),"stop_subway_electronic_emitters");
	if(level.currentgen)
	{
		level waittill("pre_transients_subway_to_shopping_dist");
		level notify("stop_subway_electronic_emitters");
	}
}

//Function Number: 12
func_561C()
{
	if(level.currentgen && !function_021E("seoul_riverwalk_tr"))
	{
		level waittill("transients_canal_overlook_to_riverwalk");
	}

	lib_A5F1::func_873A("emt_seo_waterfall_fountain",(14237,17799,1338),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_fountain",(13886,17782,1338),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_fountain",(14029,17786,1338),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_sml",(14257,17889,1312),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_sml",(13828,17896,1312),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_sml",(14042,17895,1312),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_lrg",(14257,17889,1298),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_lrg",(13828,17896,1298),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_lrg",(14037,17981,1298),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_ground",(14257,17889,1191),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_ground",(13828,17896,1191),"stop_water_emitters");
	lib_A5F1::func_873A("emt_seo_waterfall_ground",(14016,17989,1191),"stop_water_emitters");
}

//Function Number: 13
func_23C4()
{
	level.var_E57.var_3336 = [];
	level.var_E57.var_3336["example_envelop"] = [[0,0],[0.082,0.426],[0.238,0.736],[0.408,0.844],[0.756,0.953],[1,1]];
	level.var_E57.var_3336["havoc_speed_of_sound"] = [[500,0],[750,0.05],[1500,0.1],[2000,0.15],[2500,0.2],[3000,0.25],[3500,0.3],[4000,0.35],[4200,0.4],[4500,0.45],[5000,0.5],[6000,1]];
	level.var_E57.var_3336["player_fall_foley"] = [[499,0],[500,0.2],[600,0.4],[800,0.6],[1400,1]];
}

//Function Number: 14
func_6EC8()
{
}

//Function Number: 15
func_A3DD(param_00,param_01)
{
	var_02 = "";
	var_03 = "";
	if(getsubstr(param_00,0,6) == "enter_")
	{
		var_02 = param_01;
	}
	else if(getsubstr(param_00,0,5) == "exit_")
	{
		var_03 = param_01;
	}

	switch(param_00)
	{
		case "enter_ext_crashshite":
			break;

		case "exit_ext_crashsite":
			break;

		case "exit_int_crashsite":
			break;

		case "enter_int_crashsite":
			break;

		case "enter_int_bedroom":
			break;

		case "exit_int_bedroom":
			break;

		case "enter_int_mall":
			break;

		case "exit_ext_building_jump_01":
			break;

		case "exit_ext_shopping_district":
			break;
	}
}

//Function Number: 16
func_5FF8(param_00,param_01)
{
	thread func_5FFA(param_00,param_01);
}

//Function Number: 17
func_5FFA(param_00,param_01)
{
	level notify("stop_current_music_thread");
	level endon("stop_current_music_thread");
	var_02 = 1;
	switch(param_00)
	{
		case "mus_podcrash_done":
			break;

		case "mus_seo_swarm_emp_wave_done":
			break;

		case "enter_int_mall":
			break;

		case "exit_int_mall":
			break;

		case "dialogue_atlas_meetup_done":
			break;

		case "exit_subway":
			break;

		case "mus_sd_firefight_ending":
			break;

		case "mus_canal_action_begin":
			break;

		case "mus_canal_swarm_chasing_off_razorback":
			break;

		case "mus_canal_combat_done":
			break;

		case "mus_will_death_plant_charge_part2":
			break;

		case "mus_finale_wp_explo_01":
			break;

		case "mus_mitchels_arm":
			break;

		default:
			break;
	}
}

//Function Number: 18
func_4619(param_00,param_01)
{
	level waittill("aud_npc_droppod_landing");
	wait 0.05;
	level waittill("aud_npc_droppod_landing");
	wait(1);
	common_scripts\utility::flag_set(param_01);
}

//Function Number: 19
func_695E(param_00)
{
	var_01 = 36;
	var_02 = 559;
	var_03 = 0.1;
	var_04 = 1.25;
	var_05 = 0.1;
	var_06 = (34513,8315,1396);
	var_07 = 0.5;
	var_08 = 1;
	var_09 = [[var_01,var_04],[var_02,var_03]];
	var_0A = [[var_01,var_08],[var_02,var_07]];
	var_0B = distance2d(level.var_31D.var_2E6,var_06);
	var_0C = lib_A5DE::func_8702(var_0B,var_09);
	lib_A5D2::func_108C(var_07,0);
	var_0D = "stop_hotel_exit_adaptive_music";
	var_0E = lib_A5F1::func_8739("seo_mus_hotel_exit",var_0D,0,1,1);
	var_0F = lib_A5F1::func_8739("seo_mus_hotel_exit_lyr_gtr",var_0D,0,1,var_0C);
	while(!common_scripts\utility::flag(param_00))
	{
		var_0B = distance2d(level.var_31D.var_2E6,var_06);
		var_0C = lib_A5DE::func_8702(var_0B,var_09);
		var_0F scalevolume(var_0C,var_05);
		var_10 = lib_A5DE::func_8702(var_0B,var_0A);
		lib_A5D2::func_108C(var_10,var_05);
		wait(var_05);
	}

	wait(0.5);
	level notify(var_0D);
}

//Function Number: 20
func_8C7F()
{
	lib_A5DD::func_123A("int_pod");
}

//Function Number: 21
func_8C7C()
{
	level notify("aud_listen_fall_foley");
	lib_A5DD::func_123A("int_atrium");
}

//Function Number: 22
func_8C7A()
{
	lib_A5DD::func_123A("int_window_blowout_room");
}

//Function Number: 23
func_8C80()
{
	lib_A5DD::func_123A("int_atrium");
}

//Function Number: 24
func_8C7D()
{
	lib_A5DD::func_123A("int_atrium");
}

//Function Number: 25
func_8C78()
{
	lib_A5DD::func_123A("ext_fob");
}

//Function Number: 26
func_8C85()
{
	lib_A5DD::func_123A("ext_drone_swarm_street");
	func_5FF8("mus_seo_swarm_emp_wave_done");
}

//Function Number: 27
func_8C7E()
{
	lib_A5DD::func_123A("ext_post_drone_swarm_alley");
	func_5FF8("mus_seo_swarm_emp_wave_done");
}

//Function Number: 28
func_8C73()
{
	lib_A5DD::func_123A("int_mall");
}

//Function Number: 29
func_8C83()
{
	lib_A5DD::func_123A("ext_building_jump_02");
}

//Function Number: 30
func_8C84()
{
	lib_A5DD::func_123A("int_subway_docking");
}

//Function Number: 31
func_8C82()
{
	lib_A5DD::func_123A("int_subway");
}

//Function Number: 32
func_8C81()
{
	lib_A5DD::func_123A("ext_shopping_district");
	lib_A5D4::func_5CEF("seo_canal_vehicle_management");
}

//Function Number: 33
func_8C76()
{
	lib_A5DD::func_123A("int_club");
	lib_A5D4::func_5CEF("seo_canal_vehicle_management");
}

//Function Number: 34
func_8C75()
{
	lib_A5DD::func_123A("int_club");
	lib_A5D4::func_5CEF("seo_canal_combat",0.05);
	lib_A5D4::func_5CEF("seo_canal_vehicle_management");
}

//Function Number: 35
func_8C74()
{
	lib_A5DD::func_123A("ext_club");
	lib_A5D4::func_5CEF("seo_canal_combat",0.05);
	lib_A5D4::func_5CEF("seo_canal_vehicle_management");
}

//Function Number: 36
func_8C7B()
{
	lib_A5DD::func_123A("ext_canal");
	lib_A5D4::func_5CF3("seo_canal_combat",0.05);
}

//Function Number: 37
func_8C79()
{
	lib_A5DD::func_123A("ext_club");
}

//Function Number: 38
func_8C77()
{
}

//Function Number: 39
func_2F81()
{
	wait(0.5);
	lib_A5D4::func_5CEF("droppod_intro_radio_duck",1);
	wait(5);
	lib_A5D4::func_5CF3("droppod_intro_radio_duck",1);
}

//Function Number: 40
func_80D9()
{
	lib_A506::func_807("player_rig","seo_pod_enter_start",::func_7D4C,"pod_phase1a");
	lib_A506::func_807("player_rig","seo_pod_enter_player_fs",::func_7D45,"pod_phase1a");
	lib_A506::func_807("player_rig","seo_pod_enter_player_lt_hand",::func_7D46,"pod_phase1a");
	lib_A506::func_807("player_rig","seo_pod_enter_player_rt_hand",::func_7D49,"pod_phase1a");
	lib_A506::func_807("player_rig","seo_pod_enter_player_lt_reach",::func_7D48,"pod_phase1a");
	lib_A506::func_807("player_rig","seo_pod_enter_player_lt_pull",::func_7D47,"pod_phase1a");
	lib_A506::func_807("player_rig","seo_pod_enter_player_rt_reach",::func_7D4B,"pod_phase1a");
	lib_A506::func_807("player_rig","seo_pod_enter_player_rt_pull",::func_7D4A,"pod_phase1a");
	lib_A506::func_807("will_irons","seo_pod_enter_will_fs",::func_7D4D,"pod_phase1a");
	lib_A506::func_807("will_irons","seo_pod_enter_will_lt_reach",::func_7D4F,"pod_phase1a");
	lib_A506::func_807("will_irons","seo_pod_enter_will_lt_pull",::func_7D4E,"pod_phase1a");
	lib_A506::func_807("will_irons","seo_pod_enter_will_rt_reach",::func_7D51,"pod_phase1a");
	lib_A506::func_807("will_irons","seo_pod_enter_will_rt_pull",::func_7D50,"pod_phase1a");
	lib_A506::func_807("cormack","seo_pod_enter_cormack_fs",::func_7D3B,"pod_phase1a");
	lib_A506::func_807("cormack","seo_pod_enter_cormack_rt_reach",::func_7D3F,"pod_phase1a");
	lib_A506::func_807("cormack","seo_pod_enter_cormack_rt_pull",::func_7D3E,"pod_phase1a");
	lib_A506::func_807("cormack","seo_pod_enter_cormack_lt_reach",::func_7D3D,"pod_phase1a");
	lib_A506::func_807("cormack","seo_pod_enter_cormack_lt_pull",::func_7D3C,"pod_phase1a");
	lib_A506::func_807("jackson","seo_pod_enter_jack_fs",::func_7D40,"pod_phase1a");
	lib_A506::func_807("jackson","seo_pod_enter_jack_rt_reach",::func_7D44,"pod_phase1a");
	lib_A506::func_807("jackson","seo_pod_enter_jack_rt_pull",::func_7D43,"pod_phase1a");
	lib_A506::func_807("jackson","seo_pod_enter_jack_lt_reach",::func_7D42,"pod_phase1a");
	lib_A506::func_807("jackson","seo_pod_enter_jack_lt_pull",::func_7D41,"pod_phase1a");
	lib_A506::func_807("player_rig","seo_pod_launch_cam_shake",::func_7D5F,"pod_phase1b");
	lib_A506::func_807("droppod","seo_pod_overhead_screen_start",::func_7D63,"pod_phase1b");
	lib_A506::func_807("pod_missile_1","aud_2b_missile1",::func_0E59,"pod_phase2b");
	lib_A506::func_807("pod_missile_2","aud_2b_missile2",::func_0E5A,"pod_phase2b");
	lib_A506::func_807("pod_missile_3","aud_2b_missile3",::func_0E5B,"pod_phase2b");
	lib_A506::func_807("pod_missile_final","aud_2b_missile_final",::func_0E58,"pod_phase2b");
	lib_A506::func_807("droppod","seo_pod_phase3_door_pop",::func_7D64,"pod_phase3");
	lib_A506::func_807("droppod","seo_pod_phase3_screen_boot",::func_7D65,"pod_phase3");
	lib_A506::func_807("pod_seat_c","seo_pod_phase3_seat_arm_up",::func_7D69,"pod_phase3");
	lib_A506::func_807("pod_seat_c","seo_pod_phase3_turn_lever",::func_7D6A,"pod_phase3");
	lib_A506::func_807("pod_seat_c","seo_pod_phase3_seat_arm_down",::func_7D68,"pod_phase3");
	lib_A506::func_807("pod_seat_c","seo_pod_phase3_screen_down",::func_7D66,"pod_phase3");
	lib_A506::func_807("pod_seat_c","seo_pod_phase3_screen_up",::func_7D67,"pod_phase3");
	lib_A506::func_807("pod_seat_p","seo_pod_phase3_vm_seat_arm_up",::func_7D6B,"pod_phase3");
}

//Function Number: 41
func_2A02()
{
	lib_A5D4::func_5CEF("intro_droppod_seq");
	lib_A5F1::func_8725("droppod_intro_getin_idle_fronts");
}

//Function Number: 42
func_6E0E()
{
	lib_A5F1::func_8725("droppod_intro_getin_footsteps");
	lib_A5DE::func_875A("pod_phase1a_start");
}

//Function Number: 43
func_7D4C(param_00)
{
}

//Function Number: 44
func_7D45(param_00)
{
}

//Function Number: 45
func_7D46(param_00)
{
}

//Function Number: 46
func_7D49(param_00)
{
}

//Function Number: 47
func_7D48(param_00)
{
}

//Function Number: 48
func_7D47(param_00)
{
	lib_A5DE::func_875A("seo_pod_enter_player_lt_pull");
	lib_A5F1::func_8725("droppod_intro_buckle_plr_left");
}

//Function Number: 49
func_7D4B(param_00)
{
}

//Function Number: 50
func_7D4A(param_00)
{
	lib_A5DE::func_875A("seo_pod_enter_player_rt_pull");
	lib_A5F1::func_8725("droppod_intro_buckle_plr_right");
}

//Function Number: 51
func_7D4D(param_00)
{
}

//Function Number: 52
func_7D4F(param_00)
{
}

//Function Number: 53
func_7D4E(param_00)
{
	lib_A5DE::func_875A("seo_pod_enter_will_lt_pull");
	lib_A5F1::func_8725("droppod_intro_buckle_will_left");
}

//Function Number: 54
func_7D51(param_00)
{
}

//Function Number: 55
func_7D50(param_00)
{
}

//Function Number: 56
func_7D3B(param_00)
{
}

//Function Number: 57
func_7D3F(param_00)
{
}

//Function Number: 58
func_7D3E(param_00)
{
	lib_A5DE::func_875A("seo_pod_enter_cormack_rt_pull");
	lib_A5F1::func_8725("droppod_intro_buckle_cormack_right");
}

//Function Number: 59
func_7D3D(param_00)
{
}

//Function Number: 60
func_7D3C(param_00)
{
	lib_A5DE::func_875A("seo_pod_enter_cormack_lt_pull");
	lib_A5F1::func_8725("droppod_intro_buckle_cormack_left");
}

//Function Number: 61
func_7D40(param_00)
{
}

//Function Number: 62
func_7D42(param_00)
{
}

//Function Number: 63
func_7D41(param_00)
{
	lib_A5DE::func_875A("seo_pod_enter_jack_lt_pull");
	lib_A5F1::func_8725("droppod_intro_buckle_jack_left");
}

//Function Number: 64
func_7D44(param_00)
{
}

//Function Number: 65
func_7D43(param_00)
{
	lib_A5DE::func_875A("seo_pod_enter_jack_rt_pull");
	lib_A5F1::func_8725("droppod_intro_buckle_jack_right");
	lib_A5F1::func_8729("droppod_intro_start_apu",1.386);
	lib_A5F1::func_8729("droppod_intro_start_engines_fronts",6.891);
	lib_A5F1::func_8729("droppod_intro_start_engines_fire_a",12.709);
	lib_A5F1::func_8729("droppod_intro_launch_subsonic",14.546);
}

//Function Number: 66
func_7D5F(param_00)
{
	lib_A5DE::func_875A("seo_pod_launch_cam_shake");
	lib_A5F1::func_8725("droppod_intro_launch_jet_burst");
	lib_A5F1::func_8729("droppod_intro_launch_detatch_hi",0.456);
}

//Function Number: 67
func_7D63(param_00)
{
	lib_A5DE::func_875A("seo_pod_overhead_screen_start");
	lib_A5F1::func_8725("droppod_intro_overhead_screen_start");
	lib_A5F1::func_8729("droppod_intro_launch_radio_a",1.693);
}

//Function Number: 68
func_2F7F()
{
	lib_A5DE::func_875A("droppod_intro_blimp_missile");
	lib_A5F1::func_8725("droppod_intro_blimp_missile");
}

//Function Number: 69
func_2F7E()
{
	lib_A5DE::func_875A("droppod_intro_blimp_explode");
	lib_A5F1::func_8725("droppod_intro_blimp_explode");
	lib_A5F1::func_8729("droppod_intro_blimp_second_explo_a",1.6);
	lib_A5F1::func_8729("droppod_intro_hull_debris_fronts",1.8);
}

//Function Number: 70
func_2F84()
{
	lib_A5DE::func_875A("droppod_main_pod_jets");
	lib_A5F1::func_8725("droppod_intro_main_pod_jets");
	lib_A5F1::func_8729("droppod_intro_pod_flyby",2.137);
	lib_A5F1::func_8729("droppod_intro_launch_radio_b",3.756);
}

//Function Number: 71
func_2F85()
{
	lib_A5DE::func_875A("droppod_phase_2b_begin");
	thread func_2F80();
	lib_A5F1::func_8725("droppod_intro_phase_2b_bump_fronts");
	lib_A5F1::func_8725("droppod_engines_begining_fronts");
	lib_A5F1::func_8725("droppod_rattles_begining_fronts");
	lib_A5F1::func_8725("droppod_anti_aircraft_booms");
	lib_A5F1::func_8725("droppod_rocket_flybys");
}

//Function Number: 72
func_0E59(param_00)
{
}

//Function Number: 73
func_0E5A(param_00)
{
}

//Function Number: 74
func_0E5B(param_00)
{
}

//Function Number: 75
func_0E58(param_00)
{
}

//Function Number: 76
func_2F80()
{
	level waittill("intro_missile_hit_pod");
	lib_A5F1::func_8725("droppod_missile_hit_main");
	lib_A5F1::func_8725("droppod_missile_hit_alarms");
	lib_A5F1::func_8725("droppod_missile_hit_door_fire");
	lib_A5F1::func_8725("droppod_missile_hit_engines_fronts");
}

//Function Number: 77
func_7D64(param_00)
{
}

//Function Number: 78
func_7D65(param_00)
{
	lib_A5F1::func_8725("droppod_screen_reboot_end");
	lib_A5F1::func_8725("droppod_reboot_crashing_engines_fronts");
	lib_A5F1::func_8725("droppod_reboot_crashing_impacts_rock");
	lib_A5F1::func_8725("droppod_reboot_crashing_alarm");
}

//Function Number: 79
func_7D69(param_00)
{
}

//Function Number: 80
func_7D6A(param_00)
{
	lib_A5F1::func_8725("droppod_turn_lever_foley");
	lib_A5F1::func_8725("droppod_turn_lever_recompress");
}

//Function Number: 81
func_7D68(param_00)
{
}

//Function Number: 82
func_7D66(param_00)
{
	lib_A5F1::func_8725("droppod_screen_down_foley_ui");
	lib_A5F1::func_8725("droppod_screen_down_rattles_rears");
}

//Function Number: 83
func_7D67(param_00)
{
}

//Function Number: 84
func_7D6B(param_00)
{
	lib_A5F1::func_8725("droppod_missile_hit_vm_harness");
}

//Function Number: 85
func_2F79()
{
	lib_A5F1::func_8725("droppod_first_impact_main");
	lib_A5F1::func_8725("droppod_first_impact_metal");
}

//Function Number: 86
func_2F78()
{
	lib_A5F1::func_8725("droppod_final_impact_main");
	lib_A5F1::func_8725("droppod_final_impact_metal");
	lib_A5F1::func_8725("droppod_final_impact_debris_fronts");
	wait(1);
	lib_A5D4::func_5CF3("intro_droppod_seq");
	lib_A5D4::func_5CEF("seo_pod_intro_post_crash");
	thread func_601D();
	lib_A5F1::func_8739("seo_pod_int_amb","kill_pod_amb_loop");
	lib_A5F1::func_8725("seo_pod_foley_plyr_start");
}

//Function Number: 87
func_2F7A()
{
	lib_A5DE::func_875A("droppod_harness_left_1");
}

//Function Number: 88
func_2F7B()
{
	lib_A5DE::func_875A("droppod_harness_left_2");
}

//Function Number: 89
func_2F7C()
{
	lib_A5DE::func_875A("droppod_harness_right_1");
}

//Function Number: 90
func_2F7D()
{
	lib_A5DE::func_875A("droppod_harness_right_2");
}

//Function Number: 91
func_5C07(param_00)
{
	lib_A5F1::func_8728("exp_amb_mid_air",param_00);
}

//Function Number: 92
func_7D79(param_00)
{
	lib_A5F1::func_8728("exp_amb_mid_air",param_00);
}

//Function Number: 93
func_7CD0(param_00,param_01)
{
	var_02 = lib_A5F1::func_8728("exp_generic_incoming",param_00);
	var_02 waittill("sounddone");
	level notify(param_01);
	var_03 = param_00;
	var_04 = spawnstruct();
	var_04.pos = var_03;
	var_04.var_8A4E = 1;
	var_04.var_2FB0 = "exp_generic_explo_sub_kick";
	var_04.var_2FB2 = 1000;
	var_04.var_351E = 40;
	var_04.var_3520 = "exp_generic_explo_tail";
	var_04.var_83A7 = 1800;
	var_04.var_351D = "exp_debris_mixed";
	var_04.var_4412 = "exp_grnd_zero_rock_tear";
	var_04.var_4413 = 500;
	lib_A5DF::func_86BB(var_04);
}

//Function Number: 94
func_7D06(param_00)
{
	var_01 = param_00;
	var_02 = spawnstruct();
	var_02.pos = var_01;
	var_02.var_8A4E = 1;
	var_02.var_2FB0 = "exp_generic_explo_sub_kick";
	var_02.var_2FB2 = 1000;
	var_02.var_3520 = "exp_generic_explo_tail";
	var_02.var_83A7 = 1000;
	var_02.var_351D = "exp_fireball";
	var_02.var_4412 = "exp_ground_zero";
	var_02.var_4413 = 500;
	lib_A5DF::func_86BB(var_02);
}

//Function Number: 95
func_7CC7(param_00)
{
	lib_A5F1::func_8728("exp_generic_explo_structure",param_00);
}

//Function Number: 96
func_5C08(param_00)
{
	var_01 = param_00;
	var_02 = spawnstruct();
	var_02.pos = var_01;
	var_02.var_8A4E = 1;
	var_02.var_2FB0 = "exp_generic_explo_sub_kick";
	var_02.var_2FB2 = 1000;
	var_02.var_3520 = "exp_generic_explo_tail";
	var_02.var_83A7 = 500;
	var_02.var_351D = "exp_debris_glass";
	var_02.var_4412 = "exp_debris_structure_collapse";
	var_02.var_4413 = 1000;
	lib_A5DF::func_86BB(var_02);
}

//Function Number: 97
func_601D()
{
	lib_A5D4::func_5CEF("mute_intro_gunfire");
}

//Function Number: 98
func_35DD()
{
	lib_A5D4::func_5CF3("mute_intro_gunfire");
	lib_A5D4::func_5CEF("intro_gunfire");
}

//Function Number: 99
func_8266()
{
	wait(0.05);
	lib_A506::func_807("player_rig","seo_pod_int_player_reach_hatch",::func_7D5B,"pod_exit");
	lib_A506::func_807("player_rig","seo_pod_int_player_kick_attempt",::func_7D55,"pod_exit");
	lib_A506::func_807("player_rig","seo_pod_int_player_kick_open_hatch",::func_7D56,"pod_exit");
	lib_A506::func_807("player_rig","seo_pod_int_player_lean_in_door",::func_7D57,"pod_exit");
	lib_A506::func_807("player_rig","seo_pod_int_player_exit",::func_7D54,"pod_exit");
	lib_A506::func_807("player_rig","seo_pod_ext_player_land",::func_7D52,"pod_exit");
	lib_A506::func_807("player_rig","seo_pod_ext_player_turn",::func_7D53,"pod_exit");
	lib_A506::func_807("cormack","seo_pod_cormack_reach_hatch",::func_7D39,"pod_exit");
	lib_A506::func_807("cormack","seo_pod_cormack_exit",::func_7D36,"pod_exit");
	lib_A506::func_807("cormack","seo_pod_cormack_land",::func_7D37,"pod_exit");
	lib_A506::func_807("cormack","seo_pod_cormack_pivot",::func_7D38,"pod_exit");
	lib_A506::func_807("cormack","seo_pod_cormack_walk_2",::func_7D3A,"pod_exit");
	lib_A506::func_807("will_irons","seo_pod_will_land",::func_7D6C,"pod_exit");
	lib_A506::func_807("will_irons","seo_pod_will_walk_1",::func_7D6D,"pod_exit");
	lib_A506::func_807("will_irons","seo_pod_will_walk_2",::func_7D6E,"pod_exit");
	lib_A506::func_807("jackson","seo_pod_new_guy_exit",::func_7D60,"pod_exit");
	lib_A506::func_807("jackson","seo_pod_new_guy_land",::func_7D62,"pod_exit");
	lib_A506::func_807("jackson","seo_pod_new_guy_gets_up",::func_7D61,"pod_exit");
	lib_A506::func_807("player_rig","seo_pod_int_player_unbuckle_left",::func_7D5D,"pod_wakeup_left_1");
	lib_A506::func_807("player_rig","seo_pod_int_player_unbuckle_left",::func_7D5D,"pod_wakeup_left_2");
	lib_A506::func_807("player_rig","seo_pod_int_player_unbuckle_right",::func_7D5E,"pod_wakeup_right_1");
	lib_A506::func_807("player_rig","seo_pod_int_player_unbuckle_right",::func_7D5E,"pod_wakeup_right_2");
	lib_A506::func_807("player_rig","seo_pod_int_player_move_to_hatch_left",::func_7D59,"pod_wakeup_left_2");
	lib_A506::func_807("player_rig","seo_pod_int_player_move_to_hatch_right",::func_7D5A,"pod_wakeup_right_2");
}

//Function Number: 100
func_7D5C(param_00)
{
}

//Function Number: 101
func_7D58(param_00)
{
	lib_A5F1::func_8725("seo_pod_foley_plyr_to_hatch");
}

//Function Number: 102
func_7D5B(param_00)
{
	lib_A5F1::func_8725("seo_pod_foley_plyr_reach_hatch");
}

//Function Number: 103
func_7D55(param_00)
{
	lib_A5F1::func_8725("seo_pod_plyr_kick_hatch");
}

//Function Number: 104
func_7D56(param_00)
{
	lib_A5F1::func_8725("seo_pod_plyr_kick_hatch_open");
	lib_A5F1::func_8725("seo_pod_ext_unstable_01");
	lib_A59A::delaythread(0.5,::func_35DD);
}

//Function Number: 105
func_7D57(param_00)
{
	lib_A5F1::func_8725("seo_pod_foley_plyr_exit_prep");
}

//Function Number: 106
func_7D54(param_00)
{
	level.var_E57.var_A343 = 1;
	lib_A5D4::func_5CEF("seo_foley_override");
	lib_A5F1::func_8725("seo_pod_foley_plyr_exit");
	wait(1);
	level notify("kill_pod_amb_loop");
}

//Function Number: 107
func_7D52(param_00)
{
	lib_A5F1::func_8725("seo_pod_foley_plyr_land");
}

//Function Number: 108
func_7D53(param_00)
{
	lib_A5F1::func_8728("seo_pod_ext_unstable_02",(36013,10429,4518));
}

//Function Number: 109
func_7D39(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_pod_cormack_foley_to_hatch");
}

//Function Number: 110
func_7D36(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_pod_cormack_foley_exit");
}

//Function Number: 111
func_7D37(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_pod_cormack_land");
}

//Function Number: 112
func_7D38(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_pod_cormack_walk_1");
}

//Function Number: 113
func_7D3A(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_pod_cormack_walk_2");
}

//Function Number: 114
func_7D6C(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_pod_will_land");
}

//Function Number: 115
func_7D6D(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_pod_will_walk_1");
}

//Function Number: 116
func_7D6E(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_pod_will_walk_2");
}

//Function Number: 117
func_7D60(param_00)
{
	thread func_7D35();
	lib_A59A::delaythread(3,::func_4A44);
}

//Function Number: 118
func_7D62(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_pod_jackson_land");
}

//Function Number: 119
func_7D61(param_00)
{
	lib_A5D4::func_5CF3("seo_pod_intro_post_crash");
}

//Function Number: 120
func_7D5D(param_00)
{
	lib_A5F1::func_8725("seo_pod_unbuckle_left");
}

//Function Number: 121
func_7D5E(param_00)
{
	lib_A5F1::func_8725("seo_pod_unbuckle_right");
}

//Function Number: 122
func_7D59(param_00)
{
	lib_A5F1::func_8725("seo_pod_foley_plyr_to_hatch_l");
}

//Function Number: 123
func_7D5A(param_00)
{
	lib_A5F1::func_8725("seo_pod_foley_plyr_to_hatch_r");
}

//Function Number: 124
func_9E8B(param_00)
{
	lib_A5F1::func_8728("seo_sky_missile",param_00);
}

//Function Number: 125
func_9E8C(param_00)
{
	wait(param_00);
	lib_A5F1::func_8725("seo_init_sky_missile");
}

//Function Number: 126
func_9E8D(param_00)
{
	wait(param_00);
	lib_A5F1::func_8725("seo_second_sky_missile");
}

//Function Number: 127
func_9E8E(param_00)
{
	wait(param_00);
	lib_A5F1::func_8725("seo_third_sky_missile");
}

//Function Number: 128
func_7D35()
{
	lib_A5D4::func_5CEF("seo_vista_pod_fall");
	lib_A5F1::func_8725("seo_pod_fall_creak");
	lib_A5F1::func_8729("seo_pod_fall_impact",1.4);
	lib_A5F1::func_8729("seo_pod_fall_debris",1.5);
	lib_A5F1::func_8729("shrike_flyby_jet",3);
	wait(3.2);
	lib_A5D4::func_5CF3("seo_vista_pod_fall",1);
	level notify("aud_listen_fall_foley");
}

//Function Number: 129
func_4A44()
{
	var_00 = (37198,7604,4747);
	var_01 = (36801,9652,4661);
	var_02 = lib_A5F1::func_8728("seo_vista_razor_approach",var_00);
	var_02 moveto(var_01,3.5);
}

//Function Number: 130
func_4A45()
{
	var_00 = self;
	var_00 lib_A5F1::snd_play_linked("seo_vista_razor_flyby");
}

//Function Number: 131
func_0F5B()
{
	var_00 = self;
	var_00 lib_A5DF::func_86BA("seo_vista_jet_flyby",3000);
	lib_A5D4::func_5CF3("intro_gunfire",5);
}

//Function Number: 132
func_7D7A(param_00)
{
	var_01 = lib_A5DD::func_121B();
	if(var_01 == "ext_crashsite")
	{
		lib_A5F1::func_8728("seo_vista_bombing_run",param_00);
	}
}

//Function Number: 133
func_7D17()
{
	var_00 = self[0];
	var_01 = self[1];
	var_00 lib_A5F1::func_873C("seo_drone_first_contact_sml","aud_stop_first_contact_drones",0.15,0.2);
	var_01 lib_A5F1::func_873C("seo_drone_first_contact_sml","aud_stop_first_contact_drones",0.15,0.2);
	thread func_7D73();
	level notify("aud_listen_fall_foley");
}

//Function Number: 134
func_7D73()
{
	if(level.currentgen)
	{
		level waittill("pre_transients_fob_to_drone_seq_one");
		level notify("aud_stop_first_contact_drones");
	}
}

//Function Number: 135
func_8162()
{
	wait(0.05);
	lib_A506::func_807("cormack","landassist_jump_cormack_walkback",::func_54AA,"first_landassist_jump_e3");
	lib_A506::func_807("cormack","landassist_jump_cormack_powerup",::func_54A8,"first_landassist_jump_e3");
	lib_A506::func_807("cormack","landassist_jump_cormack_run",::func_54A9,"first_landassist_jump_e3");
	lib_A506::func_807("cormack","landassist_jump_cormack_jump",::func_54A7,"first_landassist_jump_e3");
	lib_A506::func_807("will_irons","landassist_jump_will_walkback",::func_54AE,"first_landassist_jump_e3");
	lib_A506::func_807("will_irons","landassist_jump_will_powerup",::func_54AC,"first_landassist_jump_e3");
	lib_A506::func_807("will_irons","landassist_jump_will_run",::func_54AD,"first_landassist_jump_e3");
	lib_A506::func_807("will_irons","landassist_jump_will_jump",::func_54AB,"first_landassist_jump_e3");
}

//Function Number: 136
func_80EE()
{
	level endon("aud_stop_foley_fall_watch");
	level waittill("aud_listen_fall_foley");
	wait(1);
	var_00 = level.var_31D lib_A5F1::func_873C("seo_hotel_falling_foley_lp","aud_stop_foley_fall_watch",0.2,0.3);
	thread func_8E7A(var_00);
	wait(0.05);
	var_00 scalevolume(0,0.05);
	wait(0.05);
	for(;;)
	{
		var_01 = length(level.var_31D getvelocity());
		var_02 = lib_A5DE::func_8702(var_01,level.var_E57.var_3336["player_fall_foley"]);
		if(isdefined(var_00))
		{
			var_00 scalevolume(var_02,0.1);
		}

		wait(0.05);
	}
}

//Function Number: 137
func_8E7A(param_00)
{
	level waittill("aud_stop_foley_fall_watch");
	param_00 stopsounds();
}

//Function Number: 138
func_54AA(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_landassist_foley_crmk_walk");
}

//Function Number: 139
func_54A8(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_landassist_crmk_powerup");
}

//Function Number: 140
func_54A9(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_landassist_foley_crmk_run");
}

//Function Number: 141
func_54A7(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_landassist_foley_crmk_jump");
}

//Function Number: 142
func_54AE(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_landassist_foley_will_walk");
}

//Function Number: 143
func_54AC(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_landassist_will_powerup");
}

//Function Number: 144
func_54AD(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_landassist_foley_will_run");
}

//Function Number: 145
func_54AB(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_landassist_foley_will_jump");
}

//Function Number: 146
func_8141()
{
	wait(0.05);
	lib_A506::func_807("player_rig","exo_punch_breach_foley",::func_34BB,"exo_punch_breach");
	lib_A506::func_807("player_rig","exo_punch_breach_impact",::func_34BC,"exo_punch_breach");
	lib_A506::func_807("player_rig","exo_punch_breach_sweetener",::func_34BD,"exo_punch_breach");
	lib_A506::func_807("player_rig","exo_punch_breach_deep",::func_34BA,"exo_punch_breach");
	lib_A506::func_807("player_rig","exo_punch_breach_debris",::func_34B8,"exo_punch_breach");
	lib_A506::func_807("player_rig","exo_punch_breach_debris_texture",::func_34B9,"exo_punch_breach");
}

//Function Number: 147
func_34BB(param_00)
{
	lib_A5D4::func_5CEF("hotel_exo_punch_breach");
	lib_A5F1::func_8729("exo_punch_breach_foley",0);
}

//Function Number: 148
func_34BC(param_00)
{
	lib_A5F1::func_8729("exo_punch_breach_impact",0);
}

//Function Number: 149
func_34BD(param_00)
{
	lib_A5F1::func_8729("exo_punch_breach_sweetener",0.15);
}

//Function Number: 150
func_34BA(param_00)
{
	lib_A5F1::func_8729("exo_punch_breach_deep",0);
}

//Function Number: 151
func_34B8(param_00)
{
	lib_A5F1::func_8729("exo_punch_breach_debris",0.06);
}

//Function Number: 152
func_34B9(param_00)
{
	lib_A5F1::func_8729("exo_punch_breach_debris_texture",0);
	wait(4);
	lib_A5D4::func_5CF3("hotel_exo_punch_breach");
}

//Function Number: 153
func_5CC1()
{
}

//Function Number: 154
func_5CC2()
{
}

//Function Number: 155
func_83CD()
{
}

//Function Number: 156
func_4A47()
{
	lib_A5DD::func_1239("int_window_blowout_room","amb_ext_city_combat_dist");
}

//Function Number: 157
func_3956()
{
	wait(0.05);
	lib_A506::func_807("npc_droppod","seo_fob_pod_descend",::func_7D09,"pod_landing");
	lib_A506::func_807("npc_droppod","seo_fob_pod_land",::func_7D0D,"pod_landing");
	lib_A506::func_807("npc_droppod","seo_fob_pod_door_open",::func_7D0B,"pod_landing");
	lib_A506::func_807("npc_droppod","seo_fob_pod_door_land",::func_7D0A,"pod_landing");
	lib_A506::func_807("npc_droppod","seo_fob_pod_flaps",::func_7D0C,"pod_landing");
}

//Function Number: 158
func_7D09(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_fob_pod_descend");
}

//Function Number: 159
func_7D0D(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_fob_pod_land");
	param_00 lib_A5F1::snd_play_linked("seo_fob_pod_debris");
}

//Function Number: 160
func_7D0B(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_fob_pod_door_open");
}

//Function Number: 161
func_7D0A(param_00)
{
	lib_A5F1::func_8728("seo_fob_pod_door_crash",(33525,7687,1400));
}

//Function Number: 162
func_7D0C(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_fob_pod_flaps");
}

//Function Number: 163
func_7D13()
{
	if(level.nextgen)
	{
		lib_A5F1::snd_play_linked("seo_fob_tank_procedural","stop_vehicle_sfx");
		return;
	}

	lib_A5F1::func_873C("seo_fob_tank_procedural","stop_vehicle_sfx");
}

//Function Number: 164
func_7D10()
{
	lib_A5F1::snd_play_linked("seo_fob_tank_01","stop_vehicle_sfx");
}

//Function Number: 165
func_7D11()
{
	if(level.nextgen)
	{
		lib_A5F1::snd_play_linked("seo_fob_tank_02","stop_vehicle_sfx");
		return;
	}

	lib_A5F1::func_873C("seo_fob_tank_procedural","stop_vehicle_sfx");
}

//Function Number: 166
func_7D12()
{
	if(level.nextgen)
	{
		lib_A5F1::snd_play_linked("seo_fob_tank_03","stop_vehicle_sfx");
		return;
	}

	lib_A5F1::func_873C("seo_fob_tank_procedural","stop_vehicle_sfx");
}

//Function Number: 167
func_7D08()
{
}

//Function Number: 168
func_7D07()
{
}

//Function Number: 169
func_7D0E()
{
}

//Function Number: 170
func_7D0F()
{
	lib_A5D4::func_5CEF("seoul_fob");
	var_00 = self;
	if(level.var_E57.var_47A0 == 0)
	{
		var_00 lib_A5F1::snd_play_linked("seo_fob_razorback_flyby");
		wait(0.3);
		level.var_E57.var_47A0 = 1;
		return;
	}

	if(level.var_E57.var_47A0 == 1)
	{
		return;
	}
}

//Function Number: 171
func_855B()
{
	var_00 = self;
	var_01 = (33538,8525,1378);
	var_02 = distance(var_01,level.var_31D.var_2E6);
	if(var_02 < 1350)
	{
		var_03 = 0;
	}
	else
	{
		var_03 = 1;
	}

	var_04 = randomfloatrange(0.2,0.5);
	if(isdefined(var_00))
	{
		var_00 lib_A5F1::snd_play_linked("seo_sidewinder_missile_shot");
		wait(var_03);
		var_00 lib_A5F1::func_872B("seo_sidewinder_missile_by",var_04);
	}
}

//Function Number: 172
func_0F54()
{
	var_00 = self;
	var_00 lib_A5DF::func_86BA("seo_fob_jet_flyby",5500);
}

//Function Number: 173
func_3952(param_00)
{
	lib_A5D4::func_5CEF("seoul_fob_meetup_vo",1);
	level waittill(param_00);
	lib_A5D4::func_5CF3("seoul_fob_meetup_vo",2);
	level notify("aud_stop_foley_fall_watch");
}

//Function Number: 174
func_A127()
{
	self endon("death");
	for(;;)
	{
		level.var_E57.var_2EF0 = self.var_2E6;
		wait 0.05;
	}
}

//Function Number: 175
func_A10F()
{
	thread func_A127();
	self waittill("death");
	lib_A5F1::func_8728("seo_truck_explo",level.var_E57.var_2EF0);
}

//Function Number: 176
func_A116()
{
	thread func_A10F();
	lib_A5D4::func_5CF3("seoul_fob");
	lib_A5D4::func_5CEF("seoul_bus_battle");
	function_02B5(1000,500,500,500,3,5);
	var_00 = self;
	lib_A5D4::func_5CEF("seoul_walker_step_over");
	wait(15);
	lib_A5D4::func_5CF3("seoul_walker_step_over",8);
}

//Function Number: 177
func_9393(param_00)
{
	var_01 = lib_A5D2::func_F21(param_00);
	if(isdefined(var_01))
	{
		var_02 = var_01.v["origin"];
		lib_A5F1::func_8728("exp_amb_mid_air",var_02);
	}
}

//Function Number: 178
func_9395()
{
	var_00 = self;
	var_00 lib_A5F1::snd_play_linked("walker_cannon_shot");
}

//Function Number: 179
func_7CD1(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_drone_missile_incoming");
}

//Function Number: 180
func_8B86()
{
	wait(0.1);
	lib_A5D4::func_5CF3("seoul_bus_battle");
	lib_A5D4::func_5CEF("drone_missile_barrage",0.05);
	lib_A5F1::func_8728("seo_drone_attack_init_exp",(27906,7557,1405));
	wait(2.6);
	lib_A5D4::func_5CF3("drone_missile_barrage",1);
	lib_A5D4::func_5CEF("drone_attack_complete");
}

//Function Number: 181
func_7D6F()
{
	var_00 = self;
	var_00 lib_A5F1::func_873C("seo_teaser_drones","aud_stop_single_drones_flyby");
	thread func_7D74();
}

//Function Number: 182
func_7D74()
{
	if(level.currentgen)
	{
		level waittill("pre_transients_truck_push_to_mall_office");
		level notify("aud_stop_first_contact_drones");
	}
}

//Function Number: 183
func_7CCB()
{
	var_00 = self;
	lib_A5F1::func_8728("seo_swarm_car_explo",var_00.var_2E6);
}

//Function Number: 184
func_7D77()
{
	lib_A5D4::func_5CEF("drone_missile_barrage",0.05);
	var_00 = self;
	lib_A5F1::func_8728("seo_truck_explo",var_00.var_2E6);
	wait(1);
	lib_A5D4::func_5CF3("drone_missile_barrage",0.5);
}

//Function Number: 185
func_7D72()
{
	lib_A5D4::func_5CEF("seo_drone_kamikaze_attack");
}

//Function Number: 186
func_2E7D()
{
	if(level.var_E57.var_4C0C == 1)
	{
		lib_A5F1::func_8725("attack_drone_vehicle_impact");
		return;
	}

	if(level.var_E57.var_4C0C == 0)
	{
		lib_A5F1::func_8725("attack_drone_player_impact");
	}
}

//Function Number: 187
func_1B6A()
{
	lib_A5F1::func_8725("seo_drone_suicide_door_brk");
}

//Function Number: 188
func_7CD2(param_00)
{
	var_01 = param_00;
	var_02 = spawnstruct();
	var_02.pos = var_01;
	var_02.var_8A4E = 1;
	var_02.var_2FB0 = "exp_generic_explo_sub_kick";
	var_02.var_2FB2 = 1000;
	var_02.var_3520 = "exp_generic_explo_tail";
	var_02.var_83A7 = 500;
	var_02.var_351D = "exp_debris_mixed";
	var_02.var_4412 = "exp_grnd_zero_rock_tear";
	var_02.var_4413 = 400;
	lib_A5DF::func_86BB(var_02);
}

//Function Number: 189
func_7D7B(param_00)
{
	lib_A5F1::func_8728("seo_will_door_explo",param_00);
}

//Function Number: 190
func_80D3()
{
	wait(0.05);
	lib_A506::func_807("will_irons","will_doorshield_foley",::func_A317,"will_door_shield_grab");
	lib_A506::func_807("will_irons","will_doorshield_grabs",::func_A318,"will_door_shield_grab");
	lib_A506::func_807("will_irons","will_doorshield_tension",::func_A31A,"will_door_shield_grab");
	lib_A506::func_807("will_irons","will_doorshield_rip",::func_A319,"will_door_shield_grab");
	lib_A506::func_807("will_irons","will_doorshield_debris",::func_A316,"will_door_shield_grab");
}

//Function Number: 191
func_A317(param_00)
{
	lib_A5F1::func_872B("doorshield_foley_will",0);
}

//Function Number: 192
func_A318(param_00)
{
	lib_A5F1::func_872B("doorshield_grabs_will",0);
}

//Function Number: 193
func_A31A(param_00)
{
	lib_A5F1::func_872B("doorshield_tension_will",0);
}

//Function Number: 194
func_A319(param_00)
{
	lib_A5F1::func_872B("doorshield_rip_will",0);
}

//Function Number: 195
func_A316(param_00)
{
	lib_A5F1::func_872B("doorshield_debris_will",0);
}

//Function Number: 196
func_6AEA()
{
	lib_A5D4::func_5CEF("seo_turret_drone_sequence");
	lib_A5F1::func_8725("x4walker_player_enter");
	wait(2);
	level.var_E57.var_4C0C = 1;
	lib_A5DF::func_86CD("bullet_metal_vehicle");
	function_02B5(0,0,0,0,-2,2);
}

//Function Number: 197
func_1D35()
{
	lib_A5F1::func_8725("seo_turret_drone_target_acquired");
}

//Function Number: 198
func_1D36()
{
}

//Function Number: 199
func_7D75(param_00)
{
	var_01 = param_00 - (0,0,param_00[2] - 1375);
	var_02 = randomfloatrange(0.5,1.8);
	wait(var_02);
	lib_A5F1::func_8728("seo_drone_death_fall",var_01);
}

//Function Number: 200
func_6AF3()
{
	lib_A5F1::func_8725("x4walker_player_exit");
	lib_A5D4::func_5CF3("seo_turret_drone_sequence");
	lib_A5DF::func_86C7("bullet_metal_vehicle");
	function_02B5(0,0,0,0,1,1);
}

//Function Number: 201
func_7D76()
{
	lib_A5D4::func_5CEF("seo_turret_emp");
	lib_A5F1::func_8725("seo_turret_emp_activate");
	wait(0.5);
	lib_A5D4::func_5CEF("seo_emp_drone_mute");
	wait(2);
	lib_A5D4::func_5CF3("seo_turret_emp");
	func_5FF8("mus_seo_swarm_emp_wave_done");
	wait(8);
	lib_A5D4::func_5CF3("seo_emp_drone_mute");
	lib_A5D4::func_5CF3("drone_attack_complete");
	level.var_E57.var_4C0C = 0;
}

//Function Number: 202
func_7D78()
{
	lib_A5D4::func_5CF3("seo_drone_kamikaze_attack");
}

//Function Number: 203
func_7D16()
{
}

//Function Number: 204
func_7D7F(param_00,param_01,param_02)
{
	var_03 = lib_A5F1::func_8728("seo_npc_zipline_shot",param_00);
	var_03 moveto(param_01,param_02);
}

//Function Number: 205
func_7D80(param_00)
{
	lib_A5F1::func_8728("seo_npc_zipline_impact",param_00);
}

//Function Number: 206
func_7D81()
{
}

//Function Number: 207
func_7D82(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_npc_zipline_unhook");
}

//Function Number: 208
func_7D83(param_00)
{
	lib_A5F1::func_8728("seo_npc_zipline_retract",param_00);
}

//Function Number: 209
func_8227()
{
	wait(0.05);
	lib_A506::func_807("cormack","seo_mall_sizeup_crmk_walk",::func_7D1B,"seo_mall_sizeup_jump_cormack");
	lib_A506::func_807("cormack","seo_mall_sizeup_crmk_powerup",::func_7D18,"seo_mall_sizeup_jump_cormack");
	lib_A506::func_807("cormack","seo_mall_sizeup_crmk_turn",::func_7D1A,"seo_mall_sizeup_jump_cormack");
	lib_A506::func_807("cormack","seo_mall_sizeup_crmk_runjump",::func_7D19,"seo_mall_sizeup_jump_cormack");
	lib_A506::func_807("will_irons","seo_mall_sizeup_will_walk",::func_7D1E,"seo_mall_sizeup_jump_will");
	lib_A506::func_807("will_irons","seo_mall_sizeup_will_wpn_sling",::func_7D1F,"seo_mall_sizeup_jump_will");
	lib_A506::func_807("will_irons","seo_mall_sizeup_will_powerup",::func_7D1C,"seo_mall_sizeup_jump_will");
	lib_A506::func_807("will_irons","seo_mall_sizeup_will_runjump",::func_7D1D,"seo_mall_sizeup_jump_will");
	lib_A506::func_807("gideon","seo_gideon_meet_atlast_start",::func_7D15,"seo_meet_atlas");
	lib_A506::func_807("roof_chunks","aud_meet_atlast_roof_explode",::func_0FD0,"seo_meet_atlas");
}

//Function Number: 210
func_7D1B(param_00)
{
	lib_A5D4::func_5CEF("seo_mall_boost_jump");
	param_00 lib_A5F1::snd_play_linked("seo_mall_sizeup_crmk_walk");
}

//Function Number: 211
func_7D18(param_00)
{
}

//Function Number: 212
func_7D1A(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_mall_sizeup_crmk_turn");
}

//Function Number: 213
func_7D19(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_mall_sizeup_crmk_jump");
}

//Function Number: 214
func_7D1E(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_mall_sizeup_will_walk");
}

//Function Number: 215
func_7D1F(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_mall_sizeup_will_sling");
}

//Function Number: 216
func_7D1C(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_mall_sizeup_will_powerup");
}

//Function Number: 217
func_7D1D(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_mall_sizeup_will_jump");
}

//Function Number: 218
func_7D34(param_00)
{
	var_01 = lib_A5D2::func_F21(param_00);
	if(isdefined(var_01))
	{
		var_02 = var_01.v["origin"];
		lib_A5F1::func_8728("seo_per_arts_jump_explo_3",var_02);
	}
}

//Function Number: 219
func_8594(param_00)
{
	wait(0.2);
	foreach(var_02 in param_00)
	{
		var_02 lib_A5DE::snd_message("snd_stop_vehicle");
		var_02 lib_A5F1::snd_play_linked("seo_sink_drone_alert");
		var_02 lib_A5F1::func_873C("seo_teaser_drones",undefined,1.5);
		var_03 = "seo_sink_drone_flyby";
		var_04 = [];
		var_04[0] = 800;
		var_05 = [];
		var_05[0] = 20;
		var_05[1] = 5;
		var_02 thread lib_A5DF::func_86B9(var_03,undefined,var_04,var_05,1,undefined,undefined,3,2);
	}
}

//Function Number: 220
func_7D70()
{
	var_00 = self;
	var_00 lib_A5F1::snd_play_linked("seo_sinkhole_wp_takeoff");
	lib_A5D4::func_5CF3("seo_mall_boost_jump");
}

//Function Number: 221
func_85A2()
{
}

//Function Number: 222
func_85A1()
{
}

//Function Number: 223
func_8F84()
{
	lib_A5F1::func_8725("seo_sbwy_shake_bomb");
	var_00 = randomfloatrange(0,0.3);
	lib_A5F1::func_8729("seo_sbwy_shake_bomb_cracks",var_00);
}

//Function Number: 224
func_8F8E()
{
	lib_A5F1::func_872B("seo_sbwy_doors_open",0);
	common_scripts\utility::flag_set("start_subway_pa_message");
}

//Function Number: 225
func_8F8D()
{
	lib_A5F1::func_872B("seo_sbwy_doors_close",0);
}

//Function Number: 226
func_8F9E()
{
	common_scripts\utility::flag_wait("start_subway_pa_message");
	lib_A5F1::func_872A("seo_sbwy_kr_pa",(21000,16432,1174),3,undefined,"stop_subway_pa",undefined,3);
}

//Function Number: 227
func_0FD0(param_00)
{
	lib_A5F1::func_8725("atlas_meetup_breach_explode");
}

//Function Number: 228
func_8F95()
{
	lib_A5F1::func_8725("atlas_meetup_gun_away");
}

//Function Number: 229
func_7D15(param_00)
{
	lib_A5DE::func_875A("seo_gideon_meet_atlast_start");
	lib_A5F2::func_8755(0);
	lib_A5D4::func_5CEF("atlas_meetup_subway",4);
	lib_A5F1::func_8725("atlas_meetup_grabgate_foley");
	lib_A5F1::func_8729("atlas_meetup_grabgate_hit",0.4,1);
	lib_A5F1::func_8729("atlas_meetup_breach_cut_sizzle",0.85,1);
	lib_A5F1::func_8729("atlas_meetup_breach_cut_hum",1.25,1);
}

//Function Number: 230
func_7D22()
{
	lib_A5DE::func_875A("Subway Slowmo Start");
	lib_A5F1::func_8725("atlas_meetup_slo_mo_enter");
}

//Function Number: 231
func_7D21()
{
	lib_A5DE::func_875A("Subway Slowmo end");
	lib_A5F1::func_8725("atlas_meetup_foley_lands_gun");
	lib_A5F1::func_8729("atlas_meetup_foley_fs_fronts",3.5,1);
	lib_A5F1::func_8729("atlas_meetup_gate_open_hi",5.5,1);
	lib_A5F1::func_8729("atlas_meetup_dust_debris",9,1);
	lib_A5F1::func_8729("atlas_meetup_foley_fs_rears",16.5,1);
	wait(15);
	lib_A5D4::func_5CF3("atlas_meetup_subway",5);
}

//Function Number: 232
func_8F94()
{
	var_00 = self;
	lib_A5DE::func_875A("Gate Move");
	wait(0.05);
	var_00 lib_A5F1::snd_play_linked("atlas_meetup_gate_close");
}

//Function Number: 233
func_7B56()
{
	common_scripts\utility::flag_wait("sd_intersection_chopper_wait");
	lib_A5DE::func_875A("sd_intersection_chopper");
	lib_A5D4::func_5CEF("shopping_district_littlebird");
	lib_A5F1::func_872B("seo_shop_district_littlebird_eng",0.05);
	wait(15);
	lib_A5D4::func_5CF3("shopping_district_littlebird");
}

//Function Number: 234
func_8420()
{
	lib_A5D4::func_5CEF("seo_shopping_district_truck");
	lib_A5F1::func_872B("seo_shopping_turret_truck",0);
	wait(10);
	lib_A5D4::func_5CF3("seo_shopping_district_truck");
	lib_A5D4::func_5CEF("seo_canal_vehicle_management");
}

//Function Number: 235
func_9F18()
{
	lib_A5D4::func_5CEF("seo_sd_demo_team_call_mix",10);
	level waittill("kill_seo_sd_demo_team_call_mix");
	lib_A5D4::func_5CF3("seo_sd_demo_team_call_mix",10);
}

//Function Number: 236
func_7D71(param_00,param_01)
{
	wait(param_01);
	lib_A5F1::func_8728("wpn_smoke_grenade_exp",param_00);
}

//Function Number: 237
func_841B(param_00)
{
	lib_A5F1::func_8728("bullet_large_glass",param_00);
	lib_A5F1::func_8728("seo_nightclub_window_crack",param_00);
}

//Function Number: 238
func_841A(param_00)
{
	lib_A5F1::func_8728("seo_nightclub_drone_window",param_00);
}

//Function Number: 239
func_841E(param_00)
{
	lib_A5F1::func_8728("seo_nightclub_panel_hit",param_00);
}

//Function Number: 240
func_841F(param_00)
{
	lib_A5F1::func_8728("seo_nightclub_panel_swing",param_00);
}

//Function Number: 241
func_7CCC()
{
	lib_A5D4::func_5CEF("seo_havoc_mix_management");
	lib_A5F1::func_8725("seo_binocs_equip");
}

//Function Number: 242
func_1A60()
{
	level notify("canal_bonocs_zoom_in");
	level notify("canal_bonocs_zoom_out");
	level endon("canal_bonocs_zoom_in");
	wait(0.1);
	lib_A5F1::func_8725("seo_binocs_zoom_in","canal_bonocs_zoom_out");
}

//Function Number: 243
func_1A61()
{
	level notify("canal_bonocs_zoom_in");
	level notify("canal_bonocs_zoom_out");
	level endon("canal_bonocs_zoom_out");
	wait(0.1);
	lib_A5F1::func_8725("seo_binocs_zoom_out","canal_bonocs_zoom_in");
}

//Function Number: 244
func_1A5E()
{
	level notify("canal_bonocs_zoom_out");
}

//Function Number: 245
func_1A5F()
{
	level notify("canal_bonocs_zoom_in");
}

//Function Number: 246
func_1478()
{
	lib_A5F1::func_8725("seo_binocs_put_away");
	lib_A5D4::func_5CEF("seo_canal_combat",0.05);
	function_02B5(1000,500,500,500,5,7);
	lib_A5D4::func_5CF3("seo_havoc_mix_management");
}

//Function Number: 247
func_4760()
{
	var_00 = self;
	var_01 = (13754,16832,1756);
	var_02 = distance(level.var_31D.var_2E6,var_01);
	var_03 = lib_A5DE::func_8702(var_02,level.var_E57.var_3336["havoc_speed_of_sound"]);
	lib_A5F1::func_8728("seo_havoc_launch",var_01);
	wait(var_03);
	lib_A5F1::func_8728("seo_havoc_launch_dist",var_01);
	var_04 = var_00.var_2E6;
	while(isdefined(var_00))
	{
		var_04 = var_00.var_2E6;
		wait(0.05);
	}

	lib_A5F1::func_8728("seo_havoc_impact",var_04);
}

//Function Number: 248
func_7CCD()
{
	level endon("aud_stop_canal_bombs");
	var_00 = 4;
	var_01 = 9;
	for(;;)
	{
		var_02 = randomintrange(var_00,var_01);
		wait(var_02);
		var_03 = randomintrange(700,1500);
		var_04 = randomintrange(700,1500);
		var_05 = randomintrange(200,800);
		var_06 = level.var_31D.var_2E6 + (var_03,var_04,var_05);
		var_07 = var_06;
		var_08 = spawnstruct();
		var_08.pos = var_07;
		var_08.var_8A4E = 1;
		var_08.var_2FB0 = "exp_generic_explo_sub_kick";
		var_08.var_2FB2 = 1000;
		var_08.var_3520 = "exp_generic_explo_tail";
		var_08.var_83A7 = 500;
		var_08.var_351D = "exp_debris_mixed";
		var_08.var_4412 = "exp_grnd_zero_rock_tear";
		var_08.var_4413 = 400;
		lib_A5DF::func_86BB(var_08);
	}
}

//Function Number: 249
func_1A8C()
{
	var_00 = self;
	lib_A5F1::func_8725("seo_canal_shrike_flyover");
	thread func_7CCD();
}

//Function Number: 250
func_7CCF()
{
	if(level.currentgen && !function_021E("seoul_riverwalk_tr"))
	{
		level waittill("transients_canal_overlook_to_riverwalk");
	}

	var_00 = level.var_1A95;
	var_00 lib_A5F1::snd_play_linked("seo_canal_razor_intro","switch_to_loop",undefined,1);
	wait(16);
	level notify("switch_to_loop");
	var_00 lib_A5F1::func_873C("seo_canal_razor_lp","switch_to_fly_away",2,2);
	var_00 lib_A5F1::func_873C("seo_canal_razor_turbine_lp","switch_to_fly_away",2,2);
}

//Function Number: 251
func_7154(param_00)
{
	lib_A5F1::func_873C("wpn_razorback_turretv2_lp","aud_stop_razorback_fire_lp");
}

//Function Number: 252
func_7155(param_00)
{
	level notify("aud_stop_razorback_fire_lp");
}

//Function Number: 253
func_7CCE()
{
	level notify("switch_to_fly_away");
	var_00 = level.var_1A95;
	var_00 lib_A5F1::snd_play_linked("seo_canal_razor_fly_away",undefined,undefined,2);
}

//Function Number: 254
func_9359()
{
	lib_A5D4::func_5CEF("seo_timed_charges_vo",2);
	level waittill("timed_charges_vo_done");
	lib_A5D4::func_5CF3("seo_timed_charges_vo",2);
}

//Function Number: 255
func_7CEE()
{
	lib_A5D4::func_5CEF("seo_finale",5);
	function_02B5(0,0,0,0,1,1);
}

//Function Number: 256
func_80F7()
{
	wait(0.05);
	lib_A506::func_807("will_irons","seo_finale_will_start",::func_7CFB,"finale_pt01");
	lib_A506::func_807("will_irons","seo_finale_will_jump_onto_platform",::func_7CF6,"finale_pt01");
	lib_A506::func_807("will_irons","seo_finale_will_grab_hatch",::func_7CF4,"finale_pt01");
	lib_A506::func_807("will_irons","seo_finale_will_open_hatch",::func_7CF7,"finale_pt01");
	lib_A506::func_807("will_irons","seo_finale_will_bomb_turn",::func_7CF2,"finale_plantbomb");
	lib_A506::func_807("will_irons","seo_finale_will_bomb_accept",::func_7CEF,"finale_plantbomb");
	lib_A506::func_807("will_irons","seo_finale_will_bomb_arm",::func_7CF0,"finale_plantbomb");
	lib_A506::func_807("will_irons","seo_finale_will_place_bomb",::func_7CF8,"finale_plantbomb");
	lib_A506::func_807("will_irons","seo_finale_will_bomb_hatch_trap",::func_7CF1,"finale_plantbomb");
	lib_A506::func_807("will_irons","seo_finale_will_struggle",::func_7CFC,"finale_pt02");
	lib_A506::func_807("will_irons","seo_finale_will_first_attempt_to_free",::func_7CF3,"finale_pt02");
	lib_A506::func_807("will_irons","seo_finale_will_second_attempt",::func_7CFA,"finale_pt02");
	lib_A506::func_807("will_irons","seo_finale_will_grabs_player",::func_7CF5,"finale_pt02");
	lib_A506::func_807("will_irons","seo_finale_will_pushes_player",::func_7CF9,"finale_pt02");
	lib_A506::func_807("player_rig","seo_finale_player_jump_onto_platform",::func_7CE6,"finale_plantbomb");
	lib_A506::func_807("player_rig","seo_finale_player_retrieve_bomb",::func_7CEA,"finale_plantbomb");
	lib_A506::func_807("player_rig","seo_finale_player_hatch_react",::func_7CE5,"finale_plantbomb");
	lib_A506::func_807("player_rig","seo_finale_player_grab_hatch",::func_7CE4,"finale_pt02");
	lib_A506::func_807("player_rig","seo_finale_player_two_handed_hatch_pull",::func_7CEB,"finale_pt02");
	lib_A506::func_807("player_rig","seo_finale_player_falls",::func_7CE3,"finale_pt02");
	lib_A506::func_807("player_rig","seo_finale_player_lands",::func_7CE7,"finale_pt02");
	lib_A506::func_807("player_rig","seo_finale_player_bounces",::func_7CE1,"finale_pt03");
	lib_A506::func_807("player_rig","seo_finale_player_arm_slice",::func_7CE0,"finale_pt03");
	lib_A506::func_807("player_rig","seo_finale_player_leg_up",::func_7CE9,"finale_pt03");
	lib_A506::func_807("player_rig","seo_finale_player_leg_down",::func_7CE8,"finale_pt03");
	lib_A506::func_807("player_rig","seo_finale_player_dragged_away",::func_7CE2,"finale_pt03");
	lib_A506::func_807("cormack","seo_finale_cormack_enter_scene",::func_7CDB,"finale_pt03");
	lib_A506::func_807("cormack","seo_finale_cormack_walk_to_player",::func_7CDF,"finale_pt03");
	lib_A506::func_807("cormack","seo_finale_cormack_crouch",::func_7CDA,"finale_pt03");
	lib_A506::func_807("cormack","seo_finale_cormack_grab_metal",::func_7CDC,"finale_pt03");
	lib_A506::func_807("cormack","seo_finale_cormack_assist_player",::func_7CD9,"finale_pt03");
	lib_A506::func_807("cormack","seo_finale_cormack_pull_player",::func_7CDD,"finale_pt03");
	lib_A506::func_807("weapon_platform","seo_finale_wp_hatch_close",::func_7CFF,"finale_plantbomb");
	lib_A506::func_807("weapon_platform","seo_finale_wp_prepare_to_lift_off",::func_7D03,"finale_pt02");
	lib_A506::func_807("weapon_platform","seo_finale_wp_lift_off",::func_7D02,"finale_pt02");
	lib_A506::func_807("weapon_platform","seo_finale_wp_landing_gears_up",::func_7D01,"finale_pt02");
	lib_A506::func_807("weapon_platform","seo_finale_wp_take_off",::func_7D04,"finale_pt02");
}

//Function Number: 257
func_7CFB(param_00)
{
	level notify("aud_stop_canal_bombs");
	lib_A5F1::func_872B("seo_finale_will_foley_start",0);
	lib_A5F1::func_872B("seo_finale_will_intro_steps",1.17);
	lib_A5D4::func_5CEF("seo_finale_wp_ambi_soft",7);
}

//Function Number: 258
func_7CF6(param_00)
{
}

//Function Number: 259
func_7CF4(param_00)
{
	lib_A5F1::func_872B("seo_finale_will_opens_door",0.65);
}

//Function Number: 260
func_7CF7(param_00)
{
}

//Function Number: 261
func_7CF2(param_00)
{
	lib_A5F1::func_8729("seo_finale_will_bomb_pt_01",0.77);
	lib_A5F1::func_8729("seo_finale_bomb_timer",1.73);
}

//Function Number: 262
func_7CEF(param_00)
{
}

//Function Number: 263
func_7CF0(param_00)
{
	lib_A5F1::func_8729("seo_finale_bomb_plant",1.82);
	lib_A5F1::func_8729("seo_finale_door_closing",2.359);
	lib_A5F1::func_8729("seo_finale_door_slam_lyr_02",2.51);
	lib_A5F1::func_8729("seo_finale_door_slam",2.587);
}

//Function Number: 264
func_7CF8(param_00)
{
}

//Function Number: 265
func_7CF1(param_00)
{
}

//Function Number: 266
func_7CFC(param_00)
{
	lib_A5F1::func_8729("seo_finale_will_bomb_pt_02",2.95);
}

//Function Number: 267
func_7CF3(param_00)
{
	lib_A5F1::func_8729("seo_finale_door_strain",1.1);
}

//Function Number: 268
func_7CFA(param_00)
{
	lib_A5F1::func_8729("seo_finale_will_bomb_pt_03",4.09);
}

//Function Number: 269
func_7CF5(param_00)
{
	wait(1.75);
	level notify("kill_hatch_jam");
}

//Function Number: 270
func_7CF9(param_00)
{
}

//Function Number: 271
func_7CE6(param_00)
{
	lib_A5F1::func_8729("seo_finale_plr_foley_start",0.2);
}

//Function Number: 272
func_7CEA(param_00)
{
}

//Function Number: 273
func_7CE5(param_00)
{
	lib_A5F1::func_8729("seo_finale_plr_react",0.25);
}

//Function Number: 274
func_7CE4(param_00)
{
}

//Function Number: 275
func_7CEB(param_00)
{
	lib_A5F1::func_8729("seo_finale_plr_2h_grab",0.32);
	lib_A5F1::func_8729("seo_finale_plr_tossed",4.85);
}

//Function Number: 276
func_7CE3(param_00)
{
	lib_A5D4::func_5CF3("seo_other_side_mix");
}

//Function Number: 277
func_7CE7(param_00)
{
	lib_A5F1::func_8725("seo_finale_plyr_land");
}

//Function Number: 278
func_7CE1(param_00)
{
	if(level.currentgen && !function_021E("seoul_riverwalk_tr"))
	{
		level waittill("transients_canal_overlook_to_riverwalk");
	}

	lib_A5F1::func_8725("seo_finale_plyr_roll");
	lib_A5F1::func_8739("seo_finale_plyr_filter_lp",undefined,2);
	lib_A5D4::func_5CEF("seo_hearing_damage");
}

//Function Number: 279
func_7CE0(param_00)
{
	lib_A5F1::func_8725("seo_finale_mtl_chunk_flip");
	lib_A5F1::func_8729("seo_finale_mtl_impact",1.034);
}

//Function Number: 280
func_7CE9(param_00)
{
	lib_A5F1::func_8725("seo_finale_plyr_grab_metal");
	lib_A5DD::func_1239("ext_canal","amb_ext_cmbt_hdmg");
	lib_A5D4::func_5CF3("seo_finale_wp_ambi_soft");
	lib_A5D4::func_5CF3("seo_finale_wp_ambi_fade",2);
}

//Function Number: 281
func_7CE8(param_00)
{
	lib_A5F1::func_8725("seo_finale_plyr_leg_down");
}

//Function Number: 282
func_7CE2(param_00)
{
	lib_A5F1::func_8725("seo_finale_plyr_dragged");
}

//Function Number: 283
func_7CDB(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_finale_crmk_enter_scene");
}

//Function Number: 284
func_7CDF(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_finale_crmk_walk_to_plyr");
}

//Function Number: 285
func_7CDA(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_finale_crmk_crouch");
	lib_A5F1::func_8725("seo_finale_filtered_warbird");
}

//Function Number: 286
func_7CDC(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_finale_crmk_grab_metal");
}

//Function Number: 287
func_7CD9(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_finale_crmk_assist");
}

//Function Number: 288
func_7CDD(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_finale_crmk_pull");
}

//Function Number: 289
func_7CFF(param_00)
{
	lib_A5D4::func_5CEF("seo_finale_wp_soft_engine");
	lib_A5F1::func_8725("seo_finale_wp_hatch_jammed","kill_hatch_jam",undefined,2.5);
}

//Function Number: 290
func_7D03(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_finale_wp_powerup");
	param_00 lib_A5F1::snd_play_linked("seo_finale_wp_engine","kill_engine_sounds");
}

//Function Number: 291
func_7D02(param_00)
{
}

//Function Number: 292
func_7D01(param_00)
{
	lib_A5D4::func_5CF3("seo_finale_wp_soft_engine");
	lib_A5F1::func_8725("seo_finale_wp_landing_gear");
	lib_A5D4::func_5CEF("seo_finale_wp_ambi_fade",5);
}

//Function Number: 293
func_7D04(param_00)
{
	param_00 lib_A5F1::snd_play_linked("seo_finale_wp_take_off");
	level waittill("wp_engine_failure");
	param_00 lib_A5F1::snd_play_linked("seo_finale_wp_engine_failure_01","kill_engine_sounds");
}

//Function Number: 294
func_7D00()
{
	lib_A5F1::func_8725("seo_finale_wp_explo_01");
	level notify("wp_engine_failure");
	func_5FF8("mus_finale_wp_explo_01");
}

//Function Number: 295
func_7CFD()
{
	lib_A5F1::func_8725("seo_finale_wp_explo_02");
	level notify("kill_engine_sounds");
}

//Function Number: 296
func_7D05()
{
	lib_A5F1::func_8725("seo_finale_wp_explo_03");
	lib_A5F1::func_8725("seo_finale_wp_explo_04");
}

//Function Number: 297
func_7CFE()
{
	lib_A5F1::func_8725("seo_finale_wp_crash");
}

//Function Number: 298
func_2FF7()
{
	lib_A5D4::func_5CEF("mute_all",3);
}

//Function Number: 299
func_2FF6()
{
	lib_A5D4::func_5CF3("mute_all",0);
	lib_A5D4::func_5CEF("solo_radio",0);
	wait(0.5);
	lib_A5D4::func_5CF3("solo_radio",3);
}

//Function Number: 300
func_2FF9()
{
	lib_A5F1::func_8725("seo_e3_end_logo");
	wait(5);
	lib_A5D4::func_5CEF("e3_end_logo",3);
}

//Function Number: 301
func_7D8C()
{
	level.var_31D endon("death");
	level.var_31D waittill("foley",var_00,var_01,var_02);
	if(isdefined(level.var_E57.var_A343) && level.var_E57.var_A343 == 1)
	{
		switch(var_00)
		{
			case "stationarycrouchscuff":
				break;

			case "stationaryscuff":
				break;

			case "crouchscuff":
				break;

			case "runscuff":
				break;

			case "sprintscuff":
				break;

			case "prone":
				break;

			case "crouchwalk":
				break;

			case "crouchrun":
				break;

			case "walk":
				break;

			case "run":
				break;

			case "sprint":
				break;

			case "jump":
				break;

			case "lightland":
				break;

			case "mediumland":
				break;

			case "heavyland":
				break;

			case "damageland":
				break;

			case "mantleuphigh":
				break;

			case "mantleupmedium":
				break;

			case "mantleuplow":
				break;

			case "mantleoverhigh":
				break;

			case "mantleovermedium":
				break;

			case "mantleoverlow":
				break;
		}
	}
}