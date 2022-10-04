/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42358.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 16 ms
 * Timestamp: 4/20/2022 8:23:22 PM
*******************************************************************/

//Function Number: 1
lib_A576::init()
{
	function_02A7("sp/sp_matchdata.def");
	function_02A3("level_name",level.script);
	function_02A3("timestamp_start",level.var_31D method_8504());
	function_02A3("xuid",level.var_31D getxuid());
	function_02A3("dwid",level.var_31D method_8528());
	level.var_31D method_8529();
	function_02A3("challenges","upgrade_challenge_stage_0",int(level.var_31D getplayerprofiledata("sp_upgradeChallengeStage_0")));
	function_02A3("challenges","upgrade_challenge_progress_0",int(level.var_31D getplayerprofiledata("sp_upgradeChallengeProgress_0")));
	function_02A3("challenges","upgrade_challenge_stage_1",int(level.var_31D getplayerprofiledata("sp_upgradeChallengeStage_1")));
	function_02A3("challenges","upgrade_challenge_progress_1",int(level.var_31D getplayerprofiledata("sp_upgradeChallengeProgress_1")));
	function_02A3("challenges","upgrade_challenge_stage_2",int(level.var_31D getplayerprofiledata("sp_upgradeChallengeStage_2")));
	function_02A3("challenges","upgrade_challenge_progress_2",int(level.var_31D getplayerprofiledata("sp_upgradeChallengeProgress_2")));
	function_02A3("challenges","upgrade_challenge_stage_3",int(level.var_31D getplayerprofiledata("sp_upgradeChallengeStage_3")));
	function_02A3("challenges","upgrade_challenge_progress_3",int(level.var_31D getplayerprofiledata("sp_upgradeChallengeProgress_3")));
	function_02A3("career","intel_collected",level.var_31D getplayerprofiledata("cheatPoints"));
	function_02A3("career","kills_total",level.var_31D getplayerprofiledata("sp_career_kills_total"));
	function_02A3("career","deaths_total",level.var_31D getplayerprofiledata("sp_career_deaths_total"));
	level.var_31D thread lib_A576::func_72E6();
	level.var_31D thread lib_A576::func_72D4();
}

//Function Number: 2
lib_A576::func_4C35(param_00,param_01)
{
	param_00 = getweaponbasename(param_00);
	var_02 = self;
	var_03 = int(function_02A4("career","kills_total")) + 1;
	function_02A3("career","kills_total",var_03);
	lib_A576::func_7F00(param_00,"kills_total");
	level.var_31D setplayerprofiledata("sp_career_deaths_total",var_03);
	var_04 = function_02A4("checkpoints",0,"kills_total") + 1;
	function_02A3("checkpoints",0,"kills_total",var_04);
	if(param_01)
	{
		var_05 = function_02A4("checkpoints",0,"headshots_total") + 1;
		function_02A3("checkpoints",0,"headshots_total",var_05);
		lib_A576::func_7F00(param_00,"headshots_total");
	}
}

//Function Number: 3
lib_A576::func_8440(param_00)
{
	lib_A576::func_7F00(getweaponbasename(param_00),"shots_total");
	var_01 = function_02A4("checkpoints",0,"shots_total") + 1;
	function_02A3("checkpoints",0,"shots_total",var_01);
}

//Function Number: 4
lib_A576::func_4C34(param_00)
{
	lib_A576::func_7F00(getweaponbasename(param_00),"shots_hit");
	var_01 = function_02A4("checkpoints",0,"hits_total") + 1;
	function_02A3("checkpoints",0,"hits_total",var_01);
}

//Function Number: 5
lib_A576::func_72D9(param_00,param_01)
{
	if(isdefined(param_00))
	{
		param_00 = getweaponbasename(param_00);
		if(!lib_A576::func_1BD6(param_01))
		{
			lib_A576::func_7F00(param_00,"deaths_total");
		}
	}

	var_02 = function_02A4("checkpoints",0,"deaths_total") + 1;
	function_02A3("checkpoints",0,"deaths_total",var_02);
	var_03 = level.var_31D getplayerprofiledata("sp_career_deaths_total") + 1;
	level.var_31D setplayerprofiledata("sp_career_deaths_total",var_03);
	function_02A3("career","deaths_total",var_03);
	var_04 = level.var_31D getplayersetting("gameskill");
	var_05 = level.var_2A62[int(var_04)];
	function_02A3("final_difficulty",var_05);
	var_06 = level.var_31D getplayerprofiledata("sp_duration_total_seconds") + int(gettime() / 1000);
	level.var_31D setplayerprofiledata("sp_duration_total_seconds",int(var_06));
}

//Function Number: 6
lib_A576::func_72D5()
{
	var_00 = function_02A4("checkpoints",0,"boosted_total") + 1;
	function_02A3("checkpoints",0,"boosted_total",var_00);
}

//Function Number: 7
lib_A576::func_72D6()
{
	var_00 = function_02A4("checkpoints",0,"boosted_total") + 1;
	function_02A3("checkpoints",0,"boosted_total",var_00);
}

//Function Number: 8
lib_A576::func_72D4()
{
	self endon("death");
	for(;;)
	{
		self waittill("exo_dodge");
		var_00 = function_02A4("checkpoints",0,"dodges_total") + 1;
		function_02A3("checkpoints",0,"boosted_total",var_00);
	}
}

//Function Number: 9
lib_A576::func_72E6()
{
	self endon("death");
	for(;;)
	{
		self waittill("give_perk",var_00);
		function_02A3("perks",var_00,1);
	}
}

//Function Number: 10
lib_A576::func_56BA(param_00)
{
	var_01 = level.var_31D method_8504();
	function_02A3("timestamp_end",var_01);
	function_02A3("career","level_completion_timestamp",param_00,var_01);
	function_02A3("career","levels_completed",param_00,1);
	var_02 = level.var_31D getplayersetting("gameskill");
	var_03 = level.var_2A62[int(var_02)];
	function_02A3("final_difficulty",var_03);
	var_04 = level.var_31D getplayerprofiledata("sp_duration_total_seconds") + int(gettime() / 1000);
	level.var_31D setplayerprofiledata("sp_duration_total_seconds",var_04);
	function_02A3("career","duration_total_seconds",var_04);
	function_02A3("career","intel_collected",level.var_31D getplayerprofiledata("cheatPoints"));
	function_02A5();
}

//Function Number: 11
lib_A576::func_2C39(param_00)
{
	var_01 = ["ammo","iw5_bal27_sp","iw5_ak12_sp","iw5_hbra3_sp","iw5_himar_sp","iw5_arx160_sp","iw5_m182spr_sp","iw5_sn6_sp","iw5_hmr9_sp","iw5_mp11_sp","iw5_sac3_sp","iw5_asm1_sp","iw5_kf5_sp","iw5_mors_sp","iw5_gm6_sp","iw5_thor_sp","iw5_uts19_sp","iw5_maul_sp","iw5_rhino_sp","iw5_lsat_sp","iw5_asaw_sp","iw5_em1_sp","iw5_epm3_sp","iw5_titan45_sp","iw5_pbw_sp","iw5_vbr_sp","iw5_rw1_sp","iw5_microdronelauncher_sp","iw5_stingerm7_sp","iw5_mahem_sp","iw5_maaws_sp","unknown",""];
	return common_scripts\utility::array_contains(var_01,param_00);
}

//Function Number: 12
lib_A576::func_7F00(param_00,param_01)
{
	if(isdefined(param_00) && lib_A576::func_2C39(param_00))
	{
		var_02 = int(function_02A4("weapon_stats",param_00,param_01)) + 1;
		function_02A3("weapon_stats",param_00,param_01,var_02);
		return;
	}

	var_02 = int(function_02A4("weapon_stats","unknown",var_02)) + 1;
	function_02A3("weapon_stats","unknown",param_01,var_02);
}

//Function Number: 13
lib_A576::func_1BD6(param_00)
{
	param_00 = tolower(param_00);
	switch(param_00)
	{
		case "splash":
		case "mod_explosive":
		case "mod_projectile_splash":
		case "mod_projectile":
		case "mod_grenade_splash":
		case "mod_grenade":
			break;

		default:
			break;
	}
}