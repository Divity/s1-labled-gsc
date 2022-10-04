/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_transients_cg.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 28
 * Decompile Time: 1033 ms
 * Timestamp: 4/20/2022 8:21:50 PM
*******************************************************************/

//Function Number: 1
func_970A(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_03))
	{
		level notify(param_03);
	}

	if(function_021E(param_00))
	{
		function_0219(param_00);
	}

	for(;;)
	{
		if(!function_021E(param_00))
		{
			break;
		}

		wait(0.1);
	}

	function_0218(param_01);
	for(;;)
	{
		if(function_021E(param_01))
		{
			break;
		}

		wait(0.1);
	}

	level notify(param_02);
}

//Function Number: 2
func_82AD()
{
	var_00 = ["seoul_intro_building_descend_tr","seoul_east_view_tr"];
	lib_A59A::func_7EBE("seoul_intro",var_00);
	lib_A59A::func_7EBE("seoul_first_land_assist",var_00);
	lib_A59A::func_7EBE("seoul_enemy_encounter_01",var_00);
	lib_A59A::func_7EBE("seoul_missile_evade_sequence",var_00);
	var_00 = ["seoul_fob_tr","seoul_intro_building_descend_tr"];
	lib_A59A::func_7EBE("seoul_forward_operating_base",var_00);
	lib_A59A::func_7EBE("seoul_drone_swarm_intro",var_00);
	var_00 = ["seoul_truck_push_trans_tr","seoul_drone_swarm_one_tr"];
	lib_A59A::func_7EBE("seoul_truck_push",var_00);
	lib_A59A::func_7EBE("seoul_hotel_entrance",var_00);
	var_00 = ["seoul_mall_offices_tr","seoul_truck_push_trans_tr"];
	lib_A59A::func_7EBE("seoul_building_jump_sequence",var_00);
	var_00 = ["seoul_sinkhole_subway_tr","seoul_mall_offices_tr"];
	lib_A59A::func_7EBE("seoul_sinkhole_start",var_00);
	var_00 = ["seoul_sinkhole_subway_tr","seoul_subway_trans_tr"];
	lib_A59A::func_7EBE("seoul_subway_start",var_00);
	var_00 = ["seoul_subway_trans_tr","seoul_shopping_dist_tr"];
	lib_A59A::func_7EBE("seoul_shopping_district_start",var_00);
	var_00 = ["seoul_shopping_dist_tr","seoul_canal_overlook_bar_tr"];
	lib_A59A::func_7EBE("seoul_shopping_district_flee_swarm",var_00);
	var_00 = ["seoul_canal_overlook_bar_tr","seoul_riverwalk_tr"];
	lib_A59A::func_7EBE("seoul_canal_intro",var_00);
	lib_A59A::func_7EBE("seoul_canal_combat_start",var_00);
	lib_A59A::func_7EBE("seoul_canal_combat_pt2",var_00);
	lib_A59A::func_7EBE("seoul_finale_scene_start",var_00);
	lib_A59A::func_7EBE("seoul_e3_presentation",var_00);
	lib_A59A::func_7EBE("seoul_cover_art",var_00);
}

//Function Number: 3
func_8167()
{
	level.var_9704 = "";
	if(function_021E("seoul_intro_building_descend_tr"))
	{
		level.var_9704 = "intro";
	}

	if(function_021E("seoul_fob_tr"))
	{
		level.var_9704 = level.var_9704 + "_fob";
	}

	if(function_021E("seoul_drone_swarm_one_tr"))
	{
		level.var_9704 = level.var_9704 + "_droneswarm1";
	}

	if(function_021E("seoul_truck_push_trans_tr"))
	{
		level.var_9704 = level.var_9704 + "_truckpush";
	}

	if(function_021E("seoul_mall_offices_tr"))
	{
		level.var_9704 = level.var_9704 + "_offices";
	}

	if(function_021E("seoul_sinkhole_subway_tr"))
	{
		level.var_9704 = level.var_9704 + "_sinkhole";
	}

	if(function_021E("seoul_subway_trans_tr"))
	{
		level.var_9704 = level.var_9704 + "_subway";
	}

	if(function_021E("seoul_shopping_dist_tr"))
	{
		level.var_9704 = level.var_9704 + "_shopping";
	}

	if(function_021E("seoul_canal_overlook_bar_tr"))
	{
		level.var_9704 = level.var_9704 + "_overlookbar";
	}

	if(function_021E("seoul_riverwalk_tr"))
	{
		level.var_9704 = level.var_9704 + "_riverwalk";
	}

	if(level.var_9704 == "intro")
	{
		level notify("transients_intro");
	}
}

//Function Number: 4
func_1C38()
{
	var_00 = getentarray("trans_barrier_intro_2_drone_swarm","targetname");
	if(issubstr(level.var_9704,"intro") || issubstr(level.var_9704,"_fob"))
	{
		for(var_01 = 0;var_01 < var_00.size;var_01++)
		{
			var_00[var_01] hide();
			var_00[var_01] setcontents(0);
		}
	}

	var_02 = getentarray("transients_rubble_blocker","targetname");
	var_03 = getentarray("transients_rubble_blocker_clip","targetname");
	foreach(var_05 in var_02)
	{
		var_05 hide();
		var_05 setcontents(0);
		if(var_05.classname == "script_brushmodel")
		{
			var_05 notsolid();
			var_05 connectpaths();
		}
	}

	foreach(var_08 in var_03)
	{
		var_08 notsolid();
		var_08 connectpaths();
	}

	var_0A = getentarray("hotel_zipline_panel","targetname");
	for(var_01 = 0;var_01 < var_0A.size;var_01++)
	{
		var_0A[var_01] disconnectpaths();
	}

	common_scripts\utility::flag_init("enable_regression_conference_death");
	var_0B = getent("cg_subway_doors_clip","targetname");
	if(level.var_9704 != "_subway")
	{
		var_0B notsolid();
		var_0B connectpaths();
	}

	var_0C = getent("trans_subway_door_mesh","targetname");
	if(level.var_9704 != "_subway_shopping" && level.var_9704 != "_shopping_overlookbar" && level.var_9704 != "_overlookbar_riverwalk")
	{
		var_0C hide();
	}

	var_0D = getent("cg_turnstyle_clip","targetname");
	var_0E = getent("subway_doors_opaque_shutter","targetname");
	var_0E hide();
	var_0F = getentarray("trans_bar_door_mesh","targetname");
	var_10 = getent("trans_bar_door_clip","targetname");
	if(level.var_9704 != "_overlookbar_riverwalk")
	{
		var_10 moveto(var_10.var_2E6 + (0,0,-340),0.25);
		for(var_01 = 0;var_01 < var_0F.size;var_01++)
		{
			var_0F[var_01] hide();
			var_0F[var_01] moveto(var_0F[var_01].var_2E6 + (0,0,-340),0.25);
		}

		for(var_01 = 0;var_01 < var_0F.size;var_01++)
		{
			if(var_0F[var_01].classname != "script_model")
			{
				var_0F[var_01] connectpaths();
			}
		}

		var_10 connectpaths();
	}
}

//Function Number: 5
func_1C3D()
{
	thread func_1C3C();
	lib_A59A::func_9806("tff_trans_east_view_to_fob");
	func_970A("seoul_east_view_tr","seoul_fob_tr","transients_intro_to_fob","pre_transients_intro_to_fob");
}

//Function Number: 6
func_1C3C()
{
	func_92BC("check_player_near_guys",["jackson","will irons","cormack"]);
	var_00 = getent("cg_trans_hotel_door","targetname");
	var_00.var_41 = (0,0,0);
	var_01 = getent("cg_trans_hotel_door_clip","targetname");
	var_01 moveto(var_01.var_2E6 + (-105,0,0),0.25);
	var_01 disconnectpaths();
}

//Function Number: 7
func_1C3E()
{
	var_00 = getent("Trigger_swap_EastView_to_DroneSwarm1","targetname");
	for(;;)
	{
		if(level.var_31D istouching(var_00))
		{
			break;
		}

		wait 0.05;
	}

	func_970A("seoul_intro_building_descend_tr","seoul_drone_swarm_one_tr","transients_fob_to_drone_seq_one","pre_transients_fob_to_drone_seq_one");
	var_01 = getentarray("trans_barrier_intro_2_drone_swarm","targetname");
	var_02 = getent("trans_barrier_intro_2_drone_swarm_clip","targetname");
	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		var_01[var_03] show();
	}

	var_02 moveto(var_02.var_2E6 + (0,0,340),0.25);
}

//Function Number: 8
func_1C3B()
{
	thread func_1C3A();
	lib_A59A::func_9806("Trigger_swap_DroneSwarmOne_to_Mall");
	func_970A("seoul_drone_swarm_one_tr","seoul_mall_offices_tr","transients_truck_push_to_mall_office","pre_transients_truck_push_to_mall_office");
}

//Function Number: 9
func_1C3A()
{
	func_92BC("Trigger_swap_DroneSwarmOne_to_Mall",["jackson","will irons","cormack"]);
	var_00 = getentarray("conf_door_clip_open","targetname");
	var_01 = getent("conf_door_clip_closed","targetname");
	var_02 = ["conf_door_01","conf_door_02","conf_door_03","conf_door_04"];
	var_03 = [(0,0,0),(0,0,0),(0,0,0),(0,0,0)];
	for(var_04 = 0;var_04 < var_02.size;var_04++)
	{
		var_05 = getent(var_02[var_04],"targetname");
		var_05.var_41 = var_03[var_04];
	}

	var_00[0] moveto(var_00[0].var_2E6 + (0,0,-250),0.25);
	var_00[1] moveto(var_00[1].var_2E6 + (0,0,-250),0.25);
	var_01 moveto(var_01.var_2E6 + (0,0,250),0.25);
}

//Function Number: 10
func_1C3F()
{
	level waittill("end_cherry_picker");
	var_00 = ["marines_body_smg","marines_body_shotgun","vehicle_ft101_tank"];
	var_01 = function_00D6();
	foreach(var_03 in var_01)
	{
		foreach(var_05 in var_00)
		{
			if(var_03.model == var_05)
			{
				var_03 delete();
				continue;
			}
		}
	}

	var_08 = getentarray("transients_rubble_blocker","targetname");
	var_09 = getentarray("transients_rubble_blocker_clip","targetname");
	foreach(var_0B in var_08)
	{
		var_0B show();
		if(var_0B.classname == "script_brushmodel")
		{
			var_0B solid();
			var_0B disconnectpaths();
		}
	}

	foreach(var_0E in var_09)
	{
		var_0E solid();
		var_0E disconnectpaths();
	}

	func_970A("seoul_fob_tr","seoul_truck_push_trans_tr","transients_drone_seq_one_to_truck_push","pre_transients_drone_seq_one_to_trusk_push");
}

//Function Number: 11
func_1C40()
{
	lib_A59A::func_9806("Trigger_swap_TruckPush_to_Sinkhole");
	level notify("cg_transients_cleanup_delete_truck");
	func_970A("seoul_truck_push_trans_tr","seoul_sinkhole_subway_tr","transients_mall_office_to_sinkhole_subway","pre_transients_mall_office_to_sinkhole_subway");
}

//Function Number: 12
func_1C41()
{
	func_92BC("Trigger_swap_Sinkhole_to_Subway",["jackson","will irons","cormack"]);
	var_00 = getentarray("cg_subway_doors_left","targetname");
	var_01 = getentarray("cg_subway_doors_right","targetname");
	var_02 = getent("cg_subway_doors_clip","targetname");
	foreach(var_04 in var_00)
	{
		var_04.var_2E6 = var_04.var_2E6 + (0,-37,0);
	}

	foreach(var_07 in var_01)
	{
		var_07.var_2E6 = var_07.var_2E6 + (0,43,0);
	}

	var_02 solid();
	var_02 disconnectpaths();
	func_970A("seoul_mall_offices_tr","seoul_subway_trans_tr","transients_sinkhole_subway_to_subway","pre_transients_sinkhole_subway_to_subway");
}

//Function Number: 13
func_1C43()
{
	var_00 = getent("trans_subway_door_mesh","targetname");
	func_92BC("Trigger_swap_Subway_to_ShoppingDistrict",["jackson","will irons","cormack"]);
	var_00 show();
	thread func_1C36();
	func_970A("seoul_sinkhole_subway_tr","seoul_shopping_dist_tr","transients_subway_to_shopping_dist","pre_transients_subway_to_shopping_dist");
}

//Function Number: 14
func_1C36()
{
	var_00 = getent("cg_turnstyle_clip","targetname");
	var_01 = getentarray("cg_turnstyle_l","targetname");
	var_02 = getentarray("cg_turnstyle_r","targetname");
	level waittill("transients_subway_to_shopping_dist");
	foreach(var_04 in var_01)
	{
		var_04.var_41 = (0,220,0);
	}

	foreach(var_04 in var_02)
	{
		var_04.var_41 = (0,220,0);
	}

	func_8F9B(var_01);
	func_8F9B(var_02);
	var_00 notsolid();
	var_00 connectpaths();
}

//Function Number: 15
func_8F9B(param_00)
{
	foreach(var_02 in param_00)
	{
		var_02 lib_A5F1::func_872B("seo_sbwy_doors_open",0);
	}
}

//Function Number: 16
func_1C42()
{
	lib_A59A::func_9806("Trigger_swap_SubwayTrans_to_CanalOverlook");
	var_00 = getent("subway_doors_closed_clip","targetname");
	var_01 = ["subway_door_01","subway_door_02","subway_door_03","subway_door_04"];
	var_02 = [(0,90,0),(0,90,0),(0,90,0),(0,90,0)];
	var_00 moveto(var_00.var_2E6 + (0,0,250),0.25);
	var_03 = getent("subway_doors_opaque_shutter","targetname");
	var_03 moveto(var_03.var_2E6 + (0,0,350),0.01);
	var_03 show();
	func_970A("seoul_subway_trans_tr","seoul_canal_overlook_bar_tr","transients_shopping_dist_to_canal_overlook","pre_transients_shopping_dist_to_canal_overlook");
}

//Function Number: 17
func_1C39()
{
	lib_A59A::func_9806("Trigger_swap_Shopping_to_RiverWalk");
	func_970A("seoul_shopping_dist_tr","seoul_riverwalk_tr","transients_canal_overlook_to_riverwalk","pre_transients_canal_overlook_to_riverwalk");
	if(level.var_9704 != "_overlookbar_riverwalk")
	{
		var_00 = getentarray("trans_bar_door_mesh","targetname");
		var_01 = getent("trans_bar_door_clip","targetname");
		var_01 moveto(var_01.var_2E6 + (0,0,340),0.25);
		for(var_02 = 0;var_02 < var_00.size;var_02++)
		{
			var_00[var_02] show();
			var_00[var_02] moveto(var_00[var_02].var_2E6 + (0,0,340),0.25);
		}

		for(var_02 = 0;var_02 < var_00.size;var_02++)
		{
			if(var_00[var_02].classname != "script_model")
			{
				var_00[var_02] disconnectpaths();
			}
		}
	}
}

//Function Number: 18
func_1C22(param_00,param_01)
{
	level waittill(param_01);
	if(isdefined(param_00))
	{
		param_00 delete();
	}
}

//Function Number: 19
func_1C37()
{
	if(issubstr(level.var_9704,"intro"))
	{
		level waittill("transients_intro_to_fob");
	}

	var_00 = getent("tanks_no_tread_roll","targetname");
	var_00 method_846C("mtl_bigtank_tread","mq/mtl_bigtank_tread_static");
}

//Function Number: 20
func_8FA5()
{
	var_00 = common_scripts\utility::getstructarray("struct_subway_civilian","targetname");
	var_01 = ["civ_seoul_male_head_aa","civ_seoul_female_head_a","civ_seoul_female_head_a","civ_seoul_male_head_c","civ_seoul_male_head_c","head_city_civ_female_a","civ_seoul_male_head_d","head_city_civ_female_a","civ_seoul_male_head_d"];
	var_02 = ["civ_seoul_male_body_f","civ_seoul_female_body_a","civ_seoul_female_body_c","civ_seoul_male_body_ff","civ_seoul_male_body_b","body_london_female_ccc","civ_urban_male_body_c","body_london_female_aaa","body_london_male_a"];
	var_03 = 0;
	for(var_04 = 0;var_04 < var_00.size;var_04++)
	{
		if(var_04 >= var_02.size)
		{
			var_03 = 0;
		}

		var_05 = spawn("script_model",var_00[var_03].var_2E6);
		var_05 setmodel(var_02[var_03]);
		var_05 attach(var_01[var_03]);
		var_05 setcontents(0);
		var_05.var_41 = var_00[var_03].var_41;
		var_05 method_8115(#animtree);
		var_05.animname = "generic";
		var_00[var_04] thread lib_A506::func_BE1(var_05,var_00[var_03].animation);
		var_05 method_808F();
		thread func_1C22(var_05,"pre_transients_subway_to_shopping_dist");
		var_03 = var_03 + 1;
	}
}

//Function Number: 21
func_8FA4()
{
	if(!issubstr(level.var_9704,"sinkhole"))
	{
		level waittill("transients_sinkhole_subway_to_subway");
	}

	var_00 = ["civ_seoul_male_body_f","civ_seoul_female_body_a","civ_seoul_female_body_c","civ_seoul_male_body_ff","civ_seoul_male_body_f","civ_seoul_male_body_b","civ_seoul_male_body_f","body_london_female_ccc","civ_urban_male_body_c","civ_seoul_female_body_c","body_london_female_aa","civ_seoul_female_body_c","civ_seoul_female_body_a","civ_seoul_female_body_a","body_london_female_aaa","body_london_male_a","civ_seoul_male_body_f","civ_seoul_female_body_a","civ_seoul_female_body_a","civ_seoul_female_body_a","body_london_female_aaa","body_london_male_a","civ_seoul_male_body_f","civ_seoul_female_body_a"];
	var_01 = ["civ_seoul_male_head_aa","civ_seoul_female_head_a","civ_seoul_female_head_a","civ_seoul_male_head_c","civ_seoul_male_head_c","civ_seoul_male_head_c","civ_seoul_male_head_d","head_city_civ_female_a","civ_seoul_male_head_d","civ_seoul_female_head_a","head_city_civ_female_a","civ_seoul_female_head_a","head_city_civ_female_a","civ_seoul_female_head_a","head_city_civ_female_a","civ_seoul_male_head_d","civ_seoul_male_head_a","civ_seoul_female_head_a","head_city_civ_female_a","civ_seoul_female_head_a","head_city_civ_female_a","civ_seoul_male_head_d","civ_seoul_male_head_a","civ_seoul_female_head_a"];
	var_02 = ["civilian_reader_1","sf_a_civ_injured_seated_mourned","london_civ_idle_scratchnose","civilian_texting_sitting","afgan_caves_sleeping_guard_idle","civilian_sitting_talking_a_1","civilian_sitting_talking_b_2","sf_a_civ_injured_seated_face","sf_a_civ_injured_seated_mourner","ch_pragueb_15_6_wounded_civ_04","london_civ_idle_foldarms2","ch_pragueb_15_6_wounded_civ_02","africa_civ_washingclothes","london_civ_idle_lookbehind","london_civ_idle_scratchnose","parabolic_leaning_guy_smoking_idle","civilian_smoking_b","london_civ_idle_lookbehind","sf_a_civ_injured_seated_helped","civilian_reader_2","civilian_texting_standing","civilian_sitting_business_lunch_A_1"];
	var_03 = [];
	for(var_04 = 1;var_04 < 22;var_04++)
	{
		var_03[var_04 - 1] = common_scripts\utility::getstruct("sub_civ_" + var_04 + "_cg","targetname");
	}

	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_05 = spawn("script_model",var_03[var_04].var_2E6);
		var_05 setmodel(var_00[var_04]);
		var_05 attach(var_01[var_04]);
		if(var_02[var_04] == "civilian_texting_sitting" || var_02[var_04] == "civilian_texting_standing")
		{
			var_06 = spawn("script_model",var_03[var_04].var_2E6);
			var_06 setmodel("cellphone_kit_05");
			if(var_02[var_04] == "civilian_texting_sitting")
			{
				var_06.var_2E6 = var_05 gettagorigin("J_Wrist_RI");
				var_06.var_41 = var_05 gettagangles("J_Wrist_RI");
				var_06 linkto(var_05,"J_Wrist_RI",(-3.9,-1.8,-0.7),(-30,30,-10));
			}

			if(var_02[var_04] == "civilian_texting_standing")
			{
				var_06.var_2E6 = var_05 gettagorigin("J_Wrist_LE");
				var_06.var_41 = var_05 gettagangles("J_Wrist_LE");
				var_06 linkto(var_05,"J_Wrist_LE",(3.5,0.9,0.6),(-180,200,0));
			}
		}

		if(var_02[var_04] == "civilian_reader_1" || var_02[var_04] == "civilian_reader_2")
		{
			var_07 = spawn("script_model",var_03[var_04].var_2E6);
			var_07 setmodel("newspaper_folded");
			if(var_02[var_04] == "civilian_reader_1")
			{
				var_07.var_2E6 = var_05 gettagorigin("J_Wrist_LE");
				var_07.var_41 = var_05 gettagangles("J_Wrist_LE");
				var_07 linkto(var_05,"J_Wrist_LE",(5.5,2.66,-2),(-13.3,59.4,41));
			}

			if(var_02[var_04] == "civilian_reader_2")
			{
				var_07.var_2E6 = var_05 gettagorigin("J_Wrist_RI");
				var_07.var_41 = var_05 gettagangles("J_Wrist_RI");
				var_07 linkto(var_05,"J_Wrist_RI",(-4.75,-3.5,0.6),(0,60,-90));
			}
		}

		if(var_02[var_04] == "parabolic_leaning_guy_smoking_idle")
		{
			var_08 = spawn("script_model",var_03[var_04].var_2E6);
			var_08 setmodel("prop_cigarette");
			var_08.var_2E6 = var_05 gettagorigin("J_Wrist_RI");
			var_08.var_41 = var_05 gettagangles("J_Wrist_RI");
			var_08 linkto(var_05,"J_Wrist_RI",(-5.5,-0.5,1.55),(90,-30,110));
			playfxontag(common_scripts\utility::getfx("cigarette_smk"),var_05,"tag_inhand");
		}

		var_05 setcontents(0);
		var_05.var_41 = var_03[var_04].var_41;
		var_05 method_8115(#animtree);
		var_05.animname = "generic";
		var_03[var_04] thread lib_A506::func_BE1(var_05,var_02[var_04]);
		var_05 method_808F();
		thread func_1C22(var_05,"pre_transients_subway_to_shopping_dist");
	}
}

//Function Number: 22
func_8F87()
{
	if(!issubstr(level.var_9704,"sinkhole"))
	{
		level waittill("transients_sinkhole_subway_to_subway");
	}

	var_00 = ["civ_seoul_female_body_a","civ_seoul_male_body_ff","civ_urban_male_body_e","civ_seoul_male_body_d","civ_seoul_female_body_c","civ_seoul_male_body_b","civ_seoul_male_body_f","body_london_female_ccc"];
	var_01 = ["civ_seoul_female_head_a","civ_seoul_male_head_a","civ_seoul_male_head_b","civ_seoul_male_head_c","civ_seoul_female_head_a","civ_seoul_male_head_ee","civ_seoul_male_head_c","civ_seoul_female_head_a"];
	var_02 = [];
	var_03 = [];
	var_04 = ["spn_sub_civ1_cg","spn_sub_civ2_cg","spn_sub_civ3_cg","spn_sub_civ4_cg","spn_sub_civ5_cg","spn_sub_civ6_cg","spn_sub_civ7_cg","spn_sub_civ8_cg"];
	for(var_05 = 0;var_05 < var_04.size;var_05++)
	{
		var_06 = common_scripts\utility::getstruct(var_04[var_05],"targetname");
		var_02[var_05] = var_06.var_2E6;
		var_03[var_05] = var_06.var_41;
	}

	var_07 = ["sf_a_civ_injured_seated_helper","sf_a_civ_injured_seated_helped","sf_a_civ_injured_seated_face","civilian_sitting_talking_b_2","london_civ_idle_lookbehind","london_civ_idle_scratchnose","ch_pragueb_15_6_wounded_civ_03","civilian_smoking_b"];
	var_08 = [];
	for(var_05 = 0;var_05 < var_00.size;var_05++)
	{
		var_08[var_05] = spawn("script_model",var_02[var_05]);
		var_08[var_05] setmodel(var_00[var_05]);
		var_08[var_05] attach(var_01[var_05]);
		if(var_07[var_05] == "civilian_smoking_b")
		{
			var_09 = spawn("script_model",var_02[var_05]);
			var_09 setmodel("prop_cigarette");
			var_09.var_2E6 = var_08[var_05] gettagorigin("J_Wrist_RI");
			var_09.var_41 = var_08[var_05] gettagangles("J_Wrist_RI");
			var_09 linkto(var_08[var_05],"J_Wrist_RI",(-5.5,-0.5,1),(70,-30,90));
			playfxontag(common_scripts\utility::getfx("cigarette_smk"),var_08[var_05],"tag_inhand");
		}

		var_08[var_05] setcontents(0);
		var_08[var_05].var_41 = var_03[var_05];
		var_08[var_05] method_8115(#animtree);
		var_08[var_05].animname = "generic";
		var_0A = common_scripts\utility::getstruct(var_04[var_05],"targetname");
		var_0A thread lib_A506::func_BE1(var_08[var_05],var_07[var_05]);
		var_08[var_05] method_808F();
		thread func_1C22(var_08[var_05],"pre_transients_subway_to_shopping_dist");
	}

	level.var_1D86 = var_08[0];
	level.var_1D87 = var_08[1];
	level.var_1D88 = var_08[2];
	level.var_1D89 = var_08[3];
	level.var_1D8A = var_08[4];
	level.var_1D8B = var_08[5];
	level.var_1D8C = var_08[6];
	level.var_1D8D = var_08[7];
}

//Function Number: 23
func_8F91()
{
	thread maps\seoul_code_shopping_district::func_4517();
	var_00 = getent("trigger_enter_subway_station_01","targetname");
	var_01 = getent("trigger_enter_subway_station_02","targetname");
	var_00 waittill("trigger");
	var_01 waittill("trigger");
	var_02 = getent("spawner_execution_scene","targetname");
	var_03 = getentarray("spawner_subway_civilian","targetname");
	var_04 = common_scripts\utility::getstructarray("struct_subway_execution_scene_civ1","targetname");
	var_05 = common_scripts\utility::getstructarray("struct_subway_execution_scene_soldier1","targetname");
	var_06 = var_05[0] common_scripts\utility::spawn_tag_origin();
	var_07 = ["civ_urban_female_body_e_asi","civ_seoul_male_body_f","civ_seoul_female_body_a"];
	var_08 = ["head_f_gen_asi_lee_base","civ_seoul_male_head_d","civ_seoul_female_head_a"];
	var_09 = 0;
	var_0A = [];
	foreach(var_0C in var_04)
	{
		var_0D = spawn("script_model",var_0C.var_2E6);
		var_0D setmodel(var_07[var_09]);
		var_0D attach(var_08[var_09]);
		var_0D.animation = var_0C.animation;
		var_0A[var_0A.size] = var_0D;
		var_0D thread maps\seoul_code_shopping_district::func_532B();
		var_09 = var_09 + 1;
	}

	var_0F = [];
	foreach(var_0C in var_05)
	{
		var_0D = var_02 lib_A56F::func_72C(1);
		var_0D.animation = var_0C.animation;
		var_0F[var_0F.size] = var_0D;
	}

	foreach(var_0D in var_0A)
	{
		var_0D thread maps\seoul_code_shopping_district::func_5D97(var_0A);
	}

	var_0A = common_scripts\utility::array_combine(var_0A,var_0F);
	foreach(var_0D in var_0F)
	{
		var_0D thread maps\seoul_code_shopping_district::func_5D98(var_0A);
		if(issubstr(var_0D.animation,"soldier_1"))
		{
			var_0D lib_A59A::func_445F();
			var_0D attach("npc_titan45_nocamo","TAG_WEAPON_RIGHT",0);
			var_0D.var_46E9 = 1;
		}
	}

	foreach(var_0D in var_0A)
	{
		var_06 thread lib_A506::func_BC9(var_0D,var_0D.animation);
		var_0D.var_31 = 1;
	}

	level waittill("execution_scene_halted");
	lib_A59A::func_70A("trig_subway_round_corner");
}

//Function Number: 24
func_7D20()
{
	var_00 = common_scripts\utility::getstruct("civ_vip1_cg","targetname");
	var_01 = spawn("script_model",var_00.var_2E6);
	var_01 setmodel("civ_urban_male_body_e");
	var_01 attach("civ_seoul_male_head_c");
	var_01 setcontents(0);
	var_01.var_41 = var_00.var_41;
	var_01 method_8115(#animtree);
	var_01.animname = "vip";
	var_01 method_808F();
	return var_01;
}

//Function Number: 25
func_7D14(param_00)
{
	level.var_9E4B.var_2E6 = param_00.var_2E6;
	level.var_9E4B.var_41 = param_00.var_41;
	level.var_9E4B method_8115(#animtree);
	level.var_9E4B.animname = "vip";
	param_00 thread lib_A506::func_C24(level.var_9E4B,"seo_post_meet_atlas_walk");
}

//Function Number: 26
func_7D85()
{
	var_00 = ["civ_urban_male_body_e","civ_seoul_male_body_b","civ_urban_male_body_c","civ_seoul_male_body_d","body_london_male_a","civ_seoul_male_body_f","civ_seoul_male_body_ff","civ_seoul_female_head_a","body_london_female_aa","body_london_female_aaa","civ_seoul_female_body_a","civ_seoul_female_body_c","body_london_female_ccc","civ_seoul_male_head_a","civ_seoul_male_head_aa","civ_seoul_male_head_b","civ_seoul_male_head_c","civ_seoul_male_head_d","civ_seoul_male_head_ee","civ_seoul_female_head_a","civ_seoul_female_body_a","cellphone_kit_05","head_city_civ_female_a","prop_cigarette","newspaper_folded","civ_urban_female_body_e_asi","head_f_gen_asi_lee_base"];
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		precachemodel(var_00[var_01]);
	}

	precacheshader("mq/mtl_bigtank_tread_static");
}

//Function Number: 27
func_92BC(param_00,param_01)
{
	var_02 = getent(param_00,"targetname");
	level.var_92D2 = 0;
	for(;;)
	{
		var_02 waittill("trigger",var_03);
		if(isdefined(var_03.var_92D1) && var_03.var_92D1)
		{
			continue;
		}

		if(isdefined(var_03.var_79E9))
		{
			var_04 = tolower(var_03.var_79E9);
		}
		else
		{
			var_04 = "";
		}

		if(var_03 == level.var_31D || common_scripts\utility::array_contains(param_01,var_04))
		{
			level.var_92D2++;
			if(level.var_92D2 >= param_01.size + 1)
			{
				break;
			}

			var_03.var_92D1 = 1;
			var_03 thread func_92D3(var_02);
		}
	}
}

//Function Number: 28
func_92D3(param_00)
{
	while(self istouching(param_00))
	{
		wait(0.05);
	}

	level.var_92D2--;
	self.var_92D1 = 0;
}