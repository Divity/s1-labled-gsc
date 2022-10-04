/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42215.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 34
 * Decompile Time: 38 ms
 * Timestamp: 4/20/2022 8:22:00 PM
*******************************************************************/

//Function Number: 1
lib_A4E7::bcs_location_trigs_init()
{
	if(isdefined(level.dds) && isdefined(level.bcs_locations))
	{
		return;
	}

	level.bcs_location_mappings = [];
	lib_A4E7::bcs_location_trigger_mapping();
	lib_A4E7::bcs_trigs_assign_aliases();
	level.bcs_location_mappings = undefined;
	anim.locationlastcallouttimes = [];
}

//Function Number: 2
lib_A4E7::bcs_trigs_assign_aliases()
{
	anim.bcs_locations = [];
	var_00 = getentarray();
	var_01 = [];
	foreach(var_03 in var_00)
	{
		if(isdefined(var_03.classname) && issubstr(var_03.classname,"trigger_multiple_bcs"))
		{
			var_01[var_01.size] = var_03;
		}
	}

	foreach(var_03 in var_01)
	{
		if(!isdefined(level.bcs_location_mappings[var_03.classname]))
		{
			continue;
		}

		var_06 = lib_A4E7::parselocationaliases(level.bcs_location_mappings[var_03.classname]);
		if(var_06.size > 1)
		{
			var_06 = common_scripts\utility::array_randomize(var_06);
		}

		var_03.locationaliases = var_06;
	}

	anim.bcs_locations = var_01;
}

//Function Number: 3
lib_A4E7::parselocationaliases(param_00)
{
	var_01 = strtok(param_00," ");
	return var_01;
}

//Function Number: 4
lib_A4E7::add_bcs_location_mapping(param_00,param_01)
{
	if(isdefined(level.bcs_location_mappings[param_00]))
	{
		var_02 = level.bcs_location_mappings[param_00];
		var_03 = lib_A4E7::parselocationaliases(var_02);
		var_04 = lib_A4E7::parselocationaliases(param_01);
		foreach(var_06 in var_04)
		{
			foreach(var_08 in var_03)
			{
				if(var_06 == var_08)
				{
					return;
				}
			}
		}

		var_02 = var_02 + " " + param_01;
		level.bcs_location_mappings[param_00] = var_02;
		return;
	}

	level.bcs_location_mappings[var_09] = var_0A;
}

//Function Number: 5
lib_A4E7::bcs_location_trigger_mapping()
{
	if(common_scripts\utility::issp())
	{
		lib_A4E7::generic_locations();
		lib_A4E7::fusion_locations();
		lib_A4E7::sanfran_locations();
		lib_A4E7::sanfran_b_locations();
		lib_A4E7::greece_locations();
		lib_A4E7::seoul_locations();
		lib_A4E7::detroit_locations();
		lib_A4E7::betrayal_locations();
		lib_A4E7::lab_locations();
		lib_A4E7::recovery_locations();
		lib_A4E7::lagos_locations();
		lib_A4E7::merida();
		lib_A4E7::old_locations();
		return;
	}

	lib_A4E7::laser2_mp();
	lib_A4E7::lab2_mp();
	lib_A4E7::mp_refraction();
	lib_A4E7::mp_prison();
	lib_A4E7::mp_dam();
	lib_A4E7::mp_detroit();
	lib_A4E7::mp_greenband();
	lib_A4E7::mp_instinct();
	lib_A4E7::mp_levity();
	lib_A4E7::mp_recovery();
	lib_A4E7::mp_solar();
	lib_A4E7::mp_terrace();
	lib_A4E7::mp_torqued();
	lib_A4E7::mp_venus();
	lib_A4E7::mp_comeback();
	lib_A4E7::old_locations_mp();
}

//Function Number: 6
lib_A4E7::generic_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_generic_doorway_generic","doorway_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_generic_window_generic","window_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_generic_1stfloor_generic","1stfloor_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_generic_1stfloor_doorway","1stfloor_doorway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_generic_1stfloor_window","1stfloor_window");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_generic_2ndfloor_generic","2ndfloor_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_generic_2ndfloor_window","2ndfloor_window");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_generic_rooftop","rooftop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_generic_2ndfloor_balcony","2ndfloor_balcony");
}

//Function Number: 7
lib_A4E7::fusion_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_truck","fus_truck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_tower","fus_tower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_generator","fus_generator");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_mt","fus_mt");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_titan","fus_titan");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_hill","fus_hill");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_garage","fus_garage");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_crane","fus_crane");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_forklift","fus_forklift");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_pillar","fus_pillar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_pipes","fus_pipes");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_balcony","fus_balcony");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_catwalk","fus_catwalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_fueltrucks","fus_fueltrucks");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_walkway","fus_walkway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_fus_stairs","fus_stairs");
}

//Function Number: 8
lib_A4E7::sanfran_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_bus","sfa_bus");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_cardoor","sfa_cardoor");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_cargovan","sfa_cargovan");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_policecar","sfa_policecar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_roadsign","sfa_roadsign");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_sidewalk","sfa_sidewalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_sportscar","sfa_sportscar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_topbus","sfa_topbus");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_tower","sfa_tower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_trailer","sfa_trailer");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfa_truck","sfa_truck");
}

//Function Number: 9
lib_A4E7::sanfran_b_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_above","above");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_containers","sfb_containers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_doors","doors");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_helipad","helipad");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_missileturret","missileturret");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_table","table");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_truck","sfb_truck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_vtol","vtol");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_wreckage","wreckage");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_cargocrane","cargocrane");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_catwalk","sfb_catwalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_console","sfb_console");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_jammer","sfb_jammer");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_launchpad","sfb_launchpad");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_sfb_jet","sfb_jet");
}

//Function Number: 10
lib_A4E7::greece_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_grk_balcony","grk_balcony");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_grk_1stfloor_window","grk_1stfloor_window");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_grk_2ndfloor_window","grk_2ndfloor_window");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_grk_3rdfloor_window","grk_3rdfloor_window");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_grk_cafe","grk_cafe");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_grk_rooftop","grk_rooftop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_grk_doorway","grk_doorway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_gre_vehic","gre_vehic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_gre_statue","gre_statue");
}

//Function Number: 11
lib_A4E7::seoul_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_balcony","seo_balcony");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_bus","seo_bus");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_stairs","seo_stairs");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_2ndwindow","seo_2ndwindow");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_3rdbalcony","seo_3rdbalcony");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_sculpture","seo_sculpture");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_window","seo_window");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_window","seo_window");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_cafe","seo_cafe");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_seo_counter","seo_counter");
}

//Function Number: 12
lib_A4E7::detroit_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_det_bar","det_bar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_det_balcony","det_balcony");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_det_walkway","det_walkway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_det_ambulance","det_ambulance");
}

//Function Number: 13
lib_A4E7::betrayal_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_plaza","bet_plaza");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_way","bet_way");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_1stfloor","bet_1stfloor");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_2ndfloor","bet_2ndfloor");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_3rdfloor","bet_3rdfloor");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_above","bet_above");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_balcony","bet_balcony");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_barge","bet_barge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_checkpt","bet_checkpt");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_doorway","bet_doorway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_open","bet_open");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_patio","bet_patio");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_rooftop","bet_rooftop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_street","bet_street");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_drones","bet_drones");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_fountain","bet_fountain");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_skybridge","bet_skybridge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_below","bet_below");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_bldng","bet_bldng");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_bridge","bet_bridge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_deplycover","bet_deplycover");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_pallets","bet_pallets");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_catwalk","bet_catwalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_table","bet_table");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_crates","bet_crates");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_dock","bet_dock");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_leftshore","bet_leftshore");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_bet_rightshore","bet_rightshore");
}

//Function Number: 14
lib_A4E7::lab_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lab_canisters","lab_canisters");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lab_camera","lab_camera");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lab_van","lab_van");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lab_lwrcatwalk","lab_lwrcatwalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lab_uprcatwalk","lab_uprcatwalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lab_forklift","lab_forklift");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lab_rooftop","lab_rooftop");
}

//Function Number: 15
lib_A4E7::recovery_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_rec_firepit","rec_firepit");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_rec_hill","rec_hill");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_rec_pool","rec_pool");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_rec_road","rec_road");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_rec_patio","rec_patio");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_rec_table","rec_table");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_rec_couch","rec_couch");
}

//Function Number: 16
lib_A4E7::lagos_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lag_street","lag_street");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lag_dogs","lag_dogs");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lag_median","lag_median");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lag_rpgbus","lag_rpgbus");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lag_overpass","lag_overpass");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lag_suv","lag_suv");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lag_suvapproach","lag_suvapproach");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_lag_topvan","lag_topvan");
}

//Function Number: 17
lib_A4E7::merida()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_radiotower","radiotower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_embassy_generic","embassy_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_aaguns","aaguns");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_tunnel","tunnel");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_cannons_generic","cannons_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_pool","pool");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_embassy_north","embassy_north");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_embassy_south","embassy_south");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_embassy_east","embassy_east");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_embassy_west","embassy_west");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_cannons_embassy","cannons_embassy");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_merida_cannons_radiotower","cannons_radiotower");
}

//Function Number: 18
lib_A4E7::laser2_mp()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_radardish","lsr_radardish");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_laserairdefensegun","lsr_laserairdefensegun");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_razorback","lsr_razorback");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_underhelipad","lsr_underhelipad");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_bunkerlookout","lsr_bunkerlookout");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_inradartower","lsr_inradartower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_byradartower","lsr_byradartower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_shippingcontainer","lsr_shippingcontainer");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_onhelipad","lsr_onhelipad");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_onbeach","lsr_onbeach");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_onbeach","lsr_bybridge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_bylasergenerator","lsr_bylasergenerator");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_underlaser","lsr_underlaser");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_byhelipad","lsr_byhelipad");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_electricalroom","lsr_electricalroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_piperoom","lsr_piperoom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_bybuoy","lsr_bybuoy");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_bygenerator","lsr_bygenerator");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_offswitch","lsr_offswitch");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_missilerack","lsr_missilerack");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_underchains","lsr_underchains");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_beachbunkerrooftop","lsr_beachbunkerrooftop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_bunkerrooftop","lsr_bunkerrooftop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_nettedcargo","lsr_nettedcargo");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_cagedcargo","lsr_cagedcargo");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_overturnedcar","lsr_overturnedcar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_bridgebase","lsr_bridgebase");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lsr_cornerbunker","lsr_cornerbunker");
}

//Function Number: 19
lib_A4E7::lab2_mp()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_parkinglot","lab_parkinglot");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_serverroom","lab_serverroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_holoroom","lab_holoroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_dryingroom","lab_dryingroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_chemvats","lab_chemvats");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_generator","lab_generator");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_lobby","lab_lobby");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_behindcrates","lab_behindcrates");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_scienceroom","lab_scienceroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_storageroom","lab_storageroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_trench","lab_trench");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lab_behindvehicle","lab_behindvehicle");
}

//Function Number: 20
lib_A4E7::mp_refraction()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_oncrane","ref_oncrane");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_byloadingdocks","ref_byloadingdocks");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_nearelevatorentrance","ref_nearelevatorentrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_inelevator","ref_inelevator");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_oncatwalks","ref_oncatwalks");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_seccheckpoint","ref_seccheckpoint");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_helopadentrance","ref_helopadentracne");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_checkinstation","ref_checkinstation");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_maintenceentrance","ref_maintenceentrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_insidelounge","ref_insidelounge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_bylockmechanism","ref_bylockmechanism");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_inelevatorshaft","ref_inelevatorshaft");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_underhelipad","ref_underhelipad");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_bylgcontainers","ref_bylgcontainers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_bylockers","ref_bylockers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_abovelockers","ref_abovelockers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ref_byadtowers","ref_byadtowers");
}

//Function Number: 21
lib_A4E7::mp_prison()
{
	lib_A4E7::add_bcs_location_mapping(" trigger_multiple_bcs_mp_psn_insidecellblock","psn_insidecellblock");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_psnfrontentrance","psn_psnfrontentrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_insidemaintenancebldg","psn_insidemaintenancebldg");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_onmaintenancebldgroof","psn_onmaintenancebldgroof");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_prisonyard","psn_prisonyard");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_bballcourt","psn_bballcourt");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_psnbus","psn_psnbus");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_sectower","psn_sectower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_insidegarage","psn_insidegarage");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_topofgarage","psn_topofgarage");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_destroyedwall","psn_destroyedwall");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_cellblockcatwalk","psn_cellblockcatwalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_lobbyentrance","psn_lobbyentrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_electricalbox","psn_electricalbox");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_policecar","psn_policecar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_behinddumpster","psn_behinddumpster");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_catwalk","psn_catwalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_laundrybin","psn_laundrybin");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_psnrooftop","psn_psnrooftop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_behindac","psn_behindac");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_psn_insidelockerbldg","psn_insidelockerbldg");
}

//Function Number: 22
lib_A4E7::mp_dam()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_frontgate","dam_frontgate");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_semitruck","dam_semitruck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_contructionsite","dam_contructionsite");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_insideoffice","dam_insideoffice");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_oncatwalks","dam_oncatwalks");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_centerstreet","dam_centerstreet");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_onminigun","dam_onminigun");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_cranebase","dam_cranebase");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_infactory","dam_infactory");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_inturbinebldg","dam_inturbinebldg");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_movingpipe","dam_movingpipe");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_electricalgrid","dam_electricalgrid");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_dam_insidelounge","dam_insidelounge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_inpipes","dam_inpipes");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_underground","dam_underground");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dam_factoryrooftop","dam_factoryrooftop");
}

//Function Number: 23
lib_A4E7::mp_detroit()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_inschool","det_inschool");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_bylockers","det_bylockers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_hospitalentrance","det_hospitalentrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_hospitallobby","det_hospitallobby");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_inparkinggarage","det_inparkinggarage");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_garageentrance","det_garageentrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_piperoom","det_piperoom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_onramp","det_onramp");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_inalley","det_inalley");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_bytrailers","det_bytrailers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_ontrailers","det_ontrailers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_inthepod","det_inthepod");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_throughpark","det_throughpark");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_byplayground","det_byplayground");
	lib_A4E7::add_bcs_location_mapping("triger_multiple_bcs_mp_det_garageoverlook","det_garageoverlook");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_backalley","det_backalley");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_parkoffice","det_parkoffice");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_hospitaloffice","det_hospitaloffice");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_throughstreet","det_throughstreet");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_upperstreet","det_upperstreet");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_lowerstreet","det_lowerstreet");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_bycontainers","det_bycontainers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_det_bydiner","det_bydiner");
}

//Function Number: 24
lib_A4E7::mp_greenband()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_2ndflooraquarium","grn_2ndflooraquarium");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_hotelbar","grn_hotelbar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_incafe","grn_incafe");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_behindcherrytree","grn_behindcherrytree");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_aquariumhallway","grn_aquariumhallway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_aquariumpatio","grn_aquariumpatio");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_inelevator","grn_inelevator");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_behindaquariumdesk","grn_behindaquariumdesk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_inzengarden","grn_inzengarden");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_topofzengarden","grn_topofzengarden");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_hotelentrance","grn_hotelentrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_hotellobby","grn_hotellobby");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_inaquarium","grn_aquarium");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_inlounge","grn_inlounge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_behindstatue","grn_behindstatue");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_insidewalkway","grn_insidewalkway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_underawning","grn_underawning");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_topofawning","grn_topofawning");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_behindlargerock","grn_behindlargerock");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_nearsculpture","grn_nearsculpture");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_grn_behindsmallplanter","grn_behindsmallplanter");
}

//Function Number: 25
lib_A4E7::mp_instinct()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ins_byriverbed","ins_byriverbed");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ins_underexcavator","ins_underexcavator");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ins_oncliffs","ins_oncliffs");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ins_centertemple","ins_centertemple");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ins_towerofruins","ins_towerofruins");
	lib_A4E7::add_bcs_location_mapping("triger_multiple_bcs_mp_ins_nearpryramidhall","ins_nearpryramidhall");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ins_insidepryramid","ins_insidepryramid");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ins_behindtrailers","ins_behindtrailers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ins_powergenerators","ins_powergenerators");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_ins_onrubble","ins_onrubble");
}

//Function Number: 26
lib_A4E7::mp_levity()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_secgates","lev_secgates");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_controlroom","lev_controlroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_accessroofs","lev_accessroofs");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_mainhangar","lev_mainhangar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_dronestorage","lev_dronestorage");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_inflightcontrol","lev_flightcontrol");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_flightcontrolroof","lev_flightcontrolroof");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_flightcontrolalley","lev_flightcontrolalley");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_observationdeck","lev_observationdeck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_serveraccessroof","lev_serveraccessroof");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_hangarlounge","lev_hangarlounge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_powercontrol","lev_powercontrol");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_readyrooms","lev_readyrooms");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_rearhangar","lev_rearhangar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_serveraccess","lev_serveraccess");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_nearwaterfall","lev_nearwaterfall");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_lev_nearrockslide","lev_nearrockslide");
}

//Function Number: 27
lib_A4E7::mp_recovery()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_inobservatory","rec_inobservatory");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_bytram","rec_bytram");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_byskywalk","rec_byskywalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_inravine","rec_inravine");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_insiderockhall","rec_insiderockhall");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_byhangardoor","rec_byhangardoor");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_inplaza","rec_inplaza");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_bychopper","rec_bychopper");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_onlaunchdeck","rec_onlaunchdeck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_nearridge","rec_nearridge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_undercontroltower","rec_undercontroltower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_gatecontrolroom","rec_gatecontrolroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_underdeck","rec_underdeck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_observationdeck","rec_observationdeck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_rec_byrustedvan","rec_byrustedvan");
}

//Function Number: 28
lib_A4E7::mp_solar()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_inparkinglot","slr_inparkinglot");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_bymainentry","slr_bymainentry");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_atpool","slr_atpool");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_indraintunnel","slr_indraintunnel");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_inoffice","slr_inoffice");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_bysmalltanks","slr_bysmalltanks");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_intowercontrolroom","slr_intowercontrolroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_bytransformers","slr_bytransformers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_condensercontrolroom","slr_condensercontrolroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_inbacklot","slr_inbacklot");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_bycyclonetank","slr_bycyclonetank");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_indrainarea","slr_indrainarea");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_indriveway","slr_indriveway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_visitorcenter","slr_visitorcenter");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_inpumproom","slr_inpumproom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_sciencearea","slr_sciencearea");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_ingarage","slr_ingarage");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_oncatwalks","slr_oncatwalks");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_bycondensers","slr_bycondensers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_inutilityroom","slr_inutilityroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_slr_onutilityroof","slr_onutilityroof");
}

//Function Number: 29
lib_A4E7::mp_terrace()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_hotellobby","trc_hotellobby");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_atgrotto","trc_atgrotto");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_insaunatunnel","trc_insaunatunnel");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_saunaentrance","trc_saunaentrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_inlowerruins","trc_inlowerruins");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_inupperruins","trc_inupperruins");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_onupperterrace","trc_onupperterrace");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_incafe","trc_incafe");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_undertower","trc_undertower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_nightclubentrance","trc_nightclubentrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_yellowroom","trc_yellowroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_redroom","trc_redroom");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_lowerterrace","trc_lowerterrace");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_atbonfire","trc_atbonfire");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_poseidonspool","trc_poseidonspool");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_saunaroof","trc_saunaroof");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_inshowers","trc_inshowers");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_topofminervamall","trc_topofminervamall");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trc_sixbellspatio","trc_sixbellspatio");
}

//Function Number: 30
lib_A4E7::mp_torqued()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_nearbusstop","trq_nearbusstop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_incafe","trq_incafe");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_chocolateshop","trq_chocolateshop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_baseofclocktower","trq_baseofclocktower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_inclocktower","trq_inclocktower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_nearfountain","trq_nearfountain");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_outdoorcafe","trq_outdoorcafe");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_parkinglot","trq_parkinglot");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_gatedpatio","trq_gatedpatio");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_nearrestaurant","trq_nearrestaurant");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_insemi","trq_insemi");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_nearsnackbar","trq_nearsnackbar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_insideticketcounter","trq_insideticketcounter");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_frontoftrain","trq_frontoftrain");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_backoftrain","trq_backoftrain");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_utilitywalkway","trq_utilitywalkway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_onskywalk","trq_onskywalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_topofawning","trq_topofawning");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_behindbearstatue","trq_behindbearstatue");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_behindcar","trq_behindcar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_incoffeeshop","trq_incoffeeshop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_inconstructionblgd","trq_inconstructionblgd");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_inelevator","trq_inelevator");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_onroof","trq_onroof");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_behindsecuritytruck","trq_behindsecuritytruck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_trq_aboveticketcounter","trq_aboveticketcounter");
}

//Function Number: 31
lib_A4E7::mp_venus()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_inpool","vns_inpool");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_bypool","vns_bypool");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_inlounge","vns_inlounge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_inlobby","vns_inlobby");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onbalcony","vns_onbalcony");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_byhelipad","vns_byhelipad");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onfountain","vns_onfountain");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_byfountain","vns_byfountain");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onpoolshade","vns_onpoolshade");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_inzengarden","vns_inzengarden");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_inbar","vns_inbar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_bybar","vns_bybar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onwoodendeck","vns_onwoodendeck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_inobservationlounge","vns_inobservationlounge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_bywaterfall","vns_bywaterfall");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_incentercourtyard","vns_incentercourtyard");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onpatio","vns_onpatio");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_byfallentree","vns_byfallentree");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_inbansaigarden","vns_inbansaigarden");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_bypenthouse","vns_bypenthouse");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_byhorsestatue","vns_byhorsestatue");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_bysoliderstatue","vns_bysoliderstatue");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onhallwayrooftop","vns_onhallwayrooftop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onbalconystaircase","vns_onbalconystaircase");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onoutsidebalconystaircase","vns_onoutsidebalconystaircase");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onobservationdeck","vns_onobservationdeck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onobservationrooftop","vns_onobservationrooftop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_underwaterfall","vns_underwaterfall");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_insaunalobby","vns_insaunalobby");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_underkeyholearchway","vns_underkeyholearchway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onoverhang","vns_onoverhang");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_bylanterns","vns_bylanterns");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_vns_onpenthouseroof","vns_onpenthouseroof");
}

//Function Number: 32
lib_A4E7::mp_comeback()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_rearentrancenetcafe","cbk_rearentrancenetcafe");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_netcafe","cbk_netcafe");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_videostore","cbk_videostore");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_videostoreroof","cbk_videostoreroof");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_byshanty","cbk_byshanty");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_powerstationroof","cbk_powerstationroof");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_centercoil","cbk_centercoil");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_glassoffices","cbk_glassoffices");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_grassybalcony","cbk_grassybalcony");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_fabricsshop","cbk_fabricsshop");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_fabricsshoproof","cbk_fabricsshoproof");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_westcourtyard","cbk_westcourtyard");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_nearskywalk","cbk_nearskywalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_baseofapttower","cbk_baseofapttower");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_northcourtyard","cbk_northcourtyard");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_atopensewer","cbk_atopensewer");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_eastcourtyard","cbk_eastcourtyard");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_nearmarket","cbk_nearmarket");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_oneonezero","cbk_oneonezero");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_southcourtyard","cbk_southcourtyard");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_southerncourtyard","cbk_southerncourtyard");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_cbk_outsideofficebldg","cbk_outsideofficebldg");
}

//Function Number: 33
lib_A4E7::old_locations()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_acrosschasm","acrosschasm");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_amcrt_stck","amcrt_stck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_barr_conc","barr_conc");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_brls","brls");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_catwlk","catwlk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_cell_l","cell_l");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_cell_r","cell_r");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_celldr_endhl","celldr_endhl");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_corrgatedmtl","corrgatedmtl");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_cot","cot");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_crt_stck","crt_stck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_crtstk_nrldge","crtstk_nrldge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_cv_cent","cv_cent");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_cv_cent_concsup","cv_cent_concsup");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_cv_cent_tv","cv_cent_tv");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_cv_small_l","cv_small_l");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_cv_wall_inside","cv_wall_inside");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_cv_wall_outside","cv_wall_outside");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_dpstr","dpstr");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_drvwy","drvwy");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_dsk_lg","dsk_lg");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_dsk_stck","dsk_stck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_fuelcont","fuelcont");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_fuelconts","fuelconts");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_gbgcns","gbgcns");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_hdghog","hdghog");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_hesco_nrledge","hesco_nrledge");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_hescobarr","hescobarr");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_icemach","icemach");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_intsec_3w","intsec_3w");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_lckr_cntr","lckr_cntr");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_lckr_l","lckr_l");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_lckr_ne","lckr_ne");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_lckr_r","lckr_r");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_lckr_sw","lckr_sw");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_lowwall_bwire","lowwall_bwire");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_newsbox","newsbox");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_phnbth","phnbth");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_pipes_behind","pipes_behind");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_pipes_nside","pipes_nside");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_rappel_left","rappel_left");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_samlnchr","samlnchr");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_sentrygun","sentrygun");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_shwr_cntr","shwr_cntr");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_shwr_ne","shwr_ne");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_shwr_sw","shwr_sw");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_sndbgs","sndbgs");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_stairs_down","stairs_down");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_stairs_up","stairs_up");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_stairs_ylw","stairs_ylw");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_tun_leadoutside","tun_leadoutside");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_vendmach","vendmach");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_wirespl_lg","wirespl_lg");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_ns_wlkwy_abv_archs","wlkwy_abv_archs");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_monument_courtyard","monument_courtyard");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_monument_top","monument_top");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_car_parked","car_parked");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_embassy","embassy");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_embassy_1st","embassy_1st");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_embassy_3rd","embassy_3rd");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_vehicle_snowcat","vehicle_snowcat");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_vehicle_dumptruck","vehicle_dumptruck");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_building_red","building_red");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_vehicle_snowmobile","vehicle_snowmobile");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_scaffolding_generic","scaffolding_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_container_red","container_red");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_tires_large","tires_large");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_memorial_building","memorial_building");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_stand_hotdog","stand_hotdog");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_stand_trading","stand_trading");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_subway_entrance","subway_entrance");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_rubble_generic","rubble_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_cases_right","cases_right");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_cases_left","cases_left");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_cases_generic","cases_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_barrier_orange","barrier_orange");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_barrier_hesco","barrier_hesco");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_stryker_destroyed","stryker_destroyed");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_fan_exhaust","fan_exhaust");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_tower_jamming","tower_jamming");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_ac_generic","ac_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_table_computer","table_computer");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_bulkhead_generic","bulkhead_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_bunk_generic","bunk_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_console_generic","console_generic");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_df_deck_generic","deck_generic");
}

//Function Number: 34
lib_A4E7::old_locations_mp()
{
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_bunker","bunker");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_bunker_back","bunker_back");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_office","office");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_dome","dome");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_catwalk","catwalk");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_loadingbay","loadingbay");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_hallway","hallway");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_hallway_loadingbay","hallway_loadingbay");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_hallway_office","hallway_office");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_wall_broken","wall_broken");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_tank","tank");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_radar","radar");
	lib_A4E7::add_bcs_location_mapping("trigger_multiple_bcs_mp_dome_humvee","humvee");
}