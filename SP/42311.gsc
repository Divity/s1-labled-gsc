/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42311.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:23:18 PM
*******************************************************************/

//Function Number: 1
lib_A547::func_4D0C()
{
	if(!isdefined(level.var_1A3D))
	{
		level.var_1A3D = "american";
	}

	lib_A547::func_41C7();
	lib_A548::func_57D5();
}

//Function Number: 2
lib_A547::func_41C7()
{
	if(isdefined(level.var_2C2B))
	{
		return;
	}

	var_00 = lib_A548::func_3DCA();
	level.var_31D lib_A548::func_7F40();
	level.var_46F0 = 0;
	lib_A548::func_1A3D("british");
	lib_A548::func_67D6("innocent","london");
	lib_A548::loadout("ship_graveyard","mp5_underwater",undefined,undefined,undefined,"viewhands_udt");
	lib_A548::loadout("jungle_ghosts","iw5_ak47_sp_acog_silencerunderbarrel",undefined,"fraggrenade",undefined,"viewhands_sas_woodland");
	lib_A548::loadout("london","mp5_silencer_eotech",undefined,"fraggrenade","flash_grenade","viewhands_sas");
	lib_A548::loadout("innocent","mp5_silencer_eotech","usp_silencer","fraggrenade","flash_grenade","viewhands_sas");
	lib_A548::func_1A3D("delta");
	lib_A548::loadout("berlin","m14ebr_scope","acr_hybrid_berlin","fraggrenade","ninebang_grenade","viewhands_delta");
	lib_A548::loadout("ny_harbor","mp5_silencer_reflex","usp_no_knife","fraggrenade","ninebang_grenade","viewhands_udt");
	lib_A548::loadout("hamburg","m4m203_acog_payback","smaw_nolock","fraggrenade","flash_grenade","viewhands_delta");
	lib_A548::loadout("prague","rsass_hybrid_silenced","usp_silencer","fraggrenade","flash_grenade","viewhands_yuri_europe");
	lib_A548::loadout("payback","m4m203_acog_payback","deserteagle","fraggrenade","flash_grenade","viewhands_yuri");
	lib_A548::loadout("black_ice","m4_grunt_reflex","ksg_grip","fraggrenade","flash_grenade","viewmodel_base_viewhands");
	lib_A548::func_1A3D("xslice");
	lib_A548::func_67D6("sanfran_b","sanfran");
	lib_A548::loadout("seoul","iw5_himar_sp_himarscope","iw5_titan45_sp","tracking_grenade_var","paint_grenade_var","viewhands_marines_mitchell");
	lib_A548::loadout("recovery","iw5_bal27_sp_silencer01_variablereddot","iw5_titan45_sp_silencerpistol","fraggrenade","flash_grenade","viewhands_atlas_pmc_smp");
	lib_A548::loadout("lagos","iw5_asm1_sp_variablereddot","iw5_uts19_sp","fraggrenade","flash_grenade","viewhands_atlas_pmc_smp");
	lib_A548::loadout("fusion","iw5_bal27_sp_glsp_variablereddot","iw5_em1_sp_opticsreddot","fraggrenade","flash_grenade","viewhands_atlas_pmc_smp");
	lib_A548::loadout("detroit","iw5_bal27_sp_silencer01_variablereddot",undefined,"fraggrenade","flash_grenade","viewhands_atlas_military");
	lib_A548::loadout("greece","iw5_titan45_sp_opticsreddot_silencerpistol",undefined,"fraggrenade","flash_grenade","viewhands_atlas_military");
	lib_A548::loadout("betrayal","iw5_sn6_sp_opticsreddot",undefined,undefined,undefined,"viewhands_atlas_military_smp");
	lib_A548::loadout("irons_estate","iw5_kf5singleshot_sp_opticsreddot_silencer01","iw5_pbwsingleshot_sp_silencerpistol",undefined,undefined,"viewhands_sentinel_udt_mitchell");
	lib_A548::loadout("crash","iw5_hbra3_sp_opticstargetenhancer","iw5_kf5_sp","fraggrenade","flash_grenade","viewhands_sentinel_arctic_mitchell");
	lib_A548::loadout("lab","iw5_unarmed_nullattach",undefined,"fraggrenade","flash_grenade","viewhands_player_sentinel");
	lib_A548::loadout("sanfran","iw5_hbra3_sp_opticsacog2","iw5_microdronelauncher_sp","fraggrenade","flash_grenade","viewhands_player_sentinel");
	lib_A548::loadout("sanfran_b","iw5_hbra3_sp_opticsacog2","iw5_microdronelauncher_sp","fraggrenade","flash_grenade","viewhands_player_sentinel");
	lib_A548::loadout("df_baghdad","iw5_asm1_sp_variablereddot","iw5_em1_sp_opticsreddot","fraggrenade","flash_grenade","viewhands_sentinel_pilot_mitchell");
	lib_A548::loadout("captured","iw5_titan45onearm_sp",undefined,undefined,undefined,"viewhands_atlas_mitchell_prosthetic_smashed");
	lib_A548::loadout("finale","iw5_unarmedfinale_nullattach",undefined,undefined,undefined,"viewhands_sentinel_mitchell_prosthetic_smashed");
	lib_A548::func_2782();
}