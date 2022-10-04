/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_code_gangnam.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 471
 * Decompile Time: 17100 ms
 * Timestamp: 4/20/2022 8:21:32 PM
*******************************************************************/

//Function Number: 1
func_3C05()
{
	function_00D3("high_jump_double_tap","1");
	common_scripts\utility::flag_init("hault_column");
	common_scripts\utility::flag_init("opening_view_off");
	common_scripts\utility::flag_init("cloud_queen_retreat_path");
	common_scripts\utility::flag_init("shoot_guide_now");
	common_scripts\utility::flag_init("orders_given_lets_move_out");
	common_scripts\utility::flag_init("incoming_rocket_fire");
	common_scripts\utility::flag_init("kill_rocket_scene_guy");
	common_scripts\utility::flag_init("encounter_01_done");
	common_scripts\utility::flag_init("truck_push_initiate");
	common_scripts\utility::flag_init("second_land_assist_go");
	common_scripts\utility::flag_init("fob_animation_complete");
	common_scripts\utility::flag_init("destroy_fob_blocking");
	common_scripts\utility::flag_init("player_initiated_door_ripoff");
	common_scripts\utility::flag_init("guy_dragged_success");
	common_scripts\utility::flag_init("send_will_2secs_early");
	common_scripts\utility::flag_init("player_passed_fob");
	common_scripts\utility::flag_init("land_assist_activated");
	common_scripts\utility::flag_init("e3_presentation_cleanup");
	common_scripts\utility::flag_init("snake_swarm_first_flyby_begin");
	common_scripts\utility::flag_init("npc_pods_landed");
	common_scripts\utility::flag_init("player_just_grabbed_door");
	common_scripts\utility::flag_init("snake_swarm_cardoor_charge_end");
	common_scripts\utility::flag_init("dropoff_drones_exit");
	common_scripts\utility::flag_init("end_lobby_loopers");
	common_scripts\utility::flag_init("all_targeted_drones_dead");
	common_scripts\utility::flag_init("ignore_land_assist_hint");
	common_scripts\utility::flag_init("end_smart_grenade_hint");
	common_scripts\utility::flag_init("drone_swarm_complete");
	common_scripts\utility::flag_init("all_drones_dead");
	common_scripts\utility::flag_init("jump_training_ended");
	common_scripts\utility::flag_init("objective_start");
	common_scripts\utility::flag_init("objective_cardoor");
	common_scripts\utility::flag_init("objective_mobile_turret");
	common_scripts\utility::flag_init("vista_bomber_trigger_01");
	common_scripts\utility::flag_init("vista_bomber_trigger_02");
	common_scripts\utility::flag_init("vista_bomber_trigger_03");
	common_scripts\utility::flag_init("dialogue_performing_arts_interior");
	common_scripts\utility::flag_init("dialogue_performing_arts_exit");
	common_scripts\utility::flag_init("spawn_regular_heroes");
	common_scripts\utility::flag_init("spawn_guys_for_intro");
	common_scripts\utility::flag_init("video_log_playing");
	common_scripts\utility::flag_init("will_cardoor_watcher_flag");
	common_scripts\utility::flag_init("flag_drone_ok_to_follow");
	common_scripts\utility::flag_init("enable_door_clip");
	common_scripts\utility::flag_init("begin_mech_reload");
	common_scripts\utility::flag_init("flag_drone_buzz_will");
	common_scripts\utility::flag_init("flag_drone_street_strafe");
	common_scripts\utility::flag_init("start_drone_turret_charge");
	common_scripts\utility::flag_init("end_drone_turret_charge");
	common_scripts\utility::flag_init("ok_to_land_assist");
	common_scripts\utility::flag_init("spawn_looping_planes");
	common_scripts\utility::flag_init("guy4_reached_goal");
	common_scripts\utility::flag_init("guy5_reached_goal");
	common_scripts\utility::flag_init("guy6_reached_goal");
	common_scripts\utility::flag_init("guy7_reached_goal");
	common_scripts\utility::flag_init("guy8_reached_goal");
	common_scripts\utility::flag_init("guy9_reached_goal");
	common_scripts\utility::flag_init("tank_is_clear");
	common_scripts\utility::flag_init("follow_tank_is_dead");
	common_scripts\utility::flag_init("wep_drone_dropoff_start");
	common_scripts\utility::flag_init("drones_cleared_building");
	common_scripts\utility::flag_init("flag_cormack_has_arrived_at_hill");
	common_scripts\utility::flag_init("flag_will_irons_has_arrived_at_hill");
	common_scripts\utility::flag_init("seoul_player_can_exit_x4walker");
	common_scripts\utility::flag_init("walker_tank_is_dead");
	common_scripts\utility::flag_init("boost_dodge_hint_off");
	common_scripts\utility::flag_init("pause_credits");
	common_scripts\utility::flag_init("kill_credits");
	lib_A563::main();
	if(level.nextgen)
	{
		lib_A524::init();
	}

	lib_A564::func_5498();
	lib_A50D::func_4CDE();
	lib_A5FA::func_E14();
	lib_A5F8::func_2ECB();
	lib_A522::init();
	if(level.currentgen)
	{
		thread maps\seoul_transients_cg::func_1C3D();
		thread maps\seoul_transients_cg::func_1C3E();
		thread maps\seoul_transients_cg::func_1C3F();
		thread maps\seoul_transients_cg::func_1C3B();
		thread maps\seoul_transients_cg::func_1C40();
		thread maps\seoul_transients_cg::func_1C41();
		thread maps\seoul_transients_cg::func_1C43();
		thread maps\seoul_transients_cg::func_1C42();
		thread maps\seoul_transients_cg::func_1C39();
		thread maps\seoul_transients_cg::func_1C38();
		thread maps\seoul_transients_cg::func_1C37();
	}

	level.var_3BB9 = [];
	level.var_3BBA = [];
	level.var_3BBB = [];
	level.var_31FF = [];
	level.var_31FF[0] = "iw5_hbra3_sp";
	level.var_31FF[1] = "dshk_turret_so_osprey";
	level.var_31FF[2] = "ac130_25mm";
	level.var_2E27 = "iw5_attackdronegunseoul";
	level.var_1D30 = "bls_ui_turret_overlay_sm_alt";
	level.var_1D34 = "bls_ui_turret_overlay_sm_alt_emp";
	level.var_1D32 = "bls_ui_turret_overlay_sm_alt_drone";
	level.var_1D33 = "bls_ui_turret_overlay_sm_alt_drone2";
	level.var_1D31 = "hud_white_box";
	level.var_9E85 = [];
	level.var_A110 = undefined;
	level.var_5DFE = [];
	level.var_A121 = 0;
	if(level.nextgen)
	{
		level.var_5C22 = randomintrange(180,210);
	}
	else
	{
		level.var_5C22 = randomintrange(70,80);
	}

	function_00D3("r_hudoutlineenable",1);
	function_00D3("r_hudoutlinewidth",2);
	precacheitem(level.var_31FF[1]);
	precacheitem(level.var_31FF[2]);
	precacheitem(level.var_2E27);
	precacheitem("iw5_em1_sp_opticstargetenhancer");
	precacheitem("rpg_straight");
	precacheitem("ac130_25mm");
	precacheitem("dshk_turret_so_osprey");
	precacheitem("rpg_guided");
	precacheitem("hovertank_missile_small_straight");
	precachemodel("npc_zipline101ft");
	precachemodel("projectile_rpg7");
	precachemodel("vehicle_sentinel_survey_drone");
	precachemodel("vehicle_walker_tank");
	precachemodel("npc_atlas_suv_door_fr");
	precachemodel("npc_atlas_suv_door_fl");
	precachemodel("vm_atlas_suv_door_fl");
	precachemodel("vehicle_mil_cargo_truck_ai");
	precachemodel("vehicle_mil_drop_pod");
	precachemodel("vehicle_mil_drop_pod_seats");
	if(level.nextgen)
	{
		precachemodel("vehicle_mil_drop_pod_static_landed");
	}

	precachemodel("mil_drop_pod_seat");
	precachemodel("vehicle_mil_drop_pod_intro");
	if(level.currentgen)
	{
		precacheshader("mtl_mil_drop_pod_int");
		precacheshader("mtl_marines_assault_combine");
		precacheshader("mtl_marines_assault_loadouts");
		precacheshader("mtl_marines_smg_loadouts");
		precacheshader("mtl_marines_exo");
		precacheshader("mtl_cormack_marines_body_cg");
		precacheshader("mtl_cormack_marines_loadouts_cg");
		precacheshader("mtl_will_marines_lowerbody_body_cg");
		precacheshader("mtl_will_marines_upperbody_cg");
	}

	precachemodel("vehicle_mil_drop_pod_screens");
	precachemodel("mil_drop_pod_seat_rack");
	precachemodel("mil_drop_pod_seat_cpt");
	precachemodel("mil_drop_pod_seat_simple");
	precachemodel("projectile_javelin_missile");
	precachemodel("vehicle_civ_pickup_truck_01_wrecked");
	precachemodel("vehicle_mil_attack_drone_static_orange");
	precachemodel("vehicle_mil_attack_drone_static");
	precachemodel("vehicle_mil_mwp_static");
	precachemodel("vehicle_mil_drop_pod_static_gsq");
	precachemodel("crate_supply_01_long_full");
	precacheshader(level.var_1D30);
	precacheshader(level.var_1D34);
	precacheshader(level.var_1D31);
	precacheshader(level.var_1D32);
	precacheshader(level.var_1D33);
	function_0251("lag_snipper_laser");
	precacheshader("drone_turret_hud_target");
	precacheshader("drone_turret_hud_locking");
	precacheshader("hud_white_box");
	precacheshader("dpad_icon_land_assist");
	precachemodel("vm_himar_base_loot_sp");
	precacherumble("heavy_3s");
	lib_A59A::func_764("jump_training",&"SEOUL_DOUBLE_TAP_A_FOR_BOOST_JUMP",::func_1571);
	lib_A59A::func_764("press_a_for_emp",&"SEOUL_PRESS_A_FOR_EMP",::func_3074);
	lib_A59A::func_764("smart_grenade_training",&"SEOUL_USE_SMART_GRENADE",::func_8664);
	lib_A59A::func_764("car_door_throw",&"SEOUL_CARDOOR_THROW",::func_1B84);
	lib_A59A::func_764("boost_slam_train",&"SEOUL_TRAIN_BOOST_SLAM",::func_8602);
	lib_A59A::func_746("x_for_hover",&"SEOUL_PRESS_X_FOR_COUNTER_THRUSTERS",::func_5495,&"SEOUL_PRESS_X_FOR_COUNTER_THRUSTERS_PC");
	lib_A59A::func_746("x_for_hover_alt",&"SEOUL_PRESS_X_FOR_COUNTER_THRUSTERS",::func_5497,&"SEOUL_PRESS_X_FOR_COUNTER_THRUSTERS_PC");
	lib_A59A::func_746("x_for_hover_across",&"SEOUL_LAND_ASSIST_HOVER",::func_4A48,&"SEOUL_LAND_ASSIST_HOVER_PC");
	lib_A59A::func_746("ads_train",&"SEOUL_ADS_TRAINING",::func_0875,&"SEOUL_ADS_TRAINING_PC");
	lib_A59A::func_746("lt_rt_harness",&"SEOUL_LT_OR_RT_TO_RELEASE_HARNESS",::func_58B5,&"SEOUL_LT_OR_RT_TO_RELEASE_HARNESS_PC");
	lib_A59A::func_746("rt_right_harness",&"SEOUL_RT_TO_RELEASE_RIGHT_HARNESS",::func_766F,&"SEOUL_RT_TO_RELEASE_RIGHT_HARNESS_PC");
	lib_A59A::func_746("lt_left_harness",&"SEOUL_LT_TO_RELEASE_LEFT_HARNESS",::func_58B1,&"SEOUL_LT_TO_RELEASE_LEFT_HARNESS_PC");
	lib_A59A::func_746("a_to_open_hatch",&"SEOUL_PRESS_A_TO_OPEN_HATCH",::func_650F,&"SEOUL_PRESS_A_TO_OPEN_HATCH_PC",&"SEOUL_PRESS_A_TO_OPEN_HATCH_SP");
	lib_A59A::func_746("boost_dodge_train",&"SEOUL_TRAIN_BOOST_DODGE",::func_2C26,&"SEOUL_TRAIN_BOOST_DODGE_PC",&"SEOUL_TRAIN_BOOST_DODGE_SP");
	common_scripts\utility::flag_set("ok_to_land_assist");
	thread func_3C04();
	thread func_52BF();
	thread func_452A();
	thread func_4608();
	thread func_4520();
	thread func_8662();
	level.var_3000 = 0;
	createthreatbiasgroup("enemies_ignored_by_allies");
	createthreatbiasgroup("allies_ignored_by_enemies");
	createthreatbiasgroup("enemies_attack_player");
	createthreatbiasgroup("major_allies");
	createthreatbiasgroup("enemies_ignored_by_major_allies");
	createthreatbiasgroup("enemies_ignore_player");
	createthreatbiasgroup("player");
	setignoremegroup("enemies_ignored_by_allies","allies");
	setignoremegroup("enemies_ignored_by_major_allies","major_allies");
	setignoremegroup("major_allies","enemies_ignored_by_major_allies");
	setignoremegroup("player","enemies_ignore_player");
	setignoremegroup("major_allies","enemies_attack_player");
	level.var_31D sentient_setthreatbiasgroup("player");
	animscripts\traverse\boost::func_6EB0();
	thread func_2719();
}

//Function Number: 2
func_2719()
{
	level waittill("exo_breach_impact");
	wait 0.05;
}

//Function Number: 3
func_26A5()
{
	for(;;)
	{
		self waittill("bad_path",var_00);
		common_scripts\utility::draw_line_for_time(self geteye(),var_00,randomfloat(1),randomfloat(1),randomfloat(1),0.1);
	}
}

//Function Number: 4
func_26B3()
{
	for(;;)
	{
		level.var_31D waittill("damage",var_00,var_01,var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09);
		if(var_04 == "MOD_FALLING" || var_04 == "mod_falling")
		{
			level.var_31D.health = 1;
		}
	}
}

//Function Number: 5
func_6F0A(param_00)
{
	function_00D3("cg_cinematicFullScreen","0");
	function_0057(param_00,1);
	level.var_24DB = param_00;
}

//Function Number: 6
func_68AB(param_00,param_01,param_02)
{
	if(isdefined(level.var_24DB))
	{
		function_001B(0);
		function_00D3("cg_cinematicFullScreen","1");
		level.var_24DB = undefined;
	}
	else
	{
		function_0057(param_00);
	}

	if(!isdefined(param_02) || !param_02)
	{
		function_00D3("cg_cinematicCanPause","1");
	}

	wait(1);
	while(function_005B())
	{
		wait(0.05);
	}

	if(!isdefined(param_02) || !param_02)
	{
		function_00D3("cg_cinematicCanPause","0");
	}
}

//Function Number: 7
func_69B3()
{
	function_00D3("cg_cinematicfullscreen","0");
	thread func_862C();
	thread lib_A571::func_2AA2(1);
	thread func_3061();
	thread func_72A2();
	lib_A5DE::snd_message("seo_video_log_start");
	common_scripts\utility::flag_set("video_log_playing");
	lib_A571::func_6A19("seoul_videolog","screen_add");
	thread lib_A571::func_30C0(1);
	thread func_74CB();
	thread func_74D3();
}

//Function Number: 8
func_72A2()
{
	level.var_31D lib_A59A::func_6C1D(70);
}

//Function Number: 9
func_74D3()
{
	thread maps\seoul::func_42F2(70,100,10);
}

//Function Number: 10
func_3061()
{
	lib_A56F::func_A0B9("trigger_sinkhole_enemy_setup");
	if(function_005B())
	{
		lib_A571::func_8ECD();
		wait(1);
		maps\seoul::func_4C68();
	}
}

//Function Number: 11
func_45EE()
{
	thread func_6C13("trig_convention_center_combat_05","vol_tester_skipping_guys_pac",2);
	thread func_6C13("vol_tester_skipping_guys_sinkhole","volume_sinkhole_enemy_defend",2);
	thread func_6C13("trig_move_to_final_color","vol_canal_enemy_ai_check_01",3);
}

//Function Number: 12
func_6C13(param_00,param_01,param_02)
{
	lib_A56F::func_A0B9(param_00);
	var_03 = getent(param_01,"targetname");
	var_04 = function_00D6("axis");
	var_05 = [];
	foreach(var_07 in var_04)
	{
		if(var_07 istouching(var_03))
		{
			var_05[var_05.size] = var_07;
		}
	}

	if(var_05.size > param_02)
	{
		thread func_0E25(10,var_05);
	}
}

//Function Number: 13
func_0E25(param_00,param_01)
{
	if(!isdefined(level.var_6B70))
	{
		level.var_6B70 = 1;
	}
	else
	{
		level.var_6B70++;
	}

	thread func_74D6(param_00);
	var_02 = function_00D6("axis");
	foreach(var_04 in var_02)
	{
		if(isdefined(var_04) & !isdefined(var_04.var_63B5))
		{
			var_04.var_63B5 = var_04 sentient_getthreatbiasgroup();
			var_04 sentient_setthreatbiasgroup("enemies_attack_player");
			var_04.var_A = 1;
		}
	}

	foreach(var_07 in param_01)
	{
		if(isdefined(var_07))
		{
			var_07 thread lib_A59A::func_6BF9(param_00);
		}
	}
}

//Function Number: 14
func_74D6(param_00)
{
	wait(param_00);
	var_01 = function_00D6("axis");
	foreach(var_03 in var_01)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		if(isdefined(var_03.var_63B5))
		{
			var_03 sentient_setthreatbiasgroup(var_03.var_63B5);
			continue;
		}

		var_03 sentient_setthreatbiasgroup("");
	}
}

//Function Number: 15
func_862C()
{
	level.var_21DF lib_A59A::func_30AF();
	level.var_A31B lib_A59A::func_30AF();
	level.var_520E lib_A59A::func_30AF();
	level.var_21DF lib_A59A::func_7E7B(0.8);
	level.var_A31B lib_A59A::func_7E7B(0.8);
	level.var_520E lib_A59A::func_7E7B(0.8);
}

//Function Number: 16
func_74CB()
{
	level.var_21DF lib_A59A::func_7E7B(1);
	level.var_A31B lib_A59A::func_7E7B(1);
	level.var_520E lib_A59A::func_7E7B(1);
}

//Function Number: 17
func_52BF()
{
	wait(1);
	self endon("death");
	common_scripts\utility::flag_wait("ok_to_land_assist");
	level.var_31D setweaponhudiconoverride("actionslot4","dpad_icon_land_assist");
	for(;;)
	{
		for(;;)
		{
			level.var_31D waittill("dpad_right");
			if(lib_A561::func_6B02())
			{
				break;
			}
		}

		level.var_31D thread lib_A564::func_5DB1();
		common_scripts\utility::flag_set("land_assist_activated");
		wait(0.5);
		level.var_31D waittill("dpad_right");
		level.var_31D notify("clear_land_assist_process");
		common_scripts\utility::flag_clear("land_assist_activated");
		wait(0.5);
	}
}

//Function Number: 18
func_A0A8(param_00)
{
	level.var_31D endon("dpad_right");
	level.var_31D endon("dpad_left");
	level.var_31D endon("dpad_up");
	level.var_31D endon("landassist_button");
	while(common_scripts\utility::flag("land_assist_activated"))
	{
		if(common_scripts\utility::flag("ignore_land_assist_hint"))
		{
			return;
		}

		var_01 = bullettrace(level.var_31D.var_2E6,level.var_31D.var_2E6 - (0,0,1000),1,level.var_31D,1,0);
		if(isdefined(var_01["position"]))
		{
			if(distance(var_01["position"],level.var_31D.var_2E6) > 128)
			{
				break;
			}
		}

		wait 0.05;
	}

	level.var_31D waittill("end_jump_hud");
}

//Function Number: 19
func_3C04()
{
	level endon("missionfailed");
	thread func_7804();
	thread func_7805();
	for(;;)
	{
		level waittill("autosave_request");
		wait 0.05;
		lib_A59A::func_1158();
	}
}

//Function Number: 20
func_7804()
{
	lib_A56F::func_A0B9("seoul_streets_02");
	level notify("autosave_request");
}

//Function Number: 21
func_7805()
{
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	level notify("autosave_request");
}

//Function Number: 22
func_62E4()
{
	wait(1);
	if(!common_scripts\utility::flag("begin_looping_fob_functions"))
	{
		level waittill("droppod_empty");
	}

	objective_onentity(lib_A59A::func_62AE("objective_demo_team"),level.var_21DF,(0,0,0));
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	function_00D3("objectiveAlphaEnabled",1);
	common_scripts\utility::flag_wait("flag_start_fob_meet_scene");
	wait(2);
	function_00D3("objectiveAlphaEnabled",0);
}

//Function Number: 23
func_62E3()
{
	lib_A56F::func_A0B9("trigger_drone_swarm_flank");
	var_00 = getentarray("trig_door_shield","targetname");
	foreach(var_02 in var_00)
	{
		var_02.var_2D41 = getent(var_02.target,"targetname");
		var_02.var_2D49 = getent(var_02.var_2D41.target,"targetname");
	}

	thread func_A359();
	foreach(var_02 in var_00)
	{
		var_02.var_2D49 notify("end_hud_outline");
		var_02.var_2D49 thread func_8E20();
	}

	thread func_5D76();
}

//Function Number: 24
func_A359()
{
	level.var_31D endon("player_has_cardoor");
	level.var_31D endon("turret_objective_active");
	level.var_1B83 = [];
	var_00 = common_scripts\utility::getstructarray("struct_door_ripoff_scene_prompt","targetname");
	var_01 = undefined;
	for(;;)
	{
		var_02 = func_3CD4(level.var_31D.var_2E6,var_00,1000);
		if(isdefined(var_02) && !isdefined(var_01) || var_01 != var_02)
		{
			foreach(var_04 in level.var_1B83)
			{
				if(isdefined(var_04))
				{
					var_04 lib_A571::func_48B3();
				}
			}

			level.var_1B83[level.var_1B83.size] = lib_A571::func_48BB("x",var_02.var_2E6,32,1500);
			var_01 = var_02;
		}

		wait 0.05;
	}
}

//Function Number: 25
func_3CD4(param_00,param_01,param_02)
{
	var_03 = getent("vol_cardoor_objective_vol_a","targetname");
	var_04 = getent("vol_cardoor_objective_vol_b","targetname");
	var_05 = getent("vol_cardoor_objective_vol_c","targetname");
	if(level.var_31D istouching(var_04))
	{
		foreach(var_07 in param_01)
		{
			if(isdefined(var_07.var_39B) && issubstr(var_07.var_39B,"vol_b"))
			{
				return var_07;
			}
		}

		return;
	}

	return common_scripts\utility::getclosest(var_03,var_04,var_05);
}

//Function Number: 26
func_8E20()
{
	self endon("death");
	self endon("door_weapon_removed");
	level.var_31D endon("player_has_cardoor");
	level.var_31D endon("turret_objective_active");
	function_009A(self);
	function_00A6(self,level.var_31D);
	function_00D3("r_hudoutlinewidth",4);
	self.var_615A = 0;
	thread func_4533();
	thread func_4532();
}

//Function Number: 27
func_4532()
{
	level.var_31D common_scripts\utility::waittill_either("player_has_cardoor","turret_objective_active");
	self hudoutlinedisable();
}

//Function Number: 28
func_4533()
{
	self endon("death");
	self endon("door_weapon_removed");
	level.var_31D endon("player_has_cardoor");
	level.var_31D endon("turret_objective_active");
	while(isdefined(self))
	{
		var_00 = distance(level.var_31D.var_2E6,self.var_2E6);
		if(var_00 < 1500 && function_009F(self,level.var_31D,65,150))
		{
			self hudoutlineenable(6,1);
			continue;
		}

		self hudoutlinedisable();
		wait(0.05);
	}
}

//Function Number: 29
func_5D76()
{
	level.var_31D common_scripts\utility::waittill_any("player_has_cardoor","turret_objective_active");
	if(isdefined(level.var_1B83))
	{
		foreach(var_01 in level.var_1B83)
		{
			if(isdefined(var_01))
			{
				var_01 lib_A571::func_48B3();
			}
		}
	}
}

//Function Number: 30
func_62E5()
{
	thread lib_A56F::func_97FE("trigger_cardoor_strafe");
	level common_scripts\utility::waittill_either("turret_objective_given","trigger_cardoor_strafe");
	if(common_scripts\utility::flag("objective_cardoor"))
	{
		common_scripts\utility::flag_waitopen("objective_cardoor");
		lib_A59A::func_62E8(1);
	}

	common_scripts\utility::flag_set("objective_mobile_turret");
	level.var_31D notify("turret_objective_active");
	wait(2);
	function_00D3("r_hudoutlinewidth",1);
	level.var_5D21 hudoutlineenable(6,1);
	level.var_5D21.mgturret[0] hudoutlineenable(6,1);
	var_00 = getent("mobile_turret_drone_street","targetname");
	objective_onentity(lib_A59A::func_62AE("objective_demo_team"),var_00.var_48B8[1]);
	function_00BF(lib_A59A::func_62AE("objective_demo_team"),&"SEOUL_ENTER_MOBILE_TURRET");
	while(distance(level.var_31D.var_2E6,level.var_5D21.var_2E6) > 450)
	{
		wait 0.05;
	}

	level.var_5D21 hudoutlinedisable();
	level.var_5D21.mgturret[0] hudoutlinedisable();
	level.var_5D21 lib_A59A::func_32DF("player_in_transition");
	objective_position(lib_A59A::func_62AE("objective_demo_team"),(0,0,0));
	level.var_31D waittill("player_in_x4walker");
}

//Function Number: 31
func_62E6()
{
	level waittill("end_cherry_picker");
	objective_onentity(lib_A59A::func_62AE("objective_demo_team"),level.var_21DF,(0,0,0));
	function_00BF(lib_A59A::func_62AE("objective_demo_team"),"");
}

//Function Number: 32
func_3C06()
{
	objective_add(lib_A59A::func_62AE("objective_demo_team"),"active","Regroup with D Company");
	objective_current(lib_A59A::func_62AE("objective_demo_team"));
	while(!isdefined(level.var_21DF))
	{
		wait(0.05);
	}

	thread func_62E4();
	thread func_62E3();
	thread func_62E5();
	thread func_62E6();
	lib_A56F::func_A0B9("trig_teleport_ally_squad_shopping");
	objective_onentity(lib_A59A::func_62AE("objective_demo_team"),level.var_A31B,(0,0,0));
}

//Function Number: 33
func_7D91()
{
	lib_A5DE::snd_message("start_seoul_intro");
	level.var_31D method_83C0("space_entry");
	level.var_31D method_8490("clut_seoul_pod_v3",0);
	common_scripts\utility::flag_set("spawn_guys_for_intro");
	thread func_8067();
	func_811E();
	level.var_31D notify("disable_player_boost_jump");
}

//Function Number: 34
func_7D8E()
{
	lib_A5DE::snd_message("start_seoul_first_land_assist");
	lib_A59A::func_CE5(getentarray("start_building_ext_hide","targetname"));
	thread maps\seoul_lighting::func_65BE();
	var_00 = common_scripts\utility::getstruct("struct_start_first_land_assist","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_start_first_land_assist_npc","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	common_scripts\utility::flag_set("set_seoul_hotel_lighting");
	common_scripts\utility::flag_set("objective_start");
	func_811E();
	level.var_A31B method_81C6(var_01[0].var_2E6,var_01[0].var_41);
	level.var_21DF method_81C6(var_01[1].var_2E6,var_01[1].var_41);
	level.var_520E method_81C6(var_01[2].var_2E6,var_01[2].var_41);
	func_0A74();
	level.var_31D notify("disable_player_boost_jump");
}

//Function Number: 35
func_7D89()
{
	lib_A5DE::snd_message("start_seoul_enemy_encounter_01");
	thread maps\seoul_lighting::func_65BE();
	var_00 = common_scripts\utility::getstruct("struct_player_start_encounter_01","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_npc_start_encounter_01","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D method_83C0("seoul_hotel_top");
	level.var_31D method_8490("clut_seoul_hotel_atrium",0);
	lib_A59A::func_9E65("seoul_hotel_interior",0);
	common_scripts\utility::flag_set("set_seoul_hotel_lighting");
	common_scripts\utility::flag_set("objective_start");
	func_811E();
	level.var_A31B method_81C6(var_01[0].var_2E6,var_01[0].var_41);
	level.var_21DF method_81C6(var_01[1].var_2E6,var_01[1].var_41);
	level.var_520E method_81C6(var_01[2].var_2E6,var_01[2].var_41);
	level.var_31D notify("glass_gag_done");
	level.var_31D notify("disable_player_boost_jump");
}

//Function Number: 36
func_7D90()
{
	lib_A5DE::snd_message("start_seoul_missle_evade_sequence");
	thread maps\seoul_lighting::func_65BE();
	var_00 = common_scripts\utility::getstruct("struct_missile_evade_start","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_missile_evade_start_01","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	common_scripts\utility::flag_set("set_seoul_hotel_lighting");
	common_scripts\utility::flag_set("objective_start");
	func_811E();
	level.var_A31B method_81C6(var_01[0].var_2E6,var_01[0].var_41);
	level.var_21DF method_81C6(var_01[1].var_2E6,var_01[1].var_41);
	level.var_520E method_81C6(var_01[2].var_2E6,var_01[2].var_41);
}

//Function Number: 37
func_7D8B()
{
	lib_A5DE::snd_message("start_seoul_forward_operating_base");
	thread maps\seoul_lighting::func_65BE();
	var_00 = common_scripts\utility::getstruct("struct_start_point_fob","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_start_point_fob_1","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D method_83C0("seoul_streets");
	level.var_31D method_8490("clut_seoul_fob",0);
	lib_A59A::func_9E65("seoul_streets",0);
	common_scripts\utility::flag_set("set_seoul_fob_lighting");
	common_scripts\utility::flag_set("end_lobby_loopers");
	common_scripts\utility::flag_set("objective_start");
	common_scripts\utility::flag_set("begin_looping_fob_functions");
	common_scripts\utility::flag_set("stop_flooding_grunts");
	func_811E();
	level.var_520E method_81C6(var_01[2].var_2E6,var_01[2].var_41);
	var_02 = common_scripts\utility::getstruct("struct_building_exit_cormack_idle","targetname");
	var_03 = common_scripts\utility::getstruct("struct_building_exit_will_idle","targetname");
	var_02 thread lib_A506::func_BE1(level.var_21DF,var_02.animation);
	var_03 thread lib_A506::func_BE1(level.var_A31B,"casual_stand_idle");
	level.var_A31B lib_A59A::func_2A8C();
	level.var_21DF lib_A59A::func_2A8C();
	level.var_520E lib_A59A::func_2A8C();
	level.var_A31B lib_A59A::func_7EA5("seo_react_to_war_run_npc2");
	level.var_21DF lib_A59A::func_7EA5("seo_react_to_war_run_npc1");
	level.var_520E lib_A59A::func_7EA5("seo_react_to_war_run_npc2");
	wait(0.3);
	common_scripts\utility::flag_set("begin_fob_combat_vignette");
	var_02 notify("stop_loop");
	level.var_21DF method_8141();
	var_03 notify("stop_loop");
	level.var_A31B method_8141();
	level.var_31D notify("trigger_allies_to_fob");
	wait(0.3);
	level.var_31D notify("disable_player_boost_jump");
}

//Function Number: 38
func_7D88()
{
	lib_A5DE::snd_message("start_seoul_drone_swarm_intro");
	thread maps\seoul_lighting::func_65BE();
	var_00 = common_scripts\utility::getstruct("struct_start_point_drone_swarm_intro","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_start_point_drone_swarm_intro_1","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D method_83C0("seoul_streets");
	lib_A59A::func_9E65("seoul_streets",0);
	common_scripts\utility::flag_set("set_seoul_drone_swarm_intro_lighting");
	common_scripts\utility::flag_set("objective_start");
	var_02 = getent("fob_player_clipblock","targetname");
	var_02 delete();
	thread func_394B();
	func_811E();
	level.var_A31B method_81C6(var_01[0].var_2E6,var_01[0].var_41);
	level.var_21DF method_81C6(var_01[1].var_2E6,var_01[1].var_41);
	level.var_520E method_81C6(var_01[2].var_2E6,var_01[2].var_41);
	var_03 = getnode("node_hill_pause_will","targetname");
	level.var_A31B method_81A5(var_03);
	var_03 = getnode("node_hill_pause_guy","targetname");
	level.var_520E method_81A5(var_03);
	var_03 = getnode("node_hill_pause_cormack","targetname");
	level.var_21DF method_81A5(var_03);
	level.var_31D notify("disable_player_boost_jump");
	thread func_3ECC();
	thread func_3D13();
}

//Function Number: 39
func_7D93()
{
	lib_A5DE::snd_message("start_seoul_truck_push");
	thread maps\seoul_lighting::func_65BE();
	var_00 = common_scripts\utility::getstruct("struct_start_truck_push_player","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_start_truck_push_01","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D method_83C0("seoul_streets");
	lib_A59A::func_9E65("seoul_streets",0);
	common_scripts\utility::flag_set("set_seoul_drone_swarm_intro_lighting");
	func_811E();
	common_scripts\utility::flag_set("objective_start");
	level.var_A31B method_81C6(var_01[0].var_2E6,var_01[0].var_41);
	level.var_21DF method_81C6(var_01[1].var_2E6,var_01[1].var_41);
	level.var_520E method_81C6(var_01[2].var_2E6,var_01[2].var_41);
	for(var_02 = 0;var_02 < 30;var_02++)
	{
		level notify("end_cherry_picker");
		wait 0.05;
	}
}

//Function Number: 40
func_7D8D()
{
	lib_A5DE::snd_message("start_seoul_hotel_entrance");
	thread maps\seoul_lighting::func_65BE();
	var_00 = common_scripts\utility::getstruct("struct_start_point_hotel_entrance","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_start_point_hotel_entrance_1","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	level.var_31D method_83C0("seoul_street");
	if(level.nextgen)
	{
		lib_A59A::func_9E65("seoul_streets_dimfog",0);
	}
	else
	{
		lib_A59A::func_9E65("seoul_convention_center",0);
	}

	common_scripts\utility::flag_set("set_seoul_hotel_entrance_lighting");
	func_811E();
	common_scripts\utility::flag_set("objective_start");
	level.var_A31B method_81C6(var_01[0].var_2E6,var_01[0].var_41);
	level.var_21DF method_81C6(var_01[1].var_2E6,var_01[1].var_41);
	level.var_520E method_81C6(var_01[2].var_2E6,var_01[2].var_41);
	for(var_02 = 0;var_02 < 30;var_02++)
	{
		level notify("end_cherry_picker");
		wait 0.05;
	}
}

//Function Number: 41
func_7D84()
{
	lib_A5DE::snd_message("start_seoul_building_jump_sequence");
	thread maps\seoul_lighting::func_65BE();
	var_00 = common_scripts\utility::getstruct("struct_start_point_building_jumps","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_start_point_building_jumps_1","targetname");
	level.var_31D lib_A59A::func_9237(var_00);
	common_scripts\utility::flag_set("set_seoul_building_jump_sequence_lighting");
	common_scripts\utility::flag_set("objective_start");
	func_811E();
	level.var_A31B method_81C6(var_01[0].var_2E6,var_01[0].var_41);
	level.var_21DF method_81C6(var_01[1].var_2E6,var_01[1].var_41);
	level.var_520E method_81C6(var_01[2].var_2E6,var_01[2].var_41);
	thread func_0C0A();
	var_02 = getent("trig_convention_center_combat_06","targetname");
	var_02 notify("trigger");
}

//Function Number: 42
func_7D92()
{
	level waittill("dropped_from_pod");
	func_811E();
}

//Function Number: 43
func_8067()
{
	thread func_8247();
	thread func_8262();
}

//Function Number: 44
func_731D()
{
	lib_A56F::func_A0B9("start_pod_landings_group_3");
}

//Function Number: 45
func_4523()
{
	thread func_731D();
	self endon("death");
	level endon("missionfailed");
	thread func_5D96();
	for(;;)
	{
		level waittill("boost_jump_reminder");
		if(func_4707(60))
		{
			continue;
		}

		lib_A59A::func_2B49("jump_training");
		level.var_31D func_A0B5(3,60);
		var_00 = 1;
		wait 0.05;
	}
}

//Function Number: 46
func_5D96()
{
	self endon("death");
	level endon("missionfailed");
	for(;;)
	{
		while(!level.var_31D method_83B4())
		{
			wait 0.05;
		}

		level.var_31D.var_4705 = gettime() * 0.001;
		wait 0.05;
	}
}

//Function Number: 47
func_A0B5(param_00,param_01)
{
	self endon("remove_boost_hint");
	self endon("death");
	level endon("missionfailed");
	while(!func_4707(60))
	{
		wait 0.05;
	}
}

//Function Number: 48
func_1571()
{
	if(!func_4707(60))
	{
		return 0;
	}

	return 1;
}

//Function Number: 49
func_4707(param_00)
{
	if(!isdefined(level.var_31D.var_4705))
	{
		return 0;
	}

	if(level.var_31D.var_4705 > gettime() * 0.001 - param_00)
	{
		return 1;
	}

	if(level.var_31D.var_4705 < gettime() * 0.001 - param_00)
	{
		return 0;
	}
}

//Function Number: 50
func_4524()
{
	level.var_31D thread func_5D66();
	common_scripts\utility::flag_wait("canal_jump_complete");
	wait(1.25);
	thread lib_A59A::func_2B49("boost_slam_train");
	level.var_31D thread lib_A59A::func_61FA("end_boost_slam_hint",6);
}

//Function Number: 51
func_5D66()
{
	self.var_4708 = gettime() * 0.001;
	for(;;)
	{
		level.var_31D common_scripts\utility::waittill_either("ground_slam","end_boost_slam_hint");
		self.var_4708 = gettime() * 0.001;
	}
}

//Function Number: 52
func_8602()
{
	if(self.var_4708 < gettime() * 0.001 - 30)
	{
		return 0;
	}

	return 1;
}

//Function Number: 53
func_4520()
{
	level.var_31D thread func_5D65();
	lib_A56F::func_A0B9("trigger_allies_enter_hotel");
	thread lib_A59A::func_48F6("boost_dodge_train");
	thread lib_A59A::func_383E("boost_dodge_hint_off",6);
}

//Function Number: 54
func_2C26()
{
	var_00 = gettime() * 0.001 - 20;
	if(common_scripts\utility::flag("boost_dodge_hint_off"))
	{
		return 1;
	}

	if(!isdefined(self.var_4706))
	{
		return 0;
	}

	if(self.var_4706 > var_00)
	{
		return 1;
	}

	return 0;
}

//Function Number: 55
func_5D65()
{
	self.var_4706 = undefined;
	level.var_31D waittill("exo_dodge");
	level.var_31D waittill("exo_dodge");
	self.var_4706 = 1;
	wait 0.05;
}

//Function Number: 56
func_45AB()
{
	lib_A56F::func_A0B9("trig_look_down_trigger");
	thread func_3E2B();
	common_scripts\utility::flag_set("ignore_land_assist_hint");
	while(!common_scripts\utility::flag("begin_looping_fob_functions"))
	{
		thread lib_A59A::func_48F6("x_for_hover_alt");
		while(!common_scripts\utility::flag("begin_looping_fob_functions") && level.var_31D buttonpresseddevonly("BUTTON_X"))
		{
			wait 0.05;
		}

		while(!common_scripts\utility::flag("begin_looping_fob_functions") && level.var_31D.var_2501 > -400)
		{
			wait 0.05;
		}

		wait 0.05;
	}

	common_scripts\utility::flag_clear("ignore_land_assist_hint");
	level.var_31D notify("HintDisplayHandlerEnd");
}

//Function Number: 57
func_5497()
{
	if(common_scripts\utility::flag("begin_looping_fob_functions"))
	{
		return 1;
	}

	if(level.var_31D buttonpresseddevonly("BUTTON_X") && level.var_31D.var_2501 > -200)
	{
		return 1;
	}

	return 0;
}

//Function Number: 58
func_730A()
{
	if(!level.var_31D buttonpresseddevonly("BUTTON_X") && level.var_31D.var_2501 < -200)
	{
		return 1;
	}

	return 0;
}

//Function Number: 59
func_3E2B()
{
	for(;;)
	{
		var_00 = level.var_31D getvelocity();
		level.var_31D.var_2501 = var_00[2];
		wait(0.01);
	}
}

//Function Number: 60
func_45AD()
{
	var_00 = getent("vol_land_assist_reminder_full","targetname");
	level.var_31D.var_503A = 0;
	for(;;)
	{
		while(!level.var_31D istouching(var_00))
		{
			level.var_31D.var_503A = 0;
			wait 0.05;
		}

		level.var_31D.var_503A = 1;
		lib_A564::func_399E();
		while(!self.var_5491 && level.var_31D istouching(var_00))
		{
			wait 0.05;
		}

		thread lib_A59A::func_48F6("x_for_hover_across");
		while(level.var_31D istouching(var_00) && self.var_5491)
		{
			wait 0.05;
		}
	}
}

//Function Number: 61
func_4A48()
{
	if(!level.var_31D.var_503A)
	{
		return 1;
	}

	if(!level.var_31D.var_5491)
	{
		return 1;
	}

	return 0;
}

//Function Number: 62
func_45AC()
{
	thread func_4580();
	self endon("death");
	level endon("missionfailed");
	for(;;)
	{
		while(isdefined(level.var_31D.var_84D9) && level.var_31D.var_84D9 == 0)
		{
			wait 0.05;
		}

		level waittill("land_assist_reminder",var_00);
		level.var_31D.var_470A = undefined;
		level.var_549D = var_00;
		if(!common_scripts\utility::flag("ignore_land_assist_hint"))
		{
			lib_A59A::func_48F6("x_for_hover");
		}

		func_A0A8(var_00);
		level.var_31D.var_470A = 1;
		wait 0.05;
	}
}

//Function Number: 63
func_4580()
{
}

//Function Number: 64
func_5495()
{
	if(!isdefined(level.var_31D.var_470A))
	{
		return 0;
	}

	if(level.var_31D.var_5491)
	{
		return 1;
	}

	if(level.var_31D.var_470A)
	{
		return 1;
	}
}

//Function Number: 65
func_811E()
{
	func_8043();
	level.var_31D thread func_4523();
	level.var_31D thread func_45AC();
	level.var_31D thread func_45AD();
	level.var_31D thread func_45AB();
	thread func_45C2();
	thread func_45C0();
	thread func_3C03();
	thread func_8244();
	thread func_457D();
	thread func_461B();
	thread func_4513();
	thread func_459A();
	thread func_45CC();
	thread func_4642();
	thread func_4DC3();
	thread func_80DD();
	thread func_80D7();
	thread func_2FFF();
	thread func_2FFB();
	thread func_7429();
	lib_A59A::func_1333("allies");
}

//Function Number: 66
func_4609()
{
	var_00 = getent("volume_sinkhole_enemy_defend","targetname");
	var_01 = getent("spawner_sinkhole_enemy_defend_g1","targetname");
	var_02 = 3;
	var_03 = getent("spawner_sinkhole_enemy_defend_g2","targetname");
	var_04 = 3;
	var_05 = getnodearray("node_sinkhole_enemy_g1","targetname");
	var_06 = [];
	lib_A56F::func_A0B9("trigger_sinkhole_drones_attack_civs");
	level notify("autosave_request");
	thread lib_A56F::func_97FD("trig_move_allies_up_sinkhole_01","spawn_sinkhole_reinforce");
	lib_A56F::func_A0B9("trigger_sinkhole_enemy_setup");
	if(level.currentgen)
	{
		thread lib_A50E::func_1C32("killSinkHolePerf",undefined,15,0);
	}

	for(var_07 = 0;var_07 < var_02;var_07++)
	{
		var_08 = var_01 lib_A56F::func_72C(1);
		var_08 method_81A9(var_00);
		var_06[var_06.size] = var_08;
		wait(randomfloat(1.5));
	}

	while(var_06.size > var_05.size - 2 && !common_scripts\utility::flag("spawn_sinkhole_reinforce"))
	{
		var_06 = common_scripts\utility::array_removeundefined(var_06);
		wait 0.05;
	}

	for(var_07 = 0;var_07 < var_04;var_07++)
	{
		var_08 = var_03 lib_A56F::func_72C(1);
		var_08 method_81A9(var_00);
		var_06[var_06.size] = var_08;
		wait(randomfloatrange(1,2));
	}

	while(var_06.size > 1)
	{
		var_06 = common_scripts\utility::array_removeundefined(var_06);
		wait 0.05;
	}

	lib_A59A::func_70A("trig_move_allies_up_sinkhole_01");
	while(var_06.size > 0)
	{
		var_06 = common_scripts\utility::array_removeundefined(var_06);
		wait 0.05;
	}

	level notify("vo_area_clear");
}

//Function Number: 67
func_4642()
{
	level notify("kill_wep_drone_dropoff_process");
	level endon("kill_wep_drone_dropoff_process");
	var_00 = getentarray("trig_sinkhole_ai_move_to_jump1","targetname");
	var_00[0] waittill("trigger");
	var_01 = lib_A59E::func_8973("vehicle_weapons_platform_flyover");
	var_01 thread func_5937();
	var_02 = getent("drone_reflection_05","targetname");
	var_03 = spawn("script_model",var_01.var_2E6);
	var_03 setmodel("vehicle_mil_mwp_static");
	var_03.var_41 = var_01.var_41;
	thread lib_A5CE::func_A2D8(var_01);
	var_03.var_2E6 = var_01.var_2E6;
	var_03.var_41 = var_01.var_41;
	var_03 linkto(var_01,"tag_origin");
	var_01 veh_setspeed(0,10,10);
	lib_A56F::func_A0B9("seoul_weapons_platform_trigger");
	var_01 lib_A5DE::snd_message("seo_sinkhole_wp_flyby");
	var_01 veh_setspeed(10,10,10);
	var_03 method_83AB(var_02.var_2E6);
	var_01 hide();
	common_scripts\utility::flag_wait("wep_drone_dropoff_start");
	common_scripts\utility::flag_wait("wp_at_end_of_path");
	var_03 delete();
}

//Function Number: 68
func_5937()
{
	while(isdefined(self))
	{
		self.health = 100000;
		wait 0.05;
	}
}

//Function Number: 69
func_45C0()
{
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
}

//Function Number: 70
func_8662()
{
	thread func_8663();
	thread lib_A56F::func_97FE("trig_convention_center_combat_02","smart_grenade_training");
	thread lib_A56F::func_97FE("trig_restaurant_spawn","smart_grenade_training");
}

//Function Number: 71
func_8663()
{
	thread func_8665();
	for(;;)
	{
		level waittill("smart_grenade_training");
		thread lib_A59A::func_383E("end_smart_grenade_hint",6);
		thread lib_A59A::func_3830("end_smart_grenade_hint",7);
		thread lib_A59A::func_2B49("smart_grenade_training");
	}
}

//Function Number: 72
func_6C4A()
{
	if(!isdefined(level.var_31D.var_470E))
	{
		return 0;
	}

	if(level.var_31D.var_470E > gettime() * 0.001 - 45)
	{
		return 1;
	}

	return 0;
}

//Function Number: 73
func_46ED()
{
	var_00 = level.var_31D getoffhandprimaryclass();
	var_01 = weaponmaxammo(var_00);
	var_02 = level.var_31D getammocount(var_00);
	if(var_02 > 0)
	{
		return 1;
	}

	return 0;
}

//Function Number: 74
func_8665()
{
	level.var_31D.var_470E = undefined;
	for(;;)
	{
		level.var_31D waittill("rb_pressed");
		level.var_31D.var_470E = gettime() * 0.001;
	}
}

//Function Number: 75
func_8664()
{
	if(common_scripts\utility::flag("end_smart_grenade_hint"))
	{
		return 1;
	}

	if(func_6C4A())
	{
		return 1;
	}

	if(!func_46ED())
	{
		return 1;
	}

	return 0;
}

//Function Number: 76
func_0874()
{
	lib_A56F::func_A0B9("trigger_starte_first_fight");
	thread func_0876();
	thread lib_A59A::func_48F6("ads_train");
}

//Function Number: 77
func_0876()
{
	thread lib_A59A::func_61FA("3sectimeout",3);
	level common_scripts\utility::waittill_either("first_fight_guy_dead","3sectimeout");
	level.var_31D.var_4704 = 1;
}

//Function Number: 78
func_0875()
{
	if(!isdefined(level.var_31D.var_4704))
	{
		return 0;
	}

	if(level.var_31D.var_4704)
	{
		return 1;
	}
}

//Function Number: 79
func_2FFB()
{
	level waittill("droppod_empty");
	level endon("cormack_to_first_land_assist");
	var_00 = getent("spawner_enemy_building_traverse_crush_gag","targetname");
	thread func_0874();
	thread lib_A56F::func_97FD("trig_break_first_fight_anims","wake_up_ambush_guys");
	thread func_80FA(var_00,"struct_e3_building_first_fight_left_1");
	thread func_80FB(var_00,"struct_e3_building_first_fight_right_2");
	thread func_80FC(var_00,"struct_e3_building_first_fight_right_1");
	for(var_01 = 0;var_01 < 3;var_01++)
	{
		level waittill("first_fight_guy_dead");
	}

	level notify("first_fight_done");
	lib_A59A::func_70A("trig_guys_move_up_after_first_fight");
	level notify("autosave_request");
}

//Function Number: 80
func_80FB(param_00,param_01)
{
	lib_A56F::func_A0B9("trigger_starte_first_fight");
	common_scripts\utility::flag_set("vo_nk_first_contact_start");
	var_02 = param_00 lib_A56F::func_72C(1);
	var_03 = param_00 lib_A56F::func_72C(1);
	var_02 endon("end_ambush_behavior");
	var_03 endon("end_ambush_behavior");
	var_04 = common_scripts\utility::getstruct("struct_first_fight_teaser_01a","targetname");
	var_05 = common_scripts\utility::getstruct("struct_first_fight_teaser_01b","targetname");
	var_06 = common_scripts\utility::getstruct("struct_first_fight_teaser_02a","targetname");
	var_07 = common_scripts\utility::getstruct("struct_first_fight_teaser_02b","targetname");
	var_02 method_81C6(var_04.var_2E6,var_04.var_41);
	var_03 method_81C6(var_04.var_2E6,var_04.var_41);
	level thread lib_A59A::func_61FA("enter_e3_first_fight_enemies",4.2);
	var_02 lib_A59A::func_30AF();
	var_02 thread lib_A56F::func_6212(var_02,"first_fight_guy_dead");
	var_02.var_1C7 = 32;
	var_02.ignoreall = 1;
	var_02 lib_A59A::func_2AB0();
	var_02 method_81A6(var_05.var_2E6);
	var_02 thread func_3130();
	var_03 lib_A59A::func_30AF();
	var_03 thread lib_A56F::func_6212(var_02,"first_fight_guy_dead");
	var_03.var_1C7 = 32;
	var_03 lib_A59A::func_2AB0();
	var_03 method_81A6(var_07.var_2E6);
	var_03.ignoreall = 1;
	var_03 thread func_3130();
	wait(1.5);
	level notify("nk_soldier_spotted");
	wait(3.5);
	if(isdefined(var_02))
	{
		var_02.ignoreall = 0;
	}

	if(isdefined(var_03))
	{
		var_03.ignoreall = 0;
	}

	wait(2.5);
	if(isdefined(var_02))
	{
		var_02 method_81A7(level.var_31D);
	}

	if(isdefined(var_03))
	{
		var_03 method_81A7(level.var_31D);
	}
}

//Function Number: 81
func_80FA(param_00,param_01)
{
	var_02 = common_scripts\utility::getstruct(param_01,"targetname");
	var_03 = param_00 lib_A56F::func_72C(1);
	thread lib_A56F::func_6212(var_03,"first_fight_guy_dead");
	var_03 thread func_362C("first_fight_guy_dead");
	var_03 thread func_3130(var_02,"det_corner_check_left_enter");
	var_03 endon("death");
	var_03 endon("end_ambush_behavior");
	var_02 thread lib_A506::func_BCC(var_03,"det_corner_check_left_enter");
	var_03.var_31 = 1;
	var_03 lib_A59A::func_2AB0();
	var_03.var_BA5 = "det_corner_check_left_enter";
	var_03.var_BA6 = "det_corner_check_left_loop";
	var_03.var_BA7 = "det_corner_check_left_exit";
	lib_A56F::func_A0B9("trigger_starte_first_fight");
	common_scripts\utility::flag_wait_or_timeout("wake_up_ambush_guys",3);
	if(common_scripts\utility::flag("wake_up_ambush_guys"))
	{
		var_03 lib_A59A::func_C3D();
	}
	else
	{
		var_03 thread func_5DEE("wake_up_ambush_guys");
		var_03 thread common_scripts\utility::delaycall(1,::method_80B2,"lag_snipper_laser");
		var_03 lib_A59A::func_C3D();
		var_03 thread func_0A90();
		var_02 lib_A506::func_BC9(var_03,var_03.var_BA5);
		var_03.var_31 = 1;
		if(!isdefined(var_03.var_B5F))
		{
			var_03 thread lib_A506::func_BC9(var_03,var_03.var_BA7);
			var_03.var_31 = 1;
		}

		var_03 notify("ambush_anims_done");
	}

	var_03 common_scripts\utility::waittill_any("damage","death");
	level notify("e3_first_fight_is_on");
}

//Function Number: 82
func_5DEE(param_00)
{
	self endon("death");
	self endon("ambush_anims_done");
	common_scripts\utility::flag_wait(param_00);
	lib_A59A::func_C3D();
	self.var_B5F = 1;
}

//Function Number: 83
func_80FC(param_00,param_01)
{
	var_02 = common_scripts\utility::getstruct(param_01,"targetname");
	var_03 = param_00 lib_A56F::func_72C(1);
	var_03 lib_A59A::func_2AB0();
	var_03 thread func_3130(var_02,"det_corner_check_right_into");
	thread lib_A56F::func_6212(var_03,"first_fight_guy_dead");
	var_03 thread func_362C("first_fight_guy_dead");
	var_03 endon("death");
	var_03 endon("end_ambush_behavior");
	var_02 thread lib_A506::func_BCC(var_03,"det_corner_check_right_into");
	var_03.var_C3E = var_02;
	var_03.var_BA5 = "det_corner_check_right_into";
	var_03.var_BA6 = "det_corner_check_right_loop";
	var_03.var_BA7 = "det_corner_check_right_exit";
	lib_A56F::func_A0B9("trigger_starte_first_fight");
	common_scripts\utility::flag_wait_or_timeout("wake_up_ambush_guys",3.5);
	var_03 lib_A59A::func_C3D();
	if(!common_scripts\utility::flag("wake_up_ambush_guys"))
	{
		var_03 thread func_5DEE("wake_up_ambush_guys");
		var_03 thread func_0A90();
		var_02 lib_A506::func_BC9(var_03,var_03.var_BA5);
		var_03.var_31 = 1;
		var_03 thread lib_A506::func_BCE(var_03,var_03.var_BA6);
		common_scripts\utility::flag_wait_or_timeout("wake_up_ambush_guys",2);
		var_03 lib_A59A::func_C3D();
		var_03 notify("stop_loop");
		if(!common_scripts\utility::flag("wake_up_ambush_guys"))
		{
			var_03 thread lib_A506::func_BC9(var_03,var_03.var_BA7);
			var_03.var_31 = 1;
		}

		var_03 notify("ambush_anims_done");
	}

	if(common_scripts\utility::flag("wake_up_ambush_guys"))
	{
		var_03 lib_A59A::func_C3D();
		return;
	}

	var_03 thread common_scripts\utility::delaycall(1,::method_80B2,"lag_snipper_laser");
	var_03 lib_A59A::func_C3D();
	var_03 thread func_0A90();
	var_02 lib_A506::func_BC9(var_03,var_03.var_BA5);
	var_03.var_31 = 1;
	var_03 thread lib_A506::func_BC9(var_03,var_03.var_BA7);
	var_03.var_31 = 1;
}

//Function Number: 84
func_3130(param_00,param_01)
{
	self endon("death");
	lib_A56F::func_A0B9("trig_break_first_fight_anims");
	self notify("end_ambush_behavior");
	lib_A59A::func_C3D();
	self notify("stop_loop");
	if(isdefined(param_00) && isdefined(param_01))
	{
		param_00 thread lib_A506::func_BC9(self,param_01);
		wait 0.05;
		lib_A59A::func_C3D();
		self notify("stop_loop");
	}

	self.ignoreall = 0;
	self method_81A7(level.var_31D);
}

//Function Number: 85
func_362C(param_00)
{
	var_01 = self;
	var_01 endon("death");
	level waittill(param_00);
	while(isdefined(var_01))
	{
		for(var_02 = 0;var_02 < 5;var_02++)
		{
			var_01 method_81E7();
			wait(0.1);
		}

		wait(0.5);
	}
}

//Function Number: 86
func_4513()
{
	var_00 = getent("model_exo_push_car_gag","targetname");
	var_01 = common_scripts\utility::getstruct("struct_exo_car_push_gag_1","targetname");
	var_02 = common_scripts\utility::getstruct("struct_exo_car_push_gag_2","targetname");
}

//Function Number: 87
func_52AF(param_00,param_01,param_02,param_03)
{
	lib_A506::func_BC9(param_00,param_01);
	param_00 lib_A506::func_BCD(param_00,"boost_jump_256_across_256_down");
	param_00.var_C41 = param_02 common_scripts\utility::spawn_tag_origin();
	param_00.var_C41 thread lib_A56F::func_C16(param_00,param_03);
}

//Function Number: 88
func_45C2()
{
	thread func_8243();
	thread func_0A73();
	thread func_0A71();
	thread func_0A75();
	thread func_0A77();
	thread func_0A72();
	thread func_0A78();
	thread func_0A79();
}

//Function Number: 89
func_2FFC(param_00)
{
	var_01 = getent("e3_vol_enemy_bus_vol","targetname");
	var_02 = getnode("e3_node_enemy_cover_group_04","targetname");
	var_03 = undefined;
	for(;;)
	{
		while(!isdefined(var_03))
		{
			var_03 = common_scripts\utility::random(param_00);
			wait(0.05);
		}

		var_03 sentient_setthreatbiasgroup("enemies_ignored_by_allies");
		var_03 thread func_9313(18);
		var_03 method_81A5(var_02);
		var_03 thread func_70DB();
		var_03 waittill("death");
	}
}

//Function Number: 90
func_9313(param_00)
{
	self endon("death");
	wait(param_00);
	self sentient_setthreatbiasgroup();
}

//Function Number: 91
func_4516()
{
	lib_A56F::func_A0B9("trigger_drone_street_move_position2");
	var_00 = getnode("e3_node_will_position_2","targetname");
	var_01 = getnode("e3_node_cormack_position_2","targetname");
	var_02 = getnode("e3_node_jackson_position_2","targetname");
	level.var_A31B method_81A5(var_00);
	level.var_21DF method_81A5(var_01);
	level.var_520E method_81A5(var_02);
	common_scripts\utility::flag_wait("snake_swarm_first_flyby_begin");
	var_03 = getnodearray("e3_node_ally_cover_group_02","targetname");
	level notify("end_drone_street_reinforce");
	foreach(var_06, var_05 in level.var_2EC8)
	{
		if(!isdefined(var_05))
		{
			continue;
		}

		if(!isdefined(var_03[var_06]))
		{
			var_05 method_8052();
			continue;
		}

		var_05 method_81A5(var_03[var_06]);
	}
}

//Function Number: 92
func_7803()
{
	lib_A56F::func_A0B9("trigger_land_assist_jump_01");
	level notify("autosave_request");
}

//Function Number: 93
func_2FFF()
{
	var_00 = common_scripts\utility::getstructarray("struct_e3_drop_hack_01","targetname");
	thread func_7803();
	thread func_3D12();
	thread func_3ECA();
	var_01 = common_scripts\utility::getstruct("struct_ally_big_drop_jack","targetname");
	var_02 = common_scripts\utility::getstruct("struct_ally_big_drop_cormack","targetname");
	level waittill("e3_jump_end_scene_end");
	var_03 = lib_A56F::func_4120("struct_land_assist_cormack_01b","targetname");
	level.var_520E func_449F(var_03);
	common_scripts\utility::flag_wait("player_landed_in_hotel");
}

//Function Number: 94
func_7429()
{
	common_scripts\utility::flag_wait("player_landed_in_hotel");
	level.var_31D.var_669B = 0;
}

//Function Number: 95
func_3D12()
{
	var_00 = common_scripts\utility::getstruct("struct_ally_big_drop_cormack","targetname");
	var_01 = common_scripts\utility::getstruct("struct_bottom_of_building_cormack","targetname");
	level.var_21DF waittill("i_have_landed");
	level.var_21DF lib_A56F::func_C3C(level.var_21DF.var_BE6);
	level.var_21DF lib_A56F::func_C3C(level.var_21DF.var_C41);
	waittillframeend;
	level notify("e3_jump_end_scene_end");
	level.var_21DF lib_A59A::func_2A8C();
	level.var_21DF.ignoreall = 1;
	level.var_21DF lib_A59A::func_7EA5("seo_react_to_war_run_npc1");
	level.var_21DF thread func_0C08("struct_building_exit_cormack");
}

//Function Number: 96
func_3ECA()
{
	level.var_A31B waittill("i_have_landed");
	level.var_A31B lib_A56F::func_C3C(level.var_A31B.var_BE6);
	level.var_A31B lib_A56F::func_C3C(level.var_A31B.var_C41);
	waittillframeend;
	level notify("e3_jump_end_scene_end");
	level.var_A31B lib_A59A::func_2A8C();
	level.var_A31B.ignoreall = 1;
	level.var_A31B lib_A59A::func_7EA5("seo_react_to_war_run_npc2");
	level.var_A31B thread func_0C09("struct_building_exit_will");
}

//Function Number: 97
func_4561()
{
	lib_A56F::func_A0B9("start_pod_landings_group_3");
	wait(5);
	var_00 = getentarray("spawner_drone_street_teasers","targetname");
	foreach(var_02 in var_00)
	{
		var_03 = var_02 lib_A59E::func_8971();
		var_03 lib_A5DE::snd_message("seo_single_drones_flyby");
		wait(randomfloatrange(0.05,0.35));
	}
}

//Function Number: 98
func_45E6()
{
	lib_A56F::func_A0B9("trigger_player_on left_street");
	var_00 = function_00D6("axis");
	foreach(var_02 in var_00)
	{
		if(!isdefined(var_02))
		{
			continue;
		}

		if(common_scripts\utility::cointoss())
		{
			var_02 sentient_setthreatbiasgroup("enemies_attack_player");
		}
	}
}

//Function Number: 99
func_80D7()
{
	level waittill("begin_e3_fight");
	lib_A59A::func_1333("allies");
	lib_A59A::func_1333("axis");
	level.var_2FFA = [];
	thread func_4516();
	thread func_45E6();
	level.var_31D notify("enable_player_boost_jump");
	var_00 = getentarray("clip_only_when_boost_off","targetname");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 + (0,0,30000);
	}

	var_04 = getentarray("e3_spawner_enemy_drone_street","targetname");
	var_05 = getentarray("e3_spawner_trench_allies_group_01","targetname");
	var_06 = getnodearray("e3_node_enemy_cover_group_01","targetname");
	var_07 = getnodearray("e3_node_enemy_cover_group_02","targetname");
	var_08 = getentarray("e3_node_enemy_cover_group_03","targetname");
	var_09 = getnodearray("e3_node_ally_cover_group_01","targetname");
	var_0A = getent("e3_vol_enemey_retreat","targetname");
	var_0B = getent("e3_vol_enemey_retreat2","targetname");
	if(level.currentgen)
	{
		thread lib_A50E::func_1C32("snake_charge_initiated",undefined,10,0);
		var_0C = getent("cg_street_spawn_trigger","targetname");
		var_0C waittill("trigger");
		common_scripts\utility::flag_set("player_passed_fob");
	}

	if(level.currentgen && !function_021E("seoul_drone_swarm_one_tr"))
	{
		while(!function_021E("seoul_drone_swarm_one_tr"))
		{
			wait(0.05);
		}
	}

	var_0D = [];
	foreach(var_0F in var_06)
	{
		var_10 = common_scripts\utility::random(var_04);
		var_11 = func_2EC9(var_10,var_0F);
		var_0D[var_0D.size] = var_11;
		if(level.currentgen)
		{
			wait(0.1);
		}
	}

	var_13 = [];
	foreach(var_0F in var_07)
	{
		var_10 = common_scripts\utility::random(var_04);
		var_11 = func_2EC9(var_10,var_0F);
		var_13[var_13.size] = var_11;
		if(level.currentgen)
		{
			wait(0.1);
		}
	}

	level.var_2EC8 = [];
	wait(3);
	if(level.nextgen)
	{
		thread func_88E2(var_09,var_05);
	}

	thread func_2FF8(level.var_2EC8);
	var_0D = common_scripts\utility::array_combine(var_0D,var_13);
	thread func_2FFC(var_0D);
	thread func_5D8E(var_0D);
	lib_A56F::func_A0B9("trigger_drone_street_move_position2");
	var_0D = function_00D6("axis");
	foreach(var_11 in var_0D)
	{
		if(isdefined(var_11))
		{
			var_11 method_81A9(var_0B);
			var_11 thread common_scripts\utility::delaycall(randomfloat(4),::method_8052);
			wait(randomfloat(1));
		}
	}

	var_18 = function_00D6("allies");
	foreach(var_11 in var_18)
	{
		if(isdefined(var_11))
		{
			var_11.var_A = 0;
		}
	}

	level.var_31D waittill("player_in_x4walker");
	foreach(var_11 in var_0D)
	{
		if(isdefined(var_11))
		{
			var_11 method_8052();
		}
	}
}

//Function Number: 100
func_5D8E(param_00)
{
	while(param_00.size > 2)
	{
		param_00 = lib_A59A::func_CFF(param_00);
		wait 0.05;
	}

	lib_A59A::func_70A("trigger_drone_street_move_position2");
}

//Function Number: 101
func_2EC9(param_00,param_01)
{
	var_02 = param_00 lib_A56F::func_72C(1);
	var_02 thread lib_A56F::func_536E();
	var_02 thread func_2FFD();
	var_02 thread func_70DB();
	var_02 thread func_455A();
	var_02 method_81A5(param_01);
	var_02.var_1D3 = 0;
	var_02.var_A = 0.2;
	var_02.var_1C7 = 196;
	var_02.var_136 = 1;
	if(!isdefined(var_02))
	{
		return;
	}

	if(isalive(var_02))
	{
		var_02 lib_A59A::func_2AB0();
	}

	return var_02;
}

//Function Number: 102
func_455A()
{
	self endon("death");
	level endon("player_on_scene");
	for(;;)
	{
		self waittill("damage",var_00,var_01);
		if(var_01 != level.var_31D && isdefined(self))
		{
			self.health = self.health + int(var_00 * 0.75);
			continue;
		}

		if(isdefined(self))
		{
			level thread lib_A59A::func_61FA("player_on_scene",3);
		}
	}
}

//Function Number: 103
func_70DB()
{
	self waittill("death");
	if(isdefined(self))
	{
		self startragdoll();
	}
}

//Function Number: 104
func_88E2(param_00,param_01)
{
	level endon("end_drone_street_reinforce");
	foreach(var_03 in param_00)
	{
		thread func_88E3(var_03,param_01);
	}
}

//Function Number: 105
func_88E3(param_00,param_01)
{
	level endon("end_drone_street_reinforce");
	var_02 = undefined;
	while(!isdefined(var_02))
	{
		var_02 = common_scripts\utility::random(param_01) lib_A59A::func_88BD();
		wait 0.05;
	}

	if(!isdefined(var_02))
	{
		return;
	}

	level.var_2EC8[level.var_2EC8.size] = var_02;
	var_02 method_81A5(param_00);
	var_02.var_98 = 1;
	var_02 lib_A59A::func_2AC1();
	var_02.var_A = 0;
	var_02 thread func_7300(param_00,param_01);
	return var_02;
}

//Function Number: 106
func_7300(param_00,param_01,param_02)
{
	level endon("end_drone_street_reinforce");
	if(isdefined(param_02))
	{
		level endon(param_02);
	}

	var_03 = self;
	for(;;)
	{
		var_03 waittill("death");
		wait(1);
		var_03 = func_88E3(param_00,param_01);
	}
}

//Function Number: 107
func_2FFD()
{
	self endon("death");
	for(;;)
	{
		self waittill("detected");
		level notify("threat_detected");
		level.var_A117.var_91CC[level.var_A117.var_91CC.size] = self;
		if(common_scripts\utility::cointoss())
		{
			badplace_cylinder("temp_detected_badplace",5,self.var_2E6,32,96,"axis");
		}
	}
}

//Function Number: 108
func_2FF8(param_00)
{
	common_scripts\utility::flag_wait("flag_drone_street_strafe");
	level notify("end_drone_strret_fight");
	var_01 = common_scripts\utility::getclosest(level.var_31D.var_2E6,level.var_38E5,3000);
	param_00 = lib_A56F::func_888D(level.var_2EC8,var_01.var_2E6);
	foreach(var_03 in param_00)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		var_04 = common_scripts\utility::getclosest(var_03.var_2E6,level.var_38E5,3000);
		var_05 = var_04.var_2E6;
		var_04 delete();
		var_06 = magicbullet("remote_missile_drone_light",var_05,var_03.var_2E6);
		if(common_scripts\utility::cointoss())
		{
			wait(0.2);
			var_06 = magicbullet("remote_missile_drone_light",var_05,var_03.var_2E6);
		}

		wait(randomfloatrange(1,2));
	}
}

//Function Number: 109
func_2FFE()
{
	self.var_91CC = [];
	while(lib_A56F::func_51FB(self))
	{
		level waittill("threat_detected");
		var_00 = [];
		var_00[0] = "launcher_right";
		var_00[1] = "launcher_left";
		wait(2.5);
		if(!lib_A56F::func_51FB(self))
		{
			continue;
		}

		var_01 = randomintrange(2,4);
		lib_A643::func_37BB(self.var_91CC,var_01);
	}
}

//Function Number: 110
func_463D()
{
	wait 0.05;
	var_00 = common_scripts\utility::spawn_tag_origin();
	var_01 = common_scripts\utility::getstructarray("enemy_fire","targetname");
	lib_A643::func_30C1(-1);
	lib_A643::func_2AA3(0);
	lib_A643::func_2AA3(1);
	lib_A643::func_2AA3(2);
	lib_A643::func_30FD(-1);
	lib_A643::func_2AE2(0);
	lib_A643::func_2AE2(1);
	lib_A643::func_2AE2(2);
	while(!common_scripts\utility::flag("player_in_x4walker"))
	{
		wait(randomintrange(3,8));
		var_02 = common_scripts\utility::random(var_01);
		var_00.var_2E6 = var_02.var_2E6;
		if(lib_A56F::func_51FB(self))
		{
			lib_A643::func_7E37(var_00,-1);
			continue;
		}

		return;
		wait 0.05;
	}

	lib_A643::func_2AA3(-1);
	lib_A643::func_2AE2(-1);
	lib_A643::func_30FD(1);
	lib_A643::func_30FD(2);
	lib_A643::func_30C1(1);
	lib_A643::func_30C1(2);
	thread func_37BA();
	while(lib_A56F::func_51FB(self))
	{
		var_03 = common_scripts\utility::getclosest(self.var_2E6,level.var_38E5);
		lib_A643::func_7E37(var_03,1);
		wait(0.1);
		if(!lib_A56F::func_51FB(self))
		{
			continue;
		}

		var_04 = common_scripts\utility::getclosest(self.var_2E6,level.var_38E5);
		lib_A643::func_7E37(var_04,2);
		while(isdefined(var_03))
		{
			wait 0.05;
		}

		wait 0.05;
	}
}

//Function Number: 111
func_37BA()
{
	level endon("end_cherry_picker");
	self endon("death");
	for(;;)
	{
		wait(randomfloatrange(4,5));
		var_00 = 4;
		var_01 = [];
		for(var_02 = 0;var_02 < var_00;var_02++)
		{
			var_01[var_02] = common_scripts\utility::random(level.var_38E5);
		}

		self.var_5CC0 = var_01.size;
		lib_A643::func_37BB(var_01,1);
		self notify("tank_shot");
	}
}

//Function Number: 112
func_5938()
{
	if(level.currentgen && !issubstr(level.var_9704,"_fob"))
	{
		level waittill("transients_intro_to_fob");
	}

	var_00 = getent("walker_tank_for_stepover","targetname");
	var_00.script_disconnectpaths = 0;
	var_01 = lib_A59E::func_8972("walker_tank_for_stepover");
	var_01 notify("stop_vehicle_shoot_shock");
	var_01.script_disconnectpaths = 0;
	var_01.animname = "walker_tank";
	var_01 lib_A506::func_7F23();
	if(level.currentgen)
	{
	}

	return var_01;
}

//Function Number: 113
func_4617()
{
	var_00 = getent("temp_clip_for_walker_anim_scene","targetname");
	level waittill("stepover_anim_scene_done_character");
	var_00.var_2E6 = var_00.var_2E6 + (0,0,100000);
}

//Function Number: 114
func_0C0B()
{
	if(level.nextgen)
	{
		thread func_4617();
	}

	var_00 = common_scripts\utility::getstruct("struct_walker_walkover_scene","targetname");
	var_01 = func_5938();
	wait(1);
	var_02 = var_00 common_scripts\utility::spawn_tag_origin();
	var_02 thread lib_A506::func_BE1(var_01,"walker_step_idle_1");
	var_01 thread func_463D();
	level.var_A117 = var_01;
	thread func_5939();
	var_01 thread func_2FFE();
	lib_A56F::func_A0B9("trigger_hill_event_00");
	common_scripts\utility::flag_set("dialogue_trench_demo_team");
	level notify("remove_path_blockers_fob");
	level.var_21DF lib_A59A::func_2A8C();
	level.var_A31B lib_A59A::func_2A8C();
	func_A08B();
	level notify("begin_e3_fight");
	common_scripts\utility::flag_wait("dialogue_trench_demo_team");
	level.var_21DF.var_C3E notify("stop_loop");
	level.var_21DF lib_A59A::func_C3D();
	level.var_A31B.var_C3E notify("stop_loop");
	level.var_A31B lib_A59A::func_C3D();
	level.var_A31B.var_C3E thread lib_A506::func_C24(level.var_A31B,"fob_meet_post_exit_2");
	level.var_21DF.var_C3E lib_A506::func_C24(level.var_21DF,"fob_meet_post_exit_1");
	level.var_21DF lib_A59A::func_7E7B(1);
	level.var_A31B lib_A59A::func_7E7B(1);
	var_03 = [level.var_21DF,level.var_A31B];
	var_04 = getnode("node_hill_pause_guy2","targetname");
	level.var_520E method_81A5(var_04);
	var_01 thread lib_A56F::func_C3C(var_02);
	thread func_0729();
	thread func_072B();
	thread func_072A();
	level notify("autosave_request");
	level thread lib_A5CE::func_9381(var_01);
	var_01 lib_A5DE::snd_message("walker_step_over");
	var_01 thread func_4514();
	var_00 lib_A506::func_C24(var_01,"walker_step_over");
	if(isdefined(var_01))
	{
		var_00 thread lib_A506::func_BE1(var_01,"walker_step_idle_2");
	}

	level notify("anim_walker_stepoaver_scene_done");
}

//Function Number: 115
func_4514()
{
	for(var_00 = 0;var_00 < 20;var_00++)
	{
		self.var_31 = 1;
		wait 0.05;
	}
}

//Function Number: 116
func_A08B()
{
	common_scripts\utility::flag_wait_all("flag_will_irons_has_arrived_at_hill","flag_cormack_has_arrived_at_hill");
}

//Function Number: 117
func_072B()
{
	var_00 = common_scripts\utility::getstruct("struct_walker_walkover_scene","targetname");
	var_00 lib_A506::func_C29(level.var_A31B,"walker_step_over");
	level.var_A31B lib_A59A::func_1ED1();
	level.var_A31B lib_A59A::func_7E7B(1);
	level notify("heroes_done_with_walker_anim_scene");
	var_01 = getnode("node_drone_section_will_01","targetname");
	level.var_A31B method_81A5(var_01);
	level.var_A31B.var_180 = 1;
	level.var_A31B lib_A59A::func_7E32("o");
}

//Function Number: 118
func_072A()
{
	level waittill("heroes_done_with_walker_anim_scene");
	var_00 = getnode("node_drone_section_jackson_01","targetname");
	level.var_520E method_81A5(var_00);
	level.var_520E.var_180 = 1;
}

//Function Number: 119
func_0729()
{
	var_00 = common_scripts\utility::getstruct("struct_walker_walkover_scene","targetname");
	var_00 lib_A506::func_C29(level.var_21DF,"walker_step_over");
	level.var_21DF lib_A59A::func_1ED1();
	level.var_21DF lib_A59A::func_7E7B(1);
	var_01 = getnode("node_drone_section_cormack_01","targetname");
	level.var_21DF method_81A5(var_01);
	level.var_21DF.var_180 = 1;
	level notify("stepover_anim_scene_done_character");
}

//Function Number: 120
func_2A9D()
{
	level waittill("begin_land_assist_training");
	level.var_31D thread lib_A561::func_9A66();
	level.var_31D method_848D(0);
	common_scripts\utility::flag_wait("player_landed_in_hotel");
	wait(2);
	level.var_31D thread lib_A561::func_7F62();
	level.var_31D method_848D(1);
}

//Function Number: 121
func_0A73()
{
	level endon("e3_jump_end_scene");
	thread func_1C6C(600,800,"player_landed_in_hotel");
	var_00 = lib_A56F::func_4120("struct_land_assist_first_jump","targetname");
	var_01 = var_00 common_scripts\utility::spawn_tag_origin();
	level waittill("begin_building_traversal");
	lib_A59A::func_706("trigger_start_script_color_will","targetname");
	lib_A59A::func_706("trigger_start_script_color","targetname");
	lib_A56F::func_A0B9("trig_guys_to_first_land_assist");
	lib_A59A::func_6C1D(100);
	thread func_2A9D();
	thread func_3D11();
	lib_A56F::func_A0B9("trig_cormack_trigger_will_first_landassist");
	thread func_3EC9();
	wait(2);
	common_scripts\utility::flag_set("dialogue_hotel_top_floor_landassist");
	level notify("begin_land_assist_training");
	common_scripts\utility::flag_wait("player_landed_in_hotel");
	wait(2);
	func_74CD();
}

//Function Number: 122
func_5F1F()
{
	lib_A56F::func_A0B9("trig_look_down_trigger");
	var_00 = common_scripts\utility::spawn_tag_origin();
	level.var_31D playersetgroundreferenceent(var_00);
	for(var_01 = 0;var_01 < 45;var_01++)
	{
		if(!level.var_31D lib_A564::func_5042())
		{
			var_02 = var_01;
			var_03 = level.var_31D method_8036()[1];
			var_00 rotateto((var_02,var_03,0),0.05);
			lib_A59A::func_5690(var_00.var_2E6,var_00.var_41,0.05);
			wait 0.05;
		}
	}
}

//Function Number: 123
func_75ED(param_00)
{
	var_01 = (0,vectortoangles(param_00.var_2E6 - self.var_2E6)[1],0);
	var_02 = 0.5;
	var_03 = (var_02,var_01[1],0);
	var_04 = transformmove(self.var_2E6,var_03,self.var_2E6,var_01,self.var_2E6,self.var_41);
	return var_04["angles"];
}

//Function Number: 124
func_0A74()
{
	var_00 = lib_A56F::func_4120("struct_land_assist_first_jump","targetname");
	var_01 = var_00 common_scripts\utility::spawn_tag_origin();
	thread func_3D11();
	thread func_3EC9();
	thread func_2A9D();
	wait(2);
	thread func_1C6C(600,800,"player_landed_in_hotel");
	common_scripts\utility::flag_set("dialogue_hotel_top_floor_landassist");
	level notify("begin_land_assist_training");
	common_scripts\utility::flag_wait("player_landed_in_hotel");
	wait(3);
	func_74CD();
}

//Function Number: 125
func_1C6C(param_00,param_01,param_02)
{
	while(!common_scripts\utility::flag(param_02))
	{
		function_00D3("bg_fallDamageMinHeight",param_00);
		function_00D3("bg_fallDamageMaxHeight",param_01);
		wait 0.05;
	}
}

//Function Number: 126
func_74CD()
{
	for(var_00 = 0;var_00 < 30;var_00++)
	{
		function_00D3("bg_fallDamageMinHeight",490);
		function_00D3("bg_fallDamageMaxHeight",640);
		wait 0.05;
	}
}

//Function Number: 127
func_3D11()
{
	level endon("e3_jump_end_scene");
	level notify("cormack_to_first_land_assist");
	level.var_21DF notify("goal");
	level.var_21DF lib_A59A::func_2A73();
	var_00 = lib_A56F::func_4120("struct_land_assist_cormack_01b","targetname");
	var_01 = var_00 common_scripts\utility::spawn_tag_origin();
	var_01 lib_A506::func_BFF(level.var_21DF,"first_landassist_enter");
	var_01 lib_A506::func_C24(level.var_21DF,"first_landassist_enter");
	level.var_21DF.var_BE6 = var_01;
	if(!common_scripts\utility::flag("flag_first_land_assist") || !common_scripts\utility::flag("land_assist_activated") || !common_scripts\utility::flag("begin_looping_fob_functions"))
	{
		var_01 thread lib_A506::func_BE1(level.var_21DF,"first_landassist_idle");
		func_A0A9();
	}

	level notify("e3_trigger_big_jump_hack");
	level.var_21DF thread func_449E(var_01);
	level.var_21DF lib_A59A::func_3099();
}

//Function Number: 128
func_A0A9()
{
	for(;;)
	{
		if(common_scripts\utility::flag("flag_first_land_assist") && common_scripts\utility::flag("land_assist_activated"))
		{
			break;
		}

		if(common_scripts\utility::flag("begin_looping_fob_functions"))
		{
			break;
		}

		if(common_scripts\utility::flag("dialogue_hotel_top_floor_landassist_end"))
		{
			break;
		}

		wait 0.05;
	}
}

//Function Number: 129
func_3EC9()
{
	level endon("e3_jump_end_scene");
	var_00 = lib_A56F::func_4120("struct_land_assist_cormack_01b","targetname");
	var_01 = var_00 common_scripts\utility::spawn_tag_origin();
	var_01 lib_A506::func_BFF(level.var_A31B,"first_landassist_enter");
	var_01 lib_A506::func_C24(level.var_A31B,"first_landassist_enter");
	level.var_A31B.var_BE6 = var_01;
	if(!common_scripts\utility::flag("flag_first_land_assist") || !common_scripts\utility::flag("land_assist_activated") || !common_scripts\utility::flag("begin_looping_fob_functions"))
	{
		var_01 thread lib_A506::func_BE1(level.var_A31B,"first_landassist_idle");
		func_A0A9();
		level.var_A31B lib_A59A::func_C3D();
		level.var_A31B lib_A56F::func_C3C(var_01);
	}

	level.var_A31B func_44A0(var_01);
}

//Function Number: 130
func_449E(param_00)
{
	level endon("exo_breach_impact");
	level endon("exo_breach_begin");
	level endon("e3_jump_end_scene");
	param_00 lib_A506::func_C24(self,"first_landassist_jump_e3");
	self notify("i_have_landed");
	level.var_21DF lib_A59A::func_C3D();
	level.var_21DF lib_A56F::func_C3C(param_00);
}

//Function Number: 131
func_44A0(param_00)
{
	level endon("exo_breach_impact");
	level endon("exo_breach_begin");
	level endon("e3_jump_end_scene");
	param_00 lib_A506::func_C24(self,"first_landassist_jump_e3");
	self notify("i_have_landed");
}

//Function Number: 132
func_449F(param_00)
{
	param_00 lib_A506::func_BFF(self,"first_landassist_jump_e3");
	param_00 lib_A506::func_C24(self,"first_landassist_jump_e3");
	self notify("i_have_landed");
	var_01 = getnode("node_jackson_take_position_building","targetname");
	self method_81A5(var_01);
}

//Function Number: 133
func_52B4(param_00)
{
	while(!common_scripts\utility::flag("flag_second_land_assist_go") && !func_52B3())
	{
		wait 0.05;
	}

	if(isdefined(self.var_C41))
	{
		lib_A56F::func_C3C(self.var_C41);
	}

	self method_81A5(param_00);
}

//Function Number: 134
func_52B5(param_00,param_01)
{
	while(!common_scripts\utility::flag("flag_second_land_assist_go") && !func_52B3())
	{
		wait 0.05;
	}

	param_01 lib_A506::func_BC9(self,param_01.animation);
	self method_81A5(param_00);
}

//Function Number: 135
func_52B3()
{
	if(!isdefined(level.var_92A4))
	{
		level.var_92A4 = common_scripts\utility::spawn_tag_origin();
		function_009A(level.var_92A4);
		function_00A6(level.var_92A4,level.var_31D);
	}

	level.var_92A4.var_2E6 = self.var_2E6 + (0,0,34);
	if(function_009F(level.var_92A4,level.var_31D,65,200))
	{
		return 1;
	}

	return 0;
}

//Function Number: 136
func_93AC(param_00)
{
	param_00 lib_A506::func_BD0(self,param_00.animation);
	self.var_C41 = param_00 common_scripts\utility::spawn_tag_origin();
	self notify("second_land_assist_arrive");
	self.var_C41 thread lib_A506::func_BCC(self,param_00.animation);
	self.var_C41.animation = param_00.animation;
}

//Function Number: 137
func_93AB(param_00)
{
	var_01 = param_00.animation + "_single";
	self.var_C41 = param_00 common_scripts\utility::spawn_tag_origin();
	self.var_C41 lib_A506::func_BD0(self,var_01);
	self notify("second_land_assist_arrive");
	if(!common_scripts\utility::flag("flag_second_land_assist_go"))
	{
		self.var_C41 thread lib_A506::func_BCE(self,param_00.animation);
	}
}

//Function Number: 138
func_4491()
{
	var_00 = level.var_520E;
	var_00.var_C3E = common_scripts\utility::getstruct("struct_guy_explosion_dodge_jump","targetname");
	var_00.var_C40 = lib_A56F::func_4120("struct_bottom_of_building_guy","targetname");
	var_00.var_C3E lib_A506::func_BD0(var_00,var_00.var_C3E.animation);
	var_00.var_C3E func_52AF(var_00,var_00.var_C3E.animation,var_00.var_C40,var_00.var_C40.animation);
}

//Function Number: 139
func_0A71()
{
	lib_A56F::func_A0B9("trigger_building_traverse_exit_start_anim");
	thread lib_A59A::func_383E("dialogue_hotel_exit",4);
	lib_A56F::func_A0B9("trigger_building_exit_allies");
	if(!isdefined(level.var_21DF.var_1880))
	{
		level.var_21DF.var_1880 = 0;
	}

	if(!isdefined(level.var_A31B.var_1880))
	{
		level.var_A31B.var_1880 = 0;
	}

	while(!level.var_21DF.var_1880 || !level.var_A31B.var_1880)
	{
		wait(0.05);
	}
}

//Function Number: 140
func_0C08(param_00)
{
	self.var_1880 = 0;
	level.var_21DF lib_A59A::func_7E7B(1);
	var_01 = common_scripts\utility::getstruct("struct_building_exit_cormack_wait","targetname");
	var_01 lib_A506::func_BFF(self,"seo_react_to_war_run_2_idle");
	if(!common_scripts\utility::flag("begin_fob_combat_vignette"))
	{
		var_01 lib_A506::func_C24(self,"seo_react_to_war_run_2_idle");
		if(!common_scripts\utility::flag("begin_fob_combat_vignette"))
		{
			thread lib_A506::func_BE1(self,"seo_react_to_war_idle");
		}

		common_scripts\utility::flag_wait("begin_fob_combat_vignette");
		self notify("stop_loop");
		lib_A59A::func_C3D();
		lib_A506::func_C29(self,"seo_react_to_war_idle_2_run");
	}

	level.var_31D notify("trigger_allies_to_fob");
}

//Function Number: 141
func_0C09(param_00)
{
	self.var_1880 = 0;
	var_01 = common_scripts\utility::getstruct("struct_building_exit_will_wait","targetname");
	var_01 lib_A506::func_BFF(self,"seo_react_to_war_run_2_idle");
	if(!common_scripts\utility::flag("begin_fob_combat_vignette"))
	{
		var_01 lib_A506::func_C24(self,"seo_react_to_war_run_2_idle");
		if(!common_scripts\utility::flag("begin_fob_combat_vignette"))
		{
			thread lib_A506::func_BE1(self,"seo_react_to_war_idle");
			common_scripts\utility::flag_wait("begin_fob_combat_vignette");
			wait(0.35);
		}

		common_scripts\utility::flag_wait("begin_fob_combat_vignette");
		self notify("stop_loop");
		lib_A59A::func_C3D();
		lib_A506::func_C29(self,"seo_react_to_war_idle_2_run");
	}
}

//Function Number: 142
func_3ECB()
{
	var_00 = common_scripts\utility::getstruct("struct_fob_wait_will_exit","targetname");
	var_00 lib_A506::func_BFF(level.var_A31B,"seo_react_to_war_poseA_in");
	level.var_A31B lib_A59A::func_7E7B(0.85);
	if(!common_scripts\utility::flag("flag_start_fob_meet_scene"))
	{
		var_00 lib_A506::func_C24(level.var_A31B,"seo_react_to_war_poseA_in");
		level.var_A31B thread lib_A506::func_BE1(level.var_A31B,"seo_react_to_war_poseA_idle");
		common_scripts\utility::flag_wait("flag_start_fob_meet_scene");
		wait(0.5);
		level.var_A31B notify("end_loop");
		level.var_A31B lib_A59A::func_C3D();
		level.var_A31B lib_A506::func_C29(level.var_A31B,"seo_react_to_war_poseA_out");
	}

	var_01 = common_scripts\utility::getstruct("will_irons_fobmeetup_idle_org","targetname");
	var_01 lib_A506::func_BFF(level.var_A31B,"fob_meet_will_into");
	var_01 lib_A506::func_C29(level.var_A31B,"fob_meet_will_into");
	level.var_A31B thread lib_A506::func_BE1(level.var_A31B,"seo_react_to_war_idle");
	level waittill("fob_cormack_wave");
}

//Function Number: 143
func_0A75()
{
	lib_A56F::func_A0B9("trigger_vista_scene_end");
	var_00 = common_scripts\utility::getstructarray("struct_fob_talk_scene_cormack","targetname");
	var_01 = var_00[0];
	var_02 = var_01 common_scripts\utility::spawn_tag_origin();
	var_03 = var_01 common_scripts\utility::spawn_tag_origin();
	var_04 = getent("temp_anim_scene_spawner","targetname");
	var_05 = getent("fob_sergeant","targetname");
	level.var_444E = var_05 lib_A56F::func_72C(1);
	level.var_444E.animname = "daniels";
	level.var_444E.var_C41 = var_02;
	level.var_444E lib_A59A::func_27F1();
	wait(0.1);
	level.var_598F = var_04 lib_A56F::func_72C(1);
	level.var_598F lib_A59A::func_445F();
	level.var_598F.animname = "generic";
	var_03 thread lib_A506::func_BE1(level.var_598F,"fob_meet_guy1_idle");
	level.var_444E.var_C41 thread lib_A506::func_BE1(level.var_444E,"fob_meet_guy2_idle");
	level.var_31D waittill("trigger_allies_to_fob");
	func_0A76();
}

//Function Number: 144
func_0A76()
{
	var_00 = common_scripts\utility::getstruct("struct_fob_wait_comack_exit","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_fob_talk_scene_cormack","targetname");
	var_02 = var_01[0];
	var_03 = var_02 common_scripts\utility::spawn_tag_origin();
	var_04 = var_02 common_scripts\utility::spawn_tag_origin();
	var_05 = getnode("node_fob_allies_02a","targetname");
	var_06 = getnode("node_fob_allies_02","targetname");
	level.var_520E.var_1C7 = 256;
	level.var_520E method_81A5(var_05);
	if(level.currentgen)
	{
		var_05 = getnode("node_fob_section_jackson_01","targetname");
		level.var_520E method_81A5(var_05);
	}

	thread func_3ECB();
	var_00 lib_A506::func_BFF(level.var_21DF,"seo_react_to_war_run_2_idle");
	level.var_21DF thread lib_A59A::func_7EA5("seo_react_to_war_run_npc1",0);
	if(!common_scripts\utility::flag("flag_start_fob_meet_scene"))
	{
		var_00 lib_A506::func_C24(level.var_21DF,"seo_react_to_war_run_2_idle");
		level.var_21DF thread lib_A506::func_BE1(level.var_21DF,"seo_react_to_war_idle");
		common_scripts\utility::flag_wait("flag_start_fob_meet_scene");
		level.var_21DF notify("end_loop");
		level.var_21DF lib_A59A::func_C3D();
		level.var_21DF lib_A506::func_C29(level.var_21DF,"seo_react_to_war_idle_2_run");
	}

	common_scripts\utility::flag_wait("flag_start_fob_meet_scene");
	level notify("fob_talk_scene_start");
	level notify("the_fob_scene_is_live");
	level.var_520E method_81A5(var_06);
	var_03 lib_A506::func_BFF(level.var_21DF,"fob_meet_cormack");
	thread func_444F(var_03);
	thread func_21E1(var_03);
}

//Function Number: 145
func_444F(param_00)
{
	level.var_444E lib_A59A::func_C3D();
	level.var_444E lib_A56F::func_C3C(level.var_444E.var_C41);
	param_00 lib_A506::func_C24(level.var_444E,"fob_meet_guy2");
	param_00 thread lib_A506::func_BE1(level.var_444E,"fob_meet_guy2_idle");
	level notify("fob_talk_scene_end");
}

//Function Number: 146
func_7C7E()
{
	wait(15.75);
	level notify("send_will_2secs_early");
}

//Function Number: 147
func_21E1(param_00)
{
	thread func_221E(12);
	thread func_7C7E();
	common_scripts\utility::flag_set("dialogue_start_fob_meetup");
	param_00 lib_A506::func_C29(level.var_21DF,"fob_meet_cormack");
	level notify("walker_step_over_anim_scene");
	level.var_21DF lib_A59A::func_1ED1();
	common_scripts\utility::flag_set("destroy_fob_blocking");
	func_3D13();
}

//Function Number: 148
func_3D13()
{
	level.var_21DF.var_C3E = common_scripts\utility::getstruct("struct_walker_walkover_scene","targetname");
	level.var_21DF lib_A59A::func_7E7B(1.1);
	level.var_21DF.var_C3E lib_A506::func_BFF(level.var_21DF,"fob_meet_post_enter_1");
	level.var_21DF lib_A59A::func_7E7B(1.4);
	level.var_21DF.var_C3E lib_A506::func_C29(level.var_21DF,"fob_meet_post_enter_1");
	common_scripts\utility::flag_set("flag_cormack_has_arrived_at_hill");
	level.var_21DF.var_C3E thread lib_A506::func_BE1(level.var_21DF,"fob_meet_post_idle_1");
	level notify("begin_walker_stepover_anim");
}

//Function Number: 149
func_3ECC()
{
	level.var_A31B lib_A59A::func_1ED1();
	level.var_A31B notify("stop_loop");
	level.var_A31B method_8141();
	level.var_A31B lib_A506::func_C29(level.var_A31B,"seo_react_to_war_idle_2_run");
	level.var_A31B.var_C3E = common_scripts\utility::getstruct("struct_walker_walkover_scene","targetname");
	level.var_A31B lib_A59A::func_7E7B(1.1);
	level.var_A31B.var_C3E lib_A506::func_BFF(level.var_A31B,"fob_meet_post_enter_2");
	level.var_A31B lib_A59A::func_7E7B(1.4);
	level.var_A31B.var_C3E lib_A506::func_C24(level.var_A31B,"fob_meet_post_enter_2");
	common_scripts\utility::flag_set("flag_will_irons_has_arrived_at_hill");
	level.var_A31B.var_C3E thread lib_A506::func_BE1(level.var_A31B,"fob_meet_post_idle_2");
}

//Function Number: 150
func_221E(param_00)
{
	wait(param_00);
	common_scripts\utility::flag_set("fob_animation_complete");
}

//Function Number: 151
func_0A77()
{
	level waittill("fob_cormack_wave");
	thread func_3ECC();
	wait(1.5);
	var_00 = getnode("node_hill_pause_guy","targetname");
	level.var_520E method_81A5(var_00);
	level.var_520E lib_A59A::func_1ED1();
	level waittill("fob_talk_scene_end");
}

//Function Number: 152
func_0A72()
{
	level waittill("anim_walker_stepoaver_scene_done");
	var_00 = getnode("node_drone_section_guy_01","targetname");
	level.var_520E method_81A5(var_00);
	lib_A56F::func_A0B9("trigger_drone_swarm_flank");
}

//Function Number: 153
func_0A78()
{
	level waittill("end_cherry_picker");
	if(isdefined(level.var_5D21))
	{
		level.var_5D21 lib_A59A::func_32DF("player_in_transition");
	}

	wait(1);
	thread func_52BD();
	thread func_52BE();
	var_00 = common_scripts\utility::getstructarray("struct_start_truck_push_01","targetname");
	level.var_21DF lib_A56F::func_C3C();
	level.var_520E lib_A56F::func_C3C();
	level.var_A31B lib_A56F::func_C3C();
	level.var_A31B method_81C6(var_00[0].var_2E6,var_00[0].var_41);
	level.var_21DF method_81C6(var_00[1].var_2E6,var_00[1].var_41);
	level.var_520E method_81C6(var_00[2].var_2E6,var_00[2].var_41);
	wait(0.1);
	var_01 = getnode("node_jump_train_cormack","targetname");
	level.var_21DF.var_1C7 = 32;
	level.var_21DF method_81A5(var_01);
	var_02 = getnode("node_jump_train_will","targetname");
	level.var_A31B.var_1C7 = 32;
	level.var_A31B method_81A5(var_02);
	level.var_A31B func_7333(1);
	var_03 = getnode("node_jump_train_jackson","targetname");
	level.var_520E.var_1C7 = 32;
	level.var_520E method_81A5(var_03);
	var_04 = getentarray("trigger_jump_training_done","targetname");
	var_04[0] waittill("trigger");
	level notify("jump_training_done");
}

//Function Number: 154
func_52BE()
{
	var_00 = getent("vol_jump_training_vo_01","targetname");
	thread func_5DAF();
	while(!level.var_21DF istouching(var_00))
	{
		wait 0.05;
	}

	common_scripts\utility::flag_set("vo_jump_training_start");
}

//Function Number: 155
func_5DAF()
{
	lib_A56F::func_A0B9("trigger_jump_training_done");
	common_scripts\utility::flag_set("jump_training_ended");
	level notify("jump_training_end");
}

//Function Number: 156
func_52BD()
{
	var_00 = getent("vol_jump_training_drone_street","targetname");
	thread lib_A56F::func_97FD("trigger_jump_training_done","trigger_jump_training_done_flag");
	while(!common_scripts\utility::flag("trigger_jump_training_done_flag"))
	{
		if(level.var_31D istouching(var_00))
		{
			lib_A59A::func_2B49("jump_training");
			while(level.var_31D istouching(var_00))
			{
				wait 0.05;
			}
		}

		wait 0.05;
	}
}

//Function Number: 157
func_3C94(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = func_8933("player_rig",param_00.var_2E6);
	var_08 hide();
	lib_A571::func_825E(1);
	var_09 = 0.4;
	if(isdefined(param_02))
	{
		var_09 = 0;
	}

	param_00 thread lib_A506::func_BC7(var_08,param_01);
	if(!isdefined(param_03) || !param_03)
	{
		self playerlinktoblend(var_08,"tag_player",var_09);
	}
	else
	{
		self playerlinktodelta(var_08,"tag_player",0.5,param_04,param_05,param_06,param_07,1,1);
	}

	wait(var_09);
	var_08 show();
	return var_08;
}

//Function Number: 158
func_74B5()
{
	var_00 = self;
	level.var_31D unlink();
	var_01 = 0.4;
	level.var_31D playerlinktoblend(self,"tag_player",var_01);
}

//Function Number: 159
func_7309(param_00,param_01,param_02,param_03)
{
	var_04 = self;
	level.var_31D unlink();
	level.var_31D playerlinktodelta(self,"tag_player",0.5,param_00,param_01,param_02,param_03,1,1);
}

//Function Number: 160
func_3C95(param_00,param_01)
{
	var_02 = func_8933("player_rig",level.var_31D.var_2E6 + (0,0,-42));
	var_02.var_41 = (0,0,0);
	var_02 hide();
	self freezecontrols(1);
	lib_A571::func_825E(1);
	var_03 = 0.4;
	param_00 thread lib_A506::func_BC7(var_02,param_01);
	self playerlinktoblend(var_02,"tag_player",var_03);
	wait(var_03);
	var_02 show();
	return var_02;
}

//Function Number: 161
func_3C93(param_00,param_01)
{
	var_02 = func_8933("player_arms",param_00.var_2E6);
	var_02 hide();
	self freezecontrols(1);
	lib_A571::func_825E(1);
	var_03 = 0.4;
	param_00 thread lib_A506::func_BC7(var_02,param_01);
	self playerlinktoblend(var_02,"tag_player",var_03);
	wait(var_03);
	var_02 show();
	return var_02;
}

//Function Number: 162
func_3CA0(param_00)
{
	level.var_31D unlink();
	param_00 delete();
	level.var_31D lib_A571::func_825D();
	level.var_31D freezecontrols(0);
}

//Function Number: 163
func_0A79()
{
	level.var_A31B waittill("ready_to_rally",var_00);
	lib_A59A::func_383E("dialogue_performing_arts_entrance_2",3);
	var_00 lib_A506::func_C24(level.var_A31B,"rally_up_enter");
	var_01 = ["rally_up_idle_a","rally_up_idle_b","rally_up_idle_c"];
	while(!common_scripts\utility::flag("corner_rally_begin"))
	{
		var_02 = common_scripts\utility::random(var_01);
		var_00 lib_A506::func_C24(level.var_A31B,var_02);
	}

	level.var_A31B lib_A56F::func_C3C(var_00);
	var_00 lib_A506::func_C24(level.var_A31B,"rally_up_exit");
}

//Function Number: 164
func_459A()
{
	thread func_45D8();
	lib_A56F::func_A0B9("trigger_setup_guide_kill");
	level notify("vo_keep_moving");
	lib_A56F::func_A0B9("trig_convention_center_combat_03");
	level notify("vo_keep_moving");
	lib_A56F::func_A0B9("trig_convention_center_combat_06");
	level notify("vo_keep_moving");
}

//Function Number: 165
func_45D8()
{
	level waittill("never");
	level waittill("end_cherry_picker");
	lib_A56F::func_A0B9("trigger_seoul_video_log");
	common_scripts\utility::flag_set("dialogue_performing_arts_entrance_2");
	func_6F0A("seoul_videolog");
	func_69B3();
	wait(0.15);
	maps\seoul::func_4C68();
}

//Function Number: 166
func_8933(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = "player_rig";
	}

	if(!isdefined(param_01))
	{
		param_01 = level.var_31D.var_2E6;
	}

	var_02 = lib_A59A::func_88CB(param_00);
	return var_02;
}

//Function Number: 167
func_8243()
{
	level waittill("droppod_empty");
	thread func_897C();
	level notify("vista_warbird_spot_allies");
	common_scripts\utility::flag_wait("vista_warbird_gag_done");
}

//Function Number: 168
func_897C()
{
	level waittill("vista_warbird_spot_allies");
	var_00 = lib_A59E::func_8973("vehicle_vista_ally_warbird_spotlight");
	if(level.currentgen)
	{
		var_00 thread maps\seoul::func_92C3("east_view");
	}

	thread lib_A5CE::func_9E8F(var_00);
	var_00 lib_A5DE::snd_message("hotel_razorback_fly_by");
	var_00 veh_setspeed(15,5,15);
	wait(8.5);
	level notify("spotlight_switch");
}

//Function Number: 169
func_8247()
{
	thread func_1E88();
	thread func_4638();
	lib_A56F::func_A0B9("trigger_start_vista_vehicle_flyby");
	if(level.currentgen)
	{
		if(!function_021E("seoul_fob_tr"))
		{
			level waittill("transients_intro_to_fob");
		}
	}

	thread func_4637();
	thread func_4639();
	thread func_4634();
	thread func_4636();
}

//Function Number: 170
func_4636()
{
	var_00 = getentarray("vehicle_outrun_missiles_missile","targetname");
	var_01 = getent("vehicle_outrun_missiles_jet","targetname");
	wait(8);
	var_02 = lib_A59E::func_8973("vehicle_outrun_missiles_jet");
	foreach(var_04 in var_00)
	{
		var_05 = var_04 lib_A59E::func_8971();
		var_05 thread func_59DB(var_02);
		wait(0.25);
	}
}

//Function Number: 171
func_59DB(param_00)
{
	self endon("death");
	param_00 endon("death");
	for(;;)
	{
		var_01 = param_00.speed * randomfloatrange(0.85,1.1);
		if(var_01 <= 0)
		{
			var_01 = 1;
		}

		self veh_setspeed(var_01,50,90);
		wait(1);
	}
}

//Function Number: 172
func_4638()
{
	level waittill("pod_deform");
	if(level.currentgen && !issubstr(level.var_9704,"fob"))
	{
		level waittill("transients_intro_to_fob");
	}

	var_00 = lib_A59E::func_8977("vehicle_vista_warbird_flyby_00");
	var_01 = lib_A59E::func_8977("vehcile_vista_tank_01");
	foreach(var_03 in var_01)
	{
		thread func_2829();
		if(level.currentgen)
		{
			thread maps\seoul_transients_cg::func_1C22(var_03,"pre_transients_drone_seq_one_to_trusk_push");
		}
	}

	if(level.currentgen)
	{
		foreach(var_06 in var_00)
		{
			thread maps\seoul_transients_cg::func_1C22(var_06,"pre_transients_drone_seq_one_to_trusk_push");
		}
	}
}

//Function Number: 173
func_2829()
{
	self waittill("reached_end_node");
	self delete();
}

//Function Number: 174
func_4634()
{
	thread func_9E87();
	wait(10);
	var_00 = getentarray("vehicle_vista_jet_02","targetname");
	level.var_9E86 = [];
	thread func_451F();
	if(var_00.size > 0)
	{
		while(!common_scripts\utility::flag("flag_first_land_assist"))
		{
			foreach(var_02 in var_00)
			{
				var_03 = undefined;
				if(level.nextgen)
				{
					var_03 = 12;
				}
				else
				{
					var_03 = 6;
				}

				if(func_7749() && level.var_9E86.size < var_03 && lib_A56F::func_67C3(75))
				{
					var_04 = var_02 lib_A59E::func_8971();
					var_04 lib_A5DE::snd_message("aud_handle_vista_jets");
					if(isdefined(var_04))
					{
						level.var_9E86[level.var_9E86.size] = var_04;
					}
					else
					{
						continue;
					}

					var_04 veh_setspeed(randomintrange(400,650),200,900);
					wait(randomfloatrange(0.5,3));
					continue;
				}

				wait(randomfloatrange(3,6));
				level.var_9E86 = common_scripts\utility::array_removeundefined(level.var_9E86);
			}
		}
	}
}

//Function Number: 175
func_7749()
{
	var_00 = lib_A59A::func_4150();
	if(var_00.size < 18)
	{
		return 1;
	}

	return 0;
}

//Function Number: 176
func_9E87()
{
	wait(30);
	var_00 = getentarray("vehicle_vista_jet_02","targetname");
	wait(3);
	var_01 = getent("main_street_reflection","targetname");
	var_00 = getentarray("vehicle_vista_jet_01","targetname");
	foreach(var_03 in var_00)
	{
		wait(randomfloatrange(0.5,2));
	}
}

//Function Number: 177
func_451F()
{
	var_00 = common_scripts\utility::getstructarray("struct_vista1_bomb_01","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_vista1_bomb_02","targetname");
	var_02 = common_scripts\utility::getstructarray("struct_vista1_bomb_03","targetname");
	var_03 = common_scripts\utility::getstructarray("struct_vista1_bomb_04","targetname");
	var_04 = common_scripts\utility::getstructarray("struct_vista1_bomb_05","targetname");
	var_05[0] = sortbydistance(var_00,level.var_31D.var_2E6);
	var_05[1] = sortbydistance(var_01,level.var_31D.var_2E6);
	var_05[2] = sortbydistance(var_02,level.var_31D.var_2E6);
	var_05[3] = sortbydistance(var_03,level.var_31D.var_2E6);
	var_05[4] = sortbydistance(var_04,level.var_31D.var_2E6);
	for(;;)
	{
		var_06 = common_scripts\utility::flag_wait_any_return("vista_bomber_trigger_01","vista_bomber_trigger_02","vista_bomber_trigger_03");
		common_scripts\utility::flag_clear(var_06);
		var_07 = common_scripts\utility::random(var_05);
		foreach(var_09 in var_07)
		{
			if(common_scripts\utility::cointoss())
			{
				playfx(common_scripts\utility::getfx("ambient_explosion_fireball"),var_09.var_2E6);
				lib_A5DE::snd_message("seo_vista_bombing_run",var_09.var_2E6);
			}

			wait 0.05;
		}

		wait 0.05;
	}
}

//Function Number: 178
func_4639()
{
	if(level.nextgen)
	{
		var_00 = getent("vista_reflection_02","targetname");
	}
	else
	{
		var_00 = getent("main_street_reflection","targetname");
	}

	var_01 = getentarray("vehicle_vista_ally_warbird_01","targetname");
	var_02 = getentarray("vehicle_vista_warbird_flyby","targetname");
	var_01 = common_scripts\utility::array_combine(var_01,var_02);
	common_scripts\utility::array_thread(var_01,::func_897A);
}

//Function Number: 179
func_897A()
{
	if(level.currentgen)
	{
		level endon(maps\seoul::func_92C5("east_view"));
	}

	wait(randomfloat(3.5));
	var_00 = thread lib_A59E::func_8971();
	level.var_9E85[level.var_9E85.size] = var_00;
	if(level.currentgen)
	{
		var_00 thread maps\seoul::func_92C3("east_view");
	}

	if(level.nextgen)
	{
		var_01 = getent("vista_reflection_02","targetname");
	}
	else
	{
		var_01 = getent("main_street_reflection","targetname");
	}

	foreach(level.var_9E84 in level.var_9E85)
	{
		level.var_9E84 method_83AB(var_01.var_2E6);
	}
}

//Function Number: 180
func_4637()
{
	var_00 = getentarray("droppod_exterior_vista_01","targetname");
	foreach(var_02 in var_00)
	{
		wait(randomfloatrange(1,2));
		var_03 = lib_A59A::func_88CB("npc_droppod");
		var_02 thread lib_A506::func_C24(var_03,"pod_landing");
	}

	level waittill("never");
	var_05 = getentarray("model_droppod_exterior_vista_crashers","targetname");
	thread func_4635(var_00);
	thread func_4633(var_05);
	level.var_9E85 = common_scripts\utility::array_combine(level.var_9E85,var_00);
	level.var_9E85 = common_scripts\utility::array_combine(level.var_9E85,var_05);
}

//Function Number: 181
func_4635(param_00)
{
	foreach(var_02 in param_00)
	{
		wait(randomfloat(2));
		var_02 thread func_54A1(1);
	}
}

//Function Number: 182
func_4633(param_00)
{
	foreach(var_02 in param_00)
	{
		wait(randomfloat(2));
		var_02 thread func_54A0();
	}
}

//Function Number: 183
func_1E88()
{
	lib_A56F::func_A0B9("start_pod_landings");
	level notify("end_vista_view");
	common_scripts\utility::array_thread(level.var_9E85,::lib_A56F::func_2800);
}

//Function Number: 184
func_9269()
{
	lib_A56F::func_A0B9("trigger_fob_scene");
	if(!common_scripts\utility::flag("hault_column"))
	{
		common_scripts\utility::flag_set("hault_column");
	}
}

//Function Number: 185
func_532D(param_00)
{
	lib_A56F::func_A0B9(param_00);
	lib_A56F::func_2800();
}

//Function Number: 186
func_8047()
{
	common_scripts\utility::flag_wait("player_passed_fob");
}

//Function Number: 187
func_45D3()
{
	var_00 = getent("brush_fob_path_blocker_trench","targetname");
	var_01 = getent("brush_blocker_fob_droppod_landing_guys","targetname");
	lib_A56F::func_A0B9("trigger_fob_scene");
	var_01.var_2E6 = var_01.var_2E6 + (0,0,10000);
	var_01 connectpaths();
	level waittill("remove_path_blockers_fob");
	var_00.var_2E6 = var_00.var_2E6 + (0,0,1000);
	var_00 connectpaths();
}

//Function Number: 188
func_457E()
{
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	var_00 = getentarray("spawner_ambient_fob_group_01","targetname");
	var_01 = getnodearray("delete_me_node_array","targetname");
	if(level.nextgen)
	{
		var_02 = 4;
	}
	else
	{
		var_02 = 3;
	}

	for(var_03 = 0;var_03 < var_02;var_03++)
	{
		var_04 = common_scripts\utility::random(var_00) lib_A56F::func_72C();
		if(!isdefined(var_04))
		{
			continue;
		}

		var_05 = common_scripts\utility::random(var_01);
		var_04.var_1C7 = 32;
		var_04.ignoreall = 1;
		var_04 method_81A6(var_05.var_2E6);
		var_04 thread func_281B();
		wait(1);
	}
}

//Function Number: 189
func_457F()
{
	lib_A56F::func_A0B9("hault_column");
	var_00 = getentarray("spawner_ambient_fob_group_01","targetname");
	var_01 = getnodearray("delete_me_node_array","targetname");
	var_02 = 6;
	for(var_03 = 0;var_03 < var_02;var_03++)
	{
		var_04 = common_scripts\utility::random(var_00) lib_A56F::func_72C();
		if(!isdefined(var_04))
		{
			continue;
		}

		var_05 = common_scripts\utility::random(var_01);
		var_04.var_1C7 = 32;
		var_04.ignoreall = 1;
		var_04 method_81A6(var_05.var_2E6);
		var_04 thread func_281B();
		wait(randomfloatrange(0.5,1.75));
	}
}

//Function Number: 190
func_45B3()
{
	thread lib_A56F::func_97FD("trigger_end_looping_anims","end_lobby_loopers");
	lib_A56F::func_A0B9("trigger_vista_scene_end");
	thread func_8903();
	thread func_8AA9();
}

//Function Number: 191
func_8903()
{
	var_00 = getent("spawner_lobby_loopers","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_lobby_looper_01","targetname");
	var_02 = getnode("node_spawner_lobby_loopers","targetname");
	if(level.currentgen)
	{
		if(!function_021E("seoul_fob_tr"))
		{
			level waittill("transients_intro_to_fob");
		}
	}

	while(!common_scripts\utility::flag("end_lobby_loopers"))
	{
		if(level.nextgen)
		{
			var_03 = randomint(3);
		}
		else
		{
			var_03 = 1;
		}

		for(var_04 = 0;var_04 < var_03;var_04++)
		{
			if(common_scripts\utility::flag("end_lobby_loopers"))
			{
				return;
			}

			var_05 = var_00 lib_A56F::func_72C(1);
			if(level.currentgen)
			{
				wait(0.05);
				var_06 = getnode("lobby_looper_tele","targetname");
				var_05 method_81C5(var_06.var_2E6,var_06.var_41);
			}

			var_07 = common_scripts\utility::random(var_01);
			var_05 thread func_6892(var_07,var_07.animation,var_02);
			var_05.var_31 = 1;
			wait(randomfloat(2));
		}

		if(level.nextgen)
		{
			wait(2);
			continue;
		}

		wait(randomfloatrange(6,10));
	}
}

//Function Number: 192
func_8AA9()
{
	var_00 = getentarray("vehicle_spawner_lobby_loopers","targetname");
	while(!common_scripts\utility::flag("end_lobby_loopers"))
	{
		var_01 = common_scripts\utility::random(var_00);
		var_02 = var_01 lib_A59E::func_8971();
		var_02 thread func_2829();
		if(level.nextgen)
		{
			wait(randomfloatrange(3,8));
			continue;
		}

		wait(randomfloatrange(10,15));
	}
}

//Function Number: 193
func_6892(param_00,param_01,param_02)
{
	self endon("death");
	param_00 lib_A506::func_BD0(self,param_01);
	if(function_0294(self))
	{
		return;
	}

	if(!isdefined(self))
	{
		return;
	}

	param_00 lib_A506::func_BC9(self,param_01);
	if(!isdefined(self))
	{
		return;
	}

	self method_81A6(param_02.var_2E6);
	self.var_1C7 = 32;
	self waittill("goal");
	self delete();
}

//Function Number: 194
func_457D()
{
	thread func_45B3();
	thread func_9269();
	thread func_82B5();
	thread func_814A();
	thread func_4582();
	thread func_8047();
	thread func_45D3();
	thread func_0C0B();
	thread func_457E();
	if(level.nextgen)
	{
		thread func_457F();
	}

	lib_A56F::func_A0B9("trigger_opening_view_off_01");
	lib_A56F::func_A0B9("trigger_opening_view_off_02");
	lib_A56F::func_7368("building_01");
	var_00 = getentarray("vehicle_ally_openning_ambient","targetname");
	common_scripts\utility::array_call(var_00,::lib_A56F::func_2800);
	common_scripts\utility::flag_set("opening_view_off");
	lib_A56F::func_A0B9("trigger_opening_view_off_02");
	lib_A56F::func_A0B9("trigger_opening_view_off_01");
	common_scripts\utility::flag_clear("opening_view_off");
}

//Function Number: 195
func_4582()
{
	lib_A56F::func_A0B9("start_pod_landings");
}

//Function Number: 196
func_814A()
{
	level.var_3951 = [];
	thread func_4E32();
}

//Function Number: 197
func_4E33()
{
	var_00 = getent("ally_spawner_fob_injured","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_fob_injured_soldier_maindoor","targetname");
	foreach(var_03 in var_01)
	{
		var_00.var_4B76 = level.var_78A9["generic"][var_03.animation][0];
		var_04 = var_00 lib_A59A::func_2F28();
		var_04 lib_A59A::func_C3D();
		var_03 thread lib_A506::func_BCE(var_04,var_03.animation);
		var_04 lib_A59A::func_445F();
		wait(0.05);
	}
}

//Function Number: 198
func_4E32()
{
	var_00 = getent("ally_spawner_fob_injured_by_base","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_fob_injured_soldier_base","targetname");
	foreach(var_03 in var_01)
	{
		var_00.var_4B76 = level.var_78A9["generic"][var_03.animation][0];
		var_04 = var_00 lib_A59A::func_2F28();
		var_04 lib_A59A::func_C3D();
		var_04 lib_A59A::func_445F();
		var_03 thread lib_A506::func_BCE(var_04,var_03.animation);
		wait(0.05);
	}
}

//Function Number: 199
func_4E34()
{
	level endon("the_fob_scene_is_live");
	for(;;)
	{
		func_4FF7(level.var_31D,self,400);
		common_scripts\utility::flag_set("soldier_injured_dialogue");
	}
}

//Function Number: 200
func_4FF7(param_00,param_01,param_02)
{
	for(;;)
	{
		if(distance2d(param_00.var_2E6,param_01.var_2E6) < param_02)
		{
			return;
		}

		wait(0.05);
	}
}

//Function Number: 201
func_82B5()
{
	var_00 = getentarray("enemy_tanks_group_01","targetname");
	var_01 = common_scripts\utility::getstruct("struct_missile_fire_point_test","targetname");
	var_02 = getentarray("missile_test","targetname");
	var_03 = getentarray("missile_test_02","targetname");
	for(;;)
	{
		while(common_scripts\utility::flag("opening_view_off"))
		{
			wait(0.05);
		}

		wait(randomfloatrange(6,12));
		var_04 = common_scripts\utility::array_randomize(var_02);
		var_05 = randomint(var_04.size);
		for(var_06 = 0;var_06 < var_05;var_06++)
		{
			if(!func_7749())
			{
				wait 0.05;
				continue;
			}

			var_07 = var_04[var_06] lib_A59E::func_8971();
			var_07 lib_A5DE::snd_message("sidewinder_missile");
			var_07 veh_setspeed(100,50,100);
			var_07 thread func_855A();
			wait(0.175);
		}
	}
}

//Function Number: 202
func_855A()
{
	self waittill("reached_end_node");
	wait(3);
	playfxontag(common_scripts\utility::getfx("aa_explosion_runner_single"),self,"tag_origin");
	self hide();
	common_scripts\utility::flag_set("kill_rocket_scene_guy");
	wait(1);
	self delete();
}

//Function Number: 203
func_5C8F()
{
	self waittill("reached_end_node");
	self delete();
}

//Function Number: 204
func_45CD()
{
	level endon("end_PAC_combat");
	var_00 = getentarray("vol_pac_laser_on_vol","targetname");
	for(;;)
	{
		foreach(var_02 in var_00)
		{
			var_03 = function_00D6("axis");
			foreach(var_05 in var_03)
			{
				if(isdefined(var_05.var_3999))
				{
					continue;
				}

				if(var_05 istouching(var_02))
				{
					var_05 thread func_5DB3(var_02);
				}
			}
		}

		wait(0.5);
	}
}

//Function Number: 205
func_5DB3(param_00)
{
	self endon("death");
	level endon("missionfailed");
	level endon("end_PAC_combat");
	for(;;)
	{
		self method_80B2("lag_snipper_laser");
		while(self istouching(param_00))
		{
			wait 0.05;
		}

		self method_80B3();
		while(!self istouching(param_00))
		{
			wait 0.05;
		}
	}
}

//Function Number: 206
func_4620()
{
	var_00 = getent("glass_gate_pac_01","targetname");
	var_00 delete();
	lib_A56F::func_A0B9("trig_player_in_air_building_jump");
	var_01 = getnodearray("node_fucker_node_in_pac","targetname");
	if(!isdefined(level.var_6641) || level.var_6641.size == 0)
	{
		return;
	}

	level.var_6641 = lib_A59A::func_CFF(level.var_6641);
	foreach(var_04, var_03 in level.var_6641)
	{
		if(isdefined(var_03))
		{
			if(isdefined(var_01[var_04]))
			{
				var_03 method_81A5(var_01[var_04]);
				var_03.var_A = 0.9;
				continue;
			}

			var_03 delete();
		}
	}
}

//Function Number: 207
func_45CF()
{
	thread lib_A56F::func_97FD("trig_player_in_air_building_jump","player_jumped_building_traverse");
	var_00 = getentarray("pac_retraversal_fail","targetname");
	foreach(var_02 in var_00)
	{
		var_02.var_7E88 = var_02.var_2E6;
		var_02.var_2E6 = var_02.var_2E6 + (0,0,100000);
	}

	common_scripts\utility::flag_wait("player_jumped_building_traverse");
	common_scripts\utility::flag_wait("player_starting_sinkhole");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_7E88;
	}
}

//Function Number: 208
func_45C9()
{
	thread func_5F0D("trig_convention_center_combat_05");
	thread func_5F0D("trig_convention_center_combat_04");
}

//Function Number: 209
func_5F0D(param_00)
{
	var_01 = getent(param_00,"targetname");
	var_02 = param_00 + "_c";
	var_03 = getent(var_02,"targetname");
	var_04 = getent(var_01.target,"targetname");
	var_01 waittill("trigger");
	for(;;)
	{
		var_05 = var_04 lib_A59A::func_3CB6("axis");
		if(var_05.size <= 1 || level.var_31D istouching(var_04))
		{
			var_03 notify("trigger");
			break;
		}

		wait 0.05;
	}
}

//Function Number: 210
func_45CC()
{
	thread func_4620();
	thread func_45CE();
	thread func_45CF();
	thread func_45CA();
	thread func_45D1();
	thread func_45D0();
	thread func_45C9();
	thread func_0C0A();
	thread func_45CD();
	lib_A56F::func_A0B9("trig_convention_center_setup");
	level notify("stop_group_spawning");
	lib_A59A::func_1143();
}

//Function Number: 211
func_45CB()
{
	lib_A56F::func_A0B9("trigger_weapons_platform_takeoff_hotel");
	if(level.currentgen)
	{
		var_00 = ["cg_pac_into_spawner"];
		thread lib_A50E::func_1C32("dialogue_performing_arts_exit",var_00,15,0);
	}

	var_01 = getent("spawner_hotel_enemies_patrollers","targetname");
	var_02 = common_scripts\utility::getstructarray("struct_hotel_patrollers_01","targetname");
	var_03 = common_scripts\utility::getstructarray("struct_hotel_patrollers_02","targetname");
	var_04 = [];
	foreach(var_06 in var_03)
	{
		var_07 = var_01 lib_A56F::func_72C(1);
		var_07.var_C3E = var_06;
		var_06 thread lib_A506::func_BCE(var_07,var_06.animation);
		var_07 thread func_4A46();
		var_07 thread func_442C("wake_PAC_patrollers");
		var_07.var_1D3 = 0;
		var_04[var_04.size] = var_07;
	}

	foreach(var_06 in var_02)
	{
		var_07 = var_01 lib_A56F::func_72C(1);
		var_07 method_81C6(var_06.var_2E6,var_06.var_41);
		var_07.target = var_06.target;
		var_07 thread lib_A55C::func_399C(undefined,0,1);
		var_07 thread func_4A46();
		var_07 thread func_442C("wake_PAC_patrollers");
		var_07.var_1D3 = 0;
		var_04[var_04.size] = var_07;
	}

	var_0B = getent("vol_hotel_zipline_defend_02","script_noteworthy");
	for(var_0C = 0;var_0C < 6;var_0C++)
	{
		var_07 = var_01 lib_A56F::func_72C(1);
		var_07 method_81A9(var_0B);
		var_07 thread func_6640();
		var_07.var_1D3 = 0;
	}

	level waittill("wake_PAC_patrollers");
	var_0D = getent("clip_pac_entrance_01","targetname");
	var_0D.var_2E6 = var_0D.var_2E6 + (0,0,10000);
	foreach(var_07 in var_04)
	{
		if(!isdefined(var_07))
		{
			return;
		}

		var_07 notify("end_patrol");
		var_07 notify("enemy");
		if(isdefined(var_07.var_C3E))
		{
			var_07.var_C3E notify("stop_loop");
			var_07 lib_A56F::func_C3C();
		}

		var_07 lib_A56F::func_311E();
	}
}

//Function Number: 212
func_6640()
{
	self endon("death");
	level waittill("wake_PAC_patrollers");
	self notify("enemy");
	self notify("end_patrol");
}

//Function Number: 213
func_442C(param_00)
{
	common_scripts\utility::waittill_any("enemy","end_patrol","damage");
	level notify(param_00);
	var_01 = getent("vol_pac_entrance_fallback","targetname");
	if(common_scripts\utility::cointoss())
	{
		self method_81A9(var_01);
	}
}

//Function Number: 214
func_4A46()
{
}

//Function Number: 215
func_4210()
{
	var_00 = getglass("glass_building_jump");
	while(!isglassdestroyed(var_00))
	{
		level waittill("cormack_shot_glass");
		if(!isglassdestroyed(var_00))
		{
			level.var_21DF method_81E7();
			destroyglass(var_00);
		}
	}
}

//Function Number: 216
func_45C7()
{
	var_00 = getentarray("pac_jerk_skip","targetname");
	common_scripts\utility::flag_wait("dialogue_building_jump");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 + (0,0,90000);
	}
}

//Function Number: 217
func_0C0A()
{
	level notify("end_anim_scene_building_jump");
	level endon("end_anim_scene_building_jump");
	thread func_4210();
	thread lib_A56F::func_97FD("trig_player_in_air_building_jump","player_building_jump");
	thread func_45C7();
	lib_A56F::func_A0B9("trig_convention_center_combat_06");
	var_00 = getnode("node_building_jump_prep_will","targetname");
	var_01 = getnode("node_building_jump_prep_cormack","targetname");
	level.var_A31B method_81A5(var_00);
	level.var_21DF method_81A5(var_01);
	level notify("autosave_request");
	level notify("end_PAC_combat");
	wait(0.2);
	var_00 = getnode("node_building_jump_prep_will","targetname");
	var_01 = getnode("node_building_jump_prep_cormack","targetname");
	level.var_A31B method_81A5(var_00);
	level.var_21DF method_81A5(var_01);
	lib_A56F::func_A0B9("trigger_building_jump1");
	level notify("autosave_request");
	func_52B7();
}

//Function Number: 218
func_5DE3()
{
	common_scripts\utility::flag_wait("player_leaving_squad");
	if(common_scripts\utility::flag("player_leaving_squad") & !isdefined(level.var_21DF.var_1884))
	{
		func_52B7(1);
	}
}

//Function Number: 219
func_52B7(param_00)
{
	var_01 = common_scripts\utility::getstruct("struct_building_jump1_cormack","targetname");
	var_02 = common_scripts\utility::getstruct("struct_building_jump1_will","targetname");
	common_scripts\utility::flag_set("dialogue_performing_arts_exit");
	level.var_21DF lib_A59A::func_3099();
	var_03 = getent("vol_test_for_will_and_cormack","targetname");
	if(isdefined(param_00) && param_00)
	{
		level.var_21DF thread func_68A2(var_01,"node_building_jump_land_cormack",1,1,1);
		level.var_A31B thread func_68A2(var_02,"node_building_jump_land_will",undefined,undefined,1);
		return;
	}

	if(level.var_21DF istouching(var_03) && level.var_A31B istouching(var_03))
	{
		level.var_21DF thread func_68A2(var_01,"node_building_jump_land_cormack",1,1);
		level.var_A31B thread func_68A2(var_02,"node_building_jump_land_will");
		return;
	}

	level.var_21DF thread func_68A2(var_01,"node_building_jump_land_cormack",0);
	level waittill("cormack_jumping_buildings");
	level.var_A31B thread func_68A2(var_02,"node_building_jump_land_will",0);
}

//Function Number: 220
func_68A2(param_00,param_01,param_02,param_03,param_04)
{
	self endon("warping");
	self.var_4C03 = 0;
	if(isdefined(param_04) && param_04)
	{
		func_920B(param_00,param_03);
	}
	else if(isdefined(param_03) && param_03)
	{
		func_5876(param_00,param_02,param_03);
	}
	else if(!isdefined(param_02) || param_02)
	{
		func_3A0C(param_00,param_02,param_03);
	}
	else
	{
		func_6113(param_00,param_03);
	}

	level notify("building_jump_anim_done");
	self.var_1883 = 1;
	if(!common_scripts\utility::flag("first_building_jump_complete"))
	{
		var_05 = getnode(param_01,"targetname");
		self method_81A5(var_05);
	}
}

//Function Number: 221
func_6113(param_00,param_01)
{
	self endon("warping");
	var_02 = param_00 common_scripts\utility::spawn_tag_origin();
	var_02 thread lib_A506::func_BFF(self,param_00.animation,undefined,1);
	var_03 = common_scripts\utility::waittill_any_return("anim_reach_complete","override_anim_reach_play_binoc_scene");
	common_scripts\utility::flag_set("dialogue_building_jump");
	level thread lib_A59A::func_61FA("cormack_jumping_buildings",4);
	self.var_1884 = 1;
	param_00 lib_A506::func_C24(self,param_00.animation);
	self.var_52B1 = 1;
	var_02 delete();
}

//Function Number: 222
func_920B(param_00,param_01)
{
	self endon("warping");
	var_02 = param_00 common_scripts\utility::spawn_tag_origin();
	common_scripts\utility::flag_set("dialogue_building_jump");
	level thread lib_A59A::func_61FA("cormack_jumping_buildings",4);
	self.var_1884 = 1;
	param_00 lib_A506::func_C24(self,param_00.animation);
	self.var_52B1 = 1;
	var_02 delete();
}

//Function Number: 223
func_5876(param_00,param_01,param_02)
{
	self endon("warping");
	var_03 = param_00 common_scripts\utility::spawn_tag_origin();
	var_03 lib_A506::func_BFF(self,param_00.animation);
	self.var_1884 = 1;
	var_03 thread lib_A506::func_BE1(self,"seo_mall_sizeup_jump_cormack_idle");
	self.var_4C03 = 1;
	if(!isdefined(param_01) || param_01)
	{
		while(!common_scripts\utility::flag("player_leaving_squad") && !isdefined(level.var_21DF.var_4C03))
		{
			wait 0.05;
		}

		while(!common_scripts\utility::flag("player_leaving_squad") && !isdefined(level.var_A31B.var_4C03))
		{
			wait 0.05;
		}

		while(!common_scripts\utility::flag("player_leaving_squad") && !level.var_21DF.var_4C03 || !level.var_A31B.var_4C03)
		{
			wait(0.05);
		}
	}

	common_scripts\utility::flag_set("dialogue_building_jump");
	level thread lib_A59A::func_61FA("cormack_jumping_buildings",4);
	if(isdefined(param_02) && param_02)
	{
		lib_A56F::func_C3C(var_03);
	}

	if(common_scripts\utility::flag("player_leaving_squad"))
	{
		self.var_1884 = 1;
		self.var_52B1 = 1;
		var_03 delete();
		return;
	}

	self.var_1884 = 1;
	param_00 lib_A506::func_C24(self,param_00.animation);
	self.var_52B1 = 1;
	var_03 delete();
}

//Function Number: 224
func_3A0C(param_00,param_01,param_02)
{
	self endon("warping");
	var_03 = param_00 common_scripts\utility::spawn_tag_origin();
	var_03 lib_A506::func_BFF(self,param_00.animation);
	self.var_1884 = 1;
	param_00 thread lib_A506::func_BC7(self,param_00.animation);
	self.var_4C03 = 1;
	if(!isdefined(param_01) || param_01)
	{
		while(!isdefined(level.var_21DF.var_4C03))
		{
			wait 0.05;
		}

		while(!isdefined(level.var_A31B.var_4C03))
		{
			wait 0.05;
		}

		while(!level.var_21DF.var_4C03 || !level.var_A31B.var_4C03)
		{
			wait(0.05);
		}
	}

	common_scripts\utility::flag_set("dialogue_building_jump");
	level thread lib_A59A::func_61FA("cormack_jumping_buildings",4);
	self.var_1884 = 1;
	param_00 lib_A506::func_C24(self,param_00.animation);
	self.var_52B1 = 1;
	var_03 delete();
}

//Function Number: 225
func_45D0()
{
	lib_A56F::func_A0B9("trigger_enemy_waterfall");
	var_00 = getnodearray("cover_hotel_laser_snipers","targetname");
	var_01 = getentarray("spawner_hotel_enemies_laser_guys","targetname");
	foreach(var_03 in var_00)
	{
		var_04 = common_scripts\utility::random(var_01) lib_A56F::func_72C();
		if(!isdefined(var_04))
		{
			continue;
		}

		var_04 method_81A5(var_03);
		var_04.var_180 = 1;
		var_04 func_6642();
		var_04 thread func_39BF();
		wait(0.1);
	}

	var_06 = common_scripts\utility::getstructarray("struct_sniper_line_gag","targetname");
	foreach(var_08 in var_06)
	{
		var_04 = common_scripts\utility::random(var_01) lib_A56F::func_72C();
		if(!isdefined(var_04))
		{
			continue;
		}

		var_04 func_6642();
		var_04 thread func_39BF();
		var_08 thread lib_A506::func_BCE(var_04,var_08.animation);
		wait(randomfloatrange(0.1,0.5));
	}

	level waittill("never");
	lib_A56F::func_A0B9("trig_convention_center_combat_05");
	var_0A = common_scripts\utility::getstructarray("struct_laser_sniper_group1","targetname");
	var_0B = common_scripts\utility::getstructarray("struct_laser_sniper_group2","targetname");
	var_0C = common_scripts\utility::getstructarray("struct_laser_sniper_group1_targets","targetname");
	var_0D = common_scripts\utility::getstructarray("struct_laser_sniper_group2_targets","targetname");
	thread func_9918(var_0A,var_0C);
	thread func_9918(var_0B,var_0D);
}

//Function Number: 226
func_9918(param_00,param_01)
{
	param_01 = common_scripts\utility::array_randomize(param_01);
	foreach(var_05, var_03 in param_00)
	{
		var_04 = spawn("script_model",var_03.var_2E6);
		var_04 setmodel("tag_laser");
		var_04 thread func_7834(param_01[var_05]);
	}
}

//Function Number: 227
func_7834(param_00)
{
	wait(randomfloat(2));
	self method_80B2();
	var_01 = randomintrange(4,6);
	var_02 = randomintrange(3,5);
	var_03 = randomintrange(2,3);
	var_04 = randomfloatrange(0.25,0.5);
	var_05 = randomint(100);
	for(;;)
	{
		var_06 = lib_A56F::func_407D(var_01,var_02,var_03,var_04,var_05);
		self.var_41 = vectortoangles(param_00.var_2E6 - self.var_2E6 + var_06);
		wait(0.05);
	}
}

//Function Number: 228
func_39BF()
{
	self endon("death");
	for(;;)
	{
		self method_80B2("lag_snipper_laser");
		wait(0.25);
	}
}

//Function Number: 229
func_4599()
{
	lib_A56F::func_A0B9("trig_convention_center_combat_02");
	var_00 = getent("vol_hotel_zipline_defend_01","script_noteworthy");
	var_01 = getent("vol_hotel_zipline_defend_02","script_noteworthy");
	level notify("hotel_fallback");
	foreach(var_03 in level.var_5DFE)
	{
		if(isdefined(var_03) && var_03 istouching(var_00))
		{
			var_03 method_81A9(var_01);
		}
	}

	lib_A56F::func_A0B9("trig_convention_center_combat_03");
	var_00 = getent("vol_hotel_zipline_defend_02","script_noteworthy");
	var_01 = getentarray("vol_hotel_zipline_defend_03","script_noteworthy");
	level notify("hotel_fallback");
	foreach(var_03 in level.var_5DFE)
	{
		if(isdefined(var_03) && var_03 istouching(var_00))
		{
			var_03 method_81A9(common_scripts\utility::random(var_01));
		}
	}

	lib_A56F::func_A0B9("trig_convention_center_combat_04");
	var_00 = getentarray("vol_hotel_zipline_defend_03","script_noteworthy");
	var_01 = getentarray("vol_hotel_zipline_defend_04","script_noteworthy");
	level notify("hotel_fallback");
	foreach(var_03 in level.var_5DFE)
	{
		foreach(var_09 in var_00)
		{
			if(isdefined(var_03) && var_03 istouching(var_09))
			{
				var_03 method_81A9(common_scripts\utility::random(var_01));
			}
		}
	}

	lib_A56F::func_A0B9("trig_convention_center_combat_06");
	var_00 = getentarray("vol_hotel_zipline_defend_04","script_noteworthy");
	var_01 = getentarray("vol_hotel_zipline_defend_04b","script_noteworthy");
	level notify("hotel_fallback");
	foreach(var_03 in level.var_5DFE)
	{
		foreach(var_09 in var_00)
		{
			if(isdefined(var_03) && var_03 istouching(var_09))
			{
				var_03 method_81A9(common_scripts\utility::random(var_01));
			}
		}
	}
}

//Function Number: 230
func_459B()
{
	var_00 = getglass("big_screen_glass_01");
	var_01 = getglass("big_screen_glass_02");
	var_02 = getent("big_screen_video_01","targetname");
	var_03 = getent("big_screen_video_02","targetname");
	var_04 = getentarray("big_screen_static_01","targetname");
	var_05 = getentarray("big_screen_static_02","targetname");
	var_06 = common_scripts\utility::getstructarray("big_screen_struct_01","targetname");
	var_07 = common_scripts\utility::getstructarray("big_screen_struct_02","targetname");
	common_scripts\utility::array_call(var_04,::hide);
	common_scripts\utility::array_call(var_05,::hide);
	var_08 = getglass("big_screen_glass_03");
	var_09 = getglass("big_screen_glass_04");
	var_0A = getent("big_screen_video_03","targetname");
	var_0B = getent("big_screen_video_04","targetname");
	var_0C = getentarray("big_screen_static_03","targetname");
	var_0D = getentarray("big_screen_static_04","targetname");
	var_0E = common_scripts\utility::getstructarray("big_screen_struct_03","targetname");
	var_0F = common_scripts\utility::getstructarray("big_screen_struct_04","targetname");
	common_scripts\utility::array_call(var_0C,::hide);
	common_scripts\utility::array_call(var_0D,::hide);
	var_10 = ["sparks_burst_a_nolight"];
	for(var_11 = 0;var_11 < 4;var_11++)
	{
		func_28C9(var_01,var_03,var_05,var_07,var_10);
	}

	func_28C9(var_00,var_02,var_04,var_06,var_10);
	lib_A56F::func_A0B9("trigger_enemy_waterfall");
	func_28C9(var_08,var_0A,var_0C,var_0E,var_10);
	func_28C9(var_09,var_0B,var_0D,var_0F,var_10);
}

//Function Number: 231
func_28C9(param_00,param_01,param_02,param_03,param_04)
{
	level waittill("zipline_triggered",var_05,var_06);
	if(!isglassdestroyed(param_00))
	{
		destroyglass(param_00,var_06 - var_05);
		param_01 hide();
		common_scripts\utility::array_call(param_02,::show);
		foreach(var_08 in param_03)
		{
			playfx(common_scripts\utility::getfx("glass_shatter_xlarge"),var_08.var_2E6);
			playfx(common_scripts\utility::getfx(common_scripts\utility::random(param_04)),var_08.var_2E6);
			if(common_scripts\utility::cointoss())
			{
				var_08 thread func_6988(param_04);
			}
		}
	}
}

//Function Number: 232
func_6988(param_00)
{
	self endon("end_persistent_fx");
	thread lib_A59A::func_61FA("end_persistent_fx",randomfloatrange(4,10));
	for(;;)
	{
		if(common_scripts\utility::cointoss())
		{
			playfx(common_scripts\utility::getfx(common_scripts\utility::random(param_00)),self.var_2E6);
		}

		wait(randomfloat(2));
	}
}

//Function Number: 233
func_45D1()
{
	level.var_5DFE = [];
	thread func_4599();
	thread func_459B();
	var_00 = getent("vol_hotel_zipline_defend_01","script_noteworthy");
	var_01 = getentarray("struct_reverse_zipline_start_group2","targetname");
	var_02 = getentarray("struct_reverse_zipline_start_group3","targetname");
	var_03 = getent("spawner_hotel_zipline_guys","targetname");
	var_04 = getentarray("vol_hotel_zipline_defend","targetname");
	var_05 = getentarray("vol_hotel_waterfall_defend_2","targetname");
	lib_A56F::func_A0B9("trigger_hotel_zipline_gag");
	if(level.currentgen)
	{
		if(!function_021E("seoul_mall_offices_tr"))
		{
			level waittill("transients_truck_push_to_mall_office");
		}
	}

	common_scripts\utility::flag_set("dialogue_performing_arts_interior");
	if(level.currentgen)
	{
		var_06 = getentarray("hotel_zipline_panel","targetname");
		for(var_07 = 0;var_07 < var_06.size;var_07++)
		{
			var_06[var_07] hide();
			var_06[var_07] connectpaths();
			var_06[var_07] setcontents(0);
		}
	}

	var_08 = 70;
	var_09 = level.var_31D.var_2E6;
	var_0A = getnodearray("node_zipline1_covers","targetname");
	var_01 = sortbydistance(var_01,level.var_31D.var_2E6);
	var_0B = [];
	thread func_A3BE();
	thread func_A3BF();
	foreach(var_0D in var_01)
	{
		if(!isdefined(var_0D.var_39B))
		{
			continue;
		}

		var_0E = animscripts\traverse\seoul_zipline::func_892A(var_03,var_0D);
		var_0E func_6642();
		level.var_5DFE[level.var_5DFE.size] = var_0E;
		var_0F = distance(var_09,var_0D.var_2E6);
		var_10 = var_0F / var_08 * 0.05;
		wait(var_10);
		var_09 = var_0D.var_2E6;
		if(!isdefined(var_0E))
		{
			return;
		}

		var_0B[var_0B.size] = var_0E;
	}

	func_0D69(var_0B,var_0A,var_04);
	lib_A56F::func_A0B9("trigger_enemy_waterfall");
	foreach(var_0D in var_02)
	{
		if(!isdefined(var_0D.var_39B))
		{
			continue;
		}

		level.var_5DFE[level.var_5DFE.size] = animscripts\traverse\seoul_zipline::func_892A(var_03,var_0D);
		var_0F = distance(var_09,var_0D.var_2E6);
		var_10 = var_0F / var_08 * 0.05;
		wait(var_10);
		var_09 = var_0D.var_2E6;
	}
}

//Function Number: 234
func_A3BE()
{
	level waittill("zipline_guys_spawned",var_00);
	if(isdefined(var_00))
	{
		var_00.var_3999 = 1;
		var_00 thread func_39BF();
	}

	for(;;)
	{
		level waittill("zipline_guys_spawned",var_00);
		if(!isdefined(var_00))
		{
			continue;
		}

		var_00.var_3999 = 1;
		if(lib_A56F::func_67C3(25))
		{
			var_00 thread func_39BF();
		}
	}
}

//Function Number: 235
func_A3BF()
{
	level waittill("zipline_guys_spawned",var_00);
	if(isdefined(var_00))
	{
		var_00 thread func_83E2();
	}

	for(;;)
	{
		level waittill("zipline_guys_spawned",var_00);
		if(!isdefined(var_00))
		{
			continue;
		}

		if(lib_A56F::func_67C3(35))
		{
			var_00 thread func_83E2();
		}
	}
}

//Function Number: 236
func_83E2()
{
	self endon("end_allow_death_during_zipline");
	self endon("death");
	for(;;)
	{
		var_00 = randomintrange(5,18);
		for(var_01 = 0;var_01 < var_00;var_01++)
		{
			self method_81E7();
			wait 0.05;
		}

		wait(0.5);
	}
}

//Function Number: 237
func_0D69(param_00,param_01,param_02)
{
	var_03 = [];
	foreach(var_05 in param_00)
	{
		var_06 = lib_A56F::func_888D(param_01,var_05.var_A3BB);
		var_07 = 0;
		foreach(var_09 in var_06)
		{
			if(var_07)
			{
				continue;
			}

			if(!lib_A59A::func_5038(var_03,var_09))
			{
				var_05 method_81A5(var_09);
				var_03[var_03.size] = var_09;
				var_07 = 1;
			}
		}

		if(!var_07)
		{
			var_0B = common_scripts\utility::random(param_02);
			var_05 method_81A9(var_0B);
			iprintln("node find fail");
		}
	}
}

//Function Number: 238
func_4EAF(param_00)
{
	self endon("death");
	var_01[0] = getentarray("vol_hotel_zipline_defend_02","script_noteworthy");
	var_01[1] = getentarray("vol_hotel_zipline_defend_03","script_noteworthy");
	var_01[2] = getentarray("vol_hotel_zipline_defend_04","script_noteworthy");
	var_02 = param_00;
	for(;;)
	{
		if(!isdefined(var_01[var_02]))
		{
			break;
		}

		if(isdefined(self))
		{
			self method_81A9(common_scripts\utility::random(var_01[var_02]));
		}

		var_02++;
		level waittill("hotel_fallback");
	}
}

//Function Number: 239
func_45CA()
{
	var_00 = getentarray("spawner_convention_center_ar_01","targetname");
	var_01 = getentarray("spawner_convention_center_ar_01b","targetname");
	var_02 = getentarray("spawner_convention_center_ar_02","targetname");
	var_03 = getentarray("spawner_convention_center_ar_03","targetname");
	var_04 = getentarray("spawner_convention_center_ar_04","targetname");
	var_05 = getentarray("spawner_convention_center_ar_04b","targetname");
	var_06 = getentarray("spawner_convention_center_smg_01","targetname");
	var_07 = getentarray("spawner_convention_center_smg_02","targetname");
	var_08 = getentarray("spawner_convention_center_smg_03","targetname");
	var_09 = getentarray("spawner_convention_center_smg_04","targetname");
	var_0A = getentarray("spawner_hotel_enemies_laser_guys","targetname");
	lib_A56F::func_A0B9("trigger_hotel_zipline_gag");
	var_0B = 3;
	if(level.gameskill > 1)
	{
		var_0B = 5;
	}

	for(var_0C = 0;var_0C < var_0B;var_0C++)
	{
		var_0D = common_scripts\utility::random(var_00) lib_A56F::func_72C(1);
		var_0D thread func_4EAF(0);
		var_0D func_6642();
		wait(1.5);
	}

	lib_A56F::func_A0B9("trig_convention_center_combat_03");
	for(var_0C = 0;var_0C < var_0B;var_0C++)
	{
		var_0D = common_scripts\utility::random(var_0A) lib_A56F::func_72C(1);
		var_0D thread func_4EAF(1);
		var_0D func_6642();
		wait(1.5);
	}
}

//Function Number: 240
func_6642(param_00)
{
	self.var_1D3 = 0;
	self.var_1C7 = 128;
	if(!isdefined(level.var_6641))
	{
		level.var_6641 = [];
	}

	level.var_6641[level.var_6641.size] = self;
}

//Function Number: 241
func_5921(param_00,param_01,param_02)
{
	var_03 = spawn("script_model",param_00.var_2E6);
	var_03 setmodel(param_02);
	var_03.animname = param_01;
	var_03 lib_A506::func_7F23();
	return var_03;
}

//Function Number: 242
func_9CBA()
{
	wait 0.05;
	wait(2);
	if(level.currentgen && !issubstr(level.var_9704,"_droneswarm1"))
	{
		level waittill("transients_fob_to_drone_seq_one");
	}

	var_00 = common_scripts\utility::getstruct("struct_truck_explode_01","targetname");
	var_01 = func_5921(var_00,"truck_explode_01","vehicle_civ_pickup_truck_01_wrecked");
	var_00 thread lib_A506::func_BC7(var_01,"truck_explode");
	lib_A56F::func_A0B9("trigger_e3_fallback_01");
	common_scripts\utility::flag_set("dialogue_drone_swarm_intro");
	var_00 thread lib_A506::func_C24(var_01,"truck_explode");
	var_01 thread func_28CE(var_00);
	var_01 thread func_37A2();
	thread func_2E29();
}

//Function Number: 243
func_2E29()
{
	var_00 = common_scripts\utility::spawn_tag_origin();
	var_01 = getent("model_phys_car_01","targetname");
	var_01.explode = common_scripts\utility::getstruct("struct_phys_launch_01","targetname");
	var_00 lib_A56F::func_B9A(var_01.explode);
	var_02 = var_00 lib_A56F::func_6379("forward","tag_origin",30);
	var_01.var_9C61 = var_02 - var_01.explode.var_2E6;
	var_03 = undefined;
	if(level.nextgen)
	{
		var_03 = getent("model_phys_car_02","targetname");
		var_03.explode = common_scripts\utility::getstruct("struct_phys_launch_02","targetname");
		var_00 lib_A56F::func_B9A(var_03.explode);
		var_02 = var_00 lib_A56F::func_6379("forward","tag_origin",30);
		var_03.var_9C61 = var_02 - var_03.explode.var_2E6;
	}

	var_04 = getent("model_phys_car_04","targetname");
	var_04.explode = common_scripts\utility::getstruct("struct_phys_launch_04","targetname");
	var_00 lib_A56F::func_B9A(var_04.explode);
	var_02 = var_00 lib_A56F::func_6379("forward","tag_origin",30);
	var_04.var_9C61 = var_02 - var_04.explode.var_2E6;
	var_01 thread func_560D(115);
	lib_A5DE::snd_message("start_drone_barrage_submix");
	playfxontag(common_scripts\utility::getfx("seo_car_explo_fire_trail"),var_01,"tag_origin");
	wait(0.5);
	if(level.nextgen)
	{
		var_03 thread func_560D(50);
		thread func_37A9();
		playfxontag(common_scripts\utility::getfx("seo_car_explo_fire_trail"),var_03,"tag_origin");
	}

	wait(9);
	var_04 thread func_560D(50);
	playfxontag(common_scripts\utility::getfx("seo_car_explo_fire_trail"),var_04,"tag_origin");
	lib_A56F::func_A0B9("trigger_brush_guide_group1");
	var_00 delete();
}

//Function Number: 244
func_37A9()
{
	var_00 = randomintrange(2,4);
	for(var_01 = 0;var_01 < var_00;var_01++)
	{
		if(!isdefined(level.var_A117))
		{
			return;
		}

		var_02 = common_scripts\utility::getclosest(level.var_A117.var_2E6,level.var_38E5,3000);
		if(!isdefined(var_02))
		{
			if(var_01 == 0)
			{
				return;
			}
			else
			{
				break;
			}
		}

		var_03 = var_02.var_2E6;
		var_02 delete();
		var_04 = magicbullet("remote_missile_drone_light",var_03,level.var_A117.var_2E6 + (randomintrange(-100,100),randomintrange(-100,100),randomintrange(-100,100)));
		wait(0.25);
	}
}

//Function Number: 245
func_560D(param_00)
{
	var_01 = 1;
	for(var_02 = 0;var_02 < var_01;var_02++)
	{
		var_03 = common_scripts\utility::getclosest(self.var_2E6,level.var_38E5,3000);
		if(!isdefined(var_03))
		{
			if(var_02 == 0)
			{
				return;
			}
			else
			{
				break;
			}
		}

		var_04 = var_03.var_2E6;
		var_03 delete();
		var_05 = magicbullet("remote_missile_drone_light",var_04,self.var_2E6 + (randomintrange(-100,100),randomintrange(-100,100),randomintrange(-100,100)));
		wait(0.1);
	}

	playfx(common_scripts\utility::getfx("seo_drones_car_explo"),self.var_2E6);
	self physicslaunchserver(self.explode.var_2E6,self.var_9C61 * param_00);
	lib_A5DE::snd_message("seo_big_car_explo");
	self waittill("physics_finished");
	playfx(common_scripts\utility::getfx("seo_drones_car_explo"),self.var_2E6);
	lib_A5DE::snd_message("seo_big_car_explo");
	self delete();
}

//Function Number: 246
func_28CE(param_00)
{
	level waittill("truck_01_explode");
	playfx(common_scripts\utility::getfx("seo_drones_car_explo"),self.var_2E6);
	lib_A5DE::snd_message("seo_truck_explo");
}

//Function Number: 247
func_37A2()
{
	level endon("truck_01_explode");
	for(;;)
	{
		var_00 = common_scripts\utility::getclosest(self.var_2E6,level.var_38E5,2000);
		var_00 hide();
		var_01 = magicbullet("remote_missile_drone_light",var_00.var_2E6,self.var_2E6);
		lib_A5DE::snd_message("seo_drone_missile",var_01);
		wait(randomfloatrange(0.5,1));
	}
}

//Function Number: 248
func_86AD()
{
	while(!isdefined(level.var_2EC8))
	{
		wait 0.05;
	}

	while(level.var_2EC8.size > 0)
	{
		foreach(var_01 in level.var_2EC8)
		{
			if(!isdefined(var_01))
			{
				continue;
			}

			if(common_scripts\utility::cointoss())
			{
				var_01 func_83D4(1);
			}
		}

		wait 0.05;
	}
}

//Function Number: 249
func_83D4(param_00)
{
	self endon("death");
	var_01 = common_scripts\utility::getclosest(self.var_2E6,level.var_38E5,1000);
	var_02 = distance(level.var_31D.var_2E6,self.var_2E6);
	if(!isdefined(var_01))
	{
		wait(1);
		return;
	}

	if(isdefined(param_00) && param_00)
	{
		if(var_02 < 356)
		{
			return;
		}
	}

	var_03 = var_01.var_2E6;
	var_01 delete();
	var_04 = magicbullet("remote_missile_drone_light",var_03,self.var_2E6);
	lib_A5DE::snd_message("seo_drone_missile_impact",self.var_2E6);
	wait(1.5);
}

//Function Number: 250
func_2AEA()
{
	level.var_5D21 endon("death");
	for(;;)
	{
		level.var_5D21 notify("end_rocket_think");
		level.var_5D21 notify("disable_missile_input");
		wait 0.05;
	}
}

//Function Number: 251
func_5E1F()
{
	level waittill("swapped_x4walker",var_00);
	var_01 = var_00 setcontents(0);
	common_scripts\utility::flag_waitopen("player_in_x4walker");
	var_00 setcontents(var_01);
}

//Function Number: 252
func_8233()
{
	thread func_5E1F();
	wait(5);
	level.var_A361 = 1;
	level.var_A35E = 0;
	level.var_5344 = 1;
	var_00 = getent("mobile_turret_drone_street","targetname");
	var_00 thread func_5929();
	var_00 thread func_3636();
	foreach(var_02 in level.var_5FDA)
	{
		if(level.var_31D common_scripts\utility::is_player_gamepad_enabled())
		{
			var_02 sethintstring(&"SEOUL_ENTER_MOBILE_TURRET_SEOUL");
			continue;
		}

		var_02 sethintstring(&"SEOUL_ENTER_MOBILE_TURRET_SEOUL_PC");
	}

	level.var_5D21 = var_00;
	thread func_2AEA();
	level.var_31D waittill("player_in_x4walker");
	var_00 hide();
	var_00.var_2E6 = var_00.var_2E6 - (0,0,100);
	common_scripts\utility::flag_set("will_cardoor_watcher_flag");
	var_04 = common_scripts\utility::getstructarray("struct_start_point_hotel_entrance_1","targetname");
	foreach(var_07, var_06 in level.var_8AAA)
	{
		var_06 method_81C6(var_04[var_07].var_2E6,var_04[var_07].var_41);
	}

	common_scripts\utility::flag_waitopen("player_in_x4walker");
	var_00 show();
	var_00.var_2E6 = var_00.var_2E6 + (0,0,100);
}

//Function Number: 253
func_5D26()
{
	self endon("death");
	self endon("stop_mobile_turret_health_1");
	level.var_31D endon("player_exited_mobile_turret");
	var_00 = "seo_spark_droppod_door";
	var_01 = "TAG_turret";
	var_02 = "TAG_turret";
	playfxontag(common_scripts\utility::getfx(var_00),self,var_01);
	wait(randomfloat(3.75));
	playfxontag(common_scripts\utility::getfx(var_00),self,var_02);
	wait(randomfloat(1.75));
	playfxontag(common_scripts\utility::getfx(var_00),self,var_01);
}

//Function Number: 254
func_5D27()
{
	self endon("death");
	self endon("stop_mobile_turret_health_2");
	level.var_31D endon("player_exited_mobile_turret");
	level endon("end_cherry_picker");
	level endon("missionfailed");
	if(isdefined(self.mgturret) && isdefined(self.mgturret[0]))
	{
		playfxontag(common_scripts\utility::getfx("mobile_turret_fire_small"),self.mgturret[0],"TAG_FIRE_1");
	}

	wait(randomfloat(2));
	if(isdefined(self.mgturret) && isdefined(self.mgturret[0]))
	{
		playfxontag(common_scripts\utility::getfx("mobile_turret_fire_small"),self.mgturret[0],"TAG_FIRE_2");
	}
}

//Function Number: 255
func_5D28()
{
	self endon("death");
	self endon("stop_mobile_turret_health_3");
	level.var_31D endon("player_exited_mobile_turret");
	var_00 = "mobile_turret_fire_large";
	var_01 = "TAG_FIRE_2";
	if(isdefined(self.mgturret) && isdefined(self.mgturret[0]))
	{
		playfxontag(common_scripts\utility::getfx(var_00),self.mgturret[0],var_01);
	}
}

//Function Number: 256
func_3636()
{
	level.var_31D waittill("player_in_x4walker");
	thread func_3637();
}

//Function Number: 257
func_3637()
{
	level.var_31D endon("player_exited_mobile_turret");
	level.var_31D.var_627D = 0;
	var_00 = 0.5;
	for(;;)
	{
		if(level.var_31D attackbuttonpressed())
		{
			var_01 = func_3F01(level.var_38E5,level.var_31D geteye(),anglestoforward(level.var_31D getplayerangles()),var_00,12);
			var_02 = 0;
			foreach(var_04 in var_01)
			{
				if(!isdefined(var_04))
				{
					continue;
				}

				if(isdefined(var_04.var_52CB))
				{
					var_04 lib_A5FA::func_93F6(0,1,undefined,1);
					continue;
				}

				if(lib_A56F::func_67C3(25))
				{
					if(!var_02)
					{
						var_04 lib_A5FA::func_93F6(0,1);
					}
					else
					{
						var_04 lib_A5FA::func_93F6(0,1,undefined,undefined,1);
					}

					level.var_31D.var_627D++;
					var_02 = 1;
				}
			}
		}

		wait 0.05;
	}
}

//Function Number: 258
func_6934(param_00)
{
	var_01 = param_00.var_2E6;
	for(var_02 = 0;var_02 < 3;var_02++)
	{
		lib_A5F1::func_8728("exp_amb_mid_air",level.var_31D.var_2E6);
		lib_A5DE::snd_message("seo_ambient_ground_explosions",level.var_31D.var_2E6);
		wait(0.1);
	}
}

//Function Number: 259
func_A3B5(param_00)
{
	var_01 = lib_A56F::func_888D(level.var_38E5,param_00.var_2E6);
	var_02 = 400;
	for(var_03 = 0;var_03 < 20;var_03++)
	{
		if(distance(var_01[var_03].var_2E6,param_00.var_2E6) < var_02)
		{
			var_01[var_03] lib_A5FA::func_93F6(0);
		}
	}
}

//Function Number: 260
func_3F01(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = cos(param_03);
	if(isdefined(param_04))
	{
		var_06 = param_01 - param_02 * param_04 / tan(param_03);
	}
	else
	{
		var_06 = param_02;
	}

	var_07 = [];
	foreach(var_09 in param_00)
	{
		if(isdefined(var_09) && vectordot(vectornormalize(var_09.var_2E6 - var_06),param_02) > var_05 && !isdefined(param_04) || vectordot(var_09.var_2E6 - param_01,param_02) > 0)
		{
			var_07[var_07.size] = var_09;
		}
	}

	return var_07;
}

//Function Number: 261
func_5DC6()
{
	self.var_2ED8 = [];
	for(;;)
	{
		level.var_31D waittill("attack_pressed");
		if(self.var_2ED8.size > 0)
		{
			foreach(var_01 in self.var_2ED8)
			{
				wait(randomfloat(0.25));
				if(isdefined(var_01))
				{
					var_02 = magicbullet("hovertank_missile_small_straight",self.var_2E6 + (0,0,96),var_01.var_2E6);
					var_02 missilesettargetent(var_01);
				}
			}
		}
	}
}

//Function Number: 262
func_5929()
{
	var_00 = self.var_275;
	self.var_5942 = 1;
	for(;;)
	{
		if(self.var_5942)
		{
			self.var_275 = var_00 * 2;
			self.health = self.var_275;
		}

		wait 0.05;
	}
}

//Function Number: 263
func_8234()
{
	thread func_8233();
	wait(1);
	thread func_86A4();
	level.var_31D waittill("player_in_x4walker");
	common_scripts\utility::flag_set("dialogue_drone_turret_sequence");
	level notify("end_drone_kamikaze_player");
	level notify("cherry_picker_turret_in_use");
	level.var_5D21 func_1D37();
}

//Function Number: 264
func_5D2B()
{
	level.var_31D endon("player_in_x4walker");
	level.var_31D waittill("player_has_cardoor");
	var_00 = level.var_5D21 gettagorigin("tag_body");
	var_01 = lib_A571::func_48BB("x",var_00,48,1000);
	thread func_5D2C(var_01);
}

//Function Number: 265
func_5D2C(param_00)
{
	level.var_31D waittill("player_in_x4walker");
	param_00 lib_A571::func_48B3();
}

//Function Number: 266
func_8697(param_00,param_01)
{
	level endon("end_cherry_picker");
	level endon("snake_charge_ended");
	if(!isdefined(level.var_31D.var_2ED7))
	{
		level.var_31D.var_2ED7 = common_scripts\utility::spawn_tag_origin();
	}

	level.var_31D.var_2ED7 unlink();
	level.var_31D.var_2ED7.var_1525 = [];
	var_02 = [];
	var_03 = (0,0,0);
	foreach(var_05 in self.var_86B4)
	{
		var_03 = var_03 + var_05 veh_getvelocity();
	}

	var_03 = vectornormalize(var_03);
	level.var_31D.var_2ED7 thread func_3965(param_01);
	var_07 = 70;
	for(var_08 = 0;var_08 < param_00;var_08++)
	{
		var_09 = spawn("script_model",level.var_31D.var_2ED7.var_2E6);
		var_09 setmodel("vehicle_mil_attack_drone_ai");
		var_09.var_90B6 = common_scripts\utility::spawn_tag_origin();
		var_0A = (randomintrange(var_07 * -1,var_07),randomintrange(var_07 * -1,var_07),randomintrange(var_07 * -1,var_07));
		var_09.var_90B6.var_2E6 = level.var_31D.var_2ED7.var_2E6 + var_0A;
		var_09.var_90B6 linkto(level.var_31D.var_2ED7,"tag_origin");
		var_09 thread func_1E67();
		var_02[var_02.size] = var_09;
		level.var_31D.var_2ED7.var_1525[level.var_31D.var_2ED7.var_1525.size] = var_09;
	}

	return var_02;
}

//Function Number: 267
func_1E67()
{
	var_00 = self.var_90B6;
	while(isdefined(self))
	{
		wait 0.05;
	}

	var_00 lib_A56F::func_2800();
}

//Function Number: 268
func_5918()
{
	level.var_38E5 = common_scripts\utility::array_add(level.var_38E5,self);
	self.var_5018 = 1;
	self.var_2EA4 = 0;
	lib_A5DE::snd_message("cherry_picker_target_add");
	thread func_5919();
	return self;
}

//Function Number: 269
func_1D2F()
{
	level endon("EMP_triggered");
	for(;;)
	{
		level.var_31D waittill("play_damage_alarm");
		lib_A5F1::func_8725("droppod_missile_hit_alarms","EMP_triggered");
		wait(4);
	}
}

//Function Number: 270
func_5919()
{
	self.var_5018 = 1;
	self.var_2EA4 = 0;
	level notify("new_drone_target");
	var_00 = 0;
	var_01 = "drone_turret_hud_target";
	var_02 = 256;
	var_03 = 256;
	var_04 = 156;
	if(!isdefined(level.var_31D.var_2E5A))
	{
		level.var_31D.var_2E5A = [];
	}

	var_05 = newclienthudelem(level.var_31D);
	var_05 setshader(var_01,var_02,var_03);
	var_05.var_32F = 1;
	var_05.alignx = "center";
	var_05.aligny = "middle";
	var_05.alpha = 1;
	var_05.foreground = 1;
	var_05.hidewheninmenu = 1;
	var_06 = common_scripts\utility::spawn_tag_origin();
	var_06.var_2E6 = self.var_2E6;
	var_05 method_80CD(var_06);
	level.var_31D playsoundasmaster("sensor_fusion_new_target");
	var_07 = 0;
	while(isdefined(self) && !self.var_2EA4)
	{
		var_08 = level.var_31D geteye();
		var_09 = self.var_2E6 + (0,0,var_00);
		var_0A = distance(var_09,var_08);
		var_07 = var_07 + 0.05;
		if(var_0A > 200)
		{
			var_0B = var_04 / var_0A;
		}
		else
		{
			var_0B = 100;
		}

		var_0C = function_0246(var_07,[[0,0],[0.8,2.6],[1,1]]);
		var_0D = var_0B * var_0C;
		var_0E = self.var_2E6;
		var_05 setshader(var_01,int(var_02 * var_0D),int(var_03 * var_0D));
		var_06.var_2E6 = var_0E + (0,0,var_00);
		wait(0.05);
	}

	var_05 destroy();
	var_06 delete();
}

//Function Number: 271
func_4563()
{
	level endon("end_cherry_picker");
	level endon("snake_charge_ended");
	level.var_31D endon("cherrypicker_exit");
	var_00 = randomintrange(1,3);
	var_01 = [];
	var_02 = 0;
	foreach(var_04 in self.var_1525)
	{
		var_05 = var_04 func_5918();
		while(isdefined(var_05) && !var_05.var_2EA4)
		{
			if(isdefined(var_05.var_2EF3) && var_05.var_2EF3 && !isdefined(var_05.var_5018))
			{
				var_05.var_2EF3 = undefined;
			}

			if(isdefined(var_05.var_2EF3) && var_05.var_2EF3)
			{
				var_05.var_2E38 = 1;
				var_06 = 1;
				var_01 = common_scripts\utility::array_remove(var_01,var_05);
				var_05.var_2EA4 = 1;
			}

			wait 0.05;
		}
	}

	level notify("all_targeted_drones_killed");
	common_scripts\utility::flag_set("all_targeted_drones_dead");
}

//Function Number: 272
func_3965(param_00)
{
	level endon("end_cherry_picker");
	level endon("snake_charge_ended");
	level.var_31D endon("cherrypicker_exit");
	while(self.var_1525.size <= 0)
	{
		wait 0.05;
	}

	thread func_3131();
	thread func_4563();
	thread func_4562(param_00);
	thread func_7341();
}

//Function Number: 273
func_7341()
{
	level waittill("snake_charge_ended");
	foreach(var_01 in self.var_1525)
	{
		var_01 lib_A56F::func_2800();
	}
}

//Function Number: 274
func_4562(param_00)
{
	level endon("end_cherry_picker");
	level endon("snake_charge_ended");
	level.var_31D endon("cherrypicker_exit");
	var_01 = (randomfloatrange(-5,5),randomfloatrange(-5,5),randomfloatrange(-5,5));
	while(self.var_1525.size > 0)
	{
		level.var_8696.var_86B4 = common_scripts\utility::array_removeundefined(level.var_8696.var_86B4);
		if(level.var_8696.var_86B4.size == 0)
		{
			break;
		}

		var_02 = lib_A59A::func_3CCF(level.var_8696.var_86B4) * 0.8;
		var_03 = param_00.var_2E6 * 0.2;
		self.var_2E6 = var_02 + var_03;
		self.var_41 = self.var_41 + var_01;
		foreach(var_05 in self.var_1525)
		{
			if(isdefined(var_05))
			{
				var_06 = lib_A56F::func_407D(5,3,2,0.5,10);
				var_07 = vectortoangles(self.var_2E6 - var_05.var_2E6);
				var_08 = var_07 * 5;
				var_05.var_2E6 = var_05.var_90B6.var_2E6;
				var_05.var_41 = vectortoangles(level.var_31D.var_2E6 - var_05.var_2E6);
			}
		}

		self.var_1525 = common_scripts\utility::array_removeundefined(self.var_1525);
		wait 0.05;
	}
}

//Function Number: 275
func_3131()
{
	level common_scripts\utility::waittill_any("snake_charge_ended","end_cherry_picker");
	foreach(var_01 in self.var_1525)
	{
		var_01 lib_A56F::func_2800();
	}

	lib_A56F::func_2800();
}

//Function Number: 276
func_460C()
{
	level endon("end_cherry_picker");
	var_00 = undefined;
	for(;;)
	{
		level waittill("snake_charge_initiated");
		var_01 = [];
		foreach(var_03 in level.var_8696.var_86B4)
		{
			if(isdefined(var_03.var_563C))
			{
				var_00 = var_03;
			}
		}

		if(isdefined(var_00))
		{
			var_05 = lib_A56F::func_888D(level.var_38E5,var_00.var_2E6);
			for(var_06 = 0;var_06 < 6;var_06++)
			{
				var_01[var_01.size] = var_05[var_06];
			}
		}
		else
		{
			for(var_06 = 0;var_06 < 6;var_06++)
			{
				var_01[var_01.size] = level.var_38E5[var_06];
			}
		}

		foreach(var_08 in var_01)
		{
			var_08 thread func_2E4C();
		}
	}
}

//Function Number: 277
func_2E4C()
{
	level endon("snake_charge_ended");
	level endon("end_cherry_picker");
	while(isdefined(self))
	{
		var_00 = (randomintrange(-80,80),randomintrange(-80,80),48);
		func_2E27(level.var_5D21.var_2E6 + var_00,50);
		if(level.nextgen)
		{
			wait(randomfloat(0.15));
			continue;
		}

		wait(randomfloat(0.25));
	}
}

//Function Number: 278
func_2E27(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = 95;
	}

	if(!isdefined(param_02))
	{
		var_03 = (0,0,0);
	}
	else
	{
		var_03 = (randomfloatrange(var_03 * -1,var_03),randomfloatrange(var_03 * -1,var_03),randomfloatrange(var_03 * -1,var_03));
	}

	if(lib_A56F::func_67C3(param_01) && distance(level.var_31D.var_2E6,param_00) > 96)
	{
		var_04 = maps\seoul::func_1CAD(level.var_2E27,self.var_2E6,param_00 + var_03);
		return;
	}

	var_04 = magicbullet(level.var_2E27,self.var_2E6,param_01 + var_04);
}

//Function Number: 279
func_451D()
{
	for(;;)
	{
		common_scripts\utility::flag_wait("player_in_x4walker");
		level.var_31D.var_58DF = 192;
		common_scripts\utility::flag_waitopen("player_in_x4walker");
		level.var_31D.var_58DF = 288;
		wait 0.05;
	}
}

//Function Number: 280
func_4564()
{
	level endon("end_cherry_picker");
	level endon("snake_charge_initiated");
	level.var_A117 endon("death");
	while(isdefined(level.var_A117) && level.var_A117.classname != "script_vehicle_corpse")
	{
		var_00 = [];
		for(var_01 = 0;var_01 < 10;var_01++)
		{
			var_02 = common_scripts\utility::random(level.var_38E5);
			if(isdefined(var_02))
			{
				var_00[var_00.size] = var_02;
			}
		}

		if(var_00.size < 10)
		{
			return;
		}

		var_03 = lib_A59A::func_3CCF(var_00);
		var_04 = distance(var_03,level.var_A117.var_2E6);
		var_05 = distance(var_03,level.var_31D.var_2E6);
		while(var_05 < var_04)
		{
			var_04 = distance(var_03,level.var_A117.var_2E6);
			var_05 = distance(var_03,level.var_31D.var_2E6);
			wait 0.05;
		}

		while(var_05 > var_04)
		{
			func_2F1A();
			wait(2);
		}
	}
}

//Function Number: 281
func_45A7()
{
	level endon("end_cherry_picker");
	while(!isdefined(level.var_899D))
	{
		wait 0.05;
	}

	for(;;)
	{
		foreach(var_01 in level.var_899D)
		{
			if(isdefined(var_01) && !isdefined(var_01.var_65C3))
			{
				var_01.var_65C3 = 1;
				var_01 hudoutlineenable(1,1);
			}

			if(isdefined(var_01))
			{
				maps\seoul::func_1CAD(level.var_2E27,var_01.var_2E6,level.var_31D geteye() + (randomintrange(-50,50),randomintrange(-50,50),randomintrange(-50,50)));
			}
		}

		wait 0.05;
	}
}

//Function Number: 282
func_2F1A()
{
	level.var_A117 thread func_37A3(15,"drone_swarm_hit");
	if(level.nextgen)
	{
		level.var_A117 thread func_37AA(3,"drone_swarm_hit");
	}

	level waittill("drone_swarm_hit");
}

//Function Number: 283
func_86A4()
{
	level.var_31D waittill("player_in_x4walker");
	level notify("autosave_request");
	level waittill("drone_swarm_hit");
	level.var_143D = 1;
	common_scripts\utility::flag_init("drone_turret_pass_won");
	thread func_5E04();
	thread func_460C();
	thread func_451D();
	thread func_45A7();
	var_00 = 1;
	var_01 = "2";
	for(;;)
	{
		if(var_00)
		{
			var_00 = 0;
			var_02 = 0;
		}
		else
		{
			var_03 = var_01;
			while(var_03 == var_01)
			{
				var_01 = common_scripts\utility::random(["1","2","3"]);
				wait 0.05;
			}

			var_02 = 0;
		}

		level.var_2EE7 = 0;
		var_04 = "snake_gameplay_wait_" + var_01;
		level.var_8696 lib_A5FA::func_8698(var_04,undefined,0,undefined,1);
		level notify("snake_moving_to_new_attack_path");
		thread func_4564();
		common_scripts\utility::flag_clear("snake_gameplay_attack_succeeded");
		level.var_86B5 = 1;
		var_05 = var_04 + "_end";
		common_scripts\utility::flag_clear(var_05);
		level waittill(var_05,var_06);
		common_scripts\utility::flag_wait(var_05);
		wait(var_02);
		level.var_31D notify("play_damage_alarm");
		var_04 = "snake_gameplay_attack_" + var_01;
		level.var_8696 lib_A5FA::func_8698(var_04,undefined,0,undefined,1);
		var_07 = randomintrange(4,7);
		var_08 = [];
		level notify("snake_charge_initiated",var_08[0]);
		foreach(var_0A in var_08)
		{
			var_0A.var_2EF3 = undefined;
			var_0A.var_2E7C = 1;
		}

		var_05 = var_04 + "_end";
		common_scripts\utility::flag_clear(var_05);
		var_0C = 0;
		while(!common_scripts\utility::flag("all_targeted_drones_dead") && !common_scripts\utility::flag(var_05))
		{
			var_0C = 1;
			foreach(var_0A in var_08)
			{
				if(!isdefined(var_0A.var_2EA4))
				{
					var_0C = 0;
					break;
				}
			}

			wait 0.05;
		}

		if(common_scripts\utility::flag("all_targeted_drones_dead") & !common_scripts\utility::flag("snake_gameplay_attack_succeeded"))
		{
			common_scripts\utility::flag_clear("all_targeted_drones_dead");
			level.var_86B5 = undefined;
			level.var_31D.var_58DF = 320;
			level.var_8696 lib_A5FA::func_869C();
			level.var_8696 lib_A5FA::func_869B(level.var_1523["frozen_snake"]);
			level notify("snake_charge_ended");
			wait(1.5);
			level.var_8696 lib_A5FA::func_869A();
		}

		level.var_86B5 = undefined;
		var_04 = "snake_gameplay_retreat_" + var_01;
		level notify("snake_charge_ended",var_04);
		level.var_8696 lib_A5FA::func_8698(var_04,undefined,0.75,undefined,1,level.var_1523["default_snake"]);
		foreach(var_0A in var_08)
		{
			if(isdefined(var_0A.var_2E7C))
			{
				var_0A.var_2EF3 = undefined;
				var_0A.var_2E7C = undefined;
			}
		}

		var_05 = var_04 + "_end";
		common_scripts\utility::flag_clear(var_05);
		common_scripts\utility::flag_wait(var_05);
	}
}

//Function Number: 284
func_9FE2()
{
	var_00 = 3;
	var_01 = squared(128);
	var_02 = 0;
	while(var_02 < var_00)
	{
		if(isdefined(level.var_8696))
		{
			foreach(var_04 in level.var_8696.var_86B4)
			{
				if(distancesquared(var_04.var_2E6,level.var_31D.var_2E6) < var_01)
				{
					return;
				}
			}
		}

		var_02 = var_02 + 0.05;
		wait(0.05);
	}
}

//Function Number: 285
func_5DE1()
{
	level.var_31D method_80EF();
	level waittill("end_cherry_picker");
	level.var_31D method_80F0();
}

//Function Number: 286
func_5E04()
{
	level endon("EMP_triggered");
	var_00 = 3;
	var_01 = 0;
	thread func_5DE1();
	thread func_1D2F();
	for(;;)
	{
		for(var_02 = 0;var_02 < 11;var_02++)
		{
			level.var_31D waittill("kamikaze_hit_player");
			level.var_31D notify("play_damage_alarm");
			if(var_02 == 0)
			{
				level.var_5D21 func_5D27();
			}

			if(var_02 == 1)
			{
				level.var_5D21 func_5D27();
			}

			if(var_02 == 3)
			{
				level.var_5D21 func_5D28();
			}
		}

		level.var_31D.var_58DF = 256;
		func_9FE2();
		var_01++;
		level.var_5D21.var_5942 = 0;
		level.var_31D dodamage(level.var_31D.health * 2,level.var_31D.var_2E6);
		level.var_5D21 dodamage(level.var_5D21.var_275 * 5,level.var_5D21.var_2E6);
		level notify("stop_hud_overlay_update");
		setdvar("ui_deadquote",&"SEOUL_FAILED_DRONE_SWARM");
		thread lib_A59A::func_5CDC();
		level notify("end_crash_into_player");
	}
}

//Function Number: 287
func_710D()
{
	level endon("stop_random_damage");
	for(;;)
	{
		level.var_31D dodamage(10,level.var_31D.var_2E6);
		wait(randomfloat(1));
	}
}

//Function Number: 288
func_455D()
{
	var_00 = getentarray("drone_swarm_skip","targetname");
	level waittill("end_cherry_picker");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 + (0,0,10000);
	}
}

//Function Number: 289
func_455B()
{
	var_00 = getentarray("drone_swarm_retreat","targetname");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 + (0,0,10000);
	}

	lib_A56F::func_A0B9("start_pod_landings_group_3");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 - (0,0,10000);
	}
}

//Function Number: 290
func_45CE()
{
	var_00 = getentarray("hotel_retreat_left_map","targetname");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 + (0,0,10000);
	}

	lib_A56F::func_A0B9("trig_convention_center_setup");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 - (0,0,10000);
	}
}

//Function Number: 291
func_4608()
{
	var_00 = getentarray("shopping_district_retreat_left_map","targetname");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 + (0,0,10000);
	}

	lib_A56F::func_A0B9("trig_restaurant_spawn");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 - (0,0,10000);
	}
}

//Function Number: 292
func_452A()
{
	var_00 = getentarray("canal_intro_retreat_left_map","targetname");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 + (0,0,10000);
	}

	common_scripts\utility::flag_wait("sd_escaped_swarm");
	foreach(var_02 in var_00)
	{
		var_02.var_2E6 = var_02.var_2E6 - (0,0,10000);
	}
}

//Function Number: 293
func_461B()
{
	level endon("e3_presentation_cleanup");
	level.var_2F24 = 1;
	var_00 = getentarray("attack_drone_kamikaze_spawner","targetname");
	thread func_455D();
	thread func_455B();
	thread func_807D();
	thread func_8234();
	thread func_88C5();
	thread func_0C0C();
	thread lib_A56F::func_97FD("trigger_drone_swarm_flank","flag_trigger_drones");
	thread func_9CBA();
	thread func_1CE5();
	lib_A56F::func_A0B9("start_pod_landings_group_3");
	if(level.nextgen)
	{
		var_01 = lib_A5FA::func_894A("queen_drone_cloud_2","snake_swarm_initial_area");
		var_01 thread func_1E81("dialogue_performing_arts_interior");
		level.var_8696 = var_01;
	}

	lib_A56F::func_A0B9("trigger_e3_fallback_01");
	if(level.currentgen)
	{
		var_01 = lib_A5FA::func_894A("queen_drone_cloud_2","snake_swarm_initial_area",8,12,undefined,65);
		var_01 thread func_1E81("dialogue_performing_arts_interior");
		level.var_8696 = var_01;
	}

	level notify("drone_swarm_spawning");
	var_02 = getent("vol_cardoor_objective_vol_a","targetname");
	var_03 = getent("vol_cardoor_objective_vol_b","targetname");
	var_04 = getent("vol_cardoor_objective_vol_c","targetname");
	var_05 = "snake_swarm_first_flyby";
	if(level.var_31D istouching(var_03))
	{
		var_05 = "snake_swarm_first_flyby_2";
	}

	if(level.var_31D istouching(var_04))
	{
		var_05 = "snake_swarm_first_flyby_path3";
	}

	level.var_8696 lib_A5FA::func_8698(var_05,undefined,3.25);
	thread func_86A8();
	thread func_86A3(level.var_8696);
	thread func_86B0();
	thread func_86AD();
	thread func_869F(var_00);
	thread func_86AE();
	thread func_86A2();
	thread func_86A1();
	level notify("swarm_attack_column");
	if(level.nextgen)
	{
		function_00D3("r_mbEnable","3");
		function_00D3("r_mbVelocityScalar","1");
	}

	lib_A56F::func_A0B9("trigger_drone_swarm_flank");
	level notify("new_drone_swarm");
	thread func_27C0(var_00[0]);
	lib_A56F::func_A0B9("trigger_brush_guide_group1");
	wait(15);
	level notify("end_crash_into_player");
}

//Function Number: 294
func_86A2()
{
	level endon("drone_swarm_hit");
	level waittill("player_in_x4walker");
	level.var_8696 lib_A5FA::func_8698("struct_swarm_circle_walker_tank_01",undefined,3.25);
	level notify("stop_kamikaze_player");
}

//Function Number: 295
func_593A(param_00)
{
}

//Function Number: 296
func_5939()
{
	level.var_31D endon("player_in_x4walker");
	level endon("walker_is_now_vulnerable");
	level.var_A117 endon("death");
	for(;;)
	{
		level.var_A117.health = 22000;
		level.var_A117.var_2516 = 22000;
		wait 0.05;
	}
}

//Function Number: 297
func_26C7()
{
	level.var_A117 endon("death");
	for(;;)
	{
		iprintln(level.var_A117.health);
		wait(0.5);
	}
}

//Function Number: 298
func_86A1()
{
	level endon("drone_swarm_hit");
	thread func_463E();
	thread func_463C();
	thread func_5939();
	thread func_455C();
	common_scripts\utility::flag_wait_any("snake_swarm_first_flyby_end","player_in_x4walker","snake_swarm_cardoor_charge_end");
	if(level.nextgen)
	{
		thread func_88C2();
	}

	level thread lib_A59A::func_61FA("walker_is_now_vulnerable",20);
	level.var_A117 thread func_37A3(15,"drone_swarm_hit");
	if(level.nextgen)
	{
		level.var_A117 thread func_37AA(0.25,"drone_swarm_hit",1);
	}

	level.var_A117 waittill("death");
	common_scripts\utility::flag_set("walker_tank_is_dead");
	wait 0.05;
	level notify("drone_swarm_hit");
}

//Function Number: 299
func_455C()
{
	level.var_31D endon("player_in_x4walker");
	common_scripts\utility::flag_wait_any("snake_swarm_first_flyby_end","snake_swarm_cardoor_charge_end");
	wait(8);
	var_00 = common_scripts\utility::spawn_tag_origin();
	var_00.var_2E6 = level.var_31D geteye();
	var_01 = var_00 lib_A56F::func_6379("forward","tag_origin",800);
	var_00.var_2E6 = var_01;
	var_00 method_80A6(level.var_31D,"tag_origin",(0,0,0),(0,0,0),0);
	for(;;)
	{
		var_02 = [];
		for(var_03 = 0;var_03 < 5;var_03++)
		{
			var_04 = common_scripts\utility::random(level.var_38E5);
			var_02[var_02.size] = var_04;
		}

		foreach(var_04 in var_02)
		{
			while(isdefined(var_04) && distance(var_00.var_2E6,var_04.var_2E6) < 600)
			{
				var_04 func_2E27(level.var_31D geteye(),undefined,64);
				wait(randomfloat(0.25));
			}
		}

		wait 0.05;
	}
}

//Function Number: 300
func_37AA(param_00,param_01,param_02)
{
	level endon(param_01);
	self endon(param_01);
	self endon("death");
	level endon("end_cherry_picker");
	while(isdefined(self))
	{
		func_901B(self);
		if(isdefined(param_02))
		{
			wait(randomfloatrange(param_00,param_02));
			continue;
		}

		wait(randomfloat(param_00));
	}
}

//Function Number: 301
func_37A3(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_00;var_02++)
	{
		var_03 = common_scripts\utility::random(level.var_38E5);
		if(isdefined(var_03))
		{
			var_03 thread func_2EBA(self,param_01);
			continue;
		}

		var_02 = var_02 - 1;
	}
}

//Function Number: 302
func_463C()
{
	if(level.nextgen)
	{
		while(level.var_A117.classname != "script_vehicle_corpse" && level.var_A117.health > 21000)
		{
			wait 0.05;
		}

		playfx(common_scripts\utility::getfx("razorback_death_explosion"),level.var_A117.var_2E6);
		level.var_A117 notify("death");
		level.var_A117 delete();
		return;
	}

	var_00 = undefined;
	while(isdefined(level.var_A117))
	{
		var_00 = level.var_A117.var_2E6;
		wait 0.05;
	}

	playfx(common_scripts\utility::getfx("razorback_death_explosion"),var_00);
}

//Function Number: 303
func_463E()
{
	level endon("end_walker_tank_health_process");
	while(isdefined(level.var_A117))
	{
		level.var_A117 waittill("damage",var_00,var_01,var_02,var_03,var_04);
		if(var_01 == level.var_A117)
		{
			level.var_A12E.health = level.var_A12E.health + var_00;
		}

		wait 0.05;
	}
}

//Function Number: 304
func_88C2()
{
	var_00 = getentarray("node_ally_cover_group_swarm_battle","targetname");
	var_01 = getentarray("e3_spawner_trench_allies_group_01","targetname");
	foreach(var_03 in var_00)
	{
		var_04 = func_88E3(var_03,var_01);
		var_04 thread func_3E5E();
		var_04 thread func_7300(var_03,var_01,"end_cherry_picker");
	}
}

//Function Number: 305
func_2EBA(param_00,param_01)
{
	level endon(param_01);
	param_00 endon("death");
	while(isdefined(self))
	{
		if(!isdefined(param_00))
		{
			return;
		}

		var_02 = (randomintrange(-120,120),randomintrange(-120,120),0);
		func_2E27(param_00.var_2E6 + var_02);
		if(level.nextgen)
		{
			wait(randomfloat(0.1));
			continue;
		}

		wait(randomfloat(0.25));
	}
}

//Function Number: 306
func_3E5E()
{
	self endon("death");
	for(;;)
	{
		wait(randomfloatrange(10));
		func_901B(self);
	}
}

//Function Number: 307
func_901B(param_00)
{
	var_01 = undefined;
	while(!isdefined(var_01))
	{
		var_01 = common_scripts\utility::random(level.var_38E5);
		if(!isdefined(var_01))
		{
			continue;
		}
	}

	var_02 = var_01.var_2E6;
	var_01 delete();
	var_03 = magicbullet("remote_missile_drone_light",var_02,param_00.var_2E6);
	lib_A5DE::snd_message("seo_drone_missile_impact",param_00.var_2E6);
}

//Function Number: 308
func_86A8()
{
	common_scripts\utility::flag_wait("flag_drone_intro_pick_path");
	var_00 = getent("vol_cardoor_objective_vol_a","targetname");
	var_01 = getent("vol_cardoor_objective_vol_b","targetname");
	var_02 = getent("vol_cardoor_objective_vol_c","targetname");
	var_03 = undefined;
	if(level.var_31D istouching(var_00))
	{
		var_03 = "snake_swarm_first_flyby_path1";
	}
	else if(level.var_31D istouching(var_01))
	{
		var_03 = "snake_swarm_first_flyby_path2";
	}
	else
	{
		var_03 = "snake_swarm_first_flyby_path3";
	}

	level.var_8696 lib_A5FA::func_8698(var_03,undefined,3.25);
}

//Function Number: 309
func_6806()
{
	var_00 = getent("vol_cardoor_objective_vol_a","targetname");
	var_01 = getent("vol_cardoor_objective_vol_b","targetname");
	var_02 = getent("vol_cardoor_objective_vol_c","targetname");
	if(level.var_31D istouching(var_00))
	{
		return var_00;
	}

	if(level.var_31D istouching(var_01))
	{
		return var_01;
	}

	return var_02;
}

//Function Number: 310
func_827F()
{
	level.var_31D endon("player_has_cardoor");
	var_00 = getentarray("vol_safe_drone_strafe_vol","targetname");
	for(;;)
	{
		level.var_31D waittill("damage",var_01,var_02,var_03,var_04,var_05,var_06,var_07);
		if(var_05 == "MOD_RIFLE_BULLET" || var_05 == "MOD_PROJECTILE_SPLASH")
		{
			foreach(var_09 in var_00)
			{
				if(level.var_31D istouching(var_09))
				{
					level.var_31D.var_275 = 100;
					if(level.var_31D.health + int(var_01 * 0.9) < level.var_31D.var_275)
					{
						level.var_31D.health = level.var_31D.health + int(var_01 * 0.9);
						continue;
					}

					level.var_31D.health = int(level.var_31D.var_275 * 0.9);
				}
			}
		}
	}
}

//Function Number: 311
func_8858()
{
}

//Function Number: 312
func_86B0()
{
	thread func_827F();
	level.var_31D waittill("player_has_cardoor");
	common_scripts\utility::flag_wait("flag_drone_intro_pick_path");
	var_00 = getent("vol_cardoor_objective_vol_a","targetname");
	var_01 = getent("vol_cardoor_objective_vol_b","targetname");
	var_02 = getent("vol_cardoor_objective_vol_c","targetname");
	if(level.var_31D istouching(var_00))
	{
		var_03 = "snake_swarm_cardoor_charge";
	}
	else if(level.var_31D istouching(var_02))
	{
		var_03 = "snake_swarm_cardoor_charge_altpath";
	}
	else
	{
		return;
	}

	common_scripts\utility::flag_set("player_just_grabbed_door");
	level.var_8696 lib_A5FA::func_8698(var_03,undefined,3.25,undefined,1);
	common_scripts\utility::flag_wait("snake_swarm_cardoor_charge_end");
	common_scripts\utility::flag_clear("player_just_grabbed_door");
}

//Function Number: 313
func_86AE()
{
	common_scripts\utility::flag_wait("drones_cleared_building");
	thread func_18A7();
	var_00 = common_scripts\utility::getstructarray("initial_drone_targets","targetname");
	foreach(var_02 in var_00)
	{
		var_02 thread func_83D4(1);
		if(common_scripts\utility::cointoss())
		{
			wait(0.5);
			var_02 thread func_83D4(1);
		}

		if(level.nextgen)
		{
			wait(randomfloat(1));
			continue;
		}

		wait(randomfloatrange(1,2));
	}
}

//Function Number: 314
func_18A7()
{
	var_00 = common_scripts\utility::spawn_tag_origin();
	var_00 thread func_5F06();
	for(var_01 = 0;var_01 < 10;var_01++)
	{
		var_02 = common_scripts\utility::random(level.var_38E5);
		if(isdefined(var_02))
		{
			var_02 thread func_2EBB(var_00);
			continue;
		}

		var_01 = var_01 - 1;
	}
}

//Function Number: 315
func_5F06()
{
	var_00 = common_scripts\utility::getstructarray("struct_drone_swarm_shoot_loc","targetname");
	var_00 = lib_A56F::func_888D(var_00,level.var_31D.var_2E6);
	var_00 = common_scripts\utility::array_reverse(var_00);
	self.var_2E6 = var_00[0].var_2E6;
	foreach(var_02 in var_00)
	{
		var_03 = (var_02.var_2E6[0],level.var_31D.var_2E6[1],var_02.var_2E6[2]);
		self moveto(var_03,1.25);
		wait(1.25);
	}

	wait(1);
	level notify("end_drone_shoot_run");
}

//Function Number: 316
func_2EBB(param_00)
{
	level endon("end_drone_shoot_run");
	while(isdefined(self))
	{
		var_01 = (randomintrange(-150,150),randomintrange(-150,150),0);
		func_2E27(param_00.var_2E6 + var_01);
		wait(randomfloat(0.25));
	}
}

//Function Number: 317
func_869F(param_00)
{
	level.var_31D thread lib_A59A::func_61FA("drone_crash_into_player_now",20);
	level.var_31D common_scripts\utility::waittill_any("player_has_cardoor","drone_crash_into_player_now");
	func_869E(param_00);
}

//Function Number: 318
func_869E(param_00)
{
	level endon("end_crash_into_player");
	level endon("end_drone_snake_processes");
	for(;;)
	{
		foreach(var_02 in level.var_86B4)
		{
			while(isdefined(var_02) && func_86B3(var_02))
			{
				lib_A5F8::func_3997(common_scripts\utility::random(param_00));
				wait(0.5);
			}
		}

		wait 0.05;
	}
}

//Function Number: 319
func_86B3(param_00)
{
	var_01 = level.var_31D geteye();
	var_02 = anglestoforward(level.var_31D method_8036());
	var_03 = var_01 + var_02 * 148;
	if(distance(param_00.var_2E6,var_03) < 96)
	{
		return 1;
	}

	return 0;
}

//Function Number: 320
func_1E81(param_00)
{
	common_scripts\utility::flag_wait(param_00);
	lib_A5FA::func_1E80();
}

//Function Number: 321
func_86A3(param_00)
{
	level endon("player_in_x4walker");
	var_01 = getent("vol_cardoor_objective_vol_a","targetname");
	var_02 = getent("vol_cardoor_objective_vol_b","targetname");
	var_03 = getent("vol_cardoor_objective_vol_c","targetname");
	var_04 = getent("vol_cardoor_objective_vol_a2","targetname");
	var_05 = getent("vol_cardoor_objective_vol_b2","targetname");
	var_06 = getent("vol_cardoor_objective_vol_c2","targetname");
	common_scripts\utility::flag_wait_any("snake_swarm_first_flyby_end","snake_swarm_cardoor_charge_end");
	for(;;)
	{
		if(common_scripts\utility::flag("player_just_grabbed_door"))
		{
			wait 0.05;
		}

		if(lib_A59A::func_C95(var_01))
		{
			param_00 lib_A5FA::func_8698("snake_swarm_first_flyby",undefined,2.25);
			while(lib_A59A::func_C95(var_01))
			{
				wait 0.05;
			}
		}

		if(lib_A59A::func_C95(var_02))
		{
			param_00 lib_A5FA::func_8698("snake_swarm_first_flyby_path2",undefined,2.25);
			while(lib_A59A::func_C95(var_02))
			{
				wait 0.05;
			}
		}

		if(lib_A59A::func_C95(var_03))
		{
			param_00 lib_A5FA::func_8698("snake_swarm_first_flyby_path3",undefined,2.25);
			while(lib_A59A::func_C95(var_03))
			{
				wait 0.05;
			}
		}

		if(lib_A59A::func_C95(var_04))
		{
			param_00 lib_A5FA::func_8698("snake_swarm_follow_player_forward_1",undefined,2.25);
			while(lib_A59A::func_C95(var_04))
			{
				wait 0.05;
			}
		}

		if(lib_A59A::func_C95(var_05))
		{
			param_00 lib_A5FA::func_8698("snake_swarm_follow_player_forward_2",undefined,2.25);
			while(lib_A59A::func_C95(var_05))
			{
				wait 0.05;
			}
		}

		if(lib_A59A::func_C95(var_06))
		{
			param_00 lib_A5FA::func_8698("snake_swarm_follow_player_forward_3",undefined,2.25);
			while(lib_A59A::func_C95(var_06))
			{
				wait 0.05;
			}
		}

		wait 0.05;
	}
}

//Function Number: 322
func_27C0(param_00)
{
	level.var_31D waittill("player_has_cardoor");
	thread lib_A5F8::func_4565(param_00);
	level.var_31D waittill("player_in_x4walker");
	level notify("end_drone_kamikaze_player");
}

//Function Number: 323
func_1956()
{
	var_00 = getent("vol_cardoor_objective_vol_a","targetname");
	var_01 = getent("vol_cardoor_objective_vol_b","targetname");
	var_02 = getent("vol_cardoor_objective_vol_c","targetname");
	if(level.var_31D istouching(var_00))
	{
		var_03 = common_scripts\utility::getstruct("struct_door_ripoff_scene_prompt","targetname");
	}
	else if(level.var_31D istouching(var_02))
	{
		var_03 = common_scripts\utility::getstruct("struct_door_ripoff_scene_prompt_altpath","targetname");
	}
	else
	{
		return;
	}

	var_04 = lib_A571::func_48BB("x",var_03.var_2E6,32);
	common_scripts\utility::flag_set("player_initiated_door_ripoff");
	var_04 lib_A571::func_48B3();
}

//Function Number: 324
func_84ED()
{
	while(distance(level.var_31D.var_2E6,level.var_5D21.var_2E6) > 400)
	{
		wait 0.05;
	}

	lib_A59A::func_2B4E("hint_door_throw",5);
}

//Function Number: 325
func_45DE()
{
	level endon("end_cherry_picker");
	level waittill("player_owns_cardoor_shield");
	level.var_31D notify("donot_show_throw_hint");
	thread func_84ED();
	level.var_31D method_80EF();
	thread func_45DF();
	var_00 = level.var_31D common_scripts\utility::waittill_any_return("car_door_thrown","car_door_broken","death");
	level.var_31D method_80F0();
	thread func_72A1(0.75);
	if(var_00 == "car_door_broken")
	{
		level.var_31D thread func_4531();
	}
}

//Function Number: 326
func_72A1(param_00)
{
	level notify("kill_damage_reduction");
	level endon("kill_damage_reduction");
	level endon("end_cherry_picker");
	for(;;)
	{
		level.var_31D waittill("damage",var_01,var_02,var_03,var_04,var_05,var_06);
		var_07 = level.var_31D getcurrentweapon();
		if(issubstr(var_07,"door"))
		{
			level.var_31D.var_275 = 100;
			if(level.var_31D.health + int(var_01 * param_00) < level.var_31D.var_275)
			{
				level.var_31D.health = level.var_31D.health + int(var_01 * param_00);
				continue;
			}

			level.var_31D.health = int(level.var_31D.var_275 * param_00);
		}
	}
}

//Function Number: 327
func_4531()
{
	var_00 = level.var_31D getcurrentweapon();
	if(!issubstr(var_00,"_door_"))
	{
		return;
	}

	thread func_1B84();
	thread lib_A59A::func_61FA("car_door_hint_timeout",3);
	lib_A59A::func_2B49("car_door_throw");
	common_scripts\utility::waittill_either("car_door_hint_timeout","car_door_thrown");
	self.var_4700 = 1;
}

//Function Number: 328
func_1B84()
{
	if(!isdefined(level.var_31D.var_4700))
	{
		return 0;
	}

	if(level.var_31D.var_4700)
	{
		return 1;
	}
}

//Function Number: 329
func_45DF()
{
	level.var_31D endon("car_door_thrown");
	level endon("end_cherry_picker");
	for(;;)
	{
		while(lib_A50D::func_500D(level.var_31D getcurrentweapon()) || level.var_31D getcurrentweapon() == "none")
		{
			wait 0.05;
		}

		level.var_31D method_80F0();
		while(!lib_A50D::func_500D(level.var_31D getcurrentweapon()))
		{
			wait 0.05;
		}

		level.var_31D method_80EF();
	}
}

//Function Number: 330
func_0C0C()
{
	level.var_A31B endon("force_end_will_grabs_door");
	thread func_45DE();
	var_00 = getent("model_door_grab_suv","targetname");
	var_00.animname = "door_grab_suv";
	var_00 lib_A506::func_7F23();
	var_00 thread lib_A506::func_BC7(var_00,"seo_door_slide_in_suv");
	lib_A56F::func_A0B9("trigger_drone_swarm_flank");
	var_01 = level.var_A31B;
	var_01.var_180 = 0;
	level.var_21DF thread func_21E5();
	level.var_520E thread func_520F();
	common_scripts\utility::flag_wait("snake_swarm_first_flyby_begin");
	var_02 = common_scripts\utility::getstruct("struct_will_grabs_car_door","targetname");
	var_03 = var_02 lib_A506::func_BFF(var_01,"will_door_shield_intro",undefined,1);
	if(common_scripts\utility::flag("will_cardoor_watcher_flag"))
	{
		level.var_A31B lib_A59A::func_7E32("o");
		return;
	}

	var_00 thread lib_A506::func_C24(var_00,"seo_door_slide_in_suv");
	var_02 lib_A506::func_C24(var_01,"will_door_shield_intro");
	level notify("explosion_for_will_grab_scene");
	thread func_592D();
	var_00 thread lib_A506::func_C24(var_00,"seo_door_grab_suv");
	var_01 thread func_705F();
	thread lib_A59A::func_383E("dialogue_drone_swarm_intro_pt2",3);
	var_01 lib_A506::func_C24(var_01,"will_door_shield_grab");
	if(!common_scripts\utility::flag("player_inplace_for_will_door_grab_2") && !common_scripts\utility::flag("player_has_cardoor"))
	{
		var_01 lib_A506::func_C24(var_01,"will_door_shield_twitch");
	}

	if(!common_scripts\utility::flag("player_inplace_for_will_door_grab_2") && !common_scripts\utility::flag("player_has_cardoor"))
	{
		var_01 thread lib_A506::func_BE1(var_01,"will_door_shield_hold_idle");
	}

	var_01 lib_A59A::func_C3D();
	level notify("ready_drone_kamikaze");
	var_04 = getent("brush_car_door_blocker_01","targetname");
	var_04.var_2E6 = var_04.var_2E6 + (0,0,10000);
	var_04 connectpaths();
	var_01 lib_A59A::func_7EA5("seo_door_grab_walk_forward",1);
	var_01.ignoreall = 1;
	var_01 thread func_3E95();
	level waittill("all_drones_in_swarm_dead");
	func_0C0D();
}

//Function Number: 331
func_0C0D()
{
	level.var_A31B.ignoreall = 0;
	if(level.nextgen)
	{
		lib_A59A::delaythread(6,::maps\seoul_lighting::func_2ABC);
	}
}

//Function Number: 332
func_592D()
{
	var_00 = common_scripts\utility::getstruct("struct_will_drone_dodge_explosion","script_noteworthy");
	playfx(common_scripts\utility::getfx("drone_explode"),var_00.var_2E6);
	lib_A5DE::snd_message("seo_will_car_door_explo",var_00.var_2E6);
}

//Function Number: 333
func_21E5()
{
	common_scripts\utility::flag_wait("snake_swarm_first_flyby_begin");
	var_00 = common_scripts\utility::getstruct("struct_cormack_position_3_drone_dodge","targetname");
	var_01 = var_00 lib_A506::func_BFF(self,"swarm_cover_cormack_into",undefined,1);
	if(var_01)
	{
		var_00 lib_A506::func_C24(self,"swarm_cover_cormack_into");
		thread lib_A506::func_BE1(self,"swarm_cover_cormack");
	}
}

//Function Number: 334
func_520F()
{
	common_scripts\utility::flag_wait("snake_swarm_first_flyby_begin");
	var_00 = common_scripts\utility::getstruct("struct_jackson_position_3_drone_dodge","targetname");
	var_01 = var_00 lib_A506::func_BFF(self,"swarm_cover_jackson_into",undefined,1);
	if(var_01)
	{
		var_00 lib_A506::func_C24(self,"swarm_cover_jackson_into");
		lib_A506::func_BE1(self,"swarm_cover_jackson");
	}
}

//Function Number: 335
func_3E95()
{
	level.var_31D endon("player_in_x4walker");
	var_00 = common_scripts\utility::getstruct("struct_will_drop_door_goto_vehicle","targetname");
	var_01 = var_00.animation;
	var_00 lib_A506::func_BFF(self,var_01,undefined,1);
	var_00 lib_A506::func_C24(self,var_01);
	func_7333();
	self method_81A6(self.var_2E6);
	self.var_1C7 = 512;
}

//Function Number: 336
func_7333(param_00)
{
	if(isdefined(self.var_2D3F))
	{
		self.var_2D3F unlink();
	}

	lib_A59A::func_1ED1();
	self.var_2D57 = 1;
	if(isdefined(param_00) && param_00 && isdefined(self.var_2D3F))
	{
		self.var_2D3F delete();
	}
}

//Function Number: 337
func_705F()
{
	level.var_A31B endon("force_end_will_grabs_door");
	level waittill("will_swap_door");
	var_00 = getent("model_door_grab_suv","targetname");
	var_01 = self gettagorigin("tag_weapon_left");
	self.var_2D3F = spawn("script_model",var_01);
	self.var_2D3F.var_41 = self gettagangles("tag_weapon_left");
	self.var_2D3F setmodel("npc_atlas_suv_door_fr");
	var_00 hidepart("front_door_right_jnt");
	self.var_2D3F linkto(self,"tag_weapon_left");
}

//Function Number: 338
func_807D()
{
	lib_A56F::func_A0B9("trigger_hill_event_01");
}

//Function Number: 339
func_4560()
{
	level endon("emp_ready_for_use");
	level endon("stop_hud_overlay_update");
	for(;;)
	{
		var_00 = level common_scripts\utility::waittill_any_return("new_drone_target","drone_target_tracking");
		if(!isdefined(self.var_1D39["overlay1"]))
		{
			break;
		}

		if(var_00 == "new_drone_target")
		{
			self.var_1D39["overlay1"] setshader(level.var_1D32,640,480);
		}
		else
		{
			self.var_1D39["overlay1"] setshader(level.var_1D33,640,480);
		}

		if(isdefined(self.var_1D39["overlay1"]))
		{
			self.var_1D39["overlay1"].alpha = 0.85;
		}
		else
		{
			break;
		}

		var_00 = level common_scripts\utility::waittill_any_return("drone_target_dead","drone_target_tracking_off");
		if(isdefined(self.var_1D39["overlay1"]))
		{
			self.var_1D39["overlay1"] setshader(level.var_1D30,640,480);
			continue;
		}

		break;
	}
}

//Function Number: 340
func_9964()
{
	self endon("death");
	var_00 = 50000;
	var_01 = 60;
	self.var_1D39["overlay1"] = newclienthudelem(self);
	self.var_1D39["overlay1"] setshader(level.var_1D30,640,480);
	self.var_1D39["overlay1"].alignx = "left";
	self.var_1D39["overlay1"].aligny = "top";
	self.var_1D39["overlay1"].x = 0;
	self.var_1D39["overlay1"].y = 0;
	self.var_1D39["overlay1"].horzalign = "fullscreen";
	self.var_1D39["overlay1"].vertalign = "fullscreen";
	self.var_1D39["overlay1"].alpha = 0.5;
	thread func_4560();
	thread func_454F();
	thread func_45FE();
	level waittill("emp_ready_for_use");
	common_scripts\utility::flag_set("dialogue_drone_turret_sequence_emp_2");
	wait 0.05;
	self.var_1D39["overlay1"] setshader(level.var_1D34,640,480);
	self.var_1D39["drone_nums"].label = "EMP ready";
	self.var_1D39["drone_nums"].var_18C = 1.65;
}

//Function Number: 341
func_454F()
{
	level endon("emp_ready_for_use");
	var_00[0] = lib_A56F::func_21A0(11);
	var_00[1] = lib_A56F::func_21A0(96);
	var_00[2] = lib_A56F::func_21A0(236);
	var_01[0] = lib_A56F::func_21A0(226);
	var_01[1] = lib_A56F::func_21A0(208);
	var_01[2] = lib_A56F::func_21A0(146);
	var_02[0] = lib_A56F::func_21A0(233);
	var_02[1] = lib_A56F::func_21A0(21);
	var_02[2] = lib_A56F::func_21A0(21);
	var_03 = (var_01[0],var_01[1],var_01[2]);
	var_04 = (var_02[0],var_02[1],var_02[2]);
	self.var_1D39["drone_nums"] = lib_A56F::func_23D4(-2,0,level.var_38E5.size,self,var_04,var_03,0);
	while(isdefined(self.var_1D39["drone_nums"]))
	{
		self.var_1D39["drone_nums"].label = level.var_38E5.size;
		self.var_1D39["drone_nums"].var_18C = 2;
		wait 0.05;
	}
}

//Function Number: 342
func_45FE()
{
	level.var_31D common_scripts\utility::waittill_any("cherrypicker_exit","missionfailed","death");
	if(isdefined(self.var_1D39["overlay1"]))
	{
		self.var_1D39["overlay1"] destroy();
	}
}

//Function Number: 343
func_4627()
{
	level endon("end_cherry_picker");
	var_00[0] = lib_A56F::func_21A0(11);
	var_00[1] = lib_A56F::func_21A0(96);
	var_00[2] = lib_A56F::func_21A0(236);
	var_01[0] = lib_A56F::func_21A0(226);
	var_01[1] = lib_A56F::func_21A0(208);
	var_01[2] = lib_A56F::func_21A0(146);
	var_02[0] = lib_A56F::func_21A0(233);
	var_02[1] = lib_A56F::func_21A0(21);
	var_02[2] = lib_A56F::func_21A0(21);
	var_03 = (var_01[0],var_01[1],var_01[2]);
	var_04 = (var_02[0],var_02[1],var_02[2]);
	var_05 = "Aquiring Nexus Drones";
	var_06 = "Attack Drones Aquired";
	for(;;)
	{
		level waittill("snake_charge_ended",var_07);
		wait(5);
		if(isdefined(self.var_1D39["target_text"]))
		{
			self.var_1D39["target_text"] destroy();
		}

		wait 0.05;
		self.var_1D39["target_text"] = lib_A56F::func_23D4(0,0,var_05,self,var_03,var_03,0);
		level waittill("snake_charge_initiated");
		self.var_1D39["target_text"] destroy();
		wait 0.05;
		self.var_1D39["target_text"] = lib_A56F::func_23D4(0,0,var_06,self,var_04,var_03,0);
		self.var_1D39["target_text"].var_18C = 1.65;
		self.var_1D39["target_text"].alpha = 0.75;
	}
}

//Function Number: 344
func_0CBF()
{
	level endon("snake_charge_initiated");
	level endon("end_cherry_picker");
	for(;;)
	{
		var_00 = randomint(8);
		for(var_01 = 0;var_01 < var_00;var_01++)
		{
			var_02 = common_scripts\utility::random(level.var_38E5);
			if(isdefined(var_02) && !function_00A3(var_02))
			{
				function_009A(var_02);
				function_009C(var_02,"drone_turret_hud_locking");
				var_02 thread func_7382(randomfloat(0.5));
				level notify("drone_target_tracking");
				wait(0.15);
			}
		}

		wait(randomfloat(0.5));
	}
}

//Function Number: 345
func_7382(param_00)
{
	self endon("death");
	wait(param_00);
	if(isdefined(self) && function_00A3(self))
	{
		function_009B(self);
	}

	level notify("drone_target_tracking_off");
}

//Function Number: 346
func_2571(param_00)
{
	while(!common_scripts\utility::flag("dialogue_drone_turret_sequence_emp_2"))
	{
		foreach(var_02 in param_00)
		{
			if(common_scripts\utility::flag("dialogue_drone_turret_sequence_emp_2"))
			{
				break;
			}

			if(isdefined(var_02))
			{
				var_02.alpha = 0.55;
			}
			else
			{
				return;
			}

			wait(0.01);
			if(isdefined(var_02))
			{
				var_02 fadeovertime(0.75);
				var_02.alpha = 0;
			}
		}
	}

	foreach(var_02 in param_00)
	{
		if(isdefined(var_02))
		{
			var_02.alpha = 0;
		}
	}
}

//Function Number: 347
func_5D8A()
{
	level notify("kill_monitor_drone_hit_process");
	level endon("kill_monitor_drone_hit_process");
	var_00 = level.var_38E5.size;
	for(;;)
	{
		level thread func_61FB("emp_countdown_timeout",1,"drone_swarm_hit");
		level common_scripts\utility::waittill_either("drone_swarm_hit","emp_countdown_timeout");
		level notify("ok_to_decrement_emp_bar",var_00 - level.var_38E5.size);
		var_00 = level.var_38E5.size;
	}
}

//Function Number: 348
func_61FB(param_00,param_01,param_02)
{
	self endon(param_02);
	wait(param_01);
	self notify(param_00);
}

//Function Number: 349
func_456C(param_00)
{
	thread func_5D8A();
	self endon("death");
	var_01 = param_00.size;
	var_02 = param_00[0];
	var_03 = param_00[1];
	thread func_2571(var_03);
	var_04[0] = lib_A56F::func_21A0(7);
	var_04[1] = lib_A56F::func_21A0(7);
	var_04[2] = lib_A56F::func_21A0(245);
	var_05[0] = lib_A56F::func_21A0(226);
	var_05[1] = lib_A56F::func_21A0(208);
	var_05[2] = lib_A56F::func_21A0(146);
	var_06[0] = lib_A56F::func_21A0(233);
	var_06[1] = lib_A56F::func_21A0(21);
	var_06[2] = lib_A56F::func_21A0(21);
	var_07 = int(level.var_38E5.size - level.var_5C22 / var_02.size / 2);
	if(var_07 <= 0)
	{
		var_07 = 1;
	}

	var_08 = 0;
	foreach(var_0D, var_0A in var_02)
	{
		if(!isdefined(var_0A))
		{
			continue;
		}

		for(var_0B = 0;var_0B < var_07;var_0B++)
		{
			level waittill("ok_to_decrement_emp_bar",var_08);
		}

		var_0A.color = (var_06[0],var_06[1],var_06[2]);
		var_0A.alpha = 0.75;
		var_0C = var_02[var_0D - 1];
		if(isdefined(var_0C))
		{
			var_0C.color = (var_05[0],var_05[1],var_05[2]);
		}

		if(!common_scripts\utility::flag("dialogue_drone_turret_sequence_emp_1") && var_0D > var_02.size / 2)
		{
			common_scripts\utility::flag_set("dialogue_drone_turret_sequence_emp_1");
		}
	}

	level notify("emp_ready_for_use");
	foreach(var_0A in var_02)
	{
		wait(0.01);
		if(!isdefined(var_0A))
		{
			continue;
		}

		var_0A.color = (var_04[0],var_04[1],var_04[2]);
		var_0A.alpha = 0.55;
	}

	common_scripts\utility::flag_set("dialogue_drone_turret_sequence_emp_2");
}

//Function Number: 350
func_1C90(param_00,param_01)
{
	param_00.alpha = 0;
}

//Function Number: 351
func_23FC(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08[0] = lib_A56F::func_21A0(226);
	var_08[1] = lib_A56F::func_21A0(208);
	var_08[2] = lib_A56F::func_21A0(146);
	var_09[0] = lib_A56F::func_21A0(233);
	var_09[1] = lib_A56F::func_21A0(21);
	var_09[2] = lib_A56F::func_21A0(21);
	var_0A = [];
	var_0B = [];
	var_0C = param_01 * param_07;
	var_0A[0] = newclienthudelem(self);
	var_0A[0].x = var_0C - 17;
	var_0A[0].y = param_02 + param_06;
	var_0A[0].fontscale = 10;
	var_0A[0].horzalign = "center";
	var_0A[0].vertalign = "top";
	var_0A[0].alpha = 0.55;
	var_0A[0] settext("EMP");
	var_0A[0].var_18C = 1.5;
	for(var_0D = 0;var_0D < param_00;var_0D++)
	{
		var_0E = newclienthudelem(self);
		var_0E.x = var_0C;
		var_0E.y = param_02 - param_05 + param_06 * var_0D;
		var_0E.fontscale = 10;
		var_0E.horzalign = "center";
		var_0E.vertalign = "top";
		var_0E.alpha = 0.25;
		var_0E setshader(param_03,param_04,param_05);
		var_0A[var_0A.size] = var_0E;
		var_0F = newclienthudelem(self);
		var_0F.x = var_0C + param_04 * param_07 + 3 * param_07;
		var_0F.y = param_02 - param_05 + param_06 * var_0D;
		var_0F.fontscale = 10;
		var_0F.horzalign = "center";
		var_0F.vertalign = "top";
		var_0F.alpha = 0;
		var_0F.color = (var_08[0],var_08[1],var_08[2]);
		var_0F setshader(param_03,4,2);
		var_0B[var_0B.size] = var_0F;
	}

	var_10 = [var_0A,var_0B];
	thread func_1EBF(var_0A,"end_cherry_picker");
	thread func_1EBF(var_0B,"end_cherry_picker");
	return var_10;
}

//Function Number: 352
func_1EBF(param_00,param_01)
{
	level waittill(param_01);
	foreach(var_03 in param_00)
	{
		if(isdefined(var_03))
		{
			var_03 destroy();
		}
	}
}

//Function Number: 353
func_1CE5()
{
	level waittill("end_cherry_picker");
	if(isalive(level.var_A117))
	{
		lib_A59A::func_41DA("LEVEL_1A");
	}
}

//Function Number: 354
func_9960()
{
	level waittill("end_cherry_picker");
	foreach(var_01 in self.var_1D39)
	{
		if(!isarray(var_01))
		{
			var_01 destroy();
			continue;
		}

		foreach(var_03 in var_01)
		{
			if(!isarray(var_03))
			{
				var_03 destroy();
				continue;
			}

			foreach(var_05 in var_03)
			{
				if(!isarray(var_05))
				{
					if(isdefined(var_05))
					{
						var_05 destroy();
					}
				}
			}
		}
	}
}

//Function Number: 355
func_5DCD()
{
	level endon("end_cherry_picker");
	for(;;)
	{
		if(level.var_38E5.size > level.var_5C22)
		{
			level notify("drone_swarm_weak_ready_emp");
		}

		level.var_38E5 = common_scripts\utility::array_removeundefined(level.var_38E5);
		wait 0.05;
	}
}

//Function Number: 356
func_1D37()
{
	if(level.var_3000)
	{
		return;
	}

	level.var_31D thread func_9964();
	level.var_31D thread func_9960();
	level.var_31D thread func_9977();
	level.var_31D thread func_994E();
	level.var_31D thread func_5DCD();
	level.var_31D thread func_A10C();
	level.var_31D thread func_7432();
	level.var_31D thread func_5D73();
	level.var_31D thread func_5D72();
	level.var_31D thread func_5D71(self);
	level.var_5D21 thread func_2EEB();
}

//Function Number: 357
func_7432()
{
	level waittill("end_cherry_picker");
	level.var_31D.health = 100;
	level.var_31D.var_275 = 100;
}

//Function Number: 358
func_A10C()
{
}

//Function Number: 359
func_5D8C()
{
	while(level.var_38E5.size > 0)
	{
		wait 0.05;
	}

	common_scripts\utility::flag_set("all_drones_dead");
	level.var_31D notify("all_drones_dead");
}

//Function Number: 360
func_6928()
{
	level endon("EMP_triggered");
}

//Function Number: 361
func_994E()
{
	var_00 = 320;
	var_01 = 340;
	var_02 = 10;
	var_03 = 2;
	var_04 = 1;
	thread func_6929();
	thread func_5D8C();
	level waittill("emp_ready_for_use");
	common_scripts\utility::flag_wait("dialogue_drone_turret_sequence_emp_2");
	thread func_6927();
	thread func_6928();
	level.var_31D func_A0A1();
	self notify("cherrypicker_exit");
	level notify("EMP_triggered");
	level notify("stop_kamikaze_player");
	common_scripts\utility::flag_set("dialogue_drone_turret_sequence_emp_3");
	thread func_3079();
	lib_A5DE::snd_message("seo_swarm_emp_wave");
	level waittill("emp_complete");
	common_scripts\utility::flag_set("seoul_player_can_exit_x4walker");
	common_scripts\utility::flag_set("drone_swarm_complete");
	level.var_31D thread lib_A59A::func_61FA("dismount_vehicle_and_turret",3);
	level.var_5D21 thread lib_A59A::func_61FA("dismount_vehicle_and_turret",3);
	common_scripts\utility::flag_waitopen("player_in_x4walker");
	level.var_5D21 notify("disable_mobile_turret");
	level.var_5D21 thread lib_A646::func_5927();
	level.var_5D21 thread lib_A646::func_1E5A();
	level.var_5FDA = common_scripts\utility::array_removeundefined(level.var_5FDA);
	common_scripts\utility::array_call(level.var_5FDA,::delete);
}

//Function Number: 362
func_6929()
{
	var_00 = 0;
	var_01 = 0;
	var_02 = 0;
	var_03 = 0;
	level waittill("drone_swarm_hit");
	for(var_04 = 0;var_04 < 3;var_04++)
	{
		lib_A571::func_6A19("seoul_turret_loading_loop","screen_add",var_00,var_01,var_02,var_03,0);
	}

	thread lib_A59A::func_383E("dialogue_drone_turret_sequence_emp_1",8);
	lib_A571::func_6A19("seoul_turret_reboot","screen_add",var_00,var_01,var_02,var_03,0);
	thread lib_A571::func_6A19("seoul_turret_emp_ready","screen_add",var_00,var_01,var_02,var_03,0);
	level notify("emp_ready_for_use");
	level waittill("EMP_triggered");
	lib_A571::func_8ECD();
}

//Function Number: 363
func_A0A1()
{
	self endon("all_drones_dead");
	thread lib_A59A::func_2B49("press_a_for_emp",undefined,undefined,undefined,30);
	common_scripts\utility::waittill_any("a_pressed","all_drones_dead");
	self.var_4709 = 1;
}

//Function Number: 364
func_3074()
{
	if(level.var_5CDB)
	{
		return 1;
	}

	if(common_scripts\utility::flag("all_drones_dead"))
	{
		return 1;
	}

	if(!isdefined(level.var_31D.var_4709))
	{
		return 0;
	}

	if(level.var_31D.var_4709)
	{
		return 1;
	}
}

//Function Number: 365
func_6927()
{
}

//Function Number: 366
func_3079()
{
	playfx(common_scripts\utility::getfx("seo_mobile_turret_emp"),level.var_5D21.var_2E6);
	lib_A5DE::snd_message("emp_grenade_detonate");
	thread func_28C1();
	thread func_456D();
	thread func_5D90();
	foreach(var_01 in level.var_8696.var_86B4)
	{
		var_01 thread func_3075();
	}

	level notify("all_drones_in_swarm_dead");
	level notify("end_cherry_picker");
}

//Function Number: 367
func_456D()
{
	while(common_scripts\utility::flag("player_in_x4walker"))
	{
		if(!isdefined(level.var_899D) || level.var_899D.size <= 0)
		{
			return;
		}

		foreach(var_01 in level.var_899D)
		{
			if(isdefined(var_01))
			{
				var_01 veh_setspeedimmediate(0,5,5);
				var_01 lib_A5FA::func_93F6(0,1,0,1);
			}
		}

		wait(0.25);
	}
}

//Function Number: 368
func_5319()
{
	if(!isdefined(level.var_899D))
	{
		return;
	}

	foreach(var_01 in level.var_899D)
	{
		if(isdefined(var_01))
		{
			var_01 lib_A5FA::func_93F6(0,1,0,1);
		}
	}
}

//Function Number: 369
func_3075()
{
	level notify("stop_kamikaze_player");
	var_00 = 1760;
	wait(distance(self.var_38E4.var_7082.var_2E6,level.var_31D.var_2E6) / var_00);
	level.var_8696 lib_A5FA::func_869C();
	lib_A5FA::func_86AB(level.var_1523["frozen_snake"]);
	wait(1.5);
	lib_A5FA::func_86AB(level.var_1523["emp_snake"]);
	lib_A5DE::snd_message("seo_swarm_die",self.var_2E6);
	level notify("emp_complete");
	wait(5);
	lib_A5FA::func_1E7F();
}

//Function Number: 370
func_5D90()
{
	var_00 = level.var_5D21.var_2E6[2];
	foreach(var_02 in level.var_38E5)
	{
		var_02 thread func_3523(var_00);
	}
}

//Function Number: 371
func_3523(param_00)
{
	while(isdefined(self))
	{
		if(self.var_2E6[2] < param_00)
		{
			lib_A5FA::func_93F6(0,1,0);
			break;
		}

		wait 0.05;
	}
}

//Function Number: 372
func_28C1(param_00,param_01,param_02,param_03)
{
	level.var_2EE7 = 1;
	var_04 = [];
	for(var_05 = 0;var_05 < 75;var_05++)
	{
		var_04[var_04.size] = common_scripts\utility::random(level.var_38E5);
		if(lib_A56F::func_67C3(10))
		{
			wait 0.05;
		}
	}

	param_03 = 1760;
	param_02 = level.var_31D.var_2E6;
	var_04 = lib_A56F::func_888D(var_04,param_02);
	var_06 = param_02;
	foreach(var_08 in var_04)
	{
		if(!isdefined(var_08))
		{
			continue;
		}

		if(var_08 lib_A59E::func_51FA())
		{
			continue;
		}

		var_09 = distance(var_06,var_08.var_2E6);
		var_0A = var_09 / param_03 * 0.05;
		wait(var_0A);
		if(!isdefined(var_08))
		{
			continue;
		}

		var_06 = var_08.var_2E6;
		var_0B = vectornormalize(var_08.var_2E6 - param_02);
		var_0B = vectornormalize(var_0B + (0,0,0.2));
		if(lib_A56F::func_67C3(50))
		{
			var_08 lib_A5FA::func_93F6(0,1,0);
			continue;
		}

		playfx(common_scripts\utility::getfx("drone_death_cheap"),var_08.var_2E6);
	}
}

//Function Number: 373
func_9977()
{
}

//Function Number: 374
func_2EEB()
{
	var_00 = self;
	foreach(var_02 in level.var_38E5)
	{
		var_02 thread lib_A5FA::func_5D86(1);
		wait(0.05);
	}
}

//Function Number: 375
func_5D71(param_00)
{
	level waittill("end_cherry_picker");
}

//Function Number: 376
func_5D72()
{
	self endon("cherry_picker_deactivate");
	var_00 = 0;
	for(;;)
	{
		if(level.var_31D fragbuttonpressed())
		{
			var_00 = 1;
		}
		else if(level.var_31D secondaryoffhandbuttonpressed())
		{
			var_00 = -1;
		}
		else
		{
			var_00 = 0;
		}

		level.var_31D.var_1D2E["z_change"] = (0,0,var_00);
		wait(0.05);
	}
}

//Function Number: 377
func_5D73()
{
	self endon("cherry_picker_deactivate");
	for(;;)
	{
		var_00 = self getnormalizedmovement();
		var_00 = (var_00[0],var_00[1] * -1,0);
		var_01 = self.var_41;
		var_02 = vectortoangles(var_00);
		var_03 = common_scripts\utility::flat_angle(combineangles(var_01,var_02));
		var_04 = anglestoforward(var_03) * length(var_00);
		self.var_1D2E["stick_input_move"] = var_04;
		wait(0.05);
	}
}

//Function Number: 378
func_88C5()
{
	lib_A56F::func_A0B9("start_pod_landings");
}

//Function Number: 379
func_8244()
{
	lib_A56F::func_A0B9("start_pod_landings");
	var_00 = getentarray("model_droppod_exterior_group1","targetname");
	common_scripts\utility::array_thread(var_00,::func_54A1);
	thread func_88DD();
	lib_A56F::func_A0B9("start_pod_landings_group_2");
	var_00 = getentarray("model_droppod_exterior_group2","targetname");
	common_scripts\utility::array_thread(var_00,::func_54A1);
}

//Function Number: 380
func_88DD()
{
	wait(4);
	var_00 = getentarray("model_droppod_exterior_bad_group","targetname");
	foreach(var_02 in var_00)
	{
		var_02 thread func_54A0();
		wait(1.4);
	}
}

//Function Number: 381
func_54A0()
{
	if(!isdefined(self.target))
	{
		thread func_54A1();
	}

	var_00 = common_scripts\utility::getstruct(self.target,"targetname");
	var_01 = common_scripts\utility::getstruct(var_00.target,"targetname");
	var_02 = randomintrange(1000,1500);
	lib_A56F::func_56A8(var_00.var_2E6,var_02);
	var_03 = randomfloatrange(2,4.5);
	thread lib_A56F::func_43CB(self.var_2E6,var_01.var_2E6,var_03,800,800);
	thread func_235A();
	self waittill("item_landed");
	func_531D(700);
	wait(0.05);
	self delete();
}

//Function Number: 382
func_531D(param_00)
{
	var_01 = function_00D6();
	var_02 = lib_A59A::func_4150();
	thread lib_A56F::func_4BFB(var_01,param_00,self.var_2E6 - (0,0,100));
	foreach(var_04 in var_02)
	{
		if(distance(self.var_2E6,var_04.var_2E6) < param_00)
		{
			var_04 dodamage(self.health * 5,self.var_2E6);
			var_04 notify("im_killed");
		}
	}

	if(distance(self.var_2E6,level.var_31D.var_2E6) < param_00)
	{
		level.var_31D dodamage(self.health / 2,self.var_2E6);
	}
}

//Function Number: 383
func_235A()
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

//Function Number: 384
func_54A1(param_00)
{
	self endon("death");
	thread func_6E06();
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	self.var_63B2 = self.var_2E6;
	self.var_6391 = self.var_41;
	self.var_2E6 = self.var_2E6 + (0,1000,5000);
	var_01 = randomintrange(1000,1500);
	var_02 = (0,0,0);
	var_03 = 6;
	if(!param_00)
	{
		wait(randomfloat(5));
	}

	self notify("begin_entry_trajectory");
	lib_A56F::func_56A8(self.var_63B2 + (0,0,randomfloatrange(400,600)),var_01);
	self notify("begin_landing");
	var_04 = randomint(1000);
	for(;;)
	{
		var_05 = (function_00FE(gettime() * 0.001 * 0.05,var_04,5,2,3) / 2,function_00FE(gettime() * 0.001 * 0.05,var_04,5,2,3) / 2,function_00FE(gettime() * 0.001 * 0.05,var_04,5,2,3) / 2);
		var_06 = (function_00FE(gettime() * 0.001 * 0.05,var_04,2,2,2),function_00FE(gettime() * 0.001 * 0.05,var_04,2,2,2),function_00FE(gettime() * 0.001 * 0.05,var_04,2,2,2));
		if(self.var_2E6[2] > self.var_63B2[2] + 50)
		{
			self.var_2E6 = self.var_2E6 + var_05;
			self.var_2E6 = self.var_2E6 - (0,0,int(self.var_2E6[2] - self.var_63B2[2] / 20));
			var_07 = 0;
			if(self.var_41[0] + var_05[0] < self.var_6391[0] + var_03 && self.var_41[0] + var_05[0] > self.var_6391[0] - var_03)
			{
				var_07 = var_06[0];
			}

			var_08 = 0;
			if(self.var_41[1] + var_05[1] < self.var_6391[1] + var_03 && self.var_41[1] + var_05[0] > self.var_6391[1] - var_03)
			{
				var_08 = var_06[1];
			}

			var_09 = 0;
			if(self.var_41[2] + var_05[2] < self.var_6391[2] + var_03 && self.var_41[2] + var_05[2] > self.var_6391[2] - var_03)
			{
				var_09 = var_06[2];
			}

			self.var_41 = self.var_41 + (var_07,var_08,var_09);
		}
		else if(self.var_2E6[2] > self.var_63B2[2])
		{
			self.var_41 = self.var_6391;
			self.var_2E6 = self.var_2E6 - (0,0,1);
		}
		else
		{
			self notify("pod_landed");
			break;
		}

		wait(0.05);
	}
}

//Function Number: 385
func_6E06()
{
	self endon("pod_landed");
	self endon("death");
	self waittill("begin_landing");
	thread lib_A56F::func_7E14("pod_landed");
}

//Function Number: 386
func_5930(param_00,param_01)
{
	var_02 = spawn("script_model",param_00.var_2E6);
	var_02 setmodel("mil_drop_pod_seat_cpt");
	var_02.animname = param_01;
	var_02 lib_A506::func_7F23();
	return var_02;
}

//Function Number: 387
func_5931(param_00,param_01)
{
	var_02 = spawn("script_model",param_00.var_2E6);
	var_02 setmodel("mil_drop_pod_seat");
	var_02.animname = param_01;
	var_02 lib_A506::func_7F23();
	return var_02;
}

//Function Number: 388
func_5932(param_00,param_01)
{
	var_02 = spawn("script_model",param_00.var_2E6);
	var_02 setmodel("mil_drop_pod_seat_rack");
	var_02.animname = param_01;
	var_02 lib_A506::func_7F23();
	return var_02;
}

//Function Number: 389
func_591B(param_00,param_01)
{
	var_02 = spawn("script_model",param_00.var_2E6);
	var_02 setmodel("vehicle_mil_drop_pod");
	var_02.animname = param_01;
	var_02 lib_A506::func_7F23();
	return var_02;
}

//Function Number: 390
func_591A(param_00,param_01)
{
	var_02 = spawn("script_model",param_00.var_2E6);
	var_02 setmodel("projectile_javelin_missile");
	var_02.animname = param_01;
	var_02 lib_A506::func_7F23();
	return var_02;
}

//Function Number: 391
func_45F7(param_00)
{
	level waittill("pod_swap_pod");
	param_00 setmodel("vehicle_mil_drop_pod");
}

//Function Number: 392
func_45E4()
{
	for(;;)
	{
		level waittill("droppod_fov_change_start");
		lib_A59A::func_5686(1,90);
		level waittill("droppod_fov_change_end");
		lib_A59A::func_5686(1,65);
	}
}

//Function Number: 393
func_45F3(param_00)
{
	param_00 hidepart("emergencyShield_dam_F");
	level waittill("pod_deform");
	param_00 hidepart("emergencyShield_F");
	param_00 showpart("emergencyShield_dam_F");
}

//Function Number: 394
func_4597()
{
	var_00 = getentarray("start_building_ext_hide","targetname");
	level waittill("building_2_crash");
	lib_A59A::func_CE5(var_00);
}

//Function Number: 395
func_69BD()
{
	function_00D3("cg_cinematicfullscreen","1");
	level.var_31D disableweapons();
	level.var_31D freezecontrols(1);
	thread lib_A571::func_68AA("chyron_text_seoul",1,2);
	common_scripts\utility::flag_wait("chyron_video_done");
	level notify("intro_movie_done");
}

//Function Number: 396
func_84BE(param_00,param_01)
{
	wait(14);
	param_00.var_2E6 = param_00.var_63D9;
	param_01.var_2E6 = param_01.var_63D9;
}

//Function Number: 397
func_4529(param_00,param_01)
{
	level.var_31D waittill("start_droppod_qte");
	thread lib_A571::func_48B6("emergencyhandle","x","end_process_buttonmash",(5,5,5));
}

//Function Number: 398
func_6E0F()
{
	level endon("end_rumble_listener");
	while(!common_scripts\utility::flag("end_rumble_listener"))
	{
		var_00 = level common_scripts\utility::waittill_any_return("droppod_rumble","droppod_rumble_start","droppod_rumble_end","heavy_rumble","manual_heavy_rumble_start","manual_heavy_rumble_end");
		if(var_00 == "droppod_rumble")
		{
			level.var_31D playrumbleonentity("damage_light");
			continue;
		}

		if(var_00 == "droppod_rumble_start")
		{
			thread func_2BB7("droppod_rumble_end","damage_light");
			continue;
		}

		if(var_00 == "heavy_rumble")
		{
			level.var_31D playrumbleonentity("damage_heavy");
			continue;
		}

		if(var_00 == "manual_heavy_rumble_start")
		{
			thread func_2BB7("manual_heavy_rumble_end","damage_heavy");
		}
	}
}

//Function Number: 399
func_2BB7(param_00,param_01)
{
	level endon(param_00);
	level endon("end_rumble_listener");
	while(!common_scripts\utility::flag("end_rumble_listener"))
	{
		level.var_31D playrumbleonentity(param_01);
		wait(0.1);
	}
}

//Function Number: 400
func_8262()
{
	if(common_scripts\utility::flag("ok_to_land_assist"))
	{
		common_scripts\utility::flag_clear("ok_to_land_assist");
	}

	lib_A561::func_6AFB();
	thread func_69BD();
	level waittill("intro_movie_done");
	thread maps\seoul_drop_pod_credits::func_2455();
	common_scripts\utility::flag_set("set_pre_seoul_intro_lighting");
	lib_A59A::func_9E65("seoul_pre_space_entry_nofog",0);
	level.var_31D method_83C0("seoul_intro");
	level.var_31D method_8490("clut_seoul_pod",0);
	thread maps\seoul_lighting::func_4F73();
	thread maps\seoul_lighting::func_2C58();
	thread maps\seoul_lighting::func_2C59();
	thread func_6E0F();
	common_scripts\utility::flag_set("vfx_seoul_intro_start");
	function_00D3("g_friendlynamedist",0);
	thread func_4597();
	thread maps\seoul_code_drop_pod::func_45F9("portal_group_vista_on");
	lib_A59A::func_6C1D(75);
	var_00 = getent("pod_reflection","targetname");
	var_01 = getent("brush_seoul_city_view","targetname");
	var_02 = getent("brush_seoul_city_view_ems","targetname");
	if(level.currentgen)
	{
		var_02 hide();
	}

	var_01.var_63D9 = var_01.var_2E6;
	var_02.var_63D9 = var_02.var_2E6;
	if(level.nextgen)
	{
		var_01.var_2E6 = var_01.var_2E6 + (900000,0,0);
		var_02.var_2E6 = var_02.var_2E6 + (900000,0,0);
	}

	common_scripts\utility::flag_set("dialogue_droppod_prelaunch");
	var_03 = common_scripts\utility::getstructarray("struct_pod_exit","targetname");
	var_04 = common_scripts\utility::getstruct("struct_anim_node_space_skybox","targetname");
	var_05 = var_03[0] common_scripts\utility::spawn_tag_origin();
	var_06 = var_04 common_scripts\utility::spawn_tag_origin();
	var_07 = spawn("script_model",var_05.var_2E6);
	var_07 setmodel("vehicle_mil_drop_pod_intro");
	level.var_6E10 = spawn("script_model",var_07 gettagorigin("body_T"));
	level.var_6E10 setmodel("vehicle_mil_drop_pod_screens");
	level.var_6E10.targetname = "drop_pod_glass_idle";
	level.var_6E10 linkto(var_07,"body_T",(0,0,0),(0,0,0));
	level.var_6E10.var_90C7 = "TAG_SCREEN_JOINT_OFF";
	level.var_6E10.var_90C8 = "TAG_SCREEN_JOINT_ON";
	level.var_6E10.var_90C6 = "TAG_SCREEN_JOINT_LOAD";
	level.var_6E10.var_9E04 = 1;
	level.var_6E10.var_9E03 = 1;
	level.var_6E10.var_9E02 = 0;
	level.var_6E10.var_9E05 = 0;
	level.var_6E10.var_39FE = 0;
	level.var_6E10.var_39F7 = 0;
	level.var_3323 = getent("drop_pod_entrance_room","targetname");
	level.var_3323 linkto(var_07,"body_T",(0,0,-50),(0,115,0));
	var_07.animname = "droppod";
	var_07 lib_A506::func_7F23();
	thread maps\seoul_code_drop_pod::func_4566();
	thread maps\seoul_code_drop_pod::func_45F6(var_07);
	thread maps\seoul_code_drop_pod::func_45F5(var_07);
	thread maps\seoul_code_drop_pod::func_45F4(var_07);
	thread maps\seoul_code_drop_pod::func_45F2();
	thread func_45F7(var_07);
	thread func_45E4();
	thread func_45F3(var_07);
	var_08[0] = func_5930(var_05,"pod_seat_c");
	var_08[1] = func_5931(var_05,"pod_seat_w");
	var_08[2] = func_5931(var_05,"pod_seat_j");
	var_08[3] = func_5931(var_05,"pod_seat_p");
	var_08[4] = func_5932(var_05,"pod_seat_1");
	var_08[5] = func_5932(var_05,"pod_seat_2");
	var_08[6] = func_5932(var_05,"pod_seat_3");
	var_08[0] thread func_4529();
	var_09[0] = func_591A(var_05,"pod_missile_1");
	var_09[1] = func_591A(var_05,"pod_missile_2");
	var_09[2] = func_591A(var_05,"pod_missile_3");
	var_09[3] = func_591A(var_05,"pod_missile_4");
	var_09[4] = func_591A(var_05,"pod_missile_5");
	var_09[5] = func_591A(var_05,"pod_missile_6");
	var_09[6] = func_591A(var_05,"pod_missile_final");
	var_0A = level.var_31D func_3C94(var_05,"pod_phase2b",1);
	var_0B = var_08[0];
	var_0C = [level.var_21F6,level.var_A31C,level.var_5210,var_07,var_0A];
	var_0C = common_scripts\utility::array_combine(var_0C,var_08);
	var_0D = [level.var_21DF,level.var_A31B,level.var_520E,var_07,var_0A];
	var_0E = level.var_A31B.var_2E6;
	var_0F = getent("pod_origin","targetname");
	var_07 method_847B(var_0F.var_2E6);
	thread maps\seoul_lighting::func_6E0B(var_07);
	thread maps\seoul_lighting::func_6E0C(var_07);
	waittillframeend;
	level.var_21F6 lib_A59A::func_445F();
	level.var_A31C lib_A59A::func_445F();
	level.var_5210 lib_A59A::func_445F();
	level.var_A31B lib_A59A::func_445F();
	var_10 = [level.var_21F6,level.var_A31B,level.var_5210,var_07,var_0A];
	var_10 = common_scripts\utility::array_combine(var_10,var_08);
	thread maps\seoul_lighting::func_72B0(var_10,var_00,var_07,var_0A);
	thread lib_A541::func_4F8E(0.05,1);
	wait(0.25);
	level.var_6E10 method_83AB(var_00.var_2E6);
	var_06 lib_A506::func_BC5(var_10,"pod_phase1a");
	foreach(var_12 in var_10)
	{
		var_12 dontinterpolate();
	}

	level.var_31D setorigin(level.var_31D.var_2E6,1);
	level.var_6E10 dontinterpolate();
	lib_A5DE::snd_message("pod_phase1a_start");
	var_06 lib_A506::func_C18(var_10,"pod_phase1a");
	if(level.nextgen)
	{
		thread func_84BE(var_02,var_01);
	}

	level notify("swap_wills");
	var_10 = common_scripts\utility::array_remove(var_10,level.var_A31B);
	var_10 = common_scripts\utility::array_add(var_10,level.var_A31C);
	thread maps\seoul_lighting::func_72B0(var_10,var_00,var_07,var_0A);
	var_14[0] = func_591B(var_05,"droppod1");
	var_14[1] = func_591B(var_05,"droppod2");
	var_14[2] = func_591B(var_05,"droppod3");
	var_14[3] = func_591B(var_05,"droppod4");
	var_14[4] = func_591B(var_05,"droppod5");
	var_14[5] = func_591B(var_05,"droppod6");
	var_15[0] = lib_A59A::func_88CB("blimp");
	var_15[1] = lib_A59A::func_88CB("blimp_main_01");
	var_15[2] = lib_A59A::func_88CB("blimp_main_02");
	var_15[3] = lib_A59A::func_88CB("blimp_main_03");
	var_15[4] = lib_A59A::func_88CB("blimp_main_04");
	var_16 = lib_A59A::func_88CB("pod_missile_blimp");
	var_17[0] = func_591B(var_05,"droppod8");
	var_17[1] = func_591B(var_05,"droppod9");
	var_17[2] = func_591B(var_05,"droppod10");
	var_18 = common_scripts\utility::array_combine(var_10,var_14);
	var_18 = common_scripts\utility::array_combine(var_18,var_15);
	var_18 = common_scripts\utility::array_combine(var_18,var_17);
	var_18 = common_scripts\utility::array_combine(var_18,[var_16]);
	foreach(var_12 in var_18)
	{
		var_12 dontinterpolate();
	}

	level.var_31D setorigin(level.var_31D.var_2E6,1);
	level.var_6E10 dontinterpolate();
	level.var_A31B hide();
	level.var_A31B method_81C6(var_0E,level.var_A31B.var_41);
	thread lib_A59A::func_383E("dialogue_droppod_intro_phase_2b_2",8);
	var_06 lib_A506::func_C18(var_18,"pod_phase1b");
	level.var_A31B lib_A59A::func_445E();
	level.var_A31B show();
	common_scripts\utility::array_call(var_17,::delete);
	common_scripts\utility::array_call(var_15,::delete);
	var_16 delete();
	common_scripts\utility::flag_set("dialogue_droppod_intro_phase_2b");
	common_scripts\utility::flag_set("vfx_start_drop_pod_intro_phase_2b");
	level.var_6E10 method_83AB(var_00.var_2E6);
	common_scripts\utility::flag_clear("set_pre_seoul_intro_lighting");
	common_scripts\utility::flag_set("set_seoul_intro_lighting");
	level thread lib_A5CE::func_4F11(var_14);
	var_0C = common_scripts\utility::array_combine(var_0C,var_14);
	var_0C = common_scripts\utility::array_combine(var_0C,var_09);
	lib_A5DE::snd_message("droppod_phase_2b_begin");
	var_06 lib_A506::func_BC5(var_0C,"pod_phase2b");
	foreach(var_12 in var_0C)
	{
		var_12 dontinterpolate();
	}

	level.var_31D setorigin(level.var_31D.var_2E6,1);
	level.var_6E10 dontinterpolate();
	var_06 lib_A506::func_C18(var_0C,"pod_phase2b");
	level notify("autosave_request");
	common_scripts\utility::flag_set("dialogue_droppod_intro_phase_3");
	var_06 lib_A506::func_BC5(var_10,"pod_phase3");
	var_1D = var_06 maps\seoul_drop_pod_qte::func_C19(var_10,var_0A,"pod_phase3");
	if(var_1D == 0)
	{
		var_1E = [var_08[1],var_08[2],level.var_A31C];
		var_1F = common_scripts\utility::array_remove_array(var_10,var_1E);
		lib_A506::func_C11(var_10,"pod_phase3",0);
		var_06 lib_A506::func_BC5(var_1F,"pod_phase3_fail");
		foreach(var_12 in var_1F)
		{
			var_12 dontinterpolate();
		}

		level.var_31D setorigin(level.var_31D.var_2E6,1);
		level.var_6E10 dontinterpolate();
		var_06 thread lib_A506::func_C18(var_1F,"pod_phase3_fail");
		level.var_31D playersetgroundreferenceent(var_0A);
		level.var_31D playersetgroundreferenceent(undefined);
		setdvar("ui_deadquote",&"SEOUL_FAILED_TO_SAVE_JACKSON");
		lib_A59A::func_5CDC();
		var_22 = function_0063(level.var_5210 lib_A59A::func_3EF3("pod_phase3_fail"));
		wait(var_22 - 0.05);
		lib_A506::func_C13(var_1F,"pod_phase3_fail",0);
		level.var_31D freezecontrols(1);
		wait(1000);
	}

	var_05 lib_A506::func_BC5(var_10,"pod_phase4a_intro");
	foreach(var_12 in var_10)
	{
		var_12 dontinterpolate();
	}

	level.var_31D setorigin(level.var_31D.var_2E6,1);
	level.var_6E10 dontinterpolate();
	var_05 lib_A506::func_C18(var_10,"pod_phase4a_intro");
	common_scripts\utility::flag_set("dialogue_droppod_intro_phase_4a");
	level notify("manual_heavy_rumble_start");
	var_05 lib_A506::func_BC5(var_10,"pod_phase4a");
	foreach(var_12 in var_10)
	{
		var_12 dontinterpolate();
	}

	level.var_31D setorigin(level.var_31D.var_2E6,1);
	level.var_6E10 dontinterpolate();
	lib_A5DE::snd_message("droppod_first_building_impact");
	var_05 lib_A506::func_C18(var_10,"pod_phase4a");
	level notify("manual_heavy_rumble_end");
	var_05 lib_A506::func_BC5(var_10,"pod_phase4b");
	foreach(var_12 in var_10)
	{
		var_12 dontinterpolate();
	}

	level.var_31D setorigin(level.var_31D.var_2E6,1);
	level.var_6E10 dontinterpolate();
	level thread lib_A59A::func_61FA("manual_heavy_rumble_start",3);
	level thread lib_A59A::func_61FA("manual_heavy_rumble_end",4);
	var_05 lib_A506::func_C18(var_10,"pod_phase4b");
	var_10 = [level.var_21F6,level.var_A31C,level.var_5210,var_07,var_0A];
	var_10 = common_scripts\utility::array_combine(var_10,var_08);
	foreach(var_12 in var_10)
	{
		var_12 dontinterpolate();
	}

	level.var_31D setorigin(level.var_31D.var_2E6,1);
	level.var_6E10 dontinterpolate();
	lib_A5DE::snd_message("droppod_final_impact");
	common_scripts\utility::flag_set("spawn_regular_heroes");
	thread maps\seoul_lighting::func_72B1(var_10);
	thread lib_A59A::func_3830("pause_credits",3);
	var_2B = common_scripts\utility::array_remove(var_10,var_0A);
	var_2B = common_scripts\utility::array_remove(var_2B,var_08[3]);
	var_05 func_692A(var_0A,var_08[3],var_2B);
	level notify("dialogue_hotel_pod_exit_begin");
	level thread lib_A59A::func_61FA("heavy_rumble",1);
	level thread lib_A59A::func_61FA("heavy_rumble",2.25);
	level thread lib_A59A::func_61FA("heavy_rumble",20.75);
	var_2C = [level.var_21F6,level.var_A31C,level.var_5210];
	var_10 = common_scripts\utility::array_remove_array(var_10,var_2C);
	common_scripts\utility::array_call(var_2C,::delete);
	var_10 = [level.var_21DF,level.var_A31B,level.var_520E,var_07,var_0A];
	var_10 = common_scripts\utility::array_combine(var_10,var_08);
	thread maps\seoul_lighting::func_72B2(var_10);
	var_05 lib_A506::func_C18(var_10,"pod_exit");
	level notify("droppod_begin_fall");
	lib_A561::func_6AF5();
	level.var_31D func_3CA0(var_0A);
	level notify("droppod_empty");
	level notify("autosave_request");
	level notify("vfx_player_control_after_pod_landed");
	level.var_31D notify("disable_player_boost_jump");
	common_scripts\utility::flag_set("ok_to_land_assist");
	common_scripts\utility::flag_set("objective_start");
	thread lib_A59A::func_114E();
	if(level.currentgen)
	{
		thread maps\seoul_transients_cg::func_1C22(var_07,"pre_transients_intro_to_fob");
	}

	var_10 = common_scripts\utility::array_remove(var_10,var_07);
	var_10 = common_scripts\utility::array_remove(var_10,var_0A);
	foreach(var_2E in var_08)
	{
		var_10 = common_scripts\utility::array_remove(var_10,var_2E);
	}

	foreach(var_12 in var_10)
	{
		var_12.var_926C = var_05 common_scripts\utility::spawn_tag_origin();
		var_12.var_926C thread lib_A506::func_BE1(var_12,"pod_exit_idle");
	}

	level notify("autosave_request");
	level waittill("begin_building_traversal");
	level.var_21DF lib_A56F::func_C3C(level.var_21DF.var_926C);
	var_05 thread lib_A506::func_C29(level.var_21DF,"pod_exit_outro");
	level.var_21DF.var_926C delete();
	level.var_A31B lib_A56F::func_C3C(level.var_A31B.var_926C);
	var_05 thread lib_A506::func_C29(level.var_A31B,"pod_exit_outro");
	level.var_A31B.var_926C delete();
	wait(0.5);
	level.var_520E lib_A56F::func_C3C(level.var_520E.var_926C);
	var_05 thread lib_A506::func_C29(level.var_520E,"pod_exit_outro");
	level.var_520E.var_926C delete();
	function_00D3("g_friendlynamedist",1024);
}

//Function Number: 401
func_0C5C(param_00)
{
	var_01 = undefined;
	var_02 = "pod_seat_c";
	foreach(var_04 in param_00)
	{
		if(isdefined(var_04.animname) && var_04.animname == var_02)
		{
			var_01 = var_04;
		}
	}

	var_06 = common_scripts\utility::getstruct("struct_anim_node_space_skybox","targetname");
	var_07 = var_06 common_scripts\utility::spawn_tag_origin();
	param_00 = common_scripts\utility::array_remove_array(param_00,[level.var_A31C,level.var_21F6]);
	param_00 = common_scripts\utility::array_remove(param_00,var_01);
	var_07 lib_A506::func_BC5(param_00,"pod_wakeup");
	foreach(var_09 in param_00)
	{
		var_09 dontinterpolate();
	}

	level.var_6E10 dontinterpolate();
	thread lib_A506::func_C18(param_00,"pod_wakeup");
	lib_A506::func_C18([level.var_A31C,level.var_21F6,var_01],"pod_wakeup");
	param_00 = common_scripts\utility::array_add(param_00,level.var_21F6);
	param_00 = common_scripts\utility::array_add(param_00,level.var_A31C);
	param_00 = common_scripts\utility::array_add(param_00,var_01);
	level.var_31D setorigin(level.var_31D.var_2E6,1);
	lib_A506::func_BDD(param_00,"pod_wakeup_idle");
}

//Function Number: 402
func_73FB(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_01))
	{
		self endon(param_01);
	}

	if(isdefined(param_02))
	{
		self endon(param_02);
	}

	if(isdefined(param_03))
	{
		self endon(param_03);
	}

	if(isdefined(param_04))
	{
		self endon(param_04);
	}

	for(;;)
	{
		thread lib_A59A::func_48F6(param_00,5);
		wait(15);
	}
}

//Function Number: 403
func_73FC(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_01))
	{
		self endon(param_01);
	}

	if(isdefined(param_02))
	{
		self endon(param_02);
	}

	if(isdefined(param_03))
	{
		self endon(param_03);
	}

	if(isdefined(param_04))
	{
		self endon(param_04);
	}

	for(;;)
	{
		thread lib_A59A::func_2B49(param_00);
		wait(15);
	}
}

//Function Number: 404
func_A0A6(param_00)
{
	var_01 = "end_trigger_watcher" + randomfloat(1000);
	level.var_31D method_849C("BUTTON_LTRIG","+speed_throw");
	level.var_31D method_849C("BUTTON_LTRIG","+toggleads_throw");
	level.var_31D method_849C("BUTTON_LTRIG","+ads_akimbo_accessible");
	level.var_31D method_849C("BUTTON_RTRIG","+attack");
	level.var_31D method_849C("BUTTON_RTRIG","+attack_akimbo_accessible");
	if(isdefined(param_00) && param_00 == "BUTTON_LTRIG")
	{
		level.var_31D notifyonplayercommand("BUTTON_LTRIG","+speed_throw");
		level.var_31D notifyonplayercommand("BUTTON_LTRIG","+toggleads_throw");
		level.var_31D notifyonplayercommand("BUTTON_LTRIG","+ads_akimbo_accessible");
	}
	else if(isdefined(param_00) && param_00 == "BUTTON_RTRIG")
	{
		level.var_31D notifyonplayercommand("BUTTON_RTRIG","+attack");
		level.var_31D notifyonplayercommand("BUTTON_RTRIG","+attack_akimbo_accessible");
	}
	else
	{
		level.var_31D notifyonplayercommand("BUTTON_LTRIG","+speed_throw");
		level.var_31D notifyonplayercommand("BUTTON_LTRIG","+toggleads_throw");
		level.var_31D notifyonplayercommand("BUTTON_LTRIG","+ads_akimbo_accessible");
		level.var_31D notifyonplayercommand("BUTTON_RTRIG","+attack");
		level.var_31D notifyonplayercommand("BUTTON_RTRIG","+attack_akimbo_accessible");
	}

	for(;;)
	{
		var_02 = level.var_31D common_scripts\utility::waittill_any_return("BUTTON_RTRIG","BUTTON_LTRIG","death");
		if(isdefined(param_00) && param_00 != var_02)
		{
			continue;
		}

		return var_02;
	}
}

//Function Number: 405
func_5DF7(param_00,param_01)
{
	level endon(param_01);
	for(;;)
	{
		while(!level.var_31D buttonpresseddevonly(param_00) && !level.var_31D attackbuttonpressed())
		{
			wait 0.05;
		}

		level.var_31D notify("triggers_pressed",param_00);
		wait 0.05;
	}
}

//Function Number: 406
func_5DF5(param_00,param_01)
{
	level endon(param_01);
	for(;;)
	{
		while(!level.var_31D buttonpresseddevonly(param_00) && !level.var_31D adsbuttonpressed())
		{
			wait 0.05;
		}

		level.var_31D notify("triggers_pressed",param_00);
		wait 0.05;
	}
}

//Function Number: 407
func_5DF6(param_00,param_01)
{
	if(level.ps3)
	{
		level.var_31D notifyonplayercommand(param_00,"+speed_throw");
		level.var_31D waittill(param_00);
		level.var_31D notify("triggers_pressed",param_00);
	}
}

//Function Number: 408
func_692A(param_00,param_01,param_02)
{
	thread func_0C5C(param_02);
	thread func_6E02();
	var_03 = common_scripts\utility::spawn_tag_origin();
	var_04 = [param_00,param_01];
	var_03 lib_A506::func_BC5(var_04,"pod_wakeup");
	foreach(var_06 in var_04)
	{
		var_06 dontinterpolate();
	}

	level.var_31D setorigin(level.var_31D.var_2E6,1);
	var_03 lib_A506::func_C18(var_04,"pod_wakeup");
	var_03 thread lib_A506::func_BDD(var_04,"pod_wakeup_idle");
	level.var_31D thread func_73FB("lt_rt_harness","ads_pressed","attack_pressed");
	var_08 = level.var_31D func_A0A6();
	level.var_31D.var_470C = 1;
	var_03 lib_A59A::func_C3D();
	if(var_08 == "BUTTON_LTRIG")
	{
		lib_A5DE::snd_message("droppod_harness_left_1");
		level thread lib_A59A::func_61FA("heavy_rumble",2.25);
		var_03 lib_A506::func_C18(var_04,"pod_wakeup_left_1");
		level.var_31D thread func_73FB("rt_right_harness","attack_pressed");
		var_03 thread lib_A506::func_BDD(var_04,"pod_wakeup_left_1_idle");
		thread func_6AB0();
		level.var_31D func_A0A6("BUTTON_RTRIG");
		level.var_31D notify("stop_head_sway");
		level.var_31D.var_470D = 1;
		var_03 lib_A59A::func_C3D();
		lib_A5DE::snd_message("droppod_harness_right_2");
		level thread lib_A59A::func_61FA("heavy_rumble",1.35);
		var_03 lib_A506::func_C18(var_04,"pod_wakeup_right_2");
		level.var_31D notify("walking_towards_hatch");
	}
	else
	{
		lib_A5DE::snd_message("droppod_harness_right_1");
		level thread lib_A59A::func_61FA("heavy_rumble",2.25);
		var_03 lib_A506::func_C18(var_04,"pod_wakeup_right_1");
		level.var_31D thread func_73FB("lt_left_harness","ads_pressed");
		var_03 thread lib_A506::func_BDD(var_04,"pod_wakeup_right_1_idle");
		thread func_6AB0();
		level.var_31D func_A0A6("BUTTON_LTRIG");
		level.var_31D notify("stop_head_sway");
		level.var_31D.var_470B = 1;
		var_03 lib_A59A::func_C3D();
		lib_A5DE::snd_message("droppod_harness_left_2");
		level thread lib_A59A::func_61FA("heavy_rumble",2.15);
		var_03 lib_A506::func_C18(var_04,"pod_wakeup_left_2");
		level.var_31D notify("walking_towards_hatch");
	}

	var_03 thread lib_A506::func_BDD(var_04,"pod_wakeup_kick_idle");
	thread func_6AB0();
	level.var_31D thread func_73FB("a_to_open_hatch","r3_pressed");
	while(!level.var_31D meleebuttonpressed())
	{
		wait 0.05;
	}

	common_scripts\utility::flag_set("kill_credits");
	level.var_31D notify("stop_head_sway");
	level notify("vo_start_spaceman_warn");
	level.var_31D.var_46EF = 1;
	level notify("player_drop_pod_door_kick");
	lib_A59A::func_C3D();
	var_03 lib_A59A::func_C3D();
	var_03 delete();
}

//Function Number: 409
func_6AB0()
{
	level.var_31D endon("stop_head_sway");
	for(;;)
	{
		function_0234(level.var_31D.var_2E6,3,3,2,3,0.2,0.2,0,0.3,0.275,0.125);
		wait(1);
	}
}

//Function Number: 410
func_6E02()
{
	level.var_31D waittill("walking_towards_hatch");
	var_00 = common_scripts\utility::getstruct("struct_pod_exit_door_button","targetname");
	var_01 = lib_A571::func_48BB("rs",var_00.var_2E6,80,120);
	level waittill("player_drop_pod_door_kick");
	var_01 lib_A571::func_48B3();
}

//Function Number: 411
func_650F()
{
	if(!isdefined(level.var_31D.var_46EF))
	{
		return 0;
	}

	if(level.var_31D.var_46EF)
	{
		return 1;
	}
}

//Function Number: 412
func_58B1()
{
	if(!isdefined(level.var_31D.var_470B))
	{
		return 0;
	}

	if(level.var_31D.var_470B)
	{
		return 1;
	}
}

//Function Number: 413
func_766F()
{
	if(!isdefined(level.var_31D.var_470D))
	{
		return 0;
	}

	if(level.var_31D.var_470D)
	{
		return 1;
	}
}

//Function Number: 414
func_58B5()
{
	if(!isdefined(level.var_31D.var_470C))
	{
		return 0;
	}

	if(level.var_31D.var_470C)
	{
		return 1;
	}
}

//Function Number: 415
func_8043()
{
	var_00 = getent("hero_will_irons_spawner","targetname");
	level.var_A31B = var_00 lib_A56F::func_72C();
	level.var_A31B func_4838("will_irons","o");
	var_00 = getent("hero_cormack_spawner","targetname");
	level.var_21DF = var_00 lib_A56F::func_72C();
	level.var_21DF func_4838("cormack","r");
	var_00 = getent("hero_guy_spawner","targetname");
	level.var_520E = var_00 lib_A56F::func_72C();
	level.var_520E func_4838("jackson","y");
	if(common_scripts\utility::flag("spawn_guys_for_intro"))
	{
		var_01 = getent("hero_cormack_spawner_intro","targetname");
		level.var_21F6 = var_01 lib_A56F::func_72C();
		level.var_21F6.animname = "cormack";
		var_01 = getent("hero_will_irons_spawner_intro","targetname");
		level.var_A31C = var_01 lib_A56F::func_72C();
		level.var_A31C.animname = "will_irons";
		var_01 = getent("hero_guy_spawner_intro","targetname");
		if(!isdefined(var_01))
		{
			var_01 = getent("hero_guy_spawner","targetname");
		}

		level.var_5210 = var_01 lib_A56F::func_72C();
		level.var_5210.animname = "jackson";
		common_scripts\utility::flag_wait("spawn_regular_heroes");
	}

	level.var_8AAA = [level.var_A31B,level.var_21DF,level.var_520E];
	thread func_7D86();
}

//Function Number: 416
func_4838(param_00,param_01)
{
	self.var_7.var_2B1F = 1;
	thread lib_A59A::func_27F1();
	self sentient_setthreatbiasgroup("allies");
	self sentient_setthreatbiasgroup("major_allies");
	lib_A59A::func_7E32(param_01);
	self.animname = param_00;
	lib_A59A::func_30AF();
	lib_A59A::func_2AD9();
	self.var_98 = 1;
}

//Function Number: 417
func_7D86()
{
	level.var_31D waittill("end_drone_swarm");
	if(level.nextgen)
	{
		function_00D3("r_mbEnable","0");
	}

	lib_A59A::func_70A("trig_color_ro5");
}

//Function Number: 418
func_80DD()
{
	lib_A56F::func_A0B9("end_army_view_trigger");
	level waittill("never_true");
	lib_A59A::func_60D3();
}

//Function Number: 419
func_4DC3()
{
	thread func_8907();
	thread func_8908();
	lib_A56F::func_A0B9("player_exit_pod_trigger");
	var_00 = lib_A59E::func_8973("tank_group_00");
}

//Function Number: 420
func_8908()
{
	lib_A56F::func_A0B9("start_pod_landings");
	var_00 = getentarray("warbird_ambient_01","targetname");
	wait(1.5);
	foreach(var_02 in var_00)
	{
		var_03 = var_02 lib_A59E::func_8971();
		var_03 lib_A5DE::snd_message("seo_fob_razorback_02");
		var_04 = getent("main_street_reflection","targetname");
		var_03 method_83AB(var_04.var_2E6);
		thread lib_A5F8::func_151E(var_03);
		wait(0.2);
	}
}

//Function Number: 421
func_8907()
{
	var_00 = getentarray("tank_group_01","targetname");
	var_01 = getentarray("tank_group_02","targetname");
	common_scripts\utility::array_thread(var_00,::lib_A59A::func_896F);
	common_scripts\utility::array_thread(var_01,::func_8956);
}

//Function Number: 422
func_8956()
{
	var_00 = lib_A59A::func_896F();
	lib_A56F::func_A0B9("leaving_cpk");
	var_00 lib_A59E::func_4277();
	var_00 waittill("reached_end_node");
	var_00 delete();
}

//Function Number: 423
func_3C03()
{
	common_scripts\utility::flag_wait("begin_looping_fob_functions");
	thread func_394B();
	thread func_4E38();
	thread func_3950();
	thread func_394D();
	thread func_394E();
	if(level.nextgen)
	{
		thread func_70C8();
		thread func_9D88();
	}

	thread func_9D89();
	thread func_2AC8();
	thread func_5B26();
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	common_scripts\utility::flag_init("begin_drag_animation");
	if(level.nextgen)
	{
		thread func_856A();
	}

	if(level.currentgen)
	{
		wait(0.2);
	}

	thread func_8867();
	if(level.currentgen)
	{
		wait(0.05);
	}

	thread func_1D74();
	if(level.currentgen)
	{
		wait(0.05);
	}

	thread func_74CF();
	thread func_3647();
	thread func_5887();
	thread func_5883();
	thread func_394A();
	thread func_1E6F();
	if(level.nextgen)
	{
		thread func_A112();
		thread func_8A1A();
	}

	thread func_6AB2();
}

//Function Number: 424
func_4E38()
{
	var_00 = getent("ally_spawner_fob_injured_by_base_unique","targetname");
	var_01 = getent("cinematic_injured_soldier_spawner","targetname");
	var_02 = var_00 lib_A59A::func_88BD(1);
	if(level.currentgen)
	{
		wait(0.05);
	}

	var_03 = var_01 lib_A59A::func_88BD(1);
	var_02.animname = "generic";
	var_03.animname = "generic";
	level.var_477C = var_02;
	level.var_477C thread func_4E34();
	var_04 = getent("injured_soldier_revive_loop_animorg","targetname");
	var_04 thread lib_A506::func_BE1(var_02,"seo_injured_soldier_idle02_guy01","stop_loop");
	var_04 thread lib_A506::func_BE1(var_03,"seo_injured_soldier_idle02_guy02","stop_loop");
}

//Function Number: 425
func_856A()
{
	var_00 = getent("ally_spawner_fob_turn_signal","targetname");
	var_01 = common_scripts\utility::getstruct("struct_fob_injured_soldier_turn_order","targetname");
	var_02 = getnode("sarge_movehere_after_orders","targetname");
	var_03 = getnode("mech_carry_high_goalnode","targetname");
	var_04 = var_00 lib_A59A::func_88BD(1);
	var_04.animname = "generic";
	var_01 thread lib_A506::func_BC9(var_04,"seo_turn_gesturetomove_guy01");
	var_04 method_81A5(var_02);
	var_04 waittill("goal");
	var_04 method_81A5(var_03);
	var_04 thread func_281B();
	var_04.var_1C7 = 15;
	wait(1.5);
	common_scripts\utility::flag_set("begin_mech_reload");
	wait(3.67);
	common_scripts\utility::flag_set("orders_given_lets_move_out");
}

//Function Number: 426
func_1D74()
{
	var_00 = getent("cinematic_rocket_guys_loop","targetname");
	var_01 = getent("cinematic_rocket_guys_spawner","targetname");
	var_02 = getent("cinematic_rocket_guys_spawner2","targetname");
	var_03 = var_01 lib_A59A::func_88BD(1);
	if(level.currentgen)
	{
		wait(0.05);
	}

	var_04 = var_02 lib_A59A::func_88BD(1);
	var_03.animname = "generic";
	var_04.animname = "generic";
	wait(0.05);
	var_03 lib_A59A::func_445F();
	var_04 lib_A59A::func_445F();
	var_04 thread func_37AF();
	var_03 attach("npc_stingerm7_base_black","tag_weapon_right");
	var_04 attach("weapon_binocular","tag_weapon_left");
	var_00 thread lib_A506::func_BE1(var_03,"seo_cover_launcher_idle_guy01");
	var_00 thread lib_A506::func_BE1(var_04,"seo_cover_launcher_idle_guy02");
}

//Function Number: 427
func_37AF()
{
	self endon("death");
	var_00 = getent("rocket_shoot_here_loop_org","targetname");
	var_01 = getent("rocket_spawn_here_org","targetname");
	for(;;)
	{
		level waittill("fire_fake_rocket_now");
		magicbullet("rpg_straight",var_01.var_2E6,var_00.var_2E6);
	}
}

//Function Number: 428
func_8867()
{
	lib_A59A::func_9806("trigger_fob_scene");
	var_00 = getent("go_through_tunnel_guy1_spawner","targetname");
	var_01 = getnode("go_through_tunnel_guy1_goalnode","targetname");
	var_02 = var_00 lib_A59A::func_88BD(1);
	var_02.animname = "generic";
	var_02 lib_A59A::func_7EA5("seo_run_gununderarm_guy01");
	var_02 method_81A5(var_01);
	wait(5);
	var_02 lib_A59A::func_30AF();
}

//Function Number: 429
func_9533(param_00,param_01,param_02,param_03)
{
	var_04 = getent(param_00,"targetname");
	while(!common_scripts\utility::flag(param_02))
	{
		if(func_0C9A(param_01,var_04))
		{
			lib_A59A::func_7E7B(param_03);
			continue;
		}

		lib_A59A::func_7E7B(1);
		wait 0.05;
	}
}

//Function Number: 430
func_0C9A(param_00,param_01)
{
	foreach(var_03 in param_00)
	{
		if(var_03 istouching(param_01))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 431
func_5B26()
{
	var_00 = getent("mech_taking_orders_spawner","targetname");
	var_01 = getent("mech_taking_orders_spawner2","targetname");
	var_02 = var_00 lib_A59A::func_88BD(1);
	var_03 = [level.var_21DF,level.var_A31B];
	var_02 thread func_9533("vol_mech_slow_vol_01",var_03,"npc_pods_landed",0.5);
	var_02.ignoreall = 1;
	var_02.var_1C7 = 15;
	var_04 = getent("mech_orders1","targetname");
	var_05 = getent("mech_orders_2","targetname");
	var_02.animname = "generic";
	var_02 lib_A59A::func_7EA5("mech_unaware_walk");
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	wait(4);
	var_02 method_81A6(var_04.var_2E6);
	var_02 thread lib_A56F::func_27FB();
}

//Function Number: 432
func_74CF()
{
	common_scripts\utility::flag_wait("start_cinematic_rocket_scene");
	var_00 = getent("return_fire_rocket","targetname");
	var_01 = var_00 lib_A59E::func_8971();
	var_01 thread func_855A();
	common_scripts\utility::flag_set("incoming_rocket_fire");
}

//Function Number: 433
func_9179(param_00)
{
	self endon("death");
	var_01 = getent("rocket_shoot_here_loop_org","targetname");
	wait(param_00 / 2);
	self veh_setturrettargetent(var_01);
	wait(param_00 / 2);
	self veh_fireweapon();
}

//Function Number: 434
func_9178(param_00)
{
	self endon("death");
	var_01 = lib_A56F::func_6379("forward","tag_flash",1000);
	var_02 = var_01 + (randomintrange(-200,200),randomintrange(-200,200),0);
	wait(param_00 / 2);
	self veh_setturrettargetvec(var_02);
	wait(param_00 / 2);
	self veh_fireweapon();
}

//Function Number: 435
func_3647()
{
	var_00 = getnode("after_explode_safenode","targetname");
	var_01 = getent("cinematic_combat_vignette_explosion_animorg","targetname");
	var_02 = getnode("cinematic_combat_vignette_explode_safenode","targetname");
	var_03 = getnode("vig_space2","targetname");
	var_04 = getent("cinematic_combat_vignette_explosion_spawner","targetname");
	var_05 = getent("cinematic_combat_vignette_explosion_spawner2","targetname");
	var_06 = var_04 lib_A59A::func_88BD(1);
	if(level.currentgen)
	{
		wait(0.05);
	}

	var_06.var_1C7 = 15;
	var_07 = var_05 lib_A59A::func_88BD(1);
	var_07.var_1C7 = 15;
	var_07.animname = "generic";
	common_scripts\utility::flag_wait("incoming_rocket_fire");
	var_01 lib_A506::func_BFF(var_07,var_01.animation);
	var_07 method_81A5(var_03);
	var_01 thread lib_A506::func_C24(var_07,var_01.animation);
	wait(1.5);
	var_06 method_81A5(var_00);
	common_scripts\utility::flag_wait("kill_rocket_scene_guy");
	wait(2.3);
	var_06 method_8052();
}

//Function Number: 436
func_3950()
{
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	wait(1);
	level.var_31D.ignoreme = 1;
	level.var_21DF.ignoreme = 1;
	level.var_21DF.ignoreall = 1;
	level.var_A31B.ignoreme = 1;
	level.var_A31B.ignoreall = 1;
	level.var_520E.ignoreme = 1;
	level.var_520E.ignoreall = 1;
	lib_A59A::func_9806("trigger_hill_event_01");
	level.var_31D.ignoreme = 0;
	level.var_21DF.ignoreme = 0;
	level.var_21DF.ignoreall = 0;
	level.var_A31B.ignoreme = 0;
	level.var_A31B.ignoreall = 0;
	level.var_520E.ignoreme = 0;
	level.var_520E.ignoreall = 0;
}

//Function Number: 437
func_5887()
{
	level endon("stop_looping_death_soldiers");
	if(level.currentgen)
	{
		level endon("pre_transients_drone_seq_one_to_trusk_push");
	}

	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	wait(5);
	if(level.currentgen)
	{
		if(!function_021E("seoul_fob_tr"))
		{
			level waittill("transients_intro_to_fob");
		}
	}

	var_00 = getent("looping_tank_spawner","targetname");
	for(;;)
	{
		var_01 = var_00 lib_A59E::func_8971();
		if(level.currentgen)
		{
			thread maps\seoul_transients_cg::func_1C22(var_01,"pre_transients_drone_seq_one_to_trusk_push");
		}

		var_01 lib_A5DE::snd_message("seo_fob_tank_procedural");
		var_01.ignoreme = 1;
		var_01 lib_A59A::func_27F1();
		var_01 thread func_281B();
		thread func_917F(14);
		if(!common_scripts\utility::flag("follow_tank_is_dead"))
		{
			var_02 = getent("run_behind_tank_followorg","targetname");
			var_02 linkto(var_01);
			var_02 thread func_917D();
		}

		var_03 = randomintrange(20,30);
		var_04 = randomint(2);
		if(var_04 == 1)
		{
			var_01 thread func_9179(var_03);
		}

		wait(randomintrange(26,30));
	}
}

//Function Number: 438
func_917D()
{
	level.var_918E = self.var_2E6;
	common_scripts\utility::flag_set("follow_tank_is_dead");
	for(;;)
	{
		if(isdefined(self))
		{
			level.var_918E = self.var_2E6;
		}
		else
		{
			return;
		}

		wait(0.05);
	}
}

//Function Number: 439
func_917F(param_00)
{
	wait(param_00);
	common_scripts\utility::flag_set("tank_is_clear");
}

//Function Number: 440
func_281B(param_00)
{
	self endon("death");
	self waittill("goal");
	self delete();
	foreach(var_02 in param_00)
	{
		if(isdefined(var_02))
		{
			var_02 delete();
		}
	}
}

//Function Number: 441
func_5883()
{
	level endon("stop_looping_death_soldiers");
	common_scripts\utility::flag_wait("spawn_looping_planes");
	var_00 = getent("looping_jetplane_1","targetname");
	var_01 = getent("looping_jetplane_2","targetname");
	var_02 = getent("looping_jetplane_3","targetname");
	var_03 = 0;
	wait(4);
	for(;;)
	{
		var_03 = randomint(4);
		if(var_03 == 0)
		{
			if(isdefined(var_00))
			{
				var_04 = var_00 lib_A59E::func_8971();
				var_04 lib_A5DE::snd_message("aud_handle_gangam_jets");
			}
		}
		else if(var_03 == 1)
		{
			if(isdefined(var_01))
			{
				var_04 = var_01 lib_A59E::func_8971();
				var_04 lib_A5DE::snd_message("aud_handle_gangam_jets");
			}
		}
		else if(var_03 == 2)
		{
			if(isdefined(var_01) && isdefined(var_00))
			{
				var_04 = var_01 lib_A59E::func_8971();
				var_05 = var_00 lib_A59E::func_8971();
				var_04 lib_A5DE::snd_message("aud_handle_gangam_jets");
			}
		}
		else if(var_03 == 3)
		{
			if(isdefined(var_02))
			{
				var_04 = var_02 lib_A59E::func_8971();
				var_04 lib_A5DE::snd_message("aud_handle_gangam_jets");
			}
		}

		wait(randomintrange(18,22));
	}
}

//Function Number: 442
func_394A()
{
	thread func_3955();
}

//Function Number: 443
func_3955()
{
	thread func_8104("struct_fob_blocker_guy_01");
	thread func_8104("struct_fob_blocker_guy_04");
	thread func_8104("struct_fob_blocker_guy_03","patrol_bored_idle","dialogue_start_fob_meetup","crouch_wait2");
	var_00 = getent("fob_player_clipblock","targetname");
	common_scripts\utility::flag_wait("destroy_fob_blocking");
	var_00 delete();
}

//Function Number: 444
func_8104(param_00,param_01,param_02,param_03)
{
	var_04 = 0;
	if(issubstr(param_00,"04"))
	{
		var_04 = 1;
	}

	var_05 = common_scripts\utility::getstruct(param_00,"targetname");
	var_06 = var_05 common_scripts\utility::spawn_tag_origin();
	var_07 = undefined;
	if(isdefined(param_03))
	{
		var_07 = getnode(param_03,"targetname");
	}

	if(!isdefined(param_01))
	{
		param_01 = var_05.animation;
	}

	var_08 = getent("gate_guard_spawner_lowlod","targetname");
	var_09 = var_08 lib_A56F::func_72C(1);
	if(var_04)
	{
		var_09 lib_A59A::func_445F();
	}

	var_06 thread lib_A506::func_BCE(var_09,param_01);
	if(isdefined(param_02))
	{
		common_scripts\utility::flag_wait(param_02);
		wait(16);
		var_09 lib_A56F::func_C3C(var_06);
		var_06 notify("stop_loop");
		var_09 method_81A5(var_07);
	}

	common_scripts\utility::flag_wait("cleanup_injury_team_now");
	var_09 lib_A56F::func_2800();
	var_06 lib_A56F::func_2800();
}

//Function Number: 445
func_1E6F()
{
	common_scripts\utility::flag_wait("cleanup_injury_team_now");
	var_00 = getentarray("cleanup_injury_team","script_noteworthy");
	foreach(var_02 in var_00)
	{
		if(!isspawner(var_02))
		{
			var_02 delete();
		}
	}
}

//Function Number: 446
func_A112()
{
	var_00 = getent("walker_jet_flyby","targetname");
	var_01 = getent("walker_jet_flyby2","targetname");
	var_02 = getent("missle_walker_1","targetname");
	var_03 = getent("missle_walker_2","targetname");
	var_04 = getent("missle_walker_3","targetname");
	lib_A59A::func_9806("trigger_hill_event_00");
	common_scripts\utility::flag_wait("walker_walkby_jets_rockets");
	var_05 = var_00 thread lib_A59E::func_8971();
	wait(2);
	var_06 = var_02 thread lib_A59E::func_8971();
	var_06 thread func_5C8F();
	wait(0.3);
	var_07 = var_03 thread lib_A59E::func_8971();
	var_07 thread func_5C8F();
	wait(0.3);
	var_08 = var_04 thread lib_A59E::func_8971();
	var_08 thread func_5C8F();
}

//Function Number: 447
func_394B()
{
	var_00 = getent("fob_passed_blocking","targetname");
	var_00 connectpaths();
	var_00 notsolid();
	var_01 = getent("fob_passed_blocking_art","targetname");
	var_01 hide();
	common_scripts\utility::flag_wait("player_passed_fob");
	level notify("stop_looping_death_soldiers");
	common_scripts\utility::flag_set("cleanup_injury_team_now");
}

//Function Number: 448
func_394D()
{
	var_00 = getentarray("animorg_pod_falling","targetname");
	var_01 = var_00[0];
	var_02 = getent("drop_pod_1_spawner","targetname");
	var_03 = getent("animorg_pod_falling_guy_exit_org","targetname");
	var_04 = getnode("delete_me_here_right_org","targetname");
	if(level.currentgen)
	{
		if(!function_021E("seoul_fob_tr"))
		{
			level waittill("transients_intro_to_fob");
		}
	}

	thread func_3954(var_01,var_02,var_04);
	thread func_5D91();
}

//Function Number: 449
func_5D91()
{
	thread func_4542("pod_land_debris_01");
	thread func_4542("pod_land_debris_02");
}

//Function Number: 450
func_4542(param_00)
{
	var_01 = getentarray(param_00,"targetname");
	foreach(var_03 in var_01)
	{
		var_03 hide();
	}

	for(;;)
	{
		level waittill("npc_droppod_landed",var_05,var_06);
		if(distance(var_06,var_01[0].var_2E6) < 100)
		{
			break;
		}
	}

	foreach(var_03 in var_01)
	{
		var_03 show();
	}
}

//Function Number: 451
func_6E12(param_00,param_01,param_02)
{
	wait(param_02);
	var_03 = distance(self.var_2E6,level.var_31D.var_2E6);
	if(var_03 < param_00)
	{
		earthquake(0.3,param_01,self.var_2E6,param_00);
		level.var_31D playrumbleonentity("heavy_3s");
		wait(param_01);
	}

	wait 0.05;
}

//Function Number: 452
func_3954(param_00,param_01,param_02)
{
	var_03 = lib_A59A::func_88CB("npc_droppod");
	param_00 lib_A506::func_BC7(var_03,"pod_landing");
	var_04 = getent("player_pod_door_clip","targetname");
	var_05 = getnodearray("delete_me_node_array","targetname");
	var_06 = param_00 func_812E(param_01,"seo_fob_drop_guy_01");
	var_07 = param_00 func_812E(param_01,"seo_fob_drop_guy_02");
	var_08 = param_00 func_812E(param_01,"seo_fob_drop_guy_03");
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	var_06 show();
	var_07 show();
	var_08 show();
	thread func_0C60(var_03,param_00,var_04);
	param_00 thread lib_A506::func_C29(var_06,"seo_fob_drop_guy_01");
	param_00 thread lib_A506::func_C29(var_07,"seo_fob_drop_guy_02");
	param_00 thread lib_A506::func_C29(var_08,"seo_fob_drop_guy_03");
	level notify("spawn_fake_drop_pods");
	var_06 thread func_427C(var_05);
	var_07 thread func_427C(var_05);
	var_08 thread func_427C(var_05);
}

//Function Number: 453
func_812E(param_00,param_01)
{
	var_02 = param_00 lib_A56F::func_72C(1);
	if(!isdefined(var_02))
	{
		return;
	}

	var_02 hide();
	var_02.animname = "generic";
	var_02.ignoreall = 1;
	var_02.var_98 = 1;
	var_02 lib_A59A::func_2AD9();
	thread lib_A506::func_BC7(var_02,param_01);
	var_02 lib_A59A::func_7EA5("run_lowready_f");
	return var_02;
}

//Function Number: 454
func_427C(param_00)
{
	self.var_1C7 = 20;
	var_01 = common_scripts\utility::random(param_00);
	self method_81A6(var_01.var_2E6);
	thread func_281B();
}

//Function Number: 455
func_125D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	var_0A = param_02 lib_A59A::func_88BD(1);
	if(isalive(var_0A))
	{
		var_0A hide();
		var_0A.animname = "generic";
		var_0A.ignoreall = 1;
		var_0A.var_98 = 1;
		param_02.count = 1;
		wait(0.05);
	}

	var_0B = param_02 lib_A59A::func_88BD(1);
	if(isalive(var_0B))
	{
		var_0B hide();
		var_0B.animname = "generic";
		var_0B.ignoreall = 1;
		var_0B.var_98 = 1;
		param_02.count = 1;
		wait(0.05);
	}

	var_0C = param_02 lib_A59A::func_88BD(1);
	if(isalive(var_0C))
	{
		var_0C hide();
		var_0C.animname = "generic";
		var_0C.ignoreall = 1;
		var_0C.var_98 = 1;
	}

	var_0D = "casual_stand_idle";
	var_0E = "patrol_bored_idle";
	var_0F = "casual_stand_idle";
	thread func_0C60(param_00,param_01,param_09);
	if(isalive(var_0A))
	{
		var_0A show();
		param_01 thread lib_A506::func_C29(var_0A,"seo_fob_drop_guy_01");
		var_0A.var_1C7 = 20;
		var_0A method_81A6(param_03.var_2E6);
		var_0A thread func_0C58(var_0D,param_03,param_06);
		var_0A thread func_5EFC(param_03,param_06);
		var_0A thread func_532D("trigger_fob_scene");
	}

	if(isalive(var_0B))
	{
		var_0B show();
		param_01 thread lib_A506::func_C29(var_0B,"seo_fob_drop_guy_02");
		var_0B.var_1C7 = 20;
		var_0B method_81A6(param_04.var_2E6);
		var_0B thread func_0C58(var_0E,param_04,param_07);
		var_0B thread func_5EFC(param_04,param_07);
		var_0B thread func_532D("trigger_fob_scene");
	}

	if(isalive(var_0C))
	{
		var_0C show();
		param_01 thread lib_A506::func_C29(var_0C,"seo_fob_drop_guy_03");
		var_0C.var_1C7 = 20;
		var_0C method_81A6(param_05.var_2E6);
		var_0C thread func_0C58(var_0F,param_05,param_08);
		var_0C thread func_5EFC(param_05,param_08);
		var_0C thread func_532D("trigger_fob_scene");
	}
}

//Function Number: 456
func_5DF2(param_00)
{
	wait(0.25);
	level notify("npc_droppod_landed",param_00,param_00.var_2E6);
}

//Function Number: 457
func_0C60(param_00,param_01,param_02)
{
	param_00 thread func_6E12(1250,3,4.3);
	level notify("aud_npc_droppod_landing",param_00,param_00.var_2E6);
	param_01 lib_A506::func_C24(param_00,"pod_landing");
	thread func_30E8(param_02);
	var_03 = spawn("script_model",param_00.var_2E6);
	var_03.var_41 = param_00.var_41;
	var_03 setmodel("vehicle_mil_drop_pod_static_gsq");
	param_00 delete();
	wait(2);
	common_scripts\utility::flag_set("npc_pods_landed");
}

//Function Number: 458
func_5EFC(param_00,param_01)
{
	self endon("death");
	wait(9);
	if(!common_scripts\utility::flag(param_01))
	{
		self method_81A6(param_00.var_2E6);
	}
}

//Function Number: 459
func_0C58(param_00,param_01,param_02)
{
	self endon("death");
	self waittill("goal");
	common_scripts\utility::flag_set(param_02);
	param_01 lib_A506::func_BE1(self,param_00);
}

//Function Number: 460
func_70C8()
{
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	wait(2);
	var_00 = getent("ally_spawner_fob_injured","targetname");
	level.var_740F = var_00 lib_A59A::func_88BD(1);
	level.var_740F endon("death");
	if(!isdefined(level.var_740F))
	{
		return;
	}

	level.var_740F.ignoreall = 1;
	level.var_740F.var_1C7 = 64;
	level.var_740F.var_98 = 1;
	level.var_740F.animname = "generic";
	var_01 = common_scripts\utility::getstructarray("radio_run_guy_org","targetname");
	var_02 = var_01[0];
	var_02 lib_A506::func_BFF(level.var_740F,"seo_move_stoponradio_loop_guy1");
	var_03 = getnode("delete_me_node_2","targetname");
	common_scripts\utility::flag_set("play_radio_walkby_guy_vo");
	level.var_740F thread func_0A90();
	var_02 lib_A506::func_C29(level.var_740F,"seo_move_stoponradio_loop_guy1");
	var_04 = getent("group3_orders_wait3","targetname");
	level.var_740F method_81A6(var_04.var_2E6);
	level.var_740F thread func_532D("trigger_hill_event_01");
}

//Function Number: 461
func_0A90()
{
	self endon("death");
	wait(0.1);
	self.var_31 = 1;
}

//Function Number: 462
func_9D88()
{
	var_00 = getent("very_first_tank","targetname");
	var_01 = var_00 lib_A59A::func_896F();
	var_01 lib_A5DE::snd_message("seo_fob_tank_01");
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	var_01 lib_A59A::func_27F1();
	var_01 lib_A59E::func_4277();
	wait(1.5);
	var_01 veh_fireweapon();
}

//Function Number: 463
func_9D89()
{
	if(level.currentgen)
	{
		if(!function_021E("seoul_fob_tr"))
		{
			level waittill("transients_intro_to_fob");
		}
	}

	var_00 = getent("very_first_tank_close","targetname");
	var_01 = getent("very_first_tank_close_extra","targetname");
	var_02 = var_00 lib_A59A::func_896F();
	var_02 lib_A5DE::snd_message("seo_fob_tank_02");
	common_scripts\utility::flag_wait("begin_fob_combat_vignette");
	var_02 lib_A59A::func_27F1();
	var_02 lib_A59E::func_4277();
	var_02 thread func_281B();
	var_03 = var_01 lib_A59A::func_896F();
	var_03 lib_A5DE::snd_message("seo_fob_tank_03");
	var_03 lib_A59A::func_27F1();
	var_03 lib_A59E::func_4277();
	var_03 thread func_281B();
	if(level.currentgen)
	{
		thread maps\seoul_transients_cg::func_1C22(var_02,"pre_transients_drone_seq_one_to_trusk_push");
		thread maps\seoul_transients_cg::func_1C22(var_03,"pre_transients_drone_seq_one_to_trusk_push");
	}

	wait(8);
	var_02 veh_fireweapon();
	wait(4);
	var_02 veh_fireweapon();
}

//Function Number: 464
func_A03B()
{
	var_00 = getent("waiting_mech_1","targetname");
	var_01 = getnode("waiting_mech_one_node","targetname");
	var_02 = getent("waiting_mech_one_origin","targetname");
	var_03 = getent("waiting_mech_two_origin","targetname");
	var_04 = "mech_stand_idle_wbtest";
	var_05 = "mech_unaware_idle";
	var_06 = "mech_stand_reload";
	var_07 = var_00 lib_A59A::func_88BD(1);
	var_07.animname = "generic";
	var_03 thread lib_A506::func_BE1(var_07,var_04);
}

//Function Number: 465
func_394E()
{
	var_00 = getent("animorg_pod_falling_fake1","targetname");
	var_01 = getent("animorg_pod_falling_fake2","targetname");
	var_02 = lib_A59A::func_88CB("npc_droppod");
	var_03 = lib_A59A::func_88CB("npc_droppod");
	var_04 = getent("drop_pod_1_spawner2","targetname");
	var_05 = getent("drop_pod_1_spawner3","targetname");
	level waittill("spawn_fake_drop_pods");
	if(level.currentgen)
	{
		if(!function_021E("seoul_fob_tr"))
		{
			level waittill("transients_intro_to_fob");
		}
	}

	var_06 = getent("group2_orders_wait1","targetname");
	var_07 = getent("group2_orders_wait2","targetname");
	var_08 = getent("group2_orders_wait3","targetname");
	var_09 = "guy4_reached_goal";
	var_0A = "guy5_reached_goal";
	var_0B = "guy6_reached_goal";
	var_0C = getent("group3_orders_wait1","targetname");
	var_0D = getent("group3_orders_wait2","targetname");
	var_0E = getent("group3_orders_wait3","targetname");
	var_0F = "guy7_reached_goal";
	var_10 = "guy8_reached_goal";
	var_11 = "guy9_reached_goal";
	var_12 = getent("player_pod_door_clip2","targetname");
	var_13 = getent("player_pod_door_clip3","targetname");
	wait(1.15);
	wait(1.2);
	if(level.nextgen)
	{
		thread func_125D(var_03,var_01,var_05,var_0C,var_0D,var_0E,var_0F,var_10,var_11,var_13);
		return;
	}

	thread func_0C60(var_03,var_01,var_13);
}

//Function Number: 466
func_3953()
{
	level endon("stop_looping_death_soldiers");
	level.var_31D endon("death");
	var_00 = getentarray("player_out_of_bounds","targetname");
	for(;;)
	{
		foreach(var_02 in var_00)
		{
			if(level.var_31D istouching(var_02))
			{
				lib_A560::func_7DFD(&"SEOUL_ON_MISSION");
				level.var_31D freezecontrols(1);
				lib_A59A::func_5CDC();
			}
		}

		wait(0.05);
	}
}

//Function Number: 467
func_6982(param_00)
{
	var_01 = 2;
	if(!isdefined(level.var_5569))
	{
		level.var_5569 = -1;
		level.var_A1A4 = ["seo_crk_overheremitchell","seo_crk_mitchellmoveit"];
	}

	for(var_02 = randomint(var_01);var_02 == level.var_5569;var_02 = randomint(var_01))
	{
	}

	level.var_5569 = var_02;
	var_03 = level.var_A1A4[var_02];
	param_00 lib_A59A::func_2A31(var_03);
}

//Function Number: 468
func_8A1A()
{
	var_00 = getent("special_jet_flyby_spawner1","targetname");
	var_01 = getent("special_jet_flyby_spawner2","targetname");
	var_02 = getent("special_jet_flyby_spawner3","targetname");
	var_03 = [var_00,var_01,var_02];
	common_scripts\utility::flag_wait("special_jets_flyby");
	foreach(var_05 in var_03)
	{
		var_06 = var_05 lib_A59E::func_8971();
		var_06 lib_A5DE::snd_message("aud_handle_gangam_jets");
		wait(randomintrange(1,3));
	}

	wait(6);
	common_scripts\utility::flag_set("spawn_looping_planes");
}

//Function Number: 469
func_2AC8()
{
	var_00 = getent("player_pod_door_clip","targetname");
	var_01 = getent("player_pod_door_clip2","targetname");
	var_02 = getent("player_pod_door_clip3","targetname");
	var_03 = [var_00,var_01,var_02];
	foreach(var_05 in var_03)
	{
		if(isdefined(var_05))
		{
			var_05 notsolid();
		}
	}
}

//Function Number: 470
func_30E8(param_00)
{
	if(isdefined(param_00))
	{
		param_00 solid();
	}
}

//Function Number: 471
func_6AB2(param_00)
{
	common_scripts\utility::flag_wait("enable_door_clip");
	thread func_30E8(param_00);
}